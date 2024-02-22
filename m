Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A3C5D85FD5B
	for <lists+dri-devel@lfdr.de>; Thu, 22 Feb 2024 16:59:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 82DE010E473;
	Thu, 22 Feb 2024 15:59:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="zGXT1opF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam02on2068.outbound.protection.outlook.com [40.107.95.68])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA9D910E27C;
 Thu, 22 Feb 2024 15:58:58 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MiVoBa1UqJcVhAF4UWSdgkdS87IxSm5uA01I2U4jf9EGS8esHIgGIHM18vZeKXFkk+F9oi5faecnYKXqmDl6UsP2HT4ug9GQ5e8iLkX0Yojt6cJ0x98bY4s12x1SgkAEeRdw1lsNXY6+hTW9qXWl82sdj76XImwfgp0yiaI5Ukm+CRJsAkMl5hqox8aAkmG/V1APgo/w/RwqwemEtjWO/gcwu9qt03Eotd8GC9nuh25DPFYavj11SgsYFF2rgUkPG13F9XEfZCFXwteZ8joYEYqCAh3wtNb0ehregh2Phe+vKpXJnSDcm64v2IhJe1TWz7kPjLZNw1mYAmTt+yIVmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=feoFFLVJHv/CXkXdBkHmY8dw7jFJiTn7j5F5DENH8Z0=;
 b=n7ovGbAxy2RK8meVtAIg0L1HDV0Ex39jVIETd/M10bXGPx9G8MlFjMR9XEB8tNAuV9CHDbi8BZwTBZPCSrlPGRmqXYLvGXdctoyH3B+POaHPnpBDY4uWQg8LStv/YSymMXFO/cW64U22+FM/iI1kuQjQGsZptYiqYleSTpYv2eanC4PMOs0jEaugAyTVwW8LL9SL8z1YdHHasTx7ePe0EnY7li2oJYC1MhRQdVA/bnlWsdJnin8/Hf+W5wlFuWizc7uHFCenetyKWWsqrePj29KKXTozbLS5+DLZMiRQB6la906z/iFuelWya8O0lVjEZTEym88ERngaXxrkP20qHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linux.ie smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=feoFFLVJHv/CXkXdBkHmY8dw7jFJiTn7j5F5DENH8Z0=;
 b=zGXT1opFB1xqU9Yvx/ac2m+Xl70vnEwKbrNLuvKgAvVHvR1gkUWTD5QzzaLTTQgt7GjGR2HQmnoUQUUmEItCyJURKy8gWCW58klHY2nNvSit4QnJkx1hmh3qt7P5rG+j3fQKeskXQzoPDthGDewqB4RzwTHFyfApnEXIAUkW80g=
Received: from DM6PR18CA0017.namprd18.prod.outlook.com (2603:10b6:5:15b::30)
 by SA1PR12MB8118.namprd12.prod.outlook.com (2603:10b6:806:333::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7316.27; Thu, 22 Feb
 2024 15:58:56 +0000
Received: from SA2PEPF000015CB.namprd03.prod.outlook.com
 (2603:10b6:5:15b:cafe::86) by DM6PR18CA0017.outlook.office365.com
 (2603:10b6:5:15b::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7292.43 via Frontend
 Transport; Thu, 22 Feb 2024 15:58:55 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SA2PEPF000015CB.mail.protection.outlook.com (10.167.241.201) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7292.25 via Frontend Transport; Thu, 22 Feb 2024 15:58:55 +0000
Received: from smtp.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Thu, 22 Feb
 2024 09:58:52 -0600
From: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
To: Alex Deucher <alexander.deucher@amd.com>, <christian.koenig@amd.com>,
 <Xinhui.Pan@amd.com>, David Airlie <airlied@linux.ie>, Daniel Vetter
 <daniel@ffwll.ch>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
 "Rodrigo Siqueira" <Rodrigo.Siqueira@amd.com>, Nicholas Choi
 <nicholas.choi@amd.com>, Daniel Latypov <dlatypov@google.com>, David Gow
 <davidgow@google.com>, <hersenxs.wu@amd.com>, <magalilemes00@gmail.com>
CC: <kunit-dev@googlegroups.com>, <tales.aparecida@gmail.com>,
 <amd-gfx@lists.freedesktop.org>, <mwen@igalia.com>, <mairacanal@riseup.net>,
 <dri-devel@lists.freedesktop.org>, Isabella Basso <isabbasso@riseup.net>,
 <andrealmeid@riseup.net>, Trevor Woerner <twoerner@gmail.com>,
 <javierm@redhat.com>
Subject: [PATCH v5 1/8] drm/amd/display: Introduce KUnit tests for fixed31_32
 library
Date: Thu, 22 Feb 2024 08:56:13 -0700
Message-ID: <20240222155811.44096-2-Rodrigo.Siqueira@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240222155811.44096-1-Rodrigo.Siqueira@amd.com>
References: <20240222155811.44096-1-Rodrigo.Siqueira@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF000015CB:EE_|SA1PR12MB8118:EE_
X-MS-Office365-Filtering-Correlation-Id: 86776544-6508-43a2-466c-08dc33bf2c87
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Z7Qeqmi+XwVOVf3zn7lIvvI1T36qjIjfY3bpYjKbvmCjYQRsJvACuFjBY96FH5+G4sc1dNtbAV0U/VbljfrfuQLh4/TM56mhf2TVzCq7r2zLHSzBvyme/ddNVVGtbV84GJRCtqTKxHTcYiNp/fd7vowy/2FZesWdq2UVEZvVV/HwpvdUdjwFGF9k3yn7fa9nnanUfao0LjC2q+ruzpNUzxDv0u7GkmJYfsQTET8qxnzpzC8qYfCkvLoER29lX42EpIpdQFkHGcFM0d5c/56MD2cjHGQGdWNfDBcDmH1Mapn8ZnWb06t2ztq83SGLl64NjB7rcrJSMgHRZNTIEUhl1izuhBQIWBbQ2Lycq9aHUo3yUOa++nQe6UxiyMZIh/s/flUh3HmS0kUGbd3mK/4oKADgd0RYokAf7NCC1G4BSpmGsZfzSK/TZgxpuhZLzoFWHR/dZYxWBj+qdzR/qZN9ooazlcMlEAKxWCeR0HQYGdQfRCwWbKWTUiYcBksuNzpg8p6Wg6L+2dtoZATWCj3WgmSA1XbdcJYpd6S876xPISLfbehn7+5cYKdemo0GT2ARmSm+2/qGtkd8uQhH01Myc8LqzfAX2F3AS15Trgi2to2bspBGn8kG0MbVMXv7ii334kdxoWN37NccrbtD0AoR827NximdYyZUvkXOu0gcPTk=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(36860700004)(40470700004)(46966006)(921011); DIR:OUT; SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Feb 2024 15:58:55.7975 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 86776544-6508-43a2-466c-08dc33bf2c87
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SA2PEPF000015CB.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB8118
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

From: Tales Aparecida <tales.aparecida@gmail.com>

The fixed31_32 library performs a lot of the mathematical operations
involving fixed-point arithmetic and the conversion of integers to
fixed-point representation.

This unit tests intend to assure the proper functioning of the basic
mathematical operations of fixed-point arithmetic, such as
multiplication, conversion from fractional to fixed-point number,
and more. Use kunit_tool to run:

$ ./tools/testing/kunit/kunit.py run --arch=x86_64 \
	--kunitconfig=drivers/gpu/drm/amd/display/test/kunit

Reviewed-by: David Gow <davidgow@google.com>
Signed-off-by: Tales Aparecida <tales.aparecida@gmail.com>
Signed-off-by: Maíra Canal <mairacanal@riseup.net>
---
 drivers/gpu/drm/amd/display/Kconfig           |  13 +
 drivers/gpu/drm/amd/display/Makefile          |   2 +-
 .../drm/amd/display/test/kunit/.kunitconfig   |   6 +
 .../gpu/drm/amd/display/test/kunit/Makefile   |  12 +
 .../test/kunit/dc/basics/fixpt31_32_test.c    | 232 ++++++++++++++++++
 5 files changed, 264 insertions(+), 1 deletion(-)
 create mode 100644 drivers/gpu/drm/amd/display/test/kunit/.kunitconfig
 create mode 100644 drivers/gpu/drm/amd/display/test/kunit/Makefile
 create mode 100644 drivers/gpu/drm/amd/display/test/kunit/dc/basics/fixpt31_32_test.c

diff --git a/drivers/gpu/drm/amd/display/Kconfig b/drivers/gpu/drm/amd/display/Kconfig
index 901d1961b739..e35eef026097 100644
--- a/drivers/gpu/drm/amd/display/Kconfig
+++ b/drivers/gpu/drm/amd/display/Kconfig
@@ -51,4 +51,17 @@ config DRM_AMD_SECURE_DISPLAY
 	  This option enables the calculation of crc of specific region via
 	  debugfs. Cooperate with specific DMCU FW.
 
+config AMD_DC_BASICS_KUNIT_TEST
+	bool "Enable KUnit tests for the 'basics' sub-component of DAL" if !KUNIT_ALL_TESTS
+	depends on DRM_AMD_DC && KUNIT
+	default KUNIT_ALL_TESTS
+	help
+		Enables unit tests for the Display Core. Only useful for kernel
+		devs running KUnit.
+
+		For more information on KUnit and unit tests in general please refer to
+		the KUnit documentation in Documentation/dev-tools/kunit/.
+
+		If unsure, say N.
+
 endmenu
diff --git a/drivers/gpu/drm/amd/display/Makefile b/drivers/gpu/drm/amd/display/Makefile
index 92a5c5efcf92..5e11ee266028 100644
--- a/drivers/gpu/drm/amd/display/Makefile
+++ b/drivers/gpu/drm/amd/display/Makefile
@@ -45,7 +45,7 @@ subdir-ccflags-y += -I$(FULL_AMD_DISPLAY_PATH)/modules/hdcp
 #TODO: remove when Timing Sync feature is complete
 subdir-ccflags-y += -DBUILD_FEATURE_TIMING_SYNC=0
 
-DAL_LIBS = amdgpu_dm dc	modules/freesync modules/color modules/info_packet modules/power dmub/src
+DAL_LIBS = amdgpu_dm dc	modules/freesync modules/color modules/info_packet modules/power dmub/src test/kunit
 
 DAL_LIBS += modules/hdcp
 
diff --git a/drivers/gpu/drm/amd/display/test/kunit/.kunitconfig b/drivers/gpu/drm/amd/display/test/kunit/.kunitconfig
new file mode 100644
index 000000000000..862e6506ddd3
--- /dev/null
+++ b/drivers/gpu/drm/amd/display/test/kunit/.kunitconfig
@@ -0,0 +1,6 @@
+CONFIG_KUNIT=y
+CONFIG_PCI=y
+CONFIG_DRM=y
+CONFIG_DRM_AMDGPU=y
+CONFIG_DRM_AMD_DC=y
+CONFIG_AMD_DC_BASICS_KUNIT_TEST=y
diff --git a/drivers/gpu/drm/amd/display/test/kunit/Makefile b/drivers/gpu/drm/amd/display/test/kunit/Makefile
new file mode 100644
index 000000000000..84b22ecb98df
--- /dev/null
+++ b/drivers/gpu/drm/amd/display/test/kunit/Makefile
@@ -0,0 +1,12 @@
+# SPDX-License-Identifier: MIT
+#
+# Makefile for the KUnit Tests for DC
+#
+
+ifdef CONFIG_AMD_DC_BASICS_KUNIT_TEST
+	DC_TESTS += dc/basics/fixpt31_32_test.o
+endif
+
+AMD_DAL_DC_TESTS = $(addprefix $(AMDDALPATH)/test/kunit/,$(DC_TESTS))
+
+AMD_DISPLAY_FILES += $(AMD_DAL_DC_TESTS)
diff --git a/drivers/gpu/drm/amd/display/test/kunit/dc/basics/fixpt31_32_test.c b/drivers/gpu/drm/amd/display/test/kunit/dc/basics/fixpt31_32_test.c
new file mode 100644
index 000000000000..2fc489203499
--- /dev/null
+++ b/drivers/gpu/drm/amd/display/test/kunit/dc/basics/fixpt31_32_test.c
@@ -0,0 +1,232 @@
+// SPDX-License-Identifier: MIT
+/* Unit tests for display/include/fixed31_32.h and dc/basics/fixpt31_32.c
+ *
+ * Copyright (C) 2022, Tales Aparecida <tales.aparecida@gmail.com>
+ */
+
+#include <kunit/test.h>
+#include "os_types.h"
+#include "fixed31_32.h"
+
+static const struct fixed31_32 dc_fixpt_minus_one = { -0x100000000LL };
+
+/**
+ * dc_fixpt_from_int_test - KUnit test for dc_fixpt_from_int
+ * @test: represents a running instance of a test.
+ */
+static void dc_fixpt_from_int_test(struct kunit *test)
+{
+	struct fixed31_32 res;
+
+	res = dc_fixpt_from_int(0);
+	KUNIT_EXPECT_EQ(test, res.value, dc_fixpt_zero.value);
+
+	res = dc_fixpt_from_int(1);
+	KUNIT_EXPECT_EQ(test, res.value, dc_fixpt_one.value);
+
+	res = dc_fixpt_from_int(-1);
+	KUNIT_EXPECT_EQ(test, res.value, -dc_fixpt_one.value);
+
+	res = dc_fixpt_from_int(INT_MAX);
+	KUNIT_EXPECT_EQ(test, res.value, 0x7FFFFFFF00000000LL);
+
+	res = dc_fixpt_from_int(INT_MIN);
+	KUNIT_EXPECT_EQ(test, res.value,
+			0x8000000000000000LL); /* implicit negative signal */
+}
+
+/**
+ * dc_fixpt_from_fraction_test - KUnit test for dc_fixpt_from_fraction
+ * @test: represents a running instance of a test.
+ */
+static void dc_fixpt_from_fraction_test(struct kunit *test)
+{
+	struct fixed31_32 res;
+
+	/* Assert signal works as expected */
+	res = dc_fixpt_from_fraction(1LL, 1LL);
+	KUNIT_EXPECT_EQ(test, res.value, dc_fixpt_one.value);
+
+	res = dc_fixpt_from_fraction(-1LL, 1LL);
+	KUNIT_EXPECT_EQ(test, res.value, -dc_fixpt_one.value);
+
+	res = dc_fixpt_from_fraction(1LL, -1LL);
+	KUNIT_EXPECT_EQ(test, res.value, -dc_fixpt_one.value);
+
+	res = dc_fixpt_from_fraction(-1LL, -1LL);
+	KUNIT_EXPECT_EQ(test, res.value, dc_fixpt_one.value);
+
+	/* Assert that the greatest parameter values works as expected */
+	res = dc_fixpt_from_fraction(LLONG_MAX, LLONG_MAX);
+	KUNIT_EXPECT_EQ(test, res.value, dc_fixpt_one.value);
+
+	res = dc_fixpt_from_fraction(LLONG_MIN, LLONG_MIN);
+	KUNIT_EXPECT_EQ(test, res.value, dc_fixpt_one.value);
+
+	/* Edge case using the smallest fraction possible without LSB rounding */
+	res = dc_fixpt_from_fraction(1, 1LL << (FIXED31_32_BITS_PER_FRACTIONAL_PART));
+	KUNIT_EXPECT_EQ(test, res.value, dc_fixpt_epsilon.value);
+
+	/* Edge case using the smallest fraction possible with LSB rounding */
+	res = dc_fixpt_from_fraction(1, 1LL << (FIXED31_32_BITS_PER_FRACTIONAL_PART + 1));
+	KUNIT_EXPECT_EQ(test, res.value, dc_fixpt_epsilon.value);
+
+	/* Assert an nil numerator is a valid input */
+	res = dc_fixpt_from_fraction(0LL, LLONG_MAX);
+	KUNIT_EXPECT_EQ(test, res.value, 0LL);
+
+	/* Edge case using every bit of the decimal part without rounding */
+	res = dc_fixpt_from_fraction(8589934590LL, 8589934592LL);
+	KUNIT_EXPECT_EQ(test, res.value, 0x0FFFFFFFFLL);
+
+	res = dc_fixpt_from_fraction(-8589934590LL, 8589934592LL);
+	KUNIT_EXPECT_EQ(test, res.value, -0x0FFFFFFFFLL);
+
+	/* Edge case using every bit of the decimal part then rounding LSB */
+	res = dc_fixpt_from_fraction(8589934591LL, 8589934592LL);
+	KUNIT_EXPECT_EQ(test, res.value, dc_fixpt_one.value);
+
+	res = dc_fixpt_from_fraction(-8589934591LL, 8589934592LL);
+	KUNIT_EXPECT_EQ(test, res.value, -dc_fixpt_one.value);
+	/*  A repeating decimal in binary representation that doesn't round up the LSB */
+	res = dc_fixpt_from_fraction(4, 3);
+	KUNIT_EXPECT_EQ(test, res.value, 0x0000000155555555LL);
+
+	res = dc_fixpt_from_fraction(-4, 3);
+	KUNIT_EXPECT_EQ(test, res.value, -0x0000000155555555LL);
+
+	/* A repeating decimal in binary representation that rounds up the LSB */
+	res = dc_fixpt_from_fraction(5, 3);
+	KUNIT_EXPECT_EQ(test, res.value, 0x00000001AAAAAAABLL);
+
+	res = dc_fixpt_from_fraction(-5, 3);
+	KUNIT_EXPECT_EQ(test, res.value, -0x00000001AAAAAAABLL);
+}
+
+/**
+ * dc_fixpt_mul_test - KUnit test for dc_fixpt_mul
+ * @test: represents a running instance of a test.
+ */
+static void dc_fixpt_mul_test(struct kunit *test)
+{
+	struct fixed31_32 res;
+	struct fixed31_32 arg;
+
+	/* Assert signal works as expected */
+	res = dc_fixpt_mul(dc_fixpt_one, dc_fixpt_one);
+	KUNIT_EXPECT_EQ(test, res.value, dc_fixpt_one.value);
+
+	res = dc_fixpt_mul(dc_fixpt_minus_one, dc_fixpt_one);
+	KUNIT_EXPECT_EQ(test, res.value, dc_fixpt_minus_one.value);
+
+	res = dc_fixpt_mul(dc_fixpt_one, dc_fixpt_minus_one);
+	KUNIT_EXPECT_EQ(test, res.value, dc_fixpt_minus_one.value);
+
+	res = dc_fixpt_mul(dc_fixpt_minus_one, dc_fixpt_minus_one);
+	KUNIT_EXPECT_EQ(test, res.value, dc_fixpt_one.value);
+
+	/* Assert that the greatest parameter values works as expected */
+	arg.value = LONG_MAX;
+	res = dc_fixpt_mul(arg, dc_fixpt_one);
+	KUNIT_EXPECT_EQ(test, res.value, arg.value);
+
+	arg.value = LONG_MIN;
+	res = dc_fixpt_mul(arg, dc_fixpt_one);
+	KUNIT_EXPECT_EQ(test, res.value, arg.value);
+
+	arg.value = LONG_MAX;
+	res = dc_fixpt_mul(dc_fixpt_one, arg);
+	KUNIT_EXPECT_EQ(test, res.value, arg.value);
+
+	arg.value = LONG_MIN;
+	res = dc_fixpt_mul(dc_fixpt_one, arg);
+	KUNIT_EXPECT_EQ(test, res.value, arg.value);
+
+	/* Assert it doesn't round LSB as expected */
+	arg.value = 0x7FFFFFFF7fffffffLL;
+	res = dc_fixpt_mul(arg, dc_fixpt_epsilon);
+	KUNIT_EXPECT_EQ(test, res.value, 0x000000007FFFFFFF);
+
+	/* Assert it rounds LSB as expected */
+	arg.value = 0x7FFFFFFF80000000LL;
+	res = dc_fixpt_mul(arg, dc_fixpt_epsilon);
+	KUNIT_EXPECT_EQ(test, res.value, 0x0000000080000000);
+}
+
+/**
+ * dc_fixpt_sqr_test - KUnit test for dc_fixpt_sqr
+ * @test: represents a running instance of a test.
+ */
+static void dc_fixpt_sqr_test(struct kunit *test)
+{
+	struct fixed31_32 res;
+	struct fixed31_32 arg;
+
+	arg.value = dc_fixpt_one.value;
+	res = dc_fixpt_sqr(arg);
+	KUNIT_EXPECT_EQ(test, res.value, dc_fixpt_one.value);
+
+	arg.value = dc_fixpt_minus_one.value;
+	res = dc_fixpt_sqr(arg);
+	KUNIT_EXPECT_EQ(test, res.value, dc_fixpt_one.value);
+
+	arg.value = 0;
+	res = dc_fixpt_sqr(arg);
+	KUNIT_EXPECT_EQ(test, res.value, 0);
+
+	/* Test some recognizable values */
+	arg = dc_fixpt_from_int(100);
+	res = dc_fixpt_sqr(arg);
+	KUNIT_EXPECT_EQ(test, res.value, dc_fixpt_from_int(10000).value);
+
+	arg = dc_fixpt_from_fraction(1, 100);
+	res = dc_fixpt_sqr(arg);
+	KUNIT_EXPECT_EQ(test, res.value,
+			dc_fixpt_from_fraction(1, 10000).value);
+
+	/* LSB rounding */
+	arg = dc_fixpt_from_fraction(3, 2);
+	res = dc_fixpt_sqr(arg);
+	KUNIT_EXPECT_EQ(test, res.value,
+			dc_fixpt_from_fraction(9, 4).value + 1LL);
+}
+
+/**
+ * dc_fixpt_recip_test - KUnit test for dc_fixpt_recip
+ * @test: represents a running instance of a test.
+ */
+static void dc_fixpt_recip_test(struct kunit *test)
+{
+	struct fixed31_32 res;
+	struct fixed31_32 arg;
+
+	/* Assert 1/1 works as expected */
+	res = dc_fixpt_recip(dc_fixpt_one);
+	KUNIT_EXPECT_EQ(test, res.value, dc_fixpt_one.value);
+
+	/* Assert smallest parameters work as expected. */
+	arg.value = 3LL;
+	res = dc_fixpt_recip(arg);
+	KUNIT_EXPECT_EQ(test, res.value, 0x5555555555555555LL);
+
+	arg.value = -3LL;
+	res = dc_fixpt_recip(arg);
+	KUNIT_EXPECT_EQ(test, res.value, -0x5555555555555555LL);
+}
+
+static struct kunit_case dc_basics_fixpt31_32_test_cases[] = {
+	KUNIT_CASE(dc_fixpt_from_int_test),
+	KUNIT_CASE(dc_fixpt_from_fraction_test),
+	KUNIT_CASE(dc_fixpt_mul_test),
+	KUNIT_CASE(dc_fixpt_sqr_test),
+	KUNIT_CASE(dc_fixpt_recip_test),
+	{}
+};
+
+static struct kunit_suite dc_basics_fixpt31_32_test_suite = {
+	.name = "dc_basics_fixpt31_32",
+	.test_cases = dc_basics_fixpt31_32_test_cases,
+};
+
+kunit_test_suites(&dc_basics_fixpt31_32_test_suite);
+
-- 
2.43.0

