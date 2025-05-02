Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D441AA72C6
	for <lists+dri-devel@lfdr.de>; Fri,  2 May 2025 15:02:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8327910E90A;
	Fri,  2 May 2025 13:02:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Q4l4nKFR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1ABBC10E90A;
 Fri,  2 May 2025 13:02:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1746190922; x=1777726922;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=8xfq/VqaZNsU4GIATdJ2vLW/ASuI7TYH2Tk8lKeT8t0=;
 b=Q4l4nKFRIWSBbMmnUhzuL7G9k5xvkbIB1XKTWSgPQk+iS/rYTFkk/Zsh
 TA26UeafoNciqWR3kGfM/GIxh3Ty/MAqms1Ksu4a1DStvBpEDi/ZdO3Ed
 qS8/K+zuZTdLDA4zeR4eX48mJrYQNvRjBB/oIaug/NUirCEI/zfmyzbXg
 gJksDIzXMOhVIGTVoVhJc1OiyESnoEbNFdqJ1S0NKFPej2ffWcMJbE324
 LnJt0Djkqb0TlpKWBjq78Lz7rfrau+Te7Ro3bR4dUlzsCZHlpVSRAtOe6
 uDO8qQ+k1GEd+3YCSfctbdegl7dqRZoqp26DcE6UmUzUOi3ND6X1EeVvt A==;
X-CSE-ConnectionGUID: YX3pY/+bSDy31x5FdiDXyw==
X-CSE-MsgGUID: 7e8HFfjGQX+FXceSJe5OyA==
X-IronPort-AV: E=McAfee;i="6700,10204,11421"; a="47755760"
X-IronPort-AV: E=Sophos;i="6.15,256,1739865600"; d="scan'208";a="47755760"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 May 2025 06:00:38 -0700
X-CSE-ConnectionGUID: GTEpPLRcTR2V/UuY4ut7tg==
X-CSE-MsgGUID: 31plXbOlQj6ZNnD7YdfzHA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,256,1739865600"; d="scan'208";a="139632770"
Received: from sschumil-mobl2.ger.corp.intel.com (HELO fedora..)
 ([10.245.246.151])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 May 2025 06:00:36 -0700
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 dri-devel@lists.freedesktop.org, Matthew Brost <matthew.brost@intel.com>,
 Dave Airlie <airlied@redhat.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Matthew Auld <matthew.auld@intel.com>, Al Viro <viro@zeniv.linux.org.uk>,
 Kees Cook <kees@kernel.org>
Subject: [PATCH] drm/ttm: Remove the struct ttm_backup abstraction
Date: Fri,  2 May 2025 15:00:14 +0200
Message-ID: <20250502130014.3156-1-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.49.0
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

The abstraction was previously added to support separate
ttm_backup implementations.

However with the current implementation casting from a
struct file to a struct ttm_backup, we run into trouble since
struct file may have randomized the layout and gcc complains.

Remove the struct ttm_backup abstraction

Cc: dri-devel@lists.freedesktop.org
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Dave Airlie <airlied@redhat.com>
Cc: Christian König <christian.koenig@amd.com>
Cc: Matthew Auld <matthew.auld@intel.com>
Cc: Al Viro <viro@zeniv.linux.org.uk>
Reported-by: Kees Cook <kees@kernel.org>
Closes: https://lore.kernel.org/dri-devel/9c8dbbafdaf9f3f089da2cde5a772d69579b3795.camel@linux.intel.com/T/#mb153ab9216cb813b92bdeb36f391ad4808c2ba29
Suggested-by: Christian König <christian.koenig@amd.com>
Fixes: 70d645deac98 ("drm/ttm: Add helpers for shrinking")
Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 drivers/gpu/drm/ttm/ttm_backup.c | 42 +++++++++-----------------------
 drivers/gpu/drm/ttm/ttm_pool.c   |  6 ++---
 drivers/gpu/drm/ttm/ttm_tt.c     |  2 +-
 include/drm/ttm/ttm_backup.h     | 12 ++++-----
 include/drm/ttm/ttm_tt.h         |  2 +-
 5 files changed, 21 insertions(+), 43 deletions(-)

diff --git a/drivers/gpu/drm/ttm/ttm_backup.c b/drivers/gpu/drm/ttm/ttm_backup.c
index 93c007f18855..9b3b5624c3eb 100644
--- a/drivers/gpu/drm/ttm/ttm_backup.c
+++ b/drivers/gpu/drm/ttm/ttm_backup.c
@@ -7,20 +7,6 @@
 #include <linux/page-flags.h>
 #include <linux/swap.h>
 
-/*
- * Casting from randomized struct file * to struct ttm_backup * is fine since
- * struct ttm_backup is never defined nor dereferenced.
- */
-static struct file *ttm_backup_to_file(struct ttm_backup *backup)
-{
-	return (void *)backup;
-}
-
-static struct ttm_backup *ttm_file_to_backup(struct file *file)
-{
-	return (void *)file;
-}
-
 /*
  * Need to map shmem indices to handle since a handle value
  * of 0 means error, following the swp_entry_t convention.
@@ -40,12 +26,12 @@ static pgoff_t ttm_backup_handle_to_shmem_idx(pgoff_t handle)
  * @backup: The struct backup pointer used to obtain the handle
  * @handle: The handle obtained from the @backup_page function.
  */
-void ttm_backup_drop(struct ttm_backup *backup, pgoff_t handle)
+void ttm_backup_drop(struct file *backup, pgoff_t handle)
 {
 	loff_t start = ttm_backup_handle_to_shmem_idx(handle);
 
 	start <<= PAGE_SHIFT;
-	shmem_truncate_range(file_inode(ttm_backup_to_file(backup)), start,
+	shmem_truncate_range(file_inode(backup), start,
 			     start + PAGE_SIZE - 1);
 }
 
@@ -60,11 +46,10 @@ void ttm_backup_drop(struct ttm_backup *backup, pgoff_t handle)
  * Return: 0 on success, Negative error code on failure, notably
  * -EINTR if @intr was set to true and a signal is pending.
  */
-int ttm_backup_copy_page(struct ttm_backup *backup, struct page *dst,
+int ttm_backup_copy_page(struct file *backup, struct page *dst,
 			 pgoff_t handle, bool intr)
 {
-	struct file *filp = ttm_backup_to_file(backup);
-	struct address_space *mapping = filp->f_mapping;
+	struct address_space *mapping = backup->f_mapping;
 	struct folio *from_folio;
 	pgoff_t idx = ttm_backup_handle_to_shmem_idx(handle);
 
@@ -106,12 +91,11 @@ int ttm_backup_copy_page(struct ttm_backup *backup, struct page *dst,
  * the folio size- and usage.
  */
 s64
-ttm_backup_backup_page(struct ttm_backup *backup, struct page *page,
+ttm_backup_backup_page(struct file *backup, struct page *page,
 		       bool writeback, pgoff_t idx, gfp_t page_gfp,
 		       gfp_t alloc_gfp)
 {
-	struct file *filp = ttm_backup_to_file(backup);
-	struct address_space *mapping = filp->f_mapping;
+	struct address_space *mapping = backup->f_mapping;
 	unsigned long handle = 0;
 	struct folio *to_folio;
 	int ret;
@@ -161,9 +145,9 @@ ttm_backup_backup_page(struct ttm_backup *backup, struct page *page,
  *
  * After a call to this function, it's illegal to use the @backup pointer.
  */
-void ttm_backup_fini(struct ttm_backup *backup)
+void ttm_backup_fini(struct file *backup)
 {
-	fput(ttm_backup_to_file(backup));
+	fput(backup);
 }
 
 /**
@@ -194,14 +178,10 @@ EXPORT_SYMBOL_GPL(ttm_backup_bytes_avail);
  *
  * Create a backup utilizing shmem objects.
  *
- * Return: A pointer to a struct ttm_backup on success,
+ * Return: A pointer to a struct file on success,
  * an error pointer on error.
  */
-struct ttm_backup *ttm_backup_shmem_create(loff_t size)
+struct file *ttm_backup_shmem_create(loff_t size)
 {
-	struct file *filp;
-
-	filp = shmem_file_setup("ttm shmem backup", size, 0);
-
-	return ttm_file_to_backup(filp);
+	return shmem_file_setup("ttm shmem backup", size, 0);
 }
diff --git a/drivers/gpu/drm/ttm/ttm_pool.c b/drivers/gpu/drm/ttm/ttm_pool.c
index 83b10706ba89..c2ea865be657 100644
--- a/drivers/gpu/drm/ttm/ttm_pool.c
+++ b/drivers/gpu/drm/ttm/ttm_pool.c
@@ -506,7 +506,7 @@ static void ttm_pool_allocated_page_commit(struct page *allocated,
  * if successful, populate the page-table and dma-address arrays.
  */
 static int ttm_pool_restore_commit(struct ttm_pool_tt_restore *restore,
-				   struct ttm_backup *backup,
+				   struct file *backup,
 				   const struct ttm_operation_ctx *ctx,
 				   struct ttm_pool_alloc_state *alloc)
 
@@ -655,7 +655,7 @@ static void ttm_pool_free_range(struct ttm_pool *pool, struct ttm_tt *tt,
 				pgoff_t start_page, pgoff_t end_page)
 {
 	struct page **pages = &tt->pages[start_page];
-	struct ttm_backup *backup = tt->backup;
+	struct file *backup = tt->backup;
 	pgoff_t i, nr;
 
 	for (i = start_page; i < end_page; i += nr, pages += nr) {
@@ -963,7 +963,7 @@ void ttm_pool_drop_backed_up(struct ttm_tt *tt)
 long ttm_pool_backup(struct ttm_pool *pool, struct ttm_tt *tt,
 		     const struct ttm_backup_flags *flags)
 {
-	struct ttm_backup *backup = tt->backup;
+	struct file *backup = tt->backup;
 	struct page *page;
 	unsigned long handle;
 	gfp_t alloc_gfp;
diff --git a/drivers/gpu/drm/ttm/ttm_tt.c b/drivers/gpu/drm/ttm/ttm_tt.c
index df0aa6c4b8b8..698cd4bf5e46 100644
--- a/drivers/gpu/drm/ttm/ttm_tt.c
+++ b/drivers/gpu/drm/ttm/ttm_tt.c
@@ -544,7 +544,7 @@ EXPORT_SYMBOL(ttm_tt_pages_limit);
  */
 int ttm_tt_setup_backup(struct ttm_tt *tt)
 {
-	struct ttm_backup *backup =
+	struct file *backup =
 		ttm_backup_shmem_create(((loff_t)tt->num_pages) << PAGE_SHIFT);
 
 	if (WARN_ON_ONCE(!(tt->page_flags & TTM_TT_FLAG_EXTERNAL_MAPPABLE)))
diff --git a/include/drm/ttm/ttm_backup.h b/include/drm/ttm/ttm_backup.h
index 24ad120b8827..4da7c825088f 100644
--- a/include/drm/ttm/ttm_backup.h
+++ b/include/drm/ttm/ttm_backup.h
@@ -9,8 +9,6 @@
 #include <linux/mm_types.h>
 #include <linux/shmem_fs.h>
 
-struct ttm_backup;
-
 /**
  * ttm_backup_handle_to_page_ptr() - Convert handle to struct page pointer
  * @handle: The handle to convert.
@@ -55,20 +53,20 @@ ttm_backup_page_ptr_to_handle(const struct page *page)
 	return (unsigned long)page >> 1;
 }
 
-void ttm_backup_drop(struct ttm_backup *backup, pgoff_t handle);
+void ttm_backup_drop(struct file *backup, pgoff_t handle);
 
-int ttm_backup_copy_page(struct ttm_backup *backup, struct page *dst,
+int ttm_backup_copy_page(struct file *backup, struct page *dst,
 			 pgoff_t handle, bool intr);
 
 s64
-ttm_backup_backup_page(struct ttm_backup *backup, struct page *page,
+ttm_backup_backup_page(struct file *backup, struct page *page,
 		       bool writeback, pgoff_t idx, gfp_t page_gfp,
 		       gfp_t alloc_gfp);
 
-void ttm_backup_fini(struct ttm_backup *backup);
+void ttm_backup_fini(struct file *backup);
 
 u64 ttm_backup_bytes_avail(void);
 
-struct ttm_backup *ttm_backup_shmem_create(loff_t size);
+struct file *ttm_backup_shmem_create(loff_t size);
 
 #endif
diff --git a/include/drm/ttm/ttm_tt.h b/include/drm/ttm/ttm_tt.h
index 13cf47f3322f..406437ad674b 100644
--- a/include/drm/ttm/ttm_tt.h
+++ b/include/drm/ttm/ttm_tt.h
@@ -118,7 +118,7 @@ struct ttm_tt {
 	 * ttm_tt_create() callback is responsible for assigning
 	 * this field.
 	 */
-	struct ttm_backup *backup;
+	struct file *backup;
 	/**
 	 * @caching: The current caching state of the pages, see enum
 	 * ttm_caching.
-- 
2.49.0

