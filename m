Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BB58A791B2
	for <lists+dri-devel@lfdr.de>; Wed,  2 Apr 2025 17:00:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3487310E7F8;
	Wed,  2 Apr 2025 15:00:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.b="R/MLFsPv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B160410E7F6;
 Wed,  2 Apr 2025 15:00:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=5XW0b8o2GA0rXaRAcMoHAk0zi9Q3pqKKR/5ZrqK6isA=; b=R/MLFsPvz24ooXP3n2jFFdaQXS
 M3AdX4NhgWKE+Ldr9ttHKD8qgG5GZYrzl4HoldQmoxWhsTna7sbeqGeV85qzgdBMglKSZcZo/qhDL
 27mzrVxCjQJEvMLyNxePILgRc7e8EX9LjIZsx1RTe7+xFO4/WYXtZfFZp9QtaI2kspbnodfP3P44a
 fbnLduvq4PVvMS9Ka/aw11jUuI7aHj0yslB/pG7B/3rc6DfE161Izl44/4miE8Y+4cy2i60FQ4eM2
 SOmtlICqt4DAxV3OBU6XtQ/ljD0WkgGJMiiWXQ4KH10ZgdKRajR1ONKHvVArn/PYczuOaMxhaNYYz
 gU7zsJJA==;
Received: from willy by casper.infradead.org with local (Exim 4.98.1 #2 (Red
 Hat Linux)) id 1tzzZX-00000009gsB-18Xi;
 Wed, 02 Apr 2025 15:00:07 +0000
From: "Matthew Wilcox (Oracle)" <willy@infradead.org>
To: linux-fsdevel@vger.kernel.org
Cc: "Matthew Wilcox (Oracle)" <willy@infradead.org>,
 intel-gfx@lists.freedesktop.org, linux-mm@kvack.org,
 dri-devel@lists.freedesktop.org
Subject: [PATCH v2 3/9] migrate: Remove call to ->writepage
Date: Wed,  2 Apr 2025 15:59:57 +0100
Message-ID: <20250402150005.2309458-4-willy@infradead.org>
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

The writepage callback is going away; filesystems must implement
migrate_folio or else dirty folios will not be migratable.

Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
---
 mm/migrate.c | 60 ++++++----------------------------------------------
 1 file changed, 7 insertions(+), 53 deletions(-)

diff --git a/mm/migrate.c b/mm/migrate.c
index f3ee6d8d5e2e..6e2488e5dbe4 100644
--- a/mm/migrate.c
+++ b/mm/migrate.c
@@ -944,67 +944,21 @@ int filemap_migrate_folio(struct address_space *mapping,
 }
 EXPORT_SYMBOL_GPL(filemap_migrate_folio);
 
-/*
- * Writeback a folio to clean the dirty state
- */
-static int writeout(struct address_space *mapping, struct folio *folio)
-{
-	struct writeback_control wbc = {
-		.sync_mode = WB_SYNC_NONE,
-		.nr_to_write = 1,
-		.range_start = 0,
-		.range_end = LLONG_MAX,
-		.for_reclaim = 1
-	};
-	int rc;
-
-	if (!mapping->a_ops->writepage)
-		/* No write method for the address space */
-		return -EINVAL;
-
-	if (!folio_clear_dirty_for_io(folio))
-		/* Someone else already triggered a write */
-		return -EAGAIN;
-
-	/*
-	 * A dirty folio may imply that the underlying filesystem has
-	 * the folio on some queue. So the folio must be clean for
-	 * migration. Writeout may mean we lose the lock and the
-	 * folio state is no longer what we checked for earlier.
-	 * At this point we know that the migration attempt cannot
-	 * be successful.
-	 */
-	remove_migration_ptes(folio, folio, 0);
-
-	rc = mapping->a_ops->writepage(&folio->page, &wbc);
-
-	if (rc != AOP_WRITEPAGE_ACTIVATE)
-		/* unlocked. Relock */
-		folio_lock(folio);
-
-	return (rc < 0) ? -EIO : -EAGAIN;
-}
-
 /*
  * Default handling if a filesystem does not provide a migration function.
  */
 static int fallback_migrate_folio(struct address_space *mapping,
 		struct folio *dst, struct folio *src, enum migrate_mode mode)
 {
-	if (folio_test_dirty(src)) {
-		/* Only writeback folios in full synchronous migration */
-		switch (mode) {
-		case MIGRATE_SYNC:
-			break;
-		default:
-			return -EBUSY;
-		}
-		return writeout(mapping, src);
-	}
+	WARN_ONCE(mapping->a_ops->writepages,
+			"%ps does not implement migrate_folio\n",
+			mapping->a_ops);
+	if (folio_test_dirty(src))
+		return -EBUSY;
 
 	/*
-	 * Buffers may be managed in a filesystem specific way.
-	 * We must have no buffers or drop them.
+	 * Filesystem may have private data at folio->private that we
+	 * can't migrate automatically.
 	 */
 	if (!filemap_release_folio(src, GFP_KERNEL))
 		return mode == MIGRATE_SYNC ? -EAGAIN : -EBUSY;
-- 
2.47.2

