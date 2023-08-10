Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DEEB6777920
	for <lists+dri-devel@lfdr.de>; Thu, 10 Aug 2023 15:08:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4086310E526;
	Thu, 10 Aug 2023 13:08:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E3BB110E51E;
 Thu, 10 Aug 2023 13:08:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1691672890; x=1723208890;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=hbFL1UcGhxamsAp8kr6KdPcyCJYkopolkEfRy1RQqXA=;
 b=Rs2Lk/LLK3aD/LlRqkjDUicj9E1Okp3WopeOibEfwhNgEXqt5klfKWYq
 ChjB4xk7kmXb3Vd5Uit7XuU9vdn1UI7ywFVpk/yjn6QFM8nx4zqm/Qane
 uknPyoerAqqBcA0dC+zwGwVQdz/6HTDUyQLZqSUacSGiLaJoFSwkDDkj5
 FxVPzYdYlwaAVLQ8xkCpf1PxQw+0ox9dNBfq1wi+NflhHbeg+Haids6U8
 amAb2hFK763s1ELGj5luSsH8D2s29lF7Z28q8N2wxtapnPtlMkJqct/zL
 9OAghV9FBhbfR9MwVNj83FBa3NZ4T48I3cWRKIduKaDSMYGDzKbtF2TOM A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10797"; a="356358526"
X-IronPort-AV: E=Sophos;i="6.01,162,1684825200"; d="scan'208";a="356358526"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Aug 2023 06:06:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10797"; a="709142971"
X-IronPort-AV: E=Sophos;i="6.01,162,1684825200"; d="scan'208";a="709142971"
Received: from srr4-3-linux-103-aknautiy.iind.intel.com ([10.223.34.160])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Aug 2023 06:06:43 -0700
From: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 02/20] drm/i915/dp: Move compressed bpp check with 420 format
 inside the helper
Date: Thu, 10 Aug 2023 18:33:01 +0530
Message-Id: <20230810130319.3708392-3-ankit.k.nautiyal@intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230810130319.3708392-1-ankit.k.nautiyal@intel.com>
References: <20230810130319.3708392-1-ankit.k.nautiyal@intel.com>
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

Move the check for limiting compressed bite_per_pixel for 420,422
formats in the helper to compute bits_per_pixel.

Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Reviewed-by: Arun R Murthy <arun.r.murthy@intel.com>
---
 drivers/gpu/drm/i915/display/intel_dp.c | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
index f138dfa5a2a2..6bb8fa4a3c96 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.c
+++ b/drivers/gpu/drm/i915/display/intel_dp.c
@@ -773,6 +773,15 @@ u16 intel_dp_dsc_get_output_bpp(struct drm_i915_private *i915,
 	if (output_format == INTEL_OUTPUT_FORMAT_YCBCR420)
 		bits_per_pixel *= 2;
 
+	/*
+	 * According to DSC 1.2a Section 4.1.1 Table 4.1 the maximum
+	 * supported PPS value can be 63.9375 and with the further
+	 * mention that for 420, 422 formats, bpp should be programmed double
+	 * the target bpp restricting our target bpp to be 31.9375 at max.
+	 */
+	if (output_format == INTEL_OUTPUT_FORMAT_YCBCR420)
+		bits_per_pixel = min_t(u32, bits_per_pixel, 31);
+
 	drm_dbg_kms(&i915->drm, "Max link bpp is %u for %u timeslots "
 				"total bw %u pixel clock %u\n",
 				bits_per_pixel, timeslots,
@@ -1738,15 +1747,6 @@ int intel_dp_dsc_compute_config(struct intel_dp *intel_dp,
 							    pipe_config->output_format,
 							    pipe_bpp,
 							    timeslots);
-			/*
-			 * According to DSC 1.2a Section 4.1.1 Table 4.1 the maximum
-			 * supported PPS value can be 63.9375 and with the further
-			 * mention that bpp should be programmed double the target bpp
-			 * restricting our target bpp to be 31.9375 at max
-			 */
-			if (pipe_config->output_format == INTEL_OUTPUT_FORMAT_YCBCR420)
-				dsc_max_output_bpp = min_t(u16, dsc_max_output_bpp, 31 << 4);
-
 			if (!dsc_max_output_bpp) {
 				drm_dbg_kms(&dev_priv->drm,
 					    "Compressed BPP not supported\n");
-- 
2.40.1

