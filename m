Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BE84687FA84
	for <lists+dri-devel@lfdr.de>; Tue, 19 Mar 2024 10:13:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B971B10F8D5;
	Tue, 19 Mar 2024 09:13:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FIBOqbD5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6BA3810F8CD;
 Tue, 19 Mar 2024 09:13:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710839607; x=1742375607;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=gbhq87XouhCOURZ1E2kHeVXsudU0rQcoUrdfYU04gZg=;
 b=FIBOqbD5GIQhwfJQZKW0CmqbV/VabkpIFBf+gXyRsQOAA9m1j7Tt+OsJ
 nXOZSkak9XxlBzOtjI8/x5r2FQuB5/vMvyGbG3ypbZ+hPpH/Ary2pSWMz
 9zgzHbv2MjYcewC0VkRdHtep/7ZMSMATZ24wNm6mw1KltYIMXm8fN9NBD
 CPlrB+EL25hIX9OHBxA51eQLbIcgNl3WtutCzi0LDDDKZTAB2XdHvcHMy
 bcsTogzf0UY8uAktV2Px1YX2pmOCrlkRqqMGrbC3INN2zUcAZaAHHHPcD
 ddC9mKDTiOXHQ7p0CuuXnm6Q/OuLO68E90HiWJ9y4Y+sXyWMk6IuJhkeT Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11017"; a="16238081"
X-IronPort-AV: E=Sophos;i="6.07,136,1708416000"; d="scan'208";a="16238081"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Mar 2024 02:13:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,136,1708416000"; d="scan'208";a="36883710"
Received: from rcritchl-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.252.36.139])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Mar 2024 02:13:24 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: jani.nikula@intel.com, ville.syrjala@linux.intel.com,
 Arun R Murthy <arun.r.murthy@intel.com>
Subject: [RESEND v3 6/6] drm/i915/mst: enable MST mode for 128b/132b
 single-stream sideband
Date: Tue, 19 Mar 2024 11:12:53 +0200
Message-Id: <39d753e53cd662c3fd3776b6167bf792219fd950.1710839496.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1710839496.git.jani.nikula@intel.com>
References: <cover.1710839496.git.jani.nikula@intel.com>
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
Reviewed-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/i915/display/intel_dp.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
index 9b8bd85c1a4e..254f758e8dcd 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.c
+++ b/drivers/gpu/drm/i915/display/intel_dp.c
@@ -4061,7 +4061,8 @@ intel_dp_mst_mode_choose(struct intel_dp *intel_dp,
 	if (!intel_dp_mst_source_support(intel_dp))
 		return DRM_DP_SST;
 
-	if (sink_mst_mode == DRM_DP_SST_SIDEBAND_MSG)
+	if (sink_mst_mode == DRM_DP_SST_SIDEBAND_MSG &&
+	    !(intel_dp->dpcd[DP_MAIN_LINK_CHANNEL_CODING] & DP_CAP_ANSI_128B132B))
 		return DRM_DP_SST;
 
 	return sink_mst_mode;
-- 
2.39.2

