Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 99749B30396
	for <lists+dri-devel@lfdr.de>; Thu, 21 Aug 2025 22:08:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F99010E9F3;
	Thu, 21 Aug 2025 20:08:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="FEc/ixVI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BDF5D10E9F5
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Aug 2025 20:07:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1755806877;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NPs2EdTZ9fd3MpWdb0ATDCa6nUqfGtFMv2uyZP7L+uU=;
 b=FEc/ixVICnw8V0P32ZbsdqRyeMv5FyRbJKdSAbLGDxqeG/a9uo40Ij8nhW+SV6xNCFpE8/
 xC86E4obxyA9N/IdytmeQWP/ZdVM3m4oPa4PhmUGQCZ92Juvw+uHbCf1fq9klrN+nAcE9/
 0JAH6u3T9oQGr2IILZsnO5QN0Nzt/Lk=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-496-EMOMNLaJMI6XvjDUFuG4Iw-1; Thu, 21 Aug 2025 16:07:55 -0400
X-MC-Unique: EMOMNLaJMI6XvjDUFuG4Iw-1
X-Mimecast-MFC-AGG-ID: EMOMNLaJMI6XvjDUFuG4Iw_1755806874
Received: by mail-wm1-f72.google.com with SMTP id
 5b1f17b1804b1-45a1b00352eso7028825e9.0
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Aug 2025 13:07:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755806874; x=1756411674;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=NPs2EdTZ9fd3MpWdb0ATDCa6nUqfGtFMv2uyZP7L+uU=;
 b=YTmH1fEHlZQbS0tjve9Y2lnprhSXDc/XlXbxJx/DRciSyOqMrSxQwIlKYqJ2Ku3N+O
 baLjWjImI5GGXWmNZuv8Gsz3CJ0vambpSGO4t2lyrw60f7vr49i4UzLl6HmJOmQisoS4
 aQM2qZ1YQKQxyYfOskHcf85oppHmBFwAGhqzXQ5QFMP8tuJJS0laH19t/I12wzkhmIlg
 R6rOzO8iMugDZ2X6L9yuH50oniyfIxz4W8aEvhSKX/Ub+Ac+La90gkV0pg/oXjhPAldY
 njsukoUvrzwlMFwrbIqXLzL5rxHBtu+i7woZszZl7pDxz9MJKLYAbt6pVDXeaGT9d25d
 +Rzg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVVvg/d4/6a0vNMRD45TlXp29JmZ5fwsKAJhOZbRo5uYV56wLzg1DMZ46tVtNne8TzcJDpy5NX/kas=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx23Ap9kEsy1+ZhVrMbLZLfsoagQk/gWapUwynzfsuu40EpUdpB
 wAYMJhvmTrrkEZJtDooeclNjhp0xG3ipOaFUeu3B+anfN6OqGZpBNUL3j8c6w3bBNpmPLQAOncq
 /iKFLdzAmdQSHh1JhZG3QLkZ3OZlmtnAewwJt3rTcy7jBXHmcX/3drlNv6MRxQ406fGamzA==
X-Gm-Gg: ASbGncv3LndpMQ/SaihdN+gxjKIKykC7UsPZvS0uLI3PqfNt+e0YjBD39oh2VCvkvEA
 AtD5HH9SD4xrOKsfDO0DDKzITnCnEoueOAKSz1ZmwGn61XE6LlfNKhq10fDCDSKfxPIWFf77qKe
 /puhn27JKmzcWprQhblj9sDQqVNKhdSf1dwzgH1oJkLFvVKzkcdmNv+qcTpGFmvlH9UriS8EExs
 gX8Pm6ZowTKgv+otUyiquLtFDquDzaTm3px2jNV69M9DBScP8w+VsKYcxNnDpoM5GrUQSY1XS8B
 larbNKWwmo5gq1CNV8/+414/UAOzAfkUkg6XtnB90/duynpYRCORuHLWVqWC1bnozKuXrB3EBKW
 4U8N78iffv11ca88ZeieRfA==
X-Received: by 2002:a05:600c:1388:b0:459:d451:3364 with SMTP id
 5b1f17b1804b1-45b517d40f2mr2554335e9.24.1755806874318; 
 Thu, 21 Aug 2025 13:07:54 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFo8ikhW4DoWVw60oDeAXqMRvn4UERlcVawLCjGel2pacwRc1R1ONhYVQm5EzuW0YIJQT4FDg==
X-Received: by 2002:a05:600c:1388:b0:459:d451:3364 with SMTP id
 5b1f17b1804b1-45b517d40f2mr2553905e9.24.1755806873856; 
 Thu, 21 Aug 2025 13:07:53 -0700 (PDT)
Received: from localhost
 (p200300d82f26ba0008036ec5991806fd.dip0.t-ipconnect.de.
 [2003:d8:2f26:ba00:803:6ec5:9918:6fd])
 by smtp.gmail.com with UTF8SMTPSA id
 ffacd0b85a97d-3c07487a009sm12690403f8f.11.2025.08.21.13.07.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 21 Aug 2025 13:07:53 -0700 (PDT)
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
Subject: [PATCH RFC 17/35] mm/gup: drop nth_page() usage within folio when
 recording subpages
Date: Thu, 21 Aug 2025 22:06:43 +0200
Message-ID: <20250821200701.1329277-18-david@redhat.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250821200701.1329277-1-david@redhat.com>
References: <20250821200701.1329277-1-david@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: jAll-Zb1UZQDNOcNCVv0dHrpfsK2_uicEraktP5Hr_4_1755806874
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

nth_page() is no longer required when iterating over pages within a
single folio, so let's just drop it when recording subpages.

Signed-off-by: David Hildenbrand <david@redhat.com>
---
 mm/gup.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/mm/gup.c b/mm/gup.c
index b2a78f0291273..f017ff6d7d61a 100644
--- a/mm/gup.c
+++ b/mm/gup.c
@@ -491,9 +491,9 @@ static int record_subpages(struct page *page, unsigned long sz,
 	struct page *start_page;
 	int nr;
 
-	start_page = nth_page(page, (addr & (sz - 1)) >> PAGE_SHIFT);
+	start_page = page + ((addr & (sz - 1)) >> PAGE_SHIFT);
 	for (nr = 0; addr != end; nr++, addr += PAGE_SIZE)
-		pages[nr] = nth_page(start_page, nr);
+		pages[nr] = start_page + nr;
 
 	return nr;
 }
@@ -1512,7 +1512,7 @@ static long __get_user_pages(struct mm_struct *mm,
 			}
 
 			for (j = 0; j < page_increm; j++) {
-				subpage = nth_page(page, j);
+				subpage = page + j;
 				pages[i + j] = subpage;
 				flush_anon_page(vma, subpage, start + j * PAGE_SIZE);
 				flush_dcache_page(subpage);
-- 
2.50.1

