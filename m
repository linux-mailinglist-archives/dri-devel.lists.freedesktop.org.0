Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BCD05122F56
	for <lists+dri-devel@lfdr.de>; Tue, 17 Dec 2019 15:52:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C2DC6EA11;
	Tue, 17 Dec 2019 14:52:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D89D6EA02
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Dec 2019 14:52:35 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: andrzej.p) with ESMTPSA id EB0272927CE
From: Andrzej Pietrasiewicz <andrzej.p@collabora.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCHv5 15/34] drm/komeda: Free komeda_fb_afbc_size_check from
 framebuffer dependency
Date: Tue, 17 Dec 2019 15:50:01 +0100
Message-Id: <20191217145020.14645-16-andrzej.p@collabora.com>
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

It does still depend on komeda_fb, but only for komeda-specific parameters.

Signed-off-by: Andrzej Pietrasiewicz <andrzej.p@collabora.com>
---
 .../drm/arm/display/komeda/komeda_framebuffer.c   | 15 +++++++--------
 1 file changed, 7 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/arm/display/komeda/komeda_framebuffer.c b/drivers/gpu/drm/arm/display/komeda/komeda_framebuffer.c
index 6b11a1b21ef6..aa703aabbeee 100644
--- a/drivers/gpu/drm/arm/display/komeda/komeda_framebuffer.c
+++ b/drivers/gpu/drm/arm/display/komeda/komeda_framebuffer.c
@@ -43,18 +43,17 @@ komeda_fb_afbc_size_check(struct komeda_fb *kfb,
 			  struct drm_file *file,
 			  const struct drm_mode_fb_cmd2 *mode_cmd)
 {
-	struct drm_framebuffer *fb = &kfb->base;
 	struct drm_gem_object *obj;
 	u32 alignment_w = 0, alignment_h = 0, alignment_header, n_blocks, bpp;
 	u64 min_size;
 
 	obj = objs[0];
 
-	if (!drm_afbc_get_superblock_wh(fb->modifier, &alignment_w, &alignment_h))
+	if (!drm_afbc_get_superblock_wh(mode_cmd->modifier[0], &alignment_w, &alignment_h))
 		return -EINVAL;
 
 	/* tiled header afbc */
-	if (fb->modifier & AFBC_FORMAT_MOD_TILED) {
+	if (mode_cmd->modifier[0] & AFBC_FORMAT_MOD_TILED) {
 		alignment_w *= AFBC_TH_LAYOUT_ALIGNMENT;
 		alignment_h *= AFBC_TH_LAYOUT_ALIGNMENT;
 		alignment_header = AFBC_TH_BODY_START_ALIGNMENT;
@@ -62,10 +61,10 @@ komeda_fb_afbc_size_check(struct komeda_fb *kfb,
 		alignment_header = AFBC_BODY_START_ALIGNMENT;
 	}
 
-	kfb->aligned_w = ALIGN(fb->width, alignment_w);
-	kfb->aligned_h = ALIGN(fb->height, alignment_h);
+	kfb->aligned_w = ALIGN(mode_cmd->width, alignment_w);
+	kfb->aligned_h = ALIGN(mode_cmd->height, alignment_h);
 
-	if (fb->offsets[0] % alignment_header) {
+	if (mode_cmd->offsets[0] % alignment_header) {
 		DRM_DEBUG_KMS("afbc offset alignment check failed.\n");
 		return -EINVAL;
 	}
@@ -74,11 +73,11 @@ komeda_fb_afbc_size_check(struct komeda_fb *kfb,
 	kfb->offset_payload = ALIGN(n_blocks * AFBC_HEADER_SIZE,
 				    alignment_header);
 
-	bpp = komeda_get_afbc_format_bpp(info, fb->modifier);
+	bpp = komeda_get_afbc_format_bpp(info, mode_cmd->modifier[0]);
 	kfb->afbc_size = kfb->offset_payload + n_blocks *
 			 ALIGN(bpp * AFBC_SUPERBLK_PIXELS / 8,
 			       AFBC_SUPERBLK_ALIGNMENT);
-	min_size = kfb->afbc_size + fb->offsets[0];
+	min_size = kfb->afbc_size + mode_cmd->offsets[0];
 	if (min_size > obj->size) {
 		DRM_DEBUG_KMS("afbc size check failed, obj_size: 0x%zx. min_size 0x%llx.\n",
 			      obj->size, min_size);
-- 
2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
