Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3854D121CDE
	for <lists+dri-devel@lfdr.de>; Mon, 16 Dec 2019 23:26:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B132E6E8D2;
	Mon, 16 Dec 2019 22:26:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from hqnvemgate26.nvidia.com (hqnvemgate26.nvidia.com
 [216.228.121.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8588E6E8C6
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Dec 2019 22:25:42 +0000 (UTC)
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate26.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5df8045d0000>; Mon, 16 Dec 2019 14:25:33 -0800
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate101.nvidia.com (PGP Universal service);
 Mon, 16 Dec 2019 14:25:41 -0800
X-PGP-Universal: processed;
 by hqpgpgate101.nvidia.com on Mon, 16 Dec 2019 14:25:41 -0800
Received: from HQMAIL111.nvidia.com (172.20.187.18) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Mon, 16 Dec
 2019 22:25:41 +0000
Received: from hqnvemgw03.nvidia.com (10.124.88.68) by HQMAIL111.nvidia.com
 (172.20.187.18) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via Frontend
 Transport; Mon, 16 Dec 2019 22:25:41 +0000
Received: from blueforge.nvidia.com (Not Verified[10.110.48.28]) by
 hqnvemgw03.nvidia.com with Trustwave SEG (v7, 5, 8, 10121)
 id <B5df804650001>; Mon, 16 Dec 2019 14:25:41 -0800
From: John Hubbard <jhubbard@nvidia.com>
To: Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH v11 19/25] vfio,
 mm: pin_user_pages (FOLL_PIN) and put_user_page() conversion
Date: Mon, 16 Dec 2019 14:25:31 -0800
Message-ID: <20191216222537.491123-20-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20191216222537.491123-1-jhubbard@nvidia.com>
References: <20191216222537.491123-1-jhubbard@nvidia.com>
MIME-Version: 1.0
X-NVConfidentiality: public
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1576535133; bh=ENBSgRCtmfM034uozTO4hXHrimG7hXnL4nYIQJVrTfw=;
 h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
 In-Reply-To:References:MIME-Version:X-NVConfidentiality:
 Content-Transfer-Encoding:Content-Type;
 b=I9dDhBzF/PguU+XE12Ggn+/FAYJsjhJc4450IdMgxxc584tUNJ4dAdiZ4jfLz87pC
 dNXLPxqvBq7K5v+dBDEEsVkyN9OETUte0/TjuxZfFV1T0NfmqR4VQp26smQsgxdqgp
 t67CXfVm+lYk9M2PmnWquK2wLZdd3+9MKJFJrKcGkI5UYxW+WJMhWZwLo3ASf/tIGa
 D1BCp6xpz0TAlO7zLVhaTI3Dh3cliI8n9gH0hTHzOlss6uotBnEbM4O+iu56BT3Rh0
 5sE9C/+X270qbgvSnz6xXiSzjO4lsaC7tfPfYpIojTZRomZ+dClk1gYjfXVEL6Uhqx
 PxKz6AZB2voFA==
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

1. Change vfio from get_user_pages_remote(), to
pin_user_pages_remote().

2. Because all FOLL_PIN-acquired pages must be released via
put_user_page(), also convert the put_page() call over to
put_user_pages_dirty_lock().

Note that this effectively changes the code's behavior in
vfio_iommu_type1.c: put_pfn(): it now ultimately calls
set_page_dirty_lock(), instead of set_page_dirty(). This is
probably more accurate.

As Christoph Hellwig put it, "set_page_dirty() is only safe if we are
dealing with a file backed page where we have reference on the inode it
hangs off." [1]

[1] https://lore.kernel.org/r/20190723153640.GB720@lst.de

Tested-by: Alex Williamson <alex.williamson@redhat.com>
Acked-by: Alex Williamson <alex.williamson@redhat.com>
Signed-off-by: John Hubbard <jhubbard@nvidia.com>
---
 drivers/vfio/vfio_iommu_type1.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/vfio/vfio_iommu_type1.c b/drivers/vfio/vfio_iommu_type1.c
index b800fc9a0251..18bfc2fc8e6d 100644
--- a/drivers/vfio/vfio_iommu_type1.c
+++ b/drivers/vfio/vfio_iommu_type1.c
@@ -309,9 +309,8 @@ static int put_pfn(unsigned long pfn, int prot)
 {
 	if (!is_invalid_reserved_pfn(pfn)) {
 		struct page *page = pfn_to_page(pfn);
-		if (prot & IOMMU_WRITE)
-			SetPageDirty(page);
-		put_page(page);
+
+		put_user_pages_dirty_lock(&page, 1, prot & IOMMU_WRITE);
 		return 1;
 	}
 	return 0;
@@ -329,7 +328,7 @@ static int vaddr_get_pfn(struct mm_struct *mm, unsigned long vaddr,
 		flags |= FOLL_WRITE;
 
 	down_read(&mm->mmap_sem);
-	ret = get_user_pages_remote(NULL, mm, vaddr, 1, flags | FOLL_LONGTERM,
+	ret = pin_user_pages_remote(NULL, mm, vaddr, 1, flags | FOLL_LONGTERM,
 				    page, NULL, NULL);
 	if (ret == 1) {
 		*pfn = page_to_pfn(page[0]);
-- 
2.24.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
