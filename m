Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 36E7DA9F87C
	for <lists+dri-devel@lfdr.de>; Mon, 28 Apr 2025 20:27:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E46710E6B3;
	Mon, 28 Apr 2025 18:27:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="MsLeU6T/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5916010E6AB;
 Mon, 28 Apr 2025 18:27:11 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 190974AB0C;
 Mon, 28 Apr 2025 18:27:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DCD8BC4CEE4;
 Mon, 28 Apr 2025 18:27:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1745864831;
 bh=fpnw2V8uXAwDSgZ7plejSEREFoEn+a0D9Tgyy1cTvLw=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=MsLeU6T/FbY5/FrdP7ESmG6hvZlKZUsncPbCgdsOLlmJW1izwqEvIJFKIIs5MKcQY
 p7JRTOlw+y7YbXwiLvPIj/7crvkiV7vS9iMYcjyytXP5tIcwwn6adOUrWDHcidfmwg
 fAPx906bVEifxrfGC6BHFutcrDQP0coSfEeBEAZyQqNNJMOp6xhWK1UdobTaUrtLnq
 Y8cJIKytWegW+CUMYg8Hiw0Y6ThcibWyL5MX6GeJMg9BM0IKNH6Yx5wziZcHZK2yq3
 z8D22Arjo/sbaL45YbSAXVfG/0Ny81aPuhq6tyXb2wSCJvCCF04T16SrgBx0Vn8ImG
 cb5djjgPHwaqg==
From: Jeff Layton <jlayton@kernel.org>
Date: Mon, 28 Apr 2025 11:26:29 -0700
Subject: [PATCH v5 06/10] ref_tracker: automatically register a file in
 debugfs for a ref_tracker_dir
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250428-reftrack-dbgfs-v5-6-1cbbdf2038bd@kernel.org>
References: <20250428-reftrack-dbgfs-v5-0-1cbbdf2038bd@kernel.org>
In-Reply-To: <20250428-reftrack-dbgfs-v5-0-1cbbdf2038bd@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=5257; i=jlayton@kernel.org;
 h=from:subject:message-id; bh=fpnw2V8uXAwDSgZ7plejSEREFoEn+a0D9Tgyy1cTvLw=;
 b=kA0DAAgBAA5oQRlWghUByyZiAGgPyHWjoJY4UZE5t/FLMAszlWsnxX/d3fsLLKgV3tv4W9hjo
 YkCMwQAAQgAHRYhBEvA17JEcbKhhOr10wAOaEEZVoIVBQJoD8h1AAoJEAAOaEEZVoIV2m4P/RgR
 MxWp0Y1mrrqmjWUWh2CnaGAtVyxgJX44OfhrRS3GPefiuUnSQlMSW4Rf8g4H14mUo8F9xHMJ1pO
 i3A2tOitKw1auei5pdV9dT8S5W9JfUMC5YRP6EIl9uC0JeESf76qFJ7NKcq03N+ZC8B4aUMQCtO
 Q6xq1n7q2HiwCwDgaLkdI5eVeQlh19lpdW8ptcK5x3SptcyhI4Kp30VBaU3N1A1nt2T9SiyL664
 de0ASV8Yk5sMZ773qsONEVW8lmc7qE2moEq9p/GfuiCnToLRFji0Oyl9N62azzPrc8JP/6X37e1
 Lgh2ECXbJoFbzpllKp/NkXQQWf0AY9yB+qj9EW0KzNs1gCJIAQYKudAF2tsxsNwuKsbhlZz9MVn
 +IfdMloIsrS269miW9r093Je5mQQNdYxvD3tXZ2Par3uhvmMHv1d2wTcO4m0mQOYsGmXT9mlXmw
 gJeuXHLuZqXJ0njVfwoh7GyC31fWWVkHrCNguJM7nnPKpj0aXZDJIEgIz9ZQoAJGOzMMHOEIBVE
 gC7FPqHcli/0L5Bgwpeb+KWzjg9BHbfXKwpZoGfBuBc+sfIHmITJl/ZocS89ggL3qT0/Y984pA6
 eox3ojxlMrICYxNi9z65n1ntycaRJ1xIyu/zwlbw30KlN+OVufLnTdOxfNB/0xK3RmaDxx11UCZ
 aWBWh
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
 include/linux/ref_tracker.h | 14 +++++++++
 lib/ref_tracker.c           | 72 +++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 86 insertions(+)

diff --git a/include/linux/ref_tracker.h b/include/linux/ref_tracker.h
index 2adae128d4b5e45f156af4775a1d184bb596fa91..c6e65d7ef4d4fc74c60fcabd19166c131d4173e2 100644
--- a/include/linux/ref_tracker.h
+++ b/include/linux/ref_tracker.h
@@ -5,6 +5,7 @@
 #include <linux/types.h>
 #include <linux/spinlock.h>
 #include <linux/stackdepot.h>
+#include <linux/seq_file.h>
 
 struct ref_tracker;
 
@@ -18,12 +19,17 @@ struct ref_tracker_dir {
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
@@ -37,7 +43,11 @@ static inline void ref_tracker_dir_init(struct ref_tracker_dir *dir,
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
 
@@ -66,6 +76,10 @@ static inline void ref_tracker_dir_init(struct ref_tracker_dir *dir,
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
index 4857bcb6d4bf557a0089f51328e75e8209e959e6..f5424857b0fde2339cce31c6744fd4dafbaf0d2a 100644
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
@@ -197,6 +205,7 @@ void ref_tracker_dir_exit(struct ref_tracker_dir *dir)
 	bool leak = false;
 
 	dir->dead = true;
+	ref_tracker_debugfs_remove(dir);
 	spin_lock_irqsave(&dir->lock, flags);
 	list_for_each_entry_safe(tracker, n, &dir->quarantine, head) {
 		list_del(&tracker->head);
@@ -327,6 +336,69 @@ static int ref_tracker_dir_seq_print(struct ref_tracker_dir *dir, struct seq_fil
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
+ * @fmt: format string for filename
+ * @...: arguments for the format string
+ *
+ * Call this function to create a debugfs file for your ref_tracker_dir that
+ * displays the current refcounts for the object. It will be automatically
+ * removed when the ref_tracker_dir exits. The filename must be unique. If
+ * the creation fails then the pr_warn will be emitted.
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

