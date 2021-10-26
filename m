Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 557F943A8A5
	for <lists+dri-devel@lfdr.de>; Tue, 26 Oct 2021 02:01:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 12C5C6E18F;
	Tue, 26 Oct 2021 00:00:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com
 [IPv6:2607:f8b0:4864:20::634])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B64416E0E1
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Oct 2021 00:00:48 +0000 (UTC)
Received: by mail-pl1-x634.google.com with SMTP id s24so5032962plp.0
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Oct 2021 17:00:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=pno2S4ojoX9LzFG4N/nSgfhab0mWpiKl45jKnE88ATs=;
 b=A9EYExeYISFXFlzXnuRvfQoaQGhv6mdKZRKjf2GWPaJ/+Vtq7ALMJwsxCIa3ajojwN
 V3Z4IK0Rg8xLV7JLeoYZgs1URcewI1c1edLetqTGqxAjq16bRGzso5tM7teKgKvGVyWs
 L6e79ur3WpOTkD4tGil2CyoPEdRZ+1ZRnIeG4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=pno2S4ojoX9LzFG4N/nSgfhab0mWpiKl45jKnE88ATs=;
 b=GDEB4xz0w87kkcvSW4ktIzA7xVr0r766cuYJMFEwxQOjWgxAZOgxAB/KjKg2p7oozn
 ObD7BL0Pc+0hdCrwCgePBTeKD2YpaGlFXVNyrOoiB7xi95eIuqXSjfJdBM9CKB5PZOSh
 S3AQPVEHoj1+6CoCCYANrqiJr2EHN6IJvuJt/GiJFeXUdyNLBhTBsh4qE9pDO1DRYpGF
 TjQjqVE7R5Xv2WrXbwwzFxEbTB/fQx4wbcIbh1btUdq2pS9fmsIIrbaxH/tyiRsHgGut
 oc8/ELXw8w0EdrJEg1dhInVRtG2OEzetoxWYj7IM+Bq5OUHRktfoEFEsW1LliWozaDSo
 4a5w==
X-Gm-Message-State: AOAM530017NcqsRQkpioySsbA+YqRPAJM4OqnwFzoAZdL//tePbYlKqK
 OXt61tY4eUbbv84uuPjI+Id3Hg==
X-Google-Smtp-Source: ABdhPJxY2WsvugtSqoAHrD66GwB9auomzUIL4yVPZxgb4bK/QgIfEpBXDjiZ5iijQf3CRrYWizwp/w==
X-Received: by 2002:a17:903:1248:b0:13f:cd7d:69eb with SMTP id
 u8-20020a170903124800b0013fcd7d69ebmr19135557plh.23.1635206448021; 
 Mon, 25 Oct 2021 17:00:48 -0700 (PDT)
Received: from smtp.gmail.com ([2620:15c:202:201:f5e3:5eb1:d5ee:6893])
 by smtp.gmail.com with ESMTPSA id b7sm9900747pfm.28.2021.10.25.17.00.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Oct 2021 17:00:47 -0700 (PDT)
From: Stephen Boyd <swboyd@chromium.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 "Rafael J. Wysocki" <rafael@kernel.org>, Rob Clark <robdclark@gmail.com>,
 Russell King <rmk+kernel@arm.linux.org.uk>,
 Saravana Kannan <saravanak@google.com>
Subject: [PATCH v3 02/34] component: Remove most references to 'master'
Date: Mon, 25 Oct 2021 17:00:12 -0700
Message-Id: <20211026000044.885195-3-swboyd@chromium.org>
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

Remove most references to 'master' in the code now that we've decided to
migrate all the users of the ops structure to the aggregate driver.

Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>
Cc: Rob Clark <robdclark@gmail.com>
Cc: Russell King <rmk+kernel@arm.linux.org.uk>
Cc: Saravana Kannan <saravanak@google.com>
Signed-off-by: Stephen Boyd <swboyd@chromium.org>
---
 drivers/base/component.c  | 248 +++++++++++++++++++-------------------
 include/linux/component.h |   2 +-
 2 files changed, 123 insertions(+), 127 deletions(-)

diff --git a/drivers/base/component.c b/drivers/base/component.c
index 1c3c91ba7d2e..6b3e81fdcfde 100644
--- a/drivers/base/component.c
+++ b/drivers/base/component.c
@@ -1,11 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0
 /*
  * Componentized device handling.
- *
- * This is work in progress.  We gather up the component devices into a list,
- * and bind them when instructed.  At the moment, we're specific to the DRM
- * subsystem, and only handles one master device, but this doesn't have to be
- * the case.
  */
 #include <linux/component.h>
 #include <linux/device.h>
@@ -59,7 +54,7 @@ struct component_match {
 	struct component_match_array *compare;
 };
 
-struct master {
+struct aggregate_device {
 	struct list_head node;
 	bool bound;
 
@@ -73,7 +68,7 @@ struct master {
 
 struct component {
 	struct list_head node;
-	struct master *master;
+	struct aggregate_device *adev;
 	bool bound;
 
 	const struct component_ops *ops;
@@ -83,7 +78,7 @@ struct component {
 
 static DEFINE_MUTEX(component_mutex);
 static LIST_HEAD(component_list);
-static LIST_HEAD(masters);
+static LIST_HEAD(aggregate_devices);
 static DEFINE_IDA(aggregate_ida);
 
 #ifdef CONFIG_DEBUG_FS
@@ -92,12 +87,12 @@ static struct dentry *component_debugfs_dir;
 
 static int component_devices_show(struct seq_file *s, void *data)
 {
-	struct master *m = s->private;
+	struct aggregate_device *m = s->private;
 	struct component_match *match = m->match;
 	size_t i;
 
 	mutex_lock(&component_mutex);
-	seq_printf(s, "%-40s %20s\n", "master name", "status");
+	seq_printf(s, "%-40s %20s\n", "aggregate_device name", "status");
 	seq_puts(s, "-------------------------------------------------------------\n");
 	seq_printf(s, "%-40s %20s\n\n",
 		   dev_name(m->parent), m->bound ? "bound" : "not bound");
@@ -127,46 +122,46 @@ static int __init component_debug_init(void)
 
 core_initcall(component_debug_init);
 
-static void component_master_debugfs_add(struct master *m)
+static void component_debugfs_add(struct aggregate_device *m)
 {
 	debugfs_create_file(dev_name(m->parent), 0444, component_debugfs_dir, m,
 			    &component_devices_fops);
 }
 
-static void component_master_debugfs_del(struct master *m)
+static void component_debugfs_del(struct aggregate_device *m)
 {
 	debugfs_remove(debugfs_lookup(dev_name(m->parent), component_debugfs_dir));
 }
 
 #else
 
-static void component_master_debugfs_add(struct master *m)
+static void component_debugfs_add(struct aggregate_device *m)
 { }
 
-static void component_master_debugfs_del(struct master *m)
+static void component_debugfs_del(struct aggregate_device *m)
 { }
 
 #endif
 
-static struct master *__master_find(struct device *parent,
+static struct aggregate_device *__aggregate_find(struct device *parent,
 	const struct component_master_ops *ops)
 {
-	struct master *m;
+	struct aggregate_device *m;
 
-	list_for_each_entry(m, &masters, node)
+	list_for_each_entry(m, &aggregate_devices, node)
 		if (m->parent == parent && (!ops || m->ops == ops))
 			return m;
 
 	return NULL;
 }
 
-static struct component *find_component(struct master *master,
+static struct component *find_component(struct aggregate_device *adev,
 	struct component_match_array *mc)
 {
 	struct component *c;
 
 	list_for_each_entry(c, &component_list, node) {
-		if (c->master && c->master != master)
+		if (c->adev && c->adev != adev)
 			continue;
 
 		if (mc->compare && mc->compare(c->dev, mc->data))
@@ -180,101 +175,102 @@ static struct component *find_component(struct master *master,
 	return NULL;
 }
 
-static int find_components(struct master *master)
+static int find_components(struct aggregate_device *adev)
 {
-	struct component_match *match = master->match;
+	struct component_match *match = adev->match;
 	size_t i;
 	int ret = 0;
 
 	/*
 	 * Scan the array of match functions and attach
-	 * any components which are found to this master.
+	 * any components which are found to this adev.
 	 */
 	for (i = 0; i < match->num; i++) {
 		struct component_match_array *mc = &match->compare[i];
 		struct component *c;
 
-		dev_dbg(master->parent, "Looking for component %zu\n", i);
+		dev_dbg(adev->parent, "Looking for component %zu\n", i);
 
 		if (match->compare[i].component)
 			continue;
 
-		c = find_component(master, mc);
+		c = find_component(adev, mc);
 		if (!c) {
 			ret = -ENXIO;
 			break;
 		}
 
-		dev_dbg(master->parent, "found component %s, duplicate %u\n", dev_name(c->dev), !!c->master);
+		dev_dbg(adev->parent, "found component %s, duplicate %u\n",
+			dev_name(c->dev), !!c->adev);
 
-		/* Attach this component to the master */
-		match->compare[i].duplicate = !!c->master;
+		/* Attach this component to the adev */
+		match->compare[i].duplicate = !!c->adev;
 		match->compare[i].component = c;
-		c->master = master;
+		c->adev = adev;
 	}
 	return ret;
 }
 
-/* Detach component from associated master */
-static void remove_component(struct master *master, struct component *c)
+/* Detach component from associated aggregate_device */
+static void remove_component(struct aggregate_device *adev, struct component *c)
 {
 	size_t i;
 
-	/* Detach the component from this master. */
-	for (i = 0; i < master->match->num; i++)
-		if (master->match->compare[i].component == c)
-			master->match->compare[i].component = NULL;
+	/* Detach the component from this adev. */
+	for (i = 0; i < adev->match->num; i++)
+		if (adev->match->compare[i].component == c)
+			adev->match->compare[i].component = NULL;
 }
 
 /*
- * Try to bring up a master.  If component is NULL, we're interested in
- * this master, otherwise it's a component which must be present to try
- * and bring up the master.
+ * Try to bring up an aggregate device.  If component is NULL, we're interested
+ * in this aggregate device, otherwise it's a component which must be present
+ * to try and bring up the aggregate device.
  *
  * Returns 1 for successful bringup, 0 if not ready, or -ve errno.
  */
-static int try_to_bring_up_master(struct master *master,
+static int try_to_bring_up_aggregate_device(struct aggregate_device *adev,
 	struct component *component)
 {
 	int ret;
 
-	dev_dbg(master->parent, "trying to bring up master\n");
+	dev_dbg(adev->parent, "trying to bring up adev\n");
 
-	if (find_components(master)) {
-		dev_dbg(master->parent, "master has incomplete components\n");
+	if (find_components(adev)) {
+		dev_dbg(adev->parent, "master has incomplete components\n");
 		return 0;
 	}
 
-	if (component && component->master != master) {
-		dev_dbg(master->parent, "master is not for this component (%s)\n",
+	if (component && component->adev != adev) {
+		dev_dbg(adev->parent, "master is not for this component (%s)\n",
 			dev_name(component->dev));
 		return 0;
 	}
 
-	if (!devres_open_group(master->parent, NULL, GFP_KERNEL))
+	if (!devres_open_group(adev->parent, NULL, GFP_KERNEL))
 		return -ENOMEM;
 
 	/* Found all components */
-	ret = master->ops->bind(master->parent);
+	ret = adev->ops->bind(adev->parent);
 	if (ret < 0) {
-		devres_release_group(master->parent, NULL);
+		devres_release_group(adev->parent, NULL);
 		if (ret != -EPROBE_DEFER)
-			dev_info(master->parent, "master bind failed: %d\n", ret);
+			dev_info(adev->parent, "adev bind failed: %d\n", ret);
 		return ret;
 	}
 
-	master->bound = true;
+	adev->bound = true;
 	return 1;
 }
 
 static int try_to_bring_up_masters(struct component *component)
 {
-	struct master *m;
+	struct aggregate_device *adev;
 	int ret = 0;
 
-	list_for_each_entry(m, &masters, node) {
-		if (!m->bound) {
-			ret = try_to_bring_up_master(m, component);
+	list_for_each_entry(adev, &aggregate_devices, node) {
+		if (!adev->bound) {
+			ret = try_to_bring_up_aggregate_device(adev, component);
 			if (ret != 0)
 				break;
 		}
@@ -283,12 +279,12 @@ static int try_to_bring_up_masters(struct component *component)
 	return ret;
 }
 
-static void take_down_master(struct master *master)
+static void take_down_aggregate_device(struct aggregate_device *adev)
 {
-	if (master->bound) {
-		master->ops->unbind(master->parent);
-		devres_release_group(master->parent, NULL);
-		master->bound = false;
+	if (adev->bound) {
+		adev->ops->unbind(adev->parent);
+		devres_release_group(adev->parent, NULL);
+		adev->bound = false;
 	}
 }
 
@@ -329,7 +325,7 @@ static int component_match_realloc(struct component_match *match, size_t num)
 	return 0;
 }
 
-static void __component_match_add(struct device *master,
+static void __component_match_add(struct device *parent,
 	struct component_match **matchptr,
 	void (*release)(struct device *, void *),
 	int (*compare)(struct device *, void *),
@@ -349,7 +345,7 @@ static void __component_match_add(struct device *master,
 			return;
 		}
 
-		devres_add(master, match);
+		devres_add(parent, match);
 
 		*matchptr = match;
 	}
@@ -375,13 +371,13 @@ static void __component_match_add(struct device *master,
 
 /**
  * component_match_add_release - add a component match entry with release callback
- * @master: device with the aggregate driver
+ * @parent: parent device of the aggregate driver
  * @matchptr: pointer to the list of component matches
  * @release: release function for @compare_data
  * @compare: compare function to match against all components
  * @compare_data: opaque pointer passed to the @compare function
  *
- * Adds a new component match to the list stored in @matchptr, which the @master
+ * Adds a new component match to the list stored in @matchptr, which the
  * aggregate driver needs to function. The list of component matches pointed to
  * by @matchptr must be initialized to NULL before adding the first match. This
  * only matches against components added with component_add().
@@ -393,24 +389,24 @@ static void __component_match_add(struct device *master,
  *
  * See also component_match_add() and component_match_add_typed().
  */
-void component_match_add_release(struct device *master,
+void component_match_add_release(struct device *parent,
 	struct component_match **matchptr,
 	void (*release)(struct device *, void *),
 	int (*compare)(struct device *, void *), void *compare_data)
 {
-	__component_match_add(master, matchptr, release, compare, NULL,
+	__component_match_add(parent, matchptr, release, compare, NULL,
 			      compare_data);
 }
 EXPORT_SYMBOL(component_match_add_release);
 
 /**
  * component_match_add_typed - add a component match entry for a typed component
- * @master: device with the aggregate driver
+ * @parent: parent device of the aggregate driver
  * @matchptr: pointer to the list of component matches
  * @compare_typed: compare function to match against all typed components
  * @compare_data: opaque pointer passed to the @compare function
  *
- * Adds a new component match to the list stored in @matchptr, which the @master
+ * Adds a new component match to the list stored in @matchptr, which the
  * aggregate driver needs to function. The list of component matches pointed to
  * by @matchptr must be initialized to NULL before adding the first match. This
  * only matches against components added with component_add_typed().
@@ -420,33 +416,33 @@ EXPORT_SYMBOL(component_match_add_release);
  *
  * See also component_match_add_release() and component_match_add_typed().
  */
-void component_match_add_typed(struct device *master,
+void component_match_add_typed(struct device *parent,
 	struct component_match **matchptr,
 	int (*compare_typed)(struct device *, int, void *), void *compare_data)
 {
-	__component_match_add(master, matchptr, NULL, NULL, compare_typed,
+	__component_match_add(parent, matchptr, NULL, NULL, compare_typed,
 			      compare_data);
 }
 EXPORT_SYMBOL(component_match_add_typed);
 
-static void free_master(struct master *master)
+static void free_aggregate_device(struct aggregate_device *adev)
 {
-	struct component_match *match = master->match;
+	struct component_match *match = adev->match;
 	int i;
 
-	component_master_debugfs_del(master);
-	list_del(&master->node);
+	component_debugfs_del(adev);
+	list_del(&adev->node);
 
 	if (match) {
 		for (i = 0; i < match->num; i++) {
 			struct component *c = match->compare[i].component;
 			if (c)
-				c->master = NULL;
+				c->adev = NULL;
 		}
 	}
 
-	ida_free(&aggregate_ida, master->id);
-	kfree(master);
+	ida_free(&aggregate_ida, adev->id);
+	kfree(adev);
 }
 
 /**
@@ -465,7 +461,7 @@ int component_master_add_with_match(struct device *parent,
 	const struct component_master_ops *ops,
 	struct component_match *match)
 {
-	struct master *master;
+	struct aggregate_device *adev;
 	int ret, id;
 
 	/* Reallocate the match array for its true size */
@@ -473,31 +469,31 @@ int component_master_add_with_match(struct device *parent,
 	if (ret)
 		return ret;
 
-	master = kzalloc(sizeof(*master), GFP_KERNEL);
-	if (!master)
+	adev = kzalloc(sizeof(*adev), GFP_KERNEL);
+	if (!adev)
 		return -ENOMEM;
 
 	id = ida_alloc(&aggregate_ida, GFP_KERNEL);
 	if (id < 0) {
-		kfree(master);
+		kfree(adev);
 		return id;
 	}
 
-	master->id = id;
-	master->parent = parent;
-	master->ops = ops;
-	master->match = match;
-	dev_set_name(&master->dev, "aggregate%d", id);
+	adev->id = id;
+	adev->parent = parent;
+	adev->ops = ops;
+	adev->match = match;
+	dev_set_name(&adev->dev, "aggregate%d", id);
 
-	component_master_debugfs_add(master);
-	/* Add to the list of available masters. */
+	component_debugfs_add(adev);
+	/* Add to the list of available aggregate devices. */
 	mutex_lock(&component_mutex);
-	list_add(&master->node, &masters);
+	list_add(&adev->node, &aggregate_devices);
 
-	ret = try_to_bring_up_master(master, NULL);
+	ret = try_to_bring_up_aggregate_device(adev, NULL);
 
 	if (ret < 0)
-		free_master(master);
+		free_aggregate_device(adev);
 
 	mutex_unlock(&component_mutex);
 
@@ -517,25 +513,25 @@ EXPORT_SYMBOL_GPL(component_master_add_with_match);
 void component_master_del(struct device *parent,
 	const struct component_master_ops *ops)
 {
-	struct master *master;
+	struct aggregate_device *adev;
 
 	mutex_lock(&component_mutex);
-	master = __master_find(parent, ops);
-	if (master) {
-		take_down_master(master);
-		free_master(master);
+	adev = __aggregate_find(parent, ops);
+	if (adev) {
+		take_down_aggregate_device(adev);
+		free_aggregate_device(adev);
 	}
 	mutex_unlock(&component_mutex);
 }
 EXPORT_SYMBOL_GPL(component_master_del);
 
 static void component_unbind(struct component *component,
-	struct master *master, void *data)
+	struct aggregate_device *adev, void *data)
 {
 	WARN_ON(!component->bound);
 
 	if (component->ops && component->ops->unbind)
-		component->ops->unbind(component->dev, master->parent, data);
+		component->ops->unbind(component->dev, adev->parent, data);
 	component->bound = false;
 
 	/* Release all resources claimed in the binding of this component */
@@ -553,26 +549,26 @@ static void component_unbind(struct component *component,
  */
 void component_unbind_all(struct device *parent, void *data)
 {
-	struct master *master;
+	struct aggregate_device *adev;
 	struct component *c;
 	size_t i;
 
 	WARN_ON(!mutex_is_locked(&component_mutex));
 
-	master = __master_find(parent, NULL);
-	if (!master)
+	adev = __aggregate_find(parent, NULL);
+	if (!adev)
 		return;
 
 	/* Unbind components in reverse order */
-	for (i = master->match->num; i--; )
-		if (!master->match->compare[i].duplicate) {
-			c = master->match->compare[i].component;
-			component_unbind(c, master, data);
+	for (i = adev->match->num; i--; )
+		if (!adev->match->compare[i].duplicate) {
+			c = adev->match->compare[i].component;
+			component_unbind(c, adev, data);
 		}
 }
 EXPORT_SYMBOL_GPL(component_unbind_all);
 
-static int component_bind(struct component *component, struct master *master,
+static int component_bind(struct component *component, struct aggregate_device *adev,
 	void *data)
 {
 	int ret;
@@ -582,7 +578,7 @@ static int component_bind(struct component *component, struct master *master,
 	 * This allows us to roll-back a failed component without
 	 * affecting anything else.
 	 */
-	if (!devres_open_group(master->parent, NULL, GFP_KERNEL))
+	if (!devres_open_group(adev->parent, NULL, GFP_KERNEL))
 		return -ENOMEM;
 
 	/*
@@ -591,14 +587,14 @@ static int component_bind(struct component *component, struct master *master,
 	 * at the appropriate moment.
 	 */
 	if (!devres_open_group(component->dev, component, GFP_KERNEL)) {
-		devres_release_group(master->parent, NULL);
+		devres_release_group(adev->parent, NULL);
 		return -ENOMEM;
 	}
 
-	dev_dbg(master->parent, "binding %s (ops %ps)\n",
+	dev_dbg(adev->parent, "binding %s (ops %ps)\n",
 		dev_name(component->dev), component->ops);
 
-	ret = component->ops->bind(component->dev, master->parent, data);
+	ret = component->ops->bind(component->dev, adev->parent, data);
 	if (!ret) {
 		component->bound = true;
 
@@ -609,16 +605,16 @@ static int component_bind(struct component *component, struct master *master,
 		 * can clean those resources up independently.
 		 */
 		devres_close_group(component->dev, NULL);
-		devres_remove_group(master->parent, NULL);
+		devres_remove_group(adev->parent, NULL);
 
-		dev_info(master->parent, "bound %s (ops %ps)\n",
+		dev_info(adev->parent, "bound %s (ops %ps)\n",
 			 dev_name(component->dev), component->ops);
 	} else {
 		devres_release_group(component->dev, NULL);
-		devres_release_group(master->parent, NULL);
+		devres_release_group(adev->parent, NULL);
 
 		if (ret != -EPROBE_DEFER)
-			dev_err(master->parent, "failed to bind %s (ops %ps): %d\n",
+			dev_err(adev->parent, "failed to bind %s (ops %ps): %d\n",
 				dev_name(component->dev), component->ops, ret);
 	}
 
@@ -636,31 +632,31 @@ static int component_bind(struct component *component, struct master *master,
  */
 int component_bind_all(struct device *parent, void *data)
 {
-	struct master *master;
+	struct aggregate_device *adev;
 	struct component *c;
 	size_t i;
 	int ret = 0;
 
 	WARN_ON(!mutex_is_locked(&component_mutex));
 
-	master = __master_find(parent, NULL);
-	if (!master)
+	adev = __aggregate_find(parent, NULL);
+	if (!adev)
 		return -EINVAL;
 
 	/* Bind components in match order */
-	for (i = 0; i < master->match->num; i++)
-		if (!master->match->compare[i].duplicate) {
-			c = master->match->compare[i].component;
-			ret = component_bind(c, master, data);
+	for (i = 0; i < adev->match->num; i++)
+		if (!adev->match->compare[i].duplicate) {
+			c = adev->match->compare[i].component;
+			ret = component_bind(c, adev, data);
 			if (ret)
 				break;
 		}
 
 	if (ret != 0) {
 		for (; i > 0; i--)
-			if (!master->match->compare[i - 1].duplicate) {
-				c = master->match->compare[i - 1].component;
-				component_unbind(c, master, data);
+			if (!adev->match->compare[i - 1].duplicate) {
+				c = adev->match->compare[i - 1].component;
+				component_unbind(c, adev, data);
 			}
 	}
 
@@ -689,8 +685,8 @@ static int __component_add(struct device *dev, const struct component_ops *ops,
 
 	ret = try_to_bring_up_masters(component);
 	if (ret < 0) {
-		if (component->master)
-			remove_component(component->master, component);
+		if (component->adev)
+			remove_component(component->adev, component);
 		list_del(&component->node);
 
 		kfree(component);
@@ -771,9 +767,9 @@ void component_del(struct device *dev, const struct component_ops *ops)
 			break;
 		}
 
-	if (component && component->master) {
-		take_down_master(component->master);
-		remove_component(component->master, component);
+	if (component && component->adev) {
+		take_down_aggregate_device(component->adev);
+		remove_component(component->adev, component);
 	}
 
 	mutex_unlock(&component_mutex);
diff --git a/include/linux/component.h b/include/linux/component.h
index 16de18f473d7..71bfc3862633 100644
--- a/include/linux/component.h
+++ b/include/linux/component.h
@@ -41,7 +41,7 @@ void component_del(struct device *, const struct component_ops *);
 int component_bind_all(struct device *master, void *master_data);
 void component_unbind_all(struct device *master, void *master_data);
 
-struct master;
+struct aggregate_device;
 
 /**
  * struct component_master_ops - callback for the aggregate driver
-- 
https://chromeos.dev

