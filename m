Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CAEED4EA9B2
	for <lists+dri-devel@lfdr.de>; Tue, 29 Mar 2022 10:51:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BFEBD10E7DF;
	Tue, 29 Mar 2022 08:50:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from phobos.denx.de (phobos.denx.de
 [IPv6:2a01:238:438b:c500:173d:9f52:ddab:ee01])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3FCA010E7EF
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Mar 2022 08:50:42 +0000 (UTC)
Received: from tr.lan (ip-89-176-112-137.net.upcbroadband.cz [89.176.112.137])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 99FF483FBF;
 Tue, 29 Mar 2022 10:50:40 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1648543841;
 bh=37PoZPonIjFXf5RKumjhCzyKLIkAUAMynLnvtGVd6i8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=IkK3be7vwIYnY39yDaNhRd9dUOyzcuEAWLAXGmgG2wCp1IZMK/YL3aVYsxmW21rik
 gUWf0QqVv9ggHLu/480D4w619Dxh7cNe9bR6xJ9aQqQKhmea56vKj7+KqselJ76AXn
 UIxBb0tHIXHnIy9EYz4U0aX3tvWTBtlGqBrywcRZWDf9a+MmQQctsz6GgT3JjEGesK
 S1ds19LlwFMSmhX+SuhIvqWW0YhRzFL5iIQwMvKjBV/XzzPPLQK41hvtIOG2F8pm+B
 yZ0/TqcfBKN0uPTNjaUWZ3sDYqCByeTd0MasfwD+Zfy5yH5HxrknSfnQ5eEvjzkNXP
 c4b6qEx49vQvA==
From: Marek Vasut <marex@denx.de>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v5 10/11] drm/bridge: tc358767: Split tc_set_video_mode() into
 common and (e)DP part
Date: Tue, 29 Mar 2022 10:50:14 +0200
Message-Id: <20220329085015.39159-11-marex@denx.de>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220329085015.39159-1-marex@denx.de>
References: <20220329085015.39159-1-marex@denx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: clamav-milter 0.103.5 at phobos.denx.de
X-Virus-Status: Clean
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
Cc: Marek Vasut <marex@denx.de>, Neil Armstrong <narmstrong@baylibre.com>,
 Jonas Karlman <jonas@kwiboo.se>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Sam Ravnborg <sam@ravnborg.org>, Maxime Ripard <maxime@cerno.tech>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The tc_set_video_mode() sets up both common and (e)DP video mode settings of
the bridge chip. Split the function into tc_set_common_video_mode() to set
the common settings and tc_set_edp_video_mode() to set the (e)DP specific
settings. No functional change.

Reviewed-by: Lucas Stach <l.stach@pengutronix.de>
Tested-by: Lucas Stach <l.stach@pengutronix.de> # In both DPI to eDP and DSI to DPI mode.
Signed-off-by: Marek Vasut <marex@denx.de>
Cc: Jonas Karlman <jonas@kwiboo.se>
Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Cc: Maxime Ripard <maxime@cerno.tech>
Cc: Neil Armstrong <narmstrong@baylibre.com>
Cc: Sam Ravnborg <sam@ravnborg.org>
---
V2: - New patch
V3: - Add RB from Lucas
V4: - Add TB from Lucas
V5: Drop unused variables from tc_set_common_video_mode()
---
 drivers/gpu/drm/bridge/tc358767.c | 65 ++++++++++++++++++-------------
 1 file changed, 38 insertions(+), 27 deletions(-)

diff --git a/drivers/gpu/drm/bridge/tc358767.c b/drivers/gpu/drm/bridge/tc358767.c
index dd324cf16e4d0..02f9cea738d21 100644
--- a/drivers/gpu/drm/bridge/tc358767.c
+++ b/drivers/gpu/drm/bridge/tc358767.c
@@ -734,33 +734,16 @@ static int tc_get_display_props(struct tc_data *tc)
 	return ret;
 }
 
-static int tc_set_video_mode(struct tc_data *tc,
-			     const struct drm_display_mode *mode)
+static int tc_set_common_video_mode(struct tc_data *tc,
+				    const struct drm_display_mode *mode)
 {
-	int ret;
-	int vid_sync_dly;
-	int max_tu_symbol;
-
 	int left_margin = mode->htotal - mode->hsync_end;
 	int right_margin = mode->hsync_start - mode->hdisplay;
 	int hsync_len = mode->hsync_end - mode->hsync_start;
 	int upper_margin = mode->vtotal - mode->vsync_end;
 	int lower_margin = mode->vsync_start - mode->vdisplay;
 	int vsync_len = mode->vsync_end - mode->vsync_start;
-	u32 dp0_syncval;
-	u32 bits_per_pixel = 24;
-	u32 in_bw, out_bw;
-
-	/*
-	 * Recommended maximum number of symbols transferred in a transfer unit:
-	 * DIV_ROUND_UP((input active video bandwidth in bytes) * tu_size,
-	 *              (output active video bandwidth in bytes))
-	 * Must be less than tu_size.
-	 */
-
-	in_bw = mode->clock * bits_per_pixel / 8;
-	out_bw = tc->link.num_lanes * tc->link.rate;
-	max_tu_symbol = DIV_ROUND_UP(in_bw * TU_SIZE_RECOMMENDED, out_bw);
+	int ret;
 
 	dev_dbg(tc->dev, "set mode %dx%d\n",
 		mode->hdisplay, mode->vdisplay);
@@ -818,8 +801,35 @@ static int tc_set_video_mode(struct tc_data *tc,
 			   FIELD_PREP(COLOR_B, 99) |
 			   ENI2CFILTER |
 			   FIELD_PREP(COLOR_BAR_MODE, COLOR_BAR_MODE_BARS));
-	if (ret)
-		return ret;
+
+	return ret;
+}
+
+static int tc_set_edp_video_mode(struct tc_data *tc,
+				 const struct drm_display_mode *mode)
+{
+	int ret;
+	int vid_sync_dly;
+	int max_tu_symbol;
+
+	int left_margin = mode->htotal - mode->hsync_end;
+	int hsync_len = mode->hsync_end - mode->hsync_start;
+	int upper_margin = mode->vtotal - mode->vsync_end;
+	int vsync_len = mode->vsync_end - mode->vsync_start;
+	u32 dp0_syncval;
+	u32 bits_per_pixel = 24;
+	u32 in_bw, out_bw;
+
+	/*
+	 * Recommended maximum number of symbols transferred in a transfer unit:
+	 * DIV_ROUND_UP((input active video bandwidth in bytes) * tu_size,
+	 *              (output active video bandwidth in bytes))
+	 * Must be less than tu_size.
+	 */
+
+	in_bw = mode->clock * bits_per_pixel / 8;
+	out_bw = tc->link.num_lanes * tc->link.rate;
+	max_tu_symbol = DIV_ROUND_UP(in_bw * TU_SIZE_RECOMMENDED, out_bw);
 
 	/* DP Main Stream Attributes */
 	vid_sync_dly = hsync_len + left_margin + mode->hdisplay;
@@ -869,10 +879,7 @@ static int tc_set_video_mode(struct tc_data *tc,
 			   FIELD_PREP(MAX_TU_SYMBOL, max_tu_symbol) |
 			   FIELD_PREP(TU_SIZE, TU_SIZE_RECOMMENDED) |
 			   BPC_8);
-	if (ret)
-		return ret;
-
-	return 0;
+	return ret;
 }
 
 static int tc_wait_link_training(struct tc_data *tc)
@@ -1185,7 +1192,11 @@ static int tc_edp_stream_enable(struct tc_data *tc)
 			return ret;
 	}
 
-	ret = tc_set_video_mode(tc, &tc->mode);
+	ret = tc_set_common_video_mode(tc, &tc->mode);
+	if (ret)
+		return ret;
+
+	ret = tc_set_edp_video_mode(tc, &tc->mode);
 	if (ret)
 		return ret;
 
-- 
2.35.1

