Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EF52D2DAB40
	for <lists+dri-devel@lfdr.de>; Tue, 15 Dec 2020 11:48:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE6306E2E3;
	Tue, 15 Dec 2020 10:48:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD6066E231
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Dec 2020 10:48:12 +0000 (UTC)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 0BFAmCeo010858
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Dec 2020 04:48:12 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1608029292;
 bh=BzpAF1DOJBbZgVRgPN7kO4sa31eu6a9uN7JzIecxvAU=;
 h=From:To:CC:Subject:Date:In-Reply-To:References;
 b=XyYgdyph2lQKSzS/KoU4BUU3UEOVKYrTrTlKvsplwiZZaiKM0/tURLJyPfX/nw22K
 ZI2ONy7ohvvBDRdSVN5pLn+lNg+TiYLONm3c+R0P3WmeX3tOZqmIPxPe906xZEVUPl
 FO5jvoJhKGH467C5Z7h+rQFZiZ+zgaocq1b8+64k=
Received: from DFLE105.ent.ti.com (dfle105.ent.ti.com [10.64.6.26])
 by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 0BFAmCje024146
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Dec 2020 04:48:12 -0600
Received: from DFLE110.ent.ti.com (10.64.6.31) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Tue, 15
 Dec 2020 04:48:11 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Tue, 15 Dec 2020 04:48:11 -0600
Received: from deskari.lan (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 0BFAkwau046467;
 Tue, 15 Dec 2020 04:48:11 -0600
From: Tomi Valkeinen <tomi.valkeinen@ti.com>
To: <dri-devel@lists.freedesktop.org>
Subject: [PATCH v6 70/84] drm/omap: dsi: use separate VCs for cmd and video
Date: Tue, 15 Dec 2020 12:46:43 +0200
Message-ID: <20201215104657.802264-71-tomi.valkeinen@ti.com>
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

For command mode panels we can use a single VC for sending command and
video data, even if we have to change the data source for that VC when
going from command to video or vice versa.

However, with video mode panels we want to keep the pixel data VC
enabled, and use another VC for command data, and the commands will get
interleaved into the pixel data.

This patch makes the driver use VC0 for commands and VC1 for video.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ti.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Reviewed-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 drivers/gpu/drm/omapdrm/dss/dsi.c | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/omapdrm/dss/dsi.c b/drivers/gpu/drm/omapdrm/dss/dsi.c
index fb21b3235042..6af42753b85a 100644
--- a/drivers/gpu/drm/omapdrm/dss/dsi.c
+++ b/drivers/gpu/drm/omapdrm/dss/dsi.c
@@ -452,7 +452,9 @@ static bool dsi_perf;
 module_param(dsi_perf, bool, 0644);
 #endif
 
-#define VC_DEFAULT 0
+/* Note: for some reason video mode seems to work only if VC_VIDEO is 0 */
+#define VC_VIDEO	0
+#define VC_CMD		1
 
 #define drm_bridge_to_dsi(bridge) \
 	container_of(bridge, struct dsi_data, bridge)
@@ -3725,7 +3727,7 @@ static void dsi_disable_video_outputs(struct omap_dss_device *dssdev)
 	dsi_bus_lock(dsi);
 	dsi->video_enabled = false;
 
-	dsi_disable_video_output(dssdev, VC_DEFAULT);
+	dsi_disable_video_output(dssdev, VC_VIDEO);
 
 	dsi_display_disable(dssdev);
 
@@ -3948,7 +3950,7 @@ static int dsi_update_channel(struct omap_dss_device *dssdev, int vc)
 
 static int dsi_update_all(struct omap_dss_device *dssdev)
 {
-	return dsi_update_channel(dssdev, VC_DEFAULT);
+	return dsi_update_channel(dssdev, VC_VIDEO);
 }
 
 /* Display funcs */
@@ -4181,7 +4183,7 @@ static void dsi_enable_video_outputs(struct omap_dss_device *dssdev)
 
 	dsi_display_enable(dssdev);
 
-	dsi_enable_video_output(dssdev, VC_DEFAULT);
+	dsi_enable_video_output(dssdev, VC_VIDEO);
 
 	dsi->video_enabled = true;
 
@@ -4938,7 +4940,7 @@ static ssize_t omap_dsi_host_transfer(struct mipi_dsi_host *host,
 {
 	struct dsi_data *dsi = host_to_omap(host);
 	int r;
-	int vc = VC_DEFAULT;
+	int vc = VC_CMD;
 
 	dsi_bus_lock(dsi);
 
-- 
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
