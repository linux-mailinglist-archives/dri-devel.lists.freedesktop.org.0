Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FBB9B3F372
	for <lists+dri-devel@lfdr.de>; Tue,  2 Sep 2025 06:10:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CAF4810E569;
	Tue,  2 Sep 2025 04:10:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-44.mimecast.com
 (us-smtp-delivery-44.mimecast.com [205.139.111.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2FFFE10E569
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Sep 2025 04:10:52 +0000 (UTC)
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-260-6Vo2mUcTMtOYyT8mjVn_wA-1; Tue,
 02 Sep 2025 00:10:47 -0400
X-MC-Unique: 6Vo2mUcTMtOYyT8mjVn_wA-1
X-Mimecast-MFC-AGG-ID: 6Vo2mUcTMtOYyT8mjVn_wA_1756786245
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id DB07F180044F; Tue,  2 Sep 2025 04:10:44 +0000 (UTC)
Received: from dreadlord.redhat.com (unknown [10.67.32.135])
 by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id BE02430001BB; Tue,  2 Sep 2025 04:10:37 +0000 (UTC)
From: Dave Airlie <airlied@gmail.com>
To: dri-devel@lists.freedesktop.org, tj@kernel.org, christian.koenig@amd.com,
 Johannes Weiner <hannes@cmpxchg.org>, Michal Hocko <mhocko@kernel.org>,
 Roman Gushchin <roman.gushchin@linux.dev>,
 Shakeel Butt <shakeel.butt@linux.dev>, Muchun Song <muchun.song@linux.dev>
Cc: cgroups@vger.kernel.org, Dave Chinner <david@fromorbit.com>,
 Waiman Long <longman@redhat.com>, simona@ffwll.ch
Subject: [PATCH 01/15] mm: add gpu active/reclaim per-node stat counters (v2)
Date: Tue,  2 Sep 2025 14:06:40 +1000
Message-ID: <20250902041024.2040450-2-airlied@gmail.com>
In-Reply-To: <20250902041024.2040450-1-airlied@gmail.com>
References: <20250902041024.2040450-1-airlied@gmail.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: hGbzeYrLX6_fbZzB5uy3RohKIFW6wXVv30mAFTwnyhs_1756786245
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
Acked-by: Zi Yan <ziy@nvidia.com>
Acked-by: Shakeel Butt <shakeel.butt@linux.dev>
Acked-by: Andrew Morton <akpm@linux-foundation.org>
Signed-off-by: Dave Airlie <airlied@redhat.com>

---

v2: add more info to the documentation on this memory.

I'd like to get acks to merge this via the drm tree, if possible,

Dave.
---
 Documentation/filesystems/proc.rst | 8 ++++++++
 drivers/base/node.c                | 5 +++++
 fs/proc/meminfo.c                  | 6 ++++++
 include/linux/mmzone.h             | 2 ++
 mm/show_mem.c                      | 9 +++++++--
 mm/vmstat.c                        | 2 ++
 6 files changed, 30 insertions(+), 2 deletions(-)

diff --git a/Documentation/filesystems/proc.rst b/Documentation/filesystems=
/proc.rst
index 2971551b7235..ae0aad28fe7d 100644
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
@@ -1275,6 +1277,12 @@ Unaccepted
               Memory that has not been accepted by the guest
 Balloon
               Memory returned to Host by VM Balloon Drivers
+GPUActive
+              System memory allocated to active GPU objects
+GPUReclaim
+              System memory stored in GPU pools for reuse. This memory is =
not
+              counted in GPUActive. It is shrinker reclaimable memory kept=
 in a reuse
+              pool because it has non-standard page table attributes, like=
 WC or UC.
 HugePages_Total, HugePages_Free, HugePages_Rsvd, HugePages_Surp, Hugepages=
ize, Hugetlb
               See Documentation/admin-guide/mm/hugetlbpage.rst.
 DirectMap4k, DirectMap2M, DirectMap1G
diff --git a/drivers/base/node.c b/drivers/base/node.c
index 3399594136b2..b2fa9d55666d 100644
--- a/drivers/base/node.c
+++ b/drivers/base/node.c
@@ -485,6 +485,8 @@ static ssize_t node_read_meminfo(struct device *dev,
 #ifdef CONFIG_UNACCEPTED_MEMORY
 =09=09=09     "Node %d Unaccepted:     %8lu kB\n"
 #endif
+=09=09=09     "Node %d GPUActive:      %8lu kB\n"
+=09=09=09     "Node %d GPUReclaim:     %8lu kB\n"
 =09=09=09     ,
 =09=09=09     nid, K(node_page_state(pgdat, NR_FILE_DIRTY)),
 =09=09=09     nid, K(node_page_state(pgdat, NR_WRITEBACK)),
@@ -518,6 +520,9 @@ static ssize_t node_read_meminfo(struct device *dev,
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
index a458f1e112fd..65ba49ec3a63 100644
--- a/fs/proc/meminfo.c
+++ b/fs/proc/meminfo.c
@@ -163,6 +163,12 @@ static int meminfo_proc_show(struct seq_file *m, void =
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
index 0c5da9141983..12f1b872f40f 100644
--- a/include/linux/mmzone.h
+++ b/include/linux/mmzone.h
@@ -245,6 +245,8 @@ enum node_stat_item {
 =09NR_HUGETLB,
 #endif
 =09NR_BALLOON_PAGES,
+=09NR_GPU_ACTIVE,          /* Pages assigned to GPU objects */
+=09NR_GPU_RECLAIM,         /* Pages in shrinkable GPU pools */
 =09NR_VM_NODE_STAT_ITEMS
 };
=20
diff --git a/mm/show_mem.c b/mm/show_mem.c
index 41999e94a56d..e63cc4e0f419 100644
--- a/mm/show_mem.c
+++ b/mm/show_mem.c
@@ -254,7 +254,9 @@ static void show_free_areas(unsigned int filter, nodema=
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
@@ -279,7 +281,10 @@ static void show_free_areas(unsigned int filter, nodem=
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
index 71cd1ceba191..8c95b731e723 100644
--- a/mm/vmstat.c
+++ b/mm/vmstat.c
@@ -1289,6 +1289,8 @@ const char * const vmstat_text[] =3D {
 =09[I(NR_HUGETLB)]=09=09=09=09=3D "nr_hugetlb",
 #endif
 =09[I(NR_BALLOON_PAGES)]=09=09=09=3D "nr_balloon_pages",
+=09[I(NR_GPU_ACTIVE)]=09=09=09=3D "nr_gpu_active",
+=09[I(NR_GPU_RECLAIM)]=09=09=09=3D "nr_gpu_reclaim",
 #undef I
=20
 =09/* system-wide enum vm_stat_item counters */
--=20
2.50.1

