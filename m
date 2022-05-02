Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F0306516C07
	for <lists+dri-devel@lfdr.de>; Mon,  2 May 2022 10:30:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0047510FCFD;
	Mon,  2 May 2022 08:30:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7CF6610FCF2;
 Mon,  2 May 2022 08:30:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1651480213; x=1683016213;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=/J8JbV8t2FS+lPPIOg2xi6/2iCk4fuaVr9xvS6LzXEo=;
 b=UC+FVwU6XSPw6KrMlorWW0dxA507XA3QKzpJhSjtDAphkOKXa5BFikWj
 78twPGf1zfqsygxK1NvPRasYjSHdRapkTwv9Rk2DlGMuSpoau/s8/+NB7
 iWEvJ++RI2PTyRtAp5cF61AVk0ExxOA1r+S9Uyj/zRTepKOPHBi0PWhWG
 NnILTsbji2mrSa0ruBuyviZgQmszeAKx8EMm+fdSMJwVfkvjwDM/jYfdI
 VCT4NbSYAeI1/NHcXIZShQlt9CAolDai+XyWxr4w4xbrKnh1LbXwNKiJD
 ycJfedPmH42wmu4PT8WppAnnEMq1JRN/EljRxDYpRU+PBMuj8ZMWHfr58 w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10334"; a="247067281"
X-IronPort-AV: E=Sophos;i="5.91,190,1647327600"; d="scan'208";a="247067281"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 May 2022 01:30:12 -0700
X-IronPort-AV: E=Sophos;i="5.91,190,1647327600"; d="scan'208";a="583592217"
Received: from wagoleb-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.249.155.30])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 May 2022 01:30:09 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Kefeng Wang <wangkefeng.wang@huawei.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>, David Airlie
 <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH] drm/i915: use IOMEM_ERR_PTR() directly
In-Reply-To: <20220502034328.78486-1-wangkefeng.wang@huawei.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20220502034328.78486-1-wangkefeng.wang@huawei.com>
Date: Mon, 02 May 2022 11:30:06 +0300
Message-ID: <87h768s5f5.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Kefeng Wang <wangkefeng.wang@huawei.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 02 May 2022, Kefeng Wang <wangkefeng.wang@huawei.com> wrote:
> Use IOMEM_ERR_PTR() instead of self defined IO_ERR_PTR().
>
> Signed-off-by: Kefeng Wang <wangkefeng.wang@huawei.com>

Reviewed-by: Jani Nikula <jani.nikula@intel.com>

> ---
>  drivers/gpu/drm/i915/i915_vma.c | 4 ++--
>  drivers/gpu/drm/i915/i915_vma.h | 1 -
>  2 files changed, 2 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/i915_vma.c b/drivers/gpu/drm/i915/i915_vma.c
> index 94fcdb7bd21d..639605c89b7b 100644
> --- a/drivers/gpu/drm/i915/i915_vma.c
> +++ b/drivers/gpu/drm/i915/i915_vma.c
> @@ -541,7 +541,7 @@ void __iomem *i915_vma_pin_iomap(struct i915_vma *vma)
>  	int err;
>  
>  	if (WARN_ON_ONCE(vma->obj->flags & I915_BO_ALLOC_GPU_ONLY))
> -		return IO_ERR_PTR(-EINVAL);
> +		return IOMEM_ERR_PTR(-EINVAL);
>  
>  	if (!i915_gem_object_is_lmem(vma->obj)) {
>  		if (GEM_WARN_ON(!i915_vma_is_map_and_fenceable(vma))) {
> @@ -594,7 +594,7 @@ void __iomem *i915_vma_pin_iomap(struct i915_vma *vma)
>  err_unpin:
>  	__i915_vma_unpin(vma);
>  err:
> -	return IO_ERR_PTR(err);
> +	return IOMEM_ERR_PTR(err);
>  }
>  
>  void i915_vma_flush_writes(struct i915_vma *vma)
> diff --git a/drivers/gpu/drm/i915/i915_vma.h b/drivers/gpu/drm/i915/i915_vma.h
> index 67ae7341c7e0..8e74972fdca3 100644
> --- a/drivers/gpu/drm/i915/i915_vma.h
> +++ b/drivers/gpu/drm/i915/i915_vma.h
> @@ -331,7 +331,6 @@ static inline bool i915_node_color_differs(const struct drm_mm_node *node,
>   * Returns a valid iomapped pointer or ERR_PTR.
>   */
>  void __iomem *i915_vma_pin_iomap(struct i915_vma *vma);
> -#define IO_ERR_PTR(x) ((void __iomem *)ERR_PTR(x))
>  
>  /**
>   * i915_vma_unpin_iomap - unpins the mapping returned from i915_vma_iomap

-- 
Jani Nikula, Intel Open Source Graphics Center
