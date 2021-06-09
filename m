Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 12FC93A1CE6
	for <lists+dri-devel@lfdr.de>; Wed,  9 Jun 2021 20:42:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 920E26E255;
	Wed,  9 Jun 2021 18:42:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B73BC6E255
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Jun 2021 18:42:04 +0000 (UTC)
IronPort-SDR: Dn5nnkecEw6EYBTNmA3rFTenot8cviaIaiHj8z60+Z8yfesmByoHbHvy/mflm3hFdyGMk3g83z
 iQ9sgsboPFUw==
X-IronPort-AV: E=McAfee;i="6200,9189,10010"; a="184829783"
X-IronPort-AV: E=Sophos;i="5.83,261,1616482800"; d="scan'208";a="184829783"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jun 2021 11:42:03 -0700
IronPort-SDR: 0xhC3MmzxyUiIuAFHMJ5crmcNWfcmh1gD2oc2U1ZufKSAiaQSm2hRiNmfLasVjwVDHgrYex/Rf
 HlPR34dlVb6Q==
X-IronPort-AV: E=Sophos;i="5.83,261,1616482800"; d="scan'208";a="552769948"
Received: from vkasired-desk2.fm.intel.com ([10.105.128.127])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jun 2021 11:42:03 -0700
From: Vivek Kasireddy <vivek.kasireddy@intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] udmabuf: Add support for mapping hugepages (v4)
Date: Wed,  9 Jun 2021 11:29:15 -0700
Message-Id: <20210609182915.592743-1-vivek.kasireddy@intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210609065640.an5vxoup7yesenwb@sirius.home.kraxel.org>
References: <20210609065640.an5vxoup7yesenwb@sirius.home.kraxel.org>
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
Cc: Dongwon Kim <dongwon.kim@intel.com>,
 Vivek Kasireddy <vivek.kasireddy@intel.com>, Gerd Hoffmann <kraxel@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

If the VMM's (Qemu) memory backend is backed up by memfd + Hugepages
(hugetlbfs and not THP), we have to first find the hugepage(s) where
the Guest allocations are located and then extract the regular 4k
sized subpages from them.

v2: Ensure that the subpage and hugepage offsets are calculated correctly
when the range of subpage allocations cuts across multiple hugepages.

v3: Instead of repeatedly looking up the hugepage for each subpage,
only do it when the subpage allocation crosses over into a different
hugepage. (suggested by Gerd and DW)

v4: Fix the following warning identified by checkpatch:
CHECK:OPEN_ENDED_LINE: Lines should not end with a '('

Cc: Gerd Hoffmann <kraxel@redhat.com>
Signed-off-by: Vivek Kasireddy <vivek.kasireddy@intel.com>
Signed-off-by: Dongwon Kim <dongwon.kim@intel.com>
---
 drivers/dma-buf/udmabuf.c | 50 +++++++++++++++++++++++++++++++++------
 1 file changed, 43 insertions(+), 7 deletions(-)

diff --git a/drivers/dma-buf/udmabuf.c b/drivers/dma-buf/udmabuf.c
index db732f71e59a..d509f0d60794 100644
--- a/drivers/dma-buf/udmabuf.c
+++ b/drivers/dma-buf/udmabuf.c
@@ -11,6 +11,7 @@
 #include <linux/shmem_fs.h>
 #include <linux/slab.h>
 #include <linux/udmabuf.h>
+#include <linux/hugetlb.h>
 
 static const u32    list_limit = 1024;  /* udmabuf_create_list->count limit */
 static const size_t size_limit_mb = 64; /* total dmabuf size, in megabytes  */
@@ -160,10 +161,13 @@ static long udmabuf_create(struct miscdevice *device,
 {
 	DEFINE_DMA_BUF_EXPORT_INFO(exp_info);
 	struct file *memfd = NULL;
+	struct address_space *mapping = NULL;
 	struct udmabuf *ubuf;
 	struct dma_buf *buf;
 	pgoff_t pgoff, pgcnt, pgidx, pgbuf = 0, pglimit;
-	struct page *page;
+	struct page *page, *hpage = NULL;
+	pgoff_t subpgoff, maxsubpgs;
+	struct hstate *hpstate;
 	int seals, ret = -EINVAL;
 	u32 i, flags;
 
@@ -194,7 +198,8 @@ static long udmabuf_create(struct miscdevice *device,
 		memfd = fget(list[i].memfd);
 		if (!memfd)
 			goto err;
-		if (!shmem_mapping(file_inode(memfd)->i_mapping))
+		mapping = file_inode(memfd)->i_mapping;
+		if (!shmem_mapping(mapping) && !is_file_hugepages(memfd))
 			goto err;
 		seals = memfd_fcntl(memfd, F_GET_SEALS, 0);
 		if (seals == -EINVAL)
@@ -205,17 +210,48 @@ static long udmabuf_create(struct miscdevice *device,
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
+				if (!hpage) {
+					hpage = find_get_page_flags(mapping,
+							pgoff, FGP_ACCESSED);
+					if (IS_ERR(hpage)) {
+						ret = PTR_ERR(hpage);
+						goto err;
+					}
+				}
+				page = hpage + subpgoff;
+				get_page(page);
+				subpgoff++;
+				if (subpgoff == maxsubpgs) {
+					put_page(hpage);
+					hpage = NULL;
+					subpgoff = 0;
+					pgoff++;
+				}
+			} else {
+				page = shmem_read_mapping_page(mapping,
+							       pgoff + pgidx);
+				if (IS_ERR(page)) {
+					ret = PTR_ERR(page);
+					goto err;
+				}
 			}
 			ubuf->pages[pgbuf++] = page;
 		}
 		fput(memfd);
 		memfd = NULL;
+		if (hpage) {
+			put_page(hpage);
+			hpage = NULL;
+		}
 	}
 
 	exp_info.ops  = &udmabuf_ops;
-- 
2.30.2

