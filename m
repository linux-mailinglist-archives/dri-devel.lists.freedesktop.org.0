Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EC4D1AF0EFB
	for <lists+dri-devel@lfdr.de>; Wed,  2 Jul 2025 11:07:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E42D310E60E;
	Wed,  2 Jul 2025 09:07:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hKfN6+oN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B0B8F10E658;
 Wed,  2 Jul 2025 09:07:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751447266; x=1782983266;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=AQYY5C7bbyQRLzDF16o7XTTkD4nboy3xK5xdJyJTZ/E=;
 b=hKfN6+oNF1iNwuENJyNW5wRsgRGmvuu7G0JPSrfaEQchQrlLegKQHFGE
 wXJjdqj+KglZHp1TvoMf+ekgVfY+L6/W5iU5tvxLo5f+U9yIBA7sE5yH8
 V4bcPVupuncLhU6B5//SGSRIqJgwwC1c7E2C6lT19EQutYCWlQMV9K0Cc
 frSQBNzDNnH655hxh3dViaryf0NWy/jm7H3WUdLTfLqqAUQgngtibGPgE
 q+Tvb/i7LkiOYMwZrBgzEqRZCzRf91WqqZGtDhR4Fqqdp3gt/cXL2NU6K
 mzdimo4d2plvOxUqIph2pNBad2Jz9hfobHABHMUioVgUbSk53GOPs7sMq g==;
X-CSE-ConnectionGUID: YeM1q6RIQ3W4CrT5lOaWVQ==
X-CSE-MsgGUID: T7XAPpWETH6J0XHVk5rzFA==
X-IronPort-AV: E=McAfee;i="6800,10657,11481"; a="64426969"
X-IronPort-AV: E=Sophos;i="6.16,281,1744095600"; d="scan'208";a="64426969"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jul 2025 02:07:46 -0700
X-CSE-ConnectionGUID: wqHgkVDYTsCaAlW3sg3ohg==
X-CSE-MsgGUID: 0XLAV9pBQnihFTzH83vbNQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,281,1744095600"; d="scan'208";a="159536360"
Received: from cfl-desktop.iind.intel.com ([10.190.239.20])
 by fmviesa004.fm.intel.com with ESMTP; 02 Jul 2025 02:07:42 -0700
From: Uma Shankar <uma.shankar@intel.com>
To: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Cc: chaitanya.kumar.borah@intel.com, ville.syrjala@linux.intel.com,
 pekka.paalanen@collabora.com, contact@emersion.fr, harry.wentland@amd.com,
 mwen@igalia.com, jadahl@redhat.com, sebastian.wick@redhat.com,
 shashank.sharma@amd.com, swati2.sharma@intel.com, alex.hung@amd.com,
 Uma Shankar <uma.shankar@intel.com>
Subject: [v5 03/24] drm: Add Color ops capability property
Date: Wed,  2 Jul 2025 14:49:15 +0530
Message-ID: <20250702091936.3004854-4-uma.shankar@intel.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20250702091936.3004854-1-uma.shankar@intel.com>
References: <20250702091936.3004854-1-uma.shankar@intel.com>
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
index 3a9dc98d7653..81a8da09fbfe 100644
--- a/drivers/gpu/drm/drm_atomic_uapi.c
+++ b/drivers/gpu/drm/drm_atomic_uapi.c
@@ -785,6 +785,9 @@ drm_atomic_colorop_get_property(struct drm_colorop *colorop,
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
index d5aebe46970f..46099e81bbfa 100644
--- a/include/drm/drm_colorop.h
+++ b/include/drm/drm_colorop.h
@@ -155,6 +155,16 @@ struct drm_colorop_state {
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
@@ -305,6 +315,13 @@ struct drm_colorop {
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

