Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 81D418B4BCC
	for <lists+dri-devel@lfdr.de>; Sun, 28 Apr 2024 14:45:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9311410FC2A;
	Sun, 28 Apr 2024 12:45:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="q+1pzHDT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD5FC10FDED
 for <dri-devel@lists.freedesktop.org>; Sun, 28 Apr 2024 12:45:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=mNCfZw90E+2JPSspHAw1mifas9noxXLYvC102XmXawk=; b=q+1pzHDTRNwqAUvCutFtGPYPdy
 p8PGlPBpqkG3P0oTROXGYzz6xN9ZUPt34cys6lh4S8BDujSXTi0y3HHV5IK9/qpiBjr5KxHq3jbZj
 Lo2wHBYM49bYDHHhiK7HdMUh+LFpCcZcLfc+5qK3GQkCTTfCRYaM1FJ224jVdQsTw+DzxPVV3IVM/
 ijJpJc3Skb2Mu5tAksxPSC4o1Mrpi7WuJp0rd1VCrq6i0Euf2pVGCg7zR8AyqPt90kuE8LyDjdVRk
 WVuRGz9qc64OFhj3ZhOCaFCnh/O0/j5MNQOtA46jwCehjXXNtAw5oapp22ndldJrE4R0EVBP7wtfN
 QzRkpadA==;
Received: from [179.234.232.152] (helo=morissey..)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1s13tu-000rbP-6p; Sun, 28 Apr 2024 14:45:02 +0200
From: =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>
To: Melissa Wen <mwen@igalia.com>, Iago Toral <itoral@igalia.com>,
 Tvrtko Ursulin <tursulin@igalia.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, kernel-dev@igalia.com,
 =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>
Subject: [PATCH v4 3/8] drm/v3d: Introduce gemfs
Date: Sun, 28 Apr 2024 09:40:08 -0300
Message-ID: <20240428124426.309096-4-mcanal@igalia.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240428124426.309096-1-mcanal@igalia.com>
References: <20240428124426.309096-1-mcanal@igalia.com>
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

Create a separate "tmpfs" kernel mount for V3D. This will allow us to
move away from the shmemfs `shm_mnt` and gives the flexibility to do
things like set our own mount options. Here, the interest is to use
"huge=", which should allow us to enable the use of THP for our
shmem-backed objects.

Signed-off-by: Maíra Canal <mcanal@igalia.com>
Reviewed-by: Iago Toral Quiroga <itoral@igalia.com>
---
 drivers/gpu/drm/v3d/Makefile    |  3 ++-
 drivers/gpu/drm/v3d/v3d_drv.h   |  9 +++++++
 drivers/gpu/drm/v3d/v3d_gem.c   |  3 +++
 drivers/gpu/drm/v3d/v3d_gemfs.c | 46 +++++++++++++++++++++++++++++++++
 4 files changed, 60 insertions(+), 1 deletion(-)
 create mode 100644 drivers/gpu/drm/v3d/v3d_gemfs.c

diff --git a/drivers/gpu/drm/v3d/Makefile b/drivers/gpu/drm/v3d/Makefile
index b7d673f1153b..fcf710926057 100644
--- a/drivers/gpu/drm/v3d/Makefile
+++ b/drivers/gpu/drm/v3d/Makefile
@@ -13,7 +13,8 @@ v3d-y := \
 	v3d_trace_points.o \
 	v3d_sched.o \
 	v3d_sysfs.o \
-	v3d_submit.o
+	v3d_submit.o \
+	v3d_gemfs.o
 
 v3d-$(CONFIG_DEBUG_FS) += v3d_debugfs.o
 
diff --git a/drivers/gpu/drm/v3d/v3d_drv.h b/drivers/gpu/drm/v3d/v3d_drv.h
index a2c516fe6d79..cef2f82b7a75 100644
--- a/drivers/gpu/drm/v3d/v3d_drv.h
+++ b/drivers/gpu/drm/v3d/v3d_drv.h
@@ -131,6 +131,11 @@ struct v3d_dev {
 	struct drm_mm mm;
 	spinlock_t mm_lock;
 
+	/*
+	 * tmpfs instance used for shmem backed objects
+	 */
+	struct vfsmount *gemfs;
+
 	struct work_struct overflow_mem_work;
 
 	struct v3d_bin_job *bin_job;
@@ -532,6 +537,10 @@ void v3d_reset(struct v3d_dev *v3d);
 void v3d_invalidate_caches(struct v3d_dev *v3d);
 void v3d_clean_caches(struct v3d_dev *v3d);
 
+/* v3d_gemfs.c */
+void v3d_gemfs_init(struct v3d_dev *v3d);
+void v3d_gemfs_fini(struct v3d_dev *v3d);
+
 /* v3d_submit.c */
 void v3d_job_cleanup(struct v3d_job *job);
 void v3d_job_put(struct v3d_job *job);
diff --git a/drivers/gpu/drm/v3d/v3d_gem.c b/drivers/gpu/drm/v3d/v3d_gem.c
index b3b76332f2c5..b1e681630ded 100644
--- a/drivers/gpu/drm/v3d/v3d_gem.c
+++ b/drivers/gpu/drm/v3d/v3d_gem.c
@@ -288,6 +288,8 @@ v3d_gem_init(struct drm_device *dev)
 	v3d_init_hw_state(v3d);
 	v3d_mmu_set_page_table(v3d);
 
+	v3d_gemfs_init(v3d);
+
 	ret = v3d_sched_init(v3d);
 	if (ret) {
 		drm_mm_takedown(&v3d->mm);
@@ -305,6 +307,7 @@ v3d_gem_destroy(struct drm_device *dev)
 	struct v3d_dev *v3d = to_v3d_dev(dev);
 
 	v3d_sched_fini(v3d);
+	v3d_gemfs_fini(v3d);
 
 	/* Waiting for jobs to finish would need to be done before
 	 * unregistering V3D.
diff --git a/drivers/gpu/drm/v3d/v3d_gemfs.c b/drivers/gpu/drm/v3d/v3d_gemfs.c
new file mode 100644
index 000000000000..31cf5bd11e39
--- /dev/null
+++ b/drivers/gpu/drm/v3d/v3d_gemfs.c
@@ -0,0 +1,46 @@
+// SPDX-License-Identifier: GPL-2.0+
+/* Copyright (C) 2024 Raspberry Pi */
+
+#include <linux/fs.h>
+#include <linux/mount.h>
+
+#include "v3d_drv.h"
+
+void v3d_gemfs_init(struct v3d_dev *v3d)
+{
+	char huge_opt[] = "huge=within_size";
+	struct file_system_type *type;
+	struct vfsmount *gemfs;
+
+	/*
+	 * By creating our own shmemfs mountpoint, we can pass in
+	 * mount flags that better match our usecase. However, we
+	 * only do so on platforms which benefit from it.
+	 */
+	if (!IS_ENABLED(CONFIG_TRANSPARENT_HUGEPAGE))
+		goto err;
+
+	type = get_fs_type("tmpfs");
+	if (!type)
+		goto err;
+
+	gemfs = vfs_kern_mount(type, SB_KERNMOUNT, type->name, huge_opt);
+	if (IS_ERR(gemfs))
+		goto err;
+
+	v3d->gemfs = gemfs;
+	drm_info(&v3d->drm, "Using Transparent Hugepages\n");
+
+	return;
+
+err:
+	v3d->gemfs = NULL;
+	drm_notice(&v3d->drm,
+		   "Transparent Hugepage support is recommended for optimal performance on this platform!\n");
+}
+
+void v3d_gemfs_fini(struct v3d_dev *v3d)
+{
+	if (v3d->gemfs)
+		kern_unmount(v3d->gemfs);
+}
-- 
2.44.0

