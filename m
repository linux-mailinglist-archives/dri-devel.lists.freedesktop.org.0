Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F46155FBEB
	for <lists+dri-devel@lfdr.de>; Wed, 29 Jun 2022 11:28:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E1E6011A48B;
	Wed, 29 Jun 2022 09:28:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A101F11A44C;
 Wed, 29 Jun 2022 09:28:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1656494895; x=1688030895;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=QKgSqM/COQaUR6bs4N0mAliGXqtRhNNkUN0eldxpPk4=;
 b=eJ7MIJoXPnD+1RjcXBeUuARSdqiDMoQVpqvF3QVDh+SYm77L5J6UWefi
 Y9ioRyCUVxe+Q6fufhRK0XtJ6hp0WhtzirAFAgYj1N7wTGWUIJ6ueApZR
 zXQNAGVZI26gqXcE/AcCymi4pc9TSPAkrTVj82Lx9WDWeoOoJiTikDJXh
 P0ajCJTD4dx+AlVxOTv0Pn7iWT4wHrHMhcxL+NFFFeNsg7nb7NoURmyAy
 LzagLB0GtHryGaB1ouSSMYkdgri+m8M78yk3f0efOl6UiLQyFEz7Pp8M3
 SP2Yie19yBRRXSoQD7PyqiXPIX6z0XRfAN8UENb0kjnaDfYmC4Lpui5O+ A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10392"; a="307476667"
X-IronPort-AV: E=Sophos;i="5.92,231,1650956400"; d="scan'208";a="307476667"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jun 2022 02:28:15 -0700
X-IronPort-AV: E=Sophos;i="5.92,231,1650956400"; d="scan'208";a="595169795"
Received: from srdoo-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.252.63.102])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jun 2022 02:28:13 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [CI RESEND 03/10] drm/edid: clean up connector update error handling
 and debug logging
Date: Wed, 29 Jun 2022 12:27:48 +0300
Message-Id: <de4270b3d2e61fe42b9248490376594d472d19aa.1656494768.git.jani.nikula@intel.com>
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

Bail out on all errors, debug log all errors, and convert to drm device
based debug logging.

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
Reviewed-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/drm_edid.c | 41 ++++++++++++++++++++++++++------------
 1 file changed, 28 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
index 62967db78139..e360e1a269f4 100644
--- a/drivers/gpu/drm/drm_edid.c
+++ b/drivers/gpu/drm/drm_edid.c
@@ -6231,29 +6231,44 @@ static int _drm_connector_update_edid_property(struct drm_connector *connector,
 
 		if (old_edid) {
 			if (!drm_edid_are_equal(drm_edid ? drm_edid->edid : NULL, old_edid)) {
-				DRM_DEBUG_KMS("[CONNECTOR:%d:%s] Edid was changed.\n",
-					      connector->base.id, connector->name);
-
-				connector->epoch_counter += 1;
-				DRM_DEBUG_KMS("Updating change counter to %llu\n",
-					      connector->epoch_counter);
+				connector->epoch_counter++;
+				drm_dbg_kms(dev, "[CONNECTOR:%d:%s] EDID changed, epoch counter %llu\n",
+					    connector->base.id, connector->name,
+					    connector->epoch_counter);
 			}
 		}
 	}
 
-	drm_object_property_set_value(&connector->base,
-				      dev->mode_config.non_desktop_property,
-				      connector->display_info.non_desktop);
-
 	ret = drm_property_replace_global_blob(dev,
 					       &connector->edid_blob_ptr,
 					       drm_edid ? drm_edid->size : 0,
 					       drm_edid ? drm_edid->edid : NULL,
 					       &connector->base,
 					       dev->mode_config.edid_property);
-	if (ret)
-		return ret;
-	return drm_connector_set_tile_property(connector);
+	if (ret) {
+		drm_dbg_kms(dev, "[CONNECTOR:%d:%s] EDID property update failed (%d)\n",
+			    connector->base.id, connector->name, ret);
+		goto out;
+	}
+
+	ret = drm_object_property_set_value(&connector->base,
+					    dev->mode_config.non_desktop_property,
+					    connector->display_info.non_desktop);
+	if (ret) {
+		drm_dbg_kms(dev, "[CONNECTOR:%d:%s] Non-desktop property update failed (%d)\n",
+			    connector->base.id, connector->name, ret);
+		goto out;
+	}
+
+	ret = drm_connector_set_tile_property(connector);
+	if (ret) {
+		drm_dbg_kms(dev, "[CONNECTOR:%d:%s] Tile property update failed (%d)\n",
+			    connector->base.id, connector->name, ret);
+		goto out;
+	}
+
+out:
+	return ret;
 }
 
 /**
-- 
2.30.2

