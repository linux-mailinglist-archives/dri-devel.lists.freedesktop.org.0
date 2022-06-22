Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EB727554585
	for <lists+dri-devel@lfdr.de>; Wed, 22 Jun 2022 13:00:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 71B0910EAB2;
	Wed, 22 Jun 2022 10:59:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2889510EAB4;
 Wed, 22 Jun 2022 10:59:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1655895597; x=1687431597;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=w0lZ3sqz8CHlzJhKHWY8xJMepUh+bKOJ3DCY6PLowaU=;
 b=FBVnqpI+YeTX/S272zhXTPI6lUYKGcUpL8ca4IoSFM3P5/Bl7k9Joavi
 TtE/mYDWhTyfWwJyxvc6oDl+YdVphCOjDlj1QrxuEPb+T3rKienzHZvtO
 +bn4XnFJexxTU3DcI9qqi1PMQ0kjvO+Jf4iW+4UJKEda05aheaGR9sYEN
 WGqFixMfowXa9VZbhUV1Mc8TJHQbvep5AdWDGUp8rp6Dk5VXFLnyCuhkC
 S3Eb8aivZHr1o6UQMQGxtYaWETNiiRv4FYtZOdngRy15M8Yqpm6AIxL83
 6uYCrM38fCD/vSBpxe+vimgi97d8CbgrQI/9JHonCdTpwGwpo6wHx38ss A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10385"; a="342070714"
X-IronPort-AV: E=Sophos;i="5.92,212,1650956400"; d="scan'208";a="342070714"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jun 2022 03:59:56 -0700
X-IronPort-AV: E=Sophos;i="5.92,212,1650956400"; d="scan'208";a="914620661"
Received: from snowacki-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.59.111])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jun 2022 03:59:54 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v3 06/13] drm/probe-helper: add
 drm_connector_helper_get_modes()
Date: Wed, 22 Jun 2022 13:59:20 +0300
Message-Id: <e0c603b846d513c4ece14b95b57a2c199f2eec79.1655895388.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1655895388.git.jani.nikula@intel.com>
References: <cover.1655895388.git.jani.nikula@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

Add a helper function to be used as the "default" .get_modes()
hook. This also works as an example of what the driver .get_modes()
hooks are supposed to do regarding the new drm_edid_read*() and
drm_edid_connector_update() calls.

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
Reviewed-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/drm_probe_helper.c | 34 ++++++++++++++++++++++++++++++
 include/drm/drm_probe_helper.h     |  1 +
 2 files changed, 35 insertions(+)

diff --git a/drivers/gpu/drm/drm_probe_helper.c b/drivers/gpu/drm/drm_probe_helper.c
index a8d26b29bfa0..bb427c5a4f1f 100644
--- a/drivers/gpu/drm/drm_probe_helper.c
+++ b/drivers/gpu/drm/drm_probe_helper.c
@@ -1049,3 +1049,37 @@ int drm_connector_helper_get_modes_from_ddc(struct drm_connector *connector)
 	return count;
 }
 EXPORT_SYMBOL(drm_connector_helper_get_modes_from_ddc);
+
+/**
+ * drm_connector_helper_get_modes - Read EDID and update connector.
+ * @connector: The connector
+ *
+ * Read the EDID using drm_edid_read() (which requires that connector->ddc is
+ * set), and update the connector using the EDID.
+ *
+ * This can be used as the "default" connector helper .get_modes() hook if the
+ * driver does not need any special processing. This is sets the example what
+ * custom .get_modes() hooks should do regarding EDID read and connector update.
+ *
+ * Returns: Number of modes.
+ */
+int drm_connector_helper_get_modes(struct drm_connector *connector)
+{
+	const struct drm_edid *drm_edid;
+	int count;
+
+	drm_edid = drm_edid_read(connector);
+
+	/*
+	 * Unconditionally update the connector. If the EDID was read
+	 * successfully, fill in the connector information derived from the
+	 * EDID. Otherwise, if the EDID is NULL, clear the connector
+	 * information.
+	 */
+	count = drm_edid_connector_update(connector, drm_edid);
+
+	drm_edid_free(drm_edid);
+
+	return count;
+}
+EXPORT_SYMBOL(drm_connector_helper_get_modes);
diff --git a/include/drm/drm_probe_helper.h b/include/drm/drm_probe_helper.h
index c80cab7a53b7..8075e02aa865 100644
--- a/include/drm/drm_probe_helper.h
+++ b/include/drm/drm_probe_helper.h
@@ -27,5 +27,6 @@ void drm_kms_helper_poll_enable(struct drm_device *dev);
 bool drm_kms_helper_is_poll_worker(void);
 
 int drm_connector_helper_get_modes_from_ddc(struct drm_connector *connector);
+int drm_connector_helper_get_modes(struct drm_connector *connector);
 
 #endif
-- 
2.30.2

