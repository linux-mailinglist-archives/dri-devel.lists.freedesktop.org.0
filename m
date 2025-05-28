Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 691CFAC6BD3
	for <lists+dri-devel@lfdr.de>; Wed, 28 May 2025 16:35:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DBDB010E651;
	Wed, 28 May 2025 14:35:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="MN9J0LwS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 411A010E656;
 Wed, 28 May 2025 14:35:05 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 1388744581;
 Wed, 28 May 2025 14:35:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 03DFEC4CEED;
 Wed, 28 May 2025 14:35:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1748442904;
 bh=G4yxeje4skzZFbWd4GKautKhwMx5ZwXU4VPyyJVpR7k=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=MN9J0LwScpAJM+P6wmfSdcRrHrJUHhAVUAA7LwFOKW9bIN8x+Q93O9nq+FjTcyKKe
 a3I/89NqOFFU2rc1FWRSC5uaf0YRC+f+1cQBL6S7D9KQYbhEO8kpaytnkl66yrIWW1
 oSBBNDYVJo9XGF56gsJlbPmm08I9EJ2dy+euI0RfM4oZzQPL3ohScirZADLoO94LYq
 5X2HvaUjYi6YLUpVp/sPWnMOSdiON7WFxoYIOn0GrKKhcVy9jFMxgQnVAQ0WnGIoPM
 cZuGs8j9LiK+G1ScEpJZpFn7Tl2h/YVBZ1y4lNWJ+XG+dabUKCqwW69ZeDO/I0ojfU
 rUR7yZMGcHPBw==
From: Jeff Layton <jlayton@kernel.org>
Date: Wed, 28 May 2025 10:34:40 -0400
Subject: [PATCH v11 08/10] ref_tracker: add a way to create a symlink to
 the ref_tracker_dir debugfs file
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250528-reftrack-dbgfs-v11-8-94ae0b165841@kernel.org>
References: <20250528-reftrack-dbgfs-v11-0-94ae0b165841@kernel.org>
In-Reply-To: <20250528-reftrack-dbgfs-v11-0-94ae0b165841@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3234; i=jlayton@kernel.org;
 h=from:subject:message-id; bh=G4yxeje4skzZFbWd4GKautKhwMx5ZwXU4VPyyJVpR7k=;
 b=owEBbQKS/ZANAwAKAQAOaEEZVoIVAcsmYgBoNx8FNAc9FDz4vDSLIOq5xZZRQ+6QHi1HAd2Bf
 GNUh5Qr+F2JAjMEAAEKAB0WIQRLwNeyRHGyoYTq9dMADmhBGVaCFQUCaDcfBQAKCRAADmhBGVaC
 FSraD/9XEI2gBLK6O+RNZw7Jm1o9g5fCqvVptwiesaXtZvsxcbs6pIP1HOfEoYgr2mJkzBmmzu2
 f2N7l/z9PTB+ADHaOurmsbpmAn+3FBgB7QYQ4+8kVFvSLi743+OYgVMwxKGQryVmA5zX5k7MgNH
 C8xmXZWd1484Oit4Hnrpsk+YXUiXfFfYD4t+uKrHRhblKEiA2GdKzlHGjjqxrKpPzIDcclIB4tc
 +3Y7Dd76obDHECu9WT42fD81hBIkQBTp6zxAGSxINiXYCTe/f+38AaRWqjv48KyXb4RHrFc3qdE
 qY65GsVXLInrM+AK+Nf0XzI4G8ThkWgn5lEEuKVcOno8QB7/0HMkqS0MF3dcPoB4BqZbpbeZQQg
 FHUgIcNypW8HbodbZTvcYlOFZqJ9VpOrJBXo5Satut55qG/zGK8g9cFCW4p4D8HjfKUnHhyx3f7
 52uvZ4oDFB0WSWlQeCd7YOdp2gkRK4h++TDsbE1iGVpsL8YDg2Sip8yS7tXrFKGP6g2nwo9mvtv
 0kp0RHgMHSIq8RngGE2g9Eh8xnNsWJD1YcY1/957xhdaA6MqwW1GuQ+E9XjN+kjpi3XeY2wq31w
 33x8n0xwH0BZve8VfiRTuC5NE/+WnYC6QJOI3VY47L7vIzB4RGha/h6vaXQb70brOH44ziuiOnq
 fEiMhGtI/ITMLWQ==
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
points to a ref_tracker_dir's debugfs file.

Signed-off-by: Jeff Layton <jlayton@kernel.org>
---
 include/linux/ref_tracker.h | 13 +++++++++++++
 lib/ref_tracker.c           | 28 ++++++++++++++++++++++++++++
 2 files changed, 41 insertions(+)

diff --git a/include/linux/ref_tracker.h b/include/linux/ref_tracker.h
index dd289fdda12b1a10197912f5796f97002e785aaf..ddc5a7b2bd84692bbc1e1ae67674ec2c6857e1ec 100644
--- a/include/linux/ref_tracker.h
+++ b/include/linux/ref_tracker.h
@@ -22,6 +22,7 @@ struct ref_tracker_dir {
 	const char		*class; /* object classname */
 #ifdef CONFIG_DEBUG_FS
 	struct dentry		*dentry;
+	struct dentry		*symlink;
 #endif
 	char			name[32];
 #endif
@@ -32,6 +33,7 @@ struct ref_tracker_dir {
 #ifdef CONFIG_DEBUG_FS
 
 void ref_tracker_dir_debugfs(struct ref_tracker_dir *dir);
+void ref_tracker_dir_symlink(struct ref_tracker_dir *dir, const char *fmt, ...);
 
 #else /* CONFIG_DEBUG_FS */
 
@@ -39,6 +41,11 @@ static inline void ref_tracker_dir_debugfs(struct ref_tracker_dir *dir)
 {
 }
 
+static inline __ostream_printf
+void ref_tracker_dir_symlink(struct ref_tracker_dir *dir, const char *fmt, ...)
+{
+}
+
 #endif /* CONFIG_DEBUG_FS */
 
 static inline void ref_tracker_dir_init(struct ref_tracker_dir *dir,
@@ -56,6 +63,7 @@ static inline void ref_tracker_dir_init(struct ref_tracker_dir *dir,
 	dir->class = class;
 #ifdef CONFIG_DEBUG_FS
 	dir->dentry = NULL;
+	dir->symlink = NULL;
 #endif
 	strscpy(dir->name, name, sizeof(dir->name));
 	ref_tracker_dir_debugfs(dir);
@@ -91,6 +99,11 @@ static inline void ref_tracker_dir_debugfs(struct ref_tracker_dir *dir)
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
index 1df12625d80cc7cff65d9f6be89e1dd5c5ffb7f6..5e84e5fd78e147a036d4adb511e657da07866a55 100644
--- a/lib/ref_tracker.c
+++ b/lib/ref_tracker.c
@@ -390,8 +390,36 @@ void ref_tracker_dir_debugfs(struct ref_tracker_dir *dir)
 }
 EXPORT_SYMBOL(ref_tracker_dir_debugfs);
 
+void __ostream_printf ref_tracker_dir_symlink(struct ref_tracker_dir *dir, const char *fmt, ...)
+{
+	char name[NAME_MAX + 1];
+	va_list args;
+	int ret;
+
+	/* Already created, or dentry doesn't exist? Do nothing */
+	if (!IS_ERR_OR_NULL(dir->symlink) || IS_ERR_OR_NULL(dir->dentry))
+		return;
+
+	va_start(args, fmt);
+	ret = vsnprintf(name, sizeof(name), fmt, args);
+	va_end(args);
+	name[sizeof(name) - 1] = '\0';
+
+	if (ret < sizeof(name))
+		dir->symlink = debugfs_create_symlink(name, ref_tracker_debug_dir,
+						      dir->dentry->d_name.name);
+	else
+		dir->symlink = ERR_PTR(-ENAMETOOLONG);
+
+	if (IS_ERR(dir->symlink))
+		pr_warn("ref_tracker: unable to create debugfs symlink for %s: %pe\n",
+			name, dir->symlink);
+}
+EXPORT_SYMBOL(ref_tracker_dir_symlink);
+
 static void ref_tracker_debugfs_remove(struct ref_tracker_dir *dir)
 {
+	debugfs_remove(dir->symlink);
 	debugfs_remove(dir->dentry);
 }
 

-- 
2.49.0

