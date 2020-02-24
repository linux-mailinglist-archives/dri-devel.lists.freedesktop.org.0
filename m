Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BD5716BC86
	for <lists+dri-devel@lfdr.de>; Tue, 25 Feb 2020 09:52:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E11A36EA55;
	Tue, 25 Feb 2020 08:51:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A80916E9C5
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Feb 2020 23:21:43 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) (Authenticated sender: sre)
 with ESMTPSA id 3F0132935D4
Received: by earth.universe (Postfix, from userid 1000)
 id 5E3E03C0CA5; Tue, 25 Feb 2020 00:21:31 +0100 (CET)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
To: Sebastian Reichel <sre@kernel.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Tomi Valkeinen <tomi.valkeinen@ti.com>
Subject: [PATCHv2 34/56] drm/omap: dsi: drop custom panel capability support
Date: Tue, 25 Feb 2020 00:21:04 +0100
Message-Id: <20200224232126.3385250-35-sebastian.reichel@collabora.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200224232126.3385250-1-sebastian.reichel@collabora.com>
References: <20200224232126.3385250-1-sebastian.reichel@collabora.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Tue, 25 Feb 2020 08:50:43 +0000
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
Cc: kernel@collabora.com, Tony Lindgren <tony@atomide.com>,
 "H. Nikolaus Schaller" <hns@goldelico.com>, Merlijn Wajer <merlijn@wizzup.org>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 dri-devel@lists.freedesktop.org, linux-omap@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Due to previous changes the DSI encoder gets the capabilities
via DSI client's mode_flags and no longer needs the omapdss
specific caps. The core code now checks if the DSI encoder
is actually configured into command mode instead of just checking
the panel capabilities.

Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 drivers/gpu/drm/omapdrm/displays/panel-dsi-cm.c |  3 ---
 drivers/gpu/drm/omapdrm/dss/dsi.c               |  8 ++++++++
 drivers/gpu/drm/omapdrm/dss/omapdss.h           |  8 +-------
 drivers/gpu/drm/omapdrm/omap_crtc.c             | 17 ++++++++---------
 4 files changed, 17 insertions(+), 19 deletions(-)

diff --git a/drivers/gpu/drm/omapdrm/displays/panel-dsi-cm.c b/drivers/gpu/drm/omapdrm/displays/panel-dsi-cm.c
index 6f559c1b0bf6..30be9e4ab908 100644
--- a/drivers/gpu/drm/omapdrm/displays/panel-dsi-cm.c
+++ b/drivers/gpu/drm/omapdrm/displays/panel-dsi-cm.c
@@ -602,9 +602,6 @@ static int dsicm_probe(struct mipi_dsi_device *dsi)
 	dssdev->of_port = 0;
 	dssdev->ops_flags = OMAP_DSS_DEVICE_OP_MODES;
 
-	dssdev->caps = OMAP_DSS_DISPLAY_CAP_MANUAL_UPDATE |
-		OMAP_DSS_DISPLAY_CAP_TEAR_ELIM;
-
 	omapdss_display_init(dssdev);
 	omapdss_device_register(dssdev);
 
diff --git a/drivers/gpu/drm/omapdrm/dss/dsi.c b/drivers/gpu/drm/omapdrm/dss/dsi.c
index b0e796f90fca..42f995da21a5 100644
--- a/drivers/gpu/drm/omapdrm/dss/dsi.c
+++ b/drivers/gpu/drm/omapdrm/dss/dsi.c
@@ -4732,6 +4732,13 @@ static bool dsi_vm_calc(struct dsi_data *dsi,
 			dsi_vm_calc_pll_cb, ctx);
 }
 
+static bool dsi_is_video_mode(struct omap_dss_device *dssdev)
+{
+	struct dsi_data *dsi = to_dsi_data(dssdev);
+
+	return (dsi->mode == OMAP_DSS_DSI_VIDEO_MODE);
+}
+
 static int dsi_set_config(struct omap_dss_device *dssdev,
 		const struct omap_dss_dsi_config *config)
 {
@@ -4951,6 +4958,7 @@ static const struct omap_dss_device_ops dsi_ops = {
 		.disable_video_output = dsi_disable_video_output,
 
 		.update = dsi_update_all,
+		.is_video_mode = dsi_is_video_mode,
 	},
 };
 
diff --git a/drivers/gpu/drm/omapdrm/dss/omapdss.h b/drivers/gpu/drm/omapdrm/dss/omapdss.h
index d7081086c2b1..430e915d2759 100644
--- a/drivers/gpu/drm/omapdrm/dss/omapdss.h
+++ b/drivers/gpu/drm/omapdrm/dss/omapdss.h
@@ -122,11 +122,6 @@ enum omap_dss_dsi_mode {
 	OMAP_DSS_DSI_VIDEO_MODE,
 };
 
-enum omap_display_caps {
-	OMAP_DSS_DISPLAY_CAP_MANUAL_UPDATE	= 1 << 0,
-	OMAP_DSS_DISPLAY_CAP_TEAR_ELIM		= 1 << 1,
-};
-
 enum omap_dss_display_state {
 	OMAP_DSS_DISPLAY_DISABLED = 0,
 	OMAP_DSS_DISPLAY_ACTIVE,
@@ -281,6 +276,7 @@ struct omap_dss_writeback_info {
 
 struct omapdss_dsi_ops {
 	int (*update)(struct omap_dss_device *dssdev);
+	bool (*is_video_mode)(struct omap_dss_device *dssdev);
 
 	/* legacy API used by omapdss panels */
 	int (*set_config)(struct omap_dss_device *dssdev,
@@ -353,8 +349,6 @@ struct omap_dss_device {
 	unsigned long ops_flags;
 	u32 bus_flags;
 
-	enum omap_display_caps caps;
-
 	enum omap_dss_display_state state;
 
 	/* OMAP DSS output specific fields */
diff --git a/drivers/gpu/drm/omapdrm/omap_crtc.c b/drivers/gpu/drm/omapdrm/omap_crtc.c
index c924d77207fb..af62f6075602 100644
--- a/drivers/gpu/drm/omapdrm/omap_crtc.c
+++ b/drivers/gpu/drm/omapdrm/omap_crtc.c
@@ -495,8 +495,7 @@ static enum drm_mode_status omap_crtc_mode_valid(struct drm_crtc *crtc,
 	 * valid DISPC mode. DSI will calculate and configure the
 	 * proper DISPC mode later.
 	 */
-	if (omap_crtc->pipe->output->next == NULL ||
-	    omap_crtc->pipe->output->next->type != OMAP_DISPLAY_TYPE_DSI) {
+	if (omap_crtc->pipe->output->type != OMAP_DISPLAY_TYPE_DSI) {
 		r = priv->dispc_ops->mgr_check_timings(priv->dispc,
 						       omap_crtc->channel,
 						       &vm);
@@ -548,17 +547,17 @@ static void omap_crtc_mode_set_nofb(struct drm_crtc *crtc)
 static bool omap_crtc_is_manually_updated(struct drm_crtc *crtc)
 {
 	struct omap_crtc *omap_crtc = to_omap_crtc(crtc);
-	struct omap_dss_device *display = omap_crtc->pipe->output->next;
+	struct omap_dss_device *dssdev = omap_crtc->pipe->output;
 
-	if (!display)
+	if (dssdev->type != OMAP_DISPLAY_TYPE_DSI ||
+	    !dssdev->ops->dsi.is_video_mode)
 		return false;
 
-	if (display->caps & OMAP_DSS_DISPLAY_CAP_MANUAL_UPDATE) {
-		DBG("detected manually updated display!");
-		return true;
-	}
+	if (dssdev->ops->dsi.is_video_mode(dssdev))
+		return false;
 
-	return false;
+	DBG("detected manually updated display!");
+	return true;
 }
 
 static int omap_crtc_atomic_check(struct drm_crtc *crtc,
-- 
2.25.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
