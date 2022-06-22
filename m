Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E8B8554580
	for <lists+dri-devel@lfdr.de>; Wed, 22 Jun 2022 12:59:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 04B4110E85F;
	Wed, 22 Jun 2022 10:59:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 48E9210E8E8;
 Wed, 22 Jun 2022 10:59:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1655895589; x=1687431589;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=jGSXJD9tVn3JXRM4BMUe8Vh6HRwaypj8HDIhFPhTre0=;
 b=O1LEK/51gJnsVs2KczqQewn5nWzcU+2GiKXE+TE9d5wGBIQZuBQuPV6Y
 CmX2rNO8oPawx11mh0NEnOUtnO26SeNc1C2cSN8Z5Sv2H+IG4iQa1GRsd
 9fynRu+AA4VQaQfpJJJIuV3BdUH+I5NHxGb08mGUBZl6WK9dEpghpT5Va
 D2zeR5uYoOOMkd9NJKdNFr3M2Z8d0KDp4g9tjZgNbW6IaAY2hKvXMxq9r
 DNvxUCimCrrOJBNLGj0m0+DIQaVefcgh5TdiqZMJY8n8IVUPpKEui7RSF
 LE6JYsRjOBv0qFztJIqcVKmXFy9iYZJYBnxe3Aj2MzA1sqWhLUNWeo67H A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10385"; a="281461226"
X-IronPort-AV: E=Sophos;i="5.92,212,1650956400"; d="scan'208";a="281461226"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jun 2022 03:59:48 -0700
X-IronPort-AV: E=Sophos;i="5.92,212,1650956400"; d="scan'208";a="914620591"
Received: from snowacki-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.59.111])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jun 2022 03:59:46 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v3 04/13] drm/edid: abstract debugfs override EDID set/reset
Date: Wed, 22 Jun 2022 13:59:18 +0300
Message-Id: <720c9d9e10faa854ed1a0905b90ed16bf93e40b5.1655895388.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1655895388.git.jani.nikula@intel.com>
References: <cover.1655895388.git.jani.nikula@intel.com>
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
Cc: jani.nikula@intel.com, intel-gfx@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add functions drm_edid_override_set() and drm_edid_override_reset() to
support "edid_override" connector debugfs, and to hide the details about
it in drm_edid.c. No functional changes at this time.

Also note in the connector.override_edid flag kernel-doc that this is
only supposed to be modified by the code doing debugfs EDID override
handling. Currently, it is still being modified by amdgpu in
create_eml_sink() and handle_edid_mgmt() for reasons unknown. This was
added in commit 4562236b3bc0 ("drm/amd/dc: Add dc display driver (v2)")
and later moved to amdgpu_dm.c in commit e7b07ceef2a6 ("drm/amd/display:
Merge amdgpu_dm_types and amdgpu_dm").

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/drm_crtc_internal.h |  2 ++
 drivers/gpu/drm/drm_debugfs.c       | 21 +++++----------------
 drivers/gpu/drm/drm_edid.c          | 26 ++++++++++++++++++++++++++
 include/drm/drm_connector.h         |  6 +++++-
 4 files changed, 38 insertions(+), 17 deletions(-)

diff --git a/drivers/gpu/drm/drm_crtc_internal.h b/drivers/gpu/drm/drm_crtc_internal.h
index aecab5308bae..56041b604881 100644
--- a/drivers/gpu/drm/drm_crtc_internal.h
+++ b/drivers/gpu/drm/drm_crtc_internal.h
@@ -286,3 +286,5 @@ int drm_mode_page_flip_ioctl(struct drm_device *dev,
 
 /* drm_edid.c */
 void drm_mode_fixup_1366x768(struct drm_display_mode *mode);
+int drm_edid_override_set(struct drm_connector *connector, const void *edid, size_t size);
+int drm_edid_override_reset(struct drm_connector *connector);
diff --git a/drivers/gpu/drm/drm_debugfs.c b/drivers/gpu/drm/drm_debugfs.c
index fb04b7a984de..493922069c90 100644
--- a/drivers/gpu/drm/drm_debugfs.c
+++ b/drivers/gpu/drm/drm_debugfs.c
@@ -350,31 +350,20 @@ static ssize_t edid_write(struct file *file, const char __user *ubuf,
 	struct seq_file *m = file->private_data;
 	struct drm_connector *connector = m->private;
 	char *buf;
-	struct edid *edid;
 	int ret;
 
 	buf = memdup_user(ubuf, len);
 	if (IS_ERR(buf))
 		return PTR_ERR(buf);
 
-	edid = (struct edid *) buf;
-
-	if (len == 5 && !strncmp(buf, "reset", 5)) {
-		connector->override_edid = false;
-		ret = drm_connector_update_edid_property(connector, NULL);
-	} else if (len < EDID_LENGTH ||
-		   EDID_LENGTH * (1 + edid->extensions) > len)
-		ret = -EINVAL;
-	else {
-		connector->override_edid = false;
-		ret = drm_connector_update_edid_property(connector, edid);
-		if (!ret)
-			connector->override_edid = true;
-	}
+	if (len == 5 && !strncmp(buf, "reset", 5))
+		ret = drm_edid_override_reset(connector);
+	else
+		ret = drm_edid_override_set(connector, buf, len);
 
 	kfree(buf);
 
-	return (ret) ? ret : len;
+	return ret ? ret : len;
 }
 
 /*
diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
index e360e1a269f4..c3f0f0a5a8a9 100644
--- a/drivers/gpu/drm/drm_edid.c
+++ b/drivers/gpu/drm/drm_edid.c
@@ -2161,6 +2161,32 @@ static struct edid *drm_get_override_edid(struct drm_connector *connector,
 	return IS_ERR(override) ? NULL : override;
 }
 
+/* For debugfs edid_override implementation */
+int drm_edid_override_set(struct drm_connector *connector, const void *edid,
+			  size_t size)
+{
+	int ret;
+
+	if (size < EDID_LENGTH || edid_size(edid) > size)
+		return -EINVAL;
+
+	connector->override_edid = false;
+
+	ret = drm_connector_update_edid_property(connector, edid);
+	if (!ret)
+		connector->override_edid = true;
+
+	return ret;
+}
+
+/* For debugfs edid_override implementation */
+int drm_edid_override_reset(struct drm_connector *connector)
+{
+	connector->override_edid = false;
+
+	return drm_connector_update_edid_property(connector, NULL);
+}
+
 /**
  * drm_add_override_edid_modes - add modes from override/firmware EDID
  * @connector: connector we're probing
diff --git a/include/drm/drm_connector.h b/include/drm/drm_connector.h
index 94b422b55cc1..a1705d6b3fba 100644
--- a/include/drm/drm_connector.h
+++ b/include/drm/drm_connector.h
@@ -1527,7 +1527,11 @@ struct drm_connector {
 	struct drm_cmdline_mode cmdline_mode;
 	/** @force: a DRM_FORCE_<foo> state for forced mode sets */
 	enum drm_connector_force force;
-	/** @override_edid: has the EDID been overwritten through debugfs for testing? */
+	/**
+	 * @override_edid: has the EDID been overwritten through debugfs for
+	 * testing? Do not modify outside of drm_edid_override_set() and
+	 * drm_edid_override_reset().
+	 */
 	bool override_edid;
 	/** @epoch_counter: used to detect any other changes in connector, besides status */
 	u64 epoch_counter;
-- 
2.30.2

