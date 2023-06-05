Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 069907225E6
	for <lists+dri-devel@lfdr.de>; Mon,  5 Jun 2023 14:32:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AFAC410E297;
	Mon,  5 Jun 2023 12:32:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE9D910E294;
 Mon,  5 Jun 2023 12:32:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1685968356; x=1717504356;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=syiI6Kh2C4vB5AfskY0vJw9UpNYCLktX5ZLl8vn/Xm0=;
 b=TvXcLvn7X4a+w7jTrxjbWo1rMlaRGTl7gkKI/NO6qPQKDZTqqvXGl7UU
 /T+FJ9oOgwjCWhuURtORmhRFrVaNO8XrkLI6f2Noi1fmk02yH4Q5aJcnv
 Zrx/skff5wsjjxfmyXUs+kCVCB9C29W1gl7kPOOzLOkW7f10CWowG34wQ
 3M1SGKgXWN6mkSYDlcGzu+dyvVA6bvLqBmItGKh38sgDzq8H9/vyGvUDU
 5GzcsflczbgtmxlMstr0XgrHMcoMQrr+gl2mPshYLjlPGEW+f+7oZy546
 +oKvAmv58A9cZmDNpvXnqqeW32/IUq0LZ2e4MliVu+flQz7BBMkhkhCTj w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10731"; a="356366132"
X-IronPort-AV: E=Sophos;i="6.00,217,1681196400"; d="scan'208";a="356366132"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jun 2023 05:32:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10731"; a="832787714"
X-IronPort-AV: E=Sophos;i="6.00,217,1681196400"; d="scan'208";a="832787714"
Received: from mloughma-mobl1.ger.corp.intel.com (HELO localhost.localdomain)
 ([10.213.238.159])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jun 2023 05:32:34 -0700
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
To: Intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/i915: Use the fdinfo helper
Date: Mon,  5 Jun 2023 13:32:24 +0100
Message-Id: <20230605123224.373633-1-tvrtko.ursulin@linux.intel.com>
X-Mailer: git-send-email 2.39.2
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
Cc: Rob Clark <robdclark@chromium.org>,
 Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>

Use the common fdinfo helper for printing the basics. Remove now unused
client id allocation code.

Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Cc: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/i915/i915_driver.c     |  6 +--
 drivers/gpu/drm/i915/i915_drm_client.c | 65 ++++----------------------
 drivers/gpu/drm/i915/i915_drm_client.h | 22 ++-------
 drivers/gpu/drm/i915/i915_drv.h        |  2 -
 drivers/gpu/drm/i915/i915_gem.c        |  6 +--
 5 files changed, 18 insertions(+), 83 deletions(-)

diff --git a/drivers/gpu/drm/i915/i915_driver.c b/drivers/gpu/drm/i915/i915_driver.c
index 8e92649124d4..97244541ec28 100644
--- a/drivers/gpu/drm/i915/i915_driver.c
+++ b/drivers/gpu/drm/i915/i915_driver.c
@@ -243,8 +243,6 @@ static int i915_driver_early_probe(struct drm_i915_private *dev_priv)
 	if (ret < 0)
 		goto err_rootgt;
 
-	i915_drm_clients_init(&dev_priv->clients, dev_priv);
-
 	i915_gem_init_early(dev_priv);
 
 	/* This must be called before any calls to HAS_PCH_* */
@@ -278,7 +276,6 @@ static void i915_driver_late_release(struct drm_i915_private *dev_priv)
 	intel_power_domains_cleanup(dev_priv);
 	i915_gem_cleanup_early(dev_priv);
 	intel_gt_driver_late_release_all(dev_priv);
-	i915_drm_clients_fini(&dev_priv->clients);
 	intel_region_ttm_device_fini(dev_priv);
 	vlv_suspend_cleanup(dev_priv);
 	i915_workqueues_cleanup(dev_priv);
@@ -1706,7 +1703,7 @@ static const struct file_operations i915_driver_fops = {
 	.compat_ioctl = i915_ioc32_compat_ioctl,
 	.llseek = noop_llseek,
 #ifdef CONFIG_PROC_FS
-	.show_fdinfo = i915_drm_client_fdinfo,
+	.show_fdinfo = drm_show_fdinfo,
 #endif
 };
 
@@ -1806,6 +1803,7 @@ static const struct drm_driver i915_drm_driver = {
 	.open = i915_driver_open,
 	.lastclose = i915_driver_lastclose,
 	.postclose = i915_driver_postclose,
+	.show_fdinfo = i915_drm_client_fdinfo,
 
 	.prime_handle_to_fd = drm_gem_prime_handle_to_fd,
 	.prime_fd_to_handle = drm_gem_prime_fd_to_handle,
diff --git a/drivers/gpu/drm/i915/i915_drm_client.c b/drivers/gpu/drm/i915/i915_drm_client.c
index d18d0a3ed905..2a44b3876cb5 100644
--- a/drivers/gpu/drm/i915/i915_drm_client.c
+++ b/drivers/gpu/drm/i915/i915_drm_client.c
@@ -17,64 +17,29 @@
 #include "i915_gem.h"
 #include "i915_utils.h"
 
-void i915_drm_clients_init(struct i915_drm_clients *clients,
-			   struct drm_i915_private *i915)
-{
-	clients->i915 = i915;
-	clients->next_id = 0;
-
-	xa_init_flags(&clients->xarray, XA_FLAGS_ALLOC | XA_FLAGS_LOCK_IRQ);
-}
-
-struct i915_drm_client *i915_drm_client_add(struct i915_drm_clients *clients)
+struct i915_drm_client *i915_drm_client_alloc(void)
 {
 	struct i915_drm_client *client;
-	struct xarray *xa = &clients->xarray;
-	int ret;
 
 	client = kzalloc(sizeof(*client), GFP_KERNEL);
 	if (!client)
-		return ERR_PTR(-ENOMEM);
-
-	xa_lock_irq(xa);
-	ret = __xa_alloc_cyclic(xa, &client->id, client, xa_limit_32b,
-				&clients->next_id, GFP_KERNEL);
-	xa_unlock_irq(xa);
-	if (ret < 0)
-		goto err;
+		return NULL;
 
 	kref_init(&client->kref);
 	spin_lock_init(&client->ctx_lock);
 	INIT_LIST_HEAD(&client->ctx_list);
-	client->clients = clients;
 
 	return client;
-
-err:
-	kfree(client);
-
-	return ERR_PTR(ret);
 }
 
 void __i915_drm_client_free(struct kref *kref)
 {
 	struct i915_drm_client *client =
 		container_of(kref, typeof(*client), kref);
-	struct xarray *xa = &client->clients->xarray;
-	unsigned long flags;
 
-	xa_lock_irqsave(xa, flags);
-	__xa_erase(xa, client->id);
-	xa_unlock_irqrestore(xa, flags);
 	kfree(client);
 }
 
-void i915_drm_clients_fini(struct i915_drm_clients *clients)
-{
-	GEM_BUG_ON(!xa_empty(&clients->xarray));
-	xa_destroy(&clients->xarray);
-}
-
 #ifdef CONFIG_PROC_FS
 static const char * const uabi_class_names[] = {
 	[I915_ENGINE_CLASS_RENDER] = "render",
@@ -101,38 +66,34 @@ static u64 busy_add(struct i915_gem_context *ctx, unsigned int class)
 }
 
 static void
-show_client_class(struct seq_file *m,
+show_client_class(struct drm_printer *p,
+		  struct drm_i915_private *i915,
 		  struct i915_drm_client *client,
 		  unsigned int class)
 {
-	const struct list_head *list = &client->ctx_list;
+	const unsigned int capacity = i915->engine_uabi_class_count[class];
 	u64 total = atomic64_read(&client->past_runtime[class]);
-	const unsigned int capacity =
-		client->clients->i915->engine_uabi_class_count[class];
 	struct i915_gem_context *ctx;
 
 	rcu_read_lock();
-	list_for_each_entry_rcu(ctx, list, client_link)
+	list_for_each_entry_rcu(ctx, &client->ctx_list, client_link)
 		total += busy_add(ctx, class);
 	rcu_read_unlock();
 
 	if (capacity)
-		seq_printf(m, "drm-engine-%s:\t%llu ns\n",
+		drm_printf(p, "drm-engine-%s:\t%llu ns\n",
 			   uabi_class_names[class], total);
 
 	if (capacity > 1)
-		seq_printf(m, "drm-engine-capacity-%s:\t%u\n",
+		drm_printf(p, "drm-engine-capacity-%s:\t%u\n",
 			   uabi_class_names[class],
 			   capacity);
 }
 
-void i915_drm_client_fdinfo(struct seq_file *m, struct file *f)
+void i915_drm_client_fdinfo(struct drm_printer *p, struct drm_file *file)
 {
-	struct drm_file *file = f->private_data;
 	struct drm_i915_file_private *file_priv = file->driver_priv;
 	struct drm_i915_private *i915 = file_priv->i915;
-	struct i915_drm_client *client = file_priv->client;
-	struct pci_dev *pdev = to_pci_dev(i915->drm.dev);
 	unsigned int i;
 
 	/*
@@ -141,16 +102,10 @@ void i915_drm_client_fdinfo(struct seq_file *m, struct file *f)
 	 * ******************************************************************
 	 */
 
-	seq_printf(m, "drm-driver:\t%s\n", i915->drm.driver->name);
-	seq_printf(m, "drm-pdev:\t%04x:%02x:%02x.%d\n",
-		   pci_domain_nr(pdev->bus), pdev->bus->number,
-		   PCI_SLOT(pdev->devfn), PCI_FUNC(pdev->devfn));
-	seq_printf(m, "drm-client-id:\t%u\n", client->id);
-
 	if (GRAPHICS_VER(i915) < 8)
 		return;
 
 	for (i = 0; i < ARRAY_SIZE(uabi_class_names); i++)
-		show_client_class(m, client, i);
+		show_client_class(p, i915, file_priv->client, i);
 }
 #endif
diff --git a/drivers/gpu/drm/i915/i915_drm_client.h b/drivers/gpu/drm/i915/i915_drm_client.h
index 69496af996d9..4c18b99e10a4 100644
--- a/drivers/gpu/drm/i915/i915_drm_client.h
+++ b/drivers/gpu/drm/i915/i915_drm_client.h
@@ -9,20 +9,13 @@
 #include <linux/kref.h>
 #include <linux/list.h>
 #include <linux/spinlock.h>
-#include <linux/xarray.h>
 
 #include <uapi/drm/i915_drm.h>
 
 #define I915_LAST_UABI_ENGINE_CLASS I915_ENGINE_CLASS_COMPUTE
 
-struct drm_i915_private;
-
-struct i915_drm_clients {
-	struct drm_i915_private *i915;
-
-	struct xarray xarray;
-	u32 next_id;
-};
+struct drm_file;
+struct drm_printer;
 
 struct i915_drm_client {
 	struct kref kref;
@@ -32,17 +25,12 @@ struct i915_drm_client {
 	spinlock_t ctx_lock; /* For add/remove from ctx_list. */
 	struct list_head ctx_list; /* List of contexts belonging to client. */
 
-	struct i915_drm_clients *clients;
-
 	/**
 	 * @past_runtime: Accumulation of pphwsp runtimes from closed contexts.
 	 */
 	atomic64_t past_runtime[I915_LAST_UABI_ENGINE_CLASS + 1];
 };
 
-void i915_drm_clients_init(struct i915_drm_clients *clients,
-			   struct drm_i915_private *i915);
-
 static inline struct i915_drm_client *
 i915_drm_client_get(struct i915_drm_client *client)
 {
@@ -57,12 +45,10 @@ static inline void i915_drm_client_put(struct i915_drm_client *client)
 	kref_put(&client->kref, __i915_drm_client_free);
 }
 
-struct i915_drm_client *i915_drm_client_add(struct i915_drm_clients *clients);
+struct i915_drm_client *i915_drm_client_alloc(void);
 
 #ifdef CONFIG_PROC_FS
-void i915_drm_client_fdinfo(struct seq_file *m, struct file *f);
+void i915_drm_client_fdinfo(struct drm_printer *p, struct drm_file *file);
 #endif
 
-void i915_drm_clients_fini(struct i915_drm_clients *clients);
-
 #endif /* !__I915_DRM_CLIENT_H__ */
diff --git a/drivers/gpu/drm/i915/i915_drv.h b/drivers/gpu/drm/i915/i915_drv.h
index f1205ed3ba71..812665ad78d2 100644
--- a/drivers/gpu/drm/i915/i915_drv.h
+++ b/drivers/gpu/drm/i915/i915_drv.h
@@ -348,8 +348,6 @@ struct drm_i915_private {
 
 	struct i915_pmu pmu;
 
-	struct i915_drm_clients clients;
-
 	/* The TTM device structure. */
 	struct ttm_device bdev;
 
diff --git a/drivers/gpu/drm/i915/i915_gem.c b/drivers/gpu/drm/i915/i915_gem.c
index e70b762f0b03..1f65bb33dd21 100644
--- a/drivers/gpu/drm/i915/i915_gem.c
+++ b/drivers/gpu/drm/i915/i915_gem.c
@@ -1325,11 +1325,9 @@ int i915_gem_open(struct drm_i915_private *i915, struct drm_file *file)
 	if (!file_priv)
 		goto err_alloc;
 
-	client = i915_drm_client_add(&i915->clients);
-	if (IS_ERR(client)) {
-		ret = PTR_ERR(client);
+	client = i915_drm_client_alloc();
+	if (!client)
 		goto err_client;
-	}
 
 	file->driver_priv = file_priv;
 	file_priv->i915 = i915;
-- 
2.39.2

