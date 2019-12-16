Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AB7B121CD8
	for <lists+dri-devel@lfdr.de>; Mon, 16 Dec 2019 23:26:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A16336E8C1;
	Mon, 16 Dec 2019 22:25:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from hqnvemgate26.nvidia.com (hqnvemgate26.nvidia.com
 [216.228.121.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF29B6E8CD
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Dec 2019 22:25:42 +0000 (UTC)
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate26.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5df8045d0001>; Mon, 16 Dec 2019 14:25:33 -0800
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate101.nvidia.com (PGP Universal service);
 Mon, 16 Dec 2019 14:25:42 -0800
X-PGP-Universal: processed;
 by hqpgpgate101.nvidia.com on Mon, 16 Dec 2019 14:25:42 -0800
Received: from HQMAIL101.nvidia.com (172.20.187.10) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Mon, 16 Dec
 2019 22:25:41 +0000
Received: from hqnvemgw03.nvidia.com (10.124.88.68) by HQMAIL101.nvidia.com
 (172.20.187.10) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via Frontend
 Transport; Mon, 16 Dec 2019 22:25:41 +0000
Received: from blueforge.nvidia.com (Not Verified[10.110.48.28]) by
 hqnvemgw03.nvidia.com with Trustwave SEG (v7, 5, 8, 10121)
 id <B5df804650002>; Mon, 16 Dec 2019 14:25:41 -0800
From: John Hubbard <jhubbard@nvidia.com>
To: Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH v11 20/25] powerpc: book3s64: convert to pin_user_pages() and
 put_user_page()
Date: Mon, 16 Dec 2019 14:25:32 -0800
Message-ID: <20191216222537.491123-21-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20191216222537.491123-1-jhubbard@nvidia.com>
References: <20191216222537.491123-1-jhubbard@nvidia.com>
MIME-Version: 1.0
X-NVConfidentiality: public
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1576535133; bh=mFKYA+4z1Zu7McmdQBEZVOGZ8IJSoqBMNOjfs/EvFOo=;
 h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
 In-Reply-To:References:MIME-Version:X-NVConfidentiality:
 Content-Transfer-Encoding:Content-Type;
 b=Rv01VDpzie5D/JvAUmSSKrLYmyhqwPimecDK7qvgdaNvlUx4TimGQOtQnaFi+++So
 CjJx3jWoJCIOc10DPjaXH6ZvXFF6ooCrKYHnPd3POXnxyzMAxO+SQgFJp9lN7ItbYd
 c8hmXEJDRa9SWIBZfKoxQRPCGc5MBRdqno9xirroahCF81LXaRmVQX1VCS+vby6oBQ
 I25nffEk0wGlWLPUELXd0Ib2peyCVys8WggZsTC3DQng7pK3iyU07lR7dwSBVj+a19
 9o8QOptTpTwYIrrS+dcO2p7crz4HqP//PtGoUE0uwH95JskLjV3QJd3NAezfafD113
 1VvBxcoQ/WEkg==
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
Cc: Michal Hocko <mhocko@suse.com>, Jan Kara <jack@suse.cz>,
 kvm@vger.kernel.org, linux-doc@vger.kernel.org,
 David Airlie <airlied@linux.ie>, Dave Chinner <david@fromorbit.com>,
 dri-devel@lists.freedesktop.org, LKML <linux-kernel@vger.kernel.org>,
 linux-mm@kvack.org, Paul Mackerras <paulus@samba.org>,
 linux-kselftest@vger.kernel.org, Ira Weiny <ira.weiny@intel.com>,
 Jonathan Corbet <corbet@lwn.net>, linux-rdma@vger.kernel.org,
 Michael Ellerman <mpe@ellerman.id.au>, Christoph Hellwig <hch@infradead.org>,
 Jason Gunthorpe <jgg@ziepe.ca>, Vlastimil Babka <vbabka@suse.cz>,
 =?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn.topel@intel.com>,
 linux-media@vger.kernel.org, Shuah Khan <shuah@kernel.org>,
 John Hubbard <jhubbard@nvidia.com>, linux-block@vger.kernel.org,
 =?UTF-8?q?J=C3=A9r=C3=B4me=20Glisse?= <jglisse@redhat.com>,
 Al Viro <viro@zeniv.linux.org.uk>, Dan Williams <dan.j.williams@intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Magnus Karlsson <magnus.karlsson@intel.com>, Jens Axboe <axboe@kernel.dk>,
 netdev@vger.kernel.org, Alex Williamson <alex.williamson@redhat.com>,
 linux-fsdevel@vger.kernel.org, bpf@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, "David S . Miller" <davem@davemloft.net>,
 Mike Kravetz <mike.kravetz@oracle.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

1. Convert from get_user_pages() to pin_user_pages().

2. As required by pin_user_pages(), release these pages via
put_user_page().

Reviewed-by: Jan Kara <jack@suse.cz>
Signed-off-by: John Hubbard <jhubbard@nvidia.com>
---
 arch/powerpc/mm/book3s64/iommu_api.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/arch/powerpc/mm/book3s64/iommu_api.c b/arch/powerpc/mm/book3s64/iommu_api.c
index 56cc84520577..a86547822034 100644
--- a/arch/powerpc/mm/book3s64/iommu_api.c
+++ b/arch/powerpc/mm/book3s64/iommu_api.c
@@ -103,7 +103,7 @@ static long mm_iommu_do_alloc(struct mm_struct *mm, unsigned long ua,
 	for (entry = 0; entry < entries; entry += chunk) {
 		unsigned long n = min(entries - entry, chunk);
 
-		ret = get_user_pages(ua + (entry << PAGE_SHIFT), n,
+		ret = pin_user_pages(ua + (entry << PAGE_SHIFT), n,
 				FOLL_WRITE | FOLL_LONGTERM,
 				mem->hpages + entry, NULL);
 		if (ret == n) {
@@ -167,9 +167,8 @@ static long mm_iommu_do_alloc(struct mm_struct *mm, unsigned long ua,
 	return 0;
 
 free_exit:
-	/* free the reference taken */
-	for (i = 0; i < pinned; i++)
-		put_page(mem->hpages[i]);
+	/* free the references taken */
+	put_user_pages(mem->hpages, pinned);
 
 	vfree(mem->hpas);
 	kfree(mem);
@@ -215,7 +214,8 @@ static void mm_iommu_unpin(struct mm_iommu_table_group_mem_t *mem)
 		if (mem->hpas[i] & MM_IOMMU_TABLE_GROUP_PAGE_DIRTY)
 			SetPageDirty(page);
 
-		put_page(page);
+		put_user_page(page);
+
 		mem->hpas[i] = 0;
 	}
 }
-- 
2.24.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
