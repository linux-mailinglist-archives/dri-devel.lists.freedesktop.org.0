Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 91EC6AAE01F
	for <lists+dri-devel@lfdr.de>; Wed,  7 May 2025 15:07:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7264610E7C9;
	Wed,  7 May 2025 13:07:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="APeV0Dln";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E52610E7C0;
 Wed,  7 May 2025 13:07:05 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 7A77B5C5DB2;
 Wed,  7 May 2025 13:04:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A0F3BC4CEEB;
 Wed,  7 May 2025 13:07:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1746623224;
 bh=YUzGN4pDQEVUn13ezU+iyAv9BvSGVVgHmEotghHtWUM=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=APeV0DlnD30sZF1I21aaE5rI2QhHTh1mMzZTAltQOEa/qCV1/43wyTRblwrfkACpI
 QUmdYPDK7g9OrO6XLqXu1z+8d0FuazuVk7wAyKrm8ycSCK+7YWTbb2Q4Ki/Fhxjp9o
 OOlZkqhvmhhOAXb0G35knIZfOMlsJF3THJlMn+bTnZutSWRbjBvTPMwILCZSjQHRCv
 FA9TSq/ThPBeZ6EDbnBL6G3D/Sag6Efxzg+U/2fxTxWozddLCHjd5iR9zTi5JFl9nj
 06Rwqdi2akXOt9VyGnLxFW7nHHrLeOvaHxqqOlUykZChvjzhJZzJ0qOdpcaIRLgoHS
 phla2ynha/1OA==
From: Jeff Layton <jlayton@kernel.org>
Date: Wed, 07 May 2025 09:06:31 -0400
Subject: [PATCH v8 06/10] ref_tracker: automatically register a file in
 debugfs for a ref_tracker_dir
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250507-reftrack-dbgfs-v8-6-607717d3bb98@kernel.org>
References: <20250507-reftrack-dbgfs-v8-0-607717d3bb98@kernel.org>
In-Reply-To: <20250507-reftrack-dbgfs-v8-0-607717d3bb98@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=5577; i=jlayton@kernel.org;
 h=from:subject:message-id; bh=YUzGN4pDQEVUn13ezU+iyAv9BvSGVVgHmEotghHtWUM=;
 b=owEBbQKS/ZANAwAKAQAOaEEZVoIVAcsmYgBoG1rpJ9dAaBE2+hZdo/e5AzuR7hjdBnAwmAfHQ
 lZsZQMG8sGJAjMEAAEKAB0WIQRLwNeyRHGyoYTq9dMADmhBGVaCFQUCaBta6QAKCRAADmhBGVaC
 FVLmEADUBp6vtYIDzXI2dcsQeyZ+WT1CbfUEcaF5zU7tw6TTRNIDyzbqYMpVSHUulBqcm7ODskT
 glaMpPsT+H6pflPTmwOlsKLUUFskc5PDVvC3Z73AhBAT1XIRd9WCIMY+TBHPLUnMRk6pTfVzmHp
 8lPcG2LlKl6mwiBdOldnstBP9hPa9uo07LKv73G5GeadrT5ZaSGqOtguouvNfFAHjcZTOA9aYOI
 O25GORCqVVCLDSaKTAI1i7hY5MwogF6A2yAMFhORuI05kOnSv3Gwizco2U0gdzGZFtIwJG/JvbI
 DM/ZI5LcPgQqGDTsZegi7aSokHRWdsG1sXHI3/3Kq7PY+CJPj+TFk0L9biyn/+/3ZhK9sBZO6qX
 ZWipX325JvQvCZC2L7t2sGGSWi+I4bAuIvw18GOnYy3HjuLtVK/CfeVnwX66uoq7/FH8rPsMfCi
 KbgtOMVsYhePrpEXcAKdOmF/BKpfn4izARNKjSbiERSas+SJ3Wrx6mv7/whJ/617fxs4IXWvsN3
 hhEfvC3qeyLatU8/O4do5vlEfAq/2HC09S0lC9BuIvR47m7eMOinUk8rDkEi06BZnxaLguuWoJ9
 rimKMX070sjpt4XV6UKe2VfKyaJUHbl61R2Bp6YvnTHKefjKuRwousrFfyi3UYtdyix3Y/kg7jw
 pNW2SxpyTgQxPVA==
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
 include/linux/ref_tracker.h | 23 ++++++++++++++
 lib/ref_tracker.c           | 73 +++++++++++++++++++++++++++++++++++++++++++--
 2 files changed, 94 insertions(+), 2 deletions(-)

diff --git a/include/linux/ref_tracker.h b/include/linux/ref_tracker.h
index 3968f993db81e95c0d58c81454311841c1b9cd35..dd289fdda12b1a10197912f5796f97002e785aaf 100644
--- a/include/linux/ref_tracker.h
+++ b/include/linux/ref_tracker.h
@@ -20,12 +20,27 @@ struct ref_tracker_dir {
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
@@ -39,7 +54,11 @@ static inline void ref_tracker_dir_init(struct ref_tracker_dir *dir,
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
 
@@ -68,6 +87,10 @@ static inline void ref_tracker_dir_init(struct ref_tracker_dir *dir,
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
index 6e85e7eb347d86775ba38a72dad7159f9ac41ed9..1df12625d80cc7cff65d9f6be89e1dd5c5ffb7f6 100644
--- a/lib/ref_tracker.c
+++ b/lib/ref_tracker.c
@@ -29,6 +29,14 @@ struct ref_tracker_dir_stats {
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
@@ -184,6 +192,7 @@ void ref_tracker_dir_exit(struct ref_tracker_dir *dir)
 	bool leak = false;
 
 	dir->dead = true;
+	ref_tracker_debugfs_remove(dir);
 	spin_lock_irqsave(&dir->lock, flags);
 	list_for_each_entry_safe(tracker, n, &dir->quarantine, head) {
 		list_del(&tracker->head);
@@ -311,8 +320,7 @@ static void __ostream_printf pr_ostream_seq(struct ostream *stream, char *fmt, .
 	va_end(args);
 }
 
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

