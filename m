Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D5B5C889C2D
	for <lists+dri-devel@lfdr.de>; Mon, 25 Mar 2024 12:12:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 52B7C10E4D3;
	Mon, 25 Mar 2024 11:12:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 4900610E4D3
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Mar 2024 11:12:39 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 59BE61FB;
 Mon, 25 Mar 2024 04:13:12 -0700 (PDT)
Received: from [10.57.15.178] (unknown [10.57.15.178])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 94C5D3F67D;
 Mon, 25 Mar 2024 04:12:37 -0700 (PDT)
Message-ID: <12e77fa0-ba68-4e6f-8683-69c29b2495f2@arm.com>
Date: Mon, 25 Mar 2024 11:12:40 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] drm/panthor: Fix IO-page mmap() for 32-bit userspace
 on 64-bit kernel
Content-Language: en-GB
To: Boris Brezillon <boris.brezillon@collabora.com>,
 Liviu Dudau <liviu.dudau@arm.com>,
 =?UTF-8?Q?Adri=C3=A1n_Larumbe?= <adrian.larumbe@collabora.com>
Cc: dri-devel@lists.freedesktop.org, kernel@collabora.com,
 "Lukas F . Hartmann" <lukas@mntmn.com>
References: <20240325104111.3553712-1-boris.brezillon@collabora.com>
From: Steven Price <steven.price@arm.com>
In-Reply-To: <20240325104111.3553712-1-boris.brezillon@collabora.com>
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

On 25/03/2024 10:41, Boris Brezillon wrote:
> When mapping an IO region, the pseudo-file offset is dependent on the
> userspace architecture. panthor_device_mmio_offset() abstract that away
> for us by turning a userspace MMIO offset into its kernel equivalent,
> but we were not updating vm_area_struct::vm_pgoff accordingly, leading
> us to attach the MMIO region to the wrong file offset.
> 
> This has implications when we start mixing 64 bit and 32 bit apps, but
> that's only really a problem when we start having more that 2^43 bytes of
> memory allocated, which is very unlikely to happen.
> 
> What's more problematic is the fact this turns our
> unmap_mapping_range(DRM_PANTHOR_USER_MMIO_OFFSET) calls, which are
> supposed to kill the MMIO mapping when entering suspend, into NOPs.
> Which means we either keep the dummy flush_id mapping active at all
> times, or we risk a BUS_FAULT if the MMIO region was mapped, and the
> GPU is suspended after that.
> 
> Fixes: 5fe909cae118 ("drm/panthor: Add the device logical block")
> Reported-by: Adrián Larumbe <adrian.larumbe@collabora.com>
> Reported-by: Lukas F. Hartmann <lukas@mntmn.com>
> Closes: https://gitlab.freedesktop.org/mesa/mesa/-/issues/10835
> Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>

Pesky 32 bit again ;)

Looks fine, although I'm wondering whether you'd consider squashing
something like the below on top? I think it helps contain the 32 bit
specific code to the one place. Either way:

Reviewed-by: Steven Price <steven.price@arm.com>

---
diff --git a/drivers/gpu/drm/panthor/panthor_device.c b/drivers/gpu/drm/panthor/panthor_device.c
index f7f8184b1992..75276cbeba20 100644
--- a/drivers/gpu/drm/panthor/panthor_device.c
+++ b/drivers/gpu/drm/panthor/panthor_device.c
@@ -392,7 +392,7 @@ static const struct vm_operations_struct panthor_mmio_vm_ops = {
 
 int panthor_device_mmap_io(struct panthor_device *ptdev, struct vm_area_struct *vma)
 {
-	u64 offset = panthor_device_mmio_offset((u64)vma->vm_pgoff << PAGE_SHIFT);
+	u64 offset = (u64)vma->vm_pgoff << PAGE_SHIFT;
 
 	switch (offset) {
 	case DRM_PANTHOR_USER_FLUSH_ID_MMIO_OFFSET:
@@ -406,9 +406,6 @@ int panthor_device_mmap_io(struct panthor_device *ptdev, struct vm_area_struct *
 		return -EINVAL;
 	}
 
-	/* Adjust vm_pgoff for 32-bit userspace on 64-bit kernel. */
-	vma->vm_pgoff = offset >> PAGE_SHIFT;
-
 	/* Defer actual mapping to the fault handler. */
 	vma->vm_private_data = ptdev;
 	vma->vm_ops = &panthor_mmio_vm_ops;
diff --git a/drivers/gpu/drm/panthor/panthor_device.h b/drivers/gpu/drm/panthor/panthor_device.h
index 8e2922c79aca..99ad576912b3 100644
--- a/drivers/gpu/drm/panthor/panthor_device.h
+++ b/drivers/gpu/drm/panthor/panthor_device.h
@@ -373,30 +373,6 @@ static int panthor_request_ ## __name ## _irq(struct panthor_device *ptdev,			\
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
index 11b3ccd58f85..730dd0c69cb8 100644
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

