Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B423B0359E
	for <lists+dri-devel@lfdr.de>; Mon, 14 Jul 2025 07:23:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D631D10E25E;
	Mon, 14 Jul 2025 05:23:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-44.mimecast.com
 (us-smtp-delivery-44.mimecast.com [205.139.111.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A726210E25E
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Jul 2025 05:23:40 +0000 (UTC)
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-42-gpyEZ4XUOLO17nZ05Zy5KA-1; Mon,
 14 Jul 2025 01:23:36 -0400
X-MC-Unique: gpyEZ4XUOLO17nZ05Zy5KA-1
X-Mimecast-MFC-AGG-ID: gpyEZ4XUOLO17nZ05Zy5KA_1752470615
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id D01A31809C8A; Mon, 14 Jul 2025 05:23:34 +0000 (UTC)
Received: from dreadlord.redhat.com (unknown [10.67.32.31])
 by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 89CBB1977000; Mon, 14 Jul 2025 05:23:30 +0000 (UTC)
From: Dave Airlie <airlied@gmail.com>
To: dri-devel@lists.freedesktop.org, linux-mm@kvack.org,
 Johannes Weiner <hannes@cmpxchg.org>,
 Christian Koenig <christian.koenig@amd.com>
Cc: Dave Chinner <david@fromorbit.com>, Kairui Song <kasong@tencent.com>,
 Dave Airlie <airlied@redhat.com>
Subject: [PATCH 06/18] ttm/pool: make pool shrinker NUMA aware
Date: Mon, 14 Jul 2025 15:18:21 +1000
Message-ID: <20250714052243.1149732-7-airlied@gmail.com>
In-Reply-To: <20250714052243.1149732-1-airlied@gmail.com>
References: <20250714052243.1149732-1-airlied@gmail.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 1SQPKnhgN4t03ML-OwZjQpr0zg58ZEORP30r7k9Ay3w_1752470615
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

This enable NUMA awareness for the shrinker on the
ttm pools.

Cc: Christian Koenig <christian.koenig@amd.com>
Cc: Dave Chinner <david@fromorbit.com>
Signed-off-by: Dave Airlie <airlied@redhat.com>
---
 drivers/gpu/drm/ttm/ttm_pool.c | 38 +++++++++++++++++++---------------
 1 file changed, 21 insertions(+), 17 deletions(-)

diff --git a/drivers/gpu/drm/ttm/ttm_pool.c b/drivers/gpu/drm/ttm/ttm_pool.=
c
index e26d57676fe3..c0391ccd179b 100644
--- a/drivers/gpu/drm/ttm/ttm_pool.c
+++ b/drivers/gpu/drm/ttm/ttm_pool.c
@@ -415,12 +415,12 @@ static struct ttm_pool_type *ttm_pool_select_type(str=
uct ttm_pool *pool,
 =09return NULL;
 }
=20
-/* Free pages using the global shrinker list */
-static unsigned int ttm_pool_shrink(void)
+/* Free pages using the per-node shrinker list */
+static unsigned int ttm_pool_shrink(int nid, unsigned long num_to_free)
 {
+=09LIST_HEAD(dispose);
 =09struct ttm_pool_type *pt;
 =09unsigned int num_pages;
-=09struct page *p;
=20
 =09down_read(&pool_shrink_rwsem);
 =09spin_lock(&shrinker_lock);
@@ -428,13 +428,10 @@ static unsigned int ttm_pool_shrink(void)
 =09list_move_tail(&pt->shrinker_list, &shrinker_list);
 =09spin_unlock(&shrinker_lock);
=20
-=09p =3D ttm_pool_type_take(pt, ttm_pool_nid(pt->pool));
-=09if (p) {
-=09=09ttm_pool_free_page(pt->pool, pt->caching, pt->order, p, true);
-=09=09num_pages =3D 1 << pt->order;
-=09} else {
-=09=09num_pages =3D 0;
-=09}
+=09num_pages =3D list_lru_walk_node(&pt->pages, nid, pool_move_to_dispose_=
list, &dispose, &num_to_free);
+=09num_pages *=3D 1 << pt->order;
+
+=09ttm_pool_dispose_list(pt, &dispose);
 =09up_read(&pool_shrink_rwsem);
=20
 =09return num_pages;
@@ -783,6 +780,7 @@ static int __ttm_pool_alloc(struct ttm_pool *pool, stru=
ct ttm_tt *tt,
 =09=09pt =3D ttm_pool_select_type(pool, page_caching, order);
 =09=09if (pt && allow_pools)
 =09=09=09p =3D ttm_pool_type_take(pt, ttm_pool_nid(pool));
+
 =09=09/*
 =09=09 * If that fails or previously failed, allocate from system.
 =09=09 * Note that this also disallows additional pool allocations using
@@ -931,8 +929,10 @@ void ttm_pool_free(struct ttm_pool *pool, struct ttm_t=
t *tt)
 {
 =09ttm_pool_free_range(pool, tt, tt->caching, 0, tt->num_pages);
=20
-=09while (atomic_long_read(&allocated_pages) > page_pool_size)
-=09=09ttm_pool_shrink();
+=09while (atomic_long_read(&allocated_pages) > page_pool_size) {
+=09=09unsigned long diff =3D page_pool_size - atomic_long_read(&allocated_=
pages);
+=09=09ttm_pool_shrink(ttm_pool_nid(pool), diff);
+=09}
 }
 EXPORT_SYMBOL(ttm_pool_free);
=20
@@ -1189,7 +1189,7 @@ static unsigned long ttm_pool_shrinker_scan(struct sh=
rinker *shrink,
 =09unsigned long num_freed =3D 0;
=20
 =09do
-=09=09num_freed +=3D ttm_pool_shrink();
+=09=09num_freed +=3D ttm_pool_shrink(sc->nid, sc->nr_to_scan);
 =09while (num_freed < sc->nr_to_scan &&
 =09       atomic_long_read(&allocated_pages));
=20
@@ -1317,11 +1317,15 @@ static int ttm_pool_debugfs_shrink_show(struct seq_=
file *m, void *data)
 =09=09.nr_to_scan =3D TTM_SHRINKER_BATCH,
 =09};
 =09unsigned long count;
+=09int nid;
=20
 =09fs_reclaim_acquire(GFP_KERNEL);
-=09count =3D ttm_pool_shrinker_count(mm_shrinker, &sc);
-=09seq_printf(m, "%lu/%lu\n", count,
-=09=09   ttm_pool_shrinker_scan(mm_shrinker, &sc));
+=09for_each_node(nid) {
+=09=09sc.nid =3D nid;
+=09=09count =3D ttm_pool_shrinker_count(mm_shrinker, &sc);
+=09=09seq_printf(m, "%d: %lu/%lu\n", nid, count,
+=09=09=09   ttm_pool_shrinker_scan(mm_shrinker, &sc));
+=09}
 =09fs_reclaim_release(GFP_KERNEL);
=20
 =09return 0;
@@ -1369,7 +1373,7 @@ int ttm_pool_mgr_init(unsigned long num_pages)
 #endif
 #endif
=20
-=09mm_shrinker =3D shrinker_alloc(0, "drm-ttm_pool");
+=09mm_shrinker =3D shrinker_alloc(SHRINKER_NUMA_AWARE, "drm-ttm_pool");
 =09if (!mm_shrinker)
 =09=09return -ENOMEM;
=20
--=20
2.49.0

