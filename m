Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3779C160CF6
	for <lists+dri-devel@lfdr.de>; Mon, 17 Feb 2020 09:21:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE3646E8C3;
	Mon, 17 Feb 2020 08:20:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from crapouillou.net (outils.crapouillou.net [89.234.176.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0577489996
 for <dri-devel@lists.freedesktop.org>; Sun, 16 Feb 2020 15:58:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
 s=mail; t=1581868710; h=from:from:sender:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-transfer-encoding:content-transfer-encoding:
 in-reply-to:references; bh=2zq/wwIxPTj/fKmDjIa6URfrDJL7kUowjKmyTJvEAZM=;
 b=tUeA1wGJAoaGDx/wPduGvxu9AvFh6kk8l5/E2DBUvxCagu9aLiYn7V4w4Yftkl4XMpBfXc
 MI3bOAfWMlxIeV0NLH4o+djng3P5+9j9aa0LaOslJ72b6RsKojtO4TqD6IrcnCciRWXYSy
 pLIe+MyXm4OmkmEORcRnKA/w+3XUdXk=
From: Paul Cercueil <paul@crapouillou.net>
To: David Airlie <airlied@linux.ie>,
	Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH 1/3] gpu/drm: ingenic: Add trick to support 16bpp on 24-bit
 panels
Date: Sun, 16 Feb 2020 12:58:09 -0300
Message-Id: <20200216155811.68463-1-paul@crapouillou.net>
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 17 Feb 2020 08:20:47 +0000
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
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

If the panel interface is 24-bit but our primary plane is 16bpp,
configure as if the panel was 18-bit. This tricks permits the display
of 16bpp data on a 24-bit panel by wiring each color component to the
MSBs of the 24-bit interface.

Signed-off-by: Paul Cercueil <paul@crapouillou.net>
---
 drivers/gpu/drm/ingenic/ingenic-drm.c | 19 ++++++++++++++++++-
 1 file changed, 18 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/ingenic/ingenic-drm.c b/drivers/gpu/drm/ingenic/ingenic-drm.c
index 6d47ef7b148c..034961a40e98 100644
--- a/drivers/gpu/drm/ingenic/ingenic-drm.c
+++ b/drivers/gpu/drm/ingenic/ingenic-drm.c
@@ -400,6 +400,8 @@ static void ingenic_drm_encoder_atomic_mode_set(struct drm_encoder *encoder,
 	struct drm_display_mode *mode = &crtc_state->adjusted_mode;
 	struct drm_connector *conn = conn_state->connector;
 	struct drm_display_info *info = &conn->display_info;
+	struct drm_plane_state *plane_state = crtc_state->crtc->primary->state;
+	const struct drm_format_info *finfo = NULL;
 	unsigned int cfg;
 
 	priv->panel_is_sharp = info->bus_flags & DRM_BUS_FLAG_SHARP_SIGNALS;
@@ -435,7 +437,22 @@ static void ingenic_drm_encoder_atomic_mode_set(struct drm_encoder *encoder,
 				cfg |= JZ_LCD_CFG_MODE_GENERIC_18BIT;
 				break;
 			case MEDIA_BUS_FMT_RGB888_1X24:
-				cfg |= JZ_LCD_CFG_MODE_GENERIC_24BIT;
+				if (plane_state && plane_state->fb)
+					finfo = plane_state->fb->format;
+
+				/*
+				 * If the panel interface is 24-bit but our
+				 * primary plane is 16bpp, configure as if the
+				 * panel was 18-bit. This tricks permits the
+				 * display of 16bpp data on a 24-bit panel by
+				 * wiring each color component to the MSBs of
+				 * the 24-bit interface.
+				 */
+				if (finfo &&
+				    finfo->format != DRM_FORMAT_XRGB8888)
+					cfg |= JZ_LCD_CFG_MODE_GENERIC_18BIT;
+				else
+					cfg |= JZ_LCD_CFG_MODE_GENERIC_24BIT;
 				break;
 			case MEDIA_BUS_FMT_RGB888_3X8:
 				cfg |= JZ_LCD_CFG_MODE_8BIT_SERIAL;
-- 
2.25.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
