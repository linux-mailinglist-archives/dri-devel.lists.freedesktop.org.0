Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7191854E12C
	for <lists+dri-devel@lfdr.de>; Thu, 16 Jun 2022 14:56:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D80211A57D;
	Thu, 16 Jun 2022 12:56:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A06111A57D;
 Thu, 16 Jun 2022 12:56:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1655384172; x=1686920172;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=SgBWLNCtYi1SAgbvwbuK0aFfemaqiaYXzASoGfKPaMI=;
 b=Nr6B/x/v7a0z9M0q0eltBYOaL+W74nwoS0l5mR979gpCw8WcYJL11fh6
 2dmmPSyJimQxIRV6/6HUBhMTrGnEXQvO3pICfdnCn4CR5NFz9G7Anji99
 0iBuvza0vcPqaXkMDj8i2S4GvELZPIUseCXH/B3G7kVomHXwlZ2Tx1RIj
 XseUUkhjfnzngSZUa11HlkklwR2Cp9/H0u3+J3EU9PvflMshyT6xg51vM
 3mi5FHyVBgMwZ8kTWFGBOYhf71XLzu76mFCy4qaHAoht0+fD3Jj13r8vM
 g3PLOmzsogJjeR1z6wZmqPR4H++t51ta+sumnNrJE9jsuuc857OLlfc6i Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10379"; a="279298827"
X-IronPort-AV: E=Sophos;i="5.91,305,1647327600"; d="scan'208";a="279298827"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2022 05:56:11 -0700
X-IronPort-AV: E=Sophos;i="5.91,305,1647327600"; d="scan'208";a="641526021"
Received: from malashi-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.252.57.133])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2022 05:56:08 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Anshuman Gupta <anshuman.gupta@intel.com>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v2 1/9] drm/i915/dgfx: OpRegion VRAM Self Refresh Support
In-Reply-To: <20220616120106.24353-2-anshuman.gupta@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20220616120106.24353-1-anshuman.gupta@intel.com>
 <20220616120106.24353-2-anshuman.gupta@intel.com>
Date: Thu, 16 Jun 2022 15:56:06 +0300
Message-ID: <87a6acwyvt.fsf@intel.com>
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
Cc: tilak.tangudu@intel.com, tvrtko.ursulin@intel.com,
 Anshuman Gupta <anshuman.gupta@intel.com>, jon.ewins@intel.com,
 badal.nilawar@intel.com, rodrigo.vivi@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 16 Jun 2022, Anshuman Gupta <anshuman.gupta@intel.com> wrote:
> Intel DGFX cards provides a feature Video Ram Self Refrsh(VRSR).
> DGFX VRSR can be enabled with runtime suspend D3Cold flow and with
> opportunistic S0ix system wide suspend flow as well.
>
> Without VRSR enablement i915 has to evict the lmem objects to
> system memory. Depending on some heuristics driver will evict
> lmem objects without VRSR.
>
> VRSR feature requires Host BIOS support, VRSR will be enable/disable
> by HOST BIOS using ACPI OpRegion.
>
> Adding OpRegion VRSR support in order to enable/disable
> VRSR on discrete cards.
>
> BSpec: 53440
> Cc: Jani Nikula <jani.nikula@intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Signed-off-by: Anshuman Gupta <anshuman.gupta@intel.com>
> ---
>  drivers/gpu/drm/i915/display/intel_opregion.c | 62 ++++++++++++++++++-
>  drivers/gpu/drm/i915/display/intel_opregion.h | 11 ++++
>  2 files changed, 72 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/i915/display/intel_opregion.c b/drivers/gpu/drm/i915/display/intel_opregion.c
> index 6876ba30d5a9..11d8c5bb23ac 100644
> --- a/drivers/gpu/drm/i915/display/intel_opregion.c
> +++ b/drivers/gpu/drm/i915/display/intel_opregion.c
> @@ -53,6 +53,8 @@
>  #define MBOX_ASLE_EXT		BIT(4)	/* Mailbox #5 */
>  #define MBOX_BACKLIGHT		BIT(5)	/* Mailbox #2 (valid from v3.x) */
>  
> +#define PCON_DGFX_BIOS_SUPPORTS_VRSR			BIT(11)
> +#define PCON_DGFX_BIOS_SUPPORTS_VRSR_FIELD_VALID	BIT(12)
>  #define PCON_HEADLESS_SKU	BIT(13)
>  
>  struct opregion_header {
> @@ -130,7 +132,8 @@ struct opregion_asle {
>  	u64 rvda;	/* Physical (2.0) or relative from opregion (2.1+)
>  			 * address of raw VBT data. */
>  	u32 rvds;	/* Size of raw vbt data */
> -	u8 rsvd[58];
> +	u8 vrsr;	/* DGFX Video Ram Self Refresh */
> +	u8 rsvd[57];
>  } __packed;
>  
>  /* OpRegion mailbox #5: ASLE ext */
> @@ -201,6 +204,9 @@ struct opregion_asle_ext {
>  
>  #define ASLE_PHED_EDID_VALID_MASK	0x3
>  
> +/* VRAM SR */
> +#define ASLE_VRSR_ENABLE		BIT(0)
> +
>  /* Software System Control Interrupt (SWSCI) */
>  #define SWSCI_SCIC_INDICATOR		(1 << 0)
>  #define SWSCI_SCIC_MAIN_FUNCTION_SHIFT	1
> @@ -921,6 +927,8 @@ int intel_opregion_setup(struct drm_i915_private *dev_priv)
>  		opregion->header->over.minor,
>  		opregion->header->over.revision);
>  
> +	drm_dbg(&dev_priv->drm, "OpRegion PCON values 0x%x\n", opregion->header->pcon);
> +
>  	mboxes = opregion->header->mboxes;
>  	if (mboxes & MBOX_ACPI) {
>  		drm_dbg(&dev_priv->drm, "Public ACPI methods supported\n");
> @@ -1246,3 +1254,55 @@ void intel_opregion_unregister(struct drm_i915_private *i915)
>  	opregion->vbt = NULL;
>  	opregion->lid_state = NULL;
>  }
> +
> +/**
> + * intel_opregion_bios_supports_vram_sr() get HOST BIOS VRAM Self
> + * Refresh capability support.
> + * @i915: pointer to i915 device.
> + *
> + * It checks opregion pcon vram_sr fields to get HOST BIOS vram_sr
> + * capability support. It is only applocable to DGFX.
> + *
> + * Returns:
> + * true when bios supports vram_sr, or false if bios doesn't support.
> + */
> +bool intel_opregion_bios_supports_vram_sr(struct drm_i915_private *i915)
> +{
> +	struct intel_opregion *opregion = &i915->opregion;
> +
> +	if (!IS_DGFX(i915))
> +		return false;
> +
> +	if (!opregion)

This is always true. You should check for !opregion->header.

> +		return false;
> +
> +	if (opregion->header->pcon & PCON_DGFX_BIOS_SUPPORTS_VRSR_FIELD_VALID)
> +		return opregion->header->pcon & PCON_DGFX_BIOS_SUPPORTS_VRSR;
> +	else
> +		return false;
> +}
> +
> +/**
> + * intel_opregion_vram_sr() - enable/disable VRAM Self Refresh.
> + * @i915: pointer to i915 device.
> + * @enable: Argument to enable/disable VRSR.
> + *
> + * It enables/disables vram_sr in opregion ASLE MBOX, based upon that
> + * HOST BIOS will enables and disbales VRAM_SR during
> + * ACPI _PS3/_OFF and _PS/_ON glue method.
> + */
> +void intel_opregion_vram_sr(struct drm_i915_private *i915, bool enable)
> +{
> +	struct intel_opregion *opregion = &i915->opregion;
> +
> +	if (!opregion)

Same as above.

> +		return;
> +
> +	if (drm_WARN(&i915->drm, !opregion->asle, "ASLE MAILBOX3 is not available\n"))
> +		return;

I'd just bundle !opregion->asle into the early return.

> +
> +	if (enable)
> +		opregion->asle->vrsr |= ASLE_VRSR_ENABLE;
> +	else
> +		opregion->asle->vrsr &= ~ASLE_VRSR_ENABLE;
> +}
> diff --git a/drivers/gpu/drm/i915/display/intel_opregion.h b/drivers/gpu/drm/i915/display/intel_opregion.h
> index 2f261f985400..73c9d81d5ee6 100644
> --- a/drivers/gpu/drm/i915/display/intel_opregion.h
> +++ b/drivers/gpu/drm/i915/display/intel_opregion.h
> @@ -75,6 +75,8 @@ int intel_opregion_notify_adapter(struct drm_i915_private *dev_priv,
>  				  pci_power_t state);
>  int intel_opregion_get_panel_type(struct drm_i915_private *dev_priv);
>  struct edid *intel_opregion_get_edid(struct intel_connector *connector);
> +bool intel_opregion_bios_supports_vram_sr(struct drm_i915_private *i915);
> +void intel_opregion_vram_sr(struct drm_i915_private *i915, bool enable);
>  
>  bool intel_opregion_headless_sku(struct drm_i915_private *i915);
>  
> @@ -134,6 +136,15 @@ static inline bool intel_opregion_headless_sku(struct drm_i915_private *i915)
>  	return false;
>  }
>  
> +static bool intel_opregion_bios_supports_vram_sr(struct drm_i915_private *i915)
> +{
> +	return false;
> +}
> +
> +static void intel_opregion_vram_sr(struct drm_i915_private *i915, bool enable)
> +{
> +}
> +

Both of these stubs need to be static inline.

BR,
Jani.

>  #endif /* CONFIG_ACPI */
>  
>  #endif

-- 
Jani Nikula, Intel Open Source Graphics Center
