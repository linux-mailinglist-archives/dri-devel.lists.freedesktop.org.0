Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 118C6284326
	for <lists+dri-devel@lfdr.de>; Tue,  6 Oct 2020 02:07:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2CD326E1BA;
	Tue,  6 Oct 2020 00:06:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-44.mimecast.com
 (us-smtp-delivery-44.mimecast.com [205.139.111.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C0C06E1BB
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Oct 2020 00:06:58 +0000 (UTC)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-532-xLADUCRiPkuo9KHjxGh6-Q-1; Mon, 05 Oct 2020 20:06:53 -0400
X-MC-Unique: xLADUCRiPkuo9KHjxGh6-Q-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E7B2685C705;
 Tue,  6 Oct 2020 00:06:51 +0000 (UTC)
Received: from tyrion-bne-redhat-com.redhat.com (vpn2-54-60.bne.redhat.com
 [10.64.54.60])
 by smtp.corp.redhat.com (Postfix) with ESMTP id EF95673687;
 Tue,  6 Oct 2020 00:06:50 +0000 (UTC)
From: Dave Airlie <airlied@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 2/5] drm/vmwgfx: move null mem checks outside move notifies
Date: Tue,  6 Oct 2020 10:06:41 +1000
Message-Id: <20201006000644.1005758-3-airlied@gmail.com>
In-Reply-To: <20201006000644.1005758-1-airlied@gmail.com>
References: <20201006000644.1005758-1-airlied@gmail.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
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
Cc: christian.koenig@amd.com, rscheidegger.oss@gmail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Dave Airlie <airlied@redhat.com>

Both fns checked mem == NULL, just move the check outside.

Signed-off-by: Dave Airlie <airlied@redhat.com>
---
 drivers/gpu/drm/vmwgfx/vmwgfx_bo.c         | 3 ---
 drivers/gpu/drm/vmwgfx/vmwgfx_resource.c   | 2 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c | 2 ++
 3 files changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_bo.c b/drivers/gpu/drm/vmwgfx/vmwgfx_bo.c
index 9a66ba254326..263d76ae43f0 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_bo.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_bo.c
@@ -1192,9 +1192,6 @@ void vmw_bo_move_notify(struct ttm_buffer_object *bo,
 {
 	struct vmw_buffer_object *vbo;
 
-	if (mem == NULL)
-		return;
-
 	/* Make sure @bo is embedded in a struct vmw_buffer_object? */
 	if (bo->destroy != vmw_bo_bo_free &&
 	    bo->destroy != vmw_user_bo_destroy)
diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_resource.c b/drivers/gpu/drm/vmwgfx/vmwgfx_resource.c
index 5e922d9d5f2c..00b535831a7a 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_resource.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_resource.c
@@ -867,7 +867,7 @@ void vmw_query_move_notify(struct ttm_buffer_object *bo,
 	mutex_lock(&dev_priv->binding_mutex);
 
 	dx_query_mob = container_of(bo, struct vmw_buffer_object, base);
-	if (mem == NULL || !dx_query_mob || !dx_query_mob->dx_query_ctx) {
+	if (!dx_query_mob || !dx_query_mob->dx_query_ctx) {
 		mutex_unlock(&dev_priv->binding_mutex);
 		return;
 	}
diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c b/drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c
index fc68f54df46a..2f88d2d79f9a 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c
@@ -707,6 +707,8 @@ static void vmw_move_notify(struct ttm_buffer_object *bo,
 			    bool evict,
 			    struct ttm_resource *mem)
 {
+	if (!mem)
+		return;
 	vmw_bo_move_notify(bo, mem);
 	vmw_query_move_notify(bo, mem);
 }
-- 
2.27.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
