Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 20BD62DAB3C
	for <lists+dri-devel@lfdr.de>; Tue, 15 Dec 2020 11:48:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A4406E1D5;
	Tue, 15 Dec 2020 10:48:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A7B506E1FB
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Dec 2020 10:48:06 +0000 (UTC)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 0BFAm66s010818
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Dec 2020 04:48:06 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1608029286;
 bh=K5vFhpAI8HnucGdhzyiIc72FCac+aHqBeXReKe7ECpo=;
 h=From:To:CC:Subject:Date:In-Reply-To:References;
 b=huI28qc7FqeI/Hcg2+XkJFroGVP6Ei5U2dM9D0wr9zR35h5LA8Y/qt/kwm7lJdnGV
 0orCyNGam6EtCk6lAU/JJlFoj+fVOnW4hgelTrGnRZIV+ky1F4KdnRENt7qz0GIvGb
 DIj0sT376tecvrUmzVi4va9VOH0YckzTRuwyv8hE=
Received: from DFLE100.ent.ti.com (dfle100.ent.ti.com [10.64.6.21])
 by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 0BFAm54V024035
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Dec 2020 04:48:05 -0600
Received: from DFLE105.ent.ti.com (10.64.6.26) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Tue, 15
 Dec 2020 04:48:05 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Tue, 15 Dec 2020 04:48:05 -0600
Received: from deskari.lan (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 0BFAkwao046467;
 Tue, 15 Dec 2020 04:48:05 -0600
From: Tomi Valkeinen <tomi.valkeinen@ti.com>
To: <dri-devel@lists.freedesktop.org>
Subject: [PATCH v6 64/84] drm/omap: dsi: cleanup dispc channel usage
Date: Tue, 15 Dec 2020 12:46:37 +0200
Message-ID: <20201215104657.802264-65-tomi.valkeinen@ti.com>
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

The "channel" usage in omap dsi driver is confusing. As the first step,
change "channel" to "dispc_channel" when dealing with the dispc channel.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ti.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Reviewed-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 drivers/gpu/drm/omapdrm/dss/dsi.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/omapdrm/dss/dsi.c b/drivers/gpu/drm/omapdrm/dss/dsi.c
index 32e6170abd95..789c26baad86 100644
--- a/drivers/gpu/drm/omapdrm/dss/dsi.c
+++ b/drivers/gpu/drm/omapdrm/dss/dsi.c
@@ -3975,10 +3975,10 @@ static int dsi_configure_dispc_clocks(struct dsi_data *dsi)
 
 static int dsi_display_init_dispc(struct dsi_data *dsi)
 {
-	enum omap_channel channel = dsi->output.dispc_channel;
+	enum omap_channel dispc_channel = dsi->output.dispc_channel;
 	int r;
 
-	dss_select_lcd_clk_source(dsi->dss, channel, dsi->module_id == 0 ?
+	dss_select_lcd_clk_source(dsi->dss, dispc_channel, dsi->module_id == 0 ?
 			DSS_CLK_SRC_PLL1_1 :
 			DSS_CLK_SRC_PLL2_1);
 
@@ -4014,19 +4014,19 @@ static int dsi_display_init_dispc(struct dsi_data *dsi)
 		dss_mgr_unregister_framedone_handler(&dsi->output,
 				dsi_framedone_irq_callback, dsi);
 err:
-	dss_select_lcd_clk_source(dsi->dss, channel, DSS_CLK_SRC_FCK);
+	dss_select_lcd_clk_source(dsi->dss, dispc_channel, DSS_CLK_SRC_FCK);
 	return r;
 }
 
 static void dsi_display_uninit_dispc(struct dsi_data *dsi)
 {
-	enum omap_channel channel = dsi->output.dispc_channel;
+	enum omap_channel dispc_channel = dsi->output.dispc_channel;
 
 	if (dsi->mode == OMAP_DSS_DSI_CMD_MODE)
 		dss_mgr_unregister_framedone_handler(&dsi->output,
 				dsi_framedone_irq_callback, dsi);
 
-	dss_select_lcd_clk_source(dsi->dss, channel, DSS_CLK_SRC_FCK);
+	dss_select_lcd_clk_source(dsi->dss, dispc_channel, DSS_CLK_SRC_FCK);
 }
 
 static int dsi_configure_dsi_clocks(struct dsi_data *dsi)
@@ -4843,12 +4843,12 @@ static int dsi_set_config(struct omap_dss_device *dssdev,
 }
 
 /*
- * Return a hardcoded channel for the DSI output. This should work for
+ * Return a hardcoded dispc channel for the DSI output. This should work for
  * current use cases, but this can be later expanded to either resolve
  * the channel in some more dynamic manner, or get the channel as a user
  * parameter.
  */
-static enum omap_channel dsi_get_channel(struct dsi_data *dsi)
+static enum omap_channel dsi_get_dispc_channel(struct dsi_data *dsi)
 {
 	switch (dsi->data->model) {
 	case DSI_MODEL_OMAP3:
@@ -5400,7 +5400,7 @@ static int dsi_init_output(struct dsi_data *dsi)
 
 	out->type = OMAP_DISPLAY_TYPE_DSI;
 	out->name = dsi->module_id == 0 ? "dsi.0" : "dsi.1";
-	out->dispc_channel = dsi_get_channel(dsi);
+	out->dispc_channel = dsi_get_dispc_channel(dsi);
 	out->dsi_ops = &dsi_ops;
 	out->of_port = 0;
 	out->bus_flags = DRM_BUS_FLAG_PIXDATA_DRIVE_POSEDGE
-- 
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
