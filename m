Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F65B782239
	for <lists+dri-devel@lfdr.de>; Mon, 21 Aug 2023 06:06:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 43DE610E1A9;
	Mon, 21 Aug 2023 04:06:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from invmail4.hynix.com (exvmail4.hynix.com [166.125.252.92])
 by gabe.freedesktop.org (Postfix) with ESMTP id AD86C10E193
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Aug 2023 04:04:59 +0000 (UTC)
X-AuditID: a67dfc5b-d6dff70000001748-6b-64e2ded5c594
From: Byungchul Park <byungchul@sk.com>
To: linux-kernel@vger.kernel.org
Subject: [RESEND PATCH v10 08/25] dept: Apply sdt_might_sleep_{start,
 end}() to PG_{locked, writeback} wait
Date: Mon, 21 Aug 2023 12:46:20 +0900
Message-Id: <20230821034637.34630-9-byungchul@sk.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230821034637.34630-1-byungchul@sk.com>
References: <20230821034637.34630-1-byungchul@sk.com>
X-Brightmail-Tracker: H4sIAAAAAAAAAzWSbVBMexzH/f/nsdVyZpnrVFxmPT9FnuY3GNfcwT0zxjDTeIHxsGOP2rm7
 1ZySYoyyIZFbmQp12R5m26klzvYiKVJjFUpYidliF7GjxLKRStoab37zme/3O59XP5ZQVVLB
 rC4qTpSiNHo1rSAV3YGFC592uLWLk7PmQubpxeD7mkpCfrmVhpYrZQisFckYPHf+gWe9XQj6
 mx4SkJvdgqDA1U5Ahb0DQY3lKA1P3owDh6+HhsbsUzQYi8ppePRhAIMzJwtDmbwJ7mcUYqjt
 e0dCroeGvFwjHj7vMfSZSxkwJ80Et+UCAwOuMGjsaKWg5sV8OH/RSUN1TSMJ9ko3hidV+TR0
 WIcouG9vIKElM52Cyx8LafjQaybA7Oth4HGtCcPVlGHR8S8/KbibXovhePE1DI7nNxDcTH2F
 Qba20lDv68Jgk7MJ+FFyB4H7TDcDx073MZCXfAbBqWM5JDwcvEtBinM59H/Pp9euFOq7eggh
 xXZAqOk1kcK9Ql64fqGdEVJuvmAEk7xfsFnmCUXVHiwUeH2UIJeepAXZm8UIad0OLHxsbmaE
 hnP9pPDGkYu3hGxXrNaKel28KC1as0cRmTfkIGIGlQn/t05PQs6xaSiA5bll/ODPkygNsSN8
 sXiTP6a52XxbWx/h54ncNN6W3kmlIQVLcCfG8pZPTbS/mMDp+P9eXkJ+JrmZvPy5AvtZyS3n
 292VzKh/Kl92tXZEFMCt4OUbVSN71fDms+s1OboxBvBPc2JGOYi/bWkjM5DShMaUIpUuKt6g
 0emXhUYmRukSQvdGG2Q0/E/mwwM7KpG3JbwOcSxSByr3THZrVZQmPjbRUId4llBPVIZ8c2lV
 Sq0m8aAoRe+W9uvF2DoUwpLqScolvQe0Ki5CEyf+K4oxovS7xWxAcBJaKh2qDn4Z96etIUj/
 lz01ceuucftC3z74w9gzftX4iDlNUkRYpzNovWv15IKinaYxkOmp33twmzHn75D4zjml31VS
 22ba2jTXNuX2p7eNqZe/hM9ybajKSLi1dIE9bMbzIbe7+MiVdc12sWShd8a+QEM09mZeK3eS
 ax0e+8rNhrMb1WRspCZsHiHFan4B8io5LUsDAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAAzWSfUzMcRzHfb+/x47jt6vxm+edNU+TmLOPeRiL+c6m+QtjpuN+000ld6SM
 SU/Sw5GtopJUTipPv5qFzm6lkvRAJw+r1DHEKZ0uTk+6Nv+899rer73/evOUKpuZyevDjkmG
 MG2ImlXQisC1scted9p1/gOJ0yAtxR9cA4k05NwtZaHlTgmC0vKzGHpqtsKbQQeCocZmCjLT
 WxBc7+6goLy2E4GlKIaF1k9TwebqY6E+PZmF2IK7LLz8PoyhPeMShhJ5OzRczMdgdX+hIbOH
 hezMWDweXzG4zcUcmKN9wV6UxcFw9wqo72xjoPpqPQOW90vhSm47C5WWehpqK+wYWh/lsNBZ
 OsZAQ+0zGlrSUhm43ZvPwvdBMwVmVx8Hr6x5GO7Fja8l/BploC7ViiGh8D4G27vHCJ4kdmGQ
 S9tYqHY5MJTJ6RT8vVmDwG76wUF8ipuD7LMmBMnxGTQ0j9QxENeugaE/OezGtaTa0UeRuLIT
 xDKYR5Pn+SJ5mNXBkbgn7zmSJx8nZUVLSEFlDybXnS6GyMXnWSI7L3Ek6YcNk96mJo48uzxE
 k0+2TLxj9h7FOp0Uoo+QDMs3BCmCs8dsVPiIMvJq24Jo1D45CfG8KKwScwu3JyEvnhUWim/f
 uikP+wjzxbLUz0wSUvCUcG6yWPSzkfUU3oJevPDhGvIwLfiKcn859rBS0Igd9grOw6IwTyy5
 Z50Y8hJWi/LjRxO+atzp7/5IX0SKPDSpGPnowyJCtfoQjZ/xcHBUmD7S7+CRUBmNX8Z8ejit
 Ag20bq1CAo/UU5RBs+06FaONMEaFViGRp9Q+ylm/u3UqpU4bdVIyHNlvOB4iGavQLJ5Wz1Bu
 2yUFqYRD2mPSYUkKlwz/W8x7zYxGm4f2ViVQu6drTdTcG7hJ6WeSUEBFW7/vogPivvVp3qcs
 Wc6VthkHYvxJTksr8nZsypizJvLCrVNev52BdX2RZ+b9HE3p6vLh7OcMDZU1MQ8WBfqFL9aY
 56bPf+dufhr/YsuCb6/H1h1NNI0UFDY6HQ29dtPSAH7NTt/9GtnKimraGKxdsYQyGLX/AOWw
 WiQuAwAA
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

