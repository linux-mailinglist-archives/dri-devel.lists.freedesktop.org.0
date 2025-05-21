Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A0BA6ABFD8D
	for <lists+dri-devel@lfdr.de>; Wed, 21 May 2025 21:48:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF82510E770;
	Wed, 21 May 2025 19:48:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-44.mimecast.com
 (us-smtp-delivery-44.mimecast.com [205.139.111.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D453910E770
 for <dri-devel@lists.freedesktop.org>; Wed, 21 May 2025 19:48:44 +0000 (UTC)
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-594-GecRpJk7OFya0Mi3OOAcyg-1; Wed,
 21 May 2025 15:48:36 -0400
X-MC-Unique: GecRpJk7OFya0Mi3OOAcyg-1
X-Mimecast-MFC-AGG-ID: GecRpJk7OFya0Mi3OOAcyg_1747856916
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id E605C1800447; Wed, 21 May 2025 19:48:35 +0000 (UTC)
Received: from dreadlord.redhat.com (unknown [10.64.136.70])
 by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 752DD19560A7; Wed, 21 May 2025 19:48:33 +0000 (UTC)
From: Dave Airlie <airlied@gmail.com>
To: intel-xe@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/xe: don't store the xe device pointer inside xe_ttm_tt
Date: Thu, 22 May 2025 05:48:31 +1000
Message-ID: <20250521194831.314835-1-airlied@gmail.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: XnGdrFENwskpzE3HH3znza_mkHjs9bE6iBb10-cXqx0_1747856916
X-Mimecast-Originator: gmail.com
Content-Transfer-Encoding: quoted-printable
content-type: text/plain; charset=WINDOWS-1252; x-default=true
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

From: Dave Airlie <airlied@redhat.com>

This device pointer is nearly always available without storing
an extra copy for each tt in the system.

Just noticed this while reading over the xe shrinker code.

Signed-off-by: Dave Airlie <airlied@redhat.com>
---
 drivers/gpu/drm/xe/tests/xe_bo.c |  4 +--
 drivers/gpu/drm/xe/xe_bo.c       | 59 ++++++++++++++++----------------
 2 files changed, 32 insertions(+), 31 deletions(-)

diff --git a/drivers/gpu/drm/xe/tests/xe_bo.c b/drivers/gpu/drm/xe/tests/xe=
_bo.c
index 378dcd0fb414..77ca1ab527ec 100644
--- a/drivers/gpu/drm/xe/tests/xe_bo.c
+++ b/drivers/gpu/drm/xe/tests/xe_bo.c
@@ -514,9 +514,9 @@ static int shrink_test_run_device(struct xe_device *xe)
 =09=09 * other way around, they may not be subject to swapping...
 =09=09 */
 =09=09if (alloced < purgeable) {
-=09=09=09xe_ttm_tt_account_subtract(&xe_tt->ttm);
+=09=09=09xe_ttm_tt_account_subtract(xe, &xe_tt->ttm);
 =09=09=09xe_tt->purgeable =3D true;
-=09=09=09xe_ttm_tt_account_add(&xe_tt->ttm);
+=09=09=09xe_ttm_tt_account_add(xe, &xe_tt->ttm);
 =09=09=09bo->ttm.priority =3D 0;
 =09=09=09spin_lock(&bo->ttm.bdev->lru_lock);
 =09=09=09ttm_bo_move_to_lru_tail(&bo->ttm);
diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
index d99d91fe8aa9..4074e6f64fd0 100644
--- a/drivers/gpu/drm/xe/xe_bo.c
+++ b/drivers/gpu/drm/xe/xe_bo.c
@@ -336,15 +336,13 @@ static void xe_evict_flags(struct ttm_buffer_object *=
tbo,
 /* struct xe_ttm_tt - Subclassed ttm_tt for xe */
 struct xe_ttm_tt {
 =09struct ttm_tt ttm;
-=09/** @xe - The xe device */
-=09struct xe_device *xe;
 =09struct sg_table sgt;
 =09struct sg_table *sg;
 =09/** @purgeable: Whether the content of the pages of @ttm is purgeable. =
*/
 =09bool purgeable;
 };
=20
-static int xe_tt_map_sg(struct ttm_tt *tt)
+static int xe_tt_map_sg(struct xe_device *xe, struct ttm_tt *tt)
 {
 =09struct xe_ttm_tt *xe_tt =3D container_of(tt, struct xe_ttm_tt, ttm);
 =09unsigned long num_pages =3D tt->num_pages;
@@ -359,13 +357,13 @@ static int xe_tt_map_sg(struct ttm_tt *tt)
 =09ret =3D sg_alloc_table_from_pages_segment(&xe_tt->sgt, tt->pages,
 =09=09=09=09=09=09num_pages, 0,
 =09=09=09=09=09=09(u64)num_pages << PAGE_SHIFT,
-=09=09=09=09=09=09xe_sg_segment_size(xe_tt->xe->drm.dev),
+=09=09=09=09=09=09xe_sg_segment_size(xe->drm.dev),
 =09=09=09=09=09=09GFP_KERNEL);
 =09if (ret)
 =09=09return ret;
=20
 =09xe_tt->sg =3D &xe_tt->sgt;
-=09ret =3D dma_map_sgtable(xe_tt->xe->drm.dev, xe_tt->sg, DMA_BIDIRECTIONA=
L,
+=09ret =3D dma_map_sgtable(xe->drm.dev, xe_tt->sg, DMA_BIDIRECTIONAL,
 =09=09=09      DMA_ATTR_SKIP_CPU_SYNC);
 =09if (ret) {
 =09=09sg_free_table(xe_tt->sg);
@@ -376,12 +374,12 @@ static int xe_tt_map_sg(struct ttm_tt *tt)
 =09return 0;
 }
=20
-static void xe_tt_unmap_sg(struct ttm_tt *tt)
+static void xe_tt_unmap_sg(struct xe_device *xe, struct ttm_tt *tt)
 {
 =09struct xe_ttm_tt *xe_tt =3D container_of(tt, struct xe_ttm_tt, ttm);
=20
 =09if (xe_tt->sg) {
-=09=09dma_unmap_sgtable(xe_tt->xe->drm.dev, xe_tt->sg,
+=09=09dma_unmap_sgtable(xe->drm.dev, xe_tt->sg,
 =09=09=09=09  DMA_BIDIRECTIONAL, 0);
 =09=09sg_free_table(xe_tt->sg);
 =09=09xe_tt->sg =3D NULL;
@@ -400,24 +398,24 @@ struct sg_table *xe_bo_sg(struct xe_bo *bo)
  * Account ttm pages against the device shrinker's shrinkable and
  * purgeable counts.
  */
-static void xe_ttm_tt_account_add(struct ttm_tt *tt)
+static void xe_ttm_tt_account_add(struct xe_device *xe, struct ttm_tt *tt)
 {
 =09struct xe_ttm_tt *xe_tt =3D container_of(tt, struct xe_ttm_tt, ttm);
=20
 =09if (xe_tt->purgeable)
-=09=09xe_shrinker_mod_pages(xe_tt->xe->mem.shrinker, 0, tt->num_pages);
+=09=09xe_shrinker_mod_pages(xe->mem.shrinker, 0, tt->num_pages);
 =09else
-=09=09xe_shrinker_mod_pages(xe_tt->xe->mem.shrinker, tt->num_pages, 0);
+=09=09xe_shrinker_mod_pages(xe->mem.shrinker, tt->num_pages, 0);
 }
=20
-static void xe_ttm_tt_account_subtract(struct ttm_tt *tt)
+static void xe_ttm_tt_account_subtract(struct xe_device *xe, struct ttm_tt=
 *tt)
 {
 =09struct xe_ttm_tt *xe_tt =3D container_of(tt, struct xe_ttm_tt, ttm);
=20
 =09if (xe_tt->purgeable)
-=09=09xe_shrinker_mod_pages(xe_tt->xe->mem.shrinker, 0, -(long)tt->num_pag=
es);
+=09=09xe_shrinker_mod_pages(xe->mem.shrinker, 0, -(long)tt->num_pages);
 =09else
-=09=09xe_shrinker_mod_pages(xe_tt->xe->mem.shrinker, -(long)tt->num_pages,=
 0);
+=09=09xe_shrinker_mod_pages(xe->mem.shrinker, -(long)tt->num_pages, 0);
 }
=20
 static struct ttm_tt *xe_ttm_tt_create(struct ttm_buffer_object *ttm_bo,
@@ -436,7 +434,6 @@ static struct ttm_tt *xe_ttm_tt_create(struct ttm_buffe=
r_object *ttm_bo,
 =09=09return NULL;
=20
 =09tt =3D &xe_tt->ttm;
-=09xe_tt->xe =3D xe;
=20
 =09extra_pages =3D 0;
 =09if (xe_bo_needs_ccs_pages(bo))
@@ -527,21 +524,23 @@ static int xe_ttm_tt_populate(struct ttm_device *ttm_=
dev, struct ttm_tt *tt,
 =09=09return err;
=20
 =09xe_tt->purgeable =3D false;
-=09xe_ttm_tt_account_add(tt);
+=09xe_ttm_tt_account_add(ttm_to_xe_device(ttm_dev), tt);
=20
 =09return 0;
 }
=20
 static void xe_ttm_tt_unpopulate(struct ttm_device *ttm_dev, struct ttm_tt=
 *tt)
 {
+=09struct xe_device *xe =3D ttm_to_xe_device(ttm_dev);
+
 =09if ((tt->page_flags & TTM_TT_FLAG_EXTERNAL) &&
 =09    !(tt->page_flags & TTM_TT_FLAG_EXTERNAL_MAPPABLE))
 =09=09return;
=20
-=09xe_tt_unmap_sg(tt);
+=09xe_tt_unmap_sg(xe, tt);
=20
 =09ttm_pool_free(&ttm_dev->pool, tt);
-=09xe_ttm_tt_account_subtract(tt);
+=09xe_ttm_tt_account_subtract(xe, tt);
 }
=20
 static void xe_ttm_tt_destroy(struct ttm_device *ttm_dev, struct ttm_tt *t=
t)
@@ -789,7 +788,7 @@ static int xe_bo_move(struct ttm_buffer_object *ttm_bo,=
 bool evict,
 =09/* Bo creation path, moving to system or TT. */
 =09if ((!old_mem && ttm) && !handle_system_ccs) {
 =09=09if (new_mem->mem_type =3D=3D XE_PL_TT)
-=09=09=09ret =3D xe_tt_map_sg(ttm);
+=09=09=09ret =3D xe_tt_map_sg(xe, ttm);
 =09=09if (!ret)
 =09=09=09ttm_bo_move_null(ttm_bo, new_mem);
 =09=09goto out;
@@ -812,7 +811,7 @@ static int xe_bo_move(struct ttm_buffer_object *ttm_bo,=
 bool evict,
 =09=09(!ttm && ttm_bo->type =3D=3D ttm_bo_type_device);
=20
 =09if (new_mem->mem_type =3D=3D XE_PL_TT) {
-=09=09ret =3D xe_tt_map_sg(ttm);
+=09=09ret =3D xe_tt_map_sg(xe, ttm);
 =09=09if (ret)
 =09=09=09goto out;
 =09}
@@ -973,7 +972,7 @@ static int xe_bo_move(struct ttm_buffer_object *ttm_bo,=
 bool evict,
 =09=09if (timeout < 0)
 =09=09=09ret =3D timeout;
=20
-=09=09xe_tt_unmap_sg(ttm_bo->ttm);
+=09=09xe_tt_unmap_sg(xe, ttm_bo->ttm);
 =09}
=20
 =09return ret;
@@ -983,6 +982,7 @@ static long xe_bo_shrink_purge(struct ttm_operation_ctx=
 *ctx,
 =09=09=09       struct ttm_buffer_object *bo,
 =09=09=09       unsigned long *scanned)
 {
+=09struct xe_device *xe =3D ttm_to_xe_device(bo->bdev);
 =09long lret;
=20
 =09/* Fake move to system, without copying data. */
@@ -997,7 +997,7 @@ static long xe_bo_shrink_purge(struct ttm_operation_ctx=
 *ctx,
 =09=09if (lret)
 =09=09=09return lret;
=20
-=09=09xe_tt_unmap_sg(bo->ttm);
+=09=09xe_tt_unmap_sg(xe, bo->ttm);
 =09=09ttm_bo_move_null(bo, new_resource);
 =09}
=20
@@ -1008,7 +1008,7 @@ static long xe_bo_shrink_purge(struct ttm_operation_c=
tx *ctx,
 =09=09=09      .allow_move =3D false});
=20
 =09if (lret > 0)
-=09=09xe_ttm_tt_account_subtract(bo->ttm);
+=09=09xe_ttm_tt_account_subtract(xe, bo->ttm);
=20
 =09return lret;
 }
@@ -1039,7 +1039,7 @@ long xe_bo_shrink(struct ttm_operation_ctx *ctx, stru=
ct ttm_buffer_object *bo,
 =09struct xe_ttm_tt *xe_tt =3D container_of(tt, struct xe_ttm_tt, ttm);
 =09struct ttm_place place =3D {.mem_type =3D bo->resource->mem_type};
 =09struct xe_bo *xe_bo =3D ttm_to_xe_bo(bo);
-=09struct xe_device *xe =3D xe_tt->xe;
+=09struct xe_device *xe =3D ttm_to_xe_device(bo->bdev);
 =09bool needs_rpm;
 =09long lret =3D 0L;
=20
@@ -1076,7 +1076,7 @@ long xe_bo_shrink(struct ttm_operation_ctx *ctx, stru=
ct ttm_buffer_object *bo,
 =09=09xe_pm_runtime_put(xe);
=20
 =09if (lret > 0)
-=09=09xe_ttm_tt_account_subtract(tt);
+=09=09xe_ttm_tt_account_subtract(xe, tt);
=20
 out_unref:
 =09xe_bo_put(xe_bo);
@@ -1377,7 +1377,8 @@ int xe_bo_dma_unmap_pinned(struct xe_bo *bo)
 =09=09=09ttm_bo->sg =3D NULL;
 =09=09=09xe_tt->sg =3D NULL;
 =09=09} else if (xe_tt->sg) {
-=09=09=09dma_unmap_sgtable(xe_tt->xe->drm.dev, xe_tt->sg,
+=09=09=09dma_unmap_sgtable(ttm_to_xe_device(ttm_bo->bdev)->drm.dev,
+=09=09=09=09=09  xe_tt->sg,
 =09=09=09=09=09  DMA_BIDIRECTIONAL, 0);
 =09=09=09sg_free_table(xe_tt->sg);
 =09=09=09xe_tt->sg =3D NULL;
@@ -2289,7 +2290,7 @@ int xe_bo_pin_external(struct xe_bo *bo)
=20
 =09ttm_bo_pin(&bo->ttm);
 =09if (bo->ttm.ttm && ttm_tt_is_populated(bo->ttm.ttm))
-=09=09xe_ttm_tt_account_subtract(bo->ttm.ttm);
+=09=09xe_ttm_tt_account_subtract(xe, bo->ttm.ttm);
=20
 =09/*
 =09 * FIXME: If we always use the reserve / unreserve functions for lockin=
g
@@ -2337,7 +2338,7 @@ int xe_bo_pin(struct xe_bo *bo)
=20
 =09ttm_bo_pin(&bo->ttm);
 =09if (bo->ttm.ttm && ttm_tt_is_populated(bo->ttm.ttm))
-=09=09xe_ttm_tt_account_subtract(bo->ttm.ttm);
+=09=09xe_ttm_tt_account_subtract(xe, bo->ttm.ttm);
=20
 =09/*
 =09 * FIXME: If we always use the reserve / unreserve functions for lockin=
g
@@ -2373,7 +2374,7 @@ void xe_bo_unpin_external(struct xe_bo *bo)
=20
 =09ttm_bo_unpin(&bo->ttm);
 =09if (bo->ttm.ttm && ttm_tt_is_populated(bo->ttm.ttm))
-=09=09xe_ttm_tt_account_add(bo->ttm.ttm);
+=09=09xe_ttm_tt_account_add(xe, bo->ttm.ttm);
=20
 =09/*
 =09 * FIXME: If we always use the reserve / unreserve functions for lockin=
g
@@ -2405,7 +2406,7 @@ void xe_bo_unpin(struct xe_bo *bo)
 =09}
 =09ttm_bo_unpin(&bo->ttm);
 =09if (bo->ttm.ttm && ttm_tt_is_populated(bo->ttm.ttm))
-=09=09xe_ttm_tt_account_add(bo->ttm.ttm);
+=09=09xe_ttm_tt_account_add(xe, bo->ttm.ttm);
 }
=20
 /**
--=20
2.49.0

