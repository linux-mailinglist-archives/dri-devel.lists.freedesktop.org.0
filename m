Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E8EF39B0435
	for <lists+dri-devel@lfdr.de>; Fri, 25 Oct 2024 15:34:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD5D610EAFB;
	Fri, 25 Oct 2024 13:34:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 1108 seconds by postgrey-1.36 at gabe;
 Thu, 24 Oct 2024 13:41:26 UTC
Received: from dggsgout11.his.huawei.com (dggsgout11.his.huawei.com
 [45.249.212.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 53D2F10E94C;
 Thu, 24 Oct 2024 13:41:26 +0000 (UTC)
Received: from mail.maildlp.com (unknown [172.19.163.235])
 by dggsgout11.his.huawei.com (SkyGuard) with ESMTP id 4XZ68j4wwhz4f3nbV;
 Thu, 24 Oct 2024 21:24:53 +0800 (CST)
Received: from mail02.huawei.com (unknown [10.116.40.128])
 by mail.maildlp.com (Postfix) with ESMTP id EF20F1A058E;
 Thu, 24 Oct 2024 21:25:11 +0800 (CST)
Received: from huaweicloud.com (unknown [10.175.104.67])
 by APP4 (Coremail) with SMTP id gCh0CgD3LMmxShpnmfz6Ew--.42902S7;
 Thu, 24 Oct 2024 21:25:11 +0800 (CST)
From: Yu Kuai <yukuai1@huaweicloud.com>
To: stable@vger.kernel.org, gregkh@linuxfoundation.org, harry.wentland@amd.com,
 sunpeng.li@amd.com, Rodrigo.Siqueira@amd.com, alexander.deucher@amd.com,
 christian.koenig@amd.com, Xinhui.Pan@amd.com, airlied@gmail.com,
 daniel@ffwll.ch, viro@zeniv.linux.org.uk, brauner@kernel.org,
 Liam.Howlett@oracle.com, akpm@linux-foundation.org, hughd@google.com,
 willy@infradead.org, sashal@kernel.org, srinivasan.shanmugam@amd.com,
 chiahsuan.chung@amd.com, mingo@kernel.org, mgorman@techsingularity.net,
 yukuai3@huawei.com, chengming.zhou@linux.dev, zhangpeng.00@bytedance.com,
 chuck.lever@oracle.com
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 maple-tree@lists.infradead.org, linux-mm@kvack.org,
 yukuai1@huaweicloud.com, yi.zhang@huawei.com, yangerkun@huawei.com
Subject: [PATCH 6.6 19/28] maple_tree: mtree_range_walk() clean up
Date: Thu, 24 Oct 2024 21:22:16 +0800
Message-Id: <20241024132225.2271667-4-yukuai1@huaweicloud.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20241024132225.2271667-1-yukuai1@huaweicloud.com>
References: <20241024132009.2267260-1-yukuai1@huaweicloud.com>
 <20241024132225.2271667-1-yukuai1@huaweicloud.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: gCh0CgD3LMmxShpnmfz6Ew--.42902S7
X-Coremail-Antispam: 1UD129KBjvJXoW7tFW5Kr47Zr1fKFyDCw1rZwb_yoW8KFWfpF
 nxW345KF9xJF17Crs3Ka1kJrySg3ZxGrWUAa4UGryrZryaywnYg3ZYvryfua98K345A34Y
 gF43Zw1xW3WIyFJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUmY14x267AKxVWrJVCq3wAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87I2jVAFwI0_JrWl82xGYIkIc2
 x26xkF7I0E14v26ryj6s0DM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2z4x0
 Y4vE2Ix0cI8IcVAFwI0_Ar0_tr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Cr1j6rxdM2
 8EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv6xkF7I0E14v26rxl6s0DM2AI
 xVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20x
 vE14v26r1Y6r17McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xv
 r2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7M4IIrI8v6xkF7I0E8cxan2IY04
 v7MxkF7I0En4kS14v26rWY6Fy7MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j
 6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7
 AF67AKxVWrXVW8Jr1lIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVW5JVW7JwCI42IY
 6xIIjxv20xvEc7CjxVAFwI0_Cr1j6rxdMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42
 IY6I8E87Iv67AKxVW8JVWxJwCI42IY6I8E87Iv6xkF7I0E14v26F4UJVW0obIYCTnIWIev
 Ja73UjIFyTuYvjTRXID7UUUUU
X-CM-SenderInfo: 51xn3trlr6x35dzhxuhorxvhhfrp/
X-Mailman-Approved-At: Fri, 25 Oct 2024 13:32:49 +0000
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

From: "Liam R. Howlett" <Liam.Howlett@oracle.com>

commit a3c63c8c5df6406e79490456a1fc41a287676070 upstream.

mtree_range_walk() needed to be updated to avoid checking if there was a
pivot value.  On closer examination, the code could avoid setting min or
max in certain scenarios.  The commit removes the extra check for
pivot[offset] before setting max and only sets max when necessary.  It
also only sets min if it is necessary by checking offset 0 prior to the
loop (as it has always done).

The commit also drops a dead node check since the end of the node will
return the array size when the last slot is occupied (by a potential reuse
in a dead node).  The data will be discarded later if the node is marked
dead.

Benchmarking these changes results in an increase in performance of 5.45%
using the BENCH_WALK in the maple tree test code.

Link: https://lkml.kernel.org/r/20231101171629.3612299-13-Liam.Howlett@oracle.com
Signed-off-by: Liam R. Howlett <Liam.Howlett@oracle.com>
Cc: Peng Zhang <zhangpeng.00@bytedance.com>
Signed-off-by: Andrew Morton <akpm@linux-foundation.org>
Signed-off-by: Yu Kuai <yukuai3@huawei.com>
---
 lib/maple_tree.c | 27 ++++++++++++---------------
 1 file changed, 12 insertions(+), 15 deletions(-)

diff --git a/lib/maple_tree.c b/lib/maple_tree.c
index ad8bf3413889..d90f4b7e7511 100644
--- a/lib/maple_tree.c
+++ b/lib/maple_tree.c
@@ -2806,32 +2806,29 @@ static inline void *mtree_range_walk(struct ma_state *mas)
 	min = mas->min;
 	max = mas->max;
 	do {
-		offset = 0;
 		last = next;
 		node = mte_to_node(next);
 		type = mte_node_type(next);
 		pivots = ma_pivots(node, type);
 		end = ma_data_end(node, type, pivots, max);
-		if (unlikely(ma_dead_node(node)))
-			goto dead_node;
-
-		if (pivots[offset] >= mas->index) {
-			prev_max = max;
-			prev_min = min;
-			max = pivots[offset];
+		prev_min = min;
+		prev_max = max;
+		if (pivots[0] >= mas->index) {
+			offset = 0;
+			max = pivots[0];
 			goto next;
 		}
 
-		do {
+		offset = 1;
+		while (offset < end) {
+			if (pivots[offset] >= mas->index) {
+				max = pivots[offset];
+				break;
+			}
 			offset++;
-		} while ((offset < end) && (pivots[offset] < mas->index));
+		}
 
-		prev_min = min;
 		min = pivots[offset - 1] + 1;
-		prev_max = max;
-		if (likely(offset < end && pivots[offset]))
-			max = pivots[offset];
-
 next:
 		slots = ma_slots(node, type);
 		next = mt_slot(mas->tree, slots, offset);
-- 
2.39.2

