Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D5FEBAC4D82
	for <lists+dri-devel@lfdr.de>; Tue, 27 May 2025 13:34:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD7A210E49D;
	Tue, 27 May 2025 11:33:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="M6IwkkMM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2244010E48A;
 Tue, 27 May 2025 11:33:57 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id B459FA4F642;
 Tue, 27 May 2025 11:33:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C3A8EC4CEEF;
 Tue, 27 May 2025 11:33:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1748345633;
 bh=yqoo79KYlvYVQ9kfd3gXqO3yXNwpPMOjnXlk+fFo8C8=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=M6IwkkMMfCVNkYf68FkjX07OXiiSxzwu4FXqa2I6F3Zd2PYC4wTmAAS9SKOp0BMQp
 mkWSHmLSXyucmWuu64g6iRCEQ6EgcM0Ob7TT+6kSFPf4Rb3n/dyHWWlhMCcBG3VyaJ
 B/zyUv2e/KcVjwidgk0eiRWrKoVZafiauXGn+G7mqeZVNA4qvkFXcfipIg0ObH1lGx
 5f/oMEFdrljAC3O8vjGzS+rnM/bx2dZGv7/1EVRelkvVhnwr+1MScMWAan/2doUvSE
 HOh91tL6RaQb2usSaRKoA9ciVigiDTgJbmKQcBj9UA7c+ytwPrcsh7nSeegeC79+dv
 tAEVZiR5AZZ7Q==
From: Jeff Layton <jlayton@kernel.org>
Date: Tue, 27 May 2025 07:33:35 -0400
Subject: [PATCH v10 4/9] ref_tracker: add a static classname string to each
 ref_tracker_dir
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250527-reftrack-dbgfs-v10-4-dc55f7705691@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=5956; i=jlayton@kernel.org;
 h=from:subject:message-id; bh=yqoo79KYlvYVQ9kfd3gXqO3yXNwpPMOjnXlk+fFo8C8=;
 b=owEBbQKS/ZANAwAKAQAOaEEZVoIVAcsmYgBoNaMWWCoOVqEhlBz0PVC3++glT/fi8Pz2g9CX6
 B+Xz+wld8uJAjMEAAEKAB0WIQRLwNeyRHGyoYTq9dMADmhBGVaCFQUCaDWjFgAKCRAADmhBGVaC
 FZo1D/sE1Id9PJ1OM7yBtjCLs0Ev0mmpU7AOhMSMaXkMpGgleGqZ8AOEcVU9aM0NDYj7dWvyQlt
 j56Zrz4qYAhObhY0wpgPiTDW6UJykRQR15+kUi+Tze3V0JaYVf7trgx1xDgbU0QRX+aTnwoXDsR
 Mu59TAc5+MZ8KnWnRI2LCZ87MFbvraBWICHc3qXzM/NgmKlIzKzsXWs3LdOq7s9wLlVaWxKNDOw
 HLaP0V5WDGta/nlNZgFgMxV6CRvagYkiaujlxozj7vfYS/kQs2zz9ELHwi4MYKJhi4J5nEFKE5K
 KtN01Zd3KHqMcHmGFTLP1ZUj6r1VAUMxwXx4qRWeYAlmXtLQdQegEqDc7YUcEaPtYW289C6Qri4
 2mDV7AZWOLX3ISvPoAFTD99NWc72zMMfqCAH1WVe7W1nVm55oOTdXahjR1+1LDvC0YrG/gRdFI7
 2aTKH4nKyiOpl8lDINRFra2VBmSsF7NbMHIyGkaGq5L36agSNv6d8fExsH8dK4G0waZ16mhU0UT
 iKYl0u781Hc6UDS7rwCPPcX6hUGJuWAgHnKWDDOwJLsia0d3FUgxZjmifW6zV2MNwIDdKZeyCb3
 dlZu72fU1/kJtoNcM6u6YzsDmD7kdGiin/P9B3q6W7X+GjWKjFni4xLc2F2XVG2ICrdqoOCKmdY
 1QkOFZzjfJz2WuA==
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

Signed-off-by: Jeff Layton <jlayton@kernel.org>
---
 drivers/gpu/drm/display/drm_dp_tunnel.c | 2 +-
 drivers/gpu/drm/i915/intel_runtime_pm.c | 3 ++-
 drivers/gpu/drm/i915/intel_wakeref.c    | 2 +-
 include/linux/ref_tracker.h             | 4 ++++
 lib/test_ref_tracker.c                  | 2 +-
 net/core/dev.c                          | 2 +-
 net/core/net_namespace.c                | 4 ++--
 7 files changed, 12 insertions(+), 7 deletions(-)

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
index 8d9f4c410546e4144d4bc8bbc6696f3bd9498848..3fdab3b44c08cea16ac2f73aafc2bea2ffbb19e7 100644
--- a/drivers/gpu/drm/i915/intel_runtime_pm.c
+++ b/drivers/gpu/drm/i915/intel_runtime_pm.c
@@ -59,7 +59,8 @@ static struct drm_i915_private *rpm_to_i915(struct intel_runtime_pm *rpm)
 
 static void init_intel_runtime_pm_wakeref(struct intel_runtime_pm *rpm)
 {
-	ref_tracker_dir_init(&rpm->debug, INTEL_REFTRACK_DEAD_COUNT, dev_name(rpm->kdev));
+	ref_tracker_dir_init(&rpm->debug, INTEL_REFTRACK_DEAD_COUNT,
+			     "intel_runtime_pm", dev_name(rpm->kdev));
 }
 
 static intel_wakeref_t
diff --git a/drivers/gpu/drm/i915/intel_wakeref.c b/drivers/gpu/drm/i915/intel_wakeref.c
index 07e81be4d3920febece34709c63a63204a41583c..5269e64c58a49884f5d712557546272bfdeb8417 100644
--- a/drivers/gpu/drm/i915/intel_wakeref.c
+++ b/drivers/gpu/drm/i915/intel_wakeref.c
@@ -114,7 +114,7 @@ void __intel_wakeref_init(struct intel_wakeref *wf,
 			 "wakeref.work", &key->work, 0);
 
 #if IS_ENABLED(CONFIG_DRM_I915_DEBUG_WAKEREF)
-	ref_tracker_dir_init(&wf->debug, INTEL_REFTRACK_DEAD_COUNT, name);
+	ref_tracker_dir_init(&wf->debug, INTEL_REFTRACK_DEAD_COUNT, "intel_wakeref", name);
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
index 3eb4e945f3120f26605a0b407cb98b12492bc61e..bac9d29486556023cd99f5101b96b052acb9ba70 100644
--- a/net/core/dev.c
+++ b/net/core/dev.c
@@ -11713,7 +11713,7 @@ struct net_device *alloc_netdev_mqs(int sizeof_priv, const char *name,
 
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

