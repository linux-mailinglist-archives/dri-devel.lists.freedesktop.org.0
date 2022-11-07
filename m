Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A47A61F8FA
	for <lists+dri-devel@lfdr.de>; Mon,  7 Nov 2022 17:19:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 15F0F10E478;
	Mon,  7 Nov 2022 16:19:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 081F610E473
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Nov 2022 16:19:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667837952;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vTxiy4wmEQ2Tx61KeZ7EnYpqIVEsJFtTV/INlCwg4Xw=;
 b=TXcJFk7+f+sW/JvfLmqA4U4BJapoctGO5z2RMnJRkJF18gcP6OIBH5gNzv1sZYTQjHoX8o
 3Dbkl0/4O0CPgsAhT9di2PirNyLRz7CdmPHN7j/1WCfG8KR05G0pEpYUVHWgcM3d2czgNo
 H6yYdTk/9EnwaNwtfijEp3thx6nnJBM=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-128-AohbtXG3NbqOyb9Xxa7ytw-1; Mon, 07 Nov 2022 11:19:05 -0500
X-MC-Unique: AohbtXG3NbqOyb9Xxa7ytw-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id DF7B33C0F679;
 Mon,  7 Nov 2022 16:19:04 +0000 (UTC)
Received: from t480s.redhat.com (unknown [10.39.195.106])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3E8444B400F;
 Mon,  7 Nov 2022 16:18:59 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH RFC 13/19] media: videobuf-dma-sg: remove FOLL_FORCE usage
Date: Mon,  7 Nov 2022 17:17:34 +0100
Message-Id: <20221107161740.144456-14-david@redhat.com>
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
 linux-samsung-soc@vger.kernel.org, linux-rdma@vger.kernel.org,
 Hugh Dickins <hughd@google.com>, Matthew Wilcox <willy@infradead.org>,
 Jason Gunthorpe <jgg@ziepe.ca>, linux-arm-kernel@lists.infradead.org,
 linux-media@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
 John Hubbard <jhubbard@nvidia.com>, etnaviv@lists.freedesktop.org,
 Peter Xu <peterx@redhat.com>, Muchun Song <songmuchun@bytedance.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Vlastimil Babka <vbabka@suse.cz>,
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

Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
Signed-off-by: David Hildenbrand <david@redhat.com>
---
 drivers/media/v4l2-core/videobuf-dma-sg.c | 14 +++++---------
 1 file changed, 5 insertions(+), 9 deletions(-)

diff --git a/drivers/media/v4l2-core/videobuf-dma-sg.c b/drivers/media/v4l2-core/videobuf-dma-sg.c
index f75e5eedeee0..234e9f647c96 100644
--- a/drivers/media/v4l2-core/videobuf-dma-sg.c
+++ b/drivers/media/v4l2-core/videobuf-dma-sg.c
@@ -151,17 +151,16 @@ static void videobuf_dma_init(struct videobuf_dmabuf *dma)
 static int videobuf_dma_init_user_locked(struct videobuf_dmabuf *dma,
 			int direction, unsigned long data, unsigned long size)
 {
+	unsigned int gup_flags = FOLL_LONGTERM;
 	unsigned long first, last;
-	int err, rw = 0;
-	unsigned int flags = FOLL_FORCE;
+	int err;
 
 	dma->direction = direction;
 	switch (dma->direction) {
 	case DMA_FROM_DEVICE:
-		rw = READ;
+		gup_flags |= FOLL_WRITE;
 		break;
 	case DMA_TO_DEVICE:
-		rw = WRITE;
 		break;
 	default:
 		BUG();
@@ -177,14 +176,11 @@ static int videobuf_dma_init_user_locked(struct videobuf_dmabuf *dma,
 	if (NULL == dma->pages)
 		return -ENOMEM;
 
-	if (rw == READ)
-		flags |= FOLL_WRITE;
-
 	dprintk(1, "init user [0x%lx+0x%lx => %lu pages]\n",
 		data, size, dma->nr_pages);
 
-	err = pin_user_pages(data & PAGE_MASK, dma->nr_pages,
-			     flags | FOLL_LONGTERM, dma->pages, NULL);
+	err = pin_user_pages(data & PAGE_MASK, dma->nr_pages, gup_flags,
+			     dma->pages, NULL);
 
 	if (err != dma->nr_pages) {
 		dma->nr_pages = (err >= 0) ? err : 0;
-- 
2.38.1

