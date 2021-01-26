Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2322F304635
	for <lists+dri-devel@lfdr.de>; Tue, 26 Jan 2021 19:21:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DBE1C6E0A6;
	Tue, 26 Jan 2021 18:21:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [63.128.21.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 063046E0A6
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Jan 2021 18:21:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611685294;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WPRqqg/hKvvV7tM4ellUlpmK/euLKyEJZWsNuDFTzlw=;
 b=NTN+dcy78OIt6FZyZxIb3YYcQOKv6ZtJ5d2R7joio1mjd2tX7+ZCFiLUfOt8hGVKAEER6I
 7BsoQOTncsxUKpqFJesDDef4n/fY1QWAO6ZmhyObszDFJu1Uw6pLperSnq9PHJozyLVVrD
 5wJXIiiD6VPzxkuf8QowJ0ITiTSfk0A=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-402-b7rwBjQNMmS8CtGWbXF7Vg-1; Tue, 26 Jan 2021 13:21:30 -0500
X-MC-Unique: b7rwBjQNMmS8CtGWbXF7Vg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 037E5107ACE8;
 Tue, 26 Jan 2021 18:21:28 +0000 (UTC)
Received: from t480s.redhat.com (ovpn-114-192.ams2.redhat.com [10.36.114.192])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9B85D6F80A;
 Tue, 26 Jan 2021 18:21:24 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v1 2/2] mm: simplify free_highmem_page() and
 free_reserved_page()
Date: Tue, 26 Jan 2021 19:21:13 +0100
Message-Id: <20210126182113.19892-3-david@redhat.com>
In-Reply-To: <20210126182113.19892-1-david@redhat.com>
References: <20210126182113.19892-1-david@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
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
Cc: linux-fbdev@vger.kernel.org, Wei Yang <richard.weiyang@linux.alibaba.com>,
 David Hildenbrand <david@redhat.com>,
 "Peter Zijlstra \(Intel\)" <peterz@infradead.org>,
 dri-devel@lists.freedesktop.org, Michal Hocko <mhocko@kernel.org>,
 linux-mm@kvack.org, Thomas Gleixner <tglx@linutronix.de>,
 Andrew Morton <akpm@linux-foundation.org>, Mike Rapoport <rppt@kernel.org>,
 Oscar Salvador <osalvador@suse.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

adjust_managed_page_count() as called by free_reserved_page() properly
handles pages in a highmem zone, so we can reuse it for
free_highmem_page().

We can now get rid of totalhigh_pages_inc() and simplify
free_reserved_page().

Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: Thomas Gleixner <tglx@linutronix.de>
Cc: "Peter Zijlstra (Intel)" <peterz@infradead.org>
Cc: Mike Rapoport <rppt@kernel.org>
Cc: Oscar Salvador <osalvador@suse.de>
Cc: Michal Hocko <mhocko@kernel.org>
Cc: Wei Yang <richard.weiyang@linux.alibaba.com>
Signed-off-by: David Hildenbrand <david@redhat.com>
---
 include/linux/highmem-internal.h |  5 -----
 include/linux/mm.h               | 16 ++--------------
 mm/page_alloc.c                  | 11 -----------
 3 files changed, 2 insertions(+), 30 deletions(-)

diff --git a/include/linux/highmem-internal.h b/include/linux/highmem-internal.h
index 1bbe96dc8be6..7902c7d8b55f 100644
--- a/include/linux/highmem-internal.h
+++ b/include/linux/highmem-internal.h
@@ -127,11 +127,6 @@ static inline unsigned long totalhigh_pages(void)
 	return (unsigned long)atomic_long_read(&_totalhigh_pages);
 }
 
-static inline void totalhigh_pages_inc(void)
-{
-	atomic_long_inc(&_totalhigh_pages);
-}
-
 static inline void totalhigh_pages_add(long count)
 {
 	atomic_long_add(count, &_totalhigh_pages);
diff --git a/include/linux/mm.h b/include/linux/mm.h
index a5d618d08506..494c69433a34 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -2303,32 +2303,20 @@ extern void free_initmem(void);
 extern unsigned long free_reserved_area(void *start, void *end,
 					int poison, const char *s);
 
-#ifdef	CONFIG_HIGHMEM
-/*
- * Free a highmem page into the buddy system, adjusting totalhigh_pages
- * and totalram_pages.
- */
-extern void free_highmem_page(struct page *page);
-#endif
-
 extern void adjust_managed_page_count(struct page *page, long count);
 extern void mem_init_print_info(const char *str);
 
 extern void reserve_bootmem_region(phys_addr_t start, phys_addr_t end);
 
 /* Free the reserved page into the buddy system, so it gets managed. */
-static inline void __free_reserved_page(struct page *page)
+static inline void free_reserved_page(struct page *page)
 {
 	ClearPageReserved(page);
 	init_page_count(page);
 	__free_page(page);
-}
-
-static inline void free_reserved_page(struct page *page)
-{
-	__free_reserved_page(page);
 	adjust_managed_page_count(page, 1);
 }
+#define free_highmem_page(page) free_reserved_page(page)
 
 static inline void mark_page_reserved(struct page *page)
 {
diff --git a/mm/page_alloc.c b/mm/page_alloc.c
index b031a5ae0bd5..b2e42f10d4d4 100644
--- a/mm/page_alloc.c
+++ b/mm/page_alloc.c
@@ -7711,17 +7711,6 @@ unsigned long free_reserved_area(void *start, void *end, int poison, const char
 	return pages;
 }
 
-#ifdef	CONFIG_HIGHMEM
-void free_highmem_page(struct page *page)
-{
-	__free_reserved_page(page);
-	totalram_pages_inc();
-	atomic_long_inc(&page_zone(page)->managed_pages);
-	totalhigh_pages_inc();
-}
-#endif
-
-
 void __init mem_init_print_info(const char *str)
 {
 	unsigned long physpages, codesize, datasize, rosize, bss_size;
-- 
2.29.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
