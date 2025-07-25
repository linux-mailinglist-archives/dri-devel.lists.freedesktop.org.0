Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A1A67B117A4
	for <lists+dri-devel@lfdr.de>; Fri, 25 Jul 2025 07:04:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F056510E435;
	Fri, 25 Jul 2025 05:04:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="S28mgiJa";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F197510E434;
 Fri, 25 Jul 2025 05:04:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1753419882; x=1784955882;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=RK463MpS+YHKXnEUC9tYXsdXmVH+LqV2EqbQb22RAsA=;
 b=S28mgiJas+OCe00pYE10uC2/SABTKdJPH+Sgi06uNC54NGaVG2pz5iOl
 45tm847TI3kmF5mq106TjraQ0yRkkqQZ5lBs9qKjc1Vwc4VmUt/S/ljW8
 cPcLJhMMySWzZj1GdT+9jQkpEuukln1YlKwdEzhqxSVAHE7S5QJl25LHY
 uswqefbFSXbplkOdcfrj6ah40scJUdKZAgieRzD8t+ZDlgx0UApn9FSV4
 HAvl1krch5s1hhTnFY0C1bTvBQB8Ejo2/GqRm0CN9TUg8OKGuSRIzolEJ
 EnT3HqnnGtStbfnb2yTPP+tfgMHQmiQtWQUr2N5qRRDpajqqF1wBu3Px/ g==;
X-CSE-ConnectionGUID: pzit3xwKQcSIh/XC/+D7RA==
X-CSE-MsgGUID: GBO5noTATIWwTsXVlPsraQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11501"; a="78299540"
X-IronPort-AV: E=Sophos;i="6.16,338,1744095600"; d="scan'208";a="78299540"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jul 2025 22:04:42 -0700
X-CSE-ConnectionGUID: 8BJUAONiQI2+VY6WlmyaXw==
X-CSE-MsgGUID: e92R/xlaSOqb8uCCx38Amw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,338,1744095600"; d="scan'208";a="160956615"
Received: from kandpal-x299-ud4-pro.iind.intel.com ([10.190.239.10])
 by fmviesa009.fm.intel.com with ESMTP; 24 Jul 2025 22:04:39 -0700
From: Suraj Kandpal <suraj.kandpal@intel.com>
To: dri-devel@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org
Cc: ankit.k.nautiyal@intel.com, arun.r.murthy@intel.com, uma.shankar@intel.com,
 Suraj Kandpal <suraj.kandpal@intel.com>
Subject: [PATCH 11/28] drm/i915/writeback: Define encoder->get_hw_state
Date: Fri, 25 Jul 2025 10:33:52 +0530
Message-Id: <20250725050409.2687242-12-suraj.kandpal@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250725050409.2687242-1-suraj.kandpal@intel.com>
References: <20250725050409.2687242-1-suraj.kandpal@intel.com>
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

Define the get_hw_state function for encoder which
get's the encoder state, pipe config.

Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
---
 .../gpu/drm/i915/display/intel_writeback.c    | 48 +++++++++++++++++++
 .../drm/i915/display/intel_writeback_reg.h    |  3 ++
 2 files changed, 51 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_writeback.c b/drivers/gpu/drm/i915/display/intel_writeback.c
index ff5f15ce3f5f..91ca74de7652 100644
--- a/drivers/gpu/drm/i915/display/intel_writeback.c
+++ b/drivers/gpu/drm/i915/display/intel_writeback.c
@@ -19,6 +19,7 @@
 #include "intel_display_driver.h"
 #include "intel_connector.h"
 #include "intel_writeback.h"
+#include "intel_writeback_reg.h"
 
 struct intel_writeback_connector {
 	struct drm_writeback_connector base;
@@ -138,6 +139,52 @@ static const struct drm_writeback_connector_helper_funcs writeback_conn_helper_f
 	.get_connector_from_writeback = intel_get_connector_from_writeback,
 };
 
+static bool
+intel_writeback_get_hw_state(struct intel_encoder *encoder,
+			     enum pipe *pipe)
+{
+	struct intel_display *display = to_intel_display(encoder);
+	u8 pipe_mask = 0;
+	u32 tmp;
+
+	/* TODO need to be done for both the wd transcoder */
+	tmp = intel_de_read(display,
+			    TRANSCONF_WD(TRANSCODER_WD_0));
+	if (!(tmp & WD_TRANS_ENABLE))
+		return false;
+
+	tmp = intel_de_read(display,
+			    WD_TRANS_FUNC_CTL(TRANSCODER_WD_0));
+
+	if (!(tmp & TRANS_WD_FUNC_ENABLE))
+		return false;
+
+	switch (tmp & WD_INPUT_SELECT_MASK) {
+	case WD_INPUT_PIPE_A:
+		pipe_mask |= BIT(PIPE_A);
+		break;
+	case WD_INPUT_PIPE_B:
+		pipe_mask |= BIT(PIPE_B);
+		break;
+	case WD_INPUT_PIPE_C:
+		pipe_mask |= BIT(PIPE_C);
+		break;
+	case WD_INPUT_PIPE_D:
+		pipe_mask |= BIT(PIPE_D);
+		break;
+	default:
+		MISSING_CASE(tmp & WD_INPUT_SELECT_MASK);
+		fallthrough;
+	}
+
+	if (pipe_mask == 0)
+		return false;
+
+	*pipe = ffs(pipe_mask) - 1;
+
+	return true;
+}
+
 int intel_writeback_init(struct intel_display *display)
 {
 	struct intel_encoder *encoder;
@@ -162,6 +209,7 @@ int intel_writeback_init(struct intel_display *display)
 	encoder->type = INTEL_OUTPUT_WRITEBACK;
 	encoder->pipe_mask = ~0;
 	encoder->cloneable = 0;
+	encoder->get_hw_state = intel_writeback_get_hw_state;
 
 	connector = &writeback_conn->connector;
 	intel_writeback_connector_alloc(connector);
diff --git a/drivers/gpu/drm/i915/display/intel_writeback_reg.h b/drivers/gpu/drm/i915/display/intel_writeback_reg.h
index ffe302ef3dd9..5e7c6c99d191 100644
--- a/drivers/gpu/drm/i915/display/intel_writeback_reg.h
+++ b/drivers/gpu/drm/i915/display/intel_writeback_reg.h
@@ -19,6 +19,9 @@
 /* Gen12 WD */
 #define _MMIO_WD(tc, wd0, wd1)	_MMIO_TRANS((tc) - TRANSCODER_WD_0, wd0, wd1)
 
+#define TRANSCONF_WD(tc)	_MMIO_WD(tc,\
+				PIPE_WD0_OFFSET,\
+				PIPE_WD1_OFFSET)
 #define WD_TRANS_ENABLE		REG_BIT(31)
 #define WD_TRANS_STATE		REG_BIT(30)
 
-- 
2.34.1

