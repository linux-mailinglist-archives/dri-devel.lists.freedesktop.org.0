Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4051311E74B
	for <lists+dri-devel@lfdr.de>; Fri, 13 Dec 2019 17:00:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 52AC06EA77;
	Fri, 13 Dec 2019 15:59:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A70836E9B2
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Dec 2019 15:59:26 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: andrzej.p) with ESMTPSA id DCEC2292C82
From: Andrzej Pietrasiewicz <andrzej.p@collabora.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCHv4 14/36] drm/komeda: Factor out object lookups for non-afbc
 case
Date: Fri, 13 Dec 2019 16:58:45 +0100
Message-Id: <20191213155907.16581-15-andrzej.p@collabora.com>
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
 .../arm/display/komeda/komeda_framebuffer.c   | 21 ++++++++++++-------
 1 file changed, 13 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/arm/display/komeda/komeda_framebuffer.c b/drivers/gpu/drm/arm/display/komeda/komeda_framebuffer.c
index 00860a66ebf1..d4e0df00180e 100644
--- a/drivers/gpu/drm/arm/display/komeda/komeda_framebuffer.c
+++ b/drivers/gpu/drm/arm/display/komeda/komeda_framebuffer.c
@@ -101,6 +101,7 @@ static int
 komeda_fb_none_afbc_size_check(struct komeda_dev *mdev,
 			       struct komeda_fb *kfb,
 			       const struct drm_format_info *info,
+			       struct drm_gem_object **objs,
 			       struct drm_file *file,
 			       const struct drm_mode_fb_cmd2 *mode_cmd)
 {
@@ -110,12 +111,7 @@ komeda_fb_none_afbc_size_check(struct komeda_dev *mdev,
 	u64 min_size;
 
 	for (i = 0; i < info->num_planes; i++) {
-		obj = drm_gem_object_lookup(file, mode_cmd->handles[i]);
-		if (!obj) {
-			DRM_DEBUG_KMS("Failed to lookup GEM object\n");
-			return -ENOENT;
-		}
-		fb->obj[i] = obj;
+		obj = objs[i];
 
 		block_h = drm_format_info_block_height(info, i);
 		if ((fb->pitches[i] * block_h) % mdev->chip.bus_width) {
@@ -175,14 +171,23 @@ komeda_fb_create(struct drm_device *dev, struct drm_file *file,
 		}
 		ret = komeda_fb_afbc_size_check(kfb, info, file, mode_cmd);
 	} else {
+		struct drm_gem_object *objs[4];
+
 		if (komeda_fb_check_src_coords(kfb, 0, 0, kfb->base.width,
 					       kfb->base.height)) {
 			kfree(kfb);
 			return ERR_PTR(-EINVAL);
 		}
+		ret = drm_gem_fb_lookup(dev, file, mode_cmd, objs);
+		if (ret < 0) {
+			kfree(kfb);
+			return ERR_PTR(ret);
+		}
 
-		ret = komeda_fb_none_afbc_size_check(mdev, kfb, info, file,
-						     mode_cmd);
+		ret = komeda_fb_none_afbc_size_check(mdev, kfb, info, objs,
+						     file, mode_cmd);
+		for (i = 0; i < info->num_planes; ++i)
+			kfb->base.obj[i] = objs[i];
 	}
 	if (ret < 0)
 		goto err_cleanup;
-- 
2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
