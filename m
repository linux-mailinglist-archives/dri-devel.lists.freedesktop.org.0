Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 28AC2AD7593
	for <lists+dri-devel@lfdr.de>; Thu, 12 Jun 2025 17:18:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E22D10E89A;
	Thu, 12 Jun 2025 15:18:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=disroot.org header.i=@disroot.org header.b="erHma7rf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9068410E89A
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Jun 2025 15:18:41 +0000 (UTC)
Received: from mail01.disroot.lan (localhost [127.0.0.1])
 by disroot.org (Postfix) with ESMTP id 35F3925BB3;
 Thu, 12 Jun 2025 17:18:40 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DM5PEKpx_US1; Thu, 12 Jun 2025 17:18:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
 t=1749741519; bh=ga+CnJtjgV5748cza4LG4gu4ebkb1JvJHswsAx84vNM=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc;
 b=erHma7rfWlcmU4IJ6Bs6NFwqER9uJ54B9mCdJkblbfhy+4NKpC+yviv6pGU7HwAwr
 omeKioAEH5enRlMtXDi/KXK6AeFIydGo5LXDwrSgnryO5V84MQ3MmYxwrPRpt0YI3F
 pmuOpjmS1c22/kFMEyvk5bbhpTddbSWTIzlXxq4ysu1ppjLK9zVDZEFv+or4SGiMhA
 Hmpu05GujyhxIpKvnR/nmprfBIFiQJh6PLV2ywV9MxGkpHVjusIe7C6v71JUvgM6+Y
 vcDtOW6YVd7rnbR7ZaSZCz0MIiOCEAMP20UE8memj5M8xTSjM3q7igXl6eQrlXQEsY
 V528ze6Bo+hWA==
From: Kaustabh Chakraborty <kauschluss@disroot.org>
Date: Thu, 12 Jun 2025 20:48:05 +0530
Subject: [PATCH 01/12] drm/bridge: samsung-dsim: separate LINK and DPHY
 status registers
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250612-exynos7870-dsim-v1-1-1a330bca89df@disroot.org>
References: <20250612-exynos7870-dsim-v1-0-1a330bca89df@disroot.org>
In-Reply-To: <20250612-exynos7870-dsim-v1-0-1a330bca89df@disroot.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1749741499; l=2711;
 i=kauschluss@disroot.org; s=20250202; h=from:subject:message-id;
 bh=ga+CnJtjgV5748cza4LG4gu4ebkb1JvJHswsAx84vNM=;
 b=PKgLap9WeJx5HzuIdAn6iuuhJVjSoSKJGa6O6hmCk52Vt42aAUOVv9Q69GbKopFEwfuJqLPtg
 Atf3Bb82hifBLO8Q0gzr4Ds47Vb8rmO49CtYPI68tz3luHplM1mRqsK
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
is in contrast to other devices in the driver which use a single
register for both.

Add their respective entries in the register list. Devices having a
single status register have been assigned the same offset for both
entries.

Signed-off-by: Kaustabh Chakraborty <kauschluss@disroot.org>
---
 drivers/gpu/drm/bridge/samsung-dsim.c | 15 +++++++++------
 1 file changed, 9 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/bridge/samsung-dsim.c b/drivers/gpu/drm/bridge/samsung-dsim.c
index 0014c497e3fe7d8349a119dbdda30d65d816cccf..c418d9e30222ec47eec05bbdefef3df8b7fec3c4 100644
--- a/drivers/gpu/drm/bridge/samsung-dsim.c
+++ b/drivers/gpu/drm/bridge/samsung-dsim.c
@@ -29,7 +29,7 @@
 /* returns true iff both arguments logically differs */
 #define NEQV(a, b) (!(a) ^ !(b))
 
-/* DSIM_STATUS */
+/* DSIM_DPHY_STATUS */
 #define DSIM_STOP_STATE_DAT(x)		(((x) & 0xf) << 0)
 #define DSIM_STOP_STATE_CLK		BIT(8)
 #define DSIM_TX_READY_HS_CLK		BIT(10)
@@ -238,7 +238,8 @@ enum samsung_dsim_transfer_type {
 };
 
 enum reg_idx {
-	DSIM_STATUS_REG,	/* Status register */
+	DSIM_LINK_STATUS_REG,	/* Link status register */
+	DSIM_DPHY_STATUS_REG,	/* D-PHY status register */
 	DSIM_SWRST_REG,		/* Software reset register */
 	DSIM_CLKCTRL_REG,	/* Clock control register */
 	DSIM_TIMEOUT_REG,	/* Time out register */
@@ -263,7 +264,8 @@ enum reg_idx {
 };
 
 static const unsigned int exynos_reg_ofs[] = {
-	[DSIM_STATUS_REG] =  0x00,
+	[DSIM_LINK_STATUS_REG] =  0x00,
+	[DSIM_DPHY_STATUS_REG] =  0x00,
 	[DSIM_SWRST_REG] =  0x04,
 	[DSIM_CLKCTRL_REG] =  0x08,
 	[DSIM_TIMEOUT_REG] =  0x0c,
@@ -287,7 +289,8 @@ static const unsigned int exynos_reg_ofs[] = {
 };
 
 static const unsigned int exynos5433_reg_ofs[] = {
-	[DSIM_STATUS_REG] = 0x04,
+	[DSIM_LINK_STATUS_REG] = 0x04,
+	[DSIM_DPHY_STATUS_REG] = 0x04,
 	[DSIM_SWRST_REG] = 0x0C,
 	[DSIM_CLKCTRL_REG] = 0x10,
 	[DSIM_TIMEOUT_REG] = 0x14,
@@ -689,7 +692,7 @@ static unsigned long samsung_dsim_set_pll(struct samsung_dsim *dsi,
 			dev_err(dsi->dev, "PLL failed to stabilize\n");
 			return 0;
 		}
-		reg = samsung_dsim_read(dsi, DSIM_STATUS_REG);
+		reg = samsung_dsim_read(dsi, DSIM_LINK_STATUS_REG);
 	} while ((reg & DSIM_PLL_STABLE) == 0);
 
 	dsi->hs_clock = fout;
@@ -965,7 +968,7 @@ static int samsung_dsim_init_link(struct samsung_dsim *dsi)
 			return -EFAULT;
 		}
 
-		reg = samsung_dsim_read(dsi, DSIM_STATUS_REG);
+		reg = samsung_dsim_read(dsi, DSIM_DPHY_STATUS_REG);
 		if ((reg & DSIM_STOP_STATE_DAT(lanes_mask))
 		    != DSIM_STOP_STATE_DAT(lanes_mask))
 			continue;

-- 
2.49.0

