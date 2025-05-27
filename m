Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D723AC4D88
	for <lists+dri-devel@lfdr.de>; Tue, 27 May 2025 13:34:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 07F7410E470;
	Tue, 27 May 2025 11:34:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="P/Qd9G2z";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6EF2510E4AD;
 Tue, 27 May 2025 11:34:02 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 8ED58A4F63C;
 Tue, 27 May 2025 11:34:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9E14EC4CEF6;
 Tue, 27 May 2025 11:33:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1748345641;
 bh=1AohjNsJ/5u7SWnSQ59F0LOjK/wKNx2WHjos8H9MEes=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=P/Qd9G2zvDpVWcyRAxVqjoE4w3rXgBziU37W5NbgLORAm8RSpoyDaPmetz64T450S
 8W4d1+J1WXbT8Dnb8XkO92tGGLlavpAlKfd8lWIxZqF7hw18V8sXUhZn5b5JrrYYsm
 bNG4CLpuXaHnmpvD5xyHfeIwbyC+HvdmPoGdZJ+k1PxbBu55lpldJFpChlOTAl4gNb
 1Mpzoz2JGjx5agCZqbT1wyKc8lJFQzAfn5bDxkIn5SoWrxqLrgq8NW/c9OXZN4UNA0
 3s4bfCKqNOsxCfhMlEqkIwedcLSvwvK/RFR8xZpo+Rll2jcss91meTypABrppZb+GY
 5VRPXu7YeLd2Q==
From: Jeff Layton <jlayton@kernel.org>
Date: Tue, 27 May 2025 07:33:39 -0400
Subject: [PATCH v10 8/9] net: add symlinks to ref_tracker_dir for netns
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250527-reftrack-dbgfs-v10-8-dc55f7705691@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1849; i=jlayton@kernel.org;
 h=from:subject:message-id; bh=1AohjNsJ/5u7SWnSQ59F0LOjK/wKNx2WHjos8H9MEes=;
 b=owEBbQKS/ZANAwAKAQAOaEEZVoIVAcsmYgBoNaMXOK09R4jSfVB8gdNvrjW+aO6jrUnbP/1CY
 t50wMnUT/+JAjMEAAEKAB0WIQRLwNeyRHGyoYTq9dMADmhBGVaCFQUCaDWjFwAKCRAADmhBGVaC
 FWixD/0XOX0kufIOnTf3V6fk9Dj2Z799XOtudAidPehZJIYIpgM+dc/y4A0UGc6+g4tzsFajs/d
 +EbxW+wxUHHECScP0IYHUAH28rjwGO1+f3lcMuLwKnBBmT1YJ4B/jGjyvVOD4QvyprabwW1ZT16
 Ai4GJrycV3b3Rj8HSxqszYJYEwriLCk6Dhspsfc1JLbAil7z023a09hSxK0WNTpuyWMzn6nYyLt
 a/6adaQ80qAAMMWh3ExXjMQOcI0ZLfEwg8JGKN+fGgEDG+Ykiiq3RSM3gCsJXbcMbL0MetJL0T6
 iIe7pvaBin/cXCToQV9ovOY+bJJJVcxDJn4HxZmb4fF7FGpJm8MF8Zts6zhlpvwEIG0+8BKdj6A
 Mn0neHMNrBPjT7Wha87sOomrhVsOXmSxj5Psqymw3t5U9Hb6ocsX+hlJRn5IdDb+nZ1aWsTb/KI
 gh0JBC1CboF0FDEyj6rYSyRG8nORrrNPVATqd1tENMP6qck3pAB2FBZkN3Occw8WKTJdKJlRND2
 VeD2JrZ/c7RIj85RloOhGKCYd0/ccDBtPCBdfmr1TJvCr8YaJuOyQH8g1My1nVugBRkFHMZchc9
 +JLZTQUit3FPgvYwt8ZtR2TR3VUzr62fzQnhB0Bb/t7EHhtHhbITaGuIYUFdWty4gAfNuciD4Fg
 4ivEwns6h1Z5WFw==
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
unique name for each netns refcount tracker with the ns.inum and
net_cookie values in it, and register a symlink to the debugfs file for
it.

init_net is registered before the ref_tracker dir is created, so add a
late_initcall() to register its files and symlinks.

Signed-off-by: Jeff Layton <jlayton@kernel.org>
---
 net/core/net_namespace.c | 30 +++++++++++++++++++++++++++++-
 1 file changed, 29 insertions(+), 1 deletion(-)

diff --git a/net/core/net_namespace.c b/net/core/net_namespace.c
index 8708eb975295ffb78de35fcf4abef7cc281f5a51..39b01af90d240df48827e5c3159c3e2253e0a44d 100644
--- a/net/core/net_namespace.c
+++ b/net/core/net_namespace.c
@@ -791,12 +791,40 @@ struct net *get_net_ns_by_pid(pid_t pid)
 }
 EXPORT_SYMBOL_GPL(get_net_ns_by_pid);
 
+#ifdef CONFIG_NET_NS_REFCNT_TRACKER
+static void net_ns_net_debugfs(struct net *net)
+{
+	ref_tracker_dir_symlink(&net->refcnt_tracker, "netns--%lx-%u-refcnt",
+				net->net_cookie, net->ns.inum);
+	ref_tracker_dir_symlink(&net->notrefcnt_tracker, "netns-%lx-%u-notrefcnt",
+				net->net_cookie, net->ns.inum);
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

