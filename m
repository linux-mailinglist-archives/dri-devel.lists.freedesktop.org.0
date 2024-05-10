Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 471018C2764
	for <lists+dri-devel@lfdr.de>; Fri, 10 May 2024 17:08:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8248210EDA6;
	Fri, 10 May 2024 15:08:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Frwa4Wdb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2018F10ED6C;
 Fri, 10 May 2024 15:08:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715353733; x=1746889733;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=CoGtKVtmyxIa0yKv4jVYsoCiCwejecu/pMWo1drRSMw=;
 b=Frwa4WdbSFPwsc0oKnLw+zTgThHE7/2KjheRUS5YIrZm6HQScdM62d+J
 Y1aR4WhNtXds5HJb5s2V9YMKi38XG1z+sM19EijUTSH6vycdUv6VY9m3O
 3L6cHaauq3rKvW0r/wheZpJ6o5Rl88Qx7mvdHIWioi9+ATUrUAZFoicX+
 F1CmaeVLBb5ZjV1UcIJqeF8dHw+3hY7wtUG4GV9SqRUNnXV0GdZmmayYh
 0stV71XNhbs806itcrgGuXBtsRQUDly2e55PCtk9I3RodXTNLv4fs21SG
 D9P17TpH5xhrU9Pr+RCvpeyhn2poNUurV/1QI6ygrbRL5qIPQf0fO6q+d A==;
X-CSE-ConnectionGUID: ujjOOFv8Rna3gbSAx1BsiA==
X-CSE-MsgGUID: +SYV52ceSIWJWKinOvzfJg==
X-IronPort-AV: E=McAfee;i="6600,9927,11068"; a="11190479"
X-IronPort-AV: E=Sophos;i="6.08,151,1712646000"; d="scan'208";a="11190479"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 May 2024 08:08:52 -0700
X-CSE-ConnectionGUID: LRZ/4Dy2QKm8p6lK9fNhmg==
X-CSE-MsgGUID: 5LEeLvHbQIOOrHalT45bvg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,151,1712646000"; d="scan'208";a="34292521"
Received: from ettammin-desk.ger.corp.intel.com (HELO localhost)
 ([10.245.246.180])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 May 2024 08:08:50 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Cc: amd-gfx@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, jani.nikula@intel.com
Subject: [RESEND 5/6] drm/edid: add a helper for EDID sysfs property show
Date: Fri, 10 May 2024 18:08:12 +0300
Message-Id: <902c8e09d25b99391fd9c92d95af07c01d7b7cbd.1715353572.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1715353572.git.jani.nikula@intel.com>
References: <cover.1715353572.git.jani.nikula@intel.com>
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
index 25aaae937ceb..20e9d7b206a2 100644
--- a/drivers/gpu/drm/drm_crtc_internal.h
+++ b/drivers/gpu/drm/drm_crtc_internal.h
@@ -303,6 +303,8 @@ const u8 *drm_edid_find_extension(const struct drm_edid *drm_edid,
 				  int ext_id, int *ext_index);
 void drm_edid_cta_sad_get(const struct cea_sad *cta_sad, u8 *sad);
 void drm_edid_cta_sad_set(struct cea_sad *cta_sad, const u8 *sad);
+ssize_t drm_edid_connector_property_show(struct drm_connector *connector,
+					 char *buf, loff_t off, size_t count);
 
 /* drm_edid_load.c */
 #ifdef CONFIG_DRM_LOAD_EDID_FIRMWARE
diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
index 4f54c91b31b2..97362dd2330b 100644
--- a/drivers/gpu/drm/drm_edid.c
+++ b/drivers/gpu/drm/drm_edid.c
@@ -6969,6 +6969,39 @@ static int _drm_edid_connector_property_update(struct drm_connector *connector,
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
index bd9b8ab4f82b..fb3bbb6adcd1 100644
--- a/drivers/gpu/drm/drm_sysfs.c
+++ b/drivers/gpu/drm/drm_sysfs.c
@@ -266,29 +266,9 @@ static ssize_t edid_show(struct file *filp, struct kobject *kobj,
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

