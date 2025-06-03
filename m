Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C788ACC557
	for <lists+dri-devel@lfdr.de>; Tue,  3 Jun 2025 13:27:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A2A5810E5C0;
	Tue,  3 Jun 2025 11:27:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="aOvVh4pp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8533110E5B5;
 Tue,  3 Jun 2025 11:27:39 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 48CB4A4FED5;
 Tue,  3 Jun 2025 11:27:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1B720C4CEF6;
 Tue,  3 Jun 2025 11:27:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1748950054;
 bh=ZSuWrJqcRG0fZBfEpAnoMZcPrT51R+tXgrmuxmFyo9k=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=aOvVh4ppwUUSmAYBDnbt29krMdbdbaWjNvCsdyaQ+tArexX1PEjT7S3sIl7M3zkud
 MqnuZsLkI7ZzXz6v0LJcPzEVeoF8f0sX15y/N5qFXIqcA5zLHnmKCoQ8uY34cVl7Fk
 ugqkZYJLA2jFgR+niNrUCDNVfM1yl1X+eF9E34Vi0RGuaUyF5aJS1ydtXDdU3IULkE
 HcjCa+/Bw595uCWY/vlhWostfhW7SlnNtEVK4rjiPTQszMwvGep7FBdMtL7tO/vHS+
 LVe6w4ZW92t3ao48QWfKPQWxMP9W+3a+MTM9MbcvjWxSarBBSbVxAnTkdwee5CorMI
 Lx2WQNhyjMvUg==
From: Jeff Layton <jlayton@kernel.org>
Date: Tue, 03 Jun 2025 07:27:15 -0400
Subject: [PATCH v13 4/9] ref_tracker: add a static classname string to each
 ref_tracker_dir
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250603-reftrack-dbgfs-v13-4-7b2a425019d8@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=6203; i=jlayton@kernel.org;
 h=from:subject:message-id; bh=ZSuWrJqcRG0fZBfEpAnoMZcPrT51R+tXgrmuxmFyo9k=;
 b=owEBbQKS/ZANAwAKAQAOaEEZVoIVAcsmYgBoPtwaD7eBe0kVngsa16kqlskkSTfWpCKHX4jLw
 3/940UglTKJAjMEAAEKAB0WIQRLwNeyRHGyoYTq9dMADmhBGVaCFQUCaD7cGgAKCRAADmhBGVaC
 FVa6D/9cJV+3Q38vcKMHXmTrGWs8rO+Mg99Qpu4HjPpE15rrYvV4DgtJDR1GKOJsRiGFQSc6te2
 Skgq9V2qmVJ/NGI6zMDuVMYXv3m97D8RRdS23HX4qZ6HO7Fxg+IpK8jrXmxzUs6wU8ZVYlpogQy
 gS5w5K0Xxf9OAuxjRbPeroHMkiXssEpobTg/GeKPSXmRP2WwdoZB58S9Qe5huVww4kDNAX5Kie+
 tYHzbIdPbgrbSrmcFkkVipWLYXcmcIjpMah0JtymiOLj0prb2+uRsaIo3pr2CzjGg6oieRYCDv/
 QaYivSVcWnLPBtjYk+dJ8/LOiwMlIZhcs9WNMzy/xKpyRtSwN69er4fzkbdkviuJdD271GvxpiW
 RDxuSZMnuTYoFHQ7OPp4xJTSkAYFy0ZiKpb7q1lE1HSeuhCycMcGJ10k9Rv+h0kTZ8OX3SFVRi+
 LspvSGCt6DMnK56kt3gqTl89ZFKBxAYXsDtsvrEcx39+p/bKtpoq9WfLFQ+u+OrqHCnpt3aZe3r
 0tMJTF+KBDEzy62qzIN9wriH/ToXcTcxAlDq7dSn50z/URHZJuZNhBNI6ELO/PWSu48trb+RHB6
 DST5zMo2ZTWFeyi5QYjLw6xtPz1eRdBnv6t7AC64HBGBEvCfkOHSoLfYzXaD4XS7mhZt+vWyhUP
 nfvIFEsAgpIbLxw==
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

A later patch in the series will be adding debugfs files for each
ref_tracker that get created in ref_tracker_dir_init(). The format will
be "class@%px". The current "name" string can vary between
ref_tracker_dir objects of the same type, so it's not suitable for this
purpose.

Add a new "class" string to the ref_tracker dir that describes the
the type of object (sans any individual info for that object).

Also, in the i915 driver, gate the creation of debugfs files on whether
the dentry pointer is still set to NULL. CI has shown that the
ref_tracker_dir can be initialized more than once.

Signed-off-by: Jeff Layton <jlayton@kernel.org>
---
 drivers/gpu/drm/display/drm_dp_tunnel.c | 2 +-
 drivers/gpu/drm/i915/intel_runtime_pm.c | 4 +++-
 drivers/gpu/drm/i915/intel_wakeref.c    | 3 ++-
 include/linux/ref_tracker.h             | 4 ++++
 lib/test_ref_tracker.c                  | 2 +-
 net/core/dev.c                          | 2 +-
 net/core/net_namespace.c                | 4 ++--
 7 files changed, 14 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/display/drm_dp_tunnel.c b/drivers/gpu/drm/display/drm_dp_tunnel.c
index 076edf1610480275c62395334ab0536befa42f15..b9c12b8bf2a3e400b6d8e9d184145834c603b9e1 100644
--- a/drivers/gpu/drm/display/drm_dp_tunnel.c
+++ b/drivers/gpu/drm/display/drm_dp_tunnel.c
@@ -1920,7 +1920,7 @@ drm_dp_tunnel_mgr_create(struct drm_device *dev, int max_group_count)
 	}
 
 #ifdef CONFIG_DRM_DISPLAY_DP_TUNNEL_STATE_DEBUG
-	ref_tracker_dir_init(&mgr->ref_tracker, 16, "dptun");
+	ref_tracker_dir_init(&mgr->ref_tracker, 16, "drm_dptun", "dptun");
 #endif
 
 	for (i = 0; i < max_group_count; i++) {
diff --git a/drivers/gpu/drm/i915/intel_runtime_pm.c b/drivers/gpu/drm/i915/intel_runtime_pm.c
index 8d9f4c410546e4144d4bc8bbc6696f3bd9498848..90d90145a1890bf788e789858ddad3b3d8e3b978 100644
--- a/drivers/gpu/drm/i915/intel_runtime_pm.c
+++ b/drivers/gpu/drm/i915/intel_runtime_pm.c
@@ -59,7 +59,9 @@ static struct drm_i915_private *rpm_to_i915(struct intel_runtime_pm *rpm)
 
 static void init_intel_runtime_pm_wakeref(struct intel_runtime_pm *rpm)
 {
-	ref_tracker_dir_init(&rpm->debug, INTEL_REFTRACK_DEAD_COUNT, dev_name(rpm->kdev));
+	if (!rpm->debug.class)
+		ref_tracker_dir_init(&rpm->debug, INTEL_REFTRACK_DEAD_COUNT,
+				     "intel_runtime_pm", dev_name(rpm->kdev));
 }
 
 static intel_wakeref_t
diff --git a/drivers/gpu/drm/i915/intel_wakeref.c b/drivers/gpu/drm/i915/intel_wakeref.c
index 07e81be4d3920febece34709c63a63204a41583c..21dcee7c9a659ac1fb0aa19f3018647be3bda754 100644
--- a/drivers/gpu/drm/i915/intel_wakeref.c
+++ b/drivers/gpu/drm/i915/intel_wakeref.c
@@ -114,7 +114,8 @@ void __intel_wakeref_init(struct intel_wakeref *wf,
 			 "wakeref.work", &key->work, 0);
 
 #if IS_ENABLED(CONFIG_DRM_I915_DEBUG_WAKEREF)
-	ref_tracker_dir_init(&wf->debug, INTEL_REFTRACK_DEAD_COUNT, name);
+	if (!wf->debug.class)
+		ref_tracker_dir_init(&wf->debug, INTEL_REFTRACK_DEAD_COUNT, "intel_wakeref", name);
 #endif
 }
 
diff --git a/include/linux/ref_tracker.h b/include/linux/ref_tracker.h
index a0a1ee43724ffa00e60c116be18e481bfe1d1455..3968f993db81e95c0d58c81454311841c1b9cd35 100644
--- a/include/linux/ref_tracker.h
+++ b/include/linux/ref_tracker.h
@@ -19,6 +19,7 @@ struct ref_tracker_dir {
 	bool			dead;
 	struct list_head	list; /* List of active trackers */
 	struct list_head	quarantine; /* List of dead trackers */
+	const char		*class; /* object classname */
 	char			name[32];
 #endif
 };
@@ -27,6 +28,7 @@ struct ref_tracker_dir {
 
 static inline void ref_tracker_dir_init(struct ref_tracker_dir *dir,
 					unsigned int quarantine_count,
+					const char *class,
 					const char *name)
 {
 	INIT_LIST_HEAD(&dir->list);
@@ -36,6 +38,7 @@ static inline void ref_tracker_dir_init(struct ref_tracker_dir *dir,
 	dir->dead = false;
 	refcount_set(&dir->untracked, 1);
 	refcount_set(&dir->no_tracker, 1);
+	dir->class = class;
 	strscpy(dir->name, name, sizeof(dir->name));
 	stack_depot_init();
 }
@@ -60,6 +63,7 @@ int ref_tracker_free(struct ref_tracker_dir *dir,
 
 static inline void ref_tracker_dir_init(struct ref_tracker_dir *dir,
 					unsigned int quarantine_count,
+					const char *class,
 					const char *name)
 {
 }
diff --git a/lib/test_ref_tracker.c b/lib/test_ref_tracker.c
index b983ceb12afcb84ad60360a1e6fec0072e78ef79..d263502a4c1db248f64a66a468e96c8e4cffab25 100644
--- a/lib/test_ref_tracker.c
+++ b/lib/test_ref_tracker.c
@@ -64,7 +64,7 @@ static int __init test_ref_tracker_init(void)
 {
 	int i;
 
-	ref_tracker_dir_init(&ref_dir, 100, "selftest");
+	ref_tracker_dir_init(&ref_dir, 100, "selftest", "selftest");
 
 	timer_setup(&test_ref_tracker_timer, test_ref_tracker_timer_func, 0);
 	mod_timer(&test_ref_tracker_timer, jiffies + 1);
diff --git a/net/core/dev.c b/net/core/dev.c
index 2b514d95c528b8d6da8f34a8955da76117958b63..eeb6aab16987dde277314d1a6b5bd32eaabab893 100644
--- a/net/core/dev.c
+++ b/net/core/dev.c
@@ -11714,7 +11714,7 @@ struct net_device *alloc_netdev_mqs(int sizeof_priv, const char *name,
 
 	dev->priv_len = sizeof_priv;
 
-	ref_tracker_dir_init(&dev->refcnt_tracker, 128, name);
+	ref_tracker_dir_init(&dev->refcnt_tracker, 128, "netdev", name);
 #ifdef CONFIG_PCPU_DEV_REFCNT
 	dev->pcpu_refcnt = alloc_percpu(int);
 	if (!dev->pcpu_refcnt)
diff --git a/net/core/net_namespace.c b/net/core/net_namespace.c
index 42ee7fce3d95b5a2756d6a3780edba070f01ddb6..8708eb975295ffb78de35fcf4abef7cc281f5a51 100644
--- a/net/core/net_namespace.c
+++ b/net/core/net_namespace.c
@@ -403,8 +403,8 @@ static __net_init void preinit_net(struct net *net, struct user_namespace *user_
 {
 	refcount_set(&net->passive, 1);
 	refcount_set(&net->ns.count, 1);
-	ref_tracker_dir_init(&net->refcnt_tracker, 128, "net refcnt");
-	ref_tracker_dir_init(&net->notrefcnt_tracker, 128, "net notrefcnt");
+	ref_tracker_dir_init(&net->refcnt_tracker, 128, "net_refcnt", "net_refcnt");
+	ref_tracker_dir_init(&net->notrefcnt_tracker, 128, "net_notrefcnt", "net_notrefcnt");
 
 	get_random_bytes(&net->hash_mix, sizeof(u32));
 	net->dev_base_seq = 1;

-- 
2.49.0

