Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 088778FDBB5
	for <lists+dri-devel@lfdr.de>; Thu,  6 Jun 2024 02:54:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C844610E81F;
	Thu,  6 Jun 2024 00:54:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="zG3Lvo/o";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com
 [46.235.227.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF06110E502
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Jun 2024 00:54:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1717635278;
 bh=sBSV/JiXYuHvZ9jdJPjERqcjEBQobqd650oZQxRDozE=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=zG3Lvo/orj9g86rcbf3DlQbYzIZu1EpWA9uAqifcjgGBgMTCMeA6RhnpG124mMiyM
 JDZDFmROn0kPrNB86oOfX6riMyN3rTA2n2pADRZCNahnomBzu63zBYpDAtjT7+w3JZ
 SekqQqaGyV4vzr+a6qUjCpV8CG5wZDAXNvn3JBRhyxK9/OjE6+Cuym++XThlJujT+a
 exC+zUT34cO1TuLNieI7eSOM7PGZR08bB5ebkFE1hVU4/0g7G0RAdVVXhHukibe3Ri
 AFY1X0vhhBvfxtnYKagrNdB56DMkgtf4OI+vZo8DiDMCuoPrGVRcNvxWHlb+3Li0BF
 +oBkUlLhOXhxw==
Received: from localhost.localdomain (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: alarumbe)
 by madrid.collaboradmins.com (Postfix) with ESMTPSA id 2122437821D1;
 Thu,  6 Jun 2024 00:54:38 +0000 (UTC)
From: =?UTF-8?q?Adri=C3=A1n=20Larumbe?= <adrian.larumbe@collabora.com>
To: Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>
Cc: kernel@collabora.com,
 =?UTF-8?q?Adri=C3=A1n=20Larumbe?= <adrian.larumbe@collabora.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH v3 6/7] drm/drm_file: add display of driver's internal memory
 size
Date: Thu,  6 Jun 2024 01:49:58 +0100
Message-ID: <20240606005416.1172431-7-adrian.larumbe@collabora.com>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20240606005416.1172431-1-adrian.larumbe@collabora.com>
References: <20240606005416.1172431-1-adrian.larumbe@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Some drivers must allocate a considerable amount of memory for bookkeeping
structures and GPU's MCU-kernel shared communication regions. These are
often created as a result of the invocation of the driver's ioctl()
interface functions, so it is sensible to consider them as being owned by
the render context associated with an open drm file.

However, at the moment drm_show_memory_stats only traverses the UM-exposed
drm objects for which a handle exists. Private driver objects and memory
regions, though connected to a render context, are unaccounted for in their
fdinfo numbers.

Add a new drm_memory_stats 'internal' memory category.

Because deciding what constitutes an 'internal' object and where to find
these are driver-dependent, calculation of this size must be done through a
driver-provided function pointer, which becomes the third argument of
drm_show_memory_stats. Drivers which have no interest in exposing the size
of internal memory objects can keep passing NULL for unaltered behaviour.

Signed-off-by: Adrián Larumbe <adrian.larumbe@collabora.com>
---
 Documentation/gpu/drm-usage-stats.rst   | 4 ++++
 drivers/gpu/drm/drm_file.c              | 9 +++++++--
 drivers/gpu/drm/msm/msm_drv.c           | 2 +-
 drivers/gpu/drm/panfrost/panfrost_drv.c | 2 +-
 include/drm/drm_file.h                  | 7 ++++++-
 5 files changed, 19 insertions(+), 5 deletions(-)

diff --git a/Documentation/gpu/drm-usage-stats.rst b/Documentation/gpu/drm-usage-stats.rst
index 6dc299343b48..0da5ebecd232 100644
--- a/Documentation/gpu/drm-usage-stats.rst
+++ b/Documentation/gpu/drm-usage-stats.rst
@@ -157,6 +157,10 @@ The total size of buffers that are purgeable.
 
 The total size of buffers that are active on one or more engines.
 
+- drm-internal-<region>: <uint> [KiB|MiB]
+
+The total size of GEM objects that aren't exposed to user space.
+
 Implementation Details
 ======================
 
diff --git a/drivers/gpu/drm/drm_file.c b/drivers/gpu/drm/drm_file.c
index 638ffa4444f5..d1c13eed8d34 100644
--- a/drivers/gpu/drm/drm_file.c
+++ b/drivers/gpu/drm/drm_file.c
@@ -874,9 +874,10 @@ void drm_print_memory_stats(struct drm_printer *p,
 			    enum drm_gem_object_status supported_status,
 			    const char *region)
 {
-	print_size(p, "total", region, stats->private + stats->shared);
+	print_size(p, "total", region, stats->private + stats->shared + stats->internal);
 	print_size(p, "shared", region, stats->shared);
 	print_size(p, "active", region, stats->active);
+	print_size(p, "internal", region, stats->internal);
 
 	if (supported_status & DRM_GEM_OBJECT_RESIDENT)
 		print_size(p, "resident", region, stats->resident);
@@ -890,11 +891,12 @@ EXPORT_SYMBOL(drm_print_memory_stats);
  * drm_show_memory_stats - Helper to collect and show standard fdinfo memory stats
  * @p: the printer to print output to
  * @file: the DRM file
+ * @func: driver-specific function pointer to count the size of internal objects
  *
  * Helper to iterate over GEM objects with a handle allocated in the specified
  * file.
  */
-void drm_show_memory_stats(struct drm_printer *p, struct drm_file *file)
+void drm_show_memory_stats(struct drm_printer *p, struct drm_file *file, internal_bos func)
 {
 	struct drm_gem_object *obj;
 	struct drm_memory_stats status = {};
@@ -940,6 +942,9 @@ void drm_show_memory_stats(struct drm_printer *p, struct drm_file *file)
 	}
 	spin_unlock(&file->table_lock);
 
+	if (func)
+		func(&status, file);
+
 	drm_print_memory_stats(p, &status, supported_status, "memory");
 }
 EXPORT_SYMBOL(drm_show_memory_stats);
diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
index 9c33f4e3f822..f97d3cdc4f50 100644
--- a/drivers/gpu/drm/msm/msm_drv.c
+++ b/drivers/gpu/drm/msm/msm_drv.c
@@ -880,7 +880,7 @@ static void msm_show_fdinfo(struct drm_printer *p, struct drm_file *file)
 
 	msm_gpu_show_fdinfo(priv->gpu, file->driver_priv, p);
 
-	drm_show_memory_stats(p, file);
+	drm_show_memory_stats(p, file, NULL);
 }
 
 static const struct file_operations fops = {
diff --git a/drivers/gpu/drm/panfrost/panfrost_drv.c b/drivers/gpu/drm/panfrost/panfrost_drv.c
index ef9f6c0716d5..53640ac44e42 100644
--- a/drivers/gpu/drm/panfrost/panfrost_drv.c
+++ b/drivers/gpu/drm/panfrost/panfrost_drv.c
@@ -570,7 +570,7 @@ static void panfrost_show_fdinfo(struct drm_printer *p, struct drm_file *file)
 
 	panfrost_gpu_show_fdinfo(pfdev, file->driver_priv, p);
 
-	drm_show_memory_stats(p, file);
+	drm_show_memory_stats(p, file, NULL);
 }
 
 static const struct file_operations panfrost_drm_driver_fops = {
diff --git a/include/drm/drm_file.h b/include/drm/drm_file.h
index ab230d3af138..d71a5ac50ea9 100644
--- a/include/drm/drm_file.h
+++ b/include/drm/drm_file.h
@@ -464,6 +464,7 @@ void drm_send_event_timestamp_locked(struct drm_device *dev,
  * @resident: Total size of GEM objects backing pages
  * @purgeable: Total size of GEM objects that can be purged (resident and not active)
  * @active: Total size of GEM objects active on one or more engines
+ * @internal: Total size of GEM objects that aren't exposed to user space
  *
  * Used by drm_print_memory_stats()
  */
@@ -473,16 +474,20 @@ struct drm_memory_stats {
 	u64 resident;
 	u64 purgeable;
 	u64 active;
+	u64 internal;
 };
 
 enum drm_gem_object_status;
 
+typedef void (*internal_bos)(struct drm_memory_stats *status,
+			     struct drm_file *file);
+
 void drm_print_memory_stats(struct drm_printer *p,
 			    const struct drm_memory_stats *stats,
 			    enum drm_gem_object_status supported_status,
 			    const char *region);
 
-void drm_show_memory_stats(struct drm_printer *p, struct drm_file *file);
+void drm_show_memory_stats(struct drm_printer *p, struct drm_file *file, internal_bos func);
 void drm_show_fdinfo(struct seq_file *m, struct file *f);
 
 struct file *mock_drm_getfile(struct drm_minor *minor, unsigned int flags);
-- 
2.45.1

