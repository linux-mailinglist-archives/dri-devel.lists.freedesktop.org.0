Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D9F05B303AE
	for <lists+dri-devel@lfdr.de>; Thu, 21 Aug 2025 22:08:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 270C010EA08;
	Thu, 21 Aug 2025 20:08:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="Asgvc2nR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 164AA10EA05
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Aug 2025 20:08:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1755806894;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NKFS9/TuG2v9AIcAoooIJr3bGKW6zmP0XL+5izT5Y+4=;
 b=Asgvc2nRe+TJEI/uMByKO0brPcrRkTx89JxKNv/DzB0ld+4mIl0YJFypNHpcqTdk7x3Vbu
 0xnohi5l3C7ieinDW9UAB/Y4J6Pyq6TeJ5iZ2kNUsH1yFrKBwpCY9USfDDICSpbEYpzpOf
 bmBgtmyzF4u/4vr9Pyaua/G5SjzFLjw=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-204-6Wrb4i8FNO-fjQsZ5gZPaQ-1; Thu, 21 Aug 2025 16:08:13 -0400
X-MC-Unique: 6Wrb4i8FNO-fjQsZ5gZPaQ-1
X-Mimecast-MFC-AGG-ID: 6Wrb4i8FNO-fjQsZ5gZPaQ_1755806892
Received: by mail-wm1-f71.google.com with SMTP id
 5b1f17b1804b1-45a1b0ccb6cso6975085e9.3
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Aug 2025 13:08:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755806892; x=1756411692;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=NKFS9/TuG2v9AIcAoooIJr3bGKW6zmP0XL+5izT5Y+4=;
 b=asY1c4DOOdSAU+BA+dk0eHTApTBkV8S3+Nz5QkQ/OojhJKCU563Rlz0WvVyuMMEdV+
 XJ3t8e4cFM4CmjTm3CW177B/4TrILrO0a7q9fko62OMKNXTx+/VaAvylLP1JQb4FMfT8
 1gkBhH0pCuYnLCv7bcl936X6d1pURkd2QbJajjvCo92InOdjfuE8/4Pl5GtDTwsl9mjP
 F3H/2sh1X9UmhUMbxMFBaFDvSb/soX5Ci6QAFKyRR6MOtP80bksUXnb4RUhH/nwiBZ8W
 LESfWWsDgPuzWWHkTIGev9eBq9OERudQBGEgb4tmDy/chZWw1cVv6HXarJ7TX/3qu3qQ
 QrVg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWdQ/X1cIOw5Q8nCBGapmOztaFMgCtYSaW+Kq6jZ4fxYDos0dBAMvkZlNzmeEEN9A8FxW2/mjv0F54=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw9A6epB69KgwTGO0FFEnduxCIixwnMDeX/6Qq+ZVsElydWQVX2
 AeRLKMKVkw00srJPO7yvGJgKfA+iJAn3jXeUtWJF3g1tOvSPRgIQUu32Z+H/CkmodThdIP4bPSN
 T+/UAQW/vemJGEI598yQD01yLG5x2k+ExA6GhFoXfgL+FwYxlZo2+Ori5mJ06L/kZAhw0GQ==
X-Gm-Gg: ASbGncvu5oJIy3gx0pnPen9/mC+8o92ug2teofkAasxobsVmFSbR5ovFC7+Egm2EKXx
 dpfDMBMT3XzAiNWqzeli1WqgyU/3v3w0AX8dMbb1+nnECqBuzbxVzglmOkb2OArywR7VRidyFrD
 h2do7GQsZGbzJd2s2MA5W1FkhIA80IOicLp+oEGkQnjtzCvTRNDiBBJ2sC5drZ6y0gNNIIc596Q
 RcvXRgkPETnZJipQzADRTxImx7E8ptLz7+Y/Yx51ao/oydLIFyv2DiBeOD8JUkmB7AMajJ6Id5V
 vofW379/JGyYKcGLB8suS+NNH8ObP8raKuFwffaUYGf8EPlZG27gz4MjAlDFOH9YOq6PiaqHwEP
 +qdxWCguIWZ+iQ1r8jFkzuw==
X-Received: by 2002:a05:600c:1f1a:b0:45b:43cc:e557 with SMTP id
 5b1f17b1804b1-45b517cbee2mr2552515e9.34.1755806891766; 
 Thu, 21 Aug 2025 13:08:11 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE/z26sBz7JGLAktk/cnLNnmvA2KmHoRy5M1TseKC0NpCNohvOWfWbiwnk6fyruz4Gv4BdEig==
X-Received: by 2002:a05:600c:1f1a:b0:45b:43cc:e557 with SMTP id
 5b1f17b1804b1-45b517cbee2mr2552235e9.34.1755806891155; 
 Thu, 21 Aug 2025 13:08:11 -0700 (PDT)
Received: from localhost
 (p200300d82f26ba0008036ec5991806fd.dip0.t-ipconnect.de.
 [2003:d8:2f26:ba00:803:6ec5:9918:6fd])
 by smtp.gmail.com with UTF8SMTPSA id
 ffacd0b85a97d-3c0748797acsm12277591f8f.10.2025.08.21.13.08.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 21 Aug 2025 13:08:10 -0700 (PDT)
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
Subject: [PATCH RFC 23/35] scatterlist: disallow non-contigous page ranges in
 a single SG entry
Date: Thu, 21 Aug 2025 22:06:49 +0200
Message-ID: <20250821200701.1329277-24-david@redhat.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250821200701.1329277-1-david@redhat.com>
References: <20250821200701.1329277-1-david@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: XEFVNNAX8aLWQ0YOYmRIPAeDPd5F6tLZcgX610Qfl6s_1755806892
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

The expectation is that there is currently no user that would pass in
non-contigous page ranges: no allocator, not even VMA, will hand these
out.

The only problematic part would be if someone would provide a range
obtained directly from memblock, or manually merge problematic ranges.
If we find such cases, we should fix them to create separate
SG entries.

Let's check in sg_set_page() that this is really the case. No need to
check in sg_set_folio(), as pages in a folio are guaranteed to be
contiguous.

We can now drop the nth_page() usage in sg_page_iter_page().

Signed-off-by: David Hildenbrand <david@redhat.com>
---
 include/linux/scatterlist.h | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/include/linux/scatterlist.h b/include/linux/scatterlist.h
index 6f8a4965f9b98..8196949dfc82c 100644
--- a/include/linux/scatterlist.h
+++ b/include/linux/scatterlist.h
@@ -6,6 +6,7 @@
 #include <linux/types.h>
 #include <linux/bug.h>
 #include <linux/mm.h>
+#include <linux/mm_inline.h>
 #include <asm/io.h>
 
 struct scatterlist {
@@ -158,6 +159,7 @@ static inline void sg_assign_page(struct scatterlist *sg, struct page *page)
 static inline void sg_set_page(struct scatterlist *sg, struct page *page,
 			       unsigned int len, unsigned int offset)
 {
+	VM_WARN_ON_ONCE(!page_range_contiguous(page, ALIGN(len + offset, PAGE_SIZE) / PAGE_SIZE));
 	sg_assign_page(sg, page);
 	sg->offset = offset;
 	sg->length = len;
@@ -600,7 +602,7 @@ void __sg_page_iter_start(struct sg_page_iter *piter,
  */
 static inline struct page *sg_page_iter_page(struct sg_page_iter *piter)
 {
-	return nth_page(sg_page(piter->sg), piter->sg_pgoffset);
+	return sg_page(piter->sg) + piter->sg_pgoffset;
 }
 
 /**
-- 
2.50.1

