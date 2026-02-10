Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2CilEzAdi2nSPwAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 10 Feb 2026 12:57:36 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8999B11A7AE
	for <lists+dri-devel@lfdr.de>; Tue, 10 Feb 2026 12:57:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC98910E567;
	Tue, 10 Feb 2026 11:57:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="G9QQ1Qr4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1005510E563;
 Tue, 10 Feb 2026 11:57:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770724651; x=1802260651;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=pwErsOgwLbr3un5GzP9BcdCLJrLywj7KiDxutoyTg04=;
 b=G9QQ1Qr4Wq8xL20QuK9lLBsysKGfoYN1IK3Y9vM0eU3ftapEfERDfEsy
 ygQA4VSUKLlY6RyaA+vl+fC05m7GNqoQ+9RWSvJ8rDZJhzfMsibHu61GO
 5kmbytSgHEzCScBkoihOmbihAjU+uKteErlVqOx7flCPD2dOqcVhcIpWn
 LoHOoeKbmgE0ADhtfpZZyuTqREVxCxQ7aJPy33VbgPW4yQqmP8AkSWA8j
 s4Cv3tT0FfwWm/O+d7sLJKhEtJE5RpBd5RJb5qSZQYGFuV9xcZBaLFbwm
 yV6CcEohoDg4TLLxlYY2q8sVd/qdqRekZ0/vfAvBp9Ji9ajGji5exHImD g==;
X-CSE-ConnectionGUID: ptrbspwPTFKsS12izw5L+g==
X-CSE-MsgGUID: qM63vD6JSQigut6Vi5gusg==
X-IronPort-AV: E=McAfee;i="6800,10657,11696"; a="82173454"
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; d="scan'208";a="82173454"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Feb 2026 03:57:31 -0800
X-CSE-ConnectionGUID: FotHYaynQ8i5KDPZZW0qiw==
X-CSE-MsgGUID: jDhgKCpJR7u9maQ00bUpdQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; d="scan'208";a="211076283"
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO fedora)
 ([10.245.244.80])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Feb 2026 03:57:27 -0800
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Alistair Popple <apopple@nvidia.com>,
 Ralph Campbell <rcampbell@nvidia.com>, Christoph Hellwig <hch@lst.de>,
 Jason Gunthorpe <jgg@mellanox.com>, Jason Gunthorpe <jgg@ziepe.ca>,
 Leon Romanovsky <leon@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 Matthew Brost <matthew.brost@intel.com>,
 John Hubbard <jhubbard@nvidia.com>, linux-mm@kvack.org,
 dri-devel@lists.freedesktop.org, stable@vger.kernel.org
Subject: [PATCH v5] mm: Fix a hmm_range_fault() livelock / starvation problem
Date: Tue, 10 Feb 2026 12:56:53 +0100
Message-ID: <20260210115653.92413-1-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.52.0
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.31 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[14];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	TAGGED_RCPT(0.00)[dri-devel];
	FROM_NEQ_ENVFROM(0.00)[thomas.hellstrom@linux.intel.com,dri-devel-bounces@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+]
X-Rspamd-Queue-Id: 8999B11A7AE
X-Rspamd-Action: no action

If hmm_range_fault() fails a folio_trylock() in do_swap_page,
trying to acquire the lock of a device-private folio for migration,
to ram, the function will spin until it succeeds grabbing the lock.

However, if the process holding the lock is depending on a work
item to be completed, which is scheduled on the same CPU as the
spinning hmm_range_fault(), that work item might be starved and
we end up in a livelock / starvation situation which is never
resolved.

This can happen, for example if the process holding the
device-private folio lock is stuck in
   migrate_device_unmap()->lru_add_drain_all()
sinc lru_add_drain_all() requires a short work-item
to be run on all online cpus to complete.

A prerequisite for this to happen is:
a) Both zone device and system memory folios are considered in
   migrate_device_unmap(), so that there is a reason to call
   lru_add_drain_all() for a system memory folio while a
   folio lock is held on a zone device folio.
b) The zone device folio has an initial mapcount > 1 which causes
   at least one migration PTE entry insertion to be deferred to
   try_to_migrate(), which can happen after the call to
   lru_add_drain_all().
c) No or voluntary only preemption.

This all seems pretty unlikely to happen, but indeed is hit by
the "xe_exec_system_allocator" igt test.

Resolve this by waiting for the folio to be unlocked if the
folio_trylock() fails in do_swap_page().

Rename migration_entry_wait_on_locked() to
softleaf_entry_wait_unlock() and update its documentation to
indicate the new use-case.

Future code improvements might consider moving
the lru_add_drain_all() call in migrate_device_unmap() to be
called *after* all pages have migration entries inserted.
That would eliminate also b) above.

v2:
- Instead of a cond_resched() in hmm_range_fault(),
  eliminate the problem by waiting for the folio to be unlocked
  in do_swap_page() (Alistair Popple, Andrew Morton)
v3:
- Add a stub migration_entry_wait_on_locked() for the
  !CONFIG_MIGRATION case. (Kernel Test Robot)
v4:
- Rename migrate_entry_wait_on_locked() to
  softleaf_entry_wait_on_locked() and update docs (Alistair Popple)
v5:
- Add a WARN_ON_ONCE() for the !CONFIG_MIGRATION
  version of softleaf_entry_wait_on_locked().
- Modify wording around function names in the commit message
  (Andrew Morton)

Suggested-by: Alistair Popple <apopple@nvidia.com>
Fixes: 1afaeb8293c9 ("mm/migrate: Trylock device page in do_swap_page")
Cc: Ralph Campbell <rcampbell@nvidia.com>
Cc: Christoph Hellwig <hch@lst.de>
Cc: Jason Gunthorpe <jgg@mellanox.com>
Cc: Jason Gunthorpe <jgg@ziepe.ca>
Cc: Leon Romanovsky <leon@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: John Hubbard <jhubbard@nvidia.com>
Cc: Alistair Popple <apopple@nvidia.com>
Cc: linux-mm@kvack.org
Cc: <dri-devel@lists.freedesktop.org>
Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Cc: <stable@vger.kernel.org> # v6.15+
Reviewed-by: John Hubbard <jhubbard@nvidia.com> #v3
---
 include/linux/migrate.h | 10 +++++++++-
 mm/filemap.c            | 15 ++++++++++-----
 mm/memory.c             |  3 ++-
 mm/migrate.c            |  8 ++++----
 mm/migrate_device.c     |  2 +-
 5 files changed, 26 insertions(+), 12 deletions(-)

diff --git a/include/linux/migrate.h b/include/linux/migrate.h
index 26ca00c325d9..d5af2b7f577b 100644
--- a/include/linux/migrate.h
+++ b/include/linux/migrate.h
@@ -65,7 +65,7 @@ bool isolate_folio_to_list(struct folio *folio, struct list_head *list);
 
 int migrate_huge_page_move_mapping(struct address_space *mapping,
 		struct folio *dst, struct folio *src);
-void migration_entry_wait_on_locked(softleaf_t entry, spinlock_t *ptl)
+void softleaf_entry_wait_on_locked(softleaf_t entry, spinlock_t *ptl)
 		__releases(ptl);
 void folio_migrate_flags(struct folio *newfolio, struct folio *folio);
 int folio_migrate_mapping(struct address_space *mapping,
@@ -97,6 +97,14 @@ static inline int set_movable_ops(const struct movable_operations *ops, enum pag
 	return -ENOSYS;
 }
 
+static inline void softleaf_entry_wait_on_locked(softleaf_t entry, spinlock_t *ptl)
+	__releases(ptl)
+{
+	WARN_ON_ONCE(1);
+
+	spin_unlock(ptl);
+}
+
 #endif /* CONFIG_MIGRATION */
 
 #ifdef CONFIG_NUMA_BALANCING
diff --git a/mm/filemap.c b/mm/filemap.c
index ebd75684cb0a..d98e4883f13d 100644
--- a/mm/filemap.c
+++ b/mm/filemap.c
@@ -1379,14 +1379,16 @@ static inline int folio_wait_bit_common(struct folio *folio, int bit_nr,
 
 #ifdef CONFIG_MIGRATION
 /**
- * migration_entry_wait_on_locked - Wait for a migration entry to be removed
- * @entry: migration swap entry.
+ * softleaf_entry_wait_on_locked - Wait for a migration entry or
+ * device_private entry to be removed.
+ * @entry: migration or device_private swap entry.
  * @ptl: already locked ptl. This function will drop the lock.
  *
- * Wait for a migration entry referencing the given page to be removed. This is
+ * Wait for a migration entry referencing the given page, or device_private
+ * entry referencing a dvice_private page to be unlocked. This is
  * equivalent to folio_put_wait_locked(folio, TASK_UNINTERRUPTIBLE) except
  * this can be called without taking a reference on the page. Instead this
- * should be called while holding the ptl for the migration entry referencing
+ * should be called while holding the ptl for @entry referencing
  * the page.
  *
  * Returns after unlocking the ptl.
@@ -1394,7 +1396,7 @@ static inline int folio_wait_bit_common(struct folio *folio, int bit_nr,
  * This follows the same logic as folio_wait_bit_common() so see the comments
  * there.
  */
-void migration_entry_wait_on_locked(softleaf_t entry, spinlock_t *ptl)
+void softleaf_entry_wait_on_locked(softleaf_t entry, spinlock_t *ptl)
 	__releases(ptl)
 {
 	struct wait_page_queue wait_page;
@@ -1428,6 +1430,9 @@ void migration_entry_wait_on_locked(softleaf_t entry, spinlock_t *ptl)
 	 * If a migration entry exists for the page the migration path must hold
 	 * a valid reference to the page, and it must take the ptl to remove the
 	 * migration entry. So the page is valid until the ptl is dropped.
+	 * Similarly any path attempting to drop the last reference to a
+	 * device-private page needs to grab the ptl to remove the device-private
+	 * entry.
 	 */
 	spin_unlock(ptl);
 
diff --git a/mm/memory.c b/mm/memory.c
index da360a6eb8a4..20172476a57f 100644
--- a/mm/memory.c
+++ b/mm/memory.c
@@ -4684,7 +4684,8 @@ vm_fault_t do_swap_page(struct vm_fault *vmf)
 				unlock_page(vmf->page);
 				put_page(vmf->page);
 			} else {
-				pte_unmap_unlock(vmf->pte, vmf->ptl);
+				pte_unmap(vmf->pte);
+				softleaf_entry_wait_on_locked(entry, vmf->ptl);
 			}
 		} else if (softleaf_is_hwpoison(entry)) {
 			ret = VM_FAULT_HWPOISON;
diff --git a/mm/migrate.c b/mm/migrate.c
index 4688b9e38cd2..cf6449b4202e 100644
--- a/mm/migrate.c
+++ b/mm/migrate.c
@@ -499,7 +499,7 @@ void migration_entry_wait(struct mm_struct *mm, pmd_t *pmd,
 	if (!softleaf_is_migration(entry))
 		goto out;
 
-	migration_entry_wait_on_locked(entry, ptl);
+	softleaf_entry_wait_on_locked(entry, ptl);
 	return;
 out:
 	spin_unlock(ptl);
@@ -531,10 +531,10 @@ void migration_entry_wait_huge(struct vm_area_struct *vma, unsigned long addr, p
 		 * If migration entry existed, safe to release vma lock
 		 * here because the pgtable page won't be freed without the
 		 * pgtable lock released.  See comment right above pgtable
-		 * lock release in migration_entry_wait_on_locked().
+		 * lock release in softleaf_entry_wait_on_locked().
 		 */
 		hugetlb_vma_unlock_read(vma);
-		migration_entry_wait_on_locked(entry, ptl);
+		softleaf_entry_wait_on_locked(entry, ptl);
 		return;
 	}
 
@@ -552,7 +552,7 @@ void pmd_migration_entry_wait(struct mm_struct *mm, pmd_t *pmd)
 	ptl = pmd_lock(mm, pmd);
 	if (!pmd_is_migration_entry(*pmd))
 		goto unlock;
-	migration_entry_wait_on_locked(softleaf_from_pmd(*pmd), ptl);
+	softleaf_entry_wait_on_locked(softleaf_from_pmd(*pmd), ptl);
 	return;
 unlock:
 	spin_unlock(ptl);
diff --git a/mm/migrate_device.c b/mm/migrate_device.c
index 23379663b1e1..deab89fd4541 100644
--- a/mm/migrate_device.c
+++ b/mm/migrate_device.c
@@ -176,7 +176,7 @@ static int migrate_vma_collect_huge_pmd(pmd_t *pmdp, unsigned long start,
 		}
 
 		if (softleaf_is_migration(entry)) {
-			migration_entry_wait_on_locked(entry, ptl);
+			softleaf_entry_wait_on_locked(entry, ptl);
 			spin_unlock(ptl);
 			return -EAGAIN;
 		}
-- 
2.52.0

