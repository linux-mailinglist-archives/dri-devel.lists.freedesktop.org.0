Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F0C2339BE5F
	for <lists+dri-devel@lfdr.de>; Fri,  4 Jun 2021 19:17:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 250DA6F630;
	Fri,  4 Jun 2021 17:17:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from srv6.fidu.org (srv6.fidu.org [159.69.62.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2835A6F630;
 Fri,  4 Jun 2021 17:17:38 +0000 (UTC)
Received: from localhost (localhost.localdomain [127.0.0.1])
 by srv6.fidu.org (Postfix) with ESMTP id C4870C800C7;
 Fri,  4 Jun 2021 19:17:36 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at srv6.fidu.org
Received: from srv6.fidu.org ([127.0.0.1])
 by localhost (srv6.fidu.org [127.0.0.1]) (amavisd-new, port 10026)
 with LMTP id UjdKLgPEp6l6; Fri,  4 Jun 2021 19:17:36 +0200 (CEST)
Received: from wsembach-tuxedo.fritz.box
 (p200300E37f2e2a0038b625C68b541A92.dip0.t-ipconnect.de
 [IPv6:2003:e3:7f2e:2a00:38b6:25c6:8b54:1a92])
 (Authenticated sender: wse@tuxedocomputers.com)
 by srv6.fidu.org (Postfix) with ESMTPA id 6255FC800CB;
 Fri,  4 Jun 2021 19:17:36 +0200 (CEST)
From: Werner Sembach <wse@tuxedocomputers.com>
To: harry.wentland@amd.com, sunpeng.li@amd.com, alexander.deucher@amd.com,
 christian.koenig@amd.com, airlied@linux.ie, daniel@ffwll.ch,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 jani.nikula@linux.intel.com, joonas.lahtinen@linux.intel.com,
 rodrigo.vivi@intel.com, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 intel-gfx@lists.freedesktop.org
Subject: [PATCH 4/4] drm/i915/display: Add handling for new "active bpc"
 property
Date: Fri,  4 Jun 2021 19:17:23 +0200
Message-Id: <20210604171723.10276-5-wse@tuxedocomputers.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210604171723.10276-1-wse@tuxedocomputers.com>
References: <20210604171723.10276-1-wse@tuxedocomputers.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: Werner Sembach <wse@tuxedocomputers.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This commits implements the "active bpc" drm property for the Intel GPU driver.

Signed-off-by: Werner Sembach <wse@tuxedocomputers.com>
---
 drivers/gpu/drm/i915/display/intel_display.c | 13 +++++++++++++
 drivers/gpu/drm/i915/display/intel_dp.c      |  8 ++++++--
 drivers/gpu/drm/i915/display/intel_dp_mst.c  |  4 +++-
 drivers/gpu/drm/i915/display/intel_hdmi.c    |  4 +++-
 4 files changed, 25 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/drm/i915/display/intel_display.c
index 64e9107d70f7..f7898d9d7438 100644
--- a/drivers/gpu/drm/i915/display/intel_display.c
+++ b/drivers/gpu/drm/i915/display/intel_display.c
@@ -10164,6 +10164,8 @@ static void intel_atomic_commit_tail(struct intel_atomic_state *state)
 	struct drm_i915_private *dev_priv = to_i915(dev);
 	struct intel_crtc_state *new_crtc_state, *old_crtc_state;
 	struct intel_crtc *crtc;
+	struct drm_connector *connector;
+	struct drm_connector_state *new_conn_state;
 	u64 put_domains[I915_MAX_PIPES] = {};
 	intel_wakeref_t wakeref = 0;
 	int i;
@@ -10324,6 +10326,17 @@ static void intel_atomic_commit_tail(struct intel_atomic_state *state)
 	}
 	intel_runtime_pm_put(&dev_priv->runtime_pm, state->wakeref);
 
+	/* Extract information from crtc to communicate it to userspace as connector properties */
+	for_each_new_connector_in_state(&state->base, connector, new_conn_state, i) {
+		struct drm_crtc *crtc = new_conn_state->crtc;
+		if (crtc) {
+			new_crtc_state = to_intel_crtc_state(drm_atomic_get_new_crtc_state(&state->base, crtc));
+			new_conn_state->active_bpc = new_crtc_state->pipe_bpp / 3;
+		}
+		else
+			new_conn_state->active_bpc = 0;
+	}
+
 	/*
 	 * Defer the cleanup of the old state to a separate worker to not
 	 * impede the current task (userspace for blocking modesets) that
diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
index 642c60f3d9b1..67826ba976ed 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.c
+++ b/drivers/gpu/drm/i915/display/intel_dp.c
@@ -4671,10 +4671,14 @@ intel_dp_add_properties(struct intel_dp *intel_dp, struct drm_connector *connect
 		intel_attach_force_audio_property(connector);
 
 	intel_attach_broadcast_rgb_property(connector);
-	if (HAS_GMCH(dev_priv))
+	if (HAS_GMCH(dev_priv)) {
 		drm_connector_attach_max_bpc_property(connector, 6, 10);
-	else if (DISPLAY_VER(dev_priv) >= 5)
+		drm_connector_attach_active_bpc_property(connector, 6, 10);
+	}
+	else if (DISPLAY_VER(dev_priv) >= 5) {
 		drm_connector_attach_max_bpc_property(connector, 6, 12);
+		drm_connector_attach_active_bpc_property(connector, 6, 12);
+	}
 
 	/* Register HDMI colorspace for case of lspcon */
 	if (intel_bios_is_lspcon_present(dev_priv, port)) {
diff --git a/drivers/gpu/drm/i915/display/intel_dp_mst.c b/drivers/gpu/drm/i915/display/intel_dp_mst.c
index 2daa3f67791e..5a1869dc2210 100644
--- a/drivers/gpu/drm/i915/display/intel_dp_mst.c
+++ b/drivers/gpu/drm/i915/display/intel_dp_mst.c
@@ -844,8 +844,10 @@ static struct drm_connector *intel_dp_add_mst_connector(struct drm_dp_mst_topolo
 	 */
 	connector->max_bpc_property =
 		intel_dp->attached_connector->base.max_bpc_property;
-	if (connector->max_bpc_property)
+	if (connector->max_bpc_property) {
 		drm_connector_attach_max_bpc_property(connector, 6, 12);
+		drm_connector_attach_active_bpc_property(connector, 6, 12);
+	}
 
 	return connector;
 
diff --git a/drivers/gpu/drm/i915/display/intel_hdmi.c b/drivers/gpu/drm/i915/display/intel_hdmi.c
index d69f0a6dc26d..8af78b27b6ce 100644
--- a/drivers/gpu/drm/i915/display/intel_hdmi.c
+++ b/drivers/gpu/drm/i915/display/intel_hdmi.c
@@ -2463,8 +2463,10 @@ intel_hdmi_add_properties(struct intel_hdmi *intel_hdmi, struct drm_connector *c
 		drm_object_attach_property(&connector->base,
 			connector->dev->mode_config.hdr_output_metadata_property, 0);
 
-	if (!HAS_GMCH(dev_priv))
+	if (!HAS_GMCH(dev_priv)) {
 		drm_connector_attach_max_bpc_property(connector, 8, 12);
+		drm_connector_attach_active_bpc_property(connector, 8, 12);
+	}
 }
 
 /*
-- 
2.25.1

