Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iFyiHooInWk7MgQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 24 Feb 2026 03:10:18 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A3A8180E32
	for <lists+dri-devel@lfdr.de>; Tue, 24 Feb 2026 03:10:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 618DA10E475;
	Tue, 24 Feb 2026 02:10:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-44.mimecast.com
 (us-smtp-delivery-44.mimecast.com [205.139.111.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C02010E475
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Feb 2026 02:10:14 +0000 (UTC)
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-228-qp7EnumLPl6TTTW13rgtNw-1; Mon,
 23 Feb 2026 21:10:07 -0500
X-MC-Unique: qp7EnumLPl6TTTW13rgtNw-1
X-Mimecast-MFC-AGG-ID: qp7EnumLPl6TTTW13rgtNw_1771899005
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 73B971800BD4; Tue, 24 Feb 2026 02:10:05 +0000 (UTC)
Received: from dreadlord.taild9177d.ts.net (unknown [10.67.32.38])
 by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 965A53003D91; Tue, 24 Feb 2026 02:09:58 +0000 (UTC)
From: Dave Airlie <airlied@gmail.com>
To: dri-devel@lists.freedesktop.org, tj@kernel.org, christian.koenig@amd.com,
 Johannes Weiner <hannes@cmpxchg.org>, Michal Hocko <mhocko@kernel.org>,
 Roman Gushchin <roman.gushchin@linux.dev>,
 Shakeel Butt <shakeel.butt@linux.dev>, Muchun Song <muchun.song@linux.dev>
Cc: cgroups@vger.kernel.org, Dave Chinner <david@fromorbit.com>,
 Waiman Long <longman@redhat.com>, simona@ffwll.ch
Subject: [PATCH 08/16] ttm: add a memcg accounting flag to the alloc/populate
 APIs
Date: Tue, 24 Feb 2026 12:06:25 +1000
Message-ID: <20260224020854.791201-9-airlied@gmail.com>
In-Reply-To: <20260224020854.791201-1-airlied@gmail.com>
References: <20260224020854.791201-1-airlied@gmail.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: cmxGpm0Auy0w_SBi0fv7lwenXyiMlmgBMhZ3Gdhzqyk_1771899005
X-Mimecast-Originator: gmail.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.49 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	DMARC_POLICY_SOFTFAIL(0.10)[gmail.com : SPF not aligned (relaxed), No valid DKIM,none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[airlied@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-0.957];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,amd.com:email]
X-Rspamd-Queue-Id: 0A3A8180E32
X-Rspamd-Action: no action

From: Dave Airlie <airlied@redhat.com>

This flag does nothing yet, but this just changes the APIs to accept
it in the future across all users.

This flag will eventually be filled out with when to account a tt
populate to a memcg.

Reviewed-by: Christian K=C3=B6nig <christian.koenig@amd.com>
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
 drivers/gpu/drm/ttm/ttm_bo.c                     |  7 ++++---
 drivers/gpu/drm/ttm/ttm_bo_util.c                |  6 +++---
 drivers/gpu/drm/ttm/ttm_bo_vm.c                  |  4 +++-
 drivers/gpu/drm/ttm/ttm_pool.c                   |  6 ++++--
 drivers/gpu/drm/ttm/ttm_tt.c                     |  8 +++++---
 drivers/gpu/drm/vmwgfx/vmwgfx_blit.c             |  4 ++--
 drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c       |  7 ++++---
 drivers/gpu/drm/xe/xe_bo.c                       |  5 +++--
 include/drm/ttm/ttm_bo.h                         |  1 +
 include/drm/ttm/ttm_device.h                     |  1 +
 include/drm/ttm/ttm_pool.h                       |  1 +
 include/drm/ttm/ttm_tt.h                         |  1 +
 22 files changed, 63 insertions(+), 44 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c b/drivers/gpu/drm/amd/=
amdgpu/amdgpu_ttm.c
index eeaa56c8d129..e50c133e87df 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
@@ -1203,6 +1203,7 @@ static struct ttm_tt *amdgpu_ttm_tt_create(struct ttm=
_buffer_object *bo,
  */
 static int amdgpu_ttm_tt_populate(struct ttm_device *bdev,
 =09=09=09=09  struct ttm_tt *ttm,
+=09=09=09=09  bool memcg_account,
 =09=09=09=09  struct ttm_operation_ctx *ctx)
 {
 =09struct amdgpu_device *adev =3D amdgpu_ttm_adev(bdev);
@@ -1226,7 +1227,7 @@ static int amdgpu_ttm_tt_populate(struct ttm_device *=
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
index 033eda38e4b5..da4421cf2623 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
@@ -317,6 +317,7 @@ static struct ttm_tt *i915_ttm_tt_create(struct ttm_buf=
fer_object *bo,
=20
 static int i915_ttm_tt_populate(struct ttm_device *bdev,
 =09=09=09=09struct ttm_tt *ttm,
+=09=09=09=09bool memcg_account,
 =09=09=09=09struct ttm_operation_ctx *ctx)
 {
 =09struct i915_ttm_tt *i915_tt =3D container_of(ttm, typeof(*i915_tt), ttm=
);
@@ -324,7 +325,7 @@ static int i915_ttm_tt_populate(struct ttm_device *bdev=
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
@@ -811,7 +812,7 @@ static int __i915_ttm_get_pages(struct drm_i915_gem_obj=
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
index 3a7e202ae87d..ec475b311aea 100644
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
index 4824f948daed..d951e58f78ea 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_ttm_pm.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_ttm_pm.c
@@ -91,7 +91,7 @@ static int i915_ttm_backup(struct i915_gem_apply_to_regio=
n *apply,
 =09=09goto out_no_lock;
=20
 =09backup_bo =3D i915_gem_to_ttm(backup);
-=09err =3D ttm_bo_populate(backup_bo, &ctx);
+=09err =3D ttm_bo_populate(backup_bo, false, &ctx);
 =09if (err)
 =09=09goto out_no_populate;
=20
@@ -190,7 +190,7 @@ static int i915_ttm_restore(struct i915_gem_apply_to_re=
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
index d7441d96a0dc..bfb5f1b1ec91 100644
--- a/drivers/gpu/drm/loongson/lsdc_ttm.c
+++ b/drivers/gpu/drm/loongson/lsdc_ttm.c
@@ -111,6 +111,7 @@ lsdc_ttm_tt_create(struct ttm_buffer_object *tbo, uint3=
2_t page_flags)
=20
 static int lsdc_ttm_tt_populate(struct ttm_device *bdev,
 =09=09=09=09struct ttm_tt *ttm,
+=09=09=09=09bool memcg_account,
 =09=09=09=09struct ttm_operation_ctx *ctx)
 {
 =09bool slave =3D !!(ttm->page_flags & TTM_TT_FLAG_EXTERNAL);
@@ -123,7 +124,7 @@ static int lsdc_ttm_tt_populate(struct ttm_device *bdev=
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
index 3c7d2e5b3850..e8b0692afd0c 100644
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
index e7ab8162ac69..98b09463abc2 100644
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
index 6d95447a989d..cef326ebf25a 100644
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
index 01197014b83f..456241bdaf41 100644
--- a/drivers/gpu/drm/ttm/tests/ttm_pool_test.c
+++ b/drivers/gpu/drm/ttm/tests/ttm_pool_test.c
@@ -89,7 +89,7 @@ static struct ttm_pool *ttm_pool_pre_populated(struct kun=
it *test,
=20
 =09ttm_pool_init(pool, devs->dev, NUMA_NO_NODE, TTM_ALLOCATION_POOL_USE_DM=
A_ALLOC);
=20
-=09err =3D ttm_pool_alloc(pool, tt, &simple_ctx);
+=09err =3D ttm_pool_alloc(pool, tt, false, &simple_ctx);
 =09KUNIT_ASSERT_EQ(test, err, 0);
=20
 =09ttm_pool_free(pool, tt);
@@ -157,7 +157,7 @@ static void ttm_pool_alloc_basic(struct kunit *test)
 =09KUNIT_ASSERT_EQ(test, pool->nid, NUMA_NO_NODE);
 =09KUNIT_ASSERT_EQ(test, pool->alloc_flags, params->alloc_flags);
=20
-=09err =3D ttm_pool_alloc(pool, tt, &simple_ctx);
+=09err =3D ttm_pool_alloc(pool, tt, false, &simple_ctx);
 =09KUNIT_ASSERT_EQ(test, err, 0);
 =09KUNIT_ASSERT_EQ(test, tt->num_pages, expected_num_pages);
=20
@@ -220,7 +220,7 @@ static void ttm_pool_alloc_basic_dma_addr(struct kunit =
*test)
=20
 =09ttm_pool_init(pool, devs->dev, NUMA_NO_NODE, TTM_ALLOCATION_POOL_USE_DM=
A_ALLOC);
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
 =09ttm_pool_init(pool, devs->dev, NUMA_NO_NODE, TTM_ALLOCATION_POOL_USE_DM=
A_ALLOC);
-=09ttm_pool_alloc(pool, tt, &simple_ctx);
+=09ttm_pool_alloc(pool, tt, false, &simple_ctx);
=20
 =09pt =3D &pool->caching[caching].orders[order];
 =09KUNIT_ASSERT_TRUE(test, !list_lru_count(&pt->pages));
@@ -380,7 +380,7 @@ static void ttm_pool_free_no_dma_alloc(struct kunit *te=
st)
 =09KUNIT_ASSERT_NOT_NULL(test, pool);
=20
 =09ttm_pool_init(pool, devs->dev, NUMA_NO_NODE, 0);
-=09ttm_pool_alloc(pool, tt, &simple_ctx);
+=09ttm_pool_alloc(pool, tt, false, &simple_ctx);
=20
 =09pt =3D &pool->caching[caching].orders[order];
 =09KUNIT_ASSERT_TRUE(test, list_lru_count(&pt->pages) =3D=3D 1);
diff --git a/drivers/gpu/drm/ttm/tests/ttm_tt_test.c b/drivers/gpu/drm/ttm/=
tests/ttm_tt_test.c
index bd5f7d0b9b62..dfa38bbfd829 100644
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
index acb9197db879..704af3cfc47a 100644
--- a/drivers/gpu/drm/ttm/ttm_bo.c
+++ b/drivers/gpu/drm/ttm/ttm_bo.c
@@ -144,7 +144,7 @@ static int ttm_bo_handle_move_mem(struct ttm_buffer_obj=
ect *bo,
 =09=09=09goto out_err;
=20
 =09=09if (mem->mem_type !=3D TTM_PL_SYSTEM) {
-=09=09=09ret =3D ttm_bo_populate(bo, ctx);
+=09=09=09ret =3D ttm_bo_populate(bo, false, ctx);
 =09=09=09if (ret)
 =09=09=09=09goto out_err;
 =09=09}
@@ -1260,6 +1260,7 @@ void ttm_bo_tt_destroy(struct ttm_buffer_object *bo)
  * is set to true.
  */
 int ttm_bo_populate(struct ttm_buffer_object *bo,
+=09=09    bool memcg_account,
 =09=09    struct ttm_operation_ctx *ctx)
 {
 =09struct ttm_device *bdev =3D bo->bdev;
@@ -1273,7 +1274,7 @@ int ttm_bo_populate(struct ttm_buffer_object *bo,
 =09=09return 0;
=20
 =09swapped =3D ttm_tt_is_swapped(tt);
-=09ret =3D ttm_tt_populate(bdev, tt, ctx);
+=09ret =3D ttm_tt_populate(bdev, tt, memcg_account, ctx);
 =09if (ret)
 =09=09return ret;
=20
@@ -1298,7 +1299,7 @@ int ttm_bo_setup_export(struct ttm_buffer_object *bo,
 =09if (ret !=3D 0)
 =09=09return ret;
=20
-=09ret =3D ttm_bo_populate(bo, ctx);
+=09ret =3D ttm_bo_populate(bo, false, ctx);
 =09ttm_bo_unreserve(bo);
 =09return ret;
 }
diff --git a/drivers/gpu/drm/ttm/ttm_bo_util.c b/drivers/gpu/drm/ttm/ttm_bo=
_util.c
index f83b7d5ec6c6..1502515043c0 100644
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
@@ -352,7 +352,7 @@ static int ttm_bo_kmap_ttm(struct ttm_buffer_object *bo=
,
=20
 =09BUG_ON(!ttm);
=20
-=09ret =3D ttm_bo_populate(bo, &ctx);
+=09ret =3D ttm_bo_populate(bo, false, &ctx);
 =09if (ret)
 =09=09return ret;
=20
@@ -533,7 +533,7 @@ int ttm_bo_vmap(struct ttm_buffer_object *bo, struct io=
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
index a80510489c45..2e59836b6085 100644
--- a/drivers/gpu/drm/ttm/ttm_bo_vm.c
+++ b/drivers/gpu/drm/ttm/ttm_bo_vm.c
@@ -224,7 +224,9 @@ vm_fault_t ttm_bo_vm_fault_reserved(struct vm_fault *vm=
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
index 6b288558ac3b..f58147a83142 100644
--- a/drivers/gpu/drm/ttm/ttm_pool.c
+++ b/drivers/gpu/drm/ttm/ttm_pool.c
@@ -752,6 +752,7 @@ static unsigned int ttm_pool_alloc_find_order(unsigned =
int highest,
 }
=20
 static int __ttm_pool_alloc(struct ttm_pool *pool, struct ttm_tt *tt,
+=09=09=09    bool memcg_account,
 =09=09=09    const struct ttm_operation_ctx *ctx,
 =09=09=09    struct ttm_pool_alloc_state *alloc,
 =09=09=09    struct ttm_pool_tt_restore *restore)
@@ -862,6 +863,7 @@ static int __ttm_pool_alloc(struct ttm_pool *pool, stru=
ct ttm_tt *tt,
  * Returns: 0 on successe, negative error code otherwise.
  */
 int ttm_pool_alloc(struct ttm_pool *pool, struct ttm_tt *tt,
+=09=09   bool memcg_account,
 =09=09   struct ttm_operation_ctx *ctx)
 {
 =09struct ttm_pool_alloc_state alloc;
@@ -871,7 +873,7 @@ int ttm_pool_alloc(struct ttm_pool *pool, struct ttm_tt=
 *tt,
=20
 =09ttm_pool_alloc_state_init(tt, &alloc);
=20
-=09return __ttm_pool_alloc(pool, tt, ctx, &alloc, NULL);
+=09return __ttm_pool_alloc(pool, tt, memcg_account, ctx, &alloc, NULL);
 }
 EXPORT_SYMBOL(ttm_pool_alloc);
=20
@@ -926,7 +928,7 @@ int ttm_pool_restore_and_alloc(struct ttm_pool *pool, s=
truct ttm_tt *tt,
 =09=09=09return 0;
 =09}
=20
-=09return __ttm_pool_alloc(pool, tt, ctx, &alloc, restore);
+=09return __ttm_pool_alloc(pool, tt, false, ctx, &alloc, restore);
 }
=20
 /**
diff --git a/drivers/gpu/drm/ttm/ttm_tt.c b/drivers/gpu/drm/ttm/ttm_tt.c
index b645a1818184..aa0f17fca770 100644
--- a/drivers/gpu/drm/ttm/ttm_tt.c
+++ b/drivers/gpu/drm/ttm/ttm_tt.c
@@ -368,7 +368,9 @@ int ttm_tt_swapout(struct ttm_device *bdev, struct ttm_=
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
@@ -397,9 +399,9 @@ int ttm_tt_populate(struct ttm_device *bdev,
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
index 135b75a3e013..baa1c3fdb12c 100644
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
index dfd08ee19041..368701756119 100644
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
index 29fffc81f240..9cb4344c93df 100644
--- a/drivers/gpu/drm/xe/xe_bo.c
+++ b/drivers/gpu/drm/xe/xe_bo.c
@@ -551,6 +551,7 @@ static struct ttm_tt *xe_ttm_tt_create(struct ttm_buffe=
r_object *ttm_bo,
 }
=20
 static int xe_ttm_tt_populate(struct ttm_device *ttm_dev, struct ttm_tt *t=
t,
+=09=09=09      bool memcg_account,
 =09=09=09      struct ttm_operation_ctx *ctx)
 {
 =09struct xe_ttm_tt *xe_tt =3D container_of(tt, struct xe_ttm_tt, ttm);
@@ -568,7 +569,7 @@ static int xe_ttm_tt_populate(struct ttm_device *ttm_de=
v, struct ttm_tt *tt,
 =09=09err =3D ttm_tt_restore(ttm_dev, tt, ctx);
 =09} else {
 =09=09ttm_tt_clear_backed_up(tt);
-=09=09err =3D ttm_pool_alloc(&ttm_dev->pool, tt, ctx);
+=09=09err =3D ttm_pool_alloc(&ttm_dev->pool, tt, memcg_account, ctx);
 =09}
 =09if (err)
 =09=09return err;
@@ -1809,7 +1810,7 @@ static int xe_bo_fault_migrate(struct xe_bo *bo, stru=
ct ttm_operation_ctx *ctx,
 =09if (ttm_manager_type(tbo->bdev, tbo->resource->mem_type)->use_tt) {
 =09=09err =3D xe_bo_wait_usage_kernel(bo, ctx);
 =09=09if (!err)
-=09=09=09err =3D ttm_bo_populate(&bo->ttm, ctx);
+=09=09=09err =3D ttm_bo_populate(&bo->ttm, false, ctx);
 =09} else if (should_migrate_to_smem(bo)) {
 =09=09xe_assert(xe_bo_device(bo), bo->flags & XE_BO_FLAG_SYSTEM);
 =09=09err =3D xe_bo_migrate(bo, XE_PL_TT, ctx, exec);
diff --git a/include/drm/ttm/ttm_bo.h b/include/drm/ttm/ttm_bo.h
index bca3a8849d47..ea745edc2882 100644
--- a/include/drm/ttm/ttm_bo.h
+++ b/include/drm/ttm/ttm_bo.h
@@ -465,6 +465,7 @@ pgprot_t ttm_io_prot(struct ttm_buffer_object *bo, stru=
ct ttm_resource *res,
 =09=09     pgprot_t tmp);
 void ttm_bo_tt_destroy(struct ttm_buffer_object *bo);
 int ttm_bo_populate(struct ttm_buffer_object *bo,
+=09=09    bool memcg_account,
 =09=09    struct ttm_operation_ctx *ctx);
 int ttm_bo_setup_export(struct ttm_buffer_object *bo,
 =09=09=09struct ttm_operation_ctx *ctx);
diff --git a/include/drm/ttm/ttm_device.h b/include/drm/ttm/ttm_device.h
index 5618aef462f2..a4bd23988ee0 100644
--- a/include/drm/ttm/ttm_device.h
+++ b/include/drm/ttm/ttm_device.h
@@ -85,6 +85,7 @@ struct ttm_device_funcs {
 =09 */
 =09int (*ttm_tt_populate)(struct ttm_device *bdev,
 =09=09=09       struct ttm_tt *ttm,
+=09=09=09       bool memcg_account,
 =09=09=09       struct ttm_operation_ctx *ctx);
=20
 =09/**
diff --git a/include/drm/ttm/ttm_pool.h b/include/drm/ttm/ttm_pool.h
index 26ee592e1994..7f3f168c536c 100644
--- a/include/drm/ttm/ttm_pool.h
+++ b/include/drm/ttm/ttm_pool.h
@@ -78,6 +78,7 @@ struct ttm_pool {
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
2.52.0

