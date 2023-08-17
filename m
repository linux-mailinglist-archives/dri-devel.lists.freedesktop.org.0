Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 99ADD77F904
	for <lists+dri-devel@lfdr.de>; Thu, 17 Aug 2023 16:31:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5396A10E4C2;
	Thu, 17 Aug 2023 14:30:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DFB8D10E4B5;
 Thu, 17 Aug 2023 14:30:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1692282650; x=1723818650;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=yTAMEuLPMNlpCiEhaka+C/fEIUopsI4yJ8Pil6gNPso=;
 b=BLIAfRxbmeWcFxICwa21BLaJhoTy6Dq4PKVVY2bIJwg4hPh3xyit10gZ
 HNoiGUbo3Oo3uhxfow7MUZaiLOg+OyYkeQENCCfT0/6uXi9r32suADT+V
 QheKcu+xJZEtzkqQLeI8cE2UdSUK5qYuGY2OgEMt6Lpm88ETyX983DxUW
 gptIzHkkreMIA6FwGp5K1enCurOMlVcgiZZ7dG5FSdQ0HfG10to1nMeYe
 nzQcMG6P2MEuMMmzFB9L7bThcON4VTG1lc5Fjjt+jHsCNm+m/ZSCHWtCV
 F1fiBt3vg9SHCaiEQZWwIP/x46uw1mkYDCAQMV2k8fEdCrmhE6scOoH9Y A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10805"; a="376581771"
X-IronPort-AV: E=Sophos;i="6.01,180,1684825200"; d="scan'208";a="376581771"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Aug 2023 07:29:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10805"; a="858244162"
X-IronPort-AV: E=Sophos;i="6.01,180,1684825200"; d="scan'208";a="858244162"
Received: from srr4-3-linux-103-aknautiy.iind.intel.com ([10.223.34.160])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Aug 2023 07:28:58 -0700
From: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 17/18] drm/i915/dp: Check src/sink compressed bpp limit for edp
Date: Thu, 17 Aug 2023 19:54:58 +0530
Message-Id: <20230817142459.89764-18-ankit.k.nautiyal@intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230817142459.89764-1-ankit.k.nautiyal@intel.com>
References: <20230817142459.89764-1-ankit.k.nautiyal@intel.com>
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
Cc: stanislav.lisovskiy@intel.com, anusha.srivatsa@intel.com,
 navaremanasi@google.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Use checks for src and sink limits before computing compressed bpp for
eDP.

Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Reviewed-by: Stanislav Lisovskiy <stanislav.lisovskiy@intel.com>
---
 drivers/gpu/drm/i915/display/intel_dp.c | 18 +++++++++++++++---
 1 file changed, 15 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
index b295dd32e076..764663cd73ea 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.c
+++ b/drivers/gpu/drm/i915/display/intel_dp.c
@@ -2027,6 +2027,8 @@ static int intel_edp_dsc_compute_pipe_bpp(struct intel_dp *intel_dp,
 {
 	struct drm_i915_private *i915 = dp_to_i915(intel_dp);
 	int pipe_bpp, forced_bpp;
+	int dsc_src_min_bpp, dsc_sink_min_bpp, dsc_min_bpp;
+	int dsc_src_max_bpp, dsc_sink_max_bpp, dsc_max_bpp;
 
 	forced_bpp = intel_dp_force_dsc_pipe_bpp(intel_dp, conn_state, limits);
 
@@ -2044,9 +2046,19 @@ static int intel_edp_dsc_compute_pipe_bpp(struct intel_dp *intel_dp,
 	}
 	pipe_config->port_clock = limits->max_rate;
 	pipe_config->lane_count = limits->max_lane_count;
-	pipe_config->dsc.compressed_bpp =
-		min_t(u16, drm_edp_dsc_sink_output_bpp(intel_dp->dsc_dpcd) >> 4,
-		      pipe_bpp);
+
+	dsc_src_min_bpp = dsc_src_min_compressed_bpp();
+	dsc_sink_min_bpp = dsc_sink_min_compressed_bpp(pipe_config);
+	dsc_min_bpp = max(dsc_src_min_bpp, dsc_sink_min_bpp);
+
+	dsc_src_max_bpp = dsc_src_max_compressed_bpp(intel_dp);
+	dsc_sink_max_bpp = dsc_sink_max_compressed_bpp(intel_dp, pipe_config, pipe_bpp / 3);
+	dsc_max_bpp = dsc_sink_max_bpp ? min(dsc_sink_max_bpp, dsc_src_max_bpp) : dsc_src_max_bpp;
+
+	/* Compressed BPP should be less than the Input DSC bpp */
+	dsc_max_bpp = min(dsc_max_bpp, pipe_bpp - 1);
+
+	pipe_config->dsc.compressed_bpp = max(dsc_min_bpp, dsc_max_bpp);
 
 	pipe_config->pipe_bpp = pipe_bpp;
 
-- 
2.40.1

