Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C0712D2B1A
	for <lists+dri-devel@lfdr.de>; Tue,  8 Dec 2020 13:34:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC5246E979;
	Tue,  8 Dec 2020 12:34:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 26E1A6E979;
 Tue,  8 Dec 2020 12:34:15 +0000 (UTC)
IronPort-SDR: Bxgb2xSU75OzYdQzDGFJIKBPpRRm8Gal7FTeoQwdyycF1fu+KTAMAPFyvDMhyqJhXV6TvZ/3Nn
 TyhrVjbY33DA==
X-IronPort-AV: E=McAfee;i="6000,8403,9828"; a="173995290"
X-IronPort-AV: E=Sophos;i="5.78,402,1599548400"; d="scan'208";a="173995290"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Dec 2020 04:34:14 -0800
IronPort-SDR: /njkwb8tRladGLLNBFofv8RgCVSZT4UiTViLtr8q3SIpYMsk0b6cnh5TS/BloBdQVTiXpw5JOu
 dIh5vSbEPSkQ==
X-IronPort-AV: E=Sophos;i="5.78,402,1599548400"; d="scan'208";a="363621356"
Received: from mjgleeso-mobl.ger.corp.intel.com (HELO localhost)
 ([10.213.246.199])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Dec 2020 04:34:12 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 2/6] drm/i915/dsc: configure hardware using specified
 rc_model_size
Date: Tue,  8 Dec 2020 14:33:51 +0200
Message-Id: <27d86ad25832bbb985f6e996f3d02dca01a66895.1607429866.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1607429866.git.jani.nikula@intel.com>
References: <cover.1607429866.git.jani.nikula@intel.com>
MIME-Version: 1.0
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
Cc: jani.nikula@intel.com, manasi.d.navare@intel.com,
 Vandita Kulkarni <vandita.kulkarni@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The rc_model_size is specified in the DSC config, and the hardware
programming should respect that instead of hard coding a value of 8192.

Regardless, the rc_model_size in DSC config is currently hard coded to
the same value, so this should have no impact, other than allowing the
use of other sizes as needed.

Cc: Manasi Navare <manasi.d.navare@intel.com>
Cc: Vandita Kulkarni <vandita.kulkarni@intel.com>
Reviewed-by: Vandita Kulkarni <vandita.kulkarni@intel.com>
Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/i915/display/intel_vdsc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/display/intel_vdsc.c b/drivers/gpu/drm/i915/display/intel_vdsc.c
index e2716a67b281..22d08679844f 100644
--- a/drivers/gpu/drm/i915/display/intel_vdsc.c
+++ b/drivers/gpu/drm/i915/display/intel_vdsc.c
@@ -741,7 +741,7 @@ static void intel_dsc_pps_configure(const struct intel_crtc_state *crtc_state)
 
 	/* Populate PICTURE_PARAMETER_SET_9 registers */
 	pps_val = 0;
-	pps_val |= DSC_RC_MODEL_SIZE(DSC_RC_MODEL_SIZE_CONST) |
+	pps_val |= DSC_RC_MODEL_SIZE(vdsc_cfg->rc_model_size) |
 		DSC_RC_EDGE_FACTOR(DSC_RC_EDGE_FACTOR_CONST);
 	drm_info(&dev_priv->drm, "PPS9 = 0x%08x\n", pps_val);
 	if (!is_pipe_dsc(crtc_state)) {
-- 
2.20.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
