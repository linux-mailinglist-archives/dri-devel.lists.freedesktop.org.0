Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0785131CFE0
	for <lists+dri-devel@lfdr.de>; Tue, 16 Feb 2021 19:08:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B91D6E323;
	Tue, 16 Feb 2021 18:08:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A15456E453;
 Tue, 16 Feb 2021 18:08:31 +0000 (UTC)
IronPort-SDR: LfS1afo7RqA9m5uAAa2NwKGuNUmp0RNbYlnbIT3Rv1r0oHRzyvl2XQhu0hFp8I91/vEOaKAbGC
 RmbhA9Kc+sRQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9897"; a="179464151"
X-IronPort-AV: E=Sophos;i="5.81,184,1610438400"; d="scan'208";a="179464151"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Feb 2021 10:08:30 -0800
IronPort-SDR: 3QS4sXG1CdDRgtOryO4kxvRTp8CEtNV8Dy9NG8rrGQ9qAg9vStzQ79LQbYxSbCSvg3+uhPxQ91
 x78m4i9OB6QA==
X-IronPort-AV: E=Sophos;i="5.81,184,1610438400"; d="scan'208";a="384643113"
Received: from ideak-desk.fi.intel.com ([10.237.68.141])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Feb 2021 10:08:29 -0800
Date: Tue, 16 Feb 2021 20:08:25 +0200
From: Imre Deak <imre.deak@intel.com>
To: Lyude Paul <lyude@redhat.com>
Subject: Re: [Intel-gfx] [PATCH v2] drm/i915/gen9bc: Handle TGP PCH during
 suspend/resume
Message-ID: <20210216180825.GA420119@ideak-desk.fi.intel.com>
References: <20210212185053.1689716-1-lyude@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210212185053.1689716-1-lyude@redhat.com>
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
 "open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

thanks for respinning this patchset, some comments below.

On Fri, Feb 12, 2021 at 01:50:53PM -0500, Lyude Paul wrote:
> From: Tejas Upadhyay <tejaskumarx.surendrakumar.upadhyay@intel.com>
> 
> For Legacy S3 suspend/resume GEN9 BC needs to enable and
> setup TGP PCH.
> 
> v2:
> * Move Wa_14010685332 into it's own function - vsyrjala
> * Add TODO comment about figuring out if we can move this workaround - imre
> 
> Cc: Matt Roper <matthew.d.roper@intel.com>
> Signed-off-by: Tejas Upadhyay <tejaskumarx.surendrakumar.upadhyay@intel.com>
> Signed-off-by: Lyude Paul <lyude@redhat.com>
> ---
>  drivers/gpu/drm/i915/i915_irq.c | 53 ++++++++++++++++++++++-----------
>  1 file changed, 36 insertions(+), 17 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/i915_irq.c b/drivers/gpu/drm/i915/i915_irq.c
> index 98145a7f28a4..7d912aa950ee 100644
> --- a/drivers/gpu/drm/i915/i915_irq.c
> +++ b/drivers/gpu/drm/i915/i915_irq.c
> @@ -3040,6 +3040,19 @@ static void valleyview_irq_reset(struct drm_i915_private *dev_priv)
>  	spin_unlock_irq(&dev_priv->irq_lock);
>  }
>  
> +static void cnp_irq_post_reset(struct drm_i915_private *dev_priv)

Maybe a better name is cnp_display_clock_wa.

> +{
> +	struct intel_uncore *uncore = &dev_priv->uncore;
> +
> +	/*
> +	 * Wa_14010685332:cnp/cmp,tgp,adp

Bspec says this WA applies ICL onwards and it's not PCH specific, for
instance I haven't found the GEN9/CNP/CMP WA entries for it. Please also
add a 'clarify platforms where this applies' todo item.

> +	 * TODO: Figure out if this workaround can be applied in the s0ix suspend/resume handlers as
> +	 * on earlier platforms and whether the workaround is also needed for runtime suspend/resume
> +	 */
> +	intel_uncore_rmw(uncore, SOUTH_CHICKEN1, SBCLK_RUN_REFCLK_DIS, SBCLK_RUN_REFCLK_DIS);
> +	intel_uncore_rmw(uncore, SOUTH_CHICKEN1, SBCLK_RUN_REFCLK_DIS, 0);
> +}
> +
>  static void gen8_irq_reset(struct drm_i915_private *dev_priv)
>  {
>  	struct intel_uncore *uncore = &dev_priv->uncore;
> @@ -3061,8 +3074,14 @@ static void gen8_irq_reset(struct drm_i915_private *dev_priv)
>  	GEN3_IRQ_RESET(uncore, GEN8_DE_MISC_);
>  	GEN3_IRQ_RESET(uncore, GEN8_PCU_);
>  
> -	if (HAS_PCH_SPLIT(dev_priv))
> +	if (INTEL_PCH_TYPE(dev_priv) >= PCH_ICP)

It was mentioned already earlier, why is this check necessary and can't we
just call ibx_irq_reset() for all PCHs?

> +		GEN3_IRQ_RESET(uncore, SDE);
> +	else if (HAS_PCH_SPLIT(dev_priv))
>  		ibx_irq_reset(dev_priv);
> +
> +	if (INTEL_PCH_TYPE(dev_priv) == PCH_CNP ||
> +	    (INTEL_PCH_TYPE(dev_priv) >= PCH_TGP && INTEL_PCH_TYPE(dev_priv) < PCH_DG1))

The check could be also moved to the helper.

> +		cnp_irq_post_reset(dev_priv);
>  }
>  
>  static void gen11_display_irq_reset(struct drm_i915_private *dev_priv)
> @@ -3104,15 +3123,9 @@ static void gen11_display_irq_reset(struct drm_i915_private *dev_priv)
>  	if (INTEL_PCH_TYPE(dev_priv) >= PCH_ICP)
>  		GEN3_IRQ_RESET(uncore, SDE);
>  
> -	/* Wa_14010685332:cnp/cmp,tgp,adp */
>  	if (INTEL_PCH_TYPE(dev_priv) == PCH_CNP ||
> -	    (INTEL_PCH_TYPE(dev_priv) >= PCH_TGP &&
> -	     INTEL_PCH_TYPE(dev_priv) < PCH_DG1)) {
> -		intel_uncore_rmw(uncore, SOUTH_CHICKEN1,
> -				 SBCLK_RUN_REFCLK_DIS, SBCLK_RUN_REFCLK_DIS);
> -		intel_uncore_rmw(uncore, SOUTH_CHICKEN1,
> -				 SBCLK_RUN_REFCLK_DIS, 0);
> -	}
> +	    (INTEL_PCH_TYPE(dev_priv) >= PCH_TGP && INTEL_PCH_TYPE(dev_priv) < PCH_DG1))
> +		cnp_irq_post_reset(dev_priv);
>  }
>  
>  static void gen11_irq_reset(struct drm_i915_private *dev_priv)
> @@ -3474,6 +3487,9 @@ static void spt_hpd_irq_setup(struct drm_i915_private *dev_priv)
>  	ibx_display_interrupt_update(dev_priv, hotplug_irqs, enabled_irqs);
>  
>  	spt_hpd_detection_setup(dev_priv);
> +
> +	if (INTEL_PCH_TYPE(dev_priv) >= PCH_ICP)
> +		icp_hpd_irq_setup(dev_priv);

This doesn't look correct, icp_hpd_irq_setup() redoes the interrupt
setup done already earlier in this function and
spt_hpd_detection_setup() is probably also not correct on ICP+. Looks
like for ICP+ we need to call icp_hpd_irq_setup() instead of
spt_hpd_irq_setup(), but haven't checked in detail.

>  }
>  
>  static u32 ilk_hotplug_enables(struct drm_i915_private *i915,
> @@ -3764,9 +3780,19 @@ static void gen8_de_irq_postinstall(struct drm_i915_private *dev_priv)
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
> @@ -3775,13 +3801,6 @@ static void gen8_irq_postinstall(struct drm_i915_private *dev_priv)
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
> _______________________________________________
> Intel-gfx mailing list
> Intel-gfx@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/intel-gfx
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
