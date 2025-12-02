Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 18713C9A46E
	for <lists+dri-devel@lfdr.de>; Tue, 02 Dec 2025 07:27:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5889A10E53C;
	Tue,  2 Dec 2025 06:27:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FxHjAUjV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D581D10E533;
 Tue,  2 Dec 2025 06:27:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764656848; x=1796192848;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:references:in-reply-to:to:cc;
 bh=Vt3jJgn5ZgLlU3RI1l3DsLrM10cI+x/TGd61YIT8HJg=;
 b=FxHjAUjVgBshBtq8mTIQKocg4XjT2NQgyA14xvIF1AOJA28NFGGVxdeM
 NP0EwKYp+ZOsfGXeCG8swJp2vG+HsxrfOb31Uxly7X5eYhsFLwdsXMyok
 9txM4kgC8uwCdjechmfSrFKZQ59Arut52I0c9EWAPjHoOC+/BkkZ7G1V7
 +peek86j5q2FuggO9Meg1cPmWVJ/ys5cE6VJgz/0XF1+lyt/tnbg3RX1K
 H94Fqd9cpPRISeUIfZ9JQxqM73EhuCNqNTMevZsQXS3beM7PHtr0V6J0U
 Drb1SiHRwVsib3hIZ/Qq2F4htfMlaJGZTXA7ukeCC/Td17NOQr3aq5Q+D g==;
X-CSE-ConnectionGUID: dBi3tp5sQqeNSuWKOEETFw==
X-CSE-MsgGUID: jAvsXk+5T6Cd/AHlsChlLQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11630"; a="66499895"
X-IronPort-AV: E=Sophos;i="6.20,242,1758610800"; d="scan'208";a="66499895"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Dec 2025 22:27:28 -0800
X-CSE-ConnectionGUID: N3yCYxAFSqi1Iff5UKDU4w==
X-CSE-MsgGUID: 0Rr/DAW0SiOr4CK2aVAfhw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,242,1758610800"; d="scan'208";a="193961291"
Received: from srr4-3-linux-106-armuthy.iind.intel.com ([10.190.238.56])
 by fmviesa007.fm.intel.com with ESMTP; 01 Dec 2025 22:27:21 -0800
From: Arun R Murthy <arun.r.murthy@intel.com>
Date: Tue, 02 Dec 2025 11:57:02 +0530
Subject: [PATCH [RESEND] v9 08/20] drm/i915/histogram: Define registers for
 histogram
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20251202-dpst-v9-8-f2abb2ca2465@intel.com>
References: <20251202-dpst-v9-0-f2abb2ca2465@intel.com>
In-Reply-To: <20251202-dpst-v9-0-f2abb2ca2465@intel.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>, 
 Rodrigo Siqueira <siqueira@igalia.com>, 
 Alex Deucher <alexander.deucher@amd.com>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Jani Nikula <jani.nikula@linux.intel.com>, 
 Rodrigo Vivi <rodrigo.vivi@intel.com>, 
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, 
 Tvrtko Ursulin <tursulin@ursulin.net>, 
 Lucas De Marchi <lucas.demarchi@intel.com>, 
 =?utf-8?q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>, 
 uma.shankar@intel.com, chaitanya.kumar.borah@intel.com, 
 suraj.kandpal@intel.com
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org, 
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org, 
 Arun R Murthy <arun.r.murthy@intel.com>
X-Mailer: b4 0.15-dev
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

Add the register/bit definitions for global histogram.

v2: Intended the register contents, removed unused regs (Jani)

Bspec: 4270
Signed-off-by: Arun R Murthy <arun.r.murthy@intel.com>
Reviewed-by: Suraj Kandpal <suraj.kandpal@intel.com>
---
 .../gpu/drm/i915/display/intel_histogram_regs.h    | 46 ++++++++++++++++++++++
 1 file changed, 46 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_histogram_regs.h b/drivers/gpu/drm/i915/display/intel_histogram_regs.h
new file mode 100644
index 0000000000000000000000000000000000000000..71daf5ac2dd9ac987b256a35161b3b6977992e95
--- /dev/null
+++ b/drivers/gpu/drm/i915/display/intel_histogram_regs.h
@@ -0,0 +1,46 @@
+/* SPDX-License-Identifier: MIT */
+/* Copyright © 2025 Intel Corporation */
+
+#ifndef __INTEL_HISTOGRAM_REGS_H__
+#define __INTEL_HISTOGRAM_REGS_H__
+
+#include "intel_display_reg_defs.h"
+
+/* GLOBAL_HIST related registers */
+#define _DPST_CTL_A					0x490C0
+#define _DPST_CTL_B					0x491C0
+#define DPST_CTL(pipe)					_MMIO_PIPE(pipe, _DPST_CTL_A, _DPST_CTL_B)
+#define  DPST_CTL_IE_HIST_EN				REG_BIT(31)
+#define  DPST_CTL_RESTORE				REG_BIT(28)
+#define  DPST_CTL_IE_MODI_TABLE_EN			REG_BIT(27)
+#define  DPST_CTL_HIST_MODE				REG_BIT(24)
+#define  DPST_CTL_ENHANCEMENT_MODE_MASK			REG_GENMASK(14, 13)
+#define  DPST_CTL_EN_MULTIPLICATIVE			REG_FIELD_PREP(DPST_CTL_ENHANCEMENT_MODE_MASK, 2)
+#define  DPST_CTL_IE_TABLE_VALUE_FORMAT			REG_BIT(15)
+#define  DPST_CTL_BIN_REG_FUNC_SEL			REG_BIT(11)
+#define  DPST_CTL_BIN_REG_FUNC_TC			REG_FIELD_PREP(DPST_CTL_BIN_REG_FUNC_SEL, 0)
+#define  DPST_CTL_BIN_REG_FUNC_IE			REG_FIELD_PREP(DPST_CTL_BIN_REG_FUNC_SEL, 1)
+#define  DPST_CTL_BIN_REG_MASK				REG_GENMASK(6, 0)
+#define  DPST_CTL_BIN_REG_CLEAR				REG_FIELD_PREP(DPST_CTL_BIN_REG_MASK, 0)
+#define  DPST_CTL_IE_TABLE_VALUE_FORMAT_2INT_8FRAC	REG_FIELD_PREP(DPST_CTL_IE_TABLE_VALUE_FORMAT, 1)
+#define  DPST_CTL_IE_TABLE_VALUE_FORMAT_1INT_9FRAC	REG_FIELD_PREP(DPST_CTL_IE_TABLE_VALUE_FORMAT, 0)
+#define  DPST_CTL_HIST_MODE_YUV				REG_FIELD_PREP(DPST_CTL_HIST_MODE, 0)
+#define  DPST_CTL_HIST_MODE_HSV				REG_FIELD_PREP(DPST_CTL_HIST_MODE, 1)
+
+#define _DPST_GUARD_A					0x490C8
+#define _DPST_GUARD_B					0x491C8
+#define DPST_GUARD(pipe)				_MMIO_PIPE(pipe, _DPST_GUARD_A, _DPST_GUARD_B)
+#define  DPST_GUARD_HIST_INT_EN				REG_BIT(31)
+#define  DPST_GUARD_HIST_EVENT_STATUS			REG_BIT(30)
+#define  DPST_GUARD_INTERRUPT_DELAY_MASK			REG_GENMASK(29, 22)
+#define  DPST_GUARD_INTERRUPT_DELAY(val)			REG_FIELD_PREP(DPST_GUARD_INTERRUPT_DELAY_MASK, val)
+#define  DPST_GUARD_THRESHOLD_GB_MASK			REG_GENMASK(21, 0)
+#define  DPST_GUARD_THRESHOLD_GB(val)			REG_FIELD_PREP(DPST_GUARD_THRESHOLD_GB_MASK, val)
+
+#define _DPST_BIN_A					0x490C4
+#define _DPST_BIN_B					0x491C4
+#define DPST_BIN(pipe)					_MMIO_PIPE(pipe, _DPST_BIN_A, _DPST_BIN_B)
+#define  DPST_BIN_DATA_MASK				REG_GENMASK(23, 0)
+#define  DPST_BIN_BUSY					REG_BIT(31)
+
+#endif /* __INTEL_HISTOGRAM_REGS_H__ */

-- 
2.25.1

