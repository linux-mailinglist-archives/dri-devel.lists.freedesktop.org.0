Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F285C95DFE
	for <lists+dri-devel@lfdr.de>; Mon, 01 Dec 2025 07:36:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2332910E2D6;
	Mon,  1 Dec 2025 06:35:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GGlaBBKQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E421910E0FE;
 Mon,  1 Dec 2025 06:35:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764570951; x=1796106951;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=OGZF8QRIDv7gtV/OIWqN/wMyrT8dGXUgLjGWkCMtVHU=;
 b=GGlaBBKQN8zg09OLl9jdawBf1MA1O5J1THPVj3R2pu+RKpPlnShTbMG/
 yLrmfHdLotqLoWt5ZJ3CddH/sbgN4i32OoJqD7THcY4wtakpbFbTZP6yX
 3YiM+u6L9WQ2ofBFooNEwvccDUJ746rAL3tcis485cGIuFyt/9wWoDvwz
 E5pSRS7f4Mlm15BQqGew5XuPaKjFBKu4S5OwoPsbCpQkwKiD9jm175TwQ
 35f21MsoDYZZZ8242Uorax5XEioe+K6XBALGYNNzXXe8dF2Eg8hPbVUsJ
 5zYffZaK1Tz9VmPeW8HfrXWmGk4D0zkZGJMUwSWDycFuBcM9py5Fu2ssr Q==;
X-CSE-ConnectionGUID: On7+yzv8QGycVgIO7ZbTnA==
X-CSE-MsgGUID: T4tnDMelRvWq1AgGIeqh8Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11629"; a="66663181"
X-IronPort-AV: E=Sophos;i="6.20,240,1758610800"; d="scan'208";a="66663181"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Nov 2025 22:35:50 -0800
X-CSE-ConnectionGUID: RBujNW4eRUKMKXhMESikLQ==
X-CSE-MsgGUID: Aeka7MqZS2eFPhjvemSA0w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,240,1758610800"; d="scan'208";a="193806060"
Received: from cfl-desktop.iind.intel.com ([10.190.239.20])
 by orviesa009.jf.intel.com with ESMTP; 30 Nov 2025 22:35:15 -0800
From: Uma Shankar <uma.shankar@intel.com>
To: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Cc: chaitanya.kumar.borah@intel.com, ville.syrjala@linux.intel.com,
 pekka.paalanen@collabora.com, contact@emersion.fr, harry.wentland@amd.com,
 mwen@igalia.com, jadahl@redhat.com, sebastian.wick@redhat.com,
 swati2.sharma@intel.com, alex.hung@amd.com, jani.nikula@intel.com,
 suraj.kandpal@intel.com, Uma Shankar <uma.shankar@intel.com>
Subject: [v7 03/15] drm/i915/color: Add helper to create intel colorop
Date: Mon,  1 Dec 2025 12:16:43 +0530
Message-ID: <20251201064655.3579280-4-uma.shankar@intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20251201064655.3579280-1-uma.shankar@intel.com>
References: <20251201064655.3579280-1-uma.shankar@intel.com>
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

Add intel colorop create helper

v2:
 - Make function names consistent (Jani)
 - Remove redundant code related to colorop state
 - Refactor code to separate files

Reviewed-by: Suraj Kandpal <suraj.kandpal@intel.com>
Signed-off-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
Signed-off-by: Uma Shankar <uma.shankar@intel.com>
---
 drivers/gpu/drm/i915/display/intel_colorop.c | 25 ++++++++++++++++++++
 drivers/gpu/drm/i915/display/intel_colorop.h |  2 ++
 2 files changed, 27 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_colorop.c b/drivers/gpu/drm/i915/display/intel_colorop.c
index eaab50d2d126..f2fc0d8780ce 100644
--- a/drivers/gpu/drm/i915/display/intel_colorop.c
+++ b/drivers/gpu/drm/i915/display/intel_colorop.c
@@ -8,3 +8,28 @@ struct intel_colorop *to_intel_colorop(struct drm_colorop *colorop)
 {
 	return container_of(colorop, struct intel_colorop, base);
 }
+
+struct intel_colorop *intel_colorop_alloc(void)
+{
+	struct intel_colorop *colorop;
+
+	colorop = kzalloc(sizeof(*colorop), GFP_KERNEL);
+	if (!colorop)
+		return ERR_PTR(-ENOMEM);
+
+	return colorop;
+}
+
+struct intel_colorop *intel_colorop_create(enum intel_color_block id)
+{
+	struct intel_colorop *colorop;
+
+	colorop = intel_colorop_alloc();
+
+	if (IS_ERR(colorop))
+		return colorop;
+
+	colorop->id = id;
+
+	return colorop;
+}
diff --git a/drivers/gpu/drm/i915/display/intel_colorop.h b/drivers/gpu/drm/i915/display/intel_colorop.h
index 23a29a565949..21d58eb9f3d0 100644
--- a/drivers/gpu/drm/i915/display/intel_colorop.h
+++ b/drivers/gpu/drm/i915/display/intel_colorop.h
@@ -9,5 +9,7 @@
 #include "intel_display_types.h"
 
 struct intel_colorop *to_intel_colorop(struct drm_colorop *colorop);
+struct intel_colorop *intel_colorop_alloc(void);
+struct intel_colorop *intel_colorop_create(enum intel_color_block id);
 
 #endif /* __INTEL_COLOROP_H__ */
-- 
2.50.1

