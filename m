Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D94F5274F5C
	for <lists+dri-devel@lfdr.de>; Wed, 23 Sep 2020 05:05:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 837CE6E405;
	Wed, 23 Sep 2020 03:05:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-44.mimecast.com
 (us-smtp-delivery-44.mimecast.com [207.211.30.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 685DF6E405
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Sep 2020 03:05:06 +0000 (UTC)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-413-2qP6KD8yMF2UsZBpdkFS8g-1; Tue, 22 Sep 2020 23:05:00 -0400
X-MC-Unique: 2qP6KD8yMF2UsZBpdkFS8g-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AD46F10082E7;
 Wed, 23 Sep 2020 03:04:59 +0000 (UTC)
Received: from tyrion-bne-redhat-com.redhat.com (vpn2-54-60.bne.redhat.com
 [10.64.54.60])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B74195D9CC;
 Wed, 23 Sep 2020 03:04:58 +0000 (UTC)
From: Dave Airlie <airlied@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 01/10] drm/radeon: kill radeon_bo_wait
Date: Wed, 23 Sep 2020 13:04:45 +1000
Message-Id: <20200923030454.362731-2-airlied@gmail.com>
In-Reply-To: <20200923030454.362731-1-airlied@gmail.com>
References: <20200923030454.362731-1-airlied@gmail.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
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
Cc: christian.koenig@amd.com, bskeggs@redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Dave Airlie <airlied@redhat.com>

this is unused

Signed-off-by: Dave Airlie <airlied@redhat.com>
---
 drivers/gpu/drm/radeon/radeon_object.c | 15 ---------------
 drivers/gpu/drm/radeon/radeon_object.h |  3 ---
 2 files changed, 18 deletions(-)

diff --git a/drivers/gpu/drm/radeon/radeon_object.c b/drivers/gpu/drm/radeon/radeon_object.c
index 0de267ab3913..689426dd8480 100644
--- a/drivers/gpu/drm/radeon/radeon_object.c
+++ b/drivers/gpu/drm/radeon/radeon_object.c
@@ -825,21 +825,6 @@ int radeon_bo_fault_reserve_notify(struct ttm_buffer_object *bo)
 	return 0;
 }
 
-int radeon_bo_wait(struct radeon_bo *bo, u32 *mem_type, bool no_wait)
-{
-	int r;
-
-	r = ttm_bo_reserve(&bo->tbo, true, no_wait, NULL);
-	if (unlikely(r != 0))
-		return r;
-	if (mem_type)
-		*mem_type = bo->tbo.mem.mem_type;
-
-	r = ttm_bo_wait(&bo->tbo, true, no_wait);
-	ttm_bo_unreserve(&bo->tbo);
-	return r;
-}
-
 /**
  * radeon_bo_fence - add fence to buffer object
  *
diff --git a/drivers/gpu/drm/radeon/radeon_object.h b/drivers/gpu/drm/radeon/radeon_object.h
index e097a915277d..27cfb64057fe 100644
--- a/drivers/gpu/drm/radeon/radeon_object.h
+++ b/drivers/gpu/drm/radeon/radeon_object.h
@@ -133,9 +133,6 @@ static inline u64 radeon_bo_mmap_offset(struct radeon_bo *bo)
 	return drm_vma_node_offset_addr(&bo->tbo.base.vma_node);
 }
 
-extern int radeon_bo_wait(struct radeon_bo *bo, u32 *mem_type,
-			  bool no_wait);
-
 extern int radeon_bo_create(struct radeon_device *rdev,
 			    unsigned long size, int byte_align,
 			    bool kernel, u32 domain, u32 flags,
-- 
2.27.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
