Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E87DCA22B72
	for <lists+dri-devel@lfdr.de>; Thu, 30 Jan 2025 11:13:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4792810E925;
	Thu, 30 Jan 2025 10:13:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dXS2teT5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EFBF710E925;
 Thu, 30 Jan 2025 10:13:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738232034; x=1769768034;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=iplmralVro76EdCW22rmpdvAIX3josW0OxXiX83D+P8=;
 b=dXS2teT5f93rx1i/T+FwgPr0GyXaF2HHUjCKvO0fVRKIg1Qq6rALtXdx
 XA8vA2oS2nfJbn1bwD1gvI3yHgXmR28n/2zWS8hXmeJGbu3YDZTar7rRQ
 ICkKXjVTnWyQZeDAalfRMAyHN9kM7OCSnuE6v2g7v2LXj2wyWPOLiq2L9
 /SlMFi6NktIRM3r5JiNbH+J3DbQFFFPLIHiBTQktezZmf2lSTJthru62+
 pY8oo1TN/cPgLi0n5f0S/Dc2fwiaLU7Pz+AhOJaa2ngXHIvSATBregfh/
 nk8StCj6WWFs8/jhHa0TkzQYFjXaOZGuU6pR0K9TELbvJRQmn2+7cmSsO Q==;
X-CSE-ConnectionGUID: ocreswUcRfyUY34cQ5wnXA==
X-CSE-MsgGUID: UJZA65WdRxq8kbfyuHfVaA==
X-IronPort-AV: E=McAfee;i="6700,10204,11330"; a="39036584"
X-IronPort-AV: E=Sophos;i="6.13,245,1732608000"; d="scan'208";a="39036584"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jan 2025 02:13:54 -0800
X-CSE-ConnectionGUID: +PO7kCSZTS+3Xl12WIoxJw==
X-CSE-MsgGUID: PL+KFhv4RdiMD8uW2Vm5Eg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="140163493"
Received: from lfiedoro-mobl.ger.corp.intel.com (HELO fedora..)
 ([10.245.246.79])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jan 2025 02:13:52 -0800
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Somalapuram Amaranath <Amaranath.Somalapuram@amd.com>,
 Matthew Brost <matthew.brost@intel.com>, dri-devel@lists.freedesktop.org
Subject: [PATCH v16 1/7] drm/ttm: Provide a shmem backup implementation
Date: Thu, 30 Jan 2025 11:13:19 +0100
Message-ID: <20250130101325.3068-2-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250130101325.3068-1-thomas.hellstrom@linux.intel.com>
References: <20250130101325.3068-1-thomas.hellstrom@linux.intel.com>
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

Provide a standalone shmem backup implementation.
Given the ttm_backup interface, this could
later on be extended to providing other backup
implementation than shmem, with one use-case being
GPU swapout to a user-provided fd.

v5:
- Fix a UAF. (kernel test robot, Dan Carptenter)
v6:
- Rename ttm_backup_shmem_copy_page() function argument
  (Matthew Brost)
- Add some missing documentation
v8:
- Use folio_file_page to get to the page we want to writeback
  instead of using the first page of the folio.
v13:
- Remove the base class abstraction (Christian König)
- Include ttm_backup_bytes_avail().
v14:
- Fix kerneldoc for ttm_backup_bytes_avail() (0-day)
- Work around casting of __randomize_layout struct pointer (0-day)
v15:
- Return negative error code from ttm_backup_backup_page()
  (Christian König)
- Doc fixes. (Christian König).

Cc: Christian König <christian.koenig@amd.com>
Cc: Somalapuram Amaranath <Amaranath.Somalapuram@amd.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: <dri-devel@lists.freedesktop.org>
Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Reviewed-by: Matthew Brost <matthew.brost@intel.com> #v13
---
 drivers/gpu/drm/ttm/Makefile     |   2 +-
 drivers/gpu/drm/ttm/ttm_backup.c | 207 +++++++++++++++++++++++++++++++
 include/drm/ttm/ttm_backup.h     |  74 +++++++++++
 3 files changed, 282 insertions(+), 1 deletion(-)
 create mode 100644 drivers/gpu/drm/ttm/ttm_backup.c
 create mode 100644 include/drm/ttm/ttm_backup.h

diff --git a/drivers/gpu/drm/ttm/Makefile b/drivers/gpu/drm/ttm/Makefile
index dad298127226..40d07a35293a 100644
--- a/drivers/gpu/drm/ttm/Makefile
+++ b/drivers/gpu/drm/ttm/Makefile
@@ -4,7 +4,7 @@
 
 ttm-y := ttm_tt.o ttm_bo.o ttm_bo_util.o ttm_bo_vm.o ttm_module.o \
 	ttm_execbuf_util.o ttm_range_manager.o ttm_resource.o ttm_pool.o \
-	ttm_device.o ttm_sys_manager.o
+	ttm_device.o ttm_sys_manager.o ttm_backup.o
 ttm-$(CONFIG_AGP) += ttm_agp_backend.o
 
 obj-$(CONFIG_DRM_TTM) += ttm.o
diff --git a/drivers/gpu/drm/ttm/ttm_backup.c b/drivers/gpu/drm/ttm/ttm_backup.c
new file mode 100644
index 000000000000..93c007f18855
--- /dev/null
+++ b/drivers/gpu/drm/ttm/ttm_backup.c
@@ -0,0 +1,207 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2024 Intel Corporation
+ */
+
+#include <drm/ttm/ttm_backup.h>
+#include <linux/page-flags.h>
+#include <linux/swap.h>
+
+/*
+ * Casting from randomized struct file * to struct ttm_backup * is fine since
+ * struct ttm_backup is never defined nor dereferenced.
+ */
+static struct file *ttm_backup_to_file(struct ttm_backup *backup)
+{
+	return (void *)backup;
+}
+
+static struct ttm_backup *ttm_file_to_backup(struct file *file)
+{
+	return (void *)file;
+}
+
+/*
+ * Need to map shmem indices to handle since a handle value
+ * of 0 means error, following the swp_entry_t convention.
+ */
+static unsigned long ttm_backup_shmem_idx_to_handle(pgoff_t idx)
+{
+	return (unsigned long)idx + 1;
+}
+
+static pgoff_t ttm_backup_handle_to_shmem_idx(pgoff_t handle)
+{
+	return handle - 1;
+}
+
+/**
+ * ttm_backup_drop() - release memory associated with a handle
+ * @backup: The struct backup pointer used to obtain the handle
+ * @handle: The handle obtained from the @backup_page function.
+ */
+void ttm_backup_drop(struct ttm_backup *backup, pgoff_t handle)
+{
+	loff_t start = ttm_backup_handle_to_shmem_idx(handle);
+
+	start <<= PAGE_SHIFT;
+	shmem_truncate_range(file_inode(ttm_backup_to_file(backup)), start,
+			     start + PAGE_SIZE - 1);
+}
+
+/**
+ * ttm_backup_copy_page() - Copy the contents of a previously backed
+ * up page
+ * @backup: The struct backup pointer used to back up the page.
+ * @dst: The struct page to copy into.
+ * @handle: The handle returned when the page was backed up.
+ * @intr: Try to perform waits interruptable or at least killable.
+ *
+ * Return: 0 on success, Negative error code on failure, notably
+ * -EINTR if @intr was set to true and a signal is pending.
+ */
+int ttm_backup_copy_page(struct ttm_backup *backup, struct page *dst,
+			 pgoff_t handle, bool intr)
+{
+	struct file *filp = ttm_backup_to_file(backup);
+	struct address_space *mapping = filp->f_mapping;
+	struct folio *from_folio;
+	pgoff_t idx = ttm_backup_handle_to_shmem_idx(handle);
+
+	from_folio = shmem_read_folio(mapping, idx);
+	if (IS_ERR(from_folio))
+		return PTR_ERR(from_folio);
+
+	copy_highpage(dst, folio_file_page(from_folio, idx));
+	folio_put(from_folio);
+
+	return 0;
+}
+
+/**
+ * ttm_backup_backup_page() - Backup a page
+ * @backup: The struct backup pointer to use.
+ * @page: The page to back up.
+ * @writeback: Whether to perform immediate writeback of the page.
+ * This may have performance implications.
+ * @idx: A unique integer for each page and each struct backup.
+ * This allows the backup implementation to avoid managing
+ * its address space separately.
+ * @page_gfp: The gfp value used when the page was allocated.
+ * This is used for accounting purposes.
+ * @alloc_gfp: The gfp to be used when allocating memory.
+ *
+ * Context: If called from reclaim context, the caller needs to
+ * assert that the shrinker gfp has __GFP_FS set, to avoid
+ * deadlocking on lock_page(). If @writeback is set to true and
+ * called from reclaim context, the caller also needs to assert
+ * that the shrinker gfp has __GFP_IO set, since without it,
+ * we're not allowed to start backup IO.
+ *
+ * Return: A handle on success. Negative error code on failure.
+ *
+ * Note: This function could be extended to back up a folio and
+ * implementations would then split the folio internally if needed.
+ * Drawback is that the caller would then have to keep track of
+ * the folio size- and usage.
+ */
+s64
+ttm_backup_backup_page(struct ttm_backup *backup, struct page *page,
+		       bool writeback, pgoff_t idx, gfp_t page_gfp,
+		       gfp_t alloc_gfp)
+{
+	struct file *filp = ttm_backup_to_file(backup);
+	struct address_space *mapping = filp->f_mapping;
+	unsigned long handle = 0;
+	struct folio *to_folio;
+	int ret;
+
+	to_folio = shmem_read_folio_gfp(mapping, idx, alloc_gfp);
+	if (IS_ERR(to_folio))
+		return PTR_ERR(to_folio);
+
+	folio_mark_accessed(to_folio);
+	folio_lock(to_folio);
+	folio_mark_dirty(to_folio);
+	copy_highpage(folio_file_page(to_folio, idx), page);
+	handle = ttm_backup_shmem_idx_to_handle(idx);
+
+	if (writeback && !folio_mapped(to_folio) &&
+	    folio_clear_dirty_for_io(to_folio)) {
+		struct writeback_control wbc = {
+			.sync_mode = WB_SYNC_NONE,
+			.nr_to_write = SWAP_CLUSTER_MAX,
+			.range_start = 0,
+			.range_end = LLONG_MAX,
+			.for_reclaim = 1,
+		};
+		folio_set_reclaim(to_folio);
+		ret = mapping->a_ops->writepage(folio_file_page(to_folio, idx), &wbc);
+		if (!folio_test_writeback(to_folio))
+			folio_clear_reclaim(to_folio);
+		/*
+		 * If writepage succeeds, it unlocks the folio.
+		 * writepage() errors are otherwise dropped, since writepage()
+		 * is only best effort here.
+		 */
+		if (ret)
+			folio_unlock(to_folio);
+	} else {
+		folio_unlock(to_folio);
+	}
+
+	folio_put(to_folio);
+
+	return handle;
+}
+
+/**
+ * ttm_backup_fini() - Free the struct backup resources after last use.
+ * @backup: Pointer to the struct backup whose resources to free.
+ *
+ * After a call to this function, it's illegal to use the @backup pointer.
+ */
+void ttm_backup_fini(struct ttm_backup *backup)
+{
+	fput(ttm_backup_to_file(backup));
+}
+
+/**
+ * ttm_backup_bytes_avail() - Report the approximate number of bytes of backup space
+ * left for backup.
+ *
+ * This function is intended also for driver use to indicate whether a
+ * backup attempt is meaningful.
+ *
+ * Return: An approximate size of backup space available.
+ */
+u64 ttm_backup_bytes_avail(void)
+{
+	/*
+	 * The idea behind backing up to shmem is that shmem objects may
+	 * eventually be swapped out. So no point swapping out if there
+	 * is no or low swap-space available. But the accuracy of this
+	 * number also depends on shmem actually swapping out backed-up
+	 * shmem objects without too much buffering.
+	 */
+	return (u64)get_nr_swap_pages() << PAGE_SHIFT;
+}
+EXPORT_SYMBOL_GPL(ttm_backup_bytes_avail);
+
+/**
+ * ttm_backup_shmem_create() - Create a shmem-based struct backup.
+ * @size: The maximum size (in bytes) to back up.
+ *
+ * Create a backup utilizing shmem objects.
+ *
+ * Return: A pointer to a struct ttm_backup on success,
+ * an error pointer on error.
+ */
+struct ttm_backup *ttm_backup_shmem_create(loff_t size)
+{
+	struct file *filp;
+
+	filp = shmem_file_setup("ttm shmem backup", size, 0);
+
+	return ttm_file_to_backup(filp);
+}
diff --git a/include/drm/ttm/ttm_backup.h b/include/drm/ttm/ttm_backup.h
new file mode 100644
index 000000000000..24ad120b8827
--- /dev/null
+++ b/include/drm/ttm/ttm_backup.h
@@ -0,0 +1,74 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2024 Intel Corporation
+ */
+
+#ifndef _TTM_BACKUP_H_
+#define _TTM_BACKUP_H_
+
+#include <linux/mm_types.h>
+#include <linux/shmem_fs.h>
+
+struct ttm_backup;
+
+/**
+ * ttm_backup_handle_to_page_ptr() - Convert handle to struct page pointer
+ * @handle: The handle to convert.
+ *
+ * Converts an opaque handle received from the
+ * struct ttm_backoup_ops::backup_page() function to an (invalid)
+ * struct page pointer suitable for a struct page array.
+ *
+ * Return: An (invalid) struct page pointer.
+ */
+static inline struct page *
+ttm_backup_handle_to_page_ptr(unsigned long handle)
+{
+	return (struct page *)(handle << 1 | 1);
+}
+
+/**
+ * ttm_backup_page_ptr_is_handle() - Whether a struct page pointer is a handle
+ * @page: The struct page pointer to check.
+ *
+ * Return: true if the struct page pointer is a handld returned from
+ * ttm_backup_handle_to_page_ptr(). False otherwise.
+ */
+static inline bool ttm_backup_page_ptr_is_handle(const struct page *page)
+{
+	return (unsigned long)page & 1;
+}
+
+/**
+ * ttm_backup_page_ptr_to_handle() - Convert a struct page pointer to a handle
+ * @page: The struct page pointer to convert
+ *
+ * Return: The handle that was previously used in
+ * ttm_backup_handle_to_page_ptr() to obtain a struct page pointer, suitable
+ * for use as argument in the struct ttm_backup_ops drop() or
+ * copy_backed_up_page() functions.
+ */
+static inline unsigned long
+ttm_backup_page_ptr_to_handle(const struct page *page)
+{
+	WARN_ON(!ttm_backup_page_ptr_is_handle(page));
+	return (unsigned long)page >> 1;
+}
+
+void ttm_backup_drop(struct ttm_backup *backup, pgoff_t handle);
+
+int ttm_backup_copy_page(struct ttm_backup *backup, struct page *dst,
+			 pgoff_t handle, bool intr);
+
+s64
+ttm_backup_backup_page(struct ttm_backup *backup, struct page *page,
+		       bool writeback, pgoff_t idx, gfp_t page_gfp,
+		       gfp_t alloc_gfp);
+
+void ttm_backup_fini(struct ttm_backup *backup);
+
+u64 ttm_backup_bytes_avail(void);
+
+struct ttm_backup *ttm_backup_shmem_create(loff_t size);
+
+#endif
-- 
2.48.1

