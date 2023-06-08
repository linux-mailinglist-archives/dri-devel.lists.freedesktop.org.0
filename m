Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4ED89728534
	for <lists+dri-devel@lfdr.de>; Thu,  8 Jun 2023 18:38:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CAFBF10E5E9;
	Thu,  8 Jun 2023 16:38:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 66EDC10E5EF
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Jun 2023 16:38:01 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 358Gbced115700;
 Thu, 8 Jun 2023 11:37:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1686242258;
 bh=63yTje9gSZ+jL3DeHEsDLsQhdq8Nwny9LUmnTnUGE+M=;
 h=From:To:CC:Subject:Date:In-Reply-To:References;
 b=mMb7qYCPTsSISYvnCZKBHOsT5LTo5Yy5QZYxuK5FL/uLaeD23cEu7GYJCqOdCabq6
 T+t4W/2fw968v6NUqgD2Flg+grhPnctNcDSvQlgONL2Qr0pusyGDl0WzyzkvzvbOWs
 Wyen5OqzfooB6KKH/7JqwQ8iLw06ldZGkaRw/4QE=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
 by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 358Gbcc5013232
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Thu, 8 Jun 2023 11:37:38 -0500
Received: from DFLE101.ent.ti.com (10.64.6.22) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 8
 Jun 2023 11:37:38 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE101.ent.ti.com
 (10.64.6.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 8 Jun 2023 11:37:38 -0500
Received: from localhost (ileaxei01-snat2.itg.ti.com [10.180.69.6])
 by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 358Gbb31123010;
 Thu, 8 Jun 2023 11:37:38 -0500
From: Aradhya Bhatia <a-bhatia1@ti.com>
To: Tomi Valkeinen <tomba@kernel.org>, Jyri Sarha <jyri.sarha@iki.fi>, David
 Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, Rob Herring
 <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>
Subject: [PATCH v8 2/2] drm/tidss: Add support for AM625 DSS
Date: Thu, 8 Jun 2023 22:07:34 +0530
Message-ID: <20230608163734.2578-3-a-bhatia1@ti.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230608163734.2578-1-a-bhatia1@ti.com>
References: <20230608163734.2578-1-a-bhatia1@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
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
Cc: Nishanth Menon <nm@ti.com>, Devicetree List <devicetree@vger.kernel.org>,
 Jayesh Choudhary <j-choudhary@ti.com>, Rahul T R <r-ravikumar@ti.com>,
 Devarsh Thakkar <devarsht@ti.com>,
 Linux Kernel List <linux-kernel@vger.kernel.org>,
 DRI Development List <dri-devel@lists.freedesktop.org>,
 Aradhya Bhatia <a-bhatia1@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add support for the DSS controller on TI's AM625 SoC in the tidss
driver.

The AM625 DSS supports 2 video planes connecting to 2 video ports.
The first plane is a full plane supporting all the features, while the
2nd plane is a "lite" plane without scaling support.

The first video port in AM625 DSS internally provides DPI output to 2
OLDI transmitters. Each OLDI TX outputs 4 differential lanes of video
output and 1 of clock output.

The second video port outputs DPI data directly out of the SoC. It has
24 data lines and can support a maximum of RGB888 output bus format.

Signed-off-by: Aradhya Bhatia <a-bhatia1@ti.com>
---

Notes:

  Changes from v7:
  * Drop all changes made after v3.
    - Drop output bus type support. All outputs from DSS will be the
      video port outptus.
  * Make the first video port type as INTERNAL from OLDI.

 drivers/gpu/drm/tidss/tidss_dispc.c | 57 ++++++++++++++++++++++++++++-
 drivers/gpu/drm/tidss/tidss_dispc.h |  2 +
 drivers/gpu/drm/tidss/tidss_drv.c   |  1 +
 3 files changed, 59 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/tidss/tidss_dispc.c b/drivers/gpu/drm/tidss/tidss_dispc.c
index dca077411f77..484da1aa27bb 100644
--- a/drivers/gpu/drm/tidss/tidss_dispc.c
+++ b/drivers/gpu/drm/tidss/tidss_dispc.c
@@ -275,6 +275,55 @@ const struct dispc_features dispc_j721e_feats = {
 	.vid_order = { 1, 3, 0, 2 },
 };
 
+const struct dispc_features dispc_am625_feats = {
+	.max_pclk_khz = {
+		[DISPC_VP_DPI] = 165000,
+		[DISPC_VP_INTERNAL] = 170000,
+	},
+
+	.scaling = {
+		.in_width_max_5tap_rgb = 1280,
+		.in_width_max_3tap_rgb = 2560,
+		.in_width_max_5tap_yuv = 2560,
+		.in_width_max_3tap_yuv = 4096,
+		.upscale_limit = 16,
+		.downscale_limit_5tap = 4,
+		.downscale_limit_3tap = 2,
+		/*
+		 * The max supported pixel inc value is 255. The value
+		 * of pixel inc is calculated like this: 1+(xinc-1)*bpp.
+		 * The maximum bpp of all formats supported by the HW
+		 * is 8. So the maximum supported xinc value is 32,
+		 * because 1+(32-1)*8 < 255 < 1+(33-1)*4.
+		 */
+		.xinc_max = 32,
+	},
+
+	.subrev = DISPC_AM625,
+
+	.common = "common",
+	.common_regs = tidss_am65x_common_regs,
+
+	.num_vps = 2,
+	.vp_name = { "vp1", "vp2" },
+	.ovr_name = { "ovr1", "ovr2" },
+	.vpclk_name =  { "vp1", "vp2" },
+	.vp_bus_type = { DISPC_VP_INTERNAL, DISPC_VP_DPI },
+
+	.vp_feat = { .color = {
+			.has_ctm = true,
+			.gamma_size = 256,
+			.gamma_type = TIDSS_GAMMA_8BIT,
+		},
+	},
+
+	.num_planes = 2,
+	/* note: vid is plane_id 0 and vidl1 is plane_id 1 */
+	.vid_name = { "vid", "vidl1" },
+	.vid_lite = { false, true, },
+	.vid_order = { 1, 0 },
+};
+
 static const u16 *dispc_common_regmap;
 
 struct dss_vp_data {
@@ -776,6 +825,7 @@ dispc_irq_t dispc_read_and_clear_irqstatus(struct dispc_device *dispc)
 	switch (dispc->feat->subrev) {
 	case DISPC_K2G:
 		return dispc_k2g_read_and_clear_irqstatus(dispc);
+	case DISPC_AM625:
 	case DISPC_AM65X:
 	case DISPC_J721E:
 		return dispc_k3_read_and_clear_irqstatus(dispc);
@@ -791,6 +841,7 @@ void dispc_set_irqenable(struct dispc_device *dispc, dispc_irq_t mask)
 	case DISPC_K2G:
 		dispc_k2g_set_irqenable(dispc, mask);
 		break;
+	case DISPC_AM625:
 	case DISPC_AM65X:
 	case DISPC_J721E:
 		dispc_k3_set_irqenable(dispc, mask);
@@ -1281,6 +1332,7 @@ void dispc_ovr_set_plane(struct dispc_device *dispc, u32 hw_plane,
 		dispc_k2g_ovr_set_plane(dispc, hw_plane, hw_videoport,
 					x, y, layer);
 		break;
+	case DISPC_AM625:
 	case DISPC_AM65X:
 		dispc_am65x_ovr_set_plane(dispc, hw_plane, hw_videoport,
 					  x, y, layer);
@@ -2199,6 +2251,7 @@ static void dispc_plane_init(struct dispc_device *dispc)
 	case DISPC_K2G:
 		dispc_k2g_plane_init(dispc);
 		break;
+	case DISPC_AM625:
 	case DISPC_AM65X:
 	case DISPC_J721E:
 		dispc_k3_plane_init(dispc);
@@ -2305,6 +2358,7 @@ static void dispc_vp_write_gamma_table(struct dispc_device *dispc,
 	case DISPC_K2G:
 		dispc_k2g_vp_write_gamma_table(dispc, hw_videoport);
 		break;
+	case DISPC_AM625:
 	case DISPC_AM65X:
 		dispc_am65x_vp_write_gamma_table(dispc, hw_videoport);
 		break;
@@ -2579,7 +2633,8 @@ int dispc_runtime_resume(struct dispc_device *dispc)
 		REG_GET(dispc, DSS_SYSSTATUS, 2, 2),
 		REG_GET(dispc, DSS_SYSSTATUS, 3, 3));
 
-	if (dispc->feat->subrev == DISPC_AM65X)
+	if (dispc->feat->subrev == DISPC_AM625 ||
+	    dispc->feat->subrev == DISPC_AM65X)
 		dev_dbg(dispc->dev, "OLDI RESETDONE %d,%d,%d\n",
 			REG_GET(dispc, DSS_SYSSTATUS, 5, 5),
 			REG_GET(dispc, DSS_SYSSTATUS, 6, 6),
diff --git a/drivers/gpu/drm/tidss/tidss_dispc.h b/drivers/gpu/drm/tidss/tidss_dispc.h
index 946ed769caaf..33ac5ad7a423 100644
--- a/drivers/gpu/drm/tidss/tidss_dispc.h
+++ b/drivers/gpu/drm/tidss/tidss_dispc.h
@@ -59,6 +59,7 @@ enum dispc_vp_bus_type {
 
 enum dispc_dss_subrevision {
 	DISPC_K2G,
+	DISPC_AM625,
 	DISPC_AM65X,
 	DISPC_J721E,
 };
@@ -86,6 +87,7 @@ struct dispc_features {
 };
 
 extern const struct dispc_features dispc_k2g_feats;
+extern const struct dispc_features dispc_am625_feats;
 extern const struct dispc_features dispc_am65x_feats;
 extern const struct dispc_features dispc_j721e_feats;
 
diff --git a/drivers/gpu/drm/tidss/tidss_drv.c b/drivers/gpu/drm/tidss/tidss_drv.c
index 3f5f27fb6ebc..0a6f19314662 100644
--- a/drivers/gpu/drm/tidss/tidss_drv.c
+++ b/drivers/gpu/drm/tidss/tidss_drv.c
@@ -232,6 +232,7 @@ static void tidss_shutdown(struct platform_device *pdev)
 
 static const struct of_device_id tidss_of_table[] = {
 	{ .compatible = "ti,k2g-dss", .data = &dispc_k2g_feats, },
+	{ .compatible = "ti,am625-dss", .data = &dispc_am625_feats, },
 	{ .compatible = "ti,am65x-dss", .data = &dispc_am65x_feats, },
 	{ .compatible = "ti,j721e-dss", .data = &dispc_j721e_feats, },
 	{ }
-- 
2.40.1

