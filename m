Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CFB07AD3C04
	for <lists+dri-devel@lfdr.de>; Tue, 10 Jun 2025 17:00:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 23ACE10E5A2;
	Tue, 10 Jun 2025 14:59:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="qsGoeAqN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 82E3D10E591;
 Tue, 10 Jun 2025 14:59:56 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 506045C41E3;
 Tue, 10 Jun 2025 14:57:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 019D8C4CEF6;
 Tue, 10 Jun 2025 14:59:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1749567595;
 bh=ob2J7Msv8h2cZKowGcg3nUnj/KyBV1iiFj/iRxCix9Q=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=qsGoeAqN/2CN0puEK0XlHTa1qGoG8bfo7dRj02BHIV1ZgHmXOpTQvXt9gbxEI/Jgk
 SAll1SyhelrX/tj4HaA3tmvjJYcTkwq5xRT3rp1PHEG7u5war2fvqluHol3afuOBPp
 AlktCdTIAR0Ljl29AVbofsmpfRoP6THSgxjfSlF+Ognwl1uNl89o39a0JsPrd/W26k
 N37XrR69Rnsr6JUHW9qTZwmmdi9xi+6EeoQ1MQVIt/POGwErbv31/ehwp1GgOUrxif
 gyENj3CeszHTud5gX8lBzfr9B8ZlyBwUPm2Ln5a5zCQ/XYGLBNE/gratKCRoPc0Asj
 XtJZiczyvvFPA==
From: Jeff Layton <jlayton@kernel.org>
Date: Tue, 10 Jun 2025 10:59:26 -0400
Subject: [PATCH v14 6/9] ref_tracker: automatically register a file in
 debugfs for a ref_tracker_dir
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250610-reftrack-dbgfs-v14-6-efb532861428@kernel.org>
References: <20250610-reftrack-dbgfs-v14-0-efb532861428@kernel.org>
In-Reply-To: <20250610-reftrack-dbgfs-v14-0-efb532861428@kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Simon Horman <horms@kernel.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Jani Nikula <jani.nikula@linux.intel.com>, 
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, 
 Rodrigo Vivi <rodrigo.vivi@intel.com>, 
 Tvrtko Ursulin <tursulin@ursulin.net>
Cc: Krzysztof Karas <krzysztof.karas@intel.com>, 
 Kuniyuki Iwashima <kuniyu@amazon.com>, Qasim Ijaz <qasdev00@gmail.com>, 
 Nathan Chancellor <nathan@kernel.org>, Andrew Lunn <andrew@lunn.ch>, 
 linux-kernel@vger.kernel.org, netdev@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org, 
 Jeff Layton <jlayton@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=8555; i=jlayton@kernel.org;
 h=from:subject:message-id; bh=ob2J7Msv8h2cZKowGcg3nUnj/KyBV1iiFj/iRxCix9Q=;
 b=owEBbQKS/ZANAwAKAQAOaEEZVoIVAcsmYgBoSEhcmmuM8Z5aF9Wr0CHZ2yxOD9QkATP6OhjEG
 7u5qWbEDHKJAjMEAAEKAB0WIQRLwNeyRHGyoYTq9dMADmhBGVaCFQUCaEhIXAAKCRAADmhBGVaC
 FT9ND/0TtO4WqgMGYyGM1SB88qkEkTv1o6pnZMFgt5k7UCy2YJkEVWpxuUYeVS4IxtLzBeF928l
 p6y6emxrASi5dBhTqjLkdApzwMsQ1eNG/NYP8VjeySldZNeT+U+u2b5KlB9Emsm8IVO3ptBYZ1F
 rjFh4cTLMQsDBiDJRqwyuU3EgEW/Isg1mjA5fKbL14+TzXCeMm4IhhLXqHQnhYN66/Lq6Q1FT3/
 FPSX+Zn9jy2zd1FToBAx9XUA5prCpjU//vDf5Rv4mM0bl5iyvJS3EXEpy9rZzxJTwk8tdK8ERJs
 Rav1Cpkyyu1GsaX+LyH/aZEIbhikF3GhFp2RvIFBmVn9LBKtM6ugIqq7x6eht8YUyfmDbXu+P85
 sLtRbItiVWHWdGpEstFKmvFmytv/ArE/xCYgmZC2iB1CM1fR0FwOLbI8fUgN758ywT3V0740lAt
 f8YEHmsnJ5RwuV3OoExcQV/OAJtwDrGmRsd3Wv7dkN01l799Xg19tCEjVjaV5ILEYiocKtEGBQx
 LrPJsVWbfUn3ofAIxUXAvJ4XRLYWIZXPJcqkTjAUf1ys7j5CR5CCFfwNf7TJB2H1pxuTH7xhEEC
 Bi7wp42R3F9FBXEXyy3vOB1ZlBo6S9joWMd85sfnXpiVGvbViSDPiIHQbjKrwGhPlBAyDkX/DjT
 /XAeGfna/8s6hFA==
X-Developer-Key: i=jlayton@kernel.org; a=openpgp;
 fpr=4BC0D7B24471B2A184EAF5D3000E684119568215
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

Currently, there is no convenient way to see the info that the
ref_tracking infrastructure collects. Attempt to create a file in
debugfs when called from ref_tracker_dir_init().

The file is given the name "class@%px", as having the unmodified address
is helpful for debugging. This should be safe since this directory is only
accessible by root

While ref_tracker_dir_init() is generally called from a context where
sleeping is OK, ref_tracker_dir_exit() can be called from anywhere.
Thus, dentry cleanup must be handled asynchronously.

Add a new global xarray that has entries with the ref_tracker_dir
pointer as the index and the corresponding debugfs dentry pointer as the
value. Instead of removing the debugfs dentry, have
ref_tracker_dir_exit() set a mark on the xarray entry and schedule a
workqueue job. The workqueue job then walks the xarray looking for
marked entries, and removes their xarray entries and the debugfs
dentries.

Because of this, the debugfs dentry can outlive the corresponding
ref_tracker_dir. Have ref_tracker_debugfs_show() take extra care to
ensure that it's safe to dereference the dir pointer before using it.

Signed-off-by: Jeff Layton <jlayton@kernel.org>
---
 include/linux/ref_tracker.h |  17 +++++
 lib/ref_tracker.c           | 147 ++++++++++++++++++++++++++++++++++++++++++--
 2 files changed, 159 insertions(+), 5 deletions(-)

diff --git a/include/linux/ref_tracker.h b/include/linux/ref_tracker.h
index 3968f993db81e95c0d58c81454311841c1b9cd35..28bbf436a8f4646cfac181d618195a9460bda196 100644
--- a/include/linux/ref_tracker.h
+++ b/include/linux/ref_tracker.h
@@ -26,6 +26,18 @@ struct ref_tracker_dir {
 
 #ifdef CONFIG_REF_TRACKER
 
+#ifdef CONFIG_DEBUG_FS
+
+void ref_tracker_dir_debugfs(struct ref_tracker_dir *dir);
+
+#else /* CONFIG_DEBUG_FS */
+
+static inline void ref_tracker_dir_debugfs(struct ref_tracker_dir *dir)
+{
+}
+
+#endif /* CONFIG_DEBUG_FS */
+
 static inline void ref_tracker_dir_init(struct ref_tracker_dir *dir,
 					unsigned int quarantine_count,
 					const char *class,
@@ -40,6 +52,7 @@ static inline void ref_tracker_dir_init(struct ref_tracker_dir *dir,
 	refcount_set(&dir->no_tracker, 1);
 	dir->class = class;
 	strscpy(dir->name, name, sizeof(dir->name));
+	ref_tracker_dir_debugfs(dir);
 	stack_depot_init();
 }
 
@@ -68,6 +81,10 @@ static inline void ref_tracker_dir_init(struct ref_tracker_dir *dir,
 {
 }
 
+static inline void ref_tracker_dir_debugfs(struct ref_tracker_dir *dir)
+{
+}
+
 static inline void ref_tracker_dir_exit(struct ref_tracker_dir *dir)
 {
 }
diff --git a/lib/ref_tracker.c b/lib/ref_tracker.c
index 73b606570cce9e551d13e65365a87dc4ce748b13..4f1c4fe5e6b1274b6aeb733a3f8c06d1dff003f5 100644
--- a/lib/ref_tracker.c
+++ b/lib/ref_tracker.c
@@ -29,6 +29,35 @@ struct ref_tracker_dir_stats {
 	} stacks[];
 };
 
+#ifdef CONFIG_DEBUG_FS
+#include <linux/xarray.h>
+
+/*
+ * ref_tracker_dir_init() is usually called in allocation-safe contexts, but
+ * the same is not true of ref_tracker_dir_exit() which can be called from
+ * anywhere an object is freed. Removing debugfs dentries is a blocking
+ * operation, so we defer that work to the debugfs_reap_worker.
+ *
+ * Each dentry is tracked in the appropriate xarray.  When
+ * ref_tracker_dir_exit() is called, its entries in the xarrays are marked and
+ * the workqueue job is scheduled. The worker then runs and deletes any marked
+ * dentries asynchronously.
+ */
+static struct xarray		debugfs_dentries;
+static struct work_struct	debugfs_reap_worker;
+
+#define REF_TRACKER_DIR_DEAD	XA_MARK_0
+static inline void ref_tracker_debugfs_mark(struct ref_tracker_dir *dir)
+{
+	xa_set_mark(&debugfs_dentries, (unsigned long)dir, REF_TRACKER_DIR_DEAD);
+	schedule_work(&debugfs_reap_worker);
+}
+#else
+static inline void ref_tracker_debugfs_mark(struct ref_tracker_dir *dir)
+{
+}
+#endif
+
 static struct ref_tracker_dir_stats *
 ref_tracker_get_stats(struct ref_tracker_dir *dir, unsigned int limit)
 {
@@ -185,6 +214,11 @@ void ref_tracker_dir_exit(struct ref_tracker_dir *dir)
 	bool leak = false;
 
 	dir->dead = true;
+	/*
+	 * The xarray entries must be marked before the dir->lock is taken to
+	 * protect simultaneous debugfs readers.
+	 */
+	ref_tracker_debugfs_mark(dir);
 	spin_lock_irqsave(&dir->lock, flags);
 	list_for_each_entry_safe(tracker, n, &dir->quarantine, head) {
 		list_del(&tracker->head);
@@ -312,23 +346,126 @@ static void __ostream_printf pr_ostream_seq(struct ostream *stream, char *fmt, .
 	va_end(args);
 }
 
-static __maybe_unused int
-ref_tracker_dir_seq_print(struct ref_tracker_dir *dir, struct seq_file *seq)
+static int ref_tracker_dir_seq_print(struct ref_tracker_dir *dir, struct seq_file *seq)
 {
 	struct ostream os = { .func = pr_ostream_seq,
 			      .prefix = "",
 			      .seq = seq };
-	unsigned long flags;
 
-	spin_lock_irqsave(&dir->lock, flags);
 	__ref_tracker_dir_pr_ostream(dir, 16, &os);
-	spin_unlock_irqrestore(&dir->lock, flags);
 
 	return os.used;
 }
 
+static int ref_tracker_debugfs_show(struct seq_file *f, void *v)
+{
+	struct ref_tracker_dir *dir = f->private;
+	unsigned long index = (unsigned long)dir;
+	unsigned long flags;
+	int ret;
+
+	/*
+	 * "dir" may not exist at this point if ref_tracker_dir_exit() has
+	 * already been called. Take care not to dereference it until its
+	 * legitimacy is established.
+	 *
+	 * The xa_lock is necessary to ensure that "dir" doesn't disappear
+	 * before its lock can be taken. If it's in the hash and not marked
+	 * dead, then it's safe to take dir->lock which prevents
+	 * ref_tracker_dir_exit() from completing. Once the dir->lock is
+	 * acquired, the xa_lock can be released. All of this must be IRQ-safe.
+	 */
+	xa_lock_irqsave(&debugfs_dentries, flags);
+	if (!xa_load(&debugfs_dentries, index) ||
+	    xa_get_mark(&debugfs_dentries, index, REF_TRACKER_DIR_DEAD)) {
+		xa_unlock_irqrestore(&debugfs_dentries, flags);
+		return -ENODATA;
+	}
+
+	spin_lock(&dir->lock);
+	xa_unlock(&debugfs_dentries);
+	ret = ref_tracker_dir_seq_print(dir, f);
+	spin_unlock_irqrestore(&dir->lock, flags);
+	return ret;
+}
+
+static int ref_tracker_debugfs_open(struct inode *inode, struct file *filp)
+{
+	struct ref_tracker_dir *dir = inode->i_private;
+
+	return single_open(filp, ref_tracker_debugfs_show, dir);
+}
+
+static const struct file_operations ref_tracker_debugfs_fops = {
+	.owner		= THIS_MODULE,
+	.open		= ref_tracker_debugfs_open,
+	.read		= seq_read,
+	.llseek		= seq_lseek,
+	.release	= single_release,
+};
+
+/**
+ * ref_tracker_dir_debugfs - create debugfs file for ref_tracker_dir
+ * @dir: ref_tracker_dir to be associated with debugfs file
+ *
+ * In most cases, a debugfs file will be created automatically for every
+ * ref_tracker_dir. If the object was created before debugfs is brought up
+ * then that may fail. In those cases, it is safe to call this at a later
+ * time to create the file.
+ */
+void ref_tracker_dir_debugfs(struct ref_tracker_dir *dir)
+{
+	char name[NAME_MAX + 1];
+	struct dentry *dentry;
+	int ret;
+
+	/* No-op if already created */
+	dentry = xa_load(&debugfs_dentries, (unsigned long)dir);
+	if (dentry && !xa_is_err(dentry))
+		return;
+
+	ret = snprintf(name, sizeof(name), "%s@%px", dir->class, dir);
+	name[sizeof(name) - 1] = '\0';
+
+	if (ret < sizeof(name)) {
+		dentry = debugfs_create_file(name, S_IFREG | 0400,
+						  ref_tracker_debug_dir, dir,
+						  &ref_tracker_debugfs_fops);
+		if (!IS_ERR(dentry)) {
+			void *old;
+
+			old = xa_store(&debugfs_dentries, (unsigned long)dir,
+				       dentry, GFP_KERNEL);
+
+			if (xa_is_err(old))
+				debugfs_remove(dentry);
+			else
+				WARN_ON_ONCE(old);
+		}
+	}
+}
+EXPORT_SYMBOL(ref_tracker_dir_debugfs);
+
+static void debugfs_reap_work(struct work_struct *work)
+{
+	struct dentry *dentry;
+	unsigned long index;
+	bool reaped;
+
+	do {
+		reaped = false;
+		xa_for_each_marked(&debugfs_dentries, index, dentry, REF_TRACKER_DIR_DEAD) {
+			xa_erase(&debugfs_dentries, index);
+			debugfs_remove(dentry);
+			reaped = true;
+		}
+	} while (reaped);
+}
+
 static int __init ref_tracker_debugfs_init(void)
 {
+	INIT_WORK(&debugfs_reap_worker, debugfs_reap_work);
+	xa_init_flags(&debugfs_dentries, XA_FLAGS_LOCK_IRQ);
 	ref_tracker_debug_dir = debugfs_create_dir("ref_tracker", NULL);
 	return 0;
 }

-- 
2.49.0

