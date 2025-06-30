Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 59577AED391
	for <lists+dri-devel@lfdr.de>; Mon, 30 Jun 2025 06:51:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 93B5410E1E0;
	Mon, 30 Jun 2025 04:51:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-44.mimecast.com
 (us-smtp-delivery-44.mimecast.com [205.139.111.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8FAD710E1DF
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Jun 2025 04:51:22 +0000 (UTC)
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-474-OVlZyoAxNf6HWFeTCtMgHw-1; Mon,
 30 Jun 2025 00:51:19 -0400
X-MC-Unique: OVlZyoAxNf6HWFeTCtMgHw-1
X-Mimecast-MFC-AGG-ID: OVlZyoAxNf6HWFeTCtMgHw_1751259078
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 313201956096; Mon, 30 Jun 2025 04:51:18 +0000 (UTC)
Received: from dreadlord.redhat.com (unknown [10.67.24.96])
 by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id ECC2B1956095; Mon, 30 Jun 2025 04:51:12 +0000 (UTC)
From: Dave Airlie <airlied@gmail.com>
To: dri-devel@lists.freedesktop.org, linux-mm@kvack.org,
 Johannes Weiner <hannes@cmpxchg.org>,
 Christian Koenig <christian.koenig@amd.com>
Cc: Dave Chinner <david@fromorbit.com>, Kairui Song <kasong@tencent.com>,
 Dave Airlie <airlied@redhat.com>
Subject: [PATCH 08/17] memcg: add support for GPU page counters.
Date: Mon, 30 Jun 2025 14:49:27 +1000
Message-ID: <20250630045005.1337339-9-airlied@gmail.com>
In-Reply-To: <20250630045005.1337339-1-airlied@gmail.com>
References: <20250630045005.1337339-1-airlied@gmail.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: DH2CZZn5GL4mADyBLieBINe5Mll94dLfF73HCJyGN30_1751259078
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
 Documentation/admin-guide/cgroup-v2.rst |   6 ++
 include/linux/memcontrol.h              |  14 +++
 mm/memcontrol.c                         | 110 ++++++++++++++++++++++++
 3 files changed, 130 insertions(+)

diff --git a/Documentation/admin-guide/cgroup-v2.rst b/Documentation/admin-=
guide/cgroup-v2.rst
index 0cc35a14afbe..d6f057c4fe2e 100644
--- a/Documentation/admin-guide/cgroup-v2.rst
+++ b/Documentation/admin-guide/cgroup-v2.rst
@@ -1542,6 +1542,12 @@ The following nested keys are defined.
 =09  vmalloc (npn)
 =09=09Amount of memory used for vmap backed memory.
=20
+=09  gpu (npn)
+=09=09Amount of system memory used for GPU devices.
+
+=09  gpu_reclaim (npn)
+=09=09Amount of system memory cached for GPU devices.
+
 =09  shmem
 =09=09Amount of cached filesystem data that is swap-backed,
 =09=09such as tmpfs, shm segments, shared anonymous mmap()s
diff --git a/include/linux/memcontrol.h b/include/linux/memcontrol.h
index 87b6688f124a..ff82d603910d 100644
--- a/include/linux/memcontrol.h
+++ b/include/linux/memcontrol.h
@@ -36,6 +36,8 @@ enum memcg_stat_item {
 =09MEMCG_SOCK,
 =09MEMCG_PERCPU_B,
 =09MEMCG_VMALLOC,
+=09MEMCG_GPU,
+=09MEMCG_GPU_RECLAIM,
 =09MEMCG_KMEM,
 =09MEMCG_ZSWAP_B,
 =09MEMCG_ZSWAPPED,
@@ -1597,6 +1599,18 @@ struct sock;
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
index 902da8a9c643..87d75963a9ed 100644
--- a/mm/memcontrol.c
+++ b/mm/memcontrol.c
@@ -337,6 +337,8 @@ static const unsigned int memcg_stat_items[] =3D {
 =09MEMCG_SOCK,
 =09MEMCG_PERCPU_B,
 =09MEMCG_VMALLOC,
+=09MEMCG_GPU,
+=09MEMCG_GPU_RECLAIM,
 =09MEMCG_KMEM,
 =09MEMCG_ZSWAP_B,
 =09MEMCG_ZSWAPPED,
@@ -1345,6 +1347,8 @@ static const struct memory_stat memory_stats[] =3D {
 =09{ "percpu",=09=09=09MEMCG_PERCPU_B=09=09=09},
 =09{ "sock",=09=09=09MEMCG_SOCK=09=09=09},
 =09{ "vmalloc",=09=09=09MEMCG_VMALLOC=09=09=09},
+=09{ "gpu",=09=09=09MEMCG_GPU=09=09=09},
+=09{ "gpu_reclaim",=09=09MEMCG_GPU_RECLAIM=09=09},
 =09{ "shmem",=09=09=09NR_SHMEM=09=09=09},
 #ifdef CONFIG_ZSWAP
 =09{ "zswap",=09=09=09MEMCG_ZSWAP_B=09=09=09},
@@ -5132,6 +5136,112 @@ void mem_cgroup_uncharge_skmem(struct mem_cgroup *m=
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
+=09struct mem_cgroup *memcg;
+=09int ret;
+
+        if (!objcg) {
+=09=09mod_memcg_state(root_mem_cgroup, reclaim ? MEMCG_GPU_RECLAIM : MEMCG=
_GPU, nr_pages);
+=09=09return true;
+=09}
+
+=09memcg =3D get_mem_cgroup_from_objcg(objcg);
+=09ret =3D try_charge_memcg(memcg, gfp_mask, nr_pages);
+=09if (ret) {
+=09=09css_put(&memcg->css);
+=09=09return false;
+=09}
+
+=09if (page) {
+=09=09obj_cgroup_get(objcg);
+=09=09page_set_objcg(page, objcg);
+=09}
+
+=09mod_memcg_state(memcg, reclaim ? MEMCG_GPU_RECLAIM : MEMCG_GPU, nr_page=
s);
+=09css_put(&memcg->css);
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
+
+=09int nr_pages =3D 1 << order;
+=09if (!objcg) {
+=09=09mod_memcg_state(root_mem_cgroup, reclaim ? MEMCG_GPU_RECLAIM : MEMCG=
_GPU, -nr_pages);
+=09=09return;
+=09}
+
+=09memcg =3D get_mem_cgroup_from_objcg(objcg);
+
+=09mod_memcg_state(memcg, reclaim ? MEMCG_GPU_RECLAIM : MEMCG_GPU, -nr_pag=
es);
+
+=09if (page) {
+=09=09page->memcg_data =3D 0;
+=09=09obj_cgroup_put(objcg);
+=09}
+=09if (!mem_cgroup_is_root(memcg))
+=09=09refill_stock(memcg, nr_pages);
+=09css_put(&memcg->css);
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
+=09struct mem_cgroup *memcg;
+=09int nr_pages =3D 1 << order;
+=09bool ret =3D true;
+
+=09if (!objcg)
+=09=09return false;
+
+=09memcg =3D get_mem_cgroup_from_objcg(objcg);
+=09if (!new_objcg || objcg =3D=3D new_objcg) {
+=09=09mod_memcg_state(memcg, to_reclaim ? MEMCG_GPU_RECLAIM : MEMCG_GPU, n=
r_pages);
+=09=09mod_memcg_state(memcg, to_reclaim ? MEMCG_GPU : MEMCG_GPU_RECLAIM, -=
nr_pages);
+=09} else {
+=09=09mem_cgroup_uncharge_gpu_page(page, order, true);
+
+=09=09ret =3D mem_cgroup_charge_gpu_page(new_objcg, page, order, 0, false)=
;
+=09}
+=09css_put(&memcg->css);
+=09return ret;
+}
+EXPORT_SYMBOL_GPL(mem_cgroup_move_gpu_page_reclaim);
+
 static int __init cgroup_memory(char *s)
 {
 =09char *token;
--=20
2.49.0

