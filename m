Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 427F911C708
	for <lists+dri-devel@lfdr.de>; Thu, 12 Dec 2019 09:20:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 897DA6EC9E;
	Thu, 12 Dec 2019 08:19:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from hqnvemgate26.nvidia.com (hqnvemgate26.nvidia.com
 [216.228.121.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA2CA6EC89
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Dec 2019 08:19:29 +0000 (UTC)
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate26.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5df1f8040003>; Thu, 12 Dec 2019 00:19:17 -0800
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate101.nvidia.com (PGP Universal service);
 Thu, 12 Dec 2019 00:19:23 -0800
X-PGP-Universal: processed;
 by hqpgpgate101.nvidia.com on Thu, 12 Dec 2019 00:19:23 -0800
Received: from HQMAIL109.nvidia.com (172.20.187.15) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 12 Dec
 2019 08:19:22 +0000
Received: from HQMAIL101.nvidia.com (172.20.187.10) by HQMAIL109.nvidia.com
 (172.20.187.15) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 12 Dec
 2019 08:19:19 +0000
Received: from hqnvemgw03.nvidia.com (10.124.88.68) by HQMAIL101.nvidia.com
 (172.20.187.10) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via Frontend
 Transport; Thu, 12 Dec 2019 08:19:19 +0000
Received: from blueforge.nvidia.com (Not Verified[10.110.48.28]) by
 hqnvemgw03.nvidia.com with Trustwave SEG (v7, 5, 8, 10121)
 id <B5df1f8070001>; Thu, 12 Dec 2019 00:19:19 -0800
From: John Hubbard <jhubbard@nvidia.com>
To: Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH v10 06/25] mm: fix get_user_pages_remote()'s handling of
 FOLL_LONGTERM
Date: Thu, 12 Dec 2019 00:18:58 -0800
Message-ID: <20191212081917.1264184-7-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191212081917.1264184-1-jhubbard@nvidia.com>
References: <20191212081917.1264184-1-jhubbard@nvidia.com>
MIME-Version: 1.0
X-NVConfidentiality: public
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1576138757; bh=l4ZzqtVW71Fwvoz1qyCbd1xWWEz8EY4C2cUJdAbaFHs=;
 h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
 In-Reply-To:References:MIME-Version:X-NVConfidentiality:
 Content-Transfer-Encoding:Content-Type;
 b=YNvksdWlyl2599mmaaugSdiX1UCO56zpF5N9DYcD/vZ2p7+o0dY61zE7nU97ta9m/
 26nMlVzTBISct5P8uG+3Gi7hnC1NH8nGfefemcNG47ilbQw2tw4L9JhghF53jnZK3Q
 V3weahbyJyIncwop+hfXFMM69n7/p/MbrvPbFWxTKGxGRYJM3D3rUMcMiAwOqGTi7p
 F/cnat8bNtoNg+9UU8caJLFv0HRT5uBP2AvEP48Mkn3MVCeW1ldS7kSoU85E5VIOS0
 fRjFM7oet5MBa/lhRMLh3mRRVxAfPJVusfImFZxrdEcOMr0VdUBQLWZBEAAzrTWzkU
 LDxG0ypzYUD8A==
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

As it says in the updated comment in gup.c: current FOLL_LONGTERM
behavior is incompatible with FAULT_FLAG_ALLOW_RETRY because of the
FS DAX check requirement on vmas.

However, the corresponding restriction in get_user_pages_remote() was
slightly stricter than is actually required: it forbade all
FOLL_LONGTERM callers, but we can actually allow FOLL_LONGTERM callers
that do not set the "locked" arg.

Update the code and comments to loosen the restriction, allowing
FOLL_LONGTERM in some cases.

Also, copy the DAX check ("if a VMA is DAX, don't allow long term
pinning") from the VFIO call site, all the way into the internals
of get_user_pages_remote() and __gup_longterm_locked(). That is:
get_user_pages_remote() calls __gup_longterm_locked(), which in turn
calls check_dax_vmas(). This check will then be removed from the VFIO
call site in a subsequent patch.

Thanks to Jason Gunthorpe for pointing out a clean way to fix this,
and to Dan Williams for helping clarify the DAX refactoring.

Tested-by: Alex Williamson <alex.williamson@redhat.com>
Acked-by: Alex Williamson <alex.williamson@redhat.com>
Reviewed-by: Jason Gunthorpe <jgg@mellanox.com>
Reviewed-by: Ira Weiny <ira.weiny@intel.com>
Suggested-by: Jason Gunthorpe <jgg@ziepe.ca>
Cc: Dan Williams <dan.j.williams@intel.com>
Cc: Jerome Glisse <jglisse@redhat.com>
Signed-off-by: John Hubbard <jhubbard@nvidia.com>
---
 mm/gup.c | 27 ++++++++++++++++++++++-----
 1 file changed, 22 insertions(+), 5 deletions(-)

diff --git a/mm/gup.c b/mm/gup.c
index 3ecce297a47f..c0c56888e7cc 100644
--- a/mm/gup.c
+++ b/mm/gup.c
@@ -29,6 +29,13 @@ struct follow_page_context {
 	unsigned int page_mask;
 };
 
+static __always_inline long __gup_longterm_locked(struct task_struct *tsk,
+						  struct mm_struct *mm,
+						  unsigned long start,
+						  unsigned long nr_pages,
+						  struct page **pages,
+						  struct vm_area_struct **vmas,
+						  unsigned int flags);
 /*
  * Return the compound head page with ref appropriately incremented,
  * or NULL if that failed.
@@ -1179,13 +1186,23 @@ long get_user_pages_remote(struct task_struct *tsk, struct mm_struct *mm,
 		struct vm_area_struct **vmas, int *locked)
 {
 	/*
-	 * FIXME: Current FOLL_LONGTERM behavior is incompatible with
+	 * Parts of FOLL_LONGTERM behavior are incompatible with
 	 * FAULT_FLAG_ALLOW_RETRY because of the FS DAX check requirement on
-	 * vmas.  As there are no users of this flag in this call we simply
-	 * disallow this option for now.
+	 * vmas. However, this only comes up if locked is set, and there are
+	 * callers that do request FOLL_LONGTERM, but do not set locked. So,
+	 * allow what we can.
 	 */
-	if (WARN_ON_ONCE(gup_flags & FOLL_LONGTERM))
-		return -EINVAL;
+	if (gup_flags & FOLL_LONGTERM) {
+		if (WARN_ON_ONCE(locked))
+			return -EINVAL;
+		/*
+		 * This will check the vmas (even if our vmas arg is NULL)
+		 * and return -ENOTSUPP if DAX isn't allowed in this case:
+		 */
+		return __gup_longterm_locked(tsk, mm, start, nr_pages, pages,
+					     vmas, gup_flags | FOLL_TOUCH |
+					     FOLL_REMOTE);
+	}
 
 	return __get_user_pages_locked(tsk, mm, start, nr_pages, pages, vmas,
 				       locked,
-- 
2.24.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
