Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ECVMJJ0InWk7MgQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 24 Feb 2026 03:10:37 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 43BD7180E70
	for <lists+dri-devel@lfdr.de>; Tue, 24 Feb 2026 03:10:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 98BD410E476;
	Tue, 24 Feb 2026 02:10:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-44.mimecast.com
 (us-smtp-delivery-44.mimecast.com [205.139.111.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 78B7910E476
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Feb 2026 02:10:33 +0000 (UTC)
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-516-3MY_nYcUMUGdFEo8MIuCQQ-1; Mon,
 23 Feb 2026 21:10:28 -0500
X-MC-Unique: 3MY_nYcUMUGdFEo8MIuCQQ-1
X-Mimecast-MFC-AGG-ID: 3MY_nYcUMUGdFEo8MIuCQQ_1771899027
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id DBD1418001DE; Tue, 24 Feb 2026 02:10:26 +0000 (UTC)
Received: from dreadlord.taild9177d.ts.net (unknown [10.67.32.38])
 by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id A811D30001BB; Tue, 24 Feb 2026 02:10:20 +0000 (UTC)
From: Dave Airlie <airlied@gmail.com>
To: dri-devel@lists.freedesktop.org, tj@kernel.org, christian.koenig@amd.com,
 Johannes Weiner <hannes@cmpxchg.org>, Michal Hocko <mhocko@kernel.org>,
 Roman Gushchin <roman.gushchin@linux.dev>,
 Shakeel Butt <shakeel.butt@linux.dev>, Muchun Song <muchun.song@linux.dev>
Cc: cgroups@vger.kernel.org, Dave Chinner <david@fromorbit.com>,
 Waiman Long <longman@redhat.com>, simona@ffwll.ch
Subject: [PATCH 11/16] ttm/pool: enable memcg tracking and shrinker. (v3)
Date: Tue, 24 Feb 2026 12:06:28 +1000
Message-ID: <20260224020854.791201-12-airlied@gmail.com>
In-Reply-To: <20260224020854.791201-1-airlied@gmail.com>
References: <20260224020854.791201-1-airlied@gmail.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 9WsokPPQevehw9PU6WwKlMfqP6Gp0nNO-tVvyKtY3HU_1771899027
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
	NEURAL_HAM(-0.00)[-0.953];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 43BD7180E70
X-Rspamd-Action: no action

From: Dave Airlie <airlied@redhat.com>

This enables all the backend code to use the list lru in memcg mode,
and set the shrinker to be memcg aware.

It adds the loop case for when pooled pages end up being reparented
to a higher memcg group, that newer memcg can search for them there
and take them back.

Signed-off-by: Dave Airlie <airlied@redhat.com>

---
v2: just use the proper stats.
v3: fix objcg check to return void
---
 drivers/gpu/drm/ttm/ttm_pool.c | 126 +++++++++++++++++++++++++++------
 mm/list_lru.c                  |   1 +
 2 files changed, 104 insertions(+), 23 deletions(-)

diff --git a/drivers/gpu/drm/ttm/ttm_pool.c b/drivers/gpu/drm/ttm/ttm_pool.=
c
index 401f53244f96..4b0c7d70b60f 100644
--- a/drivers/gpu/drm/ttm/ttm_pool.c
+++ b/drivers/gpu/drm/ttm/ttm_pool.c
@@ -144,7 +144,9 @@ static int ttm_pool_nid(struct ttm_pool *pool)
 }
=20
 /* Allocate pages of size 1 << order with the given gfp_flags */
-static struct page *ttm_pool_alloc_page(struct ttm_pool *pool, gfp_t gfp_f=
lags,
+static struct page *ttm_pool_alloc_page(struct ttm_pool *pool,
+=09=09=09=09=09struct obj_cgroup *objcg,
+=09=09=09=09=09gfp_t gfp_flags,
 =09=09=09=09=09unsigned int order)
 {
 =09const unsigned int beneficial_order =3D ttm_pool_beneficial_order(pool)=
;
@@ -172,7 +174,10 @@ static struct page *ttm_pool_alloc_page(struct ttm_poo=
l *pool, gfp_t gfp_flags,
 =09=09p =3D alloc_pages_node(pool->nid, gfp_flags, order);
 =09=09if (p) {
 =09=09=09p->private =3D order;
-=09=09=09mod_lruvec_page_state(p, NR_GPU_ACTIVE, 1 << order);
+=09=09=09if (!mem_cgroup_charge_gpu_page(objcg, p, order, gfp_flags, false=
)) {
+=09=09=09=09__free_pages(p, order);
+=09=09=09=09return NULL;
+=09=09=09}
 =09=09}
 =09=09return p;
 =09}
@@ -223,8 +228,7 @@ static void ttm_pool_free_page(struct ttm_pool *pool, e=
num ttm_caching caching,
 #endif
=20
 =09if (!pool || !ttm_pool_uses_dma_alloc(pool)) {
-=09=09mod_lruvec_page_state(p, reclaim ? NR_GPU_RECLAIM : NR_GPU_ACTIVE,
-=09=09=09=09      -(1 << order));
+=09=09mem_cgroup_uncharge_gpu_page(p, order, reclaim);
 =09=09__free_pages(p, order);
 =09=09return;
 =09}
@@ -311,12 +315,11 @@ static void ttm_pool_type_give(struct ttm_pool_type *=
pt, struct page *p)
=20
 =09INIT_LIST_HEAD(&p->lru);
 =09rcu_read_lock();
-=09list_lru_add(&pt->pages, &p->lru, nid, NULL);
+=09list_lru_add(&pt->pages, &p->lru, nid, page_memcg_check(p));
 =09rcu_read_unlock();
=20
 =09atomic_long_add(num_pages, &allocated_pages[nid]);
-=09mod_lruvec_page_state(p, NR_GPU_ACTIVE, -num_pages);
-=09mod_lruvec_page_state(p, NR_GPU_RECLAIM, num_pages);
+=09mem_cgroup_move_gpu_page_reclaim(NULL, p, pt->order, true);
 }
=20
 static enum lru_status take_one_from_lru(struct list_head *item,
@@ -331,20 +334,56 @@ static enum lru_status take_one_from_lru(struct list_=
head *item,
 =09return LRU_REMOVED;
 }
=20
-/* Take pages from a specific pool_type, return NULL when nothing availabl=
e */
-static struct page *ttm_pool_type_take(struct ttm_pool_type *pt, int nid)
+static int pool_lru_get_page(struct ttm_pool_type *pt, int nid,
+=09=09=09     struct page **page_out,
+=09=09=09     struct obj_cgroup *objcg,
+=09=09=09     struct mem_cgroup *memcg)
 {
 =09int ret;
 =09struct page *p =3D NULL;
 =09unsigned long nr_to_walk =3D 1;
+=09unsigned int num_pages =3D 1 << pt->order;
=20
-=09ret =3D list_lru_walk_node(&pt->pages, nid, take_one_from_lru, (void *)=
&p, &nr_to_walk);
+=09ret =3D list_lru_walk_one(&pt->pages, nid, memcg, take_one_from_lru, (v=
oid *)&p, &nr_to_walk);
 =09if (ret =3D=3D 1 && p) {
-=09=09atomic_long_sub(1 << pt->order, &allocated_pages[nid]);
-=09=09mod_lruvec_page_state(p, NR_GPU_ACTIVE, (1 << pt->order));
-=09=09mod_lruvec_page_state(p, NR_GPU_RECLAIM, -(1 << pt->order));
+=09=09atomic_long_sub(num_pages, &allocated_pages[nid]);
+
+=09=09if (!mem_cgroup_move_gpu_page_reclaim(objcg, p, pt->order, false)) {
+=09=09=09__free_pages(p, pt->order);
+=09=09=09p =3D NULL;
+=09=09}
 =09}
-=09return p;
+=09*page_out =3D p;
+=09return ret;
+}
+
+/* Take pages from a specific pool_type, return NULL when nothing availabl=
e */
+static struct page *ttm_pool_type_take(struct ttm_pool_type *pt, int nid,
+=09=09=09=09       struct obj_cgroup *orig_objcg)
+{
+=09struct page *page_out =3D NULL;
+=09int ret;
+=09struct mem_cgroup *orig_memcg =3D orig_objcg ? get_mem_cgroup_from_objc=
g(orig_objcg) : NULL;
+=09struct mem_cgroup *memcg =3D orig_memcg;
+
+=09/*
+=09 * Attempt to get a page from the current memcg, but if it hasn't got a=
ny in it's level,
+=09 * go up to the parent and check there. This helps the scenario where m=
ultiple apps get
+=09 * started into their own cgroup from a common parent and want to reuse=
 the pools.
+=09 */
+=09while (!page_out) {
+=09=09ret =3D pool_lru_get_page(pt, nid, &page_out, orig_objcg, memcg);
+=09=09if (ret =3D=3D 1)
+=09=09=09break;
+=09=09if (!memcg)
+=09=09=09break;
+=09=09memcg =3D parent_mem_cgroup(memcg);
+=09=09if (!memcg)
+=09=09=09break;
+=09}
+
+=09mem_cgroup_put(orig_memcg);
+=09return page_out;
 }
=20
 /* Initialize and add a pool type to the global shrinker list */
@@ -354,7 +393,7 @@ static void ttm_pool_type_init(struct ttm_pool_type *pt=
, struct ttm_pool *pool,
 =09pt->pool =3D pool;
 =09pt->caching =3D caching;
 =09pt->order =3D order;
-=09list_lru_init(&pt->pages);
+=09list_lru_init_memcg(&pt->pages, mm_shrinker);
=20
 =09spin_lock(&shrinker_lock);
 =09list_add_tail(&pt->shrinker_list, &shrinker_list);
@@ -397,6 +436,31 @@ static void ttm_pool_type_fini(struct ttm_pool_type *p=
t)
 =09ttm_pool_dispose_list(pt, &dispose);
 }
=20
+/*
+ * This function doesn't currently check dma32, because no driver using th=
is
+ * support dma32. This should be added and debugged when that changes.
+ */
+static void ttm_pool_check_objcg(struct obj_cgroup *objcg)
+{
+#ifdef CONFIG_MEMCG
+=09int r =3D 0;
+=09struct mem_cgroup *memcg;
+=09if (!objcg)
+=09=09return;
+
+=09memcg =3D get_mem_cgroup_from_objcg(objcg);
+=09for (unsigned i =3D 0; i < NR_PAGE_ORDERS; i++) {
+=09=09r =3D memcg_list_lru_alloc(memcg, &global_write_combined[i].pages, G=
FP_KERNEL);
+=09=09if (r)
+=09=09=09break;
+=09=09r =3D memcg_list_lru_alloc(memcg, &global_uncached[i].pages, GFP_KER=
NEL);
+=09=09if (r)
+=09=09=09break;
+=09}
+=09mem_cgroup_put(memcg);
+#endif
+}
+
 /* Return the pool_type to use for the given caching and order */
 static struct ttm_pool_type *ttm_pool_select_type(struct ttm_pool *pool,
 =09=09=09=09=09=09  enum ttm_caching caching,
@@ -426,7 +490,9 @@ static struct ttm_pool_type *ttm_pool_select_type(struc=
t ttm_pool *pool,
 }
=20
 /* Free pages using the per-node shrinker list */
-static unsigned int ttm_pool_shrink(int nid, unsigned long num_to_free)
+static unsigned int ttm_pool_shrink(int nid,
+=09=09=09=09    struct mem_cgroup *memcg,
+=09=09=09=09    unsigned long num_to_free)
 {
 =09LIST_HEAD(dispose);
 =09struct ttm_pool_type *pt;
@@ -438,7 +504,11 @@ static unsigned int ttm_pool_shrink(int nid, unsigned =
long num_to_free)
 =09list_move_tail(&pt->shrinker_list, &shrinker_list);
 =09spin_unlock(&shrinker_lock);
=20
-=09num_pages =3D list_lru_walk_node(&pt->pages, nid, pool_move_to_dispose_=
list, &dispose, &num_to_free);
+=09if (!memcg) {
+=09=09num_pages =3D list_lru_walk_node(&pt->pages, nid, pool_move_to_dispo=
se_list, &dispose, &num_to_free);
+=09} else {
+=09=09num_pages =3D list_lru_walk_one(&pt->pages, nid, memcg, pool_move_to=
_dispose_list, &dispose, &num_to_free);
+=09}
 =09num_pages *=3D 1 << pt->order;
=20
 =09ttm_pool_dispose_list(pt, &dispose);
@@ -603,6 +673,7 @@ static int ttm_pool_restore_commit(struct ttm_pool_tt_r=
estore *restore,
 =09=09=09 */
 =09=09=09ttm_pool_split_for_swap(restore->pool, p);
 =09=09=09copy_highpage(restore->alloced_page + i, p);
+=09=09=09p->memcg_data =3D 0;
 =09=09=09__free_pages(p, 0);
 =09=09}
=20
@@ -764,6 +835,7 @@ static int __ttm_pool_alloc(struct ttm_pool *pool, stru=
ct ttm_tt *tt,
 =09bool allow_pools;
 =09struct page *p;
 =09int r;
+=09struct obj_cgroup *objcg =3D memcg_account ? tt->objcg : NULL;
=20
 =09WARN_ON(!alloc->remaining_pages || ttm_tt_is_populated(tt));
 =09WARN_ON(alloc->dma_addr && !pool->dev);
@@ -781,6 +853,9 @@ static int __ttm_pool_alloc(struct ttm_pool *pool, stru=
ct ttm_tt *tt,
=20
 =09page_caching =3D tt->caching;
 =09allow_pools =3D true;
+
+=09ttm_pool_check_objcg(objcg);
+
 =09for (order =3D ttm_pool_alloc_find_order(MAX_PAGE_ORDER, alloc);
 =09     alloc->remaining_pages;
 =09     order =3D ttm_pool_alloc_find_order(order, alloc)) {
@@ -790,7 +865,7 @@ static int __ttm_pool_alloc(struct ttm_pool *pool, stru=
ct ttm_tt *tt,
 =09=09p =3D NULL;
 =09=09pt =3D ttm_pool_select_type(pool, page_caching, order);
 =09=09if (pt && allow_pools)
-=09=09=09p =3D ttm_pool_type_take(pt, ttm_pool_nid(pool));
+=09=09=09p =3D ttm_pool_type_take(pt, ttm_pool_nid(pool), objcg);
=20
 =09=09/*
 =09=09 * If that fails or previously failed, allocate from system.
@@ -801,7 +876,7 @@ static int __ttm_pool_alloc(struct ttm_pool *pool, stru=
ct ttm_tt *tt,
 =09=09if (!p) {
 =09=09=09page_caching =3D ttm_cached;
 =09=09=09allow_pools =3D false;
-=09=09=09p =3D ttm_pool_alloc_page(pool, gfp_flags, order);
+=09=09=09p =3D ttm_pool_alloc_page(pool, objcg, gfp_flags, order);
 =09=09}
 =09=09/* If that fails, lower the order if possible and retry. */
 =09=09if (!p) {
@@ -947,7 +1022,7 @@ void ttm_pool_free(struct ttm_pool *pool, struct ttm_t=
t *tt)
=20
 =09while (atomic_long_read(&allocated_pages[nid]) > pool_node_limit[nid]) =
{
 =09=09unsigned long diff =3D atomic_long_read(&allocated_pages[nid]) - poo=
l_node_limit[nid];
-=09=09ttm_pool_shrink(nid, diff);
+=09=09ttm_pool_shrink(nid, NULL, diff);
 =09}
 }
 EXPORT_SYMBOL(ttm_pool_free);
@@ -1067,6 +1142,7 @@ long ttm_pool_backup(struct ttm_pool *pool, struct tt=
m_tt *tt,
 =09=09=09if (flags->purge) {
 =09=09=09=09shrunken +=3D num_pages;
 =09=09=09=09page->private =3D 0;
+=09=09=09=09page->memcg_data =3D 0;
 =09=09=09=09__free_pages(page, order);
 =09=09=09=09memset(tt->pages + i, 0,
 =09=09=09=09       num_pages * sizeof(*tt->pages));
@@ -1201,10 +1277,14 @@ static unsigned long ttm_pool_shrinker_scan(struct =
shrinker *shrink,
 =09=09=09=09=09    struct shrink_control *sc)
 {
 =09unsigned long num_freed =3D 0;
+=09int num_pools;
+=09spin_lock(&shrinker_lock);
+=09num_pools =3D list_count_nodes(&shrinker_list);
+=09spin_unlock(&shrinker_lock);
=20
 =09do
-=09=09num_freed +=3D ttm_pool_shrink(sc->nid, sc->nr_to_scan);
-=09while (num_freed < sc->nr_to_scan &&
+=09=09num_freed +=3D ttm_pool_shrink(sc->nid, sc->memcg, sc->nr_to_scan);
+=09while (num_pools-- >=3D 0 && num_freed < sc->nr_to_scan &&
 =09       atomic_long_read(&allocated_pages[sc->nid]));
=20
 =09sc->nr_scanned =3D num_freed;
@@ -1393,7 +1473,7 @@ int ttm_pool_mgr_init(unsigned long num_pages)
 =09spin_lock_init(&shrinker_lock);
 =09INIT_LIST_HEAD(&shrinker_list);
=20
-=09mm_shrinker =3D shrinker_alloc(SHRINKER_NUMA_AWARE, "drm-ttm_pool");
+=09mm_shrinker =3D shrinker_alloc(SHRINKER_MEMCG_AWARE | SHRINKER_NUMA_AWA=
RE, "drm-ttm_pool");
 =09if (!mm_shrinker)
 =09=09return -ENOMEM;
=20
diff --git a/mm/list_lru.c b/mm/list_lru.c
index dd29bcf8eb5f..7834549ac6a0 100644
--- a/mm/list_lru.c
+++ b/mm/list_lru.c
@@ -562,6 +562,7 @@ int memcg_list_lru_alloc(struct mem_cgroup *memcg, stru=
ct list_lru *lru,
=20
 =09return xas_error(&xas);
 }
+EXPORT_SYMBOL_GPL(memcg_list_lru_alloc);
 #else
 static inline void memcg_init_list_lru(struct list_lru *lru, bool memcg_aw=
are)
 {
--=20
2.52.0

