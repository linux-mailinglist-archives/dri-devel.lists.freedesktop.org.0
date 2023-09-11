Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B934279AA95
	for <lists+dri-devel@lfdr.de>; Mon, 11 Sep 2023 19:29:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 55E7C10E34D;
	Mon, 11 Sep 2023 17:29:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D8C210E34E;
 Mon, 11 Sep 2023 17:29:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1694453381; x=1725989381;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=t0MChbT9anmwCTW4aLxtvuNYSMoznXBB+c/G4YEPAAI=;
 b=dMuzhK6UPceUIWvAE7Bi6sZyB4LCc8X2xO/hy0UbuZUcCVfFPIVIGJt6
 ShYl11ToMCceCsxHjl0A4wFe8j+8Bg714bPM1o4nViIJlYDFUPNSHKQaK
 lurgg2/tFkfcD7iL3Ysmg1VRD9lxirig1UbZbyF3DCeAee93jhx4TcgHv
 K0FssNw89MQ7oULD98e8ga/L9I/Rugh0WIMZjsF9LyVvOb4y+h9nHzN47
 a0SLFFRGUdiPznLutszbCgzoJWvPR/ZkFLZXFWjSQCWzsBV5GsjqXlNqV
 XuGUcC4hsk5T8e9DjX4GGMh8dfUfJe8/bLI8fV6aukyaQ/VVKpSxkpxfg Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10830"; a="378063525"
X-IronPort-AV: E=Sophos;i="6.02,244,1688454000"; d="scan'208";a="378063525"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Sep 2023 10:29:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10830"; a="833590628"
X-IronPort-AV: E=Sophos;i="6.02,244,1688454000"; d="scan'208";a="833590628"
Received: from kschuele-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.252.63.119])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Sep 2023 10:29:38 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Allen Ballway <ballway@chromium.org>, ballway@chromium.org
Subject: Re: [PATCH v3 RESEND] drm/i915/quirk: Add quirk for devices that
 cannot be dimmed
In-Reply-To: <20230808173957.2017765-1-ballway@chromium.org>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20230629172106.3798019-1-ballway@chromium.org>
 <20230808173957.2017765-1-ballway@chromium.org>
Date: Mon, 11 Sep 2023 20:29:35 +0300
Message-ID: <87fs3kehz4.fsf@intel.com>
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
Cc: linux-kernel@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 arun.r.murthy@intel.com, dri-devel@lists.freedesktop.org,
 josh@joshtriplett.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 08 Aug 2023, Allen Ballway <ballway@chromium.org> wrote:
> Cybernet T10C cannot be dimmed without the backlight strobing. Create a
> new quirk to lock the minimum brightness to the highest supported value.
> This aligns the device with its behavior on Windows, which will not
> lower the brightness below maximum.

Noting here for the benefit of others, it's possible to make the
brightness work [1], now we "just" need to figure out how to do that
nicely. So we should drop this patch.

BR,
Jani.


[1] https://gitlab.freedesktop.org/drm/intel/-/issues/8187#note_2072633

>
> Signed-off-by: Allen Ballway <ballway@chromium.org>
> ---
> V2 -> V3: Fix typo.
> V1 -> V2: Fix style issue.
>
> .../gpu/drm/i915/display/intel_backlight.c    |  5 ++++
>  drivers/gpu/drm/i915/display/intel_quirks.c   | 27 +++++++++++++++++++
>  drivers/gpu/drm/i915/display/intel_quirks.h   |  1 +
>  3 files changed, 33 insertions(+)
>
> diff --git a/drivers/gpu/drm/i915/display/intel_backlight.c b/drivers/gpu/drm/i915/display/intel_backlight.c
> index 2e8f17c045222..f015563d3ebd5 100644
> --- a/drivers/gpu/drm/i915/display/intel_backlight.c
> +++ b/drivers/gpu/drm/i915/display/intel_backlight.c
> @@ -1192,6 +1192,11 @@ static u32 get_backlight_min_vbt(struct intel_connector *connector)
>
>  	drm_WARN_ON(&i915->drm, panel->backlight.pwm_level_max == 0);
>
> +	if (intel_has_quirk(i915, QUIRK_NO_DIM)) {
> +		/* Cannot dim backlight, set minimum to highest value */
> +		return panel->backlight.pwm_level_max - 1;
> +	}
> +
>  	/*
>  	 * XXX: If the vbt value is 255, it makes min equal to max, which leads
>  	 * to problems. There are such machines out there. Either our
> diff --git a/drivers/gpu/drm/i915/display/intel_quirks.c b/drivers/gpu/drm/i915/display/intel_quirks.c
> index a280448df771a..910c95840a539 100644
> --- a/drivers/gpu/drm/i915/display/intel_quirks.c
> +++ b/drivers/gpu/drm/i915/display/intel_quirks.c
> @@ -65,6 +65,12 @@ static void quirk_no_pps_backlight_power_hook(struct drm_i915_private *i915)
>  	drm_info(&i915->drm, "Applying no pps backlight power quirk\n");
>  }
>
> +static void quirk_no_dim(struct drm_i915_private *i915)
> +{
> +	intel_set_quirk(i915, QUIRK_NO_DIM);
> +	drm_info(&i915->drm, "Applying no dim quirk\n");
> +}
> +
>  struct intel_quirk {
>  	int device;
>  	int subsystem_vendor;
> @@ -90,6 +96,12 @@ static int intel_dmi_no_pps_backlight(const struct dmi_system_id *id)
>  	return 1;
>  }
>
> +static int intel_dmi_no_dim(const struct dmi_system_id *id)
> +{
> +	DRM_INFO("No dimming allowed on %s\n", id->ident);
> +	return 1;
> +}
> +
>  static const struct intel_dmi_quirk intel_dmi_quirks[] = {
>  	{
>  		.dmi_id_list = &(const struct dmi_system_id[]) {
> @@ -136,6 +148,20 @@ static const struct intel_dmi_quirk intel_dmi_quirks[] = {
>  		},
>  		.hook = quirk_no_pps_backlight_power_hook,
>  	},
> +	{
> +		.dmi_id_list = &(const struct dmi_system_id[]) {
> +			{
> +				.callback = intel_dmi_no_dim,
> +				.ident = "Cybernet T10C Tablet",
> +				.matches = {DMI_EXACT_MATCH(DMI_BOARD_VENDOR,
> +							    "Cybernet Manufacturing Inc."),
> +					    DMI_EXACT_MATCH(DMI_BOARD_NAME, "T10C Tablet"),
> +				},
> +			},
> +			{ }
> +		},
> +		.hook = quirk_no_dim,
> +	},
>  };
>
>  static struct intel_quirk intel_quirks[] = {
> @@ -218,6 +244,7 @@ void intel_init_quirks(struct drm_i915_private *i915)
>  		     q->subsystem_device == PCI_ANY_ID))
>  			q->hook(i915);
>  	}
> +
>  	for (i = 0; i < ARRAY_SIZE(intel_dmi_quirks); i++) {
>  		if (dmi_check_system(*intel_dmi_quirks[i].dmi_id_list) != 0)
>  			intel_dmi_quirks[i].hook(i915);
> diff --git a/drivers/gpu/drm/i915/display/intel_quirks.h b/drivers/gpu/drm/i915/display/intel_quirks.h
> index 10a4d163149fd..b41c7bbf0a5e3 100644
> --- a/drivers/gpu/drm/i915/display/intel_quirks.h
> +++ b/drivers/gpu/drm/i915/display/intel_quirks.h
> @@ -17,6 +17,7 @@ enum intel_quirk_id {
>  	QUIRK_INVERT_BRIGHTNESS,
>  	QUIRK_LVDS_SSC_DISABLE,
>  	QUIRK_NO_PPS_BACKLIGHT_POWER_HOOK,
> +	QUIRK_NO_DIM,
>  };
>
>  void intel_init_quirks(struct drm_i915_private *i915);
> --
> 2.41.0.255.g8b1d071c50-goog
>

-- 
Jani Nikula, Intel Open Source Graphics Center
