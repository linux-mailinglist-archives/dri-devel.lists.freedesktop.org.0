Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 40E07A21CD4
	for <lists+dri-devel@lfdr.de>; Wed, 29 Jan 2025 12:58:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2DD9D10E7DB;
	Wed, 29 Jan 2025 11:58:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="AUfGPf6b";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F276910E801
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Jan 2025 11:58:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1738151898;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=n2/u4hMaC1Y/nn2Uh1F1xHtHTh10RqLxBEMK6rVGx5s=;
 b=AUfGPf6b3rHxYlgicVPzaQFk6ENa9AGqO/Z5gQPByNknmJbJBzywyyI02hCyAa13dmVie7
 /nsTIxTRoQql2F/LUg2uOAn0HD4szoFxY1syboP904XOulbXhUUUBE5Knz2HcRjS3O2Fth
 tESeuMEMNzKErlIRXGfJfm0io6lg79A=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-459-AN5kZr62NCeJHU_K3iRPdQ-1; Wed, 29 Jan 2025 06:58:17 -0500
X-MC-Unique: AN5kZr62NCeJHU_K3iRPdQ-1
X-Mimecast-MFC-AGG-ID: AN5kZr62NCeJHU_K3iRPdQ
Received: by mail-wr1-f70.google.com with SMTP id
 ffacd0b85a97d-38634103b0dso3587122f8f.2
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Jan 2025 03:58:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738151896; x=1738756696;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=n2/u4hMaC1Y/nn2Uh1F1xHtHTh10RqLxBEMK6rVGx5s=;
 b=UTZFylbyWpJ3jHuSFyIrqBouQB9tiq1/PdoJ4nb8kyqLrmJaUuYrc3gbYFUFyQJ7Oi
 k/+7nL8r2ECbMelT8F7ftAO2nMOUzpl3x8y/vryCZ5F603G9i360NaPe6rZdG+F/IMyb
 81ELuyQ/np5YbOF0f6xiX/z8C9bQHqmqUKKmyVkz/wMw2HPkWzyXu5KCQcdR/SfHcSO+
 vjNpiwoZlOK+Sje1lpUN8QcuG0lRRhkNogX7u4GcLiF/lUxpabgVcrjhSDESGAEX20j9
 cMxGaF75IlE6pv28QAJbf3c+QlCxwZbqbmd2m5Dnwvp185YwjlrHtcpjYYTLIjNjQk2M
 VG/g==
X-Forwarded-Encrypted: i=1;
 AJvYcCV8iW6vy0vPyVwB0JIXg5zJML6z/H1JbQi/78EX+LI5iCc3SrOx3kS18TzdPvrPBdYxTpXSjR/b2XM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw+HT9pseUp1NwMCQpicgpqBbz4Ia2bekm3+wCbsaM6f6Qua6eW
 n+VMaEyPpH3CEwO4gyhJ1gTy14Sm3KC0ZVsOX/0RhS9CPOOYN0ZDvYoNV8oNB1ExWEWEhUdTJvB
 8ZzxBLiCekutAmyT+zxGKUmd6hx/cLASCqKQd3DbEe1QZujZLEVh/3TWti8rJ5kR/rw==
X-Gm-Gg: ASbGncuMx8L0FWgJ4br6/bvLo4ebgzWT6Vusk9l7R4mDDGdeD7Yc1TbmkLHETpqelMu
 GohY36yULWjmA8wuuOTNXGG0Pn0C3Tl6xsiOf5fi2QuaX/RD8OchYWa70jx1Ist0NKjyU0PdAfc
 41RcNJMTm75hMLD9JCBQGOs+efcTj/yq+HGNpStKFOJN/Ap6qix6jINJ3v/9NlSx91qMB7TRsVU
 fZu7LXThZsdYu+x+tCkNB0mvAQh2hEi8L85TB59R6FCyWqtN2k1CBdHeaCZ+BnNOFNrPY5nwlON
 yuLn7jX4W5IvUOPNkRgOcNbWFUJGpGY+vlNAHb40nyCHR+3Rqd978v3QGi9tDg8NwQ==
X-Received: by 2002:a05:6000:2c8:b0:38a:88f8:aac8 with SMTP id
 ffacd0b85a97d-38c52096289mr2025151f8f.54.1738151895827; 
 Wed, 29 Jan 2025 03:58:15 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEON5WkoaxoRH3qtkNX0vn2oqksdlJtc4nZs+NotAXeIJk4vQvUCQu3rl+CihtRV9gH+gpH8w==
X-Received: by 2002:a05:6000:2c8:b0:38a:88f8:aac8 with SMTP id
 ffacd0b85a97d-38c52096289mr2025126f8f.54.1738151895421; 
 Wed, 29 Jan 2025 03:58:15 -0800 (PST)
Received: from localhost
 (p200300cbc7053b0064b867195794bf13.dip0.t-ipconnect.de.
 [2003:cb:c705:3b00:64b8:6719:5794:bf13])
 by smtp.gmail.com with UTF8SMTPSA id
 ffacd0b85a97d-38c2a1764e9sm17070487f8f.17.2025.01.29.03.58.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 29 Jan 2025 03:58:14 -0800 (PST)
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
Subject: [PATCH v1 3/4] mm/memory: pass folio and pte to
 restore_exclusive_pte()
Date: Wed, 29 Jan 2025 12:58:01 +0100
Message-ID: <20250129115803.2084769-4-david@redhat.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250129115803.2084769-1-david@redhat.com>
References: <20250129115803.2084769-1-david@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: Se36MIUerzsZ2ZlLbjvJA1tJPldjDsMzHzTeTj8F27A_1738151896
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

Let's pass the folio and the pte to restore_exclusive_pte(), so we
can avoid repeated page_folio() and ptep_get(). To do that,
pass the pte to try_restore_exclusive_pte() and use a folio in there
already.

While at it, just avoid the "swp_entry_t entry" variable in
try_restore_exclusive_pte() and add a folio-locked check to
restore_exclusive_pte().

Signed-off-by: David Hildenbrand <david@redhat.com>
---
 mm/memory.c | 29 ++++++++++++++---------------
 1 file changed, 14 insertions(+), 15 deletions(-)

diff --git a/mm/memory.c b/mm/memory.c
index cd689cd8a7c8..46956994aaff 100644
--- a/mm/memory.c
+++ b/mm/memory.c
@@ -719,14 +719,13 @@ struct folio *vm_normal_folio_pmd(struct vm_area_struct *vma,
 #endif
 
 static void restore_exclusive_pte(struct vm_area_struct *vma,
-				  struct page *page, unsigned long address,
-				  pte_t *ptep)
+		struct folio *folio, struct page *page, unsigned long address,
+		pte_t *ptep, pte_t orig_pte)
 {
-	struct folio *folio = page_folio(page);
-	pte_t orig_pte;
 	pte_t pte;
 
-	orig_pte = ptep_get(ptep);
+	VM_WARN_ON_FOLIO(!folio_test_locked(folio), folio);
+
 	pte = pte_mkold(mk_pte(page, READ_ONCE(vma->vm_page_prot)));
 	if (pte_swp_soft_dirty(orig_pte))
 		pte = pte_mksoft_dirty(pte);
@@ -756,16 +755,15 @@ static void restore_exclusive_pte(struct vm_area_struct *vma,
  * Tries to restore an exclusive pte if the page lock can be acquired without
  * sleeping.
  */
-static int
-try_restore_exclusive_pte(pte_t *src_pte, struct vm_area_struct *vma,
-			unsigned long addr)
+static int try_restore_exclusive_pte(struct vm_area_struct *vma,
+		unsigned long addr, pte_t *ptep, pte_t orig_pte)
 {
-	swp_entry_t entry = pte_to_swp_entry(ptep_get(src_pte));
-	struct page *page = pfn_swap_entry_to_page(entry);
+	struct page *page = pfn_swap_entry_to_page(pte_to_swp_entry(orig_pte));
+	struct folio *folio = page_folio(page);
 
-	if (trylock_page(page)) {
-		restore_exclusive_pte(vma, page, addr, src_pte);
-		unlock_page(page);
+	if (folio_trylock(folio)) {
+		restore_exclusive_pte(vma, folio, page, addr, ptep, orig_pte);
+		folio_unlock(folio);
 		return 0;
 	}
 
@@ -871,7 +869,7 @@ copy_nonpresent_pte(struct mm_struct *dst_mm, struct mm_struct *src_mm,
 		 * (ie. COW) mappings.
 		 */
 		VM_BUG_ON(!is_cow_mapping(src_vma->vm_flags));
-		if (try_restore_exclusive_pte(src_pte, src_vma, addr))
+		if (try_restore_exclusive_pte(src_vma, addr, src_pte, orig_pte))
 			return -EBUSY;
 		return -ENOENT;
 	} else if (is_pte_marker_entry(entry)) {
@@ -3979,7 +3977,8 @@ static vm_fault_t remove_device_exclusive_entry(struct vm_fault *vmf)
 	vmf->pte = pte_offset_map_lock(vma->vm_mm, vmf->pmd, vmf->address,
 				&vmf->ptl);
 	if (likely(vmf->pte && pte_same(ptep_get(vmf->pte), vmf->orig_pte)))
-		restore_exclusive_pte(vma, vmf->page, vmf->address, vmf->pte);
+		restore_exclusive_pte(vma, folio, vmf->page, vmf->address,
+				      vmf->pte, vmf->orig_pte);
 
 	if (vmf->pte)
 		pte_unmap_unlock(vmf->pte, vmf->ptl);
-- 
2.48.1

