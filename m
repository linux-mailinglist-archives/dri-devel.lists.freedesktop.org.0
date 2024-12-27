Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D323B9FD38C
	for <lists+dri-devel@lfdr.de>; Fri, 27 Dec 2024 12:09:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4EED610E394;
	Fri, 27 Dec 2024 11:09:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linumiz.com header.i=@linumiz.com header.b="K+mmc0qC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from omta36.uswest2.a.cloudfilter.net
 (omta36.uswest2.a.cloudfilter.net [35.89.44.35])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A3A610E38D
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Dec 2024 11:09:36 +0000 (UTC)
Received: from eig-obgw-5007a.ext.cloudfilter.net ([10.0.29.141])
 by cmsmtp with ESMTPS
 id R46jtd7zWqvuoR8DntxjOx; Fri, 27 Dec 2024 11:09:36 +0000
Received: from md-in-79.webhostbox.net ([43.225.55.182]) by cmsmtp with ESMTPS
 id R8DltdxOX8PtxR8DmtlNpG; Fri, 27 Dec 2024 11:09:35 +0000
X-Authority-Analysis: v=2.4 cv=Fegxxo+6 c=1 sm=1 tr=0 ts=676e8aef
 a=LfuyaZh/8e9VOkaVZk0aRw==:117 a=kofhyyBXuK/oEhdxNjf66Q==:17
 a=IkcTkHD0fZMA:10 a=RZcAm9yDv7YA:10 a=-pn6D5nKLtMA:10 a=vU9dKmh3AAAA:8
 a=U3DMF0o1PY4y7HjVE7sA:9 a=QEXdDO2ut3YA:10 a=lcdGsAA1t286La22BbtU:22
 a=rsP06fVo5MYu2ilr0aT5:22 a=ZCPYImcxYIQFgLOT52_G:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=linumiz.com
 ; s=default; h=Cc:To:In-Reply-To:References:Message-Id:
 Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=dbYyqDxlPnUOcenlEsyd1+KMbnZL6BSy8ly64QBKbVQ=; b=K+mmc0qCD1oeBnmS8Ikf5mGTPh
 h+jzblvCCQfECKO8ISpEnomfDHd58ScOdegbccHnKPkIEmuW2laOgCO7A7taC3teqkhEwCW4+/QnC
 /VeXjJAIawTJWThTieaJbsthYHZidV4d0/t8k4M2GRnJ30+RHoiOsYEm7XpeDzV08uBUfe6DaAiYr
 /2MN4xG2abto2E9p+9oqjiRTBLC+MsZZoUe8RlvJgX4SmvgNCStHvrAIVk0jeG1CQcdKLCy5er6e+
 Tues0rIuKxbPtNAaYsY40NuFPFOH4lQeZSRszaHpYgho7gJAYs/nVMprhHdkBu9NWiMKdeasnqjF0
 YYL53Gcg==;
Received: from [122.165.245.213] (port=50828 helo=[127.0.1.1])
 by md-in-79.webhostbox.net with esmtpsa (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96.2)
 (envelope-from <parthiban@linumiz.com>) id 1tR8DY-000bEK-13;
 Fri, 27 Dec 2024 16:39:20 +0530
From: Parthiban Nallathambi <parthiban@linumiz.com>
Date: Fri, 27 Dec 2024 16:38:00 +0530
Subject: [PATCH 13/22] drm/sun4i: make tcon top tv0 optional
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241227-a133-display-support-v1-13-13b52f71fb14@linumiz.com>
References: <20241227-a133-display-support-v1-0-13b52f71fb14@linumiz.com>
In-Reply-To: <20241227-a133-display-support-v1-0-13b52f71fb14@linumiz.com>
To: Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>, 
 Robin Murphy <robin.murphy@arm.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Maxime Ripard <mripard@kernel.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
 Linus Walleij <linus.walleij@linaro.org>, Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>
Cc: iommu@lists.linux.dev, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org, 
 linux-phy@lists.infradead.org, 
 Parthiban Nallathambi <parthiban@linumiz.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1735297689; l=2767;
 i=parthiban@linumiz.com; s=20241125; h=from:subject:message-id;
 bh=Z1yBsrhc1T8q3fTFow1RSmWl9UXwRZd8FWpkoLs2A1A=;
 b=1d7aNRq2I2NijFkHAwRD1Rbm4xuW2LihHWK58pL81Pzcc5ItjJp9TlIPwLnfLhhWbRoHaLsEN
 5XTBxMkIJABBgwWXMm2Bak9KnYtqWPi9bX1/NDCI5LwA+QDtoEpt1t7
X-Developer-Key: i=parthiban@linumiz.com; a=ed25519;
 pk=PrcMZ/nwnHbeXNFUFUS833wF3DAX4hziDHEbBp1eNb8=
X-AntiAbuse: This header was added to track abuse,
 please include it with any abuse report
X-AntiAbuse: Primary Hostname - md-in-79.webhostbox.net
X-AntiAbuse: Original Domain - lists.freedesktop.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - linumiz.com
X-BWhitelist: no
X-Source-IP: 122.165.245.213
X-Source-L: No
X-Exim-ID: 1tR8DY-000bEK-13
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: ([127.0.1.1]) [122.165.245.213]:50828
X-Source-Auth: parthiban@linumiz.com
X-Email-Count: 367
X-Org: HG=dishared_whb_net_legacy;ORG=directi;
X-Source-Cap: bGludW1jbWM7aG9zdGdhdG9yO21kLWluLTc5LndlYmhvc3Rib3gubmV0
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfHx/KfqzrGQtoNWEXo5S31AdaE5kFBDe2dbFTrCm2ohAoH78e5wJUa8hl/j/ELw/ns29WMXMdc9JilZXnwQDArqydCu7ZxS4MEWnz9w/iK09DnLMVfvN
 AejlFR+EjG7b2FbuqsmV7BS7/PrL8En5FjarHlt6WuK5T/lY+QxPCWh45T3U7EtPwxQ/ZblYXocTwQz4KcmQWqlROqb/zLJriU3Y62UigOoaU0r+G3Wly4VL
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

current implementation of tcon top assumes tv0 is always present, which
isn't case in A100/A133 SoC's. Make tv0 optional by introducing another
control similar to tv1 and make existing users with true/present.

Signed-off-by: Parthiban Nallathambi <parthiban@linumiz.com>
---
 drivers/gpu/drm/sun4i/sun8i_tcon_top.c | 34 ++++++++++++++++++++--------------
 1 file changed, 20 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/sun4i/sun8i_tcon_top.c b/drivers/gpu/drm/sun4i/sun8i_tcon_top.c
index 8adda578c51b..bd9d0840ead7 100644
--- a/drivers/gpu/drm/sun4i/sun8i_tcon_top.c
+++ b/drivers/gpu/drm/sun4i/sun8i_tcon_top.c
@@ -16,6 +16,7 @@
 #include "sun8i_tcon_top.h"
 
 struct sun8i_tcon_top_quirks {
+	bool has_tcon_tv0;
 	bool has_tcon_tv1;
 	bool has_dsi;
 };
@@ -191,10 +192,11 @@ static int sun8i_tcon_top_bind(struct device *dev, struct device *master,
 	 * to TVE clock parent.
 	 */
 	i = 0;
-	clk_data->hws[CLK_TCON_TOP_TV0] =
-		sun8i_tcon_top_register_gate(dev, "tcon-tv0", regs,
-					     &tcon_top->reg_lock,
-					     TCON_TOP_TCON_TV0_GATE, i++);
+	if (quirks->has_tcon_tv0)
+		clk_data->hws[CLK_TCON_TOP_TV0] =
+			sun8i_tcon_top_register_gate(dev, "tcon-tv0", regs,
+						     &tcon_top->reg_lock,
+						     TCON_TOP_TCON_TV0_GATE, i++);
 
 	if (quirks->has_tcon_tv1)
 		clk_data->hws[CLK_TCON_TOP_TV1] =
@@ -208,16 +210,18 @@ static int sun8i_tcon_top_bind(struct device *dev, struct device *master,
 						     &tcon_top->reg_lock,
 						     TCON_TOP_TCON_DSI_GATE, i++);
 
-	for (i = 0; i < CLK_NUM; i++)
-		if (IS_ERR(clk_data->hws[i])) {
-			ret = PTR_ERR(clk_data->hws[i]);
-			goto err_unregister_gates;
-		}
+	if (i) {
+		for (i = 0; i < CLK_NUM; i++)
+			if (IS_ERR(clk_data->hws[i])) {
+				ret = PTR_ERR(clk_data->hws[i]);
+				goto err_unregister_gates;
+			}
 
-	ret = of_clk_add_hw_provider(dev->of_node, of_clk_hw_onecell_get,
-				     clk_data);
-	if (ret)
-		goto err_unregister_gates;
+		ret = of_clk_add_hw_provider(dev->of_node, of_clk_hw_onecell_get,
+				clk_data);
+		if (ret)
+			goto err_unregister_gates;
+	}
 
 	dev_set_drvdata(dev, tcon_top);
 
@@ -266,16 +270,18 @@ static void sun8i_tcon_top_remove(struct platform_device *pdev)
 }
 
 static const struct sun8i_tcon_top_quirks sun8i_r40_tcon_top_quirks = {
+	.has_tcon_tv0	= true,
 	.has_tcon_tv1	= true,
 	.has_dsi	= true,
 };
 
 static const struct sun8i_tcon_top_quirks sun20i_d1_tcon_top_quirks = {
+	.has_tcon_tv0	= true,
 	.has_dsi	= true,
 };
 
 static const struct sun8i_tcon_top_quirks sun50i_h6_tcon_top_quirks = {
-	/* Nothing special */
+	.has_tcon_tv0	= true,
 };
 
 /* sun4i_drv uses this list to check if a device node is a TCON TOP */

-- 
2.39.5

