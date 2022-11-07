Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D54061F8EF
	for <lists+dri-devel@lfdr.de>; Mon,  7 Nov 2022 17:19:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 77A0110E472;
	Mon,  7 Nov 2022 16:19:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BCF3710E46F
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Nov 2022 16:18:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667837933;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8LSm/ABK1dZuzbBLIy952PsCCtserHCfNmIiwyOpplI=;
 b=Nz/+/ROIT5/uxypnXtS3G9EQT1NL+JDKWzeVVPHeSOLBFfz5VcXWAMJ+YJi//tAmN8ufcz
 U9BVn/Yuv3jVCxJVQmN8yHyohfXhzyXwHSiAzUeRrwr9O4wAk5ZqnTy+zc01ti9qrGCV19
 DvWPGiFNwY4WPopelT06PMoMJy1z0DA=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-491-BzZ6c9HQOyGIJKIwV5MVVA-1; Mon, 07 Nov 2022 11:18:47 -0500
X-MC-Unique: BzZ6c9HQOyGIJKIwV5MVVA-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5AA663C0F671;
 Mon,  7 Nov 2022 16:18:46 +0000 (UTC)
Received: from t480s.redhat.com (unknown [10.39.195.106])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8D9544B4010;
 Mon,  7 Nov 2022 16:18:40 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH RFC 10/19] RDMA/umem: remove FOLL_FORCE usage
Date: Mon,  7 Nov 2022 17:17:31 +0100
Message-Id: <20221107161740.144456-11-david@redhat.com>
In-Reply-To: <20221107161740.144456-1-david@redhat.com>
References: <20221107161740.144456-1-david@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
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
Cc: David Hildenbrand <david@redhat.com>, dri-devel@lists.freedesktop.org,
 linux-mm@kvack.org, Nadav Amit <namit@vmware.com>,
 linux-kselftest@vger.kernel.org, Andrea Arcangeli <aarcange@redhat.com>,
 linux-samsung-soc@vger.kernel.org, Leon Romanovsky <leon@kernel.org>,
 linux-rdma@vger.kernel.org, Hugh Dickins <hughd@google.com>,
 Matthew Wilcox <willy@infradead.org>, Jason Gunthorpe <jgg@ziepe.ca>,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org,
 Arnd Bergmann <arnd@arndb.de>, John Hubbard <jhubbard@nvidia.com>,
 etnaviv@lists.freedesktop.org, Peter Xu <peterx@redhat.com>,
 Muchun Song <songmuchun@bytedance.com>, Vlastimil Babka <vbabka@suse.cz>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Oded Gabbay <ogabbay@kernel.org>, Andrew Morton <akpm@linux-foundation.org>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Mike Kravetz <mike.kravetz@oracle.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

GUP now supports reliable R/O long-term pinning in COW mappings, such
that we break COW early. MAP_SHARED VMAs only use the shared zeropage so
far in one corner case (DAXFS file with holes), which can be ignored
because GUP does not support long-term pinning in fsdax (see
check_vma_flags()).

Consequently, FOLL_FORCE | FOLL_WRITE | FOLL_LONGTERM is no longer required
for reliable R/O long-term pinning: FOLL_LONGTERM is sufficient. So stop
using FOLL_FORCE, which is really only for debugger access.

Cc: Jason Gunthorpe <jgg@ziepe.ca>
Cc: Leon Romanovsky <leon@kernel.org>
Signed-off-by: David Hildenbrand <david@redhat.com>
---
 drivers/infiniband/core/umem.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/infiniband/core/umem.c b/drivers/infiniband/core/umem.c
index 86d479772fbc..755a9c57db6f 100644
--- a/drivers/infiniband/core/umem.c
+++ b/drivers/infiniband/core/umem.c
@@ -156,7 +156,7 @@ struct ib_umem *ib_umem_get(struct ib_device *device, unsigned long addr,
 	struct mm_struct *mm;
 	unsigned long npages;
 	int pinned, ret;
-	unsigned int gup_flags = FOLL_WRITE;
+	unsigned int gup_flags = FOLL_LONGTERM;
 
 	/*
 	 * If the combination of the addr and size requested for this memory
@@ -210,8 +210,8 @@ struct ib_umem *ib_umem_get(struct ib_device *device, unsigned long addr,
 
 	cur_base = addr & PAGE_MASK;
 
-	if (!umem->writable)
-		gup_flags |= FOLL_FORCE;
+	if (umem->writable)
+		gup_flags |= FOLL_WRITE;
 
 	while (npages) {
 		cond_resched();
@@ -219,7 +219,7 @@ struct ib_umem *ib_umem_get(struct ib_device *device, unsigned long addr,
 					  min_t(unsigned long, npages,
 						PAGE_SIZE /
 						sizeof(struct page *)),
-					  gup_flags | FOLL_LONGTERM, page_list);
+					  gup_flags, page_list);
 		if (pinned < 0) {
 			ret = pinned;
 			goto umem_release;
-- 
2.38.1

