Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E7F17846F9
	for <lists+dri-devel@lfdr.de>; Tue, 22 Aug 2023 18:20:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C0D7A10E38F;
	Tue, 22 Aug 2023 16:20:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A41B610E3B0
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Aug 2023 16:20:10 +0000 (UTC)
Received: from [127.0.1.1] (91-154-35-171.elisa-laajakaista.fi [91.154.35.171])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 9DCC387E3;
 Tue, 22 Aug 2023 18:18:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1692721132;
 bh=u+DcBHsth8iLUe90ZutFhI69CnV6usN42nvbbGlJHmY=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=Phl6HTDIQ2XeQosKsjr5KYU2SCVLr5aHDslGO2jsiBr/ppwc/A37jOVRQZ5dLMQxn
 qZBUtcmXCTFkfZwrIZ/rmzNrCQSRGj2CIxv543Eyvz/zmmp6jYgY2YBEsZ6CG0rjMP
 DOa4A5g+hbKmz6WvBPfO2VJKSxMaKeRv75XmPPuQ=
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Date: Tue, 22 Aug 2023 19:19:41 +0300
Subject: [PATCH v3 08/12] drm/bridge: tc358768: Use dev for dbg prints, not
 priv->dev
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230822-tc358768-v3-8-c82405dac0c1@ideasonboard.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=6270;
 i=tomi.valkeinen@ideasonboard.com; h=from:subject:message-id;
 bh=u+DcBHsth8iLUe90ZutFhI69CnV6usN42nvbbGlJHmY=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBk5OAtpG2wc9F+3edvkBQ6jPSLXC9zSp0G7jPP1
 AzICicuUreJAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCZOTgLQAKCRD6PaqMvJYe
 9Y+hEACNREARMzt8bh17vPxWQ+OdI3EoHW52AF0afCSAuv+fXr6AvABf14w74bgt1J1T0yShgOJ
 MKewt/Jh4UFDsdgqIh/20ciOb5XNNwIJ2xlTOEVdtBRdPJJKL6Uc+jH294XaawKTbJwqf88ebg2
 /iqmRGxakcrlfdkD8u8lONqthihstjXwoAvkF6Om4hy986CbAJrmdGQBir9XF5ScPPqMqqHNcOk
 M7/E06XGHP+q+rJNla3O2Yc4EIe2qfWlp6ZRi/gc6C1oqz1LKSIoVJ/ePUoNOH93SKRXOxqPEIO
 6VvPEcKSu8mTI2ApszcI1IvR3T6q75vasBHmmsrvVr/7H6yRRC1uLQQfXS5aiaxkeRFbZtYOSKe
 ae0Nd78PRSHWflde5LMmNjM2F2jjAxzkmomq3aPM9a2nEBVLpPkhVPC1LIq49tebYPD5BqFDVw2
 kEBKXAx7K8cUKXFOZHxj1v1lZ3ecBzVVRG9iKiGwLUL+JsGEytGlLfNo553Bt/kf7TxnE2wa+wK
 Az9ZEos20Y2isguRl9KWMrJsoj3NBWQXeoZcyJO3dMctaiOwGi0lNTGdTQHjzvGco7kK3s8D7Ue
 Bk1bXgmwf395Gf7Lpc9923yExuTps7yZcIdA240iURAeTCGcpFDwpijtxMf+hbtbu8+DY+Z6CMK
 VCSHllCCeatBi9Q==
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

Reviewed-by: Peter Ujfalusi <peter.ujfalusi@gmail.com>
Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
 drivers/gpu/drm/bridge/tc358768.c | 41 ++++++++++++++++++++-------------------
 1 file changed, 21 insertions(+), 20 deletions(-)

diff --git a/drivers/gpu/drm/bridge/tc358768.c b/drivers/gpu/drm/bridge/tc358768.c
index 88060f961064..6297d28250e9 100644
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

