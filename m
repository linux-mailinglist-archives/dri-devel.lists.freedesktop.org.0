Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 28D671D919B
	for <lists+dri-devel@lfdr.de>; Tue, 19 May 2020 10:04:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CFFDA89F0A;
	Tue, 19 May 2020 08:04:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 923F789F0A
 for <dri-devel@lists.freedesktop.org>; Tue, 19 May 2020 08:04:28 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id D7BC1ACC2;
 Tue, 19 May 2020 08:04:29 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
To: maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@linux.ie,
 daniel@ffwll.ch, sean@poorly.run, kraxel@redhat.com,
 emil.l.velikov@gmail.com, sam@ravnborg.org
Subject: [PATCH v2 1/2] drm/shmem-helper: Add .gem_create_object helper that
 sets map_cached flag
Date: Tue, 19 May 2020 10:04:22 +0200
Message-Id: <20200519080423.21695-2-tzimmermann@suse.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200519080423.21695-1-tzimmermann@suse.de>
References: <20200519080423.21695-1-tzimmermann@suse.de>
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

The helper drm_gem_shmem_create_object_cached() allocates an GEM SHMEM
object and sets the map_cached flag. Useful for drivers that want cached
mappings.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/drm_gem_shmem_helper.c | 27 ++++++++++++++++++++++++++
 include/drm/drm_gem_shmem_helper.h     |  4 ++++
 2 files changed, 31 insertions(+)

diff --git a/drivers/gpu/drm/drm_gem_shmem_helper.c b/drivers/gpu/drm/drm_gem_shmem_helper.c
index df31e5782eed1..ab28b7ff864cb 100644
--- a/drivers/gpu/drm/drm_gem_shmem_helper.c
+++ b/drivers/gpu/drm/drm_gem_shmem_helper.c
@@ -433,6 +433,33 @@ bool drm_gem_shmem_purge(struct drm_gem_object *obj)
 }
 EXPORT_SYMBOL(drm_gem_shmem_purge);
 
+/**
+ * drm_gem_shmem_create_object_cached - Create a shmem buffer object with
+ *                                      cached mappings
+ * @dev: DRM device
+ * @size: Size of the object to allocate
+ *
+ * By default, shmem buffer objects use writecombine mappings. This
+ * function implements struct drm_driver.gem_create_object for shmem
+ * buffer objects with cached mappings.
+ *
+ * Returns:
+ * A struct drm_gem_shmem_object * on success or NULL negative on failure.
+ */
+struct drm_gem_object *
+drm_gem_shmem_create_object_cached(struct drm_device *dev, size_t size)
+{
+       struct drm_gem_shmem_object *shmem;
+
+       shmem = kzalloc(sizeof(*shmem), GFP_KERNEL);
+       if (!shmem)
+               return NULL;
+       shmem->map_cached = true;
+
+       return &shmem->base;
+}
+EXPORT_SYMBOL(drm_gem_shmem_create_object_cached);
+
 /**
  * drm_gem_shmem_dumb_create - Create a dumb shmem buffer object
  * @file: DRM file structure to create the dumb buffer for
diff --git a/include/drm/drm_gem_shmem_helper.h b/include/drm/drm_gem_shmem_helper.h
index 294b2931c4cc0..5381f0c8cf6f6 100644
--- a/include/drm/drm_gem_shmem_helper.h
+++ b/include/drm/drm_gem_shmem_helper.h
@@ -132,6 +132,10 @@ struct drm_gem_shmem_object *
 drm_gem_shmem_create_with_handle(struct drm_file *file_priv,
 				 struct drm_device *dev, size_t size,
 				 uint32_t *handle);
+
+struct drm_gem_object *
+drm_gem_shmem_create_object_cached(struct drm_device *dev, size_t size);
+
 int drm_gem_shmem_dumb_create(struct drm_file *file, struct drm_device *dev,
 			      struct drm_mode_create_dumb *args);
 
-- 
2.26.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
