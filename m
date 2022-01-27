Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6625849EBF9
	for <lists+dri-devel@lfdr.de>; Thu, 27 Jan 2022 21:03:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB24D10E300;
	Thu, 27 Jan 2022 20:02:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x42c.google.com (mail-pf1-x42c.google.com
 [IPv6:2607:f8b0:4864:20::42c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 50F0710E502
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Jan 2022 20:02:42 +0000 (UTC)
Received: by mail-pf1-x42c.google.com with SMTP id d187so3776411pfa.10
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Jan 2022 12:02:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=mLJ9aQQKbi1McTKiTASuJ60v0WUfyMH6zYoZx7mCGow=;
 b=GS6Seq4+r80IcpAK74Q0pIsNJzAevgaT0sITaMFeTt1iLsIVo95O0DpX+9ePAak60Y
 Pbj93EvACJdFc8YsdQJ1VJgi2OAS1EjPUiPnsGMiic9C6jZzWo0VoUgGUqv9pTeMlKDv
 L8y88I4dBISVRWlkC8KOWzx3pVizjdgbpcck8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=mLJ9aQQKbi1McTKiTASuJ60v0WUfyMH6zYoZx7mCGow=;
 b=FCh68F/ksWLn+l0eDO0r3PC6L5hKJ78X4lPiSM5NqmkMZSKnguXDYQz0CmAgYqc94M
 Pb0Z8yDMK02VCoA06dTgg1ukdXpVNvk7z7smpHrmJkrcsFiQ/o2xy2ezbsL7YR1uZUE0
 kl1kG+/KBadtN7+yvViq6mbEzE90NrvI2I0lhR20H721RBFIRqWKKHL3FpLPe5Rpry/t
 qiYV5yliMsEFTPmegiOtSjIthwZeASZnvetLriPj0Jbfer81wmPP5hXQT6INbBFVEZ6/
 cW4Kh7bE7IF1/ai5nQrvD9OMrM/ItuxZcgNtZFTftMTpeVE3ypIwQXmzxIBM2u8cH2zN
 xzlQ==
X-Gm-Message-State: AOAM530a4yvwbWZNewnPrg9Jc9+ZeGQnz+ig/cqVJU/awT1Qzcwwqi7u
 8xTP8FOPq525YTZCOw7oPgkPeQ==
X-Google-Smtp-Source: ABdhPJznxlCbRpVhFUcGQYIzq2wotjTAZfj6r+uVXxNad6g9Gp5KhhaxnkuYEMMc+Fj26avh47h6qA==
X-Received: by 2002:a63:4c1c:: with SMTP id z28mr3981920pga.14.1643313761743; 
 Thu, 27 Jan 2022 12:02:41 -0800 (PST)
Received: from smtp.gmail.com ([2620:15c:202:201:9246:1838:3243:3071])
 by smtp.gmail.com with ESMTPSA id k21sm6561190pff.33.2022.01.27.12.02.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Jan 2022 12:02:41 -0800 (PST)
From: Stephen Boyd <swboyd@chromium.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Douglas Anderson <dianders@chromium.org>
Subject: [PATCH v6 35/35] component: Remove component_master_ops and friends
Date: Thu, 27 Jan 2022 12:01:41 -0800
Message-Id: <20220127200141.1295328-36-swboyd@chromium.org>
X-Mailer: git-send-email 2.35.0.rc0.227.g00780c9af4-goog
In-Reply-To: <20220127200141.1295328-1-swboyd@chromium.org>
References: <20220127200141.1295328-1-swboyd@chromium.org>
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
Cc: Saravana Kannan <saravanak@google.com>,
 "Rafael J. Wysocki" <rafael@kernel.org>, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Russell King <rmk+kernel@arm.linux.org.uk>, freedreno@lists.freedesktop.org
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
 drivers/base/component.c  | 149 ++++----------------------------------
 drivers/gpu/drm/drm_drv.c |   2 +-
 include/linux/component.h |  44 -----------
 3 files changed, 17 insertions(+), 178 deletions(-)

diff --git a/drivers/base/component.c b/drivers/base/component.c
index 5b91a114786d..c9d17ea64226 100644
--- a/drivers/base/component.c
+++ b/drivers/base/component.c
@@ -57,7 +57,6 @@ struct component_match {
 };
 
 struct aggregate_device {
-	const struct component_master_ops *ops;
 	struct device *parent;
 	struct device dev;
 	struct component_match *match;
@@ -154,18 +153,12 @@ static void component_debugfs_del(struct aggregate_device *m)
 
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
@@ -426,30 +419,15 @@ static int aggregate_device_match(struct device *dev, struct device_driver *drv)
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
 	if (devres_open_group(adev->parent, adev, GFP_KERNEL)) {
@@ -462,7 +440,7 @@ static int aggregate_driver_probe(struct device *dev)
 	devres_close_group(adev->parent, NULL);
 	mutex_unlock(&component_mutex);
 
-	if (ret && modern) {
+	if (ret) {
 		pm_runtime_disable(dev);
 		pm_runtime_set_suspended(dev);
 		pm_runtime_put_noidle(dev);
@@ -475,15 +453,10 @@ static void aggregate_driver_remove(struct device *dev)
 {
 	const struct aggregate_driver *adrv = to_aggregate_driver(dev->driver);
 	struct aggregate_device *adev = to_aggregate_device(dev);
-	bool modern = adrv->remove != component_remove_unbind;
 
-	/* Only do runtime PM when drivers migrate */
-	if (modern)
-		pm_runtime_get_sync(dev);
+	pm_runtime_get_sync(dev);
 	adrv->remove(to_aggregate_device(dev));
 	devres_release_group(adev->parent, adev);
-	if (!modern)
-		return;
 
 	pm_runtime_put_noidle(dev);
 
@@ -509,16 +482,11 @@ static struct bus_type aggregate_bus_type = {
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
@@ -551,7 +519,7 @@ static void aggregate_driver_unregister(struct aggregate_driver *adrv)
 }
 
 static struct aggregate_device *aggregate_device_add(struct device *parent,
-	const struct component_master_ops *ops, struct aggregate_driver *adrv,
+	struct aggregate_driver *adrv,
 	struct component_match *match)
 {
 	struct aggregate_device *adev;
@@ -576,7 +544,6 @@ static struct aggregate_device *aggregate_device_add(struct device *parent,
 	adev->parent = parent;
 	adev->dev.bus = &aggregate_bus_type;
 	adev->dev.release = aggregate_device_release;
-	adev->ops = ops;
 	adev->match = match;
 	adev->adrv = adrv;
 	dev_set_name(&adev->dev, "aggregate%d", id);
@@ -592,54 +559,6 @@ static struct aggregate_device *aggregate_device_add(struct device *parent,
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
@@ -656,7 +575,7 @@ int component_aggregate_register(struct device *parent,
 	struct aggregate_device *adev;
 	int ret;
 
-	adev = aggregate_device_add(parent, NULL, adrv, match);
+	adev = aggregate_device_add(parent, adrv, match);
 	if (IS_ERR(adev))
 		return PTR_ERR(adev);
 
@@ -668,42 +587,6 @@ int component_aggregate_register(struct device *parent,
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
@@ -719,7 +602,7 @@ void component_aggregate_unregister(struct device *parent,
 	struct aggregate_device *adev;
 
 	mutex_lock(&component_mutex);
-	adev = __aggregate_find(parent, NULL);
+	adev = __aggregate_find(parent);
 	mutex_unlock(&component_mutex);
 
 	if (adev)
@@ -755,7 +638,7 @@ static void component_unbind(struct component *component,
  *
  * Unbinds all components of the aggregate device by passing @data to their
  * &component_ops.unbind functions. Should be called from
- * &component_master_ops.unbind.
+ * &aggregate_driver.remove.
  */
 void component_unbind_all(struct device *parent, void *data)
 {
@@ -765,7 +648,7 @@ void component_unbind_all(struct device *parent, void *data)
 
 	WARN_ON(!mutex_is_locked(&component_mutex));
 
-	adev = __aggregate_find(parent, NULL);
+	adev = __aggregate_find(parent);
 	if (!adev)
 		return;
 
@@ -843,7 +726,7 @@ static int component_bind(struct component *component, struct aggregate_device *
  *
  * Binds all components of the aggregate @dev by passing @data to their
  * &component_ops.bind functions. Should be called from
- * &component_master_ops.bind.
+ * &aggregate_driver.probe.
  */
 int component_bind_all(struct device *parent, void *data)
 {
@@ -854,7 +737,7 @@ int component_bind_all(struct device *parent, void *data)
 
 	WARN_ON(!mutex_is_locked(&component_mutex));
 
-	adev = __aggregate_find(parent, NULL);
+	adev = __aggregate_find(parent);
 	if (!adev)
 		return -EINVAL;
 
diff --git a/drivers/gpu/drm/drm_drv.c b/drivers/gpu/drm/drm_drv.c
index 8214a0b1ab7f..902287bbcaba 100644
--- a/drivers/gpu/drm/drm_drv.c
+++ b/drivers/gpu/drm/drm_drv.c
@@ -545,7 +545,7 @@ static void drm_fs_inode_free(struct inode *inode)
  * following guidelines apply:
  *
  *  - The entire device initialization procedure should be run from the
- *    &component_master_ops.master_bind callback, starting with
+ *    &aggregate_driver.probe callback, starting with
  *    devm_drm_dev_alloc(), then binding all components with
  *    component_bind_all() and finishing with drm_dev_register().
  *
diff --git a/include/linux/component.h b/include/linux/component.h
index 073cbe9fea32..36ce0997f213 100644
--- a/include/linux/component.h
+++ b/include/linux/component.h
@@ -66,45 +66,6 @@ void component_unbind_all(struct device *parent, void *data);
 
 struct device *aggregate_device_parent(const struct aggregate_device *adev);
 
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
 /**
  * struct aggregate_driver - Aggregate driver (made up of other drivers)
  * @count: driver registration refcount
@@ -155,9 +116,6 @@ static inline struct aggregate_driver *to_aggregate_driver(struct device_driver
 	return container_of(d, struct aggregate_driver, driver);
 }
 
-void component_master_del(struct device *,
-	const struct component_master_ops *);
-
 struct component_match;
 
 int component_aggregate_register(struct device *parent,
@@ -165,8 +123,6 @@ int component_aggregate_register(struct device *parent,
 void component_aggregate_unregister(struct device *parent,
 	struct aggregate_driver *adrv);
 
-int component_master_add_with_match(struct device *,
-	const struct component_master_ops *, struct component_match *);
 void component_match_add_release(struct device *parent,
 	struct component_match **matchptr,
 	void (*release)(struct device *, void *),
-- 
https://chromeos.dev

