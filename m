Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A5AC09F870F
	for <lists+dri-devel@lfdr.de>; Thu, 19 Dec 2024 22:35:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 268A010EDD5;
	Thu, 19 Dec 2024 21:35:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cv3Cd+kq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D7A2510EDD5;
 Thu, 19 Dec 2024 21:35:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1734644105; x=1766180105;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=edKFT1y3A0fWWuc+3x4xZnEGojYsGE81BeI+V9Ai3pQ=;
 b=cv3Cd+kq9fkjqI517SnGsKStIDVDVeOIukls+NgqXDB/xhgeIj6PN20r
 xvNgI41uCiK5pTwqVjf00VkazptPZC/zyaLOruzJMCJReQtjP0eHH7EG8
 a+8DeRH3vELs8eydcmmL1HaJfxE9bnZvbb1UFnpTsBfu0KHOey8WFYhkA
 2VKWl28eGHEryjqpXXvx8hSHyUcn1HQ50dhoQVr+/KZ/paYG69u1jkYw+
 BoEhTQE645/Sa1GH2uoMNWmcT8G/WLJ7316egmp2Yu5Gric8UI5/OA9WW
 W8JOvv7Qh7bBOCnEJFK/rK3giGs8W1S1tK3VkvJ9h+ssTCWy7k9gKttsP g==;
X-CSE-ConnectionGUID: haEsyZJNT0CJvfbvWNpqLw==
X-CSE-MsgGUID: VpJ70/OMTe24wncQtzqIBQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11291"; a="35330589"
X-IronPort-AV: E=Sophos;i="6.12,248,1728975600"; d="scan'208";a="35330589"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Dec 2024 13:35:05 -0800
X-CSE-ConnectionGUID: gqKPt9KLQ9uIwfEIdJTyvg==
X-CSE-MsgGUID: kAv8U2ToRcKfzbByZ+rzqA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,248,1728975600"; d="scan'208";a="98115742"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.207])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Dec 2024 13:35:02 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org, jani.nikula@intel.com, imre.deak@intel.com
Subject: [PATCH v2 09/16] drm/i915/ddi: 128b/132b SST also needs
 DP_TP_CTL_MODE_MST
Date: Thu, 19 Dec 2024 23:33:58 +0200
Message-Id: <600a928f06d7c77b7b10672b7e09e083caa72c0c.1734643485.git.jani.nikula@intel.com>
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

It's not very clearly specified, and the hardware bit is ill-named, but
128b/132b SST also needs the MST mode set in the DP_TP_CTL register.

This is preparation for enabling 128b/132b SST. This path is not
reachable yet.

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/i915/display/intel_ddi.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_ddi.c b/drivers/gpu/drm/i915/display/intel_ddi.c
index ce34a619d48a..6f813bf85b23 100644
--- a/drivers/gpu/drm/i915/display/intel_ddi.c
+++ b/drivers/gpu/drm/i915/display/intel_ddi.c
@@ -3656,7 +3656,8 @@ static void mtl_ddi_prepare_link_retrain(struct intel_dp *intel_dp,
 
 	/* 6.d Configure and enable DP_TP_CTL with link training pattern 1 selected */
 	dp_tp_ctl = DP_TP_CTL_ENABLE | DP_TP_CTL_LINK_TRAIN_PAT1;
-	if (intel_crtc_has_type(crtc_state, INTEL_OUTPUT_DP_MST)) {
+	if (intel_crtc_has_type(crtc_state, INTEL_OUTPUT_DP_MST) ||
+	    intel_dp_is_uhbr(crtc_state)) {
 		dp_tp_ctl |= DP_TP_CTL_MODE_MST;
 	} else {
 		dp_tp_ctl |= DP_TP_CTL_MODE_SST;
@@ -3716,7 +3717,8 @@ static void intel_ddi_prepare_link_retrain(struct intel_dp *intel_dp,
 	}
 
 	dp_tp_ctl = DP_TP_CTL_ENABLE | DP_TP_CTL_LINK_TRAIN_PAT1;
-	if (intel_crtc_has_type(crtc_state, INTEL_OUTPUT_DP_MST)) {
+	if (intel_crtc_has_type(crtc_state, INTEL_OUTPUT_DP_MST) ||
+	    intel_dp_is_uhbr(crtc_state)) {
 		dp_tp_ctl |= DP_TP_CTL_MODE_MST;
 	} else {
 		dp_tp_ctl |= DP_TP_CTL_MODE_SST;
-- 
2.39.5

