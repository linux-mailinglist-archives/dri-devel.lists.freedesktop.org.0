Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F5E9852F5C
	for <lists+dri-devel@lfdr.de>; Tue, 13 Feb 2024 12:31:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7645A10E5A1;
	Tue, 13 Feb 2024 11:31:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lTWA15nV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6288710E5A1;
 Tue, 13 Feb 2024 11:31:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1707823899; x=1739359899;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=XhFbI8oMAqO9iC6QbK/uNbbiHBGr2xPLP9eao8iLkDw=;
 b=lTWA15nVJccoZy3yoQLKinA16IjhP6eCueb3n7Y8rjpANSRNGvcLvTFQ
 wgjikioEnzKTgtRgRYmy5UknfjP6Xq0Dls/GSM4HRTAfknE+00H/7QkNc
 6eu3OIzISpPvjiIgIPSBXFHCJ0wb5YwwRu9+bNJeHiQzyMEiXy6lxk15N
 dnhJp0nuLIjwfStu+2sSdOXeWkAx7MrqDEwfxCUpet2B/ZIV7MzvO/bhb
 TZfdKoO9AEmrt0MzBSaQMZlXQAYrSIvIZFuu36iuWAn5t6/pmsuy/qwYV
 4Xt7Vn3hiBVNeEDP6+IgowUQ/8sOs904ZWRwztr17fXirHgWF7Tzs9iaf w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10982"; a="1694711"
X-IronPort-AV: E=Sophos;i="6.06,157,1705392000"; 
   d="scan'208";a="1694711"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Feb 2024 03:31:39 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,157,1705392000"; 
   d="scan'208";a="7517596"
Received: from snasibli-mobl2.ccr.corp.intel.com (HELO localhost)
 ([10.252.44.50])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Feb 2024 03:31:36 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 jani.nikula@intel.com, Arun R Murthy <arun.r.murthy@intel.com>,
 =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>
Subject: [PATCH v2 6/6] drm/i915/mst: enable MST mode for 128b/132b
 single-stream sideband
Date: Tue, 13 Feb 2024 13:31:01 +0200
Message-Id: <4384082efdd1ec894b6f71a3f79c1393234e2995.1707823736.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1707823736.git.jani.nikula@intel.com>
References: <cover.1707823736.git.jani.nikula@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
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

If the sink supports 128b/132b and single-stream sideband messaging,
enable MST mode.

With this, the topology manager will still write DP_MSTM_CTRL, which
should be ignored by the sink. In the future, the topology manager
should probably only set the sideband messaging related parts of the
register.

Cc: Arun R Murthy <arun.r.murthy@intel.com>
Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/i915/display/intel_dp.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
index 7f97d5512a3e..689d5c8ba6b0 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.c
+++ b/drivers/gpu/drm/i915/display/intel_dp.c
@@ -4027,7 +4027,8 @@ intel_dp_mst_mode_choose(struct intel_dp *intel_dp,
 	if (!intel_dp_mst_source_support(intel_dp))
 		return DRM_DP_SST;
 
-	if (sink_mst_mode == DRM_DP_SST_SIDEBAND_MSG)
+	if (sink_mst_mode == DRM_DP_SST_SIDEBAND_MSG &&
+	    !(intel_dp->dpcd[DP_MAIN_LINK_CHANNEL_CODING] & DP_CAP_ANSI_128B132B))
 		return DRM_DP_SST;
 
 	return sink_mst_mode;
-- 
2.39.2

