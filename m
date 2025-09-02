Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 61152B3F37A
	for <lists+dri-devel@lfdr.de>; Tue,  2 Sep 2025 06:11:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C10810E56F;
	Tue,  2 Sep 2025 04:11:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-44.mimecast.com
 (us-smtp-delivery-44.mimecast.com [205.139.111.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E7E010E56F
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Sep 2025 04:11:28 +0000 (UTC)
Received: from mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-122-trWeTjQkMFC9oF7hPIimbA-1; Tue,
 02 Sep 2025 00:11:25 -0400
X-MC-Unique: trWeTjQkMFC9oF7hPIimbA-1
X-Mimecast-MFC-AGG-ID: trWeTjQkMFC9oF7hPIimbA_1756786283
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 7C5BD195609F; Tue,  2 Sep 2025 04:11:23 +0000 (UTC)
Received: from dreadlord.redhat.com (unknown [10.67.32.135])
 by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id E31FF30001A2; Tue,  2 Sep 2025 04:11:16 +0000 (UTC)
From: Dave Airlie <airlied@gmail.com>
To: dri-devel@lists.freedesktop.org, tj@kernel.org, christian.koenig@amd.com,
 Johannes Weiner <hannes@cmpxchg.org>, Michal Hocko <mhocko@kernel.org>,
 Roman Gushchin <roman.gushchin@linux.dev>,
 Shakeel Butt <shakeel.butt@linux.dev>, Muchun Song <muchun.song@linux.dev>
Cc: cgroups@vger.kernel.org, Dave Chinner <david@fromorbit.com>,
 Waiman Long <longman@redhat.com>, simona@ffwll.ch
Subject: [PATCH 06/15] ttm/pool: track allocated_pages per numa node.
Date: Tue,  2 Sep 2025 14:06:45 +1000
Message-ID: <20250902041024.2040450-7-airlied@gmail.com>
In-Reply-To: <20250902041024.2040450-1-airlied@gmail.com>
References: <20250902041024.2040450-1-airlied@gmail.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 9oCkMFSbO5sQeONfkfkjUsHUUHYzIrjdUXkmyWBLLZs_1756786283
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

This gets the memory sizes from the nodes and stores the limit
as 50% of those. I think eventually we should drop the limits
once we have memcg aware shrinking, but this should be more NUMA
friendly, and I think seems like what people would prefer to
happen on NUMA aware systems.

Cc: Christian Koenig <christian.koenig@amd.com>
Signed-off-by: Dave Airlie <airlied@redhat.com>
---
 drivers/gpu/drm/ttm/ttm_pool.c | 60 +++++++++++++++++++++++++---------
 1 file changed, 45 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/ttm/ttm_pool.c b/drivers/gpu/drm/ttm/ttm_pool.=
c
index ae46aa370545..bd08667c9cfb 100644
--- a/drivers/gpu/drm/ttm/ttm_pool.c
+++ b/drivers/gpu/drm/ttm/ttm_pool.c
@@ -115,10 +115,11 @@ struct ttm_pool_tt_restore {
=20
 static unsigned long page_pool_size;
=20
-MODULE_PARM_DESC(page_pool_size, "Number of pages in the WC/UC/DMA pool");
+MODULE_PARM_DESC(page_pool_size, "Number of pages in the WC/UC/DMA pool pe=
r NUMA node");
 module_param(page_pool_size, ulong, 0644);
=20
-static atomic_long_t allocated_pages;
+static unsigned long pool_node_limit[MAX_NUMNODES];
+static atomic_long_t allocated_pages[MAX_NUMNODES];
=20
 static struct ttm_pool_type global_write_combined[NR_PAGE_ORDERS];
 static struct ttm_pool_type global_uncached[NR_PAGE_ORDERS];
@@ -289,6 +290,7 @@ static void ttm_pool_unmap(struct ttm_pool *pool, dma_a=
ddr_t dma_addr,
 static void ttm_pool_type_give(struct ttm_pool_type *pt, struct page *p)
 {
 =09unsigned int i, num_pages =3D 1 << pt->order;
+=09int nid =3D page_to_nid(p);
=20
 =09for (i =3D 0; i < num_pages; ++i) {
 =09=09if (PageHighMem(p))
@@ -299,10 +301,10 @@ static void ttm_pool_type_give(struct ttm_pool_type *=
pt, struct page *p)
=20
 =09INIT_LIST_HEAD(&p->lru);
 =09rcu_read_lock();
-=09list_lru_add(&pt->pages, &p->lru, page_to_nid(p), NULL);
+=09list_lru_add(&pt->pages, &p->lru, nid, NULL);
 =09rcu_read_unlock();
-=09atomic_long_add(1 << pt->order, &allocated_pages);
=20
+=09atomic_long_add(num_pages, &allocated_pages[nid]);=09
 =09mod_lruvec_page_state(p, NR_GPU_ACTIVE, -num_pages);
 =09mod_lruvec_page_state(p, NR_GPU_RECLAIM, num_pages);
 }
@@ -328,7 +330,7 @@ static struct page *ttm_pool_type_take(struct ttm_pool_=
type *pt, int nid)
=20
 =09ret =3D list_lru_walk_node(&pt->pages, nid, take_one_from_lru, (void *)=
&p, &nr_to_walk);
 =09if (ret =3D=3D 1 && p) {
-=09=09atomic_long_sub(1 << pt->order, &allocated_pages);
+=09=09atomic_long_sub(1 << pt->order, &allocated_pages[nid]);
 =09=09mod_lruvec_page_state(p, NR_GPU_ACTIVE, (1 << pt->order));
 =09=09mod_lruvec_page_state(p, NR_GPU_RECLAIM, -(1 << pt->order));=09=09
 =09}
@@ -367,7 +369,7 @@ static void ttm_pool_dispose_list(struct ttm_pool_type =
*pt,
 =09=09struct page *p;
 =09=09p =3D list_first_entry(dispose, struct page, lru);
 =09=09list_del_init(&p->lru);
-=09=09atomic_long_sub(1 << pt->order, &allocated_pages);
+=09=09atomic_long_sub(1 << pt->order, &allocated_pages[page_to_nid(p)]);
 =09=09ttm_pool_free_page(pt->pool, pt->caching, pt->order, p, true);
 =09}
 }
@@ -925,11 +927,13 @@ int ttm_pool_restore_and_alloc(struct ttm_pool *pool,=
 struct ttm_tt *tt,
  */
 void ttm_pool_free(struct ttm_pool *pool, struct ttm_tt *tt)
 {
+=09int nid =3D ttm_pool_nid(pool);
+
 =09ttm_pool_free_range(pool, tt, tt->caching, 0, tt->num_pages);
=20
-=09while (atomic_long_read(&allocated_pages) > page_pool_size) {
-=09=09unsigned long diff =3D page_pool_size - atomic_long_read(&allocated_=
pages);
-=09=09ttm_pool_shrink(ttm_pool_nid(pool), diff);
+=09while (atomic_long_read(&allocated_pages[nid]) > pool_node_limit[nid]) =
{
+=09=09unsigned long diff =3D pool_node_limit[nid] - atomic_long_read(&allo=
cated_pages[nid]);
+=09=09ttm_pool_shrink(nid, diff);
 =09}
 }
 EXPORT_SYMBOL(ttm_pool_free);
@@ -1189,7 +1193,7 @@ static unsigned long ttm_pool_shrinker_scan(struct sh=
rinker *shrink,
 =09do
 =09=09num_freed +=3D ttm_pool_shrink(sc->nid, sc->nr_to_scan);
 =09while (num_freed < sc->nr_to_scan &&
-=09       atomic_long_read(&allocated_pages));
+=09       atomic_long_read(&allocated_pages[sc->nid]));
=20
 =09sc->nr_scanned =3D num_freed;
=20
@@ -1200,7 +1204,7 @@ static unsigned long ttm_pool_shrinker_scan(struct sh=
rinker *shrink,
 static unsigned long ttm_pool_shrinker_count(struct shrinker *shrink,
 =09=09=09=09=09     struct shrink_control *sc)
 {
-=09unsigned long num_pages =3D atomic_long_read(&allocated_pages);
+=09unsigned long num_pages =3D atomic_long_read(&allocated_pages[sc->nid])=
;
=20
 =09return num_pages ? num_pages : SHRINK_EMPTY;
 }
@@ -1237,8 +1241,12 @@ static void ttm_pool_debugfs_orders(struct ttm_pool_=
type *pt,
 /* Dump the total amount of allocated pages */
 static void ttm_pool_debugfs_footer(struct seq_file *m)
 {
-=09seq_printf(m, "\ntotal\t: %8lu of %8lu\n",
-=09=09   atomic_long_read(&allocated_pages), page_pool_size);
+=09int nid;
+
+=09for_each_node(nid) {
+=09=09seq_printf(m, "\ntotal node%d\t: %8lu of %8lu\n", nid,
+=09=09=09   atomic_long_read(&allocated_pages[nid]), pool_node_limit[nid])=
;
+=09}
 }
=20
 /* Dump the information for the global pools */
@@ -1332,6 +1340,22 @@ DEFINE_SHOW_ATTRIBUTE(ttm_pool_debugfs_shrink);
=20
 #endif
=20
+static inline uint64_t ttm_get_node_memory_size(int nid)
+{
+=09/* This is directly using si_meminfo_node implementation as the
+=09 * function is not exported.
+=09 */
+=09int zone_type;
+=09uint64_t managed_pages =3D 0;
+
+=09pg_data_t *pgdat =3D NODE_DATA(nid);
+
+=09for (zone_type =3D 0; zone_type < MAX_NR_ZONES; zone_type++)
+=09=09managed_pages +=3D
+=09=09=09zone_managed_pages(&pgdat->node_zones[zone_type]);
+=09return managed_pages * PAGE_SIZE;
+}
+
 /**
  * ttm_pool_mgr_init - Initialize globals
  *
@@ -1343,8 +1367,14 @@ int ttm_pool_mgr_init(unsigned long num_pages)
 {
 =09unsigned int i;
=20
-=09if (!page_pool_size)
-=09=09page_pool_size =3D num_pages;
+=09int nid;
+=09for_each_node(nid) {
+=09=09if (!page_pool_size) {
+=09=09=09uint64_t node_size =3D ttm_get_node_memory_size(nid);
+=09=09=09pool_node_limit[nid] =3D (node_size >> PAGE_SHIFT) / 2;
+=09=09} else
+=09=09=09pool_node_limit[nid] =3D page_pool_size;
+=09}
=20
 =09spin_lock_init(&shrinker_lock);
 =09INIT_LIST_HEAD(&shrinker_list);
--=20
2.50.1

