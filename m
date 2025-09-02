Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CBE69B3F37C
	for <lists+dri-devel@lfdr.de>; Tue,  2 Sep 2025 06:11:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 046F210E56E;
	Tue,  2 Sep 2025 04:11:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-44.mimecast.com
 (us-smtp-delivery-44.mimecast.com [205.139.111.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8070A10E56E
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Sep 2025 04:11:39 +0000 (UTC)
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-272-mo64dFbxMWiUa8Zme8Y50w-1; Tue,
 02 Sep 2025 00:11:33 -0400
X-MC-Unique: mo64dFbxMWiUa8Zme8Y50w-1
X-Mimecast-MFC-AGG-ID: mo64dFbxMWiUa8Zme8Y50w_1756786291
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 4D30F18003FC; Tue,  2 Sep 2025 04:11:31 +0000 (UTC)
Received: from dreadlord.redhat.com (unknown [10.67.32.135])
 by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 67E3730001BB; Tue,  2 Sep 2025 04:11:23 +0000 (UTC)
From: Dave Airlie <airlied@gmail.com>
To: dri-devel@lists.freedesktop.org, tj@kernel.org, christian.koenig@amd.com,
 Johannes Weiner <hannes@cmpxchg.org>, Michal Hocko <mhocko@kernel.org>,
 Roman Gushchin <roman.gushchin@linux.dev>,
 Shakeel Butt <shakeel.butt@linux.dev>, Muchun Song <muchun.song@linux.dev>
Cc: cgroups@vger.kernel.org, Dave Chinner <david@fromorbit.com>,
 Waiman Long <longman@redhat.com>, simona@ffwll.ch
Subject: [PATCH 07/15] memcg: add support for GPU page counters. (v3)
Date: Tue,  2 Sep 2025 14:06:46 +1000
Message-ID: <20250902041024.2040450-8-airlied@gmail.com>
In-Reply-To: <20250902041024.2040450-1-airlied@gmail.com>
References: <20250902041024.2040450-1-airlied@gmail.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: -10AWP-wVhfGcgfK0YNcfRbvOJyW3cBv6IwVV47saks_1756786291
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

This introduces 2 new statistics and 3 new memcontrol APIs for dealing
with GPU system memory allocations.

The stats corresponds to the same stats in the global vmstat,
for number of active GPU pages, and number of pages in pools that
can be reclaimed.

The first API charges a order of pages to a objcg, and sets
the objcg on the pages like kmem does, and updates the active/reclaim
statistic.

The second API uncharges a page from the obj cgroup it is currently charged
to.

The third API allows moving a page to/from reclaim and between obj cgroups.
When pages are added to the pool lru, this just updates accounting.
When pages are being removed from a pool lru, they can be taken from
the parent objcg so this allows them to be uncharged from there and transfe=
rred
to a new child objcg.

Signed-off-by: Dave Airlie <airlied@redhat.com>
---
v2: use memcg_node_stat_items
v3: fix null ptr dereference in uncharge
---
 Documentation/admin-guide/cgroup-v2.rst |   6 ++
 include/linux/memcontrol.h              |  12 +++
 mm/memcontrol.c                         | 107 ++++++++++++++++++++++++
 3 files changed, 125 insertions(+)

diff --git a/Documentation/admin-guide/cgroup-v2.rst b/Documentation/admin-=
guide/cgroup-v2.rst
index 51c0bc4c2dc5..2b5f778fa00d 100644
--- a/Documentation/admin-guide/cgroup-v2.rst
+++ b/Documentation/admin-guide/cgroup-v2.rst
@@ -1551,6 +1551,12 @@ The following nested keys are defined.
 =09  vmalloc (npn)
 =09=09Amount of memory used for vmap backed memory.
=20
+=09  gpu_active (npn)
+=09=09Amount of system memory used for GPU devices.
+
+=09  gpu_reclaim (npn)
+=09=09Amount of system memory cached for GPU devices.
+
 =09  shmem
 =09=09Amount of cached filesystem data that is swap-backed,
 =09=09such as tmpfs, shm segments, shared anonymous mmap()s
diff --git a/include/linux/memcontrol.h b/include/linux/memcontrol.h
index 785173aa0739..d7cfb9925db5 100644
--- a/include/linux/memcontrol.h
+++ b/include/linux/memcontrol.h
@@ -1599,6 +1599,18 @@ struct sock;
 bool mem_cgroup_charge_skmem(struct mem_cgroup *memcg, unsigned int nr_pag=
es,
 =09=09=09     gfp_t gfp_mask);
 void mem_cgroup_uncharge_skmem(struct mem_cgroup *memcg, unsigned int nr_p=
ages);
+
+bool mem_cgroup_charge_gpu_page(struct obj_cgroup *objcg, struct page *pag=
e,
+=09=09=09   unsigned int nr_pages,
+=09=09=09   gfp_t gfp_mask, bool reclaim);
+void mem_cgroup_uncharge_gpu_page(struct page *page,
+=09=09=09=09  unsigned int nr_pages,
+=09=09=09=09  bool reclaim);
+bool mem_cgroup_move_gpu_page_reclaim(struct obj_cgroup *objcg,
+=09=09=09=09      struct page *page,
+=09=09=09=09      unsigned int order,
+=09=09=09=09      bool to_reclaim);
+
 #ifdef CONFIG_MEMCG
 extern struct static_key_false memcg_sockets_enabled_key;
 #define mem_cgroup_sockets_enabled static_branch_unlikely(&memcg_sockets_e=
nabled_key)
diff --git a/mm/memcontrol.c b/mm/memcontrol.c
index 8dd7fbed5a94..3d637c7e10cf 100644
--- a/mm/memcontrol.c
+++ b/mm/memcontrol.c
@@ -329,6 +329,8 @@ static const unsigned int memcg_node_stat_items[] =3D {
 #ifdef CONFIG_HUGETLB_PAGE
 =09NR_HUGETLB,
 #endif
+=09NR_GPU_ACTIVE,
+=09NR_GPU_RECLAIM,
 };
=20
 static const unsigned int memcg_stat_items[] =3D {
@@ -1340,6 +1342,8 @@ static const struct memory_stat memory_stats[] =3D {
 =09{ "percpu",=09=09=09MEMCG_PERCPU_B=09=09=09},
 =09{ "sock",=09=09=09MEMCG_SOCK=09=09=09},
 =09{ "vmalloc",=09=09=09MEMCG_VMALLOC=09=09=09},
+=09{ "gpu_active",=09=09=09NR_GPU_ACTIVE=09=09=09},
+=09{ "gpu_reclaim",=09=09NR_GPU_RECLAIM=09                },
 =09{ "shmem",=09=09=09NR_SHMEM=09=09=09},
 #ifdef CONFIG_ZSWAP
 =09{ "zswap",=09=09=09MEMCG_ZSWAP_B=09=09=09},
@@ -5064,6 +5068,109 @@ void mem_cgroup_uncharge_skmem(struct mem_cgroup *m=
emcg, unsigned int nr_pages)
 =09refill_stock(memcg, nr_pages);
 }
=20
+/**
+ * mem_cgroup_charge_gpu_page - charge a page to GPU memory tracking
+ * @objcg: objcg to charge, NULL charges root memcg
+ * @page: page to charge
+ * @order: page allocation order
+ * @gfp_mask: gfp mode
+ * @reclaim: charge the reclaim counter instead of the active one.
+ *
+ * Charge the order sized @page to the objcg. Returns %true if the charge =
fit within
+ * @objcg's configured limit, %false if it doesn't.
+ */
+bool mem_cgroup_charge_gpu_page(struct obj_cgroup *objcg, struct page *pag=
e,
+=09=09=09=09unsigned int order, gfp_t gfp_mask, bool reclaim)
+{
+=09unsigned int nr_pages =3D 1 << order;
+=09struct mem_cgroup *memcg =3D NULL;
+=09struct lruvec *lruvec;
+=09int ret;
+
+=09if (objcg) {
+=09=09memcg =3D get_mem_cgroup_from_objcg(objcg);
+
+=09=09ret =3D try_charge_memcg(memcg, gfp_mask, nr_pages);
+=09=09if (ret) {
+=09=09=09mem_cgroup_put(memcg);
+=09=09=09return false;
+=09=09}
+
+=09=09obj_cgroup_get(objcg);
+=09=09page_set_objcg(page, objcg);
+=09}
+
+=09lruvec =3D mem_cgroup_lruvec(memcg, page_pgdat(page));
+=09mod_lruvec_state(lruvec, reclaim ? NR_GPU_RECLAIM : NR_GPU_ACTIVE, nr_p=
ages);
+
+=09mem_cgroup_put(memcg);
+=09return true;
+}
+EXPORT_SYMBOL_GPL(mem_cgroup_charge_gpu_page);
+
+/**
+ * mem_cgroup_uncharge_gpu_page - uncharge a page from GPU memory tracking
+ * @page: page to uncharge
+ * @order: order of the page allocation
+ * @reclaim: uncharge the reclaim counter instead of the active.
+ */
+void mem_cgroup_uncharge_gpu_page(struct page *page,
+=09=09=09=09  unsigned int order, bool reclaim)
+{
+=09struct obj_cgroup *objcg =3D page_objcg(page);
+=09struct mem_cgroup *memcg;
+=09struct lruvec *lruvec;
+=09int nr_pages =3D 1 << order;
+
+=09memcg =3D objcg ? get_mem_cgroup_from_objcg(objcg) : NULL;
+
+=09lruvec =3D mem_cgroup_lruvec(memcg, page_pgdat(page));
+=09mod_lruvec_state(lruvec, reclaim ? NR_GPU_RECLAIM : NR_GPU_ACTIVE, -nr_=
pages);
+
+=09if (memcg && !mem_cgroup_is_root(memcg))
+=09=09refill_stock(memcg, nr_pages);
+=09page->memcg_data =3D 0;
+=09obj_cgroup_put(objcg);
+=09mem_cgroup_put(memcg);
+}
+EXPORT_SYMBOL_GPL(mem_cgroup_uncharge_gpu_page);
+
+/**
+ * mem_cgroup_move_gpu_reclaim - move pages from gpu to gpu reclaim and ba=
ck
+ * @new_objcg: objcg to move page to, NULL if just stats update.
+ * @nr_pages: number of pages to move
+ * @to_reclaim: true moves pages into reclaim, false moves them back
+ */
+bool mem_cgroup_move_gpu_page_reclaim(struct obj_cgroup *new_objcg,
+=09=09=09=09      struct page *page,
+=09=09=09=09      unsigned int order,
+=09=09=09=09      bool to_reclaim)
+{
+=09struct obj_cgroup *objcg =3D page_objcg(page);
+
+=09if (!objcg)
+=09=09return false;
+
+=09if (!new_objcg || objcg =3D=3D new_objcg) {
+=09=09struct mem_cgroup *memcg =3D get_mem_cgroup_from_objcg(objcg);
+=09=09struct lruvec *lruvec;
+=09=09unsigned long flags;
+=09=09int nr_pages =3D 1 << order;
+
+=09=09lruvec =3D mem_cgroup_lruvec(memcg, page_pgdat(page));
+=09=09local_irq_save(flags);
+=09=09__mod_lruvec_state(lruvec, to_reclaim ? NR_GPU_RECLAIM : NR_GPU_ACTI=
VE, nr_pages);
+=09=09__mod_lruvec_state(lruvec, to_reclaim ? NR_GPU_ACTIVE : NR_GPU_RECLA=
IM, -nr_pages);
+=09=09local_irq_restore(flags);
+=09=09mem_cgroup_put(memcg);
+=09=09return true;
+=09} else {
+=09=09mem_cgroup_uncharge_gpu_page(page, order, true);
+=09=09return mem_cgroup_charge_gpu_page(new_objcg, page, order, 0, false);
+=09}
+}
+EXPORT_SYMBOL_GPL(mem_cgroup_move_gpu_page_reclaim);
+
 static int __init cgroup_memory(char *s)
 {
 =09char *token;
--=20
2.50.1

