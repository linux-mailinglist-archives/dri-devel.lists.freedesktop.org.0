Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 921B8AC4D89
	for <lists+dri-devel@lfdr.de>; Tue, 27 May 2025 13:34:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E3AA10E498;
	Tue, 27 May 2025 11:34:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Aw0iSSm1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7AE1110E4A5;
 Tue, 27 May 2025 11:34:00 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id B7DE3A4F63C;
 Tue, 27 May 2025 11:33:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A7450C4CEE9;
 Tue, 27 May 2025 11:33:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1748345639;
 bh=G4yxeje4skzZFbWd4GKautKhwMx5ZwXU4VPyyJVpR7k=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=Aw0iSSm1S0t3tCblVTk5XvM24Gwf7K/wfMLepIoY38//FCey7SfKwzIHcOFJG3PKz
 mvgsicZWYEJchF7QTR38ihY904D6I9JVfbLcOVVS6IWpDaJw6gn0O8rMPpQ/4jVEaX
 5BdedD+R7OlPaUzFGpD31zcP9Deb8bpOh2sdNhVbomfktoD8Jkrw6mxmGspuBVlAbw
 9rvDmCQ5i4P7cZvuM81UFSGn2VFTsSlPFxi4bmA2FuoorxoNc7brn0NGwiF5SnCNJa
 gCpFc9mZaJYBT44lnA6MHo4Mmmj1XboBvkhzUuMQd1ZA7RVAcu84PpgpIOlAXy46VF
 Wy/vvzZTETtpA==
From: Jeff Layton <jlayton@kernel.org>
Date: Tue, 27 May 2025 07:33:38 -0400
Subject: [PATCH v10 7/9] ref_tracker: add a way to create a symlink to the
 ref_tracker_dir debugfs file
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250527-reftrack-dbgfs-v10-7-dc55f7705691@kernel.org>
References: <20250527-reftrack-dbgfs-v10-0-dc55f7705691@kernel.org>
In-Reply-To: <20250527-reftrack-dbgfs-v10-0-dc55f7705691@kernel.org>
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
 b=owEBbQKS/ZANAwAKAQAOaEEZVoIVAcsmYgBoNaMXBjdm+wdW+yNOSkgrF7FG2s7lNnUdusebv
 HDFwNef7JCJAjMEAAEKAB0WIQRLwNeyRHGyoYTq9dMADmhBGVaCFQUCaDWjFwAKCRAADmhBGVaC
 Fa4YD/9386ZVYoZVs5AQHOlKBk8PipdaE8wAGdwf8LprXtukpjpXE81e4Ffc6BqX5EKeib+wAjA
 XrNT4y8hcGNJRnsjv0VDofYhGPsuB9k+/A70ktsqWzPneIZ2k9UE2v26984NNUS/Q9h7zFPlMfB
 TZ641QJhGQss8zGnOO3XNF1ts0GpCRsUBTjfDPoAOVv+kG2wu/Tk0uW9oxH01ovdJ9ESy0m4aUh
 d4kZ5LLNeYh6EsZKZfzP7MTMbJpHgwbptKRTekvGc5goKxG1wosGdMv0CBzu4J9+bGfKEWKrOfj
 EkvCJIrUmLVGJvUiPVYiMgQLld1uf4bCB068PYM9uHOXSPOsoQ4J/XhvfQ4Z3I9RiysflJhZRNr
 hRyOG8XLiz74JCFZGC5xNEMrbi1PRlIp3viZbJnyGsWvVbVStDD9Ru9AA7oijBtrk6f2Y++cU+b
 1eFecZTAWB8LdLHzbexk1aLoZPCI6lGuMrUY/XdU0RiZyiVuc1qGSDH1VYft6rt3ZBUaRimqNuT
 OVCS9yV6wR2LmryDteeooDfbXsrAPbdTNRI9/eTC+VXzKw6A0gxonbafwN6aHjNoEvYb1SMomMw
 Y+XB0xIkPWP7FcMjmLs7S4DkiYWZKsktTwyokH6cvOuhbwSN7Eacyi4gm/h+cTkH9P1ijH99Sv/
 z9qjysyjvSD7Zmw==
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

