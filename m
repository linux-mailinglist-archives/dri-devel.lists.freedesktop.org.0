Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9408D2DAB23
	for <lists+dri-devel@lfdr.de>; Tue, 15 Dec 2020 11:47:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4CC9D6E1F5;
	Tue, 15 Dec 2020 10:47:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B3FF56E1DE
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Dec 2020 10:47:32 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 0BFAlWKH010569
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Dec 2020 04:47:32 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1608029252;
 bh=DzqWAFT8F72pTmKaeq8woRmJpRFRwoarBzTIcCwc8MU=;
 h=From:To:CC:Subject:Date:In-Reply-To:References;
 b=xQVlKoG+kgMJk3dGtyR6VgOK29oy3kaMRQxTCIsIO6CROKAumxFOr/IRVW+q14uib
 168g5KTx7Br9a8RgZa9WirvpCdOQTuQHkRTm/cF0qFdfsIad5m1cHeOV80VdnDO9O3
 2pW5q0gxQ2Qa3atyuRVxw+IxLLhSOcbnmE5QJYSE=
Received: from DLEE105.ent.ti.com (dlee105.ent.ti.com [157.170.170.35])
 by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 0BFAlWDQ000544
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Dec 2020 04:47:32 -0600
Received: from DLEE103.ent.ti.com (157.170.170.33) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Tue, 15
 Dec 2020 04:47:31 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Tue, 15 Dec 2020 04:47:31 -0600
Received: from deskari.lan (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 0BFAkwaH046467;
 Tue, 15 Dec 2020 04:47:30 -0600
From: Tomi Valkeinen <tomi.valkeinen@ti.com>
To: <dri-devel@lists.freedesktop.org>
Subject: [PATCH v6 31/84] drm/omap: dsi: drop custom panel capability support
Date: Tue, 15 Dec 2020 12:46:04 +0200
Message-ID: <20201215104657.802264-32-tomi.valkeinen@ti.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201215104657.802264-1-tomi.valkeinen@ti.com>
References: <20201215104657.802264-1-tomi.valkeinen@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
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
Cc: tomi.valkeinen@ti.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Sebastian Reichel <sebastian.reichel@collabora.com>

Due to previous changes the DSI encoder gets the capabilities
via DSI client's mode_flags and no longer needs the omapdss
specific caps. The core code now checks if the DSI encoder
is actually configured into command mode instead of just checking
the panel capabilities.

Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ti.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/gpu/drm/omapdrm/displays/panel-dsi-cm.c |  3 ---
 drivers/gpu/drm/omapdrm/dss/dsi.c               |  8 ++++++++
 drivers/gpu/drm/omapdrm/dss/omapdss.h           |  8 +-------
 drivers/gpu/drm/omapdrm/omap_crtc.c             | 17 ++++++++---------
 4 files changed, 17 insertions(+), 19 deletions(-)

diff --git a/drivers/gpu/drm/omapdrm/displays/panel-dsi-cm.c b/drivers/gpu/drm/omapdrm/displays/panel-dsi-cm.c
index b72930dcbdf4..da925d23b629 100644
--- a/drivers/gpu/drm/omapdrm/displays/panel-dsi-cm.c
+++ b/drivers/gpu/drm/omapdrm/displays/panel-dsi-cm.c
@@ -593,9 +593,6 @@ static int dsicm_probe(struct mipi_dsi_device *dsi)
 	dssdev->of_port = 0;
 	dssdev->ops_flags = OMAP_DSS_DEVICE_OP_MODES;
 
-	dssdev->caps = OMAP_DSS_DISPLAY_CAP_MANUAL_UPDATE |
-		OMAP_DSS_DISPLAY_CAP_TEAR_ELIM;
-
 	omapdss_display_init(dssdev);
 	omapdss_device_register(dssdev);
 
diff --git a/drivers/gpu/drm/omapdrm/dss/dsi.c b/drivers/gpu/drm/omapdrm/dss/dsi.c
index 56cff14061ee..be95f93e9241 100644
--- a/drivers/gpu/drm/omapdrm/dss/dsi.c
+++ b/drivers/gpu/drm/omapdrm/dss/dsi.c
@@ -4728,6 +4728,13 @@ static bool dsi_vm_calc(struct dsi_data *dsi,
 			dsi_vm_calc_pll_cb, ctx);
 }
 
+static bool dsi_is_video_mode(struct omap_dss_device *dssdev)
+{
+	struct dsi_data *dsi = to_dsi_data(dssdev);
+
+	return dsi->mode == OMAP_DSS_DSI_VIDEO_MODE;
+}
+
 static int dsi_set_config(struct omap_dss_device *dssdev,
 		const struct omap_dss_dsi_config *config)
 {
@@ -4947,6 +4954,7 @@ static const struct omap_dss_device_ops dsi_ops = {
 		.disable_video_output = dsi_disable_video_output,
 
 		.update = dsi_update_all,
+		.is_video_mode = dsi_is_video_mode,
 	},
 };
 
diff --git a/drivers/gpu/drm/omapdrm/dss/omapdss.h b/drivers/gpu/drm/omapdrm/dss/omapdss.h
index 742f3d68daef..d95034611b67 100644
--- a/drivers/gpu/drm/omapdrm/dss/omapdss.h
+++ b/drivers/gpu/drm/omapdrm/dss/omapdss.h
@@ -123,11 +123,6 @@ enum omap_dss_dsi_mode {
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
@@ -282,6 +277,7 @@ struct omap_dss_writeback_info {
 
 struct omapdss_dsi_ops {
 	int (*update)(struct omap_dss_device *dssdev);
+	bool (*is_video_mode)(struct omap_dss_device *dssdev);
 
 	/* legacy API used by omapdss panels */
 	int (*set_config)(struct omap_dss_device *dssdev,
@@ -354,8 +350,6 @@ struct omap_dss_device {
 	unsigned long ops_flags;
 	u32 bus_flags;
 
-	enum omap_display_caps caps;
-
 	enum omap_dss_display_state state;
 
 	/* OMAP DSS output specific fields */
diff --git a/drivers/gpu/drm/omapdrm/omap_crtc.c b/drivers/gpu/drm/omapdrm/omap_crtc.c
index dc0bc6f2aa06..0d1543537b92 100644
--- a/drivers/gpu/drm/omapdrm/omap_crtc.c
+++ b/drivers/gpu/drm/omapdrm/omap_crtc.c
@@ -496,8 +496,7 @@ static enum drm_mode_status omap_crtc_mode_valid(struct drm_crtc *crtc,
 	 * valid DISPC mode. DSI will calculate and configure the
 	 * proper DISPC mode later.
 	 */
-	if (omap_crtc->pipe->output->next == NULL ||
-	    omap_crtc->pipe->output->next->type != OMAP_DISPLAY_TYPE_DSI) {
+	if (omap_crtc->pipe->output->type != OMAP_DISPLAY_TYPE_DSI) {
 		r = priv->dispc_ops->mgr_check_timings(priv->dispc,
 						       omap_crtc->channel,
 						       &vm);
@@ -549,17 +548,17 @@ static void omap_crtc_mode_set_nofb(struct drm_crtc *crtc)
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
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
