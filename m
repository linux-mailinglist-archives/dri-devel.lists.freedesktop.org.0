Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A7367AC4D8E
	for <lists+dri-devel@lfdr.de>; Tue, 27 May 2025 13:34:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B71A10E4A7;
	Tue, 27 May 2025 11:34:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="OPsvpfSD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E17710E4AE;
 Tue, 27 May 2025 11:34:06 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id A2DBA5C566D;
 Tue, 27 May 2025 11:31:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9480DC4CEEB;
 Tue, 27 May 2025 11:34:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1748345643;
 bh=YTLYU9LWSJhsBRbF0nwekUco3urr9nhUJqZ1xPPWD6I=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=OPsvpfSDXqVNMHu6O72FeusLJj/fe/bJsamEvSE117gXDT+bqkiXRWfandboGlnnX
 OAEwVtmCXHq6aZL790iu1Ek31lvbZFvlzDM2DTgRyrbpEq9QzuDQv9jaTi2SVm6oZO
 GJXV/sCT/xPM+lInvjKiOZpjSFb0kwk1D3pn6HcdDJWejzsH+jmquukuhn7ksJkKnK
 /YmTRxe7fhajBK6EynaFK+imu0U3K/xkZd+1pWe1zxXxMI79KsAHUvfWxb4lF1KZRf
 XEYVD1A4wACGg2gQNI9t8pAeuXGGCc1efWUhX7leW/fCUBCHwaQTln2qTBdhrLfu8M
 Qiag53s0Be5LQ==
From: Jeff Layton <jlayton@kernel.org>
Date: Tue, 27 May 2025 07:33:40 -0400
Subject: [PATCH v10 9/9] ref_tracker: eliminate the ref_tracker_dir name field
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250527-reftrack-dbgfs-v10-9-dc55f7705691@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=7499; i=jlayton@kernel.org;
 h=from:subject:message-id; bh=YTLYU9LWSJhsBRbF0nwekUco3urr9nhUJqZ1xPPWD6I=;
 b=owEBbQKS/ZANAwAKAQAOaEEZVoIVAcsmYgBoNaMX37lKKv9qM6qZoSFnMypTHz5HKkasSkcfe
 6vmfAFXGX2JAjMEAAEKAB0WIQRLwNeyRHGyoYTq9dMADmhBGVaCFQUCaDWjFwAKCRAADmhBGVaC
 FQBDEACwwKWpXOrarJH08FEBs3PI31pyaNaGC834qIenHT3CSwcg9OyQ/26xJZBHeMVaI3YOwB4
 W5satPonKqkZi9rLGOHlMEnSYvxoHqSHFv16PZaLZztxu+Pt5iuvDxrnd8/oRMlhyjsYMR07Q+Q
 Jk9S2uZIflWaIkdtre0sAm/ImHVrYJSD4hoxKx5/vZMTfqo4BHDY5nUd8XaRt8e/oXkxjMAoUqC
 40oUr6gTBFUF5GXMaJZxO3eTj2DhREdWB4fgJY7RdH5JemF1cJcBidBfgQhD0EQyGBX/adeD1+3
 ZKYyIYUo/Ek8JCxjxXPol5puEC+TUlOZWkNefAB/eptzr+0p/W8p97cg13X9zb4B0PXTC2pcz3Q
 GVcpCV0qfYMSfbH7F1/3KPSKcFQIsmZsXgyPTOji2lDI9z7ASsSYRd1QDr9DeS3M8j6rcy2kGpy
 U7GfxOr8Fiwba1ekQsyCgHzopDbOrJ1HebmVLKG2FuYWUzp3h4XQy923o4N7xPNjqVBTrWkueAt
 tW7XiIOCI9AKto/byQI/cSqN25Z4aJ2zfZnEBv4m54vsjZYnGkwzn5pmEZoEHgknd/Z76g/zU8c
 7cOLpEEZ6LTGRAF4bF7hb19+gAF3UPPtfWbljLPs7axNcNqp7uL3N3yVUGO8UcUHlvtDcvk2VNc
 SXR/qw3S6HRW3kA==
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
index 3fdab3b44c08cea16ac2f73aafc2bea2ffbb19e7..c12b5d0e16fa363f3caede372e7a2031676aa7b5 100644
--- a/drivers/gpu/drm/i915/intel_runtime_pm.c
+++ b/drivers/gpu/drm/i915/intel_runtime_pm.c
@@ -60,7 +60,7 @@ static struct drm_i915_private *rpm_to_i915(struct intel_runtime_pm *rpm)
 static void init_intel_runtime_pm_wakeref(struct intel_runtime_pm *rpm)
 {
 	ref_tracker_dir_init(&rpm->debug, INTEL_REFTRACK_DEAD_COUNT,
-			     "intel_runtime_pm", dev_name(rpm->kdev));
+			     "intel_runtime_pm");
 }
 
 static intel_wakeref_t
diff --git a/drivers/gpu/drm/i915/intel_wakeref.c b/drivers/gpu/drm/i915/intel_wakeref.c
index 5269e64c58a49884f5d712557546272bfdeb8417..615fb77809291be34d94600fdd4d919461a22720 100644
--- a/drivers/gpu/drm/i915/intel_wakeref.c
+++ b/drivers/gpu/drm/i915/intel_wakeref.c
@@ -114,7 +114,7 @@ void __intel_wakeref_init(struct intel_wakeref *wf,
 			 "wakeref.work", &key->work, 0);
 
 #if IS_ENABLED(CONFIG_DRM_I915_DEBUG_WAKEREF)
-	ref_tracker_dir_init(&wf->debug, INTEL_REFTRACK_DEAD_COUNT, "intel_wakeref", name);
+	ref_tracker_dir_init(&wf->debug, INTEL_REFTRACK_DEAD_COUNT, "intel_wakeref");
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
index 5e84e5fd78e147a036d4adb511e657da07866a55..5fb384dd919e1f1ad632eaf595b954118bcfddab 100644
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
index bac9d29486556023cd99f5101b96b052acb9ba70..a062912525ee573504a9cc252f71aed22693d24f 100644
--- a/net/core/dev.c
+++ b/net/core/dev.c
@@ -11713,7 +11713,7 @@ struct net_device *alloc_netdev_mqs(int sizeof_priv, const char *name,
 
 	dev->priv_len = sizeof_priv;
 
-	ref_tracker_dir_init(&dev->refcnt_tracker, 128, "netdev", name);
+	ref_tracker_dir_init(&dev->refcnt_tracker, 128, "netdev");
 #ifdef CONFIG_PCPU_DEV_REFCNT
 	dev->pcpu_refcnt = alloc_percpu(int);
 	if (!dev->pcpu_refcnt)
diff --git a/net/core/net_namespace.c b/net/core/net_namespace.c
index 39b01af90d240df48827e5c3159c3e2253e0a44d..c03757e39c8a334d307fa1b5cc8f03ad3a8df0e0 100644
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

