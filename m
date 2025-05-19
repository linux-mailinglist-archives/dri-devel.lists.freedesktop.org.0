Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AEB8ABBDE1
	for <lists+dri-devel@lfdr.de>; Mon, 19 May 2025 14:32:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D51710E397;
	Mon, 19 May 2025 12:32:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="niCUObko";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F341010E3B1;
 Mon, 19 May 2025 12:32:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747657930; x=1779193930;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=zJPgy4W/pnGWGhbSfbotQR2j/Zz+ElO2fIUCrGIsItQ=;
 b=niCUObko1JZvOdqseAZGnV7dVB7b2ZeKJWe2sbymgCuZHHpDWlpK1/0h
 ljbJMjl/4gJ7vJSTfcovOMvyPFjiq2Lj/1bCtcMrC9hnMpVmfbWWBU1Vb
 QNMLWrm7Sq3HqN8vmHxDzgWslp5ihCTe9ikL16qPwSx9A58DLGhm09GkR
 fcMROwHnLI5ZoEq+giLTz9p3HyqOPxfpdpntSRkOX7tUABDcZ9SEpjrxD
 h38gmImgPCHOiLZ/1YcEgdIOchXRkwszVWaTfODgKALQzk+BZ4As12bDn
 BuSsDeFCYB6zppB7gxM/wWehG9FgsQEgyB7kWnxXjwTnjxTAFMC5qDKYc A==;
X-CSE-ConnectionGUID: htwgC5CKTtiuBCEku8wwoQ==
X-CSE-MsgGUID: vKfxxDt0QsyrDGMwoCnaEQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11438"; a="49710019"
X-IronPort-AV: E=Sophos;i="6.15,300,1739865600"; d="scan'208";a="49710019"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 May 2025 05:32:10 -0700
X-CSE-ConnectionGUID: ftkyV8k3QnCGQGFAHMqBEQ==
X-CSE-MsgGUID: eRtC6DoYSaq2IcMoBKsZUQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,300,1739865600"; d="scan'208";a="144358206"
Received: from nemesa.iind.intel.com ([10.190.239.22])
 by orviesa004.jf.intel.com with ESMTP; 19 May 2025 05:32:08 -0700
From: Nemesa Garg <nemesa.garg@intel.com>
To: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Cc: Nemesa Garg <nemesa.garg@intel.com>,
 Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Subject: [PATCH 10/10] drm/i915/display: Expose sharpness strength property
Date: Mon, 19 May 2025 17:56:44 +0530
Message-Id: <20250519122644.3685679-11-nemesa.garg@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250519122644.3685679-1-nemesa.garg@intel.com>
References: <20250519122644.3685679-1-nemesa.garg@intel.com>
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

Expose the drm crtc sharpness strength property which will enable
or disable the sharpness/casf based on user input. With this user
can set/update the strength of the sharpness or casf filter.

v2: Update subject[Ankit]

Signed-off-by: Nemesa Garg <nemesa.garg@intel.com>
Reviewed-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
---
 drivers/gpu/drm/i915/display/intel_crtc.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_crtc.c b/drivers/gpu/drm/i915/display/intel_crtc.c
index 29cfc38f12e0..ee0a337c7176 100644
--- a/drivers/gpu/drm/i915/display/intel_crtc.c
+++ b/drivers/gpu/drm/i915/display/intel_crtc.c
@@ -390,6 +390,9 @@ int intel_crtc_init(struct intel_display *display, enum pipe pipe)
 
 	drm_WARN_ON(display->drm, drm_crtc_index(&crtc->base) != crtc->pipe);
 
+	if (HAS_CASF(display))
+		drm_crtc_create_sharpness_strength_property(&crtc->base);
+
 	return 0;
 
 fail:
-- 
2.25.1

