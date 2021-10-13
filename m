Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AD5EB42CD2A
	for <lists+dri-devel@lfdr.de>; Wed, 13 Oct 2021 23:59:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 84DDB6EBAC;
	Wed, 13 Oct 2021 21:59:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 197B56EBAC;
 Wed, 13 Oct 2021 21:59:45 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10136"; a="250976025"
X-IronPort-AV: E=Sophos;i="5.85,371,1624345200"; d="scan'208";a="250976025"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2021 14:59:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.85,371,1624345200"; d="scan'208";a="571020214"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.171])
 by fmsmga002.fm.intel.com with SMTP; 13 Oct 2021 14:59:38 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Thu, 14 Oct 2021 00:59:37 +0300
Date: Thu, 14 Oct 2021 00:59:37 +0300
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
Subject: Re: [PATCH 10/10] drm/i915: Add privacy-screen support (v3)
Message-ID: <YWdWyTVXMA3907no@intel.com>
References: <20211005202322.700909-1-hdegoede@redhat.com>
 <20211005202322.700909-11-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20211005202322.700909-11-hdegoede@redhat.com>
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

On Tue, Oct 05, 2021 at 10:23:22PM +0200, Hans de Goede wrote:
> Add support for eDP panels with a built-in privacy screen using the
> new drm_privacy_screen class.
> 
> Changes in v3:
> - Move drm_privacy_screen_get() call to intel_ddi_init_dp_connector()
> 
> Changes in v2:
> - Call drm_connector_update_privacy_screen() from
>   intel_enable_ddi_dp() / intel_ddi_update_pipe_dp() instead of adding a
>   for_each_new_connector_in_state() loop to intel_atomic_commit_tail()
> - Move the probe-deferral check to the intel_modeset_probe_defer() helper
> 
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> ---
>  drivers/gpu/drm/i915/display/intel_atomic.c  |  1 +
>  drivers/gpu/drm/i915/display/intel_ddi.c     | 16 ++++++++++++++++
>  drivers/gpu/drm/i915/display/intel_display.c | 10 ++++++++++
>  3 files changed, 27 insertions(+)
> 
> diff --git a/drivers/gpu/drm/i915/display/intel_atomic.c b/drivers/gpu/drm/i915/display/intel_atomic.c
> index b4e7ac51aa31..a62550711e98 100644
> --- a/drivers/gpu/drm/i915/display/intel_atomic.c
> +++ b/drivers/gpu/drm/i915/display/intel_atomic.c
> @@ -139,6 +139,7 @@ int intel_digital_connector_atomic_check(struct drm_connector *conn,
>  	    new_conn_state->base.picture_aspect_ratio != old_conn_state->base.picture_aspect_ratio ||
>  	    new_conn_state->base.content_type != old_conn_state->base.content_type ||
>  	    new_conn_state->base.scaling_mode != old_conn_state->base.scaling_mode ||
> +	    new_conn_state->base.privacy_screen_sw_state != old_conn_state->base.privacy_screen_sw_state ||
>  	    !drm_connector_atomic_hdr_metadata_equal(old_state, new_state))
>  		crtc_state->mode_changed = true;
>  
> diff --git a/drivers/gpu/drm/i915/display/intel_ddi.c b/drivers/gpu/drm/i915/display/intel_ddi.c
> index 0d4cf7fa8720..272714e07cc6 100644
> --- a/drivers/gpu/drm/i915/display/intel_ddi.c
> +++ b/drivers/gpu/drm/i915/display/intel_ddi.c
> @@ -25,6 +25,7 @@
>   *
>   */
>  
> +#include <drm/drm_privacy_screen_consumer.h>
>  #include <drm/drm_scdc_helper.h>
>  
>  #include "i915_drv.h"
> @@ -2946,6 +2947,7 @@ static void intel_enable_ddi_dp(struct intel_atomic_state *state,
>  	if (port == PORT_A && DISPLAY_VER(dev_priv) < 9)
>  		intel_dp_stop_link_train(intel_dp, crtc_state);
>  
> +	drm_connector_update_privacy_screen(conn_state);
>  	intel_edp_backlight_on(crtc_state, conn_state);
>  
>  	if (!dig_port->lspcon.active || dig_port->dp.has_hdmi_sink)
> @@ -3161,6 +3163,7 @@ static void intel_ddi_update_pipe_dp(struct intel_atomic_state *state,
>  	intel_drrs_update(intel_dp, crtc_state);
>  
>  	intel_backlight_update(state, encoder, crtc_state, conn_state);
> +	drm_connector_update_privacy_screen(conn_state);
>  }
>  
>  void intel_ddi_update_pipe(struct intel_atomic_state *state,
> @@ -3979,6 +3982,19 @@ intel_ddi_init_dp_connector(struct intel_digital_port *dig_port)
>  		return NULL;
>  	}
>  
> +	if (dig_port->base.type == INTEL_OUTPUT_EDP) {

Connector type check would be a bit more consistent with what this is
about I think. But there's is 1:1 correspondence with the encoder type
for eDP so not a particularly important point.

Reviewed-by: Ville Syrjälä <ville.syrjala@linux.intel.com>

> +		struct drm_device *dev = dig_port->base.base.dev;
> +		struct drm_privacy_screen *privacy_screen;
> +
> +		privacy_screen = drm_privacy_screen_get(dev->dev, NULL);
> +		if (!IS_ERR(privacy_screen)) {
> +			drm_connector_attach_privacy_screen_provider(&connector->base,
> +								     privacy_screen);
> +		} else if (PTR_ERR(privacy_screen) != -ENODEV) {
> +			drm_warn(dev, "Error getting privacy-screen\n");
> +		}
> +	}
> +
>  	return connector;
>  }
>  
> diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/drm/i915/display/intel_display.c
> index 86dbe366a907..84715a779d9d 100644
> --- a/drivers/gpu/drm/i915/display/intel_display.c
> +++ b/drivers/gpu/drm/i915/display/intel_display.c
> @@ -42,6 +42,7 @@
>  #include <drm/drm_edid.h>
>  #include <drm/drm_fourcc.h>
>  #include <drm/drm_plane_helper.h>
> +#include <drm/drm_privacy_screen_consumer.h>
>  #include <drm/drm_probe_helper.h>
>  #include <drm/drm_rect.h>
>  
> @@ -12769,6 +12770,8 @@ void intel_modeset_driver_remove_nogem(struct drm_i915_private *i915)
>  
>  bool intel_modeset_probe_defer(struct pci_dev *pdev)
>  {
> +	struct drm_privacy_screen *privacy_screen;
> +
>  	/*
>  	 * apple-gmux is needed on dual GPU MacBook Pro
>  	 * to probe the panel if we're the inactive GPU.
> @@ -12776,6 +12779,13 @@ bool intel_modeset_probe_defer(struct pci_dev *pdev)
>  	if (vga_switcheroo_client_probe_defer(pdev))
>  		return true;
>  
> +	/* If the LCD panel has a privacy-screen, wait for it */
> +	privacy_screen = drm_privacy_screen_get(&pdev->dev, NULL);
> +	if (IS_ERR(privacy_screen) && PTR_ERR(privacy_screen) == -EPROBE_DEFER)
> +		return true;
> +
> +	drm_privacy_screen_put(privacy_screen);
> +
>  	return false;
>  }
>  
> -- 
> 2.31.1

-- 
Ville Syrjälä
Intel
