Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F2FFB0359A
	for <lists+dri-devel@lfdr.de>; Mon, 14 Jul 2025 07:23:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 720AC10E20F;
	Mon, 14 Jul 2025 05:23:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-44.mimecast.com
 (us-smtp-delivery-44.mimecast.com [205.139.111.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8EFAD10E20F
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Jul 2025 05:23:18 +0000 (UTC)
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-184-aDS3qAOSNSGK5Rr84Iljaw-1; Mon,
 14 Jul 2025 01:23:14 -0400
X-MC-Unique: aDS3qAOSNSGK5Rr84Iljaw-1
X-Mimecast-MFC-AGG-ID: aDS3qAOSNSGK5Rr84Iljaw_1752470592
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 4F3CB195608F; Mon, 14 Jul 2025 05:23:12 +0000 (UTC)
Received: from dreadlord.redhat.com (unknown [10.67.32.31])
 by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id A41A91977000; Mon, 14 Jul 2025 05:23:06 +0000 (UTC)
From: Dave Airlie <airlied@gmail.com>
To: dri-devel@lists.freedesktop.org, linux-mm@kvack.org,
 Johannes Weiner <hannes@cmpxchg.org>,
 Christian Koenig <christian.koenig@amd.com>
Cc: Dave Chinner <david@fromorbit.com>, Kairui Song <kasong@tencent.com>,
 Dave Airlie <airlied@redhat.com>, Matthew Brost <matthew.brost@intel.com>,
 Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH 02/18] drm/ttm: use gpu mm stats to track gpu memory
 allocations. (v3)
Date: Mon, 14 Jul 2025 15:18:17 +1000
Message-ID: <20250714052243.1149732-3-airlied@gmail.com>
In-Reply-To: <20250714052243.1149732-1-airlied@gmail.com>
References: <20250714052243.1149732-1-airlied@gmail.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: mGXohN5prTV9uMHBl3oVrNRcWGBQom3_whNPufKBWQ0_1752470592
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
v2: add reclaim parameters and adjust the right counters.
v3: drop the nid helper and get it from page.
---
 drivers/gpu/drm/ttm/ttm_pool.c | 25 +++++++++++++++++++------
 1 file changed, 19 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/ttm/ttm_pool.c b/drivers/gpu/drm/ttm/ttm_pool.=
c
index baf27c70a419..ee2344089d47 100644
--- a/drivers/gpu/drm/ttm/ttm_pool.c
+++ b/drivers/gpu/drm/ttm/ttm_pool.c
@@ -150,8 +150,10 @@ static struct page *ttm_pool_alloc_page(struct ttm_poo=
l *pool, gfp_t gfp_flags,
=20
 =09if (!pool->use_dma_alloc) {
 =09=09p =3D alloc_pages_node(pool->nid, gfp_flags, order);
-=09=09if (p)
+=09=09if (p) {
 =09=09=09p->private =3D order;
+=09=09=09mod_node_page_state(NODE_DATA(page_to_nid(p)), NR_GPU_ACTIVE, (1 =
<< order));
+=09=09}
 =09=09return p;
 =09}
=20
@@ -186,7 +188,7 @@ static struct page *ttm_pool_alloc_page(struct ttm_pool=
 *pool, gfp_t gfp_flags,
=20
 /* Reset the caching and pages of size 1 << order */
 static void ttm_pool_free_page(struct ttm_pool *pool, enum ttm_caching cac=
hing,
-=09=09=09       unsigned int order, struct page *p)
+=09=09=09       unsigned int order, struct page *p, bool reclaim)
 {
 =09unsigned long attr =3D DMA_ATTR_FORCE_CONTIGUOUS;
 =09struct ttm_pool_dma *dma;
@@ -201,6 +203,9 @@ static void ttm_pool_free_page(struct ttm_pool *pool, e=
num ttm_caching caching,
 #endif
=20
 =09if (!pool || !pool->use_dma_alloc) {
+=09=09mod_node_page_state(NODE_DATA(page_to_nid(p)),
+=09=09=09=09    reclaim ? NR_GPU_RECLAIM : NR_GPU_ACTIVE,
+=09=09=09=09    -(1 << order));
 =09=09__free_pages(p, order);
 =09=09return;
 =09}
@@ -276,6 +281,7 @@ static void ttm_pool_unmap(struct ttm_pool *pool, dma_a=
ddr_t dma_addr,
 static void ttm_pool_type_give(struct ttm_pool_type *pt, struct page *p)
 {
 =09unsigned int i, num_pages =3D 1 << pt->order;
+=09int nid =3D page_to_nid(p);
=20
 =09for (i =3D 0; i < num_pages; ++i) {
 =09=09if (PageHighMem(p))
@@ -288,17 +294,24 @@ static void ttm_pool_type_give(struct ttm_pool_type *=
pt, struct page *p)
 =09list_add(&p->lru, &pt->pages);
 =09spin_unlock(&pt->lock);
 =09atomic_long_add(1 << pt->order, &allocated_pages);
+
+=09mod_node_page_state(NODE_DATA(nid), NR_GPU_ACTIVE, -num_pages);
+=09mod_node_page_state(NODE_DATA(nid), NR_GPU_RECLAIM, num_pages);
 }
=20
 /* Take pages from a specific pool_type, return NULL when nothing availabl=
e */
 static struct page *ttm_pool_type_take(struct ttm_pool_type *pt)
 {
 =09struct page *p;
+=09int nid;
=20
 =09spin_lock(&pt->lock);
 =09p =3D list_first_entry_or_null(&pt->pages, typeof(*p), lru);
 =09if (p) {
+=09=09nid =3D page_to_nid(p);
 =09=09atomic_long_sub(1 << pt->order, &allocated_pages);
+=09=09mod_node_page_state(NODE_DATA(nid), NR_GPU_ACTIVE, (1 << pt->order))=
;
+=09=09mod_node_page_state(NODE_DATA(nid), NR_GPU_RECLAIM, -(1 << pt->order=
));
 =09=09list_del(&p->lru);
 =09}
 =09spin_unlock(&pt->lock);
@@ -331,7 +344,7 @@ static void ttm_pool_type_fini(struct ttm_pool_type *pt=
)
 =09spin_unlock(&shrinker_lock);
=20
 =09while ((p =3D ttm_pool_type_take(pt)))
-=09=09ttm_pool_free_page(pt->pool, pt->caching, pt->order, p);
+=09=09ttm_pool_free_page(pt->pool, pt->caching, pt->order, p, true);
 }
=20
 /* Return the pool_type to use for the given caching and order */
@@ -383,7 +396,7 @@ static unsigned int ttm_pool_shrink(void)
=20
 =09p =3D ttm_pool_type_take(pt);
 =09if (p) {
-=09=09ttm_pool_free_page(pt->pool, pt->caching, pt->order, p);
+=09=09ttm_pool_free_page(pt->pool, pt->caching, pt->order, p, true);
 =09=09num_pages =3D 1 << pt->order;
 =09} else {
 =09=09num_pages =3D 0;
@@ -475,7 +488,7 @@ static pgoff_t ttm_pool_unmap_and_free(struct ttm_pool =
*pool, struct page *page,
 =09if (pt)
 =09=09ttm_pool_type_give(pt, page);
 =09else
-=09=09ttm_pool_free_page(pool, caching, order, page);
+=09=09ttm_pool_free_page(pool, caching, order, page, false);
=20
 =09return nr;
 }
@@ -780,7 +793,7 @@ static int __ttm_pool_alloc(struct ttm_pool *pool, stru=
ct ttm_tt *tt,
 =09return 0;
=20
 error_free_page:
-=09ttm_pool_free_page(pool, page_caching, order, p);
+=09ttm_pool_free_page(pool, page_caching, order, p, false);
=20
 error_free_all:
 =09if (tt->restore)
--=20
2.49.0

