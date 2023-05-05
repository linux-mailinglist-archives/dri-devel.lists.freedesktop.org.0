Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 950AD6F7C50
	for <lists+dri-devel@lfdr.de>; Fri,  5 May 2023 07:21:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 51F8D10E564;
	Fri,  5 May 2023 05:21:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F2D710E564
 for <dri-devel@lists.freedesktop.org>; Fri,  5 May 2023 05:21:31 +0000 (UTC)
Received: (Authenticated sender: me@crly.cz)
 by mail.gandi.net (Postfix) with ESMTPSA id 1156A1BF206;
 Fri,  5 May 2023 05:21:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crly.cz; s=gm1;
 t=1683264089;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BTishZVtaZFYmhTS+E1QiU0pRfLyhtvgErYcS+oT66w=;
 b=GVdpRfQ/+vgBYi++UmvBh4Y77lLLjV4XQnUR02Wa1uGtdEboJRUvP2SlRJqgIndYgUV7bf
 A2HTns2I7UbKS8wBlemmnZEVKfAQDxFLWchJe5CBss/g2qHVcGZjEtFngnl/tApm5H8A7l
 fMbdVIExXmZwm74jiCf44UO/+ppvgyZWEhUYttjca9+sE05nsLhCUAX/tChhhoMZSOUlmk
 LoG9YlW1mwJ9vQ4thicJrxVG/+NP+VBSlzEwpgc9VNK0+58Wfufl+OGVUnyzqIysybzLW5
 0ddVdLLGX5DO5ASd1DlaX3OvGdxNMjBUEteikOQ/aIIu5ZpKtgOV0NtS3LVIqQ==
From: Roman Beranek <me@crly.cz>
To: Maxime Ripard <mripard@kernel.org>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Chen-Yu Tsai <wens@csie.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Subject: [PATCH v4 1/4] clk: sunxi-ng: a64: force select PLL_MIPI in TCON0 mux
Date: Fri,  5 May 2023 07:21:07 +0200
Message-Id: <20230505052110.67514-2-me@crly.cz>
X-Mailer: git-send-email 2.32.0 (Apple Git-132)
In-Reply-To: <20230505052110.67514-1-me@crly.cz>
References: <20230505052110.67514-1-me@crly.cz>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Frank Oltmanns <frank@oltmanns.dev>, dri-devel@lists.freedesktop.org,
 linux-clk@vger.kernel.org, Ondrej Jirman <megi@xff.cz>,
 linux-sunxi@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 Icenowy Zheng <icenowy@aosc.io>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

TCON0's source clock can be fed from either PLL_MIPI, or PLL_VIDEO0(2X),
however MIPI DSI output only seems to work when PLL_MIPI is selected and
thus the choice must be hardcoded in.

Currently, this driver can't propagate rate change from N-K-M clocks
(such as PLL_MIPI) upwards. This prevents PLL_VIDEO0 from participating
in setting of the TCON0 data clock rate, limiting the precision with
which a target pixel clock can be matched.

For outputs with fixed TCON0 divider, that is DSI and LVDS, the dotclock
can deviate up to 8% off target.

Signed-off-by: Roman Beranek <me@crly.cz>
---
 drivers/clk/sunxi-ng/ccu-sun50i-a64.c | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/sunxi-ng/ccu-sun50i-a64.c b/drivers/clk/sunxi-ng/ccu-sun50i-a64.c
index 41519185600a..eb36f8f77d55 100644
--- a/drivers/clk/sunxi-ng/ccu-sun50i-a64.c
+++ b/drivers/clk/sunxi-ng/ccu-sun50i-a64.c
@@ -528,11 +528,18 @@ static SUNXI_CCU_M_WITH_MUX_GATE(de_clk, "de", de_parents,
 				 0x104, 0, 4, 24, 3, BIT(31),
 				 CLK_SET_RATE_PARENT);
 
+/*
+ * DSI output seems to work only when PLL_MIPI selected. Set it and prevent
+ * the mux from reparenting.
+ */
+#define SUN50I_A64_TCON0_CLK_REG	0x118
+
 static const char * const tcon0_parents[] = { "pll-mipi", "pll-video0-2x" };
 static const u8 tcon0_table[] = { 0, 2, };
 static SUNXI_CCU_MUX_TABLE_WITH_GATE(tcon0_clk, "tcon0", tcon0_parents,
 				     tcon0_table, 0x118, 24, 3, BIT(31),
-				     CLK_SET_RATE_PARENT);
+				     CLK_SET_RATE_PARENT |
+				     CLK_SET_RATE_NO_REPARENT);
 
 static const char * const tcon1_parents[] = { "pll-video0", "pll-video1" };
 static const u8 tcon1_table[] = { 0, 2, };
@@ -953,6 +960,11 @@ static int sun50i_a64_ccu_probe(struct platform_device *pdev)
 
 	writel(0x515, reg + SUN50I_A64_PLL_MIPI_REG);
 
+	/* Set PLL MIPI as parent for TCON0 */
+	val = readl(reg + SUN50I_A64_TCON0_CLK_REG);
+	val &= ~GENMASK(26, 24);
+	writel(val | (0 << 24), reg + SUN50I_A64_TCON0_CLK_REG);
+
 	ret = devm_sunxi_ccu_probe(&pdev->dev, reg, &sun50i_a64_ccu_desc);
 	if (ret)
 		return ret;
-- 
2.32.0 (Apple Git-132)

