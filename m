Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 556BD3B85F4
	for <lists+dri-devel@lfdr.de>; Wed, 30 Jun 2021 17:10:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 69AC76EA25;
	Wed, 30 Jun 2021 15:10:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from srv6.fidu.org (srv6.fidu.org [159.69.62.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A89746EA0D;
 Wed, 30 Jun 2021 15:10:27 +0000 (UTC)
Received: from localhost (localhost.localdomain [127.0.0.1])
 by srv6.fidu.org (Postfix) with ESMTP id 6AB12C8008E;
 Wed, 30 Jun 2021 17:10:25 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at srv6.fidu.org
Received: from srv6.fidu.org ([127.0.0.1])
 by localhost (srv6.fidu.org [127.0.0.1]) (amavisd-new, port 10026)
 with LMTP id kQ9gjtW9gTyQ; Wed, 30 Jun 2021 17:10:25 +0200 (CEST)
Received: from wsembach-tuxedo.fritz.box
 (p200300e37F394900095779a208783f8e.dip0.t-ipconnect.de
 [IPv6:2003:e3:7f39:4900:957:79a2:878:3f8e])
 (Authenticated sender: wse@tuxedocomputers.com)
 by srv6.fidu.org (Postfix) with ESMTPA id 075E1C8008D;
 Wed, 30 Jun 2021 17:10:25 +0200 (CEST)
From: Werner Sembach <wse@tuxedocomputers.com>
To: harry.wentland@amd.com, sunpeng.li@amd.com, alexander.deucher@amd.com,
 christian.koenig@amd.com, airlied@linux.ie, daniel@ffwll.ch,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 jani.nikula@linux.intel.com, joonas.lahtinen@linux.intel.com,
 rodrigo.vivi@intel.com, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, emil.l.velikov@gmail.com
Subject: [PATCH v5 05/17] drm/i915/display: Add handling for new "active bpc"
 property
Date: Wed, 30 Jun 2021 17:10:06 +0200
Message-Id: <20210630151018.330354-6-wse@tuxedocomputers.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210630151018.330354-1-wse@tuxedocomputers.com>
References: <20210630151018.330354-1-wse@tuxedocomputers.com>
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

This commit implements the "active bpc" drm property for the Intel GPU
driver.

Signed-off-by: Werner Sembach <wse@tuxedocomputers.com>
---
 drivers/gpu/drm/i915/display/intel_display.c | 19 +++++++++++++++++++
 drivers/gpu/drm/i915/display/intel_dp.c      |  7 +++++--
 drivers/gpu/drm/i915/display/intel_dp_mst.c  |  5 +++++
 drivers/gpu/drm/i915/display/intel_hdmi.c    |  4 +++-
 4 files changed, 32 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/drm/i915/display/intel_display.c
index 6be1b31af07b..1b63d1404d06 100644
--- a/drivers/gpu/drm/i915/display/intel_display.c
+++ b/drivers/gpu/drm/i915/display/intel_display.c
@@ -10839,6 +10839,9 @@ static int intel_atomic_commit(struct drm_device *dev,
 {
 	struct intel_atomic_state *state = to_intel_atomic_state(_state);
 	struct drm_i915_private *dev_priv = to_i915(dev);
+	struct drm_connector *connector;
+	struct drm_connector_state *new_conn_state;
+	int i;
 	int ret = 0;
 
 	state->wakeref = intel_runtime_pm_get(&dev_priv->runtime_pm);
@@ -10907,6 +10910,22 @@ static int intel_atomic_commit(struct drm_device *dev,
 	intel_shared_dpll_swap_state(state);
 	intel_atomic_track_fbs(state);
 
+	/* Extract information from crtc to communicate it to userspace as connector properties */
+	for_each_new_connector_in_state(&state->base, connector, new_conn_state, i) {
+		struct intel_crtc *crtc = to_intel_crtc(new_conn_state->crtc);
+
+		if (crtc) {
+			struct intel_crtc_state *new_crtc_state =
+				intel_atomic_get_new_crtc_state(state, crtc);
+
+			drm_connector_set_active_bpc_property(connector,
+				new_crtc_state->dsc.compression_enable ?
+					new_crtc_state->dsc.compressed_bpp / 3 :
+					new_crtc_state->pipe_bpp / 3);
+		} else
+			drm_connector_set_active_bpc_property(connector, 0);
+	}
+
 	drm_atomic_state_get(&state->base);
 	INIT_WORK(&state->base.commit_work, intel_atomic_commit_work);
 
diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
index 6cc03b9e4321..815bc313b954 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.c
+++ b/drivers/gpu/drm/i915/display/intel_dp.c
@@ -4688,10 +4688,13 @@ intel_dp_add_properties(struct intel_dp *intel_dp, struct drm_connector *connect
 		intel_attach_force_audio_property(connector);
 
 	intel_attach_broadcast_rgb_property(connector);
-	if (HAS_GMCH(dev_priv))
+	if (HAS_GMCH(dev_priv)) {
 		drm_connector_attach_max_bpc_property(connector, 6, 10);
-	else if (DISPLAY_VER(dev_priv) >= 5)
+		drm_connector_attach_active_bpc_property(connector, 6, 10);
+	} else if (DISPLAY_VER(dev_priv) >= 5) {
 		drm_connector_attach_max_bpc_property(connector, 6, 12);
+		drm_connector_attach_active_bpc_property(connector, 6, 12);
+	}
 
 	/* Register HDMI colorspace for case of lspcon */
 	if (intel_bios_is_lspcon_present(dev_priv, port)) {
diff --git a/drivers/gpu/drm/i915/display/intel_dp_mst.c b/drivers/gpu/drm/i915/display/intel_dp_mst.c
index b170e272bdee..16bfc59570a5 100644
--- a/drivers/gpu/drm/i915/display/intel_dp_mst.c
+++ b/drivers/gpu/drm/i915/display/intel_dp_mst.c
@@ -851,6 +851,11 @@ static struct drm_connector *intel_dp_add_mst_connector(struct drm_dp_mst_topolo
 	if (connector->max_bpc_property)
 		drm_connector_attach_max_bpc_property(connector, 6, 12);
 
+	connector->active_bpc_property =
+		intel_dp->attached_connector->base.active_bpc_property;
+	if (connector->active_bpc_property)
+		drm_connector_attach_active_bpc_property(connector, 6, 12);
+
 	return connector;
 
 err:
diff --git a/drivers/gpu/drm/i915/display/intel_hdmi.c b/drivers/gpu/drm/i915/display/intel_hdmi.c
index 7e51c98c475e..9160e21ac9d6 100644
--- a/drivers/gpu/drm/i915/display/intel_hdmi.c
+++ b/drivers/gpu/drm/i915/display/intel_hdmi.c
@@ -2513,8 +2513,10 @@ intel_hdmi_add_properties(struct intel_hdmi *intel_hdmi, struct drm_connector *c
 	if (DISPLAY_VER(dev_priv) >= 10)
 		drm_connector_attach_hdr_output_metadata_property(connector);
 
-	if (!HAS_GMCH(dev_priv))
+	if (!HAS_GMCH(dev_priv)) {
 		drm_connector_attach_max_bpc_property(connector, 8, 12);
+		drm_connector_attach_active_bpc_property(connector, 8, 12);
+	}
 }
 
 /*
-- 
2.25.1

