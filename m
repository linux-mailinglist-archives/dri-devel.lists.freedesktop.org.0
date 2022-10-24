Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3470860A65B
	for <lists+dri-devel@lfdr.de>; Mon, 24 Oct 2022 14:34:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5260C10E4C8;
	Mon, 24 Oct 2022 12:34:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC65310E4B7;
 Mon, 24 Oct 2022 12:34:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1666614859; x=1698150859;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=1I4aH23nGdcC5jwJVE/lWcfAHYFxvT2qfTZ7HNgZwjk=;
 b=CfZZXBm5BfZ4mqcxia2zRHxN3TNrZmIOUCm7+SO68ssBdakint2zUavw
 jOR4Lenxqgv2nQfgmoOADUIrtejsK6lOi99RDnubaEiTA25TwMnhqfnCx
 xJjj6moKOmyuUROjwZMv+5a/3XsWBGPfBGGw/6yObcPuxgfhQbx1r5n0H
 G/52RXoy5ZXGBof1FDgb3jnJBXW/kyB8nUdOZN2+URrvNQ1ifIwzJEV8l
 Z+yDQ9ucenYtrGaKAImGUC0hc/IK390eKZFCi756rb/P4N0olkFmy92G2
 Z5CBiyyBnw7NkvRLIPcNmN203P1GBXk1uRB9JU8PDylYC6sVZehywb9pA w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10509"; a="294803361"
X-IronPort-AV: E=Sophos;i="5.95,209,1661842800"; d="scan'208";a="294803361"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Oct 2022 05:34:19 -0700
X-IronPort-AV: E=McAfee;i="6500,9779,10509"; a="876418759"
X-IronPort-AV: E=Sophos;i="5.95,209,1661842800"; d="scan'208";a="876418759"
Received: from emontau-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.252.52.221])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Oct 2022 05:34:17 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 06/16] drm/edid: rename drm_add_override_edid_modes() to
 drm_edid_override_connector_update()
Date: Mon, 24 Oct 2022 15:33:34 +0300
Message-Id: <ba12957e0488654e8db010a3ff1534079caec972.1666614699.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1666614699.git.jani.nikula@intel.com>
References: <cover.1666614699.git.jani.nikula@intel.com>
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

Follow the naming of both EDID override functions as well as
drm_edid_connector_update(). This also matches better what the function
does; a combination of EDID property update and add modes. Indeed it
should later be converted to call drm_edid_connector_update().

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
Reviewed-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/drm_edid.c         | 6 +++---
 drivers/gpu/drm/drm_probe_helper.c | 2 +-
 include/drm/drm_edid.h             | 2 +-
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
index 1ada36e0d826..8baa46dc2537 100644
--- a/drivers/gpu/drm/drm_edid.c
+++ b/drivers/gpu/drm/drm_edid.c
@@ -2227,7 +2227,7 @@ int drm_edid_override_reset(struct drm_connector *connector)
 }
 
 /**
- * drm_add_override_edid_modes - add modes from override/firmware EDID
+ * drm_edid_override_connector_update - add modes from override/firmware EDID
  * @connector: connector we're probing
  *
  * Add modes from the override/firmware EDID, if available. Only to be used from
@@ -2237,7 +2237,7 @@ int drm_edid_override_reset(struct drm_connector *connector)
  *
  * Return: The number of modes added or 0 if we couldn't find any.
  */
-int drm_add_override_edid_modes(struct drm_connector *connector)
+int drm_edid_override_connector_update(struct drm_connector *connector)
 {
 	struct edid *override;
 	int num_modes = 0;
@@ -2254,7 +2254,7 @@ int drm_add_override_edid_modes(struct drm_connector *connector)
 
 	return num_modes;
 }
-EXPORT_SYMBOL(drm_add_override_edid_modes);
+EXPORT_SYMBOL(drm_edid_override_connector_update);
 
 typedef int read_block_fn(void *context, u8 *buf, unsigned int block, size_t len);
 
diff --git a/drivers/gpu/drm/drm_probe_helper.c b/drivers/gpu/drm/drm_probe_helper.c
index 69b0b2b9cc1c..2fc21df709bc 100644
--- a/drivers/gpu/drm/drm_probe_helper.c
+++ b/drivers/gpu/drm/drm_probe_helper.c
@@ -367,7 +367,7 @@ static int drm_helper_probe_get_modes(struct drm_connector *connector)
 	 * override/firmware EDID.
 	 */
 	if (count == 0 && connector->status == connector_status_connected)
-		count = drm_add_override_edid_modes(connector);
+		count = drm_edid_override_connector_update(connector);
 
 	return count;
 }
diff --git a/include/drm/drm_edid.h b/include/drm/drm_edid.h
index 429735b91f63..05380681a4fb 100644
--- a/include/drm/drm_edid.h
+++ b/include/drm/drm_edid.h
@@ -577,7 +577,7 @@ struct edid *drm_get_edid_switcheroo(struct drm_connector *connector,
 				     struct i2c_adapter *adapter);
 struct edid *drm_edid_duplicate(const struct edid *edid);
 int drm_add_edid_modes(struct drm_connector *connector, struct edid *edid);
-int drm_add_override_edid_modes(struct drm_connector *connector);
+int drm_edid_override_connector_update(struct drm_connector *connector);
 
 u8 drm_match_cea_mode(const struct drm_display_mode *to_match);
 bool drm_detect_hdmi_monitor(const struct edid *edid);
-- 
2.34.1

