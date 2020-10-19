Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2714829312E
	for <lists+dri-devel@lfdr.de>; Tue, 20 Oct 2020 00:23:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 61DAC6EB50;
	Mon, 19 Oct 2020 22:23:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-44.mimecast.com
 (us-smtp-delivery-44.mimecast.com [205.139.111.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1DE276EB4E
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Oct 2020 22:23:09 +0000 (UTC)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-524-OLTGFry0OkC8ZVEeUORR6Q-1; Mon, 19 Oct 2020 18:23:03 -0400
X-MC-Unique: OLTGFry0OkC8ZVEeUORR6Q-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 850051868421;
 Mon, 19 Oct 2020 22:23:02 +0000 (UTC)
Received: from tyrion-bne-redhat-com.redhat.com (vpn2-54-180.bne.redhat.com
 [10.64.54.180])
 by smtp.corp.redhat.com (Postfix) with ESMTP id BD6D71002391;
 Mon, 19 Oct 2020 22:23:01 +0000 (UTC)
From: Dave Airlie <airlied@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 1/5] drm/ttm: fix eviction valuable range check.
Date: Tue, 20 Oct 2020 08:22:53 +1000
Message-Id: <20201019222257.1684769-2-airlied@gmail.com>
In-Reply-To: <20201019222257.1684769-1-airlied@gmail.com>
References: <20201019222257.1684769-1-airlied@gmail.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
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

This was adding size to start, but pfn and start are in pages,
so it should be using num_pages.

Not sure this fixes anything in the real world, just noticed it
during refactoring.

Signed-off-by: Dave Airlie <airlied@redhat.com>
---
 drivers/gpu/drm/ttm/ttm_bo.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/ttm/ttm_bo.c b/drivers/gpu/drm/ttm/ttm_bo.c
index cbc74a320db2..3101650c01b4 100644
--- a/drivers/gpu/drm/ttm/ttm_bo.c
+++ b/drivers/gpu/drm/ttm/ttm_bo.c
@@ -620,7 +620,7 @@ bool ttm_bo_eviction_valuable(struct ttm_buffer_object *bo,
 	/* Don't evict this BO if it's outside of the
 	 * requested placement range
 	 */
-	if (place->fpfn >= (bo->mem.start + bo->mem.size) ||
+	if (place->fpfn >= (bo->mem.start + bo->mem.num_pages) ||
 	    (place->lpfn && place->lpfn <= bo->mem.start))
 		return false;
 
-- 
2.27.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
