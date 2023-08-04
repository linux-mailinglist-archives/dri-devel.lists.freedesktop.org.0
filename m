Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BF8FB76FECB
	for <lists+dri-devel@lfdr.de>; Fri,  4 Aug 2023 12:46:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BCE9510E6D3;
	Fri,  4 Aug 2023 10:46:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 73D0810E6CD
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Aug 2023 10:44:43 +0000 (UTC)
Received: from [127.0.1.1] (91-154-35-171.elisa-laajakaista.fi [91.154.35.171])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id BB74A1BAD;
 Fri,  4 Aug 2023 12:43:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1691145817;
 bh=WCGNIXcGcdl4nJn+dx6lcBvQUFqQ55HfWTEz54MJwVw=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=MK2AtVNhVEBgVjSDGNhmtoZ8KjiMA7AiCJPz9eFTXEgyi/l/jOP1Xr0NxtJt+0tG2
 pAvOj33+r1KziwPiPQQCFQMuuJlEIgDrtRmf4kGlif2+edjN7lMNI8F2byBb5YOBpz
 ARyojtie+6BJmGYmYGX1nnJFb31zDaJJN00kqXNE=
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Date: Fri, 04 Aug 2023 13:44:09 +0300
Subject: [PATCH 04/11] drm/bridge: tc358768: Use struct videomode
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230804-tc358768-v1-4-1afd44b7826b@ideasonboard.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4738;
 i=tomi.valkeinen@ideasonboard.com; h=from:subject:message-id;
 bh=WCGNIXcGcdl4nJn+dx6lcBvQUFqQ55HfWTEz54MJwVw=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBkzNaSZtaCZTUTMK2vRUk8BC+9py3CA7QFWEyvh
 Y2y2pe7w6SJAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCZMzWkgAKCRD6PaqMvJYe
 9XRpEACGSSmoQ7fJZ7Gv5yX/hogaE80D+3dt7+5wRL8c09/59O0sLcAYQTFnlL2l7ttC0MxNbqy
 8WJISu1ptKdyhP3Q+fEVqRQL9O51QsUvAkcXqjaQvH2suLpAqvtU2k1HXlYtn8yCOjSb5phtJUZ
 mtqzns7g5Zl2ac0J2AMx5N9M4TmiH3V9uAE82vhsq2Xul1KH/7xG5/lGaBuqQ114s3mO+WhTrxT
 Ump8ZuZ80MymE21vsEyaOW5J4D7C9okUWx+5+lU+w2k5epzv0nvnCCeSAyN6Jg8/qfkqllJjmlP
 cdcQKqD866RWsjBSIW1zS6jr7zO72SaX1zuG1GlWL3fZguYP8yod/VyhJi4ZvsNv3/pnWBCwApw
 ADf3zxu8h4E4xGZOcEhI6Hbq3P7DtPaqbGIjFBnJsyITVKEI/Ei5CTjh4zCzNGsd+cAD554qWiH
 SdHoHnbu6wSC1Vji9nQEj7wT/ZOzUPLaw7Vi2FB5prx49Me/pzGKjgdLIFsQM+kkC/ftW4JqDRj
 wiAcdNOgMqlplu5Wgyg3qM9C/WfqBo4WAEeqaGwDyzY094X0i0idqNVmTb5ol9lXCZJyw9z4OPd
 4J70tJdjBFzhce+Xnv7U6AyLorhfekJdG6KbQcYFTSEJfx9JS7R8/DZImww12wITt6UZl/lzHDV
 CFp04MYkSYpJuRA==
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

Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
 drivers/gpu/drm/bridge/tc358768.c | 45 +++++++++++++++++++++------------------
 1 file changed, 24 insertions(+), 21 deletions(-)

diff --git a/drivers/gpu/drm/bridge/tc358768.c b/drivers/gpu/drm/bridge/tc358768.c
index d5831a1236e9..9b633038af33 100644
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

