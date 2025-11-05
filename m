Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 15ABAC35991
	for <lists+dri-devel@lfdr.de>; Wed, 05 Nov 2025 13:22:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E650E10E716;
	Wed,  5 Nov 2025 12:22:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="G39s43dn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 65D6210E715;
 Wed,  5 Nov 2025 12:22:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762345352; x=1793881352;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=VPv4GOnJ0PnpFxnOwlB/msULicIGxGUQ97YRSjYrxXs=;
 b=G39s43dni3911zd3o9LD/B47iO/GNnUfISh9tfkUaiFlLmbiz4yy35/E
 sZF9ad7cCGskad5th6c3HVeLCGTPp3Bid+HyWu+RTrEbDCw2nu4RAybTk
 xexJfvy3+E12y3/TzXbld5f6W47Wq1Nsb8gh5PiymnsstUbsztkAyNzmE
 LIkpgtBGRVUsg9bQPeJmr2OfdO/QS0kAkEtuktvfOf05DFd7r4eYdXSMG
 wk0xUieexKF+HqMt1cMQxit8NM3ptJae/w0kWniU8rzJMyi1CYI7s+M/B
 EG0pjRrFJJMEz2/f5JpNbfuS/oVKp5uHsRGtcN8NcIalBXt5x9DqCv77m Q==;
X-CSE-ConnectionGUID: +VRx50bgQwmQI18QWDJCJw==
X-CSE-MsgGUID: 9pfMvjPqR2GpOsCLbaElfw==
X-IronPort-AV: E=McAfee;i="6800,10657,11603"; a="68317497"
X-IronPort-AV: E=Sophos;i="6.19,281,1754982000"; d="scan'208";a="68317497"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Nov 2025 04:22:31 -0800
X-CSE-ConnectionGUID: 64pGp3XWRgyQORV6+u0DQw==
X-CSE-MsgGUID: TOx9z1D+Q52CnBTP4tMfMA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,281,1754982000"; d="scan'208";a="187740196"
Received: from cfl-desktop.iind.intel.com ([10.190.239.20])
 by fmviesa008.fm.intel.com with ESMTP; 05 Nov 2025 04:22:27 -0800
From: Uma Shankar <uma.shankar@intel.com>
To: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Cc: chaitanya.kumar.borah@intel.com, ville.syrjala@linux.intel.com,
 pekka.paalanen@collabora.com, contact@emersion.fr, harry.wentland@amd.com,
 mwen@igalia.com, jadahl@redhat.com, sebastian.wick@redhat.com,
 shashank.sharma@amd.com, swati2.sharma@intel.com, alex.hung@amd.com,
 jani.nikula@intel.com, Uma Shankar <uma.shankar@intel.com>
Subject: [v6 02/16] drm/i915: Add identifiers for driver specific blocks
Date: Wed,  5 Nov 2025 18:03:58 +0530
Message-ID: <20251105123413.2671075-3-uma.shankar@intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20251105123413.2671075-1-uma.shankar@intel.com>
References: <20251105123413.2671075-1-uma.shankar@intel.com>
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

From: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>

Add macros to identify intel specific color blocks. It will help
in mapping drm_color_ops to intel color HW blocks

v2:- Prefix enums with INTEL_* (Jani, Suraj)
   - Remove unnecessary comments (Jani)
   - Commit message improvements (Suraj)

Signed-off-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
Signed-off-by: Uma Shankar <uma.shankar@intel.com>
---
 drivers/gpu/drm/i915/display/intel_display_limits.h | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_display_limits.h b/drivers/gpu/drm/i915/display/intel_display_limits.h
index f0fa27e365ab..55fd574ba313 100644
--- a/drivers/gpu/drm/i915/display/intel_display_limits.h
+++ b/drivers/gpu/drm/i915/display/intel_display_limits.h
@@ -138,4 +138,12 @@ enum hpd_pin {
 	HPD_NUM_PINS
 };
 
+enum intel_color_block {
+	INTEL_PLANE_CB_PRE_CSC_LUT,
+	INTEL_PLANE_CB_CSC,
+	INTEL_PLANE_CB_POST_CSC_LUT,
+
+	INTEL_CB_MAX
+};
+
 #endif /* __INTEL_DISPLAY_LIMITS_H__ */
-- 
2.50.1

