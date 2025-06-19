Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B9D6AADFE8F
	for <lists+dri-devel@lfdr.de>; Thu, 19 Jun 2025 09:20:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 30C4310E9C1;
	Thu, 19 Jun 2025 07:20:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-44.mimecast.com
 (us-smtp-delivery-44.mimecast.com [205.139.111.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE85210E9C1
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Jun 2025 07:20:54 +0000 (UTC)
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-122-MNVW0P15MbGGaBJZRMuSrA-1; Thu,
 19 Jun 2025 03:20:51 -0400
X-MC-Unique: MNVW0P15MbGGaBJZRMuSrA-1
X-Mimecast-MFC-AGG-ID: MNVW0P15MbGGaBJZRMuSrA_1750317650
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 265831955F3D; Thu, 19 Jun 2025 07:20:50 +0000 (UTC)
Received: from dreadlord.redhat.com (unknown [10.67.24.91])
 by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 62A661956094; Thu, 19 Jun 2025 07:20:43 +0000 (UTC)
From: Dave Airlie <airlied@gmail.com>
To: dri-devel@lists.freedesktop.org
Cc: Dave Airlie <airlied@redhat.com>,
 Christian Koenig <christian.koenig@amd.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Johannes Weiner <hannes@cmpxchg.org>, linux-mm@kvack.org,
 Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH 2/2] drm/ttm: use gpu mm stats to track gpu memory allocations.
Date: Thu, 19 Jun 2025 17:20:26 +1000
Message-ID: <20250619072026.635133-2-airlied@gmail.com>
In-Reply-To: <20250619072026.635133-1-airlied@gmail.com>
References: <20250619072026.635133-1-airlied@gmail.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: WAxeQ5GjTE-VruLCCoYvYzJ96K4gulsEYGAelqtyMXo_1750317650
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

This uses the newly introduced per-node gpu tracking stats,
to track GPU memory allocated via TTM and reclaimable memory in
the TTM page pools.

These stats will be useful later for system information and
later when mem cgroups are integrated.

Cc: Christian Koenig <christian.koenig@amd.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Johannes Weiner <hannes@cmpxchg.org>
Cc: linux-mm@kvack.org
Cc: Andrew Morton <akpm@linux-foundation.org>
Signed-off-by: Dave Airlie <airlied@redhat.com>
---
 drivers/gpu/drm/ttm/ttm_pool.c | 22 +++++++++++++++++++++-
 1 file changed, 21 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/ttm/ttm_pool.c b/drivers/gpu/drm/ttm/ttm_pool.=
c
index c2ea865be657..ccc3b9a13e9e 100644
--- a/drivers/gpu/drm/ttm/ttm_pool.c
+++ b/drivers/gpu/drm/ttm/ttm_pool.c
@@ -130,6 +130,16 @@ static struct list_head shrinker_list;
 static struct shrinker *mm_shrinker;
 static DECLARE_RWSEM(pool_shrink_rwsem);
=20
+/* helper to get a current valid node id from a pool */
+static int ttm_pool_nid(struct ttm_pool *pool) {
+=09int nid =3D NUMA_NO_NODE;
+=09if (pool)
+=09=09nid =3D pool->nid;
+=09if (nid =3D=3D NUMA_NO_NODE)
+=09=09nid =3D numa_node_id();
+=09return nid;
+}
+
 /* Allocate pages of size 1 << order with the given gfp_flags */
 static struct page *ttm_pool_alloc_page(struct ttm_pool *pool, gfp_t gfp_f=
lags,
 =09=09=09=09=09unsigned int order)
@@ -149,8 +159,10 @@ static struct page *ttm_pool_alloc_page(struct ttm_poo=
l *pool, gfp_t gfp_flags,
=20
 =09if (!pool->use_dma_alloc) {
 =09=09p =3D alloc_pages_node(pool->nid, gfp_flags, order);
-=09=09if (p)
+=09=09if (p) {
 =09=09=09p->private =3D order;
+=09=09=09mod_node_page_state(NODE_DATA(ttm_pool_nid(pool)), NR_GPU_ACTIVE,=
 (1 << order));
+=09=09}
 =09=09return p;
 =09}
=20
@@ -201,6 +213,7 @@ static void ttm_pool_free_page(struct ttm_pool *pool, e=
num ttm_caching caching,
=20
 =09if (!pool || !pool->use_dma_alloc) {
 =09=09__free_pages(p, order);
+=09=09mod_node_page_state(NODE_DATA(ttm_pool_nid(pool)), NR_GPU_ACTIVE, -(=
1 << order));
 =09=09return;
 =09}
=20
@@ -275,6 +288,7 @@ static void ttm_pool_unmap(struct ttm_pool *pool, dma_a=
ddr_t dma_addr,
 static void ttm_pool_type_give(struct ttm_pool_type *pt, struct page *p)
 {
 =09unsigned int i, num_pages =3D 1 << pt->order;
+=09int nid =3D ttm_pool_nid(pt->pool);
=20
 =09for (i =3D 0; i < num_pages; ++i) {
 =09=09if (PageHighMem(p))
@@ -287,17 +301,23 @@ static void ttm_pool_type_give(struct ttm_pool_type *=
pt, struct page *p)
 =09list_add(&p->lru, &pt->pages);
 =09spin_unlock(&pt->lock);
 =09atomic_long_add(1 << pt->order, &allocated_pages);
+
+=09mod_node_page_state(NODE_DATA(nid), NR_GPU_ACTIVE, -(1 << pt->order));
+=09mod_node_page_state(NODE_DATA(nid), NR_GPU_RECLAIM, (1 << pt->order));
 }
=20
 /* Take pages from a specific pool_type, return NULL when nothing availabl=
e */
 static struct page *ttm_pool_type_take(struct ttm_pool_type *pt)
 {
 =09struct page *p;
+=09int nid =3D ttm_pool_nid(pt->pool);
=20
 =09spin_lock(&pt->lock);
 =09p =3D list_first_entry_or_null(&pt->pages, typeof(*p), lru);
 =09if (p) {
 =09=09atomic_long_sub(1 << pt->order, &allocated_pages);
+=09=09mod_node_page_state(NODE_DATA(nid), NR_GPU_ACTIVE, (1 << pt->order))=
;
+=09=09mod_node_page_state(NODE_DATA(nid), NR_GPU_RECLAIM, -(1 << pt->order=
));
 =09=09list_del(&p->lru);
 =09}
 =09spin_unlock(&pt->lock);
--=20
2.49.0

