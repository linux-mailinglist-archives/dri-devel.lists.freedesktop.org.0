Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8552AADEF2F
	for <lists+dri-devel@lfdr.de>; Wed, 18 Jun 2025 16:24:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D38B510E876;
	Wed, 18 Jun 2025 14:24:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="NLHdTVfh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1BE1210E86A;
 Wed, 18 Jun 2025 14:24:43 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id E334144F89;
 Wed, 18 Jun 2025 14:24:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EA30AC4CEEE;
 Wed, 18 Jun 2025 14:24:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1750256682;
 bh=5X69klc0I5PpzlSj7ikkdfXm51zSMkRP81iDMAIdLbs=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=NLHdTVfhf+n09kp2/BsHGxYMJOUEDMSvfM9bPGpayWSnxgFXSeDYVer+kaP0e2a2N
 6AFVVqeLpBlqgSjo4cfx+PkGIRUr0BB4jgwtEzfDHDu0VeFQEny2rvlZm5PnyXanRJ
 mI5w9o2GwhqIPV+GSD/R3VTkMMgA8hIjVh5lu8KEH+xSmbJQJg6RBJCODjkr7frczt
 doGj0PItYd6guPnAAPniHArgqhut7BJhiHNCyyMvnY0gF6Iqfv3dyDCmQcI6ZS0A7F
 aVZB6ozSZtpu9iaqSHnPf3nW7F2Jrmcyq2+uufQOjAWuFsKW/Qqpiaf7FJ45KNtRgD
 ZsCn+JFkEcMOA==
From: Jeff Layton <jlayton@kernel.org>
Date: Wed, 18 Jun 2025 10:24:20 -0400
Subject: [PATCH v15 7/9] ref_tracker: add a way to create a symlink to the
 ref_tracker_dir debugfs file
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250618-reftrack-dbgfs-v15-7-24fc37ead144@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4548; i=jlayton@kernel.org;
 h=from:subject:message-id; bh=5X69klc0I5PpzlSj7ikkdfXm51zSMkRP81iDMAIdLbs=;
 b=owEBbQKS/ZANAwAKAQAOaEEZVoIVAcsmYgBoUswZRy4G7laETNP8iYtaM4jXEjG6wT1hnrchO
 CixQWnlh3qJAjMEAAEKAB0WIQRLwNeyRHGyoYTq9dMADmhBGVaCFQUCaFLMGQAKCRAADmhBGVaC
 FZocD/9FIdqyye26ITj4dkHQP+/w8rMXrzB//J5h34BcHu5Avlrgjr+fRQTYN07cws9TQTXQKDF
 H1Ykh37fmprvQqyXXXjpe6T6SxfWBbWz8svJyUe62aAG2IPOAcMGkKm1bU564ijNkwFiYC94ffk
 vhbdrXV8Se8dbzj2P9WKYJVDdJrsia79ChZdyTELowz0QauGzw+VP14RiPLlP1LO4JvqnMTlnpM
 +oEBw5uXDR/X2mLdIcNu2LHvL/hS0SLWCYG0IPCZK0wcAWihK98WAQjwYPyK3toRikgqxTCHTsD
 EkNPl0xQXiH580B6nxkk43yig1zHOQGBITHcdEWHRixChIli8RvSVAL4/M9tg3x60qIvJe0YiQd
 iSIyE82WGIEmVqqR1b3h7IQ6eLPX/LvzPJ3RcdeVUfw3AzCS6eA9Y/gFaFwjDz24AgOpGf2yDB4
 QulbwmYnmZOlz7carI0FlYepCY8DDdctusqUgE8Y/Uk0yHhjRTCsfIq+ZdnJ6A36+ciHH7Igg5J
 w9L/S1CMlSPdY7hJRWWIeSd0yzz8/fj7TsGEq0iBXlkd1DWyndF5Ad0wQ8BkNmaF7uY2/dVyoFQ
 gzJ+9l5maT08SeJrZp6r66avIHCPZOu16MAK5S9BTLFgrXycWRKy9lFQ7lWgeNnXGOO7rw5wLCc
 xf/aF+dgG8Btj3Q==
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

Add the ability for a subsystem to add a user-friendly symlink that
points to a ref_tracker_dir's debugfs file. Add a separate
debugfs_symlinks xarray and use that to track symlinks. The reaper
workqueue job will remove symlinks before their corresponding dentries.

Signed-off-by: Jeff Layton <jlayton@kernel.org>
---
 include/linux/ref_tracker.h | 11 ++++++++++
 lib/ref_tracker.c           | 50 +++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 61 insertions(+)

diff --git a/include/linux/ref_tracker.h b/include/linux/ref_tracker.h
index 28bbf436a8f4646cfac181d618195a9460bda196..e1323de93bf6b891aa14ad8d9b4b28d02e10f9f7 100644
--- a/include/linux/ref_tracker.h
+++ b/include/linux/ref_tracker.h
@@ -29,6 +29,7 @@ struct ref_tracker_dir {
 #ifdef CONFIG_DEBUG_FS
 
 void ref_tracker_dir_debugfs(struct ref_tracker_dir *dir);
+void ref_tracker_dir_symlink(struct ref_tracker_dir *dir, const char *fmt, ...);
 
 #else /* CONFIG_DEBUG_FS */
 
@@ -36,6 +37,11 @@ static inline void ref_tracker_dir_debugfs(struct ref_tracker_dir *dir)
 {
 }
 
+static inline __ostream_printf
+void ref_tracker_dir_symlink(struct ref_tracker_dir *dir, const char *fmt, ...)
+{
+}
+
 #endif /* CONFIG_DEBUG_FS */
 
 static inline void ref_tracker_dir_init(struct ref_tracker_dir *dir,
@@ -85,6 +91,11 @@ static inline void ref_tracker_dir_debugfs(struct ref_tracker_dir *dir)
 {
 }
 
+static inline __ostream_printf
+void ref_tracker_dir_symlink(struct ref_tracker_dir *dir, const char *fmt, ...)
+{
+}
+
 static inline void ref_tracker_dir_exit(struct ref_tracker_dir *dir)
 {
 }
diff --git a/lib/ref_tracker.c b/lib/ref_tracker.c
index c938ef56954b2169458e9b23a3db2441bcf91aa6..6608520d6118685a9cfa497827f6a89318b3360c 100644
--- a/lib/ref_tracker.c
+++ b/lib/ref_tracker.c
@@ -44,6 +44,7 @@ struct ref_tracker_dir_stats {
  * dentries asynchronously.
  */
 static struct xarray		debugfs_dentries;
+static struct xarray		debugfs_symlinks;
 static struct work_struct	debugfs_reap_worker;
 
 #define REF_TRACKER_DIR_DEAD	XA_MARK_0
@@ -55,6 +56,10 @@ static inline void ref_tracker_debugfs_mark(struct ref_tracker_dir *dir)
 	__xa_set_mark(&debugfs_dentries, (unsigned long)dir, REF_TRACKER_DIR_DEAD);
 	xa_unlock_irqrestore(&debugfs_dentries, flags);
 
+	xa_lock_irqsave(&debugfs_symlinks, flags);
+	__xa_set_mark(&debugfs_symlinks, (unsigned long)dir, REF_TRACKER_DIR_DEAD);
+	xa_unlock_irqrestore(&debugfs_symlinks, flags);
+
 	schedule_work(&debugfs_reap_worker);
 }
 #else
@@ -451,6 +456,45 @@ void ref_tracker_dir_debugfs(struct ref_tracker_dir *dir)
 }
 EXPORT_SYMBOL(ref_tracker_dir_debugfs);
 
+void __ostream_printf ref_tracker_dir_symlink(struct ref_tracker_dir *dir, const char *fmt, ...)
+{
+	char name[NAME_MAX + 1];
+	struct dentry *symlink, *dentry;
+	va_list args;
+	int ret;
+
+	symlink = xa_load(&debugfs_symlinks, (unsigned long)dir);
+	dentry = xa_load(&debugfs_dentries, (unsigned long)dir);
+
+	/* Already created?*/
+	if (symlink && !xa_is_err(symlink))
+		return;
+
+	if (!dentry || xa_is_err(dentry))
+		return;
+
+	va_start(args, fmt);
+	ret = vsnprintf(name, sizeof(name), fmt, args);
+	va_end(args);
+	name[sizeof(name) - 1] = '\0';
+
+	if (ret < sizeof(name)) {
+		symlink = debugfs_create_symlink(name, ref_tracker_debug_dir,
+						 dentry->d_name.name);
+		if (!IS_ERR(symlink)) {
+			void *old;
+
+			old = xa_store_irq(&debugfs_symlinks, (unsigned long)dir,
+					   symlink, GFP_KERNEL);
+			if (xa_is_err(old))
+				debugfs_remove(symlink);
+			else
+				WARN_ON_ONCE(old);
+		}
+	}
+}
+EXPORT_SYMBOL(ref_tracker_dir_symlink);
+
 static void debugfs_reap_work(struct work_struct *work)
 {
 	struct dentry *dentry;
@@ -459,6 +503,11 @@ static void debugfs_reap_work(struct work_struct *work)
 
 	do {
 		reaped = false;
+		xa_for_each_marked(&debugfs_symlinks, index, dentry, REF_TRACKER_DIR_DEAD) {
+			xa_erase_irq(&debugfs_symlinks, index);
+			debugfs_remove(dentry);
+			reaped = true;
+		}
 		xa_for_each_marked(&debugfs_dentries, index, dentry, REF_TRACKER_DIR_DEAD) {
 			xa_erase_irq(&debugfs_dentries, index);
 			debugfs_remove(dentry);
@@ -471,6 +520,7 @@ static int __init ref_tracker_debugfs_init(void)
 {
 	INIT_WORK(&debugfs_reap_worker, debugfs_reap_work);
 	xa_init_flags(&debugfs_dentries, XA_FLAGS_LOCK_IRQ);
+	xa_init_flags(&debugfs_symlinks, XA_FLAGS_LOCK_IRQ);
 	ref_tracker_debug_dir = debugfs_create_dir("ref_tracker", NULL);
 	return 0;
 }

-- 
2.49.0

