Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AF07BAD3C07
	for <lists+dri-devel@lfdr.de>; Tue, 10 Jun 2025 17:00:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DFC3D10E5A7;
	Tue, 10 Jun 2025 15:00:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="X1mBI/Br";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA4EB10E586;
 Tue, 10 Jun 2025 14:59:58 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 7B9235C56C6;
 Tue, 10 Jun 2025 14:57:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0C9FCC4CEF0;
 Tue, 10 Jun 2025 14:59:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1749567597;
 bh=7m03JAiZi1htmYekkvb9rqbrYXBGjMPA6O2hU2YNZfg=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=X1mBI/BrkIVVEi+7ujtAIxmQkOD0Q6zJvDHYsEFEsjx6XHANtrx0AIjuPAdMRZA2s
 mmUJonEAmz/SXll8JOLXEKuK53RMgRk77nBiZ53uWzsm0Swt2GaDRlx/ILeUZ2QuHI
 ug33Cvpb5WsLgQqaSqUxQixugGUB/Wb8EqR/OQqTtv79mxsDxqagtNl9jFcuf7cZpo
 YokBQsWzbj3F+uiiU8LGWd/S4ZckjcVv2VQFypZzqwmrJwg6rzuccitMIGhz09KVwZ
 UFTRea9e/hgEjvg+vndDCSQgIGE2Ye3v8GCiHExlGQndDEt6Da3W3Ohn1JZfEkjiFd
 XqGjOJPs0u6Sg==
From: Jeff Layton <jlayton@kernel.org>
Date: Tue, 10 Jun 2025 10:59:27 -0400
Subject: [PATCH v14 7/9] ref_tracker: add a way to create a symlink to the
 ref_tracker_dir debugfs file
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250610-reftrack-dbgfs-v14-7-efb532861428@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4362; i=jlayton@kernel.org;
 h=from:subject:message-id; bh=7m03JAiZi1htmYekkvb9rqbrYXBGjMPA6O2hU2YNZfg=;
 b=owEBbQKS/ZANAwAKAQAOaEEZVoIVAcsmYgBoSEhcWNIJlZnhzGeL+qd5tiKogrC7IEUHAoeQK
 t1pfDqVMsOJAjMEAAEKAB0WIQRLwNeyRHGyoYTq9dMADmhBGVaCFQUCaEhIXAAKCRAADmhBGVaC
 FdCCD/9LbCB1ebJIYKI+eoqgpNwqW3aTFJ7tA44mMMmfutC61PKkSsKyo5uqkjFFWGNJK9ks4w2
 VWtCcInLhjQv1y5eyaSXJYpvsO2Bq0AN7cYotbEKRECILXHGeMuhgRFeTHRRvlWr/1NZEfquf0I
 yp+StaxcLp0cGwglPEcPrJt3TG5rEfkR6krnUgRUSBuWG9Mc23VRXL3H9ZHctWaegIPPqpT8WMC
 zlcddrtnepAqTXMHvADW+ay0LmlsDnZU4CUHfBJrQjT/TfIntT05O5IBvJjeTPSWmHxOEkaSVPD
 6rbLTfNva5i4Xf4dDp1LCWO1svJDvuxWJ3gJg/ymyE3jWhdU9eLfR/S5+1CpG8qCLRjKEUgna8/
 4luzUmakSd+N7JynGyBWo3nuXgP21+KPiu9VXRw/z1EDP0nepDxestwAvXBpqertI+2G4x7itBz
 Pj9doyav+xYb76++p1/9MRSMlmrzLa1G2bz3xobfSKwIdF2SQguu6gCLN71wCivVNzEHKe9Xszh
 Iz0uVLsq27x6JW717pSd/bIi1qOohun4jimiJgbefaEZ+9OxnUZf0pslvdZtvedgnm8R3HqqChx
 Z9+xRYptUJMzJX+rFF5yiKLeS20DT4ECRduC/crgtLz/FuRk6mkdAYBRPi8j1UAHJGAUkW9WVPR
 Zq5Vm/5SMnP+XRA==
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
 include/linux/ref_tracker.h | 11 +++++++++++
 lib/ref_tracker.c           | 47 +++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 58 insertions(+)

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
index 4f1c4fe5e6b1274b6aeb733a3f8c06d1dff003f5..a78741308a2c2dc7aff65519970ad081b59e0de5 100644
--- a/lib/ref_tracker.c
+++ b/lib/ref_tracker.c
@@ -44,11 +44,13 @@ struct ref_tracker_dir_stats {
  * dentries asynchronously.
  */
 static struct xarray		debugfs_dentries;
+static struct xarray		debugfs_symlinks;
 static struct work_struct	debugfs_reap_worker;
 
 #define REF_TRACKER_DIR_DEAD	XA_MARK_0
 static inline void ref_tracker_debugfs_mark(struct ref_tracker_dir *dir)
 {
+	xa_set_mark(&debugfs_symlinks, (unsigned long)dir, REF_TRACKER_DIR_DEAD);
 	xa_set_mark(&debugfs_dentries, (unsigned long)dir, REF_TRACKER_DIR_DEAD);
 	schedule_work(&debugfs_reap_worker);
 }
@@ -446,6 +448,45 @@ void ref_tracker_dir_debugfs(struct ref_tracker_dir *dir)
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
+			old = xa_store(&debugfs_symlinks, (unsigned long)dir,
+				       symlink, GFP_KERNEL);
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
@@ -454,6 +495,11 @@ static void debugfs_reap_work(struct work_struct *work)
 
 	do {
 		reaped = false;
+		xa_for_each_marked(&debugfs_symlinks, index, dentry, REF_TRACKER_DIR_DEAD) {
+			xa_erase(&debugfs_symlinks, index);
+			debugfs_remove(dentry);
+			reaped = true;
+		}
 		xa_for_each_marked(&debugfs_dentries, index, dentry, REF_TRACKER_DIR_DEAD) {
 			xa_erase(&debugfs_dentries, index);
 			debugfs_remove(dentry);
@@ -466,6 +512,7 @@ static int __init ref_tracker_debugfs_init(void)
 {
 	INIT_WORK(&debugfs_reap_worker, debugfs_reap_work);
 	xa_init_flags(&debugfs_dentries, XA_FLAGS_LOCK_IRQ);
+	xa_init_flags(&debugfs_symlinks, XA_FLAGS_LOCK_IRQ);
 	ref_tracker_debug_dir = debugfs_create_dir("ref_tracker", NULL);
 	return 0;
 }

-- 
2.49.0

