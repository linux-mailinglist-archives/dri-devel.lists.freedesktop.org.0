Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 11FD8852930
	for <lists+dri-devel@lfdr.de>; Tue, 13 Feb 2024 07:41:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D3B110E8E3;
	Tue, 13 Feb 2024 06:41:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KL1P3iI+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F0EE10E8E3;
 Tue, 13 Feb 2024 06:41:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1707806515; x=1739342515;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=7ZRjvB2oE85XPE84ftqNF45rrgayLjL/rGwuNunsYyY=;
 b=KL1P3iI+hLkmtrymITc5x+jC6uebK1Lu4xYEX/aPkM6R+hHRBJUgjzns
 bNnpwRihzCZUxuf6bbJ7zGbx7mKp9Z/7Jr+/6GjwawWzaHdKj6xa0+Eyi
 St4y0t/Jo0Txcbbq9gog3zRmYKbp85fcR73l/uuHURBbs1HYBppcNvzAI
 OnzH6HuULFcv/HoaobCA+/zwi6a5a5rZ6xv2p+SLNHC1AqcLUuc0cpufE
 QQ3lI+w96+1th0XeiRr6RkqdTmOt+OL5GJ1lla4Z13DS2a0pEorH2boAD
 fsYd8Z59JrhGsC3q+BcqPgYks6+0mBt7btuJQ5qq//JyA0jsG58PIXOHl w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10982"; a="436947974"
X-IronPort-AV: E=Sophos;i="6.06,156,1705392000"; d="scan'208";a="436947974"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Feb 2024 22:41:54 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,156,1705392000"; 
   d="scan'208";a="7450401"
Received: from cfl-desktop.iind.intel.com ([10.190.239.20])
 by orviesa003.jf.intel.com with ESMTP; 12 Feb 2024 22:41:48 -0800
From: Uma Shankar <uma.shankar@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: ville.syrjala@linux.intel.com, pekka.paalanen@collabora.com,
 contact@emersion.fr, harry.wentland@amd.com, mwen@igalia.com,
 jadahl@redhat.com, sebastian.wick@redhat.com, shashank.sharma@amd.com,
 agoins@nvidia.com, joshua@froggi.es, mdaenzer@redhat.com, aleixpol@kde.org,
 xaver.hugl@gmail.com, victoria@system76.com, daniel@ffwll.ch,
 quic_naseer@quicinc.com, quic_cbraga@quicinc.com,
 quic_abhinavk@quicinc.com, arthurgrillo@riseup.net, marcan@marcan.st,
 Liviu.Dudau@arm.com, sashamcintosh@google.com, sean@poorly.run,
 Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>,
 Uma Shankar <uma.shankar@intel.com>
Subject: [PATCH 12/28] drm/i915: Add identifiers for intel color blocks
Date: Tue, 13 Feb 2024 12:18:19 +0530
Message-ID: <20240213064835.139464-13-uma.shankar@intel.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20240213064835.139464-1-uma.shankar@intel.com>
References: <20240213064835.139464-1-uma.shankar@intel.com>
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

Add macros to identify intel color blocks. It will help
in mapping drm_color_ops to intel color HW blocks

Signed-off-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
Signed-off-by: Uma Shankar <uma.shankar@intel.com>
---
 drivers/gpu/drm/i915/display/intel_display_limits.h | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_display_limits.h b/drivers/gpu/drm/i915/display/intel_display_limits.h
index 5126d0b5ae5d..67ceb79309f2 100644
--- a/drivers/gpu/drm/i915/display/intel_display_limits.h
+++ b/drivers/gpu/drm/i915/display/intel_display_limits.h
@@ -121,4 +121,17 @@ enum hpd_pin {
 	HPD_NUM_PINS
 };
 
+/*
+ * Intel Color Blocks
+ *
+ */
+
+enum intel_color_block {
+	CB_PLANE_PRE_CSC_LUT,
+	CB_PLANE_CSC,
+	CB_PLANE_POST_CSC_LUT,
+
+	I915_MAX_CB
+};
+
 #endif /* __INTEL_DISPLAY_LIMITS_H__ */
-- 
2.42.0

