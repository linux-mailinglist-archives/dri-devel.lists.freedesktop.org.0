Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 827B3AA4FA6
	for <lists+dri-devel@lfdr.de>; Wed, 30 Apr 2025 17:07:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 13B2410E7EB;
	Wed, 30 Apr 2025 15:07:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="c9iJvpoL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4774A10E7DC;
 Wed, 30 Apr 2025 15:07:12 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id B555EA4AE31;
 Wed, 30 Apr 2025 15:01:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6ABDDC4CEE7;
 Wed, 30 Apr 2025 15:07:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1746025631;
 bh=HxYYob4i7WkZ4QVFzXDuapuOVvHl8o21L1EhBkSyHxk=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=c9iJvpoLxME0pedJkdJYf/mTX07Z1tRYXv2izX2mDQLS6fHRGun2hceoO/G2qCD1A
 s7g/3R8cvH+O4lxFY/YX8n2wYx8tZPifI8VYoOZesL/hkvlQIpQb/VL/gd1U8pQIME
 z9CLMyOnS3fM4cCyVJlKCrmE98U5fIEDS2ZnV5B+4YZlbewcwIA2ypb+PTx4Sr6/4r
 Ej3vBWOSg5FvnTOh40zwpeCrg8igtXk5xWt+qYY8dd9G3O40CUl3GOHwYGE7vH6G0z
 oSfiKav/kYS5Rjsy0zPF6J3yO34p60BUGe3p4sgzmJyJcOn1PcbmAgE7jtK321g75h
 qO6sbQdruCJ+A==
From: Jeff Layton <jlayton@kernel.org>
Date: Wed, 30 Apr 2025 08:06:54 -0700
Subject: [PATCH v6 08/10] net: add symlinks to ref_tracker_dir for netns
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250430-reftrack-dbgfs-v6-8-867c29aff03a@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1775; i=jlayton@kernel.org;
 h=from:subject:message-id; bh=HxYYob4i7WkZ4QVFzXDuapuOVvHl8o21L1EhBkSyHxk=;
 b=owEBbQKS/ZANAwAIAQAOaEEZVoIVAcsmYgBoEjyUuVkMoy78wN5CCpwW5xj/qphR1mAoNEtn4
 Nv5KKjK06qJAjMEAAEIAB0WIQRLwNeyRHGyoYTq9dMADmhBGVaCFQUCaBI8lAAKCRAADmhBGVaC
 FWCzD/9Zc84uzNPo6OQ36eKyNx0rmSVtujwMSxaE3qqL/DbF8sjCwhHNv57yeK3dYr1mkvWvlvw
 udhBtJK0gSu2bHhYIuoDDQCSfLqX+8CdC2KsaQkGDbLg1DBtjzgN2rTN1asqBXIEfpkkU77zxup
 9vmEmvrEaVhU5221dGZcPlacieR/cX+yr20I+Pc619rhUxt0yAT97BPmPZXVIUjoHe0Gq7TM6aJ
 96eUQnKDBvNJZyjF/3Du3bq/uOIoqtQ15nuwtCWoinzzar/zlm+E0MPU66I5bf6is65nhVaBrPD
 njb57ITAKq7FMcpft0ZGTUMhyH4nF6m4UHRcebYIgQ4rx6DaiQae7SX9wIX1o8BAgDmDS2sd8ww
 HLIo5WQIkO6pM9jr7nMlXHLF3VbvTSg25jW7gXPwT248UPn0v+DdR8viq7z6zoyIxNywQifpUUQ
 OFn0Y2Id9yJhbypaioY5Pl1jk1Wfz7swqVR/lpCc9IegvZV5TbYHgNfpzpxj34FkmKJzOwYtUmj
 69/vVc9T3cNLIK3o2qar/sImF8Ayi8D8EmirTw4cvT6JQRkt8Ym66v4dQ0WnJK6XKudou0PCkQE
 1OAEIwo0IsqjmWWmeoHIIILTUVHwliw6gCIcvI/QECSfDmLqXoSDYrAmpkxOFUV05S0BrsYP7V0
 iTRKApfY2p9eKzQ==
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

