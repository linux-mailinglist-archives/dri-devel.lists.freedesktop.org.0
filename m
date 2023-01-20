Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AA72A674B0B
	for <lists+dri-devel@lfdr.de>; Fri, 20 Jan 2023 05:42:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B4FA10EA3D;
	Fri, 20 Jan 2023 04:42:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8BC8310EA2F;
 Fri, 20 Jan 2023 04:42:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1674189748; x=1705725748;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=/xhq6Kx6i5/ffy7/EUZ6R6ljspo03tL/Esl3WvwFHdY=;
 b=mOeOX80wmwQI12K2bmWT6UNjyweU7f/lXN7VUm+EYaDRXQwomRBqFTZy
 v6sbXJkh1mUJS15p4fMKEwl3884GD/tFfWjQsxyhF+RUrVGWfEEgDiIX0
 xd6LPUbNuL59AbNkBLxCzxTdOsfE3YQbjQsXkvXIFi5YpG6wKGRlnl5YM
 7C5EiyPEyPtXWPCq8ydkKSfTa5XwUg1EnufSYUS0pSs1viKxc5cEnnmhJ
 LTPUBcRzxlRFBW2TA/yJmBAyvryDYYTvReCaeVMFoXZOvfcPfti3YSt60
 6B50W+L97Os+Z20iR2uzFSv+6OV4o54Z0HQAdnueT9kHRuAmQHMNCNVMB A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10595"; a="323195595"
X-IronPort-AV: E=Sophos;i="5.97,231,1669104000"; d="scan'208";a="323195595"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jan 2023 20:42:28 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10595"; a="692735060"
X-IronPort-AV: E=Sophos;i="5.97,231,1669104000"; d="scan'208";a="692735060"
Received: from srr4-3-linux-103-aknautiy.iind.intel.com ([10.223.34.160])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jan 2023 20:42:25 -0800
From: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
To: dri-devel@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org
Subject: [PATCH 13/16] drm/i915/dsc/mtl: Add support for fractional bpp
Date: Fri, 20 Jan 2023 10:08:41 +0530
Message-Id: <20230120043844.3761895-14-ankit.k.nautiyal@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230120043844.3761895-1-ankit.k.nautiyal@intel.com>
References: <20230120043844.3761895-1-ankit.k.nautiyal@intel.com>
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
Cc: manasi.d.navare@intel.com, vandita.kulkarni@intel.com,
 anusha.srivatsa@intel.com, swati2.sharma@intel.com,
 stanislav.lisovskiy@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Vandita Kulkarni <vandita.kulkarni@intel.com>

Consider the fractional bpp while reading the qp values.

Signed-off-by: Vandita Kulkarni <vandita.kulkarni@intel.com>
Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
---
 drivers/gpu/drm/i915/display/intel_qp_tables.c |  3 ---
 drivers/gpu/drm/i915/display/intel_vdsc.c      | 12 +++++++++---
 2 files changed, 9 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_qp_tables.c b/drivers/gpu/drm/i915/display/intel_qp_tables.c
index 6f8e4ec5c0fb..a0094287dc81 100644
--- a/drivers/gpu/drm/i915/display/intel_qp_tables.c
+++ b/drivers/gpu/drm/i915/display/intel_qp_tables.c
@@ -21,9 +21,6 @@
  * These qp tables are as per the C model
  * and it has the rows pointing to bpps which increment
  * in steps of 0.5
- * We do not support fractional bpps as of today,
- * hence we would skip the fractional bpps during
- * our references for qp calclulations.
  */
 static const u8 rc_range_minqp444_8bpc[DSC_NUM_BUF_RANGES][RC_RANGE_QP444_8BPC_MAX_NUM_BPP] = {
 	{ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
diff --git a/drivers/gpu/drm/i915/display/intel_vdsc.c b/drivers/gpu/drm/i915/display/intel_vdsc.c
index ed5c85229414..3e39f682b19f 100644
--- a/drivers/gpu/drm/i915/display/intel_vdsc.c
+++ b/drivers/gpu/drm/i915/display/intel_vdsc.c
@@ -378,6 +378,7 @@ calculate_rc_params(struct rc_parameters *rc,
 {
 	int bpc = vdsc_cfg->bits_per_component;
 	int bpp = vdsc_cfg->bits_per_pixel >> 4;
+	int fractional_bits = vdsc_cfg->bits_per_pixel & 0xf;
 	static const s8 ofs_und6[] = {
 		0, -2, -2, -4, -6, -6, -8, -8, -8, -10, -10, -12, -12, -12, -12
 	};
@@ -418,7 +419,13 @@ calculate_rc_params(struct rc_parameters *rc,
 	rc->rc_quant_incr_limit0 = 11 + qp_bpc_modifier;
 	rc->rc_quant_incr_limit1 = 11 + qp_bpc_modifier;
 
-	bpp_i  = (2 * (bpp - 6));
+	/*
+	 * QP table rows have values in increment of 0.5.
+	 * So 6.0 bpp to 6.4375 will have index 0, 6.5 to 6.9375 will have index 1,
+	 * and so on.
+	 * 0.5 represented as 0x8 in U6.4 format.
+	 */
+	bpp_i  = ((bpp - 6) + (fractional_bits < 0x8 ? 0 : 1));
 	for (buf_i = 0; buf_i < DSC_NUM_BUF_RANGES; buf_i++) {
 		/* Read range_minqp and range_max_qp from qp tables */
 		rc->rc_range_params[buf_i].range_min_qp =
@@ -466,8 +473,7 @@ int intel_dsc_compute_params(struct intel_crtc_state *pipe_config)
 	/* Gen 11 does not support VBR */
 	vdsc_cfg->vbr_enable = false;
 
-	/* Gen 11 only supports integral values of bpp */
-	vdsc_cfg->bits_per_pixel = compressed_bpp << 4;
+	vdsc_cfg->bits_per_pixel = pipe_config->dsc.compressed_bpp;
 	vdsc_cfg->bits_per_component = pipe_config->pipe_bpp / 3;
 
 	for (i = 0; i < DSC_NUM_BUF_RANGES - 1; i++) {
-- 
2.25.1

