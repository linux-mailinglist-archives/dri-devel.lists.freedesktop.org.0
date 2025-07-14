Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 439F1B035A2
	for <lists+dri-devel@lfdr.de>; Mon, 14 Jul 2025 07:24:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A3B2610E351;
	Mon, 14 Jul 2025 05:24:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-44.mimecast.com
 (us-smtp-delivery-44.mimecast.com [207.211.30.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B9F010E351
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Jul 2025 05:24:02 +0000 (UTC)
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-571-BVeSPEimNsiBzjR-97rDlw-1; Mon,
 14 Jul 2025 01:23:58 -0400
X-MC-Unique: BVeSPEimNsiBzjR-97rDlw-1
X-Mimecast-MFC-AGG-ID: BVeSPEimNsiBzjR-97rDlw_1752470637
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id C38B81956088; Mon, 14 Jul 2025 05:23:56 +0000 (UTC)
Received: from dreadlord.redhat.com (unknown [10.67.32.31])
 by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 0918D1977000; Mon, 14 Jul 2025 05:23:51 +0000 (UTC)
From: Dave Airlie <airlied@gmail.com>
To: dri-devel@lists.freedesktop.org, linux-mm@kvack.org,
 Johannes Weiner <hannes@cmpxchg.org>,
 Christian Koenig <christian.koenig@amd.com>
Cc: Dave Chinner <david@fromorbit.com>, Kairui Song <kasong@tencent.com>,
 Dave Airlie <airlied@redhat.com>
Subject: [PATCH 10/18] ttm: add a memcg accounting flag to the alloc/populate
 APIs
Date: Mon, 14 Jul 2025 15:18:25 +1000
Message-ID: <20250714052243.1149732-11-airlied@gmail.com>
In-Reply-To: <20250714052243.1149732-1-airlied@gmail.com>
References: <20250714052243.1149732-1-airlied@gmail.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: LsDmKRDzuKTPwEyDoRubR2g2_RtFjgze5oV41zwmLsg_1752470637
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

This flag does nothing yet, but this just changes the APIs to accept
it in the future across all users.

This flag will eventually be filled out with when to account a tt
populate to a memcg.

Signed-off-by: Dave Airlie <airlied@redhat.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c          |  3 ++-
 drivers/gpu/drm/i915/gem/i915_gem_ttm.c          |  5 +++--
 drivers/gpu/drm/i915/gem/i915_gem_ttm_move.c     |  2 +-
 drivers/gpu/drm/i915/gem/i915_gem_ttm_pm.c       |  4 ++--
 drivers/gpu/drm/loongson/lsdc_ttm.c              |  3 ++-
 drivers/gpu/drm/nouveau/nouveau_bo.c             |  6 ++++--
 drivers/gpu/drm/radeon/radeon_ttm.c              |  3 ++-
 drivers/gpu/drm/ttm/tests/ttm_bo_validate_test.c |  2 +-
 drivers/gpu/drm/ttm/tests/ttm_pool_test.c        | 16 ++++++++--------
 drivers/gpu/drm/ttm/tests/ttm_tt_test.c          | 12 ++++++------
 drivers/gpu/drm/ttm/ttm_bo.c                     |  5 +++--
 drivers/gpu/drm/ttm/ttm_bo_util.c                |  6 +++---
 drivers/gpu/drm/ttm/ttm_bo_vm.c                  |  4 +++-
 drivers/gpu/drm/ttm/ttm_pool.c                   |  6 ++++--
 drivers/gpu/drm/ttm/ttm_tt.c                     |  8 +++++---
 drivers/gpu/drm/vmwgfx/vmwgfx_blit.c             |  4 ++--
 drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c       |  7 ++++---
 drivers/gpu/drm/xe/xe_bo.c                       |  3 ++-
 include/drm/ttm/ttm_bo.h                         |  1 +
 include/drm/ttm/ttm_device.h                     |  1 +
 include/drm/ttm/ttm_pool.h                       |  1 +
 include/drm/ttm/ttm_tt.h                         |  1 +
 22 files changed, 61 insertions(+), 42 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c b/drivers/gpu/drm/amd/=
amdgpu/amdgpu_ttm.c
index 9c5df35f05b7..920b412156dd 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
@@ -1138,6 +1138,7 @@ static struct ttm_tt *amdgpu_ttm_tt_create(struct ttm=
_buffer_object *bo,
  */
 static int amdgpu_ttm_tt_populate(struct ttm_device *bdev,
 =09=09=09=09  struct ttm_tt *ttm,
+=09=09=09=09  bool memcg_account,
 =09=09=09=09  struct ttm_operation_ctx *ctx)
 {
 =09struct amdgpu_device *adev =3D amdgpu_ttm_adev(bdev);
@@ -1161,7 +1162,7 @@ static int amdgpu_ttm_tt_populate(struct ttm_device *=
bdev,
 =09=09pool =3D &adev->mman.ttm_pools[gtt->pool_id];
 =09else
 =09=09pool =3D &adev->mman.bdev.pool;
-=09ret =3D ttm_pool_alloc(pool, ttm, ctx);
+=09ret =3D ttm_pool_alloc(pool, ttm, memcg_account, ctx);
 =09if (ret)
 =09=09return ret;
=20
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_ttm.c b/drivers/gpu/drm/i915=
/gem/i915_gem_ttm.c
index 1f4814968868..6cdaf3696583 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
@@ -314,6 +314,7 @@ static struct ttm_tt *i915_ttm_tt_create(struct ttm_buf=
fer_object *bo,
=20
 static int i915_ttm_tt_populate(struct ttm_device *bdev,
 =09=09=09=09struct ttm_tt *ttm,
+=09=09=09=09bool memcg_account,
 =09=09=09=09struct ttm_operation_ctx *ctx)
 {
 =09struct i915_ttm_tt *i915_tt =3D container_of(ttm, typeof(*i915_tt), ttm=
);
@@ -321,7 +322,7 @@ static int i915_ttm_tt_populate(struct ttm_device *bdev=
,
 =09if (i915_tt->is_shmem)
 =09=09return i915_ttm_tt_shmem_populate(bdev, ttm, ctx);
=20
-=09return ttm_pool_alloc(&bdev->pool, ttm, ctx);
+=09return ttm_pool_alloc(&bdev->pool, ttm, memcg_account, ctx);
 }
=20
 static void i915_ttm_tt_unpopulate(struct ttm_device *bdev, struct ttm_tt =
*ttm)
@@ -808,7 +809,7 @@ static int __i915_ttm_get_pages(struct drm_i915_gem_obj=
ect *obj,
 =09}
=20
 =09if (bo->ttm && !ttm_tt_is_populated(bo->ttm)) {
-=09=09ret =3D ttm_bo_populate(bo, &ctx);
+=09=09ret =3D ttm_bo_populate(bo, false, &ctx);
 =09=09if (ret)
 =09=09=09return ret;
=20
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_ttm_move.c b/drivers/gpu/drm=
/i915/gem/i915_gem_ttm_move.c
index 2f6b33edb9c9..4ab1eb3e42bc 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_ttm_move.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_ttm_move.c
@@ -624,7 +624,7 @@ int i915_ttm_move(struct ttm_buffer_object *bo, bool ev=
ict,
=20
 =09/* Populate ttm with pages if needed. Typically system memory. */
 =09if (ttm && (dst_man->use_tt || (ttm->page_flags & TTM_TT_FLAG_SWAPPED))=
) {
-=09=09ret =3D ttm_bo_populate(bo, ctx);
+=09=09ret =3D ttm_bo_populate(bo, false, ctx);
 =09=09if (ret)
 =09=09=09return ret;
 =09}
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_ttm_pm.c b/drivers/gpu/drm/i=
915/gem/i915_gem_ttm_pm.c
index 61596cecce4d..0b555979d786 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_ttm_pm.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_ttm_pm.c
@@ -90,7 +90,7 @@ static int i915_ttm_backup(struct i915_gem_apply_to_regio=
n *apply,
 =09=09goto out_no_lock;
=20
 =09backup_bo =3D i915_gem_to_ttm(backup);
-=09err =3D ttm_bo_populate(backup_bo, &ctx);
+=09err =3D ttm_bo_populate(backup_bo, false, &ctx);
 =09if (err)
 =09=09goto out_no_populate;
=20
@@ -189,7 +189,7 @@ static int i915_ttm_restore(struct i915_gem_apply_to_re=
gion *apply,
 =09if (!backup_bo->resource)
 =09=09err =3D ttm_bo_validate(backup_bo, i915_ttm_sys_placement(), &ctx);
 =09if (!err)
-=09=09err =3D ttm_bo_populate(backup_bo, &ctx);
+=09=09err =3D ttm_bo_populate(backup_bo, false, &ctx);
 =09if (!err) {
 =09=09err =3D i915_gem_obj_copy_ttm(obj, backup, pm_apply->allow_gpu,
 =09=09=09=09=09    false);
diff --git a/drivers/gpu/drm/loongson/lsdc_ttm.c b/drivers/gpu/drm/loongson=
/lsdc_ttm.c
index 2e42c6970c9f..6d8781506802 100644
--- a/drivers/gpu/drm/loongson/lsdc_ttm.c
+++ b/drivers/gpu/drm/loongson/lsdc_ttm.c
@@ -110,6 +110,7 @@ lsdc_ttm_tt_create(struct ttm_buffer_object *tbo, uint3=
2_t page_flags)
=20
 static int lsdc_ttm_tt_populate(struct ttm_device *bdev,
 =09=09=09=09struct ttm_tt *ttm,
+=09=09=09=09bool memcg_account,
 =09=09=09=09struct ttm_operation_ctx *ctx)
 {
 =09bool slave =3D !!(ttm->page_flags & TTM_TT_FLAG_EXTERNAL);
@@ -122,7 +123,7 @@ static int lsdc_ttm_tt_populate(struct ttm_device *bdev=
,
 =09=09return 0;
 =09}
=20
-=09return ttm_pool_alloc(&bdev->pool, ttm, ctx);
+=09return ttm_pool_alloc(&bdev->pool, ttm, memcg_account, ctx);
 }
=20
 static void lsdc_ttm_tt_unpopulate(struct ttm_device *bdev,
diff --git a/drivers/gpu/drm/nouveau/nouveau_bo.c b/drivers/gpu/drm/nouveau=
/nouveau_bo.c
index b96f0555ca14..1f2b9f5f2bf8 100644
--- a/drivers/gpu/drm/nouveau/nouveau_bo.c
+++ b/drivers/gpu/drm/nouveau/nouveau_bo.c
@@ -1417,7 +1417,9 @@ vm_fault_t nouveau_ttm_fault_reserve_notify(struct tt=
m_buffer_object *bo)
=20
 static int
 nouveau_ttm_tt_populate(struct ttm_device *bdev,
-=09=09=09struct ttm_tt *ttm, struct ttm_operation_ctx *ctx)
+=09=09=09struct ttm_tt *ttm,
+=09=09=09bool memcg_account,
+=09=09=09struct ttm_operation_ctx *ctx)
 {
 =09struct ttm_tt *ttm_dma =3D (void *)ttm;
 =09struct nouveau_drm *drm;
@@ -1434,7 +1436,7 @@ nouveau_ttm_tt_populate(struct ttm_device *bdev,
=20
 =09drm =3D nouveau_bdev(bdev);
=20
-=09return ttm_pool_alloc(&drm->ttm.bdev.pool, ttm, ctx);
+=09return ttm_pool_alloc(&drm->ttm.bdev.pool, ttm, memcg_account, ctx);
 }
=20
 static void
diff --git a/drivers/gpu/drm/radeon/radeon_ttm.c b/drivers/gpu/drm/radeon/r=
adeon_ttm.c
index 616d25c8c2de..8c4273239d16 100644
--- a/drivers/gpu/drm/radeon/radeon_ttm.c
+++ b/drivers/gpu/drm/radeon/radeon_ttm.c
@@ -526,6 +526,7 @@ static struct radeon_ttm_tt *radeon_ttm_tt_to_gtt(struc=
t radeon_device *rdev,
=20
 static int radeon_ttm_tt_populate(struct ttm_device *bdev,
 =09=09=09=09  struct ttm_tt *ttm,
+=09=09=09=09  bool memcg_account,
 =09=09=09=09  struct ttm_operation_ctx *ctx)
 {
 =09struct radeon_device *rdev =3D radeon_get_rdev(bdev);
@@ -547,7 +548,7 @@ static int radeon_ttm_tt_populate(struct ttm_device *bd=
ev,
 =09=09return 0;
 =09}
=20
-=09return ttm_pool_alloc(&rdev->mman.bdev.pool, ttm, ctx);
+=09return ttm_pool_alloc(&rdev->mman.bdev.pool, ttm, memcg_account, ctx);
 }
=20
 static void radeon_ttm_tt_unpopulate(struct ttm_device *bdev, struct ttm_t=
t *ttm)
diff --git a/drivers/gpu/drm/ttm/tests/ttm_bo_validate_test.c b/drivers/gpu=
/drm/ttm/tests/ttm_bo_validate_test.c
index 3148f5d3dbd6..b52e3c1089e6 100644
--- a/drivers/gpu/drm/ttm/tests/ttm_bo_validate_test.c
+++ b/drivers/gpu/drm/ttm/tests/ttm_bo_validate_test.c
@@ -538,7 +538,7 @@ static void ttm_bo_validate_no_placement_signaled(struc=
t kunit *test)
=20
 =09if (params->with_ttm) {
 =09=09old_tt =3D priv->ttm_dev->funcs->ttm_tt_create(bo, 0);
-=09=09ttm_pool_alloc(&priv->ttm_dev->pool, old_tt, &ctx);
+=09=09ttm_pool_alloc(&priv->ttm_dev->pool, old_tt, false, &ctx);
 =09=09bo->ttm =3D old_tt;
 =09}
=20
diff --git a/drivers/gpu/drm/ttm/tests/ttm_pool_test.c b/drivers/gpu/drm/tt=
m/tests/ttm_pool_test.c
index 39234a3e98c4..aaf152c2383d 100644
--- a/drivers/gpu/drm/ttm/tests/ttm_pool_test.c
+++ b/drivers/gpu/drm/ttm/tests/ttm_pool_test.c
@@ -88,7 +88,7 @@ static struct ttm_pool *ttm_pool_pre_populated(struct kun=
it *test,
=20
 =09ttm_pool_init(pool, devs->dev, NUMA_NO_NODE, true, false);
=20
-=09err =3D ttm_pool_alloc(pool, tt, &simple_ctx);
+=09err =3D ttm_pool_alloc(pool, tt, false, &simple_ctx);
 =09KUNIT_ASSERT_EQ(test, err, 0);
=20
 =09ttm_pool_free(pool, tt);
@@ -157,7 +157,7 @@ static void ttm_pool_alloc_basic(struct kunit *test)
 =09KUNIT_ASSERT_EQ(test, pool->nid, NUMA_NO_NODE);
 =09KUNIT_ASSERT_EQ(test, pool->use_dma_alloc, params->use_dma_alloc);
=20
-=09err =3D ttm_pool_alloc(pool, tt, &simple_ctx);
+=09err =3D ttm_pool_alloc(pool, tt, false, &simple_ctx);
 =09KUNIT_ASSERT_EQ(test, err, 0);
 =09KUNIT_ASSERT_EQ(test, tt->num_pages, expected_num_pages);
=20
@@ -220,7 +220,7 @@ static void ttm_pool_alloc_basic_dma_addr(struct kunit =
*test)
=20
 =09ttm_pool_init(pool, devs->dev, NUMA_NO_NODE, true, false);
=20
-=09err =3D ttm_pool_alloc(pool, tt, &simple_ctx);
+=09err =3D ttm_pool_alloc(pool, tt, false, &simple_ctx);
 =09KUNIT_ASSERT_EQ(test, err, 0);
 =09KUNIT_ASSERT_EQ(test, tt->num_pages, expected_num_pages);
=20
@@ -253,7 +253,7 @@ static void ttm_pool_alloc_order_caching_match(struct k=
unit *test)
 =09tt =3D ttm_tt_kunit_init(test, 0, caching, size);
 =09KUNIT_ASSERT_NOT_NULL(test, tt);
=20
-=09err =3D ttm_pool_alloc(pool, tt, &simple_ctx);
+=09err =3D ttm_pool_alloc(pool, tt, false, &simple_ctx);
 =09KUNIT_ASSERT_EQ(test, err, 0);
=20
 =09KUNIT_ASSERT_TRUE(test, !list_lru_count(&pt->pages));
@@ -285,7 +285,7 @@ static void ttm_pool_alloc_caching_mismatch(struct kuni=
t *test)
 =09KUNIT_ASSERT_FALSE(test, !list_lru_count(&pt_pool->pages));
 =09KUNIT_ASSERT_TRUE(test, !list_lru_count(&pt_tt->pages));
=20
-=09err =3D ttm_pool_alloc(pool, tt, &simple_ctx);
+=09err =3D ttm_pool_alloc(pool, tt, false, &simple_ctx);
 =09KUNIT_ASSERT_EQ(test, err, 0);
=20
 =09ttm_pool_free(pool, tt);
@@ -319,7 +319,7 @@ static void ttm_pool_alloc_order_mismatch(struct kunit =
*test)
 =09KUNIT_ASSERT_FALSE(test, !list_lru_count(&pt_pool->pages));
 =09KUNIT_ASSERT_TRUE(test, !list_lru_count(&pt_tt->pages));
=20
-=09err =3D ttm_pool_alloc(pool, tt, &simple_ctx);
+=09err =3D ttm_pool_alloc(pool, tt, false, &simple_ctx);
 =09KUNIT_ASSERT_EQ(test, err, 0);
=20
 =09ttm_pool_free(pool, tt);
@@ -349,7 +349,7 @@ static void ttm_pool_free_dma_alloc(struct kunit *test)
 =09KUNIT_ASSERT_NOT_NULL(test, pool);
=20
 =09ttm_pool_init(pool, devs->dev, NUMA_NO_NODE, true, false);
-=09ttm_pool_alloc(pool, tt, &simple_ctx);
+=09ttm_pool_alloc(pool, tt, false, &simple_ctx);
=20
 =09pt =3D &pool->caching[caching].orders[order];
 =09KUNIT_ASSERT_TRUE(test, !list_lru_count(&pt->pages));
@@ -380,7 +380,7 @@ static void ttm_pool_free_no_dma_alloc(struct kunit *te=
st)
 =09KUNIT_ASSERT_NOT_NULL(test, pool);
=20
 =09ttm_pool_init(pool, devs->dev, NUMA_NO_NODE, false, false);
-=09ttm_pool_alloc(pool, tt, &simple_ctx);
+=09ttm_pool_alloc(pool, tt, false, &simple_ctx);
=20
 =09pt =3D &pool->caching[caching].orders[order];
 =09KUNIT_ASSERT_TRUE(test, list_lru_count(&pt->pages) =3D=3D 1);
diff --git a/drivers/gpu/drm/ttm/tests/ttm_tt_test.c b/drivers/gpu/drm/ttm/=
tests/ttm_tt_test.c
index 61ec6f580b62..333c503e218b 100644
--- a/drivers/gpu/drm/ttm/tests/ttm_tt_test.c
+++ b/drivers/gpu/drm/ttm/tests/ttm_tt_test.c
@@ -262,7 +262,7 @@ static void ttm_tt_populate_null_ttm(struct kunit *test=
)
 =09struct ttm_operation_ctx ctx =3D { };
 =09int err;
=20
-=09err =3D ttm_tt_populate(devs->ttm_dev, NULL, &ctx);
+=09err =3D ttm_tt_populate(devs->ttm_dev, NULL, false, &ctx);
 =09KUNIT_ASSERT_EQ(test, err, -EINVAL);
 }
=20
@@ -283,11 +283,11 @@ static void ttm_tt_populate_populated_ttm(struct kuni=
t *test)
 =09err =3D ttm_tt_init(tt, bo, 0, ttm_cached, 0);
 =09KUNIT_ASSERT_EQ(test, err, 0);
=20
-=09err =3D ttm_tt_populate(devs->ttm_dev, tt, &ctx);
+=09err =3D ttm_tt_populate(devs->ttm_dev, tt, false, &ctx);
 =09KUNIT_ASSERT_EQ(test, err, 0);
 =09populated_page =3D *tt->pages;
=20
-=09err =3D ttm_tt_populate(devs->ttm_dev, tt, &ctx);
+=09err =3D ttm_tt_populate(devs->ttm_dev, tt, false, &ctx);
 =09KUNIT_ASSERT_PTR_EQ(test, populated_page, *tt->pages);
 }
=20
@@ -307,7 +307,7 @@ static void ttm_tt_unpopulate_basic(struct kunit *test)
 =09err =3D ttm_tt_init(tt, bo, 0, ttm_cached, 0);
 =09KUNIT_ASSERT_EQ(test, err, 0);
=20
-=09err =3D ttm_tt_populate(devs->ttm_dev, tt, &ctx);
+=09err =3D ttm_tt_populate(devs->ttm_dev, tt, false, &ctx);
 =09KUNIT_ASSERT_EQ(test, err, 0);
 =09KUNIT_ASSERT_TRUE(test, ttm_tt_is_populated(tt));
=20
@@ -351,7 +351,7 @@ static void ttm_tt_swapin_basic(struct kunit *test)
 =09err =3D ttm_tt_init(tt, bo, 0, ttm_cached, 0);
 =09KUNIT_ASSERT_EQ(test, err, 0);
=20
-=09err =3D ttm_tt_populate(devs->ttm_dev, tt, &ctx);
+=09err =3D ttm_tt_populate(devs->ttm_dev, tt, false, &ctx);
 =09KUNIT_ASSERT_EQ(test, err, 0);
 =09KUNIT_ASSERT_TRUE(test, ttm_tt_is_populated(tt));
=20
@@ -361,7 +361,7 @@ static void ttm_tt_swapin_basic(struct kunit *test)
 =09KUNIT_ASSERT_TRUE(test, tt->page_flags & TTM_TT_FLAG_SWAPPED);
=20
 =09/* Swapout depopulates TT, allocate pages and then swap them in */
-=09err =3D ttm_pool_alloc(&devs->ttm_dev->pool, tt, &ctx);
+=09err =3D ttm_pool_alloc(&devs->ttm_dev->pool, tt, false, &ctx);
 =09KUNIT_ASSERT_EQ(test, err, 0);
=20
 =09err =3D ttm_tt_swapin(tt);
diff --git a/drivers/gpu/drm/ttm/ttm_bo.c b/drivers/gpu/drm/ttm/ttm_bo.c
index f4d9e68b21e7..af04bb8e2c2a 100644
--- a/drivers/gpu/drm/ttm/ttm_bo.c
+++ b/drivers/gpu/drm/ttm/ttm_bo.c
@@ -142,7 +142,7 @@ static int ttm_bo_handle_move_mem(struct ttm_buffer_obj=
ect *bo,
 =09=09=09goto out_err;
=20
 =09=09if (mem->mem_type !=3D TTM_PL_SYSTEM) {
-=09=09=09ret =3D ttm_bo_populate(bo, ctx);
+=09=09=09ret =3D ttm_bo_populate(bo, false, ctx);
 =09=09=09if (ret)
 =09=09=09=09goto out_err;
 =09=09}
@@ -1256,6 +1256,7 @@ void ttm_bo_tt_destroy(struct ttm_buffer_object *bo)
  * is set to true.
  */
 int ttm_bo_populate(struct ttm_buffer_object *bo,
+=09=09    bool memcg_account,
 =09=09    struct ttm_operation_ctx *ctx)
 {
 =09struct ttm_tt *tt =3D bo->ttm;
@@ -1268,7 +1269,7 @@ int ttm_bo_populate(struct ttm_buffer_object *bo,
 =09=09return 0;
=20
 =09swapped =3D ttm_tt_is_swapped(tt);
-=09ret =3D ttm_tt_populate(bo->bdev, tt, ctx);
+=09ret =3D ttm_tt_populate(bo->bdev, tt, memcg_account, ctx);
 =09if (ret)
 =09=09return ret;
=20
diff --git a/drivers/gpu/drm/ttm/ttm_bo_util.c b/drivers/gpu/drm/ttm/ttm_bo=
_util.c
index 250675d56b1c..764d1cf1ecbe 100644
--- a/drivers/gpu/drm/ttm/ttm_bo_util.c
+++ b/drivers/gpu/drm/ttm/ttm_bo_util.c
@@ -167,7 +167,7 @@ int ttm_bo_move_memcpy(struct ttm_buffer_object *bo,
 =09src_man =3D ttm_manager_type(bdev, src_mem->mem_type);
 =09if (ttm && ((ttm->page_flags & TTM_TT_FLAG_SWAPPED) ||
 =09=09    dst_man->use_tt)) {
-=09=09ret =3D ttm_bo_populate(bo, ctx);
+=09=09ret =3D ttm_bo_populate(bo, false, ctx);
 =09=09if (ret)
 =09=09=09return ret;
 =09}
@@ -354,7 +354,7 @@ static int ttm_bo_kmap_ttm(struct ttm_buffer_object *bo=
,
=20
 =09BUG_ON(!ttm);
=20
-=09ret =3D ttm_bo_populate(bo, &ctx);
+=09ret =3D ttm_bo_populate(bo, false, &ctx);
 =09if (ret)
 =09=09return ret;
=20
@@ -511,7 +511,7 @@ int ttm_bo_vmap(struct ttm_buffer_object *bo, struct io=
sys_map *map)
 =09=09pgprot_t prot;
 =09=09void *vaddr;
=20
-=09=09ret =3D ttm_bo_populate(bo, &ctx);
+=09=09ret =3D ttm_bo_populate(bo, false, &ctx);
 =09=09if (ret)
 =09=09=09return ret;
=20
diff --git a/drivers/gpu/drm/ttm/ttm_bo_vm.c b/drivers/gpu/drm/ttm/ttm_bo_v=
m.c
index b47020fca199..c5ad447debe3 100644
--- a/drivers/gpu/drm/ttm/ttm_bo_vm.c
+++ b/drivers/gpu/drm/ttm/ttm_bo_vm.c
@@ -225,7 +225,9 @@ vm_fault_t ttm_bo_vm_fault_reserved(struct vm_fault *vm=
f,
 =09=09};
=20
 =09=09ttm =3D bo->ttm;
-=09=09err =3D ttm_bo_populate(bo, &ctx);
+=09=09err =3D ttm_bo_populate(bo,
+=09=09=09=09      false,
+=09=09=09=09      &ctx);
 =09=09if (err) {
 =09=09=09if (err =3D=3D -EINTR || err =3D=3D -ERESTARTSYS ||
 =09=09=09    err =3D=3D -EAGAIN)
diff --git a/drivers/gpu/drm/ttm/ttm_pool.c b/drivers/gpu/drm/ttm/ttm_pool.=
c
index 6f44654ea743..63eb81b18987 100644
--- a/drivers/gpu/drm/ttm/ttm_pool.c
+++ b/drivers/gpu/drm/ttm/ttm_pool.c
@@ -743,6 +743,7 @@ static unsigned int ttm_pool_alloc_find_order(unsigned =
int highest,
 }
=20
 static int __ttm_pool_alloc(struct ttm_pool *pool, struct ttm_tt *tt,
+=09=09=09    bool memcg_account,
 =09=09=09    const struct ttm_operation_ctx *ctx,
 =09=09=09    struct ttm_pool_alloc_state *alloc,
 =09=09=09    struct ttm_pool_tt_restore *restore)
@@ -853,6 +854,7 @@ static int __ttm_pool_alloc(struct ttm_pool *pool, stru=
ct ttm_tt *tt,
  * Returns: 0 on successe, negative error code otherwise.
  */
 int ttm_pool_alloc(struct ttm_pool *pool, struct ttm_tt *tt,
+=09=09   bool memcg_account,
 =09=09   struct ttm_operation_ctx *ctx)
 {
 =09struct ttm_pool_alloc_state alloc;
@@ -862,7 +864,7 @@ int ttm_pool_alloc(struct ttm_pool *pool, struct ttm_tt=
 *tt,
=20
 =09ttm_pool_alloc_state_init(tt, &alloc);
=20
-=09return __ttm_pool_alloc(pool, tt, ctx, &alloc, NULL);
+=09return __ttm_pool_alloc(pool, tt, memcg_account, ctx, &alloc, NULL);
 }
 EXPORT_SYMBOL(ttm_pool_alloc);
=20
@@ -915,7 +917,7 @@ int ttm_pool_restore_and_alloc(struct ttm_pool *pool, s=
truct ttm_tt *tt,
 =09=09=09return 0;
 =09}
=20
-=09return __ttm_pool_alloc(pool, tt, ctx, &alloc, tt->restore);
+=09return __ttm_pool_alloc(pool, tt, false, ctx, &alloc, tt->restore);
 }
=20
 /**
diff --git a/drivers/gpu/drm/ttm/ttm_tt.c b/drivers/gpu/drm/ttm/ttm_tt.c
index 506e257dfba8..8f38de3b2f1c 100644
--- a/drivers/gpu/drm/ttm/ttm_tt.c
+++ b/drivers/gpu/drm/ttm/ttm_tt.c
@@ -366,7 +366,9 @@ int ttm_tt_swapout(struct ttm_device *bdev, struct ttm_=
tt *ttm,
 EXPORT_SYMBOL_FOR_TESTS_ONLY(ttm_tt_swapout);
=20
 int ttm_tt_populate(struct ttm_device *bdev,
-=09=09    struct ttm_tt *ttm, struct ttm_operation_ctx *ctx)
+=09=09    struct ttm_tt *ttm,
+=09=09    bool memcg_account,
+=09=09    struct ttm_operation_ctx *ctx)
 {
 =09int ret;
=20
@@ -395,9 +397,9 @@ int ttm_tt_populate(struct ttm_device *bdev,
 =09}
=20
 =09if (bdev->funcs->ttm_tt_populate)
-=09=09ret =3D bdev->funcs->ttm_tt_populate(bdev, ttm, ctx);
+=09=09ret =3D bdev->funcs->ttm_tt_populate(bdev, ttm, memcg_account, ctx);
 =09else
-=09=09ret =3D ttm_pool_alloc(&bdev->pool, ttm, ctx);
+=09=09ret =3D ttm_pool_alloc(&bdev->pool, ttm, memcg_account, ctx);
 =09if (ret)
 =09=09goto error;
=20
diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_blit.c b/drivers/gpu/drm/vmwgfx/=
vmwgfx_blit.c
index fa5841fda659..a4d4ebf585fe 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_blit.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_blit.c
@@ -569,13 +569,13 @@ int vmw_bo_cpu_blit(struct vmw_bo *vmw_dst,
 =09=09dma_resv_assert_held(src->base.resv);
=20
 =09if (!ttm_tt_is_populated(dst->ttm)) {
-=09=09ret =3D dst->bdev->funcs->ttm_tt_populate(dst->bdev, dst->ttm, &ctx)=
;
+=09=09ret =3D dst->bdev->funcs->ttm_tt_populate(dst->bdev, dst->ttm, false=
, &ctx);
 =09=09if (ret)
 =09=09=09return ret;
 =09}
=20
 =09if (!ttm_tt_is_populated(src->ttm)) {
-=09=09ret =3D src->bdev->funcs->ttm_tt_populate(src->bdev, src->ttm, &ctx)=
;
+=09=09ret =3D src->bdev->funcs->ttm_tt_populate(src->bdev, src->ttm, false=
, &ctx);
 =09=09if (ret)
 =09=09=09return ret;
 =09}
diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c b/drivers/gpu/drm/v=
mwgfx/vmwgfx_ttm_buffer.c
index 5553892d7c3e..2351dafc1c68 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c
@@ -360,7 +360,8 @@ static void vmw_ttm_destroy(struct ttm_device *bdev, st=
ruct ttm_tt *ttm)
=20
=20
 static int vmw_ttm_populate(struct ttm_device *bdev,
-=09=09=09    struct ttm_tt *ttm, struct ttm_operation_ctx *ctx)
+=09=09=09    struct ttm_tt *ttm, bool memcg_account,
+=09=09=09    struct ttm_operation_ctx *ctx)
 {
 =09bool external =3D (ttm->page_flags & TTM_TT_FLAG_EXTERNAL) !=3D 0;
=20
@@ -372,7 +373,7 @@ static int vmw_ttm_populate(struct ttm_device *bdev,
 =09=09=09=09=09=09       ttm->dma_address,
 =09=09=09=09=09=09       ttm->num_pages);
=20
-=09return ttm_pool_alloc(&bdev->pool, ttm, ctx);
+=09return ttm_pool_alloc(&bdev->pool, ttm, memcg_account, ctx);
 }
=20
 static void vmw_ttm_unpopulate(struct ttm_device *bdev,
@@ -580,7 +581,7 @@ int vmw_bo_create_and_populate(struct vmw_private *dev_=
priv,
 =09if (unlikely(ret !=3D 0))
 =09=09return ret;
=20
-=09ret =3D vmw_ttm_populate(vbo->tbo.bdev, vbo->tbo.ttm, &ctx);
+=09ret =3D vmw_ttm_populate(vbo->tbo.bdev, vbo->tbo.ttm, false, &ctx);
 =09if (likely(ret =3D=3D 0)) {
 =09=09struct vmw_ttm_tt *vmw_tt =3D
 =09=09=09container_of(vbo->tbo.ttm, struct vmw_ttm_tt, dma_ttm);
diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
index 7aa2c17825da..522cbff11563 100644
--- a/drivers/gpu/drm/xe/xe_bo.c
+++ b/drivers/gpu/drm/xe/xe_bo.c
@@ -504,6 +504,7 @@ static struct ttm_tt *xe_ttm_tt_create(struct ttm_buffe=
r_object *ttm_bo,
 }
=20
 static int xe_ttm_tt_populate(struct ttm_device *ttm_dev, struct ttm_tt *t=
t,
+=09=09=09      bool memcg_account,
 =09=09=09      struct ttm_operation_ctx *ctx)
 {
 =09struct xe_ttm_tt *xe_tt =3D container_of(tt, struct xe_ttm_tt, ttm);
@@ -521,7 +522,7 @@ static int xe_ttm_tt_populate(struct ttm_device *ttm_de=
v, struct ttm_tt *tt,
 =09=09err =3D ttm_tt_restore(ttm_dev, tt, ctx);
 =09} else {
 =09=09ttm_tt_clear_backed_up(tt);
-=09=09err =3D ttm_pool_alloc(&ttm_dev->pool, tt, ctx);
+=09=09err =3D ttm_pool_alloc(&ttm_dev->pool, tt, memcg_account, ctx);
 =09}
 =09if (err)
 =09=09return err;
diff --git a/include/drm/ttm/ttm_bo.h b/include/drm/ttm/ttm_bo.h
index 894ff7ccd68e..099dc2604baa 100644
--- a/include/drm/ttm/ttm_bo.h
+++ b/include/drm/ttm/ttm_bo.h
@@ -464,6 +464,7 @@ pgprot_t ttm_io_prot(struct ttm_buffer_object *bo, stru=
ct ttm_resource *res,
 =09=09     pgprot_t tmp);
 void ttm_bo_tt_destroy(struct ttm_buffer_object *bo);
 int ttm_bo_populate(struct ttm_buffer_object *bo,
+=09=09    bool memcg_account,
 =09=09    struct ttm_operation_ctx *ctx);
=20
 /* Driver LRU walk helpers initially targeted for shrinking. */
diff --git a/include/drm/ttm/ttm_device.h b/include/drm/ttm/ttm_device.h
index 39b8636b1845..903ca40ebf92 100644
--- a/include/drm/ttm/ttm_device.h
+++ b/include/drm/ttm/ttm_device.h
@@ -84,6 +84,7 @@ struct ttm_device_funcs {
 =09 */
 =09int (*ttm_tt_populate)(struct ttm_device *bdev,
 =09=09=09       struct ttm_tt *ttm,
+=09=09=09       bool memcg_account,
 =09=09=09       struct ttm_operation_ctx *ctx);
=20
 =09/**
diff --git a/include/drm/ttm/ttm_pool.h b/include/drm/ttm/ttm_pool.h
index df56527c4853..da5b94226203 100644
--- a/include/drm/ttm/ttm_pool.h
+++ b/include/drm/ttm/ttm_pool.h
@@ -79,6 +79,7 @@ struct ttm_pool {
 };
=20
 int ttm_pool_alloc(struct ttm_pool *pool, struct ttm_tt *tt,
+=09=09   bool memcg_account,
 =09=09   struct ttm_operation_ctx *ctx);
 void ttm_pool_free(struct ttm_pool *pool, struct ttm_tt *tt);
=20
diff --git a/include/drm/ttm/ttm_tt.h b/include/drm/ttm/ttm_tt.h
index 406437ad674b..15d4019685f6 100644
--- a/include/drm/ttm/ttm_tt.h
+++ b/include/drm/ttm/ttm_tt.h
@@ -250,6 +250,7 @@ int ttm_tt_swapout(struct ttm_device *bdev, struct ttm_=
tt *ttm,
  * Calls the driver method to allocate pages for a ttm
  */
 int ttm_tt_populate(struct ttm_device *bdev, struct ttm_tt *ttm,
+=09=09    bool memcg_account,
 =09=09    struct ttm_operation_ctx *ctx);
=20
 /**
--=20
2.49.0

