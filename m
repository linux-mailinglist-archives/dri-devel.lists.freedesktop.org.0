Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A83B889AFC
	for <lists+dri-devel@lfdr.de>; Mon, 25 Mar 2024 11:41:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1DDB710E73A;
	Mon, 25 Mar 2024 10:41:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="D83l66Sm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com
 [46.235.227.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F94110E74E
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Mar 2024 10:41:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1711363274;
 bh=YuaX2Tl6bgpyBfojFBTTlBc33sWJOlnERa0rtqj2Iqg=;
 h=From:To:Cc:Subject:Date:From;
 b=D83l66SmkOnX16z9I1+jaJZnxo2DNI/U8+uJf4Lu2xbK9a9U9hzzfhmj2L6msyZYa
 D1qAbbEtc8dbqjUK3W+KyKgVBaBZZ2aFlCjgpBiAi10CBNnxrptsB4UZH9HCELyNcK
 Ul6IOMJLG5004q1xY1b6gH+tGCC5Vt1S3ITx056adL5gdwFwRcQ7wCD/2ipUQ1HKpP
 dWsusQypljOFwn/KzJaBWLAfwEvml5vrWzFQsNn/3ijzfUlBMxvS3cMZYfpIper5up
 ZbG7dvdYP+VNg0k/Sr5kG8LenB34bzUIpX+tOmE8zsbt7TFxPTbOsAXC7UkNr8cs4e
 b+XE/yUoDNcqg==
Received: from localhost.localdomain (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by madrid.collaboradmins.com (Postfix) with ESMTPSA id 5BB3637820A7;
 Mon, 25 Mar 2024 10:41:14 +0000 (UTC)
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 =?UTF-8?q?Adri=C3=A1n=20Larumbe?= <adrian.larumbe@collabora.com>
Cc: dri-devel@lists.freedesktop.org, kernel@collabora.com,
 "Lukas F . Hartmann" <lukas@mntmn.com>
Subject: [PATCH 1/2] drm/panthor: Fix IO-page mmap() for 32-bit userspace on
 64-bit kernel
Date: Mon, 25 Mar 2024 11:41:10 +0100
Message-ID: <20240325104111.3553712-1-boris.brezillon@collabora.com>
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
userspace architecture. panthor_device_mmio_offset() abstract that away
for us by turning a userspace MMIO offset into its kernel equivalent,
but we were not updating vm_area_struct::vm_pgoff accordingly, leading
us to attach the MMIO region to the wrong file offset.

This has implications when we start mixing 64 bit and 32 bit apps, but
that's only really a problem when we start having more that 2^43 bytes of
memory allocated, which is very unlikely to happen.

What's more problematic is the fact this turns our
unmap_mapping_range(DRM_PANTHOR_USER_MMIO_OFFSET) calls, which are
supposed to kill the MMIO mapping when entering suspend, into NOPs.
Which means we either keep the dummy flush_id mapping active at all
times, or we risk a BUS_FAULT if the MMIO region was mapped, and the
GPU is suspended after that.

Fixes: 5fe909cae118 ("drm/panthor: Add the device logical block")
Reported-by: Adrián Larumbe <adrian.larumbe@collabora.com>
Reported-by: Lukas F. Hartmann <lukas@mntmn.com>
Closes: https://gitlab.freedesktop.org/mesa/mesa/-/issues/10835
Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
---
 drivers/gpu/drm/panthor/panthor_device.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/panthor/panthor_device.c b/drivers/gpu/drm/panthor/panthor_device.c
index bfe8da4a6e4c..a18fd4e4b77c 100644
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
+	u64 offset = panthor_device_mmio_offset((u64)vma->vm_pgoff << PAGE_SHIFT);
 
-	switch (panthor_device_mmio_offset(id)) {
+	switch (offset) {
 	case DRM_PANTHOR_USER_FLUSH_ID_MMIO_OFFSET:
 		if (vma->vm_end - vma->vm_start != PAGE_SIZE ||
 		    (vma->vm_flags & (VM_WRITE | VM_EXEC)))
@@ -392,6 +392,9 @@ int panthor_device_mmap_io(struct panthor_device *ptdev, struct vm_area_struct *
 		return -EINVAL;
 	}
 
+	/* Adjust vm_pgoff for 32-bit userspace on 64-bit kernel. */
+	vma->vm_pgoff = offset >> PAGE_SHIFT;
+
 	/* Defer actual mapping to the fault handler. */
 	vma->vm_private_data = ptdev;
 	vma->vm_ops = &panthor_mmio_vm_ops;
-- 
2.44.0

