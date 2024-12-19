Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BBD49F86FB
	for <lists+dri-devel@lfdr.de>; Thu, 19 Dec 2024 22:34:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D627610E4B6;
	Thu, 19 Dec 2024 21:34:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="C0HC9yYk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 12C1610E4AA;
 Thu, 19 Dec 2024 21:34:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1734644067; x=1766180067;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Fmcu5wxpMRRMW/ODklvvQpJ4LBoYv+hQ9EVqoyOnG3U=;
 b=C0HC9yYky10DQoDeLr6HSI1pbUnFUNuFGsQORhjjlzKTq94OAm7j9eHk
 2Dx557IeDhY1eion09ir6mxtzZu/wNXdP9zMwNxHv7f90EhxiAvFrXzBy
 +UDdVkfvtYLRL9Ucc6Srg+8Tre1jdcB2+wZhup5Fxz5WjOHZi13BZIDqw
 PLDVf8927Bs6tH8+HrO5ZYoxIUww8lWgxr6V3GKx423Vu+2Yh0oDm6udM
 aVH/yZffD7UfkaK++8BrmKQ8VOUSwhpNv4UEHbM/iV9VfhBNTtJHrLnUH
 1Gp4Px7qNQF+zZTSH/ayw3EumHCiVDV7Y69rjRFjeO8li9n6xOSHQozn5 Q==;
X-CSE-ConnectionGUID: KWCfHOSPQaiBlfBtLFFlFg==
X-CSE-MsgGUID: iPBilllUQOO2g9i9GQH46g==
X-IronPort-AV: E=McAfee;i="6700,10204,11291"; a="34900114"
X-IronPort-AV: E=Sophos;i="6.12,248,1728975600"; d="scan'208";a="34900114"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Dec 2024 13:34:27 -0800
X-CSE-ConnectionGUID: fdGRylZwTMSmiLGpH+OW/g==
X-CSE-MsgGUID: Y8xldl1GQuKK3EBd44yFfA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="99140738"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.207])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Dec 2024 13:34:25 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org, jani.nikula@intel.com, imre.deak@intel.com
Subject: [PATCH v2 02/16] drm/i915/mst: drop connector parameter from
 intel_dp_mst_bw_overhead()
Date: Thu, 19 Dec 2024 23:33:51 +0200
Message-Id: <0b69346ba12fde422758348b64d5666be2f955bb.1734643485.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <cover.1734643485.git.jani.nikula@intel.com>
References: <cover.1734643485.git.jani.nikula@intel.com>
MIME-Version: 1.0
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

intel_dp_mst_bw_overhead() doesn't need the connector. Remove the
parameter.

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/i915/display/intel_dp_mst.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_dp_mst.c b/drivers/gpu/drm/i915/display/intel_dp_mst.c
index 163a009e51b8..50426ba5bdeb 100644
--- a/drivers/gpu/drm/i915/display/intel_dp_mst.c
+++ b/drivers/gpu/drm/i915/display/intel_dp_mst.c
@@ -139,7 +139,6 @@ static int intel_dp_mst_max_dpt_bpp(const struct intel_crtc_state *crtc_state,
 }
 
 static int intel_dp_mst_bw_overhead(const struct intel_crtc_state *crtc_state,
-				    const struct intel_connector *connector,
 				    bool ssc, int dsc_slice_count, int bpp_x16)
 {
 	const struct drm_display_mode *adjusted_mode =
@@ -278,9 +277,9 @@ static int mst_stream_find_vcpi_slots_for_bpp(struct intel_dp *intel_dp,
 		link_bpp_x16 = fxp_q4_from_int(dsc ? bpp :
 					       intel_dp_output_bpp(crtc_state->output_format, bpp));
 
-		local_bw_overhead = intel_dp_mst_bw_overhead(crtc_state, connector,
+		local_bw_overhead = intel_dp_mst_bw_overhead(crtc_state,
 							     false, dsc_slice_count, link_bpp_x16);
-		remote_bw_overhead = intel_dp_mst_bw_overhead(crtc_state, connector,
+		remote_bw_overhead = intel_dp_mst_bw_overhead(crtc_state,
 							      true, dsc_slice_count, link_bpp_x16);
 
 		intel_dp_mst_compute_m_n(crtc_state, connector,
-- 
2.39.5

