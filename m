Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A277122F63
	for <lists+dri-devel@lfdr.de>; Tue, 17 Dec 2019 15:53:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC4736EA12;
	Tue, 17 Dec 2019 14:53:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 37BEA6EA19
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Dec 2019 14:52:49 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: andrzej.p) with ESMTPSA id 8DCF329289D
From: Andrzej Pietrasiewicz <andrzej.p@collabora.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCHv5 26/34] drm/komeda: Factor in the invocation of special
 helper, afbc case
Date: Tue, 17 Dec 2019 15:50:12 +0100
Message-Id: <20191217145020.14645-27-andrzej.p@collabora.com>
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

Prepare for unification with non-afbc case.

Signed-off-by: Andrzej Pietrasiewicz <andrzej.p@collabora.com>
---
 .../arm/display/komeda/komeda_framebuffer.c   | 84 ++++++++-----------
 1 file changed, 37 insertions(+), 47 deletions(-)

diff --git a/drivers/gpu/drm/arm/display/komeda/komeda_framebuffer.c b/drivers/gpu/drm/arm/display/komeda/komeda_framebuffer.c
index 2c9691b86cff..7e02a04cdd11 100644
--- a/drivers/gpu/drm/arm/display/komeda/komeda_framebuffer.c
+++ b/drivers/gpu/drm/arm/display/komeda/komeda_framebuffer.c
@@ -36,51 +36,6 @@ static const struct drm_framebuffer_funcs komeda_fb_funcs = {
 	.create_handle	= komeda_fb_create_handle,
 };
 
-static int
-komeda_fb_afbc_size_check(struct drm_device *dev,
-			  struct komeda_fb *kfb,
-			  const struct drm_format_info *info,
-			  struct drm_gem_object **objs,
-			  struct drm_file *file,
-			  const struct drm_mode_fb_cmd2 *mode_cmd)
-{
-	struct drm_size_check check = { 0 };
-	u32 alignment_w = 0, alignment_h = 0, alignment_header, n_blocks, bpp;
-
-	if (!drm_afbc_get_superblock_wh(mode_cmd->modifier[0], &alignment_w, &alignment_h))
-		return -EINVAL;
-
-	/* tiled header afbc */
-	if (mode_cmd->modifier[0] & AFBC_FORMAT_MOD_TILED) {
-		alignment_w *= AFBC_TH_LAYOUT_ALIGNMENT;
-		alignment_h *= AFBC_TH_LAYOUT_ALIGNMENT;
-		alignment_header = AFBC_TH_BODY_START_ALIGNMENT;
-	} else {
-		alignment_header = AFBC_BODY_START_ALIGNMENT;
-	}
-
-	kfb->aligned_w = ALIGN(mode_cmd->width, alignment_w);
-	kfb->aligned_h = ALIGN(mode_cmd->height, alignment_h);
-
-	if (mode_cmd->offsets[0] % alignment_header) {
-		DRM_DEBUG_KMS("afbc offset alignment check failed.\n");
-		return -EINVAL;
-	}
-
-	n_blocks = (kfb->aligned_w * kfb->aligned_h) / AFBC_SUPERBLK_PIXELS;
-	kfb->offset_payload = ALIGN(n_blocks * AFBC_HEADER_SIZE,
-				    alignment_header);
-
-	bpp = komeda_get_afbc_format_bpp(info, mode_cmd->modifier[0]);
-	kfb->afbc_size = kfb->offset_payload + n_blocks *
-			 ALIGN(bpp * AFBC_SUPERBLK_PIXELS / 8,
-			       AFBC_SUPERBLK_ALIGNMENT);
-	check.min_size[0] = kfb->afbc_size + mode_cmd->offsets[0];
-	check.use_min_size = true;
-
-	return drm_gem_fb_size_check2(dev, mode_cmd, &check, objs);
-}
-
 struct drm_framebuffer *
 komeda_fb_create(struct drm_device *dev, struct drm_file *file,
 		 const struct drm_mode_fb_cmd2 *mode_cmd)
@@ -113,14 +68,49 @@ komeda_fb_create(struct drm_device *dev, struct drm_file *file,
 	info = drm_get_format_info(dev, mode_cmd);
 
 	if (mode_cmd->modifier[0]) {
+		struct drm_size_check check = { 0 };
+		u32 alignment_w = 0, alignment_h = 0;
+		u32 alignment_header, n_blocks, bpp;
+
 		if (num_planes != 1) {
 			DRM_DEBUG_KMS("AFBC requires exactly 1 plane.\n");
 			ret = -EINVAL;
 			goto err_cleanup;
 		}
 
-		ret = komeda_fb_afbc_size_check(dev, kfb, info, objs,
-						file, mode_cmd);
+		if (!drm_afbc_get_superblock_wh(mode_cmd->modifier[0], &alignment_w, &alignment_h)) {
+			ret = -EINVAL;
+			goto err_cleanup;
+		}
+
+		/* tiled header afbc */
+		if (mode_cmd->modifier[0] & AFBC_FORMAT_MOD_TILED) {
+			alignment_w *= AFBC_TH_LAYOUT_ALIGNMENT;
+			alignment_h *= AFBC_TH_LAYOUT_ALIGNMENT;
+			alignment_header = AFBC_TH_BODY_START_ALIGNMENT;
+		} else {
+			alignment_header = AFBC_BODY_START_ALIGNMENT;
+		}
+
+		kfb->aligned_w = ALIGN(mode_cmd->width, alignment_w);
+		kfb->aligned_h = ALIGN(mode_cmd->height, alignment_h);
+
+		if (mode_cmd->offsets[0] % alignment_header) {
+			DRM_DEBUG_KMS("afbc offset alignment check failed.\n");
+			ret = -EINVAL;
+			goto err_cleanup;
+		}
+
+		n_blocks = (kfb->aligned_w * kfb->aligned_h) / AFBC_SUPERBLK_PIXELS;
+		kfb->offset_payload = ALIGN(n_blocks * AFBC_HEADER_SIZE, alignment_header);
+
+		bpp = komeda_get_afbc_format_bpp(info, mode_cmd->modifier[0]);
+		kfb->afbc_size = kfb->offset_payload
+			       + n_blocks * ALIGN(bpp * AFBC_SUPERBLK_PIXELS / 8, AFBC_SUPERBLK_ALIGNMENT);
+		check.min_size[0] = kfb->afbc_size + mode_cmd->offsets[0];
+		check.use_min_size = true;
+
+		ret = drm_gem_fb_size_check2(dev, mode_cmd, &check, objs);
 	} else {
 		struct drm_size_check check = { 0 };
 
-- 
2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
