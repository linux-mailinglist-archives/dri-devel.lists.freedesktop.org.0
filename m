Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 664442C2603
	for <lists+dri-devel@lfdr.de>; Tue, 24 Nov 2020 13:47:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 883AE6E2D5;
	Tue, 24 Nov 2020 12:47:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D0FC6E3E5
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Nov 2020 12:46:50 +0000 (UTC)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 0AOCkhEx032772;
 Tue, 24 Nov 2020 06:46:43 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1606222003;
 bh=OHzZ674SrOloJyKl9CoIQVMtClwuipFwDt3mXiBbaXE=;
 h=From:To:CC:Subject:Date:In-Reply-To:References;
 b=Grz4oEPVRyf1nsnVJmmvRXeySXvo7RDa5257PAyO8cM4U49bSbWkmcQYtsGZgPE8Y
 56hbKBGVK5FZEAFuTBWk/UlOzGCZA8QqwjUYqVtNtZ/sf6615bInVWQWJoGQwboHka
 h7K/vlkP5htniRLnNIh6a4uBEgXsh//yQGvF1FHY=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
 by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 0AOCkhAe042061
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 24 Nov 2020 06:46:43 -0600
Received: from DFLE101.ent.ti.com (10.64.6.22) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Tue, 24
 Nov 2020 06:46:43 -0600
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE101.ent.ti.com
 (10.64.6.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Tue, 24 Nov 2020 06:46:42 -0600
Received: from deskari.lan (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 0AOCjmpA040922;
 Tue, 24 Nov 2020 06:46:41 -0600
From: Tomi Valkeinen <tomi.valkeinen@ti.com>
To: Sebastian Reichel <sre@kernel.org>, Laurent Pinchart
 <laurent.pinchart@ideasonboard.com>,
 Nikhil Devshatwar <nikhil.nd@ti.com>, <linux-omap@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>
Subject: [PATCH v4 21/80] drm/omap: dsi: use pixel-format and mode from attach
Date: Tue, 24 Nov 2020 14:44:39 +0200
Message-ID: <20201124124538.660710-22-tomi.valkeinen@ti.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201124124538.660710-1-tomi.valkeinen@ti.com>
References: <20201124124538.660710-1-tomi.valkeinen@ti.com>
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
Cc: Tony Lindgren <tony@atomide.com>, hns@goldelico.com,
 Tomi Valkeinen <tomi.valkeinen@ti.com>, Sekhar Nori <nsekhar@ti.com>,
 Sebastian Reichel <sebastian.reichel@collabora.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Sebastian Reichel <sebastian.reichel@collabora.com>

In order to reduce the amount of custom functionality, this moves
handling of pixel format and DSI mode from set_config() to dsi
attach.

Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ti.com>
---
 .../gpu/drm/omapdrm/displays/panel-dsi-cm.c   |  2 --
 drivers/gpu/drm/omapdrm/dss/dsi.c             | 31 ++++++++++++-------
 2 files changed, 19 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/omapdrm/displays/panel-dsi-cm.c b/drivers/gpu/drm/omapdrm/displays/panel-dsi-cm.c
index cfc31b777bae..78498d863ad5 100644
--- a/drivers/gpu/drm/omapdrm/displays/panel-dsi-cm.c
+++ b/drivers/gpu/drm/omapdrm/displays/panel-dsi-cm.c
@@ -549,8 +549,6 @@ static int dsicm_power_on(struct panel_drv_data *ddata)
 	u8 id1, id2, id3;
 	int r;
 	struct omap_dss_dsi_config dsi_config = {
-		.mode = OMAP_DSS_DSI_CMD_MODE,
-		.pixel_format = MIPI_DSI_FMT_RGB888,
 		.vm = &ddata->vm,
 		.hs_clk_min = 150000000,
 		.hs_clk_max = 300000000,
diff --git a/drivers/gpu/drm/omapdrm/dss/dsi.c b/drivers/gpu/drm/omapdrm/dss/dsi.c
index 25d2af1e1a00..25122f1eaa4b 100644
--- a/drivers/gpu/drm/omapdrm/dss/dsi.c
+++ b/drivers/gpu/drm/omapdrm/dss/dsi.c
@@ -4578,24 +4578,19 @@ static int dsi_set_config(struct omap_dss_device *dssdev,
 {
 	struct dsi_data *dsi = to_dsi_data(dssdev);
 	struct dsi_clk_calc_ctx ctx;
+	struct omap_dss_dsi_config cfg = *config;
 	bool ok;
 	int r;
 
 	mutex_lock(&dsi->lock);
 
-	dsi->pix_fmt = config->pixel_format;
-	dsi->mode = config->mode;
+	cfg.mode = dsi->mode;
+	cfg.pixel_format = dsi->pix_fmt;
 
-	if (mipi_dsi_pixel_format_to_bpp(dsi->pix_fmt) < 0) {
-		DSSERR("invalid pixel format\n");
-		r = -EINVAL;
-		goto err;
-	}
-
-	if (config->mode == OMAP_DSS_DSI_VIDEO_MODE)
-		ok = dsi_vm_calc(dsi, config, &ctx);
+	if (dsi->mode == OMAP_DSS_DSI_VIDEO_MODE)
+		ok = dsi_vm_calc(dsi, &cfg, &ctx);
 	else
-		ok = dsi_cm_calc(dsi, config, &ctx);
+		ok = dsi_cm_calc(dsi, &cfg, &ctx);
 
 	if (!ok) {
 		DSSERR("failed to find suitable DSI clock settings\n");
@@ -4606,7 +4601,7 @@ static int dsi_set_config(struct omap_dss_device *dssdev,
 	dsi_pll_calc_dsi_fck(dsi, &ctx.dsi_cinfo);
 
 	r = dsi_lp_clock_calc(ctx.dsi_cinfo.clkout[HSDIV_DSI],
-		config->lp_clk_min, config->lp_clk_max, &dsi->user_lp_cinfo);
+		cfg.lp_clk_min, cfg.lp_clk_max, &dsi->user_lp_cinfo);
 	if (r) {
 		DSSERR("failed to find suitable DSI LP clock settings\n");
 		goto err;
@@ -4784,7 +4779,19 @@ static int omap_dsi_host_attach(struct mipi_dsi_host *host,
 		return -EBUSY;
 	}
 
+	if (mipi_dsi_pixel_format_to_bpp(client->format) < 0) {
+		DSSERR("invalid pixel format\n");
+		return -EINVAL;
+	}
+
 	dsi->vc[channel].dest = client;
+
+	dsi->pix_fmt = client->format;
+	if (client->mode_flags & MIPI_DSI_MODE_VIDEO)
+		dsi->mode = OMAP_DSS_DSI_VIDEO_MODE;
+	else
+		dsi->mode = OMAP_DSS_DSI_CMD_MODE;
+
 	return 0;
 }
 
-- 
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
