Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B08ED49EB86
	for <lists+dri-devel@lfdr.de>; Thu, 27 Jan 2022 21:01:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D99910E1AB;
	Thu, 27 Jan 2022 20:01:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x434.google.com (mail-pf1-x434.google.com
 [IPv6:2607:f8b0:4864:20::434])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A8B1C10E199
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Jan 2022 20:01:47 +0000 (UTC)
Received: by mail-pf1-x434.google.com with SMTP id u130so3791717pfc.2
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Jan 2022 12:01:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=o/2oSSYmQiFhdwKpwnUwhIjRZt1gkWQnLZey0tUdQ3Q=;
 b=F2EZsXHtz8SY1s6hx5bMUnrUGUyghuTmxSBrXDoJVX3NTp3Q7IiXCqTwdEcRuFf6H1
 iQqiH246et5NpTO8gqkGw+DJ7/sopjh34P/Eqv5n2kM+N7ULCvH7rtdaafLc7ZYaKq3a
 YQET0v2gDkhKyzZUvE/14z3q4yZTF0zwfEo1Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=o/2oSSYmQiFhdwKpwnUwhIjRZt1gkWQnLZey0tUdQ3Q=;
 b=R6Hz3uOaG/UTZ/RUNqNGQ5cCsQptaQCSp5c+WBYdYHqodZmI1I6IgUIwlgKjcHOO43
 j3pLv66c332u8ImRn/ejfeWBGrQKwsFR3PdiFK+Qa87sxPjPeLh3qzg9MMRNSxmbzivM
 Nmi6fyzpzawUzy1+AjyvQhM6pYOtLi1SvhAr+BXsIv2m9MsO/IsDXLaJTpBeh2X+Q+83
 M9zDpKdXh8ErGs0j3NlNNDKjMZSRnf6TCnOVwRcVxIgYfSDGkralMRcHkxPU3KvT39q0
 kvyflx4Y+oIgJX4sXhARsiiAxd38oHwLNLilEkYCbPqy1/Kpbj2OMGd3y9wBXYl+lQUf
 FuLQ==
X-Gm-Message-State: AOAM533kEEnjJLd+f1pvV4XD45MwVIo2iT30PszZuiTgtU2wHDJ4gWWM
 BvwmBuvziZoGPTmWXqHqbhBwcg==
X-Google-Smtp-Source: ABdhPJxNTd8UpqkCqSFPMqr5dnF5oOl6x1wJ8ztUhPI3BDZAPgxlL+ALaR+FXHt4B/tPwO2icIFh5g==
X-Received: by 2002:a63:dd0f:: with SMTP id t15mr3909390pgg.12.1643313707077; 
 Thu, 27 Jan 2022 12:01:47 -0800 (PST)
Received: from smtp.gmail.com ([2620:15c:202:201:9246:1838:3243:3071])
 by smtp.gmail.com with ESMTPSA id k21sm6561190pff.33.2022.01.27.12.01.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Jan 2022 12:01:46 -0800 (PST)
From: Stephen Boyd <swboyd@chromium.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Douglas Anderson <dianders@chromium.org>
Subject: [PATCH v6 01/35] component: Replace most references to 'master' with
 'aggregate device'
Date: Thu, 27 Jan 2022 12:01:07 -0800
Message-Id: <20220127200141.1295328-2-swboyd@chromium.org>
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
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Russell King <rmk+kernel@arm.linux.org.uk>, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Remove most references to 'master' in the code and replace them with
some form of 'aggregate device'. This better reflects the reality of
what this code does, i.e. an aggregate device that represents a
device like a GPU card once some set of devices that make up the
aggregate device probe and register with the component framework.

Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>
Cc: Rob Clark <robdclark@gmail.com>
Cc: Russell King <rmk+kernel@arm.linux.org.uk>
Cc: Saravana Kannan <saravanak@google.com>
Signed-off-by: Stephen Boyd <swboyd@chromium.org>
---
 drivers/base/component.c  | 242 +++++++++++++++++++-------------------
 include/linux/component.h |  18 +--
 2 files changed, 128 insertions(+), 132 deletions(-)

diff --git a/drivers/base/component.c b/drivers/base/component.c
index 2d25a6416587..34f9e0802719 100644
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
@@ -57,7 +52,7 @@ struct component_match {
 	struct component_match_array *compare;
 };
 
-struct master {
+struct aggregate_device {
 	struct list_head node;
 	bool bound;
 
@@ -68,7 +63,7 @@ struct master {
 
 struct component {
 	struct list_head node;
-	struct master *master;
+	struct aggregate_device *adev;
 	bool bound;
 
 	const struct component_ops *ops;
@@ -78,7 +73,7 @@ struct component {
 
 static DEFINE_MUTEX(component_mutex);
 static LIST_HEAD(component_list);
-static LIST_HEAD(masters);
+static LIST_HEAD(aggregate_devices);
 
 #ifdef CONFIG_DEBUG_FS
 
@@ -86,12 +81,12 @@ static struct dentry *component_debugfs_dir;
 
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
@@ -121,46 +116,46 @@ static int __init component_debug_init(void)
 
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
@@ -174,102 +169,103 @@ static struct component *find_component(struct master *master,
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
 
-	if (!devres_open_group(master->parent, master, GFP_KERNEL))
+	if (!devres_open_group(adev->parent, adev, GFP_KERNEL))
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
 
-	devres_close_group(master->parent, NULL);
-	master->bound = true;
+	devres_close_group(adev->parent, NULL);
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
@@ -278,12 +274,12 @@ static int try_to_bring_up_masters(struct component *component)
 	return ret;
 }
 
-static void take_down_master(struct master *master)
+static void take_down_aggregate_device(struct aggregate_device *adev)
 {
-	if (master->bound) {
-		master->ops->unbind(master->parent);
-		devres_release_group(master->parent, master);
-		master->bound = false;
+	if (adev->bound) {
+		adev->ops->unbind(adev->parent);
+		devres_release_group(adev->parent, adev);
+		adev->bound = false;
 	}
 }
 
@@ -324,7 +320,7 @@ static int component_match_realloc(struct component_match *match, size_t num)
 	return 0;
 }
 
-static void __component_match_add(struct device *master,
+static void __component_match_add(struct device *parent,
 	struct component_match **matchptr,
 	void (*release)(struct device *, void *),
 	int (*compare)(struct device *, void *),
@@ -344,7 +340,7 @@ static void __component_match_add(struct device *master,
 			return;
 		}
 
-		devres_add(master, match);
+		devres_add(parent, match);
 
 		*matchptr = match;
 	}
@@ -370,13 +366,13 @@ static void __component_match_add(struct device *master,
 
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
@@ -388,24 +384,24 @@ static void __component_match_add(struct device *master,
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
@@ -415,32 +411,32 @@ EXPORT_SYMBOL(component_match_add_release);
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
 
-	kfree(master);
+	kfree(adev);
 }
 
 /**
@@ -459,7 +455,7 @@ int component_master_add_with_match(struct device *parent,
 	const struct component_master_ops *ops,
 	struct component_match *match)
 {
-	struct master *master;
+	struct aggregate_device *adev;
 	int ret;
 
 	/* Reallocate the match array for its true size */
@@ -467,23 +463,23 @@ int component_master_add_with_match(struct device *parent,
 	if (ret)
 		return ret;
 
-	master = kzalloc(sizeof(*master), GFP_KERNEL);
-	if (!master)
+	adev = kzalloc(sizeof(*adev), GFP_KERNEL);
+	if (!adev)
 		return -ENOMEM;
 
-	master->parent = parent;
-	master->ops = ops;
-	master->match = match;
+	adev->parent = parent;
+	adev->ops = ops;
+	adev->match = match;
 
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
 
@@ -503,25 +499,25 @@ EXPORT_SYMBOL_GPL(component_master_add_with_match);
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
@@ -539,26 +535,26 @@ static void component_unbind(struct component *component,
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
@@ -568,7 +564,7 @@ static int component_bind(struct component *component, struct master *master,
 	 * This allows us to roll-back a failed component without
 	 * affecting anything else.
 	 */
-	if (!devres_open_group(master->parent, NULL, GFP_KERNEL))
+	if (!devres_open_group(adev->parent, NULL, GFP_KERNEL))
 		return -ENOMEM;
 
 	/*
@@ -577,14 +573,14 @@ static int component_bind(struct component *component, struct master *master,
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
 
@@ -595,16 +591,16 @@ static int component_bind(struct component *component, struct master *master,
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
 
@@ -622,31 +618,31 @@ static int component_bind(struct component *component, struct master *master,
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
 
@@ -675,8 +671,8 @@ static int __component_add(struct device *dev, const struct component_ops *ops,
 
 	ret = try_to_bring_up_masters(component);
 	if (ret < 0) {
-		if (component->master)
-			remove_component(component->master, component);
+		if (component->adev)
+			remove_component(component->adev, component);
 		list_del(&component->node);
 
 		kfree(component);
@@ -757,9 +753,9 @@ void component_del(struct device *dev, const struct component_ops *ops)
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
index 16de18f473d7..7012569c6546 100644
--- a/include/linux/component.h
+++ b/include/linux/component.h
@@ -38,10 +38,10 @@ int component_add_typed(struct device *dev, const struct component_ops *ops,
 	int subcomponent);
 void component_del(struct device *, const struct component_ops *);
 
-int component_bind_all(struct device *master, void *master_data);
-void component_unbind_all(struct device *master, void *master_data);
+int component_bind_all(struct device *parent, void *data);
+void component_unbind_all(struct device *parent, void *data);
 
-struct master;
+struct aggregate_device;
 
 /**
  * struct component_master_ops - callback for the aggregate driver
@@ -89,22 +89,22 @@ struct component_match;
 
 int component_master_add_with_match(struct device *,
 	const struct component_master_ops *, struct component_match *);
-void component_match_add_release(struct device *master,
+void component_match_add_release(struct device *parent,
 	struct component_match **matchptr,
 	void (*release)(struct device *, void *),
 	int (*compare)(struct device *, void *), void *compare_data);
-void component_match_add_typed(struct device *master,
+void component_match_add_typed(struct device *parent,
 	struct component_match **matchptr,
 	int (*compare_typed)(struct device *, int, void *), void *compare_data);
 
 /**
  * component_match_add - add a component match entry
- * @master: device with the aggregate driver
+ * @parent: device with the aggregate driver
  * @matchptr: pointer to the list of component matches
  * @compare: compare function to match against all components
  * @compare_data: opaque pointer passed to the @compare function
  *
- * Adds a new component match to the list stored in @matchptr, which the @master
+ * Adds a new component match to the list stored in @matchptr, which the @parent
  * aggregate driver needs to function. The list of component matches pointed to
  * by @matchptr must be initialized to NULL before adding the first match. This
  * only matches against components added with component_add().
@@ -114,11 +114,11 @@ void component_match_add_typed(struct device *master,
  *
  * See also component_match_add_release() and component_match_add_typed().
  */
-static inline void component_match_add(struct device *master,
+static inline void component_match_add(struct device *parent,
 	struct component_match **matchptr,
 	int (*compare)(struct device *, void *), void *compare_data)
 {
-	component_match_add_release(master, matchptr, NULL, compare,
+	component_match_add_release(parent, matchptr, NULL, compare,
 				    compare_data);
 }
 
-- 
https://chromeos.dev

