Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 683D7A9F879
	for <lists+dri-devel@lfdr.de>; Mon, 28 Apr 2025 20:27:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 362C510E6A4;
	Mon, 28 Apr 2025 18:27:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="hoKEP/4K";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 232CB10E6AB;
 Mon, 28 Apr 2025 18:27:12 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id E604149FFA;
 Mon, 28 Apr 2025 18:27:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 36174C4CEF2;
 Mon, 28 Apr 2025 18:27:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1745864831;
 bh=i0sKkNPaB0sY+YCWICK9OSFrGSBCfe0apiknij8kW04=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=hoKEP/4Kkao1Nmd7KgvmqFCRwZquS4LU+DlwxXpqciMNa6rXs5rdQ3aNHVwqeAES0
 yEiDgUKSqucnDwbJekI6GPBLdB1l063zpo9segVy8zHTt0KdB5mI60Z8G9c/CSMfYE
 tC1++zpjlUbfjc6zrVAQ7HSBxS8lXJESYTzHQiTcM3ntOQnhJy66HS4xSOh407JM97
 wEWO6FSRwGZv9Ax+9nSABPXZkXis1RrqaYfYZ7RCIqwo7AeGNOeNmDSTzc6FKYgqzs
 /vW+vSLRhYaQsi0OCavsyBuyy6TXscBwF8s4btbLfq+ekeEtq6KUIBO8Y4R31pfiV7
 VqtX+LVxMtIVg==
From: Jeff Layton <jlayton@kernel.org>
Date: Mon, 28 Apr 2025 11:26:30 -0700
Subject: [PATCH v5 07/10] ref_tracker: add a way to create a symlink to the
 ref_tracker_dir debugfs file
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250428-reftrack-dbgfs-v5-7-1cbbdf2038bd@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2954; i=jlayton@kernel.org;
 h=from:subject:message-id; bh=i0sKkNPaB0sY+YCWICK9OSFrGSBCfe0apiknij8kW04=;
 b=owEBbQKS/ZANAwAIAQAOaEEZVoIVAcsmYgBoD8h2mnfftV3/eT0IIGckwJAUE6JefHdUn76tY
 BT0pXPJ6fCJAjMEAAEIAB0WIQRLwNeyRHGyoYTq9dMADmhBGVaCFQUCaA/IdgAKCRAADmhBGVaC
 FWu/D/9Y0/TN64vxBj4sSN5GZ36a9aqZ/hBAB+vKh/1b0QTT1tUlKbxfdUosPfz+8H63LEKipjg
 dRmTegRPq+Fq9pRLgJCLni8Wx21MhwmTrPFHNz81zcsGuLS1jcNUODSwPJTvT8gaK/LiZurmn/5
 hh7Wl+k3Fye4G78UI0eBMB+g8Hgu5ATr8WHhz2n4yu4R1kyI+KVGc+FcS2khgEvwqDhLwFTb6ky
 1CyNWa9ikWs8f87Ytejv+m0TJ8pSh38AYMtKYxXHQUzCnsdOvz/oKJRfQOum/To6m7AqaLQnVuG
 RuMIxFnBEQwU/Ua1nS0AGbOrE0gHhI/nPPEsxiYwySvbPDRujt7G9Cf4Mwjm1QT1kg/jqarqqBg
 hEZzu/Jh4Ga9Fo9x0wohELe7WEObYqZA5ANyn+/OIHLNd2thlA9x5xk7xtzxCRQnhfoCOjEJHTl
 QsHsAdAoQUVlI5aOfcSmbwfQGfmGWomclny0DNPdRyP7BYElF1545tNO2emrKke7U6mMydtj85e
 pf0TYtZBe61ZvCz/8BfwCGUPvVTV4KfXgHeA1ykU4lIdfDGVljXUXbknkJWHJDQPdf75KQpAkfi
 m3xeOWb9ikiX+NDU1tsUX1tLrWpDw2ul99o3gTJExNbWnX03x0G53KY9hf7IHk7GnQKb/Vs0oKb
 YDMJM2whpsvjKMg==
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
 include/linux/ref_tracker.h |  7 +++++++
 lib/ref_tracker.c           | 28 ++++++++++++++++++++++++++++
 2 files changed, 35 insertions(+)

diff --git a/include/linux/ref_tracker.h b/include/linux/ref_tracker.h
index c6e65d7ef4d4fc74c60fcabd19166c131d4173e2..a011297c501011c697de44469f9720597aa33116 100644
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
diff --git a/lib/ref_tracker.c b/lib/ref_tracker.c
index f5424857b0fde2339cce31c6744fd4dafbaf0d2a..25fb22c0a367573851d83a8a00b99b109871f47d 100644
--- a/lib/ref_tracker.c
+++ b/lib/ref_tracker.c
@@ -394,8 +394,36 @@ void ref_tracker_dir_debugfs(struct ref_tracker_dir *dir)
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

