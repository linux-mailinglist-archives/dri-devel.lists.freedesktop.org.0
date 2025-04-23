Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E079AA99AE5
	for <lists+dri-devel@lfdr.de>; Wed, 23 Apr 2025 23:43:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2197710E26E;
	Wed, 23 Apr 2025 21:43:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-44.mimecast.com
 (us-smtp-delivery-44.mimecast.com [207.211.30.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8373B10E26E
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Apr 2025 21:43:42 +0000 (UTC)
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-185-sZqxJF81PKqprjnWEVBeEw-1; Wed,
 23 Apr 2025 17:43:38 -0400
X-MC-Unique: sZqxJF81PKqprjnWEVBeEw-1
X-Mimecast-MFC-AGG-ID: sZqxJF81PKqprjnWEVBeEw_1745444617
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id EDEA21956088; Wed, 23 Apr 2025 21:43:36 +0000 (UTC)
Received: from dreadlord.redhat.com (unknown [10.64.136.98])
 by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id CC25C19560A3; Wed, 23 Apr 2025 21:43:34 +0000 (UTC)
From: Dave Airlie <airlied@gmail.com>
To: dri-devel@lists.freedesktop.org, tj@kernel.org, christian.koenig@amd.com
Cc: cgroups@vger.kernel.org
Subject: [PATCH 3/5] ttm: add initial memcg integration.
Date: Thu, 24 Apr 2025 07:37:05 +1000
Message-ID: <20250423214321.100440-4-airlied@gmail.com>
In-Reply-To: <20250423214321.100440-1-airlied@gmail.com>
References: <20250423214321.100440-1-airlied@gmail.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: _yyPwvgIpnz4bfUSG-3yFCapFSS2VLx53hMlkVgkRXw_1745444617
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

This adds a memcg group to ttm bo and tt objects. If this object
allocates pages directly (not from a TTM pool, so cached non-dma
pages), then they will be accounted for using __GFP_ACCOUNT,
and added to the memcg GPU statistic.

Only operations which set the account_op flag in the ttm operation
context will have this accounting happen. This patch disables the
flag around object evictions, but any operation that could populate
a TTM tt object in process context should set the account_op flag.

This doesn't account for uncached pages due to the page pool,
and it doesn't account for dma allocated pages. However for a lot
of use cases this should be a sufficient first step. Adding uncached
page support would mean hooking into memcg for the uncached pool
interactions, and I need to consider dma paths further.

Signed-off-by: Dave Airlie <airlied@redhat.com>
---
 drivers/gpu/drm/ttm/ttm_bo.c    |  4 ++++
 drivers/gpu/drm/ttm/ttm_bo_vm.c |  3 ++-
 drivers/gpu/drm/ttm/ttm_pool.c  | 19 ++++++++++++++++++-
 drivers/gpu/drm/ttm/ttm_tt.c    |  1 +
 include/drm/ttm/ttm_bo.h        |  8 ++++++++
 include/drm/ttm/ttm_tt.h        |  6 +++++-
 6 files changed, 38 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/ttm/ttm_bo.c b/drivers/gpu/drm/ttm/ttm_bo.c
index 95b86003c50d..631984fd459b 100644
--- a/drivers/gpu/drm/ttm/ttm_bo.c
+++ b/drivers/gpu/drm/ttm/ttm_bo.c
@@ -744,8 +744,12 @@ static int ttm_bo_alloc_resource(struct ttm_buffer_obj=
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
diff --git a/drivers/gpu/drm/ttm/ttm_pool.c b/drivers/gpu/drm/ttm/ttm_pool.=
c
index 83b10706ba89..934bbf2c0ff6 100644
--- a/drivers/gpu/drm/ttm/ttm_pool.c
+++ b/drivers/gpu/drm/ttm/ttm_pool.c
@@ -672,6 +672,9 @@ static void ttm_pool_free_range(struct ttm_pool *pool, =
struct ttm_tt *tt,
 =09=09=09=09tt->dma_address + i : NULL;
=20
 =09=09=09nr =3D ttm_pool_unmap_and_free(pool, p, dma_addr, caching);
+=09=09=09if (tt->page_flags & TTM_TT_FLAG_ACCOUNTED) {
+=09=09=09=09mod_memcg_state(tt->memcg, MEMCG_GPU, -nr);
+=09=09=09}
 =09=09}
 =09}
 }
@@ -742,9 +745,17 @@ static int __ttm_pool_alloc(struct ttm_pool *pool, str=
uct ttm_tt *tt,
 =09=09 * that behaviour.
 =09=09 */
 =09=09if (!p) {
+=09=09=09gfp_t account_flags =3D gfp_flags;
 =09=09=09page_caching =3D ttm_cached;
 =09=09=09allow_pools =3D false;
-=09=09=09p =3D ttm_pool_alloc_page(pool, gfp_flags, order);
+
+=09=09=09if (!pool->use_dma_alloc && tt->memcg && ctx->account_op) {
+=09=09=09=09account_flags |=3D __GFP_ACCOUNT;
+=09=09=09=09tt->page_flags |=3D TTM_TT_FLAG_ACCOUNTED;
+=09=09=09} else {
+=09=09=09=09tt->page_flags &=3D ~TTM_TT_FLAG_ACCOUNTED;
+=09=09=09}
+=09=09=09p =3D ttm_pool_alloc_page(pool, account_flags, order);
 =09=09}
 =09=09/* If that fails, lower the order if possible and retry. */
 =09=09if (!p) {
@@ -757,6 +768,12 @@ static int __ttm_pool_alloc(struct ttm_pool *pool, str=
uct ttm_tt *tt,
 =09=09=09r =3D -ENOMEM;
 =09=09=09goto error_free_all;
 =09=09}
+
+=09=09/* only deal with non-pool pages for memcg for now */
+=09=09if (tt->page_flags & TTM_TT_FLAG_ACCOUNTED) {
+=09=09=09mod_memcg_state(tt->memcg, MEMCG_GPU, (1 << order));
+=09=09}
+
 =09=09r =3D ttm_pool_page_allocated(pool, order, p, page_caching, alloc,
 =09=09=09=09=09    restore);
 =09=09if (r)
diff --git a/drivers/gpu/drm/ttm/ttm_tt.c b/drivers/gpu/drm/ttm/ttm_tt.c
index df0aa6c4b8b8..cf9852560d9b 100644
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
diff --git a/include/drm/ttm/ttm_bo.h b/include/drm/ttm/ttm_bo.h
index 903cd1030110..03e30a056427 100644
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
+ * @account_op: use __GFP_ACCOUNT for this.
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
diff --git a/include/drm/ttm/ttm_tt.h b/include/drm/ttm/ttm_tt.h
index 13cf47f3322f..23e5bcbaec3a 100644
--- a/include/drm/ttm/ttm_tt.h
+++ b/include/drm/ttm/ttm_tt.h
@@ -101,8 +101,9 @@ struct ttm_tt {
 #define TTM_TT_FLAG_EXTERNAL_MAPPABLE=09BIT(3)
 #define TTM_TT_FLAG_DECRYPTED=09=09BIT(4)
 #define TTM_TT_FLAG_BACKED_UP=09        BIT(5)
+#define TTM_TT_FLAG_ACCOUNTED=09=09BIT(6)
=20
-#define TTM_TT_FLAG_PRIV_POPULATED=09BIT(6)
+#define TTM_TT_FLAG_PRIV_POPULATED=09BIT(7)
 =09uint32_t page_flags;
 =09/** @num_pages: Number of pages in the page array. */
 =09uint32_t num_pages;
@@ -126,6 +127,9 @@ struct ttm_tt {
 =09enum ttm_caching caching;
 =09/** @restore: Partial restoration from backup state. TTM private */
 =09struct ttm_pool_tt_restore *restore;
+
+=09/** @memcg: Memory cgroup to account this to */
+=09struct mem_cgroup *memcg;
 };
=20
 /**
--=20
2.49.0

