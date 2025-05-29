Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D6161AC8024
	for <lists+dri-devel@lfdr.de>; Thu, 29 May 2025 17:21:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 143D210E74B;
	Thu, 29 May 2025 15:21:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="SSzdUfoO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC7EE10E755;
 Thu, 29 May 2025 15:21:30 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 4700EA4FA51;
 Thu, 29 May 2025 15:21:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 30090C4CEF1;
 Thu, 29 May 2025 15:21:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1748532090;
 bh=TYdiGaavXoUhBEfyJ2tof4CzGHWJn078+gZ8gTQMfh4=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=SSzdUfoOTKfagcpSWk8/saZ49LwK2g8CVmDSUgDAK2faZub3eaaVGSnGLBtNqKRnh
 7RktK5Rp12TQVtFN3BXQmHvGL8rf0egwMC9qbthfQ+5YXH7U46QYqodFg5vdvaP1No
 zwYkUoDbLdm+a0Z3tB0W1ArgLOck+qcJbRxGBxbSYVRrYvb/CPlbEaeveUvQXY2IFs
 7akbAsO3TU5HDV40Jg/LX9L5qJzIQ9f1ZbX/A+TU8DYCU7vQawW99CxpccBwQNi6jX
 dl7t4p6zTTGDP0goQl/bT1EveuBbEyg3NPnO2hXgBBadOj/bUi9iJK/IlpE2EHhsII
 /eXo+3vzhCgHQ==
From: Jeff Layton <jlayton@kernel.org>
Date: Thu, 29 May 2025 11:20:44 -0400
Subject: [PATCH v12 08/10] ref_tracker: add a way to create a symlink to
 the ref_tracker_dir debugfs file
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250529-reftrack-dbgfs-v12-8-11b93c0c0b6e@kernel.org>
References: <20250529-reftrack-dbgfs-v12-0-11b93c0c0b6e@kernel.org>
In-Reply-To: <20250529-reftrack-dbgfs-v12-0-11b93c0c0b6e@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3044; i=jlayton@kernel.org;
 h=from:subject:message-id; bh=TYdiGaavXoUhBEfyJ2tof4CzGHWJn078+gZ8gTQMfh4=;
 b=owEBbQKS/ZANAwAKAQAOaEEZVoIVAcsmYgBoOHtnIA/msdeh0SYjk5pNmKitkc6lL1jlnNBjz
 XK+CBCnD6eJAjMEAAEKAB0WIQRLwNeyRHGyoYTq9dMADmhBGVaCFQUCaDh7ZwAKCRAADmhBGVaC
 FfM7EADCnX8FNq0rJLAa/m5YacLEeBDeXnKOAOu1EUGd0x9Sc/13o3JV8v58xmiX/hggibKW4M1
 RxSeS+FbqyzI8zlA6AtCy/jjs4AcDRohpOdVsfha8371KB4cSurv9GvREmdmRLGiJ48mcfpUi6R
 4JCjgmNhXfSP72aCCZ4/RVz4ZWsZvcFVpIMRIxQHMnRN3D/51Q9wbCOifHnRm8rGGsY9fxMKSeJ
 S+iv0HK1QHDu82iehMPD1VNFQ2ef38ZZ/NCgSLZX3nKgU+FHpypPTemO3pUCZZ7oSwEw/uVcSvu
 0+7U3s5rb3QkAxcgIeIAUJ8EDBOZ9aZnQ52Gy9ToJoGQX73TqeIDJfrG1HJe8bn4tAMrvifd+aw
 aVxRHTcMzKR7dEUwU3TBDaKNJX3DleEN2ikcFoDswZNJxitIK4E8z1KU8GROoMqyEYxspNnAeNI
 zCZAQrxsCoTD/2UJr3AlTeJ3ZURlc1khik4G1MQDzmfLxMe64T2oEITH9OBuKDq889bM+QdCpxE
 u2AWKsWEWAesDyUrPdBXef+N5OBeqFp79yl6Ktaylew3wcf6mGCnlf1yPoBba8fEiqXpEgzbLw4
 XiIipF4V7DxMgJPT286+LIzZlEC34hbkAHT3i+rrXXCeVFsRQyH8AUaCpv1vdBn+46EHzbLXeFa
 xgj2Buo4+MijiSQ==
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
 lib/ref_tracker.c           | 22 ++++++++++++++++++++++
 2 files changed, 35 insertions(+)

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
index aed35a898466888fcb4e4186774933f54793008a..d778820bea952d96c9a1c280dfd6531135bd85e0 100644
--- a/lib/ref_tracker.c
+++ b/lib/ref_tracker.c
@@ -384,8 +384,30 @@ void ref_tracker_dir_debugfs(struct ref_tracker_dir *dir)
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

