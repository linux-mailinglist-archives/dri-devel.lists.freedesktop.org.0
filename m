Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ADF48252520
	for <lists+dri-devel@lfdr.de>; Wed, 26 Aug 2020 03:45:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C5DDA6E9E2;
	Wed, 26 Aug 2020 01:45:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [205.139.110.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C1BA16E9DF
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Aug 2020 01:45:04 +0000 (UTC)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-182-toP_8DdqOka2S8Xq6DIi4g-1; Tue, 25 Aug 2020 21:44:59 -0400
X-MC-Unique: toP_8DdqOka2S8Xq6DIi4g-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AC898189E602;
 Wed, 26 Aug 2020 01:44:58 +0000 (UTC)
Received: from tyrion-bne-redhat-com.redhat.com (vpn2-54-53.bne.redhat.com
 [10.64.54.53])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 42ED860C13;
 Wed, 26 Aug 2020 01:44:57 +0000 (UTC)
From: Dave Airlie <airlied@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 10/23] drm/amdgpu/ttm: move to driver backend binding funcs
Date: Wed, 26 Aug 2020 11:44:15 +1000
Message-Id: <20200826014428.828392-11-airlied@gmail.com>
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
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c | 10 +++-------
 1 file changed, 3 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
index 9592505563bf..f07e7121bcc5 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
@@ -1255,12 +1255,6 @@ static void amdgpu_ttm_backend_destroy(struct ttm_bo_device *bdev,
 	kfree(gtt);
 }
 
-static struct ttm_backend_func amdgpu_backend_func = {
-	.bind = &amdgpu_ttm_backend_bind,
-	.unbind = &amdgpu_ttm_backend_unbind,
-	.destroy = &amdgpu_ttm_backend_destroy,
-};
-
 /**
  * amdgpu_ttm_tt_create - Create a ttm_tt object for a given BO
  *
@@ -1277,7 +1271,6 @@ static struct ttm_tt *amdgpu_ttm_tt_create(struct ttm_buffer_object *bo,
 	if (gtt == NULL) {
 		return NULL;
 	}
-	gtt->ttm.ttm.func = &amdgpu_backend_func;
 	gtt->gobj = &bo->base;
 
 	/* allocate space for the uninitialized page entries */
@@ -1679,6 +1672,9 @@ static struct ttm_bo_driver amdgpu_bo_driver = {
 	.ttm_tt_create = &amdgpu_ttm_tt_create,
 	.ttm_tt_populate = &amdgpu_ttm_tt_populate,
 	.ttm_tt_unpopulate = &amdgpu_ttm_tt_unpopulate,
+	.ttm_tt_bind = &amdgpu_ttm_backend_bind,
+	.ttm_tt_unbind = &amdgpu_ttm_backend_unbind,
+	.ttm_tt_destroy = &amdgpu_ttm_backend_destroy,
 	.eviction_valuable = amdgpu_ttm_bo_eviction_valuable,
 	.evict_flags = &amdgpu_evict_flags,
 	.move = &amdgpu_bo_move,
-- 
2.27.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
