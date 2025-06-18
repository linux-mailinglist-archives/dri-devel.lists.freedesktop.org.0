Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 32211ADE1F6
	for <lists+dri-devel@lfdr.de>; Wed, 18 Jun 2025 06:06:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E2E3510E097;
	Wed, 18 Jun 2025 04:06:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-44.mimecast.com
 (us-smtp-delivery-44.mimecast.com [207.211.30.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C10110E097
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Jun 2025 04:06:35 +0000 (UTC)
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-609-ttFkMfe9P36aYmWnS4EreQ-1; Wed,
 18 Jun 2025 00:06:30 -0400
X-MC-Unique: ttFkMfe9P36aYmWnS4EreQ-1
X-Mimecast-MFC-AGG-ID: ttFkMfe9P36aYmWnS4EreQ_1750219589
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 5293019560B5; Wed, 18 Jun 2025 04:06:29 +0000 (UTC)
Received: from dreadlord.redhat.com (unknown [10.67.24.91])
 by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 8D161180045B; Wed, 18 Jun 2025 04:06:22 +0000 (UTC)
From: Dave Airlie <airlied@gmail.com>
To: dri-devel@lists.freedesktop.org
Cc: Dave Airlie <airlied@redhat.com>,
 Christian Koenig <christian.koenig@amd.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Johannes Weiner <hannes@cmpxchg.org>, linux-mm@kvack.org,
 Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH 1/2] mm: add gpu active/reclaim per-node stat counters
Date: Wed, 18 Jun 2025 14:06:17 +1000
Message-ID: <20250618040618.564650-1-airlied@gmail.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: ufsAKudT539mbAuiGhUwUeCiKZBEvPUj_Dqqgv9bwrA_1750219589
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

While discussing memcg intergration with gpu memory allocations,
it was pointed out that there was no numa/system counters for
GPU memory allocations.

With more integrated memory GPU server systems turning up, and
more requirements for memory tracking it seems we should start
closing the gap.

Add two counters to track GPU per-node system memory allocations.

The first is currently allocated to GPU objects, and the second
is for memory that is stored in GPU page pools that can be reclaimed,
by the shrinker.

Cc: Christian Koenig <christian.koenig@amd.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Johannes Weiner <hannes@cmpxchg.org>
Cc: linux-mm@kvack.org
Cc: Andrew Morton <akpm@linux-foundation.org>
Signed-off-by: Dave Airlie <airlied@redhat.com>

---

I'd like to get acks to merge this via the drm tree, if possible,

Dave.
---
 Documentation/filesystems/proc.rst | 6 ++++++
 drivers/base/node.c                | 5 +++++
 fs/proc/meminfo.c                  | 6 ++++++
 include/linux/mmzone.h             | 2 ++
 mm/show_mem.c                      | 9 +++++++--
 mm/vmstat.c                        | 2 ++
 6 files changed, 28 insertions(+), 2 deletions(-)

diff --git a/Documentation/filesystems/proc.rst b/Documentation/filesystems=
/proc.rst
index 5236cb52e357..45f61a19a790 100644
--- a/Documentation/filesystems/proc.rst
+++ b/Documentation/filesystems/proc.rst
@@ -1095,6 +1095,8 @@ Example output. You may not have all of these fields.
     CmaFree:               0 kB
     Unaccepted:            0 kB
     Balloon:               0 kB
+    GPUActive:             0 kB
+    GPUReclaim:            0 kB
     HugePages_Total:       0
     HugePages_Free:        0
     HugePages_Rsvd:        0
@@ -1273,6 +1275,10 @@ Unaccepted
               Memory that has not been accepted by the guest
 Balloon
               Memory returned to Host by VM Balloon Drivers
+GPUActive
+              Memory allocated to GPU objects
+GPUReclaim
+              Memory in GPU allocator pools that is reclaimable
 HugePages_Total, HugePages_Free, HugePages_Rsvd, HugePages_Surp, Hugepages=
ize, Hugetlb
               See Documentation/admin-guide/mm/hugetlbpage.rst.
 DirectMap4k, DirectMap2M, DirectMap1G
diff --git a/drivers/base/node.c b/drivers/base/node.c
index c19094481630..64406862314b 100644
--- a/drivers/base/node.c
+++ b/drivers/base/node.c
@@ -463,6 +463,8 @@ static ssize_t node_read_meminfo(struct device *dev,
 #ifdef CONFIG_UNACCEPTED_MEMORY
 =09=09=09     "Node %d Unaccepted:     %8lu kB\n"
 #endif
+=09=09=09     "Node %d GPUActive:      %8lu kB\n"
+=09=09=09     "Node %d GPUReclaim:     %8lu kB\n"
 =09=09=09     ,
 =09=09=09     nid, K(node_page_state(pgdat, NR_FILE_DIRTY)),
 =09=09=09     nid, K(node_page_state(pgdat, NR_WRITEBACK)),
@@ -496,6 +498,9 @@ static ssize_t node_read_meminfo(struct device *dev,
 =09=09=09     ,
 =09=09=09     nid, K(sum_zone_node_page_state(nid, NR_UNACCEPTED))
 #endif
+=09=09=09     ,
+=09=09=09     nid, K(node_page_state(pgdat, NR_GPU_ACTIVE)),
+=09=09=09     nid, K(node_page_state(pgdat, NR_GPU_RECLAIM))
 =09=09=09    );
 =09len +=3D hugetlb_report_node_meminfo(buf, len, nid);
 =09return len;
diff --git a/fs/proc/meminfo.c b/fs/proc/meminfo.c
index bc2bc60c36cc..334948744e55 100644
--- a/fs/proc/meminfo.c
+++ b/fs/proc/meminfo.c
@@ -164,6 +164,12 @@ static int meminfo_proc_show(struct seq_file *m, void =
*v)
 =09show_val_kb(m, "Balloon:        ",
 =09=09    global_node_page_state(NR_BALLOON_PAGES));
=20
+=09show_val_kb(m, "GPUActive:      ",
+=09=09    global_node_page_state(NR_GPU_ACTIVE));
+
+=09show_val_kb(m, "GPUReclaim:     ",
+=09=09    global_node_page_state(NR_GPU_RECLAIM));
+
 =09hugetlb_report_meminfo(m);
=20
 =09arch_report_meminfo(m);
diff --git a/include/linux/mmzone.h b/include/linux/mmzone.h
index 283913d42d7b..95c5e4813427 100644
--- a/include/linux/mmzone.h
+++ b/include/linux/mmzone.h
@@ -241,6 +241,8 @@ enum node_stat_item {
 =09NR_HUGETLB,
 #endif
 =09NR_BALLOON_PAGES,
+=09NR_GPU_ACTIVE,          /* GPU pages assigned to an object */
+=09NR_GPU_RECLAIM,         /* GPU pages in shrinkable pool */
 =09NR_VM_NODE_STAT_ITEMS
 };
=20
diff --git a/mm/show_mem.c b/mm/show_mem.c
index 0cf8bf5d832d..072d33a50148 100644
--- a/mm/show_mem.c
+++ b/mm/show_mem.c
@@ -255,7 +255,9 @@ static void show_free_areas(unsigned int filter, nodema=
sk_t *nodemask, int max_z
 =09=09=09" sec_pagetables:%lukB"
 =09=09=09" all_unreclaimable? %s"
 =09=09=09" Balloon:%lukB"
-=09=09=09"\n",
+=09=09        " gpu_active:%lukB"
+=09=09        " gpu_reclaim:%lukB"
+=09=09        "\n",
 =09=09=09pgdat->node_id,
 =09=09=09K(node_page_state(pgdat, NR_ACTIVE_ANON)),
 =09=09=09K(node_page_state(pgdat, NR_INACTIVE_ANON)),
@@ -281,7 +283,10 @@ static void show_free_areas(unsigned int filter, nodem=
ask_t *nodemask, int max_z
 =09=09=09K(node_page_state(pgdat, NR_PAGETABLE)),
 =09=09=09K(node_page_state(pgdat, NR_SECONDARY_PAGETABLE)),
 =09=09=09str_yes_no(pgdat->kswapd_failures >=3D MAX_RECLAIM_RETRIES),
-=09=09=09K(node_page_state(pgdat, NR_BALLOON_PAGES)));
+=09=09        K(node_page_state(pgdat, NR_BALLOON_PAGES)),
+=09=09        K(node_page_state(pgdat, NR_GPU_ACTIVE)),
+=09=09=09K(node_page_state(pgdat, NR_GPU_RECLAIM)));
+
 =09}
=20
 =09for_each_populated_zone(zone) {
diff --git a/mm/vmstat.c b/mm/vmstat.c
index 429ae5339bfe..25a74cf29473 100644
--- a/mm/vmstat.c
+++ b/mm/vmstat.c
@@ -1281,6 +1281,8 @@ const char * const vmstat_text[] =3D {
 =09"nr_hugetlb",
 #endif
 =09"nr_balloon_pages",
+=09"nr_gpu_active",
+=09"nr_gpu_reclaim",
 =09/* system-wide enum vm_stat_item counters */
 =09"nr_dirty_threshold",
 =09"nr_dirty_background_threshold",
--=20
2.49.0

