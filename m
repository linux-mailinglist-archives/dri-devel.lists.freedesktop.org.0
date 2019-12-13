Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A68711E744
	for <lists+dri-devel@lfdr.de>; Fri, 13 Dec 2019 16:59:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F0E66EA75;
	Fri, 13 Dec 2019 15:59:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4415D6EA30
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Dec 2019 15:59:28 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: andrzej.p) with ESMTPSA id 54CE7292D59
From: Andrzej Pietrasiewicz <andrzej.p@collabora.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCHv4 16/36] drm/komeda: Factor out object lookups for afbc case
Date: Fri, 13 Dec 2019 16:58:47 +0100
Message-Id: <20191213155907.16581-17-andrzej.p@collabora.com>
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

Ultimately we want lookups happening only once in komeda's fb_create
implementation.

Signed-off-by: Andrzej Pietrasiewicz <andrzej.p@collabora.com>
---
 .../arm/display/komeda/komeda_framebuffer.c   | 30 +++++++++++--------
 1 file changed, 17 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/arm/display/komeda/komeda_framebuffer.c b/drivers/gpu/drm/arm/display/komeda/komeda_framebuffer.c
index 07520cec6fbd..4e29fa5bd342 100644
--- a/drivers/gpu/drm/arm/display/komeda/komeda_framebuffer.c
+++ b/drivers/gpu/drm/arm/display/komeda/komeda_framebuffer.c
@@ -39,6 +39,7 @@ static const struct drm_framebuffer_funcs komeda_fb_funcs = {
 static int
 komeda_fb_afbc_size_check(struct komeda_fb *kfb,
 			  const struct drm_format_info *info,
+			  struct drm_gem_object **objs,
 			  struct drm_file *file,
 			  const struct drm_mode_fb_cmd2 *mode_cmd)
 {
@@ -47,11 +48,7 @@ komeda_fb_afbc_size_check(struct komeda_fb *kfb,
 	u32 alignment_w = 0, alignment_h = 0, alignment_header, n_blocks, bpp;
 	u64 min_size;
 
-	obj = drm_gem_object_lookup(file, mode_cmd->handles[0]);
-	if (!obj) {
-		DRM_DEBUG_KMS("Failed to lookup GEM object\n");
-		return -ENOENT;
-	}
+	obj = objs[0];
 
 	if (!drm_afbc_get_superblock_wh(fb->modifier,
 					&alignment_w, &alignment_h))
@@ -71,7 +68,7 @@ komeda_fb_afbc_size_check(struct komeda_fb *kfb,
 
 	if (fb->offsets[0] % alignment_header) {
 		DRM_DEBUG_KMS("afbc offset alignment check failed.\n");
-		goto check_failed;
+		return -EINVAL;
 	}
 
 	n_blocks = (kfb->aligned_w * kfb->aligned_h) / AFBC_SUPERBLK_PIXELS;
@@ -86,15 +83,10 @@ komeda_fb_afbc_size_check(struct komeda_fb *kfb,
 	if (min_size > obj->size) {
 		DRM_DEBUG_KMS("afbc size check failed, obj_size: 0x%zx. min_size 0x%llx.\n",
 			      obj->size, min_size);
-		goto check_failed;
+		return -EINVAL;
 	}
 
-	fb->obj[0] = obj;
 	return 0;
-
-check_failed:
-	drm_gem_object_put_unlocked(obj);
-	return -EINVAL;
 }
 
 static int
@@ -163,12 +155,24 @@ komeda_fb_create(struct drm_device *dev, struct drm_file *file,
 	info = kfb->base.format;
 
 	if (kfb->base.modifier) {
+		struct drm_gem_object *objs[4];
+
 		if (info->num_planes != 1) {
 			DRM_DEBUG_KMS("AFBC requires exactly 1 plane.\n");
 			kfree(kfb);
 			return ERR_PTR(-EINVAL);
 		}
-		ret = komeda_fb_afbc_size_check(kfb, info, file, mode_cmd);
+
+		ret = drm_gem_fb_lookup(dev, file, mode_cmd, objs);
+		if (ret < 0) {
+			kfree(kfb);
+			return ERR_PTR(ret);
+		}
+
+		ret = komeda_fb_afbc_size_check(kfb, info, objs, file,
+						mode_cmd);
+		for (i = 0; i < info->num_planes; ++i)
+			kfb->base.obj[i] = objs[i];
 	} else {
 		struct drm_gem_object *objs[4];
 
-- 
2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
