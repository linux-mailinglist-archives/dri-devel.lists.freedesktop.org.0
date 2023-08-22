Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AFE9B7846F5
	for <lists+dri-devel@lfdr.de>; Tue, 22 Aug 2023 18:20:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BAC6D10E380;
	Tue, 22 Aug 2023 16:20:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5CD7C10E3A8
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Aug 2023 16:20:08 +0000 (UTC)
Received: from [127.0.1.1] (91-154-35-171.elisa-laajakaista.fi [91.154.35.171])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 5CF76899;
 Tue, 22 Aug 2023 18:18:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1692721130;
 bh=/fdTwIinfOD1dWCn53BwEEqB2YEiF7umOj7mqg3kQGQ=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=fChxcC0djPPFYseURTXJQRpZDS0qsebjyQCP1RKRqbhOrkaEOrqYJfNG10VWs+wgl
 U32sJfIwN8+0OMIPbmfq/pCpyNxOUGg4yRL+xRnjZwsRRikoYMZbWRcTI9O+IoEvu3
 nI5L61NdHoScBD4ZfZoSsF8Vs5/8fd5oYG+31Dgo=
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Date: Tue, 22 Aug 2023 19:19:39 +0300
Subject: [PATCH v3 06/12] drm/bridge: tc358768: Use struct videomode
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230822-tc358768-v3-6-c82405dac0c1@ideasonboard.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4794;
 i=tomi.valkeinen@ideasonboard.com; h=from:subject:message-id;
 bh=/fdTwIinfOD1dWCn53BwEEqB2YEiF7umOj7mqg3kQGQ=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBk5OAsMFyHoqmCmk10GeRJyyZo4n7xKVACnmvGD
 vfojc9l+xGJAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCZOTgLAAKCRD6PaqMvJYe
 9f6bEACq5/CQnJO/Qvxo2o1ZBfTTIX/YBQICBvB/Ty0LyqWUi+2ExBKXXqjU1/VR0xu95sdejWG
 tz+nNns3Fs7mT400bfUyOv7UucOSgq19N2aWqn+KKFBkOTXIxSbvxWmCGlXUrmcCm1HWFEVI2/K
 PI1WCy20Jm2u/jrptjk6nEAJyefKmAAfCHHc/og+Pid2B8I/LTfPKfxb9UUque+O3RN/xu4zIb7
 eUA6itqpgWYDcE5y3aa8ULHsgYx+i7CHirSi/zn2s86Pzh9T8xc3hJX119mHQAFEErU2sQPNP0V
 UhnezSdVj7WpbyhYnwTsLRHi2JQXyKowlS1JOoTdIyHSRvnY2gixv81HeqtMgY/z44ArcGN1wK3
 j08r28NS4HfDaHObesL/XHE1nehr58rro5dsmqlg2g5dCMVImgg9fXjqgdYU7+hy15q1op7bRgS
 Byl5Zg8cnuKMB1cCzdzi3gB05NEdsT40itl8AO/ySdf6t25m6hgLMMYeI286+KuEKTI8YPB0aRc
 MYCtnXvIeY1WU3JP4LvMBfFpWgk6JmV82+HCNWiVQ0Z7hDA1E5U6Ix/PTqu4trfumKriovxLyFi
 mn0L/VM+F5WpqI2l7m+7NmNKXMcxNUv8hF4PVS+R8R673FwLwCm4EcMmhXRIenNQCavx5lJpEuh
 zfNfa+s2khpHTkQ==
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

The TC358768 documentation uses HFP, HBP, etc. values to deal with the
video mode, while the driver currently uses the DRM display mode
(htotal, hsync_start, etc).

Change the driver to convert the DRM display mode to struct videomode,
which then allows us to use the same units the documentation uses. This
makes it much easier to work on the code when using the TC358768
documentation as a reference.

Reviewed-by: Peter Ujfalusi <peter.ujfalusi@gmail.com>
Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
 drivers/gpu/drm/bridge/tc358768.c | 45 +++++++++++++++++++++------------------
 1 file changed, 24 insertions(+), 21 deletions(-)

diff --git a/drivers/gpu/drm/bridge/tc358768.c b/drivers/gpu/drm/bridge/tc358768.c
index a465674f1e2e..b98c517c4726 100644
--- a/drivers/gpu/drm/bridge/tc358768.c
+++ b/drivers/gpu/drm/bridge/tc358768.c
@@ -650,6 +650,7 @@ static void tc358768_bridge_pre_enable(struct drm_bridge *bridge)
 	u32 dsiclk, dsibclk, video_start;
 	const u32 internal_delay = 40;
 	int ret, i;
+	struct videomode vm;
 
 	if (mode_flags & MIPI_DSI_CLOCK_NON_CONTINUOUS) {
 		dev_warn_once(priv->dev, "Non-continuous mode unimplemented, falling back to continuous\n");
@@ -673,6 +674,8 @@ static void tc358768_bridge_pre_enable(struct drm_bridge *bridge)
 		return;
 	}
 
+	drm_display_mode_to_videomode(mode, &vm);
+
 	dsiclk = priv->dsiclk;
 	dsibclk = dsiclk / 4;
 
@@ -681,28 +684,28 @@ static void tc358768_bridge_pre_enable(struct drm_bridge *bridge)
 	switch (dsi_dev->format) {
 	case MIPI_DSI_FMT_RGB888:
 		val |= (0x3 << 4);
-		hact = mode->hdisplay * 3;
-		video_start = (mode->htotal - mode->hsync_start) * 3;
+		hact = vm.hactive * 3;
+		video_start = (vm.hsync_len + vm.hback_porch) * 3;
 		data_type = MIPI_DSI_PACKED_PIXEL_STREAM_24;
 		break;
 	case MIPI_DSI_FMT_RGB666:
 		val |= (0x4 << 4);
-		hact = mode->hdisplay * 3;
-		video_start = (mode->htotal - mode->hsync_start) * 3;
+		hact = vm.hactive * 3;
+		video_start = (vm.hsync_len + vm.hback_porch) * 3;
 		data_type = MIPI_DSI_PACKED_PIXEL_STREAM_18;
 		break;
 
 	case MIPI_DSI_FMT_RGB666_PACKED:
 		val |= (0x4 << 4) | BIT(3);
-		hact = mode->hdisplay * 18 / 8;
-		video_start = (mode->htotal - mode->hsync_start) * 18 / 8;
+		hact = vm.hactive * 18 / 8;
+		video_start = (vm.hsync_len + vm.hback_porch) * 18 / 8;
 		data_type = MIPI_DSI_PIXEL_STREAM_3BYTE_18;
 		break;
 
 	case MIPI_DSI_FMT_RGB565:
 		val |= (0x5 << 4);
-		hact = mode->hdisplay * 2;
-		video_start = (mode->htotal - mode->hsync_start) * 2;
+		hact = vm.hactive * 2;
+		video_start = (vm.hsync_len + vm.hback_porch) * 2;
 		data_type = MIPI_DSI_PACKED_PIXEL_STREAM_16;
 		break;
 	default:
@@ -814,43 +817,43 @@ static void tc358768_bridge_pre_enable(struct drm_bridge *bridge)
 		tc358768_write(priv, TC358768_DSI_EVENT, 0);
 
 		/* vact */
-		tc358768_write(priv, TC358768_DSI_VACT, mode->vdisplay);
+		tc358768_write(priv, TC358768_DSI_VACT, vm.vactive);
 
 		/* vsw */
-		tc358768_write(priv, TC358768_DSI_VSW,
-			       mode->vsync_end - mode->vsync_start);
+		tc358768_write(priv, TC358768_DSI_VSW, vm.vsync_len);
+
 		/* vbp */
-		tc358768_write(priv, TC358768_DSI_VBPR,
-			       mode->vtotal - mode->vsync_end);
+		tc358768_write(priv, TC358768_DSI_VBPR, vm.vback_porch);
 
 		/* hsw * byteclk * ndl / pclk */
-		val = (u32)div_u64((mode->hsync_end - mode->hsync_start) *
+		val = (u32)div_u64(vm.hsync_len *
 				   ((u64)priv->dsiclk / 4) * priv->dsi_lanes,
-				   mode->clock * 1000);
+				   vm.pixelclock);
 		tc358768_write(priv, TC358768_DSI_HSW, val);
 
 		/* hbp * byteclk * ndl / pclk */
-		val = (u32)div_u64((mode->htotal - mode->hsync_end) *
+		val = (u32)div_u64(vm.hback_porch *
 				   ((u64)priv->dsiclk / 4) * priv->dsi_lanes,
-				   mode->clock * 1000);
+				   vm.pixelclock);
 		tc358768_write(priv, TC358768_DSI_HBPR, val);
 	} else {
 		/* Set event mode */
 		tc358768_write(priv, TC358768_DSI_EVENT, 1);
 
 		/* vact */
-		tc358768_write(priv, TC358768_DSI_VACT, mode->vdisplay);
+		tc358768_write(priv, TC358768_DSI_VACT, vm.vactive);
 
 		/* vsw (+ vbp) */
 		tc358768_write(priv, TC358768_DSI_VSW,
-			       mode->vtotal - mode->vsync_start);
+			       vm.vsync_len + vm.vback_porch);
+
 		/* vbp (not used in event mode) */
 		tc358768_write(priv, TC358768_DSI_VBPR, 0);
 
 		/* (hsw + hbp) * byteclk * ndl / pclk */
-		val = (u32)div_u64((mode->htotal - mode->hsync_start) *
+		val = (u32)div_u64((vm.hsync_len + vm.hback_porch) *
 				   ((u64)priv->dsiclk / 4) * priv->dsi_lanes,
-				   mode->clock * 1000);
+				   vm.pixelclock);
 		tc358768_write(priv, TC358768_DSI_HSW, val);
 
 		/* hbp (not used in event mode) */

-- 
2.34.1

