Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FCF1B2C11B
	for <lists+dri-devel@lfdr.de>; Tue, 19 Aug 2025 13:49:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E7D310E5BB;
	Tue, 19 Aug 2025 11:49:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from lankhorst.se (lankhorst.se [141.105.120.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A588D10E5BB;
 Tue, 19 Aug 2025 11:49:52 +0000 (UTC)
From: Maarten Lankhorst <dev@lankhorst.se>
To: Lucas De Marchi <lucas.demarchi@intel.com>,
 =?UTF-8?q?=27Thomas=20Hellstr=C3=B6m=27?= <thomas.hellstrom@linux.intel.com>, 
 Rodrigo Vivi <rodrigo.vivi@intel.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Maarten Lankhorst <dev@lankhorst.se>,
 Maxime Ripard <mripard@kernel.org>, Natalie Vock <natalie.vock@gmx.de>,
 Tejun Heo <tj@kernel.org>, Johannes Weiner <hannes@cmpxchg.org>,
 =?UTF-8?q?=27Michal=20Koutn=C3=BD=27?= <mkoutny@suse.com>,
 Michal Hocko <mhocko@kernel.org>,
 Roman Gushchin <roman.gushchin@linux.dev>,
 Shakeel Butt <shakeel.butt@linux.dev>, Muchun Song <muchun.song@linux.dev>,
 Andrew Morton <akpm@linux-foundation.org>,
 David Hildenbrand <david@redhat.com>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 "'Liam R . Howlett'" <Liam.Howlett@oracle.com>,
 Vlastimil Babka <vbabka@suse.cz>, Mike Rapoport <rppt@kernel.org>,
 Suren Baghdasaryan <surenb@google.com>,
 Thomas Zimmermann <tzimmermann@suse.de>
Cc: Michal Hocko <mhocko@suse.com>, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 cgroups@vger.kernel.org, linux-mm@kvack.org
Subject: [RFC 2/3] cgroup/dmem: Implement pinning device memory
Date: Tue, 19 Aug 2025 13:49:35 +0200
Message-ID: <20250819114932.597600-7-dev@lankhorst.se>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250819114932.597600-5-dev@lankhorst.se>
References: <20250819114932.597600-5-dev@lankhorst.se>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

Add a function to pin, and to unipn memory and adjust the calculations
in dmem_cgroup_state_evict_valuable().

Signed-off-by: Maarten Lankhorst <dev@lankhorst.se>
---
 include/linux/cgroup_dmem.h |  2 ++
 kernel/cgroup/dmem.c        | 57 +++++++++++++++++++++++++++++++++++--
 2 files changed, 56 insertions(+), 3 deletions(-)

diff --git a/include/linux/cgroup_dmem.h b/include/linux/cgroup_dmem.h
index dd4869f1d736e..a981bb692ba22 100644
--- a/include/linux/cgroup_dmem.h
+++ b/include/linux/cgroup_dmem.h
@@ -21,6 +21,8 @@ int dmem_cgroup_try_charge(struct dmem_cgroup_region *region, u64 size,
 			   struct dmem_cgroup_pool_state **ret_pool,
 			   struct dmem_cgroup_pool_state **ret_limit_pool);
 void dmem_cgroup_uncharge(struct dmem_cgroup_pool_state *pool, u64 size);
+int dmem_cgroup_try_pin(struct dmem_cgroup_pool_state *pool, u64 size);
+void dmem_cgroup_unpin(struct dmem_cgroup_pool_state *pool, u64 size);
 bool dmem_cgroup_state_evict_valuable(struct dmem_cgroup_pool_state *limit_pool,
 				      struct dmem_cgroup_pool_state *test_pool,
 				      bool ignore_low, bool *ret_hit_low);
diff --git a/kernel/cgroup/dmem.c b/kernel/cgroup/dmem.c
index 10b63433f0573..ec8b1ffec78de 100644
--- a/kernel/cgroup/dmem.c
+++ b/kernel/cgroup/dmem.c
@@ -147,6 +147,11 @@ static u64 get_resource_current(struct dmem_cgroup_pool_state *pool)
 	return pool ? page_counter_read(&pool->cnt) : 0;
 }
 
+static u64 get_resource_pinned(struct dmem_cgroup_pool_state *pool)
+{
+	return pool ? page_counter_pinned(&pool->cnt) : 0;
+}
+
 static void reset_all_resource_limits(struct dmem_cgroup_pool_state *rpool)
 {
 	set_resource_min(rpool, 0);
@@ -270,7 +275,7 @@ bool dmem_cgroup_state_evict_valuable(struct dmem_cgroup_pool_state *limit_pool,
 {
 	struct dmem_cgroup_pool_state *pool = test_pool;
 	struct page_counter *ctest;
-	u64 used, min, low;
+	u64 used, min, low, pinned;
 
 	/* Can always evict from current pool, despite limits */
 	if (limit_pool == test_pool)
@@ -296,16 +301,18 @@ bool dmem_cgroup_state_evict_valuable(struct dmem_cgroup_pool_state *limit_pool,
 
 	ctest = &test_pool->cnt;
 
+	/* Protection is calculated without pinned memory */
 	dmem_cgroup_calculate_protection(limit_pool, test_pool);
 
 	used = page_counter_read(ctest);
-	min = READ_ONCE(ctest->emin);
+	pinned = page_counter_pinned(ctest);
+	min = READ_ONCE(ctest->emin) + pinned;
 
 	if (used <= min)
 		return false;
 
 	if (!ignore_low) {
-		low = READ_ONCE(ctest->elow);
+		low = READ_ONCE(ctest->elow) + pinned;
 		if (used > low)
 			return true;
 
@@ -641,6 +648,41 @@ int dmem_cgroup_try_charge(struct dmem_cgroup_region *region, u64 size,
 }
 EXPORT_SYMBOL_GPL(dmem_cgroup_try_charge);
 
+/**
+ * dmem_cgroup_unpin() - Unpin from a pool.
+ * @pool: Pool to unpin.
+ * @size: Size to unpin.
+ *
+ * Undoes the effects of dmem_cgroup_try_pin.
+ * Must be called with the returned pool as argument,
+ * and same @index and @size.
+ */
+void dmem_cgroup_unpin(struct dmem_cgroup_pool_state *pool, u64 size)
+{
+	if (pool)
+		page_counter_unpin(&pool->cnt, size);
+}
+EXPORT_SYMBOL_GPL(dmem_cgroup_unpin);
+
+/**
+ * dmem_cgroup_try_pin() - Try pinning an existing allocation to a region.
+ * @pool: dmem region to pin
+ * @size: Size (in bytes) to pin.
+ *
+ * This function pins in @pool for a size of @size bytes.
+ *
+ * If the function succeeds, the memory is succesfully accounted as being pinned.
+ * The memory may not be uncharged before unpin is called.
+ *
+ * Return: 0 on success, -EAGAIN on hitting a limit, or a negative errno on failure.
+ */
+int dmem_cgroup_try_pin(struct dmem_cgroup_pool_state *pool, u64 size)
+{
+	return page_counter_try_pin(&pool->cnt, size) ? 0 : -EAGAIN;
+
+}
+EXPORT_SYMBOL_GPL(dmem_cgroup_try_pin);
+
 static int dmem_cgroup_region_capacity_show(struct seq_file *sf, void *v)
 {
 	struct dmem_cgroup_region *region;
@@ -756,6 +798,11 @@ static int dmem_cgroup_region_current_show(struct seq_file *sf, void *v)
 	return dmemcg_limit_show(sf, v, get_resource_current);
 }
 
+static int dmem_cgroup_region_pinned_show(struct seq_file *sf, void *v)
+{
+	return dmemcg_limit_show(sf, v, get_resource_pinned);
+}
+
 static int dmem_cgroup_region_min_show(struct seq_file *sf, void *v)
 {
 	return dmemcg_limit_show(sf, v, get_resource_min);
@@ -799,6 +846,10 @@ static struct cftype files[] = {
 		.name = "current",
 		.seq_show = dmem_cgroup_region_current_show,
 	},
+	{
+		.name = "pinned",
+		.seq_show = dmem_cgroup_region_pinned_show,
+	},
 	{
 		.name = "min",
 		.write = dmem_cgroup_region_min_write,
-- 
2.50.0

