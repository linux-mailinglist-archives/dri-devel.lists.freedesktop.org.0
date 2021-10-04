Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 07ADD42175E
	for <lists+dri-devel@lfdr.de>; Mon,  4 Oct 2021 21:23:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 81D506E1F9;
	Mon,  4 Oct 2021 19:23:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A945F6E1F9;
 Mon,  4 Oct 2021 19:23:04 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10127"; a="205677048"
X-IronPort-AV: E=Sophos;i="5.85,346,1624345200"; d="scan'208";a="205677048"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Oct 2021 11:48:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.85,346,1624345200"; d="scan'208";a="457763836"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.171])
 by orsmga002.jf.intel.com with SMTP; 04 Oct 2021 11:48:26 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Mon, 04 Oct 2021 21:48:25 +0300
Date: Mon, 4 Oct 2021 21:48:25 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Hans de Goede <hdegoede@redhat.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rajat Jain <rajatja@google.com>,
 Jani Nikula <jani.nikula@linux.intel.com>, Lyude <lyude@redhat.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Mark Gross <markgross@kernel.org>,
 Andy Shevchenko <andy@infradead.org>,
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@linux.ie>,
 Pekka Paalanen <pekka.paalanen@collabora.com>,
 Mario Limonciello <mario.limonciello@outlook.com>,
 Mark Pearson <markpearson@lenovo.com>,
 Sebastien Bacher <seb128@ubuntu.com>,
 Marco Trevisan <marco.trevisan@canonical.com>,
 Emil Velikov <emil.l.velikov@gmail.com>,
 intel-gfx <intel-gfx@lists.freedesktop.org>,
 dri-devel@lists.freedesktop.org, platform-driver-x86@vger.kernel.org
Subject: Re: [PATCH 10/10] drm/i915: Add privacy-screen support (v2)
Message-ID: <YVtMeYqDAuGLRCTi@intel.com>
References: <20211002163618.99175-1-hdegoede@redhat.com>
 <20211002163618.99175-11-hdegoede@redhat.com>
 <YVsfwmQjYOnIrxzl@intel.com>
 <ac1b7f4a-42f6-5f07-9733-e8945fb65179@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ac1b7f4a-42f6-5f07-9733-e8945fb65179@redhat.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Oct 04, 2021 at 06:02:21PM +0200, Hans de Goede wrote:
> Hi,
> 
> On 10/4/21 5:37 PM, Ville Syrjälä wrote:
> > On Sat, Oct 02, 2021 at 06:36:18PM +0200, Hans de Goede wrote:
> >> Add support for eDP panels with a built-in privacy screen using the
> >> new drm_privacy_screen class.
> >>
> >> Changes in v2:
> >> - Call drm_connector_update_privacy_screen() from
> >>   intel_enable_ddi_dp() / intel_ddi_update_pipe_dp() instead of adding a
> >>   for_each_new_connector_in_state() loop to intel_atomic_commit_tail()
> >> - Move the probe-deferral check to the intel_modeset_probe_defer() helper
> >>
> >> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> >> ---
> >>  drivers/gpu/drm/i915/display/intel_atomic.c  |  1 +
> >>  drivers/gpu/drm/i915/display/intel_ddi.c     |  3 +++
> >>  drivers/gpu/drm/i915/display/intel_display.c | 10 ++++++++++
> >>  drivers/gpu/drm/i915/display/intel_dp.c      | 10 ++++++++++
> >>  4 files changed, 24 insertions(+)
> >>
> >> diff --git a/drivers/gpu/drm/i915/display/intel_atomic.c b/drivers/gpu/drm/i915/display/intel_atomic.c
> >> index b4e7ac51aa31..a62550711e98 100644
> >> --- a/drivers/gpu/drm/i915/display/intel_atomic.c
> >> +++ b/drivers/gpu/drm/i915/display/intel_atomic.c
> >> @@ -139,6 +139,7 @@ int intel_digital_connector_atomic_check(struct drm_connector *conn,
> >>  	    new_conn_state->base.picture_aspect_ratio != old_conn_state->base.picture_aspect_ratio ||
> >>  	    new_conn_state->base.content_type != old_conn_state->base.content_type ||
> >>  	    new_conn_state->base.scaling_mode != old_conn_state->base.scaling_mode ||
> >> +	    new_conn_state->base.privacy_screen_sw_state != old_conn_state->base.privacy_screen_sw_state ||
> >>  	    !drm_connector_atomic_hdr_metadata_equal(old_state, new_state))
> >>  		crtc_state->mode_changed = true;
> >>  
> >> diff --git a/drivers/gpu/drm/i915/display/intel_ddi.c b/drivers/gpu/drm/i915/display/intel_ddi.c
> >> index 51cd0420e00e..e4496c830a35 100644
> >> --- a/drivers/gpu/drm/i915/display/intel_ddi.c
> >> +++ b/drivers/gpu/drm/i915/display/intel_ddi.c
> >> @@ -25,6 +25,7 @@
> >>   *
> >>   */
> >>  
> >> +#include <drm/drm_privacy_screen_consumer.h>
> >>  #include <drm/drm_scdc_helper.h>
> >>  
> >>  #include "i915_drv.h"
> >> @@ -3022,6 +3023,7 @@ static void intel_enable_ddi_dp(struct intel_atomic_state *state,
> >>  	if (port == PORT_A && DISPLAY_VER(dev_priv) < 9)
> >>  		intel_dp_stop_link_train(intel_dp, crtc_state);
> >>  
> >> +	drm_connector_update_privacy_screen(conn_state);
> >>  	intel_edp_backlight_on(crtc_state, conn_state);
> >>  
> >>  	if (!dig_port->lspcon.active || dig_port->dp.has_hdmi_sink)
> >> @@ -3247,6 +3249,7 @@ static void intel_ddi_update_pipe_dp(struct intel_atomic_state *state,
> >>  	intel_drrs_update(intel_dp, crtc_state);
> >>  
> >>  	intel_backlight_update(state, encoder, crtc_state, conn_state);
> >> +	drm_connector_update_privacy_screen(conn_state);
> >>  }
> >>  
> >>  void intel_ddi_update_pipe(struct intel_atomic_state *state,
> >> diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/drm/i915/display/intel_display.c
> >> index e67f3207ba54..9a5dbe51458d 100644
> >> --- a/drivers/gpu/drm/i915/display/intel_display.c
> >> +++ b/drivers/gpu/drm/i915/display/intel_display.c
> >> @@ -42,6 +42,7 @@
> >>  #include <drm/drm_edid.h>
> >>  #include <drm/drm_fourcc.h>
> >>  #include <drm/drm_plane_helper.h>
> >> +#include <drm/drm_privacy_screen_consumer.h>
> >>  #include <drm/drm_probe_helper.h>
> >>  #include <drm/drm_rect.h>
> >>  #include <drm/drm_drv.h>
> >> @@ -12693,6 +12694,8 @@ void intel_modeset_driver_remove_nogem(struct drm_i915_private *i915)
> >>  
> >>  bool intel_modeset_probe_defer(struct pci_dev *pdev)
> >>  {
> >> +	struct drm_privacy_screen *privacy_screen;
> >> +
> >>  	/*
> >>  	 * apple-gmux is needed on dual GPU MacBook Pro
> >>  	 * to probe the panel if we're the inactive GPU.
> >> @@ -12700,6 +12703,13 @@ bool intel_modeset_probe_defer(struct pci_dev *pdev)
> >>  	if (vga_switcheroo_client_probe_defer(pdev))
> >>  		return true;
> >>  
> >> +	/* If the LCD panel has a privacy-screen, wait for it */
> >> +	privacy_screen = drm_privacy_screen_get(&pdev->dev, NULL);
> >> +	if (IS_ERR(privacy_screen) && PTR_ERR(privacy_screen) == -EPROBE_DEFER)
> >> +		return true;
> >> +
> >> +	drm_privacy_screen_put(privacy_screen);
> >> +
> >>  	return false;
> >>  }
> >>  
> >> diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
> >> index 74a657ae131a..91207310dc0d 100644
> >> --- a/drivers/gpu/drm/i915/display/intel_dp.c
> >> +++ b/drivers/gpu/drm/i915/display/intel_dp.c
> >> @@ -37,6 +37,7 @@
> >>  #include <drm/drm_crtc.h>
> >>  #include <drm/drm_dp_helper.h>
> >>  #include <drm/drm_edid.h>
> >> +#include <drm/drm_privacy_screen_consumer.h>
> >>  #include <drm/drm_probe_helper.h>
> >>  
> >>  #include "g4x_dp.h"
> >> @@ -4808,6 +4809,7 @@ static bool intel_edp_init_connector(struct intel_dp *intel_dp,
> >>  	struct drm_connector *connector = &intel_connector->base;
> >>  	struct drm_display_mode *fixed_mode = NULL;
> >>  	struct drm_display_mode *downclock_mode = NULL;
> >> +	struct drm_privacy_screen *privacy_screen;
> >>  	bool has_dpcd;
> >>  	enum pipe pipe = INVALID_PIPE;
> >>  	struct edid *edid;
> >> @@ -4902,6 +4904,14 @@ static bool intel_edp_init_connector(struct intel_dp *intel_dp,
> >>  				fixed_mode->hdisplay, fixed_mode->vdisplay);
> >>  	}
> >>  
> >> +	privacy_screen = drm_privacy_screen_get(dev->dev, NULL);
> >> +	if (!IS_ERR(privacy_screen)) {
> >> +		drm_connector_attach_privacy_screen_provider(connector,
> >> +							     privacy_screen);
> >> +	} else if (PTR_ERR(privacy_screen) != -ENODEV) {
> >> +		drm_warn(&dev_priv->drm, "Error getting privacy-screen\n");
> >> +	}
> > 
> > I'm thinking this should go into intel_ddi_init_dp_connector()
> > on account of only the ddi codepaths having the
> > drm_connector_update_privacy_screen() calls.
> 
> This should only be done in case of intel_dp_is_edp(intel_dp) returning
> true. We don't have a mapping which connector has the privacy screen
> (hence the NULL argument as second parameter to drm_privacy_screen_get()),
> so if there are multiple DP connectors we want this to only happen on
> the eDP one.
> 
> Yes this assumes that devices with a builtin privacy-screen have only
> one eDP connector. For now this holds true, if this becomes not true in
> the future then that is something to figure out at that point in time
> (with a lot of luck the privacy-screen will be controlled through DP
> by then and not through some random ACPI interface).
> 
> So I traced the call-graph and I see that we can also end up in
> intel_edp_init_connector() from g4x_dp_init(), which I assume is
> your main reason for requesting this change. But unless someone
> retro-fits an electronic privacy-screen to the old hw supported
> by g4x_dp_init() then drm_privacy_screen_get() will always
> return -ENODEV, so in that case this is a no-op.
> 
> > Otherwise seems ok.
> 
> Thanks, note if you still want me to move this please let me know,
> this does mean adding a intel_dp_is_edp() check to intel_ddi.c
> which so far is free of these kinda checks.

Yeah I think less confusing there with a check. And I'd probably
check the connector type rather than the encoder type. Otherwise
I suspect a year from now I'll end up wondering what happened to
the rest of the related code when I see the thing in the common 
init function.

-- 
Ville Syrjälä
Intel
