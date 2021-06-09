Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 81CBE3A1BAE
	for <lists+dri-devel@lfdr.de>; Wed,  9 Jun 2021 19:23:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B83166E9C3;
	Wed,  9 Jun 2021 17:23:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EX13-EDG-OU-002.vmware.com (ex13-edg-ou-002.vmware.com
 [208.91.0.190])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E69B6E9BC
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Jun 2021 17:23:13 +0000 (UTC)
Received: from sc9-mailhost3.vmware.com (10.113.161.73) by
 EX13-EDG-OU-002.vmware.com (10.113.208.156) with Microsoft SMTP Server id
 15.0.1156.6; Wed, 9 Jun 2021 10:23:10 -0700
Received: from vertex.localdomain (unknown [10.21.244.178])
 by sc9-mailhost3.vmware.com (Postfix) with ESMTP id 5F9D82024D;
 Wed,  9 Jun 2021 10:23:12 -0700 (PDT)
From: Zack Rusin <zackr@vmware.com>
To: <dri-devel@lists.freedesktop.org>
Subject: [PATCH 6/9] drm/vmwgfx: inline access to the pages from the piter
Date: Wed, 9 Jun 2021 13:23:04 -0400
Message-ID: <20210609172307.131929-7-zackr@vmware.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210609172307.131929-1-zackr@vmware.com>
References: <20210609172307.131929-1-zackr@vmware.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (EX13-EDG-OU-002.vmware.com: zackr@vmware.com does not
 designate permitted sender hosts)
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
Cc: Martin Krastev <krastevm@vmware.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The indirection doesn't make sense because we always go through
the same function pointer. Instead of the extra indirection
lets inline the access to the current page.

Signed-off-by: Zack Rusin <zackr@vmware.com>
Reviewed-by: Martin Krastev <krastevm@vmware.com>
---
 drivers/gpu/drm/vmwgfx/vmwgfx_drv.h        |  3 +--
 drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c | 16 ----------------
 2 files changed, 1 insertion(+), 18 deletions(-)

diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.h b/drivers/gpu/drm/vmwgfx/vmwgfx_drv.h
index 31519b78cb6a..3875cfbf1791 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.h
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_drv.h
@@ -358,7 +358,6 @@ struct vmw_piter {
 	unsigned long num_pages;
 	bool (*next)(struct vmw_piter *);
 	dma_addr_t (*dma_address)(struct vmw_piter *);
-	struct page *(*page)(struct vmw_piter *);
 };
 
 /*
@@ -1088,7 +1087,7 @@ static inline dma_addr_t vmw_piter_dma_addr(struct vmw_piter *viter)
  */
 static inline struct page *vmw_piter_page(struct vmw_piter *viter)
 {
-	return viter->page(viter);
+	return viter->pages[viter->i];
 }
 
 /**
diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c b/drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c
index a6015f2a297f..b0973c27e774 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c
@@ -222,21 +222,6 @@ static bool __vmw_piter_sg_next(struct vmw_piter *viter)
 }
 
 
-/**
- * __vmw_piter_non_sg_page: Helper functions to return a pointer
- * to the current page.
- *
- * @viter: Pointer to the iterator
- *
- * These functions return a pointer to the page currently
- * pointed to by @viter. Functions are selected depending on the
- * current mapping mode.
- */
-static struct page *__vmw_piter_non_sg_page(struct vmw_piter *viter)
-{
-	return viter->pages[viter->i];
-}
-
 static dma_addr_t __vmw_piter_dma_addr(struct vmw_piter *viter)
 {
 	return viter->addrs[viter->i];
@@ -264,7 +249,6 @@ void vmw_piter_start(struct vmw_piter *viter, const struct vmw_sg_table *vsgt,
 {
 	viter->i = p_offset - 1;
 	viter->num_pages = vsgt->num_pages;
-	viter->page = &__vmw_piter_non_sg_page;
 	viter->pages = vsgt->pages;
 	switch (vsgt->mode) {
 	case vmw_dma_alloc_coherent:
-- 
2.30.2

