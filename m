Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7416C125FC4
	for <lists+dri-devel@lfdr.de>; Thu, 19 Dec 2019 11:47:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7241C6EB3D;
	Thu, 19 Dec 2019 10:46:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A8F086EB1D
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Dec 2019 10:46:05 +0000 (UTC)
Received: from pendragon.bb.dnainternet.fi (81-175-216-236.bb.dnainternet.fi
 [81.175.216.236])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 63E7B11FE;
 Thu, 19 Dec 2019 11:46:01 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1576752362;
 bh=zrGdZoJfL28aSNRdr5yzbggUOi73SEFXoZUJMKX2VOM=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=SajsMFl/plff7XBrOPRhq6fQdaxcfocXxANLIC3XdESqNAATsWhdvApl7TarOfWEg
 Re7njQo9s4/0ijbrxfAJkJzN5zAM2eb3H2OvtKSENLpI8GmaUyL/PWuklPEhf42P3w
 Ls1Ky3NPq3alV+Voovpsmni4Hic57K55w8iVSI5k=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v4 30/51] drm/omap: hdmi4: Move mode set,
 enable and disable operations to bridge
Date: Thu, 19 Dec 2019 12:45:01 +0200
Message-Id: <20191219104522.9379-31-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20191219104522.9379-1-laurent.pinchart@ideasonboard.com>
References: <20191219104522.9379-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
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
Cc: Sam Ravnborg <sam@ravnborg.org>, Tomi Valkeinen <tomi.valkeinen@ti.com>,
 Sean Paul <sean@poorly.run>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 Boris Brezillon <bbrezillon@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Move the omap_dss_device .set_timings(), .enable() and .disable()
operations to the drm_bridge functions. As the drm_bridge for the HDMI
encoder is unconditionally registered and attached, those operations
will be called at the appropriate time.

The omapdss device .set_infoframe() and .set_hdmi_mode() operations have
no equivalent in drm_bridge. Thir content is thus moved to the bridge
.enable() operation as the data they store is not needed before the HDMI
encoder gets enabled.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ti.com>
---
Changes since v2:

- Detail .set_infoframe() and .set_hdmi_mode() handling in the commit
  message
---
 drivers/gpu/drm/omapdrm/dss/hdmi4.c | 201 +++++++++++++++-------------
 1 file changed, 106 insertions(+), 95 deletions(-)

diff --git a/drivers/gpu/drm/omapdrm/dss/hdmi4.c b/drivers/gpu/drm/omapdrm/dss/hdmi4.c
index 67994287447b..a5c6054158eb 100644
--- a/drivers/gpu/drm/omapdrm/dss/hdmi4.c
+++ b/drivers/gpu/drm/omapdrm/dss/hdmi4.c
@@ -28,6 +28,8 @@
 #include <sound/omap-hdmi-audio.h>
 #include <media/cec.h>
 
+#include <drm/drm_atomic.h>
+
 #include "omapdss.h"
 #include "hdmi4_core.h"
 #include "hdmi4_cec.h"
@@ -237,20 +239,6 @@ static void hdmi_power_off_full(struct omap_hdmi *hdmi)
 	hdmi_power_off_core(hdmi);
 }
 
-static void hdmi_display_set_timings(struct omap_dss_device *dssdev,
-				     const struct drm_display_mode *mode)
-{
-	struct omap_hdmi *hdmi = dssdev_to_hdmi(dssdev);
-
-	mutex_lock(&hdmi->lock);
-
-	drm_display_mode_to_videomode(mode, &hdmi->cfg.vm);
-
-	dispc_set_tv_pclk(hdmi->dss->dispc, mode->clock * 1000);
-
-	mutex_unlock(&hdmi->lock);
-}
-
 static int hdmi_dump_regs(struct seq_file *s, void *p)
 {
 	struct omap_hdmi *hdmi = s->private;
@@ -284,62 +272,6 @@ static void hdmi_stop_audio_stream(struct omap_hdmi *hd)
 	hdmi_wp_audio_enable(&hd->wp, false);
 }
 
-static void hdmi_display_enable(struct omap_dss_device *dssdev)
-{
-	struct omap_hdmi *hdmi = dssdev_to_hdmi(dssdev);
-	unsigned long flags;
-	int r;
-
-	DSSDBG("ENTER hdmi_display_enable\n");
-
-	mutex_lock(&hdmi->lock);
-
-	r = hdmi_power_on_full(hdmi);
-	if (r) {
-		DSSERR("failed to power on device\n");
-		goto done;
-	}
-
-	if (hdmi->audio_configured) {
-		r = hdmi4_audio_config(&hdmi->core, &hdmi->wp,
-				       &hdmi->audio_config,
-				       hdmi->cfg.vm.pixelclock);
-		if (r) {
-			DSSERR("Error restoring audio configuration: %d", r);
-			hdmi->audio_abort_cb(&hdmi->pdev->dev);
-			hdmi->audio_configured = false;
-		}
-	}
-
-	spin_lock_irqsave(&hdmi->audio_playing_lock, flags);
-	if (hdmi->audio_configured && hdmi->audio_playing)
-		hdmi_start_audio_stream(hdmi);
-	hdmi->display_enabled = true;
-	spin_unlock_irqrestore(&hdmi->audio_playing_lock, flags);
-
-done:
-	mutex_unlock(&hdmi->lock);
-}
-
-static void hdmi_display_disable(struct omap_dss_device *dssdev)
-{
-	struct omap_hdmi *hdmi = dssdev_to_hdmi(dssdev);
-	unsigned long flags;
-
-	DSSDBG("Enter hdmi_display_disable\n");
-
-	mutex_lock(&hdmi->lock);
-
-	spin_lock_irqsave(&hdmi->audio_playing_lock, flags);
-	hdmi_stop_audio_stream(hdmi);
-	hdmi->display_enabled = false;
-	spin_unlock_irqrestore(&hdmi->audio_playing_lock, flags);
-
-	hdmi_power_off_full(hdmi);
-
-	mutex_unlock(&hdmi->lock);
-}
-
 int hdmi4_core_enable(struct hdmi_core_data *core)
 {
 	struct omap_hdmi *hdmi = container_of(core, struct omap_hdmi, core);
@@ -491,39 +423,14 @@ static void hdmi_lost_hotplug(struct omap_dss_device *dssdev)
 	hdmi4_cec_set_phys_addr(&hdmi->core, CEC_PHYS_ADDR_INVALID);
 }
 
-static int hdmi_set_infoframe(struct omap_dss_device *dssdev,
-		const struct hdmi_avi_infoframe *avi)
-{
-	struct omap_hdmi *hdmi = dssdev_to_hdmi(dssdev);
-
-	hdmi->cfg.infoframe = *avi;
-	return 0;
-}
-
-static int hdmi_set_hdmi_mode(struct omap_dss_device *dssdev,
-		bool hdmi_mode)
-{
-	struct omap_hdmi *hdmi = dssdev_to_hdmi(dssdev);
-
-	hdmi->cfg.hdmi_dvi_mode = hdmi_mode ? HDMI_HDMI : HDMI_DVI;
-	return 0;
-}
-
 static const struct omap_dss_device_ops hdmi_ops = {
 	.connect		= hdmi_connect,
 	.disconnect		= hdmi_disconnect,
 
-	.enable			= hdmi_display_enable,
-	.disable		= hdmi_display_disable,
-
-	.set_timings		= hdmi_display_set_timings,
-
 	.read_edid		= hdmi_read_edid,
 
 	.hdmi = {
 		.lost_hotplug		= hdmi_lost_hotplug,
-		.set_infoframe		= hdmi_set_infoframe,
-		.set_hdmi_mode		= hdmi_set_hdmi_mode,
 	},
 };
 
@@ -543,6 +450,107 @@ static int hdmi4_bridge_attach(struct drm_bridge *bridge,
 				 bridge, flags);
 }
 
+static void hdmi4_bridge_mode_set(struct drm_bridge *bridge,
+				  const struct drm_display_mode *mode,
+				  const struct drm_display_mode *adjusted_mode)
+{
+	struct omap_hdmi *hdmi = drm_bridge_to_hdmi(bridge);
+
+	mutex_lock(&hdmi->lock);
+
+	drm_display_mode_to_videomode(adjusted_mode, &hdmi->cfg.vm);
+
+	dispc_set_tv_pclk(hdmi->dss->dispc, adjusted_mode->clock * 1000);
+
+	mutex_unlock(&hdmi->lock);
+}
+
+static void hdmi4_bridge_enable(struct drm_bridge *bridge,
+				struct drm_atomic_state *state)
+{
+	struct omap_hdmi *hdmi = drm_bridge_to_hdmi(bridge);
+	struct drm_connector_state *conn_state;
+	struct drm_connector *connector;
+	struct drm_crtc_state *crtc_state;
+	unsigned long flags;
+	int ret;
+
+	/*
+	 * None of these should fail, as the bridge can't be enabled without a
+	 * valid CRTC to connector path with fully populated new states.
+	 */
+	connector = drm_atomic_get_new_connector_for_encoder(state,
+							     bridge->encoder);
+	if (WARN_ON(!connector))
+		return;
+	conn_state = drm_atomic_get_new_connector_state(state, connector);
+	if (WARN_ON(!conn_state))
+		return;
+	crtc_state = drm_atomic_get_new_crtc_state(state, conn_state->crtc);
+	if (WARN_ON(!crtc_state))
+		return;
+
+	hdmi->cfg.hdmi_dvi_mode = connector->display_info.is_hdmi
+				? HDMI_HDMI : HDMI_DVI;
+
+	if (connector->display_info.is_hdmi) {
+		const struct drm_display_mode *mode;
+		struct hdmi_avi_infoframe avi;
+
+		mode = &crtc_state->adjusted_mode;
+		ret = drm_hdmi_avi_infoframe_from_display_mode(&avi, connector,
+							       mode);
+		if (ret == 0)
+			hdmi->cfg.infoframe = avi;
+	}
+
+	mutex_lock(&hdmi->lock);
+
+	ret = hdmi_power_on_full(hdmi);
+	if (ret) {
+		DSSERR("failed to power on device\n");
+		goto done;
+	}
+
+	if (hdmi->audio_configured) {
+		ret = hdmi4_audio_config(&hdmi->core, &hdmi->wp,
+					 &hdmi->audio_config,
+					 hdmi->cfg.vm.pixelclock);
+		if (ret) {
+			DSSERR("Error restoring audio configuration: %d", ret);
+			hdmi->audio_abort_cb(&hdmi->pdev->dev);
+			hdmi->audio_configured = false;
+		}
+	}
+
+	spin_lock_irqsave(&hdmi->audio_playing_lock, flags);
+	if (hdmi->audio_configured && hdmi->audio_playing)
+		hdmi_start_audio_stream(hdmi);
+	hdmi->display_enabled = true;
+	spin_unlock_irqrestore(&hdmi->audio_playing_lock, flags);
+
+done:
+	mutex_unlock(&hdmi->lock);
+}
+
+static void hdmi4_bridge_disable(struct drm_bridge *bridge,
+				 struct drm_atomic_state *state)
+{
+	struct omap_hdmi *hdmi = drm_bridge_to_hdmi(bridge);
+	unsigned long flags;
+
+	mutex_lock(&hdmi->lock);
+
+	spin_lock_irqsave(&hdmi->audio_playing_lock, flags);
+	hdmi_stop_audio_stream(hdmi);
+	hdmi->display_enabled = false;
+	spin_unlock_irqrestore(&hdmi->audio_playing_lock, flags);
+
+	hdmi_power_off_full(hdmi);
+
+	mutex_unlock(&hdmi->lock);
+}
+
 static struct edid *hdmi4_bridge_read_edid(struct omap_hdmi *hdmi,
 					   struct drm_connector *connector)
 {
@@ -559,6 +567,9 @@ static struct edid *hdmi4_bridge_get_edid(struct drm_bridge *bridge,
 
 static const struct drm_bridge_funcs hdmi4_bridge_funcs = {
 	.attach = hdmi4_bridge_attach,
+	.mode_set = hdmi4_bridge_mode_set,
+	.atomic_enable = hdmi4_bridge_enable,
+	.atomic_disable = hdmi4_bridge_disable,
 	.get_edid = hdmi4_bridge_get_edid,
 };
 
-- 
Regards,

Laurent Pinchart

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
