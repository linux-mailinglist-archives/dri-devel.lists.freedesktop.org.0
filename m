Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B009011BB09
	for <lists+dri-devel@lfdr.de>; Wed, 11 Dec 2019 19:08:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F4416E091;
	Wed, 11 Dec 2019 18:08:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E53956E091
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Dec 2019 18:08:36 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 2A699B39D;
 Wed, 11 Dec 2019 18:08:35 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@redhat.com, daniel@ffwll.ch, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, z.liuxinliang@hisilicon.com, zourongrong@gmail.com,
 kong.kongxinwei@hisilicon.com, puck.chen@hisilicon.com, kraxel@redhat.com,
 sam@ravnborg.org
Subject: [PATCH 3/3] drm/vram-helper: Support struct
 drm_driver.gem_create_object
Date: Wed, 11 Dec 2019 19:08:32 +0100
Message-Id: <20191211180832.7159-4-tzimmermann@suse.de>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191211180832.7159-1-tzimmermann@suse.de>
References: <20191211180832.7159-1-tzimmermann@suse.de>
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

Drivers that what to allocate VRAM GEM objects with additional fields
can now do this by implementing struct drm_driver.gem_create_object.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/drm_gem_vram_helper.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/drm_gem_vram_helper.c b/drivers/gpu/drm/drm_gem_vram_helper.c
index b760fd27f3c0..d475d94e2e3e 100644
--- a/drivers/gpu/drm/drm_gem_vram_helper.c
+++ b/drivers/gpu/drm/drm_gem_vram_helper.c
@@ -2,6 +2,7 @@
 
 #include <drm/drm_debugfs.h>
 #include <drm/drm_device.h>
+#include <drm/drm_drv.h>
 #include <drm/drm_file.h>
 #include <drm/drm_framebuffer.h>
 #include <drm/drm_gem_ttm_helper.h>
@@ -142,13 +143,19 @@ struct drm_gem_vram_object *drm_gem_vram_create(struct drm_device *dev,
 						size_t size,
 						unsigned long pg_align)
 {
+	struct drm_gem_object *gem;
 	struct drm_gem_vram_object *gbo;
 	int ret;
 
-	gbo = kzalloc(sizeof(*gbo), GFP_KERNEL);
-	if (!gbo)
+	if (dev->driver->gem_create_object)
+		gem = dev->driver->gem_create_object(dev, size);
+	else
+		gem = kzalloc(sizeof(*gbo), GFP_KERNEL);
+	if (!gem)
 		return ERR_PTR(-ENOMEM);
 
+	gbo = drm_gem_vram_of_gem(gem);
+
 	ret = drm_gem_vram_init(dev, gbo, size, pg_align);
 	if (ret < 0)
 		goto err_kfree;
-- 
2.24.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
