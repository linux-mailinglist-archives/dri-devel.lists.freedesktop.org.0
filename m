Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2083D50D9C3
	for <lists+dri-devel@lfdr.de>; Mon, 25 Apr 2022 08:48:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DCA6F1120A2;
	Mon, 25 Apr 2022 06:48:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8763310FF6B;
 Mon, 25 Apr 2022 06:48:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1650869318; x=1682405318;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=5ZULeZBk30F36WOKNvaXiUTU57I7g9fsai/DL3eQxUY=;
 b=IpYgyLEeV8SZXIzK7fAqWEdHBuDSyplRLoRoZOw1Nxbex3lDMsvk0lRS
 /d6IwJwZtegsOELr3cX9m/8p8kuhAS4Q6b2rprvhvCBacxS9Xa9Pe7Nv7
 2UU9WdVs9O0zVCfnZscEj3PQfB0WgrdK+GFlYY5CY8CHHrvNyx4LaYBxS
 7FZ10taKQoJbzutEbJf6sGC0TCgLfOynJnjS2Afq97C9Z6ecczZt0g9QL
 QVOWxdGbPD5pWqqYiaDcj9f7fJkExFc/PyNiKWg6Fv5MYv43Stv5RZkZU
 aGxp8vUCcv2b8ILGMv6ONyZ6tAwP1GjAy/UAiP8pFcBbVFSgC4fKOepQ9 g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10327"; a="265325797"
X-IronPort-AV: E=Sophos;i="5.90,287,1643702400"; d="scan'208";a="265325797"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Apr 2022 23:48:38 -0700
X-IronPort-AV: E=Sophos;i="5.90,287,1643702400"; d="scan'208";a="616385901"
Received: from bhanu-nuclab.iind.intel.com ([10.145.162.173])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Apr 2022 23:48:36 -0700
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 ville.syrjala@linux.intel.com, manasi.d.navare@intel.com
Subject: [RFC v2 1/2] drm/vrr: Attach vrr_enabled property to the drm crtc
Date: Mon, 25 Apr 2022 12:16:11 +0530
Message-Id: <20220425064612.2993587-2-bhanuprakash.modem@intel.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220425064612.2993587-1-bhanuprakash.modem@intel.com>
References: <20220425064612.2993587-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>,
 Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Modern display hardware is capable of supporting variable refresh rates.
This patch introduces helpers to attach and set "vrr_enabled" property
on the crtc to allow userspace to query VRR enabled status on that crtc.

Atomic drivers should attach this property to crtcs those are capable of
driving variable refresh rates using
drm_mode_crtc_attach_vrr_enabled_property().

The value should be updated based on driver and hardware capability
by using drm_mode_crtc_set_vrr_enabled_property().

V2: Use property flag as atomic

Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
Cc: Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>
Cc: Manasi Navare <manasi.d.navare@intel.com>
Cc: Harry Wentland <harry.wentland@amd.com>
Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
---
 drivers/gpu/drm/drm_crtc.c        | 44 +++++++++++++++++++++++++++++++
 drivers/gpu/drm/drm_mode_config.c |  2 +-
 include/drm/drm_crtc.h            |  4 +++
 3 files changed, 49 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_crtc.c b/drivers/gpu/drm/drm_crtc.c
index 26a77a735905..95b4a0c7ecb3 100644
--- a/drivers/gpu/drm/drm_crtc.c
+++ b/drivers/gpu/drm/drm_crtc.c
@@ -883,3 +883,47 @@ int drm_crtc_create_scaling_filter_property(struct drm_crtc *crtc,
 	return 0;
 }
 EXPORT_SYMBOL(drm_crtc_create_scaling_filter_property);
+
+/**
+ * drm_mode_crtc_attach_vrr_enabled_property - attaches the vrr_enabled property
+ * @crtc: drm CRTC to attach the vrr_enabled property on.
+ *
+ * This is used by atomic drivers to add support for querying
+ * VRR enabled status for a crtc.
+ */
+void drm_mode_crtc_attach_vrr_enabled_property(struct drm_crtc *crtc)
+{
+	struct drm_device *dev = crtc->dev;
+	struct drm_mode_config *config = &dev->mode_config;
+
+	if (!config->prop_vrr_enabled)
+		return;
+
+	drm_object_attach_property(&crtc->base,
+				   config->prop_vrr_enabled,
+				   0);
+}
+EXPORT_SYMBOL(drm_mode_crtc_attach_vrr_enabled_property);
+
+/**
+ * drm_mode_crtc_set_vrr_enabled_property - sets the vrr enabled property for
+ * a crtc.
+ * @crtc: drm CRTC
+ * @vrr_enabled: True to enable the VRR on CRTC
+ *
+ * Should be used by atomic drivers to update the VRR enabled status on a CRTC
+ */
+void drm_mode_crtc_set_vrr_enabled_property(struct drm_crtc *crtc,
+					    bool vrr_enabled)
+{
+	struct drm_device *dev = crtc->dev;
+	struct drm_mode_config *config = &dev->mode_config;
+
+	if (!config->prop_vrr_enabled)
+		return;
+
+	drm_object_property_set_value(&crtc->base,
+				      config->prop_vrr_enabled,
+				      vrr_enabled);
+}
+EXPORT_SYMBOL(drm_mode_crtc_set_vrr_enabled_property);
diff --git a/drivers/gpu/drm/drm_mode_config.c b/drivers/gpu/drm/drm_mode_config.c
index 37b4b9f0e468..b7cde73d5586 100644
--- a/drivers/gpu/drm/drm_mode_config.c
+++ b/drivers/gpu/drm/drm_mode_config.c
@@ -323,7 +323,7 @@ static int drm_mode_create_standard_properties(struct drm_device *dev)
 		return -ENOMEM;
 	dev->mode_config.prop_mode_id = prop;
 
-	prop = drm_property_create_bool(dev, 0,
+	prop = drm_property_create_bool(dev, DRM_MODE_PROP_ATOMIC,
 			"VRR_ENABLED");
 	if (!prop)
 		return -ENOMEM;
diff --git a/include/drm/drm_crtc.h b/include/drm/drm_crtc.h
index a70baea0636c..bde657cb0f9e 100644
--- a/include/drm/drm_crtc.h
+++ b/include/drm/drm_crtc.h
@@ -1333,4 +1333,8 @@ static inline struct drm_crtc *drm_crtc_find(struct drm_device *dev,
 int drm_crtc_create_scaling_filter_property(struct drm_crtc *crtc,
 					    unsigned int supported_filters);
 
+void drm_mode_crtc_attach_vrr_enabled_property(struct drm_crtc *crtc);
+void drm_mode_crtc_set_vrr_enabled_property(struct drm_crtc *crtc,
+					    bool vrr_enabled);
+
 #endif /* __DRM_CRTC_H__ */
-- 
2.35.1

