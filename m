Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E88277DCA92
	for <lists+dri-devel@lfdr.de>; Tue, 31 Oct 2023 11:17:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF94C10E45D;
	Tue, 31 Oct 2023 10:17:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A7CED10E456;
 Tue, 31 Oct 2023 10:17:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1698747442; x=1730283442;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=IgEqjSwLtT6neNTEs4ma74HrNJocekFPJHcYHYu5DTg=;
 b=Hx9RGXOAyAO9TaUJYX+IvL+REv4pw5eiHNoogLHCNamEEfTh5OF/1Bxz
 pZIshGxBYTPqev1KDg0aXAjT3LOQ5B8hBK5110clPeF68qvYoEa16AI7S
 3cpOJ6ysFjdkLn8zn5s0GYoxEF6dk4Is5Q9AU6pocTrn3knVi++2ObA5X
 0YebXY5DTBarUf7Udh3BQwnmGaJcCHeHjziNo4m4WRwhn/SKZJWBPgac/
 ojErPjKOEv0BDya2o7MZEOwSVb0cGyFra/x4GLspDCGFa1LhpJXJ7PmhN
 fAO1KywfVQsfWascCFuBzWPWxcul63Mo60QNk6/oiQ6pfZOPDP2eKib1j g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10879"; a="388079215"
X-IronPort-AV: E=Sophos;i="6.03,265,1694761200"; d="scan'208";a="388079215"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Oct 2023 03:17:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10879"; a="795530865"
X-IronPort-AV: E=Sophos;i="6.03,265,1694761200"; d="scan'208";a="795530865"
Received: from moelschl-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.51.45])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Oct 2023 03:17:20 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 6/6] drm/eld: add helpers to modify the SADs of an ELD
Date: Tue, 31 Oct 2023 12:16:43 +0200
Message-Id: <8e9a05f2b1e0dd184132d636e1e778e8917ec25d.1698747331.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1698747331.git.jani.nikula@intel.com>
References: <cover.1698747331.git.jani.nikula@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Content-Type: text/plain; charset=UTF-8
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
Cc: Jani Nikula <jani.nikula@intel.com>, intel-gfx@lists.freedesktop.org,
 Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Occasionally it's necessary for drivers to modify the SADs of an ELD,
but it's not so cool to have drivers poke at the ELD buffer directly.

Using the helpers to translate between 3-byte SAD and struct cea_sad,
add ELD helpers to get/set the SADs from/to an ELD.

v2: s/i/sad_index/ (Mitul)

Cc: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>
Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 Documentation/gpu/drm-kms-helpers.rst |  3 ++
 drivers/gpu/drm/Makefile              |  1 +
 drivers/gpu/drm/drm_eld.c             | 55 +++++++++++++++++++++++++++
 include/drm/drm_eld.h                 |  5 +++
 4 files changed, 64 insertions(+)
 create mode 100644 drivers/gpu/drm/drm_eld.c

diff --git a/Documentation/gpu/drm-kms-helpers.rst b/Documentation/gpu/drm-kms-helpers.rst
index cfa8e6c399b6..59cfe8a7a8ba 100644
--- a/Documentation/gpu/drm-kms-helpers.rst
+++ b/Documentation/gpu/drm-kms-helpers.rst
@@ -366,6 +366,9 @@ EDID Helper Functions Reference
 .. kernel-doc:: include/drm/drm_eld.h
    :internal:
 
+.. kernel-doc:: drivers/gpu/drm/drm_eld.c
+   :export:
+
 SCDC Helper Functions Reference
 ===============================
 
diff --git a/drivers/gpu/drm/Makefile b/drivers/gpu/drm/Makefile
index 8e1bde059170..cdbe91ac0bfc 100644
--- a/drivers/gpu/drm/Makefile
+++ b/drivers/gpu/drm/Makefile
@@ -22,6 +22,7 @@ drm-y := \
 	drm_drv.o \
 	drm_dumb_buffers.o \
 	drm_edid.o \
+	drm_eld.o \
 	drm_encoder.o \
 	drm_file.o \
 	drm_fourcc.o \
diff --git a/drivers/gpu/drm/drm_eld.c b/drivers/gpu/drm/drm_eld.c
new file mode 100644
index 000000000000..5177991aa272
--- /dev/null
+++ b/drivers/gpu/drm/drm_eld.c
@@ -0,0 +1,55 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2023 Intel Corporation
+ */
+
+#include <drm/drm_edid.h>
+#include <drm/drm_eld.h>
+
+#include "drm_internal.h"
+
+/**
+ * drm_eld_sad_get - get SAD from ELD to struct cea_sad
+ * @eld: ELD buffer
+ * @sad_index: SAD index
+ * @cta_sad: destination struct cea_sad
+ *
+ * @return: 0 on success, or negative on errors
+ */
+int drm_eld_sad_get(const u8 *eld, int sad_index, struct cea_sad *cta_sad)
+{
+	const u8 *sad;
+
+	if (sad_index >= drm_eld_sad_count(eld))
+		return -EINVAL;
+
+	sad = eld + DRM_ELD_CEA_SAD(drm_eld_mnl(eld), sad_index);
+
+	drm_edid_cta_sad_set(cta_sad, sad);
+
+	return 0;
+}
+EXPORT_SYMBOL(drm_eld_sad_get);
+
+/**
+ * drm_eld_sad_set - set SAD to ELD from struct cea_sad
+ * @eld: ELD buffer
+ * @sad_index: SAD index
+ * @cta_sad: source struct cea_sad
+ *
+ * @return: 0 on success, or negative on errors
+ */
+int drm_eld_sad_set(u8 *eld, int sad_index, const struct cea_sad *cta_sad)
+{
+	u8 *sad;
+
+	if (sad_index >= drm_eld_sad_count(eld))
+		return -EINVAL;
+
+	sad = eld + DRM_ELD_CEA_SAD(drm_eld_mnl(eld), sad_index);
+
+	drm_edid_cta_sad_get(cta_sad, sad);
+
+	return 0;
+}
+EXPORT_SYMBOL(drm_eld_sad_set);
diff --git a/include/drm/drm_eld.h b/include/drm/drm_eld.h
index 7b674256b9aa..0a88d10b28b0 100644
--- a/include/drm/drm_eld.h
+++ b/include/drm/drm_eld.h
@@ -8,6 +8,8 @@
 
 #include <linux/types.h>
 
+struct cea_sad;
+
 /* ELD Header Block */
 #define DRM_ELD_HEADER_BLOCK_SIZE	4
 
@@ -75,6 +77,9 @@ static inline int drm_eld_mnl(const u8 *eld)
 	return (eld[DRM_ELD_CEA_EDID_VER_MNL] & DRM_ELD_MNL_MASK) >> DRM_ELD_MNL_SHIFT;
 }
 
+int drm_eld_sad_get(const u8 *eld, int sad_index, struct cea_sad *cta_sad);
+int drm_eld_sad_set(u8 *eld, int sad_index, const struct cea_sad *cta_sad);
+
 /**
  * drm_eld_sad - Get ELD SAD structures.
  * @eld: pointer to an eld memory structure with sad_count set
-- 
2.39.2

