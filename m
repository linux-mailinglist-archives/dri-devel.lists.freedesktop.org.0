Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 95B5055457F
	for <lists+dri-devel@lfdr.de>; Wed, 22 Jun 2022 12:59:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A6CA010E70F;
	Wed, 22 Jun 2022 10:59:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F37110E7F7;
 Wed, 22 Jun 2022 10:59:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1655895584; x=1687431584;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=368VlI7dFqMJegG4vvVIlcSFBztaBzfLKv55NJHHiIw=;
 b=CnvzbNGkw/AAFYlLhrDHy3gkrbeMO6WB6Vj8K+yRgQXBqn0exlc//xIf
 4LbofmCsHFq0R1tDI90lvBUMT9wL4wtGJ2VYCIAPhYknR6fJ9nKhM38bs
 tUxMtkTgQ8eTDDx4ga0CNMHP2TcpRt3pUwMmaFR0lxy5t/GNyCiP8n9/Y
 JOUO+q4SPFPMiASvX24NqT7goTVM9PwhpGo3YZ4WgDQBxNhHVqQA4EM4i
 qcR4gd0RFcmKrK4lCPsSYaINyUqtMMog/s/fIfHICQ/2kvggT0hW/YO40
 W8kQj+syPh35/DvJ+CMFc1+ljDVXG/u71Qajw5gkUEfZeQnxgk4uyF2YF A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10385"; a="263420370"
X-IronPort-AV: E=Sophos;i="5.92,212,1650956400"; d="scan'208";a="263420370"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jun 2022 03:59:44 -0700
X-IronPort-AV: E=Sophos;i="5.92,212,1650956400"; d="scan'208";a="834059646"
Received: from snowacki-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.59.111])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jun 2022 03:59:42 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v3 03/13] drm/edid: clean up connector update error handling
 and debug logging
Date: Wed, 22 Jun 2022 13:59:17 +0300
Message-Id: <eba6004e0ff0a61d674560b68d1547639996ea74.1655895388.git.jani.nikula@intel.com>
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

Bail out on all errors, debug log all errors, and convert to drm device
based debug logging.

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
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

