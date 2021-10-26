Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3920843A8F8
	for <lists+dri-devel@lfdr.de>; Tue, 26 Oct 2021 02:02:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C809A6E237;
	Tue, 26 Oct 2021 00:01:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x42d.google.com (mail-pf1-x42d.google.com
 [IPv6:2607:f8b0:4864:20::42d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B86766E20A
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Oct 2021 00:01:16 +0000 (UTC)
Received: by mail-pf1-x42d.google.com with SMTP id o133so12471360pfg.7
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Oct 2021 17:01:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=V9ilZCQDc8PNTgTJZyEfkygPrvLsJLXU67mb2e4XKms=;
 b=JxSqCRiRixECfSC0iPBGGnq0B81YdxDe3sZbCNt+TW4XpEqJlbvQe+bEZLMci2lYk2
 uEH9LNu0KTeEL+wN/gJI7F7yH2aK/W54a/6ZaXxFZNamZyWtzNeSeR/HnligXhN/Qs2X
 zZUH9ry531if+rhhTSMXpjMdSyZUp1c3N8qdw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=V9ilZCQDc8PNTgTJZyEfkygPrvLsJLXU67mb2e4XKms=;
 b=p5VGhCX7PAe1F5pKgOj8G9UcyFNA8EGCdHnjKEvzng2Cd4SfMyUD4/28lRM6GiNx3B
 HruMChUtG6Z3OLMX4YL4V8071TRLchmHb603rxdAUulKW8vjbGlUZ4xnkGvHLv/FJnGV
 gYpGdNTB7qWfUolBw0JtN5KzjdmrZAp60bt7uNNiJ4OeoigPwrUzVdFcM/EO6rlx8VMy
 qfqnv370Qo5Oebn+z1rhDYdyE2qcD/yeIYJ/zJDVZr9F20swvtswFMZWAoSo4CZ/D73j
 bjqrZ07Ay87bW6BYDebEZHtMMeyJdICT8cJqnmdhAo+p6JdUfMH1cMYY/RxEwkzAttTx
 BL2g==
X-Gm-Message-State: AOAM532vG6UEgdnIq4do5mfT9Lp+FEMIwUkfy8VTlCL4HmanJDCrV0p2
 8NVnzTCCymPc49+m97kibzSNNUPH+1c3qw==
X-Google-Smtp-Source: ABdhPJxbJj6H/BBM1VC/+qEoFFReCxEoHGfdsO4xUJh0moIBv+bvetLdGsS8+OKDNcw33pheiTyJEQ==
X-Received: by 2002:a05:6a00:1485:b0:47c:104c:8c64 with SMTP id
 v5-20020a056a00148500b0047c104c8c64mr573408pfu.59.1635206476114; 
 Mon, 25 Oct 2021 17:01:16 -0700 (PDT)
Received: from smtp.gmail.com ([2620:15c:202:201:f5e3:5eb1:d5ee:6893])
 by smtp.gmail.com with ESMTPSA id b7sm9900747pfm.28.2021.10.25.17.01.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Oct 2021 17:01:15 -0700 (PDT)
From: Stephen Boyd <swboyd@chromium.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 "Rafael J. Wysocki" <rafael@kernel.org>, Rob Clark <robdclark@gmail.com>,
 Russell King <rmk+kernel@arm.linux.org.uk>,
 Saravana Kannan <saravanak@google.com>
Subject: [PATCH v3 34/34] component: Remove component_master_ops and friends
Date: Mon, 25 Oct 2021 17:00:44 -0700
Message-Id: <20211026000044.885195-35-swboyd@chromium.org>
X-Mailer: git-send-email 2.33.0.1079.g6e70778dc9-goog
In-Reply-To: <20211026000044.885195-1-swboyd@chromium.org>
References: <20211026000044.885195-1-swboyd@chromium.org>
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

The struct is unused now so drop it along with the functions that use
it.

Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>
Cc: Rob Clark <robdclark@gmail.com>
Cc: Russell King <rmk+kernel@arm.linux.org.uk>
Cc: Saravana Kannan <saravanak@google.com>
Signed-off-by: Stephen Boyd <swboyd@chromium.org>
---
 drivers/base/component.c  | 148 +++++---------------------------------
 drivers/gpu/drm/drm_drv.c |   2 +-
 include/linux/component.h |  45 ------------
 3 files changed, 17 insertions(+), 178 deletions(-)

diff --git a/drivers/base/component.c b/drivers/base/component.c
index cbf2d4cc0794..5a2a6c5b8b83 100644
--- a/drivers/base/component.c
+++ b/drivers/base/component.c
@@ -134,18 +134,12 @@ static void component_debugfs_del(struct aggregate_device *m)
 
 #endif
 
-struct aggregate_bus_find_data {
-	const struct component_master_ops *ops;
-	struct device *parent;
-};
-
 static int aggregate_bus_find_match(struct device *dev, const void *_data)
 {
 	struct aggregate_device *adev = to_aggregate_device(dev);
-	const struct aggregate_bus_find_data *data = _data;
+	const struct device *parent = _data;
 
-	if (adev->parent == data->parent &&
-	    (!data->ops || adev->ops == data->ops))
+	if (adev->parent == parent)
 		return 1;
 
 	return 0;
@@ -406,30 +400,15 @@ static int aggregate_device_match(struct device *dev, struct device_driver *drv)
 	return ret;
 }
 
-/* TODO: Remove once all aggregate drivers use component_aggregate_register() */
-static int component_probe_bind(struct aggregate_device *adev)
-{
-	return adev->ops->bind(adev->parent);
-}
-
-static void component_remove_unbind(struct aggregate_device *adev)
-{
-	adev->ops->unbind(adev->parent);
-}
-
 static int aggregate_driver_probe(struct device *dev)
 {
 	const struct aggregate_driver *adrv = to_aggregate_driver(dev->driver);
 	struct aggregate_device *adev = to_aggregate_device(dev);
-	bool modern = adrv->probe != component_probe_bind;
 	int ret;
 
-	/* Only do runtime PM when drivers migrate */
-	if (modern) {
-		pm_runtime_get_noresume(dev);
-		pm_runtime_set_active(dev);
-		pm_runtime_enable(dev);
-	}
+	pm_runtime_get_noresume(dev);
+	pm_runtime_set_active(dev);
+	pm_runtime_enable(dev);
 
 	mutex_lock(&component_mutex);
 	if (devres_open_group(adev->parent, NULL, GFP_KERNEL)) {
@@ -441,7 +420,7 @@ static int aggregate_driver_probe(struct device *dev)
 	}
 	mutex_unlock(&component_mutex);
 
-	if (ret && modern) {
+	if (ret) {
 		pm_runtime_disable(dev);
 		pm_runtime_set_suspended(dev);
 		pm_runtime_put_noidle(dev);
@@ -454,15 +433,10 @@ static void aggregate_driver_remove(struct device *dev)
 {
 	const struct aggregate_driver *adrv = to_aggregate_driver(dev->driver);
 	struct aggregate_device *adev = to_aggregate_device(dev);
-	bool modern = adrv->remove != component_remove_unbind;
 
-	/* Only do runtime PM when drivers migrate */
-	if (modern)
-		pm_runtime_get_sync(dev);
+	pm_runtime_get_sync(dev);
 	adrv->remove(to_aggregate_device(dev));
 	devres_release_group(adev->parent, NULL);
-	if (!modern)
-		return;
 
 	pm_runtime_put_noidle(dev);
 
@@ -488,16 +462,11 @@ static struct bus_type aggregate_bus_type = {
 };
 
 /* Callers take ownership of return value, should call put_device() */
-static struct aggregate_device *__aggregate_find(struct device *parent,
-	const struct component_master_ops *ops)
+static struct aggregate_device *__aggregate_find(struct device *parent)
 {
 	struct device *dev;
-	struct aggregate_bus_find_data data = {
-		.ops = ops,
-		.parent = parent,
-	};
 
-	dev = bus_find_device(&aggregate_bus_type, NULL, &data,
+	dev = bus_find_device(&aggregate_bus_type, NULL, parent,
 			      aggregate_bus_find_match);
 
 	return dev ? to_aggregate_device(dev) : NULL;
@@ -515,7 +484,7 @@ static void aggregate_driver_unregister(struct aggregate_driver *adrv)
 }
 
 static struct aggregate_device *aggregate_device_add(struct device *parent,
-	const struct component_master_ops *ops, struct aggregate_driver *adrv,
+	struct aggregate_driver *adrv,
 	struct component_match *match)
 {
 	struct aggregate_device *adev;
@@ -540,7 +509,6 @@ static struct aggregate_device *aggregate_device_add(struct device *parent,
 	adev->parent = parent;
 	adev->dev.bus = &aggregate_bus_type;
 	adev->dev.release = aggregate_device_release;
-	adev->ops = ops;
 	adev->match = match;
 	adev->adrv = adrv;
 	dev_set_name(&adev->dev, "aggregate%d", id);
@@ -556,54 +524,6 @@ static struct aggregate_device *aggregate_device_add(struct device *parent,
 	return adev;
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
- *
- * Deprecated: Use component_aggregate_register() instead.
- */
-int component_master_add_with_match(struct device *parent,
-	const struct component_master_ops *ops,
-	struct component_match *match)
-{
-	struct aggregate_driver *adrv;
-	struct aggregate_device *adev;
-	int ret = 0;
-
-	adrv = kzalloc(sizeof(*adrv), GFP_KERNEL);
-	if (!adrv)
-		return -ENOMEM;
-
-	adev = aggregate_device_add(parent, ops, adrv, match);
-	if (IS_ERR(adev)) {
-		ret = PTR_ERR(adev);
-		goto err;
-	}
-
-	adrv->probe = component_probe_bind;
-	adrv->remove = component_remove_unbind;
-	adrv->driver.owner = THIS_MODULE;
-	adrv->driver.name = dev_name(&adev->dev);
-
-	ret = aggregate_driver_register(adrv);
-	if (!ret)
-		return 0;
-
-	put_device(&adev->dev);
-err:
-	kfree(adrv);
-	return ret;
-}
-EXPORT_SYMBOL_GPL(component_master_add_with_match);
-
 /**
  * component_aggregate_register - register an aggregate driver
  * @parent: parent device of the aggregate driver
@@ -620,7 +540,7 @@ int component_aggregate_register(struct device *parent,
 	struct aggregate_device *adev;
 	int ret;
 
-	adev = aggregate_device_add(parent, NULL, adrv, match);
+	adev = aggregate_device_add(parent, adrv, match);
 	if (IS_ERR(adev))
 		return PTR_ERR(adev);
 
@@ -632,42 +552,6 @@ int component_aggregate_register(struct device *parent,
 }
 EXPORT_SYMBOL_GPL(component_aggregate_register);
 
-/**
- * component_master_del - unregister an aggregate driver
- * @parent: parent device of the aggregate driver
- * @ops: callbacks for the aggregate driver
- *
- * Unregisters an aggregate driver registered with
- * component_master_add_with_match(). If necessary the aggregate driver is first
- * disassembled by calling &component_master_ops.unbind from @ops.
- *
- * Deprecated: Use component_aggregate_unregister() instead.
- */
-void component_master_del(struct device *parent,
-	const struct component_master_ops *ops)
-{
-	struct aggregate_device *adev;
-	struct aggregate_driver *adrv;
-	struct device_driver *drv;
-
-	mutex_lock(&component_mutex);
-	adev = __aggregate_find(parent, ops);
-	mutex_unlock(&component_mutex);
-
-	if (adev) {
-		drv = adev->dev.driver;
-		if (drv) {
-			adrv = to_aggregate_driver(drv);
-			aggregate_driver_unregister(adrv);
-			kfree(adrv);
-		}
-
-		device_unregister(&adev->dev);
-	}
-	put_device(&adev->dev);
-}
-EXPORT_SYMBOL_GPL(component_master_del);
-
 /**
  * component_aggregate_unregister - unregister an aggregate driver
  * @parent: parent device of the aggregate driver
@@ -683,7 +567,7 @@ void component_aggregate_unregister(struct device *parent,
 	struct aggregate_device *adev;
 
 	mutex_lock(&component_mutex);
-	adev = __aggregate_find(parent, NULL);
+	adev = __aggregate_find(parent);
 	mutex_unlock(&component_mutex);
 
 	if (adev)
@@ -719,7 +603,7 @@ static void component_unbind(struct component *component,
  *
  * Unbinds all components of the aggregate device by passing @data to their
  * &component_ops.unbind functions. Should be called from
- * &component_master_ops.unbind.
+ * &aggregate_driver.remove.
  */
 void component_unbind_all(struct device *parent, void *data)
 {
@@ -729,7 +613,7 @@ void component_unbind_all(struct device *parent, void *data)
 
 	WARN_ON(!mutex_is_locked(&component_mutex));
 
-	adev = __aggregate_find(parent, NULL);
+	adev = __aggregate_find(parent);
 	if (!adev)
 		return;
 
@@ -807,7 +691,7 @@ static int component_bind(struct component *component, struct aggregate_device *
  *
  * Binds all components of the aggregate @dev by passing @data to their
  * &component_ops.bind functions. Should be called from
- * &component_master_ops.bind.
+ * &aggregate_driver.probe.
  */
 int component_bind_all(struct device *parent, void *data)
 {
@@ -818,7 +702,7 @@ int component_bind_all(struct device *parent, void *data)
 
 	WARN_ON(!mutex_is_locked(&component_mutex));
 
-	adev = __aggregate_find(parent, NULL);
+	adev = __aggregate_find(parent);
 	if (!adev)
 		return -EINVAL;
 
diff --git a/drivers/gpu/drm/drm_drv.c b/drivers/gpu/drm/drm_drv.c
index 7a5097467ba5..d188fa26bb1b 100644
--- a/drivers/gpu/drm/drm_drv.c
+++ b/drivers/gpu/drm/drm_drv.c
@@ -544,7 +544,7 @@ static void drm_fs_inode_free(struct inode *inode)
  * following guidelines apply:
  *
  *  - The entire device initialization procedure should be run from the
- *    &component_master_ops.master_bind callback, starting with
+ *    &aggregate_driver.probe callback, starting with
  *    devm_drm_dev_alloc(), then binding all components with
  *    component_bind_all() and finishing with drm_dev_register().
  *
diff --git a/include/linux/component.h b/include/linux/component.h
index d8dcbf9733da..07fe481d4e3b 100644
--- a/include/linux/component.h
+++ b/include/linux/component.h
@@ -63,47 +63,7 @@ void component_del(struct device *, const struct component_ops *);
 int component_bind_all(struct device *master, void *master_data);
 void component_unbind_all(struct device *master, void *master_data);
 
-/**
- * struct component_master_ops - callback for the aggregate driver
- *
- * Aggregate drivers are registered with component_master_add_with_match() and
- * unregistered with component_master_del().
- */
-struct component_master_ops {
-	/**
-	 * @bind:
-	 *
-	 * Called when all components or the aggregate driver, as specified in
-	 * the match list passed to component_master_add_with_match(), are
-	 * ready. Usually there are 3 steps to bind an aggregate driver:
-	 *
-	 * 1. Allocate a structure for the aggregate driver.
-	 *
-	 * 2. Bind all components to the aggregate driver by calling
-	 *    component_bind_all() with the aggregate driver structure as opaque
-	 *    pointer data.
-	 *
-	 * 3. Register the aggregate driver with the subsystem to publish its
-	 *    interfaces.
-	 *
-	 * Note that the lifetime of the aggregate driver does not align with
-	 * any of the underlying &struct device instances. Therefore devm cannot
-	 * be used and all resources acquired or allocated in this callback must
-	 * be explicitly released in the @unbind callback.
-	 */
-	int (*bind)(struct device *master);
-	/**
-	 * @unbind:
-	 *
-	 * Called when either the aggregate driver, using
-	 * component_master_del(), or one of its components, using
-	 * component_del(), is unregistered.
-	 */
-	void (*unbind)(struct device *master);
-};
-
 struct aggregate_device {
-	const struct component_master_ops *ops;
 	struct device *parent;
 	struct device dev;
 	struct component_match *match;
@@ -171,11 +131,6 @@ int component_aggregate_register(struct device *parent,
 void component_aggregate_unregister(struct device *parent,
 	struct aggregate_driver *adrv);
 
-void component_master_del(struct device *,
-	const struct component_master_ops *);
-
-int component_master_add_with_match(struct device *,
-	const struct component_master_ops *, struct component_match *);
 void component_match_add_release(struct device *master,
 	struct component_match **matchptr,
 	void (*release)(struct device *, void *),
-- 
https://chromeos.dev

