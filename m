Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D0A9A918C0
	for <lists+dri-devel@lfdr.de>; Thu, 17 Apr 2025 12:05:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7647110E1CB;
	Thu, 17 Apr 2025 10:05:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="bYx4QTst";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CBAA610EA8F
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Apr 2025 10:05:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1744884306;
 bh=Qhc9ZOj4gmEf9fwj4K+k3QM2R8aZrp8df9C5zzHObKw=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=bYx4QTstOYM+uRzNvfTyP0vj8f4h+/MNmFNx2WYE0xK0qEnTl/DT0IOm+BEtW0/3Y
 NCuzx5gHMSYzY9jYL9J6CMEVPQXynXZf2tzq33QtYaNCwekgTfjagelzhs2mRRq76Q
 otbue3NdOLFt9HK3UzPn04meMJKyRYXG0825R6OtyNYj9gjd3IY0xSCtdpRjyGlEXA
 L2MRiYKYtGQCRV5eJMgZw8yuF50oCwZD/JpoOgDlXGG6LUw1JNcxIpgwzi0g+X+Ua7
 ANe2RHV7LJ6HhEvLz3PPsoHvjcGEEzvoCjJcJQ9PePxn0tkxZUTj4lww+4ABKHAndg
 ENeiu7gnZ9lQw==
Received: from localhost.localdomain (unknown
 [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 6062917E153D;
 Thu, 17 Apr 2025 12:05:06 +0200 (CEST)
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 =?UTF-8?q?Adri=C3=A1n=20Larumbe?= <adrian.larumbe@collabora.com>
Cc: dri-devel@lists.freedesktop.org,
	kernel@collabora.com
Subject: [PATCH 2/2] drm/panthor: Fix the user MMIO offset logic for emulators
Date: Thu, 17 Apr 2025 12:05:03 +0200
Message-ID: <20250417100503.3478405-3-boris.brezillon@collabora.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250417100503.3478405-1-boris.brezillon@collabora.com>
References: <20250417100503.3478405-1-boris.brezillon@collabora.com>
MIME-Version: 1.0
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

Currently, we pick the MMIO offset based on the size of the pgoff_t
type seen by the process that manipulates the FD, such that a 32-bit
process can always map the user MMIO ranges. But this approach doesn't
work well for emulators like FEX, where the emulator is a 64-bit binary
which might be executing 32-bit code. In that case, the kernel thinks
it's the 64-bit process and assumes DRM_PANTHOR_USER_MMIO_OFFSET_64BIT
is in use, but the UMD library expects DRM_PANTHOR_USER_MMIO_OFFSET_32BIT,
because it can't mmap() anything above the pgoff_t size.

In order to solve that, we need a way to explicitly set the user MMIO
offset from the UMD, such that the kernel doesn't have to guess it
from the TIF_32BIT flag set on user thread. We keep the old behavior
if DRM_PANTHOR_SET_USER_MMIO_OFFSET is never called.

Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
---
 drivers/gpu/drm/panthor/panthor_device.h | 18 +++++++
 drivers/gpu/drm/panthor/panthor_drv.c    | 60 +++++++++++++++++++-----
 include/uapi/drm/panthor_drm.h           | 32 +++++++++++++
 3 files changed, 97 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/panthor/panthor_device.h b/drivers/gpu/drm/panthor/panthor_device.h
index 4c27b6d85f46..b97aba89132a 100644
--- a/drivers/gpu/drm/panthor/panthor_device.h
+++ b/drivers/gpu/drm/panthor/panthor_device.h
@@ -10,6 +10,7 @@
 #include <linux/io-pgtable.h>
 #include <linux/regulator/consumer.h>
 #include <linux/pm_runtime.h>
+#include <linux/rwsem.h>
 #include <linux/sched.h>
 #include <linux/spinlock.h>
 
@@ -219,6 +220,23 @@ struct panthor_file {
 	/** @ptdev: Device attached to this file. */
 	struct panthor_device *ptdev;
 
+	/** @user_mmio: User MMIO related fields. */
+	struct {
+		/** @offset: Offset used for user MMIO mappings. */
+		u64 offset;
+
+		/**
+		 * @offset_immutable: True if the user MMIO offset became immutable.
+		 *
+		 * Set to true after the first mmap() targeting a page in the user MMIO range.
+		 * After this point, the user MMIO offset can't be changed.
+		 */
+		bool offset_immutable;
+
+		/** @offset_lock: Lock used to protect offset changes. */
+		struct rw_semaphore offset_lock;
+	} user_mmio;
+
 	/** @vms: VM pool attached to this file. */
 	struct panthor_vm_pool *vms;
 
diff --git a/drivers/gpu/drm/panthor/panthor_drv.c b/drivers/gpu/drm/panthor/panthor_drv.c
index 7cd131af340d..6a8931492536 100644
--- a/drivers/gpu/drm/panthor/panthor_drv.c
+++ b/drivers/gpu/drm/panthor/panthor_drv.c
@@ -1336,6 +1336,29 @@ static int panthor_ioctl_vm_get_state(struct drm_device *ddev, void *data,
 	return 0;
 }
 
+static int panthor_ioctl_set_user_mmio_offset(struct drm_device *ddev,
+					      void *data, struct drm_file *file)
+{
+	struct drm_panthor_set_user_mmio_offset *args = data;
+	struct panthor_file *pfile = file->driver_priv;
+	int ret;
+
+	if (args->offset != DRM_PANTHOR_USER_MMIO_OFFSET_32BIT &&
+	    args->offset != DRM_PANTHOR_USER_MMIO_OFFSET_64BIT)
+		return -EINVAL;
+
+	down_write(&pfile->user_mmio.offset_lock);
+	if (pfile->user_mmio.offset_immutable) {
+		ret = pfile->user_mmio.offset != args->offset ? -EINVAL : 0;
+	} else {
+		pfile->user_mmio.offset = args->offset;
+		ret = 0;
+	}
+	up_write(&pfile->user_mmio.offset_lock);
+
+	return ret;
+}
+
 static int
 panthor_open(struct drm_device *ddev, struct drm_file *file)
 {
@@ -1353,6 +1376,19 @@ panthor_open(struct drm_device *ddev, struct drm_file *file)
 	}
 
 	pfile->ptdev = ptdev;
+	init_rwsem(&pfile->user_mmio.offset_lock);
+	pfile->user_mmio.offset = DRM_PANTHOR_USER_MMIO_OFFSET;
+
+#ifdef CONFIG_ARM64
+	/*
+	 * With 32-bit systems being limited by the 32-bit representation of
+	 * mmap2's pgoffset field, we need to make the MMIO offset arch
+	 * specific.
+	 */
+	if (test_tsk_thread_flag(current, TIF_32BIT))
+		pfile->user_mmio.offset = DRM_PANTHOR_USER_MMIO_OFFSET_32BIT;
+#endif
+
 
 	ret = panthor_vm_pool_create(pfile);
 	if (ret)
@@ -1405,6 +1441,7 @@ static const struct drm_ioctl_desc panthor_drm_driver_ioctls[] = {
 	PANTHOR_IOCTL(TILER_HEAP_CREATE, tiler_heap_create, DRM_RENDER_ALLOW),
 	PANTHOR_IOCTL(TILER_HEAP_DESTROY, tiler_heap_destroy, DRM_RENDER_ALLOW),
 	PANTHOR_IOCTL(GROUP_SUBMIT, group_submit, DRM_RENDER_ALLOW),
+	PANTHOR_IOCTL(SET_USER_MMIO_OFFSET, set_user_mmio_offset, DRM_RENDER_ALLOW),
 };
 
 static int panthor_mmap(struct file *filp, struct vm_area_struct *vma)
@@ -1418,20 +1455,16 @@ static int panthor_mmap(struct file *filp, struct vm_area_struct *vma)
 	if (!drm_dev_enter(file->minor->dev, &cookie))
 		return -ENODEV;
 
-#ifdef CONFIG_ARM64
-	/*
-	 * With 32-bit systems being limited by the 32-bit representation of
-	 * mmap2's pgoffset field, we need to make the MMIO offset arch
-	 * specific. This converts a user MMIO offset into something the kernel
-	 * driver understands.
-	 */
-	if (test_tsk_thread_flag(current, TIF_32BIT) &&
-	    offset >= DRM_PANTHOR_USER_MMIO_OFFSET_32BIT) {
-		offset += DRM_PANTHOR_USER_MMIO_OFFSET_64BIT -
-			  DRM_PANTHOR_USER_MMIO_OFFSET_32BIT;
+	/* Adjust the user MMIO to match the offset used kernel side. */
+	down_read(&pfile->user_mmio.offset_lock);
+	if (offset >= pfile->user_mmio.offset &&
+	    pfile->user_mmio.offset != DRM_PANTHOR_USER_MMIO_OFFSET) {
+		offset -= pfile->user_mmio.offset;
+		offset += DRM_PANTHOR_USER_MMIO_OFFSET;
 		vma->vm_pgoff = offset >> PAGE_SHIFT;
+		pfile->user_mmio.offset_immutable = true;
 	}
-#endif
+	up_read(&pfile->user_mmio.offset_lock);
 
 	if (offset >= DRM_PANTHOR_USER_MMIO_OFFSET)
 		ret = panthor_device_mmap_io(ptdev, vma);
@@ -1514,6 +1547,7 @@ static void panthor_debugfs_init(struct drm_minor *minor)
  * - 1.2 - adds DEV_QUERY_GROUP_PRIORITIES_INFO query
  *       - adds PANTHOR_GROUP_PRIORITY_REALTIME priority
  * - 1.3 - adds DRM_PANTHOR_GROUP_STATE_INNOCENT flag
+ * - 1.4 - adds DRM_PANTHOR_SET_USER_MMIO_OFFSET ioctl
  */
 static const struct drm_driver panthor_drm_driver = {
 	.driver_features = DRIVER_RENDER | DRIVER_GEM | DRIVER_SYNCOBJ |
@@ -1527,7 +1561,7 @@ static const struct drm_driver panthor_drm_driver = {
 	.name = "panthor",
 	.desc = "Panthor DRM driver",
 	.major = 1,
-	.minor = 3,
+	.minor = 4,
 
 	.gem_create_object = panthor_gem_create_object,
 	.gem_prime_import_sg_table = drm_gem_shmem_prime_import_sg_table,
diff --git a/include/uapi/drm/panthor_drm.h b/include/uapi/drm/panthor_drm.h
index 1379a2d4548c..2a16ca86113c 100644
--- a/include/uapi/drm/panthor_drm.h
+++ b/include/uapi/drm/panthor_drm.h
@@ -127,6 +127,20 @@ enum drm_panthor_ioctl_id {
 
 	/** @DRM_PANTHOR_TILER_HEAP_DESTROY: Destroy a tiler heap. */
 	DRM_PANTHOR_TILER_HEAP_DESTROY,
+
+	/**
+	 * @DRM_PANTHOR_SET_USER_MMIO_OFFSET: Set the offset to use as the user MMIO offset.
+	 *
+	 * The default behavior is to pick the MMIO offset based on the size of the pgoff_t
+	 * type seen by the process that manipulates the FD, such that a 32-bit process can
+	 * always map the user MMIO ranges. But this approach doesn't work well for emulators
+	 * like FEX, where the emulator is an 64-bit binary which might be executing 32-bit
+	 * code. In that case, the kernel thinks it's the 64-bit process and assumes
+	 * DRM_PANTHOR_USER_MMIO_OFFSET_64BIT is in use, but the UMD library expects
+	 * DRM_PANTHOR_USER_MMIO_OFFSET_32BIT, because it can't mmap() anything above the
+	 * pgoff_t size.
+	 */
+	DRM_PANTHOR_SET_USER_MMIO_OFFSET,
 };
 
 /**
@@ -989,6 +1003,22 @@ struct drm_panthor_tiler_heap_destroy {
 	__u32 pad;
 };
 
+/**
+ * struct drm_panthor_set_user_mmio_offset - Arguments passed to
+ * DRM_IOCTL_PANTHOR_SET_USER_MMIO_OFFSET
+ */
+struct drm_panthor_set_user_mmio_offset {
+	/**
+	 * @offset: User MMIO offset to use.
+	 *
+	 * Must be either DRM_PANTHOR_USER_MMIO_OFFSET_32BIT or
+	 * DRM_PANTHOR_USER_MMIO_OFFSET_64BIT. The common use case is to pass
+	 * DRM_PANTHOR_USER_MMIO_OFFSET which picks the right value based on the size of
+	 * pgoff_t (AKA unsigned long).
+	 */
+	__u64 offset;
+};
+
 /**
  * DRM_IOCTL_PANTHOR() - Build a Panthor IOCTL number
  * @__access: Access type. Must be R, W or RW.
@@ -1031,6 +1061,8 @@ enum {
 		DRM_IOCTL_PANTHOR(WR, TILER_HEAP_CREATE, tiler_heap_create),
 	DRM_IOCTL_PANTHOR_TILER_HEAP_DESTROY =
 		DRM_IOCTL_PANTHOR(WR, TILER_HEAP_DESTROY, tiler_heap_destroy),
+	DRM_IOCTL_PANTHOR_SET_USER_MMIO_OFFSET =
+		DRM_IOCTL_PANTHOR(WR, SET_USER_MMIO_OFFSET, set_user_mmio_offset),
 };
 
 #if defined(__cplusplus)
-- 
2.49.0

