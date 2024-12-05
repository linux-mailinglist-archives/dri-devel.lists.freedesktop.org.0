Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 993B09E5787
	for <lists+dri-devel@lfdr.de>; Thu,  5 Dec 2024 14:45:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 13B3B10EE7C;
	Thu,  5 Dec 2024 13:45:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="etLLRalq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 93E3A10EE7B
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Dec 2024 13:45:36 +0000 (UTC)
Received: from [127.0.1.1] (91-157-155-49.elisa-laajakaista.fi [91.157.155.49])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 6AF663E;
 Thu,  5 Dec 2024 14:45:05 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1733406306;
 bh=Hq6JiYTrr48Zz5qgtO2NNBKqBW0EU5tjSo3HW2upEnQ=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=etLLRalqjnHU99dAVgt30b2vdmUuqwbleo7Oe+O7gXMDLeVmNn47AcfFIatJ8EDVw
 fN9OfxEex/HuiFuCp0aXAkxgcrE10ystY1xfOm8HGL7lvMDT3n2r1Qf5SyjdI3l3U9
 D8sKwWro6Iy9vs9EO9Ir3Im4RmxmELg+6Q4fCumE=
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Date: Thu, 05 Dec 2024 15:45:00 +0200
Subject: [PATCH v2 05/10] clk: renesas: r8a779h0: Add display clocks
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241205-rcar-gh-dsi-v2-5-42471851df86@ideasonboard.com>
References: <20241205-rcar-gh-dsi-v2-0-42471851df86@ideasonboard.com>
In-Reply-To: <20241205-rcar-gh-dsi-v2-0-42471851df86@ideasonboard.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1552;
 i=tomi.valkeinen@ideasonboard.com; h=from:subject:message-id;
 bh=kAn1GjZQFCgzt+hyG017KrM5zbGlrdqmvn21tyGA1Go=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBnUa5yg1MqSs3JCsRGYqzLLpDWpfDcekxRFDgBW
 k//HjXZKuqJAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCZ1GucgAKCRD6PaqMvJYe
 9baGD/0ZxOoynO+9hfUrpyA6PM+Kd0qeJ0ksE0l77Ko8hH19+DbQlSlsuBSDVet0BLU6w7rOAKj
 X6w1ocI9F8WZP05Yk0S3KDuVRzCODLm8lErwD49VJX6HOI7FWI5RKDOgr67+ARBCZdxqgtrk1F2
 UR3KTl0/9gbhFhRMQbFL4ObBhSIvTfi6b5+b5p5LY1TcYLF3tQsseOrmPpNf0iH7ONWUVJ8fqKq
 59r2/gTxgYC44sWENtvRzRk31I2qfC7HfQ8l/qPkzm0ep3ZNXfLtOFSu0uAAROcC4IniXPwhtvA
 N7JxwTE3loTjy2M/pvHyZQ9UQbW7PhHu3UDK3Urt2Lq++e/sXr884CTTN6lrZvEY7SdAoDTGc1X
 2ONYycmcNoqJeQWGpVA+Dobn4EHMikHfGis3pFPMTjmSNk8NO/tpBA3ZyCW3x7dA/o+DfwthmGZ
 zCaYHPG7Bdr/KKtqAxetcJdG7i9Vqp/FJ+xtma/WLj2AesOp9P5fyr1P4LdLwKDOZM8tSTYOwDg
 lITZ2dumyQW8yWANx/NX0MEPG1QPzzTaex4ndDN0TeT16kG4y2CXbq8a6TxqFESQzezqvjHEUBZ
 Eg9tKouFwzg2y/uFAf7hJW9xZuvj/VX/SMfHheDFk2oZhlo8TThF/t/i+biLph7wukI6WcRkGyj
 YZHdAIj8Elf/PPg==
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
Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Tested-by: Geert Uytterhoeven <geert+renesas@glider.be>
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

