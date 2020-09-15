Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E3DE269BF9
	for <lists+dri-devel@lfdr.de>; Tue, 15 Sep 2020 04:40:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CBC456E830;
	Tue, 15 Sep 2020 02:40:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1432F6E831
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Sep 2020 02:40:25 +0000 (UTC)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-87-o68IjlHrNOqCGTOKa-xlqg-1; Mon, 14 Sep 2020 22:40:21 -0400
X-MC-Unique: o68IjlHrNOqCGTOKa-xlqg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 09249425CD;
 Tue, 15 Sep 2020 02:40:20 +0000 (UTC)
Received: from tyrion-bne-redhat-com.redhat.com (vpn2-54-25.bne.redhat.com
 [10.64.54.25])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 12A327512A;
 Tue, 15 Sep 2020 02:40:18 +0000 (UTC)
From: Dave Airlie <airlied@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 6/7] drm/ttm: split bound/populated flags.
Date: Tue, 15 Sep 2020 12:40:06 +1000
Message-Id: <20200915024007.67163-7-airlied@gmail.com>
In-Reply-To: <20200915024007.67163-1-airlied@gmail.com>
References: <20200915024007.67163-1-airlied@gmail.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
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
Reply-To: , PATCH@freedesktop.org, drm@freedesktop.org
Cc: christian.koenig@amd.com, bskeggs@redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Dave Airlie <airlied@redhat.com>

Move bound up into the bo object, and keep populated with the tt
object.

The ghost object handling needs to follow the flags at the bo
level now instead of it being part of the ttm tt object.

Signed-off-by: Dave Airlie <airlied@redhat.com>
---
 drivers/gpu/drm/ttm/ttm_bo_util.c | 15 +++++++++++----
 include/drm/ttm/ttm_bo_api.h      |  1 +
 include/drm/ttm/ttm_bo_driver.h   |  6 +++---
 include/drm/ttm/ttm_tt.h          | 12 ++++--------
 4 files changed, 19 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/ttm/ttm_bo_util.c b/drivers/gpu/drm/ttm/ttm_bo_util.c
index 4c5c9a333c74..6b0320252a60 100644
--- a/drivers/gpu/drm/ttm/ttm_bo_util.c
+++ b/drivers/gpu/drm/ttm/ttm_bo_util.c
@@ -572,10 +572,13 @@ int ttm_bo_move_accel_cleanup(struct ttm_buffer_object *bo,
 		 * bo to be unbound and destroyed.
 		 */
 
-		if (man->use_tt)
+		if (man->use_tt) {
 			ghost_obj->ttm = NULL;
-		else
+			ttm_bo_tt_set_unbound(ghost_obj);
+		} else {
 			bo->ttm = NULL;
+			ttm_bo_tt_set_unbound(bo);
+		}
 
 		dma_resv_unlock(&ghost_obj->base._resv);
 		ttm_bo_put(ghost_obj);
@@ -628,10 +631,13 @@ int ttm_bo_pipeline_move(struct ttm_buffer_object *bo,
 		 * bo to be unbound and destroyed.
 		 */
 
-		if (to->use_tt)
+		if (to->use_tt) {
 			ghost_obj->ttm = NULL;
-		else
+			ttm_bo_tt_set_unbound(ghost_obj);
+		} else {
 			bo->ttm = NULL;
+			ttm_bo_tt_set_unbound(bo);
+		}
 
 		dma_resv_unlock(&ghost_obj->base._resv);
 		ttm_bo_put(ghost_obj);
@@ -695,6 +701,7 @@ int ttm_bo_pipeline_gutting(struct ttm_buffer_object *bo)
 	memset(&bo->mem, 0, sizeof(bo->mem));
 	bo->mem.mem_type = TTM_PL_SYSTEM;
 	bo->ttm = NULL;
+	ttm_bo_tt_set_unbound(bo);
 
 	dma_resv_unlock(&ghost->base._resv);
 	ttm_bo_put(ghost);
diff --git a/include/drm/ttm/ttm_bo_api.h b/include/drm/ttm/ttm_bo_api.h
index 36ff64e2736c..1d20a7f15a7a 100644
--- a/include/drm/ttm/ttm_bo_api.h
+++ b/include/drm/ttm/ttm_bo_api.h
@@ -141,6 +141,7 @@ struct ttm_buffer_object {
 	struct ttm_resource mem;
 	struct file *persistent_swap_storage;
 	struct ttm_tt *ttm;
+	bool ttm_bound;
 	bool evicted;
 	bool deleted;
 
diff --git a/include/drm/ttm/ttm_bo_driver.h b/include/drm/ttm/ttm_bo_driver.h
index 0112619f6172..0677e2582ff8 100644
--- a/include/drm/ttm/ttm_bo_driver.h
+++ b/include/drm/ttm/ttm_bo_driver.h
@@ -700,17 +700,17 @@ void ttm_bo_tt_unbind(struct ttm_buffer_object *bo);
 
 static inline bool ttm_bo_tt_is_bound(struct ttm_buffer_object *bo)
 {
-	return bo->ttm->_state == tt_bound;
+	return bo->ttm_bound;
 }
 
 static inline void ttm_bo_tt_set_unbound(struct ttm_buffer_object *bo)
 {
-	bo->ttm->_state = tt_unbound;
+	bo->ttm_bound = false;
 }
 
 static inline void ttm_bo_tt_set_bound(struct ttm_buffer_object *bo)
 {
-	bo->ttm->_state = tt_bound;
+	bo->ttm_bound = true;
 }
 /**
  * ttm_bo_tt_destroy.
diff --git a/include/drm/ttm/ttm_tt.h b/include/drm/ttm/ttm_tt.h
index 1ac56730d952..94e16238c93d 100644
--- a/include/drm/ttm/ttm_tt.h
+++ b/include/drm/ttm/ttm_tt.h
@@ -70,26 +70,22 @@ struct ttm_tt {
 	struct sg_table *sg; /* for SG objects via dma-buf */
 	struct file *swap_storage;
 	enum ttm_caching_state caching_state;
-	enum {
-		tt_bound,
-		tt_unbound,
-		tt_unpopulated,
-	} _state;
+	bool populated;
 };
 
 static inline bool ttm_tt_is_populated(struct ttm_tt *tt)
 {
-	return tt->_state != tt_unpopulated;
+	return tt->populated;
 }
 
 static inline void ttm_tt_set_unpopulated(struct ttm_tt *tt)
 {
-	tt->_state = tt_unpopulated;
+	tt->populated = false;
 }
 
 static inline void ttm_tt_set_populated(struct ttm_tt *tt)
 {
-	tt->_state = tt_unbound;
+	tt->populated = true;
 }
 
 /**
-- 
2.27.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
