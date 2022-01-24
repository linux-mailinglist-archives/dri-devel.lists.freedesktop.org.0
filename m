Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CA1B497C58
	for <lists+dri-devel@lfdr.de>; Mon, 24 Jan 2022 10:45:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D81FA10E158;
	Mon, 24 Jan 2022 09:45:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 443A710E158;
 Mon, 24 Jan 2022 09:45:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1643017547; x=1674553547;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=KqHNwGmfH9wpaKnx3Osc7x5aWUlkDWew8GVE9dsdn8k=;
 b=b/NYp4ll8dhUjKm1t88K7Vjv7P9lIZLIe9eXhzIiCy6Rf83iG4MRZ7WA
 FjOJQuYMv1sFp3fxX17M54fUIf/pE6UrdCMEOQAckELqggsuqvzu6tNK+
 sl70e2bG3ggasqh7lTPOtdCH75iAcoOpcphpNdF/9m3VC6Wp+zuEm0A+e
 lb87wROHi2A2OkOvDC7TiDjXG6nNB1CXNAr/Dbne8Aummw8oZp8mO8PC8
 r+nfLo5yuuYYSLLw0/Edni9HvkFiw9EU0bqsdX0XHR/dZHTV/KHPz0Do5
 z2pb2LHdUAcC1abbl9bQkzxQ75FYAwXad/voNWf3uF8uA8Z32wFaYU9gF A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10236"; a="309328161"
X-IronPort-AV: E=Sophos;i="5.88,311,1635231600"; d="scan'208";a="309328161"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jan 2022 01:45:33 -0800
X-IronPort-AV: E=Sophos;i="5.88,311,1635231600"; d="scan'208";a="695364311"
Received: from mtarral-mobl.ger.corp.intel.com (HELO intel.com)
 ([10.252.51.157])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jan 2022 01:45:30 -0800
Date: Mon, 24 Jan 2022 11:45:27 +0200
From: Andi Shyti <andi.shyti@linux.intel.com>
To: Andi Shyti <andi.shyti@linux.intel.com>
Subject: Re: [PATCH v2] drm/i915: fix header file inclusion for might_alloc()
Message-ID: <Ye51NwwIFAJPNyI7@intel.intel>
References: <20220124094243.2637-1-andi.shyti@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220124094243.2637-1-andi.shyti@linux.intel.com>
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
Cc: Thomas =?iso-8859-15?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
 Intel GFX <intel-gfx@lists.freedesktop.org>, Andi Shyti <andi@etezian.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 DRI Devel <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Sorry for spamming! Just called the command from the history

On Mon, Jan 24, 2022 at 11:42:43AM +0200, Andi Shyti wrote:
> Replace "linux/slab.h" with "linux/sched/mm.h" header inclusion
> as the first is not required, while the second, if not included,
> prdouces the following error:
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
> in V2 I just added the Fixes tag (I think I got the right commit)
> and added Thomas r-b.
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
> -- 
> 2.34.1
