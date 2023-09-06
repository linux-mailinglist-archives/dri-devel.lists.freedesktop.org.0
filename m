Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 891C97935A2
	for <lists+dri-devel@lfdr.de>; Wed,  6 Sep 2023 08:51:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CCAF410E570;
	Wed,  6 Sep 2023 06:51:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CAD6D10E570
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Sep 2023 06:51:32 +0000 (UTC)
Received: from [127.0.1.1] (91-154-35-171.elisa-laajakaista.fi [91.154.35.171])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id E027B1536;
 Wed,  6 Sep 2023 08:50:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1693983004;
 bh=gVqp/W0PhAL3EfV0HWVnGx4la8fAeaMt695Id26ctC0=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=ZqWL8vcWUJ54WZyBnEOpvlsnUT9NYMiKpxMKcn2fRw+cRe452ESJg0oDFj6Q8T8lQ
 1UZ8maNKagsPaPkCtBi9IWzkhX6fpBHcNPRRGb0SlpSdtHMkLxLnTBzMe1hHJ4pixO
 SrtmD5DCL4rFScikjWUbDlXQ89oAaJtTdAJJRnqI=
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Date: Wed, 06 Sep 2023 09:50:52 +0300
Subject: [PATCH v4 05/12] drm/bridge: tc358768: Cleanup PLL calculations
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230906-tc358768-v4-5-31725f008a50@ideasonboard.com>
References: <20230906-tc358768-v4-0-31725f008a50@ideasonboard.com>
In-Reply-To: <20230906-tc358768-v4-0-31725f008a50@ideasonboard.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 =?utf-8?q?P=C3=A9ter_Ujfalusi?= <peter.ujfalusi@gmail.com>, 
 Maxim Schwalm <maxim.schwalm@gmail.com>, 
 Francesco Dolcini <francesco@dolcini.it>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2667;
 i=tomi.valkeinen@ideasonboard.com; h=from:subject:message-id;
 bh=gVqp/W0PhAL3EfV0HWVnGx4la8fAeaMt695Id26ctC0=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBk+CFpw0pd36D5QvJBKTIrRBV5DNBSNUhtjPX4A
 5Ra+O/VzDWJAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCZPghaQAKCRD6PaqMvJYe
 9cpuD/4jv7eE215j4bbCAgkKOSK3MWMPvLJLxRjm8grHLGJ802Am7k9IuOAzjlT5i9w/AKcnLBT
 TuKpbOxEq3yGUlsnSQcBrU7VHZ58/ms6+pprEtCulfsJJwjyXQw1iF7+73zM2ZUGiKKxJ6TgxYX
 lBykvraNR0RPlx6niNhxpwF+TS/w7rStyPDmxFj4wDKqW5CCqUq3KrmvRmlDyCHGoE49xToZI6Q
 1kBi4bHY9IsZhlXdlfvPDRQ+aWA3CNqlrqfa26O2lcmbmzPNQp8cJJiDKRvfkhtcVZ6ZyP9gw7x
 5Axu5xI9Xt4jMLQ4fMZKIfNATLa/2OVl8gePkMjCi4cD//Mit+Ecwadb8llgyX0L7yfDmXOze+i
 mgbGrPuxhFmMLgE9DgiTDVwfQVc6+ttk07FWg1AhQ8SI/9U0J+MSRMbUtCW3OcYg10RmfH62Pwf
 HSbf/c4vBpB9Td5BvcAnVmfQlFfpseM93uq68pzhg0Pe+3MlsNN1fowoxfHs1NWAvIbSfbBF1iN
 /9G8HuDPrEv3kw2rwyOGHVHwmnKSjgwIQazA5zDozfpbW9r9+C4cVkZ9+gJJA1VVtU9p/XHzI8c
 nZa/CaK8mxeCJJgU5wym3mRmkPrrB3meyQJFdcKlzvjH2OwJGGTM9KATuIogQS7Pu2Q/eHS/P+b
 dy5rZI1WltfStSg==
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
Cc: Marcel Ziswiler <marcel.ziswiler@toradex.com>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Aradhya Bhatia <a-bhatia1@ti.com>
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
Tested-by: Maxim Schwalm <maxim.schwalm@gmail.com> # Asus TF700T
Tested-by: Marcel Ziswiler <marcel.ziswiler@toradex.com>
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

