Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7409842472C
	for <lists+dri-devel@lfdr.de>; Wed,  6 Oct 2021 21:39:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6DDF26EE21;
	Wed,  6 Oct 2021 19:39:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x529.google.com (mail-pg1-x529.google.com
 [IPv6:2607:f8b0:4864:20::529])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E4D446EE45
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Oct 2021 19:39:01 +0000 (UTC)
Received: by mail-pg1-x529.google.com with SMTP id 75so3419398pga.3
 for <dri-devel@lists.freedesktop.org>; Wed, 06 Oct 2021 12:39:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=NjwWJoeqH2Q78OrEfQhtP8/+e1T/dAhtZT9RvI4IcNk=;
 b=Cba3iEezPLMzTZrAJsNbMyjgVr8Pt9bX/b8iQJj/rafPNCtmpTLgobk8L8N7IMEf2F
 r8RwJUu+37bkbpEJqp1JqkU7eZUfGc0CBEkcPWlR6BUa/FGeAPmmnlD1kjhTeOOy550D
 NYZtBSOt/DMbPMGaGnBjwaJew4USqomkNUoo8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=NjwWJoeqH2Q78OrEfQhtP8/+e1T/dAhtZT9RvI4IcNk=;
 b=UQCgdt2ECiLivx2J5zLFcdVC/cXP/uhW9218+Tz/imT1CZzsUcN9yhllQugxu1du2P
 45aNny0McttxoOrjy9hUrO+E4AbbkM6zw6qIrbTDZkaffiOUNQFFkfmgZvtUDTz6P497
 pMQI8ri5pj1zZWxsrS1U89VaJkpZ9n5WQumlfP1F/P1VgmcYc0jCJBXcmw8woQ6nsSmj
 Ylt2l5PcAyV++asg54WpPm6ntEQsSs4RRhwrpPcY12IDCtfgS6gkUXEhc5fWXgbjE0UV
 xaNDDWE36wyNIh/MHnzb1UFV5dNKyTeKXRnf1GghHq111CM4+5S7UAycRPvxB1IxPaBb
 cjcg==
X-Gm-Message-State: AOAM530ntOq7zm48SOqE8/uljEE4qRfSmG3Vd3L62JRDVFXWwPndh7rZ
 83wDGRNHmdnFi79cAYhDjWzYPg==
X-Google-Smtp-Source: ABdhPJxoplQAMrZuav0lG8d3A5qfEyH8lCdSXX3ngcKRlEIoMACvU+bsK3Nru1KC+Q+TKrTi1gVoog==
X-Received: by 2002:a63:c10b:: with SMTP id w11mr470789pgf.228.1633549141623; 
 Wed, 06 Oct 2021 12:39:01 -0700 (PDT)
Received: from smtp.gmail.com ([2620:15c:202:201:d412:c5eb:4aca:4738])
 by smtp.gmail.com with ESMTPSA id o14sm22011296pfh.84.2021.10.06.12.39.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Oct 2021 12:39:01 -0700 (PDT)
From: Stephen Boyd <swboyd@chromium.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 "Rafael J. Wysocki" <rafael@kernel.org>, Rob Clark <robdclark@gmail.com>,
 Russell King <rmk+kernel@arm.linux.org.uk>,
 Saravana Kannan <saravanak@google.com>
Subject: [PATCH v2 33/34] component: Remove component_master_ops and friends
Date: Wed,  6 Oct 2021 12:38:18 -0700
Message-Id: <20211006193819.2654854-34-swboyd@chromium.org>
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

The struct is unused now so drop it along with the functions that use
it.

Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>
Cc: Rob Clark <robdclark@gmail.com>
Cc: Russell King <rmk+kernel@arm.linux.org.uk>
Cc: Saravana Kannan <saravanak@google.com>
Signed-off-by: Stephen Boyd <swboyd@chromium.org>
---
 drivers/base/component.c  | 109 +++-----------------------------------
 drivers/gpu/drm/drm_drv.c |   2 +-
 include/linux/component.h |  45 ----------------
 3 files changed, 8 insertions(+), 148 deletions(-)

diff --git a/drivers/base/component.c b/drivers/base/component.c
index a6dd33d0ddeb..939862b25b10 100644
--- a/drivers/base/component.c
+++ b/drivers/base/component.c
@@ -140,18 +140,12 @@ static void component_master_debugfs_del(struct aggregate_device *m)
 
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
@@ -496,16 +490,11 @@ static struct bus_type aggregate_bus_type = {
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
@@ -523,7 +512,7 @@ static void aggregate_driver_unregister(struct aggregate_driver *adrv)
 }
 
 static struct aggregate_device *aggregate_device_add(struct device *parent,
-	const struct component_master_ops *ops, struct aggregate_driver *adrv,
+	struct aggregate_driver *adrv,
 	struct component_match *match)
 {
 	struct aggregate_device *adev;
@@ -564,54 +553,6 @@ static struct aggregate_device *aggregate_device_add(struct device *parent,
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
@@ -640,42 +581,6 @@ int component_aggregate_register(struct device *parent,
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
@@ -727,7 +632,7 @@ static void component_unbind(struct component *component,
  *
  * Unbinds all components of the aggregate device by passing @data to their
  * &component_ops.unbind functions. Should be called from
- * &component_master_ops.unbind.
+ * &aggregate_driver.remove.
  */
 void component_unbind_all(struct device *parent, void *data)
 {
@@ -815,7 +720,7 @@ static int component_bind(struct component *component, struct aggregate_device *
  *
  * Binds all components of the aggregate @dev by passing @data to their
  * &component_ops.bind functions. Should be called from
- * &component_master_ops.bind.
+ * &aggregate_driver.probe.
  */
 int component_bind_all(struct device *parent, void *data)
 {
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

