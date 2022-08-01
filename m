Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C0BC586BD5
	for <lists+dri-devel@lfdr.de>; Mon,  1 Aug 2022 15:21:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7713CB2A0B;
	Mon,  1 Aug 2022 13:20:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1080AAE1E2
 for <dri-devel@lists.freedesktop.org>; Mon,  1 Aug 2022 13:19:17 +0000 (UTC)
Received: from tr.lan (ip-86-49-12-201.bb.vodafone.cz [86.49.12.201])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 526FD844D6;
 Mon,  1 Aug 2022 15:19:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1659359956;
 bh=fiDzI9/ljZR9XvEJnAyDWJWCCzPVUV99tz3NKXfI/us=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=C/mggdkqnxYwEIgX/rJ/iSo2jDH6p7Dmgdo9hyPYY4vjU07cbdMiH2IxvZbX0vR0t
 oE2tN7kwdhVXHuYZiPEE3wDVmPybwxlkpcDjAdzu4uK6Yq61m93PzPw4UiEzXocgDE
 tgCUya+QRsBjbGMPEc3NzNZfeXwFW1C/M/SznEognn0nG9W5eaTwC/mC2ObUTfR7rp
 fRBIBV7HwubiVOSAO2mJdNWa2gYvD+GKnc4Hz4ZUMBNN1j0Gn/l55nFnCUI5R9TLFX
 i4bzmMTC6hz8USsdjoFk9vrFXICol4lpMgEaJ0ZOhbWtBK2wsa/ZVO3tFNSXbbfj5E
 Rr70e8J9YeEpQ==
From: Marek Vasut <marex@denx.de>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 2/2] drm: bridge: icn6211: Add support for RGB/BGR swap
Date: Mon,  1 Aug 2022 15:19:01 +0200
Message-Id: <20220801131901.183090-2-marex@denx.de>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220801131901.183090-1-marex@denx.de>
References: <20220801131901.183090-1-marex@denx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: clamav-milter 0.103.6 at phobos.denx.de
X-Virus-Status: Clean
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
Cc: Marek Vasut <marex@denx.de>, robert.foss@linaro.org,
 Jagan Teki <jagan@amarulasolutions.com>, Sam Ravnborg <sam@ravnborg.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The ICN6211 is capable of swapping the output DPI RGB/BGR color channels,
implement support for this and add DT property "blue-and-red-swap" to
select the RGB/BGR channel order.

Signed-off-by: Marek Vasut <marex@denx.de>
Cc: Jagan Teki <jagan@amarulasolutions.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Linus Walleij <linus.walleij@linaro.org>
Cc: Robert Foss <robert.foss@linaro.org>
Cc: Sam Ravnborg <sam@ravnborg.org>
Cc: dri-devel@lists.freedesktop.org
---
 drivers/gpu/drm/bridge/chipone-icn6211.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/bridge/chipone-icn6211.c b/drivers/gpu/drm/bridge/chipone-icn6211.c
index 7ee1858bab321..7d64172373a35 100644
--- a/drivers/gpu/drm/bridge/chipone-icn6211.c
+++ b/drivers/gpu/drm/bridge/chipone-icn6211.c
@@ -30,6 +30,8 @@
 #define PD_CTRL(n)		(0x0a + ((n) & 0x3)) /* 0..3 */
 #define RST_CTRL(n)		(0x0e + ((n) & 0x1)) /* 0..1 */
 #define SYS_CTRL(n)		(0x10 + ((n) & 0x7)) /* 0..4 */
+#define SYS_CTRL_0_COLOR_ORDER_RGB	0x0
+#define SYS_CTRL_0_COLOR_ORDER_BGR	0x5
 #define SYS_CTRL_1_CLK_PHASE_MSK	GENMASK(5, 4)
 #define CLK_PHASE_0			0
 #define CLK_PHASE_1_4			1
@@ -155,6 +157,7 @@ struct chipone {
 	struct clk *refclk;
 	unsigned long refclk_rate;
 	bool interface_i2c;
+	bool color_swap;
 };
 
 static const struct regmap_range chipone_dsi_readable_ranges[] = {
@@ -426,7 +429,9 @@ static void chipone_atomic_enable(struct drm_bridge *bridge,
 	/* Configure PLL settings */
 	chipone_configure_pll(icn, mode);
 
-	chipone_writeb(icn, SYS_CTRL(0), 0x40);
+	chipone_writeb(icn, SYS_CTRL(0), 0x40 |
+		       (icn->color_swap ? SYS_CTRL_0_COLOR_ORDER_BGR :
+					  SYS_CTRL_0_COLOR_ORDER_RGB));
 	sys_ctrl_1 = 0x88;
 
 	if (bus_flags & DRM_BUS_FLAG_PIXDATA_DRIVE_POSEDGE)
@@ -680,6 +685,9 @@ static int chipone_parse_dt(struct chipone *icn)
 		return PTR_ERR(icn->enable_gpio);
 	}
 
+	icn->color_swap = of_property_read_bool(dev->of_node,
+						"blue-and-red-swap");
+
 	icn->panel_bridge = devm_drm_of_get_bridge(dev, dev->of_node, 1, 0);
 	if (IS_ERR(icn->panel_bridge))
 		return PTR_ERR(icn->panel_bridge);
-- 
2.35.1

