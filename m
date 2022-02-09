Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CD7D4AEC88
	for <lists+dri-devel@lfdr.de>; Wed,  9 Feb 2022 09:34:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC92B10E20D;
	Wed,  9 Feb 2022 08:34:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D9D1B10E20D;
 Wed,  9 Feb 2022 08:34:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1644395652; x=1675931652;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=6CsMzdcaL3POPJu/GxnG9ygQljVUAXCfI+6qba3K9F8=;
 b=A3L2piHPNSaBxH9frpY1oMgeYcvFZ7QXNfY09W1WSqHurNsCpIDI3hwX
 fUUEC900+ZUZNpFgFAGtTJpoiTEcNpaNJJzLlaYjbBYauzwKmMtQ6BG9j
 7+Iq0tZNC49DgqXtm1NzGmyTFKs4+eoFYwfi35pF8SEBTikZsA3LW1uXG
 hdJXnvTG/00aFK56xTBiZecuaUXnPh36KPEADq9bk9ejLH8nkRe6H/RUk
 8kHc0PJM2H6fUkm0D9Spx+9S3cUVicUWzYEkj2ribwYHqDyd7ge9D/IaY
 yt0dWIqiOg7PpEwCdLX2y5JKfAg62x+cuI6o8pq6abmplwe/uDOdXPGY4 g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10252"; a="229125846"
X-IronPort-AV: E=Sophos;i="5.88,355,1635231600"; d="scan'208";a="229125846"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Feb 2022 00:34:12 -0800
X-IronPort-AV: E=Sophos;i="5.88,355,1635231600"; d="scan'208";a="525904968"
Received: from dhussain-mobl.ger.corp.intel.com (HELO [10.213.227.135])
 ([10.213.227.135])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Feb 2022 00:34:10 -0800
Message-ID: <7649b0c1-a711-7c61-f6a6-1f2e82e43d73@linux.intel.com>
Date: Wed, 9 Feb 2022 08:34:08 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v7 1/6] drm: Add arch arm64 for drm_clflush_virt_range
Content-Language: en-US
To: Michael Cheng <michael.cheng@intel.com>, intel-gfx@lists.freedesktop.org
References: <20220209063023.914205-1-michael.cheng@intel.com>
 <20220209063023.914205-2-michael.cheng@intel.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
In-Reply-To: <20220209063023.914205-2-michael.cheng@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Cc: balasubramani.vivekanandan@intel.com, wayne.boyer@intel.com,
 casey.g.bowman@intel.com, lucas.demarchi@intel.com,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 09/02/2022 06:30, Michael Cheng wrote:
> Add arm64 support for drm_clflush_virt_range. dcache_clean_inval_poc
> performs a flush by first performing a clean, follow by an invalidation
> operation.
> 
> v2 (Michael Cheng): Use correct macro for cleaning and invalidation the
> 		    dcache.
> 
> Signed-off-by: Michael Cheng <michael.cheng@intel.com>
> ---
>   drivers/gpu/drm/drm_cache.c | 8 ++++++++
>   1 file changed, 8 insertions(+)
> 
> diff --git a/drivers/gpu/drm/drm_cache.c b/drivers/gpu/drm/drm_cache.c
> index f19d9acbe959..94b3cc3fd482 100644
> --- a/drivers/gpu/drm/drm_cache.c
> +++ b/drivers/gpu/drm/drm_cache.c
> @@ -39,6 +39,10 @@
>   /* A small bounce buffer that fits on the stack. */
>   #define MEMCPY_BOUNCE_SIZE 128
>   
> +#if defined(CONFIG_ARM64)
> +#include <asm/cacheflush.h>
> +#endif
> +

I think this likely should be a single, arch unconditional:

#include <linux/cacheflush.h>

Probably it just happens that some other include pulls in clflushopt for 
x86.

Regards,

Tvrtko

>   #if defined(CONFIG_X86)
>   #include <asm/smp.h>
>   
> @@ -176,6 +180,10 @@ drm_clflush_virt_range(void *addr, unsigned long length)
>   
>   	if (wbinvd_on_all_cpus())
>   		pr_err("Timed out waiting for cache flush\n");
> +
> +#elif defined(CONFIG_ARM64)
> +	void *end = addr + length;
> +	dcache_clean_inval_poc((unsigned long)addr, (unsigned long)end);
>   #else
>   	pr_err("Architecture has no drm_cache.c support\n");
>   	WARN_ON_ONCE(1);
