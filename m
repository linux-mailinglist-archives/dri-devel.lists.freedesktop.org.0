Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BCA350B217
	for <lists+dri-devel@lfdr.de>; Fri, 22 Apr 2022 09:58:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD73B112201;
	Fri, 22 Apr 2022 07:58:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DAF18112201;
 Fri, 22 Apr 2022 07:58:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1650614282; x=1682150282;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Uz8B9dR+mlSMvo2rPOk5rhgDGmXUpJG2LHfjy92EP3E=;
 b=iLLC7U1z1xZcBlsBZkU/sO2jPMrk3lIVwEz+Ta8tsK08vG+RWf4cAieC
 guyAXFcDJ8f/uA8lwESkUiXm5H6bOO5Q1oXrttlXfYPcmUf1e6XtZvPrL
 WhzDbPiCOQURvIBfeFZy71XIMkKGQYwk0mMOJ2MFhtRQHxJdlA1fo/Eh4
 RXpwoBxh23pqz1AlWuCyQ6NITLG7MlFRD81zteI2vrnjFP4cwgPlGcIE/
 V5L4/UwMW6TqNo1C7NZ+eMIYoRZaKgGWGXZ3Biy1rk6DfyeOd5S+5ozbR
 CPaqAW1F0Mu0VJ90BWY/Gh78eOnW4n7EGN8QOzK+H3rfWnCtCAJ89QNvQ w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10324"; a="325062216"
X-IronPort-AV: E=Sophos;i="5.90,281,1643702400"; d="scan'208";a="325062216"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Apr 2022 00:58:02 -0700
X-IronPort-AV: E=Sophos;i="5.90,281,1643702400"; d="scan'208";a="703447971"
Received: from bhanu-nuclab.iind.intel.com ([10.145.162.173])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Apr 2022 00:58:00 -0700
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 ville.syrjala@linux.intel.com, manasi.d.navare@intel.com
Subject: [RFC 1/2] drm/vrr: Attach vrr_enabled property to the drm crtc
Date: Fri, 22 Apr 2022 13:25:35 +0530
Message-Id: <20220422075536.2792833-2-bhanuprakash.modem@intel.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220422075536.2792833-1-bhanuprakash.modem@intel.com>
References: <20220422075536.2792833-1-bhanuprakash.modem@intel.com>
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

Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
Cc: Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>
Cc: Manasi Navare <manasi.d.navare@intel.com>
Cc: Harry Wentland <harry.wentland@amd.com>
Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
---
 drivers/gpu/drm/drm_crtc.c | 44 ++++++++++++++++++++++++++++++++++++++
 include/drm/drm_crtc.h     |  4 ++++
 2 files changed, 48 insertions(+)

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

