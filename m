Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EFA81A791A2
	for <lists+dri-devel@lfdr.de>; Wed,  2 Apr 2025 17:00:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4FC4A10E7FD;
	Wed,  2 Apr 2025 15:00:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.b="DFlhRkJZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0424910E7F6;
 Wed,  2 Apr 2025 15:00:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=H/LzOSBZMJnPa9n+hJhMKcetVnuAU/qb1xOh1kNA3po=; b=DFlhRkJZvk0FxUhTFpLMVcqGW6
 xG1V3XXL/3wXAn/c2FOYw2EQMYqW/olCsErvNjPUKfLGXt+KADdT2YskzUX3BUzbnyAagDDYzB/fm
 ZR4Q9IpNbzkJL3GnwtfzS0XcEfD/32j2Dfmitv5ap5a8XrmQ8JcS7Kf2QXPDc3sqfLLqaVqVAynw3
 SVXXASaClM2+3ASDNUleyBPQi3HXCWxVaxx8xZiTEgWj5/FavNMrcjK/FGXAxKgWhUbSiBa86JP8X
 ULsI58AmQLxczl1eK++kle8TpZzr4ssoKT0HwbiRLd+lve1N9BIfdY9N8jDECSQ2yYLh8qLlIA9Mb
 nT2UhlgQ==;
Received: from willy by casper.infradead.org with local (Exim 4.98.1 #2 (Red
 Hat Linux)) id 1tzzZX-00000009gs7-0PTo;
 Wed, 02 Apr 2025 15:00:07 +0000
From: "Matthew Wilcox (Oracle)" <willy@infradead.org>
To: linux-fsdevel@vger.kernel.org
Cc: "Matthew Wilcox (Oracle)" <willy@infradead.org>,
 intel-gfx@lists.freedesktop.org, linux-mm@kvack.org,
 dri-devel@lists.freedesktop.org, stable@vger.kernel.org,
 David Howells <dhowells@redhat.com>, v9fs@lists.linux.dev
Subject: [PATCH v2 1/9] 9p: Add a migrate_folio method
Date: Wed,  2 Apr 2025 15:59:55 +0100
Message-ID: <20250402150005.2309458-2-willy@infradead.org>
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

The migration code used to be able to migrate dirty 9p folios by writing
them back using writepage.  When the writepage method was removed,
we neglected to add a migrate_folio method, which means that dirty 9p
folios have been unmovable ever since.  This reduced our success at
defragmenting memory on machines which use 9p heavily.

Fixes: 80105ed2fd27 (9p: Use netfslib read/write_iter)
Cc: stable@vger.kernel.org
Cc: David Howells <dhowells@redhat.com>
Cc: v9fs@lists.linux.dev
Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
---
 fs/9p/vfs_addr.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/fs/9p/vfs_addr.c b/fs/9p/vfs_addr.c
index 32619d146cbc..1286d96a29bc 100644
--- a/fs/9p/vfs_addr.c
+++ b/fs/9p/vfs_addr.c
@@ -164,4 +164,5 @@ const struct address_space_operations v9fs_addr_operations = {
 	.invalidate_folio	= netfs_invalidate_folio,
 	.direct_IO		= noop_direct_IO,
 	.writepages		= netfs_writepages,
+	.migrate_folio		= filemap_migrate_folio,
 };
-- 
2.47.2

