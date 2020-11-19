Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BBF992B9C0F
	for <lists+dri-devel@lfdr.de>; Thu, 19 Nov 2020 21:32:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9073F6E825;
	Thu, 19 Nov 2020 20:32:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from aposti.net (aposti.net [89.234.176.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 778E66E57E
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Nov 2020 15:56:25 +0000 (UTC)
From: Paul Cercueil <paul@crapouillou.net>
To: David Airlie <airlied@linux.ie>,
	Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH 2/3] drm/ingenic: Properly compute timings when using a
 3x8-bit panel
Date: Thu, 19 Nov 2020 15:55:58 +0000
Message-Id: <20201119155559.14112-3-paul@crapouillou.net>
In-Reply-To: <20201119155559.14112-1-paul@crapouillou.net>
References: <20201119155559.14112-1-paul@crapouillou.net>
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 19 Nov 2020 20:32:07 +0000
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
Cc: Paul Cercueil <paul@crapouillou.net>, od@zcrc.me,
 Sam Ravnborg <sam@ravnborg.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The LCD controller expects timing values in dot-clock ticks, which is 3x
the timing values in pixels when using a 3x8-bit display; but it will
count the display area size in pixels either way. Go figure.

Signed-off-by: Paul Cercueil <paul@crapouillou.net>
---
 drivers/gpu/drm/ingenic/ingenic-drm-drv.c | 15 ++++++++++++++-
 1 file changed, 14 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/ingenic/ingenic-drm-drv.c b/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
index 998c63061fa8..0b2311b32b81 100644
--- a/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
+++ b/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
@@ -643,6 +643,7 @@ static int ingenic_drm_encoder_atomic_check(struct drm_encoder *encoder,
 					    struct drm_connector_state *conn_state)
 {
 	struct drm_display_info *info = &conn_state->connector->display_info;
+	struct drm_display_mode *mode = &crtc_state->adjusted_mode;
 
 	if (info->num_bus_formats != 1)
 		return -EINVAL;
@@ -651,10 +652,22 @@ static int ingenic_drm_encoder_atomic_check(struct drm_encoder *encoder,
 		return 0;
 
 	switch (*info->bus_formats) {
+	case MEDIA_BUS_FMT_RGB888_3X8:
+		/*
+		 * The LCD controller expects timing values in dot-clock ticks,
+		 * which is 3x the timing values in pixels when using a 3x8-bit
+		 * display; but it will count the display area size in pixels
+		 * either way. Go figure.
+		 */
+		mode->crtc_clock = mode->clock * 3;
+		mode->crtc_hsync_start = mode->hsync_start * 3 - mode->hdisplay * 2;
+		mode->crtc_hsync_end = mode->hsync_end * 3 - mode->hdisplay * 2;
+		mode->crtc_hdisplay = mode->hdisplay;
+		mode->crtc_htotal = mode->htotal * 3 - mode->hdisplay * 2;
+		return 0;
 	case MEDIA_BUS_FMT_RGB565_1X16:
 	case MEDIA_BUS_FMT_RGB666_1X18:
 	case MEDIA_BUS_FMT_RGB888_1X24:
-	case MEDIA_BUS_FMT_RGB888_3X8:
 		return 0;
 	default:
 		return -EINVAL;
-- 
2.29.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
