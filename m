Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A7665ADEF38
	for <lists+dri-devel@lfdr.de>; Wed, 18 Jun 2025 16:24:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1ABC710E874;
	Wed, 18 Jun 2025 14:24:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Mla81/jA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 86F5010E86C;
 Wed, 18 Jun 2025 14:24:41 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 070EE629CE;
 Wed, 18 Jun 2025 14:24:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D6F49C4CEF2;
 Wed, 18 Jun 2025 14:24:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1750256680;
 bh=H+DYm16YFoz7vb/N3DPXrXYoaKJ781Yi0vxcEF804go=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=Mla81/jAR53nQq/R5J3d3n7OhWUugj6x11fyLrc+BE1lldZUmq92rPi3PUUvgOnjQ
 gXY6Q00HoV91lVq9IgYaA6uo16nQy7zokiM4fk3bgqYqIX6AoqdAU0ONMSGPeAbGOU
 zQCerlqAhCFAI2ypErkNGNJW0ZmWEckad39nWLCYlSxp7GvDz88s6+pd9M9E1TeNKq
 7nOlvgzZk++sjJgylGQLGdjsjuoCRyAVLpESxKjf/8BqmgxMxRW4wcISsfL2//pxJt
 rz0gybqmVTSshcZj992ZJoYBlMGfb6AOyDf6a9trTlF4cInL7UKliA+8uT9fr8he0h
 A2ZXDQvpE5/pw==
From: Jeff Layton <jlayton@kernel.org>
Date: Wed, 18 Jun 2025 10:24:19 -0400
Subject: [PATCH v15 6/9] ref_tracker: automatically register a file in
 debugfs for a ref_tracker_dir
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250618-reftrack-dbgfs-v15-6-24fc37ead144@kernel.org>
References: <20250618-reftrack-dbgfs-v15-0-24fc37ead144@kernel.org>
In-Reply-To: <20250618-reftrack-dbgfs-v15-0-24fc37ead144@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=8693; i=jlayton@kernel.org;
 h=from:subject:message-id; bh=H+DYm16YFoz7vb/N3DPXrXYoaKJ781Yi0vxcEF804go=;
 b=owEBbQKS/ZANAwAKAQAOaEEZVoIVAcsmYgBoUswZYrzoIrTsJLyKavwVYpLG6JiZ5EIlpy+cH
 Cx9niTrZo+JAjMEAAEKAB0WIQRLwNeyRHGyoYTq9dMADmhBGVaCFQUCaFLMGQAKCRAADmhBGVaC
 FTOjD/98opNEqzZ+o/C7K1wPS283gvKPeT7/zF0fQKMehIQHmQqznvDkRInmGQh6A4uqSBodd4Q
 lWgWBDEQueERDoh+Ik8Ja42qx1WokNOSiM3RzH+t9FgSMXAh1OmURJJaO3wJnTnxm8qnGwwXjjc
 cnYzrYD55spomz6NL0KOw7+cw8uw2KUDHvRQNLrDaEpD+uZeSZ1CIHjKrsJvEAIgLQOeDj4LXiy
 gkVfSPeyrA1bvTfLD05L6ib6hk47wdTCaO71ueGCWL90xOy9sfFwS2gyByEIcdjEhW8OIWnEEkg
 mk/TQne37znykHgL32IdW3zvE3OvzrqsW3Wujx7suUjQq3METJPWhRkKa0N19fq+WHbou6O2Ta6
 H6X7ulrTR0VKmOvU+5wHTNNPQAVL+pJI4UhjCCQWRrZIkHYLyIYUq+49y9Xu6ORPKOKbhmVA9uX
 yc5VIMOFElQh/2qraKAPxlSafaNmvIuYSx/Bd2iwOiKq03RZoOot3Gv2CJwfX/oafYISEZzhOaZ
 E3G7GgGaiYctQ4b2p6fbyDo/0PY5lVUkDyPSUSpmFsldLx6bL73UbOzi40l+6zxY07QnOe3VgH+
 GpNIbX/Ngjtj90RXQC2CdG4qrKKqbL21xo06v1lXI2JZ6cSpCPIAd8xsv0IV26TQDXK+NqX4e1f
 Vnqebfc/6X+gl4w==
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
 lib/ref_tracker.c           | 152 ++++++++++++++++++++++++++++++++++++++++++--
 2 files changed, 164 insertions(+), 5 deletions(-)

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
index 73b606570cce9e551d13e65365a87dc4ce748b13..c938ef56954b2169458e9b23a3db2441bcf91aa6 100644
--- a/lib/ref_tracker.c
+++ b/lib/ref_tracker.c
@@ -29,6 +29,40 @@ struct ref_tracker_dir_stats {
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
+	unsigned long flags;
+
+	xa_lock_irqsave(&debugfs_dentries, flags);
+	__xa_set_mark(&debugfs_dentries, (unsigned long)dir, REF_TRACKER_DIR_DEAD);
+	xa_unlock_irqrestore(&debugfs_dentries, flags);
+
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
@@ -185,6 +219,11 @@ void ref_tracker_dir_exit(struct ref_tracker_dir *dir)
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
@@ -312,23 +351,126 @@ static void __ostream_printf pr_ostream_seq(struct ostream *stream, char *fmt, .
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
+					     ref_tracker_debug_dir, dir,
+					     &ref_tracker_debugfs_fops);
+		if (!IS_ERR(dentry)) {
+			void *old;
+
+			old = xa_store_irq(&debugfs_dentries, (unsigned long)dir,
+					   dentry, GFP_KERNEL);
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
+			xa_erase_irq(&debugfs_dentries, index);
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

