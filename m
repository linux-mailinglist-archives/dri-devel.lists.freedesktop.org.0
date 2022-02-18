Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 818584BAEEE
	for <lists+dri-devel@lfdr.de>; Fri, 18 Feb 2022 02:01:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8BDBC10E962;
	Fri, 18 Feb 2022 01:01:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from phobos.denx.de (phobos.denx.de
 [IPv6:2a01:238:438b:c500:173d:9f52:ddab:ee01])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E6E0B10E919
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Feb 2022 01:01:21 +0000 (UTC)
Received: from tr.lan (ip-89-176-112-137.net.upcbroadband.cz [89.176.112.137])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 5F9E083B79;
 Fri, 18 Feb 2022 02:01:20 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1645146080;
 bh=+2ZuEgdUHwh9vN60/nE8sGYex1GdRMcQpt8dV4jdTJo=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Joe6t5Y1FDOzBiY9ZcYunFKIWbY45/lLfZgVC45JNMcGKBPKSt368j0TSU67HNA+/
 +o3WXHVtZ5GxkaOKb4S1HTXGtiTOklE7RuxNjs4SV47SAGcoTvbGFDbUhj+JuPIhpX
 hIWLsWCzBUUIyAe9KHhUkQRSf0twzQo2TU55pgvaGrCKrsDk60FfWjdPdD4WvZWrXk
 tMB3R4ZIH4BxA+Od0+PW37In43QRNkQHiCxbk7H9+WC4+yHmtZuztPF1YAofF7XGQ0
 V7D/nsHB0Ur2zFaTEyANzViY87tyPbgPRVYqBpkhWBkCjQUnLwIruophwevG+uefQe
 IEM7neD9juBtQ==
From: Marek Vasut <marex@denx.de>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH V2 10/11] drm/bridge: tc358767: Split tc_set_video_mode() into
 common and (e)DP part
Date: Fri, 18 Feb 2022 02:00:53 +0100
Message-Id: <20220218010054.315026-11-marex@denx.de>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220218010054.315026-1-marex@denx.de>
References: <20220218010054.315026-1-marex@denx.de>
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

Signed-off-by: Marek Vasut <marex@denx.de>
Cc: Jonas Karlman <jonas@kwiboo.se>
Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Cc: Maxime Ripard <maxime@cerno.tech>
Cc: Neil Armstrong <narmstrong@baylibre.com>
Cc: Sam Ravnborg <sam@ravnborg.org>
---
V2: - New patch
---
 drivers/gpu/drm/bridge/tc358767.c | 48 ++++++++++++++++++++++++-------
 1 file changed, 37 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/bridge/tc358767.c b/drivers/gpu/drm/bridge/tc358767.c
index 4af0ad5db2148..091c969a36ab7 100644
--- a/drivers/gpu/drm/bridge/tc358767.c
+++ b/drivers/gpu/drm/bridge/tc358767.c
@@ -734,11 +734,10 @@ static int tc_get_display_props(struct tc_data *tc)
 	return ret;
 }
 
-static int tc_set_video_mode(struct tc_data *tc,
-			     const struct drm_display_mode *mode)
+static int tc_set_common_video_mode(struct tc_data *tc,
+				    const struct drm_display_mode *mode)
 {
 	int ret;
-	int vid_sync_dly;
 	int max_tu_symbol;
 
 	int left_margin = mode->htotal - mode->hsync_end;
@@ -747,7 +746,6 @@ static int tc_set_video_mode(struct tc_data *tc,
 	int upper_margin = mode->vtotal - mode->vsync_end;
 	int lower_margin = mode->vsync_start - mode->vdisplay;
 	int vsync_len = mode->vsync_end - mode->vsync_start;
-	u32 dp0_syncval;
 	u32 bits_per_pixel = 24;
 	u32 in_bw, out_bw;
 
@@ -818,8 +816,35 @@ static int tc_set_video_mode(struct tc_data *tc,
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
@@ -869,10 +894,7 @@ static int tc_set_video_mode(struct tc_data *tc,
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
@@ -1185,7 +1207,11 @@ static int tc_edp_stream_enable(struct tc_data *tc)
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
2.34.1

