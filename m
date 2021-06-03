Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D9DBC399D5E
	for <lists+dri-devel@lfdr.de>; Thu,  3 Jun 2021 11:05:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 019F66F45E;
	Thu,  3 Jun 2021 09:05:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 136156F45E
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Jun 2021 09:05:14 +0000 (UTC)
IronPort-SDR: KKwpdkhhAkgk1yDG8xXcxdo/F7+FDElf1c/K2Y3udVNxG9ND53NK8f7XNj4B4IYJf6N1w6KQve
 6v1HfdNYCdfw==
X-IronPort-AV: E=McAfee;i="6200,9189,10003"; a="183683549"
X-IronPort-AV: E=Sophos;i="5.83,244,1616482800"; d="scan'208";a="183683549"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jun 2021 02:05:10 -0700
IronPort-SDR: Xfst5U1VEaiWhhasKW2arfTrZf6yYGZnWVcRaLSKmW3YQ9YlOhPEnaxuvd3AwWpNRwT8GNKIWj
 BIth/vib/wHw==
X-IronPort-AV: E=Sophos;i="5.83,244,1616482800"; d="scan'208";a="446221738"
Received: from vkasired-desk2.fm.intel.com ([10.105.128.127])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jun 2021 02:05:09 -0700
From: Vivek Kasireddy <vivek.kasireddy@intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] udmabuf: Add support for mapping hugepages
Date: Thu,  3 Jun 2021 01:52:31 -0700
Message-Id: <20210603085231.285768-1-vivek.kasireddy@intel.com>
X-Mailer: git-send-email 2.30.2
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

Cc: Gerd Hoffmann <kraxel@redhat.com>
Signed-off-by: Vivek Kasireddy <vivek.kasireddy@intel.com>
---
 drivers/dma-buf/udmabuf.c | 40 +++++++++++++++++++++++++++++++--------
 1 file changed, 32 insertions(+), 8 deletions(-)

diff --git a/drivers/dma-buf/udmabuf.c b/drivers/dma-buf/udmabuf.c
index db732f71e59a..4a976a56cbc3 100644
--- a/drivers/dma-buf/udmabuf.c
+++ b/drivers/dma-buf/udmabuf.c
@@ -11,6 +11,7 @@
 #include <linux/shmem_fs.h>
 #include <linux/slab.h>
 #include <linux/udmabuf.h>
+#include <linux/hugetlb.h>
 
 static const u32    list_limit = 1024;  /* udmabuf_create_list->count limit */
 static const size_t size_limit_mb = 64; /* total dmabuf size, in megabytes  */
@@ -162,8 +163,9 @@ static long udmabuf_create(struct miscdevice *device,
 	struct file *memfd = NULL;
 	struct udmabuf *ubuf;
 	struct dma_buf *buf;
-	pgoff_t pgoff, pgcnt, pgidx, pgbuf = 0, pglimit;
-	struct page *page;
+	pgoff_t pgoff, pgcnt, pgidx, pgbuf = 0, pglimit, subpgoff;
+	struct page *page, *hpage = NULL;
+	struct hstate *hpstate;
 	int seals, ret = -EINVAL;
 	u32 i, flags;
 
@@ -194,7 +196,8 @@ static long udmabuf_create(struct miscdevice *device,
 		memfd = fget(list[i].memfd);
 		if (!memfd)
 			goto err;
-		if (!shmem_mapping(file_inode(memfd)->i_mapping))
+		if (!shmem_mapping(file_inode(memfd)->i_mapping) &&
+		    !is_file_hugepages(memfd))
 			goto err;
 		seals = memfd_fcntl(memfd, F_GET_SEALS, 0);
 		if (seals == -EINVAL)
@@ -205,17 +208,38 @@ static long udmabuf_create(struct miscdevice *device,
 			goto err;
 		pgoff = list[i].offset >> PAGE_SHIFT;
 		pgcnt = list[i].size   >> PAGE_SHIFT;
-		for (pgidx = 0; pgidx < pgcnt; pgidx++) {
-			page = shmem_read_mapping_page(
-				file_inode(memfd)->i_mapping, pgoff + pgidx);
-			if (IS_ERR(page)) {
-				ret = PTR_ERR(page);
+		if (is_file_hugepages(memfd)) {
+			hpstate = hstate_file(memfd);
+			pgoff = list[i].offset >> huge_page_shift(hpstate);
+			subpgoff = (list[i].offset &
+				    ~huge_page_mask(hpstate)) >> PAGE_SHIFT;
+			hpage = find_get_page_flags(
+					file_inode(memfd)->i_mapping,
+					pgoff, FGP_ACCESSED);
+			if (IS_ERR(hpage)) {
+				ret = PTR_ERR(hpage);
 				goto err;
 			}
+		}
+		for (pgidx = 0; pgidx < pgcnt; pgidx++) {
+			if (is_file_hugepages(memfd)) {
+				page = hpage + subpgoff + pgidx;
+				get_page(page);
+			} else {
+				page = shmem_read_mapping_page(
+					file_inode(memfd)->i_mapping,
+					pgoff + pgidx);
+				if (IS_ERR(page)) {
+					ret = PTR_ERR(page);
+					goto err;
+				}
+			}
 			ubuf->pages[pgbuf++] = page;
 		}
 		fput(memfd);
 		memfd = NULL;
+		if (hpage)
+			put_page(hpage);
 	}
 
 	exp_info.ops  = &udmabuf_ops;
-- 
2.30.2

