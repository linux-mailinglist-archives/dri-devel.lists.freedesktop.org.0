Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BE094C4D0F
	for <lists+dri-devel@lfdr.de>; Fri, 25 Feb 2022 18:59:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C993210E5FF;
	Fri, 25 Feb 2022 17:59:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B77110E5FF;
 Fri, 25 Feb 2022 17:59:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1645811941; x=1677347941;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=KmDxNhng/Zf/lj7rmr3h2Wy1QWE7fOTUd3T89prIZzM=;
 b=Sp62y8gT5ao5795jHg0dcKp1yZj2lirs3mdhkkx63IOKK7tbuRXGegYY
 uqHefDsDVeZtrKHQgh/xYB5eDlx0BZ9iFnTtkDEGM9ex/MFW/uw5Ynf7d
 0RcYlAn2cwYBiFC1mvdICGJ+EBRvualhsNlYHpx2iLe6Nboso+H9Lkpdv
 sAgSzaCMzru1nX/JnEUzbsIfIQRT8xmxCrA2b4hHx/6CtXkuVfIJLzn1v
 JVFXsH/TdNEgOS4H+8vLxagcgDTokH3JBBifQh/+MzvGgDbQzeWx9MUBp
 ZBuBPUPzGuaUvTA0l9CfZaXrFpoU7p+O/tdc7UHPAGoa3ahEm5EyScdj2 Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10268"; a="277184416"
X-IronPort-AV: E=Sophos;i="5.90,136,1643702400"; d="scan'208";a="277184416"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Feb 2022 09:58:53 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,136,1643702400"; d="scan'208";a="533656939"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.151])
 by orsmga007.jf.intel.com with SMTP; 25 Feb 2022 09:58:50 -0800
Received: by stinkbox (sSMTP sendmail emulation);
 Fri, 25 Feb 2022 19:58:49 +0200
Date: Fri, 25 Feb 2022 19:58:49 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Subject: Re: [PATCH 1/2] drm/i915: Fix assert in i915_ggtt_pin
Message-ID: <YhkY2dxBDnUG6tQV@intel.com>
References: <20220225174118.1320237-1-tvrtko.ursulin@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220225174118.1320237-1-tvrtko.ursulin@linux.intel.com>
X-Patchwork-Hint: comment
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
Cc: Intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Feb 25, 2022 at 05:41:17PM +0000, Tvrtko Ursulin wrote:
> From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
> 
> Use lockdep_assert_not_held to simplify and correct the code. Otherwise
> false positive are hit if lock state is uknown like after a previous
> taint.
> 
> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
> Reported-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
> ---
>  drivers/gpu/drm/i915/i915_vma.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/i915_vma.c b/drivers/gpu/drm/i915/i915_vma.c
> index 3558b16a929c..4469b7f52853 100644
> --- a/drivers/gpu/drm/i915/i915_vma.c
> +++ b/drivers/gpu/drm/i915/i915_vma.c
> @@ -1552,9 +1552,7 @@ int i915_ggtt_pin(struct i915_vma *vma, struct i915_gem_ww_ctx *ww,
>  	if (ww)
>  		return __i915_ggtt_pin(vma, ww, align, flags);
>  
> -#ifdef CONFIG_LOCKDEP
> -	WARN_ON(dma_resv_held(vma->obj->base.resv));
> -#endif
> +	lockdep_assert_not_held(&vma->obj->base.resv->lock.base);

Should there be a dma_resv wrapper for that? Shrug.

Makes sense to me:
Reviewed-by: Ville Syrjälä <ville.syrjala@linux.intel.com>

I'll leave the other one to someone how knows how it's actually used.

>  
>  	for_i915_gem_ww(&_ww, err, true) {
>  		err = i915_gem_object_lock(vma->obj, &_ww);
> -- 
> 2.32.0

-- 
Ville Syrjälä
Intel
