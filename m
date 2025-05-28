Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 58D0FAC6BD2
	for <lists+dri-devel@lfdr.de>; Wed, 28 May 2025 16:35:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A84B10E67C;
	Wed, 28 May 2025 14:35:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="rVjGgmEE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA5CC10E674;
 Wed, 28 May 2025 14:35:07 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 26D10629D3;
 Wed, 28 May 2025 14:35:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0BE21C4CEF1;
 Wed, 28 May 2025 14:35:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1748442906;
 bh=C3NjXad8atSO1FZ7CKOXtU5VIRqVojZ9jejAtjAiqWM=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=rVjGgmEEhYyWizmS5qe9pgAkmMhCy5Zj85Jv1kZ7Y2O8Ub7mlkHLihVkcMAk3H3ZN
 E7iRTygacktYSR7oOXiWRsD4zfrryIKN6MiIByx2cAu0X0ow+A4BOIK/GAo71/xF9U
 X0OyB/gT4HHIT4NlCAS4XfvCMoDEPPA/8sG+R8eCIs8o12IXwBeruZ6koDYesPjKar
 GanDmCR5KWzx8+sbyDd4E+RoofJiXj/MsPXJt6yO5IfAiFcv2mYlmADVxxkrg+cOGw
 ZuH41NBRrISpjmG1UOZLM69X4riZAMF9v1FcxoWKrsjFaiKUW4GbyMBfWRkZ6OfIkA
 D7xaTgAaGNONA==
From: Jeff Layton <jlayton@kernel.org>
Date: Wed, 28 May 2025 10:34:41 -0400
Subject: [PATCH v11 09/10] net: add symlinks to ref_tracker_dir for netns
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250528-reftrack-dbgfs-v11-9-94ae0b165841@kernel.org>
References: <20250528-reftrack-dbgfs-v11-0-94ae0b165841@kernel.org>
In-Reply-To: <20250528-reftrack-dbgfs-v11-0-94ae0b165841@kernel.org>
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
 b=owEBbQKS/ZANAwAKAQAOaEEZVoIVAcsmYgBoNx8G2qhxKRFMIuvaikAolyZRaHqqMfY9w6wlB
 B8ZCTg6SAqJAjMEAAEKAB0WIQRLwNeyRHGyoYTq9dMADmhBGVaCFQUCaDcfBgAKCRAADmhBGVaC
 FX5mD/4nt7J4dnvaIJZmR0mApa7CMh0kmPKOmUvWbpC4J99+rVd4RfMPu6Hwcj8EaNHJNOyw/+h
 sasuPE/veTJqNVEI4OOcaNY99cNzGgv22I/eGcGZ4NLvKp3mtxed01UIeZAW6SlYpYVHrBc3cxV
 UdGhqdnLJx+91ZubJppxk+9lUHIw4s8xgdSPiz+D/EG66drv/cYSsNETN1Wtjnp1qSMu82c9T4o
 HKs0MLdC3XLCARnfPb0Tb27kbfZmziu50XXL/szr7zIEyQvAlRnWg6pitWPGj19nOnPhMKYrrgH
 ymKlmIOce9dEypxjDuoIj2WHuSqNuAWNj8DNinabRBoN3+/ccM6WXPya3+Go9mOTuQ/9+VDcfX6
 ev+KRvhuwjK1bz+3NCwIi1PWmdmIQFZsppnGicY/PhokPcGBEfXl3zG114KX3y3gDBwyKQbs9Fz
 KOM1hEEy2P9tGBDRVhBZlfelyhJ+V6UIC+pQYeTa0wr1nJNaQRuyEb3PRAO/Jzenz49IjbGui1D
 ue7VyzRbPo6IhyX389oz6CjJNxBzxPrJLFN/RZJsRHjTwORAmkLQZaIuGLd+JM6a5s96nSP8Qhv
 UgStVmt3LYhMSTBdzfg9EqLvvcNMqqbrYDFIUkAtpOXONInWIOi6kyQYexpxxUHP6DF+eb/Udxo
 4+/1LJXwJxD4rDw==
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

