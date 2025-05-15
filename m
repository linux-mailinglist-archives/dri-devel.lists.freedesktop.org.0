Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D5CAAB8873
	for <lists+dri-devel@lfdr.de>; Thu, 15 May 2025 15:48:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E33410E8A3;
	Thu, 15 May 2025 13:48:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ymby3nUM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2135510E8A3;
 Thu, 15 May 2025 13:48:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747316909; x=1778852909;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=lBZ2ULNOwanm8+4z0E89ucXzMn5Qz+pSLa83A9usEGo=;
 b=Ymby3nUMJe17UPf/KXseHJmJGy2nZfbbeaujHdjEjp26n8RVzDyo3JxJ
 tFcz7LPd8oPDfjYkTbSGH9mnM93ekLksVlDRRUz9jraPhpZDMKg93ooP9
 2QbdUyrf5gq/1LnVV8sJkoysOJhTPHGQs+Hj/K7ZqAKj4wlJ7I21PL6UU
 gqtuISZ3KQhNSYAEVO16IAIOMfS4I/H1RnIUSy9ug5I2Sv8C3QmhCbdiV
 ZYP9AONFlEFcsAXFPZZ7wzvcviUbqpKo0kiSQsQBAxl34WoLX2O68AbCo
 OEwOWjlKElmOAslYSpvzlvP26YEyDzLFH4uTg1pw1yZUw3JT5PujHXUZ2 g==;
X-CSE-ConnectionGUID: bi6wODk+Q9mbHoarcp1DzQ==
X-CSE-MsgGUID: 7DjwFfLMRTaK9yYGXdfp1Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11434"; a="66660837"
X-IronPort-AV: E=Sophos;i="6.15,291,1739865600"; d="scan'208";a="66660837"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 May 2025 06:48:28 -0700
X-CSE-ConnectionGUID: bLNDiCe9S3SgwADdVlfwGw==
X-CSE-MsgGUID: L93tc7/rTySqno/gi/h2kg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,291,1739865600"; d="scan'208";a="138428352"
Received: from sannilnx-dsk.jer.intel.com ([10.12.231.107])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 May 2025 06:48:22 -0700
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
 Karthik Poosa <karthik.poosa@intel.com>, Raag Jadav <raag.jadav@intel.com>
Cc: Reuven Abliyev <reuven.abliyev@intel.com>,
 Oren Weil <oren.jer.weil@intel.com>, linux-mtd@lists.infradead.org,
 intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Alexander Usyskin <alexander.usyskin@intel.com>
Subject: [PATCH v10 07/10] drm/i915/nvm: add support for access mode
Date: Thu, 15 May 2025 16:33:42 +0300
Message-ID: <20250515133345.2805031-8-alexander.usyskin@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250515133345.2805031-1-alexander.usyskin@intel.com>
References: <20250515133345.2805031-1-alexander.usyskin@intel.com>
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
Acked-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
Signed-off-by: Alexander Usyskin <alexander.usyskin@intel.com>
---
 drivers/gpu/drm/i915/intel_nvm.c | 25 ++++++++++++++++++++++++-
 1 file changed, 24 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/intel_nvm.c b/drivers/gpu/drm/i915/intel_nvm.c
index 75d3ebe669ff..dd3999c934a7 100644
--- a/drivers/gpu/drm/i915/intel_nvm.c
+++ b/drivers/gpu/drm/i915/intel_nvm.c
@@ -10,6 +10,7 @@
 #include "intel_nvm.h"
 
 #define GEN12_GUNIT_NVM_SIZE 0x80
+#define HECI_FW_STATUS_2_NVM_ACCESS_MODE BIT(3)
 
 static const struct intel_dg_nvm_region regions[INTEL_DG_NVM_REGIONS] = {
 	[0] = { .name = "DESCRIPTOR", },
@@ -22,6 +23,28 @@ static void i915_nvm_release_dev(struct device *dev)
 {
 }
 
+static bool i915_nvm_writable_override(struct drm_i915_private *i915)
+{
+	resource_size_t base;
+	bool writable_override;
+
+	if (IS_DG1(i915)) {
+		base = DG1_GSC_HECI2_BASE;
+	} else if (IS_DG2(i915)) {
+		base = DG2_GSC_HECI2_BASE;
+	} else {
+		drm_err(&i915->drm, "Unknown platform\n");
+		return true;
+	}
+
+	writable_override =
+		!(intel_uncore_read(&i915->uncore, HECI_FWSTS(base, 2)) &
+		  HECI_FW_STATUS_2_NVM_ACCESS_MODE);
+	if (writable_override)
+		drm_info(&i915->drm, "NVM access overridden by jumper\n");
+	return writable_override;
+}
+
 void intel_nvm_init(struct drm_i915_private *i915)
 {
 	struct pci_dev *pdev = to_pci_dev(i915->drm.dev);
@@ -43,7 +66,7 @@ void intel_nvm_init(struct drm_i915_private *i915)
 
 	nvm = i915->nvm;
 
-	nvm->writeable_override = true;
+	nvm->writable_override = i915_nvm_writable_override(i915);
 	nvm->bar.parent = &pdev->resource[0];
 	nvm->bar.start = GEN12_GUNIT_NVM_BASE + pdev->resource[0].start;
 	nvm->bar.end = nvm->bar.start + GEN12_GUNIT_NVM_SIZE - 1;
-- 
2.43.0

