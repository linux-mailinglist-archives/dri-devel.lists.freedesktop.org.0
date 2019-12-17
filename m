Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D7D29122F5F
	for <lists+dri-devel@lfdr.de>; Tue, 17 Dec 2019 15:53:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3EC316EA1A;
	Tue, 17 Dec 2019 14:52:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CBEB76EA02
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Dec 2019 14:52:27 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: andrzej.p) with ESMTPSA id B2F8F2927AE
From: Andrzej Pietrasiewicz <andrzej.p@collabora.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCHv5 08/34] drm/komeda: Retrieve drm_format_info once
Date: Tue, 17 Dec 2019 15:49:54 +0100
Message-Id: <20191217145020.14645-9-andrzej.p@collabora.com>
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

Next step towards unifying afbc and non-afbc cases as much as possible.

Signed-off-by: Andrzej Pietrasiewicz <andrzej.p@collabora.com>
---
 .../drm/arm/display/komeda/komeda_framebuffer.c | 17 +++++++++++------
 1 file changed, 11 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/arm/display/komeda/komeda_framebuffer.c b/drivers/gpu/drm/arm/display/komeda/komeda_framebuffer.c
index 33181bdab16b..7004c3c8f8de 100644
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
@@ -96,12 +97,13 @@ komeda_fb_afbc_size_check(struct komeda_fb *kfb, struct drm_file *file,
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
@@ -146,6 +148,7 @@ komeda_fb_create(struct drm_device *dev, struct drm_file *file,
 {
 	struct komeda_dev *mdev = dev->dev_private;
 	struct komeda_fb *kfb;
+	const struct drm_format_info *info;
 	int ret = 0, i;
 
 	kfb = kzalloc(sizeof(*kfb), GFP_KERNEL);
@@ -163,9 +166,10 @@ komeda_fb_create(struct drm_device *dev, struct drm_file *file,
 	}
 
 	drm_helper_mode_fill_fb_struct(dev, &kfb->base, mode_cmd);
+	info = kfb->base.format;
 
 	if (kfb->base.modifier) {
-		ret = komeda_fb_afbc_size_check(kfb, file, mode_cmd);
+		ret = komeda_fb_afbc_size_check(kfb, info, file, mode_cmd);
 	} else {
 		if (komeda_fb_check_src_coords(kfb, 0, 0, kfb->base.width,
 					       kfb->base.height)) {
@@ -173,7 +177,8 @@ komeda_fb_create(struct drm_device *dev, struct drm_file *file,
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
