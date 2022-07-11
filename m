Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E695955FBF4
	for <lists+dri-devel@lfdr.de>; Wed, 29 Jun 2022 11:28:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 797A511A556;
	Wed, 29 Jun 2022 09:28:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 66B1911A4D8;
 Wed, 29 Jun 2022 09:28:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1656494909; x=1688030909;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=w0lZ3sqz8CHlzJhKHWY8xJMepUh+bKOJ3DCY6PLowaU=;
 b=GyJ+nHfE85E4svGPsAuBjyLUHF4Vuam7D4nKhOoe3V3XRbxuBdqJUgdI
 KMDC6IvgD2zDatTbMVbMATiyBVDP56pSusysK4i/a8WbWNHNDFjfsgZOM
 lwew/T3G/H9YKALdIdrmg5bJ1mMRT7olevkTdSSsrpbM6m7dbKq5NZBzx
 eoPnLLdupOn6gWRGjVotbw3aH6LopLo3RPleDY3pUHHSjuqupfy5nRPa2
 BmsLtUCG/bwf99jPzKINhHIdlVPbRG/H9PFegciBaXMxW46rnxYIFKolw
 LwpSa2m+bezYDRqcWmFqHvtssXAcex6BxsCKHu5IF4xbkooDnYptofHzm w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10392"; a="345976311"
X-IronPort-AV: E=Sophos;i="5.92,231,1650956400"; d="scan'208";a="345976311"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jun 2022 02:28:28 -0700
X-IronPort-AV: E=Sophos;i="5.92,231,1650956400"; d="scan'208";a="658488800"
Received: from srdoo-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.252.63.102])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jun 2022 02:28:26 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [CI RESEND 06/10] drm/probe-helper: add
 drm_connector_helper_get_modes()
Date: Wed, 29 Jun 2022 12:27:51 +0300
Message-Id: <d985449ed4b95971490ab7c09d2d59b58a892769.1656494768.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1656494768.git.jani.nikula@intel.com>
References: <cover.1656494768.git.jani.nikula@intel.com>
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

