Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BACC25C798
	for <lists+dri-devel@lfdr.de>; Thu,  3 Sep 2020 18:57:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D27DB6EA12;
	Thu,  3 Sep 2020 16:57:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5BF636E201
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Sep 2020 16:57:24 +0000 (UTC)
Received: from [2a0a:edc0:0:1101:1d::39] (helo=dude03.red.stw.pengutronix.de)
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <mtr@pengutronix.de>)
 id 1kDsY5-0003YE-GK; Thu, 03 Sep 2020 18:57:22 +0200
Received: from mtr by dude03.red.stw.pengutronix.de with local (Exim 4.92)
 (envelope-from <mtr@dude03.red.stw.pengutronix.de>)
 id 1kDsY3-005L3c-Mc; Thu, 03 Sep 2020 18:57:19 +0200
From: Michael Tretter <m.tretter@pengutronix.de>
To: dri-devel@lists.freedesktop.org,
	linux-samsung-soc@vger.kernel.org
Date: Thu,  3 Sep 2020 18:57:13 +0200
Message-Id: <20200903165717.1272492-13-m.tretter@pengutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200903165717.1272492-1-m.tretter@pengutronix.de>
References: <20200903165717.1272492-1-m.tretter@pengutronix.de>
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:1101:1d::39
X-SA-Exim-Mail-From: mtr@pengutronix.de
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on
 metis.ext.pengutronix.de
X-Spam-Level: 
X-Spam-Status: No, score=-0.4 required=4.0 tests=BAYES_00,RDNS_NONE,
 SPF_HELO_NONE,SPF_SOFTFAIL autolearn=no autolearn_force=no
 version=3.4.2
Subject: [PATCH 12/16] drm/exynos: use identifier instead of register offsets
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on metis.ext.pengutronix.de)
X-PTX-Original-Recipient: dri-devel@lists.freedesktop.org
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
Cc: Michael Tretter <m.tretter@pengutronix.de>, krzk@kernel.org,
 Laurent.pinchart@ideasonboard.com, kernel@pengutronix.de,
 narmstrong@baylibre.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Different revisions of the MIPI-DSI PHY have slightly different register
layouts. Currently, the register layout was stored per platform, which
makes it necessary to define the layout for each new platform.

Keep the register layout in the driver and use identifiers to specify
which register layout shall be used on a platform.

Signed-off-by: Michael Tretter <m.tretter@pengutronix.de>
---
 drivers/gpu/drm/exynos/exynos_drm_dsi.c | 54 ++++++++++++++++---------
 1 file changed, 36 insertions(+), 18 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_dsi.c b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
index 21db18ae0772..287bc6e9b3ca 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_dsi.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
@@ -239,8 +239,13 @@ struct exynos_dsi_transfer {
 #define DSIM_STATE_CMD_LPM		BIT(2)
 #define DSIM_STATE_VIDOUT_AVAILABLE	BIT(3)
 
+enum exynos_reg_offset {
+	EXYNOS_REG_OFS,
+	EXYNOS5433_REG_OFS
+};
+
 struct exynos_dsi_driver_data {
-	const unsigned int *reg_ofs;
+	enum exynos_reg_offset reg_ofs;
 	unsigned int plltmr_reg;
 	unsigned int has_freqband:1;
 	unsigned int has_clklane_stop:1;
@@ -315,18 +320,6 @@ enum reg_idx {
 	NUM_REGS
 };
 
-static inline void exynos_dsi_write(struct exynos_dsi *dsi, enum reg_idx idx,
-				    u32 val)
-{
-
-	writel(val, dsi->reg_base + dsi->driver_data->reg_ofs[idx]);
-}
-
-static inline u32 exynos_dsi_read(struct exynos_dsi *dsi, enum reg_idx idx)
-{
-	return readl(dsi->reg_base + dsi->driver_data->reg_ofs[idx]);
-}
-
 static const unsigned int exynos_reg_ofs[] = {
 	[DSIM_STATUS_REG] =  0x00,
 	[DSIM_SWRST_REG] =  0x04,
@@ -375,6 +368,31 @@ static const unsigned int exynos5433_reg_ofs[] = {
 	[DSIM_PHYTIMING2_REG] = 0xBC,
 };
 
+static inline void exynos_dsi_write(struct exynos_dsi *dsi, enum reg_idx idx,
+				    u32 val)
+{
+	const unsigned int *reg_ofs;
+
+	if (dsi->driver_data->reg_ofs == EXYNOS5433_REG_OFS)
+		reg_ofs = exynos5433_reg_ofs;
+	else
+		reg_ofs = exynos_reg_ofs;
+
+	writel(val, dsi->reg_base + reg_ofs[idx]);
+}
+
+static inline u32 exynos_dsi_read(struct exynos_dsi *dsi, enum reg_idx idx)
+{
+	const unsigned int *reg_ofs;
+
+	if (dsi->driver_data->reg_ofs == EXYNOS5433_REG_OFS)
+		reg_ofs = exynos5433_reg_ofs;
+	else
+		reg_ofs = exynos_reg_ofs;
+
+	return readl(dsi->reg_base + reg_ofs[idx]);
+}
+
 enum reg_value_idx {
 	RESET_TYPE,
 	PLL_TIMER,
@@ -448,7 +466,7 @@ static const unsigned int exynos5433_reg_values[] = {
 };
 
 static const struct exynos_dsi_driver_data exynos3_dsi_driver_data = {
-	.reg_ofs = exynos_reg_ofs,
+	.reg_ofs = EXYNOS_REG_OFS,
 	.plltmr_reg = 0x50,
 	.has_freqband = 1,
 	.has_clklane_stop = 1,
@@ -460,7 +478,7 @@ static const struct exynos_dsi_driver_data exynos3_dsi_driver_data = {
 };
 
 static const struct exynos_dsi_driver_data exynos4_dsi_driver_data = {
-	.reg_ofs = exynos_reg_ofs,
+	.reg_ofs = EXYNOS_REG_OFS,
 	.plltmr_reg = 0x50,
 	.has_freqband = 1,
 	.has_clklane_stop = 1,
@@ -472,7 +490,7 @@ static const struct exynos_dsi_driver_data exynos4_dsi_driver_data = {
 };
 
 static const struct exynos_dsi_driver_data exynos5_dsi_driver_data = {
-	.reg_ofs = exynos_reg_ofs,
+	.reg_ofs = EXYNOS_REG_OFS,
 	.plltmr_reg = 0x58,
 	.num_clks = 2,
 	.max_freq = 1000,
@@ -482,7 +500,7 @@ static const struct exynos_dsi_driver_data exynos5_dsi_driver_data = {
 };
 
 static const struct exynos_dsi_driver_data exynos5433_dsi_driver_data = {
-	.reg_ofs = exynos5433_reg_ofs,
+	.reg_ofs = EXYNOS5433_REG_OFS,
 	.plltmr_reg = 0xa0,
 	.has_clklane_stop = 1,
 	.num_clks = 5,
@@ -493,7 +511,7 @@ static const struct exynos_dsi_driver_data exynos5433_dsi_driver_data = {
 };
 
 static const struct exynos_dsi_driver_data exynos5422_dsi_driver_data = {
-	.reg_ofs = exynos5433_reg_ofs,
+	.reg_ofs = EXYNOS5433_REG_OFS,
 	.plltmr_reg = 0xa0,
 	.has_clklane_stop = 1,
 	.num_clks = 2,
-- 
2.20.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
