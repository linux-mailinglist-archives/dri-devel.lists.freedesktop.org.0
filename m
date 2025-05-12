Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 460E2AB2F78
	for <lists+dri-devel@lfdr.de>; Mon, 12 May 2025 08:20:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A9BA510E2AC;
	Mon, 12 May 2025 06:19:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-44.mimecast.com
 (us-smtp-delivery-44.mimecast.com [207.211.30.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 779C810E2AC
 for <dri-devel@lists.freedesktop.org>; Mon, 12 May 2025 06:19:57 +0000 (UTC)
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-639-gUYKTkoQNWars-_Ax-8GYg-1; Mon,
 12 May 2025 02:19:53 -0400
X-MC-Unique: gUYKTkoQNWars-_Ax-8GYg-1
X-Mimecast-MFC-AGG-ID: gUYKTkoQNWars-_Ax-8GYg_1747030791
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 8C4911800771; Mon, 12 May 2025 06:19:51 +0000 (UTC)
Received: from dreadlord.redhat.com (unknown [10.64.136.70])
 by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id E2F0A19560B0; Mon, 12 May 2025 06:19:46 +0000 (UTC)
From: Dave Airlie <airlied@gmail.com>
To: dri-devel@lists.freedesktop.org, tj@kernel.org, christian.koenig@amd.com,
 Johannes Weiner <hannes@cmpxchg.org>, Michal Hocko <mhocko@kernel.org>,
 Roman Gushchin <roman.gushchin@linux.dev>,
 Shakeel Butt <shakeel.butt@linux.dev>, Muchun Song <muchun.song@linux.dev>
Cc: cgroups@vger.kernel.org, Waiman Long <longman@redhat.com>, simona@ffwll.ch
Subject: [PATCH 5/7] ttm: add initial memcg integration. (v4)
Date: Mon, 12 May 2025 16:12:11 +1000
Message-ID: <20250512061913.3522902-6-airlied@gmail.com>
In-Reply-To: <20250512061913.3522902-1-airlied@gmail.com>
References: <20250512061913.3522902-1-airlied@gmail.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 1AywbBrAvaqS9PX6-l4iy2ZMzci7d1IQBQr-0LIHwys_1747030791
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

Doing proper integration of TTM system memory allocations with
memcg is a difficult ask, primarily due to difficulties around
accounting for evictions properly.

However there are systems where userspace will be allocating
objects in system memory and they won't be prone to migrating
or evicting and we should start with at least accounting those.

This adds a memcg group to ttm bo and tt objects.

This memcg is used when:
a) when a tt is populated (and unpopulated)
b) the TTM_PL_FLAG_MEMCG is set on the placement for the
bo when the tt is allocated.

The placement flag is set for all non-eviction placements.

This version moves back from the resource to the tt layer,
when accounting at the resource layer, if an object is swapped
out there was no way to remove it from the accounting, whereas
the tt layer has more info for this.

v4: move back to the tt layer from the resource layer to
handle swap, but keep the memcg charging hooks for now.
v3: moves from having a flags on the op ctx to the using a
placement flag.
v2: moved the charging up a level and also no longer used
__GFP_ACCOUNT, or attached the memcg to object pages, it instead
uses the same approach as socket memory and just charges/uncharges
at the object level. This was suggested by Christian.

Signed-off-by: Dave Airlie <airlied@redhat.com>
---
 drivers/gpu/drm/ttm/ttm_bo.c      |  6 ++++--
 drivers/gpu/drm/ttm/ttm_bo_util.c |  6 +++---
 drivers/gpu/drm/ttm/ttm_bo_vm.c   |  4 +++-
 drivers/gpu/drm/ttm/ttm_tt.c      | 17 ++++++++++++++++-
 include/drm/ttm/ttm_bo.h          |  7 +++++++
 include/drm/ttm/ttm_placement.h   |  3 +++
 include/drm/ttm/ttm_tt.h          |  9 ++++++++-
 7 files changed, 44 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/ttm/ttm_bo.c b/drivers/gpu/drm/ttm/ttm_bo.c
index 5bf3c969907c..1630ef28e5a8 100644
--- a/drivers/gpu/drm/ttm/ttm_bo.c
+++ b/drivers/gpu/drm/ttm/ttm_bo.c
@@ -140,7 +140,7 @@ static int ttm_bo_handle_move_mem(struct ttm_buffer_obj=
ect *bo,
 =09=09=09goto out_err;
=20
 =09=09if (mem->mem_type !=3D TTM_PL_SYSTEM) {
-=09=09=09ret =3D ttm_bo_populate(bo, ctx);
+=09=09=09ret =3D ttm_bo_populate(bo, mem->placement & TTM_PL_FLAG_MEMCG, c=
tx);
 =09=09=09if (ret)
 =09=09=09=09goto out_err;
 =09=09}
@@ -1237,6 +1237,7 @@ void ttm_bo_tt_destroy(struct ttm_buffer_object *bo)
 /**
  * ttm_bo_populate() - Ensure that a buffer object has backing pages
  * @bo: The buffer object
+ * @memcg_account: account this memory with memcg if needed
  * @ctx: The ttm_operation_ctx governing the operation.
  *
  * For buffer objects in a memory type whose manager uses
@@ -1250,6 +1251,7 @@ void ttm_bo_tt_destroy(struct ttm_buffer_object *bo)
  * is set to true.
  */
 int ttm_bo_populate(struct ttm_buffer_object *bo,
+=09=09    bool memcg_account,
 =09=09    struct ttm_operation_ctx *ctx)
 {
 =09struct ttm_tt *tt =3D bo->ttm;
@@ -1262,7 +1264,7 @@ int ttm_bo_populate(struct ttm_buffer_object *bo,
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
index 15cab9bda17f..7d599d0707e4 100644
--- a/drivers/gpu/drm/ttm/ttm_bo_util.c
+++ b/drivers/gpu/drm/ttm/ttm_bo_util.c
@@ -163,7 +163,7 @@ int ttm_bo_move_memcpy(struct ttm_buffer_object *bo,
 =09src_man =3D ttm_manager_type(bdev, src_mem->mem_type);
 =09if (ttm && ((ttm->page_flags & TTM_TT_FLAG_SWAPPED) ||
 =09=09    dst_man->use_tt)) {
-=09=09ret =3D ttm_bo_populate(bo, ctx);
+=09=09ret =3D ttm_bo_populate(bo, dst_mem->placement & TTM_PL_FLAG_MEMCG, =
ctx);
 =09=09if (ret)
 =09=09=09return ret;
 =09}
@@ -350,7 +350,7 @@ static int ttm_bo_kmap_ttm(struct ttm_buffer_object *bo=
,
=20
 =09BUG_ON(!ttm);
=20
-=09ret =3D ttm_bo_populate(bo, &ctx);
+=09ret =3D ttm_bo_populate(bo, mem->placement & TTM_PL_FLAG_MEMCG, &ctx);
 =09if (ret)
 =09=09return ret;
=20
@@ -507,7 +507,7 @@ int ttm_bo_vmap(struct ttm_buffer_object *bo, struct io=
sys_map *map)
 =09=09pgprot_t prot;
 =09=09void *vaddr;
=20
-=09=09ret =3D ttm_bo_populate(bo, &ctx);
+=09=09ret =3D ttm_bo_populate(bo, mem->placement & TTM_PL_FLAG_MEMCG, &ctx=
);
 =09=09if (ret)
 =09=09=09return ret;
=20
diff --git a/drivers/gpu/drm/ttm/ttm_bo_vm.c b/drivers/gpu/drm/ttm/ttm_bo_v=
m.c
index a194db83421d..02aea23a34e7 100644
--- a/drivers/gpu/drm/ttm/ttm_bo_vm.c
+++ b/drivers/gpu/drm/ttm/ttm_bo_vm.c
@@ -224,7 +224,9 @@ vm_fault_t ttm_bo_vm_fault_reserved(struct vm_fault *vm=
f,
 =09=09};
=20
 =09=09ttm =3D bo->ttm;
-=09=09err =3D ttm_bo_populate(bo, &ctx);
+=09=09err =3D ttm_bo_populate(bo,
+=09=09=09=09      bo->resource->placement & TTM_PL_FLAG_MEMCG,
+=09=09=09=09      &ctx);
 =09=09if (err) {
 =09=09=09if (err =3D=3D -EINTR || err =3D=3D -ERESTARTSYS ||
 =09=09=09    err =3D=3D -EAGAIN)
diff --git a/drivers/gpu/drm/ttm/ttm_tt.c b/drivers/gpu/drm/ttm/ttm_tt.c
index 698cd4bf5e46..81c4cbbeb130 100644
--- a/drivers/gpu/drm/ttm/ttm_tt.c
+++ b/drivers/gpu/drm/ttm/ttm_tt.c
@@ -161,6 +161,7 @@ static void ttm_tt_init_fields(struct ttm_tt *ttm,
 =09ttm->caching =3D caching;
 =09ttm->restore =3D NULL;
 =09ttm->backup =3D NULL;
+=09ttm->memcg =3D bo->memcg;
 }
=20
 int ttm_tt_init(struct ttm_tt *ttm, struct ttm_buffer_object *bo,
@@ -365,7 +366,9 @@ int ttm_tt_swapout(struct ttm_device *bdev, struct ttm_=
tt *ttm,
 EXPORT_SYMBOL_FOR_TESTS_ONLY(ttm_tt_swapout);
=20
 int ttm_tt_populate(struct ttm_device *bdev,
-=09=09    struct ttm_tt *ttm, struct ttm_operation_ctx *ctx)
+=09=09    struct ttm_tt *ttm,
+=09=09    bool memcg_account_tt,
+=09=09    struct ttm_operation_ctx *ctx)
 {
 =09int ret;
=20
@@ -376,6 +379,14 @@ int ttm_tt_populate(struct ttm_device *bdev,
 =09=09return 0;
=20
 =09if (!(ttm->page_flags & TTM_TT_FLAG_EXTERNAL)) {
+=09=09if (ttm->memcg && memcg_account_tt) {
+=09=09=09gfp_t gfp_flags =3D GFP_USER;
+=09=09=09if (ctx->gfp_retry_mayfail)
+=09=09=09=09gfp_flags |=3D __GFP_RETRY_MAYFAIL;
+=09=09=09if (!mem_cgroup_charge_gpu(ttm->memcg, ttm->num_pages, gfp_flags)=
)
+=09=09=09=09return -ENOMEM;
+=09=09=09ttm->page_flags |=3D TTM_TT_FLAG_ACCOUNTED;
+=09=09}
 =09=09atomic_long_add(ttm->num_pages, &ttm_pages_allocated);
 =09=09if (bdev->pool.use_dma32)
 =09=09=09atomic_long_add(ttm->num_pages,
@@ -437,6 +448,10 @@ void ttm_tt_unpopulate(struct ttm_device *bdev, struct=
 ttm_tt *ttm)
 =09=09ttm_pool_free(&bdev->pool, ttm);
=20
 =09if (!(ttm->page_flags & TTM_TT_FLAG_EXTERNAL)) {
+=09=09if (ttm->page_flags & TTM_TT_FLAG_ACCOUNTED) {
+=09=09=09mem_cgroup_uncharge_gpu(ttm->memcg, ttm->num_pages);
+=09=09=09ttm->page_flags &=3D ~TTM_TT_FLAG_ACCOUNTED;
+=09=09}
 =09=09atomic_long_sub(ttm->num_pages, &ttm_pages_allocated);
 =09=09if (bdev->pool.use_dma32)
 =09=09=09atomic_long_sub(ttm->num_pages,
diff --git a/include/drm/ttm/ttm_bo.h b/include/drm/ttm/ttm_bo.h
index 903cd1030110..d7c0dd9e0746 100644
--- a/include/drm/ttm/ttm_bo.h
+++ b/include/drm/ttm/ttm_bo.h
@@ -135,6 +135,12 @@ struct ttm_buffer_object {
 =09 * reservation lock.
 =09 */
 =09struct sg_table *sg;
+
+=09/**
+=09 * @memcg: memory cgroup to charge this to if it ends up using system m=
emory.
+=09 * NULL means don't charge.
+=09 */
+=09struct mem_cgroup *memcg;
 };
=20
 #define TTM_BO_MAP_IOMEM_MASK 0x80
@@ -486,6 +492,7 @@ pgprot_t ttm_io_prot(struct ttm_buffer_object *bo, stru=
ct ttm_resource *res,
 =09=09     pgprot_t tmp);
 void ttm_bo_tt_destroy(struct ttm_buffer_object *bo);
 int ttm_bo_populate(struct ttm_buffer_object *bo,
+=09=09    bool memcg_account,
 =09=09    struct ttm_operation_ctx *ctx);
=20
 /* Driver LRU walk helpers initially targeted for shrinking. */
diff --git a/include/drm/ttm/ttm_placement.h b/include/drm/ttm/ttm_placemen=
t.h
index b510a4812609..668798072292 100644
--- a/include/drm/ttm/ttm_placement.h
+++ b/include/drm/ttm/ttm_placement.h
@@ -70,6 +70,9 @@
 /* Placement is only used during eviction */
 #define TTM_PL_FLAG_FALLBACK=09(1 << 4)
=20
+/* Placement causes memcg accounting */
+#define TTM_PL_FLAG_MEMCG=09(1 << 5)
+
 /**
  * struct ttm_place
  *
diff --git a/include/drm/ttm/ttm_tt.h b/include/drm/ttm/ttm_tt.h
index 406437ad674b..2790fc82edc3 100644
--- a/include/drm/ttm/ttm_tt.h
+++ b/include/drm/ttm/ttm_tt.h
@@ -90,6 +90,8 @@ struct ttm_tt {
 =09 * TTM_TT_FLAG_BACKED_UP: TTM internal only. This is set if the
 =09 * struct ttm_tt has been (possibly partially) backed up.
 =09 *
+=09 * TTM_TT_FLAG_ACCOUNTED: TTM internal. This tt has been accounted.
+=09 *
 =09 * TTM_TT_FLAG_PRIV_POPULATED: TTM internal only. DO NOT USE. This is
 =09 * set by TTM after ttm_tt_populate() has successfully returned, and is
 =09 * then unset when TTM calls ttm_tt_unpopulate().
@@ -101,8 +103,9 @@ struct ttm_tt {
 #define TTM_TT_FLAG_EXTERNAL_MAPPABLE=09BIT(3)
 #define TTM_TT_FLAG_DECRYPTED=09=09BIT(4)
 #define TTM_TT_FLAG_BACKED_UP=09        BIT(5)
+#define TTM_TT_FLAG_ACCOUNTED=09        BIT(6)
=20
-#define TTM_TT_FLAG_PRIV_POPULATED=09BIT(6)
+#define TTM_TT_FLAG_PRIV_POPULATED=09BIT(7)
 =09uint32_t page_flags;
 =09/** @num_pages: Number of pages in the page array. */
 =09uint32_t num_pages;
@@ -126,6 +129,8 @@ struct ttm_tt {
 =09enum ttm_caching caching;
 =09/** @restore: Partial restoration from backup state. TTM private */
 =09struct ttm_pool_tt_restore *restore;
+=09/** @memcg: Memory cgroup for this TT allocation */
+=09struct mem_cgroup *memcg;
 };
=20
 /**
@@ -245,11 +250,13 @@ int ttm_tt_swapout(struct ttm_device *bdev, struct tt=
m_tt *ttm,
  *
  * @bdev: the ttm_device this object belongs to
  * @ttm: Pointer to the ttm_tt structure
+ * @mem_account_tt: Account this population to the memcg
  * @ctx: operation context for populating the tt object.
  *
  * Calls the driver method to allocate pages for a ttm
  */
 int ttm_tt_populate(struct ttm_device *bdev, struct ttm_tt *ttm,
+=09=09    bool mem_account_tt,
 =09=09    struct ttm_operation_ctx *ctx);
=20
 /**
--=20
2.49.0

