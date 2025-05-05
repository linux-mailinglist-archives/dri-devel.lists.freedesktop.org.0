Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 21C47AA9AB6
	for <lists+dri-devel@lfdr.de>; Mon,  5 May 2025 19:33:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 037AC10E42F;
	Mon,  5 May 2025 17:33:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="X04cpW+8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9620710E42A;
 Mon,  5 May 2025 17:33:49 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id CDFEC4A827;
 Mon,  5 May 2025 17:33:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8830EC4CEF1;
 Mon,  5 May 2025 17:33:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1746466429;
 bh=LbJzH/ZXREcqrMj1xNLrLa7ysPRTy7FBaPjFY5GdzAY=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=X04cpW+8A1xqLRDZj4zRc28ndREXxakLXbYXQj9FN83K+IdUXHfFr4ES6RAuLUABT
 ygMxUpeFE1wl/mabA8kfkQsID/94C6WuNGty5YqUlmQndSYlrNOan9XDulUq3yEkhY
 TLNZ/6D2c4kBtKTw3ZkvKlW9MaS8zl1Z79Ot+6QsltccSYXApBEF6vRYIH805i0ZFS
 9tLhVVwX293qy/XeNNm9i80tSWyvdE7V/+cUsJTEAq6U9f4cmwyGo9xM5xxl46DOTB
 xa4dFcMz9M6imfIbMIcIh89Qxe8vyTpjU3/Fpky7nlwFi5ExtjspXqPGcekt8nuoUE
 4FAyOCbcxKY8Q==
From: Jeff Layton <jlayton@kernel.org>
Date: Mon, 05 May 2025 13:33:24 -0400
Subject: [PATCH v7 10/10] ref_tracker: eliminate the ref_tracker_dir name field
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250505-reftrack-dbgfs-v7-10-f78c5d97bcca@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=7677; i=jlayton@kernel.org;
 h=from:subject:message-id; bh=LbJzH/ZXREcqrMj1xNLrLa7ysPRTy7FBaPjFY5GdzAY=;
 b=owEBbQKS/ZANAwAIAQAOaEEZVoIVAcsmYgBoGPZn16CUdrMPZWaDqVbQwJ7VB4Y0gfIRoF8V+
 1hoC0cuheKJAjMEAAEIAB0WIQRLwNeyRHGyoYTq9dMADmhBGVaCFQUCaBj2ZwAKCRAADmhBGVaC
 FYPwEADBcX34d1r4npiz0Mah9npC0sTBla9rxOfxo6+aK9dAH1z+4+8DXTcRNE221SILUHaqUVj
 W7neY0K0r38PCyVPGldnsN1pmJb8Puu8Pcg/mD1IUGUBuhi1NBz6swIxGC/0Rq/v2x+IRbdA3r6
 uIefqMBqZN8k/D4K7R4x/U9A/ZM5OdjJBDD6rbbGGOO5xTdPOSj5Fh1QdZTyxeZ5lnQRvFvkLLV
 j6gKPEZJ6X+jTvUn+ZUl4qztFtDnsP3G/RQh6Y5W3iqoBFrs7NtsE1WiJZ6e4WJFmE8LzWH624C
 HZkzb72aRyPsRH3cnm9LVRCs/6aqtwD5zpuu66SZmnmDip7Az+6845Jkx9EJRfDTLP4iJn3ITZe
 lnTk+57C3ySVWbNG3GgDei6wLCs2AxzCUkvFBQYsT84TlR5W/51jSUx2GBKGfwfziY6SE6Pdezo
 X9qPeSxr1DfbzQcyWfCKLFl0tpCtmVxg1H9eTnbnx02IEAgt+54UAqOq6q/Okr6L5LQAmKqubQc
 SXQAEPKJvhPJZ1WOD1RPWAp0HpDSKg+d+U+QVJR8hQmiyE3Ohzz8W6psT1Fs3F7maIhBR0qyzMb
 vjGJrhFbz2PPpAYuvyCRx9hRp+NpfUuXyErBkXRw2jmrk8e5qU2DDeAKxUs+T+Qq903WZqsPgMY
 mKl/aFOMe9P61Xw==
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

Now that we have dentries and the ability to create meaningful symlinks
to them, don't keep a name string in each tracker. Switch the output
format to print "class@address", and drop the name field.

Also, add a kerneldoc header for ref_tracker_dir_init().

Signed-off-by: Jeff Layton <jlayton@kernel.org>
---
 drivers/gpu/drm/display/drm_dp_tunnel.c |  2 +-
 drivers/gpu/drm/i915/intel_runtime_pm.c |  2 +-
 drivers/gpu/drm/i915/intel_wakeref.c    |  2 +-
 include/linux/ref_tracker.h             | 20 ++++++++++++++------
 lib/ref_tracker.c                       |  6 +++---
 lib/test_ref_tracker.c                  |  2 +-
 net/core/dev.c                          |  2 +-
 net/core/net_namespace.c                |  4 ++--
 8 files changed, 24 insertions(+), 16 deletions(-)

diff --git a/drivers/gpu/drm/display/drm_dp_tunnel.c b/drivers/gpu/drm/display/drm_dp_tunnel.c
index f2a8ef6abf34d89a642d7c7708c41e5b1dc9dece..f8d1f9c60e86c5a7b1866e1c9f6425e99d4ca9c6 100644
--- a/drivers/gpu/drm/display/drm_dp_tunnel.c
+++ b/drivers/gpu/drm/display/drm_dp_tunnel.c
@@ -1920,7 +1920,7 @@ drm_dp_tunnel_mgr_create(struct drm_device *dev, int max_group_count)
 	}
 
 #ifdef CONFIG_DRM_DISPLAY_DP_TUNNEL_STATE_DEBUG
-	ref_tracker_dir_init(&mgr->ref_tracker, 16, "drm_dptun", "dptun");
+	ref_tracker_dir_init(&mgr->ref_tracker, 16, "drm_dptun");
 #endif
 
 	for (i = 0; i < max_group_count; i++) {
diff --git a/drivers/gpu/drm/i915/intel_runtime_pm.c b/drivers/gpu/drm/i915/intel_runtime_pm.c
index 94315e952ead9be276298fb2a0200d102005a0c1..d560f94af7a86f1fc139204a4e901eaea22c6ef1 100644
--- a/drivers/gpu/drm/i915/intel_runtime_pm.c
+++ b/drivers/gpu/drm/i915/intel_runtime_pm.c
@@ -60,7 +60,7 @@ static struct drm_i915_private *rpm_to_i915(struct intel_runtime_pm *rpm)
 static void init_intel_runtime_pm_wakeref(struct intel_runtime_pm *rpm)
 {
 	ref_tracker_dir_init(&rpm->debug, INTEL_REFTRACK_DEAD_COUNT,
-			     "intel_runtime_pm", dev_name(rpm->kdev));
+			     "intel_runtime_pm");
 	ref_tracker_dir_symlink(&rpm->debug, "intel_runtime_pm-%s", dev_name(rpm->kdev));
 }
 
diff --git a/drivers/gpu/drm/i915/intel_wakeref.c b/drivers/gpu/drm/i915/intel_wakeref.c
index 2e0498b3fa7947f994de1339d4d2bed93de1a795..bbd5171ce0a22435e540f10821f2a0dad59c1d2f 100644
--- a/drivers/gpu/drm/i915/intel_wakeref.c
+++ b/drivers/gpu/drm/i915/intel_wakeref.c
@@ -114,7 +114,7 @@ void __intel_wakeref_init(struct intel_wakeref *wf,
 			 "wakeref.work", &key->work, 0);
 
 #if IS_ENABLED(CONFIG_DRM_I915_DEBUG_WAKEREF)
-	ref_tracker_dir_init(&wf->debug, INTEL_REFTRACK_DEAD_COUNT, "intel_wakeref", name);
+	ref_tracker_dir_init(&wf->debug, INTEL_REFTRACK_DEAD_COUNT, "intel_wakeref");
 	ref_tracker_dir_symlink(&wf->debug, "intel_wakeref-%s", name);
 #endif
 }
diff --git a/include/linux/ref_tracker.h b/include/linux/ref_tracker.h
index b27cb7b3f1be5e16dedceeb0a88e9aa577be5dff..87c655ffdd77a0e5f080c32633853efea866aca3 100644
--- a/include/linux/ref_tracker.h
+++ b/include/linux/ref_tracker.h
@@ -24,7 +24,6 @@ struct ref_tracker_dir {
 	struct dentry		*dentry;
 	struct dentry		*symlink;
 #endif
-	char			name[32];
 #endif
 };
 
@@ -33,10 +32,21 @@ struct ref_tracker_dir {
 void ref_tracker_dir_debugfs(struct ref_tracker_dir *dir);
 void ref_tracker_dir_symlink(struct ref_tracker_dir *dir, const char *fmt, ...);
 
+/**
+ * ref_tracker_dir_init - initialize a ref_tracker dir
+ * @dir: ref_tracker_dir to be initialized
+ * @quarantime_count: max number of entries to be tracked
+ * @class: pointer to static string that describes object type
+ *
+ * Initialize a ref_tracker_dir. If debugfs is configured, then a file
+ * will also be created for it under the top-level ref_tracker debugfs
+ * directory.
+ *
+ * Note that @class must point to a static string.
+ */
 static inline void ref_tracker_dir_init(struct ref_tracker_dir *dir,
 					unsigned int quarantine_count,
-					const char *class,
-					const char *name)
+					const char *class)
 {
 	INIT_LIST_HEAD(&dir->list);
 	INIT_LIST_HEAD(&dir->quarantine);
@@ -50,7 +60,6 @@ static inline void ref_tracker_dir_init(struct ref_tracker_dir *dir,
 	dir->dentry = NULL;
 	dir->symlink = NULL;
 #endif
-	strscpy(dir->name, name, sizeof(dir->name));
 	ref_tracker_dir_debugfs(dir);
 	stack_depot_init();
 }
@@ -75,8 +84,7 @@ int ref_tracker_free(struct ref_tracker_dir *dir,
 
 static inline void ref_tracker_dir_init(struct ref_tracker_dir *dir,
 					unsigned int quarantine_count,
-					const char *class,
-					const char *name)
+					const char *class)
 {
 }
 
diff --git a/lib/ref_tracker.c b/lib/ref_tracker.c
index d59ef7200dd4f97f247ddd989beb5757b8afd519..6c28d26c2e3e37a7ccd39893a29390149283d588 100644
--- a/lib/ref_tracker.c
+++ b/lib/ref_tracker.c
@@ -134,7 +134,7 @@ __ref_tracker_dir_pr_ostream(struct ref_tracker_dir *dir,
 	stats = ref_tracker_get_stats(dir, display_limit);
 	if (IS_ERR(stats)) {
 		pr_ostream(s, "%s%s@%p: couldn't get stats, error %pe\n",
-			   s->prefix, dir->name, dir, stats);
+			   s->prefix, dir->class, dir, stats);
 		return;
 	}
 
@@ -145,14 +145,14 @@ __ref_tracker_dir_pr_ostream(struct ref_tracker_dir *dir,
 		if (sbuf && !stack_depot_snprint(stack, sbuf, STACK_BUF_SIZE, 4))
 			sbuf[0] = 0;
 		pr_ostream(s, "%s%s@%p has %d/%d users at\n%s\n", s->prefix,
-			   dir->name, dir, stats->stacks[i].count,
+			   dir->class, dir, stats->stacks[i].count,
 			   stats->total, sbuf);
 		skipped -= stats->stacks[i].count;
 	}
 
 	if (skipped)
 		pr_ostream(s, "%s%s@%p skipped reports about %d/%d users.\n",
-			   s->prefix, dir->name, dir, skipped, stats->total);
+			   s->prefix, dir->class, dir, skipped, stats->total);
 
 	kfree(sbuf);
 
diff --git a/lib/test_ref_tracker.c b/lib/test_ref_tracker.c
index d263502a4c1db248f64a66a468e96c8e4cffab25..b983ceb12afcb84ad60360a1e6fec0072e78ef79 100644
--- a/lib/test_ref_tracker.c
+++ b/lib/test_ref_tracker.c
@@ -64,7 +64,7 @@ static int __init test_ref_tracker_init(void)
 {
 	int i;
 
-	ref_tracker_dir_init(&ref_dir, 100, "selftest", "selftest");
+	ref_tracker_dir_init(&ref_dir, 100, "selftest");
 
 	timer_setup(&test_ref_tracker_timer, test_ref_tracker_timer_func, 0);
 	mod_timer(&test_ref_tracker_timer, jiffies + 1);
diff --git a/net/core/dev.c b/net/core/dev.c
index 380d07bec15a1f62ed27c31a6e211e74f3a5561d..00776cba0276554066c94a6fc86f5ed4df430cfa 100644
--- a/net/core/dev.c
+++ b/net/core/dev.c
@@ -11620,7 +11620,7 @@ struct net_device *alloc_netdev_mqs(int sizeof_priv, const char *name,
 
 	dev->priv_len = sizeof_priv;
 
-	ref_tracker_dir_init(&dev->refcnt_tracker, 128, "netdev", name);
+	ref_tracker_dir_init(&dev->refcnt_tracker, 128, "netdev");
 #ifdef CONFIG_PCPU_DEV_REFCNT
 	dev->pcpu_refcnt = alloc_percpu(int);
 	if (!dev->pcpu_refcnt)
diff --git a/net/core/net_namespace.c b/net/core/net_namespace.c
index 1c5e0289f0f0b37c61852d95d4e11a8c12a868f3..5b06a0bf88e62c19f6f610eca3a4c4750ff4a2ea 100644
--- a/net/core/net_namespace.c
+++ b/net/core/net_namespace.c
@@ -324,8 +324,8 @@ static __net_init void preinit_net(struct net *net, struct user_namespace *user_
 {
 	refcount_set(&net->passive, 1);
 	refcount_set(&net->ns.count, 1);
-	ref_tracker_dir_init(&net->refcnt_tracker, 128, "net_refcnt", "net_refcnt");
-	ref_tracker_dir_init(&net->notrefcnt_tracker, 128, "net_notrefcnt", "net_notrefcnt");
+	ref_tracker_dir_init(&net->refcnt_tracker, 128, "net_refcnt");
+	ref_tracker_dir_init(&net->notrefcnt_tracker, 128, "net_notrefcnt");
 
 	get_random_bytes(&net->hash_mix, sizeof(u32));
 	net->dev_base_seq = 1;

-- 
2.49.0

