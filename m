Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 71DD2A21CA5
	for <lists+dri-devel@lfdr.de>; Wed, 29 Jan 2025 12:54:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 36C8710E7CA;
	Wed, 29 Jan 2025 11:54:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="fdzn0TjX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9EB6410E7CA
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Jan 2025 11:54:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1738151681;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dBI2mWOVOmwqsdVlja7jNAEkV5b5lmKCa22lnGaqVYs=;
 b=fdzn0TjXMN2bKaGhrTThvk5lBfdREaaanDT9xDIGz2rFrQJkdEjDrbSu4GR4nsbD0p5qAT
 aimdZp1o1gnscr11A8Dxew1pUVm/i/GYc3fTrGPGcutinfCX7ulhCOeE1Husuv5FRR8E0j
 P0asp1NcFM4i01+ph+vT5F5PAxAPnPw=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-612-2KpZzaQPNeSLqEJ3EIHiNA-1; Wed, 29 Jan 2025 06:54:40 -0500
X-MC-Unique: 2KpZzaQPNeSLqEJ3EIHiNA-1
X-Mimecast-MFC-AGG-ID: 2KpZzaQPNeSLqEJ3EIHiNA
Received: by mail-wr1-f71.google.com with SMTP id
 ffacd0b85a97d-38bf4913659so5053243f8f.1
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Jan 2025 03:54:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738151679; x=1738756479;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=dBI2mWOVOmwqsdVlja7jNAEkV5b5lmKCa22lnGaqVYs=;
 b=MWq+8XelWmQfr6PvFPx2l4eNVpuIDF+1AsdigAG2nzmOQia/16B2T9OzlAqL2+9eaI
 JjP8bKFS7TbfIS+rPafZNBqL0d4icDTOaAKxIoWJPfqkBQBGUD/SgTc5k7r4vyqxSdJj
 W4rrditY0tykgt8NEx1JUJKDoFe4SptxpodhdJmhFUsziOLS7bEUxjhYMc5e4IVg7HWj
 aFFzQeIkStKb7f1KSGFByJX+XVhlB+bJ+VqYPGzKCoKv1Yln4hNTbEIXQKofIhx+UkJU
 kopW34uUJrFI7QFuL58sW9IWSJw2l8iD4GE4VlfIOkJmMPJ5klsmthS1wFtHndWQ8rfQ
 Ivlg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVUgXNxrrKfVXLo1LWimohUOsVxotz92bN+GJ0+iMl+B8Xpf5xlcQEw5ZNTlq3JdhI6WNNq0pX87hA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy9+A19b9WTn59oPIV7PkYcO7iCd56+IwZbXjjXE1fG44sGJpAC
 LMZjKPbrgyjk9WOOZsp3o8j6nBAlpooM6OIqYBYoJBUI9DdTjcZJwbVWbiWn7fzbUXlHr8Za8Iz
 OME+LoGar3tRBwlUBbQW+s+DV8GnhNUDiXkGn1pZHvjZwiYhPJMs14groqDyBBOJn0w==
X-Gm-Gg: ASbGncuaH9vA8ZQ1A2eA2F427yRYVNf2W0/N7aKM28dpDJDUEUm5INqpXB6qjSpa8ik
 3UP+ET3BVxsao+dPKDTJn3Ke4EWPEh0WdZiOQP5eUQ9eCLPZ9coX8y7YiD3Rs/Ehi6rZVMMNtua
 oDkBaXp9XA21vA/Uhx4T0kEJwIwkPHRUpoUWbZaG6hf1Y4VmQ1C1efyCfy3rbBKs0+3etUA+XJB
 DXmon/Cw+a7l2Xpw+kHY/Rbe+JsRA+xn3T+abfrvlTyudxgcktGqgOCbvFFGMARlHjYNczRsPKE
 ZKpVuNLWyFlWN9gyYobmRaPiBYWKf1PaFChsrhAvJoF1/5fij78HCC0+bc9jxEtTvg==
X-Received: by 2002:a5d:47c9:0:b0:38c:3eab:2e17 with SMTP id
 ffacd0b85a97d-38c5194dae9mr2038623f8f.2.1738151679494; 
 Wed, 29 Jan 2025 03:54:39 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEuFMqyDWaa/JVieaul0deYFiTz0a9oHzheZm+vFN4IrpXYFm3MUhtZq6TOTjv8DbS0i6Ouqg==
X-Received: by 2002:a5d:47c9:0:b0:38c:3eab:2e17 with SMTP id
 ffacd0b85a97d-38c5194dae9mr2038593f8f.2.1738151679034; 
 Wed, 29 Jan 2025 03:54:39 -0800 (PST)
Received: from localhost
 (p200300cbc7053b0064b867195794bf13.dip0.t-ipconnect.de.
 [2003:cb:c705:3b00:64b8:6719:5794:bf13])
 by smtp.gmail.com with UTF8SMTPSA id
 ffacd0b85a97d-38c2a1764d3sm17086479f8f.19.2025.01.29.03.54.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 29 Jan 2025 03:54:38 -0800 (PST)
From: David Hildenbrand <david@redhat.com>
To: linux-kernel@vger.kernel.org
Cc: linux-doc@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-mm@kvack.org, nouveau@lists.freedesktop.org,
 David Hildenbrand <david@redhat.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 =?UTF-8?q?J=C3=A9r=C3=B4me=20Glisse?= <jglisse@redhat.com>,
 Jonathan Corbet <corbet@lwn.net>, Alex Shi <alexs@kernel.org>,
 Yanteng Si <si.yanteng@linux.dev>, Karol Herbst <kherbst@redhat.com>,
 Lyude Paul <lyude@redhat.com>, Danilo Krummrich <dakr@kernel.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Vlastimil Babka <vbabka@suse.cz>, Jann Horn <jannh@google.com>,
 Pasha Tatashin <pasha.tatashin@soleen.com>, Peter Xu <peterx@redhat.com>,
 Alistair Popple <apopple@nvidia.com>, Jason Gunthorpe <jgg@nvidia.com>
Subject: [PATCH v1 09/12] mm/rmap: handle device-exclusive entries correctly
 in try_to_migrate_one()
Date: Wed, 29 Jan 2025 12:54:07 +0100
Message-ID: <20250129115411.2077152-10-david@redhat.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250129115411.2077152-1-david@redhat.com>
References: <20250129115411.2077152-1-david@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: gJuRP4g0oCuJfKNWpnoL0D9nzakk0hAuF8Uhl3Yjc_o_1738151679
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
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

Ever since commit b756a3b5e7ea ("mm: device exclusive memory access")
we can return with a device-exclusive entry from page_vma_mapped_walk().

try_to_migrate_one() is not prepared for that, so teach it about these
non-present nonswap PTEs. We already handle device-private entries by
specializing on the folio, so we can reshuffle that code to make it
work on the non-present nonswap PTEs instead.

Get rid of most folio_is_device_private() handling, except when handling
HWPoison. It's unclear what the right thing to do here is.

Note that we could currently only run into this case with
device-exclusive entries on THPs; but as we have a refcount vs. mapcount
inbalance, folio splitting etc. will just bail out early and not even
try migrating. For order-0 folios, we still adjust the mapcount on
conversion to device-exclusive, making the rmap walk abort early
(folio_mapcount() == 0 and breaking swapout). We'll fix
that next, now that try_to_migrate_one() can handle it.

Further note that try_to_migrate() calls MMU notifiers and holds the
folio lock, so any device-exclusive users should be properly prepared
for this device-exclusive PTE to "vanish".

Fixes: b756a3b5e7ea ("mm: device exclusive memory access")
Signed-off-by: David Hildenbrand <david@redhat.com>
---
 mm/rmap.c | 125 ++++++++++++++++++++++--------------------------------
 1 file changed, 51 insertions(+), 74 deletions(-)

diff --git a/mm/rmap.c b/mm/rmap.c
index 12900f367a2a..903a78e60781 100644
--- a/mm/rmap.c
+++ b/mm/rmap.c
@@ -2040,9 +2040,9 @@ static bool try_to_migrate_one(struct folio *folio, struct vm_area_struct *vma,
 {
 	struct mm_struct *mm = vma->vm_mm;
 	DEFINE_FOLIO_VMA_WALK(pvmw, folio, vma, address, 0);
+	bool anon_exclusive, writable, ret = true;
 	pte_t pteval;
 	struct page *subpage;
-	bool anon_exclusive, ret = true;
 	struct mmu_notifier_range range;
 	enum ttu_flags flags = (enum ttu_flags)(long)arg;
 	unsigned long pfn;
@@ -2109,24 +2109,20 @@ static bool try_to_migrate_one(struct folio *folio, struct vm_area_struct *vma,
 		/* Unexpected PMD-mapped THP? */
 		VM_BUG_ON_FOLIO(!pvmw.pte, folio);
 
-		pfn = pte_pfn(ptep_get(pvmw.pte));
-
-		if (folio_is_zone_device(folio)) {
-			/*
-			 * Our PTE is a non-present device exclusive entry and
-			 * calculating the subpage as for the common case would
-			 * result in an invalid pointer.
-			 *
-			 * Since only PAGE_SIZE pages can currently be
-			 * migrated, just set it to page. This will need to be
-			 * changed when hugepage migrations to device private
-			 * memory are supported.
-			 */
-			VM_BUG_ON_FOLIO(folio_nr_pages(folio) > 1, folio);
-			subpage = &folio->page;
+		/*
+		 * We can end up here with selected non-swap entries that
+		 * actually map pages similar to PROT_NONE; see
+		 * page_vma_mapped_walk()->check_pte().
+		 */
+		pteval = ptep_get(pvmw.pte);
+		if (likely(pte_present(pteval))) {
+			pfn = pte_pfn(pteval);
 		} else {
-			subpage = folio_page(folio, pfn - folio_pfn(folio));
+			pfn = swp_offset_pfn(pte_to_swp_entry(pteval));
+			VM_WARN_ON_FOLIO(folio_test_hugetlb(folio), folio);
 		}
+
+		subpage = folio_page(folio, pfn - folio_pfn(folio));
 		address = pvmw.address;
 		anon_exclusive = folio_test_anon(folio) &&
 				 PageAnonExclusive(subpage);
@@ -2182,7 +2178,10 @@ static bool try_to_migrate_one(struct folio *folio, struct vm_area_struct *vma,
 			}
 			/* Nuke the hugetlb page table entry */
 			pteval = huge_ptep_clear_flush(vma, address, pvmw.pte);
-		} else {
+			if (pte_dirty(pteval))
+				folio_mark_dirty(folio);
+			writable = pte_write(pteval);
+		} else if (likely(pte_present(pteval))) {
 			flush_cache_page(vma, address, pfn);
 			/* Nuke the page table entry. */
 			if (should_defer_flush(mm, flags)) {
@@ -2200,54 +2199,21 @@ static bool try_to_migrate_one(struct folio *folio, struct vm_area_struct *vma,
 			} else {
 				pteval = ptep_clear_flush(vma, address, pvmw.pte);
 			}
+			if (pte_dirty(pteval))
+				folio_mark_dirty(folio);
+			writable = pte_write(pteval);
+		} else {
+			pte_clear(mm, address, pvmw.pte);
+			writable = is_writable_device_private_entry(pte_to_swp_entry(pteval));
 		}
 
-		/* Set the dirty flag on the folio now the pte is gone. */
-		if (pte_dirty(pteval))
-			folio_mark_dirty(folio);
+		VM_WARN_ON_FOLIO(writable && folio_test_anon(folio) &&
+				!anon_exclusive, folio);
 
 		/* Update high watermark before we lower rss */
 		update_hiwater_rss(mm);
 
-		if (folio_is_device_private(folio)) {
-			unsigned long pfn = folio_pfn(folio);
-			swp_entry_t entry;
-			pte_t swp_pte;
-
-			if (anon_exclusive)
-				WARN_ON_ONCE(folio_try_share_anon_rmap_pte(folio,
-									   subpage));
-
-			/*
-			 * Store the pfn of the page in a special migration
-			 * pte. do_swap_page() will wait until the migration
-			 * pte is removed and then restart fault handling.
-			 */
-			entry = pte_to_swp_entry(pteval);
-			if (is_writable_device_private_entry(entry))
-				entry = make_writable_migration_entry(pfn);
-			else if (anon_exclusive)
-				entry = make_readable_exclusive_migration_entry(pfn);
-			else
-				entry = make_readable_migration_entry(pfn);
-			swp_pte = swp_entry_to_pte(entry);
-
-			/*
-			 * pteval maps a zone device page and is therefore
-			 * a swap pte.
-			 */
-			if (pte_swp_soft_dirty(pteval))
-				swp_pte = pte_swp_mksoft_dirty(swp_pte);
-			if (pte_swp_uffd_wp(pteval))
-				swp_pte = pte_swp_mkuffd_wp(swp_pte);
-			set_pte_at(mm, pvmw.address, pvmw.pte, swp_pte);
-			trace_set_migration_pte(pvmw.address, pte_val(swp_pte),
-						folio_order(folio));
-			/*
-			 * No need to invalidate here it will synchronize on
-			 * against the special swap migration pte.
-			 */
-		} else if (PageHWPoison(subpage)) {
+		if (PageHWPoison(subpage) && !folio_is_device_private(folio)) {
 			pteval = swp_entry_to_pte(make_hwpoison_entry(subpage));
 			if (folio_test_hugetlb(folio)) {
 				hugetlb_count_sub(folio_nr_pages(folio), mm);
@@ -2257,8 +2223,8 @@ static bool try_to_migrate_one(struct folio *folio, struct vm_area_struct *vma,
 				dec_mm_counter(mm, mm_counter(folio));
 				set_pte_at(mm, address, pvmw.pte, pteval);
 			}
-
-		} else if (pte_unused(pteval) && !userfaultfd_armed(vma)) {
+		} else if (likely(pte_present(pteval)) && pte_unused(pteval) &&
+			   !userfaultfd_armed(vma)) {
 			/*
 			 * The guest indicated that the page content is of no
 			 * interest anymore. Simply discard the pte, vmscan
@@ -2274,6 +2240,11 @@ static bool try_to_migrate_one(struct folio *folio, struct vm_area_struct *vma,
 			swp_entry_t entry;
 			pte_t swp_pte;
 
+			/*
+			 * arch_unmap_one() is expected to be a NOP on
+			 * architectures where we could have non-swp entries
+			 * here.
+			 */
 			if (arch_unmap_one(mm, vma, address, pteval) < 0) {
 				if (folio_test_hugetlb(folio))
 					set_huge_pte_at(mm, address, pvmw.pte,
@@ -2284,8 +2255,6 @@ static bool try_to_migrate_one(struct folio *folio, struct vm_area_struct *vma,
 				page_vma_mapped_walk_done(&pvmw);
 				break;
 			}
-			VM_BUG_ON_PAGE(pte_write(pteval) && folio_test_anon(folio) &&
-				       !anon_exclusive, subpage);
 
 			/* See folio_try_share_anon_rmap_pte(): clear PTE first. */
 			if (folio_test_hugetlb(folio)) {
@@ -2310,7 +2279,7 @@ static bool try_to_migrate_one(struct folio *folio, struct vm_area_struct *vma,
 			 * pte. do_swap_page() will wait until the migration
 			 * pte is removed and then restart fault handling.
 			 */
-			if (pte_write(pteval))
+			if (writable)
 				entry = make_writable_migration_entry(
 							page_to_pfn(subpage));
 			else if (anon_exclusive)
@@ -2319,15 +2288,23 @@ static bool try_to_migrate_one(struct folio *folio, struct vm_area_struct *vma,
 			else
 				entry = make_readable_migration_entry(
 							page_to_pfn(subpage));
-			if (pte_young(pteval))
-				entry = make_migration_entry_young(entry);
-			if (pte_dirty(pteval))
-				entry = make_migration_entry_dirty(entry);
-			swp_pte = swp_entry_to_pte(entry);
-			if (pte_soft_dirty(pteval))
-				swp_pte = pte_swp_mksoft_dirty(swp_pte);
-			if (pte_uffd_wp(pteval))
-				swp_pte = pte_swp_mkuffd_wp(swp_pte);
+			if (likely(pte_present(pteval))) {
+				if (pte_young(pteval))
+					entry = make_migration_entry_young(entry);
+				if (pte_dirty(pteval))
+					entry = make_migration_entry_dirty(entry);
+				swp_pte = swp_entry_to_pte(entry);
+				if (pte_soft_dirty(pteval))
+					swp_pte = pte_swp_mksoft_dirty(swp_pte);
+				if (pte_uffd_wp(pteval))
+					swp_pte = pte_swp_mkuffd_wp(swp_pte);
+			} else {
+				swp_pte = swp_entry_to_pte(entry);
+				if (pte_swp_soft_dirty(pteval))
+					swp_pte = pte_swp_mksoft_dirty(swp_pte);
+				if (pte_swp_uffd_wp(pteval))
+					swp_pte = pte_swp_mkuffd_wp(swp_pte);
+			}
 			if (folio_test_hugetlb(folio))
 				set_huge_pte_at(mm, address, pvmw.pte, swp_pte,
 						hsz);
-- 
2.48.1

