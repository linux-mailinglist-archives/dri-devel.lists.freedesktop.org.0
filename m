Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B2BF91786DF
	for <lists+dri-devel@lfdr.de>; Wed,  4 Mar 2020 01:14:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF9656E98B;
	Wed,  4 Mar 2020 00:14:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from hqnvemgate24.nvidia.com (hqnvemgate24.nvidia.com
 [216.228.121.143])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 792676E989;
 Wed,  4 Mar 2020 00:14:07 +0000 (UTC)
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate24.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5e5ef27a0000>; Tue, 03 Mar 2020 16:12:42 -0800
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate101.nvidia.com (PGP Universal service);
 Tue, 03 Mar 2020 16:14:06 -0800
X-PGP-Universal: processed;
 by hqpgpgate101.nvidia.com on Tue, 03 Mar 2020 16:14:06 -0800
Received: from HQMAIL107.nvidia.com (172.20.187.13) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 4 Mar
 2020 00:14:05 +0000
Received: from rnnvemgw01.nvidia.com (10.128.109.123) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via
 Frontend Transport; Wed, 4 Mar 2020 00:14:04 +0000
Received: from rcampbell-dev.nvidia.com (Not Verified[10.110.48.66]) by
 rnnvemgw01.nvidia.com with Trustwave SEG (v7, 5, 8, 10121)
 id <B5e5ef2cc0000>; Tue, 03 Mar 2020 16:14:04 -0800
From: Ralph Campbell <rcampbell@nvidia.com>
To: <dri-devel@lists.freedesktop.org>, <linux-rdma@vger.kernel.org>,
 <linux-mm@kvack.org>, <linux-kernel@vger.kernel.org>,
 <nouveau@lists.freedesktop.org>
Subject: [PATCH v3 3/4] nouveau: remove useless SVM range check
Date: Tue, 3 Mar 2020 16:13:38 -0800
Message-ID: <20200304001339.8248-4-rcampbell@nvidia.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200304001339.8248-1-rcampbell@nvidia.com>
References: <20200304001339.8248-1-rcampbell@nvidia.com>
MIME-Version: 1.0
X-NVConfidentiality: public
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1583280763; bh=vB+trDSuLSZgp1ZOL55I9rZDa5MX61pMtV0fQU5N0qM=;
 h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
 In-Reply-To:References:MIME-Version:X-NVConfidentiality:
 Content-Transfer-Encoding:Content-Type;
 b=CDsrTTQ8pY5pG33TP6l7tXy7WdVnY2xVi29qfeq5B5HqKDb0hWDZhUJJ7TY5HFBTJ
 9WHIq82JD/948lrbYaa4gLs+kAX2ns+b1CWLwDhOtonoNWsTi7oyhkjHxsZQzZwcDD
 iSohE4/HBhMVKuLHbYmG0NagA/pxYYrJtpb1V4XhVDwTqJ3nDNzSh8WffyFm0srqmy
 8TtZN6MUA2bAgyxwnsOGddf+j5UeWGQvRrZiO6S9r+SuHtH+E0W9fZGR2rsVfw8SN1
 ZVNou5ztQYlIJfPYbuCUSWMmFFJAE7kNZqGPyCzjypAZb9WL1wsZHioNldhKe7XxXx
 xe1jYvS50nTwg==
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
Cc: Ralph Campbell <rcampbell@nvidia.com>, John Hubbard <jhubbard@nvidia.com>,
 Jerome Glisse <jglisse@redhat.com>, Jason Gunthorpe <jgg@mellanox.com>,
 Ben Skeggs <bskeggs@redhat.com>, Andrew
 Morton <akpm@linux-foundation.org>, Christoph Hellwig <hch@lst.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

When nouveau processes GPU faults, it checks to see if the fault address
falls within the "unmanaged" range which is reserved for fixed allocations
instead of addresses chosen by the core mm code. If start is greater than
or equal to svmm->unmanaged.limit, then limit will also be greater than
svmm->unmanaged.limit which is greater than svmm->unmanaged.start and the
start = max_t(u64, start, svmm->unmanaged.limit) will change nothing.
Just remove the useless lines of code.

Signed-off-by: Ralph Campbell <rcampbell@nvidia.com>
---
 drivers/gpu/drm/nouveau/nouveau_svm.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_svm.c b/drivers/gpu/drm/nouveau/nouveau_svm.c
index c567526b75b8..8dfa5cb74826 100644
--- a/drivers/gpu/drm/nouveau/nouveau_svm.c
+++ b/drivers/gpu/drm/nouveau/nouveau_svm.c
@@ -663,9 +663,6 @@ nouveau_svm_fault(struct nvif_notify *notify)
 		limit = start + (ARRAY_SIZE(args.phys) << PAGE_SHIFT);
 		if (start < svmm->unmanaged.limit)
 			limit = min_t(u64, limit, svmm->unmanaged.start);
-		else
-		if (limit > svmm->unmanaged.start)
-			start = max_t(u64, start, svmm->unmanaged.limit);
 		SVMM_DBG(svmm, "wndw %016llx-%016llx", start, limit);
 
 		mm = svmm->notifier.mm;
-- 
2.20.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
