Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D1BD82C3F7
	for <lists+dri-devel@lfdr.de>; Fri, 12 Jan 2024 17:50:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D9A5B10E126;
	Fri, 12 Jan 2024 16:50:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3154210E126
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Jan 2024 16:50:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1705078232; x=1736614232;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=funAo//Uq1t9T8z6syIh0943O5GzAKHrfv8cgwBjWM8=;
 b=ULuFdfHraK78535QJuXU6geDLo7Ibt6TrQsxqkF/sakzpxUyXy0aIOOM
 LrCS5gtwkapsDsT2EzhQurrsiI5IYajbc2XzAKv1Qe2jH7m7CTW/UxhSg
 5170nCwQ4WRBkwJRvxc++GVp4c+ZgqCKpKnRwnm1xHQ6y8PfGMKageDE5
 gqZdjpQZwnAVMIcCMTqHJqYUalLE3A1BaUry7G/KAWQyWbT9tfdmNlDPK
 c2Mkaba4XerVF8ieke32yYfUrsTfH6lGeADC1ODGA1nLaefI90r7gDXBx
 6QYoEBd/u4n9AURpofYgPLRgSmqe4T1i+dEbl8KovOkEYRDpSRycnbPru w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10951"; a="6578816"
X-IronPort-AV: E=Sophos;i="6.04,190,1695711600"; 
   d="scan'208";a="6578816"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jan 2024 08:50:32 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,190,1695711600"; d="scan'208";a="24764305"
Received: from tsenx-mobl.ger.corp.intel.com (HELO localhost) ([10.252.38.158])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jan 2024 08:50:31 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 5/6] drm/edid: add a helper for EDID sysfs property show
Date: Fri, 12 Jan 2024 18:49:57 +0200
Message-Id: <402fe1ec6b458c8f6ea166f09d3ed22202e8452c.1705078136.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1705078136.git.jani.nikula@intel.com>
References: <cover.1705078136.git.jani.nikula@intel.com>
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
Cc: jani.nikula@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add a helper to get the EDID property for sysfs property show. This
hides all the edid_blob_ptr usage within drm_edid.c.

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/drm_crtc_internal.h |  2 ++
 drivers/gpu/drm/drm_edid.c          | 33 +++++++++++++++++++++++++++++
 drivers/gpu/drm/drm_sysfs.c         | 24 ++-------------------
 3 files changed, 37 insertions(+), 22 deletions(-)

diff --git a/drivers/gpu/drm/drm_crtc_internal.h b/drivers/gpu/drm/drm_crtc_internal.h
index a514d5207e41..52907c3b2846 100644
--- a/drivers/gpu/drm/drm_crtc_internal.h
+++ b/drivers/gpu/drm/drm_crtc_internal.h
@@ -292,6 +292,8 @@ void drm_mode_fixup_1366x768(struct drm_display_mode *mode);
 int drm_edid_override_show(struct drm_connector *connector, struct seq_file *m);
 int drm_edid_override_set(struct drm_connector *connector, const void *edid, size_t size);
 int drm_edid_override_reset(struct drm_connector *connector);
+ssize_t drm_edid_connector_property_show(struct drm_connector *connector,
+					 char *buf, loff_t off, size_t count);
 
 /* drm_edid_load.c */
 #ifdef CONFIG_DRM_LOAD_EDID_FIRMWARE
diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
index 923c4423151c..9178644ac285 100644
--- a/drivers/gpu/drm/drm_edid.c
+++ b/drivers/gpu/drm/drm_edid.c
@@ -6831,6 +6831,39 @@ static int _drm_edid_connector_property_update(struct drm_connector *connector,
 	return ret;
 }
 
+/* For sysfs edid show implementation */
+ssize_t drm_edid_connector_property_show(struct drm_connector *connector,
+					 char *buf, loff_t off, size_t count)
+{
+	const void *edid;
+	size_t size;
+	ssize_t ret = 0;
+
+	mutex_lock(&connector->dev->mode_config.mutex);
+
+	if (!connector->edid_blob_ptr)
+		goto unlock;
+
+	edid = connector->edid_blob_ptr->data;
+	size = connector->edid_blob_ptr->length;
+	if (!edid)
+		goto unlock;
+
+	if (off >= size)
+		goto unlock;
+
+	if (off + count > size)
+		count = size - off;
+
+	memcpy(buf, edid + off, count);
+
+	ret = count;
+unlock:
+	mutex_unlock(&connector->dev->mode_config.mutex);
+
+	return ret;
+}
+
 /**
  * drm_edid_connector_update - Update connector information from EDID
  * @connector: Connector
diff --git a/drivers/gpu/drm/drm_sysfs.c b/drivers/gpu/drm/drm_sysfs.c
index a953f69a34b6..71a741991fc6 100644
--- a/drivers/gpu/drm/drm_sysfs.c
+++ b/drivers/gpu/drm/drm_sysfs.c
@@ -267,29 +267,9 @@ static ssize_t edid_show(struct file *filp, struct kobject *kobj,
 {
 	struct device *connector_dev = kobj_to_dev(kobj);
 	struct drm_connector *connector = to_drm_connector(connector_dev);
-	unsigned char *edid;
-	size_t size;
-	ssize_t ret = 0;
+	ssize_t ret;
 
-	mutex_lock(&connector->dev->mode_config.mutex);
-	if (!connector->edid_blob_ptr)
-		goto unlock;
-
-	edid = connector->edid_blob_ptr->data;
-	size = connector->edid_blob_ptr->length;
-	if (!edid)
-		goto unlock;
-
-	if (off >= size)
-		goto unlock;
-
-	if (off + count > size)
-		count = size - off;
-	memcpy(buf, edid + off, count);
-
-	ret = count;
-unlock:
-	mutex_unlock(&connector->dev->mode_config.mutex);
+	ret = drm_edid_connector_property_show(connector, buf, off, count);
 
 	return ret;
 }
-- 
2.39.2

