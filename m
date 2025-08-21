Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E6136B303CF
	for <lists+dri-devel@lfdr.de>; Thu, 21 Aug 2025 22:08:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0727810EA1D;
	Thu, 21 Aug 2025 20:08:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="fOD49HRF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 36D7610EA1B
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Aug 2025 20:08:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1755806920;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wK69Pd9CHZjKZhmlaft7kkJNdToX7IH/S9WvVIRScQg=;
 b=fOD49HRFKqBx+Jh+YkATToKV9bMInucg7AS0hzHpNKARRp1dprl6+iaqjuE27C/lFKIN6W
 dmqPhLKblNQy1oZ5uTWhnn1afLrnKSRxlIaV/6hNuVFw4Q3qkFR1TKK+XMEsQS1s8l22rO
 gWSSaO3J2B4md5pg/bQzbWez8iOVZjY=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-475-91fLzwzePliXoagQEGU9Fw-1; Thu, 21 Aug 2025 16:08:39 -0400
X-MC-Unique: 91fLzwzePliXoagQEGU9Fw-1
X-Mimecast-MFC-AGG-ID: 91fLzwzePliXoagQEGU9Fw_1755806918
Received: by mail-wr1-f72.google.com with SMTP id
 ffacd0b85a97d-3b9dc5c2820so445753f8f.1
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Aug 2025 13:08:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755806918; x=1756411718;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=wK69Pd9CHZjKZhmlaft7kkJNdToX7IH/S9WvVIRScQg=;
 b=tZFni4SUk7l5masJA0bAxYdf+KEFz42CBWnrJcJlyBXwi/FdI2EDuXerVyNXNo8bS4
 aumlJnVQ7vRM3V8QIxwiE5SQi9NlSRmm2u3r0rjQ/1i+DswOWa/mmvS44wwaggsYFVVR
 X+VQ0eerVOZA3zh3z77xmfFja8yKQJ930NDA84jPZ54GXvYakQkTaBuguqo7g9uRDeTr
 9jt76iRwIB10xbuQtEOCza15/sXUSV7nh3hzLKdoPfraoPSL+lEbanDLwMOrdi26PtCV
 vl7sgBUce/kyEYZv6ihIvDLvIFhQOI31PXeNr27kWKDbYuc2LXZgzcBdbF9yrcgeAuQ3
 YZhQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVA1OVvgQWvsuVcEPisXLJm1Q/L2XgqigV0yzxRkQYHlk/qhPEPdlASpVcp19PQm1ISZb2+3jywqVw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwPIYjx9JnQYn08i+9U5gWJwYseCZafjacqlo6aYvAMa0PkWw/M
 377q52mUjz3mLMNI4uuiU3W8SS1dvAQC76fMrDWOhsmdCxjXEAjBwhWh2cFDFZzrFRzczuLUigD
 mRtIX1lt6XDooCSdN2bxdNCeQnUEYfds4nsn06KLUrN+U4zicOnAoWL3qSDsl24SydHpUYA==
X-Gm-Gg: ASbGncsUwNV4H4+nuDuJWn2BI/fVwNsSKe8FHbJEEycuEoDiXOYViEhZIFG3FKbILR+
 0PPX/5yb/NmieBr1BZx8oCsTZ+6es+vryq8DFEVv0YKqVjDYMtbTZOG1vNGCx5AWwDtypGsAvC0
 6nmlIGj85Jtj6CKfWcXSB2Jqwb8ZJb3LOZj5b0FEp8l/KXRpBBCGPgw4gub3OK3A+RMUhLgdfn0
 +yGHrLTM1SPPCofCgb0Q9yYxjHiYIOMqrfS9+qOdbfC670IbgGtJYI/DIXgQTg/54CKXgzSQMWY
 UsSmY9JUSbyCXHm3rON0ozFB7b4gGHtQel0cfLKRVaGE5YMFsZaqN2Vse20EPqBaQQadOD+Ayi1
 9Zw0m0UAwFLjYKrry+4ID8w==
X-Received: by 2002:a5d:64e9:0:b0:3b8:d7c7:62d7 with SMTP id
 ffacd0b85a97d-3c5daefc298mr218330f8f.16.1755806917865; 
 Thu, 21 Aug 2025 13:08:37 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IETBfJ8klmP3LMs+G3FmlUfLKA9Qlb/rzelQ5gyETYamNwKefh2PCq6Da3p1XS4Ia+K1NPGrw==
X-Received: by 2002:a5d:64e9:0:b0:3b8:d7c7:62d7 with SMTP id
 ffacd0b85a97d-3c5daefc298mr218279f8f.16.1755806917364; 
 Thu, 21 Aug 2025 13:08:37 -0700 (PDT)
Received: from localhost
 (p200300d82f26ba0008036ec5991806fd.dip0.t-ipconnect.de.
 [2003:d8:2f26:ba00:803:6ec5:9918:6fd])
 by smtp.gmail.com with UTF8SMTPSA id
 ffacd0b85a97d-3c4ccbf04fasm3355197f8f.7.2025.08.21.13.08.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 21 Aug 2025 13:08:36 -0700 (PDT)
From: David Hildenbrand <david@redhat.com>
To: linux-kernel@vger.kernel.org
Cc: David Hildenbrand <david@redhat.com>,
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
Subject: [PATCH RFC 32/35] mm/gup: drop nth_page() usage in
 unpin_user_page_range_dirty_lock()
Date: Thu, 21 Aug 2025 22:06:58 +0200
Message-ID: <20250821200701.1329277-33-david@redhat.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250821200701.1329277-1-david@redhat.com>
References: <20250821200701.1329277-1-david@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: CjeHJwDqDZaK2_dXrDgkwaHTfvgKeW4tLWufKR0kzNg_1755806918
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

There is the concern that unpin_user_page_range_dirty_lock() might do
some weird merging of PFN ranges -- either now or in the future -- such
that PFN range is contiguous but the page range might not be.

Let's sanity-check for that and drop the nth_page() usage.

Signed-off-by: David Hildenbrand <david@redhat.com>
---
 mm/gup.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/mm/gup.c b/mm/gup.c
index f017ff6d7d61a..0a669a766204b 100644
--- a/mm/gup.c
+++ b/mm/gup.c
@@ -237,7 +237,7 @@ void folio_add_pin(struct folio *folio)
 static inline struct folio *gup_folio_range_next(struct page *start,
 		unsigned long npages, unsigned long i, unsigned int *ntails)
 {
-	struct page *next = nth_page(start, i);
+	struct page *next = start + i;
 	struct folio *folio = page_folio(next);
 	unsigned int nr = 1;
 
@@ -342,6 +342,9 @@ EXPORT_SYMBOL(unpin_user_pages_dirty_lock);
  * "gup-pinned page range" refers to a range of pages that has had one of the
  * pin_user_pages() variants called on that page.
  *
+ * The page range must be truly contiguous: the page range corresponds
+ * to a contiguous PFN range and all pages can be iterated naturally.
+ *
  * For the page ranges defined by [page .. page+npages], make that range (or
  * its head pages, if a compound page) dirty, if @make_dirty is true, and if the
  * page range was previously listed as clean.
@@ -359,6 +362,8 @@ void unpin_user_page_range_dirty_lock(struct page *page, unsigned long npages,
 	struct folio *folio;
 	unsigned int nr;
 
+	VM_WARN_ON_ONCE(!page_range_contiguous(page, npages));
+
 	for (i = 0; i < npages; i += nr) {
 		folio = gup_folio_range_next(page, npages, i, &nr);
 		if (make_dirty && !folio_test_dirty(folio)) {
-- 
2.50.1

