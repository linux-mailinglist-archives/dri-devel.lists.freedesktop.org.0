Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8712DAA9AB1
	for <lists+dri-devel@lfdr.de>; Mon,  5 May 2025 19:33:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 618FF10E425;
	Mon,  5 May 2025 17:33:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="ELu+/4rt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 56D6310E427;
 Mon,  5 May 2025 17:33:44 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id E6BE1A4C50C;
 Mon,  5 May 2025 17:28:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8CD18C4CEEE;
 Mon,  5 May 2025 17:33:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1746466423;
 bh=IxEfJTwtv3tFnOemtDSe37OzngbMQVgueQwcSf7+mkg=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=ELu+/4rt2BNqbp8ena4859UqcWHtTy0fkPon13KDo0emF9hFIpaTvZiEbUzZ9KvwM
 eT/h2J7TC871dNKRmHoMA4dFelMqCf1ES3z3AuwOBGYNWah+qN6+I8X1Y6AqV9jaxN
 7Pzn71Klgm7tPfALaD+jbtc47dfnMlQ2CCQQmiXyK7U4GzEsU+tfodFx8zvYR2TDWY
 CWKCx4Pb1z8zgOWrfET4eBPvcba9Km34vL6FB80laCUQvV1G0Cr1RAQbZlRBR26BpL
 9kqWS4q2CwQIyMklNh1qNmLoGzRohEyNtnzuDWemjScZVRwHAh6C8LKjaGog4N2SD5
 mxFpkWaJOBKfQ==
From: Jeff Layton <jlayton@kernel.org>
Date: Mon, 05 May 2025 13:33:21 -0400
Subject: [PATCH v7 07/10] ref_tracker: add a way to create a symlink to the
 ref_tracker_dir debugfs file
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250505-reftrack-dbgfs-v7-7-f78c5d97bcca@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3235; i=jlayton@kernel.org;
 h=from:subject:message-id; bh=IxEfJTwtv3tFnOemtDSe37OzngbMQVgueQwcSf7+mkg=;
 b=owEBbQKS/ZANAwAIAQAOaEEZVoIVAcsmYgBoGPZmqYImS8VKF29pWEsy9M1mIaTDuMi+X5XLX
 i7o6JLBprOJAjMEAAEIAB0WIQRLwNeyRHGyoYTq9dMADmhBGVaCFQUCaBj2ZgAKCRAADmhBGVaC
 FXObEACsFcluugewWDUdniXoUPrmIoVz89U1FB9+MVnJs/+Qt4WWxFLadQlmtDJ23MTNghM7tgE
 VT5vdjTF8Qm/HkfJHjsbVy/1GfYkL4S1IdxfVS0Ey3BIIPBo2A3/sgmcIPfhojBBsxtavfJXJAg
 xHRkFiwmQY47op1AK4qPOTpJAqWI8e57tj8foWnWLZnTvlTtaFX5azoj5vil1ymI0LL6wOHo2CM
 GJluCIxdty9LLQFWY+kNW4BnnXJhvZtM7YVg4UKtMjPW9fJ0wve9gfSzeDkM/uhXW8eUO4Lej0B
 BXr2OqdoaxKQ56t7G44wKhaK0g54ROED8d2Jfm9b/sSE1p9rbYjs8Ae3Rx5gV2BeoAxvztR11nD
 fDqj6x19zDlzM2c173O/ZqmUZiCQ8rWSnvssuNZQIUIwCBRalmbWyvl+JdrPSFTQT48WCl13oAh
 g6x13Z+JedRAFqSrnXfMyfgkjDweOSvHuN+27iTi7xW0lvaA/oZ62DHzUm31LFMutxdL1LAMfL7
 AHID7sUhfE9pVdRFm8SK9bcupYVh340fx0m30zI4c76DbBHjh3syqDXf+qnhN60Ksh41QATQm+u
 iGcpG++uCqxnR0KYfAY0wouw5foT24M3iPyoJR+WswEKfdBPf4XMs9oFqnfSHOY3UAABv52jFy1
 8qq195W3/evKtTA==
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
 include/linux/ref_tracker.h | 11 +++++++++++
 lib/ref_tracker.c           | 28 ++++++++++++++++++++++++++++
 2 files changed, 39 insertions(+)

diff --git a/include/linux/ref_tracker.h b/include/linux/ref_tracker.h
index 17d5924d595ce95bfb5d8ec6d813490499bd89d0..b27cb7b3f1be5e16dedceeb0a88e9aa577be5dff 100644
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
@@ -30,6 +31,7 @@ struct ref_tracker_dir {
 #ifdef CONFIG_REF_TRACKER
 
 void ref_tracker_dir_debugfs(struct ref_tracker_dir *dir);
+void ref_tracker_dir_symlink(struct ref_tracker_dir *dir, const char *fmt, ...);
 
 static inline void ref_tracker_dir_init(struct ref_tracker_dir *dir,
 					unsigned int quarantine_count,
@@ -46,6 +48,7 @@ static inline void ref_tracker_dir_init(struct ref_tracker_dir *dir,
 	dir->class = class;
 #ifdef CONFIG_DEBUG_FS
 	dir->dentry = NULL;
+	dir->symlink = NULL;
 #endif
 	strscpy(dir->name, name, sizeof(dir->name));
 	ref_tracker_dir_debugfs(dir);
@@ -81,6 +84,10 @@ static inline void ref_tracker_dir_debugfs(struct ref_tracker_dir *dir)
 {
 }
 
+static inline void ref_tracker_dir_symlink(struct ref_tracker_dir *dir, const char *fmt, ...)
+{
+}
+
 static inline void ref_tracker_dir_exit(struct ref_tracker_dir *dir)
 {
 }
@@ -114,6 +121,10 @@ static inline int ref_tracker_free(struct ref_tracker_dir *dir,
 	return 0;
 }
 
+static inline __ostream_printf
+void ref_tracker_dir_symlink(struct ref_tracker_dir *dir, const char *fmt, ...)
+{
+}
 #endif
 
 #endif /* _LINUX_REF_TRACKER_H */
diff --git a/lib/ref_tracker.c b/lib/ref_tracker.c
index 723df31321242d6af267986cc56a9d80b6e5ad18..d59ef7200dd4f97f247ddd989beb5757b8afd519 100644
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

