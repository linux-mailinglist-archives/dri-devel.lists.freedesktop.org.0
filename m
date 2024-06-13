Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E0680906358
	for <lists+dri-devel@lfdr.de>; Thu, 13 Jun 2024 07:14:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E3D4610E102;
	Thu, 13 Jun 2024 05:14:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ha+RRgfv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 80A4510E0E3;
 Thu, 13 Jun 2024 05:14:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718255674; x=1749791674;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=OZBtXAMCtAdeOMqNCZ4pBFqxx7eEzPwFu88Hq+F5bS8=;
 b=ha+RRgfv++/B8bwdpmL3MshU81StM+qzw2Kyb8bNpveES102x3gX5qCP
 jldRCDTsb+X5nx73N1HgkP+JSx8POxitWB71pbhsaoyaIaKO/jHLmCXmu
 SZv/+Oj4eE+glk4CFxGv5xyN9acaKZgLDe8H/jh9jY/6Xg9fWBA8xNoi9
 mo17CCT9f8WbwLXikLZ4IQCSbsVZnMSrB7TrlxPA5Y6Gb6D5Pe+uUFC1l
 Cs3kOiSUUjOSJd6KjH6aDk702tmTQ1Kj1zJYMQAjtytkqom2Kb4CfTrB/
 Sa5a3etAjlZeCZLoBDDJHeQFJ0/jZEj+wp7bNcqBTnX8FLl3GYDwOZLoJ g==;
X-CSE-ConnectionGUID: 3wJSfBN2Sde+kowNStX5aw==
X-CSE-MsgGUID: v1yev2bCR1qYcN5E6prl4A==
X-IronPort-AV: E=McAfee;i="6700,10204,11101"; a="14774881"
X-IronPort-AV: E=Sophos;i="6.08,234,1712646000"; d="scan'208";a="14774881"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jun 2024 22:13:13 -0700
X-CSE-ConnectionGUID: KbF81kRJQiKCeY9AeezASQ==
X-CSE-MsgGUID: 1SkBb4NiSCyrmOzWTTUmAg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,234,1712646000"; d="scan'208";a="40126111"
Received: from mgolanimitul-x299-ud4-pro.iind.intel.com ([10.190.239.114])
 by orviesa009.jf.intel.com with ESMTP; 12 Jun 2024 22:13:11 -0700
From: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>
To: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org
Cc: mitulkumar.ajitkumar.golani@intel.com, ankit.k.nautiyal@intel.com,
 suraj.kandpal@intel.com, jani.nikula@linux.intel.com, sfr@canb.auug.org.au
Subject: [PATCH 2/2] drm/i915/display: Update calculation to avoid overflow
Date: Thu, 13 Jun 2024 10:43:17 +0530
Message-ID: <20240613051317.345753-3-mitulkumar.ajitkumar.golani@intel.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240613051317.345753-1-mitulkumar.ajitkumar.golani@intel.com>
References: <20240613051317.345753-1-mitulkumar.ajitkumar.golani@intel.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Update calculation to avoid overflow.

Fixes: 1676ecd303ac ("drm/i915: Compute CMRR and calculate vtotal")
Cc: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>
Cc: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Cc: Suraj Kandpal <suraj.kandpal@intel.com>
Cc: Jani Nikula <jani.nikula@linux.intel.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>

Signed-off-by: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>
Reviewed-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
---
 drivers/gpu/drm/i915/display/intel_vrr.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_vrr.c b/drivers/gpu/drm/i915/display/intel_vrr.c
index eb5b62b54d32..6430da25957d 100644
--- a/drivers/gpu/drm/i915/display/intel_vrr.c
+++ b/drivers/gpu/drm/i915/display/intel_vrr.c
@@ -147,10 +147,11 @@ cmrr_get_vtotal(struct intel_crtc_state *crtc_state, bool video_mode_required)
 		multiplier_n = 1000;
 	}
 
-	crtc_state->cmrr.cmrr_n =
-		desired_refresh_rate * adjusted_mode->crtc_htotal * multiplier_n;
-	vtotal = (adjusted_mode->crtc_clock * 1000 * multiplier_n) / crtc_state->cmrr.cmrr_n;
-	adjusted_pixel_rate = adjusted_mode->crtc_clock * 1000 * multiplier_m;
+	crtc_state->cmrr.cmrr_n = mul_u32_u32(desired_refresh_rate * adjusted_mode->crtc_htotal,
+					      multiplier_n);
+	vtotal = DIV_ROUND_UP_ULL(mul_u32_u32(adjusted_mode->crtc_clock * 1000, multiplier_n),
+				  crtc_state->cmrr.cmrr_n);
+	adjusted_pixel_rate = mul_u32_u32(adjusted_mode->crtc_clock * 1000, multiplier_m);
 	crtc_state->cmrr.cmrr_m = do_div(adjusted_pixel_rate, crtc_state->cmrr.cmrr_n);
 
 	return vtotal;
-- 
2.45.2

