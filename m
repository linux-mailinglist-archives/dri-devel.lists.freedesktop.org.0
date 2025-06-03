Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 36EA4ACC55E
	for <lists+dri-devel@lfdr.de>; Tue,  3 Jun 2025 13:27:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0246B10E5D4;
	Tue,  3 Jun 2025 11:27:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="HOOLH/os";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 70E7C10E1DC;
 Tue,  3 Jun 2025 11:27:42 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 8CF5CA4FED3;
 Tue,  3 Jun 2025 11:27:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5F181C4CEF0;
 Tue,  3 Jun 2025 11:27:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1748950060;
 bh=qsINcmyRJS/rIXB02gJnsJeatb4Kiva7Sr9N4CSqWBI=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=HOOLH/os8P9KPgDWMwecLGrib1Od0uhBpJvczPDdyRXQNUVrnKl/xsuH/tW4KAVFV
 jMA4n4d7AHTMS423g0UIIaHw7nMIKkp/D2Vj5Wgw2Nc/RlnOB7AQAVyBSnRlSvuFm6
 TS8ySp54pwlJ73dd7UShI4IQ7U0sZYMRIa5yNHxXmcuAvNsCmWK4j3FWmnmBnHgWFl
 Zq6B4N+phqOIw5gh0vzwqCsD0cMQ5SMM2TIO+vvJWJ4/cvpqzXU4L/pjHV3I0jDCHb
 av+mFciz8Xu1PKjkqSumS1ZCTwtTYHUtAVr6cTHcakn74whgh/hbK5W8faQZKn5NUq
 oayoP2XMVL6Sw==
From: Jeff Layton <jlayton@kernel.org>
Date: Tue, 03 Jun 2025 07:27:18 -0400
Subject: [PATCH v13 7/9] ref_tracker: add a way to create a symlink to the
 ref_tracker_dir debugfs file
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250603-reftrack-dbgfs-v13-7-7b2a425019d8@kernel.org>
References: <20250603-reftrack-dbgfs-v13-0-7b2a425019d8@kernel.org>
In-Reply-To: <20250603-reftrack-dbgfs-v13-0-7b2a425019d8@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3044; i=jlayton@kernel.org;
 h=from:subject:message-id; bh=qsINcmyRJS/rIXB02gJnsJeatb4Kiva7Sr9N4CSqWBI=;
 b=owEBbQKS/ZANAwAKAQAOaEEZVoIVAcsmYgBoPtwaZNFk7Lyny66oAt+EwLN9ptUuT9lnz0z8B
 S1BqrIUsPKJAjMEAAEKAB0WIQRLwNeyRHGyoYTq9dMADmhBGVaCFQUCaD7cGgAKCRAADmhBGVaC
 FeiZEACLNbkqaUhiBGStZAF/Qz5Mgq6iIxUH9BbApYNRQosggDg7Oq5+RKSXYrlUBuN7PgajYqb
 TFFEdExexPq7Nj+0lmgPE0hsLOLL3fStubl+Vvl4jQjQAE/nBi65JfEvjGBHzhzrEB0se09P550
 KJdvT/0e9k7jc5+MyKTkzrRmzi3cfCFwsguLajldYXF4RqA/sG61wA2KiNRrNwso/6KBeEN5q5y
 FiqkIv7CKUnibgdYben0SjEjYX2sOicvZ3H0wUd2xN+cbl9Gqw0w0FcRvcvVuhOWVPmCzigsb+l
 RyITNWamfFU6LO+UwDu4QM/Wr7oFCFVV461o/xSfPT4kLmtbRvveUaW3a4QFkFd8hqhT8OKlbiI
 5ttvCczzlgtVYFEH88nvImVQUOthPp9tqjicNL9Q18+0Mm5bp43mLArXrWXz+b2yYV+P4tDr8vl
 c5MOU1giB4oZ5fPmxAOMVBAOm/kPvRJAbRga+4OU7uIMkAF47BF3YHUvxQheVRM9pc4JcPWoveZ
 50PfYM31XMS/U/n5d4ym+cO+aePnHY/N3ePObldPwnxzSKAslwnHE/hO9jiEKpLd/TUq2+Myznw
 2YwI+5r1DZ8GPhzwAmJgGqYOi3I5mWIrDA4sWYowj1GZTFq/KF9li7sMVwTDTLsY9Xg1lpEtPBe
 C1HbJJKnmOvjduQ==
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
index d4c1b1bae444debcb15ca20be39e35d25a7604d5..920538f1d3e9ee94acf141d1813badea59e3cfc6 100644
--- a/lib/ref_tracker.c
+++ b/lib/ref_tracker.c
@@ -385,8 +385,30 @@ void ref_tracker_dir_debugfs(struct ref_tracker_dir *dir)
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

