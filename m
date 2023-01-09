Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E683D661D29
	for <lists+dri-devel@lfdr.de>; Mon,  9 Jan 2023 05:04:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F33F10E259;
	Mon,  9 Jan 2023 04:04:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from lgeamrelo11.lge.com (lgeamrelo11.lge.com [156.147.23.51])
 by gabe.freedesktop.org (Postfix) with ESMTP id B24ED10E254
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Jan 2023 04:03:54 +0000 (UTC)
Received: from unknown (HELO lgemrelse6q.lge.com) (156.147.1.121)
 by 156.147.23.51 with ESMTP; 9 Jan 2023 12:33:54 +0900
X-Original-SENDERIP: 156.147.1.121
X-Original-MAILFROM: byungchul.park@lge.com
Received: from unknown (HELO localhost.localdomain) (10.177.244.38)
 by 156.147.1.121 with ESMTP; 9 Jan 2023 12:33:54 +0900
X-Original-SENDERIP: 10.177.244.38
X-Original-MAILFROM: byungchul.park@lge.com
From: Byungchul Park <byungchul.park@lge.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH RFC v7 23/23] dept: Record the latest one out of consecutive
 waits of the same class
Date: Mon,  9 Jan 2023 12:33:51 +0900
Message-Id: <1673235231-30302-24-git-send-email-byungchul.park@lge.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1673235231-30302-1-git-send-email-byungchul.park@lge.com>
References: <1673235231-30302-1-git-send-email-byungchul.park@lge.com>
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
Cc: hamohammed.sa@gmail.com, jack@suse.cz, peterz@infradead.org,
 daniel.vetter@ffwll.ch, amir73il@gmail.com, david@fromorbit.com,
 dri-devel@lists.freedesktop.org, mhocko@kernel.org, linux-mm@kvack.org,
 linux-ide@vger.kernel.org, adilger.kernel@dilger.ca, chris.p.wilson@intel.com,
 joel@joelfernandes.org, 42.hyeyoo@gmail.com, cl@linux.com, will@kernel.org,
 duyuyang@gmail.com, sashal@kernel.org, paolo.valente@linaro.org,
 damien.lemoal@opensource.wdc.com, willy@infradead.org, hch@infradead.org,
 mingo@redhat.com, djwong@kernel.org, vdavydov.dev@gmail.com,
 rientjes@google.com, dennis@kernel.org, linux-ext4@vger.kernel.org,
 ngupta@vflare.org, johannes.berg@intel.com, dan.j.williams@intel.com,
 josef@toxicpanda.com, rostedt@goodmis.org, gwan-gyeong.mun@intel.com,
 linux-block@vger.kernel.org, linux-fsdevel@vger.kernel.org, jglisse@redhat.com,
 viro@zeniv.linux.org.uk, tglx@linutronix.de, vbabka@suse.cz,
 melissa.srw@gmail.com, sj@kernel.org, tytso@mit.edu,
 rodrigosiqueiramelo@gmail.com, kernel-team@lge.com, gregkh@linuxfoundation.org,
 jlayton@kernel.org, penberg@kernel.org, minchan@kernel.org, hannes@cmpxchg.org,
 tj@kernel.org, akpm@linux-foundation.org, torvalds@linux-foundation.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The current code records all the waits for later use to track relation
between waits and events in each context. However, since the same class
is handled the same way, it'd be okay to record only one on behalf of
the others if they all have the same class.

Even though it's the ideal to search the whole history buffer for that,
since it'd cost too high, alternatively, let's keep the latest one at
least when the same class'ed waits consecutively appear.

Signed-off-by: Byungchul Park <byungchul.park@lge.com>
---
 kernel/dependency/dept.c | 21 ++++++++++++++++++++-
 1 file changed, 20 insertions(+), 1 deletion(-)

diff --git a/kernel/dependency/dept.c b/kernel/dependency/dept.c
index cd25995..9cd37b4 100644
--- a/kernel/dependency/dept.c
+++ b/kernel/dependency/dept.c
@@ -1521,9 +1521,28 @@ static inline struct dept_wait_hist *new_hist(void)
 	return wh;
 }
 
+static inline struct dept_wait_hist *last_hist(void)
+{
+	int pos_n = hist_pos_next();
+	struct dept_wait_hist *wh_n = hist(pos_n);
+
+	/*
+	 * This is the first try.
+	 */
+	if (!pos_n && !wh_n->wait)
+		return NULL;
+
+	return hist(pos_n + DEPT_MAX_WAIT_HIST - 1);
+}
+
 static void add_hist(struct dept_wait *w, unsigned int wg, unsigned int ctxt_id)
 {
-	struct dept_wait_hist *wh = new_hist();
+	struct dept_wait_hist *wh;
+
+	wh = last_hist();
+
+	if (!wh || wh->wait->class != w->class || wh->ctxt_id != ctxt_id)
+		wh = new_hist();
 
 	if (likely(wh->wait))
 		put_wait(wh->wait);
-- 
1.9.1

