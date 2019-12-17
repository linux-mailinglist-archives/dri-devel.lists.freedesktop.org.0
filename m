Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E860122F53
	for <lists+dri-devel@lfdr.de>; Tue, 17 Dec 2019 15:52:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B1736EA08;
	Tue, 17 Dec 2019 14:52:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A6386EA02
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Dec 2019 14:52:33 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: andrzej.p) with ESMTPSA id 33CE82927CA
From: Andrzej Pietrasiewicz <andrzej.p@collabora.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCHv5 13/34] drm/komeda: Make komeda_fb_none_size_check
 independent from framebuffer
Date: Tue, 17 Dec 2019 15:49:59 +0100
Message-Id: <20191217145020.14645-14-andrzej.p@collabora.com>
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

All necessary data is now available in other data structures.

Signed-off-by: Andrzej Pietrasiewicz <andrzej.p@collabora.com>
---
 drivers/gpu/drm/arm/display/komeda/komeda_framebuffer.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/arm/display/komeda/komeda_framebuffer.c b/drivers/gpu/drm/arm/display/komeda/komeda_framebuffer.c
index 2014cd843aeb..43db95a76291 100644
--- a/drivers/gpu/drm/arm/display/komeda/komeda_framebuffer.c
+++ b/drivers/gpu/drm/arm/display/komeda/komeda_framebuffer.c
@@ -98,13 +98,11 @@ komeda_fb_afbc_size_check(struct komeda_fb *kfb,
 
 static int
 komeda_fb_none_afbc_size_check(struct komeda_dev *mdev,
-			       struct komeda_fb *kfb,
 			       const struct drm_format_info *info,
 			       struct drm_gem_object **objs,
 			       struct drm_file *file,
 			       const struct drm_mode_fb_cmd2 *mode_cmd)
 {
-	struct drm_framebuffer *fb = &kfb->base;
 	struct drm_gem_object *obj;
 	u32 i, block_h;
 	u64 min_size;
@@ -113,9 +111,10 @@ komeda_fb_none_afbc_size_check(struct komeda_dev *mdev,
 		obj = objs[i];
 
 		block_h = drm_format_info_block_height(info, i);
-		if ((fb->pitches[i] * block_h) % mdev->chip.bus_width) {
+		if ((mode_cmd->pitches[i] * block_h) % mdev->chip.bus_width) {
 			DRM_DEBUG_KMS("Pitch[%d]: 0x%x doesn't align to 0x%x\n",
-				      i, fb->pitches[i], mdev->chip.bus_width);
+				      i, mode_cmd->pitches[i],
+				      mdev->chip.bus_width);
 			return -EINVAL;
 		}
 
@@ -183,7 +182,7 @@ komeda_fb_create(struct drm_device *dev, struct drm_file *file,
 			return ERR_PTR(ret);
 		}
 
-		ret = komeda_fb_none_afbc_size_check(mdev, kfb, info, objs,
+		ret = komeda_fb_none_afbc_size_check(mdev, info, objs,
 						     file, mode_cmd);
 		for (i = 0; i < info->num_planes; ++i)
 			kfb->base.obj[i] = objs[i];
-- 
2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
