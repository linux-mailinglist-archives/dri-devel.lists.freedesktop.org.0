Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 46B745A8440
	for <lists+dri-devel@lfdr.de>; Wed, 31 Aug 2022 19:24:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 61D9710E4AC;
	Wed, 31 Aug 2022 17:24:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0.riseup.net (mx0.riseup.net [198.252.153.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 80D0E10E4A8;
 Wed, 31 Aug 2022 17:24:36 +0000 (UTC)
Received: from fews2.riseup.net (fews2-pn.riseup.net [10.0.1.84])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
 client-signature RSA-PSS (2048 bits) client-digest SHA256)
 (Client CN "mail.riseup.net", Issuer "R3" (not verified))
 by mx0.riseup.net (Postfix) with ESMTPS id 4MHrdb4Dcrz9sl2;
 Wed, 31 Aug 2022 17:24:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=riseup.net; s=squak;
 t=1661966676; bh=flCjGxNlGjTQFaxGxdJK6dtcv8XzE26le6n0KxjJIPk=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=IOhF6NMSvqMlVecjMGQguTxGq37p9pBagsXAJI9tKI5CZ3CZC2WqOymXuYQDwNMmG
 y9U+0dDsfXvdXcmyrJt/7+JVbOSKbnn0T528n2hLzc1KsFNNdYrjo+u+eLb5AJDT/k
 ahJJ2KmKwR5jL/Jk9xtZ+mxLGLJgD5hiUgfeznx8=
X-Riseup-User-ID: B6ECC221EFF5A8A0C650DB54E528003EA82F94630280531D0DD445134E943241
Received: from [127.0.0.1] (localhost [127.0.0.1])
 by fews2.riseup.net (Postfix) with ESMTPSA id 4MHrdR5jM8z1y9N;
 Wed, 31 Aug 2022 17:24:27 +0000 (UTC)
From: =?UTF-8?q?Ma=C3=ADra=20Canal?= <mairacanal@riseup.net>
To: Alex Deucher <alexander.deucher@amd.com>, christian.koenig@amd.com,
 Xinhui.Pan@amd.com, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Jonathan Corbet <corbet@lwn.net>,
 Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 Daniel Latypov <dlatypov@google.com>, David Gow <davidgow@google.com>
Subject: [PATCH v2 2/8] drm/amd/display: Introduce KUnit tests to the bw_fixed
 library
Date: Wed, 31 Aug 2022 14:22:33 -0300
Message-Id: <20220831172239.344446-3-mairacanal@riseup.net>
In-Reply-To: <20220831172239.344446-1-mairacanal@riseup.net>
References: <20220831172239.344446-1-mairacanal@riseup.net>
MIME-Version: 1.0
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
Cc: kunit-dev@googlegroups.com, magalilemes00@gmail.com,
 tales.aparecida@gmail.com, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, mwen@igalia.com,
 =?UTF-8?q?Ma=C3=ADra=20Canal?= <mairacanal@riseup.net>,
 dri-devel@lists.freedesktop.org, Isabella Basso <isabbasso@riseup.net>,
 andrealmeid@riseup.net
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

KUnit unifies the test structure and provides helper tools that simplify
the development of tests. Basic use case allows running tests as regular
processes, which makes easier to run unit tests on a development machine
and to integrate the tests in a CI system.

This commit introduces a unit test to the bw_fixed library, which
performs a lot of the mathematical operations involving fixed-point
arithmetic and the conversion of integers to fixed-point representation
inside the Display Mode Library.

As fixed-point representation is the base foundation of the DML calcs
operations, this unit tests intend to assure the proper functioning of
the basic mathematical operations of fixed-point arithmetic, such as
multiplication, conversion from fractional to fixed-point number, and
more.  You can run it with: ./tools/testing/kunit/kunit.py run \
	--arch=x86_64 \
	--kunitconfig=drivers/gpu/drm/amd/display/tests/

Co-developed-by: Magali Lemes <magalilemes00@gmail.com>
Signed-off-by: Magali Lemes <magalilemes00@gmail.com>
Co-developed-by: Tales Aparecida <tales.aparecida@gmail.com>
Signed-off-by: Tales Aparecida <tales.aparecida@gmail.com>
Signed-off-by: Maíra Canal <mairacanal@riseup.net>
---
 drivers/gpu/drm/amd/display/Kconfig           |  12 +
 .../drm/amd/display/dc/dml/calcs/bw_fixed.c   |   3 +
 .../gpu/drm/amd/display/tests/.kunitconfig    |   3 +-
 .../tests/dc/dml/calcs/bw_fixed_test.c        | 323 ++++++++++++++++++
 4 files changed, 340 insertions(+), 1 deletion(-)
 create mode 100644 drivers/gpu/drm/amd/display/tests/dc/dml/calcs/bw_fixed_test.c

diff --git a/drivers/gpu/drm/amd/display/Kconfig b/drivers/gpu/drm/amd/display/Kconfig
index cc44cfe88607..ce882a8c24f5 100644
--- a/drivers/gpu/drm/amd/display/Kconfig
+++ b/drivers/gpu/drm/amd/display/Kconfig
@@ -54,6 +54,18 @@ config DRM_AMD_SECURE_DISPLAY
             of crc of specific region via debugfs.
             Cooperate with specific DMCU FW.
 
+config DCE_KUNIT_TEST
+	bool "Run all KUnit tests for DCE" if !KUNIT_ALL_TESTS
+	depends on DRM_AMD_DC && KUNIT
+	default KUNIT_ALL_TESTS
+	help
+		Enables unit tests for the Display Controller Engine. Only useful for kernel
+		devs running KUnit.
+
+		For more information on KUnit and unit tests in general please refer to
+		the KUnit documentation in Documentation/dev-tools/kunit/.
+
+		If unsure, say N.
 
 config AMD_DC_BASICS_KUNIT_TEST
 	bool "Enable KUnit tests for the 'basics' sub-component of DAL" if !KUNIT_ALL_TESTS
diff --git a/drivers/gpu/drm/amd/display/dc/dml/calcs/bw_fixed.c b/drivers/gpu/drm/amd/display/dc/dml/calcs/bw_fixed.c
index 3aa8dd0acd5e..79ef53ea2480 100644
--- a/drivers/gpu/drm/amd/display/dc/dml/calcs/bw_fixed.c
+++ b/drivers/gpu/drm/amd/display/dc/dml/calcs/bw_fixed.c
@@ -187,3 +187,6 @@ struct bw_fixed bw_mul(const struct bw_fixed arg1, const struct bw_fixed arg2)
 	return res;
 }
 
+#if IS_ENABLED(CONFIG_DCE_KUNIT_TEST)
+#include "../../../tests/dc/dml/calcs/bw_fixed_test.c"
+#endif
diff --git a/drivers/gpu/drm/amd/display/tests/.kunitconfig b/drivers/gpu/drm/amd/display/tests/.kunitconfig
index 60f2ff8158f5..7a58f75a8dfc 100644
--- a/drivers/gpu/drm/amd/display/tests/.kunitconfig
+++ b/drivers/gpu/drm/amd/display/tests/.kunitconfig
@@ -3,4 +3,5 @@ CONFIG_PCI=y
 CONFIG_DRM=y
 CONFIG_DRM_AMDGPU=y
 CONFIG_DRM_AMD_DC=y
-CONFIG_AMD_DC_BASICS_KUNIT_TEST=y
\ No newline at end of file
+CONFIG_AMD_DC_BASICS_KUNIT_TEST=y
+CONFIG_DCE_KUNIT_TEST=y
diff --git a/drivers/gpu/drm/amd/display/tests/dc/dml/calcs/bw_fixed_test.c b/drivers/gpu/drm/amd/display/tests/dc/dml/calcs/bw_fixed_test.c
new file mode 100644
index 000000000000..1369da49f444
--- /dev/null
+++ b/drivers/gpu/drm/amd/display/tests/dc/dml/calcs/bw_fixed_test.c
@@ -0,0 +1,323 @@
+// SPDX-License-Identifier: MIT
+/*
+ * KUnit tests for dml/calcs/bw_fixed.h
+ *
+ * Copyright (C) 2022, Magali Lemes <magalilemes00@gmail.com>
+ * Copyright (C) 2022, Maíra Canal <mairacanal@riseup.net>
+ * Copyright (C) 2022, Tales Aparecida <tales.aparecida@gmail.com>
+ */
+
+#include <kunit/test.h>
+#include <drm/drm_util.h>
+#include "bw_fixed.h"
+
+/**
+ * DOC: Unit tests for AMDGPU DML calcs/bw_fixed.h
+ *
+ * bw_fixed.h performs a lot of the mathematical operations involving
+ * fixed-point arithmetic and the conversion of integers to fixed-point
+ * representation.
+ *
+ * As fixed-point representation is the base foundation of the DML calcs
+ * operations, these tests intend to assure the proper functioning of the
+ * basic mathematical operations of fixed-point arithmetic, such as
+ * multiplication, conversion from fractional to fixed-point number, and more.
+ *
+ */
+
+/**
+ * abs_i64_test - KUnit test for abs_i64
+ * @test: represents a running instance of a test.
+ */
+static void abs_i64_test(struct kunit *test)
+{
+	KUNIT_EXPECT_EQ(test, 0ULL, abs_i64(0LL));
+
+	/* Argument type limits */
+	KUNIT_EXPECT_EQ(test, (uint64_t)MAX_I64, abs_i64(MAX_I64));
+	KUNIT_EXPECT_EQ(test, (uint64_t)MAX_I64 + 1, abs_i64(MIN_I64));
+}
+
+/**
+ * bw_int_to_fixed_nonconst_test - KUnit test for bw_int_to_fixed_nonconst
+ * @test: represents a running instance of a test.
+ */
+static void bw_int_to_fixed_nonconst_test(struct kunit *test)
+{
+	struct bw_fixed res;
+
+	/* Add BW_FIXED_BITS_PER_FRACTIONAL_PART trailing 0s to binary number */
+	res = bw_int_to_fixed_nonconst(1000);          /* 0x3E8 */
+	KUNIT_EXPECT_EQ(test, 16777216000, res.value); /* 0x3E8000000 */
+
+	res = bw_int_to_fixed_nonconst(-1000);          /* -0x3E8 */
+	KUNIT_EXPECT_EQ(test, -16777216000, res.value); /* -0x3E8000000 */
+
+	res = bw_int_to_fixed_nonconst(0LL);
+	KUNIT_EXPECT_EQ(test, 0, res.value);
+
+	/**
+	 * Test corner cases, as the function's argument has to be an int64_t
+	 * between BW_FIXED_MIN_I32 and BW_FIXED_MAX_I32.
+	 */
+	res = bw_int_to_fixed_nonconst(BW_FIXED_MAX_I32 - 1);  /* 0x7FFFFFFFFE */
+	KUNIT_EXPECT_EQ(test, 9223372036821221376, res.value); /* 0x7FFFFFFFFE000000 */
+
+	res = bw_int_to_fixed_nonconst(BW_FIXED_MIN_I32 + 1);   /* -0x7FFFFFFFFF */
+	KUNIT_EXPECT_EQ(test, -9223372036837998592, res.value); /* -0x7FFFFFFFFF000000 */
+}
+
+/**
+ * bw_frc_to_fixed_test - KUnit test for bw_frc_to_fixed
+ * @test: represents a running instance of a test.
+ */
+static void bw_frc_to_fixed_test(struct kunit *test)
+{
+	struct bw_fixed res;
+
+	/* Extreme scenarios */
+
+	/* A fraction of N/N should result in "1.0" */
+	res = bw_frc_to_fixed(MAX_I64, MAX_I64);
+	KUNIT_EXPECT_EQ(test, 1LL << BW_FIXED_BITS_PER_FRACTIONAL_PART, res.value);
+
+	res = bw_frc_to_fixed(1, MAX_I64);
+	KUNIT_EXPECT_EQ(test, 0LL, res.value);
+
+	res = bw_frc_to_fixed(0, MAX_I64);
+	KUNIT_EXPECT_EQ(test, 0LL, res.value);
+
+	/* Turn a repeating decimal to the fixed-point representation */
+
+	/* A repeating decimal that doesn't round up the LSB */
+	res = bw_frc_to_fixed(4, 3);
+	KUNIT_EXPECT_EQ(test, 22369621LL, res.value);     /* 0x1555555 */
+
+	res = bw_frc_to_fixed(-4, 3);
+	KUNIT_EXPECT_EQ(test, -22369621LL, res.value);    /* -0x1555555 */
+
+	res = bw_frc_to_fixed(99999997, 100000000);
+	KUNIT_EXPECT_EQ(test, 16777215LL, res.value);     /* 0x0FFFFFF */
+
+	/* A repeating decimal that rounds up the MSB */
+	res = bw_frc_to_fixed(5, 3);
+	KUNIT_EXPECT_EQ(test, 27962027LL, res.value);     /* 0x1AAAAAB */
+
+	res = bw_frc_to_fixed(-5, 3);
+	KUNIT_EXPECT_EQ(test, -27962027LL, res.value);    /* -0x1AAAAAB */
+
+	res = bw_frc_to_fixed(99999998, 100000000);
+	KUNIT_EXPECT_EQ(test, 1LL << BW_FIXED_BITS_PER_FRACTIONAL_PART, res.value);
+
+	/* Turn a terminating decimal to the fixed-point representation */
+	res = bw_frc_to_fixed(62609, 100);
+	KUNIT_EXPECT_EQ(test, 10504047165LL, res.value);  /* 0X272170A3D */
+
+	res = bw_frc_to_fixed(-62609, 100);
+	KUNIT_EXPECT_EQ(test, -10504047165LL, res.value); /* -0X272170A3D */
+}
+
+/**
+ * bw_floor2_test - KUnit test for bw_floor2
+ * @test: represents a running instance of a test.
+ */
+static void bw_floor2_test(struct kunit *test)
+{
+	struct bw_fixed arg;
+	struct bw_fixed significance;
+	struct bw_fixed res;
+
+	/* Round 10 down to the nearest multiple of 3 */
+	arg.value = 10;
+	significance.value = 3;
+	res = bw_floor2(arg, significance);
+	KUNIT_EXPECT_EQ(test, 9, res.value);
+
+	/* Round 10 down to the nearest multiple of 5 */
+	arg.value = 10;
+	significance.value = 5;
+	res = bw_floor2(arg, significance);
+	KUNIT_EXPECT_EQ(test, 10, res.value);
+
+	/* Round 100 down to the nearest multiple of 7 */
+	arg.value = 100;
+	significance.value = 7;
+	res = bw_floor2(arg, significance);
+	KUNIT_EXPECT_EQ(test, 98, res.value);
+
+	/* Round an integer down to its nearest multiple should return itself */
+	arg.value = MAX_I64;
+	significance.value = MAX_I64;
+	res = bw_floor2(arg, significance);
+	KUNIT_EXPECT_EQ(test, MAX_I64, res.value);
+
+	arg.value = MIN_I64;
+	significance.value = MIN_I64;
+	res = bw_floor2(arg, significance);
+	KUNIT_EXPECT_EQ(test, MIN_I64, res.value);
+
+	/* Value is a multiple of significance, result should be value */
+	arg.value = MAX_I64;
+	significance.value = MIN_I64 + 1;
+	res = bw_floor2(arg, significance);
+	KUNIT_EXPECT_EQ(test, MAX_I64, res.value);
+
+	/* Round 0 down to the nearest multiple of any number should return 0 */
+	arg.value = 0;
+	significance.value = MAX_I64;
+	res = bw_floor2(arg, significance);
+	KUNIT_EXPECT_EQ(test, 0, res.value);
+
+	arg.value = 0;
+	significance.value = MIN_I64;
+	res = bw_floor2(arg, significance);
+	KUNIT_EXPECT_EQ(test, 0, res.value);
+}
+
+/**
+ * bw_ceil2_test - KUnit test for bw_ceil2
+ * @test: represents a running instance of a test.
+ */
+static void bw_ceil2_test(struct kunit *test)
+{
+	struct bw_fixed arg;
+	struct bw_fixed significance;
+	struct bw_fixed res;
+
+	/* Round 10 up to the nearest multiple of 3 */
+	arg.value = 10;
+	significance.value = 3;
+	res = bw_ceil2(arg, significance);
+	KUNIT_EXPECT_EQ(test, 12, res.value);
+
+	/* Round 10 up to the nearest multiple of 5 */
+	arg.value = 10;
+	significance.value = 5;
+	res = bw_ceil2(arg, significance);
+	KUNIT_EXPECT_EQ(test, 10, res.value);
+
+	/* Round 100 up to the nearest multiple of 7 */
+	arg.value = 100;
+	significance.value = 7;
+	res = bw_ceil2(arg, significance);
+	KUNIT_EXPECT_EQ(test, 105, res.value);
+
+	/* Round an integer up to its nearest multiple should return itself */
+	arg.value = MAX_I64;
+	significance.value = MAX_I64;
+	res = bw_ceil2(arg, significance);
+	KUNIT_EXPECT_EQ(test, MAX_I64, res.value);
+
+	arg.value = MIN_I64 + 1;
+	significance.value = MIN_I64 + 1;
+	res = bw_ceil2(arg, significance);
+	KUNIT_EXPECT_EQ(test, MIN_I64 + 1, res.value);
+
+	/* Value is a multiple of significance, result should be value */
+	arg.value = MAX_I64;
+	significance.value = MIN_I64 + 1;
+	res = bw_ceil2(arg, significance);
+	KUNIT_EXPECT_EQ(test, MAX_I64, res.value);
+
+	/* Round 0 up to the nearest multiple of any number should return 0 */
+	arg.value = 0;
+	significance.value = MAX_I64;
+	res = bw_ceil2(arg, significance);
+	KUNIT_EXPECT_EQ(test, 0, res.value);
+
+	arg.value = 0;
+	significance.value = MIN_I64;
+	res = bw_ceil2(arg, significance);
+	KUNIT_EXPECT_EQ(test, 0, res.value);
+}
+
+/**
+ * bw_mul_test - KUnit test for bw_mul
+ * @test: represents a running instance of a test.
+ */
+static void bw_mul_test(struct kunit *test)
+{
+	struct bw_fixed arg1;
+	struct bw_fixed arg2;
+	struct bw_fixed res;
+	struct bw_fixed expected;
+
+	/* Extreme scenario */
+	arg1.value = MAX_I64;
+	arg2.value = MIN_I64;
+	res = bw_mul(arg1, arg2);
+	KUNIT_EXPECT_EQ(test, BW_FIXED_MAX_I32 + 1, res.value);
+
+	/* Testing multiplication property: x * 1 = x */
+	arg1.value = 1;
+	arg2.value = MAX_I64;
+	res = bw_mul(arg1, arg2);
+	KUNIT_EXPECT_EQ(test, BW_FIXED_MAX_I32 + 1, res.value);
+
+	arg1.value = 1;
+	arg2.value = MIN_I64;
+	res = bw_mul(arg1, arg2);
+	KUNIT_EXPECT_EQ(test, BW_FIXED_MIN_I32, res.value);
+
+	/* Testing multiplication property: x * 0 = 0 */
+	arg1.value = 0;
+	arg2.value = 0;
+	res = bw_mul(arg1, arg2);
+	KUNIT_EXPECT_EQ(test, 0, res.value);
+
+	arg1.value = 0;
+	arg2.value = MAX_I64;
+	res = bw_mul(arg1, arg2);
+	KUNIT_EXPECT_EQ(test, 0, res.value);
+
+	arg1.value = 0;
+	arg2.value = MIN_I64;
+	res = bw_mul(arg1, arg2);
+	KUNIT_EXPECT_EQ(test, 0, res.value);
+
+	/* Testing multiplication between integers */
+	res = bw_mul(bw_int_to_fixed(8), bw_int_to_fixed(10));
+	KUNIT_EXPECT_EQ(test, 1342177280LL, res.value); /* 0x50000000 */
+
+	res = bw_mul(bw_int_to_fixed(10), bw_int_to_fixed(5));
+	KUNIT_EXPECT_EQ(test, 838860800LL, res.value); /* 0x32000000 */
+
+	res = bw_mul(bw_int_to_fixed(-10), bw_int_to_fixed(7));
+	KUNIT_EXPECT_EQ(test, -1174405120LL, res.value); /* -0x46000000 */
+
+	/* Testing multiplication between fractions and integers */
+	res = bw_mul(bw_frc_to_fixed(4, 3), bw_int_to_fixed(3));
+	expected = bw_int_to_fixed(4);
+
+	/*
+	 * As bw_frc_to_fixed(4, 3) didn't round up the fixed-point representation,
+	 * the expected must be subtracted by 1.
+	 */
+	KUNIT_EXPECT_EQ(test, expected.value - 1, res.value);
+
+	res = bw_mul(bw_frc_to_fixed(5, 3), bw_int_to_fixed(3));
+	expected = bw_int_to_fixed(5);
+
+	/*
+	 * As bw_frc_to_fixed(5, 3) rounds up the fixed-point representation,
+	 * the expected must be added by 1.
+	 */
+	KUNIT_EXPECT_EQ(test, expected.value + 1, res.value);
+}
+
+static struct kunit_case bw_fixed_test_cases[] = {
+	KUNIT_CASE(abs_i64_test),
+	KUNIT_CASE(bw_int_to_fixed_nonconst_test),
+	KUNIT_CASE(bw_frc_to_fixed_test),
+	KUNIT_CASE(bw_floor2_test),
+	KUNIT_CASE(bw_ceil2_test),
+	KUNIT_CASE(bw_mul_test),
+	{  }
+};
+
+static struct kunit_suite bw_fixed_test_suite = {
+	.name = "dml_calcs_bw_fixed",
+	.test_cases = bw_fixed_test_cases,
+};
+
+kunit_test_suites(&bw_fixed_test_suite);
-- 
2.37.2

