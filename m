Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 764834DE02F
	for <lists+dri-devel@lfdr.de>; Fri, 18 Mar 2022 18:43:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CEE3B10E1F5;
	Fri, 18 Mar 2022 17:43:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from letterbox.kde.org (letterbox.kde.org [46.43.1.242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8101D10E1F5
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Mar 2022 17:43:51 +0000 (UTC)
Received: from vertex.localdomain (pool-108-36-85-85.phlapa.fios.verizon.net
 [108.36.85.85]) (Authenticated sender: zack)
 by letterbox.kde.org (Postfix) with ESMTPSA id E615F289344;
 Fri, 18 Mar 2022 17:43:49 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kde.org; s=users;
 t=1647625430; bh=Pj299ta2wmflvfPvlfu5pBREL/RIxWWbmri8BQnX19c=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=A5GmOnALZTF86Em65+PNelq0BdxBKTX4h2Dqbs1cNQSBV9xr7veSdgwsOXS4YYBCU
 5Jh6usmL8OHmqQ2XwxJeLWL9cT7WLR4v9Q7f3UREwcYftPbTvfHzXqZ7v5yBjqasQx
 DHX7NrGC2PLXJL994btbk3OgKGFeQeD7vPRuRhdPD6O7S0YyWSkrCBpq3N9m8mn96z
 e4GUDdFjesZc1F6i90Bfkl8E/kOu8w8VWXVa5fCSKttLsGLH8GuGmOl/i+CpHvC5rq
 Z2hDQsQbkovaaGh/A7yVNXAS2wFWuo5sW2mXc6WsDB6Affef1eABEHxn1pW1JKRTKN
 b2rM0cIqEGgjg==
From: Zack Rusin <zack@kde.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 3/5] drm/vmwgfx: validate the screen formats
Date: Fri, 18 Mar 2022 13:43:30 -0400
Message-Id: <20220318174332.440068-4-zack@kde.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220318174332.440068-1-zack@kde.org>
References: <20220318174332.440068-1-zack@kde.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Reply-To: Zack Rusin <zackr@vmware.com>
Cc: krastevm@vmware.com, mombasawalam@vmware.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Zack Rusin <zackr@vmware.com>

The kms code wasn't validating the modifiers and was letting through
unsupported formats. rgb8 was never properly supported and has no
matching svga screen target format so remove it.
This fixes format/modifier failures in kms_addfb_basic from IGT.

Signed-off-by: Zack Rusin <zackr@vmware.com>
Reviewed-by: Martin Krastev <krastevm@vmware.com>
---
 drivers/gpu/drm/vmwgfx/vmwgfx_kms.c | 30 +++++++++++++++--------------
 drivers/gpu/drm/vmwgfx/vmwgfx_kms.h |  1 -
 2 files changed, 16 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_kms.c b/drivers/gpu/drm/vmwgfx/vmwgfx_kms.c
index 7a23f252d212..693028c31b6b 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_kms.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_kms.c
@@ -1171,6 +1171,15 @@ static int vmw_kms_new_framebuffer_surface(struct vmw_private *dev_priv,
 	 * Sanity checks.
 	 */
 
+	if (!drm_any_plane_has_format(&dev_priv->drm,
+				      mode_cmd->pixel_format,
+				      mode_cmd->modifier[0])) {
+		drm_dbg(&dev_priv->drm,
+			"unsupported pixel format %p4cc / modifier 0x%llx\n",
+			&mode_cmd->pixel_format, mode_cmd->modifier[0]);
+		return -EINVAL;
+	}
+
 	/* Surface must be marked as a scanout. */
 	if (unlikely(!surface->metadata.scanout))
 		return -EINVAL;
@@ -1493,20 +1502,13 @@ static int vmw_kms_new_framebuffer_bo(struct vmw_private *dev_priv,
 		return -EINVAL;
 	}
 
-	/* Limited framebuffer color depth support for screen objects */
-	if (dev_priv->active_display_unit == vmw_du_screen_object) {
-		switch (mode_cmd->pixel_format) {
-		case DRM_FORMAT_XRGB8888:
-		case DRM_FORMAT_ARGB8888:
-			break;
-		case DRM_FORMAT_XRGB1555:
-		case DRM_FORMAT_RGB565:
-			break;
-		default:
-			DRM_ERROR("Invalid pixel format: %p4cc\n",
-				  &mode_cmd->pixel_format);
-			return -EINVAL;
-		}
+	if (!drm_any_plane_has_format(&dev_priv->drm,
+				      mode_cmd->pixel_format,
+				      mode_cmd->modifier[0])) {
+		drm_dbg(&dev_priv->drm,
+			"unsupported pixel format %p4cc / modifier 0x%llx\n",
+			&mode_cmd->pixel_format, mode_cmd->modifier[0]);
+		return -EINVAL;
 	}
 
 	vfbd = kzalloc(sizeof(*vfbd), GFP_KERNEL);
diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_kms.h b/drivers/gpu/drm/vmwgfx/vmwgfx_kms.h
index c95be95deb8d..1d1c8b82c898 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_kms.h
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_kms.h
@@ -247,7 +247,6 @@ struct vmw_framebuffer_bo {
 static const uint32_t __maybe_unused vmw_primary_plane_formats[] = {
 	DRM_FORMAT_XRGB1555,
 	DRM_FORMAT_RGB565,
-	DRM_FORMAT_RGB888,
 	DRM_FORMAT_XRGB8888,
 	DRM_FORMAT_ARGB8888,
 };
-- 
2.32.0

