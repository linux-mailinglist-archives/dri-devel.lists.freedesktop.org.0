Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F4247662F2
	for <lists+dri-devel@lfdr.de>; Fri, 28 Jul 2023 06:16:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1161F10E65E;
	Fri, 28 Jul 2023 04:16:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (unknown [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F35D210E650;
 Fri, 28 Jul 2023 04:16:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1690517764; x=1722053764;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=te+ehsewL3xH6EqehVCCF0utnhIzzM5+nkU1PFwkztk=;
 b=d7JXMSX3CC9K3w+0togPx5DbpQWKKbFrgXl/AhWJGzO551IAse5d7gss
 5QPI+/t1LzwiW5fW17azxTRXPUPZdyoy61EqP6I3Mpa8Crl1t+j4/WYdw
 hDsFh9UAlJWuMZ6rGy1lCUnMk/M4gJk0ZpG5TvNgQYXf1nC1aMq7n7PRE
 50VzBx+NTMZiuIlYtGwyHqmdqcZf1II+YQnXq26abx8i/WEQ1pPRo0RWR
 epDrQJSq76HTUlX8xPGW/Fm9tWPHgU9Zcn8Vt5A12yZVdQbb6lFsqpq0E
 R2UMbvlAC8QuQLdjU1HTPRGkYZRt0JkvdGJ8MyzizNEGBHMBnMQuODBap w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10784"; a="348104218"
X-IronPort-AV: E=Sophos;i="6.01,236,1684825200"; d="scan'208";a="348104218"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jul 2023 21:16:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10784"; a="797276506"
X-IronPort-AV: E=Sophos;i="6.01,236,1684825200"; d="scan'208";a="797276506"
Received: from srr4-3-linux-103-aknautiy.iind.intel.com ([10.223.34.160])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jul 2023 21:16:02 -0700
From: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 19/20] drm/i915/dp: Check src/sink compressed bpp limit for edp
Date: Fri, 28 Jul 2023 09:41:49 +0530
Message-Id: <20230728041150.2524032-20-ankit.k.nautiyal@intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230728041150.2524032-1-ankit.k.nautiyal@intel.com>
References: <20230728041150.2524032-1-ankit.k.nautiyal@intel.com>
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
---
 drivers/gpu/drm/i915/display/intel_dp.c | 20 +++++++++++++++++---
 1 file changed, 17 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
index 9b71934e662e..0299b378ba6e 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.c
+++ b/drivers/gpu/drm/i915/display/intel_dp.c
@@ -2032,6 +2032,8 @@ static int intel_edp_dsc_compute_pipe_bpp(struct intel_dp *intel_dp,
 {
 	struct drm_i915_private *i915 = dp_to_i915(intel_dp);
 	int pipe_bpp, forced_bpp;
+	int dsc_src_min_bpp, dsc_sink_min_bpp, dsc_min_bpp;
+	int dsc_src_max_bpp, dsc_sink_max_bpp, dsc_max_bpp;
 
 	forced_bpp = intel_dp_force_dsc_pipe_bpp(intel_dp, conn_state, limits);
 
@@ -2049,9 +2051,21 @@ static int intel_edp_dsc_compute_pipe_bpp(struct intel_dp *intel_dp,
 	}
 	pipe_config->port_clock = limits->max_rate;
 	pipe_config->lane_count = limits->max_lane_count;
-	pipe_config->dsc.compressed_bpp =
-		min_t(u16, drm_edp_dsc_sink_output_bpp(intel_dp->dsc_dpcd) >> 4,
-		      pipe_bpp);
+
+	dsc_src_min_bpp = dsc_src_min_compressed_bpp();
+	dsc_sink_min_bpp = intel_dp_dsc_sink_min_compressed_bpp(pipe_config);
+	dsc_min_bpp = max(dsc_src_min_bpp, dsc_sink_min_bpp);
+
+	dsc_src_max_bpp = dsc_src_max_compressed_bpp(intel_dp);
+	dsc_sink_max_bpp = intel_dp_dsc_sink_max_compressed_bpp(intel_dp,
+								pipe_config,
+								pipe_bpp / 3);
+	dsc_max_bpp = dsc_sink_max_bpp ? min(dsc_sink_max_bpp, dsc_src_max_bpp) : dsc_src_max_bpp;
+
+	/* Compressed BPP should be less than the Input DSC bpp */
+	dsc_max_bpp = min(dsc_max_bpp, pipe_bpp - 1);
+
+	pipe_config->dsc.compressed_bpp = max(dsc_min_bpp, dsc_max_bpp);
 
 	pipe_config->pipe_bpp = pipe_bpp;
 
-- 
2.40.1

