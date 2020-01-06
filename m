Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CAB2A1310A9
	for <lists+dri-devel@lfdr.de>; Mon,  6 Jan 2020 11:37:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 691486E247;
	Mon,  6 Jan 2020 10:36:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C583C89A91
 for <dri-devel@lists.freedesktop.org>; Mon,  6 Jan 2020 10:36:53 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 7F8BBAFF0;
 Mon,  6 Jan 2020 10:36:52 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@redhat.com, daniel@ffwll.ch, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, zourongrong@gmail.com, kong.kongxinwei@hisilicon.com,
 puck.chen@hisilicon.com, kraxel@redhat.com, sam@ravnborg.org
Subject: [PATCH v3 3/3] drm/vram-helper: Support struct
 drm_driver.gem_create_object
Date: Mon,  6 Jan 2020 11:36:46 +0100
Message-Id: <20200106103646.13077-4-tzimmermann@suse.de>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200106103646.13077-1-tzimmermann@suse.de>
References: <20200106103646.13077-1-tzimmermann@suse.de>
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Drivers that what to allocate VRAM GEM objects with additional fields
can now do this by implementing struct drm_driver.gem_create_object.

v3:
	* separately check allocation failure in if/else branches
	  before upcast to gbo
v2:
	* only cast to gbo within if branch; set gbo directly
	  in else branch

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
Acked-by: Sam Ravnborg <sam@ravnborg.org>
---
 drivers/gpu/drm/drm_gem_vram_helper.c | 15 ++++++++++++---
 1 file changed, 12 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/drm_gem_vram_helper.c b/drivers/gpu/drm/drm_gem_vram_helper.c
index b760fd27f3c0..bf42879a163f 100644
--- a/drivers/gpu/drm/drm_gem_vram_helper.c
+++ b/drivers/gpu/drm/drm_gem_vram_helper.c
@@ -2,6 +2,7 @@
 
 #include <drm/drm_debugfs.h>
 #include <drm/drm_device.h>
+#include <drm/drm_drv.h>
 #include <drm/drm_file.h>
 #include <drm/drm_framebuffer.h>
 #include <drm/drm_gem_ttm_helper.h>
@@ -145,9 +146,17 @@ struct drm_gem_vram_object *drm_gem_vram_create(struct drm_device *dev,
 	struct drm_gem_vram_object *gbo;
 	int ret;
 
-	gbo = kzalloc(sizeof(*gbo), GFP_KERNEL);
-	if (!gbo)
-		return ERR_PTR(-ENOMEM);
+	if (dev->driver->gem_create_object) {
+		struct drm_gem_object *gem =
+			dev->driver->gem_create_object(dev, size);
+		if (!gem)
+			return ERR_PTR(-ENOMEM);
+		gbo = drm_gem_vram_of_gem(gem);
+	} else {
+		gbo = kzalloc(sizeof(*gbo), GFP_KERNEL);
+		if (!gbo)
+			return ERR_PTR(-ENOMEM);
+	}
 
 	ret = drm_gem_vram_init(dev, gbo, size, pg_align);
 	if (ret < 0)
-- 
2.24.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
