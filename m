Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F59A397B13
	for <lists+dri-devel@lfdr.de>; Tue,  1 Jun 2021 22:17:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF25F6EB04;
	Tue,  1 Jun 2021 20:17:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2086.outbound.protection.outlook.com [40.107.94.86])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E7586EAE1;
 Tue,  1 Jun 2021 20:17:26 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nKCDSvbTAQTS5p9FsWP+t28bm4t5LguTxUAJO1TUTPL22ReeHlYwMZ9WOtF+7uac9DF1DoJFkpVd8KgUaiFKaIiQ2iKF1rtnXGLr/5J4KD66ewzPdTwfT1jAwso385vfwLGyN4fn/slzyNFKSsQxpZTgbNs3rktzJVBpfTV3dYWRMns8aIX8ipmEx2E3G9J0hWHt7e+6sVqKkFNj6HWwP5ZhJbIift1UpTgCqjM85FHtIADAqHiJcPytxZ6pa94RO7zpdDdFUdAC10CbcRsVDN0b2cC25hc4PrpBx+UOCDkThLuoPXOA+EBfOzB9rgKCiw49HoGjPsZ/Fp3/m8wh/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=luXjnD5F/aDMqOHZAWN0qrITdbLhAKDopog/EgzqkcQ=;
 b=AtN9o3sc9ugauMbv+J+wQTx2SMox5s+6vZzZiY9VjRfFgVUZqCzUwIZSGCWjg4G45WLrIUmh9/GYsyuymES8Hnm89DoHJ563kdEq50jRc2qhMjJJj2sYBcmGY/I3ovstWLuJaxjCDGeFHhnB+uoavFb3CVd2UPn++uwlVotdrjR6vQJWdqulXeM92GxS2y99sGttVmTXnA848iv95LwSQaGt4RiXkWSoq0A4vhBVlW58XXmtowOhN7En+KQYwg8whPM+XoNZpxAayNOrzmOBImEt+xkEVT9JQpaZTlqaUzALmLFXIakfKc5DEKBkdHmktHUkUr9UA1izSsbk/gGTsg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=luXjnD5F/aDMqOHZAWN0qrITdbLhAKDopog/EgzqkcQ=;
 b=uAahFHI2QDlsuVEUwLWPK33LAPPDfGlYz4iL+N8xg83Vb0hkrL3jrhVnAs+C2vbzj4QbWXbqiscqYHcRtOrky2iQs3hQPVhNLZVob0+O0MD3h4iJD4SE/jXHU/csDeQ2dEwaCKI2WEVLosFof7lYRJv7sfrvC3wfz29TtvwHZhI=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from SN6PR12MB4623.namprd12.prod.outlook.com (2603:10b6:805:e9::17)
 by SN6PR12MB2702.namprd12.prod.outlook.com (2603:10b6:805:6c::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4173.20; Tue, 1 Jun
 2021 20:17:24 +0000
Received: from SN6PR12MB4623.namprd12.prod.outlook.com
 ([fe80::ad51:8c49:b171:856c]) by SN6PR12MB4623.namprd12.prod.outlook.com
 ([fe80::ad51:8c49:b171:856c%7]) with mapi id 15.20.4173.030; Tue, 1 Jun 2021
 20:17:24 +0000
From: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
To: dri-devel@lists.freedesktop.org,
	amd-gfx@lists.freedesktop.org
Subject: [PATCH 4/7] test/amdgpu/hotunplug: Add test suite for GPU unplug
Date: Tue,  1 Jun 2021 16:16:59 -0400
Message-Id: <20210601201702.23316-5-andrey.grodzovsky@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210601201702.23316-1-andrey.grodzovsky@amd.com>
References: <20210601201702.23316-1-andrey.grodzovsky@amd.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [2607:fea8:3edf:49b0:5b64:13a3:c94c:964b]
X-ClientProxiedBy: YTXPR0101CA0048.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:1::25) To SN6PR12MB4623.namprd12.prod.outlook.com
 (2603:10b6:805:e9::17)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from agrodzovsky-All-Series.hitronhub.home
 (2607:fea8:3edf:49b0:5b64:13a3:c94c:964b) by
 YTXPR0101CA0048.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b00:1::25) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4173.24 via Frontend
 Transport; Tue, 1 Jun 2021 20:17:23 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ebed0baa-0506-40af-30d3-08d9253a44fa
X-MS-TrafficTypeDiagnostic: SN6PR12MB2702:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SN6PR12MB270247105EF5A69A9080C4BCEA3E9@SN6PR12MB2702.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 2PyjCp6uoyJFG3sU7FgFhA8PGOY+AVw0b7R2FD6W1hrtyvk79DiIgZOhdMRTTBMn3NVbw7R3th61T20a6mnsF+6kjlz6oeE/epz1ihaz/Y0n866FP0ym/PBrjuC5YZXRaZ7aB+yWWI7XTBXIiEyVaSHV1y8wC/vAyPAws7aVgvWDOtfQpPHbwvRJ/u+xt2OxbA0I+/fQw6SCWRiCvOXS1Wy7y9cpFsSBZY131Mv3Y5Hkj3cCQZav5Tq2bu6YHQOAejssV2DtssAl/XHEk4i1NqEwXZR4BV0VJvVEeKMAkNIQcs+4wFwdJbNeShKA3WUBvXp5iHRXB9eXFQMjLqRJFmxIRpSO8j8ymRGP2qI/OB9upsZgHTrCMde5z+Q9UVRkw2ji+a8dIpSf77qYKuquN0A30bDpguNmXZ3ksPXA7TecSy2q4OCGhsoX5y9g5QmUMQ9I3hdvsXVQvK733V9kOPnjj+TWPpWheQGZnRxA3SpB1Qo8bt0Mq0HlpfjipVgNoX0WpXnfXiAZxeXKLUmrFfB5jwv3VmdWlGqYZrq0saxzuZChf24Bh7x6FuUDFDvDVJ6lc2Nox2NkK1O6a9ysKh2ON/GfFT55Z+TKiWvkvJs=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR12MB4623.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(366004)(396003)(39860400002)(136003)(346002)(16526019)(6506007)(2616005)(38100700002)(1076003)(6512007)(5660300002)(83380400001)(52116002)(478600001)(186003)(6486002)(316002)(66946007)(8936002)(8676002)(2906002)(66556008)(66476007)(6666004)(86362001)(44832011)(36756003)(4326008);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?Zon+cTb47LTBBqJLt5MCc0c18u+93FQ2cJjM+Co2eF46EnfFruwePxR595Pm?=
 =?us-ascii?Q?QTcZE+IR60naqkZCpD+aa5wJhU6scfQsN/5SYDMeZCIdpIvbpmQY8n+2sHxW?=
 =?us-ascii?Q?Q7xyBrU325xYYhGlXQQU8hPixNxDxx59qjGAUO5r99uM9YudJo1r8Uv+WrV4?=
 =?us-ascii?Q?LMnoGRpW+3W+nVmIVuD1S0cfXYql9kyqINW8vkwXhGG7zcZbwzoxPAOTTbBe?=
 =?us-ascii?Q?XRcnaHquCVASyACwlwY9ttF+UJLds/vtsVQ4eiFGceUOG8QzYUe7MY075xGQ?=
 =?us-ascii?Q?DQw4soRPnOeLodkaWYuxTVW+5pvwSNc5PrfNjSi9Hjq16SoGbCZBBgfPaIld?=
 =?us-ascii?Q?rzoAeUIBcy8c34xgRWzjLtIaS7DWAG/CBGJlw+MmfXhzwC4tL7jMpb+Gw/mh?=
 =?us-ascii?Q?3R2K/sN9hXezHAbeqt0RIobtdB0wKpbV/ecTx6L2siIhBXfA1/3WeDsH57iM?=
 =?us-ascii?Q?JERMcmIwHwoFDO21lLFYrSv9CGZd8meG3V4D4Dw+YlAHdVteNg8DZqlUTkcj?=
 =?us-ascii?Q?mFx6WKj52+Ym+wEOOu4Ta4VJDGC9K9QOkxJgqJvITcZaTAvhwarRPxSYeTEu?=
 =?us-ascii?Q?tKi4fbyeFcuEOYnRXt2vWi/uEkC6nPoat7Urxkv8/CdCjyXkyXQ8NaZQ3dE9?=
 =?us-ascii?Q?6vmGwKr45yVXbtwFuuAFvk+BTMTBtU+RP3fnKjAyDXIiyWuVu8UBDkCvjH1K?=
 =?us-ascii?Q?aS0llcF1wyG9UH4O+TlcDVFhNJZ7Y1WsEKtx90Bp3L9HiozqFTssTnyS39S/?=
 =?us-ascii?Q?NztzENjKgTZhNYlCDXk/nd402XTGq8HzzChF6y4QsEC6NQUh8ejJNHhqWJfy?=
 =?us-ascii?Q?Q37EHyA6HRTAp8oWaTgJuTOqVzHJenyq8PKJCa8OZXtWFg9fu2EBqB8ytli1?=
 =?us-ascii?Q?zwT90uI6aFeOJ7G653FaAFJ7ubzM/0NvWaEejQDxOkDN2DSNmzv/wFDIxvvJ?=
 =?us-ascii?Q?L/OdL8JPD3qSNdUZRd5Xl4zUzzz253KwZ/arpsKjVdYMsjMsmn/VCqCWlXFu?=
 =?us-ascii?Q?OI3j51woHD8PRQD4NyFQHXxkW07X+tGmdZLkaMhra9Bce24symVuaf+dXA52?=
 =?us-ascii?Q?+Moz4a58+bmJ+hDMvhHGz1S2/JFzbtDUJH8JG9KnzSIaIB5JWwcHZ9mhhkHt?=
 =?us-ascii?Q?8+36Duk5dWPeLBK6c30l1dXNduLYdGfpNgshHs6sx9MnDdH8kCYG3tONTieI?=
 =?us-ascii?Q?pnZ34cmzCVnxHtdHda1UXbqju7UaclTbLUMQmycW0hn94vSIjMQRlt+zGdvh?=
 =?us-ascii?Q?p4sZEAEIQspOjPzhZ2tmlbp8xovQyvVPAaKcG/NUdBKupYQqUmCkBmvuGdqt?=
 =?us-ascii?Q?WhfqBlDJd1id3KIlGX0HLvPxKd44Yy5hBae4EE8/lCrEXwfYwjH7i3/GxNrn?=
 =?us-ascii?Q?Yr0/tJMUpgPlrz/6VByS+Q3DmBVW?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ebed0baa-0506-40af-30d3-08d9253a44fa
X-MS-Exchange-CrossTenant-AuthSource: SN6PR12MB4623.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jun 2021 20:17:24.7772 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: h8OX0NQjYKkzIfM69nS4XgHET9E3D3wDC+qZiId4DMv2buCzXI+t2p6htrNrX3YHzIfp0ifI5onML1/zcoFNKw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR12MB2702
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
Cc: Alexander.Deucher@amd.com, ckoenig.leichtzumerken@gmail.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add just the test suite skeleton.

Signed-off-by: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
---
 tests/amdgpu/amdgpu_test.c     |  11 ++++
 tests/amdgpu/amdgpu_test.h     |  23 +++++++
 tests/amdgpu/hotunplug_tests.c | 116 +++++++++++++++++++++++++++++++++
 tests/amdgpu/meson.build       |   1 +
 4 files changed, 151 insertions(+)
 create mode 100644 tests/amdgpu/hotunplug_tests.c

diff --git a/tests/amdgpu/amdgpu_test.c b/tests/amdgpu/amdgpu_test.c
index 2864eaff..a10a031a 100644
--- a/tests/amdgpu/amdgpu_test.c
+++ b/tests/amdgpu/amdgpu_test.c
@@ -59,6 +59,7 @@
 #define RAS_TESTS_STR "RAS Tests"
 #define SYNCOBJ_TIMELINE_TESTS_STR "SYNCOBJ TIMELINE Tests"
 #define SECURITY_TESTS_STR "Security Tests"
+#define HOTUNPLUG_TESTS_STR "Hotunplug Tests"
 
 /**
  *  Open handles for amdgpu devices
@@ -137,6 +138,12 @@ static CU_SuiteInfo suites[] = {
 		.pCleanupFunc = suite_security_tests_clean,
 		.pTests = security_tests,
 	},
+	{
+		.pName = HOTUNPLUG_TESTS_STR,
+		.pInitFunc = suite_hotunplug_tests_init,
+		.pCleanupFunc = suite_hotunplug_tests_clean,
+		.pTests = hotunplug_tests,
+	},
 
 	CU_SUITE_INFO_NULL,
 };
@@ -198,6 +205,10 @@ static Suites_Active_Status suites_active_stat[] = {
 			.pName = SECURITY_TESTS_STR,
 			.pActive = suite_security_tests_enable,
 		},
+		{
+			.pName = HOTUNPLUG_TESTS_STR,
+			.pActive = suite_hotunplug_tests_enable,
+		},
 };
 
 
diff --git a/tests/amdgpu/amdgpu_test.h b/tests/amdgpu/amdgpu_test.h
index 107134a5..e2e35fec 100644
--- a/tests/amdgpu/amdgpu_test.h
+++ b/tests/amdgpu/amdgpu_test.h
@@ -273,6 +273,29 @@ amdgpu_command_submission_write_linear_helper_with_secure(amdgpu_device_handle
 							  unsigned ip_type,
 							  bool secure);
 
+
+
+/**
+ * Initialize hotunplug test suite
+ */
+int suite_hotunplug_tests_init();
+
+/**
+ * Deinitialize hotunplug test suite
+ */
+int suite_hotunplug_tests_clean();
+
+/**
+ * Decide if the suite is enabled by default or not.
+ */
+CU_BOOL suite_hotunplug_tests_enable(void);
+
+/**
+ * Tests in uvd enc test suite
+ */
+extern CU_TestInfo hotunplug_tests[];
+
+
 /**
  * Helper functions
  */
diff --git a/tests/amdgpu/hotunplug_tests.c b/tests/amdgpu/hotunplug_tests.c
new file mode 100644
index 00000000..9d11dae4
--- /dev/null
+++ b/tests/amdgpu/hotunplug_tests.c
@@ -0,0 +1,116 @@
+/*
+ * Copyright 2021 Advanced Micro Devices, Inc.
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining a
+ * copy of this software and associated documentation files (the "Software"),
+ * to deal in the Software without restriction, including without limitation
+ * the rights to use, copy, modify, merge, publish, distribute, sublicense,
+ * and/or sell copies of the Software, and to permit persons to whom the
+ * Software is furnished to do so, subject to the following conditions:
+ *
+ * The above copyright notice and this permission notice shall be included in
+ * all copies or substantial portions of the Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
+ * THE COPYRIGHT HOLDER(S) OR AUTHOR(S) BE LIABLE FOR ANY CLAIM, DAMAGES OR
+ * OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
+ * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
+ * OTHER DEALINGS IN THE SOFTWARE.
+ *
+*/
+
+#include <stdio.h>
+#include <stdlib.h>
+#include <unistd.h>
+#if HAVE_ALLOCA_H
+# include <alloca.h>
+#endif
+
+#include "CUnit/Basic.h"
+
+#include "amdgpu_test.h"
+#include "amdgpu_drm.h"
+#include "amdgpu_internal.h"
+
+#include <pthread.h>
+
+
+static  amdgpu_device_handle device_handle;
+static  uint32_t  major_version;
+static  uint32_t  minor_version;
+
+static uint32_t family_id;
+static uint32_t chip_rev;
+static uint32_t chip_id;
+
+CU_BOOL suite_hotunplug_tests_enable(void)
+{
+	CU_BOOL enable = CU_TRUE;
+
+	if (amdgpu_device_initialize(drm_amdgpu[0], &major_version,
+					     &minor_version, &device_handle))
+		return CU_FALSE;
+
+	family_id = device_handle->info.family_id;
+	chip_id = device_handle->info.chip_external_rev;
+	chip_rev = device_handle->info.chip_rev;
+
+	/*
+	 * Only enable for ASICs supporting GPU reset and for which it's enabled
+	 * by default (currently GFX8/9 dGPUS)
+	 */
+	if (family_id != AMDGPU_FAMILY_VI &&
+	    family_id != AMDGPU_FAMILY_AI &&
+	    family_id != AMDGPU_FAMILY_CI) {
+		printf("\n\nGPU reset is not enabled for the ASIC, hotunplug suite disabled\n");
+		enable = CU_FALSE;
+	}
+
+	if (amdgpu_device_deinitialize(device_handle))
+		return CU_FALSE;
+
+	return enable;
+}
+
+int suite_hotunplug_tests_init(void)
+{
+	int r;
+
+	r = amdgpu_device_initialize(drm_amdgpu[0], &major_version,
+				   &minor_version, &device_handle);
+
+	if (r) {
+		if ((r == -EACCES) && (errno == EACCES))
+			printf("\n\nError:%s. "
+				"Hint:Try to run this test program as root.",
+				strerror(errno));
+		return CUE_SINIT_FAILED;
+	}
+
+	return CUE_SUCCESS;
+}
+
+int suite_hotunplug_tests_clean(void)
+{
+	int r = amdgpu_device_deinitialize(device_handle);
+
+	if (r == 0)
+		return CUE_SUCCESS;
+	else
+		return CUE_SCLEAN_FAILED;
+}
+
+
+static void amdgpu_hotunplug_gfx(void)
+{
+	printf("Hello!\n");
+}
+
+CU_TestInfo hotunplug_tests[] = {
+	{ "gfx ring block test (set amdgpu.lockup_timeout=50)", amdgpu_hotunplug_gfx },
+	CU_TEST_INFO_NULL,
+};
+
+
diff --git a/tests/amdgpu/meson.build b/tests/amdgpu/meson.build
index eb16a50c..e6e30812 100644
--- a/tests/amdgpu/meson.build
+++ b/tests/amdgpu/meson.build
@@ -25,6 +25,7 @@ if dep_cunit.found()
       'amdgpu_test.c', 'basic_tests.c', 'bo_tests.c', 'cs_tests.c',
       'vce_tests.c', 'uvd_enc_tests.c', 'vcn_tests.c', 'deadlock_tests.c',
       'vm_tests.c', 'ras_tests.c', 'syncobj_tests.c', 'security_tests.c',
+      'hotunplug_tests.c'
     ),
     dependencies : [dep_cunit, dep_threads, dep_atomic_ops],
     include_directories : [inc_root, inc_drm, include_directories('../../amdgpu')],
-- 
2.25.1

