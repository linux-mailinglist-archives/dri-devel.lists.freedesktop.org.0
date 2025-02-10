Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D0BB3A2F8E2
	for <lists+dri-devel@lfdr.de>; Mon, 10 Feb 2025 20:38:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1814B10E607;
	Mon, 10 Feb 2025 19:38:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="S7+Hv9qA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F217510E609
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Feb 2025 19:38:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1739216325;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LvU1uLGkpTPZRA0QaV3EggyJAUMnys9Fj6An1hzKeYY=;
 b=S7+Hv9qATbgD7eU6BGWJHQtjFg/XvWB5bxFfUvSqvsOhtRdcEE4IeNgiClOMF31rNHIsEG
 P3IclXPcm/3yAy8TpJcR7uPWWc8jYMJuSkC+S2LCDxm01ykS8d4CFcyeFxTJ9lDHvH/Ymv
 F1F/6HsUs6VtGKyFIiYYc8ITAqq2JEU=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-169-h8stUddJOMiyxXE30mVQHA-1; Mon, 10 Feb 2025 14:38:44 -0500
X-MC-Unique: h8stUddJOMiyxXE30mVQHA-1
X-Mimecast-MFC-AGG-ID: h8stUddJOMiyxXE30mVQHA
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-43933b8d9b1so12562115e9.3
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Feb 2025 11:38:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739216322; x=1739821122;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=LvU1uLGkpTPZRA0QaV3EggyJAUMnys9Fj6An1hzKeYY=;
 b=kXHQmjOLqdm6m6t1+4v6X4TdWTAs+rwT/DzkvuPGeEURbfa00lm5OQOyJmb1/bVcFS
 Clt6oK1bMEbBaEvkZXkVmLAuA9pWbX7ceXU5PbqyzLB5Jv7c90kNYv8Iit5X1A0FpAft
 C06BrPWAmUcwdGq5w97MubLF1LWOESRj749GEdwRd+9txVE9o5zAZKn81sOGygu8mnrP
 yextPUDj4SSXHJlWGx/Ei89p6MAZEAyon5H/jKOSWn15JJuA+Re967Z+zCywsOPzRt5K
 04+ykOqYLnLK4bDPEuTuRVNahNs6IgqudFHDbhEnBjwX/zRi6xt1leF8SkoDMCEN83zj
 HYLg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUsEurExkpGKxDt/Cfm8yS6mV3noflp2PhkMIIzijfx3mrxxjkTVqSkPdGK8W+Qx8tmwC4DUO9pxy4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwYYilwso1GBQslqiqnPzS8ptB+zj3UtqWaOyTGOVtUfS451+U0
 xF8YXdGw2fS+UmBzt3B2Sls7BW69Tg3qwzqR/S0RVmfc8eGBLcUSyVtp9pstE7a0P8FDvBTr8uC
 35LKLEQZkdgTnRLJb4yjKTfec4xSCiY84B24NMDrwtStAkNglWfwlYLhlrpfL9pUc1Q==
X-Gm-Gg: ASbGncuwLgYdyBSxj5FcC4XBhInjrE0suv7th2crqLJ0kD4+Quv+fh0VrOoo9Bllift
 uKJGImoZOS+hJ9cJj6awRE9/eEHLUpDvJoXktsGezLz2OpE9MhwzEYDgE9FsJo1yQzYrePdXpbQ
 MQ/5NvSAihYBq8QV7hRUtzH0xuEXC7w4RAkLHbgv7uOtN8ZWSRfKU5lI111CfCRwfmZtYMgFLyc
 lwh/oTY51Ev0DC8Fz0JSLxf2uPm1WCRNLV21SjPEmuyUEbv0FOU/yn/OiFkG4mktcwEX6z8Mgtg
 9Hk1UC9UQXqhhzvd6uAmlsabXj41HzygH6lZ1DdUmWkGlLpNSgYso9Go4dOMjfdp+Q==
X-Received: by 2002:a05:600c:1e0e:b0:431:5e3c:2ff0 with SMTP id
 5b1f17b1804b1-439249889a8mr117195995e9.8.1739216322483; 
 Mon, 10 Feb 2025 11:38:42 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGjSKW3zWL6vzVGiNBIPirrt7XpGCC7ElTlo8fIz4HKSkBODD3ovt81FL+SvLTQ6DCkqg1UrQ==
X-Received: by 2002:a05:600c:1e0e:b0:431:5e3c:2ff0 with SMTP id
 5b1f17b1804b1-439249889a8mr117195855e9.8.1739216321998; 
 Mon, 10 Feb 2025 11:38:41 -0800 (PST)
Received: from localhost
 (p200300cbc734b80012c465cd348aaee6.dip0.t-ipconnect.de.
 [2003:cb:c734:b800:12c4:65cd:348a:aee6])
 by smtp.gmail.com with UTF8SMTPSA id
 ffacd0b85a97d-38ddaf333c5sm5084761f8f.36.2025.02.10.11.38.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 10 Feb 2025 11:38:40 -0800 (PST)
From: David Hildenbrand <david@redhat.com>
To: linux-kernel@vger.kernel.org
Cc: linux-doc@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-mm@kvack.org, nouveau@lists.freedesktop.org,
 linux-trace-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org,
 damon@lists.linux.dev, David Hildenbrand <david@redhat.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 =?UTF-8?q?J=C3=A9r=C3=B4me=20Glisse?= <jglisse@redhat.com>,
 Jonathan Corbet <corbet@lwn.net>, Alex Shi <alexs@kernel.org>,
 Yanteng Si <si.yanteng@linux.dev>, Karol Herbst <kherbst@redhat.com>,
 Lyude Paul <lyude@redhat.com>, Danilo Krummrich <dakr@kernel.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Masami Hiramatsu <mhiramat@kernel.org>, Oleg Nesterov <oleg@redhat.com>,
 Peter Zijlstra <peterz@infradead.org>, SeongJae Park <sj@kernel.org>,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Vlastimil Babka <vbabka@suse.cz>, Jann Horn <jannh@google.com>,
 Pasha Tatashin <pasha.tatashin@soleen.com>, Peter Xu <peterx@redhat.com>,
 Alistair Popple <apopple@nvidia.com>, Jason Gunthorpe <jgg@nvidia.com>
Subject: [PATCH v2 10/17] mm/rmap: handle device-exclusive entries correctly
 in try_to_unmap_one()
Date: Mon, 10 Feb 2025 20:37:52 +0100
Message-ID: <20250210193801.781278-11-david@redhat.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250210193801.781278-1-david@redhat.com>
References: <20250210193801.781278-1-david@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: BBbCt8W1FSS5ixJJfNaJ_t4vUHX20IDLITSDPFhnOkY_1739216323
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

try_to_unmap_one() is not prepared for that, so teach it about these
PFN swap PTEs. Note that device-private entries are so far not
applicable on that path, as we expect ZONE_DEVICE pages so far only in
migration code when it comes to the RMAP.

Note that we could currently only run into this case with
device-exclusive entries on THPs. We still adjust the mapcount on
conversion to device-exclusive; this makes the rmap walk
abort early for small folios, because we'll always have
!folio_mapped() with a single device-exclusive entry. We'll adjust the
mapcount logic once all page_vma_mapped_walk() users can properly
handle device-exclusive entries.

Further note that try_to_unmap() calls MMU notifiers and holds the
folio lock, so any device-exclusive users should be properly prepared
for a device-exclusive PTE to "vanish".

Fixes: b756a3b5e7ea ("mm: device exclusive memory access")
Signed-off-by: David Hildenbrand <david@redhat.com>
---
 mm/rmap.c | 52 +++++++++++++++++++++++++++++++++++++++-------------
 1 file changed, 39 insertions(+), 13 deletions(-)

diff --git a/mm/rmap.c b/mm/rmap.c
index 1129ed132af94..47142a656ae51 100644
--- a/mm/rmap.c
+++ b/mm/rmap.c
@@ -1648,9 +1648,9 @@ static bool try_to_unmap_one(struct folio *folio, struct vm_area_struct *vma,
 {
 	struct mm_struct *mm = vma->vm_mm;
 	DEFINE_FOLIO_VMA_WALK(pvmw, folio, vma, address, 0);
+	bool anon_exclusive, ret = true;
 	pte_t pteval;
 	struct page *subpage;
-	bool anon_exclusive, ret = true;
 	struct mmu_notifier_range range;
 	enum ttu_flags flags = (enum ttu_flags)(long)arg;
 	unsigned long pfn;
@@ -1722,7 +1722,18 @@ static bool try_to_unmap_one(struct folio *folio, struct vm_area_struct *vma,
 		/* Unexpected PMD-mapped THP? */
 		VM_BUG_ON_FOLIO(!pvmw.pte, folio);
 
-		pfn = pte_pfn(ptep_get(pvmw.pte));
+		/*
+		 * Handle PFN swap PTEs, such as device-exclusive ones, that
+		 * actually map pages.
+		 */
+		pteval = ptep_get(pvmw.pte);
+		if (likely(pte_present(pteval))) {
+			pfn = pte_pfn(pteval);
+		} else {
+			pfn = swp_offset_pfn(pte_to_swp_entry(pteval));
+			VM_WARN_ON_FOLIO(folio_test_hugetlb(folio), folio);
+		}
+
 		subpage = folio_page(folio, pfn - folio_pfn(folio));
 		address = pvmw.address;
 		anon_exclusive = folio_test_anon(folio) &&
@@ -1778,7 +1789,9 @@ static bool try_to_unmap_one(struct folio *folio, struct vm_area_struct *vma,
 				hugetlb_vma_unlock_write(vma);
 			}
 			pteval = huge_ptep_clear_flush(vma, address, pvmw.pte);
-		} else {
+			if (pte_dirty(pteval))
+				folio_mark_dirty(folio);
+		} else if (likely(pte_present(pteval))) {
 			flush_cache_page(vma, address, pfn);
 			/* Nuke the page table entry. */
 			if (should_defer_flush(mm, flags)) {
@@ -1796,6 +1809,10 @@ static bool try_to_unmap_one(struct folio *folio, struct vm_area_struct *vma,
 			} else {
 				pteval = ptep_clear_flush(vma, address, pvmw.pte);
 			}
+			if (pte_dirty(pteval))
+				folio_mark_dirty(folio);
+		} else {
+			pte_clear(mm, address, pvmw.pte);
 		}
 
 		/*
@@ -1805,10 +1822,6 @@ static bool try_to_unmap_one(struct folio *folio, struct vm_area_struct *vma,
 		 */
 		pte_install_uffd_wp_if_needed(vma, address, pvmw.pte, pteval);
 
-		/* Set the dirty flag on the folio now the pte is gone. */
-		if (pte_dirty(pteval))
-			folio_mark_dirty(folio);
-
 		/* Update high watermark before we lower rss */
 		update_hiwater_rss(mm);
 
@@ -1822,8 +1835,8 @@ static bool try_to_unmap_one(struct folio *folio, struct vm_area_struct *vma,
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
@@ -1902,6 +1915,12 @@ static bool try_to_unmap_one(struct folio *folio, struct vm_area_struct *vma,
 				set_pte_at(mm, address, pvmw.pte, pteval);
 				goto walk_abort;
 			}
+
+			/*
+			 * arch_unmap_one() is expected to be a NOP on
+			 * architectures where we could have PFN swap PTEs,
+			 * so we'll not check/care.
+			 */
 			if (arch_unmap_one(mm, vma, address, pteval) < 0) {
 				swap_free(entry);
 				set_pte_at(mm, address, pvmw.pte, pteval);
@@ -1926,10 +1945,17 @@ static bool try_to_unmap_one(struct folio *folio, struct vm_area_struct *vma,
 			swp_pte = swp_entry_to_pte(entry);
 			if (anon_exclusive)
 				swp_pte = pte_swp_mkexclusive(swp_pte);
-			if (pte_soft_dirty(pteval))
-				swp_pte = pte_swp_mksoft_dirty(swp_pte);
-			if (pte_uffd_wp(pteval))
-				swp_pte = pte_swp_mkuffd_wp(swp_pte);
+			if (likely(pte_present(pteval))) {
+				if (pte_soft_dirty(pteval))
+					swp_pte = pte_swp_mksoft_dirty(swp_pte);
+				if (pte_uffd_wp(pteval))
+					swp_pte = pte_swp_mkuffd_wp(swp_pte);
+			} else {
+				if (pte_swp_soft_dirty(pteval))
+					swp_pte = pte_swp_mksoft_dirty(swp_pte);
+				if (pte_swp_uffd_wp(pteval))
+					swp_pte = pte_swp_mkuffd_wp(swp_pte);
+			}
 			set_pte_at(mm, address, pvmw.pte, swp_pte);
 		} else {
 			/*
-- 
2.48.1

