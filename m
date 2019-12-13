Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 26DDC11E756
	for <lists+dri-devel@lfdr.de>; Fri, 13 Dec 2019 17:00:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E04596EA82;
	Fri, 13 Dec 2019 15:59:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E8DFC6EA30
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Dec 2019 15:59:29 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: andrzej.p) with ESMTPSA id 601AB292D6A
From: Andrzej Pietrasiewicz <andrzej.p@collabora.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCHv4 19/36] drm/komeda: Move object lookup before size checks
Date: Fri, 13 Dec 2019 16:58:50 +0100
Message-Id: <20191213155907.16581-20-andrzej.p@collabora.com>
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

The lookup is performed the same way in both branches of the "if"
statement, so move the lookup to before the "if". err_cleanup case
is adjusted accordingly.

Signed-off-by: Andrzej Pietrasiewicz <andrzej.p@collabora.com>
---
 .../arm/display/komeda/komeda_framebuffer.c   | 23 +++++++------------
 1 file changed, 8 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/arm/display/komeda/komeda_framebuffer.c b/drivers/gpu/drm/arm/display/komeda/komeda_framebuffer.c
index 6325b20e661d..b923e2b6c523 100644
--- a/drivers/gpu/drm/arm/display/komeda/komeda_framebuffer.c
+++ b/drivers/gpu/drm/arm/display/komeda/komeda_framebuffer.c
@@ -132,6 +132,7 @@ komeda_fb_create(struct drm_device *dev, struct drm_file *file,
 		 const struct drm_mode_fb_cmd2 *mode_cmd)
 {
 	struct komeda_dev *mdev = dev->dev_private;
+	struct drm_gem_object *objs[4];
 	struct komeda_fb *kfb;
 	const struct drm_format_info *info;
 	int ret = 0, i;
@@ -150,37 +151,29 @@ komeda_fb_create(struct drm_device *dev, struct drm_file *file,
 		goto err_free;
 	}
 
+	ret = drm_gem_fb_lookup(dev, file, mode_cmd, objs);
+	if (ret < 0)
+		goto err_free;
+
 	drm_helper_mode_fill_fb_struct(dev, &kfb->base, mode_cmd);
 	info = kfb->base.format;
 
 	if (kfb->base.modifier) {
-		struct drm_gem_object *objs[4];
-
 		if (info->num_planes != 1) {
 			DRM_DEBUG_KMS("AFBC requires exactly 1 plane.\n");
 			ret = -EINVAL;
-			goto err_free;
+			goto err_cleanup;
 		}
 
-		ret = drm_gem_fb_lookup(dev, file, mode_cmd, objs);
-		if (ret < 0)
-			goto err_free;
-
 		ret = komeda_fb_afbc_size_check(kfb, info, objs, file,
 						mode_cmd);
 		for (i = 0; i < info->num_planes; ++i)
 			kfb->base.obj[i] = objs[i];
 	} else {
-		struct drm_gem_object *objs[4];
-
 		ret = komeda_fb_check_src_coords(kfb, 0, 0, kfb->base.width,
 						 kfb->base.height);
 		if (ret)
-			goto err_free;
-
-		ret = drm_gem_fb_lookup(dev, file, mode_cmd, objs);
-		if (ret < 0)
-			goto err_free;
+			goto err_cleanup;
 
 		ret = komeda_fb_none_afbc_size_check(mdev, info, objs,
 						     file, mode_cmd);
@@ -210,7 +203,7 @@ komeda_fb_create(struct drm_device *dev, struct drm_file *file,
 
 err_cleanup:
 	for (i = 0; i < kfb->base.format->num_planes; i++)
-		drm_gem_object_put_unlocked(kfb->base.obj[i]);
+		drm_gem_object_put_unlocked(objs[i]);
 err_free:
 	kfree(kfb);
 	return ERR_PTR(ret);
-- 
2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
