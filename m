Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BEC96B1B87
	for <lists+dri-devel@lfdr.de>; Thu,  9 Mar 2023 07:30:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 01E6110E7A9;
	Thu,  9 Mar 2023 06:30:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E4AE710E7A1;
 Thu,  9 Mar 2023 06:30:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1678343402; x=1709879402;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=MCoQ5mO8mv/007JiaAnPAJTu/1Fe3GE2q5m/tq9zwpY=;
 b=XgwWmWvvozzxMgAIuSZDFQkEMl9ATesmwTtX/pm13vX8bu9awQ3jynU7
 L3Qb47obxdW43XELw5xs5FZC6cwe2LbFvHpXN52o6A76C+rg1zJJsj8T3
 Tva0bzaIXNiL1I7km8q3WAtKh0EG5TeGGZ6h4fcpXZCwisw9EtLopOM7v
 L+wlMxx7hn+8XLYGbyx7p7+fbME2NKB4AvxA9OvNud/WwMOEIZlOJ6Fb1
 fUCF9KI3jmFh69fcugn0TdyHIzOUYtHEQSaQ63Y9CmCLmZCWPmSfvwSxw
 Gq7A+H0ZQmUwmw/lw2sFcpaFQ1ixPoRT1AMGjHxuAJ/gGmpbrYu+IObwY Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10643"; a="335070031"
X-IronPort-AV: E=Sophos;i="5.98,245,1673942400"; d="scan'208";a="335070031"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Mar 2023 22:30:02 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10643"; a="1006614911"
X-IronPort-AV: E=Sophos;i="5.98,245,1673942400"; d="scan'208";a="1006614911"
Received: from kandpal-x299-ud4-pro.iind.intel.com ([10.190.239.32])
 by fmsmga005.fm.intel.com with ESMTP; 08 Mar 2023 22:30:01 -0800
From: Suraj Kandpal <suraj.kandpal@intel.com>
To: dri-devel@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org
Subject: [PATCH v3 6/7] drm/i915/vdsc: Check slice design requirement
Date: Thu,  9 Mar 2023 11:58:54 +0530
Message-Id: <20230309062855.393087-7-suraj.kandpal@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230309062855.393087-1-suraj.kandpal@intel.com>
References: <20230309062855.393087-1-suraj.kandpal@intel.com>
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
Reviewed-by: Uma Shankar <uma.shankar@intel.com>
---
 drivers/gpu/drm/i915/display/intel_vdsc.c | 32 +++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_vdsc.c b/drivers/gpu/drm/i915/display/intel_vdsc.c
index 0388efb49b92..8e787c13d26d 100644
--- a/drivers/gpu/drm/i915/display/intel_vdsc.c
+++ b/drivers/gpu/drm/i915/display/intel_vdsc.c
@@ -448,6 +448,29 @@ calculate_rc_params(struct rc_parameters *rc,
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
@@ -456,11 +479,20 @@ int intel_dsc_compute_params(struct intel_crtc_state *pipe_config)
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

