Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 06A4AB30386
	for <lists+dri-devel@lfdr.de>; Thu, 21 Aug 2025 22:08:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF97510E9E8;
	Thu, 21 Aug 2025 20:07:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="avYwfnmW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3FDC410E9DC
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Aug 2025 20:07:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1755806865;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=S+ehuLujhp6/6Ui8/ETipqTmnVB5w2txW2o3jJCUzuY=;
 b=avYwfnmWBHx7Q5+yK1yZQ7HXl1r8jy0mqqocL2DYABQ1BUOR5locfhf3Lj9y+2jyyNS1ro
 QMNvmr3P/ofhETQSRdF2kQSLiuHnKrklM6VSvoBGCWqsqpBoUAyxQcZfTn6GzomqCK1fYG
 pzI8kB+Z0ET7kbh0JulgRT4gnwL37JE=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-73-3kugW28YME2E0jL9388uZw-1; Thu, 21 Aug 2025 16:07:41 -0400
X-MC-Unique: 3kugW28YME2E0jL9388uZw-1
X-Mimecast-MFC-AGG-ID: 3kugW28YME2E0jL9388uZw_1755806861
Received: by mail-wm1-f71.google.com with SMTP id
 5b1f17b1804b1-45a1b0c5377so7090515e9.3
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Aug 2025 13:07:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755806860; x=1756411660;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=S+ehuLujhp6/6Ui8/ETipqTmnVB5w2txW2o3jJCUzuY=;
 b=LDMl6BOkQI75NlOn41LhcejkrXFPijIz3rFLPyRpk55vtb1zXx6L6f2wSpN3RGpD7O
 zgWXRTF8Xez8kc9r+8l8POPF35XG5UqVOLI8iaCx2OVoZDZWHdJj6KiqjoAayefnOYhM
 lm2lq1OMRLV1pAYj11hUOCl6SNI1/vcaz1izPJ2yegnBbfFWrTXziFBufPRzK78Uz/I9
 afyl9lJznwI5pdn6hNOS+7Wm7/W9vxn5R3nkboXQVC7gQ28WhfYVhrZ06KUkhY6cpGzw
 HWywjl2CzB/y6953vRXcrg4rSjmmeDDIeMdJJ9dqIRSokd+RHvwiVFPLJQaTPZncGv+x
 0HKg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWymQXlPJ5//BvTMqPYTCKUD0lK2ieeikuhqnyODAiL6SKV9b6IFB4hySWqsq61Ar2LvPGdYmg9d+s=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxRN9dML12BrWVR5rzOGNhpApWOKTsE4V6UF4jfR2bp71io9c9C
 RtnvIm18rBb9tAVZC7akS+fs6Vy/M2GxnazaDzdCaqpVx4lqyX2nrx+wVZ9dU0YSCaC886pHkV7
 wFyG8t1nXl1m0b2oor0PhC0aehlBE1aUa7Ek8FXNpObXTF5M2DECcisV0UmbVkp/EOILDzA==
X-Gm-Gg: ASbGncs/MPRqoYTRMrOMH5NYwd6oJj5B1f/z5mHRp9C8S7VXxA2IcJkJ6nDJZTPrgqQ
 ZHDiHZqI4CytOUR4A1VcqKNtR82RJCBNLvUnaS2aK+usgTuRswZowmr4oGUw+iP5GYayNfvPTPk
 clvaG737siAYF4yjZQHuIPoJbLVpAYp6LQVpomTnqMLbayPKcN3fnt8EWHkJ0dX/8t7bojHgd6Z
 kdXaoIMLmQ8C1hElCUubdX6U26sDUsb7WmLo5B/3p9LDPrlW+LOq8JOZc1a5LfmckJhBwXUvPbT
 T8KXWu7l4bUJSdVwPH0jNUAhNVA/aKDgUhk//OAWX5F6RnZvIUrmWqO0F56FIIBcePDnwKdx0y3
 nf1Ca5i3PsSm0D3PQPeR5Hg==
X-Received: by 2002:a05:600c:19cd:b0:458:be62:dcd3 with SMTP id
 5b1f17b1804b1-45b517c2fc0mr3572785e9.17.1755806860535; 
 Thu, 21 Aug 2025 13:07:40 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGrtwXyk8M0MMGhBsDq6sn2/zjKB5pcui5JGSP2GUX5VAX4EhNVsrp5ZVJRMStvpa9W7AdEeg==
X-Received: by 2002:a05:600c:19cd:b0:458:be62:dcd3 with SMTP id
 5b1f17b1804b1-45b517c2fc0mr3572545e9.17.1755806860106; 
 Thu, 21 Aug 2025 13:07:40 -0700 (PDT)
Received: from localhost
 (p200300d82f26ba0008036ec5991806fd.dip0.t-ipconnect.de.
 [2003:d8:2f26:ba00:803:6ec5:9918:6fd])
 by smtp.gmail.com with UTF8SMTPSA id
 5b1f17b1804b1-45b50e3a52bsm8600375e9.21.2025.08.21.13.07.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 21 Aug 2025 13:07:39 -0700 (PDT)
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
Subject: [PATCH RFC 12/35] mm: limit folio/compound page sizes in problematic
 kernel configs
Date: Thu, 21 Aug 2025 22:06:38 +0200
Message-ID: <20250821200701.1329277-13-david@redhat.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250821200701.1329277-1-david@redhat.com>
References: <20250821200701.1329277-1-david@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 03HiYvUPGngCp3cJwkSN8SQf97KtAM1dhlA7Z7pEjzE_1755806861
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

Let's limit the maximum folio size in problematic kernel config where
the memmap is allocated per memory section (SPARSEMEM without
SPARSEMEM_VMEMMAP) to a single memory section.

Currently, only a single architectures supports ARCH_HAS_GIGANTIC_PAGE
but not SPARSEMEM_VMEMMAP: sh.

Fortunately, the biggest hugetlb size sh supports is 64 MiB
(HUGETLB_PAGE_SIZE_64MB) and the section size is at least 64 MiB
(SECTION_SIZE_BITS == 26), so their use case is not degraded.

As folios and memory sections are naturally aligned to their order-2 size
in memory, consequently a single folio can no longer span multiple memory
sections on these problematic kernel configs.

nth_page() is no longer required when operating within a single compound
page / folio.

Signed-off-by: David Hildenbrand <david@redhat.com>
---
 include/linux/mm.h | 22 ++++++++++++++++++----
 1 file changed, 18 insertions(+), 4 deletions(-)

diff --git a/include/linux/mm.h b/include/linux/mm.h
index 77737cbf2216a..48a985e17ef4e 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -2053,11 +2053,25 @@ static inline long folio_nr_pages(const struct folio *folio)
 	return folio_large_nr_pages(folio);
 }
 
-/* Only hugetlbfs can allocate folios larger than MAX_ORDER */
-#ifdef CONFIG_ARCH_HAS_GIGANTIC_PAGE
-#define MAX_FOLIO_ORDER		PUD_ORDER
-#else
+#if !defined(CONFIG_ARCH_HAS_GIGANTIC_PAGE)
+/*
+ * We don't expect any folios that exceed buddy sizes (and consequently
+ * memory sections).
+ */
 #define MAX_FOLIO_ORDER		MAX_PAGE_ORDER
+#elif defined(CONFIG_SPARSEMEM) && !defined(CONFIG_SPARSEMEM_VMEMMAP)
+/*
+ * Only pages within a single memory section are guaranteed to be
+ * contiguous. By limiting folios to a single memory section, all folio
+ * pages are guaranteed to be contiguous.
+ */
+#define MAX_FOLIO_ORDER		PFN_SECTION_SHIFT
+#else
+/*
+ * There is no real limit on the folio size. We limit them to the maximum we
+ * currently expect.
+ */
+#define MAX_FOLIO_ORDER		PUD_ORDER
 #endif
 
 #define MAX_FOLIO_NR_PAGES	(1UL << MAX_FOLIO_ORDER)
-- 
2.50.1

