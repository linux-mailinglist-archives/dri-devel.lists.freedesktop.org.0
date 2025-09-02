Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 74297B3F375
	for <lists+dri-devel@lfdr.de>; Tue,  2 Sep 2025 06:11:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B1A4210E56B;
	Tue,  2 Sep 2025 04:11:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-44.mimecast.com
 (us-smtp-delivery-44.mimecast.com [207.211.30.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C081110E56C
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Sep 2025 04:11:06 +0000 (UTC)
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-37-sCyYUYCsNfqFUPPha0vXdA-1; Tue,
 02 Sep 2025 00:11:02 -0400
X-MC-Unique: sCyYUYCsNfqFUPPha0vXdA-1
X-Mimecast-MFC-AGG-ID: sCyYUYCsNfqFUPPha0vXdA_1756786261
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id CB63D1800280; Tue,  2 Sep 2025 04:11:00 +0000 (UTC)
Received: from dreadlord.redhat.com (unknown [10.67.32.135])
 by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id E558C3000223; Tue,  2 Sep 2025 04:10:53 +0000 (UTC)
From: Dave Airlie <airlied@gmail.com>
To: dri-devel@lists.freedesktop.org, tj@kernel.org, christian.koenig@amd.com,
 Johannes Weiner <hannes@cmpxchg.org>, Michal Hocko <mhocko@kernel.org>,
 Roman Gushchin <roman.gushchin@linux.dev>,
 Shakeel Butt <shakeel.butt@linux.dev>, Muchun Song <muchun.song@linux.dev>
Cc: cgroups@vger.kernel.org, Dave Chinner <david@fromorbit.com>,
 Waiman Long <longman@redhat.com>, simona@ffwll.ch
Subject: [PATCH 03/15] ttm/pool: port to list_lru. (v2)
Date: Tue,  2 Sep 2025 14:06:42 +1000
Message-ID: <20250902041024.2040450-4-airlied@gmail.com>
In-Reply-To: <20250902041024.2040450-1-airlied@gmail.com>
References: <20250902041024.2040450-1-airlied@gmail.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: gNUQXnEpKD84Meil8cmjAfqXtAsREtCdBnvuSwYLKaw_1756786261
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

This is an initial port of the TTM pools for
write combined and uncached pages to use the list_lru.

This makes the pool's more NUMA aware and avoids
needing separate NUMA pools (later commit enables this).

Cc: Christian Koenig <christian.koenig@amd.com>
Cc: Johannes Weiner <hannes@cmpxchg.org>
Cc: Dave Chinner <david@fromorbit.com>
Signed-off-by: Dave Airlie <airlied@redhat.com>

---
v2: drop the pt->lock, lru list has it's own lock which is sufficent.
rearrange list isolates to fix bad locking orders.
---
 drivers/gpu/drm/ttm/tests/ttm_device_test.c |  2 +-
 drivers/gpu/drm/ttm/tests/ttm_pool_test.c   | 32 ++++----
 drivers/gpu/drm/ttm/ttm_pool.c              | 91 ++++++++++++++-------
 include/drm/ttm/ttm_pool.h                  |  6 +-
 mm/list_lru.c                               |  1 +
 5 files changed, 82 insertions(+), 50 deletions(-)

diff --git a/drivers/gpu/drm/ttm/tests/ttm_device_test.c b/drivers/gpu/drm/=
ttm/tests/ttm_device_test.c
index 1621903818e5..1f207fd222bc 100644
--- a/drivers/gpu/drm/ttm/tests/ttm_device_test.c
+++ b/drivers/gpu/drm/ttm/tests/ttm_device_test.c
@@ -183,7 +183,7 @@ static void ttm_device_init_pools(struct kunit *test)
=20
 =09=09=09=09if (params->use_dma_alloc)
 =09=09=09=09=09KUNIT_ASSERT_FALSE(test,
-=09=09=09=09=09=09=09   list_empty(&pt.pages));
+=09=09=09=09=09=09=09   !list_lru_count(&pt.pages));
 =09=09=09}
 =09=09}
 =09}
diff --git a/drivers/gpu/drm/ttm/tests/ttm_pool_test.c b/drivers/gpu/drm/tt=
m/tests/ttm_pool_test.c
index 8ade53371f72..39234a3e98c4 100644
--- a/drivers/gpu/drm/ttm/tests/ttm_pool_test.c
+++ b/drivers/gpu/drm/ttm/tests/ttm_pool_test.c
@@ -248,7 +248,7 @@ static void ttm_pool_alloc_order_caching_match(struct k=
unit *test)
 =09pool =3D ttm_pool_pre_populated(test, size, caching);
=20
 =09pt =3D &pool->caching[caching].orders[order];
-=09KUNIT_ASSERT_FALSE(test, list_empty(&pt->pages));
+=09KUNIT_ASSERT_FALSE(test, !list_lru_count(&pt->pages));
=20
 =09tt =3D ttm_tt_kunit_init(test, 0, caching, size);
 =09KUNIT_ASSERT_NOT_NULL(test, tt);
@@ -256,7 +256,7 @@ static void ttm_pool_alloc_order_caching_match(struct k=
unit *test)
 =09err =3D ttm_pool_alloc(pool, tt, &simple_ctx);
 =09KUNIT_ASSERT_EQ(test, err, 0);
=20
-=09KUNIT_ASSERT_TRUE(test, list_empty(&pt->pages));
+=09KUNIT_ASSERT_TRUE(test, !list_lru_count(&pt->pages));
=20
 =09ttm_pool_free(pool, tt);
 =09ttm_tt_fini(tt);
@@ -282,8 +282,8 @@ static void ttm_pool_alloc_caching_mismatch(struct kuni=
t *test)
 =09tt =3D ttm_tt_kunit_init(test, 0, tt_caching, size);
 =09KUNIT_ASSERT_NOT_NULL(test, tt);
=20
-=09KUNIT_ASSERT_FALSE(test, list_empty(&pt_pool->pages));
-=09KUNIT_ASSERT_TRUE(test, list_empty(&pt_tt->pages));
+=09KUNIT_ASSERT_FALSE(test, !list_lru_count(&pt_pool->pages));
+=09KUNIT_ASSERT_TRUE(test, !list_lru_count(&pt_tt->pages));
=20
 =09err =3D ttm_pool_alloc(pool, tt, &simple_ctx);
 =09KUNIT_ASSERT_EQ(test, err, 0);
@@ -291,8 +291,8 @@ static void ttm_pool_alloc_caching_mismatch(struct kuni=
t *test)
 =09ttm_pool_free(pool, tt);
 =09ttm_tt_fini(tt);
=20
-=09KUNIT_ASSERT_FALSE(test, list_empty(&pt_pool->pages));
-=09KUNIT_ASSERT_FALSE(test, list_empty(&pt_tt->pages));
+=09KUNIT_ASSERT_FALSE(test, !list_lru_count(&pt_pool->pages));
+=09KUNIT_ASSERT_FALSE(test, !list_lru_count(&pt_tt->pages));
=20
 =09ttm_pool_fini(pool);
 }
@@ -316,8 +316,8 @@ static void ttm_pool_alloc_order_mismatch(struct kunit =
*test)
 =09tt =3D ttm_tt_kunit_init(test, 0, caching, snd_size);
 =09KUNIT_ASSERT_NOT_NULL(test, tt);
=20
-=09KUNIT_ASSERT_FALSE(test, list_empty(&pt_pool->pages));
-=09KUNIT_ASSERT_TRUE(test, list_empty(&pt_tt->pages));
+=09KUNIT_ASSERT_FALSE(test, !list_lru_count(&pt_pool->pages));
+=09KUNIT_ASSERT_TRUE(test, !list_lru_count(&pt_tt->pages));
=20
 =09err =3D ttm_pool_alloc(pool, tt, &simple_ctx);
 =09KUNIT_ASSERT_EQ(test, err, 0);
@@ -325,8 +325,8 @@ static void ttm_pool_alloc_order_mismatch(struct kunit =
*test)
 =09ttm_pool_free(pool, tt);
 =09ttm_tt_fini(tt);
=20
-=09KUNIT_ASSERT_FALSE(test, list_empty(&pt_pool->pages));
-=09KUNIT_ASSERT_FALSE(test, list_empty(&pt_tt->pages));
+=09KUNIT_ASSERT_FALSE(test, !list_lru_count(&pt_pool->pages));
+=09KUNIT_ASSERT_FALSE(test, !list_lru_count(&pt_tt->pages));
=20
 =09ttm_pool_fini(pool);
 }
@@ -352,12 +352,12 @@ static void ttm_pool_free_dma_alloc(struct kunit *tes=
t)
 =09ttm_pool_alloc(pool, tt, &simple_ctx);
=20
 =09pt =3D &pool->caching[caching].orders[order];
-=09KUNIT_ASSERT_TRUE(test, list_empty(&pt->pages));
+=09KUNIT_ASSERT_TRUE(test, !list_lru_count(&pt->pages));
=20
 =09ttm_pool_free(pool, tt);
 =09ttm_tt_fini(tt);
=20
-=09KUNIT_ASSERT_FALSE(test, list_empty(&pt->pages));
+=09KUNIT_ASSERT_FALSE(test, !list_lru_count(&pt->pages));
=20
 =09ttm_pool_fini(pool);
 }
@@ -383,12 +383,12 @@ static void ttm_pool_free_no_dma_alloc(struct kunit *=
test)
 =09ttm_pool_alloc(pool, tt, &simple_ctx);
=20
 =09pt =3D &pool->caching[caching].orders[order];
-=09KUNIT_ASSERT_TRUE(test, list_is_singular(&pt->pages));
+=09KUNIT_ASSERT_TRUE(test, list_lru_count(&pt->pages) =3D=3D 1);
=20
 =09ttm_pool_free(pool, tt);
 =09ttm_tt_fini(tt);
=20
-=09KUNIT_ASSERT_TRUE(test, list_is_singular(&pt->pages));
+=09KUNIT_ASSERT_TRUE(test, list_lru_count(&pt->pages) =3D=3D 1);
=20
 =09ttm_pool_fini(pool);
 }
@@ -404,11 +404,11 @@ static void ttm_pool_fini_basic(struct kunit *test)
 =09pool =3D ttm_pool_pre_populated(test, size, caching);
 =09pt =3D &pool->caching[caching].orders[order];
=20
-=09KUNIT_ASSERT_FALSE(test, list_empty(&pt->pages));
+=09KUNIT_ASSERT_FALSE(test, !list_lru_count(&pt->pages));
=20
 =09ttm_pool_fini(pool);
=20
-=09KUNIT_ASSERT_TRUE(test, list_empty(&pt->pages));
+=09KUNIT_ASSERT_TRUE(test, !list_lru_count(&pt->pages));
 }
=20
 static struct kunit_case ttm_pool_test_cases[] =3D {
diff --git a/drivers/gpu/drm/ttm/ttm_pool.c b/drivers/gpu/drm/ttm/ttm_pool.=
c
index 148c7530738d..8b0fe7a0164a 100644
--- a/drivers/gpu/drm/ttm/ttm_pool.c
+++ b/drivers/gpu/drm/ttm/ttm_pool.c
@@ -131,6 +131,15 @@ static struct list_head shrinker_list;
 static struct shrinker *mm_shrinker;
 static DECLARE_RWSEM(pool_shrink_rwsem);
=20
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
@@ -288,30 +297,41 @@ static void ttm_pool_type_give(struct ttm_pool_type *=
pt, struct page *p)
 =09=09=09clear_page(page_address(p + i));
 =09}
=20
-=09spin_lock(&pt->lock);
-=09list_add(&p->lru, &pt->pages);
-=09spin_unlock(&pt->lock);
+=09INIT_LIST_HEAD(&p->lru);
+=09rcu_read_lock();
+=09list_lru_add(&pt->pages, &p->lru, page_to_nid(p), NULL);
+=09rcu_read_unlock();
 =09atomic_long_add(1 << pt->order, &allocated_pages);
=20
 =09mod_lruvec_page_state(p, NR_GPU_ACTIVE, -num_pages);
 =09mod_lruvec_page_state(p, NR_GPU_RECLAIM, num_pages);
 }
=20
+static enum lru_status take_one_from_lru(struct list_head *item,
+=09=09=09=09=09 struct list_lru_one *list,
+=09=09=09=09=09 void *cb_arg)
+{
+=09struct page **out_page =3D cb_arg;
+=09struct page *p =3D container_of(item, struct page, lru);
+=09list_lru_isolate(list, item);
+
+=09*out_page =3D p;
+=09return LRU_REMOVED;
+}
+
 /* Take pages from a specific pool_type, return NULL when nothing availabl=
e */
-static struct page *ttm_pool_type_take(struct ttm_pool_type *pt)
+static struct page *ttm_pool_type_take(struct ttm_pool_type *pt, int nid)
 {
-=09struct page *p;
+=09int ret;
+=09struct page *p =3D NULL;
+=09unsigned long nr_to_walk =3D 1;
=20
-=09spin_lock(&pt->lock);
-=09p =3D list_first_entry_or_null(&pt->pages, typeof(*p), lru);
-=09if (p) {
+=09ret =3D list_lru_walk_node(&pt->pages, nid, take_one_from_lru, (void *)=
&p, &nr_to_walk);
+=09if (ret =3D=3D 1 && p) {
 =09=09atomic_long_sub(1 << pt->order, &allocated_pages);
 =09=09mod_lruvec_page_state(p, NR_GPU_ACTIVE, (1 << pt->order));
-=09=09mod_lruvec_page_state(p, NR_GPU_RECLAIM, -(1 << pt->order));
-=09=09list_del(&p->lru);
+=09=09mod_lruvec_page_state(p, NR_GPU_RECLAIM, -(1 << pt->order));=09=09
 =09}
-=09spin_unlock(&pt->lock);
-
 =09return p;
 }
=20
@@ -322,25 +342,47 @@ static void ttm_pool_type_init(struct ttm_pool_type *=
pt, struct ttm_pool *pool,
 =09pt->pool =3D pool;
 =09pt->caching =3D caching;
 =09pt->order =3D order;
-=09spin_lock_init(&pt->lock);
-=09INIT_LIST_HEAD(&pt->pages);
+=09list_lru_init(&pt->pages);
=20
 =09spin_lock(&shrinker_lock);
 =09list_add_tail(&pt->shrinker_list, &shrinker_list);
 =09spin_unlock(&shrinker_lock);
 }
=20
+static enum lru_status pool_move_to_dispose_list(struct list_head *item,
+=09=09=09=09=09=09 struct list_lru_one *list,
+=09=09=09=09=09=09 void *cb_arg)
+{
+=09struct list_head *dispose =3D cb_arg;
+
+=09list_lru_isolate_move(list, item, dispose);
+
+=09return LRU_REMOVED;
+}
+
+static void ttm_pool_dispose_list(struct ttm_pool_type *pt,
+=09=09=09=09  struct list_head *dispose)
+{
+=09while (!list_empty(dispose)) {
+=09=09struct page *p;
+=09=09p =3D list_first_entry(dispose, struct page, lru);
+=09=09list_del_init(&p->lru);
+=09=09atomic_long_sub(1 << pt->order, &allocated_pages);
+=09=09ttm_pool_free_page(pt->pool, pt->caching, pt->order, p, true);
+=09}
+}
+
 /* Remove a pool_type from the global shrinker list and free all pages */
 static void ttm_pool_type_fini(struct ttm_pool_type *pt)
 {
-=09struct page *p;
+=09LIST_HEAD(dispose);
=20
 =09spin_lock(&shrinker_lock);
 =09list_del(&pt->shrinker_list);
 =09spin_unlock(&shrinker_lock);
=20
-=09while ((p =3D ttm_pool_type_take(pt)))
-=09=09ttm_pool_free_page(pt->pool, pt->caching, pt->order, p, true);
+=09list_lru_walk(&pt->pages, pool_move_to_dispose_list, &dispose, LONG_MAX=
);
+=09ttm_pool_dispose_list(pt, &dispose);
 }
=20
 /* Return the pool_type to use for the given caching and order */
@@ -390,7 +432,7 @@ static unsigned int ttm_pool_shrink(void)
 =09list_move_tail(&pt->shrinker_list, &shrinker_list);
 =09spin_unlock(&shrinker_lock);
=20
-=09p =3D ttm_pool_type_take(pt);
+=09p =3D ttm_pool_type_take(pt, ttm_pool_nid(pt->pool));
 =09if (p) {
 =09=09ttm_pool_free_page(pt->pool, pt->caching, pt->order, p, true);
 =09=09num_pages =3D 1 << pt->order;
@@ -744,7 +786,7 @@ static int __ttm_pool_alloc(struct ttm_pool *pool, stru=
ct ttm_tt *tt,
 =09=09p =3D NULL;
 =09=09pt =3D ttm_pool_select_type(pool, page_caching, order);
 =09=09if (pt && allow_pools)
-=09=09=09p =3D ttm_pool_type_take(pt);
+=09=09=09p =3D ttm_pool_type_take(pt, ttm_pool_nid(pool));
 =09=09/*
 =09=09 * If that fails or previously failed, allocate from system.
 =09=09 * Note that this also disallows additional pool allocations using
@@ -1173,16 +1215,7 @@ static unsigned long ttm_pool_shrinker_count(struct =
shrinker *shrink,
 /* Count the number of pages available in a pool_type */
 static unsigned int ttm_pool_type_count(struct ttm_pool_type *pt)
 {
-=09unsigned int count =3D 0;
-=09struct page *p;
-
-=09spin_lock(&pt->lock);
-=09/* Only used for debugfs, the overhead doesn't matter */
-=09list_for_each_entry(p, &pt->pages, lru)
-=09=09++count;
-=09spin_unlock(&pt->lock);
-
-=09return count;
+=09return list_lru_count(&pt->pages);
 }
=20
 /* Print a nice header for the order */
diff --git a/include/drm/ttm/ttm_pool.h b/include/drm/ttm/ttm_pool.h
index 54cd34a6e4c0..df56527c4853 100644
--- a/include/drm/ttm/ttm_pool.h
+++ b/include/drm/ttm/ttm_pool.h
@@ -45,8 +45,7 @@ struct ttm_tt;
  * @order: the allocation order our pages have
  * @caching: the caching type our pages have
  * @shrinker_list: our place on the global shrinker list
- * @lock: protection of the page list
- * @pages: the list of pages in the pool
+ * @pages: the lru_list of pages in the pool
  */
 struct ttm_pool_type {
 =09struct ttm_pool *pool;
@@ -55,8 +54,7 @@ struct ttm_pool_type {
=20
 =09struct list_head shrinker_list;
=20
-=09spinlock_t lock;
-=09struct list_head pages;
+=09struct list_lru pages;
 };
=20
 /**
diff --git a/mm/list_lru.c b/mm/list_lru.c
index ec48b5dadf51..627589d75320 100644
--- a/mm/list_lru.c
+++ b/mm/list_lru.c
@@ -179,6 +179,7 @@ bool list_lru_add(struct list_lru *lru, struct list_hea=
d *item, int nid,
 =09unlock_list_lru(l, false);
 =09return false;
 }
+EXPORT_SYMBOL_GPL(list_lru_add);
=20
 bool list_lru_add_obj(struct list_lru *lru, struct list_head *item)
 {
--=20
2.50.1

