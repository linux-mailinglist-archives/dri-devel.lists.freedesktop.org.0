Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 03ADA50EA9C
	for <lists+dri-devel@lfdr.de>; Mon, 25 Apr 2022 22:32:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 329AE10E511;
	Mon, 25 Apr 2022 20:32:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from letterbox.kde.org (letterbox.kde.org [46.43.1.242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A8BA410E553
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Apr 2022 20:32:00 +0000 (UTC)
Received: from vertex.localdomain (pool-108-36-85-85.phlapa.fios.verizon.net
 [108.36.85.85]) (Authenticated sender: zack)
 by letterbox.kde.org (Postfix) with ESMTPSA id 2C81628C846;
 Mon, 25 Apr 2022 21:31:57 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kde.org; s=users;
 t=1650918719; bh=1qlaoBr61ii2TnDK7pRlVYu8EiMP9lWeE4PYLWfm/48=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=avIHlsqU96WX6bYEBhyeiwKwGdau+IKlSBg+plwnySSH4//+sXZ9AHcdVmh2+LGb7
 x1v/6S7O9WMz2IX+F62B8KSlNc2CkZRy6e5DSoxAHyAklFUbVxm9hUyI5o6/MmokkK
 03y8hPFDSRJsjIC4q34uIoYLk7qYprpDZA4w7RWeb1uzwGLt2IwmGqMrPU4Tg+YOav
 tHhtK/JSVOaVoQMuOo/CE4y/6JDV+ko02CJRipkk/GE4TEe5lgAJ20LL4zfUYZue04
 zymP8TgZlDGxcjML2H18b2E2gyMJjI2AV33rRY/6dEKD7ZkVoKT4sBVPVPNZDtikou
 F67Mbyo57evRA==
From: Zack Rusin <zack@kde.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 2/2] drm: Remove the drm_get_unmapped_area() helper
Date: Mon, 25 Apr 2022 16:31:52 -0400
Message-Id: <20220425203152.1314211-2-zack@kde.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220425203152.1314211-1-zack@kde.org>
References: <20220425203152.1314211-1-zack@kde.org>
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
Reply-To: Zack Rusin <zackr@vmware.com>
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 David Airlie <airlied@linux.ie>, krastevm@vmware.com, mombasawalam@vmware.com,
 Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Zack Rusin <zackr@vmware.com>

This has been only used by the vmwgfx driver and vmwgfx over the last
year removed support for transparent hugepages on vram leaving
drm_get_unmapped_area completely unused.

There's no point in keeping unused code in core drm.

Signed-off-by: Zack Rusin <zackr@vmware.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Maxime Ripard <mripard@kernel.org>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: David Airlie <airlied@linux.ie>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org
---
 drivers/gpu/drm/drm_file.c | 141 -------------------------------------
 include/drm/drm_file.h     |   9 ---
 2 files changed, 150 deletions(-)

diff --git a/drivers/gpu/drm/drm_file.c b/drivers/gpu/drm/drm_file.c
index ed25168619fc..19af326c76f5 100644
--- a/drivers/gpu/drm/drm_file.c
+++ b/drivers/gpu/drm/drm_file.c
@@ -48,11 +48,6 @@
 #include "drm_internal.h"
 #include "drm_legacy.h"
 
-#if defined(CONFIG_MMU) && defined(CONFIG_TRANSPARENT_HUGEPAGE)
-#include <uapi/asm/mman.h>
-#include <drm/drm_vma_manager.h>
-#endif
-
 /* from BKL pushdown */
 DEFINE_MUTEX(drm_global_mutex);
 
@@ -913,139 +908,3 @@ struct file *mock_drm_getfile(struct drm_minor *minor, unsigned int flags)
 	return file;
 }
 EXPORT_SYMBOL_FOR_TESTS_ONLY(mock_drm_getfile);
-
-#ifdef CONFIG_MMU
-#ifdef CONFIG_TRANSPARENT_HUGEPAGE
-/*
- * drm_addr_inflate() attempts to construct an aligned area by inflating
- * the area size and skipping the unaligned start of the area.
- * adapted from shmem_get_unmapped_area()
- */
-static unsigned long drm_addr_inflate(unsigned long addr,
-				      unsigned long len,
-				      unsigned long pgoff,
-				      unsigned long flags,
-				      unsigned long huge_size)
-{
-	unsigned long offset, inflated_len;
-	unsigned long inflated_addr;
-	unsigned long inflated_offset;
-
-	offset = (pgoff << PAGE_SHIFT) & (huge_size - 1);
-	if (offset && offset + len < 2 * huge_size)
-		return addr;
-	if ((addr & (huge_size - 1)) == offset)
-		return addr;
-
-	inflated_len = len + huge_size - PAGE_SIZE;
-	if (inflated_len > TASK_SIZE)
-		return addr;
-	if (inflated_len < len)
-		return addr;
-
-	inflated_addr = current->mm->get_unmapped_area(NULL, 0, inflated_len,
-						       0, flags);
-	if (IS_ERR_VALUE(inflated_addr))
-		return addr;
-	if (inflated_addr & ~PAGE_MASK)
-		return addr;
-
-	inflated_offset = inflated_addr & (huge_size - 1);
-	inflated_addr += offset - inflated_offset;
-	if (inflated_offset > offset)
-		inflated_addr += huge_size;
-
-	if (inflated_addr > TASK_SIZE - len)
-		return addr;
-
-	return inflated_addr;
-}
-
-/**
- * drm_get_unmapped_area() - Get an unused user-space virtual memory area
- * suitable for huge page table entries.
- * @file: The struct file representing the address space being mmap()'d.
- * @uaddr: Start address suggested by user-space.
- * @len: Length of the area.
- * @pgoff: The page offset into the address space.
- * @flags: mmap flags
- * @mgr: The address space manager used by the drm driver. This argument can
- * probably be removed at some point when all drivers use the same
- * address space manager.
- *
- * This function attempts to find an unused user-space virtual memory area
- * that can accommodate the size we want to map, and that is properly
- * aligned to facilitate huge page table entries matching actual
- * huge pages or huge page aligned memory in buffer objects. Buffer objects
- * are assumed to start at huge page boundary pfns (io memory) or be
- * populated by huge pages aligned to the start of the buffer object
- * (system- or coherent memory). Adapted from shmem_get_unmapped_area.
- *
- * Return: aligned user-space address.
- */
-unsigned long drm_get_unmapped_area(struct file *file,
-				    unsigned long uaddr, unsigned long len,
-				    unsigned long pgoff, unsigned long flags,
-				    struct drm_vma_offset_manager *mgr)
-{
-	unsigned long addr;
-	unsigned long inflated_addr;
-	struct drm_vma_offset_node *node;
-
-	if (len > TASK_SIZE)
-		return -ENOMEM;
-
-	/*
-	 * @pgoff is the file page-offset the huge page boundaries of
-	 * which typically aligns to physical address huge page boundaries.
-	 * That's not true for DRM, however, where physical address huge
-	 * page boundaries instead are aligned with the offset from
-	 * buffer object start. So adjust @pgoff to be the offset from
-	 * buffer object start.
-	 */
-	drm_vma_offset_lock_lookup(mgr);
-	node = drm_vma_offset_lookup_locked(mgr, pgoff, 1);
-	if (node)
-		pgoff -= node->vm_node.start;
-	drm_vma_offset_unlock_lookup(mgr);
-
-	addr = current->mm->get_unmapped_area(file, uaddr, len, pgoff, flags);
-	if (IS_ERR_VALUE(addr))
-		return addr;
-	if (addr & ~PAGE_MASK)
-		return addr;
-	if (addr > TASK_SIZE - len)
-		return addr;
-
-	if (len < HPAGE_PMD_SIZE)
-		return addr;
-	if (flags & MAP_FIXED)
-		return addr;
-	/*
-	 * Our priority is to support MAP_SHARED mapped hugely;
-	 * and support MAP_PRIVATE mapped hugely too, until it is COWed.
-	 * But if caller specified an address hint, respect that as before.
-	 */
-	if (uaddr)
-		return addr;
-
-	inflated_addr = drm_addr_inflate(addr, len, pgoff, flags,
-					 HPAGE_PMD_SIZE);
-
-	if (IS_ENABLED(CONFIG_HAVE_ARCH_TRANSPARENT_HUGEPAGE_PUD) &&
-	    len >= HPAGE_PUD_SIZE)
-		inflated_addr = drm_addr_inflate(inflated_addr, len, pgoff,
-						 flags, HPAGE_PUD_SIZE);
-	return inflated_addr;
-}
-#else /* CONFIG_TRANSPARENT_HUGEPAGE */
-unsigned long drm_get_unmapped_area(struct file *file,
-				    unsigned long uaddr, unsigned long len,
-				    unsigned long pgoff, unsigned long flags,
-				    struct drm_vma_offset_manager *mgr)
-{
-	return current->mm->get_unmapped_area(file, uaddr, len, pgoff, flags);
-}
-#endif /* CONFIG_TRANSPARENT_HUGEPAGE */
-EXPORT_SYMBOL_GPL(drm_get_unmapped_area);
-#endif /* CONFIG_MMU */
diff --git a/include/drm/drm_file.h b/include/drm/drm_file.h
index e0a73a1e2df7..d780fd151789 100644
--- a/include/drm/drm_file.h
+++ b/include/drm/drm_file.h
@@ -421,13 +421,4 @@ void drm_send_event_timestamp_locked(struct drm_device *dev,
 
 struct file *mock_drm_getfile(struct drm_minor *minor, unsigned int flags);
 
-#ifdef CONFIG_MMU
-struct drm_vma_offset_manager;
-unsigned long drm_get_unmapped_area(struct file *file,
-				    unsigned long uaddr, unsigned long len,
-				    unsigned long pgoff, unsigned long flags,
-				    struct drm_vma_offset_manager *mgr);
-#endif /* CONFIG_MMU */
-
-
 #endif /* _DRM_FILE_H_ */
-- 
2.32.0

