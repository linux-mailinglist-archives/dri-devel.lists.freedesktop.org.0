Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AB9B40D660
	for <lists+dri-devel@lfdr.de>; Thu, 16 Sep 2021 11:40:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC7AD6EB33;
	Thu, 16 Sep 2021 09:40:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1412F6EB31;
 Thu, 16 Sep 2021 09:40:23 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10108"; a="222565989"
X-IronPort-AV: E=Sophos;i="5.85,298,1624345200"; d="scan'208";a="222565989"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2021 02:40:22 -0700
X-IronPort-AV: E=Sophos;i="5.85,298,1624345200"; d="scan'208";a="545458826"
Received: from djustese-mobl.ger.corp.intel.com (HELO localhost)
 ([10.249.34.120])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2021 02:40:14 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Hans de Goede <hdegoede@redhat.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rajat Jain <rajatja@google.com>,
 Lyude <lyude@redhat.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Mark Gross <mgross@linux.intel.com>, Andy Shevchenko <andy@infradead.org>,
 Ville =?utf-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Cc: Hans de Goede <hdegoede@redhat.com>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@linux.ie>, Pekka Paalanen <pekka.paalanen@collabora.com>,
 Mario Limonciello <mario.limonciello@outlook.com>,
 Mark Pearson <markpearson@lenovo.com>, Sebastien Bacher <seb128@ubuntu.com>,
 Marco Trevisan <marco.trevisan@canonical.com>,
 Emil Velikov <emil.l.velikov@gmail.com>,
 intel-gfx <intel-gfx@lists.freedesktop.org>, dri-devel@lists.freedesktop.org,
 platform-driver-x86@vger.kernel.org
Subject: Re: [PATCH 9/9] drm/i915: Add privacy-screen support
In-Reply-To: <20210906073519.4615-10-hdegoede@redhat.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20210906073519.4615-1-hdegoede@redhat.com>
 <20210906073519.4615-10-hdegoede@redhat.com>
Date: Thu, 16 Sep 2021 12:40:11 +0300
Message-ID: <87sfy4x3ic.fsf@intel.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


Cc: Ville for input here, see question inline.

On Mon, 06 Sep 2021, Hans de Goede <hdegoede@redhat.com> wrote:
> Add support for eDP panels with a built-in privacy screen using the
> new drm_privacy_screen class.
>
> One thing which stands out here is the addition of these 2 lines to
> intel_atomic_commit_tail:
>
> 	for_each_new_connector_in_state(&state->base, connector, ...
> 		drm_connector_update_privacy_screen(connector, state);
>
> It may seem more logical to instead take care of updating the
> privacy-screen state by marking the crtc as needing a modeset and then
> do this in both the encoder update_pipe (for fast-sets) and enable
> (for full modesets) callbacks. But ATM these callbacks only get passed
> the new connector_state and these callbacks are all called after
> drm_atomic_helper_swap_state() at which point there is no way to get
> the old state from the new state.
>
> Without access to the old state, we do not know if the sw_state of
> the privacy-screen has changes so we would need to call
> drm_privacy_screen_set_sw_state() unconditionally. This is undesirable
> since all current known privacy-screen providers use ACPI calls which
> are somewhat expensive to make.
>
> Also, as all providers use ACPI calls, rather then poking GPU registers,
> there is no need to order this together with other encoder operations.
> Since no GPU poking is involved having this as a separate step of the
> commit process actually is the logical thing to do.
>
> Reviewed-by: Emil Velikov <emil.l.velikov@gmail.com>
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> ---
>  drivers/gpu/drm/i915/display/intel_display.c |  5 +++++
>  drivers/gpu/drm/i915/display/intel_dp.c      | 10 ++++++++++
>  drivers/gpu/drm/i915/i915_pci.c              | 12 ++++++++++++
>  3 files changed, 27 insertions(+)
>
> diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/drm/i915/display/intel_display.c
> index 5560d2f4c352..7285873d329a 100644
> --- a/drivers/gpu/drm/i915/display/intel_display.c
> +++ b/drivers/gpu/drm/i915/display/intel_display.c
> @@ -10140,6 +10140,8 @@ static void intel_atomic_commit_tail(struct intel_atomic_state *state)
>  	struct drm_device *dev = state->base.dev;
>  	struct drm_i915_private *dev_priv = to_i915(dev);
>  	struct intel_crtc_state *new_crtc_state, *old_crtc_state;
> +	struct drm_connector_state *new_connector_state;
> +	struct drm_connector *connector;
>  	struct intel_crtc *crtc;
>  	u64 put_domains[I915_MAX_PIPES] = {};
>  	intel_wakeref_t wakeref = 0;
> @@ -10237,6 +10239,9 @@ static void intel_atomic_commit_tail(struct intel_atomic_state *state)
>  			intel_color_load_luts(new_crtc_state);
>  	}
>  
> +	for_each_new_connector_in_state(&state->base, connector, new_connector_state, i)
> +		drm_connector_update_privacy_screen(connector, &state->base);
> +
>  	/*
>  	 * Now that the vblank has passed, we can go ahead and program the
>  	 * optimal watermarks on platforms that need two-step watermark
> diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
> index 7f8e8865048f..3aa2072cccf6 100644
> --- a/drivers/gpu/drm/i915/display/intel_dp.c
> +++ b/drivers/gpu/drm/i915/display/intel_dp.c
> @@ -37,6 +37,7 @@
>  #include <drm/drm_crtc.h>
>  #include <drm/drm_dp_helper.h>
>  #include <drm/drm_edid.h>
> +#include <drm/drm_privacy_screen_consumer.h>
>  #include <drm/drm_probe_helper.h>
>  
>  #include "g4x_dp.h"
> @@ -5217,6 +5218,7 @@ static bool intel_edp_init_connector(struct intel_dp *intel_dp,
>  	struct drm_connector *connector = &intel_connector->base;
>  	struct drm_display_mode *fixed_mode = NULL;
>  	struct drm_display_mode *downclock_mode = NULL;
> +	struct drm_privacy_screen *privacy_screen;
>  	bool has_dpcd;
>  	enum pipe pipe = INVALID_PIPE;
>  	struct edid *edid;
> @@ -5308,6 +5310,14 @@ static bool intel_edp_init_connector(struct intel_dp *intel_dp,
>  				fixed_mode->hdisplay, fixed_mode->vdisplay);
>  	}
>  
> +	privacy_screen = drm_privacy_screen_get(dev->dev, NULL);
> +	if (!IS_ERR(privacy_screen)) {
> +		drm_connector_attach_privacy_screen_provider(connector,
> +							     privacy_screen);
> +	} else if (PTR_ERR(privacy_screen) != -ENODEV) {
> +		drm_warn(&dev_priv->drm, "Error getting privacy-screen\n");
> +	}
> +
>  	return true;
>  
>  out_vdd_off:
> diff --git a/drivers/gpu/drm/i915/i915_pci.c b/drivers/gpu/drm/i915/i915_pci.c
> index 146f7e39182a..d6913f567a1c 100644
> --- a/drivers/gpu/drm/i915/i915_pci.c
> +++ b/drivers/gpu/drm/i915/i915_pci.c
> @@ -25,6 +25,7 @@
>  #include <linux/vga_switcheroo.h>
>  
>  #include <drm/drm_drv.h>
> +#include <drm/drm_privacy_screen_consumer.h>
>  #include <drm/i915_pciids.h>
>  
>  #include "i915_drv.h"
> @@ -1167,6 +1168,7 @@ static int i915_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
>  {
>  	struct intel_device_info *intel_info =
>  		(struct intel_device_info *) ent->driver_data;
> +	struct drm_privacy_screen *privacy_screen;
>  	int err;
>  
>  	if (intel_info->require_force_probe &&
> @@ -1195,7 +1197,17 @@ static int i915_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
>  	if (vga_switcheroo_client_probe_defer(pdev))
>  		return -EPROBE_DEFER;
>  
> +	/*
> +	 * We do not handle -EPROBE_DEFER further into the probe process, so
> +	 * check if we have a laptop-panel privacy-screen for which the driver
> +	 * has not loaded yet here.
> +	 */
> +	privacy_screen = drm_privacy_screen_get(&pdev->dev, NULL);
> +	if (IS_ERR(privacy_screen) && PTR_ERR(privacy_screen) == -EPROBE_DEFER)
> +		return -EPROBE_DEFER;
> +
>  	err = i915_driver_probe(pdev, ent);
> +	drm_privacy_screen_put(privacy_screen);
>  	if (err)
>  		return err;

Ideally, neither i915_pci_probe() nor i915_driver_probe() should assume
we have display. We might not. We should not wait if we are never going
to initialize display.

Alas, we'll only know after i915_driver_probe() ->
i915_driver_mmio_probe() -> intel_device_info_runtime_init(), which
modifies ->pipe_mask, which is the single point of truth. See
HAS_DISPLAY().

We do have tests for failing probe at various points (see the
i915_inject_probe_failure() calls) to stress the cleanup paths in
CI. Part of the point was to prepare us for -EPROBE_DEFER returns.

Looks like the earliest/cleanest point for checking this is in
intel_modeset_init_noirq(), i.e. first display init call. But I admit it
gives me an uneasy feeling to return -EPROBE_DEFER at that stage. The
only -EPROBE_DEFER return we currently have is the vga switcheroo stuff
you see in the patch context, and most platforms never return that.

Ville, I'd like to get your thoughts on that.

Anyway, even if we decide not to, err, defer returning -EPROBE_DEFER, I
think we should abstract this better. For example, add a
intel_modeset_probe_defer() function in intel_display.c that checks
this, and call that as the first thing in i915_driver_probe(). Just to
keep the display specific code out of the high level functions, even if
that is functionally the same as what you're doing here.

BR,
Jani.



-- 
Jani Nikula, Intel Open Source Graphics Center
