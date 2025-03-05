Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 31F09A4FFD6
	for <lists+dri-devel@lfdr.de>; Wed,  5 Mar 2025 14:14:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 83A9410E776;
	Wed,  5 Mar 2025 13:14:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="U43BgpOa";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 43DAB10E78F;
 Wed,  5 Mar 2025 13:14:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741180464; x=1772716464;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=RK6sGV3incBbJu95OafSKlCwfolHFaR1EPEb79KFz14=;
 b=U43BgpOaA4i4O0zMpGJcRgTNIGmAoV7cR7XL4gYZ7jn5O8ExZ8paMwH9
 uCP6gxv+CGtdItuB+9gF0pA9wKy4kJULFPGcBg3/Ri+oaWAMoDnqeIXvU
 DjkCRwePl6nkQTTfK/a35kdm1g+r6jdb2k0b1TCA03lVWYdHLwG31E+q8
 wazGtQLzXR/OHRkYiVRQx//mk55g2Rl2kkSwhNiMaZ4HuSryejX67knPo
 UsTBOiNkkZzp4sr8pBV4+LPdciONmYXZgOVsvA0J1c05qBH82kfon4dL2
 pnsexJl6Yu+eCQScF9agzXbh8q0ucmXScoFtMj0klfM+jvqg9HKUn9oz3 w==;
X-CSE-ConnectionGUID: unPvHphxTeS0vf1deuCVng==
X-CSE-MsgGUID: i3MYAtIaQDaii5xrPFgc5g==
X-IronPort-AV: E=McAfee;i="6700,10204,11363"; a="59685413"
X-IronPort-AV: E=Sophos;i="6.14,223,1736841600"; d="scan'208";a="59685413"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Mar 2025 05:14:24 -0800
X-CSE-ConnectionGUID: WVFIblGcTruT2eJxU2FYqQ==
X-CSE-MsgGUID: wNgB4wDmQM6Pt7YEWaBIDw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,223,1736841600"; d="scan'208";a="118701108"
Received: from cfl-desktop.iind.intel.com ([10.190.239.20])
 by orviesa006.jf.intel.com with ESMTP; 05 Mar 2025 05:14:20 -0800
From: Uma Shankar <uma.shankar@intel.com>
To: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org
Cc: ville.syrjala@linux.intel.com, harry.wentland@amd.com,
 pekka.paalanen@haloniitty.fi, sebastian.wick@redhat.com, jadahl@redhat.com,
 mwen@igalia.com, contact@emersion.fr, naveen1.kumar@intel.com,
 dmitry.baryshkov@linaro.org, Uma Shankar <uma.shankar@intel.com>
Subject: [v3 05/23] drm: Add Color ops capability property
Date: Wed,  5 Mar 2025 18:55:50 +0530
Message-ID: <20250305132608.2379253-6-uma.shankar@intel.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20250305132608.2379253-1-uma.shankar@intel.com>
References: <20250305132608.2379253-1-uma.shankar@intel.com>
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

Add capability property which a colorop can expose it's
hardware's abilities. It's a blob property that can be
filled with respective data structures depending on the
colorop. The user space is expected to read this property
and program the colorop accordingly.

v2: Added documentation for hw_caps blob (Dmitry)

Signed-off-by: Uma Shankar <uma.shankar@intel.com>
Signed-off-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
---
 drivers/gpu/drm/drm_atomic_uapi.c |  3 +++
 include/drm/drm_colorop.h         | 17 +++++++++++++++++
 2 files changed, 20 insertions(+)

diff --git a/drivers/gpu/drm/drm_atomic_uapi.c b/drivers/gpu/drm/drm_atomic_uapi.c
index 8258558ff334..b469f0ee9a25 100644
--- a/drivers/gpu/drm/drm_atomic_uapi.c
+++ b/drivers/gpu/drm/drm_atomic_uapi.c
@@ -771,6 +771,9 @@ drm_atomic_colorop_get_property(struct drm_colorop *colorop,
 		*val = colorop->lut3d_interpolation;
 	} else if (property == colorop->data_property) {
 		*val = (state->data) ? state->data->base.id : 0;
+	} else if (property == colorop->hw_caps_property) {
+		*val = state->hw_caps ?
+			state->hw_caps->base.id : 0;
 	} else {
 		return -EINVAL;
 	}
diff --git a/include/drm/drm_colorop.h b/include/drm/drm_colorop.h
index 1cd8ce81224e..731bd1484c34 100644
--- a/include/drm/drm_colorop.h
+++ b/include/drm/drm_colorop.h
@@ -141,6 +141,16 @@ struct drm_colorop_state {
 	 */
 	uint64_t multiplier;
 
+	/**
+	 * @hw_caps:
+	 *
+	 * This blob will be of type struct drm_color_lut_range which contains the
+	 * hardware capabilities of 1D LUT. These include number of LUT segments,
+	 * number of LUT samples per segment, start and end point of respective
+	 * segments and the precision of the LUT sample along with the normalization factor
+	 */
+	struct drm_property_blob *hw_caps;
+
 	/**
 	 * @data:
 	 *
@@ -309,6 +319,13 @@ struct drm_colorop {
 	 */
 	struct drm_property *curve_1d_type_property;
 
+	/**
+	 * @hw_caps_property:
+	 *
+	 * Property to expose hardware lut capabilities.
+	 */
+	struct drm_property *hw_caps_property;
+
 	/**
 	 * @multiplier_property:
 	 *
-- 
2.42.0

