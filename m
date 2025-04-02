Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 44863A791AC
	for <lists+dri-devel@lfdr.de>; Wed,  2 Apr 2025 17:00:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 48D0210E81A;
	Wed,  2 Apr 2025 15:00:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.b="UnwirFlG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 054E110E7FA;
 Wed,  2 Apr 2025 15:00:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=x5fMthl+YaILM39iz9o6tccRRw9/3DVe0YNJSzzz678=; b=UnwirFlGTRxdERwCdAhFqjsRYZ
 QoSUv85elJbet28sNBFxLnZYAHDmULxGIgfzgqPFxMCqUmRi/upx0/9/QDXW2BE8oS/QpNNoA1x5h
 p07RGrO2jfRAI4drMHFoURoaWDb1/B0jPKUN7Sd64RWmVdqDj4rm8hQsoNnTpxEpXm8fyubWc2VrX
 eiqEIVwY5723zFJd5POxZpsbkfU8xSLaGv0a8Px+rKDZVDIcfCHP2nOwILjdrTWfrAfrAAydB7KOR
 q5rOnmzK1YhElfHfdv0FsVGgt1vHLqsL1noYlitjyijpBXPKv7CIKBb0wChTCqjI7oejKaw7284Sn
 yzDMR8Lg==;
Received: from willy by casper.infradead.org with local (Exim 4.98.1 #2 (Red
 Hat Linux)) id 1tzzZX-00000009gse-335e;
 Wed, 02 Apr 2025 15:00:07 +0000
From: "Matthew Wilcox (Oracle)" <willy@infradead.org>
To: linux-fsdevel@vger.kernel.org
Cc: "Matthew Wilcox (Oracle)" <willy@infradead.org>,
 intel-gfx@lists.freedesktop.org, linux-mm@kvack.org,
 dri-devel@lists.freedesktop.org
Subject: [PATCH v2 7/9] ttm: Call shmem_writeout() from
 ttm_backup_backup_page()
Date: Wed,  2 Apr 2025 16:00:01 +0100
Message-ID: <20250402150005.2309458-8-willy@infradead.org>
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

The ->writepage operation is being removed.  Since this function
exclusively deals with shmem folios, we can call shmem_writeout()
to write it.

Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
---
 drivers/gpu/drm/ttm/ttm_backup.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/ttm/ttm_backup.c b/drivers/gpu/drm/ttm/ttm_backup.c
index 93c007f18855..0d5718466ffc 100644
--- a/drivers/gpu/drm/ttm/ttm_backup.c
+++ b/drivers/gpu/drm/ttm/ttm_backup.c
@@ -136,13 +136,13 @@ ttm_backup_backup_page(struct ttm_backup *backup, struct page *page,
 			.for_reclaim = 1,
 		};
 		folio_set_reclaim(to_folio);
-		ret = mapping->a_ops->writepage(folio_file_page(to_folio, idx), &wbc);
+		ret = shmem_writeout(to_folio, &wbc);
 		if (!folio_test_writeback(to_folio))
 			folio_clear_reclaim(to_folio);
 		/*
-		 * If writepage succeeds, it unlocks the folio.
-		 * writepage() errors are otherwise dropped, since writepage()
-		 * is only best effort here.
+		 * If writeout succeeds, it unlocks the folio.	errors
+		 * are otherwise dropped, since writeout is only best
+		 * effort here.
 		 */
 		if (ret)
 			folio_unlock(to_folio);
-- 
2.47.2

