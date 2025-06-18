Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6019FADE7E5
	for <lists+dri-devel@lfdr.de>; Wed, 18 Jun 2025 12:05:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F84810E1D7;
	Wed, 18 Jun 2025 10:05:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ti.com header.i=@ti.com header.b="HdoevnXe";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 532CB10E1D7
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Jun 2025 10:05:29 +0000 (UTC)
Received: from fllvem-sh03.itg.ti.com ([10.64.41.86])
 by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTP id 55IA5CUY204660;
 Wed, 18 Jun 2025 05:05:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1750241112;
 bh=SUPIbMRvcUOUX0yS8ijo8OimduZh/OQY25aJoVLxKbg=;
 h=From:To:CC:Subject:Date;
 b=HdoevnXeSifK8nPbNOn3kK0ZJhxE6tIzOjE+cx+Q0bCCguYCTeYzyhT1dC2kGPCEt
 BILOy7nAr27K5UNlzRq07nFOqqWPPQEaVzAJAIxFI3I9X/cELAftcSwvmW4OviQw/8
 MqC6S+QyL8sCOaN23fpgXrHesK329WOyhJ3mfwoI=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
 by fllvem-sh03.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 55IA5CUZ2646800
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
 Wed, 18 Jun 2025 05:05:12 -0500
Received: from DLEE105.ent.ti.com (157.170.170.35) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Wed, 18
 Jun 2025 05:05:10 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Wed, 18 Jun 2025 05:05:10 -0500
Received: from localhost (jayesh-hp-z2-tower-g5-workstation.dhcp.ti.com
 [172.24.227.143])
 by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 55IA59gi3290106;
 Wed, 18 Jun 2025 05:05:10 -0500
From: Jayesh Choudhary <j-choudhary@ti.com>
To: <jyri.sarha@iki.fi>, <dri-devel@lists.freedesktop.org>, <devarsht@ti.com>, 
 <tomi.valkeinen@ideasonboard.com>
CC: <maarten.lankhorst@linux.intel.com>, <mripard@kernel.org>,
 <tzimmermann@suse.de>, <airlied@gmail.com>, <simona@ffwll.ch>,
 <linux-kernel@vger.kernel.org>, <j-choudhary@ti.com>
Subject: [PATCH v2] drm/tidss: Decouple max_pclk from tidss feats to remove
 clock dependency
Date: Wed, 18 Jun 2025 15:35:09 +0530
Message-ID: <20250618100509.20386-1-j-choudhary@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

TIDSS hardware by itself does not have variable max_pclk for each VP.
Each VP supports a fixed maximum pixel clock. K2 devices and AM62*
devices uses "ultra-light" version where each VP supports a max of
300MHz whereas J7* devices uses TIDSS where all VP can support a
max pclk of 600MHz.
The limitation that has been modeled till now comes from the clock
(PLL can only be programmed to a particular max value). Due to this
we end up using different compatible for each SoC when the clocking
architecture changes for VPs, even when the hardware is essentially
the same.
max_pclk cannot be entirely removed since the display controller
should tell if a particular mode clock can be supported or not in crtc's
"mode_valid()" call. So remove "max_pclk_khz" from the static display
feat and add it to "tidss_device" structure which would be modified in
runtime. In mode_valid() call, check if a best frequency match for mode
clock can be found or not using "clk_round_rate()". Based on that,
propagate "max_pclk" and check max_clk again only if the requested mode
clock is greater than saved value. (As the preferred display mode is
usually the max resolution, driver ends up checking the maximum clock
the first time itself which is used in subsequent checks)
Since TIDSS display controller provides clock tolerance of 5%, we use
this while checking the max_pclk. Also, move up "dispc_pclk_diff()"
before it is called.

This will make the existing compatibles reusable.

Signed-off-by: Jayesh Choudhary <j-choudhary@ti.com>
---

Changelog v1->v2:
- Rebase it on linux-next after OLDI support series[0] as all of its
  patches are reviewed and tested and it touches one of the functions
  used.
  
v1 patch link:
<https://lore.kernel.org/all/20250618075804.139844-1-j-choudhary@ti.com/>

Test log on TI's J784S4 SoC with a couple of downstream patches
to integrate DSI support on one of the video ports:
<https://gist.github.com/Jayesh2000/ad4ab87028740efa60e5eb83fb892097>

From the logs, we can see that for CLK ID 218 (DSS), we do not have to
call sci_clk_determine_rate() multiple times. So there is very little
overhead of this call even with multiple mode_valid() called during
display run.
From weston-simple-egl application, I have seen that there is no frame
drop or performance impact.

Once this patch gets in, I will send patches for AM62P and J722S DSS
support.

[0]: https://lore.kernel.org/all/20250528122544.817829-1-aradhya.bhatia@linux.dev/

 drivers/gpu/drm/tidss/tidss_dispc.c | 74 ++++++++++++-----------------
 drivers/gpu/drm/tidss/tidss_dispc.h |  1 -
 drivers/gpu/drm/tidss/tidss_drv.h   |  2 +
 3 files changed, 33 insertions(+), 44 deletions(-)

diff --git a/drivers/gpu/drm/tidss/tidss_dispc.c b/drivers/gpu/drm/tidss/tidss_dispc.c
index c0277fa36425..ad9ffc3685b4 100644
--- a/drivers/gpu/drm/tidss/tidss_dispc.c
+++ b/drivers/gpu/drm/tidss/tidss_dispc.c
@@ -58,10 +58,6 @@ static const u16 tidss_k2g_common_regs[DISPC_COMMON_REG_TABLE_LEN] = {
 const struct dispc_features dispc_k2g_feats = {
 	.min_pclk_khz = 4375,
 
-	.max_pclk_khz = {
-		[DISPC_VP_DPI] = 150000,
-	},
-
 	/*
 	 * XXX According TRM the RGB input buffer width up to 2560 should
 	 *     work on 3 taps, but in practice it only works up to 1280.
@@ -144,11 +140,6 @@ static const u16 tidss_am65x_common_regs[DISPC_COMMON_REG_TABLE_LEN] = {
 };
 
 const struct dispc_features dispc_am65x_feats = {
-	.max_pclk_khz = {
-		[DISPC_VP_DPI] = 165000,
-		[DISPC_VP_OLDI_AM65X] = 165000,
-	},
-
 	.scaling = {
 		.in_width_max_5tap_rgb = 1280,
 		.in_width_max_3tap_rgb = 2560,
@@ -244,11 +235,6 @@ static const u16 tidss_j721e_common_regs[DISPC_COMMON_REG_TABLE_LEN] = {
 };
 
 const struct dispc_features dispc_j721e_feats = {
-	.max_pclk_khz = {
-		[DISPC_VP_DPI] = 170000,
-		[DISPC_VP_INTERNAL] = 600000,
-	},
-
 	.scaling = {
 		.in_width_max_5tap_rgb = 2048,
 		.in_width_max_3tap_rgb = 4096,
@@ -315,11 +301,6 @@ const struct dispc_features dispc_j721e_feats = {
 };
 
 const struct dispc_features dispc_am625_feats = {
-	.max_pclk_khz = {
-		[DISPC_VP_DPI] = 165000,
-		[DISPC_VP_INTERNAL] = 170000,
-	},
-
 	.scaling = {
 		.in_width_max_5tap_rgb = 1280,
 		.in_width_max_3tap_rgb = 2560,
@@ -380,10 +361,6 @@ const struct dispc_features dispc_am62a7_feats = {
 	 * if the code reaches dispc_mode_valid with VP1,
 	 * it should return MODE_BAD.
 	 */
-	.max_pclk_khz = {
-		[DISPC_VP_TIED_OFF] = 0,
-		[DISPC_VP_DPI] = 165000,
-	},
 
 	.scaling = {
 		.in_width_max_5tap_rgb = 1280,
@@ -441,10 +418,6 @@ const struct dispc_features dispc_am62a7_feats = {
 };
 
 const struct dispc_features dispc_am62l_feats = {
-	.max_pclk_khz = {
-		[DISPC_VP_DPI] = 165000,
-	},
-
 	.subrev = DISPC_AM62L,
 
 	.common = "common",
@@ -1347,25 +1320,48 @@ static void dispc_vp_set_default_color(struct dispc_device *dispc,
 			DISPC_OVR_DEFAULT_COLOR2, (v >> 32) & 0xffff);
 }
 
+/*
+ * Calculate the percentage difference between the requested pixel clock rate
+ * and the effective rate resulting from calculating the clock divider value.
+ */
+unsigned int dispc_pclk_diff(unsigned long rate, unsigned long real_rate)
+{
+	int r = rate / 100, rr = real_rate / 100;
+
+	return (unsigned int)(abs(((rr - r) * 100) / r));
+}
+
+static int check_max_pixel_clock(struct dispc_device *dispc,
+				 u32 hw_videoport, unsigned long clock)
+{
+	if (clock > dispc->tidss->max_pclk[hw_videoport]) {
+		unsigned long round_clock = clk_round_rate(dispc->vp_clk[hw_videoport], clock);
+
+		if (dispc_pclk_diff(clock, round_clock) > 5)
+			return -EINVAL;
+
+		dispc->tidss->max_pclk[hw_videoport] = round_clock;
+	}
+
+	return 0;
+}
+
 enum drm_mode_status dispc_vp_mode_valid(struct dispc_device *dispc,
 					 u32 hw_videoport,
 					 const struct drm_display_mode *mode)
 {
 	u32 hsw, hfp, hbp, vsw, vfp, vbp;
 	enum dispc_vp_bus_type bus_type;
-	int max_pclk;
 
 	bus_type = dispc->feat->vp_bus_type[hw_videoport];
 
-	max_pclk = dispc->feat->max_pclk_khz[bus_type];
-
-	if (WARN_ON(max_pclk == 0))
+	if (bus_type == DISPC_VP_TIED_OFF)
 		return MODE_BAD;
 
 	if (mode->clock < dispc->feat->min_pclk_khz)
 		return MODE_CLOCK_LOW;
 
-	if (mode->clock > max_pclk)
+	if (check_max_pixel_clock(dispc, hw_videoport, mode->clock * 1000))
 		return MODE_CLOCK_HIGH;
 
 	if (mode->hdisplay > 4096)
@@ -1437,17 +1433,6 @@ void dispc_vp_disable_clk(struct dispc_device *dispc, u32 hw_videoport)
 	clk_disable_unprepare(dispc->vp_clk[hw_videoport]);
 }
 
-/*
- * Calculate the percentage difference between the requested pixel clock rate
- * and the effective rate resulting from calculating the clock divider value.
- */
-unsigned int dispc_pclk_diff(unsigned long rate, unsigned long real_rate)
-{
-	int r = rate / 100, rr = real_rate / 100;
-
-	return (unsigned int)(abs(((rr - r) * 100) / r));
-}
-
 int dispc_vp_set_clk_rate(struct dispc_device *dispc, u32 hw_videoport,
 			  unsigned long rate)
 {
@@ -3087,6 +3072,9 @@ int dispc_init(struct tidss_device *tidss)
 	}
 	dev_dbg(dev, "DSS fclk %lu Hz\n", clk_get_rate(dispc->fclk));
 
+	for (i = 0; i < dispc->feat->num_vps; i++)
+		dispc->tidss->max_pclk[i] = 0;
+
 	of_property_read_u32(dispc->dev->of_node, "max-memory-bandwidth",
 			     &dispc->memory_bandwidth_limit);
 
diff --git a/drivers/gpu/drm/tidss/tidss_dispc.h b/drivers/gpu/drm/tidss/tidss_dispc.h
index b8614f62186c..45b1a8aa9089 100644
--- a/drivers/gpu/drm/tidss/tidss_dispc.h
+++ b/drivers/gpu/drm/tidss/tidss_dispc.h
@@ -75,7 +75,6 @@ enum dispc_dss_subrevision {
 
 struct dispc_features {
 	int min_pclk_khz;
-	int max_pclk_khz[DISPC_VP_MAX_BUS_TYPE];
 
 	struct dispc_features_scaling scaling;
 
diff --git a/drivers/gpu/drm/tidss/tidss_drv.h b/drivers/gpu/drm/tidss/tidss_drv.h
index d14d5d28f0a3..59c67ae8e721 100644
--- a/drivers/gpu/drm/tidss/tidss_drv.h
+++ b/drivers/gpu/drm/tidss/tidss_drv.h
@@ -22,6 +22,8 @@ struct tidss_device {
 
 	const struct dispc_features *feat;
 	struct dispc_device *dispc;
+	long max_pclk[TIDSS_MAX_PORTS];
+
 
 	unsigned int num_crtcs;
 	struct drm_crtc *crtcs[TIDSS_MAX_PORTS];
-- 
2.34.1

