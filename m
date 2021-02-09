Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 023653149D8
	for <lists+dri-devel@lfdr.de>; Tue,  9 Feb 2021 09:01:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3CA876EB35;
	Tue,  9 Feb 2021 07:56:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from hqnvemgate24.nvidia.com (hqnvemgate24.nvidia.com
 [216.228.121.143])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B5B46E914;
 Tue,  9 Feb 2021 01:14:31 +0000 (UTC)
Received: from hqmail.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate24.nvidia.com (using TLS: TLSv1.2, AES256-SHA)
 id <B6021e0cb0000>; Mon, 08 Feb 2021 17:09:31 -0800
Received: from DRHQMAIL107.nvidia.com (10.27.9.16) by HQMAIL105.nvidia.com
 (172.20.187.12) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 9 Feb
 2021 01:09:30 +0000
Received: from localhost (172.20.145.6) by DRHQMAIL107.nvidia.com (10.27.9.16)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3;
 Tue, 9 Feb 2021 01:09:30 +0000
From: Alistair Popple <apopple@nvidia.com>
To: <linux-mm@kvack.org>, <nouveau@lists.freedesktop.org>,
 <bskeggs@redhat.com>, <akpm@linux-foundation.org>
Subject: [PATCH 3/9] mm/migrate: Add a unmap and pin migration mode
Date: Tue, 9 Feb 2021 12:07:16 +1100
Message-ID: <20210209010722.13839-4-apopple@nvidia.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210209010722.13839-1-apopple@nvidia.com>
References: <20210209010722.13839-1-apopple@nvidia.com>
MIME-Version: 1.0
X-Originating-IP: [172.20.145.6]
X-ClientProxiedBy: HQMAIL101.nvidia.com (172.20.187.10) To
 DRHQMAIL107.nvidia.com (10.27.9.16)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1612832971; bh=Nl943mKMg37Pc1ltxa9ZN05rhPl/lD4q5AUltrL00lQ=;
 h=From:To:CC:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
 References:MIME-Version:Content-Transfer-Encoding:Content-Type:
 X-Originating-IP:X-ClientProxiedBy;
 b=RSfV/6n22L8B9L88ISCIcLRmuaycGEy2U2CrxEJJWlEZe3EV5du/srmJ5lOiUlAcc
 uysSrHk7c+ijaLvrbrhUr6SyTFhfOnKqL8pu83RcZrhJl/sNic7fkkNc79Nn3gCz9I
 Q/E5LTlFqudI5RvzKKpX2wkVW29/lTqJaCVwJP4BJGua1XqOoBlTBk1geVd+TBZr2s
 S96Vy+eKqKZWUWWIObQIdjaDr1ehjn38CwxZ/Wl7a1jEmTkHgKiBbvXSX0RxSUg/vh
 COAn9oBG9fN79irvxlx9flPiAGLu9kCNeAhJL8z97n1aA82q+DUhuxULGvj8QKW6xE
 PVOZAfn16nwsw==
X-Mailman-Approved-At: Tue, 09 Feb 2021 07:56:28 +0000
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
Cc: rcampbell@nvidia.com, linux-doc@vger.kernel.org, jhubbard@nvidia.com,
 Alistair Popple <apopple@nvidia.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, jglisse@redhat.com, kvm-ppc@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Some drivers need to ensure that a device has access to a particular
user page whilst preventing userspace access to that page. For example
this is required to allow a driver to implement atomic access to a page
when the device hardware does not support atomic access to system
memory.

This could be implemented by migrating the data to the device, however
this is not always optimal and may fail in some circumstances. In these
cases it is advantageous to remap the page for device access without
actually migrating the data.

To allow this kind of access introduce an unmap and pin flag called
MIGRATE_PFN_PIN/UNPIN for migration pfns. This will cause the original
page to be remapped to the provided device private page as normal, but
instead of returning or freeing the original CPU page it will pin it and
leave it isolated from the LRU.

This ensures the page remains pinned so that a device may access it
exclusively. Any userspace CPU accesses will fault and trigger the
normal device private migrate_to_ram() callback which must migrate the
mapping back to the original page, after which the device will no longer
have exclusive access to the page.

As the original page does not get freed it is safe to allow the unmap
and pin operation to proceed in cases where there are extra page
references present.

Signed-off-by: Alistair Popple <apopple@nvidia.com>
---
 include/linux/migrate.h      |  2 +
 include/linux/migrate_mode.h |  1 +
 mm/migrate.c                 | 74 +++++++++++++++++++++++++-----------
 3 files changed, 54 insertions(+), 23 deletions(-)

diff --git a/include/linux/migrate.h b/include/linux/migrate.h
index 4594838a0f7c..449fc61f9a99 100644
--- a/include/linux/migrate.h
+++ b/include/linux/migrate.h
@@ -144,6 +144,8 @@ static inline int migrate_misplaced_transhuge_page(struct mm_struct *mm,
 #define MIGRATE_PFN_MIGRATE	(1UL << 1)
 #define MIGRATE_PFN_LOCKED	(1UL << 2)
 #define MIGRATE_PFN_WRITE	(1UL << 3)
+#define MIGRATE_PFN_PIN		(1UL << 4)
+#define MIGRATE_PFN_UNPIN	(1UL << 4)
 #define MIGRATE_PFN_SHIFT	6
 
 static inline struct page *migrate_pfn_to_page(unsigned long mpfn)
diff --git a/include/linux/migrate_mode.h b/include/linux/migrate_mode.h
index 883c99249033..823497eda927 100644
--- a/include/linux/migrate_mode.h
+++ b/include/linux/migrate_mode.h
@@ -17,6 +17,7 @@ enum migrate_mode {
 	MIGRATE_SYNC_LIGHT,
 	MIGRATE_SYNC,
 	MIGRATE_SYNC_NO_COPY,
+	MIGRATE_REFERENCED,
 };
 
 #endif		/* MIGRATE_MODE_H_INCLUDED */
diff --git a/mm/migrate.c b/mm/migrate.c
index fe8bb322e2e3..71edc2679c8e 100644
--- a/mm/migrate.c
+++ b/mm/migrate.c
@@ -410,7 +410,7 @@ int migrate_page_move_mapping(struct address_space *mapping,
 		 * never have extra references except during migration, but it
 		 * is safe to ignore these.
 		 */
-		if (!is_device_private_page(page) &&
+		if (!is_device_private_page(page) && extra_count >= 0 &&
 			page_count(page) != expected_count)
 			return -EAGAIN;
 
@@ -421,6 +421,8 @@ int migrate_page_move_mapping(struct address_space *mapping,
 			__SetPageSwapBacked(newpage);
 
 		return MIGRATEPAGE_SUCCESS;
+	} else if (extra_count < 0) {
+		return -EINVAL;
 	}
 
 	oldzone = page_zone(page);
@@ -704,12 +706,15 @@ int migrate_page(struct address_space *mapping,
 
 	BUG_ON(PageWriteback(page));	/* Writeback must be complete */
 
-	rc = migrate_page_move_mapping(mapping, newpage, page, 0);
+	if (mode == MIGRATE_REFERENCED)
+		rc = migrate_page_move_mapping(mapping, newpage, page, -1);
+	else
+		rc = migrate_page_move_mapping(mapping, newpage, page, 0);
 
 	if (rc != MIGRATEPAGE_SUCCESS)
 		return rc;
 
-	if (mode != MIGRATE_SYNC_NO_COPY)
+	if (mode != MIGRATE_SYNC_NO_COPY && mode != MIGRATE_REFERENCED)
 		migrate_page_copy(newpage, page);
 	else
 		migrate_page_states(newpage, page);
@@ -2327,15 +2332,15 @@ static int migrate_vma_collect_hole(unsigned long start,
 	if (!vma_is_anonymous(walk->vma)) {
 		for (addr = start; addr < end; addr += PAGE_SIZE) {
 			migrate->src[migrate->npages] = 0;
-			migrate->dst[migrate->npages] = 0;
 			migrate->npages++;
 		}
 		return 0;
 	}
 
 	for (addr = start; addr < end; addr += PAGE_SIZE) {
-		migrate->src[migrate->npages] = MIGRATE_PFN_MIGRATE;
-		migrate->dst[migrate->npages] = 0;
+		if (vma_is_anonymous(walk->vma) &&
+		    !(migrate->src[migrate->npages] & MIGRATE_PFN_PIN))
+			migrate->src[migrate->npages] = MIGRATE_PFN_MIGRATE;
 		migrate->npages++;
 		migrate->cpages++;
 	}
@@ -2425,7 +2430,8 @@ static int migrate_vma_collect_pmd(pmd_t *pmdp,
 		pte = *ptep;
 
 		if (pte_none(pte)) {
-			if (vma_is_anonymous(vma)) {
+			if (vma_is_anonymous(vma) &&
+				!(migrate->src[migrate->npages] & MIGRATE_PFN_PIN)) {
 				mpfn = MIGRATE_PFN_MIGRATE;
 				migrate->cpages++;
 			}
@@ -2525,8 +2531,7 @@ static int migrate_vma_collect_pmd(pmd_t *pmdp,
 		}
 
 next:
-		migrate->dst[migrate->npages] = 0;
-		migrate->src[migrate->npages++] = mpfn;
+		migrate->src[migrate->npages++] |= mpfn;
 	}
 	arch_leave_lazy_mmu_mode();
 	pte_unmap_unlock(ptep - 1, ptl);
@@ -2695,7 +2700,13 @@ static void migrate_vma_prepare(struct migrate_vma *migrate)
 			put_page(page);
 		}
 
-		if (!migrate_vma_check_page(page)) {
+		/*
+		 * If the page is being unmapped and pinned it isn't actually
+		 * going to migrate, so it's safe to continue the operation with
+		 * an elevated refcount.
+		 */
+		if (!migrate_vma_check_page(page) &&
+			!(migrate->src[i] & MIGRATE_PFN_PIN)) {
 			if (remap) {
 				migrate->src[i] &= ~MIGRATE_PFN_MIGRATE;
 				migrate->cpages--;
@@ -2757,25 +2768,34 @@ static void migrate_vma_unmap(struct migrate_vma *migrate)
 		if (!page || !(migrate->src[i] & MIGRATE_PFN_MIGRATE))
 			continue;
 
-		if (page_mapped(page)) {
+		if (page_mapped(page))
 			try_to_unmap(page, flags);
-			if (page_mapped(page))
-				goto restore;
+
+		if (page_mapped(page))
+			migrate->src[i] &= ~MIGRATE_PFN_MIGRATE;
+
+		if (!migrate_vma_check_page(page) &&
+		    !(migrate->src[i] & MIGRATE_PFN_PIN))
+			migrate->src[i] &= ~MIGRATE_PFN_MIGRATE;
+
+		if (migrate->src[i] & MIGRATE_PFN_PIN) {
+			if (page_maybe_dma_pinned(page))
+				migrate->src[i] &= ~MIGRATE_PFN_MIGRATE;
+			else
+				page_ref_add(page, GUP_PIN_COUNTING_BIAS);
 		}
 
-		if (migrate_vma_check_page(page))
+		if (!(migrate->src[i] & MIGRATE_PFN_MIGRATE)) {
+			migrate->cpages--;
+			restore++;
 			continue;
-
-restore:
-		migrate->src[i] &= ~MIGRATE_PFN_MIGRATE;
-		migrate->cpages--;
-		restore++;
+		}
 	}
 
 	for (addr = start, i = 0; i < npages && restore; addr += PAGE_SIZE, i++) {
 		struct page *page = migrate_pfn_to_page(migrate->src[i]);
 
-		if (!page || (migrate->src[i] & MIGRATE_PFN_MIGRATE))
+		if (!page || (migrate->src[i] &	MIGRATE_PFN_MIGRATE))
 			continue;
 
 		remove_migration_ptes(page, page, false);
@@ -3092,7 +3112,11 @@ void migrate_vma_pages(struct migrate_vma *migrate)
 			}
 		}
 
-		r = migrate_page(mapping, newpage, page, MIGRATE_SYNC_NO_COPY);
+		if (migrate->src[i] & MIGRATE_PFN_PIN)
+			r = migrate_page(mapping, newpage, page, MIGRATE_REFERENCED);
+		else
+			r = migrate_page(mapping, newpage, page, MIGRATE_SYNC_NO_COPY);
+
 		if (r != MIGRATEPAGE_SUCCESS)
 			migrate->src[i] &= ~MIGRATE_PFN_MIGRATE;
 	}
@@ -3148,15 +3172,19 @@ void migrate_vma_finalize(struct migrate_vma *migrate)
 
 		if (is_zone_device_page(page))
 			put_page(page);
-		else
+		else if (!(migrate->src[i] & MIGRATE_PFN_PIN))
 			putback_lru_page(page);
 
 		if (newpage != page) {
 			unlock_page(newpage);
 			if (is_zone_device_page(newpage))
 				put_page(newpage);
-			else
+			else {
+				if (migrate->dst[i] & MIGRATE_PFN_UNPIN)
+					page_ref_sub(newpage, GUP_PIN_COUNTING_BIAS);
+
 				putback_lru_page(newpage);
+			}
 		}
 	}
 }
-- 
2.20.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
