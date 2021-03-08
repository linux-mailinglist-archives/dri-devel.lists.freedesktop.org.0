Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5380F3318E5
	for <lists+dri-devel@lfdr.de>; Mon,  8 Mar 2021 21:55:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B36C26E3D0;
	Mon,  8 Mar 2021 20:55:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EX13-EDG-OU-002.vmware.com (ex13-edg-ou-002.vmware.com
 [208.91.0.190])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE2976E875
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Mar 2021 20:54:59 +0000 (UTC)
Received: from sc9-mailhost1.vmware.com (10.113.161.71) by
 EX13-EDG-OU-002.vmware.com (10.113.208.156) with Microsoft SMTP Server id
 15.0.1156.6; Mon, 8 Mar 2021 12:54:57 -0800
Received: from vertex.localdomain (unknown [10.16.119.57])
 by sc9-mailhost1.vmware.com (Postfix) with ESMTP id 2303F2040A;
 Mon,  8 Mar 2021 12:54:58 -0800 (PST)
From: Zack Rusin <zackr@vmware.com>
To: <linux-kernel@vger.kernel.org>
Subject: [PATCH 1/2] locking/rwsem: Add down_write_interruptible
Date: Mon, 8 Mar 2021 15:54:55 -0500
Message-ID: <20210308205456.1317366-2-zackr@vmware.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210308205456.1317366-1-zackr@vmware.com>
References: <20210308205456.1317366-1-zackr@vmware.com>
MIME-Version: 1.0
Received-SPF: None (EX13-EDG-OU-002.vmware.com: zackr@vmware.com does not
 designate permitted sender hosts)
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
Cc: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
 Will Deacon <will@kernel.org>, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add an interruptible version of down_write. It's the other
side of the already implemented down_read_interruptible.
It allows drivers which used custom locking code to
support interruptible rw semaphores to switch over
to rwsem.

Cc: Peter Zijlstra <peterz@infradead.org>
Cc: Ingo Molnar <mingo@redhat.com>
Cc: Will Deacon <will@kernel.org>
Cc: linux-kernel@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org
---
 include/linux/rwsem.h  |  1 +
 kernel/locking/rwsem.c | 23 +++++++++++++++++++++++
 2 files changed, 24 insertions(+)

diff --git a/include/linux/rwsem.h b/include/linux/rwsem.h
index 4c715be48717..753ae2cb8677 100644
--- a/include/linux/rwsem.h
+++ b/include/linux/rwsem.h
@@ -135,6 +135,7 @@ extern int down_read_trylock(struct rw_semaphore *sem);
  * lock for writing
  */
 extern void down_write(struct rw_semaphore *sem);
+extern int __must_check down_write_interruptible(struct rw_semaphore *sem);
 extern int __must_check down_write_killable(struct rw_semaphore *sem);
 
 /*
diff --git a/kernel/locking/rwsem.c b/kernel/locking/rwsem.c
index abba5df50006..0eadd20347de 100644
--- a/kernel/locking/rwsem.c
+++ b/kernel/locking/rwsem.c
@@ -1270,6 +1270,11 @@ static inline void __down_write(struct rw_semaphore *sem)
 	__down_write_common(sem, TASK_UNINTERRUPTIBLE);
 }
 
+static inline int __down_write_interruptible(struct rw_semaphore *sem)
+{
+	return __down_write_common(sem, TASK_INTERRUPTIBLE);
+}
+
 static inline int __down_write_killable(struct rw_semaphore *sem)
 {
 	return __down_write_common(sem, TASK_KILLABLE);
@@ -1408,6 +1413,24 @@ void __sched down_write(struct rw_semaphore *sem)
 }
 EXPORT_SYMBOL(down_write);
 
+/*
+ * interruptible lock for writing
+ */
+int __sched down_write_interruptible(struct rw_semaphore *sem)
+{
+	might_sleep();
+	rwsem_acquire(&sem->dep_map, 0, 0, _RET_IP_);
+
+	if (LOCK_CONTENDED_RETURN(sem, __down_write_trylock,
+				  __down_write_interruptible)) {
+		rwsem_release(&sem->dep_map, _RET_IP_);
+		return -EINTR;
+	}
+
+	return 0;
+}
+EXPORT_SYMBOL(down_write_interruptible);
+
 /*
  * lock for writing
  */
-- 
2.27.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
