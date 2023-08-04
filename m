Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 47D9676FEBC
	for <lists+dri-devel@lfdr.de>; Fri,  4 Aug 2023 12:44:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5344810E6CE;
	Fri,  4 Aug 2023 10:44:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 881BA10E6D0
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Aug 2023 10:44:45 +0000 (UTC)
Received: from [127.0.1.1] (91-154-35-171.elisa-laajakaista.fi [91.154.35.171])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id CA8792E4;
 Fri,  4 Aug 2023 12:43:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1691145819;
 bh=TDI9Cw23pqxLneDtSVZkuUlDvO2vp0pomzNNIvZxHCc=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=tDBX70oTEiRrV57weoEqw73RKdubUeomLY50iaZDIUuYnD5fIK3tLhuZkcYvfvZOR
 LjDa3/d8fQzia7oUxEoCr/vLv83a1b47XMOBrcLkUdqHnzr67jj8hrJzzBke2LXibu
 teQ4GbumgqhQAr+mJXL03vAXFhP9YLYaHlV6l1Pc=
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Date: Fri, 04 Aug 2023 13:44:11 +0300
Subject: [PATCH 06/11] drm/bridge: tc358768: Use dev for dbg prints, not
 priv->dev
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230804-tc358768-v1-6-1afd44b7826b@ideasonboard.com>
References: <20230804-tc358768-v1-0-1afd44b7826b@ideasonboard.com>
In-Reply-To: <20230804-tc358768-v1-0-1afd44b7826b@ideasonboard.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 =?utf-8?q?P=C3=A9ter_Ujfalusi?= <peter.ujfalusi@gmail.com>, 
 Francesco Dolcini <francesco@dolcini.it>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=6214;
 i=tomi.valkeinen@ideasonboard.com; h=from:subject:message-id;
 bh=TDI9Cw23pqxLneDtSVZkuUlDvO2vp0pomzNNIvZxHCc=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBkzNaSpke1QciS+X445m7BNs2NHAURVJkC9xUl7
 bvewAkTfvWJAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCZMzWkgAKCRD6PaqMvJYe
 9QBQD/94UvRBDpwfWCu6SsfgrgZxRQgWwFWY/1TYnp28tDiRs1sGvVRNGBHXYBepsXysFxqUQtA
 RJmM/kTxIEyJVO9GWOeSO3vh2auPQl2RQrt4pe7m7mk49HOXhv0u/EM8zOgFNK7H382WZ1DFrgI
 fx2NKN2/UhTSN7pUK0In2jnEhMHMetgwj95iDJN0iJDsoEwWcu1wVEOHO38ATHCNoeJ7WKb+2Nb
 I83bfG6mai2Pf/v9QGKnOj/Kpj6K6PoRW3P8IiySzJxDOM6pe26k1SsrgD+Oy69yOUe6ZLiDZfu
 9AwhfJwwYnczDF9S5Ugj+P1LenHkx7kbp6VbvRO7wiyFcXGi0oo/RLr7SGCvz53jul6/jswHyPv
 +LA/6jkdYsqDM0YZICZZyygFbq9REbOF3f3RvVI9B9pnnxW9GO7r7ADK1vVEEZtHjVc1X02f8TD
 iTGqA6sYD26WRgtfvdMVx73Hsk7ia2AU/kHKUQBMmDQwXeoLgUOl63icr6AUzLnDsRax+G+R6gJ
 AmTzLxuE5zqPBAkqqNnMX0EZaaTkqVnpLqKBU2bB7rra/dr1JIUMo3CkE/j9TGxtJwFTmmwyZ5Y
 IIgYpWUa7s18O0HEgWJ1eg8ZwijhrwF54a/RD/Aopw+ioXebY6xJTNU0gteQ4bnXkcpDzx8i9jQ
 MGdpV22P8tTuPKQ==
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

Simplify the code by capturing the priv->dev value to dev variable, and
use it.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
 drivers/gpu/drm/bridge/tc358768.c | 41 ++++++++++++++++++++-------------------
 1 file changed, 21 insertions(+), 20 deletions(-)

diff --git a/drivers/gpu/drm/bridge/tc358768.c b/drivers/gpu/drm/bridge/tc358768.c
index 0ef51d04bb21..3266c08d9bf1 100644
--- a/drivers/gpu/drm/bridge/tc358768.c
+++ b/drivers/gpu/drm/bridge/tc358768.c
@@ -651,9 +651,10 @@ static void tc358768_bridge_pre_enable(struct drm_bridge *bridge)
 	const u32 internal_delay = 40;
 	int ret, i;
 	struct videomode vm;
+	struct device *dev = priv->dev;
 
 	if (mode_flags & MIPI_DSI_CLOCK_NON_CONTINUOUS) {
-		dev_warn_once(priv->dev, "Non-continuous mode unimplemented, falling back to continuous\n");
+		dev_warn_once(dev, "Non-continuous mode unimplemented, falling back to continuous\n");
 		mode_flags &= ~MIPI_DSI_CLOCK_NON_CONTINUOUS;
 	}
 
@@ -661,7 +662,7 @@ static void tc358768_bridge_pre_enable(struct drm_bridge *bridge)
 
 	ret = tc358768_sw_reset(priv);
 	if (ret) {
-		dev_err(priv->dev, "Software reset failed: %d\n", ret);
+		dev_err(dev, "Software reset failed: %d\n", ret);
 		tc358768_hw_disable(priv);
 		return;
 	}
@@ -669,7 +670,7 @@ static void tc358768_bridge_pre_enable(struct drm_bridge *bridge)
 	mode = &bridge->encoder->crtc->state->adjusted_mode;
 	ret = tc358768_setup_pll(priv, mode);
 	if (ret) {
-		dev_err(priv->dev, "PLL setup failed: %d\n", ret);
+		dev_err(dev, "PLL setup failed: %d\n", ret);
 		tc358768_hw_disable(priv);
 		return;
 	}
@@ -709,7 +710,7 @@ static void tc358768_bridge_pre_enable(struct drm_bridge *bridge)
 		data_type = MIPI_DSI_PACKED_PIXEL_STREAM_16;
 		break;
 	default:
-		dev_err(priv->dev, "Invalid data format (%u)\n",
+		dev_err(dev, "Invalid data format (%u)\n",
 			dsi_dev->format);
 		tc358768_hw_disable(priv);
 		return;
@@ -733,65 +734,65 @@ static void tc358768_bridge_pre_enable(struct drm_bridge *bridge)
 				  dsibclk);
 	dsiclk_nsk = (u32)div_u64((u64)1000000000 * TC358768_PRECISION, dsiclk);
 	ui_nsk = dsiclk_nsk / 2;
-	dev_dbg(priv->dev, "dsiclk_nsk: %u\n", dsiclk_nsk);
-	dev_dbg(priv->dev, "ui_nsk: %u\n", ui_nsk);
-	dev_dbg(priv->dev, "dsibclk_nsk: %u\n", dsibclk_nsk);
+	dev_dbg(dev, "dsiclk_nsk: %u\n", dsiclk_nsk);
+	dev_dbg(dev, "ui_nsk: %u\n", ui_nsk);
+	dev_dbg(dev, "dsibclk_nsk: %u\n", dsibclk_nsk);
 
 	/* LP11 > 100us for D-PHY Rx Init */
 	val = tc358768_ns_to_cnt(100 * 1000, dsibclk_nsk) - 1;
-	dev_dbg(priv->dev, "LINEINITCNT: %u\n", val);
+	dev_dbg(dev, "LINEINITCNT: %u\n", val);
 	tc358768_write(priv, TC358768_LINEINITCNT, val);
 
 	/* LPTimeCnt > 50ns */
 	val = tc358768_ns_to_cnt(50, dsibclk_nsk) - 1;
 	lptxcnt = val;
-	dev_dbg(priv->dev, "LPTXTIMECNT: %u\n", val);
+	dev_dbg(dev, "LPTXTIMECNT: %u\n", val);
 	tc358768_write(priv, TC358768_LPTXTIMECNT, val);
 
 	/* 38ns < TCLK_PREPARE < 95ns */
 	val = tc358768_ns_to_cnt(65, dsibclk_nsk) - 1;
-	dev_dbg(priv->dev, "TCLK_PREPARECNT %u\n", val);
+	dev_dbg(dev, "TCLK_PREPARECNT %u\n", val);
 	/* TCLK_PREPARE + TCLK_ZERO > 300ns */
 	val2 = tc358768_ns_to_cnt(300 - tc358768_to_ns(2 * ui_nsk),
 				  dsibclk_nsk) - 2;
-	dev_dbg(priv->dev, "TCLK_ZEROCNT %u\n", val2);
+	dev_dbg(dev, "TCLK_ZEROCNT %u\n", val2);
 	val |= val2 << 8;
 	tc358768_write(priv, TC358768_TCLK_HEADERCNT, val);
 
 	/* TCLK_TRAIL > 60ns AND TEOT <= 105 ns + 12*UI */
 	raw_val = tc358768_ns_to_cnt(60 + tc358768_to_ns(2 * ui_nsk), dsibclk_nsk) - 5;
 	val = clamp(raw_val, 0, 127);
-	dev_dbg(priv->dev, "TCLK_TRAILCNT: %u\n", val);
+	dev_dbg(dev, "TCLK_TRAILCNT: %u\n", val);
 	tc358768_write(priv, TC358768_TCLK_TRAILCNT, val);
 
 	/* 40ns + 4*UI < THS_PREPARE < 85ns + 6*UI */
 	val = 50 + tc358768_to_ns(4 * ui_nsk);
 	val = tc358768_ns_to_cnt(val, dsibclk_nsk) - 1;
-	dev_dbg(priv->dev, "THS_PREPARECNT %u\n", val);
+	dev_dbg(dev, "THS_PREPARECNT %u\n", val);
 	/* THS_PREPARE + THS_ZERO > 145ns + 10*UI */
 	raw_val = tc358768_ns_to_cnt(145 - tc358768_to_ns(3 * ui_nsk), dsibclk_nsk) - 10;
 	val2 = clamp(raw_val, 0, 127);
-	dev_dbg(priv->dev, "THS_ZEROCNT %u\n", val2);
+	dev_dbg(dev, "THS_ZEROCNT %u\n", val2);
 	val |= val2 << 8;
 	tc358768_write(priv, TC358768_THS_HEADERCNT, val);
 
 	/* TWAKEUP > 1ms in lptxcnt steps */
 	val = tc358768_ns_to_cnt(1020000, dsibclk_nsk);
 	val = val / (lptxcnt + 1) - 1;
-	dev_dbg(priv->dev, "TWAKEUP: %u\n", val);
+	dev_dbg(dev, "TWAKEUP: %u\n", val);
 	tc358768_write(priv, TC358768_TWAKEUP, val);
 
 	/* TCLK_POSTCNT > 60ns + 52*UI */
 	val = tc358768_ns_to_cnt(60 + tc358768_to_ns(52 * ui_nsk),
 				 dsibclk_nsk) - 3;
-	dev_dbg(priv->dev, "TCLK_POSTCNT: %u\n", val);
+	dev_dbg(dev, "TCLK_POSTCNT: %u\n", val);
 	tc358768_write(priv, TC358768_TCLK_POSTCNT, val);
 
 	/* max(60ns + 4*UI, 8*UI) < THS_TRAILCNT < 105ns + 12*UI */
 	raw_val = tc358768_ns_to_cnt(60 + tc358768_to_ns(18 * ui_nsk),
 				     dsibclk_nsk) - 4;
 	val = clamp(raw_val, 0, 15);
-	dev_dbg(priv->dev, "THS_TRAILCNT: %u\n", val);
+	dev_dbg(dev, "THS_TRAILCNT: %u\n", val);
 	tc358768_write(priv, TC358768_THS_TRAILCNT, val);
 
 	val = BIT(0);
@@ -805,10 +806,10 @@ static void tc358768_bridge_pre_enable(struct drm_bridge *bridge)
 	/* TXTAGOCNT[26:16] RXTASURECNT[10:0] */
 	val = tc358768_to_ns((lptxcnt + 1) * dsibclk_nsk * 4);
 	val = tc358768_ns_to_cnt(val, dsibclk_nsk) / 4 - 1;
-	dev_dbg(priv->dev, "TXTAGOCNT: %u\n", val);
+	dev_dbg(dev, "TXTAGOCNT: %u\n", val);
 	val2 = tc358768_ns_to_cnt(tc358768_to_ns((lptxcnt + 1) * dsibclk_nsk),
 				  dsibclk_nsk) - 2;
-	dev_dbg(priv->dev, "RXTASURECNT: %u\n", val2);
+	dev_dbg(dev, "RXTASURECNT: %u\n", val2);
 	val = val << 16 | val2;
 	tc358768_write(priv, TC358768_BTACNTRL1, val);
 
@@ -902,7 +903,7 @@ static void tc358768_bridge_pre_enable(struct drm_bridge *bridge)
 
 	ret = tc358768_clear_error(priv);
 	if (ret) {
-		dev_err(priv->dev, "Bridge pre_enable failed: %d\n", ret);
+		dev_err(dev, "Bridge pre_enable failed: %d\n", ret);
 		tc358768_bridge_disable(bridge);
 		tc358768_bridge_post_disable(bridge);
 	}

-- 
2.34.1

