Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9670E661D38
	for <lists+dri-devel@lfdr.de>; Mon,  9 Jan 2023 05:04:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 60AA110E268;
	Mon,  9 Jan 2023 04:04:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from lgeamrelo11.lge.com (lgeamrelo11.lge.com [156.147.23.51])
 by gabe.freedesktop.org (Postfix) with ESMTP id B2C9E10E257
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
Subject: [PATCH RFC v7 18/23] dept: Apply timeout consideration to
 wait_for_completion()/complete()
Date: Mon,  9 Jan 2023 12:33:46 +0900
Message-Id: <1673235231-30302-19-git-send-email-byungchul.park@lge.com>
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

Now that CONFIG_DEPT_AGGRESSIVE_TIMEOUT_WAIT was introduced, apply the
consideration to wait_for_completion()/complete().

Signed-off-by: Byungchul Park <byungchul.park@lge.com>
---
 include/linux/completion.h | 21 +++++++++++++++++----
 1 file changed, 17 insertions(+), 4 deletions(-)

diff --git a/include/linux/completion.h b/include/linux/completion.h
index 0408f6d..57a715f 100644
--- a/include/linux/completion.h
+++ b/include/linux/completion.h
@@ -11,6 +11,7 @@
 
 #include <linux/swait.h>
 #include <linux/dept_sdt.h>
+#include <linux/sched.h>
 
 /*
  * struct completion - structure used to maintain state for a "completion"
@@ -153,7 +154,10 @@ extern long raw_wait_for_completion_killable_timeout(
 #define wait_for_completion_timeout(x, t)			\
 ({								\
 	unsigned long __ret;					\
-	sdt_might_sleep_strong(NULL);				\
+	if ((t) == MAX_SCHEDULE_TIMEOUT)			\
+		sdt_might_sleep_strong(NULL);			\
+	else							\
+		sdt_might_sleep_strong_timeout(NULL);		\
 	__ret = raw_wait_for_completion_timeout(x, t);		\
 	sdt_might_sleep_finish();				\
 	__ret;							\
@@ -161,7 +165,10 @@ extern long raw_wait_for_completion_killable_timeout(
 #define wait_for_completion_io_timeout(x, t)			\
 ({								\
 	unsigned long __ret;					\
-	sdt_might_sleep_strong(NULL);				\
+	if ((t) == MAX_SCHEDULE_TIMEOUT)			\
+		sdt_might_sleep_strong(NULL);			\
+	else							\
+		sdt_might_sleep_strong_timeout(NULL);		\
 	__ret = raw_wait_for_completion_io_timeout(x, t);	\
 	sdt_might_sleep_finish();				\
 	__ret;							\
@@ -169,7 +176,10 @@ extern long raw_wait_for_completion_killable_timeout(
 #define wait_for_completion_interruptible_timeout(x, t)		\
 ({								\
 	long __ret;						\
-	sdt_might_sleep_strong(NULL);				\
+	if ((t) == MAX_SCHEDULE_TIMEOUT)			\
+		sdt_might_sleep_strong(NULL);			\
+	else							\
+		sdt_might_sleep_strong_timeout(NULL);		\
 	__ret = raw_wait_for_completion_interruptible_timeout(x, t);\
 	sdt_might_sleep_finish();				\
 	__ret;							\
@@ -177,7 +187,10 @@ extern long raw_wait_for_completion_killable_timeout(
 #define wait_for_completion_killable_timeout(x, t)		\
 ({								\
 	long __ret;						\
-	sdt_might_sleep_strong(NULL);				\
+	if ((t) == MAX_SCHEDULE_TIMEOUT)			\
+		sdt_might_sleep_strong(NULL);			\
+	else							\
+		sdt_might_sleep_strong_timeout(NULL);		\
 	__ret = raw_wait_for_completion_killable_timeout(x, t);	\
 	sdt_might_sleep_finish();				\
 	__ret;							\
-- 
1.9.1

