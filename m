Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 07BD0ACC55C
	for <lists+dri-devel@lfdr.de>; Tue,  3 Jun 2025 13:27:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 862F310E5CA;
	Tue,  3 Jun 2025 11:27:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="nJWf9PqE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 759F410E5CA;
 Tue,  3 Jun 2025 11:27:43 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id A6EBDA4FDEA;
 Tue,  3 Jun 2025 11:27:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 77930C4CEF4;
 Tue,  3 Jun 2025 11:27:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1748950062;
 bh=C3NjXad8atSO1FZ7CKOXtU5VIRqVojZ9jejAtjAiqWM=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=nJWf9PqEnvvty5KAcKmlN+gkgwCN0pRwDvUNlP/s8LJeimjpochQRjmhpblQs21qj
 UMrRB+Yp+bEhCOd6pNKooz5fDGl+bTfP0GkfD3//TUHuzii0hy30L+cBBdh5WkzUtc
 lwURWzi4/xjLBnqN3RjMKDPvxVqMPSu+YU2gfT3Y1muPT7AG5reR2pbhYLJHEcydD7
 LEfFVgtwkpd6hcqPrIWNJiZj/xWcW1YBkevQ9i1+51q9eVQflfRyV4zU1bKxCYHD4o
 KcHT05jzWcdzV3YBpd1lvtIo1eVSdB/ghWbakGddINUODqsJPSLJqwbtXKDdkp6p0/
 ilj0aa+DtjJhw==
From: Jeff Layton <jlayton@kernel.org>
Date: Tue, 03 Jun 2025 07:27:19 -0400
Subject: [PATCH v13 8/9] net: add symlinks to ref_tracker_dir for netns
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250603-reftrack-dbgfs-v13-8-7b2a425019d8@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1850; i=jlayton@kernel.org;
 h=from:subject:message-id; bh=C3NjXad8atSO1FZ7CKOXtU5VIRqVojZ9jejAtjAiqWM=;
 b=owEBbQKS/ZANAwAKAQAOaEEZVoIVAcsmYgBoPtwbkd0+Vc5/RnhkEbQLT4EKS5SAlBOjIR8p6
 BRo+WaHO3aJAjMEAAEKAB0WIQRLwNeyRHGyoYTq9dMADmhBGVaCFQUCaD7cGwAKCRAADmhBGVaC
 FREPD/9x+zTUX2dX1RQhNJM3fFxh5Ld2OWYtR6yA38853uwtfD5KYH/wclEWNZhqqLAuhBSkbI0
 Z5G2lVl4J77oUYo4qNWbj8F2K5r5POTQeUd1gAhmkS7h7jIH6VzMq1gaOp8+ye4fkSLfz11Iv8m
 JQthJknt7p+JajHmnbdTz6jLwx+eVrM2uXslX0zFAB+40fQyXZUlwwI5aA+FywvXze5seYOAe13
 H3APF9c7uFgrm8uT5+I81NrgDdV2SP0cAEZAknaTgsZUG5YLoVnBmQNdBjhMYBRohz5t8w4Xfm6
 hx+bXi41LnySkKb2WAgPwgWf7Ey/dHIBmL2+f2eIs9uxV2/Bi7eMtf+bGu0Qya3+w9OWWwJyMnH
 M7o3vIXk7ZzSugtviSLHxvX0cwpGMXHaPOGgAFIHPE3DMyJeCyNSl+XBPqHQxiN1UYgA5gFfiOD
 wwrZ9va8lfDOj9n4V1RSrH+x9L0+e4V/OJt2UzrH64wO7NLSInCLNWwdkeq7cEOd1/5QLFOSg02
 Btf+yYu7fCnr0GA6wnT79mrYKFefjZ2TErUn472EQkIkQCeBLwRcvlDWFxSYqG1icOO2zi53NQ2
 Q8FrtNw5N0chfEC29xvMQOqyNG/pdBjGS2eNPLbcKzTW8Go49U+Bp4aXkI+AKU9udDUcDJrc22b
 fOe/pMX2g9cQ/iA==
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

