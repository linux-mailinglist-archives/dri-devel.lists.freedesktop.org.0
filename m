Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 644A511E74E
	for <lists+dri-devel@lfdr.de>; Fri, 13 Dec 2019 17:00:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 533C56EA7A;
	Fri, 13 Dec 2019 15:59:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B81446E9B2
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Dec 2019 15:59:23 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: andrzej.p) with ESMTPSA id F0F8A292D1F
From: Andrzej Pietrasiewicz <andrzej.p@collabora.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCHv4 10/36] drm/komeda: Retrieve drm_format_info once
Date: Fri, 13 Dec 2019 16:58:41 +0100
Message-Id: <20191213155907.16581-11-andrzej.p@collabora.com>
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

Next step towards unifying afbc and non-afbc cases as much as possible.

Signed-off-by: Andrzej Pietrasiewicz <andrzej.p@collabora.com>
---
 .../drm/arm/display/komeda/komeda_framebuffer.c | 17 +++++++++++------
 1 file changed, 11 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/arm/display/komeda/komeda_framebuffer.c b/drivers/gpu/drm/arm/display/komeda/komeda_framebuffer.c
index bb1b43a64685..ce96389e3c40 100644
--- a/drivers/gpu/drm/arm/display/komeda/komeda_framebuffer.c
+++ b/drivers/gpu/drm/arm/display/komeda/komeda_framebuffer.c
@@ -37,11 +37,12 @@ static const struct drm_framebuffer_funcs komeda_fb_funcs = {
 };
 
 static int
-komeda_fb_afbc_size_check(struct komeda_fb *kfb, struct drm_file *file,
+komeda_fb_afbc_size_check(struct komeda_fb *kfb,
+			  const struct drm_format_info *info,
+			  struct drm_file *file,
 			  const struct drm_mode_fb_cmd2 *mode_cmd)
 {
 	struct drm_framebuffer *fb = &kfb->base;
-	const struct drm_format_info *info = fb->format;
 	struct drm_gem_object *obj;
 	u32 alignment_w = 0, alignment_h = 0, alignment_header, n_blocks, bpp;
 	u64 min_size;
@@ -97,12 +98,13 @@ komeda_fb_afbc_size_check(struct komeda_fb *kfb, struct drm_file *file,
 }
 
 static int
-komeda_fb_none_afbc_size_check(struct komeda_dev *mdev, struct komeda_fb *kfb,
+komeda_fb_none_afbc_size_check(struct komeda_dev *mdev,
+			       struct komeda_fb *kfb,
+			       const struct drm_format_info *info,
 			       struct drm_file *file,
 			       const struct drm_mode_fb_cmd2 *mode_cmd)
 {
 	struct drm_framebuffer *fb = &kfb->base;
-	const struct drm_format_info *info = fb->format;
 	struct drm_gem_object *obj;
 	u32 i, block_h;
 	u64 min_size;
@@ -147,6 +149,7 @@ komeda_fb_create(struct drm_device *dev, struct drm_file *file,
 {
 	struct komeda_dev *mdev = dev->dev_private;
 	struct komeda_fb *kfb;
+	const struct drm_format_info *info;
 	int ret = 0, i;
 
 	kfb = kzalloc(sizeof(*kfb), GFP_KERNEL);
@@ -164,9 +167,10 @@ komeda_fb_create(struct drm_device *dev, struct drm_file *file,
 	}
 
 	drm_helper_mode_fill_fb_struct(dev, &kfb->base, mode_cmd);
+	info = kfb->base.format;
 
 	if (kfb->base.modifier) {
-		ret = komeda_fb_afbc_size_check(kfb, file, mode_cmd);
+		ret = komeda_fb_afbc_size_check(kfb, info, file, mode_cmd);
 	} else {
 		if (komeda_fb_check_src_coords(kfb, 0, 0, kfb->base.width,
 					       kfb->base.height)) {
@@ -174,7 +178,8 @@ komeda_fb_create(struct drm_device *dev, struct drm_file *file,
 			return ERR_PTR(-EINVAL);
 		}
 
-		ret = komeda_fb_none_afbc_size_check(mdev, kfb, file, mode_cmd);
+		ret = komeda_fb_none_afbc_size_check(mdev, kfb, info, file,
+						     mode_cmd);
 	}
 	if (ret < 0)
 		goto err_cleanup;
-- 
2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
