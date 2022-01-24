Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AE40497DDB
	for <lists+dri-devel@lfdr.de>; Mon, 24 Jan 2022 12:23:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F3C4710ED4D;
	Mon, 24 Jan 2022 11:23:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E11F10ED4D;
 Mon, 24 Jan 2022 11:23:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1643023406; x=1674559406;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=DmO5o1tSKywvbvIj51hbxGoHlz0HD9Cx4vDMYfINVaI=;
 b=bhq5tctPP6VUBklCFrEky387WLfWP/+YbPgE/wJuPpjit/KAin/d3pG3
 gtxBRR6J8Gu2iBJlosfPtuwIggQlI2vc9OeJoaoDvwnAlHs/FVMprg8o2
 O4RdopbUzNS5Ge6zBjMxM6EIsNMLOKm4WFKDIpbovxNie3sigHvrhTuiV
 Z4eerHyKfrT5xlhFko90IGgERsgBcVQfZXfM8OTq/MEsmGjXNA1z6USK6
 6vpNstD49RzVZoG2KGtt8XbILqw/AE7jYr7rTNN47LeKlNnd4YL93eiN6
 9EyBEKVmlrb8sckTNLlGRIS/t7zBsLMZdov1HjZHdWyx6F142OnebIU97 A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10236"; a="306739111"
X-IronPort-AV: E=Sophos;i="5.88,311,1635231600"; d="scan'208";a="306739111"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jan 2022 03:23:26 -0800
X-IronPort-AV: E=Sophos;i="5.88,311,1635231600"; d="scan'208";a="695389755"
Received: from rvanakke-mobl.ger.corp.intel.com (HELO [10.252.53.157])
 ([10.252.53.157])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jan 2022 03:23:24 -0800
Message-ID: <75c84bd3-8060-aed6-dafc-7bd50591ebb1@linux.intel.com>
Date: Mon, 24 Jan 2022 12:23:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.5.0
Subject: Re: [Intel-gfx] [PATCH v3] drm/i915: fix header file inclusion for
 might_alloc()
Content-Language: en-US
To: Andi Shyti <andi.shyti@linux.intel.com>,
 Intel GFX <intel-gfx@lists.freedesktop.org>,
 DRI Devel <dri-devel@lists.freedesktop.org>
References: <20220124094418.2661-1-andi.shyti@linux.intel.com>
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
In-Reply-To: <20220124094418.2661-1-andi.shyti@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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
Cc: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Op 24-01-2022 om 10:44 schreef Andi Shyti:
> Replace "linux/slab.h" with "linux/sched/mm.h" header inclusion
> as the first is not required, while the second, if not included,
> prodouces the following error:
>
> drivers/gpu/drm/i915/i915_vma_resource.c: In function ‘i915_vma_resource_bind_dep_await’:
> drivers/gpu/drm/i915/i915_vma_resource.c:381:9: error: implicit declaration of function ‘might_alloc’; did you mean ‘might_lock’? [-Werror=implicit-function-declaration]
>   381 |         might_alloc(gfp);
>       |         ^~~~~~~~~~~
>       |         might_lock
>
> Fixes: 2f6b90da9192 ("drm/i915: Use vma resources for async unbinding")
> Signed-off-by: Andi Shyti <andi.shyti@linux.intel.com>
> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> Reviewed-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> ---
> Hi,
>
> v3: fixed a typo in the commit log (prduces/produces). (Thanks
>     Thomas Zimmermann)
>
> v2: added the 'Fixes' tag (I think I got the right commit) and
>     Thomas Hellström r-b.
>
> Andi
>
>  drivers/gpu/drm/i915/i915_vma_resource.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/i915/i915_vma_resource.c b/drivers/gpu/drm/i915/i915_vma_resource.c
> index 1f41c0c699eb..bbb0ff14272f 100644
> --- a/drivers/gpu/drm/i915/i915_vma_resource.c
> +++ b/drivers/gpu/drm/i915/i915_vma_resource.c
> @@ -4,7 +4,7 @@
>   */
>  
>  #include <linux/interval_tree_generic.h>
> -#include <linux/slab.h>
> +#include <linux/sched/mm.h>
>  
>  #include "i915_sw_fence.h"
>  #include "i915_vma_resource.h"

Pushed to drm-intel-gt-next. Should fix drm-tip building, probably needs to be pulled into drm-fixes asap. :)

