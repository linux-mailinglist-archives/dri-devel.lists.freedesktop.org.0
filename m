Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 246C4C9E413
	for <lists+dri-devel@lfdr.de>; Wed, 03 Dec 2025 09:40:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8BEB010E742;
	Wed,  3 Dec 2025 08:40:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="E4n7knyX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8775D10E733;
 Wed,  3 Dec 2025 08:40:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764751228; x=1796287228;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=q93DcQxzKnDjwH49WBHuEIhMzQ0YcVhOkYUqj8URMUA=;
 b=E4n7knyXwAlq1n7/TsA9v2lQyTo1TiMUfuUH88w+oi1ibG9PoZr5WgcY
 wMoUmy2pCJ54ExESaRwxICOElUCbPTK8+d+JCUPInFUW4h+5t2zMLqio1
 I2WB24EbFUTO4WSh0julKSzsWpRZe4bHBmtF2XDy1O/Eym4Jl7+BrcgGf
 mdMnoL0VI0OxjJymp3PTYns3uMDJg1oR+RU8kcehGhgEkweLkRS5w5M1y
 PcSVFWtaLZeDlKDqmBDvfnznOHn+JoayVxVbNu5kecjE3xN8np4bdy41r
 m8Qsu9SSXUdHARRaw/87hCjJTOjafaWwvosMBPweHWe81RCbn316YOC9P A==;
X-CSE-ConnectionGUID: UMthPm1SQLu9MrWlbXcvpg==
X-CSE-MsgGUID: 93jUP5H+SReg8qei+nhHCg==
X-IronPort-AV: E=McAfee;i="6800,10657,11631"; a="66812105"
X-IronPort-AV: E=Sophos;i="6.20,245,1758610800"; d="scan'208";a="66812105"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Dec 2025 00:40:28 -0800
X-CSE-ConnectionGUID: 7Cooon0uTCOkaYu6bkojHA==
X-CSE-MsgGUID: uNg3Li3GRa25lLYywXlE7g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,245,1758610800"; d="scan'208";a="217945356"
Received: from cfl-desktop.iind.intel.com ([10.190.239.20])
 by fmviesa002.fm.intel.com with ESMTP; 03 Dec 2025 00:40:24 -0800
From: Uma Shankar <uma.shankar@intel.com>
To: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Cc: chaitanya.kumar.borah@intel.com, ville.syrjala@linux.intel.com,
 pekka.paalanen@collabora.com, contact@emersion.fr, harry.wentland@amd.com,
 mwen@igalia.com, jadahl@redhat.com, sebastian.wick@redhat.com,
 swati2.sharma@intel.com, alex.hung@amd.com, jani.nikula@intel.com,
 suraj.kandpal@intel.com, Uma Shankar <uma.shankar@intel.com>
Subject: [v8 02/15] drm/i915: Add intel_color_op
Date: Wed,  3 Dec 2025 14:21:58 +0530
Message-ID: <20251203085211.3663374-3-uma.shankar@intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20251203085211.3663374-1-uma.shankar@intel.com>
References: <20251203085211.3663374-1-uma.shankar@intel.com>
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
index f8f7bc956214..764053a59270 100644
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

