Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E4E5AC8022
	for <lists+dri-devel@lfdr.de>; Thu, 29 May 2025 17:21:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ABC7910E758;
	Thu, 29 May 2025 15:21:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="hML2oM17";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 045FA10E75D;
 Thu, 29 May 2025 15:21:35 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 47EAAA4FA21;
 Thu, 29 May 2025 15:21:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 30D96C4CEF3;
 Thu, 29 May 2025 15:21:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1748532094;
 bh=FwR5EhI8xrwtPj1Jun0AMgnQF8ISLd14Opp265Plpv8=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=hML2oM178RlHw1oKhAtMumRJAxcFj9Uabw3ERlxuNYVU4gX/dw778C5qEZcYi5iJs
 N4UgCbGVJQrlaEqnAScfFFZQhmS1o4AD/j6bryqaMTgBGPcX91umcO2os8RD74ACA/
 sICVg+lf1hC0IG5i41gakZx5kbnrnjbgOX91k0LHGz9nxxB/bIQkv51Dn87fgAPGvn
 5wrwClySble5OZZXtTV2pBQWQvzCemFfl+CANPdvxQ3jEOn9jAfHj/1/m86C3L3ldb
 +yEuvIb9uL98S/0VG+kYnoXcA9L0J88EM0srk5gHB52K7d5x1EpxI+9U1n9sBXGnya
 AoTbu9du8vCvg==
From: Jeff Layton <jlayton@kernel.org>
Date: Thu, 29 May 2025 11:20:46 -0400
Subject: [PATCH v12 10/10] ref_tracker: eliminate the ref_tracker_dir name
 field
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250529-reftrack-dbgfs-v12-10-11b93c0c0b6e@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=7441; i=jlayton@kernel.org;
 h=from:subject:message-id; bh=FwR5EhI8xrwtPj1Jun0AMgnQF8ISLd14Opp265Plpv8=;
 b=owEBbQKS/ZANAwAKAQAOaEEZVoIVAcsmYgBoOHtn4IJ7SURX8BQCD8ZYnwubCl+5SbqMsQ325
 M7qhoOOnv2JAjMEAAEKAB0WIQRLwNeyRHGyoYTq9dMADmhBGVaCFQUCaDh7ZwAKCRAADmhBGVaC
 FS1nEADXabjBb2oDwftNBnUg/O2eeC5R7JfyM9oTyEp3hl/hNYdp6KrZUEQBpu/jWMb3Rq99zwS
 4JlewudUzqNKwp0TPIXQ54uQzwHBIMtRt0OSo1YPbb/obrQqzQlgef9j13XmaGU3rvR3xRcAM4x
 jtShncPnygCZbRj7EZzAKgYTFss8I+7cnJ9orBkLLAsa42I63DJVE+fXuhqxYOD7cALUkSfAqSq
 tU6yWjYc0x0Vlsmz2yhyLHwFAvm0aW0UePHgcgVD71Q6wxEceqAKuVXnPVZpxBtIcRrgjd9sC5N
 6UCXagSaF42ZEHbvI+81Ej/3IsgmuBPT7Y9EJlIAvGk8PUBMAU5Vi4olmj3LAN8bPno82/W2qbF
 JPYfEsq1drxLqJw86ZtWR8ZBqgJJjdXKmiEIjPVVto5JngM22wIX+yUl6khpFi3Q7e+1+2IwHes
 9xI3d7Wn9SSDzv0o6D8YUp1lIkM8hfQXgdInBLA06sYpT3ZGUArSdIrHctc4uDV8dGKXlIW/3nC
 SLFbvZTAxHM+/10WNDr2mLAJ2G+tE0timR/+/b3zdkTGO8f9QePcbPK0MF0s+nvFtr5b4lg4Eut
 K8yX6taCuIRmbnJGt1ElyzDr7BDjeHHYWNtOmwXue+B6ySEq5s5WNDjfKrVomN763a5Mj9nei/d
 pspT0IXdb+kJKzw==
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
index b9c12b8bf2a3e400b6d8e9d184145834c603b9e1..1205a4432eb4142344fb6eed1cb5ba5b21ec6953 100644
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
index 90d90145a1890bf788e789858ddad3b3d8e3b978..7ce3e6de0c1970697e0e58198e1e3852975ee7bc 100644
--- a/drivers/gpu/drm/i915/intel_runtime_pm.c
+++ b/drivers/gpu/drm/i915/intel_runtime_pm.c
@@ -61,7 +61,7 @@ static void init_intel_runtime_pm_wakeref(struct intel_runtime_pm *rpm)
 {
 	if (!rpm->debug.class)
 		ref_tracker_dir_init(&rpm->debug, INTEL_REFTRACK_DEAD_COUNT,
-				     "intel_runtime_pm", dev_name(rpm->kdev));
+				     "intel_runtime_pm");
 }
 
 static intel_wakeref_t
diff --git a/drivers/gpu/drm/i915/intel_wakeref.c b/drivers/gpu/drm/i915/intel_wakeref.c
index 21dcee7c9a659ac1fb0aa19f3018647be3bda754..080535fc71d8c25dcc848eefd063361bbe21b305 100644
--- a/drivers/gpu/drm/i915/intel_wakeref.c
+++ b/drivers/gpu/drm/i915/intel_wakeref.c
@@ -115,7 +115,7 @@ void __intel_wakeref_init(struct intel_wakeref *wf,
 
 #if IS_ENABLED(CONFIG_DRM_I915_DEBUG_WAKEREF)
 	if (!wf->debug.class)
-		ref_tracker_dir_init(&wf->debug, INTEL_REFTRACK_DEAD_COUNT, "intel_wakeref", name);
+		ref_tracker_dir_init(&wf->debug, INTEL_REFTRACK_DEAD_COUNT, "intel_wakeref");
 #endif
 }
 
diff --git a/include/linux/ref_tracker.h b/include/linux/ref_tracker.h
index ddc5a7b2bd84692bbc1e1ae67674ec2c6857e1ec..5878e7fce712930700054033ff5f21547e75224f 100644
--- a/include/linux/ref_tracker.h
+++ b/include/linux/ref_tracker.h
@@ -24,7 +24,6 @@ struct ref_tracker_dir {
 	struct dentry		*dentry;
 	struct dentry		*symlink;
 #endif
-	char			name[32];
 #endif
 };
 
@@ -48,10 +47,21 @@ void ref_tracker_dir_symlink(struct ref_tracker_dir *dir, const char *fmt, ...)
 
 #endif /* CONFIG_DEBUG_FS */
 
+/**
+ * ref_tracker_dir_init - initialize a ref_tracker dir
+ * @dir: ref_tracker_dir to be initialized
+ * @quarantine_count: max number of entries to be tracked
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
@@ -65,7 +75,6 @@ static inline void ref_tracker_dir_init(struct ref_tracker_dir *dir,
 	dir->dentry = NULL;
 	dir->symlink = NULL;
 #endif
-	strscpy(dir->name, name, sizeof(dir->name));
 	ref_tracker_dir_debugfs(dir);
 	stack_depot_init();
 }
@@ -90,8 +99,7 @@ int ref_tracker_free(struct ref_tracker_dir *dir,
 
 static inline void ref_tracker_dir_init(struct ref_tracker_dir *dir,
 					unsigned int quarantine_count,
-					const char *class,
-					const char *name)
+					const char *class)
 {
 }
 
diff --git a/lib/ref_tracker.c b/lib/ref_tracker.c
index d778820bea952d96c9a1c280dfd6531135bd85e0..897c5b4aedf7393aca45ed10b5617c81e6f7e6bf 100644
--- a/lib/ref_tracker.c
+++ b/lib/ref_tracker.c
@@ -123,7 +123,7 @@ __ref_tracker_dir_pr_ostream(struct ref_tracker_dir *dir,
 	stats = ref_tracker_get_stats(dir, display_limit);
 	if (IS_ERR(stats)) {
 		pr_ostream(s, "%s%s@%p: couldn't get stats, error %pe\n",
-			   s->prefix, dir->name, dir, stats);
+			   s->prefix, dir->class, dir, stats);
 		return;
 	}
 
@@ -134,14 +134,14 @@ __ref_tracker_dir_pr_ostream(struct ref_tracker_dir *dir,
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
index eeb6aab16987dde277314d1a6b5bd32eaabab893..c7c25278267adb338f99407abe4a62d2a9cc3d33 100644
--- a/net/core/dev.c
+++ b/net/core/dev.c
@@ -11714,7 +11714,7 @@ struct net_device *alloc_netdev_mqs(int sizeof_priv, const char *name,
 
 	dev->priv_len = sizeof_priv;
 
-	ref_tracker_dir_init(&dev->refcnt_tracker, 128, "netdev", name);
+	ref_tracker_dir_init(&dev->refcnt_tracker, 128, "netdev");
 #ifdef CONFIG_PCPU_DEV_REFCNT
 	dev->pcpu_refcnt = alloc_percpu(int);
 	if (!dev->pcpu_refcnt)
diff --git a/net/core/net_namespace.c b/net/core/net_namespace.c
index b2fd9c5635ecf8fccd48f1d5b967a5c6c41cfec4..8d21c8f4eb83597ddee5fd345b5e38b308ce0335 100644
--- a/net/core/net_namespace.c
+++ b/net/core/net_namespace.c
@@ -403,8 +403,8 @@ static __net_init void preinit_net(struct net *net, struct user_namespace *user_
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

