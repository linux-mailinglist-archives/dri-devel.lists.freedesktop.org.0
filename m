Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A1761A9F87D
	for <lists+dri-devel@lfdr.de>; Mon, 28 Apr 2025 20:27:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B3C3310E6BF;
	Mon, 28 Apr 2025 18:27:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="ROUBUlXP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 394E710E6A4;
 Mon, 28 Apr 2025 18:27:17 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id D84485C5F70;
 Mon, 28 Apr 2025 18:24:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 08A5FC4CEF0;
 Mon, 28 Apr 2025 18:27:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1745864832;
 bh=HxYYob4i7WkZ4QVFzXDuapuOVvHl8o21L1EhBkSyHxk=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=ROUBUlXPD3eKLlzG4sQHNnNBoZW0cz/EGuOl2q7VbT09u74yESrZWWaOyhFSo748a
 vy68Fpcsm7U2UWBKOpl6AqLQj+JkuXu/S+Q84qkFSB8tEMYldDJHKcg8bM7FwuBwrw
 KLsrZR99QpVZRTKTkt6kHXR4v8MuVHrJX2cJngZMwHoK7oL3mFOxK/oiLCFzfbI4Vy
 10qF7ZDfmNbxJAw2BrrbJDxJqryDaug/l4kjwCZMiLhYC+H1AsDo9PkYF8JuQSpCpu
 FN2s34oVZFlWlOHiiMNqCV5G7kSdoax25/7s+n4og8b6gPrVioy7fTahXAO2kPgdSB
 m5gzPmzv2YEeQ==
From: Jeff Layton <jlayton@kernel.org>
Date: Mon, 28 Apr 2025 11:26:31 -0700
Subject: [PATCH v5 08/10] net: add symlinks to ref_tracker_dir for netns
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250428-reftrack-dbgfs-v5-8-1cbbdf2038bd@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1775; i=jlayton@kernel.org;
 h=from:subject:message-id; bh=HxYYob4i7WkZ4QVFzXDuapuOVvHl8o21L1EhBkSyHxk=;
 b=owEBbQKS/ZANAwAIAQAOaEEZVoIVAcsmYgBoD8h2GIUwsTMOiBkykV6nuYvnnAsHTw4T6X74O
 LiXbumtkWeJAjMEAAEIAB0WIQRLwNeyRHGyoYTq9dMADmhBGVaCFQUCaA/IdgAKCRAADmhBGVaC
 FWI4EAC0+pEyulF/sfWI4GSW8V2DaQRCQDfMCa92oSSE+i2/vnZtDa+FhiFKqLgJ9Qbc3zIWMlh
 6uP25y50Qr1XSgtQHIKLfeef4UngKWy95iLBqv2QtI+uzKXMUkUQ4bkIBiHwxjtW8lZ3uHuHHqn
 grX6JJ7bmKjqS/PaFPftvv5d8wfpQgmXNiZTtxGEOP7aHfcvXzVINbFbyIwla/FMoEddtGqVaG9
 AoTZxDzZRkk4JQuPtOWeXOwfhF3BQTSFuRBbuHURzkyVhNl8Hsa86xeyalMymzqdcbSYKBuB3g+
 12SX0db02yr7eLebsMfBu7PamKhoCVjrGstlYVoFMCbcZTBzFVnCbIHQYmIyI0hf8KyUTaGxKbw
 DXu8/o1myOyFLOSg4EUgHDV/OIThbVttBFOOdqtI6s1RoPPKdl4sC/Ar+CeanAvtJYev6kNsHSV
 fnC0XIsfpC/vLq+zAHIcHXjrmbDr8WrX7XVVV260UIOSfRZxZ2Ht8Cq6z7HaXXUhdZjIj6PBaRu
 IvN965JX5hN83cyTVvvkhU1XE5gU9bfCM8vJL2wg38eGkYeD3dvYb9ZMorOMiaXp3pxoPSxZhwD
 yEqOqcZZclxe9rMFKiry7qlIMyR0VXHi4pTWeR/scKwmMtwgslVeukSTDjLVLPqTI1HazahW185
 TS1zcvNTf8Zep3w==
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

After assigning the inode number to the namespace, use it to create a
unique name for each netns refcount tracker with the ns.inum value in
it, and register a symlink to the debugfs file for it.

init_net is registered before the ref_tracker dir is created, so add a
late_initcall() to register its files and symlinks.

Signed-off-by: Jeff Layton <jlayton@kernel.org>
---
 net/core/net_namespace.c | 28 +++++++++++++++++++++++++++-
 1 file changed, 27 insertions(+), 1 deletion(-)

diff --git a/net/core/net_namespace.c b/net/core/net_namespace.c
index 008de9675ea98fa8c18628b2f1c3aee7f3ebc9c6..6cbc8eabb8e56c847fc34fa8ec9994e8b275b0af 100644
--- a/net/core/net_namespace.c
+++ b/net/core/net_namespace.c
@@ -763,12 +763,38 @@ struct net *get_net_ns_by_pid(pid_t pid)
 }
 EXPORT_SYMBOL_GPL(get_net_ns_by_pid);
 
+#ifdef CONFIG_NET_NS_REFCNT_TRACKER
+static void net_ns_net_debugfs(struct net *net)
+{
+	ref_tracker_dir_symlink(&net->refcnt_tracker, "netns-%u-refcnt", net->ns.inum);
+	ref_tracker_dir_symlink(&net->notrefcnt_tracker, "netns-%u-notrefcnt", net->ns.inum);
+}
+
+static int __init init_net_debugfs(void)
+{
+	ref_tracker_dir_debugfs(&init_net.refcnt_tracker);
+	ref_tracker_dir_debugfs(&init_net.notrefcnt_tracker);
+	net_ns_net_debugfs(&init_net);
+	return 0;
+}
+late_initcall(init_net_debugfs);
+#else
+static void net_ns_net_debugfs(struct net *net)
+{
+}
+#endif
+
 static __net_init int net_ns_net_init(struct net *net)
 {
+	int ret;
+
 #ifdef CONFIG_NET_NS
 	net->ns.ops = &netns_operations;
 #endif
-	return ns_alloc_inum(&net->ns);
+	ret = ns_alloc_inum(&net->ns);
+	if (!ret)
+		net_ns_net_debugfs(net);
+	return ret;
 }
 
 static __net_exit void net_ns_net_exit(struct net *net)

-- 
2.49.0

