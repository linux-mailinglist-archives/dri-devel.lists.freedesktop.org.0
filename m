Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AA0CA122F59
	for <lists+dri-devel@lfdr.de>; Tue, 17 Dec 2019 15:53:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B6856EA10;
	Tue, 17 Dec 2019 14:52:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B64896EA05
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Dec 2019 14:52:36 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: andrzej.p) with ESMTPSA id 98D892927C9
From: Andrzej Pietrasiewicz <andrzej.p@collabora.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCHv5 16/34] drm/komeda: Simplify error handling
Date: Tue, 17 Dec 2019 15:50:02 +0100
Message-Id: <20191217145020.14645-17-andrzej.p@collabora.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191217145020.14645-1-andrzej.p@collabora.com>
References: <20191213173350.GJ624164@phenom.ffwll.local>
 <20191217145020.14645-1-andrzej.p@collabora.com>
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

Use less code to handle errors.

Signed-off-by: Andrzej Pietrasiewicz <andrzej.p@collabora.com>
---
 .../arm/display/komeda/komeda_framebuffer.c   | 32 ++++++++-----------
 1 file changed, 14 insertions(+), 18 deletions(-)

diff --git a/drivers/gpu/drm/arm/display/komeda/komeda_framebuffer.c b/drivers/gpu/drm/arm/display/komeda/komeda_framebuffer.c
index aa703aabbeee..f50f83c68c70 100644
--- a/drivers/gpu/drm/arm/display/komeda/komeda_framebuffer.c
+++ b/drivers/gpu/drm/arm/display/komeda/komeda_framebuffer.c
@@ -145,8 +145,8 @@ komeda_fb_create(struct drm_device *dev, struct drm_file *file,
 	if (!kfb->format_caps) {
 		DRM_DEBUG_KMS("FMT %x is not supported.\n",
 			      mode_cmd->pixel_format);
-		kfree(kfb);
-		return ERR_PTR(-EINVAL);
+		ret = -EINVAL;
+		goto err_free;
 	}
 
 	drm_helper_mode_fill_fb_struct(dev, &kfb->base, mode_cmd);
@@ -157,15 +157,13 @@ komeda_fb_create(struct drm_device *dev, struct drm_file *file,
 
 		if (info->num_planes != 1) {
 			DRM_DEBUG_KMS("AFBC requires exactly 1 plane.\n");
-			kfree(kfb);
-			return ERR_PTR(-EINVAL);
+			ret = -EINVAL;
+			goto err_free;
 		}
 
 		ret = drm_gem_fb_lookup(dev, file, mode_cmd, objs);
-		if (ret < 0) {
-			kfree(kfb);
-			return ERR_PTR(ret);
-		}
+		if (ret < 0)
+			goto err_free;
 
 		ret = komeda_fb_afbc_size_check(kfb, info, objs, file,
 						mode_cmd);
@@ -174,16 +172,14 @@ komeda_fb_create(struct drm_device *dev, struct drm_file *file,
 	} else {
 		struct drm_gem_object *objs[4];
 
-		if (komeda_fb_check_src_coords(kfb, 0, 0, kfb->base.width,
-					       kfb->base.height)) {
-			kfree(kfb);
-			return ERR_PTR(-EINVAL);
-		}
+		ret = komeda_fb_check_src_coords(kfb, 0, 0, kfb->base.width,
+						 kfb->base.height);
+		if (ret)
+			goto err_free;
+
 		ret = drm_gem_fb_lookup(dev, file, mode_cmd, objs);
-		if (ret < 0) {
-			kfree(kfb);
-			return ERR_PTR(ret);
-		}
+		if (ret < 0)
+			goto err_free;
 
 		ret = komeda_fb_none_afbc_size_check(mdev, info, objs,
 						     file, mode_cmd);
@@ -214,7 +210,7 @@ komeda_fb_create(struct drm_device *dev, struct drm_file *file,
 err_cleanup:
 	for (i = 0; i < kfb->base.format->num_planes; i++)
 		drm_gem_object_put_unlocked(kfb->base.obj[i]);
-
+err_free:
 	kfree(kfb);
 	return ERR_PTR(ret);
 }
-- 
2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
