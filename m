Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D7261B3F393
	for <lists+dri-devel@lfdr.de>; Tue,  2 Sep 2025 06:12:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 03B7610E579;
	Tue,  2 Sep 2025 04:12:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-44.mimecast.com
 (us-smtp-delivery-44.mimecast.com [205.139.111.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF98D10E579
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Sep 2025 04:12:36 +0000 (UTC)
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-112-FNLEhJeHNIyFFDVmx5BHdQ-1; Tue,
 02 Sep 2025 00:12:33 -0400
X-MC-Unique: FNLEhJeHNIyFFDVmx5BHdQ-1
X-Mimecast-MFC-AGG-ID: FNLEhJeHNIyFFDVmx5BHdQ_1756786352
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id EF4BD195608C; Tue,  2 Sep 2025 04:12:31 +0000 (UTC)
Received: from dreadlord.redhat.com (unknown [10.67.32.135])
 by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 69FA930001A2; Tue,  2 Sep 2025 04:12:24 +0000 (UTC)
From: Dave Airlie <airlied@gmail.com>
To: dri-devel@lists.freedesktop.org, tj@kernel.org, christian.koenig@amd.com,
 Johannes Weiner <hannes@cmpxchg.org>, Michal Hocko <mhocko@kernel.org>,
 Roman Gushchin <roman.gushchin@linux.dev>,
 Shakeel Butt <shakeel.butt@linux.dev>, Muchun Song <muchun.song@linux.dev>
Cc: cgroups@vger.kernel.org, Dave Chinner <david@fromorbit.com>,
 Waiman Long <longman@redhat.com>, simona@ffwll.ch
Subject: [PATCH 15/15] ttm: add support for a module option to disable memcg
 integration
Date: Tue,  2 Sep 2025 14:06:54 +1000
Message-ID: <20250902041024.2040450-16-airlied@gmail.com>
In-Reply-To: <20250902041024.2040450-1-airlied@gmail.com>
References: <20250902041024.2040450-1-airlied@gmail.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: NegqxBzWQSsf0ZvZqiFFfOF4OJU4MuBaN-0lPwwUTws_1756786352
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

This adds a kconfig and a module option to turn off ttm memcg
integration completely.

When this is used, no object will ever end up using memcg aware
paths.

There is an existing workload that cgroup support might regress,
the systems are setup to allocate 1GB of uncached pages at system
startup to prime the pool, then any further users will take them
from the pool. The current cgroup code might handle that, but
it also may regress, so add an option to ttm to avoid using
memcg for the pool pages.

Signed-off-by: Dave Airlie <airlied@redhat.com>
---
 drivers/gpu/drm/Kconfig        |  7 +++++++
 drivers/gpu/drm/ttm/ttm_pool.c | 24 +++++++++++++++++++++---
 2 files changed, 28 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
index f7ea8e895c0c..4a1501b05e7c 100644
--- a/drivers/gpu/drm/Kconfig
+++ b/drivers/gpu/drm/Kconfig
@@ -239,6 +239,13 @@ config DRM_TTM_HELPER
 =09help
 =09  Helpers for ttm-based gem objects
=20
+config DRM_TTM_MEMCG
+=09bool "Enable TTM mem cgroup by default"
+=09depends on DRM_TTM
+=09depends on MEMCG
+=09help
+=09  Enable the memcg intergration by default
+
 config DRM_GEM_DMA_HELPER
 =09tristate
 =09depends on DRM
diff --git a/drivers/gpu/drm/ttm/ttm_pool.c b/drivers/gpu/drm/ttm/ttm_pool.=
c
index 1e6da2cc1f06..009e7016bd4c 100644
--- a/drivers/gpu/drm/ttm/ttm_pool.c
+++ b/drivers/gpu/drm/ttm/ttm_pool.c
@@ -118,6 +118,24 @@ static unsigned long page_pool_size;
 MODULE_PARM_DESC(page_pool_size, "Number of pages in the WC/UC/DMA pool pe=
r NUMA node");
 module_param(page_pool_size, ulong, 0644);
=20
+/*
+ * Don't use the memcg aware lru for pooled pages.
+ *
+ * There are use-cases where for example one application in a cgroup will =
preallocate 1GB
+ * of uncached pages, and immediately release them into the pool, for othe=
r consumers
+ * to use. This use-case could be handled with a proper cgroup hierarchy, =
but to allow
+ * that use case to continue to operate as-is, add a module option.
+ *
+ * This still stores the pages in the list_lru, it just doesn't use the me=
mcg when
+ * adding/removing them.
+ */
+#define DEFAULT_TTM_MEMCG IS_ENABLED(CONFIG_DRM_TTM_MEMCG)
+static bool ttm_memcg =3D DEFAULT_TTM_MEMCG;
+
+MODULE_PARM_DESC(ttm_memcg, "Allow using cgroups with TTM "
+=09=09 "[default=3D" __stringify(DEFAULT_TTM_MEMCG) "])");
+module_param(ttm_memcg, bool, 0444);
+
 static unsigned long pool_node_limit[MAX_NUMNODES];
 static atomic_long_t allocated_pages[MAX_NUMNODES];
=20
@@ -305,7 +323,7 @@ static void ttm_pool_type_give(struct ttm_pool_type *pt=
, struct page *p)
=20
 =09INIT_LIST_HEAD(&p->lru);
 =09rcu_read_lock();
-=09list_lru_add(&pt->pages, &p->lru, nid, page_memcg_check(p));
+=09list_lru_add(&pt->pages, &p->lru, nid, ttm_memcg ? page_memcg_check(p) =
: NULL);
 =09rcu_read_unlock();
=20
 =09atomic_long_add(num_pages, &allocated_pages[nid]);
@@ -354,7 +372,7 @@ static struct page *ttm_pool_type_take(struct ttm_pool_=
type *pt, int nid,
 =09struct page *page_out =3D NULL;
 =09int ret;
 =09struct mem_cgroup *orig_memcg =3D orig_objcg ? get_mem_cgroup_from_objc=
g(orig_objcg) : NULL;
-=09struct mem_cgroup *memcg =3D orig_memcg;
+=09struct mem_cgroup *memcg =3D ttm_memcg ? orig_memcg : NULL;
=20
 =09/*
 =09 * Attempt to get a page from the current memcg, but if it hasn't got a=
ny in it's level,
@@ -824,7 +842,7 @@ static int __ttm_pool_alloc(struct ttm_pool *pool, stru=
ct ttm_tt *tt,
 =09bool allow_pools;
 =09struct page *p;
 =09int r;
-=09struct obj_cgroup *objcg =3D memcg_account ? tt->objcg : NULL;
+=09struct obj_cgroup *objcg =3D (ttm_memcg && memcg_account) ? tt->objcg :=
 NULL;
=20
 =09WARN_ON(!alloc->remaining_pages || ttm_tt_is_populated(tt));
 =09WARN_ON(alloc->dma_addr && !pool->dev);
--=20
2.50.1

