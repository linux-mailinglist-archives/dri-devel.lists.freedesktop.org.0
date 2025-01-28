Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BA6BAA20DFC
	for <lists+dri-devel@lfdr.de>; Tue, 28 Jan 2025 17:06:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B35D510E6B8;
	Tue, 28 Jan 2025 16:06:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nrgpBErD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 462A910E6D0;
 Tue, 28 Jan 2025 16:06:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738080377; x=1769616377;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:references:in-reply-to:to:cc;
 bh=tytZRYyfYA3y2izhmQ9swOxEnWGAipvdacrNR4XZ45M=;
 b=nrgpBErDF+wCiPMpMT93sFu+UjutidSO4Jjmw2HMwDl0oDG4zAyDirFi
 w3W2o7x38BzjevP93OqBdTHlag013knoCYc/47cUshOMDS6ARPwqGstpA
 Xe5sYQsqgagaE67eYvfkd4F2McPwLq5xHjZDBZiPC+XNVlITbEn1T2qgW
 4qyG2aBq3pJg+G7vknFMYSrL8IXfdcmFd7DSx2dLXEjN6HSeNnJiqrQoC
 /bA97DCUEsitjBl42HX9RU3Yv9Gu2pUWslt0GrbIG67peXDqeUTRFElSr
 qxE9yyb+f+Y1ivP1cCfSA/5wKYWH9N2vjlagyetERx4nf+ZLpllILfDzp g==;
X-CSE-ConnectionGUID: 2skRwZ20RGe0g/fDL0kZQw==
X-CSE-MsgGUID: f8CgoEkZRqOZjeA4lv7aqQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11329"; a="38745045"
X-IronPort-AV: E=Sophos;i="6.13,241,1732608000"; d="scan'208";a="38745045"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jan 2025 08:06:17 -0800
X-CSE-ConnectionGUID: ObUR8fJOSa+u3s6otdjOoA==
X-CSE-MsgGUID: UO+GMQFbTDGMYGwd66oXDg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="145976991"
Received: from srr4-3-linux-106-armuthy.iind.intel.com ([10.190.238.56])
 by orviesa001.jf.intel.com with ESMTP; 28 Jan 2025 08:06:14 -0800
From: Arun R Murthy <arun.r.murthy@intel.com>
Date: Tue, 28 Jan 2025 21:21:15 +0530
Subject: [PATCH v8 09/14] drm/i915/histogram: Hook i915 histogram with drm
 histogram
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250128-dpst-v8-9-871b94d777f8@intel.com>
References: <20250128-dpst-v8-0-871b94d777f8@intel.com>
In-Reply-To: <20250128-dpst-v8-0-871b94d777f8@intel.com>
To: intel-xe@lists.freedesktop.org, intel-gfx@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org
Cc: suraj.kandpal@intel.com, dmitry.baryshkov@linaro.org, 
 Arun R Murthy <arun.r.murthy@intel.com>
X-Mailer: b4 0.15-dev
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

Handle histogram caps and histogram config property in i915 driver. Fill
the histogram hardware capability and act upon the histogram config
property to enable/disable histogram in i915.

Signed-off-by: Arun R Murthy <arun.r.murthy@intel.com>
---
 drivers/gpu/drm/i915/display/intel_crtc.c    |  7 +++++++
 drivers/gpu/drm/i915/display/intel_display.c | 12 ++++++++++++
 2 files changed, 19 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_crtc.c b/drivers/gpu/drm/i915/display/intel_crtc.c
index e69b28779ac551bde56c9c3d394e784275a9b69e..b90017409a23de2a214ca43d32ba537998ea0f78 100644
--- a/drivers/gpu/drm/i915/display/intel_crtc.c
+++ b/drivers/gpu/drm/i915/display/intel_crtc.c
@@ -28,6 +28,7 @@
 #include "intel_drrs.h"
 #include "intel_dsi.h"
 #include "intel_fifo_underrun.h"
+#include "intel_histogram.h"
 #include "intel_pipe_crc.h"
 #include "intel_psr.h"
 #include "intel_sprite.h"
@@ -211,6 +212,7 @@ static struct intel_crtc *intel_crtc_alloc(void)
 static void intel_crtc_free(struct intel_crtc *crtc)
 {
 	intel_crtc_destroy_state(&crtc->base, crtc->base.state);
+	intel_histogram_finish(crtc);
 	kfree(crtc);
 }
 
@@ -381,6 +383,11 @@ int intel_crtc_init(struct drm_i915_private *dev_priv, enum pipe pipe)
 						BIT(DRM_SCALING_FILTER_DEFAULT) |
 						BIT(DRM_SCALING_FILTER_NEAREST_NEIGHBOR));
 
+	intel_histogram_init(crtc);
+	if (drm_crtc_create_histogram_property(&crtc->base,
+					       crtc->histogram->caps))
+		drm_err(&dev_priv->drm, "Failed to initialize histogram properties\n");
+
 	intel_color_crtc_init(crtc);
 	intel_drrs_crtc_init(crtc);
 	intel_crtc_crc_init(crtc);
diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/drm/i915/display/intel_display.c
index 7d68d652c1bc91acc68281c4761f688f3779bd79..c38a33ee90aef144931215254f178ba955f998b0 100644
--- a/drivers/gpu/drm/i915/display/intel_display.c
+++ b/drivers/gpu/drm/i915/display/intel_display.c
@@ -93,6 +93,7 @@
 #include "intel_fifo_underrun.h"
 #include "intel_frontbuffer.h"
 #include "intel_hdmi.h"
+#include "intel_histogram.h"
 #include "intel_hotplug.h"
 #include "intel_link_bw.h"
 #include "intel_lvds.h"
@@ -4675,6 +4676,12 @@ static int intel_crtc_atomic_check(struct intel_atomic_state *state,
 	if (ret)
 		return ret;
 
+	if (crtc_state->uapi.histogram_updated) {
+		ret = intel_histogram_atomic_check(crtc);
+		if (ret)
+			return ret;
+	}
+
 	return 0;
 }
 
@@ -7933,6 +7940,11 @@ static void intel_atomic_commit_tail(struct intel_atomic_state *state)
 		 */
 		old_crtc_state->dsb_color_vblank = fetch_and_zero(&new_crtc_state->dsb_color_vblank);
 		old_crtc_state->dsb_commit = fetch_and_zero(&new_crtc_state->dsb_commit);
+
+		if (new_crtc_state->uapi.histogram_updated)
+			intel_histogram_update(crtc,
+					       (struct drm_histogram_config *)
+					       new_crtc_state->uapi.histogram_enable->data);
 	}
 
 	/* Underruns don't always raise interrupts, so check manually */

-- 
2.25.1

