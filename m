Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A4D4D78C91E
	for <lists+dri-devel@lfdr.de>; Tue, 29 Aug 2023 18:00:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9932D10E408;
	Tue, 29 Aug 2023 15:59:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6219310E3ED;
 Tue, 29 Aug 2023 15:59:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1693324760; x=1724860760;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=iwg4rBH4m7ug9GjBkFE9l0ehZa1pDqfiYiwxbl/iRmU=;
 b=jJwhkCDUO2boxoDUz5uy+eb1rwDeoEnTLf2leXj3bmtjdjA7A6vEkZig
 9/0RtlHLPcHDhBaLgPgxfTVQ1Ez/GpsT3gU5x8uwEHoE4TfrE3G/xAY2l
 vT91FjEBKEdsuR7y9na1uw6zAwa4LHcFYxeg+RMdmwQpqatwNyDr1ku9S
 zY1ZuwM5nNcpCKJZC2xLC4uFNNbmvGD+2GoPEPvVvLxti9DQ8VhwmTQbt
 xOhu9/XkxnxEpL27ZjE/ha1FvMhxE+sl0RxMuDMsD8X2JpGyjwPqY+TM2
 PLDq0PKh/Ca3ikz7l7ayhwXU0DQ3rSONdwAiBuxafNDk5qpcdcrnqENMX w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10817"; a="441769380"
X-IronPort-AV: E=Sophos;i="6.02,210,1688454000"; d="scan'208";a="441769380"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Aug 2023 08:59:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10817"; a="688555044"
X-IronPort-AV: E=Sophos;i="6.02,210,1688454000"; d="scan'208";a="688555044"
Received: from cfl-desktop.iind.intel.com ([10.190.239.20])
 by orsmga003.jf.intel.com with ESMTP; 29 Aug 2023 08:59:18 -0700
From: Uma Shankar <uma.shankar@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [RFC 18/33] drm/i915/color: Add HDR plane LUT range data to color
 pipeline
Date: Tue, 29 Aug 2023 21:34:07 +0530
Message-ID: <20230829160422.1251087-19-uma.shankar@intel.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20230829160422.1251087-1-uma.shankar@intel.com>
References: <20230829160422.1251087-1-uma.shankar@intel.com>
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
Cc: Uma Shankar <uma.shankar@intel.com>,
 Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>,
 wayland-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>

Create a helper function to add details about LUT ranges that HDR
planes can support. Userspace can parse through this information
to generate proper LUT data for respective hardware blocks. It will
be exposed to the user space by the color pipeline.

Co-developed-by: Uma Shankar <uma.shankar@intel.com>
Signed-off-by: Uma Shankar <uma.shankar@intel.com>
Signed-off-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
---
 drivers/gpu/drm/i915/display/intel_color.c | 47 ++++++++++++++++++++++
 1 file changed, 47 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_color.c b/drivers/gpu/drm/i915/display/intel_color.c
index 09e50659befd..99ae3f4fca05 100644
--- a/drivers/gpu/drm/i915/display/intel_color.c
+++ b/drivers/gpu/drm/i915/display/intel_color.c
@@ -28,6 +28,7 @@
 #include "intel_de.h"
 #include "intel_display_types.h"
 #include "intel_dsb.h"
+#include "skl_universal_plane.h"
 
 struct intel_color_funcs {
 	int (*color_check)(struct intel_crtc_state *crtc_state);
@@ -3976,6 +3977,52 @@ struct drm_color_op color_pipeline_hdr[] = {
 	},
 };
 
+__maybe_unused
+static int intel_prepare_plane_color_pipeline(struct drm_plane *plane)
+{
+	struct drm_i915_private *i915 = to_i915(plane->dev);
+	struct drm_property_blob *blob[2] = {NULL};
+	int ret = 0, i = 0;
+
+	if (icl_is_hdr_plane(i915, to_intel_plane(plane)->id)) {
+		blob[i] = drm_property_create_blob(plane->dev,
+						   sizeof(xelpd_pre_csc_hdr),
+						   xelpd_pre_csc_hdr);
+		if (IS_ERR(blob[i])) {
+			ret = PTR_ERR(blob[i]);
+			goto out;
+		}
+
+		/*
+		 * In HDR color pipeline PRE-CSC and POST-CSC are positioned
+		 * at 0th and 2nd index/position
+		 */
+		color_pipeline_hdr[0].blob_id =
+			blob[i++]->base.id;
+
+		blob[i] = drm_property_create_blob(plane->dev,
+						   sizeof(xelpd_post_csc_hdr),
+						   xelpd_post_csc_hdr);
+		if (IS_ERR(blob[i])) {
+			ret = PTR_ERR(blob[i]);
+			goto out;
+		}
+
+		color_pipeline_hdr[2].blob_id =
+			blob[i++]->base.id;
+	}
+
+out:
+	if (ret) {
+		for (int j = 0; j < i; j++) {
+			if (blob[j])
+				drm_property_blob_put(blob[j]);
+		}
+	}
+
+	return ret;
+};
+
 void intel_color_crtc_init(struct intel_crtc *crtc)
 {
 	struct drm_i915_private *i915 = to_i915(crtc->base.dev);
-- 
2.38.1

