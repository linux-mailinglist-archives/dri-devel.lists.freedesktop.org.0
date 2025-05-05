Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DC15AA9AAF
	for <lists+dri-devel@lfdr.de>; Mon,  5 May 2025 19:33:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B04E10E428;
	Mon,  5 May 2025 17:33:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Qi61bwXI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D67410E424;
 Mon,  5 May 2025 17:33:43 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id C0A9343FDF;
 Mon,  5 May 2025 17:33:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8CE2CC4CEE4;
 Mon,  5 May 2025 17:33:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1746466421;
 bh=42PvFjHDOFh9c39+Q5w0rlwI+Zk/bS3XeleGEnio6jQ=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=Qi61bwXIWhN7Q5imRLB7/jxH6c1qgxj9nq/E4rrrKRs1clB+HI/4xEs/4Sah6PfNX
 ebKlKMZJTnHpONBvXlc5YI2SkdUXbncwzHaBz/+dvHwMNJT/ubJwIcZgOCPb2eY4s6
 4Lyawvpo8ddUIEUoK9QHsuEodgjPjwc/Q0SLuggjJuDNB6RLNZ5h5zQYsQNCQy7oKY
 FSpmKnIbZg10ZSmZT0nWPfRDeC5HFS5wkP8cFz+9L5mpc+i7aj3tPXFoVhYLVfC7ww
 yV6sZwEuIu2HDtKxUu+d7IVvxgrZCQ1GYG/uQUzmcnAc1tRThcNchwxwnnK6fQ7Xdm
 y2Zu/GIkyE7ow==
From: Jeff Layton <jlayton@kernel.org>
Date: Mon, 05 May 2025 13:33:20 -0400
Subject: [PATCH v7 06/10] ref_tracker: automatically register a file in
 debugfs for a ref_tracker_dir
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250505-reftrack-dbgfs-v7-6-f78c5d97bcca@kernel.org>
References: <20250505-reftrack-dbgfs-v7-0-f78c5d97bcca@kernel.org>
In-Reply-To: <20250505-reftrack-dbgfs-v7-0-f78c5d97bcca@kernel.org>
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
Cc: Kuniyuki Iwashima <kuniyu@amazon.com>, Qasim Ijaz <qasdev00@gmail.com>, 
 Nathan Chancellor <nathan@kernel.org>, Andrew Lunn <andrew@lunn.ch>, 
 linux-kernel@vger.kernel.org, netdev@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org, 
 Jeff Layton <jlayton@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=5380; i=jlayton@kernel.org;
 h=from:subject:message-id; bh=42PvFjHDOFh9c39+Q5w0rlwI+Zk/bS3XeleGEnio6jQ=;
 b=owEBbQKS/ZANAwAIAQAOaEEZVoIVAcsmYgBoGPZma2GRzK5/K5200bBcueRtzZcELNBky8pAq
 +BcXf1vUwiJAjMEAAEIAB0WIQRLwNeyRHGyoYTq9dMADmhBGVaCFQUCaBj2ZgAKCRAADmhBGVaC
 FUO1D/9wXsClij4uMc41dcHChDSiaEEbveOJaASamNsqCyPr83e4jRBLhI6OXAOdMI9CTjRUoWi
 ld3STsZRCneIgjcVnLG1BXAPFzzOpCqauxDVGHShHu4bnBADAvwopi5XUtVqUFEsZ3QKvkPXYII
 Am95FrvDl3upxVh7ekSDOvq9zi1EzKRUW/OZs1QgJ8ZCpGpAzuxnsropBUa0Q953u6MPCkcS85w
 ZpiBkD6KakmRHI3DYDcoLbO/Ugbq0ClX9/e+E4dClwQYVvVdeE5EHcevicnanhjNZbqXKUEOnGw
 8z6WvNjCG3q7QxC1PKMMGH1RCXkGyZGulup1KHMMAH4e5kCdg2A93byFt4XzabWClp+SFka7nhn
 hGAfsA0bbGbgU/arkerSFvzp7GoiWw/6Md0kqpdzocCxV6iN0wKmY8cPYE9qRPXBaNUycVFb1Wp
 a0YMqMfXHp6IZ5a8WXMjcqDlHwsToFh3fytOjCqxnxZ//LRF2GktVApb1+zbEItzDCzdMNBpCXz
 C8EQPuAUcTIdiI3CKZypjcVkX24dODRrV+HFVDa1NfVqxfl5u9xho2EscWgvznfWvmyRAoPNtcH
 egGH65U1TBCAuVrBX/fKcYRlRLzCCupxkOc5IQS3kKpWT3bsII21T4PukVzbFxzmLd1yJWZPyHD
 XH0WReE+VyABUdA==
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

If debugfs file creation fails, a pr_warn will be isssued.

Signed-off-by: Jeff Layton <jlayton@kernel.org>
---
 include/linux/ref_tracker.h | 13 ++++++++
 lib/ref_tracker.c           | 73 +++++++++++++++++++++++++++++++++++++++++++--
 2 files changed, 84 insertions(+), 2 deletions(-)

diff --git a/include/linux/ref_tracker.h b/include/linux/ref_tracker.h
index 3968f993db81e95c0d58c81454311841c1b9cd35..17d5924d595ce95bfb5d8ec6d813490499bd89d0 100644
--- a/include/linux/ref_tracker.h
+++ b/include/linux/ref_tracker.h
@@ -20,12 +20,17 @@ struct ref_tracker_dir {
 	struct list_head	list; /* List of active trackers */
 	struct list_head	quarantine; /* List of dead trackers */
 	const char		*class; /* object classname */
+#ifdef CONFIG_DEBUG_FS
+	struct dentry		*dentry;
+#endif
 	char			name[32];
 #endif
 };
 
 #ifdef CONFIG_REF_TRACKER
 
+void ref_tracker_dir_debugfs(struct ref_tracker_dir *dir);
+
 static inline void ref_tracker_dir_init(struct ref_tracker_dir *dir,
 					unsigned int quarantine_count,
 					const char *class,
@@ -39,7 +44,11 @@ static inline void ref_tracker_dir_init(struct ref_tracker_dir *dir,
 	refcount_set(&dir->untracked, 1);
 	refcount_set(&dir->no_tracker, 1);
 	dir->class = class;
+#ifdef CONFIG_DEBUG_FS
+	dir->dentry = NULL;
+#endif
 	strscpy(dir->name, name, sizeof(dir->name));
+	ref_tracker_dir_debugfs(dir);
 	stack_depot_init();
 }
 
@@ -68,6 +77,10 @@ static inline void ref_tracker_dir_init(struct ref_tracker_dir *dir,
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
index 66a765cdfc471968fd6434dafc5b654962f20667..723df31321242d6af267986cc56a9d80b6e5ad18 100644
--- a/lib/ref_tracker.c
+++ b/lib/ref_tracker.c
@@ -31,6 +31,14 @@ struct ref_tracker_dir_stats {
 	} stacks[];
 };
 
+#ifdef CONFIG_DEBUG_FS
+static void ref_tracker_debugfs_remove(struct ref_tracker_dir *dir);
+#else
+static inline void ref_tracker_debugfs_remove(struct ref_tracker_dir *dir)
+{
+}
+#endif
+
 static struct ref_tracker_dir_stats *
 ref_tracker_get_stats(struct ref_tracker_dir *dir, unsigned int limit)
 {
@@ -195,6 +203,7 @@ void ref_tracker_dir_exit(struct ref_tracker_dir *dir)
 	bool leak = false;
 
 	dir->dead = true;
+	ref_tracker_debugfs_remove(dir);
 	spin_lock_irqsave(&dir->lock, flags);
 	list_for_each_entry_safe(tracker, n, &dir->quarantine, head) {
 		list_del(&tracker->head);
@@ -311,8 +320,7 @@ EXPORT_SYMBOL_GPL(ref_tracker_free);
 #ifdef CONFIG_DEBUG_FS
 #include <linux/debugfs.h>
 
-static __maybe_unused int
-ref_tracker_dir_seq_print(struct ref_tracker_dir *dir, struct seq_file *seq)
+static int ref_tracker_dir_seq_print(struct ref_tracker_dir *dir, struct seq_file *seq)
 {
 	struct ostream os = { .func = pr_ostream_seq,
 			      .prefix = "",
@@ -326,6 +334,67 @@ ref_tracker_dir_seq_print(struct ref_tracker_dir *dir, struct seq_file *seq)
 	return os.used;
 }
 
+static int ref_tracker_debugfs_show(struct seq_file *f, void *v)
+{
+	struct ref_tracker_dir *dir = f->private;
+
+	return ref_tracker_dir_seq_print(dir, f);
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
+	int ret;
+
+	/* No-op if already created */
+	if (!IS_ERR_OR_NULL(dir->dentry))
+		return;
+
+	ret = snprintf(name, sizeof(name), "%s@%px", dir->class, dir);
+	name[sizeof(name) - 1] = '\0';
+
+	if (ret < sizeof(name))
+		dir->dentry = debugfs_create_file(name, S_IFREG | 0400,
+						  ref_tracker_debug_dir, dir,
+						  &ref_tracker_debugfs_fops);
+	else
+		dir->dentry = ERR_PTR(-ENAMETOOLONG);
+
+	if (IS_ERR(dir->dentry))
+		pr_warn("ref_tracker: unable to create debugfs file for %s: %pe\n",
+			name, dir->dentry);
+}
+EXPORT_SYMBOL(ref_tracker_dir_debugfs);
+
+static void ref_tracker_debugfs_remove(struct ref_tracker_dir *dir)
+{
+	debugfs_remove(dir->dentry);
+}
+
 static int __init ref_tracker_debugfs_init(void)
 {
 	ref_tracker_debug_dir = debugfs_create_dir("ref_tracker", NULL);

-- 
2.49.0

