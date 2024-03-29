Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 41432891F14
	for <lists+dri-devel@lfdr.de>; Fri, 29 Mar 2024 15:58:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F31B4112260;
	Fri, 29 Mar 2024 14:58:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Vrgzpmd7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F1CC112752;
 Fri, 29 Mar 2024 14:57:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711724260; x=1743260260;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=qLoQej7Nv+ZXK8GBebnBSMeiwJXKyHz4bueVK0lASl8=;
 b=Vrgzpmd7SJOP2QC8Xx5a+3OzOmzK4zftUkOp2ByCdS9EF6Itk0WcDfcB
 n1DBg9bIj0pCFQOWaMro6lJt1n8cRNZ+I9Z9RqYauuoZ1sKs/RvQdQ0uv
 /2euQtZM7dyPINax7GeCbEbJl7qrl9gdCl8KoXj4pbsl4oDSMJf+cI0og
 va+I2vclzc21jWbqKO7ku1VkO9/t/XK11bGbrINtbVnSagfK5Z0rrS9oY
 +ANSp+0M+Am0YHwc8D5qTRaEfcqeEzkiDlDYoraIpeeg2WROaOp8wR4Gj
 fJEYZPw7DOD1U22iYIiN67UDBALJm2aHRlZROOvGo4XepUUKE+YcIbZR5 A==;
X-CSE-ConnectionGUID: 1pn0MuHKRZK7knl3Fl3MTA==
X-CSE-MsgGUID: cfrRODNwR3Wkok9s5KKdKg==
X-IronPort-AV: E=McAfee;i="6600,9927,11028"; a="7023683"
X-IronPort-AV: E=Sophos;i="6.07,165,1708416000"; 
   d="scan'208";a="7023683"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Mar 2024 07:57:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,165,1708416000"; d="scan'208";a="47962420"
Received: from satiarax-mobl1.gar.corp.intel.com (HELO fedora..)
 ([10.249.254.13])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Mar 2024 07:57:32 -0700
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Somalapuram Amaranath <Amaranath.Somalapuram@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 dri-devel@lists.freedesktop.org
Subject: [RFC PATCH 5/8] drm/ttm: Add a virtual base class for graphics memory
 backup
Date: Fri, 29 Mar 2024 15:57:04 +0100
Message-ID: <20240329145707.3087-6-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240329145707.3087-1-thomas.hellstrom@linux.intel.com>
References: <20240329145707.3087-1-thomas.hellstrom@linux.intel.com>
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

Initially intended for experimenting with different backup
solutions (shmem vs direct swap cache insertion), abstract
the backup destination using a virtual base class.

Also provide a sample implementation for shmem.

While when settling on a preferred backup solution, one could
perhaps skip the abstraction, this functionality may actually
come in handy for configurable dedicated graphics memory
backup to fast nvme files or similar, whithout affecting
swap-space. Could indeed be useful for VRAM backup on S4 and
other cases.

Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 drivers/gpu/drm/ttm/Makefile           |   2 +-
 drivers/gpu/drm/ttm/ttm_backup_shmem.c | 137 +++++++++++++++++++++++++
 include/drm/ttm/ttm_backup.h           | 136 ++++++++++++++++++++++++
 3 files changed, 274 insertions(+), 1 deletion(-)
 create mode 100644 drivers/gpu/drm/ttm/ttm_backup_shmem.c
 create mode 100644 include/drm/ttm/ttm_backup.h

diff --git a/drivers/gpu/drm/ttm/Makefile b/drivers/gpu/drm/ttm/Makefile
index dad298127226..5e980dd90e41 100644
--- a/drivers/gpu/drm/ttm/Makefile
+++ b/drivers/gpu/drm/ttm/Makefile
@@ -4,7 +4,7 @@
 
 ttm-y := ttm_tt.o ttm_bo.o ttm_bo_util.o ttm_bo_vm.o ttm_module.o \
 	ttm_execbuf_util.o ttm_range_manager.o ttm_resource.o ttm_pool.o \
-	ttm_device.o ttm_sys_manager.o
+	ttm_device.o ttm_sys_manager.o ttm_backup_shmem.o
 ttm-$(CONFIG_AGP) += ttm_agp_backend.o
 
 obj-$(CONFIG_DRM_TTM) += ttm.o
diff --git a/drivers/gpu/drm/ttm/ttm_backup_shmem.c b/drivers/gpu/drm/ttm/ttm_backup_shmem.c
new file mode 100644
index 000000000000..79c2f552863a
--- /dev/null
+++ b/drivers/gpu/drm/ttm/ttm_backup_shmem.c
@@ -0,0 +1,137 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2024 Intel Corporation
+ */
+
+#include <drm/ttm/ttm_backup.h>
+#include <linux/page-flags.h>
+
+/**
+ * struct ttm_backup_shmem - A shmem based ttm_backup subclass.
+ * @backup: The base struct ttm_backup
+ * @filp: The associated shmem object
+ */
+struct ttm_backup_shmem {
+	struct ttm_backup backup;
+	struct file *filp;
+};
+
+static struct ttm_backup_shmem *to_backup_shmem(struct ttm_backup *backup)
+{
+	return container_of(backup, struct ttm_backup_shmem, backup);
+}
+
+static void ttm_backup_shmem_drop(struct ttm_backup *backup, unsigned long handle)
+{
+	handle -= 1;
+	shmem_truncate_range(file_inode(to_backup_shmem(backup)->filp), handle,
+			     handle + 1);
+}
+
+static int ttm_backup_shmem_copy_page(struct ttm_backup *backup, struct page *dst,
+				      unsigned long handle, bool killable)
+{
+	struct file *filp = to_backup_shmem(backup)->filp;
+	struct address_space *mapping = filp->f_mapping;
+	struct folio *from_folio;
+
+	handle -= 1;
+	from_folio = shmem_read_folio(mapping, handle);
+	if (IS_ERR(from_folio))
+		return PTR_ERR(from_folio);
+
+	/* Note: Use drm_memcpy_from_wc? */
+	copy_highpage(dst, folio_file_page(from_folio, handle));
+	folio_put(from_folio);
+
+	return 0;
+}
+
+static unsigned long
+ttm_backup_shmem_backup_page(struct ttm_backup *backup, struct page *page,
+			     bool writeback, pgoff_t i, gfp_t page_gfp,
+			     gfp_t alloc_gfp)
+{
+	struct file *filp = to_backup_shmem(backup)->filp;
+	struct address_space *mapping = filp->f_mapping;
+	unsigned long handle = 0;
+	struct folio *to_folio;
+	int ret;
+
+	to_folio = shmem_read_folio_gfp(mapping, i, alloc_gfp);
+	if (IS_ERR(to_folio))
+		return handle;
+
+	folio_mark_accessed(to_folio);
+	folio_lock(to_folio);
+	folio_mark_dirty(to_folio);
+	copy_highpage(folio_file_page(to_folio, i), page);
+	handle = i + 1;
+
+	if (writeback && !folio_mapped(to_folio) && folio_clear_dirty_for_io(to_folio)) {
+		struct writeback_control wbc = {
+			.sync_mode = WB_SYNC_NONE,
+			.nr_to_write = SWAP_CLUSTER_MAX,
+			.range_start = 0,
+			.range_end = LLONG_MAX,
+			.for_reclaim = 1,
+		};
+		folio_set_reclaim(to_folio);
+		ret = mapping->a_ops->writepage(folio_page(to_folio, 0), &wbc);
+		if (!folio_test_writeback(to_folio))
+			folio_clear_reclaim(to_folio);
+		/* If writepage succeeds, it unlocks the folio */
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
+static void ttm_backup_shmem_fini(struct ttm_backup *backup)
+{
+	struct ttm_backup_shmem *sbackup = to_backup_shmem(backup);
+
+	fput(sbackup->filp);
+	kfree(sbackup);
+}
+
+static const struct ttm_backup_ops ttm_backup_shmem_ops = {
+	.drop = ttm_backup_shmem_drop,
+	.copy_backed_up_page = ttm_backup_shmem_copy_page,
+	.backup_page = ttm_backup_shmem_backup_page,
+	.fini = ttm_backup_shmem_fini,
+};
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
+	struct ttm_backup_shmem *sbackup =
+		kzalloc(sizeof(*sbackup), GFP_KERNEL | __GFP_ACCOUNT);
+
+	if (!sbackup)
+		return ERR_PTR(-ENOMEM);
+
+	sbackup->filp = shmem_file_setup("ttm shmem backup", size, 0);
+	if (IS_ERR(sbackup->filp)) {
+		kfree(sbackup);
+		return ERR_CAST(sbackup->filp);
+	}
+
+	sbackup->backup.ops = &ttm_backup_shmem_ops;
+
+	return &sbackup->backup;
+}
+EXPORT_SYMBOL_GPL(ttm_backup_shmem_create);
diff --git a/include/drm/ttm/ttm_backup.h b/include/drm/ttm/ttm_backup.h
new file mode 100644
index 000000000000..88e8b97a6fdc
--- /dev/null
+++ b/include/drm/ttm/ttm_backup.h
@@ -0,0 +1,136 @@
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
+/** struct ttm_backup_ops - A struct ttm_backup backend operations */
+struct ttm_backup_ops {
+	/**
+	 * drop - release memory associated with a handle
+	 * @backup: The struct backup pointer used to obtain the handle
+	 * @handle: The handle obtained from the @backup_page function.
+	 */
+	void (*drop)(struct ttm_backup *backup, unsigned long handle);
+
+	/**
+	 * copy_backed_up_page - Copy the contents of a previously backed
+	 * up page
+	 * @backup: The struct backup pointer used to back up the page.
+	 * @dst: The struct page to copy into.
+	 * @handle: The handle returned when the page was backed up.
+	 * @intr: Try to perform waits interruptable or at least killable.
+	 *
+	 * Return: 0 on success, Negative error code on failure, notably
+	 * -EINTR if @intr was set to true and a signal is pending.
+	 */
+	int (*copy_backed_up_page)(struct ttm_backup *backup, struct page *dst,
+				   unsigned long handle, bool intr);
+
+	/**
+	 * backup_page - Backup a page
+	 * @backup: The struct backup pointer to use.
+	 * @page: The page to back up.
+	 * @writeback: Whether to perform immediate writeback of the page.
+	 * This may have performance implications.
+	 * @i: A unique integer for each page and each struct backup.
+	 * This is a hint allowing the backup backend to avoid managing
+	 * its address space separately.
+	 * @page_gfp: The gfp value used when the page was allocated.
+	 * This is used for accounting purposes.
+	 * @alloc_gfp: The gpf to be used when the backend needs to allocaete
+	 * memory.
+	 *
+	 * Return: A handle on success. 0 on failure.
+	 * (This is following the swp_entry_t convention).
+	 *
+	 * Note: This function could be extended to back up a folio and
+	 * backends would then split the folio internally if needed.
+	 * Drawback is that the caller would then have to keep track of
+	 */
+	unsigned long (*backup_page)(struct ttm_backup *backup, struct page *page,
+				     bool writeback, pgoff_t i, gfp_t page_gfp,
+				     gfp_t alloc_gfp);
+	/**
+	 * fini - Free the struct backup resources after last use.
+	 * @backup: Pointer to the struct backup whose resources to free.
+	 *
+	 * After a call to @fini, it's illegal to use the @backup pointer.
+	 */
+	void (*fini)(struct ttm_backup *backup);
+};
+
+/**
+ * struct ttm_backup - Abstract a backup backend.
+ * @ops: The operations as described above.
+ *
+ * The struct ttm_backup is intended to be subclassed by the
+ * backend implementation.
+ */
+struct ttm_backup {
+	const struct ttm_backup_ops *ops;
+};
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
+struct ttm_backup *ttm_backup_shmem_create(loff_t size);
+
+#endif
-- 
2.44.0

