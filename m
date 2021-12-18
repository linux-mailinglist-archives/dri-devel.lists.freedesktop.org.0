Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D9C964798A4
	for <lists+dri-devel@lfdr.de>; Sat, 18 Dec 2021 05:45:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D3B110EB72;
	Sat, 18 Dec 2021 04:45:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A3DEB10EB6F;
 Sat, 18 Dec 2021 04:45:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1639802729; x=1671338729;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=v+hiLLWVxIgEIK8X+sC6l2J95c9/lT75m1UuS98quGg=;
 b=nx8zrlnA0bMtTRM47m03U0L4k+AAtnbEoH18wlX2OwJcfUXcah5i/HZI
 jrK8ytCUrBDYuhvdcQGvMsArBZNQWsdWl6rKUjsW0mARlM71b/LZsMoIF
 tBF53eLTWeCAzdErqkBNkPblDswUqHsCbba6mgDXFugITFNDRUavIAyHh
 jXoH49lmcdnP+8oOqxemqNHvbnPQwlCn7hr2bGTvOYGybhkEIZP8A9OKq
 raMkWyIT1C3gQtqrvpowtowVpAC9u8N0wBXZbJEEjmtyWWQ1UYUuS58nw
 IEcVT9PCducil6qEHxWQwNKKULhQq63xJ/pl8e4fKTp9FmC51MNN8h/Un g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10201"; a="300660016"
X-IronPort-AV: E=Sophos;i="5.88,215,1635231600"; d="scan'208";a="300660016"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Dec 2021 20:45:29 -0800
X-IronPort-AV: E=Sophos;i="5.88,215,1635231600"; d="scan'208";a="520043901"
Received: from mdroper-desk1.fm.intel.com (HELO
 mdroper-desk1.amr.corp.intel.com) ([10.1.27.134])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Dec 2021 20:45:28 -0800
Date: Fri, 17 Dec 2021 20:45:27 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: Andi Shyti <andi.shyti@linux.intel.com>
Subject: Re: [PATCH v8 12/16] drm/i915/display: Use to_gt() helper for GGTT
 accesses
Message-ID: <Yb1nZ3xMQFOWZVQc@mdroper-desk1.amr.corp.intel.com>
References: <20211214193346.21231-1-andi.shyti@linux.intel.com>
 <20211214193346.21231-13-andi.shyti@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20211214193346.21231-13-andi.shyti@linux.intel.com>
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
Cc: =?utf-8?Q?Micha=C5=82?= Winiarski <michal.winiarski@intel.com>,
 Intel GFX <intel-gfx@lists.freedesktop.org>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 DRI Devel <dri-devel@lists.freedesktop.org>,
 Chris Wilson <chris@chris-wilson.co.uk>, Andi Shyti <andi@etezian.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Dec 14, 2021 at 09:33:42PM +0200, Andi Shyti wrote:
> From: Michał Winiarski <michal.winiarski@intel.com>
> 
> GGTT is currently available both through i915->ggtt and gt->ggtt, and we
> eventually want to get rid of the i915->ggtt one.
> Use to_gt() for all i915->ggtt accesses to help with the future
> refactoring.
> 
> Signed-off-by: Michał Winiarski <michal.winiarski@intel.com>
> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Signed-off-by: Andi Shyti <andi.shyti@linux.intel.com>

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

> ---
>  drivers/gpu/drm/i915/display/intel_fbc.c           | 2 +-
>  drivers/gpu/drm/i915/display/intel_fbdev.c         | 2 +-
>  drivers/gpu/drm/i915/display/intel_plane_initial.c | 2 +-
>  3 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/display/intel_fbc.c b/drivers/gpu/drm/i915/display/intel_fbc.c
> index 8be01b93015f..98319c0322d7 100644
> --- a/drivers/gpu/drm/i915/display/intel_fbc.c
> +++ b/drivers/gpu/drm/i915/display/intel_fbc.c
> @@ -595,7 +595,7 @@ static void ivb_fbc_activate(struct intel_fbc *fbc)
>  	else if (DISPLAY_VER(i915) == 9)
>  		skl_fbc_program_cfb_stride(fbc);
>  
> -	if (i915->ggtt.num_fences)
> +	if (to_gt(i915)->ggtt->num_fences)
>  		snb_fbc_program_fence(fbc);
>  
>  	intel_de_write(i915, ILK_DPFC_CONTROL,
> diff --git a/drivers/gpu/drm/i915/display/intel_fbdev.c b/drivers/gpu/drm/i915/display/intel_fbdev.c
> index adc3a81be9f7..41d279db2be6 100644
> --- a/drivers/gpu/drm/i915/display/intel_fbdev.c
> +++ b/drivers/gpu/drm/i915/display/intel_fbdev.c
> @@ -180,7 +180,7 @@ static int intelfb_create(struct drm_fb_helper *helper,
>  	struct drm_device *dev = helper->dev;
>  	struct drm_i915_private *dev_priv = to_i915(dev);
>  	struct pci_dev *pdev = to_pci_dev(dev_priv->drm.dev);
> -	struct i915_ggtt *ggtt = &dev_priv->ggtt;
> +	struct i915_ggtt *ggtt = to_gt(dev_priv)->ggtt;
>  	const struct i915_ggtt_view view = {
>  		.type = I915_GGTT_VIEW_NORMAL,
>  	};
> diff --git a/drivers/gpu/drm/i915/display/intel_plane_initial.c b/drivers/gpu/drm/i915/display/intel_plane_initial.c
> index 01ce1d72297f..e4186a0b8edb 100644
> --- a/drivers/gpu/drm/i915/display/intel_plane_initial.c
> +++ b/drivers/gpu/drm/i915/display/intel_plane_initial.c
> @@ -94,7 +94,7 @@ initial_plane_vma(struct drm_i915_private *i915,
>  		goto err_obj;
>  	}
>  
> -	vma = i915_vma_instance(obj, &i915->ggtt.vm, NULL);
> +	vma = i915_vma_instance(obj, &to_gt(i915)->ggtt->vm, NULL);
>  	if (IS_ERR(vma))
>  		goto err_obj;
>  
> -- 
> 2.34.1
> 

-- 
Matt Roper
Graphics Software Engineer
VTT-OSGC Platform Enablement
Intel Corporation
(916) 356-2795
