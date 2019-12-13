Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A2AA511E74A
	for <lists+dri-devel@lfdr.de>; Fri, 13 Dec 2019 16:59:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A1156EA7D;
	Fri, 13 Dec 2019 15:59:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B17F86EA77
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Dec 2019 15:59:34 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: andrzej.p) with ESMTPSA id 06A59292CF2
From: Andrzej Pietrasiewicz <andrzej.p@collabora.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCHv4 26/36] drm/komeda: Factor in the invocation of special helper
Date: Fri, 13 Dec 2019 16:58:57 +0100
Message-Id: <20191213155907.16581-27-andrzej.p@collabora.com>
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

Don't use a separate function to call the helper. The ultimate goal is
to unify non-afbc and afbc cases as much as possible and then moving the
helper invocation outside the if-else clause.

Signed-off-by: Andrzej Pietrasiewicz <andrzej.p@collabora.com>
---
 .../arm/display/komeda/komeda_framebuffer.c   | 58 +++++++------------
 1 file changed, 21 insertions(+), 37 deletions(-)

diff --git a/drivers/gpu/drm/arm/display/komeda/komeda_framebuffer.c b/drivers/gpu/drm/arm/display/komeda/komeda_framebuffer.c
index 77186f70bdf3..6898407d1b63 100644
--- a/drivers/gpu/drm/arm/display/komeda/komeda_framebuffer.c
+++ b/drivers/gpu/drm/arm/display/komeda/komeda_framebuffer.c
@@ -88,41 +88,6 @@ komeda_fb_afbc_size_check(struct komeda_fb *kfb,
 	return 0;
 }
 
-static int
-komeda_fb_none_afbc_size_check(struct drm_device *dev,
-			       const struct drm_format_info *info,
-			       struct drm_gem_object **objs,
-			       struct drm_file *file,
-			       const struct drm_mode_fb_cmd2 *mode_cmd)
-{
-	struct komeda_dev *mdev = dev->dev_private;
-	struct drm_size_check check = { 0 };
-	struct drm_gem_object *obj;
-	u32 i;
-
-	for (i = 0; i < info->num_planes; i++) {
-		obj = objs[i];
-
-		check.pitch_multiplier[i] =
-			drm_format_info_block_height(info, i);
-
-		check.min_size[i] =
-			komeda_fb_get_pixel_addr_nofb(info,
-						      mode_cmd->modifier[0],
-						      mode_cmd->pitches,
-						      mode_cmd->offsets,
-						      obj,
-						      0, mode_cmd->height, i)
-			- to_drm_gem_cma_obj(obj)->paddr;
-	}
-
-	check.pitch_modulo = mdev->chip.bus_width;
-	check.use_pitch_multiplier = true;
-	check.use_min_size = true;
-
-	return drm_gem_fb_size_check_special(dev, mode_cmd, &check, objs);
-}
-
 struct drm_framebuffer *
 komeda_fb_create(struct drm_device *dev, struct drm_file *file,
 		 const struct drm_mode_fb_cmd2 *mode_cmd)
@@ -164,13 +129,32 @@ komeda_fb_create(struct drm_device *dev, struct drm_file *file,
 		ret = komeda_fb_afbc_size_check(kfb, info, objs, file,
 						mode_cmd);
 	} else {
+		struct drm_size_check check = { 0 };
+
 		ret = komeda_fb_check_src_coords(kfb, 0, 0, mode_cmd->width,
 						 mode_cmd->height);
 		if (ret)
 			goto err_cleanup;
 
-		ret = komeda_fb_none_afbc_size_check(dev, info, objs,
-						     file, mode_cmd);
+		for (i = 0; i < num_planes; i++) {
+			check.pitch_multiplier[i] =
+				drm_format_info_block_height(info, i);
+
+			check.min_size[i] =
+				komeda_fb_get_pixel_addr_nofb(info,
+					mode_cmd->modifier[0],
+					mode_cmd->pitches,
+					mode_cmd->offsets, objs[i],
+					0, mode_cmd->height, i)
+				- to_drm_gem_cma_obj(objs[i])->paddr;
+		}
+
+		check.pitch_modulo = mdev->chip.bus_width;
+		check.use_pitch_multiplier = true;
+		check.use_min_size = true;
+
+		ret = drm_gem_fb_size_check_special(dev, mode_cmd, &check,
+						    objs);
 	}
 	if (ret < 0)
 		goto err_cleanup;
-- 
2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
