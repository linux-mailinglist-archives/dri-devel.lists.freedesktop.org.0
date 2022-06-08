Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 50E93542870
	for <lists+dri-devel@lfdr.de>; Wed,  8 Jun 2022 09:51:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E36C310EED4;
	Wed,  8 Jun 2022 07:51:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9980810EECF;
 Wed,  8 Jun 2022 07:51:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1654674685; x=1686210685;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=XQo3smV5NO5DcJSapW84cgjYQHG7/Tk+pIqDeGK/Uc4=;
 b=hQYSSWRRK5hv/sIa0gcQ4Vzr4O5GcXVNordjT/fG/N0pN3EBJht1W/fd
 G7OjnZlK0ukrNEwkLfRDZKXq/JGT4SP0J1Dh/mL9SqJNssThq6Crd4Uqx
 1tEsWIVjPNjjiRPmMTG5guuxhdPitXddN3G2Zt+Za3Mxso1f9OR5KZhWv
 hOcYRuqNFhli0F9go9I9IJrtBvYFsvCkB513y6ML+gj2o7TE9Y5tIMSNa
 XT9M4NkQblkVdWZEUldQSn6DfGqu7OGoWp2Z4XlNJk7qLhdxQsn/C8jfu
 S5kYakHbCd5h8up58+nULNpsrQlOiUM9C/+G4ZZLQPiO4tAeZeNLh7TKg w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10371"; a="274336252"
X-IronPort-AV: E=Sophos;i="5.91,285,1647327600"; d="scan'208";a="274336252"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jun 2022 00:51:25 -0700
X-IronPort-AV: E=Sophos;i="5.91,285,1647327600"; d="scan'208";a="670411653"
Received: from jkosticx-mobl.amr.corp.intel.com (HELO localhost)
 ([10.252.58.130])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jun 2022 00:51:23 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 08/15] drm/probe-helper: add
 drm_connector_helper_get_modes()
Date: Wed,  8 Jun 2022 10:50:38 +0300
Message-Id: <977ae3f897f41ce69e091e38706ca841900c31b5.1654674560.git.jani.nikula@intel.com>
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
Cc: jani.nikula@intel.com, intel-gfx@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add a helper function to be used as the "default" .get_modes()
hook. This also works as an example of what the driver .get_modes()
hooks are supposed to do regarding the new drm_edid_read*() and
drm_edid_connector_update() calls.

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/drm_probe_helper.c | 34 ++++++++++++++++++++++++++++++
 include/drm/drm_probe_helper.h     |  1 +
 2 files changed, 35 insertions(+)

diff --git a/drivers/gpu/drm/drm_probe_helper.c b/drivers/gpu/drm/drm_probe_helper.c
index a8d26b29bfa0..e6b8f2923aa7 100644
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
+	 * succesfully, fill in the connector information derived from the
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

