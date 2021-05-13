Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 69D3437F627
	for <lists+dri-devel@lfdr.de>; Thu, 13 May 2021 13:00:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 20C216ECF7;
	Thu, 13 May 2021 11:00:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 885596ECF7;
 Thu, 13 May 2021 11:00:18 +0000 (UTC)
IronPort-SDR: YmJ07eBp2IZ8J3xI09UCjt51cF2VN9JLUy/KLHZthiTLy8qN+LzhR6/JOzly0ih2oTL9pEz33N
 xDMg+Lj9ZDRg==
X-IronPort-AV: E=McAfee;i="6200,9189,9982"; a="187048094"
X-IronPort-AV: E=Sophos;i="5.82,296,1613462400"; d="scan'208";a="187048094"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 May 2021 04:00:18 -0700
IronPort-SDR: qXx975+RjgBFY3HIyWwkcubnwURwLeu5Kyygf0Mfjgoc1FaI9rptLrresSmS0M/JRpRqgXeTQX
 zbDDG6RjZmdQ==
X-IronPort-AV: E=Sophos;i="5.82,296,1613462400"; d="scan'208";a="400930465"
Received: from hcadcock-mobl1.ger.corp.intel.com (HELO tursulin-mobl2.home)
 ([10.213.209.166])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 May 2021 04:00:17 -0700
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
To: Intel-gfx@lists.freedesktop.org
Subject: [PATCH 7/7] drm/i915: Expose per-engine client busyness
Date: Thu, 13 May 2021 12:00:02 +0100
Message-Id: <20210513110002.3641705-8-tvrtko.ursulin@linux.intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210513110002.3641705-1-tvrtko.ursulin@linux.intel.com>
References: <20210513110002.3641705-1-tvrtko.ursulin@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>

Expose per-client and per-engine busyness under the previously added sysfs
client root.

The new files are one per-engine instance and located under the 'busy'
directory. Each contains a monotonically increasing nano-second resolution
times each client's jobs were executing on the GPU.

This enables userspace to create a top-like tool for GPU utilization:

==========================================================================
intel-gpu-top -  935/ 935 MHz;    0% RC6; 14.73 Watts;     1097 irqs/s

      IMC reads:     1401 MiB/s
     IMC writes:        4 MiB/s

          ENGINE      BUSY                                 MI_SEMA MI_WAIT
     Render/3D/0   63.73% |███████████████████           |      3%      0%
       Blitter/0    9.53% |██▊                           |      6%      0%
         Video/0   39.32% |███████████▊                  |     16%      0%
         Video/1   15.62% |████▋                         |      0%      0%
  VideoEnhance/0    0.00% |                              |      0%      0%

  PID            NAME     RCS          BCS          VCS         VECS
 4084        gem_wsim |█████▌     ||█          ||           ||           |
 4086        gem_wsim |█▌         ||           ||███        ||           |
==========================================================================

v2: Use intel_context_engine_get_busy_time.
v3: New directory structure.
v4: Rebase.
v5: sysfs_attr_init.
v6: Small tidy in i915_gem_add_client.
v7: Rebase to be engine class based.
v8:
 * Always enable stats.
 * Walk all client contexts.
v9:
 * Skip unsupported engine classes. (Chris)
 * Use scheduler caps. (Chris)
v10:
 * Use pphwsp runtime only.

Link: https://patchwork.freedesktop.org/series/71182/ # intel_gpu_top
Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Reviewed-by: Aravind Iddamsetty <aravind.iddamsetty@intel.com>
Reviewed-by: Chris Wilson <chris@chris-wilson.co.uk>
Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
Link: https://patchwork.freedesktop.org/patch/msgid/20210123153733.18139-8-chris@chris-wilson.co.uk
Link: https://patchwork.freedesktop.org/patch/msgid/20210124153136.19124-8-chris@chris-wilson.co.uk
---
 drivers/gpu/drm/i915/i915_drm_client.c | 101 ++++++++++++++++++++++++-
 drivers/gpu/drm/i915/i915_drm_client.h |  10 +++
 2 files changed, 110 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/i915_drm_client.c b/drivers/gpu/drm/i915/i915_drm_client.c
index 0ca81a750895..1f8b08a413d4 100644
--- a/drivers/gpu/drm/i915/i915_drm_client.c
+++ b/drivers/gpu/drm/i915/i915_drm_client.c
@@ -9,6 +9,11 @@
 
 #include <drm/drm_print.h>
 
+#include <uapi/drm/i915_drm.h>
+
+#include "gem/i915_gem_context.h"
+#include "gt/intel_engine_user.h"
+
 #include "i915_drm_client.h"
 #include "i915_drv.h"
 #include "i915_gem.h"
@@ -55,6 +60,95 @@ show_client_pid(struct device *kdev, struct device_attribute *attr, char *buf)
 	return ret;
 }
 
+static u64 busy_add(struct i915_gem_context *ctx, unsigned int class)
+{
+	struct i915_gem_engines_iter it;
+	struct intel_context *ce;
+	u64 total = 0;
+
+	for_each_gem_engine(ce, rcu_dereference(ctx->engines), it) {
+		if (ce->engine->uabi_class != class)
+			continue;
+
+		total += intel_context_get_total_runtime_ns(ce);
+	}
+
+	return total;
+}
+
+static ssize_t
+show_busy(struct device *kdev, struct device_attribute *attr, char *buf)
+{
+	struct i915_engine_busy_attribute *i915_attr =
+		container_of(attr, typeof(*i915_attr), attr);
+	unsigned int class = i915_attr->engine_class;
+	const struct i915_drm_client *client = i915_attr->client;
+	const struct list_head *list = &client->ctx_list;
+	u64 total = atomic64_read(&client->past_runtime[class]);
+	struct i915_gem_context *ctx;
+
+	rcu_read_lock();
+	list_for_each_entry_rcu(ctx, list, client_link)
+		total += busy_add(ctx, class);
+	rcu_read_unlock();
+
+	return sysfs_emit(buf, "%llu\n", total);
+}
+
+static const char * const uabi_class_names[] = {
+	[I915_ENGINE_CLASS_RENDER] = "0",
+	[I915_ENGINE_CLASS_COPY] = "1",
+	[I915_ENGINE_CLASS_VIDEO] = "2",
+	[I915_ENGINE_CLASS_VIDEO_ENHANCE] = "3",
+};
+
+static int __client_register_sysfs_busy(struct i915_drm_client *client)
+{
+	struct i915_drm_clients *clients = client->clients;
+	unsigned int i;
+	int ret = 0;
+
+	if (!(clients->i915->caps.scheduler & I915_SCHEDULER_CAP_ENGINE_BUSY_STATS))
+		return 0;
+
+	client->busy_root = kobject_create_and_add("busy", client->root);
+	if (!client->busy_root)
+		return -ENOMEM;
+
+	for (i = 0; i < ARRAY_SIZE(uabi_class_names); i++) {
+		struct i915_engine_busy_attribute *i915_attr =
+			&client->attr.busy[i];
+		struct device_attribute *attr = &i915_attr->attr;
+
+		if (!intel_engine_lookup_user(clients->i915, i, 0))
+			continue;
+
+		i915_attr->client = client;
+		i915_attr->engine_class = i;
+
+		sysfs_attr_init(&attr->attr);
+
+		attr->attr.name = uabi_class_names[i];
+		attr->attr.mode = 0444;
+		attr->show = show_busy;
+
+		ret = sysfs_create_file(client->busy_root, &attr->attr);
+		if (ret)
+			goto out;
+	}
+
+out:
+	if (ret)
+		kobject_put(client->busy_root);
+
+	return ret;
+}
+
+static void __client_unregister_sysfs_busy(struct i915_drm_client *client)
+{
+	kobject_put(fetch_and_zero(&client->busy_root));
+}
+
 static int __client_register_sysfs(struct i915_drm_client *client)
 {
 	const struct {
@@ -90,9 +184,12 @@ static int __client_register_sysfs(struct i915_drm_client *client)
 
 		ret = sysfs_create_file(client->root, &attr->attr);
 		if (ret)
-			break;
+			goto out;
 	}
 
+	ret = __client_register_sysfs_busy(client);
+
+out:
 	if (ret)
 		kobject_put(client->root);
 
@@ -101,6 +198,8 @@ static int __client_register_sysfs(struct i915_drm_client *client)
 
 static void __client_unregister_sysfs(struct i915_drm_client *client)
 {
+	__client_unregister_sysfs_busy(client);
+
 	kobject_put(fetch_and_zero(&client->root));
 }
 
diff --git a/drivers/gpu/drm/i915/i915_drm_client.h b/drivers/gpu/drm/i915/i915_drm_client.h
index 13f92142e474..83660fa9d2d7 100644
--- a/drivers/gpu/drm/i915/i915_drm_client.h
+++ b/drivers/gpu/drm/i915/i915_drm_client.h
@@ -30,6 +30,14 @@ struct i915_drm_clients {
 	struct kobject *root;
 };
 
+struct i915_drm_client;
+
+struct i915_engine_busy_attribute {
+	struct device_attribute attr;
+	struct i915_drm_client *client;
+	unsigned int engine_class;
+};
+
 struct i915_drm_client_name {
 	struct rcu_head rcu;
 	struct i915_drm_client *client;
@@ -54,9 +62,11 @@ struct i915_drm_client {
 	struct i915_drm_clients *clients;
 
 	struct kobject *root;
+	struct kobject *busy_root;
 	struct {
 		struct device_attribute pid;
 		struct device_attribute name;
+		struct i915_engine_busy_attribute busy[MAX_ENGINE_CLASS + 1];
 	} attr;
 
 	/**
-- 
2.30.2

