Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AA6D66B97AA
	for <lists+dri-devel@lfdr.de>; Tue, 14 Mar 2023 15:20:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C102C10EA82;
	Tue, 14 Mar 2023 14:19:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E1FBC10EA87;
 Tue, 14 Mar 2023 14:19:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1678803595; x=1710339595;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=zyvw01nw5i24yTZdtQNlFxRGIqb6RB7teXa+DHhFniw=;
 b=QwqwvxgNDaRAZutqHvs/x6WUhYdtYV+/eP05iiKbO5FBJxi29rvSkt4d
 8Y/Vawu955Om69TvSkDtYV/Y/De0hvWlmuwN+GZXPPWt5/mK2XdYoF5K2
 CROCpcFCGc7yR/+rNFo1+wI0y/Qw+FxaELgDC2MJyhHB4tjKocfEQb88F
 X5znZBgIs+wx1cNayXlqzwLVO8BjK/jZMnwpdTxB5Csrg2HKIxp0gjvex
 5kR1lkSnXSshKwfpD2iiEaPIAYEKx7yyFIwOb3S+virM0MUMK8Aggnkk1
 IaEOdmSRTG8R+scSdVPoO7vgdOEjV/0rxNrCq3Nb7yu1M6aBbWE7WvLEi w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10649"; a="321284945"
X-IronPort-AV: E=Sophos;i="5.98,260,1673942400"; d="scan'208";a="321284945"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Mar 2023 07:19:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10649"; a="656363306"
X-IronPort-AV: E=Sophos;i="5.98,260,1673942400"; d="scan'208";a="656363306"
Received: from mjtillin-mobl.ger.corp.intel.com (HELO localhost.localdomain)
 ([10.213.236.227])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Mar 2023 07:19:50 -0700
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
To: Intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [RFC 09/10] drm/i915: Wire up with drm controller GPU time query
Date: Tue, 14 Mar 2023 14:19:03 +0000
Message-Id: <20230314141904.1210824-10-tvrtko.ursulin@linux.intel.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230314141904.1210824-1-tvrtko.ursulin@linux.intel.com>
References: <20230314141904.1210824-1-tvrtko.ursulin@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: Rob Clark <robdclark@chromium.org>, Brian Welty <brian.welty@intel.com>,
 Kenny.Ho@amd.com, Tvrtko Ursulin <tvrtko.ursulin@intel.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, Johannes Weiner <hannes@cmpxchg.org>,
 linux-kernel@vger.kernel.org,
 =?UTF-8?q?St=C3=A9phane=20Marchesin?= <marcheu@chromium.org>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Zefan Li <lizefan.x@bytedance.com>, Dave Airlie <airlied@redhat.com>,
 Tejun Heo <tj@kernel.org>, cgroups@vger.kernel.org,
 "T . J . Mercier" <tjmercier@google.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>

Implement the drm_cgroup_ops->active_time_us callback.

Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
---
 drivers/gpu/drm/i915/i915_driver.c     | 10 ++++
 drivers/gpu/drm/i915/i915_drm_client.c | 76 ++++++++++++++++++++++----
 drivers/gpu/drm/i915/i915_drm_client.h |  2 +
 3 files changed, 78 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/i915/i915_driver.c b/drivers/gpu/drm/i915/i915_driver.c
index da249337c23b..e956990a9870 100644
--- a/drivers/gpu/drm/i915/i915_driver.c
+++ b/drivers/gpu/drm/i915/i915_driver.c
@@ -1777,6 +1777,12 @@ static const struct drm_ioctl_desc i915_ioctls[] = {
 	DRM_IOCTL_DEF_DRV(I915_GEM_VM_DESTROY, i915_gem_vm_destroy_ioctl, DRM_RENDER_ALLOW),
 };
 
+#ifdef CONFIG_CGROUP_DRM
+static const struct drm_cgroup_ops i915_drm_cgroup_ops = {
+	.active_time_us = i915_drm_cgroup_get_active_time_us,
+};
+#endif
+
 /*
  * Interface history:
  *
@@ -1805,6 +1811,10 @@ static const struct drm_driver i915_drm_driver = {
 	.lastclose = i915_driver_lastclose,
 	.postclose = i915_driver_postclose,
 
+#ifdef CONFIG_CGROUP_DRM
+	.cg_ops = &i915_drm_cgroup_ops,
+#endif
+
 	.prime_handle_to_fd = drm_gem_prime_handle_to_fd,
 	.prime_fd_to_handle = drm_gem_prime_fd_to_handle,
 	.gem_prime_import = i915_gem_prime_import,
diff --git a/drivers/gpu/drm/i915/i915_drm_client.c b/drivers/gpu/drm/i915/i915_drm_client.c
index b09d1d386574..c9754cb0277f 100644
--- a/drivers/gpu/drm/i915/i915_drm_client.c
+++ b/drivers/gpu/drm/i915/i915_drm_client.c
@@ -75,7 +75,7 @@ void i915_drm_clients_fini(struct i915_drm_clients *clients)
 	xa_destroy(&clients->xarray);
 }
 
-#ifdef CONFIG_PROC_FS
+#if defined(CONFIG_PROC_FS) || defined(CONFIG_CGROUP_DRM)
 static const char * const uabi_class_names[] = {
 	[I915_ENGINE_CLASS_RENDER] = "render",
 	[I915_ENGINE_CLASS_COPY] = "copy",
@@ -100,22 +100,78 @@ static u64 busy_add(struct i915_gem_context *ctx, unsigned int class)
 	return total;
 }
 
-static void
-show_client_class(struct seq_file *m,
-		  struct i915_drm_client *client,
-		  unsigned int class)
+static u64 get_class_active_ns(struct i915_drm_client *client,
+			       unsigned int class,
+			       unsigned int *capacity)
 {
-	const struct list_head *list = &client->ctx_list;
-	u64 total = atomic64_read(&client->past_runtime[class]);
-	const unsigned int capacity =
-		client->clients->i915->engine_uabi_class_count[class];
 	struct i915_gem_context *ctx;
+	u64 total;
+
+	*capacity =
+	    client->clients->i915->engine_uabi_class_count[class];
+	if (!*capacity)
+		return 0;
+
+	total = atomic64_read(&client->past_runtime[class]);
 
 	rcu_read_lock();
-	list_for_each_entry_rcu(ctx, list, client_link)
+	list_for_each_entry_rcu(ctx, &client->ctx_list, client_link)
 		total += busy_add(ctx, class);
 	rcu_read_unlock();
 
+	return total;
+}
+#endif
+
+#ifdef CONFIG_CGROUP_DRM
+static bool supports_stats(struct drm_i915_private *i915)
+{
+	if (GRAPHICS_VER(i915) < 8)
+		return false;
+
+	/* temporary... */
+	if (intel_uc_uses_guc_submission(&to_gt(i915)->uc))
+		return false;
+
+	return true;
+}
+
+u64 i915_drm_cgroup_get_active_time_us(struct drm_file *file)
+{
+	struct drm_i915_file_private *fpriv = file->driver_priv;
+	struct i915_drm_client *client = fpriv->client;
+	unsigned int i;
+	u64 busy = 0;
+
+	if (!supports_stats(client->clients->i915))
+		return 0;
+
+	for (i = 0; i < ARRAY_SIZE(uabi_class_names); i++) {
+		unsigned int capacity;
+		u64 b;
+
+		b = get_class_active_ns(client, i, &capacity);
+		if (capacity) {
+			b = DIV_ROUND_UP_ULL(b, capacity * 1000);
+			busy += b;
+		}
+	}
+
+	return busy;
+}
+#endif
+
+#ifdef CONFIG_PROC_FS
+static void
+show_client_class(struct seq_file *m,
+		  struct i915_drm_client *client,
+		  unsigned int class)
+{
+	unsigned int capacity;
+	u64 total;
+
+	total = get_class_active_ns(client, class, &capacity);
+
 	if (capacity)
 		seq_printf(m, "drm-engine-%s:\t%llu ns\n",
 			   uabi_class_names[class], total);
diff --git a/drivers/gpu/drm/i915/i915_drm_client.h b/drivers/gpu/drm/i915/i915_drm_client.h
index 69496af996d9..c8439eaa89be 100644
--- a/drivers/gpu/drm/i915/i915_drm_client.h
+++ b/drivers/gpu/drm/i915/i915_drm_client.h
@@ -65,4 +65,6 @@ void i915_drm_client_fdinfo(struct seq_file *m, struct file *f);
 
 void i915_drm_clients_fini(struct i915_drm_clients *clients);
 
+u64 i915_drm_cgroup_get_active_time_us(struct drm_file *file);
+
 #endif /* !__I915_DRM_CLIENT_H__ */
-- 
2.37.2

