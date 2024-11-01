Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E51DE9B9091
	for <lists+dri-devel@lfdr.de>; Fri,  1 Nov 2024 12:47:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1654210E9AA;
	Fri,  1 Nov 2024 11:47:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QMsRVT3A";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5282210E9AA;
 Fri,  1 Nov 2024 11:47:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1730461661; x=1761997661;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Y4HaPnYh3ieuAykkJd5NHbPOMy1WixONEhedc8sBT/Y=;
 b=QMsRVT3AaT398J6h5MjzQ3BXVvLYu5s+5sJhXSbIwS2fnm56Wc+bMRJW
 5ShyZ0FKA9u65ln+YLfAjr27xvpxWqWA7lkTMbq4cA8xUDB0t1JgY9TCz
 VcF5cyaj2UerQhJ9O1Ay64rXrgNtKjv9aojegudgE0JVHmqvrzRKVSTSl
 YWpxUg6giwcePcRrdXV2s4xxXR8csV1Lzv8TXdJOtAKISeFBBj4+R0jIq
 l+lQHbRw5y7fvrZn2KzShf9SJGUhg1fEmABlwOOZ9L8cLzt2QyyhrYoNA
 nvfxs14tIRvCcaaxqk++Hya90SoATcnt/R93qb0VoyMlr6e2mhfg//jOE w==;
X-CSE-ConnectionGUID: pG3fQ9geSAG4ZMryy87ytA==
X-CSE-MsgGUID: ZaH+nbqfR/md6b0Rn+8arQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="41324531"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="41324531"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Nov 2024 04:47:41 -0700
X-CSE-ConnectionGUID: iPOky6SXTCKBsF5SmHsHUg==
X-CSE-MsgGUID: NcK+q5sZQC+2AQ4vcKD99A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,249,1725346800"; d="scan'208";a="82626535"
Received: from carterle-desk.ger.corp.intel.com (HELO fedora..)
 ([10.245.246.239])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Nov 2024 04:47:38 -0700
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Somalapuram Amaranath <Amaranath.Somalapuram@amd.com>,
 Matthew Brost <matthew.brost@intel.com>, dri-devel@lists.freedesktop.org,
 Paulo Zanoni <paulo.r.zanoni@intel.com>,
 Simona Vetter <simona.vetter@ffwll.ch>
Subject: [PATCH v12 2/8] drm/ttm: Add a virtual base class for graphics memory
 backup
Date: Fri,  1 Nov 2024 12:47:13 +0100
Message-ID: <20241101114719.3225-3-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.46.2
In-Reply-To: <20241101114719.3225-1-thomas.hellstrom@linux.intel.com>
References: <20241101114719.3225-1-thomas.hellstrom@linux.intel.com>
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

v5:
- Fix a UAF. (kernel test robot, Dan Carptenter)
v6:
- Rename ttm_backup_shmem_copy_page() function argument
  (Matthew Brost)
- Add some missing documentation
v8:
- Use folio_file_page to get to the page we want to writeback
  instead of using the first page of the folio.

Cc: Christian König <christian.koenig@amd.com>
Cc: Somalapuram Amaranath <Amaranath.Somalapuram@amd.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: <dri-devel@lists.freedesktop.org>
Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Reviewed-by: Matthew Brost <matthew.brost@intel.com> #v7
---
 drivers/gpu/drm/ttm/Makefile           |   2 +-
 drivers/gpu/drm/ttm/ttm_backup_shmem.c | 139 +++++++++++++++++++++++++
 include/drm/ttm/ttm_backup.h           | 137 ++++++++++++++++++++++++
 3 files changed, 277 insertions(+), 1 deletion(-)
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
index 000000000000..cfe4140cc59d
--- /dev/null
+++ b/drivers/gpu/drm/ttm/ttm_backup_shmem.c
@@ -0,0 +1,139 @@
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
+				      unsigned long handle, bool intr)
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
+		ret = mapping->a_ops->writepage(folio_file_page(to_folio, i), &wbc);
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
+	struct file *filp;
+
+	if (!sbackup)
+		return ERR_PTR(-ENOMEM);
+
+	filp = shmem_file_setup("ttm shmem backup", size, 0);
+	if (IS_ERR(filp)) {
+		kfree(sbackup);
+		return ERR_CAST(filp);
+	}
+
+	sbackup->filp = filp;
+	sbackup->backup.ops = &ttm_backup_shmem_ops;
+
+	return &sbackup->backup;
+}
+EXPORT_SYMBOL_GPL(ttm_backup_shmem_create);
diff --git a/include/drm/ttm/ttm_backup.h b/include/drm/ttm/ttm_backup.h
new file mode 100644
index 000000000000..5f8c7d3069ef
--- /dev/null
+++ b/include/drm/ttm/ttm_backup.h
@@ -0,0 +1,137 @@
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
+	 * the folio size- and usage.
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
2.46.2

