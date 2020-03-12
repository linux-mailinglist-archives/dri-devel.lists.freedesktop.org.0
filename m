Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 77084182AE0
	for <lists+dri-devel@lfdr.de>; Thu, 12 Mar 2020 09:11:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 39D0E6EA88;
	Thu, 12 Mar 2020 08:08:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x449.google.com (mail-pf1-x449.google.com
 [IPv6:2607:f8b0:4864:20::449])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 03C286EA04
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Mar 2020 00:57:41 +0000 (UTC)
Received: by mail-pf1-x449.google.com with SMTP id c17so2607561pfi.20
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Mar 2020 17:57:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc; bh=hrX565yTBVUaBRHBANP/oUW6tx77j7n+/fB0WrNdRuo=;
 b=mmGkCmqF1t4vIGKl1vxRmYa4Iw9gw+m0F2Rl36GDX5iFly8hLcreI4jW1JM0aj9fke
 mEhYDzVhpOaAmixqSzg4Zm5LcbvnOrul+h7AKhTqr9vwmuCxeJ2hQ6GiB7gc7kWUHvWH
 B1bfDHrvt/E9HTfMP0pIbWBLiFG9MjkavH0Otsac92H+MB+4jaFXYn7fzfii6HNUyEP9
 LoaEAooybbbw4wOPB1wo2ldXZ2cMJX2PtI9ACfh7AzN+OehezA9MI68uW7Y5jVc6czVo
 mle4uCa7o5PzON+Fe+JJ9FApEx33Sw+Z31PPH7UTQaaVSJQoZXojHjMc4kixdB5/w0cq
 T5/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=hrX565yTBVUaBRHBANP/oUW6tx77j7n+/fB0WrNdRuo=;
 b=r54bNAhi4CqBipsPk2l7pjv+m1YF5nnVNQxA60lQPmdejfrjdiuaFpSoNGIb4uJfNe
 MUHAzGNqEiDEFgUA9jY/ogSekT+UjgFOI/oAnVOWnlufZzSJqb7rh51ej9tiCO1Nrz/X
 cpS/zLbErAA0EoqQ0YgXIjJgJ+TrTKXRjyUra75kLKtm+DHyNTwfpGxWOD6fNFa0rRgY
 PJ5aRQWd75xxzHRhuF/K+cINZklcuy28v6WTAGK+dcL+CCYDaxDLV5zpLYxVYS6xpO4Q
 eZFOHlkdMzuP8nEryHc52PSrS2nNGJawI4uYpz310jPJKOAjAkj9NpZx5qmiZ6V9bsEj
 FfLg==
X-Gm-Message-State: ANhLgQ16n9XDu9nUr/X09ztU5eJ5P2s7/k8b+U1B8qit0xs638+MnBQ6
 8rOeRC6EGFIE/AbrE6k7e2bs7PBzPu25
X-Google-Smtp-Source: ADFU+vvwh7TxtyhUhqTq0JD2HSw6HCRI/lZYTYLR36CPZC7RY1ZRfZmp0+bpIdsz6npDN4qgr1AMMVBexP3l
X-Received: by 2002:a17:90a:2103:: with SMTP id
 a3mr1404774pje.181.1583974660505; 
 Wed, 11 Mar 2020 17:57:40 -0700 (PDT)
Date: Wed, 11 Mar 2020 17:57:22 -0700
In-Reply-To: <20200312005722.48803-1-rajatja@google.com>
Message-Id: <20200312005722.48803-6-rajatja@google.com>
Mime-Version: 1.0
References: <20200312005722.48803-1-rajatja@google.com>
X-Mailer: git-send-email 2.25.1.481.gfbce0eb801-goog
Subject: [PATCH v8 5/5] drm/i915: Enable support for integrated privacy screen
From: Rajat Jain <rajatja@google.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, 
 Jani Nikula <jani.nikula@linux.intel.com>, 
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, 
 "=?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?=" <ville.syrjala@linux.intel.com>,
 Chris Wilson <chris@chris-wilson.co.uk>, Imre Deak <imre.deak@intel.com>, 
 "=?UTF-8?q?Jos=C3=A9=20Roberto=20de=20Souza?=" <jose.souza@intel.com>,
 linux-kernel@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org, 
 gregkh@linuxfoundation.org, mathewk@google.com, 
 Daniel Thompson <daniel.thompson@linaro.org>, Jonathan Corbet <corbet@lwn.net>,
 Pavel Machek <pavel@denx.de>, seanpaul@google.com,
 Duncan Laurie <dlaurie@google.com>, 
 jsbarnes@google.com, Thierry Reding <thierry.reding@gmail.com>,
 mpearson@lenovo.com, Nitin Joshi1 <njoshi1@lenovo.com>,
 Sugumaran Lacshiminarayanan <slacshiminar@lenovo.com>, 
 Tomoki Maruichi <maruichit@lenovo.com>
X-Mailman-Approved-At: Thu, 12 Mar 2020 08:08:13 +0000
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
Cc: Rajat Jain <rajatja@google.com>, rajatxjain@gmail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add support for an ACPI based integrated privacy screen that is
available on some systems.

Signed-off-by: Rajat Jain <rajatja@google.com>
---
v8: - separate the APCI privacy screen into a separate patch.
    - Don't destroy the property if there is no privacy screen (because
      drm core doesn't like destroying property in late_register()).
    - The setting change needs to be committed in ->update_pipe() for 
      ddi.c as well as dp.c and both of them call intel_dp_add_properties()
v7: Look for ACPI node in ->late_register() hook.
    Do the scan only once per drm_device (instead of 1 per drm_connector)
v6: Addressed minor comments from Jani at
    https://lkml.org/lkml/2020/1/24/1143
     - local variable renamed.
     - used drm_dbg_kms()
     - used acpi_device_handle()
     - Used opaque type acpi_handle instead of void*
v5: same as v4
v4: Same as v3
v3: fold the code into existing acpi_device_id_update() function
v2: formed by splitting the original patch into ACPI lookup, and privacy
    screen property. Also move it into i915 now that I found existing code
    in i915 that can be re-used.

 drivers/gpu/drm/i915/display/intel_atomic.c |  2 ++
 drivers/gpu/drm/i915/display/intel_ddi.c    |  1 +
 drivers/gpu/drm/i915/display/intel_dp.c     | 34 ++++++++++++++++++++-
 drivers/gpu/drm/i915/display/intel_dp.h     |  5 +++
 4 files changed, 41 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/display/intel_atomic.c b/drivers/gpu/drm/i915/display/intel_atomic.c
index d043057d2fa03..9898d8980e7ce 100644
--- a/drivers/gpu/drm/i915/display/intel_atomic.c
+++ b/drivers/gpu/drm/i915/display/intel_atomic.c
@@ -150,6 +150,8 @@ int intel_digital_connector_atomic_check(struct drm_connector *conn,
 	    new_conn_state->base.picture_aspect_ratio != old_conn_state->base.picture_aspect_ratio ||
 	    new_conn_state->base.content_type != old_conn_state->base.content_type ||
 	    new_conn_state->base.scaling_mode != old_conn_state->base.scaling_mode ||
+	    new_conn_state->base.privacy_screen_status !=
+		old_conn_state->base.privacy_screen_status ||
 	    !blob_equal(new_conn_state->base.hdr_output_metadata,
 			old_conn_state->base.hdr_output_metadata))
 		crtc_state->mode_changed = true;
diff --git a/drivers/gpu/drm/i915/display/intel_ddi.c b/drivers/gpu/drm/i915/display/intel_ddi.c
index 73d0f4648c06a..69a5423216dc5 100644
--- a/drivers/gpu/drm/i915/display/intel_ddi.c
+++ b/drivers/gpu/drm/i915/display/intel_ddi.c
@@ -3708,6 +3708,7 @@ static void intel_ddi_update_pipe(struct intel_encoder *encoder,
 	if (!intel_crtc_has_type(crtc_state, INTEL_OUTPUT_HDMI))
 		intel_ddi_update_pipe_dp(encoder, crtc_state, conn_state);
 
+	intel_dp_update_privacy_screen(encoder, crtc_state, conn_state);
 	intel_hdcp_update_pipe(encoder, crtc_state, conn_state);
 }
 
diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
index 3ddc424b028c1..5f33ebb466135 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.c
+++ b/drivers/gpu/drm/i915/display/intel_dp.c
@@ -62,6 +62,7 @@
 #include "intel_lspcon.h"
 #include "intel_lvds.h"
 #include "intel_panel.h"
+#include "intel_privacy_screen.h"
 #include "intel_psr.h"
 #include "intel_sideband.h"
 #include "intel_tc.h"
@@ -5886,6 +5887,10 @@ intel_dp_connector_register(struct drm_connector *connector)
 		dev_priv->acpi_scan_done = true;
 	}
 
+	/* Check for integrated Privacy screen support */
+	if (intel_privacy_screen_present(to_intel_connector(connector)))
+		drm_connector_attach_privacy_screen_property(connector);
+
 	DRM_DEBUG_KMS("registering %s bus for %s\n",
 		      intel_dp->aux.name, connector->kdev->kobj.name);
 
@@ -6883,6 +6888,33 @@ intel_dp_add_properties(struct intel_dp *intel_dp, struct drm_connector *connect
 		connector->state->scaling_mode = DRM_MODE_SCALE_ASPECT;
 
 	}
+
+	/*
+	 * Created here, but depending on result of probing for privacy-screen
+	 * in intel_dp_connector_register(), gets attached in that function.
+	 * Need to create here because the drm core doesn't like creating
+	 * properties during ->late_register().
+	 */
+	drm_connector_create_privacy_screen_property(connector);
+}
+
+void
+intel_dp_update_privacy_screen(struct intel_encoder *encoder,
+			       const struct intel_crtc_state *crtc_state,
+			       const struct drm_connector_state *conn_state)
+{
+	struct drm_connector *connector = conn_state->connector;
+
+	intel_privacy_screen_set_val(to_intel_connector(connector),
+				     conn_state->privacy_screen_status);
+}
+
+static void intel_dp_update_pipe(struct intel_encoder *encoder,
+				 const struct intel_crtc_state *crtc_state,
+				 const struct drm_connector_state *conn_state)
+{
+	intel_dp_update_privacy_screen(encoder, crtc_state, conn_state);
+	intel_panel_update_backlight(encoder, crtc_state, conn_state);
 }
 
 static void intel_dp_init_panel_power_timestamps(struct intel_dp *intel_dp)
@@ -7826,7 +7858,7 @@ bool intel_dp_init(struct drm_i915_private *dev_priv,
 	intel_encoder->compute_config = intel_dp_compute_config;
 	intel_encoder->get_hw_state = intel_dp_get_hw_state;
 	intel_encoder->get_config = intel_dp_get_config;
-	intel_encoder->update_pipe = intel_panel_update_backlight;
+	intel_encoder->update_pipe = intel_dp_update_pipe;
 	intel_encoder->suspend = intel_dp_encoder_suspend;
 	if (IS_CHERRYVIEW(dev_priv)) {
 		intel_encoder->pre_pll_enable = chv_dp_pre_pll_enable;
diff --git a/drivers/gpu/drm/i915/display/intel_dp.h b/drivers/gpu/drm/i915/display/intel_dp.h
index 0c7be8ed1423a..e4594e27ce5a8 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.h
+++ b/drivers/gpu/drm/i915/display/intel_dp.h
@@ -123,4 +123,9 @@ static inline unsigned int intel_dp_unused_lane_mask(int lane_count)
 
 u32 intel_dp_mode_to_fec_clock(u32 mode_clock);
 
+void
+intel_dp_update_privacy_screen(struct intel_encoder *encoder,
+			       const struct intel_crtc_state *crtc_state,
+			       const struct drm_connector_state *conn_state);
+
 #endif /* __INTEL_DP_H__ */
-- 
2.25.1.481.gfbce0eb801-goog

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
