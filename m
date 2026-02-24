Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CCf9GbsInWk7MgQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 24 Feb 2026 03:11:07 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F2BCC180EB9
	for <lists+dri-devel@lfdr.de>; Tue, 24 Feb 2026 03:11:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 554C110E47C;
	Tue, 24 Feb 2026 02:11:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-44.mimecast.com
 (us-smtp-delivery-44.mimecast.com [205.139.111.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C93B610E47B
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Feb 2026 02:11:03 +0000 (UTC)
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-454-vWItk_WnNme-VSybPgePAQ-1; Mon,
 23 Feb 2026 21:10:57 -0500
X-MC-Unique: vWItk_WnNme-VSybPgePAQ-1
X-Mimecast-MFC-AGG-ID: vWItk_WnNme-VSybPgePAQ_1771899055
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id BB8FA18002CE; Tue, 24 Feb 2026 02:10:55 +0000 (UTC)
Received: from dreadlord.taild9177d.ts.net (unknown [10.67.32.38])
 by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 3B93030001BB; Tue, 24 Feb 2026 02:10:48 +0000 (UTC)
From: Dave Airlie <airlied@gmail.com>
To: dri-devel@lists.freedesktop.org, tj@kernel.org, christian.koenig@amd.com,
 Johannes Weiner <hannes@cmpxchg.org>, Michal Hocko <mhocko@kernel.org>,
 Roman Gushchin <roman.gushchin@linux.dev>,
 Shakeel Butt <shakeel.butt@linux.dev>, Muchun Song <muchun.song@linux.dev>
Cc: cgroups@vger.kernel.org, Dave Chinner <david@fromorbit.com>,
 Waiman Long <longman@redhat.com>, simona@ffwll.ch
Subject: [PATCH 15/16] ttm: add support for a module option to disable memcg
 integration
Date: Tue, 24 Feb 2026 12:06:32 +1000
Message-ID: <20260224020854.791201-16-airlied@gmail.com>
In-Reply-To: <20260224020854.791201-1-airlied@gmail.com>
References: <20260224020854.791201-1-airlied@gmail.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: vQoi7q0TMfEtFVXUL3o1pBh7YjVyZWkNWMbsoxJ-vVU_1771899055
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
	NEURAL_HAM(-0.00)[-0.956];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:email,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: F2BCC180EB9
X-Rspamd-Action: no action

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

Reviewed-by: Christian K=C3=B6nig <christian.koenig@amd.com>
Signed-off-by: Dave Airlie <airlied@redhat.com>
---
 drivers/gpu/drm/Kconfig        |  7 +++++++
 drivers/gpu/drm/ttm/ttm_pool.c | 24 +++++++++++++++++++++---
 2 files changed, 28 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
index d3d52310c9cc..81227ff10fff 100644
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
+=09  Enable the memcg integration by default
+
 config DRM_GEM_DMA_HELPER
 =09tristate
 =09depends on DRM
diff --git a/drivers/gpu/drm/ttm/ttm_pool.c b/drivers/gpu/drm/ttm/ttm_pool.=
c
index 4b0c7d70b60f..d23255375219 100644
--- a/drivers/gpu/drm/ttm/ttm_pool.c
+++ b/drivers/gpu/drm/ttm/ttm_pool.c
@@ -119,6 +119,24 @@ static unsigned long page_pool_size;
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
@@ -315,7 +333,7 @@ static void ttm_pool_type_give(struct ttm_pool_type *pt=
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
@@ -364,7 +382,7 @@ static struct page *ttm_pool_type_take(struct ttm_pool_=
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
@@ -835,7 +853,7 @@ static int __ttm_pool_alloc(struct ttm_pool *pool, stru=
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
2.52.0

