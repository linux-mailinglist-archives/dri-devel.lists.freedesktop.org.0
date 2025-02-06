Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BBA1BA2A0FA
	for <lists+dri-devel@lfdr.de>; Thu,  6 Feb 2025 07:34:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D953510E436;
	Thu,  6 Feb 2025 06:34:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aQjv4STv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED58110E42E;
 Thu,  6 Feb 2025 06:33:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738823600; x=1770359600;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=VYBHGRuKwLfqGiumX9R+zylheXU0u3dXNYb64qy/bvA=;
 b=aQjv4STvzvNgoCqUP6udj9THL3trF/fnKZfFtcxUZUVlrnKCxVpbe+fJ
 quiOzAKNvNkaBTTFEIfqwhv9wzW3Ko0yJZsIB9cyeK99ZtfNF9DiyLUe8
 GEC9Y0+1oIB1vdCpcrlzwkYlV8CjQ539Q0G63LGUagZABRZo6MiqLV5nU
 9P6jEOYW1x5nvaMIwnBaQ0gJ27Hw8GpjsB7J7vmrvPppXDuNtLmJkrOTL
 c0XCTYpv2dkX7javW7QAtfNgcjQtVjoD7uLriv1OPTYzDYXeGmrx8tBps
 hGmtlzPb54NjHjyf2vBANCtf4Rgx1LkU1jjNrOTDq3XUKMY8YdplW+N7H w==;
X-CSE-ConnectionGUID: UC39UtLyQkKLUy1n8M795w==
X-CSE-MsgGUID: VCPodxC+QTWe8te5zPPFug==
X-IronPort-AV: E=McAfee;i="6700,10204,11336"; a="27014232"
X-IronPort-AV: E=Sophos;i="6.13,263,1732608000"; d="scan'208";a="27014232"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Feb 2025 22:33:19 -0800
X-CSE-ConnectionGUID: /oVrYPOFQ3WjWNCcUs8VXg==
X-CSE-MsgGUID: aCkIo15rRTuNQYPeN1ntMQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="112013716"
Received: from kandpal-x299-ud4-pro.iind.intel.com ([10.190.239.10])
 by orviesa008.jf.intel.com with ESMTP; 05 Feb 2025 22:33:18 -0800
From: Suraj Kandpal <suraj.kandpal@intel.com>
To: intel-xe@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Cc: uma.shankar@intel.com, arun.r.murthy@intel.com, ben.kao@intel.com,
 Suraj Kandpal <suraj.kandpal@intel.com>
Subject: [PATCH 5/8] drm/i915/backlight: Modify function to get VESA
 brightness in Nits
Date: Thu,  6 Feb 2025 12:02:50 +0530
Message-Id: <20250206063253.2827017-6-suraj.kandpal@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250206063253.2827017-1-suraj.kandpal@intel.com>
References: <20250206063253.2827017-1-suraj.kandpal@intel.com>
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

Modify vesa_get_brightness function to take into account
luminance_control_support and based on that read the appropriate
register and return the value.

--v2
-Changes since we now use luminance instead of nits

Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
Tested-by: Ben Kao <ben.kao@intel.com>
Reviewed-by: Arun R Murthy <arun.r.murthy@intel.com>
---
 .../drm/i915/display/intel_dp_aux_backlight.c | 20 +++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c b/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c
index 2599aa39b21d..ca5fc40fa13a 100644
--- a/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c
+++ b/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c
@@ -451,6 +451,26 @@ intel_dp_aux_hdr_setup_backlight(struct intel_connector *connector, enum pipe pi
 /* VESA backlight callbacks */
 static u32 intel_dp_aux_vesa_get_backlight(struct intel_connector *connector, enum pipe unused)
 {
+	struct intel_dp *intel_dp = enc_to_intel_dp(connector->encoder);
+	struct intel_panel *panel = &connector->panel;
+	u8 buf[3];
+	u32 val = 0;
+	int ret;
+
+	if (panel->backlight.edp.vesa.luminance_control_support) {
+		ret = drm_dp_dpcd_read(&intel_dp->aux, DP_EDP_PANEL_TARGET_LUMINANCE_VALUE, buf,
+				       sizeof(buf));
+		if (ret < 0) {
+			drm_err(intel_dp->aux.drm_dev,
+				"[CONNECTOR:%d:%s] Failed to read Luminance from DPCD\n",
+				connector->base.base.id, connector->base.name);
+			return 0;
+		}
+
+		val |= buf[0] | buf[1] << 8 | buf[2] << 16;
+		return val / 1000;
+	}
+
 	return connector->panel.backlight.level;
 }
 
-- 
2.34.1

