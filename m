Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 34622B3038B
	for <lists+dri-devel@lfdr.de>; Thu, 21 Aug 2025 22:08:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F8C810E9EF;
	Thu, 21 Aug 2025 20:07:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="U3k26lLo";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B8F4A10E9ED
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Aug 2025 20:07:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1755806872;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MzMWVCGQW0mP4+/ULAfe7CdOmgWkAKLnoxAB4Fy092E=;
 b=U3k26lLojuRdCNgBwR1ZihkwkQjaEy8RQeTcjK1Z/GA3kx55Nm4vezg5ze72xWvFL2/0rS
 /3Lthet/wOUxegobDiOpW9bNNfn6tYj/R/dbQhLBvzN2p+BuvdEPDz+1b7dLs5SI6gUXg1
 G9ZEvz7H8hS51IH1Xw+Og7FGegbk1oA=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-599-s1k-cgXJMl-_xwPZMK4QWQ-1; Thu, 21 Aug 2025 16:07:50 -0400
X-MC-Unique: s1k-cgXJMl-_xwPZMK4QWQ-1
X-Mimecast-MFC-AGG-ID: s1k-cgXJMl-_xwPZMK4QWQ_1755806869
Received: by mail-wm1-f71.google.com with SMTP id
 5b1f17b1804b1-45a1b00352eso7028655e9.0
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Aug 2025 13:07:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755806869; x=1756411669;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=MzMWVCGQW0mP4+/ULAfe7CdOmgWkAKLnoxAB4Fy092E=;
 b=JlSRIBiNsTHQqfIt8AwK/FC3owSB1Gb8s8Gl3fFj2h1KBh9m7ULrvEnLCMYje+xvl3
 FtO/GeKOLATYf07PXsAW+ed0SZdieVVRJSUwcooA51zwn4s9k16OOzIpNpX2zTlEnmfL
 P/XHIFSfthGwAVoDp5yRUEVam3H3ZensTac1mo/YzY6ZRXKWHRxG81yyiqzm5sCZM7lp
 IEWlPK8i9t+MLWCpZWGMUVJf+kCMQZE0DrlpFnYgm4229YI+6V4/x/0z4B2kcf/XHRns
 d524o6b8qDaVwylJA1BvBBr27nLQQkU6axEBzq0W6dgL7dbT8yMEqg2hkaDrH+858Yes
 EC5A==
X-Forwarded-Encrypted: i=1;
 AJvYcCW+NOFS0yU6YInnKCej5eNV73NMI55oTA4paHtdjuKLE1gPGG4CM1kSZgthFLFXIAgc+UVojkM5Gf0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzCmFnkyUHVPxTRceORJNpWGjL3CNo/1vqUCl1TynRELHOW08uj
 sl6WffIzW7KDK/GTpSw3ZNjfBrKqoJo+uK5qV2PmtEHpi+oui+pA58KpkuHCDJcqNIFvLbKUx1b
 mNLSlKwABzVmLrWhciCxjA76ugd0hDsz8XcEHW5pauxVQ/DYePGkMZaWllE80M2dnNYloWA==
X-Gm-Gg: ASbGncvhFpwSQINz9tdRiRHWPqOPYBatGOT/dUpdTm2UtDE9JNQUNQ5V/bDNQRGmoat
 BTtIp98F2y1TDe2Rq0wlclBVFb+ymVFKOC/6l0NB/mVnPF0Mci7Sd/z6jwL5SMVjQHKZsr/qHt5
 VY186EEJxXSZkWiY5AOIgwqghBRUL+fYVf81ycIl3ATuIilRUBlMt2wOM1m7nRP/CyYFPSU565X
 UdV8HnN/6VxAJi+ilwsFLxajiL/WFgcDgwTR7ZwHDfF+luzcsyaC48yJ3u8VDZjkZTrxSzxiq/q
 sW2wQwNOMxQa3N+UHZb5jE1R8Q9ahi6aDx0iTcdkK9nB4ZFTtwW6f69c5nMI/Hhrpfd9Qvtc/nx
 ChBzJJ0xNa2orA4Ikagx8SA==
X-Received: by 2002:a05:6000:2901:b0:3b7:c703:ce4 with SMTP id
 ffacd0b85a97d-3c5dcff5f3amr167778f8f.59.1755806868873; 
 Thu, 21 Aug 2025 13:07:48 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHCm64ALptQrKyrLlaLt4xJ2vziBy3gZm4Q1WMVX6wnWhr2W2tRcHnZJHBwxpAOnTfL4mKx+A==
X-Received: by 2002:a05:6000:2901:b0:3b7:c703:ce4 with SMTP id
 ffacd0b85a97d-3c5dcff5f3amr167760f8f.59.1755806868453; 
 Thu, 21 Aug 2025 13:07:48 -0700 (PDT)
Received: from localhost
 (p200300d82f26ba0008036ec5991806fd.dip0.t-ipconnect.de.
 [2003:d8:2f26:ba00:803:6ec5:9918:6fd])
 by smtp.gmail.com with UTF8SMTPSA id
 ffacd0b85a97d-3c5826751d5sm1323274f8f.14.2025.08.21.13.07.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 21 Aug 2025 13:07:47 -0700 (PDT)
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
Subject: [PATCH RFC 15/35] fs: hugetlbfs: remove nth_page() usage within folio
 in adjust_range_hwpoison()
Date: Thu, 21 Aug 2025 22:06:41 +0200
Message-ID: <20250821200701.1329277-16-david@redhat.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250821200701.1329277-1-david@redhat.com>
References: <20250821200701.1329277-1-david@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 0p2gnGQ3yi4j6Zac0AtWmzZSNLPqoXJMTv3Fm9EZhjc_1755806869
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

The nth_page() is not really required anymore, so let's remove it.
While at it, cleanup and simplify the code a bit.

Signed-off-by: David Hildenbrand <david@redhat.com>
---
 fs/hugetlbfs/inode.c | 25 ++++++++-----------------
 1 file changed, 8 insertions(+), 17 deletions(-)

diff --git a/fs/hugetlbfs/inode.c b/fs/hugetlbfs/inode.c
index 34d496a2b7de6..dc981509a7717 100644
--- a/fs/hugetlbfs/inode.c
+++ b/fs/hugetlbfs/inode.c
@@ -198,31 +198,22 @@ hugetlb_get_unmapped_area(struct file *file, unsigned long addr,
 static size_t adjust_range_hwpoison(struct folio *folio, size_t offset,
 		size_t bytes)
 {
-	struct page *page;
-	size_t n = 0;
-	size_t res = 0;
+	struct page *page = folio_page(folio, offset / PAGE_SIZE);
+	size_t n, safe_bytes;
 
-	/* First page to start the loop. */
-	page = folio_page(folio, offset / PAGE_SIZE);
 	offset %= PAGE_SIZE;
-	while (1) {
+	for (safe_bytes = 0; safe_bytes < bytes; safe_bytes += n) {
+
 		if (is_raw_hwpoison_page_in_hugepage(page))
 			break;
 
 		/* Safe to read n bytes without touching HWPOISON subpage. */
-		n = min(bytes, (size_t)PAGE_SIZE - offset);
-		res += n;
-		bytes -= n;
-		if (!bytes || !n)
-			break;
-		offset += n;
-		if (offset == PAGE_SIZE) {
-			page = nth_page(page, 1);
-			offset = 0;
-		}
+		n = min(bytes - safe_bytes, (size_t)PAGE_SIZE - offset);
+		offset = 0;
+		page++;
 	}
 
-	return res;
+	return safe_bytes;
 }
 
 /*
-- 
2.50.1

