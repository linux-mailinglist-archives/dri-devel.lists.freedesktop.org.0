Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UApcHG0wf2k8lQIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Sun, 01 Feb 2026 11:52:29 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 09DAEC5A63
	for <lists+dri-devel@lfdr.de>; Sun, 01 Feb 2026 11:52:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 45D2F10E149;
	Sun,  1 Feb 2026 10:52:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dggsgout12.his.huawei.com (dggsgout12.his.huawei.com
 [45.249.212.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C98DC10E0A7
 for <dri-devel@lists.freedesktop.org>; Sat, 31 Jan 2026 09:43:56 +0000 (UTC)
Received: from mail.maildlp.com (unknown [172.19.163.198])
 by dggsgout12.his.huawei.com (SkyGuard) with ESMTPS id 4f36vW1GWLzKHMXT
 for <dri-devel@lists.freedesktop.org>; Sat, 31 Jan 2026 17:26:31 +0800 (CST)
Received: from mail02.huawei.com (unknown [10.116.40.128])
 by mail.maildlp.com (Postfix) with ESMTP id 158E440576
 for <dri-devel@lists.freedesktop.org>; Sat, 31 Jan 2026 17:26:48 +0800 (CST)
Received: from hulk-vt.huawei.com (unknown [10.67.174.121])
 by APP4 (Coremail) with SMTP id gCh0CgD3V_jRyn1pwSIEFw--.14901S5;
 Sat, 31 Jan 2026 17:26:47 +0800 (CST)
From: Chen Ridong <chenridong@huaweicloud.com>
To: dev@lankhorst.se, mripard@kernel.org, natalie.vock@gmx.de, tj@kernel.org,
 hannes@cmpxchg.org, mkoutny@suse.com
Cc: cgroups@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, lujialin4@huawei.com,
 chenridong@huaweicloud.com
Subject: [PATCH -next 3/3] cgroup/dmem: avoid pool UAF
Date: Sat, 31 Jan 2026 09:12:02 +0000
Message-Id: <20260131091202.344788-4-chenridong@huaweicloud.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260131091202.344788-1-chenridong@huaweicloud.com>
References: <20260131091202.344788-1-chenridong@huaweicloud.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: gCh0CgD3V_jRyn1pwSIEFw--.14901S5
X-Coremail-Antispam: 1UD129KBjvJXoW3WrW5Cry3Jw1UJF47Gw15Arb_yoWxAF1UpF
 nIkFyYkr4rZr47Zrn2y3WDXF9ay3WkXa1Dt3yxCw4Fvr4xXw1rtF1Dt345tFy5GFZ7G347
 XF4YkrZrCFWYy3DanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUQm14x267AKxVWrJVCq3wAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87I2jVAFwI0_JrWl82xGYIkIc2
 x26xkF7I0E14v26ryj6s0DM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2z4x0
 Y4vE2Ix0cI8IcVAFwI0_tr0E3s1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr1j6F4UJw
 A2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x0267AKxVW0oVCq3wAS
 0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2
 IY67AKxVWUXVWUAwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0
 Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwACI402YVCY1x02628vn2kIc2
 xKxwCY1x0262kKe7AKxVWUtVW8ZwCF04k20xvY0x0EwIxGrwCF54CYxVCY1x0262kKe7AK
 xVWUtVW8ZwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I
 0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAI
 cVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcV
 CF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r4j6F4UMIIF0xvEx4A2jsIE
 c7CjxVAFwI0_Gr1j6F4UJbIYCTnIWIevJa73UjIFyTuYvjfUomiiDUUUU
X-CM-SenderInfo: hfkh02xlgr0w46kxt4xhlfz01xgou0bp/
X-Mailman-Approved-At: Sun, 01 Feb 2026 10:51:49 +0000
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
X-Spamd-Result: default: False [1.89 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	DATE_IN_PAST(1.00)[25];
	R_MISSING_CHARSET(0.50)[];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:dev@lankhorst.se,m:mripard@kernel.org,m:natalie.vock@gmx.de,m:tj@kernel.org,m:hannes@cmpxchg.org,m:mkoutny@suse.com,m:cgroups@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:lujialin4@huawei.com,m:chenridong@huaweicloud.com,s:lists@lfdr.de];
	DMARC_NA(0.00)[huaweicloud.com];
	TO_DN_NONE(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[lankhorst.se,kernel.org,gmx.de,cmpxchg.org,suse.com];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[chenridong@huaweicloud.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[chenridong@huaweicloud.com,dri-devel-bounces@lists.freedesktop.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	RCVD_COUNT_FIVE(0.00)[5];
	R_DKIM_NA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[huaweicloud.com:mid,huawei.com:email]
X-Rspamd-Queue-Id: 09DAEC5A63
X-Rspamd-Action: no action

From: Chen Ridong <chenridong@huawei.com>

An UAF issue was observed:

BUG: KASAN: slab-use-after-free in page_counter_uncharge+0x65/0x150
Write of size 8 at addr ffff888106715440 by task insmod/527

CPU: 4 UID: 0 PID: 527 Comm: insmod    6.19.0-rc7-next-20260129+ #11
Tainted: [O]=OOT_MODULE
Call Trace:
<TASK>
dump_stack_lvl+0x82/0xd0
kasan_report+0xca/0x100
kasan_check_range+0x39/0x1c0
page_counter_uncharge+0x65/0x150
dmem_cgroup_uncharge+0x1f/0x260

Allocated by task 527:

Freed by task 0:

The buggy address belongs to the object at ffff888106715400
which belongs to the cache kmalloc-512 of size 512
The buggy address is located 64 bytes inside of
freed 512-byte region [ffff888106715400, ffff888106715600)

The buggy address belongs to the physical page:

Memory state around the buggy address:
ffff888106715300: fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc
ffff888106715380: fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc
>ffff888106715400: fa fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
				     ^
ffff888106715480: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
ffff888106715500: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb

The issue occurs because a pool can still be held by a caller after its
associated memory region is unregistered. The current implementation frees
the pool even if users still hold references to it (e.g., before uncharge
operations complete).

This patch adds a reference counter to each pool, ensuring that a pool is
only freed when its reference count drops to zero.

Fixes: b168ed458dde ("kernel/cgroup: Add "dmem" memory accounting cgroup")
Signed-off-by: Chen Ridong <chenridong@huawei.com>
---
 kernel/cgroup/dmem.c | 60 ++++++++++++++++++++++++++++++++++++++++++--
 1 file changed, 58 insertions(+), 2 deletions(-)

diff --git a/kernel/cgroup/dmem.c b/kernel/cgroup/dmem.c
index b17f48bdef81..7fc13e4dce72 100644
--- a/kernel/cgroup/dmem.c
+++ b/kernel/cgroup/dmem.c
@@ -14,6 +14,7 @@
 #include <linux/mutex.h>
 #include <linux/page_counter.h>
 #include <linux/parser.h>
+#include <linux/refcount.h>
 #include <linux/rculist.h>
 #include <linux/slab.h>
 
@@ -71,7 +72,9 @@ struct dmem_cgroup_pool_state {
 	struct rcu_head rcu;
 
 	struct page_counter cnt;
+	struct dmem_cgroup_pool_state *parent;
 
+	refcount_t ref;
 	bool inited;
 };
 
@@ -88,6 +91,9 @@ struct dmem_cgroup_pool_state {
 static DEFINE_SPINLOCK(dmemcg_lock);
 static LIST_HEAD(dmem_cgroup_regions);
 
+static void dmemcg_free_region(struct kref *ref);
+static void dmemcg_pool_free_rcu(struct rcu_head *rcu);
+
 static inline struct dmemcg_state *
 css_to_dmemcs(struct cgroup_subsys_state *css)
 {
@@ -104,10 +110,38 @@ static struct dmemcg_state *parent_dmemcs(struct dmemcg_state *cg)
 	return cg->css.parent ? css_to_dmemcs(cg->css.parent) : NULL;
 }
 
+static void dmemcg_pool_get(struct dmem_cgroup_pool_state *pool)
+{
+	refcount_inc(&pool->ref);
+}
+
+static bool dmemcg_pool_tryget(struct dmem_cgroup_pool_state *pool)
+{
+	return refcount_inc_not_zero(&pool->ref);
+}
+
+static void dmemcg_pool_put(struct dmem_cgroup_pool_state *pool)
+{
+	if (!refcount_dec_and_test(&pool->ref))
+		return;
+
+	call_rcu(&pool->rcu, dmemcg_pool_free_rcu);
+}
+
+static void dmemcg_pool_free_rcu(struct rcu_head *rcu)
+{
+	struct dmem_cgroup_pool_state *pool = container_of(rcu, typeof(*pool), rcu);
+
+	if (pool->parent)
+		dmemcg_pool_put(pool->parent);
+	kref_put(&pool->region->ref, dmemcg_free_region);
+	kfree(pool);
+}
+
 static void free_cg_pool(struct dmem_cgroup_pool_state *pool)
 {
 	list_del(&pool->region_node);
-	kfree(pool);
+	dmemcg_pool_put(pool);
 }
 
 static void
@@ -342,6 +376,12 @@ alloc_pool_single(struct dmemcg_state *dmemcs, struct dmem_cgroup_region *region
 	page_counter_init(&pool->cnt,
 			  ppool ? &ppool->cnt : NULL, true);
 	reset_all_resource_limits(pool);
+	refcount_set(&pool->ref, 1);
+	kref_get(&region->ref);
+	if (ppool && !pool->parent) {
+		pool->parent = ppool;
+		dmemcg_pool_get(ppool);
+	}
 
 	list_add_tail_rcu(&pool->css_node, &dmemcs->pools);
 	list_add_tail(&pool->region_node, &region->pools);
@@ -389,6 +429,10 @@ get_cg_pool_locked(struct dmemcg_state *dmemcs, struct dmem_cgroup_region *regio
 
 		/* Fix up parent links, mark as inited. */
 		pool->cnt.parent = &ppool->cnt;
+		if (ppool && !pool->parent) {
+			pool->parent = ppool;
+			dmemcg_pool_get(ppool);
+		}
 		pool->inited = true;
 
 		pool = ppool;
@@ -435,6 +479,8 @@ void dmem_cgroup_unregister_region(struct dmem_cgroup_region *region)
 
 	list_for_each_entry_safe(pool, next, &region->pools, region_node) {
 		list_del_rcu(&pool->css_node);
+		list_del(&pool->region_node);
+		dmemcg_pool_put(pool);
 	}
 
 	/*
@@ -515,8 +561,10 @@ static struct dmem_cgroup_region *dmemcg_get_region_by_name(const char *name)
  */
 void dmem_cgroup_pool_state_put(struct dmem_cgroup_pool_state *pool)
 {
-	if (pool)
+	if (pool) {
 		css_put(&pool->cs->css);
+		dmemcg_pool_put(pool);
+	}
 }
 EXPORT_SYMBOL_GPL(dmem_cgroup_pool_state_put);
 
@@ -530,6 +578,8 @@ get_cg_pool_unlocked(struct dmemcg_state *cg, struct dmem_cgroup_region *region)
 	pool = find_cg_pool_locked(cg, region);
 	if (pool && !READ_ONCE(pool->inited))
 		pool = NULL;
+	if (pool && !dmemcg_pool_tryget(pool))
+		pool = NULL;
 	rcu_read_unlock();
 
 	while (!pool) {
@@ -538,6 +588,8 @@ get_cg_pool_unlocked(struct dmemcg_state *cg, struct dmem_cgroup_region *region)
 			pool = get_cg_pool_locked(cg, region, &allocpool);
 		else
 			pool = ERR_PTR(-ENODEV);
+		if (!IS_ERR(pool))
+			dmemcg_pool_get(pool);
 		spin_unlock(&dmemcg_lock);
 
 		if (pool == ERR_PTR(-ENOMEM)) {
@@ -573,6 +625,7 @@ void dmem_cgroup_uncharge(struct dmem_cgroup_pool_state *pool, u64 size)
 
 	page_counter_uncharge(&pool->cnt, size);
 	css_put(&pool->cs->css);
+	dmemcg_pool_put(pool);
 }
 EXPORT_SYMBOL_GPL(dmem_cgroup_uncharge);
 
@@ -624,7 +677,9 @@ int dmem_cgroup_try_charge(struct dmem_cgroup_region *region, u64 size,
 		if (ret_limit_pool) {
 			*ret_limit_pool = container_of(fail, struct dmem_cgroup_pool_state, cnt);
 			css_get(&(*ret_limit_pool)->cs->css);
+			dmemcg_pool_get(*ret_limit_pool);
 		}
+		dmemcg_pool_put(pool);
 		ret = -EAGAIN;
 		goto err;
 	}
@@ -721,6 +776,7 @@ static ssize_t dmemcg_limit_write(struct kernfs_open_file *of,
 
 		/* And commit */
 		apply(pool, new_limit);
+		dmemcg_pool_put(pool);
 
 out_put:
 		kref_put(&region->ref, dmemcg_free_region);
-- 
2.34.1

