Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E11BC25251C
	for <lists+dri-devel@lfdr.de>; Wed, 26 Aug 2020 03:45:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4EF226E9DD;
	Wed, 26 Aug 2020 01:45:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [205.139.110.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 24D9C6E9DD
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Aug 2020 01:45:01 +0000 (UTC)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-228-tKQhxvXNNNmocxqWHjko4Q-1; Tue, 25 Aug 2020 21:44:57 -0400
X-MC-Unique: tKQhxvXNNNmocxqWHjko4Q-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D7A058030B1;
 Wed, 26 Aug 2020 01:44:56 +0000 (UTC)
Received: from tyrion-bne-redhat-com.redhat.com (vpn2-54-53.bne.redhat.com
 [10.64.54.53])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C169360C13;
 Wed, 26 Aug 2020 01:44:52 +0000 (UTC)
From: Dave Airlie <airlied@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 09/23] drm/vmwgfx: move to driver binding functions
Date: Wed, 26 Aug 2020 11:44:14 +1000
Message-Id: <20200826014428.828392-10-airlied@gmail.com>
In-Reply-To: <20200826014428.828392-1-airlied@gmail.com>
References: <20200826014428.828392-1-airlied@gmail.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Mimecast-Spam-Score: 0.0
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
Cc: kraxel@redhat.com, sroland@vmware.com, bskeggs@redhat.com,
 christian.koenig@amd.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Dave Airlie <airlied@redhat.com>

Signed-off-by: Dave Airlie <airlied@redhat.com>
---
 drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c | 10 +++-------
 1 file changed, 3 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c b/drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c
index a76a7f542dd8..6757be98be14 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c
@@ -668,12 +668,6 @@ static void vmw_ttm_unpopulate(struct ttm_bo_device *bdev,
 		ttm_pool_unpopulate(ttm);
 }
 
-static struct ttm_backend_func vmw_ttm_func = {
-	.bind = vmw_ttm_bind,
-	.unbind = vmw_ttm_unbind,
-	.destroy = vmw_ttm_destroy,
-};
-
 static struct ttm_tt *vmw_ttm_tt_create(struct ttm_buffer_object *bo,
 					uint32_t page_flags)
 {
@@ -684,7 +678,6 @@ static struct ttm_tt *vmw_ttm_tt_create(struct ttm_buffer_object *bo,
 	if (!vmw_be)
 		return NULL;
 
-	vmw_be->dma_ttm.ttm.func = &vmw_ttm_func;
 	vmw_be->dev_priv = container_of(bo->bdev, struct vmw_private, bdev);
 	vmw_be->mob = NULL;
 
@@ -770,6 +763,9 @@ struct ttm_bo_driver vmw_bo_driver = {
 	.ttm_tt_create = &vmw_ttm_tt_create,
 	.ttm_tt_populate = &vmw_ttm_populate,
 	.ttm_tt_unpopulate = &vmw_ttm_unpopulate,
+	.ttm_tt_bind = &vmw_ttm_bind,
+	.ttm_tt_unbind = &vmw_ttm_unbind,
+	.ttm_tt_destroy = &vmw_ttm_destroy,
 	.eviction_valuable = ttm_bo_eviction_valuable,
 	.evict_flags = vmw_evict_flags,
 	.move = NULL,
-- 
2.27.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
