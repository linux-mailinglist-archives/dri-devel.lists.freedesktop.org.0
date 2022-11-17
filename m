Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A63AA62DAC3
	for <lists+dri-devel@lfdr.de>; Thu, 17 Nov 2022 13:27:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C99F10E5CB;
	Thu, 17 Nov 2022 12:27:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4DC2D10E11E
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Nov 2022 12:26:11 +0000 (UTC)
Received: from desky.lan (91-154-32-225.elisa-laajakaista.fi [91.154.32.225])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 292B8133C;
 Thu, 17 Nov 2022 13:26:09 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1668687970;
 bh=Yp9gIE748wlY7gw+8HNjk6NkwSOWfjoqB6wxFtfVN+E=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=HaSo4pZYzoo3itwKO8/m3/xpjHeFZskjJfImSF+RUvW0Zcx0vkUNqVPgQeXNK9c6K
 UkyDKN5+ahKf5ZJSYDHvcYWB60ORAeHZctQe82HG+KQOmZTrubGP0hRYDnM1S7kIil
 N0BYiZk+WdR+Oa8LCzVZauTzhDrMPazmQtg2YuzI=
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>, dri-devel@lists.freedesktop.org,
 linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v1 3/8] clk: renesas: r8a779g0: Add display related clocks
Date: Thu, 17 Nov 2022 14:25:42 +0200
Message-Id: <20221117122547.809644-4-tomi.valkeinen@ideasonboard.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221117122547.809644-1-tomi.valkeinen@ideasonboard.com>
References: <20221117122547.809644-1-tomi.valkeinen@ideasonboard.com>
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Jonas Karlman <jonas@kwiboo.se>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Robert Foss <robert.foss@linaro.org>, Andrzej Hajda <andrzej.hajda@intel.com>,
 Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>

Add clocks related to display which are needed to get the DSI output
working.

Extracted from Renesas BSP tree.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
---
 drivers/clk/renesas/r8a779g0-cpg-mssr.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/drivers/clk/renesas/r8a779g0-cpg-mssr.c b/drivers/clk/renesas/r8a779g0-cpg-mssr.c
index c6337a408e5e..6937f1aee677 100644
--- a/drivers/clk/renesas/r8a779g0-cpg-mssr.c
+++ b/drivers/clk/renesas/r8a779g0-cpg-mssr.c
@@ -145,6 +145,8 @@ static const struct cpg_core_clk r8a779g0_core_clks[] __initconst = {
 	DEF_FIXED("viobusd2",	R8A779G0_CLK_VIOBUSD2,	CLK_VIO,	2, 1),
 	DEF_FIXED("vcbus",	R8A779G0_CLK_VCBUS,	CLK_VC,		1, 1),
 	DEF_FIXED("vcbusd2",	R8A779G0_CLK_VCBUSD2,	CLK_VC,		2, 1),
+	DEF_FIXED("dsiref",	R8A779G0_CLK_DSIREF,	CLK_PLL5_DIV4,	48, 1),
+	DEF_DIV6P1("dsiext",	R8A779G0_CLK_DSIEXT,	CLK_PLL5_DIV4,	0x884),
 
 	DEF_GEN4_SDH("sd0h",	R8A779G0_CLK_SD0H,	CLK_SDSRC,	   0x870),
 	DEF_GEN4_SD("sd0",	R8A779G0_CLK_SD0,	R8A779G0_CLK_SD0H, 0x870),
@@ -161,6 +163,14 @@ static const struct mssr_mod_clk r8a779g0_mod_clks[] __initconst = {
 	DEF_MOD("avb0",		211,	R8A779G0_CLK_S0D4_HSC),
 	DEF_MOD("avb1",		212,	R8A779G0_CLK_S0D4_HSC),
 	DEF_MOD("avb2",		213,	R8A779G0_CLK_S0D4_HSC),
+
+	DEF_MOD("dis0",			411,	R8A779G0_CLK_S0D3),
+	DEF_MOD("dsitxlink0",		415,	R8A779G0_CLK_DSIREF),
+	DEF_MOD("dsitxlink1",		416,	R8A779G0_CLK_DSIREF),
+
+	DEF_MOD("fcpvd0",		508,	R8A779G0_CLK_S0D3),
+	DEF_MOD("fcpvd1",		509,	R8A779G0_CLK_S0D3),
+
 	DEF_MOD("hscif0",	514,	R8A779G0_CLK_SASYNCPERD1),
 	DEF_MOD("hscif1",	515,	R8A779G0_CLK_SASYNCPERD1),
 	DEF_MOD("hscif2",	516,	R8A779G0_CLK_SASYNCPERD1),
@@ -193,6 +203,10 @@ static const struct mssr_mod_clk r8a779g0_mod_clks[] __initconst = {
 	DEF_MOD("tmu3",		716,	R8A779G0_CLK_SASYNCPERD2),
 	DEF_MOD("tmu4",		717,	R8A779G0_CLK_SASYNCPERD2),
 	DEF_MOD("tpu0",		718,	R8A779G0_CLK_SASYNCPERD4),
+
+	DEF_MOD("vspd0",		830,	R8A779G0_CLK_S0D1_VIO),
+	DEF_MOD("vspd1",		831,	R8A779G0_CLK_S0D1_VIO),
+
 	DEF_MOD("wdt1:wdt0",	907,	R8A779G0_CLK_R),
 	DEF_MOD("cmt0",		910,	R8A779G0_CLK_R),
 	DEF_MOD("cmt1",		911,	R8A779G0_CLK_R),
-- 
2.34.1

