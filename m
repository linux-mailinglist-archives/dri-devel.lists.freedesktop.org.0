Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3245F2DAB5E
	for <lists+dri-devel@lfdr.de>; Tue, 15 Dec 2020 11:49:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 59F826E30C;
	Tue, 15 Dec 2020 10:49:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4CB236E2D7
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Dec 2020 10:48:18 +0000 (UTC)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 0BFAmHM6010895
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Dec 2020 04:48:17 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1608029297;
 bh=E3iSdLzMFePjhnUguWSGKQ51/zmEMjNheV9Z26HJwB0=;
 h=From:To:CC:Subject:Date:In-Reply-To:References;
 b=bligLw+x4O0FNiYgAR0EwzqGNCp/svgI6Fw8Fl/DMyObkv4RCEMGNY7JUhY8znJoW
 N6RcjZGfxC11BhVu2PAI7GEcmnoRicI0cGkuW2SFq7vUXCgbKW/uheXA4kLWBS/TNg
 5F7bsibj7nXq6i5rRjZYd83+MlFurzcFtSqxjyrg=
Received: from DLEE103.ent.ti.com (dlee103.ent.ti.com [157.170.170.33])
 by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 0BFAmHMw024317
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Dec 2020 04:48:17 -0600
Received: from DLEE104.ent.ti.com (157.170.170.34) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Tue, 15
 Dec 2020 04:48:17 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Tue, 15 Dec 2020 04:48:17 -0600
Received: from deskari.lan (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 0BFAkwb1046467;
 Tue, 15 Dec 2020 04:48:16 -0600
From: Tomi Valkeinen <tomi.valkeinen@ti.com>
To: <dri-devel@lists.freedesktop.org>
Subject: [PATCH v6 75/84] drm/omap: dsi: move enable/disable to bridge
 enable/disable
Date: Tue, 15 Dec 2020 12:46:48 +0200
Message-ID: <20201215104657.802264-76-tomi.valkeinen@ti.com>
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

Clean up the code by inlining dsi_enable_video_outputs and
dsi_disable_video_outputs functions.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ti.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Reviewed-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 drivers/gpu/drm/omapdrm/dss/dsi.c | 55 +++++++++++++------------------
 1 file changed, 22 insertions(+), 33 deletions(-)

diff --git a/drivers/gpu/drm/omapdrm/dss/dsi.c b/drivers/gpu/drm/omapdrm/dss/dsi.c
index 116406966d15..320342385172 100644
--- a/drivers/gpu/drm/omapdrm/dss/dsi.c
+++ b/drivers/gpu/drm/omapdrm/dss/dsi.c
@@ -3338,20 +3338,6 @@ static void dsi_disable_video_output(struct omap_dss_device *dssdev, int vc)
 	dsi_display_uninit_dispc(dsi);
 }
 
-static void dsi_disable_video_outputs(struct omap_dss_device *dssdev)
-{
-	struct dsi_data *dsi = to_dsi_data(dssdev);
-
-	dsi_bus_lock(dsi);
-	dsi->video_enabled = false;
-
-	dsi_disable_video_output(dssdev, VC_VIDEO);
-
-	dsi_display_disable(dssdev);
-
-	dsi_bus_unlock(dsi);
-}
-
 static void dsi_update_screen_dispc(struct dsi_data *dsi)
 {
 	unsigned int bytespp;
@@ -3793,23 +3779,6 @@ static void dsi_display_enable(struct omap_dss_device *dssdev)
 	_dsi_display_enable(dsi);
 }
 
-static void dsi_enable_video_outputs(struct omap_dss_device *dssdev)
-{
-	struct dsi_data *dsi = to_dsi_data(dssdev);
-
-	dsi_bus_lock(dsi);
-
-	dsi_display_enable(dssdev);
-
-	dsi_enable_video_output(dssdev, VC_VIDEO);
-
-	dsi->video_enabled = true;
-
-	dsi_set_ulps_auto(dsi, true);
-
-	dsi_bus_unlock(dsi);
-}
-
 static void _dsi_display_disable(struct dsi_data *dsi,
 		bool disconnect_lanes, bool enter_ulps)
 {
@@ -4971,15 +4940,35 @@ static void dsi_bridge_mode_set(struct drm_bridge *bridge,
 static void dsi_bridge_enable(struct drm_bridge *bridge)
 {
 	struct dsi_data *dsi = drm_bridge_to_dsi(bridge);
+	struct omap_dss_device *dssdev = &dsi->output;
 
-	dsi_enable_video_outputs(&dsi->output);
+	dsi_bus_lock(dsi);
+
+	dsi_display_enable(dssdev);
+
+	dsi_enable_video_output(dssdev, VC_VIDEO);
+
+	dsi->video_enabled = true;
+
+	dsi_set_ulps_auto(dsi, true);
+
+	dsi_bus_unlock(dsi);
 }
 
 static void dsi_bridge_disable(struct drm_bridge *bridge)
 {
 	struct dsi_data *dsi = drm_bridge_to_dsi(bridge);
+	struct omap_dss_device *dssdev = &dsi->output;
+
+	dsi_bus_lock(dsi);
+
+	dsi->video_enabled = false;
+
+	dsi_disable_video_output(dssdev, VC_VIDEO);
 
-	dsi_disable_video_outputs(&dsi->output);
+	dsi_display_disable(dssdev);
+
+	dsi_bus_unlock(dsi);
 }
 
 static const struct drm_bridge_funcs dsi_bridge_funcs = {
-- 
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
