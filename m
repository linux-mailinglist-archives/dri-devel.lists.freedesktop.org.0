Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ECC1EA4601E
	for <lists+dri-devel@lfdr.de>; Wed, 26 Feb 2025 14:03:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6098010E904;
	Wed, 26 Feb 2025 13:03:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WD4V6KQ3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F35E10E904;
 Wed, 26 Feb 2025 13:03:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740575038; x=1772111038;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=8jiS+kPdQZP7EWPxn7Of1UXgpTQ62xuev1qCkeye9+0=;
 b=WD4V6KQ3kyWGM6cnCyLpCh7sjJY4oHtn/27WBchHJxPSKRi8ffPjdELj
 C0C+24eC5HI82UjPY/ZV0IT/n8vr5h2x+OKemaacv0Ig7PDVb/trGfGJm
 6Md/y9pONLsjEd/trGCLmkk+TbUjjHXZiIZS64zApraqAcKlUW21ix8kb
 Sz4SeR15MCCYKwyLKbd87HtjNO2HZ4CGPgc+ZlYrPDhHCdY93RfS4ddCm
 Aqnp67R/RDt7JTF/4cqFt7I1DsoVw3rbYVSuYIWKOsmBI+IIUT+3+9vVd
 5HQCAKzY2s6tI9BYM75KrDt47X6UsuGB7eSKN7ZZK6U5ID2IjYQ14bX2V A==;
X-CSE-ConnectionGUID: QFF9GQT9TYSufjmaG049sQ==
X-CSE-MsgGUID: Z5hEnce9S2OfpyjSrTe4iQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11357"; a="41341677"
X-IronPort-AV: E=Sophos;i="6.13,317,1732608000"; d="scan'208";a="41341677"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Feb 2025 05:03:58 -0800
X-CSE-ConnectionGUID: kh+122C9SgecQqqNpusQEg==
X-CSE-MsgGUID: A21xIJetS9CbUuTMCxUurQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,317,1732608000"; d="scan'208";a="121691034"
Received: from sannilnx-dsk.jer.intel.com ([10.12.231.107])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Feb 2025 05:03:52 -0800
From: Alexander Usyskin <alexander.usyskin@intel.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>,
 Karthik Poosa <karthik.poosa@intel.com>
Cc: Reuven Abliyev <reuven.abliyev@intel.com>,
 Oren Weil <oren.jer.weil@intel.com>, linux-mtd@lists.infradead.org,
 dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org,
 Alexander Usyskin <alexander.usyskin@intel.com>
Subject: [PATCH v5 11/11] drm/xe/nvm: add support for access mode
Date: Wed, 26 Feb 2025 14:51:43 +0200
Message-ID: <20250226125143.3791515-12-alexander.usyskin@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250226125143.3791515-1-alexander.usyskin@intel.com>
References: <20250226125143.3791515-1-alexander.usyskin@intel.com>
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

Check NVM access mode from GSC FW status registers
and overwrite access status read from SPI descriptor, if needed.

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
Signed-off-by: Alexander Usyskin <alexander.usyskin@intel.com>
---
 drivers/gpu/drm/xe/regs/xe_gsc_regs.h |  4 ++++
 drivers/gpu/drm/xe/xe_heci_gsc.c      |  5 +----
 drivers/gpu/drm/xe/xe_nvm.c           | 32 ++++++++++++++++++++++++++-
 3 files changed, 36 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/xe/regs/xe_gsc_regs.h b/drivers/gpu/drm/xe/regs/xe_gsc_regs.h
index 7702364b65f1..9b66cc972a63 100644
--- a/drivers/gpu/drm/xe/regs/xe_gsc_regs.h
+++ b/drivers/gpu/drm/xe/regs/xe_gsc_regs.h
@@ -16,6 +16,10 @@
 #define MTL_GSC_HECI1_BASE	0x00116000
 #define MTL_GSC_HECI2_BASE	0x00117000
 
+#define DG1_GSC_HECI2_BASE	0x00259000
+#define PVC_GSC_HECI2_BASE	0x00285000
+#define DG2_GSC_HECI2_BASE	0x00374000
+
 #define HECI_H_CSR(base)	XE_REG((base) + 0x4)
 #define   HECI_H_CSR_IE		REG_BIT(0)
 #define   HECI_H_CSR_IS		REG_BIT(1)
diff --git a/drivers/gpu/drm/xe/xe_heci_gsc.c b/drivers/gpu/drm/xe/xe_heci_gsc.c
index 3ea325d3db99..266097a5b98b 100644
--- a/drivers/gpu/drm/xe/xe_heci_gsc.c
+++ b/drivers/gpu/drm/xe/xe_heci_gsc.c
@@ -11,15 +11,12 @@
 #include "xe_device_types.h"
 #include "xe_drv.h"
 #include "xe_heci_gsc.h"
+#include "regs/xe_gsc_regs.h"
 #include "xe_platform_types.h"
 #include "xe_survivability_mode.h"
 
 #define GSC_BAR_LENGTH  0x00000FFC
 
-#define DG1_GSC_HECI2_BASE			0x259000
-#define PVC_GSC_HECI2_BASE			0x285000
-#define DG2_GSC_HECI2_BASE			0x374000
-
 static void heci_gsc_irq_mask(struct irq_data *d)
 {
 	/* generic irq handling */
diff --git a/drivers/gpu/drm/xe/xe_nvm.c b/drivers/gpu/drm/xe/xe_nvm.c
index 26de7d4472c8..08fe3bf04cf0 100644
--- a/drivers/gpu/drm/xe/xe_nvm.c
+++ b/drivers/gpu/drm/xe/xe_nvm.c
@@ -6,8 +6,11 @@
 #include <linux/intel_dg_nvm_aux.h>
 #include <linux/pci.h>
 
+#include "xe_device.h"
 #include "xe_device_types.h"
+#include "xe_mmio.h"
 #include "xe_nvm.h"
+#include "regs/xe_gsc_regs.h"
 #include "xe_sriov.h"
 
 #define GEN12_GUNIT_NVM_BASE 0x00102040
@@ -25,6 +28,33 @@ static void xe_nvm_release_dev(struct device *dev)
 {
 }
 
+static bool xe_nvm_writeable_override(struct xe_device *xe)
+{
+	struct xe_gt *gt = xe_root_mmio_gt(xe);
+	resource_size_t base;
+	bool writeable_override;
+
+	if (xe->info.platform == XE_BATTLEMAGE) {
+		base = DG2_GSC_HECI2_BASE;
+	} else if (xe->info.platform == XE_PVC) {
+		base = PVC_GSC_HECI2_BASE;
+	} else if (xe->info.platform == XE_DG2) {
+		base = DG2_GSC_HECI2_BASE;
+	} else if (xe->info.platform == XE_DG1) {
+		base = DG1_GSC_HECI2_BASE;
+	} else {
+		drm_err(&xe->drm, "Unknown platform\n");
+		return true;
+	}
+
+	writeable_override =
+		!(xe_mmio_read32(&gt->mmio, HECI_FWSTS2(base)) &
+		  HECI_FW_STATUS_2_NVM_ACCESS_MODE);
+	if (writeable_override)
+		drm_info(&xe->drm, "NVM access overridden by jumper\n");
+	return writeable_override;
+}
+
 void xe_nvm_init(struct xe_device *xe)
 {
 	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
@@ -49,7 +79,7 @@ void xe_nvm_init(struct xe_device *xe)
 
 	nvm = xe->nvm;
 
-	nvm->writeable_override = false;
+	nvm->writeable_override = xe_nvm_writeable_override(xe);
 	nvm->bar.parent = &pdev->resource[0];
 	nvm->bar.start = GEN12_GUNIT_NVM_BASE + pdev->resource[0].start;
 	nvm->bar.end = nvm->bar.start + GEN12_GUNIT_NVM_SIZE - 1;
-- 
2.43.0

