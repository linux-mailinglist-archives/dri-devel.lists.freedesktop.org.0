Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A630A97A36F
	for <lists+dri-devel@lfdr.de>; Mon, 16 Sep 2024 15:59:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB20510E38E;
	Mon, 16 Sep 2024 13:59:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DQ9CvYAW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 18E9310E37A;
 Mon, 16 Sep 2024 13:58:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726495139; x=1758031139;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=+i+Z8QNOPGGxK7/2DGH5tcM27kZR7UTgKdQ4u2/N/78=;
 b=DQ9CvYAWEs6jQ4anrzJwHkmj3gIeuRghu/VxiUAsHshIENVuJREjJJxQ
 X/0jD778EV+naGyx56vKgclcIuGZVh6QKJTRumF12JwGfDfCWFgwLGeXw
 g0bJgNPgjm7yLtilUcbspcMLY4GTuZCSQwkBvM8w/f1MiKnc25ZlfH1L3
 nNPlmYCgRohpfFudq8bn6CHFV2LKDJhyvGwU5SaST5U6yjZwmnbsP/A9W
 72Fxwm6RTuPmQnwgBsWC+2mnjW+PrECnUPdyUZvtS+DlLevTcIoJaaR/h
 lJbf3w3WcDdB/3cJPmrz5sgLbhh/YX3voRCox3EOqLDrQAuEYrEqIxSlN w==;
X-CSE-ConnectionGUID: UyPM3e6vQ6+Fyh2ZxxwOtA==
X-CSE-MsgGUID: JRdZN8JjTuq4rrlNutfAiw==
X-IronPort-AV: E=McAfee;i="6700,10204,11197"; a="36666921"
X-IronPort-AV: E=Sophos;i="6.10,233,1719903600"; d="scan'208";a="36666921"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2024 06:58:17 -0700
X-CSE-ConnectionGUID: thWLqYcMRqeTDE/7hRAl2g==
X-CSE-MsgGUID: Bfg0s3z/SpeARIr8/1frjw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,233,1719903600"; d="scan'208";a="68837481"
Received: from sannilnx-dsk.jer.intel.com ([10.12.231.107])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2024 06:58:13 -0700
From: Alexander Usyskin <alexander.usyskin@intel.com>
To: Mark Brown <broonie@kernel.org>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Oded Gabbay <ogabbay@kernel.org>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>
Cc: Tomas Winkler <tomas.winkler@intel.com>,
 Alexander Usyskin <alexander.usyskin@intel.com>,
 Vitaly Lubart <vitaly.lubart@intel.com>, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-spi@vger.kernel.org,
 intel-gfx@lists.freedesktop.org
Subject: [PATCH v6 10/12] drm/i915/spi: add support for access mode
Date: Mon, 16 Sep 2024 16:49:26 +0300
Message-Id: <20240916134928.3654054-11-alexander.usyskin@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240916134928.3654054-1-alexander.usyskin@intel.com>
References: <20240916134928.3654054-1-alexander.usyskin@intel.com>
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

Check SPI access mode from GSC FW status registers
and overwrite access status read from SPI descriptor, if needed.

Signed-off-by: Alexander Usyskin <alexander.usyskin@intel.com>
---
 drivers/gpu/drm/i915/spi/intel_spi.c | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/drivers/gpu/drm/i915/spi/intel_spi.c b/drivers/gpu/drm/i915/spi/intel_spi.c
index 200139531d26..e2b76e5cbc0c 100644
--- a/drivers/gpu/drm/i915/spi/intel_spi.c
+++ b/drivers/gpu/drm/i915/spi/intel_spi.c
@@ -10,6 +10,7 @@
 #include "spi/intel_spi.h"
 
 #define GEN12_GUNIT_SPI_SIZE 0x80
+#define HECI_FW_STATUS_2_SPI_ACCESS_MODE BIT(3)
 
 static const struct intel_dg_spi_region regions[INTEL_DG_SPI_REGIONS] = {
 	[0] = { .name = "DESCRIPTOR", },
@@ -22,6 +23,29 @@ static void i915_spi_release_dev(struct device *dev)
 {
 }
 
+static bool i915_spi_writeable_override(struct drm_i915_private *dev_priv)
+{
+	struct pci_dev *pdev = to_pci_dev(dev_priv->drm.dev);
+	resource_size_t base;
+	bool writeable_override;
+
+	if (IS_DG1(dev_priv)) {
+		base = DG1_GSC_HECI2_BASE;
+	} else if (IS_DG2(dev_priv)) {
+		base = DG2_GSC_HECI2_BASE;
+	} else {
+		dev_err(&pdev->dev, "Unknown platform\n");
+		return true;
+	}
+
+	writeable_override =
+		!(intel_uncore_read(&dev_priv->uncore, HECI_FWSTS(base, 2)) &
+		  HECI_FW_STATUS_2_SPI_ACCESS_MODE);
+	if (writeable_override)
+		dev_info(&pdev->dev, "SPI access overridden by jumper\n");
+	return writeable_override;
+}
+
 void intel_spi_init(struct drm_i915_private *dev_priv)
 {
 	struct intel_dg_spi_dev *spi = &dev_priv->spi;
@@ -33,6 +57,7 @@ void intel_spi_init(struct drm_i915_private *dev_priv)
 	if (!IS_DGFX(dev_priv))
 		return;
 
+	spi->writeable_override = i915_spi_writeable_override(dev_priv);
 	spi->bar.parent = &pdev->resource[0];
 	spi->bar.start = GEN12_GUNIT_SPI_BASE + pdev->resource[0].start;
 	spi->bar.end = spi->bar.start + GEN12_GUNIT_SPI_SIZE - 1;
-- 
2.34.1

