Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AA3721EB72
	for <lists+dri-devel@lfdr.de>; Tue, 14 Jul 2020 10:32:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DEA036E177;
	Tue, 14 Jul 2020 08:32:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9BB216E180
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Jul 2020 08:32:42 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id B533AAD81;
 Tue, 14 Jul 2020 08:32:43 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
To: daniel@ffwll.ch, airlied@linux.ie, jiayang5@huawei.com,
 butterflyhuangxx@gmail.com, mripard@kernel.org,
 maarten.lankhorst@linux.intel.com
Subject: [PATCH 3/3] drm/vram-helper: Set object function iff they are not
 provided by driver
Date: Tue, 14 Jul 2020 10:32:38 +0200
Message-Id: <20200714083238.28479-4-tzimmermann@suse.de>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200714083238.28479-1-tzimmermann@suse.de>
References: <20200714083238.28479-1-tzimmermann@suse.de>
MIME-Version: 1.0
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Don't override the GEM object functions unconditionally. If the driver
sets the GEM functions, VRAM helpers will now them. The idea has been
taken from SHMEM helpers. If drivers need special versions of some of
the GEM functions, they can now override them.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/drm_gem_vram_helper.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/drm_gem_vram_helper.c b/drivers/gpu/drm/drm_gem_vram_helper.c
index af767d3da5da..7194144610cb 100644
--- a/drivers/gpu/drm/drm_gem_vram_helper.c
+++ b/drivers/gpu/drm/drm_gem_vram_helper.c
@@ -190,6 +190,7 @@ struct drm_gem_vram_object *drm_gem_vram_create(struct drm_device *dev,
 						unsigned long pg_align)
 {
 	struct drm_gem_vram_object *gbo;
+	struct drm_gem_object *gem;
 	struct drm_vram_mm *vmm = dev->vram_mm;
 	struct ttm_bo_device *bdev;
 	int ret;
@@ -199,8 +200,7 @@ struct drm_gem_vram_object *drm_gem_vram_create(struct drm_device *dev,
 		return ERR_PTR(-EINVAL);
 
 	if (dev->driver->gem_create_object) {
-		struct drm_gem_object *gem =
-			dev->driver->gem_create_object(dev, size);
+		gem = dev->driver->gem_create_object(dev, size);
 		if (!gem)
 			return ERR_PTR(-ENOMEM);
 		gbo = drm_gem_vram_of_gem(gem);
@@ -208,11 +208,13 @@ struct drm_gem_vram_object *drm_gem_vram_create(struct drm_device *dev,
 		gbo = kzalloc(sizeof(*gbo), GFP_KERNEL);
 		if (!gbo)
 			return ERR_PTR(-ENOMEM);
+		gem = &gbo->bo.base;
 	}
 
-	gbo->bo.base.funcs = &drm_gem_vram_object_funcs;
+	if (!gem->funcs)
+		gem->funcs = &drm_gem_vram_object_funcs;
 
-	ret = drm_gem_object_init(dev, &gbo->bo.base, size);
+	ret = drm_gem_object_init(dev, gem, size);
 	if (ret) {
 		kfree(gbo);
 		return ERR_PTR(ret);
-- 
2.27.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
