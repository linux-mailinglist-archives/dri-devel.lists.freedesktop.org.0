Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qNTGAnQInWk7MgQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 24 Feb 2026 03:09:56 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 734AE180DED
	for <lists+dri-devel@lfdr.de>; Tue, 24 Feb 2026 03:09:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B709810E471;
	Tue, 24 Feb 2026 02:09:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-44.mimecast.com
 (us-smtp-delivery-44.mimecast.com [207.211.30.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2755C10E472
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Feb 2026 02:09:52 +0000 (UTC)
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-649-YPm3JPQjNdiXoq3y15mdjQ-1; Mon,
 23 Feb 2026 21:09:44 -0500
X-MC-Unique: YPm3JPQjNdiXoq3y15mdjQ-1
X-Mimecast-MFC-AGG-ID: YPm3JPQjNdiXoq3y15mdjQ_1771898983
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 52C74180025C; Tue, 24 Feb 2026 02:09:43 +0000 (UTC)
Received: from dreadlord.taild9177d.ts.net (unknown [10.67.32.38])
 by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 1D5E330001BB; Tue, 24 Feb 2026 02:09:36 +0000 (UTC)
From: Dave Airlie <airlied@gmail.com>
To: dri-devel@lists.freedesktop.org, tj@kernel.org, christian.koenig@amd.com,
 Johannes Weiner <hannes@cmpxchg.org>, Michal Hocko <mhocko@kernel.org>,
 Roman Gushchin <roman.gushchin@linux.dev>,
 Shakeel Butt <shakeel.butt@linux.dev>, Muchun Song <muchun.song@linux.dev>
Cc: cgroups@vger.kernel.org, Dave Chinner <david@fromorbit.com>,
 Waiman Long <longman@redhat.com>, simona@ffwll.ch
Subject: [PATCH 05/16] ttm/pool: make pool shrinker NUMA aware (v2)
Date: Tue, 24 Feb 2026 12:06:22 +1000
Message-ID: <20260224020854.791201-6-airlied@gmail.com>
In-Reply-To: <20260224020854.791201-1-airlied@gmail.com>
References: <20260224020854.791201-1-airlied@gmail.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: xb9TZ1wMaTkZsoByYsixc7497Gb2ufDlLrka_0k5Ctc_1771898983
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
	NEURAL_HAM(-0.00)[-0.951];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:email,fromorbit.com:email]
X-Rspamd-Queue-Id: 734AE180DED
X-Rspamd-Action: no action

From: Dave Airlie <airlied@redhat.com>

This enable NUMA awareness for the shrinker on the
ttm pools.

Cc: Christian Koenig <christian.koenig@amd.com>
Cc: Dave Chinner <david@fromorbit.com>
Reviewed-by: Christian K=C3=B6nig <christian.koenig@amd.com>
Signed-off-by: Dave Airlie <airlied@redhat.com>

---
v2: AI review - found reverse diff calculation
---
 drivers/gpu/drm/ttm/ttm_pool.c | 38 +++++++++++++++++++---------------
 1 file changed, 21 insertions(+), 17 deletions(-)

diff --git a/drivers/gpu/drm/ttm/ttm_pool.c b/drivers/gpu/drm/ttm/ttm_pool.=
c
index 3989e15ab5b0..880228132b91 100644
--- a/drivers/gpu/drm/ttm/ttm_pool.c
+++ b/drivers/gpu/drm/ttm/ttm_pool.c
@@ -423,12 +423,12 @@ static struct ttm_pool_type *ttm_pool_select_type(str=
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
@@ -436,13 +436,10 @@ static unsigned int ttm_pool_shrink(void)
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
@@ -791,6 +788,7 @@ static int __ttm_pool_alloc(struct ttm_pool *pool, stru=
ct ttm_tt *tt,
 =09=09pt =3D ttm_pool_select_type(pool, page_caching, order);
 =09=09if (pt && allow_pools)
 =09=09=09p =3D ttm_pool_type_take(pt, ttm_pool_nid(pool));
+
 =09=09/*
 =09=09 * If that fails or previously failed, allocate from system.
 =09=09 * Note that this also disallows additional pool allocations using
@@ -941,8 +939,10 @@ void ttm_pool_free(struct ttm_pool *pool, struct ttm_t=
t *tt)
 {
 =09ttm_pool_free_range(pool, tt, tt->caching, 0, tt->num_pages);
=20
-=09while (atomic_long_read(&allocated_pages) > page_pool_size)
-=09=09ttm_pool_shrink();
+=09while (atomic_long_read(&allocated_pages) > page_pool_size) {
+=09=09unsigned long diff =3D atomic_long_read(&allocated_pages) - page_poo=
l_size;
+=09=09ttm_pool_shrink(ttm_pool_nid(pool), diff);
+=09}
 }
 EXPORT_SYMBOL(ttm_pool_free);
=20
@@ -1197,7 +1197,7 @@ static unsigned long ttm_pool_shrinker_scan(struct sh=
rinker *shrink,
 =09unsigned long num_freed =3D 0;
=20
 =09do
-=09=09num_freed +=3D ttm_pool_shrink();
+=09=09num_freed +=3D ttm_pool_shrink(sc->nid, sc->nr_to_scan);
 =09while (num_freed < sc->nr_to_scan &&
 =09       atomic_long_read(&allocated_pages));
=20
@@ -1325,11 +1325,15 @@ static int ttm_pool_debugfs_shrink_show(struct seq_=
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
@@ -1377,7 +1381,7 @@ int ttm_pool_mgr_init(unsigned long num_pages)
 #endif
 #endif
=20
-=09mm_shrinker =3D shrinker_alloc(0, "drm-ttm_pool");
+=09mm_shrinker =3D shrinker_alloc(SHRINKER_NUMA_AWARE, "drm-ttm_pool");
 =09if (!mm_shrinker)
 =09=09return -ENOMEM;
=20
--=20
2.52.0

