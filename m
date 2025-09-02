Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 24534B3F373
	for <lists+dri-devel@lfdr.de>; Tue,  2 Sep 2025 06:11:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5246510E56A;
	Tue,  2 Sep 2025 04:11:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-44.mimecast.com
 (us-smtp-delivery-44.mimecast.com [205.139.111.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7DD2F10E56A
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Sep 2025 04:10:59 +0000 (UTC)
Received: from mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-48-2is1IQxdPWi9CTZsmgZt0Q-1; Tue,
 02 Sep 2025 00:10:55 -0400
X-MC-Unique: 2is1IQxdPWi9CTZsmgZt0Q-1
X-Mimecast-MFC-AGG-ID: 2is1IQxdPWi9CTZsmgZt0Q_1756786253
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id D7AE61956095; Tue,  2 Sep 2025 04:10:52 +0000 (UTC)
Received: from dreadlord.redhat.com (unknown [10.67.32.135])
 by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id DC70730001A2; Tue,  2 Sep 2025 04:10:45 +0000 (UTC)
From: Dave Airlie <airlied@gmail.com>
To: dri-devel@lists.freedesktop.org, tj@kernel.org, christian.koenig@amd.com,
 Johannes Weiner <hannes@cmpxchg.org>, Michal Hocko <mhocko@kernel.org>,
 Roman Gushchin <roman.gushchin@linux.dev>,
 Shakeel Butt <shakeel.butt@linux.dev>, Muchun Song <muchun.song@linux.dev>
Cc: cgroups@vger.kernel.org, Dave Chinner <david@fromorbit.com>,
 Waiman Long <longman@redhat.com>, simona@ffwll.ch
Subject: [PATCH 02/15] drm/ttm: use gpu mm stats to track gpu memory
 allocations. (v4)
Date: Tue,  2 Sep 2025 14:06:41 +1000
Message-ID: <20250902041024.2040450-3-airlied@gmail.com>
In-Reply-To: <20250902041024.2040450-1-airlied@gmail.com>
References: <20250902041024.2040450-1-airlied@gmail.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: NWaDbn-oKOO_ibb9kQgQy3FnxG2bhby5xrSHkLIVImM_1756786253
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
v4: use mod_lruvec_page_state (Shakeel)
---
 drivers/gpu/drm/ttm/ttm_pool.c | 21 +++++++++++++++------
 1 file changed, 15 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/ttm/ttm_pool.c b/drivers/gpu/drm/ttm/ttm_pool.=
c
index baf27c70a419..148c7530738d 100644
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
+=09=09=09mod_lruvec_page_state(p, NR_GPU_ACTIVE, 1 << order);
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
@@ -201,6 +203,8 @@ static void ttm_pool_free_page(struct ttm_pool *pool, e=
num ttm_caching caching,
 #endif
=20
 =09if (!pool || !pool->use_dma_alloc) {
+=09=09mod_lruvec_page_state(p, reclaim ? NR_GPU_RECLAIM : NR_GPU_ACTIVE,
+=09=09=09=09      -(1 << order));
 =09=09__free_pages(p, order);
 =09=09return;
 =09}
@@ -288,6 +292,9 @@ static void ttm_pool_type_give(struct ttm_pool_type *pt=
, struct page *p)
 =09list_add(&p->lru, &pt->pages);
 =09spin_unlock(&pt->lock);
 =09atomic_long_add(1 << pt->order, &allocated_pages);
+
+=09mod_lruvec_page_state(p, NR_GPU_ACTIVE, -num_pages);
+=09mod_lruvec_page_state(p, NR_GPU_RECLAIM, num_pages);
 }
=20
 /* Take pages from a specific pool_type, return NULL when nothing availabl=
e */
@@ -299,6 +306,8 @@ static struct page *ttm_pool_type_take(struct ttm_pool_=
type *pt)
 =09p =3D list_first_entry_or_null(&pt->pages, typeof(*p), lru);
 =09if (p) {
 =09=09atomic_long_sub(1 << pt->order, &allocated_pages);
+=09=09mod_lruvec_page_state(p, NR_GPU_ACTIVE, (1 << pt->order));
+=09=09mod_lruvec_page_state(p, NR_GPU_RECLAIM, -(1 << pt->order));
 =09=09list_del(&p->lru);
 =09}
 =09spin_unlock(&pt->lock);
@@ -331,7 +340,7 @@ static void ttm_pool_type_fini(struct ttm_pool_type *pt=
)
 =09spin_unlock(&shrinker_lock);
=20
 =09while ((p =3D ttm_pool_type_take(pt)))
-=09=09ttm_pool_free_page(pt->pool, pt->caching, pt->order, p);
+=09=09ttm_pool_free_page(pt->pool, pt->caching, pt->order, p, true);
 }
=20
 /* Return the pool_type to use for the given caching and order */
@@ -383,7 +392,7 @@ static unsigned int ttm_pool_shrink(void)
=20
 =09p =3D ttm_pool_type_take(pt);
 =09if (p) {
-=09=09ttm_pool_free_page(pt->pool, pt->caching, pt->order, p);
+=09=09ttm_pool_free_page(pt->pool, pt->caching, pt->order, p, true);
 =09=09num_pages =3D 1 << pt->order;
 =09} else {
 =09=09num_pages =3D 0;
@@ -475,7 +484,7 @@ static pgoff_t ttm_pool_unmap_and_free(struct ttm_pool =
*pool, struct page *page,
 =09if (pt)
 =09=09ttm_pool_type_give(pt, page);
 =09else
-=09=09ttm_pool_free_page(pool, caching, order, page);
+=09=09ttm_pool_free_page(pool, caching, order, page, false);
=20
 =09return nr;
 }
@@ -780,7 +789,7 @@ static int __ttm_pool_alloc(struct ttm_pool *pool, stru=
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
2.50.1

