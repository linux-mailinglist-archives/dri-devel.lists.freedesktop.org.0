Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2N/nN2YInWk7MgQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 24 Feb 2026 03:09:42 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 45C7F180DC8
	for <lists+dri-devel@lfdr.de>; Tue, 24 Feb 2026 03:09:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 94B1A10E46E;
	Tue, 24 Feb 2026 02:09:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-44.mimecast.com
 (us-smtp-delivery-44.mimecast.com [207.211.30.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 72C8910E46E
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Feb 2026 02:09:38 +0000 (UTC)
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-167-j4u0-zVDOpefCQakxPSWxg-1; Mon,
 23 Feb 2026 21:09:30 -0500
X-MC-Unique: j4u0-zVDOpefCQakxPSWxg-1
X-Mimecast-MFC-AGG-ID: j4u0-zVDOpefCQakxPSWxg_1771898969
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id ECB5B19560AD; Tue, 24 Feb 2026 02:09:28 +0000 (UTC)
Received: from dreadlord.taild9177d.ts.net (unknown [10.67.32.38])
 by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 75F6130001BB; Tue, 24 Feb 2026 02:09:22 +0000 (UTC)
From: Dave Airlie <airlied@gmail.com>
To: dri-devel@lists.freedesktop.org, tj@kernel.org, christian.koenig@amd.com,
 Johannes Weiner <hannes@cmpxchg.org>, Michal Hocko <mhocko@kernel.org>,
 Roman Gushchin <roman.gushchin@linux.dev>,
 Shakeel Butt <shakeel.butt@linux.dev>, Muchun Song <muchun.song@linux.dev>
Cc: cgroups@vger.kernel.org, Dave Chinner <david@fromorbit.com>,
 Waiman Long <longman@redhat.com>, simona@ffwll.ch
Subject: [PATCH 03/16] ttm/pool: port to list_lru. (v2)
Date: Tue, 24 Feb 2026 12:06:20 +1000
Message-ID: <20260224020854.791201-4-airlied@gmail.com>
In-Reply-To: <20260224020854.791201-1-airlied@gmail.com>
References: <20260224020854.791201-1-airlied@gmail.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: saT2_OV9xUXvEtFxcpNNQD6DrO-rEopkMXIHc6T-BgY_1771898969
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
	NEURAL_HAM(-0.00)[-0.952];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[cmpxchg.org:email,amd.com:email]
X-Rspamd-Queue-Id: 45C7F180DC8
X-Rspamd-Action: no action

From: Dave Airlie <airlied@redhat.com>

This is an initial port of the TTM pools for
write combined and uncached pages to use the list_lru.

This makes the pool's more NUMA aware and avoids
needing separate NUMA pools (later commit enables this).

Cc: Christian Koenig <christian.koenig@amd.com>
Cc: Johannes Weiner <hannes@cmpxchg.org>
Cc: Dave Chinner <david@fromorbit.com>
Reviewed-by: Christian K=C3=B6nig <christian.koenig@amd.com>
Signed-off-by: Dave Airlie <airlied@redhat.com>

---
v2: drop the pt->lock, lru list has it's own lock which is sufficent.
rearrange list isolates to fix bad locking orders.
---
 drivers/gpu/drm/ttm/tests/ttm_device_test.c |  2 +-
 drivers/gpu/drm/ttm/tests/ttm_pool_test.c   | 32 ++++----
 drivers/gpu/drm/ttm/ttm_pool.c              | 90 ++++++++++++++-------
 include/drm/ttm/ttm_pool.h                  |  7 +-
 mm/list_lru.c                               |  1 +
 5 files changed, 83 insertions(+), 49 deletions(-)

diff --git a/drivers/gpu/drm/ttm/tests/ttm_device_test.c b/drivers/gpu/drm/=
ttm/tests/ttm_device_test.c
index 2d55ad34fe48..db4b4a09a73f 100644
--- a/drivers/gpu/drm/ttm/tests/ttm_device_test.c
+++ b/drivers/gpu/drm/ttm/tests/ttm_device_test.c
@@ -176,7 +176,7 @@ static void ttm_device_init_pools(struct kunit *test)
=20
 =09=09=09=09if (ttm_pool_uses_dma_alloc(pool))
 =09=09=09=09=09KUNIT_ASSERT_FALSE(test,
-=09=09=09=09=09=09=09   list_empty(&pt.pages));
+=09=09=09=09=09=09=09   !list_lru_count(&pt.pages));
 =09=09=09}
 =09=09}
 =09}
diff --git a/drivers/gpu/drm/ttm/tests/ttm_pool_test.c b/drivers/gpu/drm/tt=
m/tests/ttm_pool_test.c
index 11c92bd75779..01197014b83f 100644
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
index 6891776cad75..2947ffc51351 100644
--- a/drivers/gpu/drm/ttm/ttm_pool.c
+++ b/drivers/gpu/drm/ttm/ttm_pool.c
@@ -132,6 +132,16 @@ static struct list_head shrinker_list;
 static struct shrinker *mm_shrinker;
 static DECLARE_RWSEM(pool_shrink_rwsem);
=20
+static int ttm_pool_nid(struct ttm_pool *pool)
+{
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
@@ -297,30 +307,41 @@ static void ttm_pool_type_give(struct ttm_pool_type *=
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
 =09=09mod_lruvec_page_state(p, NR_GPU_RECLAIM, -(1 << pt->order));
-=09=09list_del(&p->lru);
 =09}
-=09spin_unlock(&pt->lock);
-
 =09return p;
 }
=20
@@ -331,25 +352,47 @@ static void ttm_pool_type_init(struct ttm_pool_type *=
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
@@ -399,7 +442,7 @@ static unsigned int ttm_pool_shrink(void)
 =09list_move_tail(&pt->shrinker_list, &shrinker_list);
 =09spin_unlock(&shrinker_lock);
=20
-=09p =3D ttm_pool_type_take(pt);
+=09p =3D ttm_pool_type_take(pt, ttm_pool_nid(pt->pool));
 =09if (p) {
 =09=09ttm_pool_free_page(pt->pool, pt->caching, pt->order, p, true);
 =09=09num_pages =3D 1 << pt->order;
@@ -753,7 +796,7 @@ static int __ttm_pool_alloc(struct ttm_pool *pool, stru=
ct ttm_tt *tt,
 =09=09p =3D NULL;
 =09=09pt =3D ttm_pool_select_type(pool, page_caching, order);
 =09=09if (pt && allow_pools)
-=09=09=09p =3D ttm_pool_type_take(pt);
+=09=09=09p =3D ttm_pool_type_take(pt, ttm_pool_nid(pool));
 =09=09/*
 =09=09 * If that fails or previously failed, allocate from system.
 =09=09 * Note that this also disallows additional pool allocations using
@@ -1182,16 +1225,7 @@ static unsigned long ttm_pool_shrinker_count(struct =
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
index 233581670e78..26ee592e1994 100644
--- a/include/drm/ttm/ttm_pool.h
+++ b/include/drm/ttm/ttm_pool.h
@@ -29,6 +29,7 @@
 #include <linux/mmzone.h>
 #include <linux/llist.h>
 #include <linux/spinlock.h>
+#include <linux/list_lru.h>
 #include <drm/ttm/ttm_caching.h>
=20
 struct device;
@@ -45,8 +46,7 @@ struct ttm_tt;
  * @order: the allocation order our pages have
  * @caching: the caching type our pages have
  * @shrinker_list: our place on the global shrinker list
- * @lock: protection of the page list
- * @pages: the list of pages in the pool
+ * @pages: the lru_list of pages in the pool
  */
 struct ttm_pool_type {
 =09struct ttm_pool *pool;
@@ -55,8 +55,7 @@ struct ttm_pool_type {
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
index 26463ae29c64..dd29bcf8eb5f 100644
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
2.52.0

