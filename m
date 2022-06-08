Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DE2A654286B
	for <lists+dri-devel@lfdr.de>; Wed,  8 Jun 2022 09:51:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C474310EE2E;
	Wed,  8 Jun 2022 07:51:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C219D10EC06;
 Wed,  8 Jun 2022 07:51:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1654674672; x=1686210672;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=QtTrlZqj9bVs6HwVrGuEtebmB+4a004ZA4qAlY6b/g8=;
 b=Q/PwWfEen+e3EZRc382XKkDDTk1VOV6FA+YN4M6fHd7gX1fNoyTsDZ0R
 V+dXmqCN13g4lmbkhmPqemB3AyXf8LKrTD3TxKba5unYcyNAk8Op6jnR5
 Ct4pb7epwtFWkT1vzj+MKIWs+x/MBkUZqob6FE66aloBWu8ePFBjZPkxT
 CSm/H4Jd+SCvaVf4DaEln1ysf5Oloq28xyZNp5iHQL5W7MLKDQJGLBxS7
 RFXlw/aCbQBZB5LeK1kWgAl0450iSkY2IoxSqQLLJHYtROv3zDOMS+Fr2
 Hpe4KFEtyyVjR2IPh54AhkmnaMG2bF9bANUoXX7LZYDhChPMeRee6T7z5 A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10371"; a="256634417"
X-IronPort-AV: E=Sophos;i="5.91,285,1647327600"; d="scan'208";a="256634417"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jun 2022 00:51:12 -0700
X-IronPort-AV: E=Sophos;i="5.91,285,1647327600"; d="scan'208";a="584720037"
Received: from jkosticx-mobl.amr.corp.intel.com (HELO localhost)
 ([10.252.58.130])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jun 2022 00:51:10 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 05/15] drm/edid: add new interfaces around struct drm_edid
Date: Wed,  8 Jun 2022 10:50:35 +0300
Message-Id: <5a6532a94cad6a79424f6d1918dbe7b7d607ac03.1654674560.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1654674560.git.jani.nikula@intel.com>
References: <cover.1654674560.git.jani.nikula@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
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
Cc: jani.nikula@intel.com, David Airlie <airlied@linux.ie>,
 intel-gfx@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add new functions drm_edid_read(), drm_edid_read_ddc(), and
drm_edid_read_custom() to replace drm_get_edid() and drm_do_get_edid()
for reading the EDID. The transition is expected to happen over a fairly
long time.

Note that the new drm_edid_read*() functions do not do any of the
connector updates anymore. The reading and parsing will be completely
separated from each other.

Add new functions drm_edid_alloc(), drm_edid_dup(), and drm_edid_free()
for allocating and freeing drm_edid containers.

Cc: David Airlie <airlied@linux.ie>
Cc: Daniel Vetter <daniel@ffwll.ch>
Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/drm_edid.c | 245 +++++++++++++++++++++++++++++++++----
 include/drm/drm_edid.h     |   9 ++
 2 files changed, 230 insertions(+), 24 deletions(-)

diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
index 2beaa48301c1..2bdaf1e34a9d 100644
--- a/drivers/gpu/drm/drm_edid.c
+++ b/drivers/gpu/drm/drm_edid.c
@@ -2226,29 +2226,9 @@ static enum edid_block_status edid_block_read(void *block, unsigned int block_nu
 	return status;
 }
 
-/**
- * drm_do_get_edid - get EDID data using a custom EDID block read function
- * @connector: connector we're probing
- * @read_block: EDID block read function
- * @context: private data passed to the block read function
- *
- * When the I2C adapter connected to the DDC bus is hidden behind a device that
- * exposes a different interface to read EDID blocks this function can be used
- * to get EDID data using a custom block read function.
- *
- * As in the general case the DDC bus is accessible by the kernel at the I2C
- * level, drivers must make all reasonable efforts to expose it as an I2C
- * adapter and use drm_get_edid() instead of abusing this function.
- *
- * The EDID may be overridden using debugfs override_edid or firmware EDID
- * (drm_load_edid_firmware() and drm.edid_firmware parameter), in this priority
- * order. Having either of them bypasses actual EDID reads.
- *
- * Return: Pointer to valid EDID or NULL if we couldn't find any.
- */
-struct edid *drm_do_get_edid(struct drm_connector *connector,
-			     read_block_fn read_block,
-			     void *context)
+static struct edid *_drm_do_get_edid(struct drm_connector *connector,
+				     read_block_fn read_block, void *context,
+				     size_t *size)
 {
 	enum edid_block_status status;
 	int i, invalid_blocks = 0;
@@ -2315,14 +2295,125 @@ struct edid *drm_do_get_edid(struct drm_connector *connector,
 	}
 
 ok:
+	if (size)
+		*size = alloc_size;
+
 	return edid;
 
 fail:
 	kfree(edid);
 	return NULL;
 }
+
+/**
+ * drm_do_get_edid - get EDID data using a custom EDID block read function
+ * @connector: connector we're probing
+ * @read_block: EDID block read function
+ * @context: private data passed to the block read function
+ *
+ * When the I2C adapter connected to the DDC bus is hidden behind a device that
+ * exposes a different interface to read EDID blocks this function can be used
+ * to get EDID data using a custom block read function.
+ *
+ * As in the general case the DDC bus is accessible by the kernel at the I2C
+ * level, drivers must make all reasonable efforts to expose it as an I2C
+ * adapter and use drm_get_edid() instead of abusing this function.
+ *
+ * The EDID may be overridden using debugfs override_edid or firmware EDID
+ * (drm_load_edid_firmware() and drm.edid_firmware parameter), in this priority
+ * order. Having either of them bypasses actual EDID reads.
+ *
+ * Return: Pointer to valid EDID or NULL if we couldn't find any.
+ */
+struct edid *drm_do_get_edid(struct drm_connector *connector,
+			     read_block_fn read_block,
+			     void *context)
+{
+	return _drm_do_get_edid(connector, read_block, context, NULL);
+}
 EXPORT_SYMBOL_GPL(drm_do_get_edid);
 
+/* Allocate struct drm_edid container *without* duplicating the edid data */
+static const struct drm_edid *_drm_edid_alloc(const void *edid, size_t size)
+{
+	struct drm_edid *drm_edid;
+
+	if (!edid || !size || size < EDID_LENGTH)
+		return NULL;
+
+	drm_edid = kzalloc(sizeof(*drm_edid), GFP_KERNEL);
+	if (drm_edid) {
+		drm_edid->edid = edid;
+		drm_edid->size = size;
+	}
+
+	return drm_edid;
+}
+
+/**
+ * drm_edid_alloc - Allocate a new drm_edid container
+ * @edid: Pointer to raw EDID data
+ * @size: Size of memory allocated for EDID
+ *
+ * Allocate a new drm_edid container. Do not calculate edid size from edid, pass
+ * the actual size that has been allocated for the data. There is no validation
+ * of the raw EDID data against the size, but at least the EDID base block must
+ * fit in the buffer.
+ *
+ * The returned pointer must be freed using drm_edid_free().
+ *
+ * Return: drm_edid container, or NULL on errors
+ */
+const struct drm_edid *drm_edid_alloc(const void *edid, size_t size)
+{
+	const struct drm_edid *drm_edid;
+
+	if (!edid || !size || size < EDID_LENGTH)
+		return NULL;
+
+	edid = kmemdup(edid, size, GFP_KERNEL);
+	if (!edid)
+		return NULL;
+
+	drm_edid = _drm_edid_alloc(edid, size);
+	if (!drm_edid)
+		kfree(edid);
+
+	return drm_edid;
+}
+EXPORT_SYMBOL(drm_edid_alloc);
+
+/**
+ * drm_edid_dup - Duplicate a drm_edid container
+ * @drm_edid: EDID to duplicate
+ *
+ * The returned pointer must be freed using drm_edid_free().
+ *
+ * Returns: drm_edid container copy, or NULL on errors
+ */
+const struct drm_edid *drm_edid_dup(const struct drm_edid *drm_edid)
+{
+	if (!drm_edid)
+		return NULL;
+
+	return drm_edid_alloc(drm_edid->edid, drm_edid->size);
+}
+EXPORT_SYMBOL(drm_edid_dup);
+
+/**
+ * drm_edid_free - Free the drm_edid container
+ * @drm_edid: EDID to free
+ */
+void drm_edid_free(const struct drm_edid *drm_edid)
+{
+	if (!drm_edid)
+		return;
+
+	kfree(drm_edid->edid);
+	kfree(drm_edid);
+}
+EXPORT_SYMBOL(drm_edid_free);
+
 /**
  * drm_probe_ddc() - probe DDC presence
  * @adapter: I2C adapter to probe
@@ -2359,12 +2450,118 @@ struct edid *drm_get_edid(struct drm_connector *connector,
 	if (connector->force == DRM_FORCE_UNSPECIFIED && !drm_probe_ddc(adapter))
 		return NULL;
 
-	edid = drm_do_get_edid(connector, drm_do_probe_ddc_edid, adapter);
+	edid = _drm_do_get_edid(connector, drm_do_probe_ddc_edid, adapter, NULL);
 	drm_connector_update_edid_property(connector, edid);
 	return edid;
 }
 EXPORT_SYMBOL(drm_get_edid);
 
+/**
+ * drm_edid_read_custom - Read EDID data using given EDID block read function
+ * @connector: Connector to use
+ * @read_block: EDID block read function
+ * @context: Private data passed to the block read function
+ *
+ * When the I2C adapter connected to the DDC bus is hidden behind a device that
+ * exposes a different interface to read EDID blocks this function can be used
+ * to get EDID data using a custom block read function.
+ *
+ * As in the general case the DDC bus is accessible by the kernel at the I2C
+ * level, drivers must make all reasonable efforts to expose it as an I2C
+ * adapter and use drm_edid_read() or drm_edid_read_ddc() instead of abusing
+ * this function.
+ *
+ * The EDID may be overridden using debugfs override_edid or firmware EDID
+ * (drm_load_edid_firmware() and drm.edid_firmware parameter), in this priority
+ * order. Having either of them bypasses actual EDID reads.
+ *
+ * The returned pointer must be freed using drm_edid_free().
+ *
+ * Return: Pointer to EDID, or NULL if probe/read failed.
+ */
+const struct drm_edid *drm_edid_read_custom(struct drm_connector *connector,
+					    read_block_fn read_block,
+					    void *context)
+{
+	const struct drm_edid *drm_edid;
+	struct edid *edid;
+	size_t size = 0;
+
+	edid = _drm_do_get_edid(connector, read_block, context, &size);
+	if (!edid)
+		return NULL;
+
+	/* Sanity check for now */
+	drm_WARN_ON(connector->dev, !size);
+
+	drm_edid = _drm_edid_alloc(edid, size);
+	if (!drm_edid)
+		kfree(edid);
+
+	return drm_edid;
+}
+EXPORT_SYMBOL(drm_edid_read_custom);
+
+/**
+ * drm_edid_read_ddc - Read EDID data using given I2C adapter
+ * @connector: Connector to use
+ * @adapter: I2C adapter to use for DDC
+ *
+ * Read EDID using the given I2C adapter.
+ *
+ * The EDID may be overridden using debugfs override_edid or firmware EDID
+ * (drm_load_edid_firmware() and drm.edid_firmware parameter), in this priority
+ * order. Having either of them bypasses actual EDID reads.
+ *
+ * Prefer initializing connector->ddc with drm_connector_init_with_ddc() and
+ * using drm_edid_read() instead of this function.
+ *
+ * The returned pointer must be freed using drm_edid_free().
+ *
+ * Return: Pointer to EDID, or NULL if probe/read failed.
+ */
+const struct drm_edid *drm_edid_read_ddc(struct drm_connector *connector,
+					 struct i2c_adapter *adapter)
+{
+	const struct drm_edid *drm_edid;
+
+	if (connector->force == DRM_FORCE_OFF)
+		return NULL;
+
+	if (connector->force == DRM_FORCE_UNSPECIFIED && !drm_probe_ddc(adapter))
+		return NULL;
+
+	drm_edid = drm_edid_read_custom(connector, drm_do_probe_ddc_edid, adapter);
+
+	/* Note: Do *not* call connector updates here. */
+
+	return drm_edid;
+}
+EXPORT_SYMBOL(drm_edid_read_ddc);
+
+/**
+ * drm_edid_read - Read EDID data using connector's I2C adapter
+ * @connector: Connector to use
+ *
+ * Read EDID using the connector's I2C adapter.
+ *
+ * The EDID may be overridden using debugfs override_edid or firmware EDID
+ * (drm_load_edid_firmware() and drm.edid_firmware parameter), in this priority
+ * order. Having either of them bypasses actual EDID reads.
+ *
+ * The returned pointer must be freed using drm_edid_free().
+ *
+ * Return: Pointer to EDID, or NULL if probe/read failed.
+ */
+const struct drm_edid *drm_edid_read(struct drm_connector *connector)
+{
+	if (drm_WARN_ON(connector->dev, !connector->ddc))
+		return NULL;
+
+	return drm_edid_read_ddc(connector, connector->ddc);
+}
+EXPORT_SYMBOL(drm_edid_read);
+
 static u32 edid_extract_panel_id(const struct edid *edid)
 {
 	/*
diff --git a/include/drm/drm_edid.h b/include/drm/drm_edid.h
index 95ac09ef41b2..9d2d78135dee 100644
--- a/include/drm/drm_edid.h
+++ b/include/drm/drm_edid.h
@@ -594,6 +594,15 @@ drm_display_mode_from_cea_vic(struct drm_device *dev,
 			      u8 video_code);
 
 /* Interface based on struct drm_edid */
+const struct drm_edid *drm_edid_alloc(const void *edid, size_t size);
+const struct drm_edid *drm_edid_dup(const struct drm_edid *drm_edid);
+void drm_edid_free(const struct drm_edid *drm_edid);
+const struct drm_edid *drm_edid_read(struct drm_connector *connector);
+const struct drm_edid *drm_edid_read_ddc(struct drm_connector *connector,
+					 struct i2c_adapter *adapter);
+const struct drm_edid *drm_edid_read_custom(struct drm_connector *connector,
+					    int (*read_block)(void *context, u8 *buf, unsigned int block, size_t len),
+					    void *context);
 const u8 *drm_find_edid_extension(const struct drm_edid *drm_edid,
 				  int ext_id, int *ext_index);
 
-- 
2.30.2

