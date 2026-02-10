Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mI5zKRuOimm6LwAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 10 Feb 2026 02:47:07 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D59651160DB
	for <lists+dri-devel@lfdr.de>; Tue, 10 Feb 2026 02:47:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C11B610E39D;
	Tue, 10 Feb 2026 01:36:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="TNPtFMUU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6007D10E39D
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Feb 2026 01:36:17 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 9B8B660008;
 Tue, 10 Feb 2026 01:36:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3ED35C116C6;
 Tue, 10 Feb 2026 01:36:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
 s=korg; t=1770687376;
 bh=HP0w4T2ynjDn3Nhm+Da/XwHGKl4T2rN0CmZvW9gTDfY=;
 h=Date:To:From:Subject:From;
 b=TNPtFMUUCzPpG1Mcbj3pj4D6ieBsnSGCaV5QKGx7qwFBwKPs607wLM9SlhDvRhlKZ
 uN2J4WZT+tO4XW2HRPhH+a9lpb2961Eon99leon3V8fEarGAiCBCDBvjRjbfScvYEg
 n3eAm3MH09LIxqGm9s19HDtEYEjz0M6ssdRFKqY8=
Date: Mon, 09 Feb 2026 17:36:15 -0800
To: mm-commits@vger.kernel.org, stable@vger.kernel.org, rcampbell@nvidia.com,
 matthew.brost@intel.com, leon@kernel.org, jhubbard@nvidia.com, jgg@ziepe.ca,
 jgg@mellanox.com, hch@lst.de, dri-devel@lists.freedesktop.org,
 apopple@nvidia.com, thomas.hellstrom@linux.intel.com,
 akpm@linux-foundation.org
From: Andrew Morton <akpm@linux-foundation.org>
Subject: + mm-fix-a-hmm_range_fault-livelock-starvation-problem.patch added to
 mm-hotfixes-unstable branch
Message-Id: <20260210013616.3ED35C116C6@smtp.kernel.org>
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
X-Spamd-Result: default: False [5.89 / 15.00];
	R_BAD_CTE_7BIT(3.50)[unknown];
	BROKEN_CONTENT_TYPE(1.50)[];
	R_DKIM_REJECT(1.00)[linux-foundation.org:s=korg];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DMARC_NA(0.00)[linux-foundation.org];
	FORGED_RECIPIENTS(0.00)[m:mm-commits@vger.kernel.org,m:stable@vger.kernel.org,m:rcampbell@nvidia.com,m:matthew.brost@intel.com,m:leon@kernel.org,m:jhubbard@nvidia.com,m:jgg@ziepe.ca,m:jgg@mellanox.com,m:hch@lst.de,m:apopple@nvidia.com,m:thomas.hellstrom@linux.intel.com,m:akpm@linux-foundation.org,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	RCPT_COUNT_TWELVE(0.00)[13];
	GREYLIST(0.00)[pass,body];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[akpm@linux-foundation.org,dri-devel-bounces@lists.freedesktop.org];
	RCVD_TLS_LAST(0.00)[];
	ARC_NA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	TO_DN_NONE(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[akpm@linux-foundation.org,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[linux-foundation.org:-];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	TAGGED_RCPT(0.00)[dri-devel];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nvidia.com:email,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,lst.de:email,lists.freedesktop.org:email]
X-Rspamd-Queue-Id: D59651160DB
X-Rspamd-Action: no action


The patch titled
     Subject: mm: fix a hmm_range_fault() livelock / starvation problem
has been added to the -mm mm-hotfixes-unstable branch.  Its filename is
     mm-fix-a-hmm_range_fault-livelock-starvation-problem.patch

This patch will shortly appear at
     https://git.kernel.org/pub/scm/linux/kernel/git/akpm/25-new.git/tree/patches/mm-fix-a-hmm_range_fault-livelock-starvation-problem.patch

This patch will later appear in the mm-hotfixes-unstable branch at
    git://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm

Before you just go and hit "reply", please:
   a) Consider who else should be cc'ed
   b) Prefer to cc a suitable mailing list as well
   c) Ideally: find the original patch on the mailing list and do a
      reply-to-all to that, adding suitable additional cc's

*** Remember to use Documentation/process/submit-checklist.rst when testing your code ***

The -mm tree is included into linux-next via various
branches at git://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm
and is updated there most days

------------------------------------------------------
From: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Subject: mm: fix a hmm_range_fault() livelock / starvation problem
Date: Thu, 5 Feb 2026 12:10:28 +0100

If hmm_range_fault() fails a folio_trylock() in do_swap_page, trying to
acquire the lock of a device-private folio for migration, to ram, the
function will spin until it succeeds grabbing the lock.

However, if the process holding the lock is depending on a work item to be
completed, which is scheduled on the same CPU as the spinning
hmm_range_fault(), that work item might be starved and we end up in a
livelock / starvation situation which is never resolved.

This can happen, for example if the process holding the
device-private folio lock is stuck in
   migrate_device_unmap()->lru_add_drain_all()
The lru_add_drain_all() function requires a short work-item
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

This all seems pretty unlikely to happen, but indeed is hit by the
"xe_exec_system_allocator" igt test.

Resolve this by waiting for the folio to be unlocked if the
folio_trylock() fails in the do_swap_page() function.

Rename the migration_entry_wait_on_locked() function to
softleaf_entry_wait_unlock() and update its documentation to indicate the
new use-case.

Future code improvements might consider moving the lru_add_drain_all()
call in migrate_device_unmap() to be called *after* all pages have
migration entries inserted.  That would eliminate also b) above.

Link: https://lkml.kernel.org/r/20260205111028.200506-1-thomas.hellstrom@linux.intel.com
Fixes: 1afaeb8293c9 ("mm/migrate: Trylock device page in do_swap_page")
Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Suggested-by: Alistair Popple <apopple@nvidia.com>
Reviewed-by: John Hubbard <jhubbard@nvidia.com> #v3
Cc: Ralph Campbell <rcampbell@nvidia.com>
Cc: Christoph Hellwig <hch@lst.de>
Cc: Jason Gunthorpe <jgg@mellanox.com>
Cc: Jason Gunthorpe <jgg@ziepe.ca>
Cc: Leon Romanovsky <leon@kernel.org>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Alistair Popple <apopple@nvidia.com>
Cc: <dri-devel@lists.freedesktop.org>
Cc: <stable@vger.kernel.org>	[6.15+]
Signed-off-by: Andrew Morton <akpm@linux-foundation.org>
---

 include/linux/migrate.h |    8 +++++++-
 mm/filemap.c            |   15 ++++++++++-----
 mm/memory.c             |    3 ++-
 mm/migrate.c            |    8 ++++----
 mm/migrate_device.c     |    2 +-
 5 files changed, 24 insertions(+), 12 deletions(-)

--- a/include/linux/migrate.h~mm-fix-a-hmm_range_fault-livelock-starvation-problem
+++ a/include/linux/migrate.h
@@ -65,7 +65,7 @@ bool isolate_folio_to_list(struct folio
 
 int migrate_huge_page_move_mapping(struct address_space *mapping,
 		struct folio *dst, struct folio *src);
-void migration_entry_wait_on_locked(softleaf_t entry, spinlock_t *ptl)
+void softleaf_entry_wait_on_locked(softleaf_t entry, spinlock_t *ptl)
 		__releases(ptl);
 void folio_migrate_flags(struct folio *newfolio, struct folio *folio);
 int folio_migrate_mapping(struct address_space *mapping,
@@ -97,6 +97,12 @@ static inline int set_movable_ops(const
 	return -ENOSYS;
 }
 
+static inline void softleaf_entry_wait_on_locked(softleaf_t entry, spinlock_t *ptl)
+	__releases(ptl)
+{
+	spin_unlock(ptl);
+}
+
 #endif /* CONFIG_MIGRATION */
 
 #ifdef CONFIG_NUMA_BALANCING
--- a/mm/filemap.c~mm-fix-a-hmm_range_fault-livelock-starvation-problem
+++ a/mm/filemap.c
@@ -1379,14 +1379,16 @@ repeat:
 
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
@@ -1394,7 +1396,7 @@ repeat:
  * This follows the same logic as folio_wait_bit_common() so see the comments
  * there.
  */
-void migration_entry_wait_on_locked(softleaf_t entry, spinlock_t *ptl)
+void softleaf_entry_wait_on_locked(softleaf_t entry, spinlock_t *ptl)
 	__releases(ptl)
 {
 	struct wait_page_queue wait_page;
@@ -1428,6 +1430,9 @@ void migration_entry_wait_on_locked(soft
 	 * If a migration entry exists for the page the migration path must hold
 	 * a valid reference to the page, and it must take the ptl to remove the
 	 * migration entry. So the page is valid until the ptl is dropped.
+	 * Similarly any path attempting to drop the last reference to a
+	 * device-private page needs to grab the ptl to remove the device-private
+	 * entry.
 	 */
 	spin_unlock(ptl);
 
--- a/mm/memory.c~mm-fix-a-hmm_range_fault-livelock-starvation-problem
+++ a/mm/memory.c
@@ -4684,7 +4684,8 @@ vm_fault_t do_swap_page(struct vm_fault
 				unlock_page(vmf->page);
 				put_page(vmf->page);
 			} else {
-				pte_unmap_unlock(vmf->pte, vmf->ptl);
+				pte_unmap(vmf->pte);
+				softleaf_entry_wait_on_locked(entry, vmf->ptl);
 			}
 		} else if (softleaf_is_hwpoison(entry)) {
 			ret = VM_FAULT_HWPOISON;
--- a/mm/migrate.c~mm-fix-a-hmm_range_fault-livelock-starvation-problem
+++ a/mm/migrate.c
@@ -499,7 +499,7 @@ void migration_entry_wait(struct mm_stru
 	if (!softleaf_is_migration(entry))
 		goto out;
 
-	migration_entry_wait_on_locked(entry, ptl);
+	softleaf_entry_wait_on_locked(entry, ptl);
 	return;
 out:
 	spin_unlock(ptl);
@@ -531,10 +531,10 @@ void migration_entry_wait_huge(struct vm
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
 
@@ -552,7 +552,7 @@ void pmd_migration_entry_wait(struct mm_
 	ptl = pmd_lock(mm, pmd);
 	if (!pmd_is_migration_entry(*pmd))
 		goto unlock;
-	migration_entry_wait_on_locked(softleaf_from_pmd(*pmd), ptl);
+	softleaf_entry_wait_on_locked(softleaf_from_pmd(*pmd), ptl);
 	return;
 unlock:
 	spin_unlock(ptl);
--- a/mm/migrate_device.c~mm-fix-a-hmm_range_fault-livelock-starvation-problem
+++ a/mm/migrate_device.c
@@ -176,7 +176,7 @@ static int migrate_vma_collect_huge_pmd(
 		}
 
 		if (softleaf_is_migration(entry)) {
-			migration_entry_wait_on_locked(entry, ptl);
+			softleaf_entry_wait_on_locked(entry, ptl);
 			spin_unlock(ptl);
 			return -EAGAIN;
 		}
_

Patches currently in -mm which might be from thomas.hellstrom@linux.intel.com are

mm-fix-a-hmm_range_fault-livelock-starvation-problem.patch

