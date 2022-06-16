Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C573154E151
	for <lists+dri-devel@lfdr.de>; Thu, 16 Jun 2022 15:00:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 992D711A099;
	Thu, 16 Jun 2022 13:00:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A723A1132B5;
 Thu, 16 Jun 2022 13:00:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1655384437; x=1686920437;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=Tr9gPWONPpUcdBTlI0PbbApbWb3nCJGm6NKoHc05MJ8=;
 b=bntyIO2wxjxb6gkX7kt8OOR7m3DjHphMRs2eqU7Y+TCxZ1OO2Il87ks4
 0loTJyOByGIbowU+AwkLCHZCVCnzFAGJMDfWdLlLRoH4MY98hklHGyBMe
 4JDjavyg6yKW+VWLdF1OcyUeWWG22XEv2Epx+L3UNnOETV44kSqNtMAj7
 akgTwTZfMNzMWQ6ZNfQw1F+8KFBG8Dqj1ZtEw05qHmhvn627ZqVDGNu5k
 GwjeMzyZXN3/VDCEz4ZA5zGHE98TeNLmqHsQ+U3w+uBsJJ6ans9RsMJx4
 QkzP1il6gKpyDxvH25ixwxV0LCQHM1F9/Elefyb0s6wbYvtJRmVX5FQaA Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10379"; a="267930319"
X-IronPort-AV: E=Sophos;i="5.91,305,1647327600"; d="scan'208";a="267930319"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2022 06:00:37 -0700
X-IronPort-AV: E=Sophos;i="5.91,305,1647327600"; d="scan'208";a="641527949"
Received: from malashi-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.252.57.133])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2022 06:00:34 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Anshuman Gupta <anshuman.gupta@intel.com>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v2 2/9] drm/i915/dg1: OpRegion PCON DG1 MBD config support
In-Reply-To: <20220616120106.24353-3-anshuman.gupta@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20220616120106.24353-1-anshuman.gupta@intel.com>
 <20220616120106.24353-3-anshuman.gupta@intel.com>
Date: Thu, 16 Jun 2022 16:00:31 +0300
Message-ID: <877d5gwyog.fsf@intel.com>
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
> DGFX cards support both Add in Card(AIC) and Mother Board Down(MBD)
> configs. MBD config requires HOST BIOS GPIO toggling support
> in order to enable/disable VRAM SR using ACPI OpRegion.
>
> i915 requires to check OpRegion PCON MBD Config bits to
> discover whether Gfx Card is MBD config before enabling
> VRSR.
>
> BSpec: 53440
> Cc: Jani Nikula <jani.nikula@intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Signed-off-by: Anshuman Gupta <anshuman.gupta@intel.com>
> ---
>  drivers/gpu/drm/i915/display/intel_opregion.c | 43 +++++++++++++++++++
>  drivers/gpu/drm/i915/display/intel_opregion.h |  6 +++
>  2 files changed, 49 insertions(+)
>
> diff --git a/drivers/gpu/drm/i915/display/intel_opregion.c b/drivers/gpu/drm/i915/display/intel_opregion.c
> index 11d8c5bb23ac..c8cdcde89dfc 100644
> --- a/drivers/gpu/drm/i915/display/intel_opregion.c
> +++ b/drivers/gpu/drm/i915/display/intel_opregion.c
> @@ -53,6 +53,8 @@
>  #define MBOX_ASLE_EXT		BIT(4)	/* Mailbox #5 */
>  #define MBOX_BACKLIGHT		BIT(5)	/* Mailbox #2 (valid from v3.x) */
>  
> +#define PCON_DG1_MBD_CONFIG				BIT(9)
> +#define PCON_DG1_MBD_CONFIG_FIELD_VALID			BIT(10)
>  #define PCON_DGFX_BIOS_SUPPORTS_VRSR			BIT(11)
>  #define PCON_DGFX_BIOS_SUPPORTS_VRSR_FIELD_VALID	BIT(12)
>  #define PCON_HEADLESS_SKU	BIT(13)
> @@ -1255,6 +1257,44 @@ void intel_opregion_unregister(struct drm_i915_private *i915)
>  	opregion->lid_state = NULL;
>  }
>  
> +static bool intel_opregion_dg1_mbd_config(struct drm_i915_private *i915)
> +{
> +	struct intel_opregion *opregion = &i915->opregion;
> +
> +	if (!IS_DG1(i915))
> +		return false;
> +
> +	if (!opregion)

Like in previous patch, opregion is always non-NULL. Check for
!opregion->header.

> +		return false;
> +
> +	if (opregion->header->pcon & PCON_DG1_MBD_CONFIG_FIELD_VALID)
> +		return opregion->header->pcon & PCON_DG1_MBD_CONFIG;
> +	else
> +		return false;
> +}
> +
> +/**
> + * intel_opregion_vram_sr_required().
> + * @i915 i915 device priv data.
> + *
> + * It checks whether a DGFX card is Mother Board Down config depending
> + * on respective discrete platform.
> + *
> + * Returns:
> + * It returns a boolean whether opregion vram_sr support is required.
> + */
> +bool
> +intel_opregion_vram_sr_required(struct drm_i915_private *i915)
> +{
> +	if (!IS_DGFX(i915))
> +		return false;
> +
> +	if (IS_DG1(i915))
> +		return intel_opregion_dg1_mbd_config(i915);

Only check for IS_DG1() here or in the function being called, not both.

> +
> +	return false;
> +}
> +
>  /**
>   * intel_opregion_bios_supports_vram_sr() get HOST BIOS VRAM Self
>   * Refresh capability support.
> @@ -1298,6 +1338,9 @@ void intel_opregion_vram_sr(struct drm_i915_private *i915, bool enable)
>  	if (!opregion)
>  		return;
>  
> +	if (!intel_opregion_vram_sr_required(i915))
> +		return;

Feels like maybe this patch should be combined with the previous patch
due to this dependency.

> +
>  	if (drm_WARN(&i915->drm, !opregion->asle, "ASLE MAILBOX3 is not available\n"))
>  		return;
>  
> diff --git a/drivers/gpu/drm/i915/display/intel_opregion.h b/drivers/gpu/drm/i915/display/intel_opregion.h
> index 73c9d81d5ee6..ad40c97f9565 100644
> --- a/drivers/gpu/drm/i915/display/intel_opregion.h
> +++ b/drivers/gpu/drm/i915/display/intel_opregion.h
> @@ -77,6 +77,7 @@ int intel_opregion_get_panel_type(struct drm_i915_private *dev_priv);
>  struct edid *intel_opregion_get_edid(struct intel_connector *connector);
>  bool intel_opregion_bios_supports_vram_sr(struct drm_i915_private *i915);
>  void intel_opregion_vram_sr(struct drm_i915_private *i915, bool enable);
> +bool intel_opregion_vram_sr_required(struct drm_i915_private *i915);
>  
>  bool intel_opregion_headless_sku(struct drm_i915_private *i915);
>  
> @@ -145,6 +146,11 @@ static void intel_opregion_vram_sr(struct drm_i915_private *i915, bool enable)
>  {
>  }
>  
> +static bool intel_opregion_vram_sr_required(struct drm_i915_private *i915)

static inline.

BR,
Jani.

> +{
> +	return false;
> +}
> +
>  #endif /* CONFIG_ACPI */
>  
>  #endif

-- 
Jani Nikula, Intel Open Source Graphics Center
