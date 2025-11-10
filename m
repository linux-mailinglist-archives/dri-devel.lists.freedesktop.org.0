Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B547C47A6D
	for <lists+dri-devel@lfdr.de>; Mon, 10 Nov 2025 16:50:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A689510E422;
	Mon, 10 Nov 2025 15:50:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="IAYig12n";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 58AB210E419;
 Mon, 10 Nov 2025 15:50:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1762789812;
 bh=W3I4REPB257DpLvZHH/+RQ7946QS1ctC6ANIb05qFTM=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=IAYig12nQt7XUAjU5sWd49aNPS40h4dRUS1a/1eG9ex4qNSadNtlMwdL1JvnfeFXy
 Usgqo6dnaxrZ/3EqfMM4/JQYkBD2L705Fc0rHTNJuCaRgTmpcGlrzqQ8nwAGh8k0+y
 6jLYerEJ1XmWCo9cZbsUgrUubpMyCRsh96m/No22bNsUllhfcmcAPnft/yHKuhB7+N
 v/0Vc0isO8caTnhoPduoMjnIhyy5ebOxm6RKTe1b1NCWJqf6PHsiZNQT5DrjCz2f1U
 5Nh6psNhdf5+m7+1AJgMyjVC6p1zcgEBjO9viH1yS3zr447fuC5b4ncWIqI2y+PCws
 H4d0vYWzYvYkg==
Received: from debian-rockchip-rock5b-rk3588.. (unknown
 [IPv6:2a01:e0a:5e3:6100:826d:bc07:e98c:84a])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 (Authenticated sender: loicmolinari)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 2281E17E1401;
 Mon, 10 Nov 2025 16:50:11 +0100 (CET)
From: =?UTF-8?q?Lo=C3=AFc=20Molinari?= <loic.molinari@collabora.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Rob Herring <robh@kernel.org>, Steven Price <steven.price@arm.com>,
 Liviu Dudau <liviu.dudau@arm.com>, Melissa Wen <mwen@igalia.com>,
 =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>,
 Hugh Dickins <hughd@google.com>,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 =?UTF-8?q?Lo=C3=AFc=20Molinari?= <loic.molinari@collabora.com>,
 Al Viro <viro@zeniv.linux.org.uk>,
 =?UTF-8?q?Miko=C5=82aj=20Wasiak?= <mikolaj.wasiak@intel.com>,
 Christian Brauner <brauner@kernel.org>,
 Nitin Gote <nitin.r.gote@intel.com>,
 Andi Shyti <andi.shyti@linux.intel.com>, Jonathan Corbet <corbet@lwn.net>,
 Christopher Healy <healych@amazon.com>,
 Matthew Wilcox <willy@infradead.org>, Bagas Sanjaya <bagasdotme@gmail.com>
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, linux-mm@kvack.org,
 linux-doc@vger.kernel.org, kernel@collabora.com
Subject: [PATCH v7 05/11] drm/i915: Use huge tmpfs mountpoint helpers
Date: Mon, 10 Nov 2025 16:49:53 +0100
Message-ID: <20251110155000.2936-6-loic.molinari@collabora.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251110155000.2936-1-loic.molinari@collabora.com>
References: <20251110155000.2936-1-loic.molinari@collabora.com>
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

Make use of the new drm_gem_huge_mnt_create() and
drm_gem_has_huge_mnt() helpers to avoid code duplication. Now that
it's just a few lines long, the single function in i915_gemfs.c is
moved into v3d_gem_shmem.c.

v3:
- use huge tmpfs mountpoint in drm_device
- move i915_gemfs.c into i915_gem_shmem.c

v4:
- clean up mountpoint creation error handling

v5:
- use drm_gem_has_huge_mnt() helper

v7:
- include <drm/drm_print.h> in i915_gem_shmem.c

Signed-off-by: Loïc Molinari <loic.molinari@collabora.com>
---
 drivers/gpu/drm/i915/Makefile                 |  3 +-
 drivers/gpu/drm/i915/gem/i915_gem_shmem.c     | 48 +++++++++----
 drivers/gpu/drm/i915/gem/i915_gemfs.c         | 71 -------------------
 drivers/gpu/drm/i915/gem/i915_gemfs.h         | 14 ----
 .../gpu/drm/i915/gem/selftests/huge_pages.c   | 11 +--
 drivers/gpu/drm/i915/i915_drv.h               |  5 --
 6 files changed, 42 insertions(+), 110 deletions(-)
 delete mode 100644 drivers/gpu/drm/i915/gem/i915_gemfs.c
 delete mode 100644 drivers/gpu/drm/i915/gem/i915_gemfs.h

diff --git a/drivers/gpu/drm/i915/Makefile b/drivers/gpu/drm/i915/Makefile
index 84ec79b64960..b5a8c0a6b747 100644
--- a/drivers/gpu/drm/i915/Makefile
+++ b/drivers/gpu/drm/i915/Makefile
@@ -169,8 +169,7 @@ gem-y += \
 	gem/i915_gem_ttm_move.o \
 	gem/i915_gem_ttm_pm.o \
 	gem/i915_gem_userptr.o \
-	gem/i915_gem_wait.o \
-	gem/i915_gemfs.o
+	gem/i915_gem_wait.o
 i915-y += \
 	$(gem-y) \
 	i915_active.o \
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_shmem.c b/drivers/gpu/drm/i915/gem/i915_gem_shmem.c
index 26dda55a07ff..9bba6f8cdee2 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_shmem.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_shmem.c
@@ -9,14 +9,16 @@
 #include <linux/uio.h>
 
 #include <drm/drm_cache.h>
+#include <drm/drm_gem.h>
+#include <drm/drm_print.h>
 
 #include "gem/i915_gem_region.h"
 #include "i915_drv.h"
 #include "i915_gem_object.h"
 #include "i915_gem_tiling.h"
-#include "i915_gemfs.h"
 #include "i915_scatterlist.h"
 #include "i915_trace.h"
+#include "i915_utils.h"
 
 /*
  * Move folios to appropriate lru and release the batch, decrementing the
@@ -515,9 +517,9 @@ static int __create_shmem(struct drm_i915_private *i915,
 	if (BITS_PER_LONG == 64 && size > MAX_LFS_FILESIZE)
 		return -E2BIG;
 
-	if (i915->mm.gemfs)
-		filp = shmem_file_setup_with_mnt(i915->mm.gemfs, "i915", size,
-						 flags);
+	if (drm_gem_has_huge_mnt(&i915->drm))
+		filp = shmem_file_setup_with_mnt(i915->drm.huge_mnt, "i915",
+						 size, flags);
 	else
 		filp = shmem_file_setup("i915", size, flags);
 	if (IS_ERR(filp))
@@ -644,21 +646,41 @@ i915_gem_object_create_shmem_from_data(struct drm_i915_private *i915,
 
 static int init_shmem(struct intel_memory_region *mem)
 {
-	i915_gemfs_init(mem->i915);
-	intel_memory_region_set_name(mem, "system");
+	struct drm_i915_private *i915 = mem->i915;
+	int err;
 
-	return 0; /* We have fallback to the kernel mnt if gemfs init failed. */
-}
+	/*
+	 * By creating our own shmemfs mountpoint, we can pass in
+	 * mount flags that better match our usecase.
+	 *
+	 * One example, although it is probably better with a per-file
+	 * control, is selecting huge page allocations ("huge=within_size").
+	 * However, we only do so on platforms which benefit from it, or to
+	 * offset the overhead of iommu lookups, where with latter it is a net
+	 * win even on platforms which would otherwise see some performance
+	 * regressions such a slow reads issue on Broadwell and Skylake.
+	 */
 
-static int release_shmem(struct intel_memory_region *mem)
-{
-	i915_gemfs_fini(mem->i915);
-	return 0;
+	if (GRAPHICS_VER(i915) < 11 && !i915_vtd_active(i915))
+		goto no_thp;
+
+	err = drm_gem_huge_mnt_create(&i915->drm, "within_size");
+	if (drm_gem_has_huge_mnt(&i915->drm))
+		drm_info(&i915->drm, "Using Transparent Hugepages\n");
+	else if (err)
+		drm_notice(&i915->drm,
+			   "Transparent Hugepage support is recommended for optimal performance%s\n",
+			   GRAPHICS_VER(i915) >= 11 ? " on this platform!" :
+						      " when IOMMU is enabled!");
+
+ no_thp:
+	intel_memory_region_set_name(mem, "system");
+
+	return 0; /* We have fallback to the kernel mnt if huge mnt failed. */
 }
 
 static const struct intel_memory_region_ops shmem_region_ops = {
 	.init = init_shmem,
-	.release = release_shmem,
 	.init_object = shmem_object_init,
 };
 
diff --git a/drivers/gpu/drm/i915/gem/i915_gemfs.c b/drivers/gpu/drm/i915/gem/i915_gemfs.c
deleted file mode 100644
index 1f1290214031..000000000000
--- a/drivers/gpu/drm/i915/gem/i915_gemfs.c
+++ /dev/null
@@ -1,71 +0,0 @@
-// SPDX-License-Identifier: MIT
-/*
- * Copyright © 2017 Intel Corporation
- */
-
-#include <linux/fs.h>
-#include <linux/mount.h>
-#include <linux/fs_context.h>
-
-#include <drm/drm_print.h>
-
-#include "i915_drv.h"
-#include "i915_gemfs.h"
-#include "i915_utils.h"
-
-void i915_gemfs_init(struct drm_i915_private *i915)
-{
-	struct file_system_type *type;
-	struct fs_context *fc;
-	struct vfsmount *gemfs;
-	int ret;
-
-	/*
-	 * By creating our own shmemfs mountpoint, we can pass in
-	 * mount flags that better match our usecase.
-	 *
-	 * One example, although it is probably better with a per-file
-	 * control, is selecting huge page allocations ("huge=within_size").
-	 * However, we only do so on platforms which benefit from it, or to
-	 * offset the overhead of iommu lookups, where with latter it is a net
-	 * win even on platforms which would otherwise see some performance
-	 * regressions such a slow reads issue on Broadwell and Skylake.
-	 */
-
-	if (GRAPHICS_VER(i915) < 11 && !i915_vtd_active(i915))
-		return;
-
-	if (!IS_ENABLED(CONFIG_TRANSPARENT_HUGEPAGE))
-		goto err;
-
-	type = get_fs_type("tmpfs");
-	if (!type)
-		goto err;
-
-	fc = fs_context_for_mount(type, SB_KERNMOUNT);
-	if (IS_ERR(fc))
-		goto err;
-	ret = vfs_parse_fs_string(fc, "source", "tmpfs");
-	if (!ret)
-		ret = vfs_parse_fs_string(fc, "huge", "within_size");
-	if (!ret)
-		gemfs = fc_mount_longterm(fc);
-	put_fs_context(fc);
-	if (ret)
-		goto err;
-
-	i915->mm.gemfs = gemfs;
-	drm_info(&i915->drm, "Using Transparent Hugepages\n");
-	return;
-
-err:
-	drm_notice(&i915->drm,
-		   "Transparent Hugepage support is recommended for optimal performance%s\n",
-		   GRAPHICS_VER(i915) >= 11 ? " on this platform!" :
-					      " when IOMMU is enabled!");
-}
-
-void i915_gemfs_fini(struct drm_i915_private *i915)
-{
-	kern_unmount(i915->mm.gemfs);
-}
diff --git a/drivers/gpu/drm/i915/gem/i915_gemfs.h b/drivers/gpu/drm/i915/gem/i915_gemfs.h
deleted file mode 100644
index 16d4333c9a4e..000000000000
--- a/drivers/gpu/drm/i915/gem/i915_gemfs.h
+++ /dev/null
@@ -1,14 +0,0 @@
-/* SPDX-License-Identifier: MIT */
-/*
- * Copyright © 2017 Intel Corporation
- */
-
-#ifndef __I915_GEMFS_H__
-#define __I915_GEMFS_H__
-
-struct drm_i915_private;
-
-void i915_gemfs_init(struct drm_i915_private *i915);
-void i915_gemfs_fini(struct drm_i915_private *i915);
-
-#endif
diff --git a/drivers/gpu/drm/i915/gem/selftests/huge_pages.c b/drivers/gpu/drm/i915/gem/selftests/huge_pages.c
index bd08605a1611..2b9f7d86b46e 100644
--- a/drivers/gpu/drm/i915/gem/selftests/huge_pages.c
+++ b/drivers/gpu/drm/i915/gem/selftests/huge_pages.c
@@ -1316,7 +1316,7 @@ typedef struct drm_i915_gem_object *
 
 static inline bool igt_can_allocate_thp(struct drm_i915_private *i915)
 {
-	return i915->mm.gemfs && has_transparent_hugepage();
+	return drm_gem_has_huge_mnt(&i915->drm);
 }
 
 static struct drm_i915_gem_object *
@@ -1761,7 +1761,8 @@ static int igt_tmpfs_fallback(void *arg)
 	struct drm_i915_private *i915 = arg;
 	struct i915_address_space *vm;
 	struct i915_gem_context *ctx;
-	struct vfsmount *gemfs = i915->mm.gemfs;
+	struct vfsmount *huge_mnt =
+		drm_gem_has_huge_mnt(&i915->drm) ? i915->drm.huge_mnt : NULL;
 	struct drm_i915_gem_object *obj;
 	struct i915_vma *vma;
 	struct file *file;
@@ -1782,10 +1783,10 @@ static int igt_tmpfs_fallback(void *arg)
 	/*
 	 * Make sure that we don't burst into a ball of flames upon falling back
 	 * to tmpfs, which we rely on if on the off-chance we encounter a failure
-	 * when setting up gemfs.
+	 * when setting up a huge mountpoint.
 	 */
 
-	i915->mm.gemfs = NULL;
+	i915->drm.huge_mnt = NULL;
 
 	obj = i915_gem_object_create_shmem(i915, PAGE_SIZE);
 	if (IS_ERR(obj)) {
@@ -1819,7 +1820,7 @@ static int igt_tmpfs_fallback(void *arg)
 out_put:
 	i915_gem_object_put(obj);
 out_restore:
-	i915->mm.gemfs = gemfs;
+	i915->drm.huge_mnt = huge_mnt;
 
 	i915_vm_put(vm);
 out:
diff --git a/drivers/gpu/drm/i915/i915_drv.h b/drivers/gpu/drm/i915/i915_drv.h
index 95f9ddf22ce4..93a5af3de334 100644
--- a/drivers/gpu/drm/i915/i915_drv.h
+++ b/drivers/gpu/drm/i915/i915_drv.h
@@ -141,11 +141,6 @@ struct i915_gem_mm {
 	 */
 	atomic_t free_count;
 
-	/**
-	 * tmpfs instance used for shmem backed objects
-	 */
-	struct vfsmount *gemfs;
-
 	struct intel_memory_region *regions[INTEL_REGION_UNKNOWN];
 
 	struct notifier_block oom_notifier;
-- 
2.47.3

