Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 61EA2ACFDF8
	for <lists+dri-devel@lfdr.de>; Fri,  6 Jun 2025 10:09:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A6EC10E96E;
	Fri,  6 Jun 2025 08:09:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="lAwmhdXK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ACBCB10E96E
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Jun 2025 08:09:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1749197375;
 bh=xEwpQb5kbhAQP5+H55Th/V0xxuI2Luu4cHVs8opXa8Q=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=lAwmhdXKuFjhzrOqMlrUx3/fI/E7WBMNcpJDnVqoqgNiGaSuoLqEFvyJDEY+wa3wf
 yW5aKSvkt/WOWC5oYJE/N3MCVOm9Hp4LAjQR941iHcuq/t/tExj1Nkj6uFt5pe8vB8
 cVusin0J/DJhrnl3NuZZuTALA/oEkXnqnROA/czEpPru4S9pvUD2pbYVqBSRBVKcqY
 XFyMhseCTv00yBwLhLNCXin0E3Yta3LUmH39XU4Cw85KX40gMRF2aeaa1/8/JmExBk
 7fIzFc5baK+Dy5L/DCUQ6k7dcw5KKNtcUBm+T/f1WJ9wXNe9N6M/Mz5HLiXSe6iOuD
 kP3J3WtoZDo4A==
Received: from localhost.localdomain (unknown
 [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 86A5317E04D6;
 Fri,  6 Jun 2025 10:09:35 +0200 (CEST)
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 =?UTF-8?q?Adri=C3=A1n=20Larumbe?= <adrian.larumbe@collabora.com>
Cc: dri-devel@lists.freedesktop.org,
	kernel@collabora.com
Subject: [PATCH v3 2/2] drm/panthor: Fix the user MMIO offset logic for
 emulators
Date: Fri,  6 Jun 2025 10:09:32 +0200
Message-ID: <20250606080932.4140010-3-boris.brezillon@collabora.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250606080932.4140010-1-boris.brezillon@collabora.com>
References: <20250606080932.4140010-1-boris.brezillon@collabora.com>
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

Changes in v2:
- Drop the lock/immutable fields and allow SET_USER_MMIO_OFFSET
  requests to race with mmap() requests
- Don't do the is_user_mmio_offset test twice in panthor_mmap()
- Improve the uAPI docs

Changes in v3:
- Bump to version 1.5 instead of 1.4 after rebasing
- Add R-bs
- Fix/rephrase comment as suggested by Liviu

Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
Reviewed-by: Adrián Larumbe <adrian.larumbe@collabora.com>
Reviewed-by: Steven Price <steven.price@arm.com>
Reviewed-by: Liviu Dudau <liviu.dudau@arm.com>
---
 drivers/gpu/drm/panthor/panthor_device.h | 18 ++++++++
 drivers/gpu/drm/panthor/panthor_drv.c    | 56 +++++++++++++++++-------
 include/uapi/drm/panthor_drm.h           | 38 ++++++++++++++++
 3 files changed, 96 insertions(+), 16 deletions(-)

diff --git a/drivers/gpu/drm/panthor/panthor_device.h b/drivers/gpu/drm/panthor/panthor_device.h
index 465d3ab1b79e..a4ce2a4c626d 100644
--- a/drivers/gpu/drm/panthor/panthor_device.h
+++ b/drivers/gpu/drm/panthor/panthor_device.h
@@ -230,6 +230,24 @@ struct panthor_file {
 	/** @ptdev: Device attached to this file. */
 	struct panthor_device *ptdev;
 
+	/** @user_mmio: User MMIO related fields. */
+	struct {
+		/**
+		 * @offset: Offset used for user MMIO mappings.
+		 *
+		 * This offset should not be used to check the type of mapping
+		 * except in panthor_mmap(). After that point, MMIO mapping
+		 * offsets have been adjusted to match
+		 * DRM_PANTHOR_USER_MMIO_OFFSET and that macro should be used
+		 * instead.
+		 * Make sure this rule is followed at all times, because
+		 * userspace is in control of the offset, and can change the
+		 * value behind our back. Otherwise it can lead to erroneous
+		 * branching happening in kernel space.
+		 */
+		u64 offset;
+	} user_mmio;
+
 	/** @vms: VM pool attached to this file. */
 	struct panthor_vm_pool *vms;
 
diff --git a/drivers/gpu/drm/panthor/panthor_drv.c b/drivers/gpu/drm/panthor/panthor_drv.c
index 229b9190f152..3b4c35ce4461 100644
--- a/drivers/gpu/drm/panthor/panthor_drv.c
+++ b/drivers/gpu/drm/panthor/panthor_drv.c
@@ -1379,6 +1379,20 @@ static int panthor_ioctl_bo_set_label(struct drm_device *ddev, void *data,
 	return ret;
 }
 
+static int panthor_ioctl_set_user_mmio_offset(struct drm_device *ddev,
+					      void *data, struct drm_file *file)
+{
+	struct drm_panthor_set_user_mmio_offset *args = data;
+	struct panthor_file *pfile = file->driver_priv;
+
+	if (args->offset != DRM_PANTHOR_USER_MMIO_OFFSET_32BIT &&
+	    args->offset != DRM_PANTHOR_USER_MMIO_OFFSET_64BIT)
+		return -EINVAL;
+
+	WRITE_ONCE(pfile->user_mmio.offset, args->offset);
+	return 0;
+}
+
 static int
 panthor_open(struct drm_device *ddev, struct drm_file *file)
 {
@@ -1396,6 +1410,18 @@ panthor_open(struct drm_device *ddev, struct drm_file *file)
 	}
 
 	pfile->ptdev = ptdev;
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
@@ -1449,6 +1475,7 @@ static const struct drm_ioctl_desc panthor_drm_driver_ioctls[] = {
 	PANTHOR_IOCTL(TILER_HEAP_DESTROY, tiler_heap_destroy, DRM_RENDER_ALLOW),
 	PANTHOR_IOCTL(GROUP_SUBMIT, group_submit, DRM_RENDER_ALLOW),
 	PANTHOR_IOCTL(BO_SET_LABEL, bo_set_label, DRM_RENDER_ALLOW),
+	PANTHOR_IOCTL(SET_USER_MMIO_OFFSET, set_user_mmio_offset, DRM_RENDER_ALLOW),
 };
 
 static int panthor_mmap(struct file *filp, struct vm_area_struct *vma)
@@ -1457,30 +1484,26 @@ static int panthor_mmap(struct file *filp, struct vm_area_struct *vma)
 	struct panthor_file *pfile = file->driver_priv;
 	struct panthor_device *ptdev = pfile->ptdev;
 	u64 offset = (u64)vma->vm_pgoff << PAGE_SHIFT;
+	u64 user_mmio_offset;
 	int ret, cookie;
 
 	if (!drm_dev_enter(file->minor->dev, &cookie))
 		return -ENODEV;
 
-#ifdef CONFIG_ARM64
-	/*
-	 * With 32-bit systems being limited by the 32-bit representation of
-	 * mmap2's pgoffset field, we need to make the MMIO offset arch
-	 * specific. This converts a user MMIO offset into something the kernel
-	 * driver understands.
+	/* Adjust the user MMIO offset to match the offset used kernel side.
+	 * We use a local variable with a READ_ONCE() here to make sure
+	 * the user_mmio_offset we use for the is_user_mmio_mapping() check
+	 * hasn't changed when we do the offset adjustment.
 	 */
-	if (test_tsk_thread_flag(current, TIF_32BIT) &&
-	    offset >= DRM_PANTHOR_USER_MMIO_OFFSET_32BIT) {
-		offset += DRM_PANTHOR_USER_MMIO_OFFSET_64BIT -
-			  DRM_PANTHOR_USER_MMIO_OFFSET_32BIT;
+	user_mmio_offset = READ_ONCE(pfile->user_mmio.offset);
+	if (offset >= user_mmio_offset) {
+		offset -= user_mmio_offset;
+		offset += DRM_PANTHOR_USER_MMIO_OFFSET;
 		vma->vm_pgoff = offset >> PAGE_SHIFT;
-	}
-#endif
-
-	if (offset >= DRM_PANTHOR_USER_MMIO_OFFSET)
 		ret = panthor_device_mmap_io(ptdev, vma);
-	else
+	} else {
 		ret = drm_gem_mmap(filp, vma);
+	}
 
 	drm_dev_exit(cookie);
 	return ret;
@@ -1584,6 +1607,7 @@ static void panthor_debugfs_init(struct drm_minor *minor)
  *       - adds PANTHOR_GROUP_PRIORITY_REALTIME priority
  * - 1.3 - adds DRM_PANTHOR_GROUP_STATE_INNOCENT flag
  * - 1.4 - adds DRM_IOCTL_PANTHOR_BO_SET_LABEL ioctl
+ * - 1.5 - adds DRM_PANTHOR_SET_USER_MMIO_OFFSET ioctl
  */
 static const struct drm_driver panthor_drm_driver = {
 	.driver_features = DRIVER_RENDER | DRIVER_GEM | DRIVER_SYNCOBJ |
@@ -1597,7 +1621,7 @@ static const struct drm_driver panthor_drm_driver = {
 	.name = "panthor",
 	.desc = "Panthor DRM driver",
 	.major = 1,
-	.minor = 4,
+	.minor = 5,
 
 	.gem_create_object = panthor_gem_create_object,
 	.gem_prime_import_sg_table = drm_gem_shmem_prime_import_sg_table,
diff --git a/include/uapi/drm/panthor_drm.h b/include/uapi/drm/panthor_drm.h
index 3a76c4f2882b..e1f43deb7eca 100644
--- a/include/uapi/drm/panthor_drm.h
+++ b/include/uapi/drm/panthor_drm.h
@@ -130,6 +130,20 @@ enum drm_panthor_ioctl_id {
 
 	/** @DRM_PANTHOR_BO_SET_LABEL: Label a BO. */
 	DRM_PANTHOR_BO_SET_LABEL,
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
@@ -1001,6 +1015,28 @@ struct drm_panthor_bo_set_label {
 	__u64 label;
 };
 
+/**
+ * struct drm_panthor_set_user_mmio_offset - Arguments passed to
+ * DRM_IOCTL_PANTHOR_SET_USER_MMIO_OFFSET
+ *
+ * This ioctl is only really useful if you want to support userspace
+ * CPU emulation environments where the size of an unsigned long differs
+ * between the host and the guest architectures.
+ */
+struct drm_panthor_set_user_mmio_offset {
+	/**
+	 * @offset: User MMIO offset to use.
+	 *
+	 * Must be either DRM_PANTHOR_USER_MMIO_OFFSET_32BIT or
+	 * DRM_PANTHOR_USER_MMIO_OFFSET_64BIT.
+	 *
+	 * Use DRM_PANTHOR_USER_MMIO_OFFSET (which selects OFFSET_32BIT or
+	 * OFFSET_64BIT based on the size of an unsigned long) unless you
+	 * have a very good reason to overrule this decision.
+	 */
+	__u64 offset;
+};
+
 /**
  * DRM_IOCTL_PANTHOR() - Build a Panthor IOCTL number
  * @__access: Access type. Must be R, W or RW.
@@ -1045,6 +1081,8 @@ enum {
 		DRM_IOCTL_PANTHOR(WR, TILER_HEAP_DESTROY, tiler_heap_destroy),
 	DRM_IOCTL_PANTHOR_BO_SET_LABEL =
 		DRM_IOCTL_PANTHOR(WR, BO_SET_LABEL, bo_set_label),
+	DRM_IOCTL_PANTHOR_SET_USER_MMIO_OFFSET =
+		DRM_IOCTL_PANTHOR(WR, SET_USER_MMIO_OFFSET, set_user_mmio_offset),
 };
 
 #if defined(__cplusplus)
-- 
2.49.0

