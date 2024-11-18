Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BC259D1137
	for <lists+dri-devel@lfdr.de>; Mon, 18 Nov 2024 14:03:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D265410E4B9;
	Mon, 18 Nov 2024 13:02:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=imgtec.com header.i=@imgtec.com header.b="UYlbSBHH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx07-00376f01.pphosted.com (mx07-00376f01.pphosted.com
 [185.132.180.163])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A585910E4B9
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Nov 2024 13:02:54 +0000 (UTC)
Received: from pps.filterd (m0168889.ppops.net [127.0.0.1])
 by mx07-00376f01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AICK2An027968;
 Mon, 18 Nov 2024 13:02:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=imgtec.com; h=cc
 :content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=dk201812; bh=q
 w6gtVJUdrXXMRs5xp3KkXtkpAjzUo4QWq4DNgvsSt8=; b=UYlbSBHHo/Cke1amw
 dtHOqj5DMsL6XcHPPnAAencc2+n9qdg3n2BfMBUpiZNZt+n46J0mly7ed9tE7tkb
 CYb0x7xihrqe3joGg/Lq7Z4yUCgfpqnyk0L8KO7zk7wIWQwX1qdzS6AptEDc+8x8
 CtfLXTMnaBu75tZ9JwVECKSoZk+FcktWq3+PRR4ZoDcFyn7Mk+FhuFqDCgaBVJ4O
 BKdRTXns+dqyK6KSZJahgV2cRWJ6eRuIjSS8TgRkexqlToYl1ZFS/jYUot8aF5oa
 /j4tDoqKhJcIbgfc1alTodZtBID5Np5yVoXVN94/wf4o36USr6xx9EEytKzZBync
 h3BcQ==
Received: from hhmail05.hh.imgtec.org
 (83-244-153-141.cust-83.exponential-e.net [83.244.153.141])
 by mx07-00376f01.pphosted.com (PPS) with ESMTPS id 42xmc1hmj6-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Mon, 18 Nov 2024 13:02:44 +0000 (GMT)
Received: from
 1.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.ip6.arpa
 (172.25.16.114) by HHMAIL05.hh.imgtec.org (10.100.10.120) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.37; Mon, 18 Nov 2024 13:02:43 +0000
From: Matt Coster <matt.coster@imgtec.com>
Date: Mon, 18 Nov 2024 13:02:10 +0000
Subject: [PATCH v2 18/21] drm/imagination: Add platform overrides
 infrastructure
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20241118-sets-bxs-4-64-patch-v1-v2-18-3fd45d9fb0cf@imgtec.com>
References: <20241118-sets-bxs-4-64-patch-v1-v2-0-3fd45d9fb0cf@imgtec.com>
In-Reply-To: <20241118-sets-bxs-4-64-patch-v1-v2-0-3fd45d9fb0cf@imgtec.com>
To: Frank Binns <frank.binns@imgtec.com>, Matt Coster <matt.coster@imgtec.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Nishanth Menon <nm@ti.com>, "Vignesh
 Raghavendra" <vigneshr@ti.com>, Tero Kristo <kristo@kernel.org>
CC: <dri-devel@lists.freedesktop.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 Randolph Sapp <rs@ti.com>, Darren Etheridge <detheridge@ti.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=7481;
 i=matt.coster@imgtec.com; h=from:subject:message-id;
 bh=VAAm9NNUHNCdfIZ/puO043Muv9ZbHxTrP8A3DF7x5Jc=;
 b=owGbwMvMwCFWuUfy8817WRsYT6slMaRbWz3rkZy6bN+89ed8jKeeMDDbKnpvmu7Cr7c95WO21
 P2f2M9V1FHKwiDGwSArpsiyY4XlCrU/aloSN34Vw8xhZQIZwsDFKQATSZnGyDD7QOXn+QEie9um
 rn3uuepReIfg3XdHn8hwBeWr/KwJ1t7MyPBB7MVv9gUNTsp5sqxfq/afOP08YO8fgQ2hx/ICLdM
 f9HMCAA==
X-Developer-Key: i=matt.coster@imgtec.com; a=openpgp;
 fpr=05A40CFCE7269D61D97100A1747F0A9036F90DFA
X-Originating-IP: [172.25.16.114]
X-EXCLAIMER-MD-CONFIG: 15a78312-3e47-46eb-9010-2e54d84a9631
X-Proofpoint-ORIG-GUID: jpPhY4ad37ebojwRrk4BFu2tbd67bVX9
X-Authority-Analysis: v=2.4 cv=E4efprdl c=1 sm=1 tr=0 ts=673b3af4 cx=c_pps
 a=AKOq//PuzOIrVTIF9yBwbA==:117 a=AKOq//PuzOIrVTIF9yBwbA==:17
 a=hzDjp0mCheYA:10 a=IkcTkHD0fZMA:10 a=VlfZXiiP6vEA:10 a=VwQbUJbxAAAA:8
 a=r_1tXGB3AAAA:8 a=NJLOqUG6SynMPaEuFzYA:9
 a=QEXdDO2ut3YA:10 a=t8nPyN_e6usw4ciXM-Pk:22
X-Proofpoint-GUID: jpPhY4ad37ebojwRrk4BFu2tbd67bVX9
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

This infrastructure will be used in cases where a specific GPU integration
or implementation requires some special handling in the driver. The first
use case is the device cached memory override added in the next patch.

The infrastructure is built out in this separate commit to make it
clear which specific changes refer to the workaround added there.

Signed-off-by: Matt Coster <matt.coster@imgtec.com>
---
Changes in v2:
- None
- Link to v1: https://lore.kernel.org/r/20241105-sets-bxs-4-64-patch-v1-v1-18-4ed30e865892@imgtec.com
---
 drivers/gpu/drm/imagination/pvr_device.c | 26 ++++++++++++++++++++++++
 drivers/gpu/drm/imagination/pvr_device.h | 26 ++++++++++++++++++++++++
 drivers/gpu/drm/imagination/pvr_drv.c    | 34 ++++++++++++++++++++++++--------
 3 files changed, 78 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/imagination/pvr_device.c b/drivers/gpu/drm/imagination/pvr_device.c
index 52d7641a1a0c62a9c4029092e846472d82950a61..2ce46b9a8ab7609faebeeb4e7820751b00047806 100644
--- a/drivers/gpu/drm/imagination/pvr_device.c
+++ b/drivers/gpu/drm/imagination/pvr_device.c
@@ -621,3 +621,29 @@ pvr_device_has_feature(struct pvr_device *pvr_dev, u32 feature)
 		return false;
 	}
 }
+
+/**
+ * pvr_device_overrides_validate() - Ensure the overrides specified are compatible with a device.
+ * @pvr_dev: Target PowerVR device.
+ * @overrides: Device overrides to validate.
+ *
+ * Return:
+ *  * %true if every override specified in @overrides is compatible with the current device, or
+ *  * %false otherwise; as many incompatibilities as possible will be reported in the kernel log.
+ */
+bool
+pvr_device_overrides_validate(struct pvr_device *pvr_dev,
+			      const struct pvr_device_overrides *overrides)
+{
+	bool ret = true;
+
+	/*
+	 * Where possible, avoid early returns in this function. This allows for as
+	 * many errors to be reported at once as possible.
+	 *
+	 * Note that this function may be called early during device initialization
+	 * so it should not be assumed that @pvr_dev is ready for normal use yet.
+	 */
+
+	return ret;
+}
diff --git a/drivers/gpu/drm/imagination/pvr_device.h b/drivers/gpu/drm/imagination/pvr_device.h
index 76f79b18af354f0e0070530dfc5c8fe0f6a41ce1..ad0a02a37154099542247dfc62f411c10f4e41f4 100644
--- a/drivers/gpu/drm/imagination/pvr_device.h
+++ b/drivers/gpu/drm/imagination/pvr_device.h
@@ -16,6 +16,7 @@
 #include <drm/drm_mm.h>
 
 #include <linux/bits.h>
+#include <linux/compiler.h>
 #include <linux/compiler_attributes.h>
 #include <linux/compiler_types.h>
 #include <linux/device.h>
@@ -56,6 +57,13 @@ struct pvr_fw_version {
 	u16 major, minor;
 };
 
+/**
+ * struct pvr_device_overrides - Hardware-level overrides loaded from
+ * MODULE_DEVICE_TABLE() or similar.
+ */
+struct pvr_device_overrides {
+};
+
 /**
  * struct pvr_device - powervr-specific wrapper for &struct drm_device
  */
@@ -94,6 +102,13 @@ struct pvr_device {
 	 */
 	struct pvr_device_enhancements enhancements;
 
+	/**
+	 * @overrides: Platform-specific overrides required for this device.
+	 *
+	 * Do not access this member directly, instead use PVR_HAS_OVERRIDE().
+	 */
+	struct pvr_device_overrides overrides;
+
 	/** @fw_version: Firmware version detected at runtime. */
 	struct pvr_fw_version fw_version;
 
@@ -436,6 +451,13 @@ struct pvr_file {
  */
 #define PVR_HAS_ENHANCEMENT(pvr_dev, enhancement) ((pvr_dev)->enhancements.has_ern##enhancement)
 
+/**
+ * PVR_HAS_OVERRIDE() - Tests whether a physical device requires a given override
+ * @pvr_dev: [IN] Target PowerVR device.
+ * @override: [IN] Override name.
+ */
+#define PVR_HAS_OVERRIDE(pvr_dev, override) unlikely((pvr_dev)->overrides.override)
+
 #define from_pvr_device(pvr_dev) (&(pvr_dev)->base)
 
 #define to_pvr_device(drm_dev) container_of_const(drm_dev, struct pvr_device, base)
@@ -516,6 +538,10 @@ pvr_device_has_uapi_enhancement(struct pvr_device *pvr_dev, u32 enhancement);
 bool
 pvr_device_has_feature(struct pvr_device *pvr_dev, u32 feature);
 
+bool
+pvr_device_overrides_validate(struct pvr_device *pvr_dev,
+			      const struct pvr_device_overrides *overrides);
+
 /**
  * PVR_CR_FIELD_GET() - Extract a single field from a PowerVR control register
  * @val: Value of the target register.
diff --git a/drivers/gpu/drm/imagination/pvr_drv.c b/drivers/gpu/drm/imagination/pvr_drv.c
index 1ab97933e14f20ee3fbf603c23b8dde2d33572c2..b56ee2cda9b54c4388a6eef38b0ff81acdb05874 100644
--- a/drivers/gpu/drm/imagination/pvr_drv.c
+++ b/drivers/gpu/drm/imagination/pvr_drv.c
@@ -31,6 +31,7 @@
 #include <linux/mod_devicetable.h>
 #include <linux/module.h>
 #include <linux/moduleparam.h>
+#include <linux/of.h>
 #include <linux/of_device.h>
 #include <linux/of_platform.h>
 #include <linux/platform_device.h>
@@ -1396,11 +1397,13 @@ static struct drm_driver pvr_drm_driver = {
 static int
 pvr_probe(struct platform_device *plat_dev)
 {
+	const struct pvr_device_overrides *overrides;
+	struct device *dev = &plat_dev->dev;
 	struct pvr_device *pvr_dev;
 	struct drm_device *drm_dev;
 	int err;
 
-	pvr_dev = devm_drm_dev_alloc(&plat_dev->dev, &pvr_drm_driver,
+	pvr_dev = devm_drm_dev_alloc(dev, &pvr_drm_driver,
 				     struct pvr_device, base);
 	if (IS_ERR(pvr_dev))
 		return PTR_ERR(pvr_dev);
@@ -1409,6 +1412,15 @@ pvr_probe(struct platform_device *plat_dev)
 
 	platform_set_drvdata(plat_dev, drm_dev);
 
+	overrides = of_device_get_match_data(dev);
+	if (!overrides)
+		return -EINVAL;
+
+	if (!pvr_device_overrides_validate(pvr_dev, overrides))
+		return -EINVAL;
+
+	pvr_dev->overrides = *overrides;
+
 	err = pvr_power_domains_init(pvr_dev);
 	if (err)
 		goto err_context_fini;
@@ -1421,11 +1433,11 @@ pvr_probe(struct platform_device *plat_dev)
 	if (err)
 		goto err_power_domains_fini;
 
-	devm_pm_runtime_enable(&plat_dev->dev);
-	pm_runtime_mark_last_busy(&plat_dev->dev);
+	devm_pm_runtime_enable(dev);
+	pm_runtime_mark_last_busy(dev);
 
-	pm_runtime_set_autosuspend_delay(&plat_dev->dev, 50);
-	pm_runtime_use_autosuspend(&plat_dev->dev);
+	pm_runtime_set_autosuspend_delay(dev, 50);
+	pm_runtime_use_autosuspend(dev);
 	pvr_watchdog_init(pvr_dev);
 
 	err = pvr_device_init(pvr_dev);
@@ -1478,18 +1490,24 @@ static void pvr_remove(struct platform_device *plat_dev)
 	pvr_power_domains_fini(pvr_dev);
 }
 
+static const struct pvr_device_overrides pvr_device_overrides_default = {};
+
+/*
+ * Always specify &pvr_device_overrides_default instead of %NULL for &struct of_device_id->data so
+ * that we know of_device_get_match_data() returning %NULL is an error.
+ */
 static const struct of_device_id dt_match[] = {
-	{ .compatible = "img,img-rogue", .data = NULL },
+	{ .compatible = "img,img-rogue", .data = &pvr_device_overrides_default },
 
 	/* All supported GPU models */
-	{ .compatible = "img,img-axe-1-16m", .data = NULL },
+	{ .compatible = "img,img-axe-1-16m", .data = &pvr_device_overrides_default },
 
 	/*
 	 * This legacy compatible string was introduced early on before the more specific GPU
 	 * identifiers were used. Keep it around here for compatibility, but never use
 	 * "img,img-axe" in new devicetrees.
 	 */
-	{ .compatible = "img,img-axe", .data = NULL },
+	{ .compatible = "img,img-axe", .data = &pvr_device_overrides_default },
 	{}
 };
 MODULE_DEVICE_TABLE(of, dt_match);

-- 
2.47.0

