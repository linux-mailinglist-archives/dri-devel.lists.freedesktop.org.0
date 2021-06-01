Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C3F18397122
	for <lists+dri-devel@lfdr.de>; Tue,  1 Jun 2021 12:16:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E198E6E9F7;
	Tue,  1 Jun 2021 10:16:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D52E06E9F2;
 Tue,  1 Jun 2021 10:16:21 +0000 (UTC)
IronPort-SDR: iNedb+nvi+t92kVx0zqoaUXmmyCxwrwggh1CKM1unI+AyBXTARxQdK+92YLCPMfn6ApsWG+kks
 asZrw6zbq6Mw==
X-IronPort-AV: E=McAfee;i="6200,9189,10001"; a="203550002"
X-IronPort-AV: E=Sophos;i="5.83,239,1616482800"; d="scan'208";a="203550002"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jun 2021 03:16:21 -0700
IronPort-SDR: Uei5AL0gV3yyJkEqNDQwz7gbuyL3x+yD2RXXYCmGjL9aBcJ7JApZ2xJVQxr7Fvzv0aEyya4mZm
 3mNXluH519hw==
X-IronPort-AV: E=Sophos;i="5.83,239,1616482800"; d="scan'208";a="482431311"
Received: from linux-desktop.iind.intel.com ([10.223.34.178])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jun 2021 03:16:19 -0700
From: Uma Shankar <uma.shankar@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 10/21] drm/i915/xelpd: Initialize plane color features
Date: Tue,  1 Jun 2021 16:22:07 +0530
Message-Id: <20210601105218.29185-11-uma.shankar@intel.com>
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

Initialize plane color features for XE_LPD.

Signed-off-by: Uma Shankar <uma.shankar@intel.com>
---
 drivers/gpu/drm/i915/display/intel_atomic_plane.h  | 1 +
 drivers/gpu/drm/i915/display/skl_universal_plane.c | 2 ++
 2 files changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_atomic_plane.h b/drivers/gpu/drm/i915/display/intel_atomic_plane.h
index dc4d05e75e1c..c809f522a710 100644
--- a/drivers/gpu/drm/i915/display/intel_atomic_plane.h
+++ b/drivers/gpu/drm/i915/display/intel_atomic_plane.h
@@ -65,5 +65,6 @@ int intel_atomic_plane_check_clipping(struct intel_plane_state *plane_state,
 				      bool can_position);
 void intel_plane_set_invisible(struct intel_crtc_state *crtc_state,
 			       struct intel_plane_state *plane_state);
+int intel_plane_color_init(struct drm_plane *plane);
 
 #endif /* __INTEL_ATOMIC_PLANE_H__ */
diff --git a/drivers/gpu/drm/i915/display/skl_universal_plane.c b/drivers/gpu/drm/i915/display/skl_universal_plane.c
index ae439dca4b3c..aadb984fdf77 100644
--- a/drivers/gpu/drm/i915/display/skl_universal_plane.c
+++ b/drivers/gpu/drm/i915/display/skl_universal_plane.c
@@ -2184,6 +2184,8 @@ skl_universal_plane_create(struct drm_i915_private *dev_priv,
 						BIT(DRM_SCALING_FILTER_DEFAULT) |
 						BIT(DRM_SCALING_FILTER_NEAREST_NEIGHBOR));
 
+	intel_plane_color_init(&plane->base);
+
 	drm_plane_helper_add(&plane->base, &intel_plane_helper_funcs);
 
 	return plane;
-- 
2.26.2

