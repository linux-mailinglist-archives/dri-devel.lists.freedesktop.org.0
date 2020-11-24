Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 379312C262F
	for <lists+dri-devel@lfdr.de>; Tue, 24 Nov 2020 13:47:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C1EB36E409;
	Tue, 24 Nov 2020 12:47:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 604B46E314
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Nov 2020 12:47:22 +0000 (UTC)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 0AOClF9f032910;
 Tue, 24 Nov 2020 06:47:15 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1606222035;
 bh=2cL/2iDyfU0426lg/6PvTy6a9mGtijqMi7seXVla9vc=;
 h=From:To:CC:Subject:Date:In-Reply-To:References;
 b=P77CY9I+YJ3wgbVFdtpHE15B0wX1sfyvtMRFmiYW3v7Kjcu9usUjE2e8NUD2ew6Bc
 Q8rdV2mnXTbL2Ao7eVioi7T4DoPWpm+nqO+dbhP47HPPOOLcIDn0XHyQsPPGHhELge
 gI8cfZn580U+iUDh1kRGl2wvKwQ2Nk6YKOP9W3CY=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
 by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 0AOClFeo043308
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 24 Nov 2020 06:47:15 -0600
Received: from DFLE101.ent.ti.com (10.64.6.22) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Tue, 24
 Nov 2020 06:47:15 -0600
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE101.ent.ti.com
 (10.64.6.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Tue, 24 Nov 2020 06:47:15 -0600
Received: from deskari.lan (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 0AOCjmpN040922;
 Tue, 24 Nov 2020 06:47:13 -0600
From: Tomi Valkeinen <tomi.valkeinen@ti.com>
To: Sebastian Reichel <sre@kernel.org>, Laurent Pinchart
 <laurent.pinchart@ideasonboard.com>,
 Nikhil Devshatwar <nikhil.nd@ti.com>, <linux-omap@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>
Subject: [PATCH v4 34/80] drm/omap: dsi: implement check timings
Date: Tue, 24 Nov 2020 14:44:52 +0200
Message-ID: <20201124124538.660710-35-tomi.valkeinen@ti.com>
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

Implement check timings, which will check if it's possible to
configure the clocks for the provided mode using the same code
as the set_config() hook.

Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ti.com>
---
 drivers/gpu/drm/omapdrm/dss/dsi.c | 70 +++++++++++++++++++------------
 1 file changed, 44 insertions(+), 26 deletions(-)

diff --git a/drivers/gpu/drm/omapdrm/dss/dsi.c b/drivers/gpu/drm/omapdrm/dss/dsi.c
index 93900739237e..549386f3897b 100644
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
@@ -4793,44 +4794,55 @@ static bool dsi_is_video_mode(struct omap_dss_device *dssdev)
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
 
@@ -5007,11 +5019,17 @@ static void dsi_set_timings(struct omap_dss_device *dssdev,
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
