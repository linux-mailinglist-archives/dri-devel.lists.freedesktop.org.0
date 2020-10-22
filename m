Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 13C2929569F
	for <lists+dri-devel@lfdr.de>; Thu, 22 Oct 2020 05:12:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C31D6E041;
	Thu, 22 Oct 2020 03:12:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-44.mimecast.com
 (us-smtp-delivery-44.mimecast.com [207.211.30.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B445B6E041
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Oct 2020 03:11:59 +0000 (UTC)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-281-cpd2wrCHM-i6YP4R4p4EUA-1; Wed, 21 Oct 2020 23:11:55 -0400
X-MC-Unique: cpd2wrCHM-i6YP4R4p4EUA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C4605186DD31;
 Thu, 22 Oct 2020 03:11:54 +0000 (UTC)
Received: from tyrion-bne-redhat-com.redhat.com (vpn2-54-180.bne.redhat.com
 [10.64.54.180])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 08AE31001281;
 Thu, 22 Oct 2020 03:11:53 +0000 (UTC)
From: Dave Airlie <airlied@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/ttm: remove overlapping memcpy support
Date: Thu, 22 Oct 2020 13:11:52 +1000
Message-Id: <20201022031152.1916925-1-airlied@gmail.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=airlied@gmail.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: gmail.com
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
Cc: christian.koenig@amd.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Dave Airlie <airlied@redhat.com>

remove the overlapping memcp support as it's never used.

Signed-off-by: Dave Airlie <airlied@redhat.com>
---
 drivers/gpu/drm/ttm/ttm_bo_util.c | 19 +++----------------
 1 file changed, 3 insertions(+), 16 deletions(-)

diff --git a/drivers/gpu/drm/ttm/ttm_bo_util.c b/drivers/gpu/drm/ttm/ttm_bo_util.c
index 0a5694ef1e07..ecb54415d1ca 100644
--- a/drivers/gpu/drm/ttm/ttm_bo_util.c
+++ b/drivers/gpu/drm/ttm/ttm_bo_util.c
@@ -180,9 +180,6 @@ int ttm_bo_move_memcpy(struct ttm_buffer_object *bo,
 	void *new_iomap;
 	int ret;
 	unsigned long i;
-	unsigned long page;
-	unsigned long add = 0;
-	int dir;
 
 	ret = ttm_bo_wait_ctx(bo, ctx);
 	if (ret)
@@ -220,27 +217,17 @@ int ttm_bo_move_memcpy(struct ttm_buffer_object *bo,
 			goto out1;
 	}
 
-	add = 0;
-	dir = 1;
-
-	if ((old_mem->mem_type == new_mem->mem_type) &&
-	    (new_mem->start < old_mem->start + old_mem->size)) {
-		dir = -1;
-		add = new_mem->num_pages - 1;
-	}
-
 	for (i = 0; i < new_mem->num_pages; ++i) {
-		page = i * dir + add;
 		if (old_iomap == NULL) {
 			pgprot_t prot = ttm_io_prot(bo, old_mem, PAGE_KERNEL);
-			ret = ttm_copy_ttm_io_page(ttm, new_iomap, page,
+			ret = ttm_copy_ttm_io_page(ttm, new_iomap, i,
 						   prot);
 		} else if (new_iomap == NULL) {
 			pgprot_t prot = ttm_io_prot(bo, new_mem, PAGE_KERNEL);
-			ret = ttm_copy_io_ttm_page(ttm, old_iomap, page,
+			ret = ttm_copy_io_ttm_page(ttm, old_iomap, i,
 						   prot);
 		} else {
-			ret = ttm_copy_io_page(new_iomap, old_iomap, page);
+			ret = ttm_copy_io_page(new_iomap, old_iomap, i);
 		}
 		if (ret)
 			goto out1;
-- 
2.27.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
