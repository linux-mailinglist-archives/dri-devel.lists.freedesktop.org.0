Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B3FC1ADEF36
	for <lists+dri-devel@lfdr.de>; Wed, 18 Jun 2025 16:24:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB94E10E86F;
	Wed, 18 Jun 2025 14:24:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="ULqi2OtX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1EF9110E86F;
 Wed, 18 Jun 2025 14:24:50 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 9F1CF5C565D;
 Wed, 18 Jun 2025 14:22:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 090DCC4CEE7;
 Wed, 18 Jun 2025 14:24:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1750256684;
 bh=YMnNgfS5IcXRGDhGxBj9UTTtfo/Re9Qj3nh2BIc6ugE=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=ULqi2OtX/7uQ/OyVEFJUJbHWJf3scVmdfB1Syvh1A4yU2en3qY22gH5zbO+8gRnRa
 hkbFmDA2P6JVzt1LFORxfc146FtCnKyYkkEofHabLnYIa9NegiYDfilBFz4uDXKRiQ
 5uR3h8wbJ4IRinqaWjy5tSJJYJtD7kVJaSQ1TDeh9IJoA1LjQMR/fQtzGIqwspuouy
 oK6qxAsRjkOo6Wgp8EBDzVwUXpIfaNSA6jmunz57dkdgBW2yAuxrzAhbNVpGqagV6j
 AQFHZkqiiWnGTZdk0nigGjp3zDt1t+72/V4fBpgOev4AvDA6e8kagEYHVa83WlxwJs
 UkakWSC6iLfKQ==
From: Jeff Layton <jlayton@kernel.org>
Date: Wed, 18 Jun 2025 10:24:21 -0400
Subject: [PATCH v15 8/9] net: add symlinks to ref_tracker_dir for netns
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250618-reftrack-dbgfs-v15-8-24fc37ead144@kernel.org>
References: <20250618-reftrack-dbgfs-v15-0-24fc37ead144@kernel.org>
In-Reply-To: <20250618-reftrack-dbgfs-v15-0-24fc37ead144@kernel.org>
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
 h=from:subject:message-id; bh=YMnNgfS5IcXRGDhGxBj9UTTtfo/Re9Qj3nh2BIc6ugE=;
 b=owEBbQKS/ZANAwAKAQAOaEEZVoIVAcsmYgBoUswZ2MQDxuR/bgGgaU7roXXK3jAFb6b+3gRcS
 2Gh2m6jG66JAjMEAAEKAB0WIQRLwNeyRHGyoYTq9dMADmhBGVaCFQUCaFLMGQAKCRAADmhBGVaC
 FWbzEADGmjNlfCIKt1Gur8k7XtE/w1mW0K4oZJEjKP6do61OM8e8nqjb9qNpTPPNIqPRS8ksLAT
 7fxTEm8eKTPUzIFDNRl6j5gL5lCtGFR0ZLLdC7VrHQzVuNhoXyKTKKkWxnrwIIdLS7nGwI5p1VM
 w6e5BGFGMJgplw18uRbfjP5B6WJx+L6Q/2MfGXx+TwMiJRZMKKDmnTz6qVtd252m0a9ZDf4KWZE
 a2VD/tO/NU6T+ix4piM6P6WhS7rUpMzfdMVDtQ/k1hGIJaWTNDkawiaf4l6tT44Us5F9uSBCHRS
 DW8Y/xShIRKCT6qviKNXeDEZ/DG21lX3PDhJelE+hvsc3E+Co6FD/5p3ZLIBIbvt1dgGPof0+tH
 K1er113ZqMhxLFjGI6iWU1Vr9rXsdm7jvkTfkIJNl9a20/ltGUQ6uF5aVgmLRhf7cmihN616Ht3
 bZKen7vLJ5IRhAVR/Zf/VPwJdajFITJbfqnSyBFiXA4zKGG+GkJzaecll2x/BZrZKa1SejAUqVN
 +GRWo0tm5msdh1EaliOk00PjSzeTh8KLepeEmLJlW4ppgsa1kJcmR3BVr1GfuGpwXExPb5MA6/o
 j2YhxO9fLrNhuHZnFoiE9aqKMcIexE8krjzHceVH0zikTPxGYwqROKhVDMlgdyT0NjdaDQewznW
 Dli1BSjXtLm6TjQ==
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
index aa1e34181ed6f353921a23411fa227b612db661a..45de05d8f0877a4e717bdad4ed776ae27f98944a 100644
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

