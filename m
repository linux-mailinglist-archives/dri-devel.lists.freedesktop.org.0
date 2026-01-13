Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A70B0D17EEC
	for <lists+dri-devel@lfdr.de>; Tue, 13 Jan 2026 11:17:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD6A810E499;
	Tue, 13 Jan 2026 10:17:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=imgtec.com header.i=@imgtec.com header.b="UEAk+cyY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx07-00376f01.pphosted.com (mx07-00376f01.pphosted.com
 [185.132.180.163])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6986210E119
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Jan 2026 10:17:15 +0000 (UTC)
Received: from pps.filterd (m0168889.ppops.net [127.0.0.1])
 by mx07-00376f01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 60D5mmMg3116559; Tue, 13 Jan 2026 10:17:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=imgtec.com; h=cc
 :content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=dk201812; bh=W
 uJORSLGkBNgb2whSilesJ8ZVajo6Inym/LHHlLH+sc=; b=UEAk+cyY0tgOz8mdF
 bi98BM2L6p3K66r+Ezf6AoNIxg/XNWrL7EBv+rup7rj6w1D81/yhId908ODt8Awt
 NV/7p1wstulWmXc7vrmjUv9/FLenCje4hhGaOtdNy88XDG0cbTUo8RZuYw0BkKHY
 cTer67ENR+DsemUfR/Idvt3f10eTSWijbq/f8dzYtqQ2pLy9ERxzrQ0J2NNntpGu
 KiS3wUMECk7mZtgE0DZ1zUzJ+tfKPFpv+EjKzFv0cM4LnklAVjXOghZAMckZ1Yp1
 FzBc2D/xUH8rLovhkpOZrW/DA4ftlTwBInUPMSO3EPGdJv0gFWrQSmhqRiXKZ+ro
 GGmjg==
Received: from hhmail01.hh.imgtec.org
 (83-244-153-141.cust-83.exponential-e.net [83.244.153.141])
 by mx07-00376f01.pphosted.com (PPS) with ESMTPS id 4bkfqua1rw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 13 Jan 2026 10:16:59 +0000 (GMT)
Received: from
 1.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.ip6.arpa
 (172.25.4.58) by HHMAIL01.hh.imgtec.org (10.100.10.19) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 13 Jan 2026 10:16:58 +0000
From: Matt Coster <matt.coster@imgtec.com>
Date: Tue, 13 Jan 2026 10:16:43 +0000
Subject: [PATCH 5/6] drm/imagination: KUnit test for pvr_gpuid_decode_string()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260113-device-support-info-v1-5-91e5db7f7294@imgtec.com>
References: <20260113-device-support-info-v1-0-91e5db7f7294@imgtec.com>
In-Reply-To: <20260113-device-support-info-v1-0-91e5db7f7294@imgtec.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
CC: Frank Binns <frank.binns@imgtec.com>, Brajesh Gupta
 <brajesh.gupta@imgtec.com>, Alessio Belle <alessio.belle@imgtec.com>,
 Alexandru Dadu <alexandru.dadu@imgtec.com>, Matt Coster
 <matt.coster@imgtec.com>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=6169;
 i=matt.coster@imgtec.com; h=from:subject:message-id;
 bh=FWlMta4Uljf7/nzzWPEVlYNk15Xf+Jqsvc2mUkSuWRo=;
 b=owGbwMvMwCFWuUfy8817WRsYT6slMWSmSU9z/LKoJnZaYaKf78a1x3gdGWaXnJjME/nmc2iGR
 pPCtcqDHaUsDGIcDLJiiiw7VliuUPujpiVx41cxzBxWJpAhDFycAjARwQUM//S/b+RnZtyi3Rwn
 f/qxxGHmunk28TkXL/S1vVQW+rM0TZDhf/qDib8c+rsF9I9I2eouuiww3aNk687SGN6OxTOM96z
 8xwcA
X-Developer-Key: i=matt.coster@imgtec.com; a=openpgp;
 fpr=05A40CFCE7269D61D97100A1747F0A9036F90DFA
X-Originating-IP: [172.25.4.58]
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTEzMDA4NiBTYWx0ZWRfX3+tXUe+CHD/R
 s9jBEuSd76lG6duszm9+4zIMnVeAxPH9UNzyP1aBVoyOzBKvxxzZbTx8lEdW2EoBPPHVyhLmIw/
 XkjFFzrFEbyMtJWeic3N2/TZEbK3AwsW2+YeVZL5zyJ9gLEHgEUHpmOQq2q6W8ZFV9R0Hi4Thm7
 u8PcxMTaYG4E1iCWluOPP7xnm/HLmE5Tdo4fb0V6a3/0N9m6e6jT/jK37M9I+APqAD/ALaAbO7+
 4e5d91w24xuySexf1jurVUZf7hH8IOQ660KwtEGfELmBQGWNwxlGyyjrc93rXgkVYoZhMFjZ2Rn
 CuJGlPzF6TvQWahHQilukxyeRE9zOHW10zEKtbKTw/JfsE28WFmkjMZDrf9cS1ConYV/HAMjorY
 hisfD9k9iL6dvIxd83/r+Z9ZFq88XzLyo3fFtaHg4EdwynivJ+98KERQvp8vxYy1cMV0wp/uG8l
 fh3ckeaK/IoT/DayTwQ==
X-Proofpoint-GUID: BFaEvU7O3YWiKCPvmdVTGKvMN2a13G21
X-Proofpoint-ORIG-GUID: BFaEvU7O3YWiKCPvmdVTGKvMN2a13G21
X-Authority-Analysis: v=2.4 cv=aexsXBot c=1 sm=1 tr=0 ts=69661b9b cx=c_pps
 a=AKOq//PuzOIrVTIF9yBwbA==:117 a=AKOq//PuzOIrVTIF9yBwbA==:17
 a=jNdnsKvOq7QA:10 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=r_1tXGB3AAAA:8 a=l8_E3HPGGmWK6_1WluoA:9
 a=QEXdDO2ut3YA:10 a=t8nPyN_e6usw4ciXM-Pk:22
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

This is a nice self-contained function to serve as the basis of our first
KUnit tests.

Signed-off-by: Matt Coster <matt.coster@imgtec.com>
---
 drivers/gpu/drm/imagination/Kconfig      | 12 ++++++
 drivers/gpu/drm/imagination/Makefile     |  2 +
 drivers/gpu/drm/imagination/pvr_device.c |  5 ++-
 drivers/gpu/drm/imagination/pvr_device.h |  7 ++-
 drivers/gpu/drm/imagination/pvr_test.c   | 73 ++++++++++++++++++++++++++++++++
 5 files changed, 97 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/imagination/Kconfig b/drivers/gpu/drm/imagination/Kconfig
index 0482bfcefdde3..1fd4c635c2c96 100644
--- a/drivers/gpu/drm/imagination/Kconfig
+++ b/drivers/gpu/drm/imagination/Kconfig
@@ -18,3 +18,15 @@ config DRM_POWERVR
 	  Technologies PowerVR (Series 6 or later) or IMG GPU.
 
 	  If "M" is selected, the module will be called powervr.
+
+config DRM_POWERVR_KUNIT_TEST
+	tristate "KUnit tests for the drm powervr driver" if !KUNIT_ALL_TESTS
+	depends on DRM_POWERVR && KUNIT
+	default KUNIT_ALL_TESTS
+	help
+	  Choose this option to allow the driver to perform selftests under
+	  the kunit framework
+
+	  Recommended for driver developers only.
+
+	  If in doubt, say "N".
diff --git a/drivers/gpu/drm/imagination/Makefile b/drivers/gpu/drm/imagination/Makefile
index ab63eac9ba7f7..f5072f06b4c41 100644
--- a/drivers/gpu/drm/imagination/Makefile
+++ b/drivers/gpu/drm/imagination/Makefile
@@ -32,3 +32,5 @@ powervr-$(CONFIG_DEBUG_FS) += \
 	pvr_debugfs.o
 
 obj-$(CONFIG_DRM_POWERVR) += powervr.o
+
+obj-$(CONFIG_DRM_POWERVR_KUNIT_TEST) += pvr_test.o
diff --git a/drivers/gpu/drm/imagination/pvr_device.c b/drivers/gpu/drm/imagination/pvr_device.c
index db844e4e2e945..d87557812409a 100644
--- a/drivers/gpu/drm/imagination/pvr_device.c
+++ b/drivers/gpu/drm/imagination/pvr_device.c
@@ -31,6 +31,8 @@
 #include <linux/types.h>
 #include <linux/workqueue.h>
 
+#include <kunit/visibility.h>
+
 /* Major number for the supported version of the firmware. */
 #define PVR_FW_VERSION_MAJOR 1
 
@@ -463,7 +465,7 @@ pvr_gpuid_decode_reg(const struct pvr_device *pvr_dev, struct pvr_gpu_id *gpu_id
  * @param_bvnc: GPU ID (BVNC) module parameter.
  * @gpu_id: Output to be updated with the GPU ID.
  */
-static int
+VISIBLE_IF_KUNIT int
 pvr_gpuid_decode_string(const struct pvr_device *pvr_dev,
 			const char *param_bvnc, struct pvr_gpu_id *gpu_id)
 {
@@ -521,6 +523,7 @@ pvr_gpuid_decode_string(const struct pvr_device *pvr_dev,
 
 	return 0;
 }
+EXPORT_SYMBOL_IF_KUNIT(pvr_gpuid_decode_string);
 
 static char *pvr_gpuid_override;
 module_param_named(gpuid, pvr_gpuid_override, charp, 0400);
diff --git a/drivers/gpu/drm/imagination/pvr_device.h b/drivers/gpu/drm/imagination/pvr_device.h
index 5608a977f6d21..cfda215e7428e 100644
--- a/drivers/gpu/drm/imagination/pvr_device.h
+++ b/drivers/gpu/drm/imagination/pvr_device.h
@@ -519,7 +519,7 @@ struct pvr_file {
  * Return: Packed BVNC.
  */
 static __always_inline u64
-pvr_gpu_id_to_packed_bvnc(struct pvr_gpu_id *gpu_id)
+pvr_gpu_id_to_packed_bvnc(const struct pvr_gpu_id *gpu_id)
 {
 	return PVR_PACKED_BVNC(gpu_id->b, gpu_id->v, gpu_id->n, gpu_id->c);
 }
@@ -544,6 +544,11 @@ pvr_device_has_uapi_enhancement(struct pvr_device *pvr_dev, u32 enhancement);
 bool
 pvr_device_has_feature(struct pvr_device *pvr_dev, u32 feature);
 
+#if IS_ENABLED(CONFIG_KUNIT)
+int pvr_gpuid_decode_string(const struct pvr_device *pvr_dev,
+			    const char *param_bvnc, struct pvr_gpu_id *gpu_id);
+#endif
+
 /**
  * PVR_CR_FIELD_GET() - Extract a single field from a PowerVR control register
  * @val: Value of the target register.
diff --git a/drivers/gpu/drm/imagination/pvr_test.c b/drivers/gpu/drm/imagination/pvr_test.c
new file mode 100644
index 0000000000000..506cfa5a02f1e
--- /dev/null
+++ b/drivers/gpu/drm/imagination/pvr_test.c
@@ -0,0 +1,73 @@
+// SPDX-License-Identifier: GPL-2.0-only OR MIT
+/* Copyright (c) 2025 Imagination Technologies Ltd. */
+
+#include "pvr_device.h"
+
+#include <linux/errno.h>
+#include <linux/stddef.h>
+#include <linux/string.h>
+#include <linux/types.h>
+
+#include <kunit/test.h>
+#include <kunit/visibility.h>
+
+static void decode_gpuid_string(struct kunit *test)
+{
+	const struct pvr_gpu_id bad_gpuid = { 0xdead, 0xbeef, 0xcafe, 0xface };
+	const u64 packed_bad_gpuid = pvr_gpu_id_to_packed_bvnc(&bad_gpuid);
+
+#define GPUID_TEST_CASE(str_, err_, value_)					\
+	do {									\
+		struct pvr_gpu_id _gpuid_out = bad_gpuid;			\
+		int _err;							\
+		_err = pvr_gpuid_decode_string(NULL, str_, &_gpuid_out);	\
+		KUNIT_EXPECT_EQ(test, _err, err_);				\
+		KUNIT_EXPECT_EQ(test,						\
+				pvr_gpu_id_to_packed_bvnc(&_gpuid_out),		\
+				value_);					\
+	} while (0)
+
+#define GPUID_TEST_CASE_OK(str_, b_, v_, n_, c_) \
+	GPUID_TEST_CASE(str_, 0, PVR_PACKED_BVNC(b_, v_, n_, c_))
+
+#define GPUID_TEST_CASE_INVAL(str_) \
+	GPUID_TEST_CASE(str_, -EINVAL, packed_bad_gpuid)
+
+	GPUID_TEST_CASE_OK("12.34.56.78", 12, 34, 56, 78);
+	GPUID_TEST_CASE_OK("0.0.0.0", 0, 0, 0, 0);
+
+	GPUID_TEST_CASE_INVAL("");
+	GPUID_TEST_CASE_INVAL("42.foobar-invalid.gpuid.bvnc");
+
+	/* String longer than PVR_GPUID_STRING_MAX_LENGTH. */
+	GPUID_TEST_CASE_INVAL("12.34.56.789012345678901234567890123456");
+
+	/* Single value overflowing u16. */
+	GPUID_TEST_CASE_INVAL("12.34.56.999999");
+
+	/* Wrong number of parts and/or dots. */
+	GPUID_TEST_CASE_INVAL("12.34.56.78.90");
+	GPUID_TEST_CASE_INVAL("12.34.56..78");
+	GPUID_TEST_CASE_INVAL("12.34..56");
+	GPUID_TEST_CASE_INVAL("12.34.56");
+
+#undef GPUID_TEST_CASE_INVAL
+#undef GPUID_TEST_CASE_OK
+#undef GPUID_TEST_CASE
+}
+
+static struct kunit_case pvr_tests_cases[] = {
+	KUNIT_CASE(decode_gpuid_string),
+	{},
+};
+
+static struct kunit_suite pvr_tests_suite = {
+	.name = "pvr_tests",
+	.test_cases = pvr_tests_cases,
+};
+kunit_test_suite(pvr_tests_suite);
+
+MODULE_AUTHOR("Imagination Technologies Ltd.");
+MODULE_LICENSE("Dual MIT/GPL");
+MODULE_DESCRIPTION("pvr kunit tests");
+MODULE_IMPORT_NS("EXPORTED_FOR_KUNIT_TESTING");

-- 
2.52.0

