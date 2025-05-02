Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 697F2AA6977
	for <lists+dri-devel@lfdr.de>; Fri,  2 May 2025 05:41:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7DA8710E89E;
	Fri,  2 May 2025 03:41:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-44.mimecast.com
 (us-smtp-delivery-44.mimecast.com [205.139.111.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F333910E89E
 for <dri-devel@lists.freedesktop.org>; Fri,  2 May 2025 03:41:25 +0000 (UTC)
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-416-H6geaDjuPKmaAb-PmT3BPg-1; Thu,
 01 May 2025 23:41:21 -0400
X-MC-Unique: H6geaDjuPKmaAb-PmT3BPg-1
X-Mimecast-MFC-AGG-ID: H6geaDjuPKmaAb-PmT3BPg_1746157280
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 229C6180036D; Fri,  2 May 2025 03:41:20 +0000 (UTC)
Received: from dreadlord.redhat.com (unknown [10.64.136.70])
 by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 0BCD91800871; Fri,  2 May 2025 03:41:14 +0000 (UTC)
From: Dave Airlie <airlied@gmail.com>
To: dri-devel@lists.freedesktop.org, tj@kernel.org, christian.koenig@amd.com,
 Johannes Weiner <hannes@cmpxchg.org>, Michal Hocko <mhocko@kernel.org>,
 Roman Gushchin <roman.gushchin@linux.dev>,
 Shakeel Butt <shakeel.butt@linux.dev>, Muchun Song <muchun.song@linux.dev>
Cc: cgroups@vger.kernel.org, Waiman Long <longman@redhat.com>, simona@ffwll.ch
Subject: [PATCH 3/5] ttm: add initial memcg integration. (v2)
Date: Fri,  2 May 2025 13:36:02 +1000
Message-ID: <20250502034046.1625896-4-airlied@gmail.com>
In-Reply-To: <20250502034046.1625896-1-airlied@gmail.com>
References: <20250502034046.1625896-1-airlied@gmail.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: B4mVN5RciRyMT0dehsogrt47ivXDIjSaTaZpShyg6zs_1746157280
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

This adds a memcg group to ttm bo and resource objects.

This memcg is used when:
a) resource is allocated in system/tt memory
b) the account_op is set in the operation context

This patch disables the flag around object evictions,
but any operation that could populate a TTM tt object in process context
should set the account_op flag.

This v2 moves the charging up a level and also no longer uses
__GFP_ACCOUNT, or attaches the memcg to object pages, it instead
uses the same approach as socket memory and just charges/uncharges
at the object level. This was suggested by Christian.

Signed-off-by: Dave Airlie <airlied@redhat.com>
---
 drivers/gpu/drm/ttm/ttm_bo.c       |  9 +++++++--
 drivers/gpu/drm/ttm/ttm_bo_vm.c    |  3 ++-
 drivers/gpu/drm/ttm/ttm_resource.c | 20 ++++++++++++++++++++
 include/drm/ttm/ttm_bo.h           |  8 ++++++++
 include/drm/ttm/ttm_resource.h     |  6 +++++-
 5 files changed, 42 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/ttm/ttm_bo.c b/drivers/gpu/drm/ttm/ttm_bo.c
index 95b86003c50d..89d2df246ed2 100644
--- a/drivers/gpu/drm/ttm/ttm_bo.c
+++ b/drivers/gpu/drm/ttm/ttm_bo.c
@@ -537,6 +537,7 @@ static s64 ttm_bo_evict_cb(struct ttm_lru_walk *walk, s=
truct ttm_buffer_object *
 =09evict_walk->evicted++;
 =09if (evict_walk->res)
 =09=09lret =3D ttm_resource_alloc(evict_walk->evictor, evict_walk->place,
+=09=09=09=09=09  walk->ctx,
 =09=09=09=09=09  evict_walk->res, NULL);
 =09if (lret =3D=3D 0)
 =09=09return 1;
@@ -733,7 +734,7 @@ static int ttm_bo_alloc_resource(struct ttm_buffer_obje=
ct *bo,
 =09=09=09continue;
=20
 =09=09may_evict =3D (force_space && place->mem_type !=3D TTM_PL_SYSTEM);
-=09=09ret =3D ttm_resource_alloc(bo, place, res, force_space ? &limit_pool=
 : NULL);
+=09=09ret =3D ttm_resource_alloc(bo, place, ctx, res, force_space ? &limit=
_pool : NULL);
 =09=09if (ret) {
 =09=09=09if (ret !=3D -ENOSPC && ret !=3D -EAGAIN) {
 =09=09=09=09dmem_cgroup_pool_state_put(limit_pool);
@@ -744,8 +745,12 @@ static int ttm_bo_alloc_resource(struct ttm_buffer_obj=
ect *bo,
 =09=09=09=09continue;
 =09=09=09}
=20
+=09=09=09/* we don't want to account evictions at this point */
+=09=09=09bool old_ctx_account =3D ctx->account_op;
+=09=09=09ctx->account_op =3D false;
 =09=09=09ret =3D ttm_bo_evict_alloc(bdev, man, place, bo, ctx,
 =09=09=09=09=09=09 ticket, res, limit_pool);
+=09=09=09ctx->account_op =3D old_ctx_account;
 =09=09=09dmem_cgroup_pool_state_put(limit_pool);
 =09=09=09if (ret =3D=3D -EBUSY)
 =09=09=09=09continue;
@@ -1145,7 +1150,7 @@ ttm_bo_swapout_cb(struct ttm_lru_walk *walk, struct t=
tm_buffer_object *bo)
=20
 =09=09memset(&hop, 0, sizeof(hop));
 =09=09place.mem_type =3D TTM_PL_SYSTEM;
-=09=09ret =3D ttm_resource_alloc(bo, &place, &evict_mem, NULL);
+=09=09ret =3D ttm_resource_alloc(bo, &place, ctx, &evict_mem, NULL);
 =09=09if (ret)
 =09=09=09goto out;
=20
diff --git a/drivers/gpu/drm/ttm/ttm_bo_vm.c b/drivers/gpu/drm/ttm/ttm_bo_v=
m.c
index a194db83421d..163039cf40a5 100644
--- a/drivers/gpu/drm/ttm/ttm_bo_vm.c
+++ b/drivers/gpu/drm/ttm/ttm_bo_vm.c
@@ -220,7 +220,8 @@ vm_fault_t ttm_bo_vm_fault_reserved(struct vm_fault *vm=
f,
 =09=09struct ttm_operation_ctx ctx =3D {
 =09=09=09.interruptible =3D true,
 =09=09=09.no_wait_gpu =3D false,
-=09=09=09.force_alloc =3D true
+=09=09=09.force_alloc =3D true,
+=09=09=09.account_op =3D true,
 =09=09};
=20
 =09=09ttm =3D bo->ttm;
diff --git a/drivers/gpu/drm/ttm/ttm_resource.c b/drivers/gpu/drm/ttm/ttm_r=
esource.c
index 7e5a60c55813..da257678a5ba 100644
--- a/drivers/gpu/drm/ttm/ttm_resource.c
+++ b/drivers/gpu/drm/ttm/ttm_resource.c
@@ -27,6 +27,7 @@
 #include <linux/iosys-map.h>
 #include <linux/scatterlist.h>
 #include <linux/cgroup_dmem.h>
+#include <linux/memcontrol.h>
=20
 #include <drm/ttm/ttm_bo.h>
 #include <drm/ttm/ttm_placement.h>
@@ -373,12 +374,14 @@ EXPORT_SYMBOL(ttm_resource_fini);
=20
 int ttm_resource_alloc(struct ttm_buffer_object *bo,
 =09=09       const struct ttm_place *place,
+=09=09       struct ttm_operation_ctx *ctx,
 =09=09       struct ttm_resource **res_ptr,
 =09=09       struct dmem_cgroup_pool_state **ret_limit_pool)
 {
 =09struct ttm_resource_manager *man =3D
 =09=09ttm_manager_type(bo->bdev, place->mem_type);
 =09struct dmem_cgroup_pool_state *pool =3D NULL;
+=09struct mem_cgroup *memcg =3D NULL;
 =09int ret;
=20
 =09if (man->cg) {
@@ -387,13 +390,26 @@ int ttm_resource_alloc(struct ttm_buffer_object *bo,
 =09=09=09return ret;
 =09}
=20
+=09if ((place->mem_type =3D=3D TTM_PL_SYSTEM || place->mem_type =3D=3D TTM=
_PL_TT) &&
+=09    ctx->account_op && bo->memcg) {
+=09=09memcg =3D bo->memcg;
+=09=09gfp_t gfp_flags =3D GFP_USER;
+=09=09if (ctx->gfp_retry_mayfail)
+=09=09=09gfp_flags |=3D __GFP_RETRY_MAYFAIL;
+
+=09=09if (!mem_cgroup_charge_gpu(memcg, bo->base.size >> PAGE_SHIFT, gfp_f=
lags))
+=09=09=09return -ENOMEM;
+=09}
 =09ret =3D man->func->alloc(man, bo, place, res_ptr);
 =09if (ret) {
 =09=09if (pool)
 =09=09=09dmem_cgroup_uncharge(pool, bo->base.size);
+=09=09if (memcg)
+=09=09=09mem_cgroup_uncharge_gpu(memcg, bo->base.size >> PAGE_SHIFT);
 =09=09return ret;
 =09}
=20
+=09(*res_ptr)->memcg =3D memcg;
 =09(*res_ptr)->css =3D pool;
=20
 =09spin_lock(&bo->bdev->lru_lock);
@@ -407,6 +423,7 @@ void ttm_resource_free(struct ttm_buffer_object *bo, st=
ruct ttm_resource **res)
 {
 =09struct ttm_resource_manager *man;
 =09struct dmem_cgroup_pool_state *pool;
+=09struct mem_cgroup *memcg;
=20
 =09if (!*res)
 =09=09return;
@@ -416,11 +433,14 @@ void ttm_resource_free(struct ttm_buffer_object *bo, =
struct ttm_resource **res)
 =09spin_unlock(&bo->bdev->lru_lock);
=20
 =09pool =3D (*res)->css;
+=09memcg =3D (*res)->memcg;
 =09man =3D ttm_manager_type(bo->bdev, (*res)->mem_type);
 =09man->func->free(man, *res);
 =09*res =3D NULL;
 =09if (man->cg)
 =09=09dmem_cgroup_uncharge(pool, bo->base.size);
+=09if (memcg)
+=09=09mem_cgroup_uncharge_gpu(memcg, bo->base.size >> PAGE_SHIFT);
 }
 EXPORT_SYMBOL(ttm_resource_free);
=20
diff --git a/include/drm/ttm/ttm_bo.h b/include/drm/ttm/ttm_bo.h
index 903cd1030110..56a33b5f5c41 100644
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
@@ -174,6 +180,7 @@ struct ttm_bo_kmap_obj {
  * BOs share the same reservation object.
  * @force_alloc: Don't check the memory account during suspend or CPU page
  * faults. Should only be used by TTM internally.
+ * @account_op: account for any memory allocations by a bo with an memcg.
  * @resv: Reservation object to allow reserved evictions with.
  * @bytes_moved: Statistics on how many bytes have been moved.
  *
@@ -186,6 +193,7 @@ struct ttm_operation_ctx {
 =09bool gfp_retry_mayfail;
 =09bool allow_res_evict;
 =09bool force_alloc;
+=09bool account_op;
 =09struct dma_resv *resv;
 =09uint64_t bytes_moved;
 };
diff --git a/include/drm/ttm/ttm_resource.h b/include/drm/ttm/ttm_resource.=
h
index e52bba15012f..1ab515c6ec00 100644
--- a/include/drm/ttm/ttm_resource.h
+++ b/include/drm/ttm/ttm_resource.h
@@ -45,6 +45,7 @@ struct ttm_resource;
 struct ttm_place;
 struct ttm_buffer_object;
 struct ttm_placement;
+struct ttm_operation_ctx;
 struct iosys_map;
 struct io_mapping;
 struct sg_table;
@@ -245,7 +246,8 @@ struct ttm_bus_placement {
  * @placement: Placement flags.
  * @bus: Placement on io bus accessible to the CPU
  * @bo: weak reference to the BO, protected by ttm_device::lru_lock
- * @css: cgroup state this resource is charged to
+ * @css: cgroup state this resource is charged to for dmem
+ * @memcg: memory cgroup this resource is charged to for sysmem
  *
  * Structure indicating the placement and space resources used by a
  * buffer object.
@@ -264,6 +266,7 @@ struct ttm_resource {
 =09 * @lru: Least recently used list, see &ttm_resource_manager.lru
 =09 */
 =09struct ttm_lru_item lru;
+=09struct mem_cgroup *memcg;
 };
=20
 /**
@@ -444,6 +447,7 @@ void ttm_resource_fini(struct ttm_resource_manager *man=
,
=20
 int ttm_resource_alloc(struct ttm_buffer_object *bo,
 =09=09       const struct ttm_place *place,
+=09=09       struct ttm_operation_ctx *ctx,
 =09=09       struct ttm_resource **res,
 =09=09       struct dmem_cgroup_pool_state **ret_limit_pool);
 void ttm_resource_free(struct ttm_buffer_object *bo, struct ttm_resource *=
*res);
--=20
2.49.0

