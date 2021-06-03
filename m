Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 56A8E39AF00
	for <lists+dri-devel@lfdr.de>; Fri,  4 Jun 2021 02:14:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5EA776F545;
	Fri,  4 Jun 2021 00:14:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8116C6F545
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Jun 2021 00:14:03 +0000 (UTC)
IronPort-SDR: t0NA/KEf1FcsT1Uh9V+Kwl+SC2NuLJB/sITYoqXE1xiVwKcF2f1m566OmOCukRaWJd8mEYi+9X
 vUffsrsyZnrg==
X-IronPort-AV: E=McAfee;i="6200,9189,10004"; a="204168241"
X-IronPort-AV: E=Sophos;i="5.83,246,1616482800"; d="scan'208";a="204168241"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jun 2021 17:13:04 -0700
IronPort-SDR: YESAeTwZFxhuREo9C0b3gXJ7h+IlcD5EopVlvsw4TgBN8JzLIqTSGRdxCGneNjlurqmNOYjhjK
 xJMzoXLyMFCg==
X-IronPort-AV: E=Sophos;i="5.83,246,1616482800"; d="scan'208";a="400761672"
Received: from vkasired-desk2.fm.intel.com ([10.105.128.127])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jun 2021 17:13:03 -0700
From: Vivek Kasireddy <vivek.kasireddy@intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] udmabuf: Add support for mapping hugepages (v2)
Date: Thu,  3 Jun 2021 16:59:55 -0700
Message-Id: <20210603235955.341043-1-vivek.kasireddy@intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210603094424.p6hx7dx42nkmzoqz@sirius.home.kraxel.org>
References: <20210603094424.p6hx7dx42nkmzoqz@sirius.home.kraxel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: Vivek Kasireddy <vivek.kasireddy@intel.com>,
 Gerd Hoffmann <kraxel@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

If the VMM's (Qemu) memory backend is backed up by memfd + Hugepages
(hugetlbfs and not THP), we have to first find the hugepage(s) where
the Guest allocations are located and then extract the regular 4k
sized subpages from them.

v2: Ensure that the subpage offsets are calculated correctly when the
range of subpage allocations cuts across multiple hugepages.

Cc: Gerd Hoffmann <kraxel@redhat.com>
Signed-off-by: Vivek Kasireddy <vivek.kasireddy@intel.com>
---
 drivers/dma-buf/udmabuf.c | 46 ++++++++++++++++++++++++++++++++-------
 1 file changed, 38 insertions(+), 8 deletions(-)

diff --git a/drivers/dma-buf/udmabuf.c b/drivers/dma-buf/udmabuf.c
index db732f71e59a..f053d12a1eb3 100644
--- a/drivers/dma-buf/udmabuf.c
+++ b/drivers/dma-buf/udmabuf.c
@@ -11,6 +11,7 @@
 #include <linux/shmem_fs.h>
 #include <linux/slab.h>
 #include <linux/udmabuf.h>
+#include <linux/hugetlb.h>
 
 static const u32    list_limit = 1024;  /* udmabuf_create_list->count limit */
 static const size_t size_limit_mb = 64; /* total dmabuf size, in megabytes  */
@@ -162,8 +163,10 @@ static long udmabuf_create(struct miscdevice *device,
 	struct file *memfd = NULL;
 	struct udmabuf *ubuf;
 	struct dma_buf *buf;
-	pgoff_t pgoff, pgcnt, pgidx, pgbuf = 0, pglimit;
-	struct page *page;
+	pgoff_t pgoff, pgcnt, pgidx, pgbuf = 0, pglimit, subpgoff;
+	uint32_t maxsubpgs;
+	struct page *page, *hpage = NULL;
+	struct hstate *hpstate;
 	int seals, ret = -EINVAL;
 	u32 i, flags;
 
@@ -194,7 +197,8 @@ static long udmabuf_create(struct miscdevice *device,
 		memfd = fget(list[i].memfd);
 		if (!memfd)
 			goto err;
-		if (!shmem_mapping(file_inode(memfd)->i_mapping))
+		if (!shmem_mapping(file_inode(memfd)->i_mapping) &&
+		    !is_file_hugepages(memfd))
 			goto err;
 		seals = memfd_fcntl(memfd, F_GET_SEALS, 0);
 		if (seals == -EINVAL)
@@ -205,12 +209,38 @@ static long udmabuf_create(struct miscdevice *device,
 			goto err;
 		pgoff = list[i].offset >> PAGE_SHIFT;
 		pgcnt = list[i].size   >> PAGE_SHIFT;
+		if (is_file_hugepages(memfd)) {
+			hpstate = hstate_file(memfd);
+			pgoff = list[i].offset >> huge_page_shift(hpstate);
+			subpgoff = (list[i].offset &
+				    ~huge_page_mask(hpstate)) >> PAGE_SHIFT;
+			maxsubpgs = huge_page_size(hpstate) >> PAGE_SHIFT;
+		}
 		for (pgidx = 0; pgidx < pgcnt; pgidx++) {
-			page = shmem_read_mapping_page(
-				file_inode(memfd)->i_mapping, pgoff + pgidx);
-			if (IS_ERR(page)) {
-				ret = PTR_ERR(page);
-				goto err;
+			if (is_file_hugepages(memfd)) {
+				hpage = find_get_page_flags(
+						file_inode(memfd)->i_mapping,
+						pgoff, FGP_ACCESSED);
+				if (IS_ERR(hpage)) {
+					ret = PTR_ERR(hpage);
+					goto err;
+				}
+
+				page = hpage + (subpgoff % maxsubpgs);
+				get_page(page);
+				put_page(hpage);
+
+				subpgoff++;
+				if (subpgoff % maxsubpgs == 0)
+					pgoff++;
+			} else {
+				page = shmem_read_mapping_page(
+					file_inode(memfd)->i_mapping,
+					pgoff + pgidx);
+				if (IS_ERR(page)) {
+					ret = PTR_ERR(page);
+					goto err;
+				}
 			}
 			ubuf->pages[pgbuf++] = page;
 		}
-- 
2.30.2

