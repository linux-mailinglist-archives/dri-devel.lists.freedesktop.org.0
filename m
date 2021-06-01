Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9271E397129
	for <lists+dri-devel@lfdr.de>; Tue,  1 Jun 2021 12:16:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B9276E9F5;
	Tue,  1 Jun 2021 10:16:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 99D8D6E9FE;
 Tue,  1 Jun 2021 10:16:27 +0000 (UTC)
IronPort-SDR: zc9rjJzVDmT2rIaHoBcNMSGIFFIUCxaFbKWO5ehu9nuUZ9IIaYrNVhNXjMIaKfHIWqTfxltqFQ
 SE5R6gsWns1g==
X-IronPort-AV: E=McAfee;i="6200,9189,10001"; a="203550019"
X-IronPort-AV: E=Sophos;i="5.83,239,1616482800"; d="scan'208";a="203550019"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jun 2021 03:16:27 -0700
IronPort-SDR: 6QqiDCPCLpbSCXrbMfMCPu7gZdrPaRB8ROj5KAn6Xt5ikfUiE34anM0K8SpgK8v65e0XkAzDlL
 EijzoNxBJbSQ==
X-IronPort-AV: E=Sophos;i="5.83,239,1616482800"; d="scan'208";a="482431344"
Received: from linux-desktop.iind.intel.com ([10.223.34.178])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jun 2021 03:16:25 -0700
From: Uma Shankar <uma.shankar@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 13/21] drm: Add helper to attach Plane ctm property
Date: Tue,  1 Jun 2021 16:22:10 +0530
Message-Id: <20210601105218.29185-14-uma.shankar@intel.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210601105218.29185-1-uma.shankar@intel.com>
References: <20210601105218.29185-1-uma.shankar@intel.com>
MIME-Version: 1.0
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
Cc: Uma Shankar <uma.shankar@intel.com>, bhanuprakash.modem@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add a DRM helper to attach ctm property.

Signed-off-by: Uma Shankar <uma.shankar@intel.com>
---
 drivers/gpu/drm/drm_color_mgmt.c | 10 ++++++++++
 include/drm/drm_plane.h          |  1 +
 2 files changed, 11 insertions(+)

diff --git a/drivers/gpu/drm/drm_color_mgmt.c b/drivers/gpu/drm/drm_color_mgmt.c
index 83832adf3adf..5c3138497b9c 100644
--- a/drivers/gpu/drm/drm_color_mgmt.c
+++ b/drivers/gpu/drm/drm_color_mgmt.c
@@ -654,6 +654,16 @@ void drm_plane_attach_degamma_properties(struct drm_plane *plane)
 }
 EXPORT_SYMBOL(drm_plane_attach_degamma_properties);
 
+void drm_plane_attach_ctm_property(struct drm_plane *plane)
+{
+	if (!plane->ctm_property)
+		return;
+
+	drm_object_attach_property(&plane->base,
+				   plane->ctm_property, 0);
+}
+EXPORT_SYMBOL(drm_plane_attach_ctm_property);
+
 int drm_plane_color_add_gamma_degamma_mode_range(struct drm_plane *plane,
 						 const char *name,
 						 const struct drm_color_lut_range *ranges,
diff --git a/include/drm/drm_plane.h b/include/drm/drm_plane.h
index 83d11918333b..4557f59cf3cf 100644
--- a/include/drm/drm_plane.h
+++ b/include/drm/drm_plane.h
@@ -886,6 +886,7 @@ int drm_plane_create_color_mgmt_properties(struct drm_device *dev,
 					   struct drm_plane *plane,
 					   int num_values);
 void drm_plane_attach_degamma_properties(struct drm_plane *plane);
+void drm_plane_attach_ctm_property(struct drm_plane *plane);
 int drm_plane_color_add_gamma_degamma_mode_range(struct drm_plane *plane,
 						 const char *name,
 						 const struct drm_color_lut_range *ranges,
-- 
2.26.2

