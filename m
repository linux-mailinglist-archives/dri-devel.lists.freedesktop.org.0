Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CB77C359E0
	for <lists+dri-devel@lfdr.de>; Wed, 05 Nov 2025 13:23:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 50DB910E752;
	Wed,  5 Nov 2025 12:23:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aLY6G6jG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 680DD10E748;
 Wed,  5 Nov 2025 12:23:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762345405; x=1793881405;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=GUZDHlNH4fAcxx1aIYuvuPKXHFF7zAGz99FO5UgePxM=;
 b=aLY6G6jGooiTsVKEwLzgByq/6Gei0NSJmwSwJob/dnA9c/y9xwUy5f39
 dTvi5BRlHUJSO/ouUhS6BgFV1NvrGe0csj2BX2E8e4jqWc6ToMkhuQoDX
 XLHXOCu+LRBGDA6IlWksGuVCIKlZUDt/EwsYjzx/Fcp0FcIKJfx09msMK
 Dnq247bTgjr7PYD4DtrVd11czCBP9ysJE6d7A3VWjoOr+kGhPqXo2iGnJ
 8vLIf2anr0G6OdklCht1119n8wMNcQGPGM0niFTKd50U42YLpBFP4JeN3
 GhwEFc+jtxRrns5I1Wu/1sm1pLr9xhbPEF1c1idA/u6IMn8+fnzHhoK0e A==;
X-CSE-ConnectionGUID: 0oPwSRceSDK2cyHPJVjapg==
X-CSE-MsgGUID: taJlitpkQQSg3AluW+yyqA==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="64384374"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="64384374"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Nov 2025 04:23:25 -0800
X-CSE-ConnectionGUID: Ws+AIfI4Tf6Q3MrT3bmtlQ==
X-CSE-MsgGUID: ZKg4BbupSiqn5JIEnGUUZw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,281,1754982000"; d="scan'208";a="187740380"
Received: from cfl-desktop.iind.intel.com ([10.190.239.20])
 by fmviesa008.fm.intel.com with ESMTP; 05 Nov 2025 04:23:21 -0800
From: Uma Shankar <uma.shankar@intel.com>
To: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Cc: chaitanya.kumar.borah@intel.com, ville.syrjala@linux.intel.com,
 pekka.paalanen@collabora.com, contact@emersion.fr, harry.wentland@amd.com,
 mwen@igalia.com, jadahl@redhat.com, sebastian.wick@redhat.com,
 shashank.sharma@amd.com, swati2.sharma@intel.com, alex.hung@amd.com,
 jani.nikula@intel.com, Uma Shankar <uma.shankar@intel.com>
Subject: [v6 14/16] drm/i915/display: Add registers for 3D LUT
Date: Wed,  5 Nov 2025 18:04:10 +0530
Message-ID: <20251105123413.2671075-15-uma.shankar@intel.com>
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

Add registers needed to program 3D LUT

BSpec: 69378, 69379, 69380

Signed-off-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
Signed-off-by: Uma Shankar <uma.shankar@intel.com>
---
 .../i915/display/skl_universal_plane_regs.h   | 26 +++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/skl_universal_plane_regs.h b/drivers/gpu/drm/i915/display/skl_universal_plane_regs.h
index 4d71d07e90ff..88b4c6c57054 100644
--- a/drivers/gpu/drm/i915/display/skl_universal_plane_regs.h
+++ b/drivers/gpu/drm/i915/display/skl_universal_plane_regs.h
@@ -520,6 +520,32 @@
 #define	  PLANE_MIN_DBUF_BLOCKS(val)		REG_FIELD_PREP(PLANE_MIN_DBUF_BLOCKS_MASK, (val))
 #define	  PLANE_INTERIM_DBUF_BLOCKS_MASK	REG_GENMASK(11, 0)
 #define	  PLANE_INTERIM_DBUF_BLOCKS(val)	REG_FIELD_PREP(PLANE_INTERIM_DBUF_BLOCKS_MASK, (val))
+/* 3D LUT */
+#define _LUT_3D_CTL_A		0x490A4
+#define _LUT_3D_CTL_B		0x491A4
+#define   LUT_3D_ENABLE			REG_BIT(31)
+#define   LUT_3D_READY			REG_BIT(30)
+#define   LUT_3D_BINDING_MASK		REG_GENMASK(23, 22)
+#define   LUT_3D_BIND_PIPE		REG_FIELD_PREP(LUT_3D_BINDING_MASK, 0)
+#define   LUT_3D_BIND_PLANE_1		REG_FIELD_PREP(LUT_3D_BINDING_MASK, 1)
+#define   LUT_3D_BIND_PLANE_2		REG_FIELD_PREP(LUT_3D_BINDING_MASK, 2)
+#define   LUT_3D_BIND_PLANE_3		REG_FIELD_PREP(LUT_3D_BINDING_MASK, 3)
+#define _LUT_3D_INDEX_A		0x490A8
+#define _LUT_3D_INDEX_B		0x491A8
+#define   LUT_3D_AUTO_INCREMENT		REG_BIT(13)
+#define   LUT_3D_INDEX_VALUE_MASK	REG_GENMASK(12, 0)
+#define   LUT_3D_INDEX_VALUE(x)		REG_FIELD_PREP(LUT_3D_INDEX_VALUE_MASK, (x))
+#define _LUT_3D_DATA_A		0x490AC
+#define _LUT_3D_DATA_B		0x491AC
+#define   LUT_3D_DATA_RED_MASK		REG_GENMASK(29, 20)
+#define   LUT_3D_DATA_GREEN_MASK	REG_GENMASK(19, 10)
+#define   LUT_3D_DATA_BLUE_MASK		REG_GENMASK(9, 0)
+#define   LUT_3D_DATA_RED(x)		REG_FIELD_PREP(LUT_3D_DATA_RED_MASK, (x))
+#define   LUT_3D_DATA_GREEN(x)		REG_FIELD_PREP(LUT_3D_DATA_GREEN_MASK, (x))
+#define   LUT_3D_DATA_BLUE(x)		REG_FIELD_PREP(LUT_3D_DATA_BLUE_MASK, (x))
+#define LUT_3D_CTL(pipe)	_MMIO_PIPE(pipe, _LUT_3D_CTL_A, _LUT_3D_CTL_B)
+#define LUT_3D_INDEX(pipe)	_MMIO_PIPE(pipe, _LUT_3D_INDEX_A, _LUT_3D_INDEX_B)
+#define LUT_3D_DATA(pipe)	_MMIO_PIPE(pipe, _LUT_3D_DATA_A, _LUT_3D_DATA_B)
 
 /* tgl+ */
 #define _SEL_FETCH_PLANE_CTL_1_A		0x70890
-- 
2.50.1

