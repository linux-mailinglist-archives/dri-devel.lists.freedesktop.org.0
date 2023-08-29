Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CDA2378C91C
	for <lists+dri-devel@lfdr.de>; Tue, 29 Aug 2023 18:00:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F1B0010E405;
	Tue, 29 Aug 2023 15:59:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B64EB10E3F9;
 Tue, 29 Aug 2023 15:59:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1693324756; x=1724860756;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=yCz85V0J2Ysvr38Yvcu/hreFnr217mkusD+0CH7N0I4=;
 b=dp16Ia8Jrn6DJXH3o5c3ZxF1VC4aQnzaGtLBUbrXoWSpfZLGg2WedIEA
 Ihp9qiIgdf5uPxLMh3ezyfVR5ZE/0dLXAUTvohKa+QMOr06syYVA8y4Bl
 fhhiX8+JSdpda2L9M0AjYuUVLSNCM8XQ9UsWkKu03TPze4yz1Tib7VF8I
 MqOp83RthxvNV5TNDKz5B7pX1OzkFAWMKQEh3fsMSVeq68uHz5Z/DdigC
 0rNbv3V1BY4Wod+RVVaJu+i/rd+Y4yejm0PINvPvqg49V5cyvfYJ1Qr42
 P1DmIg+IAKXRrU7VQAPuNtyxIOacNk3dAAwJQQcyCUs7WiYDIuBoer9oP A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10817"; a="441769353"
X-IronPort-AV: E=Sophos;i="6.02,210,1688454000"; d="scan'208";a="441769353"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Aug 2023 08:59:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10817"; a="688555033"
X-IronPort-AV: E=Sophos;i="6.02,210,1688454000"; d="scan'208";a="688555033"
Received: from cfl-desktop.iind.intel.com ([10.190.239.20])
 by orsmga003.jf.intel.com with ESMTP; 29 Aug 2023 08:59:14 -0700
From: Uma Shankar <uma.shankar@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [RFC 16/33] drm/i915/color: Add color pipeline for HDR planes
Date: Tue, 29 Aug 2023 21:34:05 +0530
Message-ID: <20230829160422.1251087-17-uma.shankar@intel.com>
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

Add color pipeline for HDR planes. It consists of the following
hardware blocks.

* Pre-CSC : This block can used to linearize the input frame buffer data.
 	     The linear data then can be further acted on by the following
            color hardware blocks in the display hardware pipeline

* CSC/CTM: Used to program color transformation matrix, this block is used
           to perform color space conversions like BT2020 to BT709 or BT601
           etc. This block acts on the linearized data coming from the
           Pre-CSC HW block.

* Post-CSC: This HW block can be used to non-linearize frame buffer data to
            match the sink. Another use case of it could be to perform Tone
            mapping for HDR use-cases.

Co-developed-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
Signed-off-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
Signed-off-by: Uma Shankar <uma.shankar@intel.com>
---
 drivers/gpu/drm/i915/display/intel_color.c | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_color.c b/drivers/gpu/drm/i915/display/intel_color.c
index 58b6d70043ca..8c2a858fc452 100644
--- a/drivers/gpu/drm/i915/display/intel_color.c
+++ b/drivers/gpu/drm/i915/display/intel_color.c
@@ -3941,6 +3941,24 @@ static const struct drm_color_lut_range xelpd_post_csc_hdr[] = {
 	},
 };
 
+struct drm_color_op color_pipeline_hdr[] = {
+	{
+		.name = DRM_CB_PRE_CSC,
+		.type = CURVE_1D,
+		.blob_id = 0, /* To be updated during plane initialization */
+	},
+	{
+		.name = DRM_CB_CSC,
+		.type = MATRIX,
+		.blob_id = 0,
+	},
+	{
+		.name = DRM_CB_POST_CSC,
+		.type = CURVE_1D,
+		.blob_id = 0,
+	},
+};
+
 void intel_color_crtc_init(struct intel_crtc *crtc)
 {
 	struct drm_i915_private *i915 = to_i915(crtc->base.dev);
-- 
2.38.1

