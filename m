Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CD3AC95DE0
	for <lists+dri-devel@lfdr.de>; Mon, 01 Dec 2025 07:36:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D23B610E2C3;
	Mon,  1 Dec 2025 06:35:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RgJi/ztR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 22D9A10E1A3;
 Mon,  1 Dec 2025 06:35:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764570952; x=1796106952;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=L6fzC/ul6SpXeY2YkeV2HoBYW9W4LNZHMrW5NnnqOao=;
 b=RgJi/ztRLXylsNSH5fzHZ9RkvDl1P5hYXQO2C1BFbqOTN2mjgSqWmL5a
 gPXJ7Mr7uUfUCJkWXF3B8NWjJZpC1scFzh3Uo5hKNAE4N4uPqtBG9oao7
 zdAt4uyfKoHfri/5YL9lXr1jlmsmmLGuwlZVZLvn5Jw6Bi37Y4xI+6Mqm
 F1OQSXO54DoiNdP/TIMrkbg+ERTNWV1lXTAK+OToEtKAxisBZjXe8UAFt
 957RNpwrNWD3MHUi3TqxYL9VJiySq+K6S5t2fJqElM2TQfw5axdQDzhZB
 6firJdzkSyN6Dp2RVJe5JcmCoc0WiXvoqQsvNCTEpfPouia26f3r60cmd g==;
X-CSE-ConnectionGUID: ckM1fFQUTyq6XNIAoIw4uw==
X-CSE-MsgGUID: v2BifUD9QHSLG3cqaCHIsw==
X-IronPort-AV: E=McAfee;i="6800,10657,11629"; a="66663171"
X-IronPort-AV: E=Sophos;i="6.20,240,1758610800"; d="scan'208";a="66663171"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Nov 2025 22:35:50 -0800
X-CSE-ConnectionGUID: LgJFnaYER4alvwiCmzEzSQ==
X-CSE-MsgGUID: OlwSk4rORu+TzOq8KzT+nA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,240,1758610800"; d="scan'208";a="193806058"
Received: from cfl-desktop.iind.intel.com ([10.190.239.20])
 by orviesa009.jf.intel.com with ESMTP; 30 Nov 2025 22:35:10 -0800
From: Uma Shankar <uma.shankar@intel.com>
To: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Cc: chaitanya.kumar.borah@intel.com, ville.syrjala@linux.intel.com,
 pekka.paalanen@collabora.com, contact@emersion.fr, harry.wentland@amd.com,
 mwen@igalia.com, jadahl@redhat.com, sebastian.wick@redhat.com,
 swati2.sharma@intel.com, alex.hung@amd.com, jani.nikula@intel.com,
 suraj.kandpal@intel.com, Uma Shankar <uma.shankar@intel.com>
Subject: [v7 02/15] drm/i915: Add intel_color_op
Date: Mon,  1 Dec 2025 12:16:42 +0530
Message-ID: <20251201064655.3579280-3-uma.shankar@intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20251201064655.3579280-1-uma.shankar@intel.com>
References: <20251201064655.3579280-1-uma.shankar@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
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

Add data structure to store intel specific details of colorop

v2:
 - Remove dead code
 - Convert macro to function (Jani)
 - Remove colorop state as it is not being used
 - Refactor to separate file

Reviewed-by: Suraj Kandpal <suraj.kandpal@intel.com>
Signed-off-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
Signed-off-by: Uma Shankar <uma.shankar@intel.com>
---
 drivers/gpu/drm/i915/Makefile                      |  1 +
 drivers/gpu/drm/i915/display/intel_colorop.c       | 10 ++++++++++
 drivers/gpu/drm/i915/display/intel_colorop.h       | 13 +++++++++++++
 drivers/gpu/drm/i915/display/intel_display_types.h |  5 +++++
 drivers/gpu/drm/xe/Makefile                        |  1 +
 5 files changed, 30 insertions(+)
 create mode 100644 drivers/gpu/drm/i915/display/intel_colorop.c
 create mode 100644 drivers/gpu/drm/i915/display/intel_colorop.h

diff --git a/drivers/gpu/drm/i915/Makefile b/drivers/gpu/drm/i915/Makefile
index b2250432ae98..7c19d5345d88 100644
--- a/drivers/gpu/drm/i915/Makefile
+++ b/drivers/gpu/drm/i915/Makefile
@@ -240,6 +240,7 @@ i915-y += \
 	display/intel_cdclk.o \
 	display/intel_cmtg.o \
 	display/intel_color.o \
+	display/intel_colorop.o \
 	display/intel_combo_phy.o \
 	display/intel_connector.o \
 	display/intel_crtc.o \
diff --git a/drivers/gpu/drm/i915/display/intel_colorop.c b/drivers/gpu/drm/i915/display/intel_colorop.c
new file mode 100644
index 000000000000..eaab50d2d126
--- /dev/null
+++ b/drivers/gpu/drm/i915/display/intel_colorop.c
@@ -0,0 +1,10 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2025 Intel Corporation
+ */
+#include "intel_colorop.h"
+
+struct intel_colorop *to_intel_colorop(struct drm_colorop *colorop)
+{
+	return container_of(colorop, struct intel_colorop, base);
+}
diff --git a/drivers/gpu/drm/i915/display/intel_colorop.h b/drivers/gpu/drm/i915/display/intel_colorop.h
new file mode 100644
index 000000000000..23a29a565949
--- /dev/null
+++ b/drivers/gpu/drm/i915/display/intel_colorop.h
@@ -0,0 +1,13 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2025 Intel Corporation
+ */
+
+#ifndef __INTEL_COLOROP_H__
+#define __INTEL_COLOROP_H__
+
+#include "intel_display_types.h"
+
+struct intel_colorop *to_intel_colorop(struct drm_colorop *colorop);
+
+#endif /* __INTEL_COLOROP_H__ */
diff --git a/drivers/gpu/drm/i915/display/intel_display_types.h b/drivers/gpu/drm/i915/display/intel_display_types.h
index 38702a9e0f50..bb8b8466235a 100644
--- a/drivers/gpu/drm/i915/display/intel_display_types.h
+++ b/drivers/gpu/drm/i915/display/intel_display_types.h
@@ -1985,6 +1985,11 @@ struct intel_dp_mst_encoder {
 	struct intel_connector *connector;
 };
 
+struct intel_colorop {
+	struct drm_colorop base;
+	enum intel_color_block id;
+};
+
 static inline struct intel_encoder *
 intel_attached_encoder(struct intel_connector *connector)
 {
diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
index a7e13a676f7d..3420725c4ba8 100644
--- a/drivers/gpu/drm/xe/Makefile
+++ b/drivers/gpu/drm/xe/Makefile
@@ -234,6 +234,7 @@ xe-$(CONFIG_DRM_XE_DISPLAY) += \
 	i915-display/intel_cdclk.o \
 	i915-display/intel_cmtg.o \
 	i915-display/intel_color.o \
+	i915-display/intel_colorop.o \
 	i915-display/intel_combo_phy.o \
 	i915-display/intel_connector.o \
 	i915-display/intel_crtc.o \
-- 
2.50.1

