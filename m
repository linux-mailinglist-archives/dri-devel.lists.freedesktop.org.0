Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F35C3121CDB
	for <lists+dri-devel@lfdr.de>; Mon, 16 Dec 2019 23:26:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A91126E8C0;
	Mon, 16 Dec 2019 22:26:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from hqnvemgate24.nvidia.com (hqnvemgate24.nvidia.com
 [216.228.121.143])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A95BC6E8C1
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Dec 2019 22:25:47 +0000 (UTC)
Received: from hqpgpgate102.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate24.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5df8044b0004>; Mon, 16 Dec 2019 14:25:16 -0800
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate102.nvidia.com (PGP Universal service);
 Mon, 16 Dec 2019 14:25:43 -0800
X-PGP-Universal: processed;
 by hqpgpgate102.nvidia.com on Mon, 16 Dec 2019 14:25:43 -0800
Received: from HQMAIL105.nvidia.com (172.20.187.12) by HQMAIL105.nvidia.com
 (172.20.187.12) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Mon, 16 Dec
 2019 22:25:39 +0000
Received: from hqnvemgw03.nvidia.com (10.124.88.68) by HQMAIL105.nvidia.com
 (172.20.187.12) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via Frontend
 Transport; Mon, 16 Dec 2019 22:25:39 +0000
Received: from blueforge.nvidia.com (Not Verified[10.110.48.28]) by
 hqnvemgw03.nvidia.com with Trustwave SEG (v7, 5, 8, 10121)
 id <B5df804630008>; Mon, 16 Dec 2019 14:25:39 -0800
From: John Hubbard <jhubbard@nvidia.com>
To: Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH v11 07/25] vfio: fix FOLL_LONGTERM use,
 simplify get_user_pages_remote() call
Date: Mon, 16 Dec 2019 14:25:19 -0800
Message-ID: <20191216222537.491123-8-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20191216222537.491123-1-jhubbard@nvidia.com>
References: <20191216222537.491123-1-jhubbard@nvidia.com>
MIME-Version: 1.0
X-NVConfidentiality: public
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1576535116; bh=Q+D0QrBLJsS/IUxYkIZE7Q9OtYhC1beEAlqv13tUlJU=;
 h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
 In-Reply-To:References:MIME-Version:X-NVConfidentiality:
 Content-Transfer-Encoding:Content-Type;
 b=a6UtG6wsF7sRZ84TNiXh+8fAQgAcz9GyguF0P+WBrEnBY3raawfHoc0hdv7zUw0BY
 qpQfY7wVtd/iuajGO0al/sjV3pWBys2/RIPo7QvlufgqEp2o8WjXsd8tHured5b/s/
 rR51ZVfwRU3Op5ghOs7TPj2gqyA5nvuknjgBIwdNlv/nZtijJA1KeG7xSKVb70IiTC
 BE7IwUgjLfUBuP0ZJW/pUhNsrykjxpnB88M63Zh3945AZ+9O/NGJ8j0MA9N8izsgze
 6vpSsOVSgpo+YV7a/flHyDnSHkw8Q0CbPM/I05LGFD5EYcoEYD/QRhlrK20ylGj2yc
 +7AiHa20RfpPw==
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
 linux-mm@kvack.org, Paul
 Mackerras <paulus@samba.org>, linux-kselftest@vger.kernel.org,
 Ira Weiny <ira.weiny@intel.com>, Jonathan Corbet <corbet@lwn.net>,
 linux-rdma@vger.kernel.org, Michael Ellerman <mpe@ellerman.id.au>,
 Christoph Hellwig <hch@infradead.org>, Jason Gunthorpe <jgg@ziepe.ca>, Jason
 Gunthorpe <jgg@mellanox.com>, Vlastimil Babka <vbabka@suse.cz>,
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

Update VFIO to take advantage of the recently loosened restriction on
FOLL_LONGTERM with get_user_pages_remote(). Also, now it is possible to
fix a bug: the VFIO caller is logically a FOLL_LONGTERM user, but it
wasn't setting FOLL_LONGTERM.

Also, remove an unnessary pair of calls that were releasing and
reacquiring the mmap_sem. There is no need to avoid holding mmap_sem
just in order to call page_to_pfn().

Also, now that the the DAX check ("if a VMA is DAX, don't allow long
term pinning") is in the internals of get_user_pages_remote() and
__gup_longterm_locked(), there's no need for it at the VFIO call site.
So remove it.

Tested-by: Alex Williamson <alex.williamson@redhat.com>
Acked-by: Alex Williamson <alex.williamson@redhat.com>
Reviewed-by: Jason Gunthorpe <jgg@mellanox.com>
Reviewed-by: Ira Weiny <ira.weiny@intel.com>
Suggested-by: Jason Gunthorpe <jgg@ziepe.ca>
Cc: Dan Williams <dan.j.williams@intel.com>
Cc: Jerome Glisse <jglisse@redhat.com>
Signed-off-by: John Hubbard <jhubbard@nvidia.com>
---
 drivers/vfio/vfio_iommu_type1.c | 30 +++++-------------------------
 1 file changed, 5 insertions(+), 25 deletions(-)

diff --git a/drivers/vfio/vfio_iommu_type1.c b/drivers/vfio/vfio_iommu_type1.c
index 2ada8e6cdb88..b800fc9a0251 100644
--- a/drivers/vfio/vfio_iommu_type1.c
+++ b/drivers/vfio/vfio_iommu_type1.c
@@ -322,7 +322,6 @@ static int vaddr_get_pfn(struct mm_struct *mm, unsigned long vaddr,
 {
 	struct page *page[1];
 	struct vm_area_struct *vma;
-	struct vm_area_struct *vmas[1];
 	unsigned int flags = 0;
 	int ret;
 
@@ -330,33 +329,14 @@ static int vaddr_get_pfn(struct mm_struct *mm, unsigned long vaddr,
 		flags |= FOLL_WRITE;
 
 	down_read(&mm->mmap_sem);
-	if (mm == current->mm) {
-		ret = get_user_pages(vaddr, 1, flags | FOLL_LONGTERM, page,
-				     vmas);
-	} else {
-		ret = get_user_pages_remote(NULL, mm, vaddr, 1, flags, page,
-					    vmas, NULL);
-		/*
-		 * The lifetime of a vaddr_get_pfn() page pin is
-		 * userspace-controlled. In the fs-dax case this could
-		 * lead to indefinite stalls in filesystem operations.
-		 * Disallow attempts to pin fs-dax pages via this
-		 * interface.
-		 */
-		if (ret > 0 && vma_is_fsdax(vmas[0])) {
-			ret = -EOPNOTSUPP;
-			put_page(page[0]);
-		}
-	}
-	up_read(&mm->mmap_sem);
-
+	ret = get_user_pages_remote(NULL, mm, vaddr, 1, flags | FOLL_LONGTERM,
+				    page, NULL, NULL);
 	if (ret == 1) {
 		*pfn = page_to_pfn(page[0]);
-		return 0;
+		ret = 0;
+		goto done;
 	}
 
-	down_read(&mm->mmap_sem);
-
 	vaddr = untagged_addr(vaddr);
 
 	vma = find_vma_intersection(mm, vaddr, vaddr + 1);
@@ -366,7 +346,7 @@ static int vaddr_get_pfn(struct mm_struct *mm, unsigned long vaddr,
 		if (is_invalid_reserved_pfn(*pfn))
 			ret = 0;
 	}
-
+done:
 	up_read(&mm->mmap_sem);
 	return ret;
 }
-- 
2.24.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
