Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AFCB469EE5A
	for <lists+dri-devel@lfdr.de>; Wed, 22 Feb 2023 06:33:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A60BC10E3E6;
	Wed, 22 Feb 2023 05:33:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A2BB110E3EF;
 Wed, 22 Feb 2023 05:33:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1677043995; x=1708579995;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=UJQ9F2c39vABugsmX57dfdaI3qMhK0pnial1QsgIH18=;
 b=jCigyxn6zpBhCCKlqOnhnDWUf16GUeBlz6MaZQej37eoOv5VuLD+p1w+
 6DLRIgwYhYw645ql3rPQdycDEbAma4KNWRCblSuNLGGEBJ5SSjgTnlrin
 AYln0aDVBJjwfX+tU60KMzVuf8TSXK93/hvylt6XhEGMa7PetBEbw4Yrz
 XUibwUHD4ZeSxovKNqaBUYygv4TU2KtSJb+iaHcYBAE4P0SK2Vp0hMVWg
 X5axyeYUDS0kp/BuiCqlnQ67+0UljBxkIK97yOKAIBrj81NwfWa+BP+yh
 akfraGk9KOZwazWfPEAnOoqyUArOBPcMva7gwVoIeiMdNI4PhL37lUT6e w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10628"; a="332843235"
X-IronPort-AV: E=Sophos;i="5.97,317,1669104000"; d="scan'208";a="332843235"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Feb 2023 21:33:15 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10628"; a="917450574"
X-IronPort-AV: E=Sophos;i="5.97,317,1669104000"; d="scan'208";a="917450574"
Received: from kandpal-x299-ud4-pro.iind.intel.com ([10.190.239.32])
 by fmsmga006.fm.intel.com with ESMTP; 21 Feb 2023 21:33:13 -0800
From: Suraj Kandpal <suraj.kandpal@intel.com>
To: dri-devel@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org
Subject: [PATCH 6/7] drm/i915/vdsc: Check slice design requirement
Date: Wed, 22 Feb 2023 11:01:52 +0530
Message-Id: <20230222053153.3658345-7-suraj.kandpal@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230222053153.3658345-1-suraj.kandpal@intel.com>
References: <20230222053153.3658345-1-suraj.kandpal@intel.com>
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
Cc: ankit.k.nautiyal@intel.com, uma.shankar@intel.com,
 Suraj Kandpal <suraj.kandpal@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add function to check if slice design requirements are being
met as defined in Bspec: 49259 in the section
Slice Design Requirement

--v7
-remove full bspec link [Jani]
-rename intel_dsc_check_slice_design_req to
intel_dsc_slice_dimensions_valid [Jani]

--v8
-fix condition to check if slice width and height are
of two
-fix minimum pixel in slice condition

--v10
-condition should be < rather then >= [Uma]

Cc: Uma Shankar <uma.shankar@intel.com>
Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
---
 drivers/gpu/drm/i915/display/intel_vdsc.c | 32 +++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_vdsc.c b/drivers/gpu/drm/i915/display/intel_vdsc.c
index 32997c9773aa..a9585f493318 100644
--- a/drivers/gpu/drm/i915/display/intel_vdsc.c
+++ b/drivers/gpu/drm/i915/display/intel_vdsc.c
@@ -447,6 +447,29 @@ calculate_rc_params(struct rc_parameters *rc,
 	}
 }
 
+static int intel_dsc_slice_dimensions_valid(struct intel_crtc_state *pipe_config,
+					    struct drm_dsc_config *vdsc_cfg)
+{
+	if (pipe_config->output_format == INTEL_OUTPUT_FORMAT_RGB ||
+	    pipe_config->output_format == INTEL_OUTPUT_FORMAT_YCBCR444) {
+		if (vdsc_cfg->slice_height > 4095)
+			return -EINVAL;
+		if (vdsc_cfg->slice_height * vdsc_cfg->slice_width < 15000)
+			return -EINVAL;
+	} else if (pipe_config->output_format == INTEL_OUTPUT_FORMAT_YCBCR420) {
+		if (vdsc_cfg->slice_width % 2)
+			return -EINVAL;
+		if (vdsc_cfg->slice_height % 2)
+			return -EINVAL;
+		if (vdsc_cfg->slice_height > 4094)
+			return -EINVAL;
+		if (vdsc_cfg->slice_height * vdsc_cfg->slice_width < 30000)
+			return -EINVAL;
+	}
+
+	return 0;
+}
+
 int intel_dsc_compute_params(struct intel_crtc_state *pipe_config)
 {
 	struct intel_crtc *crtc = to_intel_crtc(pipe_config->uapi.crtc);
@@ -455,11 +478,20 @@ int intel_dsc_compute_params(struct intel_crtc_state *pipe_config)
 	u16 compressed_bpp = pipe_config->dsc.compressed_bpp;
 	const struct rc_parameters *rc_params;
 	struct rc_parameters *rc = NULL;
+	int err;
 	u8 i = 0;
 
 	vdsc_cfg->pic_width = pipe_config->hw.adjusted_mode.crtc_hdisplay;
 	vdsc_cfg->slice_width = DIV_ROUND_UP(vdsc_cfg->pic_width,
 					     pipe_config->dsc.slice_count);
+
+	err = intel_dsc_slice_dimensions_valid(pipe_config, vdsc_cfg);
+
+	if (err) {
+		drm_dbg_kms(&dev_priv->drm, "Slice dimension requirements not met\n");
+		return err;
+	}
+
 	/*
 	 * According to DSC 1.2 specs if colorspace is YCbCr then convert_rgb is 0
 	 * else 1
-- 
2.25.1

