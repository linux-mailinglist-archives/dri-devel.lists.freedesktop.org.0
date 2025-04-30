Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DA932AA4F9A
	for <lists+dri-devel@lfdr.de>; Wed, 30 Apr 2025 17:07:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B54F10E7DD;
	Wed, 30 Apr 2025 15:07:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="mR1xluiV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 53E8410E7D5;
 Wed, 30 Apr 2025 15:07:10 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id AA2C24AD70;
 Wed, 30 Apr 2025 15:07:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ED6FCC4CEF8;
 Wed, 30 Apr 2025 15:07:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1746025626;
 bh=OM8eKgd8/PoRGSkjls071wlD5MSsyPo0WX9Tc5eod8o=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=mR1xluiVjNvlMMQVtK/GhlCweCtrL780Odw2GA5biH0HSUWWyMHBH5zfcv3Z+Mg4v
 625/VXp6Xjy7nZDjPKT2Jbyq+8cVUdDaePKHtM4TGQAX/L4Utm+9zGcpjYQrg60Rtf
 K17LyvNeXKgNZw0icxzH6vxQNBVJ8ATrX3GSMF9Fc8DBxoRBKu1+oAAUJIU0NxBfij
 Ndvkw5iHOy0KPGyKW35y6J3ahoAdcn5BvW1UwzlD0ijK7Jv5GD2r7Qz3k9U8SzardP
 2L2u8wqIlMnxdy2cHxpNJ6u6OMw+V3pN7GaITgLXHUmScTCyFjcdF0lf7oRDj7TCgy
 mMfBw/UWAEUKQ==
From: Jeff Layton <jlayton@kernel.org>
Date: Wed, 30 Apr 2025 08:06:50 -0700
Subject: [PATCH v6 04/10] ref_tracker: add a static classname string to
 each ref_tracker_dir
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250430-reftrack-dbgfs-v6-4-867c29aff03a@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=5956; i=jlayton@kernel.org;
 h=from:subject:message-id; bh=OM8eKgd8/PoRGSkjls071wlD5MSsyPo0WX9Tc5eod8o=;
 b=owEBbQKS/ZANAwAIAQAOaEEZVoIVAcsmYgBoEjyTP13iajTzStcKm6uW/WgjZ0Brn1Mw41nOD
 KSaK76iGfCJAjMEAAEIAB0WIQRLwNeyRHGyoYTq9dMADmhBGVaCFQUCaBI8kwAKCRAADmhBGVaC
 FWTSEACIL8pk/WJ30anQ85if0UnCnnGlA/Mb6sgC8dn/sfKsXHZ4lfPq3cB/wqt9wzltyLpx09V
 ktWKWdStDdGZtL7kGjWScgA+iZZ4t1enlgh6M/ngYFjtRZY/upfyVdF9lD6gO5qC7cOXWx7WKtN
 W6qQnpeFal0bjlAbCrZmpCMuWEArVVFqYsHaqZtKQB8i+eSdeaiTaNyYQvAHpHRNrXM3qybbKmu
 5fuflM6TASbMr+HjioM5zaOq0EtJqDliBtw4LMt3/sHmAq2IGbvmKDgmtdd2yrc2NSfwd3HROXA
 HLKpQCoh9SLnQBT9HRtN1VHxaMMpwRRCJHLBhasAapbuRaGxTxurouVGgNa+V1J6e3yU2UaMPMf
 2dxZfkXOmIJyYGLcUPW0zNsFOvLi/wH6F8uKqBo3vPdS7piuhKfkwAbPd6JLnvajASs5EUtfMtq
 KCKQdHlkMZ1iBy1Gpy6jKXB0hATO6s1k8OnSnoWssr95GqqdTe1GLfMR5xJFPqUUudBWagJqIt5
 Rs0Rafya+pAeZL4BoJ+RLM/Q69pw9KVC96RD9jOXowM8OetdFf02vzXRAN2g1L0OhLglRbqMcvG
 MAGyfGwTky074ON7Cz8z5Di65eY8pgW7xwF8V0tjunE43I9f6F+WuuZhS99OXa/OjOxknB5oR1j
 6Jm6HWKJES+Or9A==
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
index 90fe07a89260e21e78f2db7f57a90602be921a11..f2a8ef6abf34d89a642d7c7708c41e5b1dc9dece 100644
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
index 8eac4f3d52547ccbaf9dcd09962ce80d26fbdff8..2adae128d4b5e45f156af4775a1d184bb596fa91 100644
--- a/include/linux/ref_tracker.h
+++ b/include/linux/ref_tracker.h
@@ -17,6 +17,7 @@ struct ref_tracker_dir {
 	bool			dead;
 	struct list_head	list; /* List of active trackers */
 	struct list_head	quarantine; /* List of dead trackers */
+	const char		*class; /* object classname */
 	char			name[32];
 #endif
 };
@@ -25,6 +26,7 @@ struct ref_tracker_dir {
 
 static inline void ref_tracker_dir_init(struct ref_tracker_dir *dir,
 					unsigned int quarantine_count,
+					const char *class,
 					const char *name)
 {
 	INIT_LIST_HEAD(&dir->list);
@@ -34,6 +36,7 @@ static inline void ref_tracker_dir_init(struct ref_tracker_dir *dir,
 	dir->dead = false;
 	refcount_set(&dir->untracked, 1);
 	refcount_set(&dir->no_tracker, 1);
+	dir->class = class;
 	strscpy(dir->name, name, sizeof(dir->name));
 	stack_depot_init();
 }
@@ -58,6 +61,7 @@ int ref_tracker_free(struct ref_tracker_dir *dir,
 
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
index 1be7cb73a6024fda6797b6dfc895e4ce25f43251..380d07bec15a1f62ed27c31a6e211e74f3a5561d 100644
--- a/net/core/dev.c
+++ b/net/core/dev.c
@@ -11620,7 +11620,7 @@ struct net_device *alloc_netdev_mqs(int sizeof_priv, const char *name,
 
 	dev->priv_len = sizeof_priv;
 
-	ref_tracker_dir_init(&dev->refcnt_tracker, 128, name);
+	ref_tracker_dir_init(&dev->refcnt_tracker, 128, "netdev", name);
 #ifdef CONFIG_PCPU_DEV_REFCNT
 	dev->pcpu_refcnt = alloc_percpu(int);
 	if (!dev->pcpu_refcnt)
diff --git a/net/core/net_namespace.c b/net/core/net_namespace.c
index b0dfdf791ece5aa8fefdc2aea1ff4a9d9c399d72..008de9675ea98fa8c18628b2f1c3aee7f3ebc9c6 100644
--- a/net/core/net_namespace.c
+++ b/net/core/net_namespace.c
@@ -324,8 +324,8 @@ static __net_init void preinit_net(struct net *net, struct user_namespace *user_
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

