Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F0A84246CE
	for <lists+dri-devel@lfdr.de>; Wed,  6 Oct 2021 21:38:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB7F86EE27;
	Wed,  6 Oct 2021 19:38:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com
 [IPv6:2607:f8b0:4864:20::1035])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 026AC6EE23
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Oct 2021 19:38:25 +0000 (UTC)
Received: by mail-pj1-x1035.google.com with SMTP id np13so3000970pjb.4
 for <dri-devel@lists.freedesktop.org>; Wed, 06 Oct 2021 12:38:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=+Fh4eZ4nhLD6dey+QkqT8RQFJAmJG3+/mUvwCraPJo0=;
 b=D6ByiqYQEowAOeMD9tfU92iyZNu38wtprt9w3RsS9gc32lW38iEEyLMPm76g72X1OR
 7z9NNrP+cqKgRtjtNz/3QYpluvfTw7YJmlnCVhXdjtLKgAoAeQ2bjJd8Jo52pqIVFQkE
 kKN4mmToNGea01iVGKe37rrRLAAuxYFKcxjrw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=+Fh4eZ4nhLD6dey+QkqT8RQFJAmJG3+/mUvwCraPJo0=;
 b=pQ8I+m5BG9Y/n5EgMpWYeNLV9jTncFSrnrPUYYCDPQndnm0n8B2eTYf+36vKBpq+BK
 eYzd1YuI2nyh0MRpV5lIn6jD33EsPaFzhJ/Sh1OJ5P/fsQVtEQr+L/6tIWwfyS7f26bo
 RNMHLxxfH/V24ENJErIIOvb5MHVOBRe5n9yWWkn1qlfAmlfZCsaJ5nMyBz9vQllcRAij
 wVeYjSd1llV2YkLiczwtLTfZGbzAEl5p+mxcYhZAT6QLaHGVvXqlJXziceieowanFFZs
 ciN8F/kpZkNVkntul086j7BmTuAteACHy8QRg0TIMPw6oqEoGFPOyePLvSPo2Q1HQGF/
 edMg==
X-Gm-Message-State: AOAM530jHQxP/PXd/tP6ERiBVQiyKX03/481D9tK4AuSi2tfZYfGjGc0
 grIcqSpGwq+DzEguPd6FJoBgew==
X-Google-Smtp-Source: ABdhPJzXE7em0C7M7X2aV04KXnms71d8d05kQYtaYvSDzEXtX2JJLSGg0XbLoBAK13zI+ShB1tDx/A==
X-Received: by 2002:a17:90a:be14:: with SMTP id
 a20mr618372pjs.41.1633549105458; 
 Wed, 06 Oct 2021 12:38:25 -0700 (PDT)
Received: from smtp.gmail.com ([2620:15c:202:201:d412:c5eb:4aca:4738])
 by smtp.gmail.com with ESMTPSA id o14sm22011296pfh.84.2021.10.06.12.38.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Oct 2021 12:38:25 -0700 (PDT)
From: Stephen Boyd <swboyd@chromium.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 "Rafael J. Wysocki" <rafael@kernel.org>, Rob Clark <robdclark@gmail.com>,
 Russell King <rmk+kernel@arm.linux.org.uk>,
 Saravana Kannan <saravanak@google.com>
Subject: [PATCH v2 02/34] component: Introduce the aggregate bus_type
Date: Wed,  6 Oct 2021 12:37:47 -0700
Message-Id: <20211006193819.2654854-3-swboyd@chromium.org>
X-Mailer: git-send-email 2.33.0.800.g4c38ced690-goog
In-Reply-To: <20211006193819.2654854-1-swboyd@chromium.org>
References: <20211006193819.2654854-1-swboyd@chromium.org>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The component driver only provides 'bind' and 'unbind' callbacks to tell
the host driver that it is time to assemble the aggregate driver now
that all the components have probed. The component driver model doesn't
attempt to resolve runtime PM or suspend/resume ordering, and explicitly
mentions this in the code. This lack of support leads to some pretty
gnarly usages of the 'prepare' and 'complete' power management hooks in
drivers that host the aggregate device, and it fully breaks down when
faced with ordering shutdown between the various components, the
aggregate driver, and the host driver that registers the whole thing.

In a concrete example, the MSM display driver at drivers/gpu/drm/msm is
using 'prepare' and 'complete' to call the drm helpers
drm_mode_config_helper_suspend() and drm_mode_config_helper_resume()
respectively, so that it can move the aggregate driver suspend/resume
callbacks to be before and after the components that make up the drm
device call any suspend/resume hooks they have. This only works as long
as the component devices don't do anything in their own 'prepare' and
'complete' callbacks. If they did, then the ordering would be incorrect
and we would be doing something in the component drivers before the
aggregate driver could do anything. Yuck!

Similarly, when trying to add shutdown support to the MSM driver we run
across a problem where we're trying to shutdown the drm device via
drm_atomic_helper_shutdown(), but some of the devices in the encoder
chain have already been shutdown. This time, the component devices
aren't the problem (although they could be if they did anything in their
shutdown callbacks), but there's a DSI to eDP bridge in the encoder
chain that has already been shutdown before the driver hosting the
aggregate device runs shutdown. The ordering of driver probe is like
this:

 1. msm_pdev_probe() (host driver)
 2. DSI bridge
 3. aggregate bind

When it comes to shutdown we have this order:

 1. DSI bridge
 2. msm_pdev_shutdown() (host driver)

and so the bridge is already off, but we want to communicate to it to
turn things off on the display during msm_pdev_shutdown(). Double yuck!
Unfortunately, this time we can't split shutdown into multiple phases
and swap msm_pdev_shutdown() with the DSI bridge.

Let's make the component driver into an actual device driver that has
probe/remove/shutdown functions. The driver will only be bound to the
aggregate device once all component drivers have called component_add()
to indicate they're ready to assemble the aggregate driver. This allows
us to attach shutdown logic (and in the future runtime PM logic) to the
aggregate driver so that it runs the hooks in the correct order.

Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>
Cc: Rob Clark <robdclark@gmail.com>
Cc: Russell King <rmk+kernel@arm.linux.org.uk>
Cc: Saravana Kannan <saravanak@google.com>
Signed-off-by: Stephen Boyd <swboyd@chromium.org>
---
 drivers/base/component.c  | 454 +++++++++++++++++++++++++++-----------
 include/linux/component.h |  62 +++++-
 2 files changed, 381 insertions(+), 135 deletions(-)

diff --git a/drivers/base/component.c b/drivers/base/component.c
index 0a41bbe14981..d99e99cabb99 100644
--- a/drivers/base/component.c
+++ b/drivers/base/component.c
@@ -15,6 +15,9 @@
 #include <linux/mutex.h>
 #include <linux/slab.h>
 #include <linux/debugfs.h>
+#include <linux/pm_runtime.h>
+
+#include "base.h"
 
 /**
  * DOC: overview
@@ -38,8 +41,8 @@
  *
  * Aggregate drivers first assemble a component match list of what they need
  * using component_match_add(). This is then registered as an aggregate driver
- * using component_master_add_with_match(), and unregistered using
- * component_master_del().
+ * using component_aggregate_register(), and unregistered using
+ * component_aggregate_unregister().
  */
 
 struct component;
@@ -60,17 +63,20 @@ struct component_match {
 };
 
 struct aggregate_device {
-	struct list_head node;
-	bool bound;
-
 	const struct component_master_ops *ops;
 	struct device *parent;
 	struct device dev;
 	struct component_match *match;
+	struct aggregate_driver *adrv;
 
 	int id;
 };
 
+static inline struct aggregate_device *to_aggregate_device(struct device *d)
+{
+	return container_of(d, struct aggregate_device, dev);
+}
+
 struct component {
 	struct list_head node;
 	struct aggregate_device *adev;
@@ -79,11 +85,11 @@ struct component {
 	const struct component_ops *ops;
 	int subcomponent;
 	struct device *dev;
+	struct device_link *link;
 };
 
 static DEFINE_MUTEX(component_mutex);
 static LIST_HEAD(component_list);
-static LIST_HEAD(aggregate_devices);
 
 static DEFINE_IDA(aggregate_ida);
 
@@ -101,7 +107,7 @@ static int component_devices_show(struct seq_file *s, void *data)
 	seq_printf(s, "%-40s %20s\n", "aggregate_device name", "status");
 	seq_puts(s, "-------------------------------------------------------------\n");
 	seq_printf(s, "%-40s %20s\n\n",
-		   dev_name(m->parent), m->bound ? "bound" : "not bound");
+		   dev_name(m->parent), m->dev.driver ? "bound" : "not bound");
 
 	seq_printf(s, "%-40s %20s\n", "device name", "status");
 	seq_puts(s, "-------------------------------------------------------------\n");
@@ -149,16 +155,21 @@ static void component_master_debugfs_del(struct aggregate_device *m)
 
 #endif
 
-static struct aggregate_device *__aggregate_find(struct device *parent,
-	const struct component_master_ops *ops)
+struct aggregate_bus_find_data {
+	const struct component_master_ops *ops;
+	struct device *parent;
+};
+
+static int aggregate_bus_find_match(struct device *dev, const void *_data)
 {
-	struct aggregate_device *m;
+	struct aggregate_device *adev = to_aggregate_device(dev);
+	const struct aggregate_bus_find_data *data = _data;
 
-	list_for_each_entry(m, &aggregate_devices, node)
-		if (m->parent == parent && (!ops || m->ops == ops))
-			return m;
+	if (adev->parent == data->parent &&
+	    (!data->ops || adev->ops == data->ops))
+		return 1;
 
-	return NULL;
+	return 0;
 }
 
 static struct component *find_component(struct aggregate_device *adev,
@@ -185,7 +196,6 @@ static int find_components(struct aggregate_device *adev)
 {
 	struct component_match *match = adev->match;
 	size_t i;
-	int ret = 0;
 
 	/*
 	 * Scan the array of match functions and attach
@@ -194,6 +204,7 @@ static int find_components(struct aggregate_device *adev)
 	for (i = 0; i < match->num; i++) {
 		struct component_match_array *mc = &match->compare[i];
 		struct component *c;
+		bool duplicate;
 
 		dev_dbg(adev->parent, "Looking for component %zu\n", i);
 
@@ -201,20 +212,27 @@ static int find_components(struct aggregate_device *adev)
 			continue;
 
 		c = find_component(adev, mc);
-		if (!c) {
-			ret = -ENXIO;
-			break;
-		}
+		if (!c)
+			return 0;
 
+		duplicate = !!c->adev;
 		dev_dbg(adev->parent, "found component %s, duplicate %u\n",
-			dev_name(c->dev), !!c->adev);
+			dev_name(c->dev), duplicate);
 
 		/* Attach this component to the adev */
-		match->compare[i].duplicate = !!c->adev;
+		match->compare[i].duplicate = duplicate;
 		match->compare[i].component = c;
+		if (duplicate)
+			continue;
+
+		/* Matches put in component_del() */
+		get_device(&adev->dev);
+		c->link = device_link_add(&adev->dev, c->dev,
+					  DL_FLAG_STATELESS | DL_FLAG_PM_RUNTIME);
 		c->adev = adev;
 	}
-	return ret;
+
+	return 1;
 }
 
 /* Detach component from associated aggregate_device */
@@ -228,72 +246,6 @@ static void remove_component(struct aggregate_device *adev, struct component *c)
 			adev->match->compare[i].component = NULL;
 }
 
-/*
- * Try to bring up an aggregate device.  If component is NULL, we're interested
- * in this aggregate device, otherwise it's a component which must be present
- * to try and bring up the aggregate device.
- *
- * Returns 1 for successful bringup, 0 if not ready, or -ve errno.
- */
-static int try_to_bring_up_aggregate_device(struct aggregate_device *adev,
-	struct component *component)
-{
-	int ret;
-
-	dev_dbg(adev->parent, "trying to bring up adev\n");
-
-	if (find_components(adev)) {
-		dev_dbg(adev->parent, "master has incomplete components\n");
-		return 0;
-	}
-
-	if (component && component->adev != adev) {
-		dev_dbg(adev->parent, "master is not for this component (%s)\n",
-			dev_name(component->dev));
-		return 0;
-	}
-
-	if (!devres_open_group(adev->parent, NULL, GFP_KERNEL))
-		return -ENOMEM;
-
-	/* Found all components */
-	ret = adev->ops->bind(adev->parent);
-	if (ret < 0) {
-		devres_release_group(adev->parent, NULL);
-		if (ret != -EPROBE_DEFER)
-			dev_info(adev->parent, "adev bind failed: %d\n", ret);
-		return ret;
-	}
-
-	adev->bound = true;
-	return 1;
-}
-
-static int try_to_bring_up_masters(struct component *component)
-{
-	struct aggregate_device *adev;
-	int ret = 0;
-
-	list_for_each_entry(adev, &aggregate_devices, node) {
-		if (!adev->bound) {
-			ret = try_to_bring_up_aggregate_device(adev, component);
-			if (ret != 0)
-				break;
-		}
-	}
-
-	return ret;
-}
-
-static void take_down_aggregate_device(struct aggregate_device *adev)
-{
-	if (adev->bound) {
-		adev->ops->unbind(adev->parent);
-		devres_release_group(adev->parent, NULL);
-		adev->bound = false;
-	}
-}
-
 static void devm_component_match_release(struct device *parent, void *res)
 {
 	struct component_match *match = res;
@@ -437,7 +389,6 @@ static void free_aggregate_device(struct aggregate_device *adev)
 	int i;
 
 	component_master_debugfs_del(adev);
-	list_del(&adev->node);
 
 	if (match) {
 		for (i = 0; i < match->num; i++) {
@@ -451,20 +402,143 @@ static void free_aggregate_device(struct aggregate_device *adev)
 	kfree(adev);
 }
 
-/**
- * component_master_add_with_match - register an aggregate driver
- * @parent: parent device of the aggregate driver
- * @ops: callbacks for the aggregate driver
- * @match: component match list for the aggregate driver
- *
- * Registers a new aggregate driver consisting of the components added to @match
- * by calling one of the component_match_add() functions. Once all components in
- * @match are available, it will be assembled by calling
- * &component_master_ops.bind from @ops. Must be unregistered by calling
- * component_master_del().
- */
-int component_master_add_with_match(struct device *parent,
-	const struct component_master_ops *ops,
+static void aggregate_device_release(struct device *dev)
+{
+	struct aggregate_device *adev = to_aggregate_device(dev);
+
+	free_aggregate_device(adev);
+}
+
+static int aggregate_device_match(struct device *dev, struct device_driver *drv)
+{
+	const struct aggregate_driver *adrv = to_aggregate_driver(drv);
+	struct aggregate_device *adev = to_aggregate_device(dev);
+	int ret;
+
+	/* Is this driver associated with this device */
+	if (adrv != adev->adrv)
+		return 0;
+
+	/* Should we start to assemble? */
+	mutex_lock(&component_mutex);
+	ret = find_components(adev);
+	mutex_unlock(&component_mutex);
+
+	return ret;
+}
+
+/* TODO: Remove once all aggregate drivers use component_aggregate_register() */
+static int component_probe_bind(struct aggregate_device *adev)
+{
+	return adev->ops->bind(adev->parent);
+}
+
+static void component_remove_unbind(struct aggregate_device *adev)
+{
+	adev->ops->unbind(adev->parent);
+}
+
+static int aggregate_driver_probe(struct device *dev)
+{
+	const struct aggregate_driver *adrv = to_aggregate_driver(dev->driver);
+	struct aggregate_device *adev = to_aggregate_device(dev);
+	bool modern = adrv->probe != component_probe_bind;
+	int ret;
+
+	/* Only do runtime PM when drivers migrate */
+	if (modern) {
+		pm_runtime_get_noresume(dev);
+		pm_runtime_set_active(dev);
+		pm_runtime_enable(dev);
+	}
+
+	mutex_lock(&component_mutex);
+	if (devres_open_group(adev->parent, NULL, GFP_KERNEL)) {
+		ret = adrv->probe(adev);
+		if (ret)
+			devres_release_group(adev->parent, NULL);
+	} else {
+		ret = -ENOMEM;
+	}
+	mutex_unlock(&component_mutex);
+
+	if (ret && modern) {
+		pm_runtime_disable(dev);
+		pm_runtime_set_suspended(dev);
+		pm_runtime_put_noidle(dev);
+	}
+
+	return ret;
+}
+
+static int aggregate_driver_remove(struct device *dev)
+{
+	const struct aggregate_driver *adrv = to_aggregate_driver(dev->driver);
+	struct aggregate_device *adev = to_aggregate_device(dev);
+	bool modern = adrv->remove != component_remove_unbind;
+
+	/* Only do runtime PM when drivers migrate */
+	if (modern)
+		pm_runtime_get_sync(dev);
+	adrv->remove(to_aggregate_device(dev));
+	devres_release_group(adev->parent, NULL);
+	if (!modern)
+		return 0;
+
+	pm_runtime_put_noidle(dev);
+
+	pm_runtime_disable(dev);
+	pm_runtime_set_suspended(dev);
+	pm_runtime_put_noidle(dev);
+
+	return 0;
+}
+
+static void aggregate_driver_shutdown(struct device *dev)
+{
+	const struct aggregate_driver *adrv = to_aggregate_driver(dev->driver);
+
+	if (adrv && adrv->shutdown)
+		adrv->shutdown(to_aggregate_device(dev));
+}
+
+static struct bus_type aggregate_bus_type = {
+	.name		= "aggregate",
+	.match		= aggregate_device_match,
+	.probe		= aggregate_driver_probe,
+	.remove		= aggregate_driver_remove,
+	.shutdown	= aggregate_driver_shutdown,
+};
+
+/* Callers take ownership of return value, should call put_device() */
+static struct aggregate_device *__aggregate_find(struct device *parent,
+	const struct component_master_ops *ops)
+{
+	struct device *dev;
+	struct aggregate_bus_find_data data = {
+		.ops = ops,
+		.parent = parent,
+	};
+
+	dev = bus_find_device(&aggregate_bus_type, NULL, &data,
+			      aggregate_bus_find_match);
+
+	return dev ? to_aggregate_device(dev) : NULL;
+}
+
+static int aggregate_driver_register(struct aggregate_driver *adrv)
+{
+	adrv->driver.bus = &aggregate_bus_type;
+	return driver_register(&adrv->driver);
+}
+
+static void aggregate_driver_unregister(struct aggregate_driver *adrv)
+{
+	driver_unregister(&adrv->driver);
+}
+
+static struct aggregate_device *aggregate_device_add(struct device *parent,
+	const struct component_master_ops *ops, struct aggregate_driver *adrv,
 	struct component_match *match)
 {
 	struct aggregate_device *adev;
@@ -473,40 +547,114 @@ int component_master_add_with_match(struct device *parent,
 	/* Reallocate the match array for its true size */
 	ret = component_match_realloc(match, match->num);
 	if (ret)
-		return ret;
+		return ERR_PTR(ret);
 
 	adev = kzalloc(sizeof(*adev), GFP_KERNEL);
 	if (!adev)
-		return -ENOMEM;
+		return ERR_PTR(-ENOMEM);
 
 	id = ida_alloc(&aggregate_ida, GFP_KERNEL);
 	if (id < 0) {
 		kfree(adev);
-		return id;
+		return ERR_PTR(id);
 	}
 
 	adev->id = id;
 	adev->parent = parent;
+	adev->dev.bus = &aggregate_bus_type;
+	adev->dev.release = aggregate_device_release;
 	adev->ops = ops;
 	adev->match = match;
+	adev->adrv = adrv;
 	dev_set_name(&adev->dev, "aggregate%d", id);
 
+	ret = device_register(&adev->dev);
+	if (ret) {
+		put_device(&adev->dev);
+		return ERR_PTR(ret);
+	}
+
 	component_master_debugfs_add(adev);
-	/* Add to the list of available aggregate devices. */
-	mutex_lock(&component_mutex);
-	list_add(&adev->node, &aggregate_devices);
 
-	ret = try_to_bring_up_aggregate_device(adev, NULL);
+	return adev;
+}
+
+/**
+ * component_master_add_with_match - register an aggregate driver
+ * @parent: parent device of the aggregate driver
+ * @ops: callbacks for the aggregate driver
+ * @match: component match list for the aggregate driver
+ *
+ * Registers a new aggregate driver consisting of the components added to @match
+ * by calling one of the component_match_add() functions. Once all components in
+ * @match are available, it will be assembled by calling
+ * &component_master_ops.bind from @ops. Must be unregistered by calling
+ * component_master_del().
+ *
+ * Deprecated: Use component_aggregate_register() instead.
+ */
+int component_master_add_with_match(struct device *parent,
+	const struct component_master_ops *ops,
+	struct component_match *match)
+{
+	struct aggregate_driver *adrv;
+	struct aggregate_device *adev;
+	int ret = 0;
+
+	adrv = kzalloc(sizeof(*adrv), GFP_KERNEL);
+	if (!adrv)
+		return -ENOMEM;
 
-	if (ret < 0)
-		free_aggregate_device(adev);
+	adev = aggregate_device_add(parent, ops, adrv, match);
+	if (IS_ERR(adev)) {
+		ret = PTR_ERR(adev);
+		goto err;
+	}
 
-	mutex_unlock(&component_mutex);
+	adrv->probe = component_probe_bind;
+	adrv->remove = component_remove_unbind;
+	adrv->driver.owner = THIS_MODULE;
+	adrv->driver.name = dev_name(&adev->dev);
+
+	ret = aggregate_driver_register(adrv);
+	if (!ret)
+		return 0;
 
-	return ret < 0 ? ret : 0;
+	put_device(&adev->dev);
+err:
+	kfree(adrv);
+	return ret;
 }
 EXPORT_SYMBOL_GPL(component_master_add_with_match);
 
+/**
+ * component_aggregate_register - register an aggregate driver
+ * @parent: parent device of the aggregate driver
+ * @adrv: aggregate driver to register
+ *
+ * Registers a new aggregate driver consisting of the components added to @adrv.match
+ * by calling one of the component_match_add() functions. Once all components in
+ * @match are available, the aggregate driver will be assembled by calling
+ * &adrv.bind. Must be unregistered by calling component_aggregate_unregister().
+ */
+int component_aggregate_register(struct device *parent,
+	struct aggregate_driver *adrv, struct component_match *match)
+{
+	struct aggregate_device *adev;
+	int ret;
+
+	adev = aggregate_device_add(parent, NULL, adrv, match);
+	if (IS_ERR(adev))
+		return PTR_ERR(adev);
+
+	ret = aggregate_driver_register(adrv);
+	if (ret)
+		put_device(&adev->dev);
+
+	return ret;
+}
+EXPORT_SYMBOL_GPL(component_aggregate_register);
+
 /**
  * component_master_del - unregister an aggregate driver
  * @parent: parent device of the aggregate driver
@@ -515,22 +663,60 @@ EXPORT_SYMBOL_GPL(component_master_add_with_match);
  * Unregisters an aggregate driver registered with
  * component_master_add_with_match(). If necessary the aggregate driver is first
  * disassembled by calling &component_master_ops.unbind from @ops.
+ *
+ * Deprecated: Use component_aggregate_unregister() instead.
  */
 void component_master_del(struct device *parent,
 	const struct component_master_ops *ops)
 {
 	struct aggregate_device *adev;
+	struct aggregate_driver *adrv;
+	struct device_driver *drv;
 
 	mutex_lock(&component_mutex);
 	adev = __aggregate_find(parent, ops);
+	mutex_unlock(&component_mutex);
+
 	if (adev) {
-		take_down_aggregate_device(adev);
-		free_aggregate_device(adev);
+		drv = adev->dev.driver;
+		if (drv) {
+			adrv = to_aggregate_driver(drv);
+			aggregate_driver_unregister(adrv);
+			kfree(adrv);
+		}
+
+		device_unregister(&adev->dev);
 	}
-	mutex_unlock(&component_mutex);
+	put_device(&adev->dev);
 }
 EXPORT_SYMBOL_GPL(component_master_del);
 
+/**
+ * component_aggregate_unregister - unregister an aggregate driver
+ * @parent: parent device of the aggregate driver
+ * @adrv: registered aggregate driver
+ *
+ * Unregisters an aggregate driver registered with
+ * component_aggregate_register(). If necessary the aggregate driver is first
+ * disassembled.
+ */
+void component_aggregate_unregister(struct device *parent,
+	struct aggregate_driver *adrv)
+{
+	struct aggregate_device *adev;
+
+	mutex_lock(&component_mutex);
+	adev = __aggregate_find(parent, NULL);
+	mutex_unlock(&component_mutex);
+
+	if (adev)
+		device_unregister(&adev->dev);
+	put_device(&adev->dev);
+
+	aggregate_driver_unregister(adrv);
+}
+EXPORT_SYMBOL_GPL(component_aggregate_unregister);
+
 static void component_unbind(struct component *component,
 	struct aggregate_device *adev, void *data)
 {
@@ -571,6 +757,8 @@ void component_unbind_all(struct device *parent, void *data)
 			c = adev->match->compare[i].component;
 			component_unbind(c, adev, data);
 		}
+
+	put_device(&adev->dev);
 }
 EXPORT_SYMBOL_GPL(component_unbind_all);
 
@@ -665,6 +853,7 @@ int component_bind_all(struct device *parent, void *data)
 				component_unbind(c, adev, data);
 			}
 	}
+	put_device(&adev->dev);
 
 	return ret;
 }
@@ -674,7 +863,6 @@ static int __component_add(struct device *dev, const struct component_ops *ops,
 	int subcomponent)
 {
 	struct component *component;
-	int ret;
 
 	component = kzalloc(sizeof(*component), GFP_KERNEL);
 	if (!component)
@@ -688,18 +876,10 @@ static int __component_add(struct device *dev, const struct component_ops *ops,
 
 	mutex_lock(&component_mutex);
 	list_add_tail(&component->node, &component_list);
-
-	ret = try_to_bring_up_masters(component);
-	if (ret < 0) {
-		if (component->adev)
-			remove_component(component->adev, component);
-		list_del(&component->node);
-
-		kfree(component);
-	}
 	mutex_unlock(&component_mutex);
 
-	return ret < 0 ? ret : 0;
+	/* Try to bind */
+	return bus_rescan_devices(&aggregate_bus_type);
 }
 
 /**
@@ -763,6 +943,7 @@ EXPORT_SYMBOL_GPL(component_add);
  */
 void component_del(struct device *dev, const struct component_ops *ops)
 {
+	struct aggregate_device *adev = NULL;
 	struct component *c, *component = NULL;
 
 	mutex_lock(&component_mutex);
@@ -774,13 +955,26 @@ void component_del(struct device *dev, const struct component_ops *ops)
 		}
 
 	if (component && component->adev) {
-		take_down_aggregate_device(component->adev);
-		remove_component(component->adev, component);
+		adev = component->adev;
+		remove_component(adev, component);
 	}
 
 	mutex_unlock(&component_mutex);
 
+	if (adev) {
+		/* Force unbind */
+		device_driver_detach(&adev->dev);
+		device_link_del(component->link);
+		put_device(&adev->dev);
+	}
+
 	WARN_ON(!component);
 	kfree(component);
 }
 EXPORT_SYMBOL_GPL(component_del);
+
+static int __init aggregate_bus_init(void)
+{
+	return bus_register(&aggregate_bus_type);
+}
+postcore_initcall(aggregate_bus_init);
diff --git a/include/linux/component.h b/include/linux/component.h
index 71bfc3862633..95d1b23ede8a 100644
--- a/include/linux/component.h
+++ b/include/linux/component.h
@@ -3,9 +3,7 @@
 #define COMPONENT_H
 
 #include <linux/stddef.h>
-
-
-struct device;
+#include <linux/device.h>
 
 /**
  * struct component_ops - callbacks for component drivers
@@ -82,11 +80,65 @@ struct component_master_ops {
 	void (*unbind)(struct device *master);
 };
 
+struct component_match;
+
+/**
+ * struct aggregate_driver - Aggregate driver (made up of other drivers)
+ * @driver: device driver
+ * @match: component match list
+ */
+struct aggregate_driver {
+	/**
+	 * @probe:
+	 *
+	 * Called when all components or the aggregate driver, as specified in
+	 * the @match list are
+	 * ready. Usually there are 3 steps to bind an aggregate driver:
+	 *
+	 * 1. Allocate a struct aggregate_driver.
+	 *
+	 * 2. Bind all components to the aggregate driver by calling
+	 *    component_bind_all() with the aggregate driver structure as opaque
+	 *    pointer data.
+	 *
+	 * 3. Register the aggregate driver with the subsystem to publish its
+	 *    interfaces.
+	 */
+	int (*probe)(struct aggregate_device *adev);
+	/**
+	 * @remove:
+	 *
+	 * Called when either the aggregate driver, using
+	 * component_aggregate_unregister(), or one of its components, using
+	 * component_del(), is unregistered.
+	 */
+	void (*remove)(struct aggregate_device *adev);
+	/**
+	 * @shutdown:
+	 *
+	 * Called when the system is shutting down.
+	 */
+	void (*shutdown)(struct aggregate_device *adev);
+
+	struct device_driver	driver;
+};
+
+static inline struct aggregate_driver *to_aggregate_driver(struct device_driver *d)
+{
+	if (!d)
+		return NULL;
+
+	return container_of(d, struct aggregate_driver, driver);
+}
+
+int component_aggregate_register(struct device *parent,
+	struct aggregate_driver *adrv, struct component_match *match);
+void component_aggregate_unregister(struct device *parent,
+	struct aggregate_driver *adrv);
+
 void component_master_del(struct device *,
 	const struct component_master_ops *);
 
-struct component_match;
-
 int component_master_add_with_match(struct device *,
 	const struct component_master_ops *, struct component_match *);
 void component_match_add_release(struct device *master,
-- 
https://chromeos.dev

