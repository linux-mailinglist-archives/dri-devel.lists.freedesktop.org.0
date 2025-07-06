Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 40954AFA6F4
	for <lists+dri-devel@lfdr.de>; Sun,  6 Jul 2025 20:26:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A85C110E107;
	Sun,  6 Jul 2025 18:26:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=disroot.org header.i=@disroot.org header.b="D1jXqUPE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 523AC10E107
 for <dri-devel@lists.freedesktop.org>; Sun,  6 Jul 2025 18:26:08 +0000 (UTC)
Received: from mail01.disroot.lan (localhost [127.0.0.1])
 by disroot.org (Postfix) with ESMTP id 2844F20E83;
 Sun,  6 Jul 2025 20:26:07 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id T8w2O4mm5w3t; Sun,  6 Jul 2025 20:26:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
 t=1751826365; bh=3+vm7iL4YxeQBqkYH0pzMX1sP4BS6s4QthWdNBrsH5A=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc;
 b=D1jXqUPEZubQQsLzI6hTvN2mY9f04AZlv+TBmWP8aymUXbY0mOdwht7C4TzG/PIjp
 LYYANp5epFZlOqJnvs1bLgbb96j9QO3pmjuXocI6TGM3ccvijrSBr0YPgh2EpMuOnJ
 63DDCqRry19JA5+IUQQsMH5nRxB1zmJjYsEKG0YdDVWUjprylnUTldzspgqnIw4AsV
 1OJYUK7evAUuyLqIHxlitMEI5L3NGvqyxKs+ZI6EIAnNTC+bn7EoEDh1uQ5ZtOcnie
 M6CX3IgzLrD6ErID/KksSFtWL7x4hV3X43DZg+gL5uVl67gogW53v8mgbVH1X/TT46
 R/hsexQkk5RYg==
From: Kaustabh Chakraborty <kauschluss@disroot.org>
Date: Sun, 06 Jul 2025 23:55:35 +0530
Subject: [PATCH v3 01/13] drm/bridge: samsung-dsim: support separate LINK
 and DPHY status registers
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250706-exynos7870-dsim-v3-1-9879fb9a644d@disroot.org>
References: <20250706-exynos7870-dsim-v3-0-9879fb9a644d@disroot.org>
In-Reply-To: <20250706-exynos7870-dsim-v3-0-9879fb9a644d@disroot.org>
To: Inki Dae <inki.dae@samsung.com>, Jagan Teki <jagan@amarulasolutions.com>, 
 Marek Szyprowski <m.szyprowski@samsung.com>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Seung-Woo Kim <sw0312.kim@samsung.com>, 
 Kyungmin Park <kyungmin.park@samsung.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, 
 Kaustabh Chakraborty <kauschluss@disroot.org>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1751826342; l=4978;
 i=kauschluss@disroot.org; s=20250202; h=from:subject:message-id;
 bh=3+vm7iL4YxeQBqkYH0pzMX1sP4BS6s4QthWdNBrsH5A=;
 b=dc4BfCEAV7fGcT4lRM/RcmpmWodN3OAhoQq4Ka5r0EOaDkmg2QdBfV/MTo+epFmDvryOvfbq1
 U2eTd2rTP58ABcWhWRYs4oXspPwUz+xr7z0y+o0MIla9dKbxwZcI/sm
X-Developer-Key: i=kauschluss@disroot.org; a=ed25519;
 pk=h2xeR+V2I1+GrfDPAhZa3M+NWA0Cnbdkkq1bH3ct1hE=
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

Exynos7870's DSIM has separate registers for LINK and DPHY status. This
is in contrast to older variants in the driver which use a single
register for both.

Add a driver data flag which indicates that the device variant supports
the legacy status register. Change the register read calls
appropriately.

Suggested-by: Inki Dae <inki.dae@samsung.com>
Signed-off-by: Kaustabh Chakraborty <kauschluss@disroot.org>
---
 drivers/gpu/drm/bridge/samsung-dsim.c | 22 ++++++++++++++++++----
 include/drm/bridge/samsung-dsim.h     |  1 +
 2 files changed, 19 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/bridge/samsung-dsim.c b/drivers/gpu/drm/bridge/samsung-dsim.c
index c4997795db18280903570646b0a5b2c03b666307..0b061ad0ecec158f994846da08fae59f74bfa091 100644
--- a/drivers/gpu/drm/bridge/samsung-dsim.c
+++ b/drivers/gpu/drm/bridge/samsung-dsim.c
@@ -31,7 +31,7 @@
 /* returns true iff both arguments logically differs */
 #define NEQV(a, b) (!(a) ^ !(b))
 
-/* DSIM_STATUS */
+/* DSIM_STATUS or DSIM_DPHY_STATUS */
 #define DSIM_STOP_STATE_DAT(x)		(((x) & 0xf) << 0)
 #define DSIM_STOP_STATE_CLK		BIT(8)
 #define DSIM_TX_READY_HS_CLK		BIT(10)
@@ -240,7 +240,9 @@ enum samsung_dsim_transfer_type {
 };
 
 enum reg_idx {
-	DSIM_STATUS_REG,	/* Status register */
+	DSIM_STATUS_REG,	/* Status register (legacy) */
+	DSIM_LINK_STATUS_REG,	/* Link status register */
+	DSIM_DPHY_STATUS_REG,	/* D-PHY status register */
 	DSIM_SWRST_REG,		/* Software reset register */
 	DSIM_CLKCTRL_REG,	/* Clock control register */
 	DSIM_TIMEOUT_REG,	/* Time out register */
@@ -405,6 +407,7 @@ static const unsigned int imx8mm_dsim_reg_values[] = {
 static const struct samsung_dsim_driver_data exynos3_dsi_driver_data = {
 	.reg_ofs = exynos_reg_ofs,
 	.plltmr_reg = 0x50,
+	.has_legacy_status_reg = 1,
 	.has_freqband = 1,
 	.has_clklane_stop = 1,
 	.num_clks = 2,
@@ -424,6 +427,7 @@ static const struct samsung_dsim_driver_data exynos3_dsi_driver_data = {
 static const struct samsung_dsim_driver_data exynos4_dsi_driver_data = {
 	.reg_ofs = exynos_reg_ofs,
 	.plltmr_reg = 0x50,
+	.has_legacy_status_reg = 1,
 	.has_freqband = 1,
 	.has_clklane_stop = 1,
 	.num_clks = 2,
@@ -443,6 +447,7 @@ static const struct samsung_dsim_driver_data exynos4_dsi_driver_data = {
 static const struct samsung_dsim_driver_data exynos5_dsi_driver_data = {
 	.reg_ofs = exynos_reg_ofs,
 	.plltmr_reg = 0x58,
+	.has_legacy_status_reg = 1,
 	.num_clks = 2,
 	.max_freq = 1000,
 	.wait_for_reset = 1,
@@ -459,6 +464,7 @@ static const struct samsung_dsim_driver_data exynos5_dsi_driver_data = {
 static const struct samsung_dsim_driver_data exynos5433_dsi_driver_data = {
 	.reg_ofs = exynos5433_reg_ofs,
 	.plltmr_reg = 0xa0,
+	.has_legacy_status_reg = 1,
 	.has_clklane_stop = 1,
 	.num_clks = 5,
 	.max_freq = 1500,
@@ -476,6 +482,7 @@ static const struct samsung_dsim_driver_data exynos5433_dsi_driver_data = {
 static const struct samsung_dsim_driver_data exynos5422_dsi_driver_data = {
 	.reg_ofs = exynos5433_reg_ofs,
 	.plltmr_reg = 0xa0,
+	.has_legacy_status_reg = 1,
 	.has_clklane_stop = 1,
 	.num_clks = 2,
 	.max_freq = 1500,
@@ -493,6 +500,7 @@ static const struct samsung_dsim_driver_data exynos5422_dsi_driver_data = {
 static const struct samsung_dsim_driver_data imx8mm_dsi_driver_data = {
 	.reg_ofs = exynos5433_reg_ofs,
 	.plltmr_reg = 0xa0,
+	.has_legacy_status_reg = 1,
 	.has_clklane_stop = 1,
 	.num_clks = 2,
 	.max_freq = 2100,
@@ -688,7 +696,10 @@ static unsigned long samsung_dsim_set_pll(struct samsung_dsim *dsi,
 			dev_err(dsi->dev, "PLL failed to stabilize\n");
 			return 0;
 		}
-		reg = samsung_dsim_read(dsi, DSIM_STATUS_REG);
+		if (driver_data->has_legacy_status_reg)
+			reg = samsung_dsim_read(dsi, DSIM_STATUS_REG);
+		else
+			reg = samsung_dsim_read(dsi, DSIM_LINK_STATUS_REG);
 	} while ((reg & DSIM_PLL_STABLE) == 0);
 
 	dsi->hs_clock = fout;
@@ -962,7 +973,10 @@ static int samsung_dsim_init_link(struct samsung_dsim *dsi)
 			return -EFAULT;
 		}
 
-		reg = samsung_dsim_read(dsi, DSIM_STATUS_REG);
+		if (driver_data->has_legacy_status_reg)
+			reg = samsung_dsim_read(dsi, DSIM_STATUS_REG);
+		else
+			reg = samsung_dsim_read(dsi, DSIM_DPHY_STATUS_REG);
 		if ((reg & DSIM_STOP_STATE_DAT(lanes_mask))
 		    != DSIM_STOP_STATE_DAT(lanes_mask))
 			continue;
diff --git a/include/drm/bridge/samsung-dsim.h b/include/drm/bridge/samsung-dsim.h
index 9764d6eb5beb98b5b9427c5c4775c37b24dd6e17..d7877191bad155e877b2812daeb81ac0be6f735c 100644
--- a/include/drm/bridge/samsung-dsim.h
+++ b/include/drm/bridge/samsung-dsim.h
@@ -53,6 +53,7 @@ struct samsung_dsim_transfer {
 struct samsung_dsim_driver_data {
 	const unsigned int *reg_ofs;
 	unsigned int plltmr_reg;
+	unsigned int has_legacy_status_reg:1;
 	unsigned int has_freqband:1;
 	unsigned int has_clklane_stop:1;
 	unsigned int has_broken_fifoctrl_emptyhdr:1;

-- 
2.49.0

