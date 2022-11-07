Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B65EC61F90E
	for <lists+dri-devel@lfdr.de>; Mon,  7 Nov 2022 17:20:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD1AF10E484;
	Mon,  7 Nov 2022 16:20:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9DAA710E487
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Nov 2022 16:19:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667837994;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DuB2xXWo7LwhnuotOHRyBqnGxRkaEWf9/y+D6i6uzJ8=;
 b=irkARvPFTMrNDJzdZPsYNjvOWspbi8W8GSwmfy7j3kkN4wzVMP3BADdynW+/13ypqe/Ph2
 OO4u5DR+RAkSFWE5TpS8greLqexdA472EDPAIZhJZUq7g4PchWL1RXBjvZymxTLamKFAyw
 l9jdU0rDHF9je4FnR4YHKVXEPIqOglo=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-17-Jw4agQGfPwGSW7qMCb5CiQ-1; Mon, 07 Nov 2022 11:19:51 -0500
X-MC-Unique: Jw4agQGfPwGSW7qMCb5CiQ-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7457B296A60A;
 Mon,  7 Nov 2022 16:19:49 +0000 (UTC)
Received: from t480s.redhat.com (unknown [10.39.195.106])
 by smtp.corp.redhat.com (Postfix) with ESMTP id DFEFE4B3FC6;
 Mon,  7 Nov 2022 16:19:43 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH RFC 19/19] habanalabs: remove FOLL_FORCE usage
Date: Mon,  7 Nov 2022 17:17:40 +0100
Message-Id: <20221107161740.144456-20-david@redhat.com>
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
 Vlastimil Babka <vbabka@suse.cz>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Oded Gabbay <ogabbay@kernel.org>, Andrew Morton <akpm@linux-foundation.org>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Mike Kravetz <mike.kravetz@oracle.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

FOLL_FORCE is really only for debugger access. As we unpin the pinned pages
using unpin_user_pages_dirty_lock(true), the assumption is that all these
pages are writable.

FOLL_FORCE in this case seems to be due to copy-and-past from other
drivers. Let's just remove it.

Cc: Oded Gabbay <ogabbay@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Signed-off-by: David Hildenbrand <david@redhat.com>
---
 drivers/misc/habanalabs/common/memory.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/misc/habanalabs/common/memory.c b/drivers/misc/habanalabs/common/memory.c
index ef28f3b37b93..e35cca96bbef 100644
--- a/drivers/misc/habanalabs/common/memory.c
+++ b/drivers/misc/habanalabs/common/memory.c
@@ -2312,8 +2312,7 @@ static int get_user_memory(struct hl_device *hdev, u64 addr, u64 size,
 	if (!userptr->pages)
 		return -ENOMEM;
 
-	rc = pin_user_pages_fast(start, npages,
-				 FOLL_FORCE | FOLL_WRITE | FOLL_LONGTERM,
+	rc = pin_user_pages_fast(start, npages, FOLL_WRITE | FOLL_LONGTERM,
 				 userptr->pages);
 
 	if (rc != npages) {
-- 
2.38.1

