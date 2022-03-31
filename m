Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id ACE4F4EDB6A
	for <lists+dri-devel@lfdr.de>; Thu, 31 Mar 2022 16:09:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A37910EAA7;
	Thu, 31 Mar 2022 14:09:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C15A10E732;
 Thu, 31 Mar 2022 14:09:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1648735776; x=1680271776;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=W/XSnfY4DJPvUodzoAJ6thuysohpm+9rYr06rYVmH5k=;
 b=i8VetgrgY4wuejudZ1CePLzpbSDGmcaZxcTnuE+bSCh5Jlljnm7MG5lu
 SDhxM0/nkqsO+ryOPW1f65YDoNQEfLEFjUOl3TW1tY8Df18ljmvXFP7sj
 zI9VDwqBdNnP2bofwdqkb7ei1v9W7DVekeX2lb+l94KAScC8ItUWTW+L0
 GAWNv8UtCOmx6csMidJM8t0X90Dkjz9n4nZis1DSqayBruOPXvI2H0/YM
 V7uXDimHKPvGe9lr69VF14IlpP5vwNkno6ix04pMyX73pW80DN0vmFARx
 IoleHUBuZJyF+GdoIxG4EA+hih4QQFncqyUDC3pQn0VKkxOKvhhnvUMGq Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10302"; a="259825456"
X-IronPort-AV: E=Sophos;i="5.90,225,1643702400"; d="scan'208";a="259825456"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Mar 2022 07:09:35 -0700
X-IronPort-AV: E=Sophos;i="5.90,225,1643702400"; d="scan'208";a="606114234"
Received: from juanniex-mobl.ger.corp.intel.com (HELO tursulin-mobl2.home)
 ([10.213.215.247])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Mar 2022 07:09:34 -0700
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
To: Intel-gfx@lists.freedesktop.org
Subject: [PATCH 8/8] drm/i915: Expose client engine utilisation via fdinfo
Date: Thu, 31 Mar 2022 15:09:20 +0100
Message-Id: <20220331140920.2986689-9-tvrtko.ursulin@linux.intel.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220331140920.2986689-1-tvrtko.ursulin@linux.intel.com>
References: <20220331140920.2986689-1-tvrtko.ursulin@linux.intel.com>
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

v2:
 * Update for removal of name and pid.

v3:
 * Use drm_driver.name.

v4:
 * Added drm-engine-capacity- tag.
 * Fix typo. (Umesh)

Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Cc: David M Nieto <David.Nieto@amd.com>
Cc: Christian König <christian.koenig@amd.com>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: Chris Healy <cphealy@gmail.com>
Acked-by: Christian König <christian.koenig@amd.com>
Reviewed-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
---
 Documentation/gpu/drm-usage-stats.rst  |  6 ++
 Documentation/gpu/i915.rst             | 28 +++++++++
 drivers/gpu/drm/i915/i915_driver.c     |  3 +
 drivers/gpu/drm/i915/i915_drm_client.c | 81 ++++++++++++++++++++++++++
 drivers/gpu/drm/i915/i915_drm_client.h |  4 ++
 5 files changed, 122 insertions(+)

diff --git a/Documentation/gpu/drm-usage-stats.rst b/Documentation/gpu/drm-usage-stats.rst
index b8cc28f4da6f..6c9f166a8d6f 100644
--- a/Documentation/gpu/drm-usage-stats.rst
+++ b/Documentation/gpu/drm-usage-stats.rst
@@ -104,3 +104,9 @@ object belong to this client, in the respective memory region.
 
 Default unit shall be bytes with optional unit specifiers of 'KiB' or 'MiB'
 indicating kibi- or mebi-bytes.
+
+===============================
+Driver specific implementations
+===============================
+
+:ref:`i915-usage-stats`
diff --git a/Documentation/gpu/i915.rst b/Documentation/gpu/i915.rst
index 0f08693d05cd..54060cd6c419 100644
--- a/Documentation/gpu/i915.rst
+++ b/Documentation/gpu/i915.rst
@@ -697,3 +697,31 @@ The style guide for ``i915_reg.h``.
 
 .. kernel-doc:: drivers/gpu/drm/i915/i915_reg.h
    :doc: The i915 register macro definition style guide
+
+.. _i915-usage-stats:
+
+i915 DRM client usage stats implementation
+==========================================
+
+The drm/i915 driver implements the DRM client usage stats specification as
+documented in :ref:`drm-client-usage-stats`.
+
+Example of the output showing the implemented key value pairs and entirety of
+the currently possible format options:
+
+::
+
+      pos:    0
+      flags:  0100002
+      mnt_id: 21
+      drm-driver: i915
+      drm-pdev:   0000:00:02.0
+      drm-client-id:      7
+      drm-engine-render:  9288864723 ns
+      drm-engine-copy:    2035071108 ns
+      drm-engine-video:   0 ns
+      drm-engine-capacity-video:   2
+      drm-engine-video-enhance:   0 ns
+
+Possible `drm-engine-` key names are: `render`, `copy`, `video` and
+`video-enhance`.
diff --git a/drivers/gpu/drm/i915/i915_driver.c b/drivers/gpu/drm/i915/i915_driver.c
index b2df273e6d7b..3ffb617d75c9 100644
--- a/drivers/gpu/drm/i915/i915_driver.c
+++ b/drivers/gpu/drm/i915/i915_driver.c
@@ -1745,6 +1745,9 @@ static const struct file_operations i915_driver_fops = {
 	.read = drm_read,
 	.compat_ioctl = i915_ioc32_compat_ioctl,
 	.llseek = noop_llseek,
+#ifdef CONFIG_PROC_FS
+	.show_fdinfo = i915_drm_client_fdinfo,
+#endif
 };
 
 static int
diff --git a/drivers/gpu/drm/i915/i915_drm_client.c b/drivers/gpu/drm/i915/i915_drm_client.c
index 91a8559bebf7..54b40f451959 100644
--- a/drivers/gpu/drm/i915/i915_drm_client.c
+++ b/drivers/gpu/drm/i915/i915_drm_client.c
@@ -7,7 +7,13 @@
 #include <linux/slab.h>
 #include <linux/types.h>
 
+#include <uapi/drm/i915_drm.h>
+
+#include <drm/drm_print.h>
+
+#include "gem/i915_gem_context.h"
 #include "i915_drm_client.h"
+#include "i915_file_private.h"
 #include "i915_gem.h"
 #include "i915_utils.h"
 
@@ -68,3 +74,78 @@ void i915_drm_clients_fini(struct i915_drm_clients *clients)
 	GEM_BUG_ON(!xa_empty(&clients->xarray));
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
+	const unsigned int capacity =
+		client->clients->i915->engine_uabi_class_count[class];
+	struct i915_gem_context *ctx;
+
+	rcu_read_lock();
+	list_for_each_entry_rcu(ctx, list, client_link)
+		total += busy_add(ctx, class);
+	rcu_read_unlock();
+
+	seq_printf(m, "drm-engine-%s:\t%llu ns\n",
+		   uabi_class_names[class], total);
+
+	if (capacity > 1)
+		seq_printf(m, "drm-engine-capacity-%s:\t%u\n",
+			   uabi_class_names[class],
+			   capacity);
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
+	/*
+	 * ******************************************************************
+	 * For text output format description please see drm-usage-stats.rst!
+	 * ******************************************************************
+	 */
+
+	seq_printf(m, "drm-driver:\t%s\n", i915->drm.driver->name);
+	seq_printf(m, "drm-pdev:\t%04x:%02x:%02x.%d\n",
+		   pci_domain_nr(pdev->bus), pdev->bus->number,
+		   PCI_SLOT(pdev->devfn), PCI_FUNC(pdev->devfn));
+	seq_printf(m, "drm-client-id:\t%u\n", client->id);
+
+	for (i = 0; i < ARRAY_SIZE(uabi_class_names); i++)
+		show_client_class(m, client, i);
+}
+#endif
diff --git a/drivers/gpu/drm/i915/i915_drm_client.h b/drivers/gpu/drm/i915/i915_drm_client.h
index 191368386ace..5f5b02b01ba0 100644
--- a/drivers/gpu/drm/i915/i915_drm_client.h
+++ b/drivers/gpu/drm/i915/i915_drm_client.h
@@ -59,6 +59,10 @@ static inline void i915_drm_client_put(struct i915_drm_client *client)
 
 struct i915_drm_client *i915_drm_client_add(struct i915_drm_clients *clients);
 
+#ifdef CONFIG_PROC_FS
+void i915_drm_client_fdinfo(struct seq_file *m, struct file *f);
+#endif
+
 void i915_drm_clients_fini(struct i915_drm_clients *clients);
 
 #endif /* !__I915_DRM_CLIENT_H__ */
-- 
2.32.0

