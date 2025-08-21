Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A911BB303D3
	for <lists+dri-devel@lfdr.de>; Thu, 21 Aug 2025 22:08:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9705D10EA20;
	Thu, 21 Aug 2025 20:08:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="CzmGaUii";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2164110EA1C
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Aug 2025 20:08:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1755806923;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=OnKBChYNBt6k7pWFZ1VK2zlCQ3hhOdGhc0x5VCAB6rA=;
 b=CzmGaUiiH135QgXQPa2GhxtkqHGW1H7LLKC59fxfjy/fCH7u3PG6m1Jw3xTI195snKEAwO
 MKwmOT8pxEhTVPupqSKUKXZDR8f6LOvZWaGzkF3qZDd/4qRO9CeWunW6QgOekDSW9NiJK9
 Ql3EEslQ0UceZ+uqpdIGpf4/iz2sLlg=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-81-1bEyJkzcNtWfpbq1QR3BAA-1; Thu, 21 Aug 2025 16:08:41 -0400
X-MC-Unique: 1bEyJkzcNtWfpbq1QR3BAA-1
X-Mimecast-MFC-AGG-ID: 1bEyJkzcNtWfpbq1QR3BAA_1755806920
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-45b51411839so825545e9.0
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Aug 2025 13:08:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755806920; x=1756411720;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=OnKBChYNBt6k7pWFZ1VK2zlCQ3hhOdGhc0x5VCAB6rA=;
 b=WIBI2JbxMxdKxH0jUYoAAF2CJFDV4IdjxbPnr738lWdaCNb+rP5hA0TAtVFqsity8s
 0CUCAkqtw33144/XKqvu4Aok0SKetIw5rDVD4KpebLuO/hxMbLcbGVDnCoe+epRP/zs3
 GbOtIzeOG3nTOXKGSI4WhRkZjCdcNZeZYszH/UKZBE3Qo4nIL1CPxGnAj1mSMJw2bOJl
 /4O2fc3DMt1zmmYiJNi1tELOpfCkuEsUXJLgl7IedRPslPLnwvtkMAmVH9X0NShN/2+b
 fHXQ/qAJFKIeQW5bUyzWuUrI5qReEUT7f5usRL+rdhiARMmGX1unmru1/buybpTw4U0m
 7oMA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXIDKDW8G7A/8IzKNuEa5SKBFu+LyRMtHxmH6gIdW8ONswreJUWgZ9As+Ix5sz1vivwR4wUg25JvGY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yxrhk2eyOBmXd6cN3EfAQEwHVDpZmy6NOv2XaeVlfjKPgE/sC8i
 6OodVo/u0N/dPvCOSKjJ/EopRiNyoyYduljNqZRtXj3zjO9IBzFIjJ+0PIhiMJRicvQgqKJQqqd
 LOy7nwLNISeISj9QdFnNyGFY5ohSJfKw8d3Hh0zaJobwhQj2LopKv3wiO9EqC3i1GIY/BPw==
X-Gm-Gg: ASbGncv9clix/quwOSNQyfufA/J6tWf4LYd6Lcixs8x2BHstupTP+Jh3grG+ZiowwKd
 8hFssUQg6bCFOBSU4xhwNNmFaPocYuQIFGF5wTAAEYjgBvzQPomGzBW6xPQl6bREjA2SScIjHG9
 UPTDbK4hF6GgvfelJ/zeHyWNQ2h2KZb7kcKYrSoPh93K9TXT246JPqaanPeGkvhPXJZczBv275P
 FxeBBGstBnpK+5p5UcQhedLqPzWJ4hEieGRWEA9GwVC0vaFm5vWHOsG5xkJEQSqAPplhmH6WwYs
 Tjd/h/HQTMMxUQi0uky659lUVrKLMWeEFo6xqOEl7RUH70SrkEpCTMLbYz/jKXYVi2vUNG+ZziH
 /gb3aWV312Cb8Hu7cUXp/6A==
X-Received: by 2002:a05:6000:2405:b0:3a4:e841:b236 with SMTP id
 ffacd0b85a97d-3c5dc735246mr192363f8f.33.1755806920385; 
 Thu, 21 Aug 2025 13:08:40 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFrWn9aM0C/1GZBHvF1UL+fKz7WhllpDdsBGpm2GmVOIF4Yc/dULhABMcTdk4u9sLFplZdR3g==
X-Received: by 2002:a05:6000:2405:b0:3a4:e841:b236 with SMTP id
 ffacd0b85a97d-3c5dc735246mr192328f8f.33.1755806919917; 
 Thu, 21 Aug 2025 13:08:39 -0700 (PDT)
Received: from localhost
 (p200300d82f26ba0008036ec5991806fd.dip0.t-ipconnect.de.
 [2003:d8:2f26:ba00:803:6ec5:9918:6fd])
 by smtp.gmail.com with UTF8SMTPSA id
 ffacd0b85a97d-3c0771c166bsm12920369f8f.33.2025.08.21.13.08.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 21 Aug 2025 13:08:39 -0700 (PDT)
From: David Hildenbrand <david@redhat.com>
To: linux-kernel@vger.kernel.org
Cc: David Hildenbrand <david@redhat.com>,
 Alexander Potapenko <glider@google.com>, Marco Elver <elver@google.com>,
 Dmitry Vyukov <dvyukov@google.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Brendan Jackman <jackmanb@google.com>, Christoph Lameter <cl@gentwo.org>,
 Dennis Zhou <dennis@kernel.org>, dri-devel@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, iommu@lists.linux.dev,
 io-uring@vger.kernel.org, Jason Gunthorpe <jgg@nvidia.com>,
 Jens Axboe <axboe@kernel.dk>, Johannes Weiner <hannes@cmpxchg.org>,
 John Hubbard <jhubbard@nvidia.com>, kasan-dev@googlegroups.com,
 kvm@vger.kernel.org, "Liam R. Howlett" <Liam.Howlett@oracle.com>,
 Linus Torvalds <torvalds@linux-foundation.org>, linux-arm-kernel@axis.com,
 linux-arm-kernel@lists.infradead.org, linux-crypto@vger.kernel.org,
 linux-ide@vger.kernel.org, linux-kselftest@vger.kernel.org,
 linux-mips@vger.kernel.org, linux-mmc@vger.kernel.org, linux-mm@kvack.org,
 linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
 linux-scsi@vger.kernel.org, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Michal Hocko <mhocko@suse.com>, Mike Rapoport <rppt@kernel.org>,
 Muchun Song <muchun.song@linux.dev>, netdev@vger.kernel.org,
 Oscar Salvador <osalvador@suse.de>, Peter Xu <peterx@redhat.com>,
 Robin Murphy <robin.murphy@arm.com>,
 Suren Baghdasaryan <surenb@google.com>, Tejun Heo <tj@kernel.org>,
 virtualization@lists.linux.dev, Vlastimil Babka <vbabka@suse.cz>,
 wireguard@lists.zx2c4.com, x86@kernel.org, Zi Yan <ziy@nvidia.com>
Subject: [PATCH RFC 33/35] kfence: drop nth_page() usage
Date: Thu, 21 Aug 2025 22:06:59 +0200
Message-ID: <20250821200701.1329277-34-david@redhat.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250821200701.1329277-1-david@redhat.com>
References: <20250821200701.1329277-1-david@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: o_GWoo8LxBEqpidvlnwRg1Y071YI_CM3Csz-XjMUNyQ_1755806920
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

We want to get rid of nth_page(), and kfence init code is the last user.

Unfortunately, we might actually walk a PFN range where the pages are
not contiguous, because we might be allocating an area from memblock
that could span memory sections in problematic kernel configs (SPARSEMEM
without SPARSEMEM_VMEMMAP).

We could check whether the page range is contiguous
using page_range_contiguous() and failing kfence init, or making kfence
incompatible these problemtic kernel configs.

Let's keep it simple and simply use pfn_to_page() by iterating PFNs.

Cc: Alexander Potapenko <glider@google.com>
Cc: Marco Elver <elver@google.com>
Cc: Dmitry Vyukov <dvyukov@google.com>
Signed-off-by: David Hildenbrand <david@redhat.com>
---
 mm/kfence/core.c | 17 ++++++++++-------
 1 file changed, 10 insertions(+), 7 deletions(-)

diff --git a/mm/kfence/core.c b/mm/kfence/core.c
index 0ed3be100963a..793507c77f9e8 100644
--- a/mm/kfence/core.c
+++ b/mm/kfence/core.c
@@ -594,15 +594,15 @@ static void rcu_guarded_free(struct rcu_head *h)
  */
 static unsigned long kfence_init_pool(void)
 {
-	unsigned long addr;
-	struct page *pages;
+	unsigned long addr, pfn, start_pfn, end_pfn;
 	int i;
 
 	if (!arch_kfence_init_pool())
 		return (unsigned long)__kfence_pool;
 
 	addr = (unsigned long)__kfence_pool;
-	pages = virt_to_page(__kfence_pool);
+	start_pfn = PHYS_PFN(virt_to_phys(__kfence_pool));
+	end_pfn = start_pfn + KFENCE_POOL_SIZE / PAGE_SIZE;
 
 	/*
 	 * Set up object pages: they must have PGTY_slab set to avoid freeing
@@ -612,12 +612,13 @@ static unsigned long kfence_init_pool(void)
 	 * fast-path in SLUB, and therefore need to ensure kfree() correctly
 	 * enters __slab_free() slow-path.
 	 */
-	for (i = 0; i < KFENCE_POOL_SIZE / PAGE_SIZE; i++) {
-		struct slab *slab = page_slab(nth_page(pages, i));
+	for (pfn = start_pfn; pfn != end_pfn; pfn++) {
+		struct slab *slab;
 
 		if (!i || (i % 2))
 			continue;
 
+		slab = page_slab(pfn_to_page(pfn));
 		__folio_set_slab(slab_folio(slab));
 #ifdef CONFIG_MEMCG
 		slab->obj_exts = (unsigned long)&kfence_metadata_init[i / 2 - 1].obj_exts |
@@ -664,11 +665,13 @@ static unsigned long kfence_init_pool(void)
 	return 0;
 
 reset_slab:
-	for (i = 0; i < KFENCE_POOL_SIZE / PAGE_SIZE; i++) {
-		struct slab *slab = page_slab(nth_page(pages, i));
+	for (pfn = start_pfn; pfn != end_pfn; pfn++) {
+		struct slab *slab;
 
 		if (!i || (i % 2))
 			continue;
+
+		slab = page_slab(pfn_to_page(pfn));
 #ifdef CONFIG_MEMCG
 		slab->obj_exts = 0;
 #endif
-- 
2.50.1

