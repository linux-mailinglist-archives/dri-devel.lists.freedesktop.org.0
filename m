Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D37EC4BF478
	for <lists+dri-devel@lfdr.de>; Tue, 22 Feb 2022 10:16:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F3AD810E637;
	Tue, 22 Feb 2022 09:16:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A511310E61E
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Feb 2022 09:16:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1645521362; x=1677057362;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=p920sdBU2squE3AHhXo/X1QGF7/Rg6Wq6yMDYe0h5mo=;
 b=gfC78HP/bjD1TUWHnxEE2RCqEPF4ooDR+c3fV/6dZ6dhFsi6TXJoxpo3
 FJCZwTBjb/68WO7Wqzqh9q5Sre/AcmjTt2Uu0jroHAtjnnxWB+ZavGkGE
 jTGBglhtrJL92uLDo0lLJoXg18G+iz3gc3eMfKbqeDfV1WUrhhZF7+LHV
 xrxh5Nau3UHPVDuvyP7JNb3A7uotzB3mWvY/nblwdV+ulUpV8Kr2SpPUi
 oNTNUr2T09j7eFtIWDULlufqqEcWtRY/0qyqaCBQu2cN/6cg44wl/TioY
 IQXo1PW5SsyMBa55DG58c207+C86wJ/C4mEbPGE9frCJFcuxe5YUmuMIp A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10265"; a="250468102"
X-IronPort-AV: E=Sophos;i="5.88,387,1635231600"; d="scan'208";a="250468102"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Feb 2022 01:16:02 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,387,1635231600"; d="scan'208";a="532151115"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.151])
 by orsmga007.jf.intel.com with SMTP; 22 Feb 2022 01:15:59 -0800
Received: by stinkbox (sSMTP sendmail emulation);
 Tue, 22 Feb 2022 11:15:58 +0200
Date: Tue, 22 Feb 2022 11:15:58 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Hans de Goede <hdegoede@redhat.com>
Subject: Re: [PATCH 1/2] drm/i915/vlv_dsi: Add DMI quirk for wrong panel
 modeline in BIOS on Asus TF103C
Message-ID: <YhSpzvT+DVq02fBX@intel.com>
References: <20220221220608.12131-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220221220608.12131-1-hdegoede@redhat.com>
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
Cc: dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Feb 21, 2022 at 11:06:07PM +0100, Hans de Goede wrote:
> Vtotal is wrong in the BIOS supplied modeline for the DSI panel on

Please include both the correct and bad modelines in the commit
msg.

> the Asus TF103C leading to the last line of the display being shown
> as the first line.
> 
> The factory installed Android has a hardcoded modeline in its kernel,
> causing it to not suffer from this BIOS bug;
> 
> and the Android boot-splash which uses the EFI FB which does have this bug
> has the last line all black causing the bug to not be visible.
> 
> This commit introduces a generic DMI based mechanism for doing modeline
> fixups, in case we need similar fixups on other models in the future.
> 
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> ---
>  drivers/gpu/drm/i915/display/vlv_dsi.c | 36 ++++++++++++++++++++++++++
>  1 file changed, 36 insertions(+)
> 
> diff --git a/drivers/gpu/drm/i915/display/vlv_dsi.c b/drivers/gpu/drm/i915/display/vlv_dsi.c
> index 06ef822c27bd..66f5cf32bb66 100644
> --- a/drivers/gpu/drm/i915/display/vlv_dsi.c
> +++ b/drivers/gpu/drm/i915/display/vlv_dsi.c
> @@ -23,6 +23,7 @@
>   * Author: Jani Nikula <jani.nikula@intel.com>
>   */
>  
> +#include <linux/dmi.h>
>  #include <linux/slab.h>
>  
>  #include <drm/drm_atomic_helper.h>
> @@ -1831,6 +1832,33 @@ static void vlv_dphy_param_init(struct intel_dsi *intel_dsi)
>  	intel_dsi_log_params(intel_dsi);
>  }
>  
> +typedef void (*vlv_dsi_mode_fixup_func)(struct drm_connector *connector,
> +					struct drm_display_mode *fixed_mode);
> +
> +/*
> + * Vtotal is wrong on the Asus TF103C leading to the last line of the display
> + * being shown as the first line. The factory installed Android has a hardcoded
> + * modeline, causing it to not suffer from this BIOS bug.
> + */
> +static void vlv_dsi_asus_tf103c_mode_fixup(struct drm_connector *connector,
> +					   struct drm_display_mode *fixed_mode)
> +{
> +	fixed_mode->vtotal = 816;

I might prefer a full modeline here. Or maybe just vtotal-- or
something, if it's just an off by one.

> +	fixed_mode->crtc_vtotal = 816;

The crtc timings should all be 0 at this point. So this looks redundant.

> +}
> +
> +static const struct dmi_system_id dmi_mode_fixup_table[] = {
> +	{
> +		/* Asus Transformer Pad TF103C */
> +		.matches = {
> +			DMI_MATCH(DMI_SYS_VENDOR, "ASUSTeK COMPUTER INC."),
> +			DMI_MATCH(DMI_PRODUCT_NAME, "TF103C"),
> +		},
> +		.driver_data = (void *)vlv_dsi_asus_tf103c_mode_fixup,
> +	},
> +	{ }
> +};
> +
>  void vlv_dsi_init(struct drm_i915_private *dev_priv)
>  {
>  	struct drm_device *dev = &dev_priv->drm;
> @@ -1840,6 +1868,8 @@ void vlv_dsi_init(struct drm_i915_private *dev_priv)
>  	struct intel_connector *intel_connector;
>  	struct drm_connector *connector;
>  	struct drm_display_mode *current_mode, *fixed_mode;
> +	const struct dmi_system_id *dmi_id;
> +	vlv_dsi_mode_fixup_func mode_fixup;

The function pointer can go into the if block.

>  	enum port port;
>  	enum pipe pipe;
>  
> @@ -1968,6 +1998,12 @@ void vlv_dsi_init(struct drm_i915_private *dev_priv)
>  		goto err_cleanup_connector;
>  	}
>  
> +	dmi_id = dmi_first_match(dmi_mode_fixup_table);
> +	if (dmi_id) {
> +		mode_fixup = (vlv_dsi_mode_fixup_func)dmi_id->driver_data;
> +		mode_fixup(connector, fixed_mode);
> +	}
> +
>  	intel_panel_init(&intel_connector->panel, fixed_mode, NULL);
>  	intel_backlight_setup(intel_connector, INVALID_PIPE);
>  
> -- 
> 2.35.1

-- 
Ville Syrjälä
Intel
