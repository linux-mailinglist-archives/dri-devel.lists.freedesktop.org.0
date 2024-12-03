Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 364419E14EF
	for <lists+dri-devel@lfdr.de>; Tue,  3 Dec 2024 09:02:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6379A10E938;
	Tue,  3 Dec 2024 08:02:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="TsNB795R";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C6B6210E938
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Dec 2024 08:02:47 +0000 (UTC)
Received: from [127.0.1.1] (91-157-155-49.elisa-laajakaista.fi [91.157.155.49])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 3BB42E16;
 Tue,  3 Dec 2024 09:02:18 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1733212939;
 bh=/DDTZDX+9wT9NSS30Bd6SH2pIISLBjVU8O1N/T4nsSk=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=TsNB795RYivXYQlPgYQXVzt12bNZrpZJhULsr78M06RFP0CIG+5R9u8sn4GoQqUKZ
 68CadDPc6wy9sDh/p9KhYXEBq8+5YtInLqjm+xn9cVIp739rEbDgXvkqfL5KhK16v1
 9NmcG3umyDlrBa731qcmxyIsHESgfGux9C2n6Jr0=
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Date: Tue, 03 Dec 2024 10:01:37 +0200
Subject: [PATCH 3/9] clk: renesas: r8a779h0: Add display clocks
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241203-rcar-gh-dsi-v1-3-738ae1a95d2a@ideasonboard.com>
References: <20241203-rcar-gh-dsi-v1-0-738ae1a95d2a@ideasonboard.com>
In-Reply-To: <20241203-rcar-gh-dsi-v1-0-738ae1a95d2a@ideasonboard.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Magnus Damm <magnus.damm@gmail.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, LUU HOAI <hoai.luu.ub@renesas.com>, 
 Jagan Teki <jagan@amarulasolutions.com>, Sam Ravnborg <sam@ravnborg.org>, 
 Biju Das <biju.das.jz@bp.renesas.com>
Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, 
 linux-clk@vger.kernel.org, 
 Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1420;
 i=tomi.valkeinen@ideasonboard.com; h=from:subject:message-id;
 bh=aAauG6pe25JfOkg9OusNCoT3g9WSvh9t6MFCRcjRERM=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBnTrsdTf5Tj/KQYUcjw06xS8AyD7GLEfpTdqPNB
 y5LnT3oVsuJAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCZ067HQAKCRD6PaqMvJYe
 9elJD/4+6dOv5Ph+3mlL/WQNf5merHwNr+aCSHk6HK1JscMpe/npA8RGPtRfayl8tz8U2jPNx2y
 m5xCkk86yL7tgL1N8Ekx8sP9ytAEh4B3wITeiiVfocX6tzz/cuzC/QXs1PT7JpnP1SuLpHEudKE
 sa9IFX5lxP2LCItYPIEcstM5qep2QeWn+X9vf7V39Qt3rP46hiG+eKD1GpNL4qyD35nR5HxxOgD
 I1ml5bCdWVRGrFdPU31yanlMWViAFqu/ly5S91qdsVsNsswmaae6Hos2btB+Q9meXNLaji7H959
 LRBUkLEawCSTPgnGs9HOf4+0k6VWzycsqwDRozAFjabPYvFNxVzOaShmi8/9OGfxbRg5X7Yvb7d
 uSo1iY+/TRfJsXzqsUVaxBBtHmBPO6yNi8io7YGwlGANuLCELIeJ7jWsjB5bn2eF+4h+PF6CGbQ
 lFV0l3oojmHCH0eiSF3teNjINPcp6w2Al3l6HaGhKncsQAGboCwv60/bT8ZahHOw+LdwZln1RVn
 +9qEq0ScnXQZc0WMB4A3HVt9G4PMw9RfaK9rJ1RCZP9yXBribvDOaxeGgtoV8vwilSz+h+Ol6Zk
 WD/u8DO+Pl2eCfP3i0w8qRAKJ5r2tPse9TRPEvxnhmmcEafodOzxMrE7Tk0Xn0d/CAehcIM61KW
 Cidxw6clV6QaG8g==
X-Developer-Key: i=tomi.valkeinen@ideasonboard.com; a=openpgp;
 fpr=C4380C3E965EFD81079FF3A7FA3DAA8CBC961EF5
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

From: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>

Add display related clocks for DU, DSI, FCPVD, and VSPD.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
---
 drivers/clk/renesas/r8a779h0-cpg-mssr.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/clk/renesas/r8a779h0-cpg-mssr.c b/drivers/clk/renesas/r8a779h0-cpg-mssr.c
index e20c048bfa9b..dc37e987c0e6 100644
--- a/drivers/clk/renesas/r8a779h0-cpg-mssr.c
+++ b/drivers/clk/renesas/r8a779h0-cpg-mssr.c
@@ -179,6 +179,9 @@ static const struct mssr_mod_clk r8a779h0_mod_clks[] __initconst = {
 	DEF_MOD("canfd0",	328,	R8A779H0_CLK_SASYNCPERD2),
 	DEF_MOD("csi40",	331,	R8A779H0_CLK_CSI),
 	DEF_MOD("csi41",	400,	R8A779H0_CLK_CSI),
+	DEF_MOD("dis0",		411,	R8A779H0_CLK_S0D3),
+	DEF_MOD("dsitxlink0",	415,	R8A779H0_CLK_DSIREF),
+	DEF_MOD("fcpvd0",	508,	R8A779H0_CLK_S0D3),
 	DEF_MOD("hscif0",	514,	R8A779H0_CLK_SASYNCPERD1),
 	DEF_MOD("hscif1",	515,	R8A779H0_CLK_SASYNCPERD1),
 	DEF_MOD("hscif2",	516,	R8A779H0_CLK_SASYNCPERD1),
@@ -227,6 +230,7 @@ static const struct mssr_mod_clk r8a779h0_mod_clks[] __initconst = {
 	DEF_MOD("vin15",	811,	R8A779H0_CLK_S0D4_VIO),
 	DEF_MOD("vin16",	812,	R8A779H0_CLK_S0D4_VIO),
 	DEF_MOD("vin17",	813,	R8A779H0_CLK_S0D4_VIO),
+	DEF_MOD("vspd0",	830,	R8A779H0_CLK_S0D1_VIO),
 	DEF_MOD("wdt1:wdt0",	907,	R8A779H0_CLK_R),
 	DEF_MOD("cmt0",		910,	R8A779H0_CLK_R),
 	DEF_MOD("cmt1",		911,	R8A779H0_CLK_R),

-- 
2.43.0

