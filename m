Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kEPnElIwf2k8lQIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Sun, 01 Feb 2026 11:52:02 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F1715C5A30
	for <lists+dri-devel@lfdr.de>; Sun, 01 Feb 2026 11:52:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E5F4C10E12B;
	Sun,  1 Feb 2026 10:51:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dggsgout11.his.huawei.com (dggsgout11.his.huawei.com
 [45.249.212.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 57D6010E17F
 for <dri-devel@lists.freedesktop.org>; Sat, 31 Jan 2026 09:43:50 +0000 (UTC)
Received: from mail.maildlp.com (unknown [172.19.163.198])
 by dggsgout11.his.huawei.com (SkyGuard) with ESMTPS id 4f36v16Bt7zYQtm7
 for <dri-devel@lists.freedesktop.org>; Sat, 31 Jan 2026 17:26:05 +0800 (CST)
Received: from mail02.huawei.com (unknown [10.116.40.128])
 by mail.maildlp.com (Postfix) with ESMTP id EE31040576
 for <dri-devel@lists.freedesktop.org>; Sat, 31 Jan 2026 17:26:47 +0800 (CST)
Received: from hulk-vt.huawei.com (unknown [10.67.174.121])
 by APP4 (Coremail) with SMTP id gCh0CgD3V_jRyn1pwSIEFw--.14901S4;
 Sat, 31 Jan 2026 17:26:47 +0800 (CST)
From: Chen Ridong <chenridong@huaweicloud.com>
To: dev@lankhorst.se, mripard@kernel.org, natalie.vock@gmx.de, tj@kernel.org,
 hannes@cmpxchg.org, mkoutny@suse.com
Cc: cgroups@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, lujialin4@huawei.com,
 chenridong@huaweicloud.com
Subject: [PATCH -next 2/3] cgroup/dmem: avoid rcu warning when unregister
 region
Date: Sat, 31 Jan 2026 09:12:01 +0000
Message-Id: <20260131091202.344788-3-chenridong@huaweicloud.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260131091202.344788-1-chenridong@huaweicloud.com>
References: <20260131091202.344788-1-chenridong@huaweicloud.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: gCh0CgD3V_jRyn1pwSIEFw--.14901S4
X-Coremail-Antispam: 1UD129KBjvJXoW7uFyUtw18trWfGrWkArWxCrg_yoW8KF1Dpa
 98CFy3Gw4rZr47Za10yayrur95Za1kXw4UC397Gw43JFn7Gw1Yqan7Aa4YvFy5AFWa9w4a
 vFs0vr12kw48Aw7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUQm14x267AKxVWrJVCq3wAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87I2jVAFwI0_Jryl82xGYIkIc2
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
 c7CjxVAFwI0_Gr1j6F4UJbIYCTnIWIevJa73UjIFyTuYvjfUoa9aDUUUU
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[huaweicloud.com:mid]
X-Rspamd-Queue-Id: F1715C5A30
X-Rspamd-Action: no action

From: Chen Ridong <chenridong@huawei.com>

A warnning was detected:

 WARNING: suspicious RCU usage
 6.19.0-rc7-next-20260129+ #1101 Tainted: G           O
 kernel/cgroup/dmem.c:456 suspicious rcu_dereference_check() usage!

 other info that might help us debug this:

 rcu_scheduler_active = 2, debug_locks = 1
 1 lock held by insmod/532:
  #0: ffffffff85e78b38 (dmemcg_lock){+.+.}-dmem_cgroup_unregister_region+

 stack backtrace:
 CPU: 2 UID: 0 PID: 532 Comm: insmod Tainted: 6.19.0-rc7-next-
 Tainted: [O]=OOT_MODULE
 Call Trace:
  <TASK>
  dump_stack_lvl+0xb0/0xd0
  lockdep_rcu_suspicious+0x151/0x1c0
  dmem_cgroup_unregister_region+0x1e2/0x380
  ? __pfx_dmem_test_init+0x10/0x10 [dmem_uaf]
  dmem_test_init+0x65/0xff0 [dmem_uaf]
  do_one_initcall+0xbb/0x3a0

The macro list_for_each_rcu() must be used within an RCU read-side critical
section (between rcu_read_lock() and rcu_read_unlock()). Using it outside
that context, as seen in dmem_cgroup_unregister_region(), triggers the
lockdep warning because the RCU protection is not guaranteed.

Replace list_for_each_rcu() with list_for_each_entry_safe(), which is
appropriate for traversal under spinlock protection where nodes may be
deleted.

Fixes: b168ed458dde ("kernel/cgroup: Add "dmem" memory accounting cgroup")
Signed-off-by: Chen Ridong <chenridong@huawei.com>
---
 kernel/cgroup/dmem.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/kernel/cgroup/dmem.c b/kernel/cgroup/dmem.c
index 30f96627860c..b17f48bdef81 100644
--- a/kernel/cgroup/dmem.c
+++ b/kernel/cgroup/dmem.c
@@ -423,7 +423,7 @@ static void dmemcg_free_region(struct kref *ref)
  */
 void dmem_cgroup_unregister_region(struct dmem_cgroup_region *region)
 {
-	struct list_head *entry;
+	struct dmem_cgroup_pool_state *pool, *next;
 
 	if (!region)
 		return;
@@ -433,10 +433,7 @@ void dmem_cgroup_unregister_region(struct dmem_cgroup_region *region)
 	/* Remove from global region list */
 	list_del_rcu(&region->region_node);
 
-	list_for_each_rcu(entry, &region->pools) {
-		struct dmem_cgroup_pool_state *pool =
-			container_of(entry, typeof(*pool), region_node);
-
+	list_for_each_entry_safe(pool, next, &region->pools, region_node) {
 		list_del_rcu(&pool->css_node);
 	}
 
-- 
2.34.1

