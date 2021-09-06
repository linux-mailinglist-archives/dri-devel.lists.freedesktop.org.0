Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B9844020EB
	for <lists+dri-devel@lfdr.de>; Mon,  6 Sep 2021 23:02:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 647108987A;
	Mon,  6 Sep 2021 21:01:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6BF6589789;
 Mon,  6 Sep 2021 21:01:34 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10099"; a="283747514"
X-IronPort-AV: E=Sophos;i="5.85,273,1624345200"; d="scan'208";a="283747514"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Sep 2021 14:01:34 -0700
X-IronPort-AV: E=Sophos;i="5.85,273,1624345200"; d="scan'208";a="537362274"
Received: from linux-desktop.iind.intel.com ([10.223.34.178])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Sep 2021 14:01:31 -0700
From: Uma Shankar <uma.shankar@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: harry.wentland@amd.com, ville.syrjala@linux.intel.com, ppaalanen@gmail.com,
 brian.starkey@arm.com, sebastian@sebastianwick.net,
 Shashank.Sharma@amd.com, Uma Shankar <uma.shankar@intel.com>
Subject: [RFC v2 14/22] drm: Add helper to attach Plane ctm property
Date: Tue,  7 Sep 2021 03:08:56 +0530
Message-Id: <20210906213904.27918-15-uma.shankar@intel.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210906213904.27918-1-uma.shankar@intel.com>
References: <20210906213904.27918-1-uma.shankar@intel.com>
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
index c4ed1799ecaf..3d329f71d287 100644
--- a/include/drm/drm_plane.h
+++ b/include/drm/drm_plane.h
@@ -889,6 +889,7 @@ int drm_plane_create_color_mgmt_properties(struct drm_device *dev,
 					   struct drm_plane *plane,
 					   int num_values);
 void drm_plane_attach_degamma_properties(struct drm_plane *plane);
+void drm_plane_attach_ctm_property(struct drm_plane *plane);
 int drm_plane_color_add_gamma_degamma_mode_range(struct drm_plane *plane,
 						 const char *name,
 						 const struct drm_color_lut_range *ranges,
-- 
2.26.2

