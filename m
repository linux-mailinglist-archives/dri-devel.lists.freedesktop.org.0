Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C1592AA4F99
	for <lists+dri-devel@lfdr.de>; Wed, 30 Apr 2025 17:07:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED7B710E7D9;
	Wed, 30 Apr 2025 15:07:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="hpzK8cQC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B0ED10E7D5;
 Wed, 30 Apr 2025 15:07:11 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 6F3D35C4905;
 Wed, 30 Apr 2025 15:04:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0D033C4CEEC;
 Wed, 30 Apr 2025 15:07:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1746025630;
 bh=l2OCUUbhAtEJhunFl9s7WpfywU8jr7sBKcPv0mzaIgc=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=hpzK8cQC9tKAyzjvucQ9iN+kZ/LjIAStnT1l0CirHdaPkndNg1pfw6OJ2LCoF4AOW
 GGn2qXA9tiNNWoMthMznaC/ZMrTlID39WzPzb5taSbvGXnwVQGcrpx2X1jM+iAp4uj
 bjZHbv9og3QGCPaHLwLIr3u9R2FdiEgfRb/6DQ3qyN8lOhKSQ/8vK2T1IM2XIHUsCy
 wblcZshwsKly9cfp0H4/ppWxPvq/Do7CXQkCfoBW7kG+qfzncarfI9NaXYKa7lkaIJ
 sBWePkWqLGa2Jthrbe9Qz/dEiYdungevR6nygKNP33Ogu/h+IYzusp03dndOn5euul
 uUMdNgvNtGmgA==
From: Jeff Layton <jlayton@kernel.org>
Date: Wed, 30 Apr 2025 08:06:53 -0700
Subject: [PATCH v6 07/10] ref_tracker: add a way to create a symlink to the
 ref_tracker_dir debugfs file
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250430-reftrack-dbgfs-v6-7-867c29aff03a@kernel.org>
References: <20250430-reftrack-dbgfs-v6-0-867c29aff03a@kernel.org>
In-Reply-To: <20250430-reftrack-dbgfs-v6-0-867c29aff03a@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3214; i=jlayton@kernel.org;
 h=from:subject:message-id; bh=l2OCUUbhAtEJhunFl9s7WpfywU8jr7sBKcPv0mzaIgc=;
 b=owEBbQKS/ZANAwAIAQAOaEEZVoIVAcsmYgBoEjyUxlaClx2l1uovcL0XdFjxbdtx9MQCIdkCR
 ftLMdlZ6kyJAjMEAAEIAB0WIQRLwNeyRHGyoYTq9dMADmhBGVaCFQUCaBI8lAAKCRAADmhBGVaC
 FQB3D/9PQ1WZ8PairKuf37rAmKR3/4iexcIQGa+ifz04gdQ9A+xqtthSJNBUJ+gl3BkhwNNi+Fr
 2nFviSEP1hVlJFFpmkRoJbf7noJ0CiuWVLszWK9vHI4s/UW8iJwKbnaC+8CgTnXeuaoKyb/0cw7
 qJ8xFOC+bxSd96EjSHb/4FCmIvruHcJovfQR5AxanWZVInqg17C4Gl1l8ddNyEICZNBwvrKkNJQ
 OfcSXOLNFdYFDjtd0jIt5iF9vX+VkCcw6IHyweOv26kFW9A2yruqSefxdOkWHXbsOo85fFji2+J
 8uU2nEVhzBMdENTMF6KfrdvjIOc50qGN66LxecGWkDB5dL2YABnsuDYn67udtImpWVEYFdMrxgO
 HDj8kEY4fj1FUpkYHKq9/0wBmQIMlDKES6m3JQGPy2SQ756V16iJqKGHcXtRG7Vc1ZieXjXw6GW
 GQdAOT/hwg0gqbyj2SET1X1TiZXb2zOJALcCXf2H9WF4Wjjndp+ZANWm33pkySfxGNtiCuNETra
 tP7tCwliNziK6/QElPi9r8b3qFlteEqp+1leWgbrys0E2lO1/J7z0U+Pnqa21cBdj98QzcoIkCs
 Wy07gDdc0VYEvIUW1+70jlrnmtEkiUqB+Y3VKurcn3/cnRZiyVGF+PFALyYmT/EsJDWWXrtRx8Y
 BQp886aCK+iTJOw==
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
 include/linux/ref_tracker.h | 10 ++++++++++
 lib/ref_tracker.c           | 28 ++++++++++++++++++++++++++++
 2 files changed, 38 insertions(+)

diff --git a/include/linux/ref_tracker.h b/include/linux/ref_tracker.h
index c6e65d7ef4d4fc74c60fcabd19166c131d4173e2..210f26e2528f23bea3b713a57ac27c730bd100ce 100644
--- a/include/linux/ref_tracker.h
+++ b/include/linux/ref_tracker.h
@@ -21,6 +21,7 @@ struct ref_tracker_dir {
 	const char		*class; /* object classname */
 #ifdef CONFIG_DEBUG_FS
 	struct dentry		*dentry;
+	struct dentry		*symlink;
 #endif
 	char			name[32];
 #endif
@@ -29,6 +30,7 @@ struct ref_tracker_dir {
 #ifdef CONFIG_REF_TRACKER
 
 void ref_tracker_dir_debugfs(struct ref_tracker_dir *dir);
+void ref_tracker_dir_symlink(struct ref_tracker_dir *dir, const char *fmt, ...);
 
 static inline void ref_tracker_dir_init(struct ref_tracker_dir *dir,
 					unsigned int quarantine_count,
@@ -45,6 +47,7 @@ static inline void ref_tracker_dir_init(struct ref_tracker_dir *dir,
 	dir->class = class;
 #ifdef CONFIG_DEBUG_FS
 	dir->dentry = NULL;
+	dir->symlink = NULL;
 #endif
 	strscpy(dir->name, name, sizeof(dir->name));
 	ref_tracker_dir_debugfs(dir);
@@ -80,6 +83,10 @@ static inline void ref_tracker_dir_debugfs(struct ref_tracker_dir *dir)
 {
 }
 
+static inline void ref_tracker_dir_symlink(struct ref_tracker_dir *dir, const char *fmt, ...)
+{
+}
+
 static inline void ref_tracker_dir_exit(struct ref_tracker_dir *dir)
 {
 }
@@ -113,6 +120,9 @@ static inline int ref_tracker_free(struct ref_tracker_dir *dir,
 	return 0;
 }
 
+static inline void ref_tracker_dir_symlink(struct ref_tracker_dir *dir, const char *fmt, ...)
+{
+}
 #endif
 
 #endif /* _LINUX_REF_TRACKER_H */
diff --git a/lib/ref_tracker.c b/lib/ref_tracker.c
index 3ee4fd0f33407881cfa140dcb7d8b40e3c2722de..16ef752e52c230763f2832c312793d27da47c608 100644
--- a/lib/ref_tracker.c
+++ b/lib/ref_tracker.c
@@ -392,8 +392,36 @@ void ref_tracker_dir_debugfs(struct ref_tracker_dir *dir)
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

