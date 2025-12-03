Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C20F3C9E467
	for <lists+dri-devel@lfdr.de>; Wed, 03 Dec 2025 09:41:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D419910E76A;
	Wed,  3 Dec 2025 08:41:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Qx00VvO2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B237B10E764;
 Wed,  3 Dec 2025 08:41:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764751283; x=1796287283;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=tMpLGMQdeQ0D30Id8H91rIYxGSMdDuQ1qEVRol4NAMM=;
 b=Qx00VvO2hUA02IT2CrlcxuD5jHna6zRcxohK77ovWs3/KnWC2cMXGUTt
 x/cpMDztaRmvLMJAhi/AORkulCjofYC0zXgnOYf2i0VNCtFJQGQhUnSdT
 RJZSZ3G8+w3qQWY1gAMOzBalR7caj9Bas/ESEFEc0KYOsiFkOO6B99p6L
 H1wu+1ggUSo6z4VCPvMEFHw5tNxF8j/jakMqAhDU6ohVLftUKuzDeN45j
 OK4an0K7IDavFDBP17JuV2XEaX4VGbup0ENa6Z1+p29CSjmmSu5Abu0dN
 sHxYRXLUPLQCucpaP9db6SbnxBsj6s+Rjxb0MS2njxKLLZF9j9gXwpY1w w==;
X-CSE-ConnectionGUID: Dv7HgRXsTEWQNrjTaJ91Qw==
X-CSE-MsgGUID: QDoBiqU3SoWTIdOr4k1OvA==
X-IronPort-AV: E=McAfee;i="6800,10657,11631"; a="66812223"
X-IronPort-AV: E=Sophos;i="6.20,245,1758610800"; d="scan'208";a="66812223"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Dec 2025 00:41:22 -0800
X-CSE-ConnectionGUID: vgn1ivZjTUadQgoL2Xiy6w==
X-CSE-MsgGUID: s5FkLWdBSVGhbBeSI+rqdQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,245,1758610800"; d="scan'208";a="217945623"
Received: from cfl-desktop.iind.intel.com ([10.190.239.20])
 by fmviesa002.fm.intel.com with ESMTP; 03 Dec 2025 00:41:19 -0800
From: Uma Shankar <uma.shankar@intel.com>
To: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Cc: chaitanya.kumar.borah@intel.com, ville.syrjala@linux.intel.com,
 pekka.paalanen@collabora.com, contact@emersion.fr, harry.wentland@amd.com,
 mwen@igalia.com, jadahl@redhat.com, sebastian.wick@redhat.com,
 swati2.sharma@intel.com, alex.hung@amd.com, jani.nikula@intel.com,
 suraj.kandpal@intel.com, Uma Shankar <uma.shankar@intel.com>
Subject: [v8 13/15] drm/i915/color: Add registers for 3D LUT
Date: Wed,  3 Dec 2025 14:22:09 +0530
Message-ID: <20251203085211.3663374-14-uma.shankar@intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20251203085211.3663374-1-uma.shankar@intel.com>
References: <20251203085211.3663374-1-uma.shankar@intel.com>
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

Add registers needed to program 3D LUT

v2:
- Follow convention documented in i915_reg.h (Jani)
- Removing space in trailer (Suraj)
- Move registers to intel_color_regs.h

BSpec: 69378, 69379, 69380
Reviewed-by: Suraj Kandpal <suraj.kandpal@intel.com>
Signed-off-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
Signed-off-by: Uma Shankar <uma.shankar@intel.com>
---
 .../gpu/drm/i915/display/intel_color_regs.h   | 29 +++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_color_regs.h b/drivers/gpu/drm/i915/display/intel_color_regs.h
index 8eb643cfead7..c370b6029369 100644
--- a/drivers/gpu/drm/i915/display/intel_color_regs.h
+++ b/drivers/gpu/drm/i915/display/intel_color_regs.h
@@ -316,4 +316,33 @@
 #define   SKL_BOTTOM_COLOR_CSC_ENABLE		REG_BIT(30)
 #define SKL_BOTTOM_COLOR(pipe)		_MMIO_PIPE(pipe, _SKL_BOTTOM_COLOR_A, _SKL_BOTTOM_COLOR_B)
 
+/* 3D LUT */
+#define _LUT_3D_CTL_A		0x490A4
+#define _LUT_3D_CTL_B		0x491A4
+#define LUT_3D_CTL(pipe)	_MMIO_PIPE(pipe, _LUT_3D_CTL_A, _LUT_3D_CTL_B)
+#define   LUT_3D_ENABLE			REG_BIT(31)
+#define   LUT_3D_READY			REG_BIT(30)
+#define   LUT_3D_BINDING_MASK		REG_GENMASK(23, 22)
+#define   LUT_3D_BIND_PIPE		REG_FIELD_PREP(LUT_3D_BINDING_MASK, 0)
+#define   LUT_3D_BIND_PLANE_1		REG_FIELD_PREP(LUT_3D_BINDING_MASK, 1)
+#define   LUT_3D_BIND_PLANE_2		REG_FIELD_PREP(LUT_3D_BINDING_MASK, 2)
+#define   LUT_3D_BIND_PLANE_3		REG_FIELD_PREP(LUT_3D_BINDING_MASK, 3)
+
+#define _LUT_3D_INDEX_A		0x490A8
+#define _LUT_3D_INDEX_B		0x491A8
+#define LUT_3D_INDEX(pipe)	_MMIO_PIPE(pipe, _LUT_3D_INDEX_A, _LUT_3D_INDEX_B)
+#define   LUT_3D_AUTO_INCREMENT		REG_BIT(13)
+#define   LUT_3D_INDEX_VALUE_MASK	REG_GENMASK(12, 0)
+#define   LUT_3D_INDEX_VALUE(x)		REG_FIELD_PREP(LUT_3D_INDEX_VALUE_MASK, (x))
+
+#define _LUT_3D_DATA_A		0x490AC
+#define _LUT_3D_DATA_B		0x491AC
+#define LUT_3D_DATA(pipe)	_MMIO_PIPE(pipe, _LUT_3D_DATA_A, _LUT_3D_DATA_B)
+#define   LUT_3D_DATA_RED_MASK		REG_GENMASK(29, 20)
+#define   LUT_3D_DATA_GREEN_MASK	REG_GENMASK(19, 10)
+#define   LUT_3D_DATA_BLUE_MASK		REG_GENMASK(9, 0)
+#define   LUT_3D_DATA_RED(x)		REG_FIELD_PREP(LUT_3D_DATA_RED_MASK, (x))
+#define   LUT_3D_DATA_GREEN(x)		REG_FIELD_PREP(LUT_3D_DATA_GREEN_MASK, (x))
+#define   LUT_3D_DATA_BLUE(x)		REG_FIELD_PREP(LUT_3D_DATA_BLUE_MASK, (x))
+
 #endif /* __INTEL_COLOR_REGS_H__ */
-- 
2.50.1

