Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F4B985295A
	for <lists+dri-devel@lfdr.de>; Tue, 13 Feb 2024 07:43:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 717C010EB0F;
	Tue, 13 Feb 2024 06:43:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Jp7vllI8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D54B310EB0F;
 Tue, 13 Feb 2024 06:43:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1707806628; x=1739342628;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=bDkeXF73zakQH63leGMY5eCTZzrzCq3q6yvVSB08JrI=;
 b=Jp7vllI8fMB2PICwAeAOWhSx7pzHS4Yfv1U8+UolIa4iolvPOeWbO5aZ
 sfgmQAT1DlJPLrx471hjdByHijvGw23LA0p6tWgg9o0wzcXBKK4t2l9Bp
 Bn/F2GPpv3xkB4+ymM6vzNSzNHZPxVSjCBKeaPjNpDHb9asD9mmsh13s6
 PlCk940b1rw79pFOv3cxdHi4K5N8693nczvqy2wjjoqYrFqrLxlZIu5mD
 2A4XUY8U9yPQ4Mk35UJYHZXC/TLni1OfY9HE9q//cwg+d7qgr4q5dQQNz
 UJN7s6OvTA5R9r73nGrpuuGgFZHNp4YRLwaXDzYsx0JzjQ0ZnVlGqcJzG w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10982"; a="436948334"
X-IronPort-AV: E=Sophos;i="6.06,156,1705392000"; d="scan'208";a="436948334"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Feb 2024 22:43:48 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,156,1705392000"; 
   d="scan'208";a="7450741"
Received: from cfl-desktop.iind.intel.com ([10.190.239.20])
 by orviesa003.jf.intel.com with ESMTP; 12 Feb 2024 22:43:41 -0800
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
 Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>,
 Uma Shankar <uma.shankar@intel.com>
Subject: [PATCH 28/28] drm/i915/color: Enable Plane Color Pipelines
Date: Tue, 13 Feb 2024 12:18:35 +0530
Message-ID: <20240213064835.139464-29-uma.shankar@intel.com>
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

From: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>

Expose color pipeline and add capability to program it.

Signed-off-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
Signed-off-by: Uma Shankar <uma.shankar@intel.com>
---
 drivers/gpu/drm/i915/display/skl_universal_plane.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/skl_universal_plane.c b/drivers/gpu/drm/i915/display/skl_universal_plane.c
index 7096ea8a3454..64e70cc34ddb 100644
--- a/drivers/gpu/drm/i915/display/skl_universal_plane.c
+++ b/drivers/gpu/drm/i915/display/skl_universal_plane.c
@@ -11,6 +11,7 @@
 #include "i915_drv.h"
 #include "i915_reg.h"
 #include "intel_atomic_plane.h"
+#include "intel_color.h"
 #include "intel_de.h"
 #include "intel_display_irq.h"
 #include "intel_display_types.h"
@@ -1279,6 +1280,8 @@ icl_plane_update_noarm(struct intel_plane *plane,
 	plane_color_ctl = plane_state->color_ctl |
 		glk_plane_color_ctl_crtc(crtc_state);
 
+	intel_program_pipeline(&plane_state->uapi, &plane_color_ctl);
+
 	/* The scaler will handle the output position */
 	if (plane_state->scaler_id >= 0) {
 		crtc_x = 0;
@@ -2432,6 +2435,8 @@ skl_universal_plane_create(struct drm_i915_private *dev_priv,
 						  BIT(DRM_COLOR_YCBCR_FULL_RANGE),
 						  DRM_COLOR_YCBCR_BT709,
 						  DRM_COLOR_YCBCR_LIMITED_RANGE);
+	else
+		intel_plane_color_init(&plane->base);
 
 	drm_plane_create_alpha_property(&plane->base);
 	drm_plane_create_blend_mode_property(&plane->base,
-- 
2.42.0

