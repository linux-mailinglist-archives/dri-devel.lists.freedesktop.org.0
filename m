Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 68EB611E752
	for <lists+dri-devel@lfdr.de>; Fri, 13 Dec 2019 17:00:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E32C56EA86;
	Fri, 13 Dec 2019 15:59:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5205F6EA7A
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Dec 2019 15:59:38 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: andrzej.p) with ESMTPSA id DFBDE292D98
From: Andrzej Pietrasiewicz <andrzej.p@collabora.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCHv4 29/36] drm/komeda: Move special helper invocation outside
 if-else
Date: Fri, 13 Dec 2019 16:59:00 +0100
Message-Id: <20191213155907.16581-30-andrzej.p@collabora.com>
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

The invocation is the same in both cases and is the last thing inside a
block, so move it outside the if-else clause.

Signed-off-by: Andrzej Pietrasiewicz <andrzej.p@collabora.com>
---
 .../gpu/drm/arm/display/komeda/komeda_framebuffer.c  | 12 +++---------
 1 file changed, 3 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/arm/display/komeda/komeda_framebuffer.c b/drivers/gpu/drm/arm/display/komeda/komeda_framebuffer.c
index ac7e099435c9..385df1fd776d 100644
--- a/drivers/gpu/drm/arm/display/komeda/komeda_framebuffer.c
+++ b/drivers/gpu/drm/arm/display/komeda/komeda_framebuffer.c
@@ -44,6 +44,8 @@ komeda_fb_create(struct drm_device *dev, struct drm_file *file,
 	struct drm_gem_object *objs[4];
 	struct komeda_fb *kfb;
 	const struct drm_format_info *info;
+	struct drm_size_check check = { 0 };
+
 	int ret = 0, i, num_planes;
 
 	kfb = kzalloc(sizeof(*kfb), GFP_KERNEL);
@@ -68,7 +70,6 @@ komeda_fb_create(struct drm_device *dev, struct drm_file *file,
 	info = drm_get_format_info(dev, mode_cmd);
 
 	if (mode_cmd->modifier[0]) {
-		struct drm_size_check check = { 0 };
 		u32 alignment_w = 0, alignment_h = 0;
 		u32 alignment_header, n_blocks, bpp;
 
@@ -113,12 +114,7 @@ komeda_fb_create(struct drm_device *dev, struct drm_file *file,
 				       AFBC_SUPERBLK_ALIGNMENT);
 		check.min_size[0] = kfb->afbc_size + mode_cmd->offsets[0];
 		check.use_min_size = true;
-
-		ret = drm_gem_fb_size_check_special(dev, mode_cmd, &check,
-						    objs);
 	} else {
-		struct drm_size_check check = { 0 };
-
 		ret = komeda_fb_check_src_coords(kfb, 0, 0, mode_cmd->width,
 						 mode_cmd->height);
 		if (ret)
@@ -140,10 +136,8 @@ komeda_fb_create(struct drm_device *dev, struct drm_file *file,
 		check.pitch_modulo = mdev->chip.bus_width;
 		check.use_pitch_multiplier = true;
 		check.use_min_size = true;
-
-		ret = drm_gem_fb_size_check_special(dev, mode_cmd, &check,
-						    objs);
 	}
+	ret = drm_gem_fb_size_check_special(dev, mode_cmd, &check, objs);
 	if (ret < 0)
 		goto err_cleanup;
 
-- 
2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
