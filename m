Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BBAF977F0EE
	for <lists+dri-devel@lfdr.de>; Thu, 17 Aug 2023 09:10:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1945010E1B4;
	Thu, 17 Aug 2023 07:10:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6387810E1B1
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Aug 2023 07:10:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1692256220; x=1723792220;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=oHz4gJ1RUR72JutajLhDLQnJNp66EtQNsodmpCFgLug=;
 b=VW/x8Szetdt8SjjuPReIhnYwI/MZnc7z4pf78iBW7uFQ1kHQ0F9ykqqD
 XjH930l0Ut8PEIiSbHK0rcRq4JY+pcxPa28TCn1hyewDwvtkotM+MUzCk
 RSTrKSHZs8Cjm1c4+KsWqowNmu27aRYpRyfRs1WiNcdh/ERhHKahLkbrF
 CxVVpWRxiYm6MyJanZnEk4d4s6ETOKj+BfG33SrKS5xHeWo9QzrTm9lQw
 NsV7FlAZiCpX738hzutW6Wh+hRRXKtHYHcx0UrSHRpRpi/zG1y1o9GQOx
 4kV8xLmv72J7F2wKIptsanq9w9vp3qvgOZQ18nv2YRQTPvxAISu0W08Gm w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10803"; a="370200892"
X-IronPort-AV: E=Sophos;i="6.01,179,1684825200"; d="scan'208";a="370200892"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Aug 2023 00:10:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10803"; a="1065142185"
X-IronPort-AV: E=Sophos;i="6.01,179,1684825200"; d="scan'208";a="1065142185"
Received: from vkasired-desk2.fm.intel.com ([10.105.128.127])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Aug 2023 00:10:18 -0700
From: Vivek Kasireddy <vivek.kasireddy@intel.com>
To: dri-devel@lists.freedesktop.org,
	linux-mm@kvack.org
Subject: [PATCH v1 2/3] udmabuf: Add support for page migration out of movable
 zone or CMA
Date: Wed, 16 Aug 2023 23:49:33 -0700
Message-Id: <20230817064934.3424431-3-vivek.kasireddy@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230817064934.3424431-1-vivek.kasireddy@intel.com>
References: <20230817064934.3424431-1-vivek.kasireddy@intel.com>
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
Cc: Dongwon Kim <dongwon.kim@intel.com>, David Hildenbrand <david@redhat.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, Hugh Dickins <hughd@google.com>,
 Vivek Kasireddy <vivek.kasireddy@intel.com>, Peter Xu <peterx@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Jason Gunthorpe <jgg@nvidia.com>,
 Junxiao Chang <junxiao.chang@intel.com>,
 Mike Kravetz <mike.kravetz@oracle.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Since udmabuf could potentially pin pages that may reside in the
movable zone or CMA and thereby break features such as memory
hotunplug, it makes sense to migrate the pages out of these
areas. In order to accomplish this, we note the mapping and the
index of each page and then call check_and_migrate_movable_pages().

As check_and_migrate_movable_pages() unpins all the pages (and
also replaces the migrated pages in the mapping) upon successful
migration, we need to retrieve all the pages from their associated
mapping using the index we noted down earlier and re-pin them again.

Cc: David Hildenbrand <david@redhat.com>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: Mike Kravetz <mike.kravetz@oracle.com>
Cc: Hugh Dickins <hughd@google.com>
Cc: Peter Xu <peterx@redhat.com>
Cc: Jason Gunthorpe <jgg@nvidia.com>
Cc: Gerd Hoffmann <kraxel@redhat.com>
Cc: Dongwon Kim <dongwon.kim@intel.com>
Cc: Junxiao Chang <junxiao.chang@intel.com>
Suggested-by: David Hildenbrand <david@redhat.com>
Signed-off-by: Vivek Kasireddy <vivek.kasireddy@intel.com>
---
 drivers/dma-buf/udmabuf.c | 106 +++++++++++++++++++++++++++++++++++---
 1 file changed, 100 insertions(+), 6 deletions(-)

diff --git a/drivers/dma-buf/udmabuf.c b/drivers/dma-buf/udmabuf.c
index 1a41c4a069ea..63912c73d122 100644
--- a/drivers/dma-buf/udmabuf.c
+++ b/drivers/dma-buf/udmabuf.c
@@ -30,6 +30,12 @@ struct udmabuf {
 	struct sg_table *sg;
 	struct miscdevice *device;
 	pgoff_t *subpgoff;
+	struct udmabuf_backing_info *backing;
+};
+
+struct udmabuf_backing_info {
+	struct address_space *mapping;
+	pgoff_t mapidx;
 };
 
 static vm_fault_t udmabuf_vm_fault(struct vm_fault *vmf)
@@ -156,8 +162,10 @@ static void release_udmabuf(struct dma_buf *buf)
 		put_sg_table(dev, ubuf->sg, DMA_BIDIRECTIONAL);
 
 	for (pg = 0; pg < ubuf->pagecount; pg++)
-		put_page(ubuf->pages[pg]);
+		unpin_user_page(ubuf->pages[pg]);
+
 	kfree(ubuf->subpgoff);
+	kfree(ubuf->backing);
 	kfree(ubuf->pages);
 	kfree(ubuf);
 }
@@ -211,6 +219,76 @@ static const struct dma_buf_ops udmabuf_ops = {
 #define SEALS_WANTED (F_SEAL_SHRINK)
 #define SEALS_DENIED (F_SEAL_WRITE)
 
+static int udmabuf_pin_pages(struct udmabuf *ubuf)
+{
+	struct address_space *mapping;
+	struct folio *folio;
+	struct page *page;
+	pgoff_t pg, mapidx;
+	int ret;
+
+	for (pg = 0; pg < ubuf->pagecount; pg++) {
+		mapping = ubuf->backing[pg].mapping;
+		mapidx = ubuf->backing[pg].mapidx;
+
+		if (!ubuf->pages[pg]) {
+			page = find_get_page_flags(mapping, mapidx,
+						   FGP_ACCESSED);
+			if (!page) {
+				if (!shmem_mapping(mapping)) {
+					ret = -EINVAL;
+					goto err;
+				}
+
+				page = shmem_read_mapping_page(mapping,
+							       mapidx);
+				if (IS_ERR(page)) {
+					ret = PTR_ERR(page);
+					goto err;
+				}
+			}
+			ubuf->pages[pg] = page;
+		}
+
+		folio = page_folio(ubuf->pages[pg]);
+		if (folio_test_large(folio))
+			atomic_add(1, &folio->_pincount);
+		else
+			folio_ref_add(folio, GUP_PIN_COUNTING_BIAS);
+
+		/* Since we are doing the equivalent of FOLL_PIN above, we can
+		 * go ahead and release our (udmabuf) reference on the pages.
+		 * Otherwise, migrate_pages() will fail as it doesn't like the
+		 * extra reference.
+		 */
+		put_page(ubuf->pages[pg]);
+	}
+	return 0;
+
+err:
+	while (pg > 0 && ubuf->pages[--pg]) {
+		unpin_user_page(ubuf->pages[pg]);
+		ubuf->pages[pg] = NULL;
+	}
+	return ret;
+}
+
+static long udmabuf_migrate_pages(struct udmabuf *ubuf)
+{
+	long ret;
+
+	do {
+		ret = udmabuf_pin_pages(ubuf);
+		if (ret < 0)
+			break;
+
+		ret = check_and_migrate_movable_pages(ubuf->pagecount,
+						      ubuf->pages);
+	} while (ret == -EAGAIN);
+
+	return ret;
+}
+
 static long udmabuf_create(struct miscdevice *device,
 			   struct udmabuf_create_list *head,
 			   struct udmabuf_create_item *list)
@@ -224,7 +302,8 @@ static long udmabuf_create(struct miscdevice *device,
 	struct page *page, *hpage = NULL;
 	pgoff_t mapidx, chunkoff, maxchunks;
 	struct hstate *hpstate;
-	int seals, ret = -EINVAL;
+	long ret = -EINVAL;
+	int seals;
 	u32 i, flags;
 
 	ubuf = kzalloc(sizeof(*ubuf), GFP_KERNEL);
@@ -252,6 +331,13 @@ static long udmabuf_create(struct miscdevice *device,
 		goto err;
 	}
 
+	ubuf->backing = kmalloc_array(ubuf->pagecount, sizeof(*ubuf->backing),
+				      GFP_KERNEL);
+	if (!ubuf->backing) {
+		ret = -ENOMEM;
+		goto err;
+	}
+
 	pgbuf = 0;
 	for (i = 0; i < head->count; i++) {
 		ret = -EBADFD;
@@ -298,7 +384,8 @@ static long udmabuf_create(struct miscdevice *device,
 				}
 				get_page(hpage);
 				ubuf->pages[pgbuf] = hpage;
-				ubuf->subpgoff[pgbuf++] = chunkoff << PAGE_SHIFT;
+				ubuf->subpgoff[pgbuf] = chunkoff << PAGE_SHIFT;
+				ubuf->backing[pgbuf].mapidx = mapidx;
 				if (++chunkoff == maxchunks) {
 					put_page(hpage);
 					hpage = NULL;
@@ -312,8 +399,10 @@ static long udmabuf_create(struct miscdevice *device,
 					ret = PTR_ERR(page);
 					goto err;
 				}
-				ubuf->pages[pgbuf++] = page;
+				ubuf->pages[pgbuf] = page;
+				ubuf->backing[pgbuf].mapidx = mapidx;
 			}
+			ubuf->backing[pgbuf++].mapping = mapping;
 		}
 		fput(memfd);
 		memfd = NULL;
@@ -323,6 +412,10 @@ static long udmabuf_create(struct miscdevice *device,
 		}
 	}
 
+	ret = udmabuf_migrate_pages(ubuf);
+	if (ret < 0)
+		goto err;
+
 	exp_info.ops  = &udmabuf_ops;
 	exp_info.size = ubuf->pagecount << PAGE_SHIFT;
 	exp_info.priv = ubuf;
@@ -341,11 +434,12 @@ static long udmabuf_create(struct miscdevice *device,
 	return dma_buf_fd(buf, flags);
 
 err:
-	while (pgbuf > 0)
-		put_page(ubuf->pages[--pgbuf]);
+	while (pgbuf > 0 && ubuf->pages[--pgbuf])
+		put_page(ubuf->pages[pgbuf]);
 	if (memfd)
 		fput(memfd);
 	kfree(ubuf->subpgoff);
+	kfree(ubuf->backing);
 	kfree(ubuf->pages);
 	kfree(ubuf);
 	return ret;
-- 
2.39.2

