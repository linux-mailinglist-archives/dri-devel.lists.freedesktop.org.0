Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3093376FECA
	for <lists+dri-devel@lfdr.de>; Fri,  4 Aug 2023 12:46:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE04F10E6D2;
	Fri,  4 Aug 2023 10:46:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE05410E6D0
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Aug 2023 10:44:47 +0000 (UTC)
Received: from [127.0.1.1] (91-154-35-171.elisa-laajakaista.fi [91.154.35.171])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id EB3772A4B;
 Fri,  4 Aug 2023 12:43:40 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1691145821;
 bh=ELgigWtoD/WjDlm4NjUr8bRyAjoxE3TF/Vb3awGuK/o=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=QYTeoUI6Z1KP9jf5JNFolFg1oOnCxfAWxOwnaejdsgSk3mgHhAE9UzhfeIem3ckTq
 mFQDX06n3asaAk/PsPidPV7dL/88XCfsI/8gS2GM4Mc5FW3MnXSoF5/J2crh6Yiapb
 CxGU1JUmovBYRcEeUU0N2DWGNJBfpRtpliEc7Oc8=
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Date: Fri, 04 Aug 2023 13:44:13 +0300
Subject: [PATCH 08/11] drm/bridge: tc358768: Clean up clock period code
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230804-tc358768-v1-8-1afd44b7826b@ideasonboard.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=6503;
 i=tomi.valkeinen@ideasonboard.com; h=from:subject:message-id;
 bh=ELgigWtoD/WjDlm4NjUr8bRyAjoxE3TF/Vb3awGuK/o=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBkzNaTuuWogQSf6kACTFvu2u3h7ud5VB+1iSfB+
 k8sp2aRBLyJAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCZMzWkwAKCRD6PaqMvJYe
 9WLGEACZmidk7hLfu+CoMCAeSUbSFXTWFRD210fCVc+r7o1kzbQJ/IIZP+NmbUiaUkYAvl4l8bh
 n/Z7K5Hibr/Rq3RXPz2sSxGt3Mh0DpmFgH6DMkUjMUo5EPlVpn3jBuYT4lur0ecSVqjyAYp8DlB
 glUi5hLQMlFBc2zFaBBhXHeKkCpBG2WqXyzyoLkmvHcBgyY4LckKCgOJVZZMqLWLbobG6Ejgd8Q
 pwtC0iEZ8g20aBsnueri2dInvpDOSZsEejQX4JyW+YeCiwZN+WlnTnaOy9lIZBijHWabj+zAfOX
 CKjnR/eveGG6+X0DUVSFCvC9LIkZe27C3Up00ScFfooujkl0bd0fO08UsZ+z0Lp/d9t32Zyw/F4
 6FYdILNlhHhBjZEy3DXeX3wgsBv3K82lCGLKvGVPLaQ6sn6fPmyWmBxA4rAl6r3DfSrMOfnCNOx
 ZzErsEJe0MUnCtQR+DohVWAtRRNZLk9mtauS7LqsXasQamN9SjIrvt/vbOnRnyuqM5QGISLQa51
 r3cVq3e3MkXs5+bE6cx3/2SKfNz6abb/YXbldBamUl/Iij8olzW8izYZgpWV2oN/zlV/+Jvjs55
 GNbr3qXNBL6SIW6f3DAE6xGZavfBiYYc7efnlCe7UXXo4HTEm3Z1c6yZvNXcw5H8X5HFdJO5sMn
 u6K+UZWWB+ufaRg==
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

The driver defines TC358768_PRECISION as 1000, and uses "nsk" to refer
to clock periods. The original author does not remember where all this
came from. Effectively the driver is using picoseconds as the unit for
clock periods, yet referring to them by "nsk".

Clean this up by just saying the periods are in picoseconds.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
 drivers/gpu/drm/bridge/tc358768.c | 60 +++++++++++++++++++--------------------
 1 file changed, 29 insertions(+), 31 deletions(-)

diff --git a/drivers/gpu/drm/bridge/tc358768.c b/drivers/gpu/drm/bridge/tc358768.c
index db45b4a982c0..9411b0fb471e 100644
--- a/drivers/gpu/drm/bridge/tc358768.c
+++ b/drivers/gpu/drm/bridge/tc358768.c
@@ -15,6 +15,7 @@
 #include <linux/regmap.h>
 #include <linux/regulator/consumer.h>
 #include <linux/slab.h>
+#include <linux/units.h>
 
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_drv.h>
@@ -627,15 +628,14 @@ static int tc358768_setup_pll(struct tc358768_priv *priv,
 	return tc358768_clear_error(priv);
 }
 
-#define TC358768_PRECISION	1000
-static u32 tc358768_ns_to_cnt(u32 ns, u32 period_nsk)
+static u32 tc358768_ns_to_cnt(u32 ns, u32 period_ps)
 {
-	return (ns * TC358768_PRECISION + period_nsk) / period_nsk;
+	return (ns * 1000 + period_ps) / period_ps;
 }
 
-static u32 tc358768_to_ns(u32 nsk)
+static u32 tc358768_ps_to_ns(u32 ps)
 {
-	return (nsk / TC358768_PRECISION);
+	return ps / 1000;
 }
 
 static void tc358768_bridge_pre_enable(struct drm_bridge *bridge)
@@ -646,7 +646,7 @@ static void tc358768_bridge_pre_enable(struct drm_bridge *bridge)
 	u32 val, val2, lptxcnt, hact, data_type;
 	s32 raw_val;
 	const struct drm_display_mode *mode;
-	u32 hsbyteclk_nsk, dsiclk_nsk, ui_nsk;
+	u32 hsbyteclk_ps, dsiclk_ps, ui_ps;
 	u32 dsiclk, hsbyteclk, video_start;
 	const u32 internal_delay = 40;
 	int ret, i;
@@ -730,67 +730,65 @@ static void tc358768_bridge_pre_enable(struct drm_bridge *bridge)
 		tc358768_write(priv, TC358768_D0W_CNTRL + i * 4, 0x0000);
 
 	/* DSI Timings */
-	hsbyteclk_nsk = (u32)div_u64((u64)1000000000 * TC358768_PRECISION,
-				  hsbyteclk);
-	dsiclk_nsk = (u32)div_u64((u64)1000000000 * TC358768_PRECISION, dsiclk);
-	ui_nsk = dsiclk_nsk / 2;
-	dev_dbg(dev, "dsiclk_nsk: %u\n", dsiclk_nsk);
-	dev_dbg(dev, "ui_nsk: %u\n", ui_nsk);
-	dev_dbg(dev, "hsbyteclk_nsk: %u\n", hsbyteclk_nsk);
+	hsbyteclk_ps = (u32)div_u64(PICO, hsbyteclk);
+	dsiclk_ps = (u32)div_u64(PICO, dsiclk);
+	ui_ps = dsiclk_ps / 2;
+	dev_dbg(dev, "dsiclk: %u ps, ui %u ps, hsbyteclk %u ps\n", dsiclk_ps,
+		ui_ps, hsbyteclk_ps);
 
 	/* LP11 > 100us for D-PHY Rx Init */
-	val = tc358768_ns_to_cnt(100 * 1000, hsbyteclk_nsk) - 1;
+	val = tc358768_ns_to_cnt(100 * 1000, hsbyteclk_ps) - 1;
 	dev_dbg(dev, "LINEINITCNT: %u\n", val);
 	tc358768_write(priv, TC358768_LINEINITCNT, val);
 
 	/* LPTimeCnt > 50ns */
-	val = tc358768_ns_to_cnt(50, hsbyteclk_nsk) - 1;
+	val = tc358768_ns_to_cnt(50, hsbyteclk_ps) - 1;
 	lptxcnt = val;
 	dev_dbg(dev, "LPTXTIMECNT: %u\n", val);
 	tc358768_write(priv, TC358768_LPTXTIMECNT, val);
 
 	/* 38ns < TCLK_PREPARE < 95ns */
-	val = tc358768_ns_to_cnt(65, hsbyteclk_nsk) - 1;
+	val = tc358768_ns_to_cnt(65, hsbyteclk_ps) - 1;
 	dev_dbg(dev, "TCLK_PREPARECNT %u\n", val);
 	/* TCLK_PREPARE + TCLK_ZERO > 300ns */
-	val2 = tc358768_ns_to_cnt(300 - tc358768_to_ns(2 * ui_nsk),
-				  hsbyteclk_nsk) - 2;
+	val2 = tc358768_ns_to_cnt(300 - tc358768_ps_to_ns(2 * ui_ps),
+				  hsbyteclk_ps) - 2;
 	dev_dbg(dev, "TCLK_ZEROCNT %u\n", val2);
 	val |= val2 << 8;
 	tc358768_write(priv, TC358768_TCLK_HEADERCNT, val);
 
 	/* TCLK_TRAIL > 60ns AND TEOT <= 105 ns + 12*UI */
-	raw_val = tc358768_ns_to_cnt(60 + tc358768_to_ns(2 * ui_nsk), hsbyteclk_nsk) - 5;
+	raw_val = tc358768_ns_to_cnt(60 + tc358768_ps_to_ns(2 * ui_ps), hsbyteclk_ps) - 5;
 	val = clamp(raw_val, 0, 127);
 	dev_dbg(dev, "TCLK_TRAILCNT: %u\n", val);
 	tc358768_write(priv, TC358768_TCLK_TRAILCNT, val);
 
 	/* 40ns + 4*UI < THS_PREPARE < 85ns + 6*UI */
-	val = 50 + tc358768_to_ns(4 * ui_nsk);
-	val = tc358768_ns_to_cnt(val, hsbyteclk_nsk) - 1;
+	val = 50 + tc358768_ps_to_ns(4 * ui_ps);
+	val = tc358768_ns_to_cnt(val, hsbyteclk_ps) - 1;
 	dev_dbg(dev, "THS_PREPARECNT %u\n", val);
 	/* THS_PREPARE + THS_ZERO > 145ns + 10*UI */
-	raw_val = tc358768_ns_to_cnt(145 - tc358768_to_ns(3 * ui_nsk), hsbyteclk_nsk) - 10;
+	raw_val = tc358768_ns_to_cnt(145 - tc358768_ps_to_ns(3 * ui_ps), hsbyteclk_ps) - 10;
 	val2 = clamp(raw_val, 0, 127);
 	dev_dbg(dev, "THS_ZEROCNT %u\n", val2);
 	val |= val2 << 8;
 	tc358768_write(priv, TC358768_THS_HEADERCNT, val);
 
 	/* TWAKEUP > 1ms in lptxcnt steps */
-	val = tc358768_ns_to_cnt(1020000, hsbyteclk_nsk);
+	val = tc358768_ns_to_cnt(1020000, hsbyteclk_ps);
 	val = val / (lptxcnt + 1) - 1;
 	dev_dbg(dev, "TWAKEUP: %u\n", val);
 	tc358768_write(priv, TC358768_TWAKEUP, val);
 
 	/* TCLK_POSTCNT > 60ns + 52*UI */
-	val = tc358768_ns_to_cnt(60 + tc358768_to_ns(52 * ui_nsk),
-				 hsbyteclk_nsk) - 3;
+	val = tc358768_ns_to_cnt(60 + tc358768_ps_to_ns(52 * ui_ps),
+				 hsbyteclk_ps) - 3;
 	dev_dbg(dev, "TCLK_POSTCNT: %u\n", val);
 	tc358768_write(priv, TC358768_TCLK_POSTCNT, val);
 
 	/* max(60ns + 4*UI, 8*UI) < THS_TRAILCNT < 105ns + 12*UI */
-	raw_val = tc358768_ns_to_cnt(60 + tc358768_to_ns(18 * ui_nsk),
-				     hsbyteclk_nsk) - 4;
+	raw_val = tc358768_ns_to_cnt(60 + tc358768_ps_to_ns(18 * ui_ps),
+				     hsbyteclk_ps) - 4;
 	val = clamp(raw_val, 0, 15);
 	dev_dbg(dev, "THS_TRAILCNT: %u\n", val);
 	tc358768_write(priv, TC358768_THS_TRAILCNT, val);
@@ -804,11 +802,11 @@ static void tc358768_bridge_pre_enable(struct drm_bridge *bridge)
 		       (mode_flags & MIPI_DSI_CLOCK_NON_CONTINUOUS) ? 0 : BIT(0));
 
 	/* TXTAGOCNT[26:16] RXTASURECNT[10:0] */
-	val = tc358768_to_ns((lptxcnt + 1) * hsbyteclk_nsk * 4);
-	val = tc358768_ns_to_cnt(val, hsbyteclk_nsk) / 4 - 1;
+	val = tc358768_ps_to_ns((lptxcnt + 1) * hsbyteclk_ps * 4);
+	val = tc358768_ns_to_cnt(val, hsbyteclk_ps) / 4 - 1;
 	dev_dbg(dev, "TXTAGOCNT: %u\n", val);
-	val2 = tc358768_ns_to_cnt(tc358768_to_ns((lptxcnt + 1) * hsbyteclk_nsk),
-				  hsbyteclk_nsk) - 2;
+	val2 = tc358768_ns_to_cnt(tc358768_ps_to_ns((lptxcnt + 1) * hsbyteclk_ps),
+				  hsbyteclk_ps) - 2;
 	dev_dbg(dev, "RXTASURECNT: %u\n", val2);
 	val = val << 16 | val2;
 	tc358768_write(priv, TC358768_BTACNTRL1, val);

-- 
2.34.1

