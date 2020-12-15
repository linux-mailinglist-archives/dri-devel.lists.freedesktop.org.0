Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B0A8B2DAB26
	for <lists+dri-devel@lfdr.de>; Tue, 15 Dec 2020 11:47:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 135786E1E6;
	Tue, 15 Dec 2020 10:47:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A6D9A6E1DE
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Dec 2020 10:47:35 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 0BFAlZF7124013
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Dec 2020 04:47:35 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1608029255;
 bh=Cv63faDEdVkO2f6r8McnemAgAJisBPXUVIw2N9aaU9I=;
 h=From:To:CC:Subject:Date:In-Reply-To:References;
 b=I/F9kPOKax6FZk3EYrd3DSca5crUPNNKsBO2W50kBGwRqQpV/ZSOmgqkpNxY8WjkY
 Wc0ACLur2XQ6h/UlHSwqc7q9tJ/ai9744kzbpNuC3f97XW6ybEyEGrC9YBrZ2OS4lz
 EOh/e9MjIzMIXOpabvLWqNP4SyDmsbVnSPopfWkQ=
Received: from DLEE102.ent.ti.com (dlee102.ent.ti.com [157.170.170.32])
 by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 0BFAlZ9A023232
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Dec 2020 04:47:35 -0600
Received: from DLEE114.ent.ti.com (157.170.170.25) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Tue, 15
 Dec 2020 04:47:34 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Tue, 15 Dec 2020 04:47:34 -0600
Received: from deskari.lan (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 0BFAkwaK046467;
 Tue, 15 Dec 2020 04:47:33 -0600
From: Tomi Valkeinen <tomi.valkeinen@ti.com>
To: <dri-devel@lists.freedesktop.org>
Subject: [PATCH v6 34/84] drm/omap: dsi: implement check timings
Date: Tue, 15 Dec 2020 12:46:07 +0200
Message-ID: <20201215104657.802264-35-tomi.valkeinen@ti.com>
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

Implement check timings, which will check if it's possible to
configure the clocks for the provided mode using the same code
as the set_config() hook.

Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ti.com>
---
 drivers/gpu/drm/omapdrm/dss/dsi.c | 70 +++++++++++++++++++------------
 1 file changed, 44 insertions(+), 26 deletions(-)

diff --git a/drivers/gpu/drm/omapdrm/dss/dsi.c b/drivers/gpu/drm/omapdrm/dss/dsi.c
index a609a602e5ae..6f66ef0be166 100644
--- a/drivers/gpu/drm/omapdrm/dss/dsi.c
+++ b/drivers/gpu/drm/omapdrm/dss/dsi.c
@@ -280,6 +280,11 @@ struct dsi_isr_tables {
 	struct dsi_isr_data isr_table_cio[DSI_MAX_NR_ISRS];
 };
 
+struct dsi_lp_clock_info {
+	unsigned long lp_clk;
+	u16 lp_clk_div;
+};
+
 struct dsi_clk_calc_ctx {
 	struct dsi_data *dsi;
 	struct dss_pll *pll;
@@ -294,16 +299,12 @@ struct dsi_clk_calc_ctx {
 
 	struct dss_pll_clock_info dsi_cinfo;
 	struct dispc_clock_info dispc_cinfo;
+	struct dsi_lp_clock_info lp_cinfo;
 
 	struct videomode vm;
 	struct omap_dss_dsi_videomode_timings dsi_vm;
 };
 
-struct dsi_lp_clock_info {
-	unsigned long lp_clk;
-	u16 lp_clk_div;
-};
-
 struct dsi_module_id_data {
 	u32 address;
 	int id;
@@ -4790,44 +4791,55 @@ static bool dsi_is_video_mode(struct omap_dss_device *dssdev)
 	return dsi->mode == OMAP_DSS_DSI_VIDEO_MODE;
 }
 
-static int dsi_set_config(struct omap_dss_device *dssdev,
-		const struct drm_display_mode *mode)
+static int __dsi_calc_config(struct dsi_data *dsi,
+		const struct drm_display_mode *mode,
+		struct dsi_clk_calc_ctx *ctx)
 {
-	struct dsi_data *dsi = to_dsi_data(dssdev);
-	struct dsi_clk_calc_ctx ctx;
-	struct videomode vm;
 	struct omap_dss_dsi_config cfg = dsi->config;
+	struct videomode vm;
 	bool ok;
 	int r;
 
 	drm_display_mode_to_videomode(mode, &vm);
-	cfg.vm = &vm;
-
-	mutex_lock(&dsi->lock);
 
+	cfg.vm = &vm;
 	cfg.mode = dsi->mode;
 	cfg.pixel_format = dsi->pix_fmt;
 
 	if (dsi->mode == OMAP_DSS_DSI_VIDEO_MODE)
-		ok = dsi_vm_calc(dsi, &cfg, &ctx);
+		ok = dsi_vm_calc(dsi, &cfg, ctx);
 	else
-		ok = dsi_cm_calc(dsi, &cfg, &ctx);
+		ok = dsi_cm_calc(dsi, &cfg, ctx);
 
-	if (!ok) {
-		DSSERR("failed to find suitable DSI clock settings\n");
-		r = -EINVAL;
-		goto err;
-	}
+	if (!ok)
+		return -EINVAL;
+
+	dsi_pll_calc_dsi_fck(dsi, &ctx->dsi_cinfo);
 
-	dsi_pll_calc_dsi_fck(dsi, &ctx.dsi_cinfo);
+	r = dsi_lp_clock_calc(ctx->dsi_cinfo.clkout[HSDIV_DSI],
+		cfg.lp_clk_min, cfg.lp_clk_max, &ctx->lp_cinfo);
+	if (r)
+		return r;
+
+	return 0;
+}
 
-	r = dsi_lp_clock_calc(ctx.dsi_cinfo.clkout[HSDIV_DSI],
-		cfg.lp_clk_min, cfg.lp_clk_max, &dsi->user_lp_cinfo);
+static int dsi_set_config(struct omap_dss_device *dssdev,
+		const struct drm_display_mode *mode)
+{
+	struct dsi_data *dsi = to_dsi_data(dssdev);
+	struct dsi_clk_calc_ctx ctx;
+	int r;
+
+	mutex_lock(&dsi->lock);
+
+	r = __dsi_calc_config(dsi, mode, &ctx);
 	if (r) {
-		DSSERR("failed to find suitable DSI LP clock settings\n");
+		DSSERR("failed to find suitable DSI clock settings\n");
 		goto err;
 	}
 
+	dsi->user_lp_cinfo = ctx.lp_cinfo;
 	dsi->user_dsi_cinfo = ctx.dsi_cinfo;
 	dsi->user_dispc_cinfo = ctx.dispc_cinfo;
 
@@ -5004,11 +5016,17 @@ static void dsi_set_timings(struct omap_dss_device *dssdev,
 static int dsi_check_timings(struct omap_dss_device *dssdev,
 			     struct drm_display_mode *mode)
 {
+	struct dsi_data *dsi = to_dsi_data(dssdev);
+	struct dsi_clk_calc_ctx ctx;
+	int r;
+
 	DSSDBG("dsi_check_timings\n");
 
-	/* TODO */
+	mutex_lock(&dsi->lock);
+	r = __dsi_calc_config(dsi, mode, &ctx);
+	mutex_unlock(&dsi->lock);
 
-	return 0;
+	return r;
 }
 
 static int dsi_connect(struct omap_dss_device *src,
-- 
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
