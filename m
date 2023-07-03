Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B5DB0745906
	for <lists+dri-devel@lfdr.de>; Mon,  3 Jul 2023 11:50:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4CA4710E1F3;
	Mon,  3 Jul 2023 09:49:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from invmail4.hynix.com (exvmail4.skhynix.com [166.125.252.92])
 by gabe.freedesktop.org (Postfix) with ESMTP id 6D4F910E1F3
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Jul 2023 09:49:42 +0000 (UTC)
X-AuditID: a67dfc5b-d85ff70000001748-56-64a299b25f73
From: Byungchul Park <byungchul@sk.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v10 rebased on v6.4 08/25] dept: Apply sdt_might_sleep_{start,
 end}() to PG_{locked, writeback} wait
Date: Mon,  3 Jul 2023 18:47:35 +0900
Message-Id: <20230703094752.79269-9-byungchul@sk.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230703094752.79269-1-byungchul@sk.com>
References: <20230703094752.79269-1-byungchul@sk.com>
X-Brightmail-Tracker: H4sIAAAAAAAAAzWSa0yTZxTHfZ732mr1TSXbKySoXcgSzVAZmBO8xJgsPl5jtsQPmmzr1nej
 GVTSAgJqBCmgyEUxWJHiSjG1gw5ZSxYRqR1G5BJqHQ1DU8koTMcEUbQotzFg8uXkl/M/5/fp
 z1PKW0w4r9WlSHqdOlHFymn5yDLrJ65yq2ZjxwAPFwo3QujNGRrMNxws+OpqETgasjEM3dsF
 f4wPI5jqekCBqcyHoKr/CQUNrX0Imu2nWegeXA7+0CgL7WXnWMipvsHCw+fTGAKXSjHUOvdD
 53krBs/EMxpMQyxUmHLw3Pgbw4SthgNbVhQE7Vc4mO7fBO19PQw0P14P5VcDLNxubqeh9WYQ
 Q/ctMwt9jlkGOlvbaPBdKGLg5xdWFp6P2yiwhUY5+N1jwVBvnBPlvf6XgftFHgx5137B4H/U
 hMB95k8MTkcPC3dDwxhczjIKJq/fQxAsHuEgt3CCg4rsYgTnci/R8GDmPgPGQBxMvTOzO+LJ
 3eFRihhdx0jzuIUmHVaRNF55whGj+zFHLM5U4rKvI9W3hzCpGgsxxFlzliXOsVKOFIz4MXnh
 9XKk7fIUTQb9Jnww4rB8q0ZK1KZJ+g3bv5YnVMz6qeQZRXplz0dZKLC0AMl4UYgVvdketMiz
 pzupeWaFj8Xe3okFDhPWiK6ip0wBkvOUkL9UtL/sYueDlYJeLKmrX2BaiBJNz/zMPCuEOLHQ
 PfVeulqsrfcsiGTCZvGvd8ULe+XcTaC8j52XikK+TDzb2Ij/f1gl/mbvpc8jhQUtqUFKrS4t
 Sa1NjI1OyNBp06O/PZrkRHONsp2cPnITjfm+aEECj1TLFL3HqzRKRp1myEhqQSJPqcIUOf0/
 apQKjTojU9If/UqfmigZWlAET6s+VMSMH9Mohe/VKdIPkpQs6RdTzMvCs9AH0QWf79u8OzhJ
 7SzOjPyma8/Ffe2p3+V43Y0HVjAPt7w6NdnzKsborvOWtJ5qiKzc0l048HZ6pcaQ989gaf7O
 t/tnkz+ToirS9h6JRNvkKTHk1xMHrpW+3GZuk+5sCBPuxFLr1wbzTuw2h4fKZNyXOn/T8g6d
 5dBPb+I/bYp7lNvlU9GGBPWmdZTeoP4PmcZHNU0DAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAAzWSa0hTYRjHe99zznvmbHFYVgctqoUEXUwh7aEb9clDVCQEXSBytVMub7Wp
 aTe0qZm3VLBlzlKrKWqlsw928ZKiaZJarmUyR1ppomWZW81LpkZfHn78/39+nx4JJTcw7hJ1
 WISoCVOGKIiUlu7doltvyilUecf9WAeZqd5gH0uiwfCwjEDHg1IEZY/iMAw2+sM7xzCCiVft
 FOizOxAU9PZQ8KjJhqC6+DKBzk8LwGwfIdCSnUJAd+chgddDkxis17MwlJr2QGtGIYY65wAN
 +kECuXodnjlfMDiNJSwYYz2hr/gmC5O9PtBiszDQkNfCQHX3Wsi5ZSXwrLqFhqaqPgydTwwE
 bGXTDLQ2NdPQkZnGwP1vhQSGHEYKjPYRFt7U5WMoj5+xJf78w8CLtDoMiXcrMJjfP0VQk/QB
 g6nMQqDBPoyh0pRNwXhRI4K+9K8sJKQ6WciNS0eQknCdhvapFwzEW31h4reB7NgiNAyPUEJ8
 5Vmh2pFPCy8LeeHxzR5WiK/pZoV8U6RQWbxGuPNsEAsFo3ZGMJVcJYJpNIsVkr+asfCtrY0V
 mm9M0MInsx7vW3pYulUlhqijRM2G7YHSoNxpM3V6ShadZ1kVi6yuychFwnMb+enLrdQsE241
 39XlnGM3bgVfmdbPJCOphOKuuPLF31+R2WIhp+GvPSifY5rz5PUDZmaWZZwvn1ozgf5Jl/Ol
 5XVzIhfOj//8O30ul89srDk2koGk+WheCXJTh0WFKtUhvl7a4KCYMHW01/HwUBOa+RnjxcnM
 KjTW6V+POAlSzJd1nS9QyRlllDYmtB7xEkrhJtP13lbJZSplzDlRE35UExkiauuRh4RWLJHt
 OiAGyrmTyggxWBRPi5r/LZa4uMciv/TG/QG3kpOOuW4iHvd0207qd7/c6TEe0JyZMXXkuOWg
 1DIaWes6vvbQqCEj/PHCgrbn9x0/lGeKzEubPT9uDi7dTVXUXlokum93rDrhIldPRjvsFyo2
 Bp/I/Whpt833SVwmH+pPcFRtyMk65VjsjZ3h2oGpiF9vx1IO9p/rCfBfqaC1QUqfNZRGq/wL
 uvVjgC8DAAA=
X-CFilter-Loop: Reflected
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
Cc: hamohammed.sa@gmail.com, hdanton@sina.com, jack@suse.cz,
 peterz@infradead.org, daniel.vetter@ffwll.ch, amir73il@gmail.com,
 david@fromorbit.com, dri-devel@lists.freedesktop.org, mhocko@kernel.org,
 linux-mm@kvack.org, linux-ide@vger.kernel.org, adilger.kernel@dilger.ca,
 chris.p.wilson@intel.com, joel@joelfernandes.org, 42.hyeyoo@gmail.com,
 cl@linux.com, will@kernel.org, duyuyang@gmail.com, sashal@kernel.org,
 her0gyugyu@gmail.com, kernel_team@skhynix.com,
 damien.lemoal@opensource.wdc.com, willy@infradead.org, hch@infradead.org,
 mingo@redhat.com, djwong@kernel.org, vdavydov.dev@gmail.com,
 rientjes@google.com, dennis@kernel.org, linux-ext4@vger.kernel.org,
 ngupta@vflare.org, johannes.berg@intel.com, boqun.feng@gmail.com,
 dan.j.williams@intel.com, josef@toxicpanda.com, rostedt@goodmis.org,
 gwan-gyeong.mun@intel.com, linux-block@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, jglisse@redhat.com, viro@zeniv.linux.org.uk,
 longman@redhat.com, tglx@linutronix.de, vbabka@suse.cz, melissa.srw@gmail.com,
 sj@kernel.org, tytso@mit.edu, rodrigosiqueiramelo@gmail.com,
 kernel-team@lge.com, gregkh@linuxfoundation.org, jlayton@kernel.org,
 penberg@kernel.org, minchan@kernel.org, max.byungchul.park@gmail.com,
 hannes@cmpxchg.org, tj@kernel.org, akpm@linux-foundation.org,
 torvalds@linux-foundation.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Makes Dept able to track dependencies by PG_{locked,writeback} waits.

Signed-off-by: Byungchul Park <byungchul@sk.com>
---
 mm/filemap.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/mm/filemap.c b/mm/filemap.c
index 83dda76d1fc3..eed64dc88e43 100644
--- a/mm/filemap.c
+++ b/mm/filemap.c
@@ -44,6 +44,7 @@
 #include <linux/migrate.h>
 #include <linux/pipe_fs_i.h>
 #include <linux/splice.h>
+#include <linux/dept_sdt.h>
 #include <asm/pgalloc.h>
 #include <asm/tlbflush.h>
 #include "internal.h"
@@ -1219,6 +1220,9 @@ static inline bool folio_trylock_flag(struct folio *folio, int bit_nr,
 /* How many times do we accept lock stealing from under a waiter? */
 int sysctl_page_lock_unfairness = 5;
 
+static struct dept_map __maybe_unused PG_locked_map = DEPT_MAP_INITIALIZER(PG_locked_map, NULL);
+static struct dept_map __maybe_unused PG_writeback_map = DEPT_MAP_INITIALIZER(PG_writeback_map, NULL);
+
 static inline int folio_wait_bit_common(struct folio *folio, int bit_nr,
 		int state, enum behavior behavior)
 {
@@ -1230,6 +1234,11 @@ static inline int folio_wait_bit_common(struct folio *folio, int bit_nr,
 	unsigned long pflags;
 	bool in_thrashing;
 
+	if (bit_nr == PG_locked)
+		sdt_might_sleep_start(&PG_locked_map);
+	else if (bit_nr == PG_writeback)
+		sdt_might_sleep_start(&PG_writeback_map);
+
 	if (bit_nr == PG_locked &&
 	    !folio_test_uptodate(folio) && folio_test_workingset(folio)) {
 		delayacct_thrashing_start(&in_thrashing);
@@ -1331,6 +1340,8 @@ static inline int folio_wait_bit_common(struct folio *folio, int bit_nr,
 	 */
 	finish_wait(q, wait);
 
+	sdt_might_sleep_end();
+
 	if (thrashing) {
 		delayacct_thrashing_end(&in_thrashing);
 		psi_memstall_leave(&pflags);
-- 
2.17.1

