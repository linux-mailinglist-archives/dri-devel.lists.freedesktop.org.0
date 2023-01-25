Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2737067AB27
	for <lists+dri-devel@lfdr.de>; Wed, 25 Jan 2023 08:47:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C3BA10E735;
	Wed, 25 Jan 2023 07:47:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EFB7210E735;
 Wed, 25 Jan 2023 07:47:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1674632827; x=1706168827;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=Hln/jE2Lkw/EMJSOyHvLBA+rf9nAhGhp6Uxwz9VXiUw=;
 b=nTLdjmt8dGG635yKtCTL+gRdhp0AN6Lr5W/4XXOG//jpvwR9u71bmqcq
 OQ17j+53t7cnkLUICUMW5pAm3frwSjRcXi3e2GZOaOE9ElxXJc8whEsNN
 IaLSIW5c29S4iJ5pbMZpZZjgeInBR5C3t6CY6dgQ9tBxhczdwOogzmEKj
 JcDU/ZD238ZgqDIPn2hb1oaoD9pu8C1ehTIltN/24V+qAxmwaYiq8PzdN
 j3QoXluCMAKBMGsidUHJqZGSu0xisgbFCqOYETxshM2lgfUKXaxl1uDEd
 UPENp6H8w6Vc3bnu+t3aKKzsqReEtj29Danfs1pa9N82SUfHkOSUyOI6s g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10600"; a="353782262"
X-IronPort-AV: E=Sophos;i="5.97,244,1669104000"; d="scan'208";a="353782262"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jan 2023 23:47:07 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10600"; a="612333283"
X-IronPort-AV: E=Sophos;i="5.97,244,1669104000"; d="scan'208";a="612333283"
Received: from ahajda-mobl.ger.corp.intel.com (HELO [10.213.31.78])
 ([10.213.31.78])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jan 2023 23:47:05 -0800
Message-ID: <88213ded-8835-1230-d2de-ecc89247e536@intel.com>
Date: Wed, 25 Jan 2023 08:47:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.6.1
Subject: Re: [Intel-gfx] [PATCH] drm/i915: Make sure dsm_size has correct
 granularity
Content-Language: en-US
To: Nirmoy Das <nirmoy.das@intel.com>, intel-gfx@lists.freedesktop.org
References: <20230124150047.9490-1-nirmoy.das@intel.com>
From: Andrzej Hajda <andrzej.hajda@intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <20230124150047.9490-1-nirmoy.das@intel.com>
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 Matthew Auld <matthew.auld@intel.com>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 24.01.2023 16:00, Nirmoy Das wrote:
> DSM granularity is 1MB so make sure we stick to that.
> 
> Cc: Matthew Auld <matthew.auld@intel.com>
> Suggested-by: Lucas De Marchi <lucas.demarchi@intel.com>
> Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
> ---
>   drivers/gpu/drm/i915/gem/i915_gem_stolen.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_stolen.c b/drivers/gpu/drm/i915/gem/i915_gem_stolen.c
> index 90a967374b1a..0c027263f09e 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_stolen.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_stolen.c
> @@ -909,7 +909,7 @@ i915_gem_stolen_lmem_setup(struct drm_i915_private *i915, u16 type,
>   		dsm_base = intel_uncore_read64(uncore, GEN12_DSMBASE) & GEN12_BDSM_MASK;
>   		if (WARN_ON(lmem_size < dsm_base))
>   			return ERR_PTR(-ENODEV);
> -		dsm_size = lmem_size - dsm_base;
> +		dsm_size = ALIGN_DOWN(lmem_size - dsm_base, 1 * SZ_1M);

1st seen "1 * SZ_1M", usually it is just SZ_1M, up to you.

Reviewed-by: Andrzej Hajda <andrzej.hajda@intel.com>

Regards
Andrzej

>   	}
>   
>   	io_size = dsm_size;

