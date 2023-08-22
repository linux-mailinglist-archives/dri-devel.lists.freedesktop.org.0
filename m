Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 632877846F2
	for <lists+dri-devel@lfdr.de>; Tue, 22 Aug 2023 18:20:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D87110E3AE;
	Tue, 22 Aug 2023 16:20:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 48AF110E3A4
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Aug 2023 16:20:07 +0000 (UTC)
Received: from [127.0.1.1] (91-154-35-171.elisa-laajakaista.fi [91.154.35.171])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 3162687E1;
 Tue, 22 Aug 2023 18:18:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1692721129;
 bh=PZWyhC5dbXtcQIPCQnixR51q/63Hv20ub79Oc4c8dPc=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=tD8AtyDbESZPURfG7WTY47Qldu86Yh9/JRnPZTeCf0PKuZ4GCggMXC+/B7YlDxW3b
 /MS3a6YER5acYSXvon9auNZV6aYOX/us3izob9b2NGqHifBVCNaPvqW/lCiCclIvJ3
 iwB5G76RWD5ezM3B+BVLtAMqyXp1/tKK7/UfGOUA=
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Date: Tue, 22 Aug 2023 19:19:38 +0300
Subject: [PATCH v3 05/12] drm/bridge: tc358768: Cleanup PLL calculations
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230822-tc358768-v3-5-c82405dac0c1@ideasonboard.com>
References: <20230822-tc358768-v3-0-c82405dac0c1@ideasonboard.com>
In-Reply-To: <20230822-tc358768-v3-0-c82405dac0c1@ideasonboard.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 =?utf-8?q?P=C3=A9ter_Ujfalusi?= <peter.ujfalusi@gmail.com>, 
 Maxim Schwalm <maxim.schwalm@gmail.com>, 
 Francesco Dolcini <francesco@dolcini.it>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2543;
 i=tomi.valkeinen@ideasonboard.com; h=from:subject:message-id;
 bh=PZWyhC5dbXtcQIPCQnixR51q/63Hv20ub79Oc4c8dPc=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBk5OAsXsMFM7hC1l9gz3dS7LioxUL6d6mGfbglO
 D15zCBtIWKJAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCZOTgLAAKCRD6PaqMvJYe
 9Q/qD/wNTI5SV6F0s47NHHdMSlmVAYcBZE4u8Sv+xyasR172qllVfKjZASiT7qccB3EAtkUnYBG
 W1DlhQCgNXVYgU+i0X2QSMwElJxeOiSGjP6hrZ12Tc1Prhjq61fp+EDdxV/azo6A05F42thRGTs
 lRtttA5YUGOENZAFku7aPq896Yal6654a8sjRK0kMW/kwk5qSs+Thn4Xo36lS9OjuBeKR+3tXWA
 Is39dd6U3Wwc+jEappVufAPkpg9SMPg2S3v56AR04upIsM73whD7ID1DlaxOpyEAnRW+Wt++yOw
 wjDuiw/feUm744HfQ+KQgTtpwQ69/zD0VWFVUv2fsoDHRIjCiFeF879K7oXbywqPoYLQIY6QE3B
 aZR986ewMnGw1aRicCCXbSpOVP1lAznR1zYDKQQ/jaNMn95+y5G84IrBH9yUba2t65jzwd5uPqh
 w7ZzPevn8gX18z+qGLADxjIwOxI23QmykS2tqSUIZbe/8+BAKLjvBCuyIQteI2UGAcOKTu9B2/b
 Fus8YSRQaEw0w+vFm9kTN8uJdmv7eFbPWEthh0rrRLYOd0IhA3v03iiWaKLCad9mviq7u0n3469
 EL52GZiNPvZ0iLnXtSKjjHrP4W2xym1rPsziytuqBGkeu6Ydpz527pe6l0u/mkskgfYKZ5iCYi0
 K02hlPMrPkLSUWw==
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
Cc: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Aradhya Bhatia <a-bhatia1@ti.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

As is quite common, some of TC358768's PLL register fields are to be
programmed with (value - 1). Specifically, the FBD and PRD, multiplier
and divider, are such fields.

However, what the driver currently does is that it considers that the
formula used for PLL rate calculation is:

RefClk * [(FBD + 1)/ (PRD + 1)] * [1 / (2^FRS)]

where FBD and PRD are values directly from the registers, while a more
sensible way to look at it is:

RefClk * FBD / PRD * (1 / (2^FRS))

and when the FBD and PRD values are written to the registers, they will
be subtracted by one.

Change the driver accordingly, as it simplifies the PLL code.

Reviewed-by: Peter Ujfalusi <peter.ujfalusi@gmail.com>
Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
 drivers/gpu/drm/bridge/tc358768.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/bridge/tc358768.c b/drivers/gpu/drm/bridge/tc358768.c
index 99992af23f1e..a465674f1e2e 100644
--- a/drivers/gpu/drm/bridge/tc358768.c
+++ b/drivers/gpu/drm/bridge/tc358768.c
@@ -316,7 +316,7 @@ static int tc358768_calc_pll(struct tc358768_priv *priv,
 
 	target_pll = tc358768_pclk_to_pll(priv, mode->clock * 1000);
 
-	/* pll_clk = RefClk * [(FBD + 1)/ (PRD + 1)] * [1 / (2^FRS)] */
+	/* pll_clk = RefClk * FBD / PRD * (1 / (2^FRS)) */
 
 	for (i = 0; i < ARRAY_SIZE(frs_limits); i++)
 		if (target_pll >= frs_limits[i])
@@ -336,19 +336,19 @@ static int tc358768_calc_pll(struct tc358768_priv *priv,
 	best_prd = 0;
 	best_fbd = 0;
 
-	for (prd = 0; prd < 16; ++prd) {
-		u32 divisor = (prd + 1) * (1 << frs);
+	for (prd = 1; prd <= 16; ++prd) {
+		u32 divisor = prd * (1 << frs);
 		u32 fbd;
 
-		for (fbd = 0; fbd < 512; ++fbd) {
+		for (fbd = 1; fbd <= 512; ++fbd) {
 			u32 pll, diff, pll_in;
 
-			pll = (u32)div_u64((u64)refclk * (fbd + 1), divisor);
+			pll = (u32)div_u64((u64)refclk * fbd, divisor);
 
 			if (pll >= max_pll || pll < min_pll)
 				continue;
 
-			pll_in = (u32)div_u64((u64)refclk, prd + 1);
+			pll_in = (u32)div_u64((u64)refclk, prd);
 			if (pll_in < 4000000)
 				continue;
 
@@ -611,7 +611,7 @@ static int tc358768_setup_pll(struct tc358768_priv *priv,
 		mode->clock * 1000);
 
 	/* PRD[15:12] FBD[8:0] */
-	tc358768_write(priv, TC358768_PLLCTL0, (prd << 12) | fbd);
+	tc358768_write(priv, TC358768_PLLCTL0, ((prd - 1) << 12) | (fbd - 1));
 
 	/* FRS[11:10] LBWS[9:8] CKEN[4] RESETB[1] EN[0] */
 	tc358768_write(priv, TC358768_PLLCTL1,

-- 
2.34.1

