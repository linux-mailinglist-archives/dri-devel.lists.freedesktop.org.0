Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EC76B035AA
	for <lists+dri-devel@lfdr.de>; Mon, 14 Jul 2025 07:24:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE24310E3E7;
	Mon, 14 Jul 2025 05:24:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-44.mimecast.com
 (us-smtp-delivery-44.mimecast.com [207.211.30.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5DAE710E3E7
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Jul 2025 05:24:44 +0000 (UTC)
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-651-cJcgGuNDNnqaca43p25AfA-1; Mon,
 14 Jul 2025 01:24:40 -0400
X-MC-Unique: cJcgGuNDNnqaca43p25AfA-1
X-Mimecast-MFC-AGG-ID: cJcgGuNDNnqaca43p25AfA_1752470678
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id D398D180028D; Mon, 14 Jul 2025 05:24:38 +0000 (UTC)
Received: from dreadlord.redhat.com (unknown [10.67.32.31])
 by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 8DB611977000; Mon, 14 Jul 2025 05:24:34 +0000 (UTC)
From: Dave Airlie <airlied@gmail.com>
To: dri-devel@lists.freedesktop.org, linux-mm@kvack.org,
 Johannes Weiner <hannes@cmpxchg.org>,
 Christian Koenig <christian.koenig@amd.com>
Cc: Dave Chinner <david@fromorbit.com>, Kairui Song <kasong@tencent.com>,
 Dave Airlie <airlied@redhat.com>
Subject: [PATCH 18/18] ttm: add support for a module option to disable memcg
 pool
Date: Mon, 14 Jul 2025 15:18:33 +1000
Message-ID: <20250714052243.1149732-19-airlied@gmail.com>
In-Reply-To: <20250714052243.1149732-1-airlied@gmail.com>
References: <20250714052243.1149732-1-airlied@gmail.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: xIFCUfc5zRbgmnRaZBzTMIvVrEjhCLj61K70_Ysxzh0_1752470678
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

There is an existing workload that cgroup support might regress,
the systems are setup to allocate 1GB of uncached pages at system
startup to prime the pool, then any further users will take them
from the pool. The current cgroup code might handle that, but
it also may regress, so add an option to ttm to avoid using
memcg for the pool pages.

Signed-off-by: Dave Airlie <airlied@redhat.com>
---
 drivers/gpu/drm/ttm/ttm_pool.c | 19 +++++++++++++++++--
 1 file changed, 17 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/ttm/ttm_pool.c b/drivers/gpu/drm/ttm/ttm_pool.=
c
index 1e6da2cc1f06..9d84d9991176 100644
--- a/drivers/gpu/drm/ttm/ttm_pool.c
+++ b/drivers/gpu/drm/ttm/ttm_pool.c
@@ -118,6 +118,21 @@ static unsigned long page_pool_size;
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
+static bool pool_cgroup =3D true;
+MODULE_PARM_DESC(pool_cgroup, "Manage pooled memory using cgroups (default=
: true)");
+module_param(pool_cgroup, bool, 0444);
+
 static unsigned long pool_node_limit[MAX_NUMNODES];
 static atomic_long_t allocated_pages[MAX_NUMNODES];
=20
@@ -305,7 +320,7 @@ static void ttm_pool_type_give(struct ttm_pool_type *pt=
, struct page *p)
=20
 =09INIT_LIST_HEAD(&p->lru);
 =09rcu_read_lock();
-=09list_lru_add(&pt->pages, &p->lru, nid, page_memcg_check(p));
+=09list_lru_add(&pt->pages, &p->lru, nid, pool_cgroup ? page_memcg_check(p=
) : NULL);
 =09rcu_read_unlock();
=20
 =09atomic_long_add(num_pages, &allocated_pages[nid]);
@@ -354,7 +369,7 @@ static struct page *ttm_pool_type_take(struct ttm_pool_=
type *pt, int nid,
 =09struct page *page_out =3D NULL;
 =09int ret;
 =09struct mem_cgroup *orig_memcg =3D orig_objcg ? get_mem_cgroup_from_objc=
g(orig_objcg) : NULL;
-=09struct mem_cgroup *memcg =3D orig_memcg;
+=09struct mem_cgroup *memcg =3D pool_cgroup ? orig_memcg : NULL;
=20
 =09/*
 =09 * Attempt to get a page from the current memcg, but if it hasn't got a=
ny in it's level,
--=20
2.49.0

