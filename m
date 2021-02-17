Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B480231E123
	for <lists+dri-devel@lfdr.de>; Wed, 17 Feb 2021 22:18:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 08D486E7E6;
	Wed, 17 Feb 2021 21:18:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D8D8B6E20E;
 Wed, 17 Feb 2021 21:18:08 +0000 (UTC)
IronPort-SDR: AbCAuua5yRcMTDIsNz2IuckeGElj4gJo2qJgKdqEWHuQgYb/1duc+dzrzuVp/0fbVYx+2YewaU
 d5q1yORjieKQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9898"; a="163103096"
X-IronPort-AV: E=Sophos;i="5.81,185,1610438400"; d="scan'208";a="163103096"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Feb 2021 13:18:08 -0800
IronPort-SDR: 6Ub+DP3lNmpif5ozsQYhhvDtBAGT0G3RCtKhn99MYdT2niEzd4eqFF11dIwVg8x7Omzw09npj/
 iv9QKiUDnaNQ==
X-IronPort-AV: E=Sophos;i="5.81,185,1610438400"; d="scan'208";a="494426430"
Received: from ideak-desk.fi.intel.com ([10.237.68.141])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Feb 2021 13:18:05 -0800
Date: Wed, 17 Feb 2021 23:18:02 +0200
From: Imre Deak <imre.deak@intel.com>
To: Lyude Paul <lyude@redhat.com>
Subject: Re: [PATCH v4] drm/i915/gen9bc: Handle TGP PCH during suspend/resume
Message-ID: <20210217211802.GC558393@ideak-desk.fi.intel.com>
References: <20210217025337.1929015-1-lyude@redhat.com>
 <20210217180016.1937401-1-lyude@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210217180016.1937401-1-lyude@redhat.com>
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
Reply-To: imre.deak@intel.com
Cc: David Airlie <airlied@linux.ie>, intel-gfx@lists.freedesktop.org,
 open list <linux-kernel@vger.kernel.org>,
 "open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tejas Upadhyay <tejaskumarx.surendrakumar.upadhyay@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Feb 17, 2021 at 01:00:16PM -0500, Lyude Paul wrote:
> From: Tejas Upadhyay <tejaskumarx.surendrakumar.upadhyay@intel.com>
> 
> For Legacy S3 suspend/resume GEN9 BC needs to enable and
> setup TGP PCH.
> 
> v2:
> * Move Wa_14010685332 into it's own function - vsyrjala
> * Add TODO comment about figuring out if we can move this workaround - imre
> v3:
> * Rename cnp_irq_post_reset() to cnp_display_clock_wa()
> * Add TODO item mentioning we need to clarify which platforms this
>   workaround applies to
> * Just use ibx_irq_reset() in gen8_irq_reset(). This code should be
>   functionally equivalent on gen9 bc to the code v2 added
> * Drop icp_hpd_irq_setup() call in spt_hpd_irq_setup(), this looks to be
>   more or less identical to spt_hpd_irq_setup() minus additionally enabling
>   one port. Will update i915 to use icp_hpd_irq_setup() for ICP in a
>   separate patch.
> v4:
> * Revert Wa_14010685332 system list in comments to how it was before
> * Add back HAS_PCH_SPLIT() check before calling ibx_irq_reset()
> 
> Cc: Matt Roper <matthew.d.roper@intel.com>
> Signed-off-by: Tejas Upadhyay <tejaskumarx.surendrakumar.upadhyay@intel.com>
> Signed-off-by: Lyude Paul <lyude@redhat.com>

Thanks, looks ok to me:
Reviewed-by: Imre Deak <imre.deak@intel.com>

nit: cnp_display_clock_gating_wa() would be an even better name, could
be renamed while applying.

> ---
>  drivers/gpu/drm/i915/i915_irq.c | 49 +++++++++++++++++++++------------
>  1 file changed, 32 insertions(+), 17 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/i915_irq.c b/drivers/gpu/drm/i915/i915_irq.c
> index 98145a7f28a4..9b56a8f81e1a 100644
> --- a/drivers/gpu/drm/i915/i915_irq.c
> +++ b/drivers/gpu/drm/i915/i915_irq.c
> @@ -3040,6 +3040,24 @@ static void valleyview_irq_reset(struct drm_i915_private *dev_priv)
>  	spin_unlock_irq(&dev_priv->irq_lock);
>  }
>  
> +static void cnp_display_clock_wa(struct drm_i915_private *dev_priv)
> +{
> +	struct intel_uncore *uncore = &dev_priv->uncore;
> +
> +	/*
> +	 * Wa_14010685332:cnp/cmp,tgp,adp
> +	 * TODO: Clarify which platforms this applies to
> +	 * TODO: Figure out if this workaround can be applied in the s0ix suspend/resume handlers as
> +	 * on earlier platforms and whether the workaround is also needed for runtime suspend/resume
> +	 */
> +	if (INTEL_PCH_TYPE(dev_priv) == PCH_CNP ||
> +	    (INTEL_PCH_TYPE(dev_priv) >= PCH_TGP && INTEL_PCH_TYPE(dev_priv) < PCH_DG1)) {
> +		intel_uncore_rmw(uncore, SOUTH_CHICKEN1, SBCLK_RUN_REFCLK_DIS,
> +				 SBCLK_RUN_REFCLK_DIS);
> +		intel_uncore_rmw(uncore, SOUTH_CHICKEN1, SBCLK_RUN_REFCLK_DIS, 0);
> +	}
> +}
> +
>  static void gen8_irq_reset(struct drm_i915_private *dev_priv)
>  {
>  	struct intel_uncore *uncore = &dev_priv->uncore;
> @@ -3063,6 +3081,8 @@ static void gen8_irq_reset(struct drm_i915_private *dev_priv)
>  
>  	if (HAS_PCH_SPLIT(dev_priv))
>  		ibx_irq_reset(dev_priv);
> +
> +	cnp_display_clock_wa(dev_priv);
>  }
>  
>  static void gen11_display_irq_reset(struct drm_i915_private *dev_priv)
> @@ -3104,15 +3124,7 @@ static void gen11_display_irq_reset(struct drm_i915_private *dev_priv)
>  	if (INTEL_PCH_TYPE(dev_priv) >= PCH_ICP)
>  		GEN3_IRQ_RESET(uncore, SDE);
>  
> -	/* Wa_14010685332:cnp/cmp,tgp,adp */
> -	if (INTEL_PCH_TYPE(dev_priv) == PCH_CNP ||
> -	    (INTEL_PCH_TYPE(dev_priv) >= PCH_TGP &&
> -	     INTEL_PCH_TYPE(dev_priv) < PCH_DG1)) {
> -		intel_uncore_rmw(uncore, SOUTH_CHICKEN1,
> -				 SBCLK_RUN_REFCLK_DIS, SBCLK_RUN_REFCLK_DIS);
> -		intel_uncore_rmw(uncore, SOUTH_CHICKEN1,
> -				 SBCLK_RUN_REFCLK_DIS, 0);
> -	}
> +	cnp_display_clock_wa(dev_priv);
>  }
>  
>  static void gen11_irq_reset(struct drm_i915_private *dev_priv)
> @@ -3764,9 +3776,19 @@ static void gen8_de_irq_postinstall(struct drm_i915_private *dev_priv)
>  	}
>  }
>  
> +static void icp_irq_postinstall(struct drm_i915_private *dev_priv)
> +{
> +	struct intel_uncore *uncore = &dev_priv->uncore;
> +	u32 mask = SDE_GMBUS_ICP;
> +
> +	GEN3_IRQ_INIT(uncore, SDE, ~mask, 0xffffffff);
> +}
> +
>  static void gen8_irq_postinstall(struct drm_i915_private *dev_priv)
>  {
> -	if (HAS_PCH_SPLIT(dev_priv))
> +	if (INTEL_PCH_TYPE(dev_priv) >= PCH_ICP)
> +		icp_irq_postinstall(dev_priv);
> +	else if (HAS_PCH_SPLIT(dev_priv))
>  		ibx_irq_postinstall(dev_priv);
>  
>  	gen8_gt_irq_postinstall(&dev_priv->gt);
> @@ -3775,13 +3797,6 @@ static void gen8_irq_postinstall(struct drm_i915_private *dev_priv)
>  	gen8_master_intr_enable(dev_priv->uncore.regs);
>  }
>  
> -static void icp_irq_postinstall(struct drm_i915_private *dev_priv)
> -{
> -	struct intel_uncore *uncore = &dev_priv->uncore;
> -	u32 mask = SDE_GMBUS_ICP;
> -
> -	GEN3_IRQ_INIT(uncore, SDE, ~mask, 0xffffffff);
> -}
>  
>  static void gen11_irq_postinstall(struct drm_i915_private *dev_priv)
>  {
> -- 
> 2.29.2
> 
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
