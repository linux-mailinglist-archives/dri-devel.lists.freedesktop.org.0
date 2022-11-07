Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B969661F8FD
	for <lists+dri-devel@lfdr.de>; Mon,  7 Nov 2022 17:19:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0484510E474;
	Mon,  7 Nov 2022 16:19:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3196410E47A
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Nov 2022 16:19:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667837966;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6Fr+6PvBJcVGo49mRUSTVB+G70kkKYpHo7niK5GMhiI=;
 b=MSmUfjoQAFits01DSJEv5yCGp+GHUzaGtUjMLGAP1e0Ez8gCJH+aO0vKTi2GBVOxzuVDD6
 ZKdOC4MfJqymYmaLi6wH86XXRYSmmZDamoFtBP7ba6Obza9Zk6zdgvCLfhOCkRfnvDTbh1
 gGocVANJaLIfDfKX7/h7NWMsat5Qm2M=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-75-0nINmOCBNB6j33TN5DvJug-1; Mon, 07 Nov 2022 11:19:21 -0500
X-MC-Unique: 0nINmOCBNB6j33TN5DvJug-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id ED32D185A7AE;
 Mon,  7 Nov 2022 16:19:19 +0000 (UTC)
Received: from t480s.redhat.com (unknown [10.39.195.106])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 48FAF4B400F;
 Mon,  7 Nov 2022 16:19:05 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH RFC 14/19] drm/etnaviv: remove FOLL_FORCE usage
Date: Mon,  7 Nov 2022 17:17:35 +0100
Message-Id: <20221107161740.144456-15-david@redhat.com>
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
Cc: David Hildenbrand <david@redhat.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, dri-devel@lists.freedesktop.org,
 linux-mm@kvack.org, Nadav Amit <namit@vmware.com>,
 linux-kselftest@vger.kernel.org, Andrea Arcangeli <aarcange@redhat.com>,
 linux-samsung-soc@vger.kernel.org, linux-rdma@vger.kernel.org,
 Hugh Dickins <hughd@google.com>, Matthew Wilcox <willy@infradead.org>,
 Jason Gunthorpe <jgg@ziepe.ca>, linux-arm-kernel@lists.infradead.org,
 Russell King <linux+etnaviv@armlinux.org.uk>, linux-media@vger.kernel.org,
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

commit cd5297b0855f ("drm/etnaviv: Use FOLL_FORCE for userptr")
documents that FOLL_FORCE | FOLL_WRITE was really only used for reliable
R/O pinning.

Consequently, FOLL_FORCE | FOLL_WRITE | FOLL_LONGTERM is no longer required
for reliable R/O long-term pinning: FOLL_LONGTERM is sufficient. So stop
using FOLL_FORCE, which is really only for debugger access.

Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: Lucas Stach <l.stach@pengutronix.de>
Cc: Russell King <linux+etnaviv@armlinux.org.uk>
Cc: Christian Gmeiner <christian.gmeiner@gmail.com>
Cc: David Airlie <airlied@gmail.com>
Signed-off-by: David Hildenbrand <david@redhat.com>
---
 drivers/gpu/drm/etnaviv/etnaviv_gem.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gem.c b/drivers/gpu/drm/etnaviv/etnaviv_gem.c
index cc386f8a7116..efe2240945d0 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_gem.c
+++ b/drivers/gpu/drm/etnaviv/etnaviv_gem.c
@@ -638,6 +638,7 @@ static int etnaviv_gem_userptr_get_pages(struct etnaviv_gem_object *etnaviv_obj)
 	struct page **pvec = NULL;
 	struct etnaviv_gem_userptr *userptr = &etnaviv_obj->userptr;
 	int ret, pinned = 0, npages = etnaviv_obj->base.size >> PAGE_SHIFT;
+	unsigned int gup_flags = FOLL_LONGTERM;
 
 	might_lock_read(&current->mm->mmap_lock);
 
@@ -648,14 +649,15 @@ static int etnaviv_gem_userptr_get_pages(struct etnaviv_gem_object *etnaviv_obj)
 	if (!pvec)
 		return -ENOMEM;
 
+	if (!userptr->ro)
+		gup_flags |= FOLL_WRITE;
+
 	do {
 		unsigned num_pages = npages - pinned;
 		uint64_t ptr = userptr->ptr + pinned * PAGE_SIZE;
 		struct page **pages = pvec + pinned;
 
-		ret = pin_user_pages_fast(ptr, num_pages,
-					  FOLL_WRITE | FOLL_FORCE | FOLL_LONGTERM,
-					  pages);
+		ret = pin_user_pages_fast(ptr, num_pages, gup_flags, pages);
 		if (ret < 0) {
 			unpin_user_pages(pvec, pinned);
 			kvfree(pvec);
-- 
2.38.1

