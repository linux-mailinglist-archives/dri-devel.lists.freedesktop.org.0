Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 50B7D11E75D
	for <lists+dri-devel@lfdr.de>; Fri, 13 Dec 2019 17:00:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2015D6EA99;
	Fri, 13 Dec 2019 16:00:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F11AC6EA73
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Dec 2019 15:59:33 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: andrzej.p) with ESMTPSA id 60FBA292D87
From: Andrzej Pietrasiewicz <andrzej.p@collabora.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCHv4 25/36] drm/komeda: Use special helper for non-afbc size
 checks
Date: Fri, 13 Dec 2019 16:58:56 +0100
Message-Id: <20191213155907.16581-26-andrzej.p@collabora.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191213155907.16581-1-andrzej.p@collabora.com>
References: <20191213155907.16581-1-andrzej.p@collabora.com>
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
Cc: Ayan Halder <Ayan.Halder@arm.com>, kernel@collabora.com,
 David Airlie <airlied@linux.ie>, Liviu Dudau <liviu.dudau@arm.com>,
 Sandy Huang <hjc@rock-chips.com>,
 Andrzej Pietrasiewicz <andrzej.p@collabora.com>,
 James Wang <james.qian.wang@arm.com>,
 Mihail Atanassov <mihail.atanassov@arm.com>, Sean Paul <sean@poorly.run>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Use the generic helper code.

Signed-off-by: Andrzej Pietrasiewicz <andrzej.p@collabora.com>
---
 .../arm/display/komeda/komeda_framebuffer.c   | 46 +++++++++----------
 1 file changed, 21 insertions(+), 25 deletions(-)

diff --git a/drivers/gpu/drm/arm/display/komeda/komeda_framebuffer.c b/drivers/gpu/drm/arm/display/komeda/komeda_framebuffer.c
index 6ac4a599ab5d..77186f70bdf3 100644
--- a/drivers/gpu/drm/arm/display/komeda/komeda_framebuffer.c
+++ b/drivers/gpu/drm/arm/display/komeda/komeda_framebuffer.c
@@ -89,42 +89,38 @@ komeda_fb_afbc_size_check(struct komeda_fb *kfb,
 }
 
 static int
-komeda_fb_none_afbc_size_check(struct komeda_dev *mdev,
+komeda_fb_none_afbc_size_check(struct drm_device *dev,
 			       const struct drm_format_info *info,
 			       struct drm_gem_object **objs,
 			       struct drm_file *file,
 			       const struct drm_mode_fb_cmd2 *mode_cmd)
 {
+	struct komeda_dev *mdev = dev->dev_private;
+	struct drm_size_check check = { 0 };
 	struct drm_gem_object *obj;
-	u32 i, block_h;
-	u64 min_size;
+	u32 i;
 
 	for (i = 0; i < info->num_planes; i++) {
 		obj = objs[i];
 
-		block_h = drm_format_info_block_height(info, i);
-		if ((mode_cmd->pitches[i] * block_h) % mdev->chip.bus_width) {
-			DRM_DEBUG_KMS("Pitch[%d]: 0x%x doesn't align to 0x%x\n",
-				      i, mode_cmd->pitches[i],
-				      mdev->chip.bus_width);
-			return -EINVAL;
-		}
-
-		min_size = komeda_fb_get_pixel_addr_nofb(info,
-							 mode_cmd->modifier[0],
-							 mode_cmd->pitches,
-							 mode_cmd->offsets,
-							 obj,
-							 0, mode_cmd->height, i)
-			 - to_drm_gem_cma_obj(obj)->paddr;
-		if (obj->size < min_size) {
-			DRM_DEBUG_KMS("The fb->obj[%d] size: 0x%zx lower than the minimum requirement: 0x%llx.\n",
-				      i, obj->size, min_size);
-			return -EINVAL;
-		}
+		check.pitch_multiplier[i] =
+			drm_format_info_block_height(info, i);
+
+		check.min_size[i] =
+			komeda_fb_get_pixel_addr_nofb(info,
+						      mode_cmd->modifier[0],
+						      mode_cmd->pitches,
+						      mode_cmd->offsets,
+						      obj,
+						      0, mode_cmd->height, i)
+			- to_drm_gem_cma_obj(obj)->paddr;
 	}
 
-	return 0;
+	check.pitch_modulo = mdev->chip.bus_width;
+	check.use_pitch_multiplier = true;
+	check.use_min_size = true;
+
+	return drm_gem_fb_size_check_special(dev, mode_cmd, &check, objs);
 }
 
 struct drm_framebuffer *
@@ -173,7 +169,7 @@ komeda_fb_create(struct drm_device *dev, struct drm_file *file,
 		if (ret)
 			goto err_cleanup;
 
-		ret = komeda_fb_none_afbc_size_check(mdev, info, objs,
+		ret = komeda_fb_none_afbc_size_check(dev, info, objs,
 						     file, mode_cmd);
 	}
 	if (ret < 0)
-- 
2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
