Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BB91122F60
	for <lists+dri-devel@lfdr.de>; Tue, 17 Dec 2019 15:53:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 53BAE6EA1B;
	Tue, 17 Dec 2019 14:52:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2602D6EA05
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Dec 2019 14:52:44 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: andrzej.p) with ESMTPSA id ACC88292879
From: Andrzej Pietrasiewicz <andrzej.p@collabora.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCHv5 22/34] drm/komeda: Use return value of drm_gem_fb_lookup
Date: Tue, 17 Dec 2019 15:50:08 +0100
Message-Id: <20191217145020.14645-23-andrzej.p@collabora.com>
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

Reduce dependency of the function on the "info" variable as much as
possible.

Signed-off-by: Andrzej Pietrasiewicz <andrzej.p@collabora.com>
---
 .../gpu/drm/arm/display/komeda/komeda_framebuffer.c   | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/arm/display/komeda/komeda_framebuffer.c b/drivers/gpu/drm/arm/display/komeda/komeda_framebuffer.c
index 26d1a3cfb587..9139fe5619be 100644
--- a/drivers/gpu/drm/arm/display/komeda/komeda_framebuffer.c
+++ b/drivers/gpu/drm/arm/display/komeda/komeda_framebuffer.c
@@ -134,7 +134,7 @@ komeda_fb_create(struct drm_device *dev, struct drm_file *file,
 	struct drm_gem_object *objs[4];
 	struct komeda_fb *kfb;
 	const struct drm_format_info *info;
-	int ret = 0, i;
+	int ret = 0, i, num_planes;
 
 	kfb = kzalloc(sizeof(*kfb), GFP_KERNEL);
 	if (!kfb)
@@ -153,11 +153,12 @@ komeda_fb_create(struct drm_device *dev, struct drm_file *file,
 	ret = drm_gem_fb_lookup(dev, file, mode_cmd, objs);
 	if (ret < 0)
 		goto err_free;
+	num_planes = ret;
 
 	info = drm_get_format_info(dev, mode_cmd);
 
 	if (mode_cmd->modifier[0]) {
-		if (info->num_planes != 1) {
+		if (num_planes != 1) {
 			DRM_DEBUG_KMS("AFBC requires exactly 1 plane.\n");
 			ret = -EINVAL;
 			goto err_cleanup;
@@ -177,7 +178,7 @@ komeda_fb_create(struct drm_device *dev, struct drm_file *file,
 	if (ret < 0)
 		goto err_cleanup;
 
-	if (info->num_planes == 3)
+	if (num_planes == 3)
 		if (mode_cmd->pitches[1] != mode_cmd->pitches[2]) {
 			DRM_DEBUG_KMS("The pitch[1] and [2] are not same\n");
 			ret = -EINVAL;
@@ -185,7 +186,7 @@ komeda_fb_create(struct drm_device *dev, struct drm_file *file,
 		}
 
 	ret = drm_gem_fb_init_with_funcs(&kfb->base, dev, mode_cmd, objs,
-					 info->num_planes, &komeda_fb_funcs);
+					 num_planes, &komeda_fb_funcs);
 	if (ret < 0)
 		goto err_cleanup;
 
@@ -194,7 +195,7 @@ komeda_fb_create(struct drm_device *dev, struct drm_file *file,
 	return &kfb->base;
 
 err_cleanup:
-	for (i = 0; i < info->num_planes; i++)
+	for (i = 0; i < num_planes; i++)
 		drm_gem_object_put_unlocked(objs[i]);
 err_free:
 	kfree(kfb);
-- 
2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
