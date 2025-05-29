Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D32AAC8025
	for <lists+dri-devel@lfdr.de>; Thu, 29 May 2025 17:21:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3655110E74E;
	Thu, 29 May 2025 15:21:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="kMF8Sw7x";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB30610E754;
 Thu, 29 May 2025 15:21:32 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 4574D60010;
 Thu, 29 May 2025 15:21:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 30A16C4CEF0;
 Thu, 29 May 2025 15:21:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1748532092;
 bh=C3NjXad8atSO1FZ7CKOXtU5VIRqVojZ9jejAtjAiqWM=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=kMF8Sw7xGxLd2lLIJfHrmy5vA4hkuQ4Rx9jKUmNOcFU4SlNiGf37zVLhWF9c4QtSS
 FR50PlvR5XEMhwJMVlDlhGXp5WHdIEsWJ594r+nuckuJUAuFASjiMuih6yramz9vW+
 6PXjdqEc08WZCfYVNF14+DD2Cvx63WPP6Gmon9hhIe6csZ0fhbfADDzjwvqslAJWrx
 iqN96dVv9GsQmTMZPJ9yk4jPQYzPQ9Sz2pW0Aca1Rd1OZWNwc1onAC7ZJYGxDqTy1F
 ZI1vBpRqyMlyLSUfCDxf0omS4zON78XzoAfgHJO2Vj6cQKqeW/WeoI/fCiKX9r4mQO
 zqvFmv7QTK2Cg==
From: Jeff Layton <jlayton@kernel.org>
Date: Thu, 29 May 2025 11:20:45 -0400
Subject: [PATCH v12 09/10] net: add symlinks to ref_tracker_dir for netns
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250529-reftrack-dbgfs-v12-9-11b93c0c0b6e@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1850; i=jlayton@kernel.org;
 h=from:subject:message-id; bh=C3NjXad8atSO1FZ7CKOXtU5VIRqVojZ9jejAtjAiqWM=;
 b=owEBbQKS/ZANAwAKAQAOaEEZVoIVAcsmYgBoOHtnfvs9pjt9Rl/Zi1M5/arux6vA5kyN/T+ZS
 u/b6du0baCJAjMEAAEKAB0WIQRLwNeyRHGyoYTq9dMADmhBGVaCFQUCaDh7ZwAKCRAADmhBGVaC
 FeKyEADFuEALcfM1T+CmjS0c3/YZIgncuvz52TkQDFPi0tjbtjgQ3LudJoo7etZ8rvBceo7C0iG
 uuVkKViJ9NfLPCkZlBFGaaBw7RLHB3prepzbAdB4eG73DxKsgJ34q8vetVbUoOZ3V4M28YQTEk2
 q94JijT6UtOGSprbC24ZeMyS3lyTlowAXsPZ69e+cEMmXoVE1tY9Jp9mUI7GDaTUj8kdUeSXEIp
 KsG6j8EftlyMcq28lgluPKB7MM55t8wotNkIXjM1NST8TH5vm8M58V1vdEhIY89fw0RRMuf3Pjx
 cxdNLZ2bhnYDQQ9VDhRrBj5JuhS8COXIUzKOe3coikPzx9Ikw2Hc2/7eJjmjHuifruHeRGBdY71
 Vr1nfvjG7Ppv+F3tdundvJwFko77oWah1TDiLii1huoG2TXQjF1y1M+W2IKeJIWU+oqF7Pg1ZNk
 mvT9h9Ccw8nOQT2GcpP8JO4BxjE9jWsZkh0sX3cP30Vrbaelk0nBOL7o6b/LpibfVL/pqGxki6p
 Hftz/VRStYEnklLMV3Vf7PAPTt6MjrtOdkg4SkcU1Z1FIR8uQEidCPmldf+SlyQ6f8xqwrQLBSj
 abvvnUSLoux7PtAwCSpYXL4t4ydPJ7ETfZs2JM5bHwjmSgysCsUaNZptRlMg4uUU5w3a/ncqSoF
 8xKhRtbCmMdpIqg==
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
index 8708eb975295ffb78de35fcf4abef7cc281f5a51..b2fd9c5635ecf8fccd48f1d5b967a5c6c41cfec4 100644
--- a/net/core/net_namespace.c
+++ b/net/core/net_namespace.c
@@ -791,12 +791,40 @@ struct net *get_net_ns_by_pid(pid_t pid)
 }
 EXPORT_SYMBOL_GPL(get_net_ns_by_pid);
 
+#ifdef CONFIG_NET_NS_REFCNT_TRACKER
+static void net_ns_net_debugfs(struct net *net)
+{
+	ref_tracker_dir_symlink(&net->refcnt_tracker, "netns-%llx-%u-refcnt",
+				net->net_cookie, net->ns.inum);
+	ref_tracker_dir_symlink(&net->notrefcnt_tracker, "netns-%llx-%u-notrefcnt",
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

