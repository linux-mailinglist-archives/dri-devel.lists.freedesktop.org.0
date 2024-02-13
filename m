Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DF9EE85292D
	for <lists+dri-devel@lfdr.de>; Tue, 13 Feb 2024 07:41:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EFD4410E8E1;
	Tue, 13 Feb 2024 06:41:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HU6jIcXG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E8C8010E8DE;
 Tue, 13 Feb 2024 06:41:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1707806508; x=1739342508;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=qTOJWIC+khPtJShJ266IzTJdJwyDPTsxFNGO+LWRXxE=;
 b=HU6jIcXGI4TZCUBweO+tPwKb8AUfGLswU7DXXDCUrha2evrO5zcg2tNq
 3ax6h8EL72bdH3yAFf5MoMqXACZl6if7xuewI8xFoogr1GG6V958kYTNN
 R+mMjyt9myzT22u1xkhkkE+m1pTzud/kCiPPLTsuKzAOJeoZgaZ2k6y0h
 jbCSQx00SiXmWmRt+gHHW3Hiq7nsbmdI1+0BZdtmV22Y+Va/YndAPm99+
 Fg3N3bKlbNYfuAAa+PBHzkpCCqzZWK591vkL2jzN7dSWdeuNJ99jRaXQA
 yoWtKoTV+TmKgA7zP711UMWPD4tAFVWISLtRW2Kiq5yxg5yAYhHteCD3b w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10982"; a="436947946"
X-IronPort-AV: E=Sophos;i="6.06,156,1705392000"; d="scan'208";a="436947946"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Feb 2024 22:41:47 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,156,1705392000"; 
   d="scan'208";a="7450378"
Received: from cfl-desktop.iind.intel.com ([10.190.239.20])
 by orviesa003.jf.intel.com with ESMTP; 12 Feb 2024 22:41:41 -0800
From: Uma Shankar <uma.shankar@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: ville.syrjala@linux.intel.com, pekka.paalanen@collabora.com,
 contact@emersion.fr, harry.wentland@amd.com, mwen@igalia.com,
 jadahl@redhat.com, sebastian.wick@redhat.com, shashank.sharma@amd.com,
 agoins@nvidia.com, joshua@froggi.es, mdaenzer@redhat.com, aleixpol@kde.org,
 xaver.hugl@gmail.com, victoria@system76.com, daniel@ffwll.ch,
 quic_naseer@quicinc.com, quic_cbraga@quicinc.com,
 quic_abhinavk@quicinc.com, arthurgrillo@riseup.net, marcan@marcan.st,
 Liviu.Dudau@arm.com, sashamcintosh@google.com, sean@poorly.run,
 Uma Shankar <uma.shankar@intel.com>
Subject: [PATCH 11/28] drm: Define helper for adding capability property for
 1D LUT
Date: Tue, 13 Feb 2024 12:18:18 +0530
Message-ID: <20240213064835.139464-12-uma.shankar@intel.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20240213064835.139464-1-uma.shankar@intel.com>
References: <20240213064835.139464-1-uma.shankar@intel.com>
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

This adds helper functions to create 1D Lut color block
capabilities. It exposes the hardware block as segments
which are converted to blob and passed in the property.

Signed-off-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
Signed-off-by: Uma Shankar <uma.shankar@intel.com>
---
 drivers/gpu/drm/drm_colorop.c | 24 +++++++++++++++++++++++-
 include/drm/drm_colorop.h     |  4 +++-
 2 files changed, 26 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/drm_colorop.c b/drivers/gpu/drm/drm_colorop.c
index cfdc8e751012..98aef26c0c55 100644
--- a/drivers/gpu/drm/drm_colorop.c
+++ b/drivers/gpu/drm/drm_colorop.c
@@ -43,7 +43,6 @@ static const struct drm_prop_enum_list drm_colorop_curve_1d_type_enum_list[] = {
 };
 
 /* Init Helpers */
-__maybe_unused
 static int drm_create_colorop_capability_prop(struct drm_device *dev,
 					      struct drm_colorop *colorop,
 					      struct drm_property_blob *blob)
@@ -65,6 +64,29 @@ static int drm_create_colorop_capability_prop(struct drm_device *dev,
 	return 0;
 }
 
+int drm_colorop_lutcaps_init(struct drm_colorop *colorop,
+			     struct drm_plane *plane,
+			     const struct drm_color_lut_range *ranges,
+			     size_t length)
+{
+	struct drm_device *dev = plane->dev;
+	struct drm_property_blob *blob;
+
+	/* Create Color Caps property for 1D LUT */
+	if (colorop->type != DRM_COLOROP_1D_LUT)
+		return -EINVAL;
+
+	if (WARN_ON(length == 0 || length % sizeof(ranges[0]) != 0))
+		return -EINVAL;
+
+	blob = drm_property_create_blob(plane->dev, length, ranges);
+	if (IS_ERR(blob))
+		return PTR_ERR(blob);
+
+	return drm_create_colorop_capability_prop(dev, colorop, blob);
+}
+EXPORT_SYMBOL(drm_colorop_lutcaps_init);
+
 int drm_colorop_init(struct drm_device *dev, struct drm_colorop *colorop,
 		     struct drm_plane *plane, enum drm_colorop_type type)
 {
diff --git a/include/drm/drm_colorop.h b/include/drm/drm_colorop.h
index f417e109c40a..d15d5b489401 100644
--- a/include/drm/drm_colorop.h
+++ b/include/drm/drm_colorop.h
@@ -233,7 +233,9 @@ static inline struct drm_colorop *drm_colorop_find(struct drm_device *dev,
 
 int drm_colorop_init(struct drm_device *dev, struct drm_colorop *colorop,
 		     struct drm_plane *plane, enum drm_colorop_type type);
-
+int drm_colorop_lutcaps_init(struct drm_colorop *colorop, struct drm_plane *plane,
+			     const struct drm_color_lut_range *ranges,
+			     size_t length);
 struct drm_colorop_state *
 drm_atomic_helper_colorop_duplicate_state(struct drm_colorop *colorop);
 
-- 
2.42.0

