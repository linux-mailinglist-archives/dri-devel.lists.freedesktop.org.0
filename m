Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 14D55122F61
	for <lists+dri-devel@lfdr.de>; Tue, 17 Dec 2019 15:53:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D0BB06EA19;
	Tue, 17 Dec 2019 14:52:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 99DAF6EA0B
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Dec 2019 14:52:48 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: andrzej.p) with ESMTPSA id BC4022927D0
From: Andrzej Pietrasiewicz <andrzej.p@collabora.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCHv5 25/34] drm/komeda: Use special helper for afbc case size
 check
Date: Tue, 17 Dec 2019 15:50:11 +0100
Message-Id: <20191217145020.14645-26-andrzej.p@collabora.com>
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

Use generic helper code.

Signed-off-by: Andrzej Pietrasiewicz <andrzej.p@collabora.com>
---
 .../arm/display/komeda/komeda_framebuffer.c   | 22 +++++++------------
 1 file changed, 8 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/arm/display/komeda/komeda_framebuffer.c b/drivers/gpu/drm/arm/display/komeda/komeda_framebuffer.c
index 766b6944c53c..2c9691b86cff 100644
--- a/drivers/gpu/drm/arm/display/komeda/komeda_framebuffer.c
+++ b/drivers/gpu/drm/arm/display/komeda/komeda_framebuffer.c
@@ -37,17 +37,15 @@ static const struct drm_framebuffer_funcs komeda_fb_funcs = {
 };
 
 static int
-komeda_fb_afbc_size_check(struct komeda_fb *kfb,
+komeda_fb_afbc_size_check(struct drm_device *dev,
+			  struct komeda_fb *kfb,
 			  const struct drm_format_info *info,
 			  struct drm_gem_object **objs,
 			  struct drm_file *file,
 			  const struct drm_mode_fb_cmd2 *mode_cmd)
 {
-	struct drm_gem_object *obj;
+	struct drm_size_check check = { 0 };
 	u32 alignment_w = 0, alignment_h = 0, alignment_header, n_blocks, bpp;
-	u64 min_size;
-
-	obj = objs[0];
 
 	if (!drm_afbc_get_superblock_wh(mode_cmd->modifier[0], &alignment_w, &alignment_h))
 		return -EINVAL;
@@ -77,14 +75,10 @@ komeda_fb_afbc_size_check(struct komeda_fb *kfb,
 	kfb->afbc_size = kfb->offset_payload + n_blocks *
 			 ALIGN(bpp * AFBC_SUPERBLK_PIXELS / 8,
 			       AFBC_SUPERBLK_ALIGNMENT);
-	min_size = kfb->afbc_size + mode_cmd->offsets[0];
-	if (min_size > obj->size) {
-		DRM_DEBUG_KMS("afbc size check failed, obj_size: 0x%zx. min_size 0x%llx.\n",
-			      obj->size, min_size);
-		return -EINVAL;
-	}
+	check.min_size[0] = kfb->afbc_size + mode_cmd->offsets[0];
+	check.use_min_size = true;
 
-	return 0;
+	return drm_gem_fb_size_check2(dev, mode_cmd, &check, objs);
 }
 
 struct drm_framebuffer *
@@ -125,8 +119,8 @@ komeda_fb_create(struct drm_device *dev, struct drm_file *file,
 			goto err_cleanup;
 		}
 
-		ret = komeda_fb_afbc_size_check(kfb, info, objs, file,
-						mode_cmd);
+		ret = komeda_fb_afbc_size_check(dev, kfb, info, objs,
+						file, mode_cmd);
 	} else {
 		struct drm_size_check check = { 0 };
 
-- 
2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
