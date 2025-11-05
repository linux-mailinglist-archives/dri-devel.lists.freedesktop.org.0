Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CB01C359A1
	for <lists+dri-devel@lfdr.de>; Wed, 05 Nov 2025 13:22:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2502C10E726;
	Wed,  5 Nov 2025 12:22:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lnAGrCf+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2848110E71E;
 Wed,  5 Nov 2025 12:22:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762345356; x=1793881356;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=edIwk0LysH1iJOB+RY8XBFWMc37veqZSy4l8ZTC+NlA=;
 b=lnAGrCf+hSQmPxLHIhGGsa2c8g0QYcSKUTibV1s447Tf6iT1D06h7fOD
 476gJqSco4PzYBoto/ny0ixqUc4Fv08nZznkBj06P2p3Os0RR/sBiWY9/
 wb1md9MBoVEPoshM0TnPOlca1sgcsr3CtrKXxqA+X6I8mz4CpP8AWG2EX
 isQ0a41zNTCDb43wS94DjHvoDWgWqTfp6Cx986u0PmFbx6iSbCigrlCt8
 7jpC9R98r2caE1i9YVB3JSyeDEjQn4ppj+6wR2+AcYJd5RDVdIprxcozc
 tXoM25ICcrQLZoP8490D5XcfUN5T+dBs9hch5/K1h0qLr6WFjGmfMGUpr w==;
X-CSE-ConnectionGUID: rnmIoO9HStmL6aKdhf9+Rw==
X-CSE-MsgGUID: 1K5JDeU0RruvhUCtsiSdQw==
X-IronPort-AV: E=McAfee;i="6800,10657,11603"; a="68317505"
X-IronPort-AV: E=Sophos;i="6.19,281,1754982000"; d="scan'208";a="68317505"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Nov 2025 04:22:36 -0800
X-CSE-ConnectionGUID: MynY9kc6Sa6bcfaY1vCJAQ==
X-CSE-MsgGUID: o/Xu/EXxQ8S7BCMWfqlSIw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,281,1754982000"; d="scan'208";a="187740204"
Received: from cfl-desktop.iind.intel.com ([10.190.239.20])
 by fmviesa008.fm.intel.com with ESMTP; 05 Nov 2025 04:22:32 -0800
From: Uma Shankar <uma.shankar@intel.com>
To: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Cc: chaitanya.kumar.borah@intel.com, ville.syrjala@linux.intel.com,
 pekka.paalanen@collabora.com, contact@emersion.fr, harry.wentland@amd.com,
 mwen@igalia.com, jadahl@redhat.com, sebastian.wick@redhat.com,
 shashank.sharma@amd.com, swati2.sharma@intel.com, alex.hung@amd.com,
 jani.nikula@intel.com, Uma Shankar <uma.shankar@intel.com>
Subject: [v6 03/16] drm/i915: Add intel_color_op
Date: Wed,  5 Nov 2025 18:03:59 +0530
Message-ID: <20251105123413.2671075-4-uma.shankar@intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20251105123413.2671075-1-uma.shankar@intel.com>
References: <20251105123413.2671075-1-uma.shankar@intel.com>
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
index 84ec79b64960..b2f591e156cb 100644
--- a/drivers/gpu/drm/i915/Makefile
+++ b/drivers/gpu/drm/i915/Makefile
@@ -238,6 +238,7 @@ i915-y += \
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
index 00600134bda0..fa39f3236597 100644
--- a/drivers/gpu/drm/i915/display/intel_display_types.h
+++ b/drivers/gpu/drm/i915/display/intel_display_types.h
@@ -1986,6 +1986,11 @@ struct intel_dp_mst_encoder {
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
index 7b4ca591a4ae..c89cafbd00fa 100644
--- a/drivers/gpu/drm/xe/Makefile
+++ b/drivers/gpu/drm/xe/Makefile
@@ -240,6 +240,7 @@ xe-$(CONFIG_DRM_XE_DISPLAY) += \
 	i915-display/intel_cdclk.o \
 	i915-display/intel_cmtg.o \
 	i915-display/intel_color.o \
+	i915-display/intel_colorop.o \
 	i915-display/intel_combo_phy.o \
 	i915-display/intel_connector.o \
 	i915-display/intel_crtc.o \
-- 
2.50.1

