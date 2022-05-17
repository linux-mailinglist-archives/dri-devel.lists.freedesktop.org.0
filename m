Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A3BF529ACA
	for <lists+dri-devel@lfdr.de>; Tue, 17 May 2022 09:29:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 56BE710E5D7;
	Tue, 17 May 2022 07:29:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9806010E648;
 Tue, 17 May 2022 07:29:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1652772579; x=1684308579;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=lQwHo4aI3G4h8/SKmmjgREZnwdrfhdPH0G5GNmpvfvA=;
 b=mcJPqD620PRLZ5ArID8HJh8C6NjfcNWIMXs61GH6us6YPaXXUjL4+uq8
 XP6spXeWiaJRaCG4/TYXJC8IxpCTQbbCa3I4tKb5MHXw5+uqcgNP7MIfI
 zXvilckP7eu2UnwKs7dY1eBhVaN+9fhTz/ZOICe1txGq1SibZrt7UnCZI
 70IHPJHMs/pCQJipzeRP/0C7dk7K5lpCMjPLq5TCv6J46AnyK3MG1zTXO
 tPG6V8buDjuQC2ly+0rHRQXoMWvtOFVxf26aTeBqUDJrEtsEMVpZb1isu
 ojlMFW9E3xH56Uvd+Wq+3C+GwydVtaZBd3D1awTIN5ucxTOigReXXQ4lH A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10349"; a="271039314"
X-IronPort-AV: E=Sophos;i="5.91,232,1647327600"; d="scan'208";a="271039314"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 May 2022 00:29:38 -0700
X-IronPort-AV: E=Sophos;i="5.91,232,1647327600"; d="scan'208";a="544777191"
Received: from bhanu-nuclab.iind.intel.com ([10.145.162.173])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 May 2022 00:29:36 -0700
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 manasi.d.navare@intel.com
Subject: [RFC V3 1/2] drm/vrr: Attach vrr_enabled property to the drm crtc
Date: Tue, 17 May 2022 12:56:35 +0530
Message-Id: <20220517072636.3516381-2-bhanuprakash.modem@intel.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220517072636.3516381-1-bhanuprakash.modem@intel.com>
References: <20220517072636.3516381-1-bhanuprakash.modem@intel.com>
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
V3: Drop helper to attach vrr_enabled prop, since it is already
attached (Manasi)

Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
Cc: Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>
Cc: Manasi Navare <manasi.d.navare@intel.com>
Cc: Harry Wentland <harry.wentland@amd.com>
Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
---
 drivers/gpu/drm/drm_crtc.c        | 26 ++++++++++++++++++++++++++
 drivers/gpu/drm/drm_mode_config.c |  2 +-
 include/drm/drm_crtc.h            |  3 +++
 3 files changed, 30 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_crtc.c b/drivers/gpu/drm/drm_crtc.c
index 26a77a735905..8bb8b4bf4199 100644
--- a/drivers/gpu/drm/drm_crtc.c
+++ b/drivers/gpu/drm/drm_crtc.c
@@ -239,6 +239,9 @@ struct dma_fence *drm_crtc_create_fence(struct drm_crtc *crtc)
  * 		Driver's default scaling filter
  * 	Nearest Neighbor:
  * 		Nearest Neighbor scaling filter
+ * VRR_ENABLED:
+ *	Atomic property for setting the VRR state of the CRTC.
+ *	To enable the VRR on CRTC, user-space must set this property to 1.
  */
 
 __printf(6, 0)
@@ -883,3 +886,26 @@ int drm_crtc_create_scaling_filter_property(struct drm_crtc *crtc,
 	return 0;
 }
 EXPORT_SYMBOL(drm_crtc_create_scaling_filter_property);
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
index a70baea0636c..906787398f40 100644
--- a/include/drm/drm_crtc.h
+++ b/include/drm/drm_crtc.h
@@ -1333,4 +1333,7 @@ static inline struct drm_crtc *drm_crtc_find(struct drm_device *dev,
 int drm_crtc_create_scaling_filter_property(struct drm_crtc *crtc,
 					    unsigned int supported_filters);
 
+void drm_mode_crtc_set_vrr_enabled_property(struct drm_crtc *crtc,
+					    bool vrr_enabled);
+
 #endif /* __DRM_CRTC_H__ */
-- 
2.35.1

