Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8127DA791A9
	for <lists+dri-devel@lfdr.de>; Wed,  2 Apr 2025 17:00:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 38B5B10E814;
	Wed,  2 Apr 2025 15:00:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.b="aldD+WzI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ABBAE10E7FD;
 Wed,  2 Apr 2025 15:00:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=USN/8SwPxGkpN9iKStANYoZJi04hj3LODUnr4I2+Xx8=; b=aldD+WzI/aKdQ2XEMrI1DtpAyB
 uXrZ5Dnx/rhBTcN/bbRRqfOX2YC53+ZpRz75qWLyq/1urNcEOc/sxxc6aRf1DOrWtUeZST0atwG6D
 rPDsdz3NfzG5svTviGHXM5+n0/M+CqRecB+4O3qugWSFiematCWWMs+IbVGc80UFwNmGMuDH5MNYP
 xHJ9/+9ozytW5lP9Ugm7M2e4JbX3WPxUGItRy7OKJVKFlWocD9Z5qGu77nJE/Lxq+pXQ3VXqtPTRP
 36PRWYzQ4cZfAiVLx10GN+rhiM3tnzFQir5/15+eQigFcNP4ROxf+F6Sik872RulOVx8/DHDKhXYI
 kdfgkjLA==;
Received: from willy by casper.infradead.org with local (Exim 4.98.1 #2 (Red
 Hat Linux)) id 1tzzZX-00000009gsD-1Wga;
 Wed, 02 Apr 2025 15:00:07 +0000
From: "Matthew Wilcox (Oracle)" <willy@infradead.org>
To: linux-fsdevel@vger.kernel.org
Cc: "Matthew Wilcox (Oracle)" <willy@infradead.org>,
 intel-gfx@lists.freedesktop.org, linux-mm@kvack.org,
 dri-devel@lists.freedesktop.org
Subject: [PATCH v2 4/9] writeback: Remove writeback_use_writepage()
Date: Wed,  2 Apr 2025 15:59:58 +0100
Message-ID: <20250402150005.2309458-5-willy@infradead.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250402150005.2309458-1-willy@infradead.org>
References: <20250402150005.2309458-1-willy@infradead.org>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The ->writepage operation has been removed from all filesystems but
shmem and swap, neither of which call in here.  Remove this alternative
to calling ->writepages.

Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
---
 mm/page-writeback.c | 28 ++--------------------------
 1 file changed, 2 insertions(+), 26 deletions(-)

diff --git a/mm/page-writeback.c b/mm/page-writeback.c
index 18456ddd463b..3cf7ae45be58 100644
--- a/mm/page-writeback.c
+++ b/mm/page-writeback.c
@@ -2621,27 +2621,6 @@ int write_cache_pages(struct address_space *mapping,
 }
 EXPORT_SYMBOL(write_cache_pages);
 
-static int writeback_use_writepage(struct address_space *mapping,
-		struct writeback_control *wbc)
-{
-	struct folio *folio = NULL;
-	struct blk_plug plug;
-	int err;
-
-	blk_start_plug(&plug);
-	while ((folio = writeback_iter(mapping, wbc, folio, &err))) {
-		err = mapping->a_ops->writepage(&folio->page, wbc);
-		if (err == AOP_WRITEPAGE_ACTIVATE) {
-			folio_unlock(folio);
-			err = 0;
-		}
-		mapping_set_error(mapping, err);
-	}
-	blk_finish_plug(&plug);
-
-	return err;
-}
-
 int do_writepages(struct address_space *mapping, struct writeback_control *wbc)
 {
 	int ret;
@@ -2652,14 +2631,11 @@ int do_writepages(struct address_space *mapping, struct writeback_control *wbc)
 	wb = inode_to_wb_wbc(mapping->host, wbc);
 	wb_bandwidth_estimate_start(wb);
 	while (1) {
-		if (mapping->a_ops->writepages) {
+		if (mapping->a_ops->writepages)
 			ret = mapping->a_ops->writepages(mapping, wbc);
-		} else if (mapping->a_ops->writepage) {
-			ret = writeback_use_writepage(mapping, wbc);
-		} else {
+		else
 			/* deal with chardevs and other special files */
 			ret = 0;
-		}
 		if (ret != -ENOMEM || wbc->sync_mode != WB_SYNC_ALL)
 			break;
 
-- 
2.47.2

