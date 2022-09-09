Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F4115B3625
	for <lists+dri-devel@lfdr.de>; Fri,  9 Sep 2022 13:17:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A749310EC74;
	Fri,  9 Sep 2022 11:16:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B28E210EC72
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Sep 2022 11:16:45 +0000 (UTC)
Received: from dude02.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::28])
 by metis.ext.pengutronix.de with esmtp (Exim 4.92)
 (envelope-from <l.stach@pengutronix.de>)
 id 1oWc04-0002dP-2x; Fri, 09 Sep 2022 13:16:44 +0200
From: Lucas Stach <l.stach@pengutronix.de>
To: linux-mm@kvack.org,
	dri-devel@lists.freedesktop.org
Subject: [RFC PATCH 1/5] mm: add MM_DRIVERPAGES
Date: Fri,  9 Sep 2022 13:16:36 +0200
Message-Id: <20220909111640.3789791-2-l.stach@pengutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220909111640.3789791-1-l.stach@pengutronix.de>
References: <20220909111640.3789791-1-l.stach@pengutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:1101:1d::28
X-SA-Exim-Mail-From: l.stach@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: dri-devel@lists.freedesktop.org
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
Cc: Michal Hocko <mhocko@suse.com>, kernel@pengutronix.de,
 David Airlie <airlied@linux.ie>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 linux-fsdevel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This adds a mm counter for pages allocated by a driver on behalf of
a userspace task.

Especially with DRM drivers there can be large amounts of pages that
are never mapped into userspace and thus are not tracked by the usual
ANONPAGES mmap accounting, as those pages are only ever touched by the
device. They can make up a significant portion of the tasks resident
memory size, but are currently not visible in any of the memory
statistics visible to userspace and the OOM handling.

Add the counter to allow tracking such memory, which allows to make
more sensible decisions in the OOM handling as well as allowing
userspace some better insight into the real system memory usage.

Signed-off-by: Lucas Stach <l.stach@pengutronix.de>
---
 fs/proc/task_mmu.c            | 6 ++++--
 include/linux/mm.h            | 3 ++-
 include/linux/mm_types_task.h | 1 +
 kernel/fork.c                 | 1 +
 4 files changed, 8 insertions(+), 3 deletions(-)

diff --git a/fs/proc/task_mmu.c b/fs/proc/task_mmu.c
index a3398d0f1927..80b095a233bf 100644
--- a/fs/proc/task_mmu.c
+++ b/fs/proc/task_mmu.c
@@ -33,7 +33,8 @@ void task_mem(struct seq_file *m, struct mm_struct *mm)
 	unsigned long text, lib, swap, anon, file, shmem;
 	unsigned long hiwater_vm, total_vm, hiwater_rss, total_rss;
 
-	anon = get_mm_counter(mm, MM_ANONPAGES);
+	anon = get_mm_counter(mm, MM_ANONPAGES) +
+	       get_mm_counter(mm, MM_DRIVERPAGES);
 	file = get_mm_counter(mm, MM_FILEPAGES);
 	shmem = get_mm_counter(mm, MM_SHMEMPAGES);
 
@@ -94,7 +95,8 @@ unsigned long task_statm(struct mm_struct *mm,
 	*text = (PAGE_ALIGN(mm->end_code) - (mm->start_code & PAGE_MASK))
 								>> PAGE_SHIFT;
 	*data = mm->data_vm + mm->stack_vm;
-	*resident = *shared + get_mm_counter(mm, MM_ANONPAGES);
+	*resident = *shared + get_mm_counter(mm, MM_ANONPAGES) +
+		    get_mm_counter(mm, MM_DRIVERPAGES);
 	return mm->total_vm;
 }
 
diff --git a/include/linux/mm.h b/include/linux/mm.h
index 3bedc449c14d..2cc014d1ea27 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -2003,7 +2003,8 @@ static inline unsigned long get_mm_rss(struct mm_struct *mm)
 {
 	return get_mm_counter(mm, MM_FILEPAGES) +
 		get_mm_counter(mm, MM_ANONPAGES) +
-		get_mm_counter(mm, MM_SHMEMPAGES);
+		get_mm_counter(mm, MM_SHMEMPAGES) +
+		get_mm_counter(mm, MM_DRIVERPAGES);
 }
 
 static inline unsigned long get_mm_hiwater_rss(struct mm_struct *mm)
diff --git a/include/linux/mm_types_task.h b/include/linux/mm_types_task.h
index c1bc6731125c..420d88e79906 100644
--- a/include/linux/mm_types_task.h
+++ b/include/linux/mm_types_task.h
@@ -45,6 +45,7 @@ enum {
 	MM_ANONPAGES,	/* Resident anonymous pages */
 	MM_SWAPENTS,	/* Anonymous swap entries */
 	MM_SHMEMPAGES,	/* Resident shared memory pages */
+	MM_DRIVERPAGES,	/* pages allocated by a driver on behalf of a task */
 	NR_MM_COUNTERS
 };
 
diff --git a/kernel/fork.c b/kernel/fork.c
index 90c85b17bf69..74a07a2288ba 100644
--- a/kernel/fork.c
+++ b/kernel/fork.c
@@ -135,6 +135,7 @@ static const char * const resident_page_types[] = {
 	NAMED_ARRAY_INDEX(MM_ANONPAGES),
 	NAMED_ARRAY_INDEX(MM_SWAPENTS),
 	NAMED_ARRAY_INDEX(MM_SHMEMPAGES),
+	NAMED_ARRAY_INDEX(MM_DRIVERPAGES),
 };
 
 DEFINE_PER_CPU(unsigned long, process_counts) = 0;
-- 
2.30.2

