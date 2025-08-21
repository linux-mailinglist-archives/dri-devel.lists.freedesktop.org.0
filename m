Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E2B7B30378
	for <lists+dri-devel@lfdr.de>; Thu, 21 Aug 2025 22:07:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F34D710E9E1;
	Thu, 21 Aug 2025 20:07:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="E5sl1wE1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D7F5E10E9E1
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Aug 2025 20:07:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1755806855;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=r/kmddABpvZJu5K+QD662cz6jOGE1r8xokeQdlRgepQ=;
 b=E5sl1wE1CIsFxUa+wftRZxms6HR2vxmvN9JdZjJYNl0uTyOJx5CZ0nCloW0VrKdexTfYgZ
 N3+MiM0LTD0pGSt+G0DAUw0xS5VRBIWbGUtIJRjsSdrsQzmH7qeH3FwG7wtuUKGm6qW68O
 nSiCz60weTDbWZ1Z4QK1GAoMaZsCJY0=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-433-OpE8aRIPMqqkkUMuQYhptA-1; Thu, 21 Aug 2025 16:07:33 -0400
X-MC-Unique: OpE8aRIPMqqkkUMuQYhptA-1
X-Mimecast-MFC-AGG-ID: OpE8aRIPMqqkkUMuQYhptA_1755806853
Received: by mail-wr1-f72.google.com with SMTP id
 ffacd0b85a97d-3c584459d02so247178f8f.0
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Aug 2025 13:07:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755806853; x=1756411653;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=r/kmddABpvZJu5K+QD662cz6jOGE1r8xokeQdlRgepQ=;
 b=rU23kzVx8Zc7ka2lHW6OvBAGcr8noqA2r4w+G8Zv9R+HxA5jv2B4JLRTtj3StapZOu
 H2Wjk7QaxHJaNmm39pzncdvRcJw4Ezo0+y7GRd/919yPa57Wgh2j2k/tVF0I+LLATKS5
 MCFo7B/5Ptq3zmJl1xUvJHsWI2Jl9n8jrDIvFFRZqRPFhk7m6L34dN7Md+Il2ujuMhGI
 ndOeAxvEtpmxOAyDSc1gmaDzXi2XoBZPH5gt1qcElbK/iLJi6yqJXJSDC7l1D059E87/
 5yOof3HPjDEuQ69zB4TQf7PFXuGaNBJdOLrtU95XsAi450nUTkYie9iZiRt32CFYlP6K
 /tSw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXX/lBFodOZgNz29dggtts8LkLKL8BLqUiZ+T/If2AO3sKZR+W6FMFRAWSP+ADy+OfVhBgo2tK6fWc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyaPrGjgLZMIvMvcHKEqhA2igUVmSOI6V0gFd3WobSSeALTdDJf
 RUOJMPlkT6Un//mFWC7iiSLGjssjtFsE3nMp3nOWv2bm7jtJl7ov4fd1I3jkzJdLyUBUrsYzbux
 7JA9JXB7GHy7/ILYwH5J9PuAnNWlCN5lFYe73BgYpGqWqbCJm3Row7pyD66zhZWRTel3f3A==
X-Gm-Gg: ASbGncuUSuFvf7ZgTZgh6zoU46wkE6r0eNsVIFmMjSUTn9o3gxUQP3Aub7I2evhj0+L
 95Y5WzGwN/RXzoYd9XvgzopcMP05J0GBpUff0eooLMBph+AmI/3RnGH8k+WHLNPFV6smcZlifvX
 QlY3Q/39RXxBbVYrwGEFSxxstPjoEMAD54wFBI7XZyVUVoSA4SxtdcejuypHc5/MqWTotTB2BUx
 naqFBqtgUwBndZKcMbdeAPE/MIl3l9pno9AVs2/1TwKGSBux+61v3F5WvLYQ64imEdrUTlSFmA+
 iyvyXPl15/u9pEiqLBZoekYjab9fmhX2tYKn+QWWI9q4baI35qYI0qBXHtvyiYBzHRgSLFJOuxo
 4AIcAgE32K1LSd6Sq4mBTxA==
X-Received: by 2002:a05:6000:2dc7:b0:3b9:15eb:6464 with SMTP id
 ffacd0b85a97d-3c5daefa9e0mr244701f8f.15.1755806852611; 
 Thu, 21 Aug 2025 13:07:32 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHbqF8V2lF/CygktHxSJZNB7+pmyneW6nxhnLwTxWefpTwvecQ9FG1LkYH8lxi0WUYYPrMQFQ==
X-Received: by 2002:a05:6000:2dc7:b0:3b9:15eb:6464 with SMTP id
 ffacd0b85a97d-3c5daefa9e0mr244660f8f.15.1755806852102; 
 Thu, 21 Aug 2025 13:07:32 -0700 (PDT)
Received: from localhost
 (p200300d82f26ba0008036ec5991806fd.dip0.t-ipconnect.de.
 [2003:d8:2f26:ba00:803:6ec5:9918:6fd])
 by smtp.gmail.com with UTF8SMTPSA id
 ffacd0b85a97d-3c077789c92sm12629958f8f.52.2025.08.21.13.07.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 21 Aug 2025 13:07:31 -0700 (PDT)
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
Subject: [PATCH RFC 09/35] mm/mm_init: make memmap_init_compound() look more
 like prep_compound_page()
Date: Thu, 21 Aug 2025 22:06:35 +0200
Message-ID: <20250821200701.1329277-10-david@redhat.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250821200701.1329277-1-david@redhat.com>
References: <20250821200701.1329277-1-david@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 4-WnIjhqA4maC6eiGRJ87Z89PkAlToRtFu-aY6_y5bQ_1755806853
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

Grepping for "prep_compound_page" leaves on clueless how devdax gets its
compound pages initialized.

Let's add a comment that might help finding this open-coded
prep_compound_page() initialization more easily.

Further, let's be less smart about the ordering of initialization and just
perform the prep_compound_head() call after all tail pages were
initialized: just like prep_compound_page() does.

No need for a lengthy comment then: again, just like prep_compound_page().

Note that prep_compound_head() already does initialize stuff in page[2]
through prep_compound_head() that successive tail page initialization
will overwrite: _deferred_list, and on 32bit _entire_mapcount and
_pincount. Very likely 32bit does not apply, and likely nobody ever ends
up testing whether the _deferred_list is empty.

So it shouldn't be a fix at this point, but certainly something to clean
up.

Signed-off-by: David Hildenbrand <david@redhat.com>
---
 mm/mm_init.c | 13 +++++--------
 1 file changed, 5 insertions(+), 8 deletions(-)

diff --git a/mm/mm_init.c b/mm/mm_init.c
index 5c21b3af216b2..708466c5b2cc9 100644
--- a/mm/mm_init.c
+++ b/mm/mm_init.c
@@ -1091,6 +1091,10 @@ static void __ref memmap_init_compound(struct page *head,
 	unsigned long pfn, end_pfn = head_pfn + nr_pages;
 	unsigned int order = pgmap->vmemmap_shift;
 
+	/*
+	 * This is an open-coded prep_compound_page() whereby we avoid
+	 * walking pages twice by initializing them in the same go.
+	 */
 	__SetPageHead(head);
 	for (pfn = head_pfn + 1; pfn < end_pfn; pfn++) {
 		struct page *page = pfn_to_page(pfn);
@@ -1098,15 +1102,8 @@ static void __ref memmap_init_compound(struct page *head,
 		__init_zone_device_page(page, pfn, zone_idx, nid, pgmap);
 		prep_compound_tail(head, pfn - head_pfn);
 		set_page_count(page, 0);
-
-		/*
-		 * The first tail page stores important compound page info.
-		 * Call prep_compound_head() after the first tail page has
-		 * been initialized, to not have the data overwritten.
-		 */
-		if (pfn == head_pfn + 1)
-			prep_compound_head(head, order);
 	}
+	prep_compound_head(head, order);
 }
 
 void __ref memmap_init_zone_device(struct zone *zone,
-- 
2.50.1

