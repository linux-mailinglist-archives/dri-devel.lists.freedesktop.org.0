Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E93CA88A350
	for <lists+dri-devel@lfdr.de>; Mon, 25 Mar 2024 14:57:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0625F10E8E7;
	Mon, 25 Mar 2024 13:57:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="e0BCroUO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com
 [46.235.227.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E959010E8E5
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Mar 2024 13:57:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1711375027;
 bh=uy1nPMkmLUlvTTkBwlaBAEAgHVx6PQ1PwpTwAVeF0hk=;
 h=From:To:Cc:Subject:Date:From;
 b=e0BCroUO/Wh7wjP4IROW1ddmvHDXGO9ni4xm/XjFskmBCxOGLhi3jWFg1A9v3BwUj
 VrhBm8we0tMluNRmbqB2GYt4kM76c0IxXgAaNy5GXXPzJXxlMo6s/EmEFRFepA6oB3
 Lc5Vy/lQe85WxJOZAbYl6n2yYWJfQuwRLv+rjk3ZRwTPEkfPwsWlp95TIL2pYCHXxV
 UIU2hQELkMSCWWbADR+W7XeRItU9wH1A1eFDHzbclTiOCHpKD/ioyRJRAcTjB/efXD
 anRjKB5w7q7SH2lC4sc4mYpIDAnk2FAKJWJK+Y4RfBNlhD5KNfpgDLNyaGSZAVvaj9
 XGXzJ6zWaYNIg==
Received: from localhost.localdomain (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by madrid.collaboradmins.com (Postfix) with ESMTPSA id D6D463782039;
 Mon, 25 Mar 2024 13:57:06 +0000 (UTC)
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 =?UTF-8?q?Adri=C3=A1n=20Larumbe?= <adrian.larumbe@collabora.com>
Cc: dri-devel@lists.freedesktop.org, kernel@collabora.com,
 "Lukas F . Hartmann" <lukas@mntmn.com>
Subject: [PATCH v2 1/3] drm/panthor: Fix IO-page mmap() for 32-bit userspace
 on 64-bit kernel
Date: Mon, 25 Mar 2024 14:57:03 +0100
Message-ID: <20240325135705.3717293-1-boris.brezillon@collabora.com>
X-Mailer: git-send-email 2.44.0
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

When mapping an IO region, the pseudo-file offset is dependent on the
userspace architecture. panthor_device_mmio_offset() abstracts that
away for us by turning a userspace MMIO offset into its kernel
equivalent, but we were not updating vm_area_struct::vm_pgoff
accordingly, leading us to attach the MMIO region to the wrong file
offset.

This has implications when we start mixing 64 bit and 32 bit apps, but
that's only really a problem when we start having more that 2^43 bytes of
memory allocated, which is very unlikely to happen.

What's more problematic is the fact this turns our
unmap_mapping_range(DRM_PANTHOR_USER_MMIO_OFFSET) calls, which are
supposed to kill the MMIO mapping when entering suspend, into NOPs.
Which means we either keep the dummy flush_id mapping active at all
times, or we risk a BUS_FAULT if the MMIO region was mapped, and the
GPU is suspended after that.

Solve that by patching vm_pgoff early in panthor_mmap(). With
this in place, we no longer need the panthor_device_mmio_offset()
helper.

v2:
- Kill panthor_device_mmio_offset()

Fixes: 5fe909cae118 ("drm/panthor: Add the device logical block")
Reported-by: Adrián Larumbe <adrian.larumbe@collabora.com>
Reported-by: Lukas F. Hartmann <lukas@mntmn.com>
Closes: https://gitlab.freedesktop.org/mesa/mesa/-/issues/10835
Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
Reviewed-by: Steven Price <steven.price@arm.com>
---
 drivers/gpu/drm/panthor/panthor_device.c |  8 ++++----
 drivers/gpu/drm/panthor/panthor_device.h | 24 ------------------------
 drivers/gpu/drm/panthor/panthor_drv.c    | 17 ++++++++++++++++-
 3 files changed, 20 insertions(+), 29 deletions(-)

diff --git a/drivers/gpu/drm/panthor/panthor_device.c b/drivers/gpu/drm/panthor/panthor_device.c
index bfe8da4a6e4c..3ddc4ba0acbe 100644
--- a/drivers/gpu/drm/panthor/panthor_device.c
+++ b/drivers/gpu/drm/panthor/panthor_device.c
@@ -334,7 +334,7 @@ static vm_fault_t panthor_mmio_vm_fault(struct vm_fault *vmf)
 {
 	struct vm_area_struct *vma = vmf->vma;
 	struct panthor_device *ptdev = vma->vm_private_data;
-	u64 id = (u64)vma->vm_pgoff << PAGE_SHIFT;
+	u64 offset = (u64)vma->vm_pgoff << PAGE_SHIFT;
 	unsigned long pfn;
 	pgprot_t pgprot;
 	vm_fault_t ret;
@@ -347,7 +347,7 @@ static vm_fault_t panthor_mmio_vm_fault(struct vm_fault *vmf)
 	mutex_lock(&ptdev->pm.mmio_lock);
 	active = atomic_read(&ptdev->pm.state) == PANTHOR_DEVICE_PM_STATE_ACTIVE;
 
-	switch (panthor_device_mmio_offset(id)) {
+	switch (offset) {
 	case DRM_PANTHOR_USER_FLUSH_ID_MMIO_OFFSET:
 		if (active)
 			pfn = __phys_to_pfn(ptdev->phys_addr + CSF_GPU_LATEST_FLUSH_ID);
@@ -378,9 +378,9 @@ static const struct vm_operations_struct panthor_mmio_vm_ops = {
 
 int panthor_device_mmap_io(struct panthor_device *ptdev, struct vm_area_struct *vma)
 {
-	u64 id = (u64)vma->vm_pgoff << PAGE_SHIFT;
+	u64 offset = (u64)vma->vm_pgoff << PAGE_SHIFT;
 
-	switch (panthor_device_mmio_offset(id)) {
+	switch (offset) {
 	case DRM_PANTHOR_USER_FLUSH_ID_MMIO_OFFSET:
 		if (vma->vm_end - vma->vm_start != PAGE_SIZE ||
 		    (vma->vm_flags & (VM_WRITE | VM_EXEC)))
diff --git a/drivers/gpu/drm/panthor/panthor_device.h b/drivers/gpu/drm/panthor/panthor_device.h
index 51c9d61b6796..7ee4987a3796 100644
--- a/drivers/gpu/drm/panthor/panthor_device.h
+++ b/drivers/gpu/drm/panthor/panthor_device.h
@@ -365,30 +365,6 @@ static int panthor_request_ ## __name ## _irq(struct panthor_device *ptdev,			\
 					 pirq);							\
 }
 
-/**
- * panthor_device_mmio_offset() - Turn a user MMIO offset into a kernel one
- * @offset: Offset to convert.
- *
- * With 32-bit systems being limited by the 32-bit representation of mmap2's
- * pgoffset field, we need to make the MMIO offset arch specific. This function
- * converts a user MMIO offset into something the kernel driver understands.
- *
- * If the kernel and userspace architecture match, the offset is unchanged. If
- * the kernel is 64-bit and userspace is 32-bit, the offset is adjusted to match
- * 64-bit offsets. 32-bit kernel with 64-bit userspace is impossible.
- *
- * Return: Adjusted offset.
- */
-static inline u64 panthor_device_mmio_offset(u64 offset)
-{
-#ifdef CONFIG_ARM64
-	if (test_tsk_thread_flag(current, TIF_32BIT))
-		offset += DRM_PANTHOR_USER_MMIO_OFFSET_64BIT - DRM_PANTHOR_USER_MMIO_OFFSET_32BIT;
-#endif
-
-	return offset;
-}
-
 extern struct workqueue_struct *panthor_cleanup_wq;
 
 #endif
diff --git a/drivers/gpu/drm/panthor/panthor_drv.c b/drivers/gpu/drm/panthor/panthor_drv.c
index ff484506229f..0097a01d0fc7 100644
--- a/drivers/gpu/drm/panthor/panthor_drv.c
+++ b/drivers/gpu/drm/panthor/panthor_drv.c
@@ -1327,7 +1327,22 @@ static int panthor_mmap(struct file *filp, struct vm_area_struct *vma)
 	if (!drm_dev_enter(file->minor->dev, &cookie))
 		return -ENODEV;
 
-	if (panthor_device_mmio_offset(offset) >= DRM_PANTHOR_USER_MMIO_OFFSET)
+#ifdef CONFIG_ARM64
+	/*
+	 * With 32-bit systems being limited by the 32-bit representation of
+	 * mmap2's pgoffset field, we need to make the MMIO offset arch
+	 * specific. This converts a user MMIO offset into something the kernel
+	 * driver understands.
+	 */
+	if (test_tsk_thread_flag(current, TIF_32BIT) &&
+	    offset >= DRM_PANTHOR_USER_MMIO_OFFSET_32BIT) {
+		offset += DRM_PANTHOR_USER_MMIO_OFFSET_64BIT -
+			  DRM_PANTHOR_USER_MMIO_OFFSET_32BIT;
+		vma->vm_pgoff = offset >> PAGE_SHIFT;
+	}
+#endif
+
+	if (offset >= DRM_PANTHOR_USER_MMIO_OFFSET)
 		ret = panthor_device_mmap_io(ptdev, vma);
 	else
 		ret = drm_gem_mmap(filp, vma);
-- 
2.44.0

