Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DFBC9EDABB
	for <lists+dri-devel@lfdr.de>; Thu, 12 Dec 2024 00:03:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E064810EC4A;
	Wed, 11 Dec 2024 23:02:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="a/2u2hc3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 88BF110EC48;
 Wed, 11 Dec 2024 23:02:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1733958173; x=1765494173;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=5AMCYrr3tmfkJeGILEYoPC9m08zwnWcuet8VqnZ36SQ=;
 b=a/2u2hc3aD/l1mn9XbBr5qeVR32JVvy7xrssnGiV05Q0JEA3W4awgqHU
 a0FY0iJfoZ84vbri9uW6ozYhWrmxJy94L7+uGos55dHGG/0udcqazTbd8
 12mZSKbGRhWc+3SEdl38lT/zMpX+xHeug1bbhSIchCPws7Q1F55qrCI6h
 Lr5sfr674CYhS/wyAXtgWTDtt+0CIGNQ+R+hrQLM2FcieI52W1o3FY+cH
 J2ByvzjjBoThccEBpL4hDFRTy9MPZG/BBjm5AEPtfSZ+iYQenw+md+xVB
 IiyrRzOBcHBo0/742oWkbtZTdopl/f9RuLSGBFKIKZ8bETGlrkguwZP/B g==;
X-CSE-ConnectionGUID: Tn3GAuv7TI6dVuMAEA4pPQ==
X-CSE-MsgGUID: JOW2xDV5TrW4cffBGoKvyA==
X-IronPort-AV: E=McAfee;i="6700,10204,11283"; a="34401466"
X-IronPort-AV: E=Sophos;i="6.12,226,1728975600"; d="scan'208";a="34401466"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Dec 2024 15:02:53 -0800
X-CSE-ConnectionGUID: 8SPDvEITS3G0x5huELUbbA==
X-CSE-MsgGUID: gHHJxNa2SlyxAdhKGfdRVg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="126962338"
Received: from ideak-desk.fi.intel.com ([10.237.72.78])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Dec 2024 15:02:50 -0800
From: Imre Deak <imre.deak@intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org, Jani Nikula <jani.nikula@intel.com>,
 Simona Vetter <simona@ffwll.ch>, Maxime Ripard <mripard@kernel.org>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: [PATCH v3 01/11] drm/connector: Add a way to init/add a connector in
 separate steps
Date: Thu, 12 Dec 2024 01:03:18 +0200
Message-ID: <20241211230328.4012496-2-imre.deak@intel.com>
X-Mailer: git-send-email 2.44.2
In-Reply-To: <20241211230328.4012496-1-imre.deak@intel.com>
References: <20241211230328.4012496-1-imre.deak@intel.com>
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

Atm when the connector is added to the drm_mode_config::connector_list,
the connector may not be fully initialized yet. This is not a problem
for static connectors initialized/added during driver loading, for which
the driver ensures that look-ups via the above list are not possible
until all the connector and other required state is fully initialized
already. It's also not a problem for user space looking up either a
static or dynamic (see what this is below) connector, since this will be
only possible once the connector is registered.

A dynamic - atm only a DP MST - connector can be initialized and added
after the load time initialization is done. Such a connector may be
looked up by in-kernel users once it's added to the connector list. In
particular a hotplug handler could perform a detection on all the
connectors on the list and hence find a connector there which isn't yet
initialized. For instance the connector's helper hooks may be unset,
leading to a NULL dereference while the detect helper calls the
connector's drm_connector_helper_funcs::detect() or detect_ctx()
handler.

To resolve the above issue, add a way for dynamic connectors to
separately initialize the DRM core specific parts of the connector
without adding it to the connector list - by calling the new
drm_connector_dynamic_init() - and to add the connector to the list
later once all the initialization is complete and the connector is
registered - by calling the new drm_connector_dynamic_register().

Adding the above 2 functions was also motivated to make the distinction
of the interface between static and dynamic connectors clearer: Drivers
should manually initialize and register only dynamic connectors (with
the above 2 functions). A driver should only initialize a static
connector (with one of the drm_connector_init*, drmm_connector_init*
functions) while the registration of the connector will be done
automatically by DRM core.

v2: (Jani)
- Let initing DDC as well via drm_connector_init_core().
- Rename __drm_connector_init to drm_connector_init_core_and_add().

v3:
- Rename drm_connector_init_core() to drm_connector_dynamic_init().
  (Sima)
- Instead of exporting drm_connector_add(), move adding the connector
  to the registration step via a new drm_connector_dynamic_register().
  (Sima)
- Update drm_connector_dynamic_init()'s function documentation and the
  commit log according to the above changes.
- Update the commit log describing the problematic scenario during
  connector detection. (Maxime)

Cc: Jani Nikula <jani.nikula@intel.com>
Cc: Simona Vetter <simona@ffwll.ch>
Cc: Maxime Ripard <mripard@kernel.org>
Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com> (v1)
Signed-off-by: Imre Deak <imre.deak@intel.com>
---
 drivers/gpu/drm/drm_connector.c | 150 +++++++++++++++++++++++++++-----
 include/drm/drm_connector.h     |   6 ++
 2 files changed, 136 insertions(+), 20 deletions(-)

diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_connector.c
index fc35f47e2849e..a53e5629ba6c1 100644
--- a/drivers/gpu/drm/drm_connector.c
+++ b/drivers/gpu/drm/drm_connector.c
@@ -218,11 +218,11 @@ void drm_connector_free_work_fn(struct work_struct *work)
 	}
 }
 
-static int __drm_connector_init(struct drm_device *dev,
-				struct drm_connector *connector,
-				const struct drm_connector_funcs *funcs,
-				int connector_type,
-				struct i2c_adapter *ddc)
+static int drm_connector_init_only(struct drm_device *dev,
+				   struct drm_connector *connector,
+				   const struct drm_connector_funcs *funcs,
+				   int connector_type,
+				   struct i2c_adapter *ddc)
 {
 	struct drm_mode_config *config = &dev->mode_config;
 	int ret;
@@ -273,6 +273,7 @@ static int __drm_connector_init(struct drm_device *dev,
 	/* provide ddc symlink in sysfs */
 	connector->ddc = ddc;
 
+	INIT_LIST_HEAD(&connector->head);
 	INIT_LIST_HEAD(&connector->global_connector_list_entry);
 	INIT_LIST_HEAD(&connector->probed_modes);
 	INIT_LIST_HEAD(&connector->modes);
@@ -288,14 +289,6 @@ static int __drm_connector_init(struct drm_device *dev,
 
 	drm_connector_get_cmdline_mode(connector);
 
-	/* We should add connectors at the end to avoid upsetting the connector
-	 * index too much.
-	 */
-	spin_lock_irq(&config->connector_list_lock);
-	list_add_tail(&connector->head, &config->connector_list);
-	config->num_connector++;
-	spin_unlock_irq(&config->connector_list_lock);
-
 	if (connector_type != DRM_MODE_CONNECTOR_VIRTUAL &&
 	    connector_type != DRM_MODE_CONNECTOR_WRITEBACK)
 		drm_connector_attach_edid_property(connector);
@@ -332,6 +325,58 @@ static int __drm_connector_init(struct drm_device *dev,
 	return ret;
 }
 
+static void drm_connector_add(struct drm_connector *connector)
+{
+	struct drm_device *dev = connector->dev;
+	struct drm_mode_config *config = &dev->mode_config;
+
+	/*
+	 * TODO: Change this to a WARN, once all drivers are converted to
+	 * call drm_connector_dynamic_init() for MST connectors.
+	 */
+	if (!list_empty(&connector->head))
+		return;
+
+	spin_lock_irq(&config->connector_list_lock);
+	list_add_tail(&connector->head, &config->connector_list);
+	config->num_connector++;
+	spin_unlock_irq(&config->connector_list_lock);
+}
+
+static void drm_connector_remove(struct drm_connector *connector)
+{
+	struct drm_device *dev = connector->dev;
+
+	/*
+	 * For dynamic connectors drm_connector_cleanup() can call this function
+	 * before the connector is registered and added to the list.
+	 */
+	if (list_empty(&connector->head))
+		return;
+
+	spin_lock_irq(&dev->mode_config.connector_list_lock);
+	list_del_init(&connector->head);
+	dev->mode_config.num_connector--;
+	spin_unlock_irq(&dev->mode_config.connector_list_lock);
+}
+
+static int drm_connector_init_and_add(struct drm_device *dev,
+				      struct drm_connector *connector,
+				      const struct drm_connector_funcs *funcs,
+				      int connector_type,
+				      struct i2c_adapter *ddc)
+{
+	int ret;
+
+	ret = drm_connector_init_only(dev, connector, funcs, connector_type, ddc);
+	if (ret)
+		return ret;
+
+	drm_connector_add(connector);
+
+	return 0;
+}
+
 /**
  * drm_connector_init - Init a preallocated connector
  * @dev: DRM device
@@ -361,10 +406,51 @@ int drm_connector_init(struct drm_device *dev,
 	if (drm_WARN_ON(dev, !(funcs && funcs->destroy)))
 		return -EINVAL;
 
-	return __drm_connector_init(dev, connector, funcs, connector_type, NULL);
+	return drm_connector_init_and_add(dev, connector, funcs, connector_type, NULL);
 }
 EXPORT_SYMBOL(drm_connector_init);
 
+/**
+ * drm_connector_dynamic_init - Init a preallocated dynamic connector
+ * @dev: DRM device
+ * @connector: the connector to init
+ * @funcs: callbacks for this connector
+ * @connector_type: user visible type of the connector
+ * @ddc: pointer to the associated ddc adapter
+ *
+ * Initialises a preallocated dynamic connector. Connectors should be
+ * subclassed as part of driver connector objects. The connector
+ * structure should not be allocated with devm_kzalloc().
+ *
+ * Drivers should call this for dynamic connectors which can be hotplugged
+ * after drm_dev_register() has been called already, e.g. DP MST connectors.
+ * For all other - static - connectors, drivers should call one of the
+ * drm_connector_init*()/drmm_connector_init*() functions.
+ *
+ * After calling this function the drivers must call
+ * drm_connector_dynamic_register().
+ *
+ * To remove the connector the driver must call drm_connector_unregister()
+ * followed by drm_connector_put(). Putting the last reference will call the
+ * driver's &drm_connector_funcs.destroy hook, which in turn must call
+ * drm_connector_cleanup() and free the connector structure.
+ *
+ * Returns:
+ * Zero on success, error code on failure.
+ */
+int drm_connector_dynamic_init(struct drm_device *dev,
+			       struct drm_connector *connector,
+			       const struct drm_connector_funcs *funcs,
+			       int connector_type,
+			       struct i2c_adapter *ddc)
+{
+	if (drm_WARN_ON(dev, !(funcs && funcs->destroy)))
+		return -EINVAL;
+
+	return drm_connector_init_only(dev, connector, funcs, connector_type, ddc);
+}
+EXPORT_SYMBOL(drm_connector_dynamic_init);
+
 /**
  * drm_connector_init_with_ddc - Init a preallocated connector
  * @dev: DRM device
@@ -398,7 +484,7 @@ int drm_connector_init_with_ddc(struct drm_device *dev,
 	if (drm_WARN_ON(dev, !(funcs && funcs->destroy)))
 		return -EINVAL;
 
-	return __drm_connector_init(dev, connector, funcs, connector_type, ddc);
+	return drm_connector_init_and_add(dev, connector, funcs, connector_type, ddc);
 }
 EXPORT_SYMBOL(drm_connector_init_with_ddc);
 
@@ -442,7 +528,7 @@ int drmm_connector_init(struct drm_device *dev,
 	if (drm_WARN_ON(dev, funcs && funcs->destroy))
 		return -EINVAL;
 
-	ret = __drm_connector_init(dev, connector, funcs, connector_type, ddc);
+	ret = drm_connector_init_and_add(dev, connector, funcs, connector_type, ddc);
 	if (ret)
 		return ret;
 
@@ -659,10 +745,8 @@ void drm_connector_cleanup(struct drm_connector *connector)
 	connector->name = NULL;
 	fwnode_handle_put(connector->fwnode);
 	connector->fwnode = NULL;
-	spin_lock_irq(&dev->mode_config.connector_list_lock);
-	list_del(&connector->head);
-	dev->mode_config.num_connector--;
-	spin_unlock_irq(&dev->mode_config.connector_list_lock);
+
+	drm_connector_remove(connector);
 
 	WARN_ON(connector->state && !connector->funcs->atomic_destroy_state);
 	if (connector->state && connector->funcs->atomic_destroy_state)
@@ -749,6 +833,32 @@ int drm_connector_register(struct drm_connector *connector)
 }
 EXPORT_SYMBOL(drm_connector_register);
 
+/**
+ * drm_connector_dynamic_register - register a dynamic connector
+ * @connector: the connector to register
+ *
+ * Register userspace interfaces for a connector. Only call this for connectors
+ * initialized by calling drm_connector_dynamic_init(). All other connectors
+ * will be registered automatically when calling drm_dev_register().
+ *
+ * When the connector is no longer available the driver must call
+ * drm_connector_unregister().
+ *
+ * Returns:
+ * Zero on success, error code on failure.
+ */
+int drm_connector_dynamic_register(struct drm_connector *connector)
+{
+	/* Was the connector inited already? */
+	if (WARN_ON(!(connector->funcs && connector->funcs->destroy)))
+		return -EINVAL;
+
+	drm_connector_add(connector);
+
+	return drm_connector_register(connector);
+}
+EXPORT_SYMBOL(drm_connector_dynamic_register);
+
 /**
  * drm_connector_unregister - unregister a connector
  * @connector: the connector to unregister
diff --git a/include/drm/drm_connector.h b/include/drm/drm_connector.h
index e3fa43291f449..f766d194221d1 100644
--- a/include/drm/drm_connector.h
+++ b/include/drm/drm_connector.h
@@ -2126,6 +2126,11 @@ int drm_connector_init(struct drm_device *dev,
 		       struct drm_connector *connector,
 		       const struct drm_connector_funcs *funcs,
 		       int connector_type);
+int drm_connector_dynamic_init(struct drm_device *dev,
+			       struct drm_connector *connector,
+			       const struct drm_connector_funcs *funcs,
+			       int connector_type,
+			       struct i2c_adapter *ddc);
 int drm_connector_init_with_ddc(struct drm_device *dev,
 				struct drm_connector *connector,
 				const struct drm_connector_funcs *funcs,
@@ -2147,6 +2152,7 @@ int drmm_connector_hdmi_init(struct drm_device *dev,
 			     unsigned int max_bpc);
 void drm_connector_attach_edid_property(struct drm_connector *connector);
 int drm_connector_register(struct drm_connector *connector);
+int drm_connector_dynamic_register(struct drm_connector *connector);
 void drm_connector_unregister(struct drm_connector *connector);
 int drm_connector_attach_encoder(struct drm_connector *connector,
 				      struct drm_encoder *encoder);
-- 
2.44.2

