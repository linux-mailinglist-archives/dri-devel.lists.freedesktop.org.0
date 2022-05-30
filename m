Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 381EB537B62
	for <lists+dri-devel@lfdr.de>; Mon, 30 May 2022 15:24:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D09BD10E7E9;
	Mon, 30 May 2022 13:24:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E755910E6E3
 for <dri-devel@lists.freedesktop.org>; Mon, 30 May 2022 13:24:38 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 60C85B80AE8;
 Mon, 30 May 2022 13:24:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 45D14C3411C;
 Mon, 30 May 2022 13:24:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1653917076;
 bh=s3qNkoIYVWMpejiHT67UNIh/odgE/06E//y1wED6l1c=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=oEi3QpzvTN0D3kbvTJCtNVR5N/xh+pJrO9HVq0Dxr4lfkiNEj8MF8dw2KfZbifTnB
 1dRyYoWzL0cTDQew6wtgd/kfYUfeomvVC4rp7p6rfhdQ/yHq7+ePB3GRO4vU8c6SlH
 KkqYPVp4Psumwb4J7C9nKVdtiGFE3jmotgOxB2RAq9rjxnDCI3w+g9SG5m+gsceZKJ
 c8h2MBW3q/kC6JMdn+RdyuxJ1CMFWhFusZCitJ4iqoDotTEGmbc4shpYRJBFPnP/8Q
 2PLRYxiAmMTh7LSgrDMaP6UpxRuHKodiTMbHBoViehXOJbQ7XnAEygbApSqbU8yG5g
 gcyOCTl+/e4Zg==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.18 003/159] drm/vmwgfx: validate the screen formats
Date: Mon, 30 May 2022 09:21:48 -0400
Message-Id: <20220530132425.1929512-3-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220530132425.1929512-1-sashal@kernel.org>
References: <20220530132425.1929512-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
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
Cc: Sasha Levin <sashal@kernel.org>, airlied@linux.ie,
 dri-devel@lists.freedesktop.org, Martin Krastev <krastevm@vmware.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Zack Rusin <zackr@vmware.com>

[ Upstream commit 8bb75aeb58bd688d70827ae179bd3da57b6d975b ]

The kms code wasn't validating the modifiers and was letting through
unsupported formats. rgb8 was never properly supported and has no
matching svga screen target format so remove it.
This fixes format/modifier failures in kms_addfb_basic from IGT.

Signed-off-by: Zack Rusin <zackr@vmware.com>
Reviewed-by: Martin Krastev <krastevm@vmware.com>
Link: https://patchwork.freedesktop.org/patch/msgid/20220318174332.440068-4-zack@kde.org
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/vmwgfx/vmwgfx_kms.c | 30 +++++++++++++++--------------
 drivers/gpu/drm/vmwgfx/vmwgfx_kms.h |  1 -
 2 files changed, 16 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_kms.c b/drivers/gpu/drm/vmwgfx/vmwgfx_kms.c
index 93431e8f6606..9410152f9d6f 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_kms.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_kms.c
@@ -914,6 +914,15 @@ static int vmw_kms_new_framebuffer_surface(struct vmw_private *dev_priv,
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
@@ -1236,20 +1245,13 @@ static int vmw_kms_new_framebuffer_bo(struct vmw_private *dev_priv,
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
index 4d36e8507380..d9ebd02099a6 100644
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
2.35.1

