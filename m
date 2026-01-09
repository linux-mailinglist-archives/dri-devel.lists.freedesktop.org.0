Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 94AEBD07E6E
	for <lists+dri-devel@lfdr.de>; Fri, 09 Jan 2026 09:43:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D887410E82F;
	Fri,  9 Jan 2026 08:43:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ah6tvTGI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8465D10E839;
 Fri,  9 Jan 2026 08:43:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1767948200; x=1799484200;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Wdam5rCRQFbQtbuvwVBWVDIbKawuUVsasm6dA1inJeA=;
 b=ah6tvTGIiH3lMt+ba3zvTnfdl3KcM0xpFobF0arwuomHbnend7DvcGSf
 ektwqWtvabDAFwzqHid+/AULxPoRNddzDCMio603n+h3TmfJcsFLHisww
 xKWwcDJdO6/co5lEynQDFlA402Kbu6NeIikjrcGL0Sb2gvrsCjLJB2lwF
 f/iEEHwNzaKdr6Ci/kw5btpDK0YhEuPera9yxNYTCLjrfQBqiAQmWHPMx
 /t4Bf9xxBxFBZIuiMTp9Oy1fEgU4hsjaQuxnrSP3qjxUf+8+tYueDUv4f
 Dspp5xgNpb/Xj3h47EjN8mstWbrdUWWFR+wsuR6ew7Wc5LRCeZGF1JbpA A==;
X-CSE-ConnectionGUID: y9BKF5IlS9mMeLLSB87mMA==
X-CSE-MsgGUID: Cd/uvE2LSkm95tJ7IoHB1Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11665"; a="69241418"
X-IronPort-AV: E=Sophos;i="6.21,212,1763452800"; d="scan'208";a="69241418"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jan 2026 00:43:20 -0800
X-CSE-ConnectionGUID: HRXvPlijQ+61wQQvDakQgA==
X-CSE-MsgGUID: h556+MSlQpKEkjwHOveOtQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,212,1763452800"; d="scan'208";a="240924544"
Received: from dut-2a59.iind.intel.com ([10.190.239.113])
 by orviesa001.jf.intel.com with ESMTP; 09 Jan 2026 00:43:17 -0800
From: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
To: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, amd-gfx@lists.freedesktop.org
Cc: harry.wentland@amd.com, jani.nikula@linux.intel.com,
 louis.chauvet@bootlin.com, mwen@igalia.com, contact@emersion.fr,
 alex.hung@amd.com, daniels@collabora.com, uma.shankar@intel.com,
 suraj.kandpal@intel.com, nfraprado@collabora.com,
 ville.syrjala@linux.intel.com, matthew.d.roper@intel.com
Subject: [PATCH v2 05/13] drm/colorop: Add destroy helper for colorop objects
Date: Fri,  9 Jan 2026 13:47:20 +0530
Message-Id: <20260109081728.478844-6-chaitanya.kumar.borah@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260109081728.478844-1-chaitanya.kumar.borah@intel.com>
References: <20260109081728.478844-1-chaitanya.kumar.borah@intel.com>
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

Add a helper that performs common cleanup and frees the
associated object. This can be used by drivers if they do not
require any driver-specific teardown.

Signed-off-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
Reviewed-by: Suraj Kandpal <suraj.kandpal@intel.com>
Reviewed-by: Uma Shankar <uma.shankar@intel.com>
Reviewed-by: Alex Hung <alex.hung@amd.com>
---
 drivers/gpu/drm/drm_colorop.c | 12 ++++++++++++
 include/drm/drm_colorop.h     | 10 ++++++++++
 2 files changed, 22 insertions(+)

diff --git a/drivers/gpu/drm/drm_colorop.c b/drivers/gpu/drm/drm_colorop.c
index 44eb823585d2..ba19a3ab23cb 100644
--- a/drivers/gpu/drm/drm_colorop.c
+++ b/drivers/gpu/drm/drm_colorop.c
@@ -178,6 +178,18 @@ void drm_colorop_cleanup(struct drm_colorop *colorop)
 }
 EXPORT_SYMBOL(drm_colorop_cleanup);
 
+/**
+ * drm_colorop_destroy() - Helper for colorop destruction
+ *
+ * @colorop: colorop to destroy
+ */
+void drm_colorop_destroy(struct drm_colorop *colorop)
+{
+	drm_colorop_cleanup(colorop);
+	kfree(colorop);
+}
+EXPORT_SYMBOL(drm_colorop_destroy);
+
 /**
  * drm_colorop_pipeline_destroy - Helper for color pipeline destruction
  *
diff --git a/include/drm/drm_colorop.h b/include/drm/drm_colorop.h
index a3a32f9f918c..0f5ba72c1704 100644
--- a/include/drm/drm_colorop.h
+++ b/include/drm/drm_colorop.h
@@ -420,6 +420,16 @@ void drm_colorop_atomic_destroy_state(struct drm_colorop *colorop,
  */
 void drm_colorop_reset(struct drm_colorop *colorop);
 
+/**
+ * drm_colorop_destroy - destroy colorop
+ * @colorop: drm colorop
+ *
+ * Destroys @colorop by performing common DRM cleanup and freeing the
+ * colorop object. This can be used by drivers if they do not
+ * require any driver-specific teardown.
+ */
+void drm_colorop_destroy(struct drm_colorop *colorop);
+
 /**
  * drm_colorop_index - find the index of a registered colorop
  * @colorop: colorop to find index for
-- 
2.25.1

