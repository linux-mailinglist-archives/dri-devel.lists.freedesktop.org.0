Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C631D38B2CA
	for <lists+dri-devel@lfdr.de>; Thu, 20 May 2021 17:13:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F5AF6F493;
	Thu, 20 May 2021 15:13:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B3BF76F490;
 Thu, 20 May 2021 15:13:22 +0000 (UTC)
IronPort-SDR: oWhG+aeQ00kabGgbp/QAlD7ahTdJ/Q0XbeElzvrpKT1kyyQBINmVroNMcBAJF1gDYkVeBPS/6Q
 kIXHwRWCrkDA==
X-IronPort-AV: E=McAfee;i="6200,9189,9989"; a="265162817"
X-IronPort-AV: E=Sophos;i="5.82,313,1613462400"; d="scan'208";a="265162817"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 May 2021 08:13:20 -0700
IronPort-SDR: UhIuIOlyU4XS2GcSq4m8L52jCYJMPU3MYUzHRpgUl4DcDfVmnO7WzVzuOjwv4ARfZUPC6bbYj5
 z/4Qk4CzGtZw==
X-IronPort-AV: E=Sophos;i="5.82,313,1613462400"; d="scan'208";a="543619306"
Received: from fgrogers-mobl.ger.corp.intel.com (HELO tursulin-mobl2.home)
 ([10.213.241.97])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 May 2021 08:13:19 -0700
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
To: Intel-gfx@lists.freedesktop.org
Subject: [RFC 7/7] drm/i915: Expose client engine utilisation via fdinfo
Date: Thu, 20 May 2021 16:12:54 +0100
Message-Id: <20210520151254.959958-8-tvrtko.ursulin@linux.intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210520151254.959958-1-tvrtko.ursulin@linux.intel.com>
References: <20210520151254.959958-1-tvrtko.ursulin@linux.intel.com>
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
Cc: David M Nieto <David.Nieto@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 dri-devel@lists.freedesktop.org, Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>

Similar to AMD commit
874442541133 ("drm/amdgpu: Add show_fdinfo() interface"), using the
infrastructure added in previous patches, we add basic client info
and GPU engine utilisation for i915.

Example of the output:

  pos:    0
  flags:  0100002
  mnt_id: 21
  drm-driver: i915
  drm-pdev:   0000:00:02.0
  drm-client-id:      7
  drm-engine-render:  9288864723 ns
  drm-engine-copy:    2035071108 ns
  drm-engine-video:   0 ns
  drm-engine-video-enhance:   0 ns

DRM related fields are appropriately prefixed for easy parsing and
separation from generic fdinfo fields.

Idea is for some fields to become either fully or partially standardised
in order to enable writting of generic top-like tools.

Initial proposal for fully standardised common fields:

 drm-driver: <str>
 drm-pdev: <aaaa:bb.cc.d>

Optional fully standardised:

 drm-client-id: <uint>

Optional partially standardised:

 engine-<str>: <u64> ns
 memory-<str>: <u64> KiB

Once agreed the format would need to go to some README or kerneldoc in
DRM core.

Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Cc: David M Nieto <David.Nieto@amd.com>
Cc: Christian König <christian.koenig@amd.com>
Cc: Daniel Vetter <daniel@ffwll.ch>
---
 drivers/gpu/drm/i915/i915_drm_client.c | 68 ++++++++++++++++++++++++++
 drivers/gpu/drm/i915/i915_drm_client.h |  4 ++
 drivers/gpu/drm/i915/i915_drv.c        |  3 ++
 3 files changed, 75 insertions(+)

diff --git a/drivers/gpu/drm/i915/i915_drm_client.c b/drivers/gpu/drm/i915/i915_drm_client.c
index 1e5db7753276..5e9cfba1116b 100644
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
@@ -168,3 +173,66 @@ void i915_drm_clients_fini(struct i915_drm_clients *clients)
 
 	xa_destroy(&clients->xarray);
 }
+
+#ifdef CONFIG_PROC_FS
+static const char * const uabi_class_names[] = {
+	[I915_ENGINE_CLASS_RENDER] = "render",
+	[I915_ENGINE_CLASS_COPY] = "copy",
+	[I915_ENGINE_CLASS_VIDEO] = "video",
+	[I915_ENGINE_CLASS_VIDEO_ENHANCE] = "video-enhance",
+};
+
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
+static void
+show_client_class(struct seq_file *m,
+		  struct i915_drm_client *client,
+		  unsigned int class)
+{
+	const struct list_head *list = &client->ctx_list;
+	u64 total = atomic64_read(&client->past_runtime[class]);
+	struct i915_gem_context *ctx;
+
+	rcu_read_lock();
+	list_for_each_entry_rcu(ctx, list, client_link)
+		total += busy_add(ctx, class);
+	rcu_read_unlock();
+
+	return seq_printf(m, "drm-engine-%s:\t%llu ns\n",
+			  uabi_class_names[class], total);
+}
+
+void i915_drm_client_fdinfo(struct seq_file *m, struct file *f)
+{
+	struct drm_file *file = f->private_data;
+	struct drm_i915_file_private *file_priv = file->driver_priv;
+	struct drm_i915_private *i915 = file_priv->dev_priv;
+	struct i915_drm_client *client = file_priv->client;
+	struct pci_dev *pdev = to_pci_dev(i915->drm.dev);
+	unsigned int i;
+
+	seq_printf(m, "drm-driver:\ti915\n");
+	seq_printf(m, "drm-pdev:\t%04x:%02x:%02x.%d\n",
+		   pci_domain_nr(pdev->bus), pdev->bus->number,
+		   PCI_SLOT(pdev->devfn), PCI_FUNC(pdev->devfn));
+
+	seq_printf(m, "drm-client-id:\t%u\n", client->id);
+
+	for (i = 0; i < ARRAY_SIZE(uabi_class_names); i++)
+		show_client_class(m, client, i);
+}
+#endif
diff --git a/drivers/gpu/drm/i915/i915_drm_client.h b/drivers/gpu/drm/i915/i915_drm_client.h
index b2b69d6985e4..9885002433a0 100644
--- a/drivers/gpu/drm/i915/i915_drm_client.h
+++ b/drivers/gpu/drm/i915/i915_drm_client.h
@@ -98,6 +98,10 @@ i915_drm_client_pid(const struct i915_drm_client *client)
 	return __i915_drm_client_name(client)->pid;
 }
 
+#ifdef CONFIG_PROC_FS
+void i915_drm_client_fdinfo(struct seq_file *m, struct file *f);
+#endif
+
 void i915_drm_clients_fini(struct i915_drm_clients *clients);
 
 #endif /* !__I915_DRM_CLIENT_H__ */
diff --git a/drivers/gpu/drm/i915/i915_drv.c b/drivers/gpu/drm/i915/i915_drv.c
index 33eb7b52b58b..6b63fe4b3c26 100644
--- a/drivers/gpu/drm/i915/i915_drv.c
+++ b/drivers/gpu/drm/i915/i915_drv.c
@@ -1694,6 +1694,9 @@ static const struct file_operations i915_driver_fops = {
 	.read = drm_read,
 	.compat_ioctl = i915_ioc32_compat_ioctl,
 	.llseek = noop_llseek,
+#ifdef CONFIG_PROC_FS
+	.show_fdinfo = i915_drm_client_fdinfo,
+#endif
 };
 
 static int
-- 
2.30.2

