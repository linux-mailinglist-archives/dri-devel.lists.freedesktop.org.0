Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BE524E99CE
	for <lists+dri-devel@lfdr.de>; Mon, 28 Mar 2022 16:35:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F344F10E6A1;
	Mon, 28 Mar 2022 14:35:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0920310E69E;
 Mon, 28 Mar 2022 14:35:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1648478141; x=1680014141;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=uavPWvRU3FZsiPoVA+1rqIBcI2Waad56KNU+F32S+W8=;
 b=Gd6KuXmdNnJ7IRtm4HUdoCuDS+pMDJ38qtNwoYImwZ16b93lVdpG+ASt
 oLnHBekIh15liLWCoC1EU/CvFV7DjfEUCCW4WmvZulsnCKPlH3I5Q9Aoq
 0NvRG+X2Jr75d2MvdiJP8tl1WCxit7vRuelEtoBGJMgtAMTgctFlnFI20
 5xOZvjA+AwWs+qSahPUrYQaSZC9KoVAzmlnOOHpCRrv83ROwsRyR2z+N2
 rjSGduQ2pGhxVm8bZ5YlgGVSi1ZToyF7YczBVVKUOoEfH8W6uyeLbGN5T
 EgljVv3ERtH6ScwyPO2Uc3IBy35UjStLj0j9cTe9zRpSJdJaDyspFZKqS Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10299"; a="259198774"
X-IronPort-AV: E=Sophos;i="5.90,217,1643702400"; d="scan'208";a="259198774"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Mar 2022 07:35:40 -0700
X-IronPort-AV: E=Sophos;i="5.90,217,1643702400"; d="scan'208";a="787241249"
Received: from aysivtso-mobl.ccr.corp.intel.com (HELO localhost)
 ([10.252.62.56])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Mar 2022 07:35:38 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v3 12/12] drm/edid: split drm_add_edid_modes() to two
Date: Mon, 28 Mar 2022 17:34:33 +0300
Message-Id: <437c3c79f68d1144444fb2dd18a678f3aa97272c.1648477901.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1648477901.git.jani.nikula@intel.com>
References: <cover.1648477901.git.jani.nikula@intel.com>
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

Reduce the size of the function that actually modifies the EDID.

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/drm_edid.c | 42 ++++++++++++++++++++++----------------
 1 file changed, 24 insertions(+), 18 deletions(-)

diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
index d1abaa517867..d79b06f7f34c 100644
--- a/drivers/gpu/drm/drm_edid.c
+++ b/drivers/gpu/drm/drm_edid.c
@@ -5561,18 +5561,8 @@ static int add_displayid_detailed_modes(struct drm_connector *connector,
 	return num_modes;
 }
 
-/**
- * drm_add_edid_modes - add modes from EDID data, if available
- * @connector: connector we're probing
- * @edid: EDID data
- *
- * Add the specified modes to the connector's mode list. Also fills out the
- * &drm_display_info structure and ELD in @connector with any information which
- * can be derived from the edid.
- *
- * Return: The number of modes added or 0 if we couldn't find any.
- */
-int drm_add_edid_modes(struct drm_connector *connector, struct edid *edid)
+static int drm_edid_connector_update(struct drm_connector *connector,
+				     const struct edid *edid)
 {
 	int num_modes = 0;
 	u32 quirks;
@@ -5581,12 +5571,6 @@ int drm_add_edid_modes(struct drm_connector *connector, struct edid *edid)
 		clear_eld(connector);
 		return 0;
 	}
-	if (!drm_edid_is_valid(edid)) {
-		clear_eld(connector);
-		drm_warn(connector->dev, "%s: EDID invalid.\n",
-			 connector->name);
-		return 0;
-	}
 
 	drm_edid_to_eld(connector, edid);
 
@@ -5638,6 +5622,28 @@ int drm_add_edid_modes(struct drm_connector *connector, struct edid *edid)
 
 	return num_modes;
 }
+
+/**
+ * drm_add_edid_modes - add modes from EDID data, if available
+ * @connector: connector we're probing
+ * @edid: EDID data
+ *
+ * Add the specified modes to the connector's mode list. Also fills out the
+ * &drm_display_info structure and ELD in @connector with any information which
+ * can be derived from the edid.
+ *
+ * Return: The number of modes added or 0 if we couldn't find any.
+ */
+int drm_add_edid_modes(struct drm_connector *connector, struct edid *edid)
+{
+	if (edid && !drm_edid_is_valid(edid)) {
+		drm_warn(connector->dev, "%s: EDID invalid.\n",
+			 connector->name);
+		edid = NULL;
+	}
+
+	return drm_edid_connector_update(connector, edid);
+}
 EXPORT_SYMBOL(drm_add_edid_modes);
 
 /**
-- 
2.30.2

