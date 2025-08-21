Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 18337B3039C
	for <lists+dri-devel@lfdr.de>; Thu, 21 Aug 2025 22:08:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A1CB10E9FC;
	Thu, 21 Aug 2025 20:08:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="AOjiswY8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5CE3F10E9FB
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Aug 2025 20:08:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1755806887;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jaRFM4K4Pg6WYlxhcM2k1BGbQ/DW6XfjnDsCttbmjXY=;
 b=AOjiswY8q7JYSpY8Iqi5mGRrJbHm74NA3YPe0Wedmvy8pniMWj5Ie9XJjd5hZEjER8S8dZ
 aGDfDfq0pBh637kOXPFCjWMG5gCdNPW83cMgGtUTqgBoX8YKQR7gCCoBgrcgPcMLqDiA99
 h68R6jd3Q3KI/OGMjdZ9ZQ5Kk4cotWg=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-511-OqgkJJNvMuCzXJrLvBS5kQ-1; Thu, 21 Aug 2025 16:08:04 -0400
X-MC-Unique: OqgkJJNvMuCzXJrLvBS5kQ-1
X-Mimecast-MFC-AGG-ID: OqgkJJNvMuCzXJrLvBS5kQ_1755806883
Received: by mail-wr1-f69.google.com with SMTP id
 ffacd0b85a97d-3b9dc566cb4so996488f8f.1
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Aug 2025 13:08:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755806883; x=1756411683;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=jaRFM4K4Pg6WYlxhcM2k1BGbQ/DW6XfjnDsCttbmjXY=;
 b=CZTGUCS5L4nlfq2vsEw4hL1zsstHejCVWc3kvC1+3O8r4m6UuQL5szqwtg2oveeOzO
 3ZvsCNuMDBTzLzA3lAove2ny9kfL6x9CFlBKLt4X2v9MUmira9H9oBJO4laj3qaQ08VZ
 w4Ol9n3/ORxziHAOUaqrrc/Pb98faTfNC1iepee+qapDQJ5Rw32c9cI/aJ3OfuuXvrHK
 2/KtIKMlyP9VcqPC8rsiu+i4xNNiqWowk501Mf9st1XZU9Msqnp5Bv8T9ldgwIbFY8RQ
 XudSUUkQ1k/Pc3XHCfBj0rek+lRHH7Uj7EbmPLMeKjxlHG2IRfVbl6mCSVz260pjinTg
 eT7w==
X-Forwarded-Encrypted: i=1;
 AJvYcCWV42LnsgNFQLnbNqZdpTkDd4gxjSl/C2PHCuOuI87KpKm+QjeVor3Vm4PSbnA5JtynM+wcNzC2p14=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy8yvA+NyE18SPxrPm/dN9cKdUeHmJDtGQDUpn7fCagx76D8omc
 D8jj1SdUBbX+J5Wdxzbk50JHzMFj8HSw8gLKzh+8qPzqwcPNP9VJTProNa7aDXP/DNE9zAO6DBA
 VxJANP4pd79EebczkVAJBUupiPKc8G5N4bCFrFMFdq0KFrwvsoy55FRxhGy/Rz6zh4PKMqQ==
X-Gm-Gg: ASbGncv7mn0vfKb7Mz0PyHrH9BrGeUpfVXWQyUoHUyQ3/HcayOKsn+5vAPc25aeiYUe
 rVkYLoqlwENaa/VYR+szleAjSQD5W+VKHyKcHKWSzrFon2fI+mk02w4lp29bIZv1Q44B4O7C7ZP
 5GYe8F+ujwYIMdeWZqdUNlCuKWMDx4Ca5hmY9WWE+0ooX6+KOdaY0h5RuCYEykfC1bkiQHnSywU
 Q4W/pQ4SiP09lbbKpSktMoKhGYuj/w7v3BwaxKGTfFmRwHum1Pd4oBczinzzEbDLZjTNLgF2pth
 F8hiXRTCTZadNQm7miTxLdCdabimjtxLG5yMIWBWAK9aLAyPsjh9g2TBw2R7N2H7ZZG+fEGXipo
 3xnT3YnX1g0G55l9rrd5F7Q==
X-Received: by 2002:a05:6000:2012:b0:3b7:dd87:d741 with SMTP id
 ffacd0b85a97d-3c5dcc095c3mr196203f8f.42.1755806882816; 
 Thu, 21 Aug 2025 13:08:02 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFiRO9AsztHDXjXXwtKcCswXKV/HQQvQjujQOlltIgK9F5s1Ca8ikdDYrX2bvCVEtKZoFK6NA==
X-Received: by 2002:a05:6000:2012:b0:3b7:dd87:d741 with SMTP id
 ffacd0b85a97d-3c5dcc095c3mr196155f8f.42.1755806882316; 
 Thu, 21 Aug 2025 13:08:02 -0700 (PDT)
Received: from localhost
 (p200300d82f26ba0008036ec5991806fd.dip0.t-ipconnect.de.
 [2003:d8:2f26:ba00:803:6ec5:9918:6fd])
 by smtp.gmail.com with UTF8SMTPSA id
 5b1f17b1804b1-45b50e0b299sm8957945e9.22.2025.08.21.13.08.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 21 Aug 2025 13:08:01 -0700 (PDT)
From: David Hildenbrand <david@redhat.com>
To: linux-kernel@vger.kernel.org
Cc: David Hildenbrand <david@redhat.com>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Alexander Potapenko <glider@google.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Brendan Jackman <jackmanb@google.com>, Christoph Lameter <cl@gentwo.org>,
 Dennis Zhou <dennis@kernel.org>, Dmitry Vyukov <dvyukov@google.com>,
 dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 iommu@lists.linux.dev, io-uring@vger.kernel.org,
 Jason Gunthorpe <jgg@nvidia.com>, Jens Axboe <axboe@kernel.dk>,
 Johannes Weiner <hannes@cmpxchg.org>, John Hubbard <jhubbard@nvidia.com>,
 kasan-dev@googlegroups.com, kvm@vger.kernel.org,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>,
 Linus Torvalds <torvalds@linux-foundation.org>, linux-arm-kernel@axis.com,
 linux-arm-kernel@lists.infradead.org, linux-crypto@vger.kernel.org,
 linux-ide@vger.kernel.org, linux-kselftest@vger.kernel.org,
 linux-mips@vger.kernel.org, linux-mmc@vger.kernel.org, linux-mm@kvack.org,
 linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
 linux-scsi@vger.kernel.org, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Marco Elver <elver@google.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Michal Hocko <mhocko@suse.com>, Mike Rapoport <rppt@kernel.org>,
 Muchun Song <muchun.song@linux.dev>, netdev@vger.kernel.org,
 Oscar Salvador <osalvador@suse.de>, Peter Xu <peterx@redhat.com>,
 Robin Murphy <robin.murphy@arm.com>,
 Suren Baghdasaryan <surenb@google.com>, Tejun Heo <tj@kernel.org>,
 virtualization@lists.linux.dev, Vlastimil Babka <vbabka@suse.cz>,
 wireguard@lists.zx2c4.com, x86@kernel.org, Zi Yan <ziy@nvidia.com>
Subject: [PATCH RFC 20/35] mips: mm: convert __flush_dcache_pages() to
 __flush_dcache_folio_pages()
Date: Thu, 21 Aug 2025 22:06:46 +0200
Message-ID: <20250821200701.1329277-21-david@redhat.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250821200701.1329277-1-david@redhat.com>
References: <20250821200701.1329277-1-david@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: XarxpVnlDOr91eq2PoVxCvvXgicASKMOzUtFa0gkClU_1755806883
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

Let's make it clearer that we are operating within a single folio by
providing both the folio and the page.

This implies that for flush_dcache_folio() we'll now avoid one more
page->folio lookup, and that we can safely drop the "nth_page" usage.

Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Signed-off-by: David Hildenbrand <david@redhat.com>
---
 arch/mips/include/asm/cacheflush.h | 11 +++++++----
 arch/mips/mm/cache.c               |  8 ++++----
 2 files changed, 11 insertions(+), 8 deletions(-)

diff --git a/arch/mips/include/asm/cacheflush.h b/arch/mips/include/asm/cacheflush.h
index 1f14132b3fc98..8a2de28936e07 100644
--- a/arch/mips/include/asm/cacheflush.h
+++ b/arch/mips/include/asm/cacheflush.h
@@ -50,13 +50,14 @@ extern void (*flush_cache_mm)(struct mm_struct *mm);
 extern void (*flush_cache_range)(struct vm_area_struct *vma,
 	unsigned long start, unsigned long end);
 extern void (*flush_cache_page)(struct vm_area_struct *vma, unsigned long page, unsigned long pfn);
-extern void __flush_dcache_pages(struct page *page, unsigned int nr);
+extern void __flush_dcache_folio_pages(struct folio *folio, struct page *page, unsigned int nr);
 
 #define ARCH_IMPLEMENTS_FLUSH_DCACHE_PAGE 1
 static inline void flush_dcache_folio(struct folio *folio)
 {
 	if (cpu_has_dc_aliases)
-		__flush_dcache_pages(&folio->page, folio_nr_pages(folio));
+		__flush_dcache_folio_pages(folio, folio_page(folio, 0),
+					   folio_nr_pages(folio));
 	else if (!cpu_has_ic_fills_f_dc)
 		folio_set_dcache_dirty(folio);
 }
@@ -64,10 +65,12 @@ static inline void flush_dcache_folio(struct folio *folio)
 
 static inline void flush_dcache_page(struct page *page)
 {
+	struct folio *folio = page_folio(page);
+
 	if (cpu_has_dc_aliases)
-		__flush_dcache_pages(page, 1);
+		__flush_dcache_folio_pages(folio, page, folio_nr_pages(folio));
 	else if (!cpu_has_ic_fills_f_dc)
-		folio_set_dcache_dirty(page_folio(page));
+		folio_set_dcache_dirty(folio);
 }
 
 #define flush_dcache_mmap_lock(mapping)		do { } while (0)
diff --git a/arch/mips/mm/cache.c b/arch/mips/mm/cache.c
index bf9a37c60e9f0..e3b4224c9a406 100644
--- a/arch/mips/mm/cache.c
+++ b/arch/mips/mm/cache.c
@@ -99,9 +99,9 @@ SYSCALL_DEFINE3(cacheflush, unsigned long, addr, unsigned long, bytes,
 	return 0;
 }
 
-void __flush_dcache_pages(struct page *page, unsigned int nr)
+void __flush_dcache_folio_pages(struct folio *folio, struct page *page,
+		unsigned int nr)
 {
-	struct folio *folio = page_folio(page);
 	struct address_space *mapping = folio_flush_mapping(folio);
 	unsigned long addr;
 	unsigned int i;
@@ -117,12 +117,12 @@ void __flush_dcache_pages(struct page *page, unsigned int nr)
 	 * get faulted into the tlb (and thus flushed) anyways.
 	 */
 	for (i = 0; i < nr; i++) {
-		addr = (unsigned long)kmap_local_page(nth_page(page, i));
+		addr = (unsigned long)kmap_local_page(page + i);
 		flush_data_cache_page(addr);
 		kunmap_local((void *)addr);
 	}
 }
-EXPORT_SYMBOL(__flush_dcache_pages);
+EXPORT_SYMBOL(__flush_dcache_folio_pages);
 
 void __flush_anon_page(struct page *page, unsigned long vmaddr)
 {
-- 
2.50.1

