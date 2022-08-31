Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 87E765A8443
	for <lists+dri-devel@lfdr.de>; Wed, 31 Aug 2022 19:25:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6EADA10E4AE;
	Wed, 31 Aug 2022 17:25:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0.riseup.net (mx0.riseup.net [198.252.153.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4AF2810E4AD;
 Wed, 31 Aug 2022 17:24:57 +0000 (UTC)
Received: from fews2.riseup.net (fews2-pn.riseup.net [10.0.1.84])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
 client-signature RSA-PSS (2048 bits) client-digest SHA256)
 (Client CN "mail.riseup.net", Issuer "R3" (not verified))
 by mx0.riseup.net (Postfix) with ESMTPS id 4MHrf023Pvz9sl2;
 Wed, 31 Aug 2022 17:24:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=riseup.net; s=squak;
 t=1661966696; bh=b6CU+toJ1PQ9W1Moy4kQd795kcFuuGTIbfVFcq1JfhM=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Hh+0iPH8I9l83r06gwoiZfPs+YsJ8+yNxrdnQl4UfvImHhxD1ZEaMT+121sAUznZ1
 6eCmXJ82AJ9ghPoECs+l3H4Ovzm/wmXwewD+q7IAN0tH6XUbTZzna1gCo2/LV5oE4r
 BX1yv5sRKxauT0jfsqiyBHJc4cCxH3w2GCz7+EYA=
X-Riseup-User-ID: F4261B9C7E7AB412A717A298C19C6718E84D43E1E9EA51AD2CEE2D300158CD4A
Received: from [127.0.0.1] (localhost [127.0.0.1])
 by fews2.riseup.net (Postfix) with ESMTPSA id 4MHrdr0jCJz1y9N;
 Wed, 31 Aug 2022 17:24:47 +0000 (UTC)
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
Subject: [PATCH v2 3/8] drm/amd/display: Introduce KUnit tests to
 display_rq_dlg_calc_20
Date: Wed, 31 Aug 2022 14:22:34 -0300
Message-Id: <20220831172239.344446-4-mairacanal@riseup.net>
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

From: Isabella Basso <isabbasso@riseup.net>

This adds tests to the bit encoding format verification functions on the
file. They're meant to be simpler so as to provide a proof of concept on
testing DML code.

Signed-off-by: Isabella Basso <isabbasso@riseup.net>
Signed-off-by: Maíra Canal <mairacanal@riseup.net>
---
 drivers/gpu/drm/amd/display/Kconfig           |  13 ++
 .../dc/dml/dcn20/display_rq_dlg_calc_20.c     |   4 +
 .../gpu/drm/amd/display/tests/.kunitconfig    |   1 +
 .../dml/dcn20/display_rq_dlg_calc_20_test.c   | 124 ++++++++++++++++++
 4 files changed, 142 insertions(+)
 create mode 100644 drivers/gpu/drm/amd/display/tests/dc/dml/dcn20/display_rq_dlg_calc_20_test.c

diff --git a/drivers/gpu/drm/amd/display/Kconfig b/drivers/gpu/drm/amd/display/Kconfig
index ce882a8c24f5..039227baedfa 100644
--- a/drivers/gpu/drm/amd/display/Kconfig
+++ b/drivers/gpu/drm/amd/display/Kconfig
@@ -67,6 +67,19 @@ config DCE_KUNIT_TEST
 
 		If unsure, say N.
 
+config DML_KUNIT_TEST
+	bool "Run all KUnit tests for DML" if !KUNIT_ALL_TESTS
+	depends on DRM_AMD_DC_DCN && KUNIT
+	default KUNIT_ALL_TESTS
+	help
+		Enables unit tests for the Display Controller Engine. Only useful for kernel
+		devs running KUnit.
+
+		For more information on KUnit and unit tests in general please refer to
+		the KUnit documentation in Documentation/dev-tools/kunit/.
+
+		If unsure, say N.
+
 config AMD_DC_BASICS_KUNIT_TEST
 	bool "Enable KUnit tests for the 'basics' sub-component of DAL" if !KUNIT_ALL_TESTS
 	depends on DRM_AMD_DC && KUNIT
diff --git a/drivers/gpu/drm/amd/display/dc/dml/dcn20/display_rq_dlg_calc_20.c b/drivers/gpu/drm/amd/display/dc/dml/dcn20/display_rq_dlg_calc_20.c
index 548cdef8a8ad..ab688c9ba0d1 100644
--- a/drivers/gpu/drm/amd/display/dc/dml/dcn20/display_rq_dlg_calc_20.c
+++ b/drivers/gpu/drm/amd/display/dc/dml/dcn20/display_rq_dlg_calc_20.c
@@ -1683,3 +1683,7 @@ static void calculate_ttu_cursor(struct display_mode_lib *mode_lib,
 		ASSERT(*refcyc_per_req_delivery_cur < dml_pow(2, 13));
 	}
 }
+
+#if IS_ENABLED(CONFIG_DML_KUNIT_TEST)
+#include "../../../tests/dc/dml/dcn20/display_rq_dlg_calc_20_test.c"
+#endif
diff --git a/drivers/gpu/drm/amd/display/tests/.kunitconfig b/drivers/gpu/drm/amd/display/tests/.kunitconfig
index 7a58f75a8dfc..eb6f81601757 100644
--- a/drivers/gpu/drm/amd/display/tests/.kunitconfig
+++ b/drivers/gpu/drm/amd/display/tests/.kunitconfig
@@ -5,3 +5,4 @@ CONFIG_DRM_AMDGPU=y
 CONFIG_DRM_AMD_DC=y
 CONFIG_AMD_DC_BASICS_KUNIT_TEST=y
 CONFIG_DCE_KUNIT_TEST=y
+CONFIG_DML_KUNIT_TEST=y
diff --git a/drivers/gpu/drm/amd/display/tests/dc/dml/dcn20/display_rq_dlg_calc_20_test.c b/drivers/gpu/drm/amd/display/tests/dc/dml/dcn20/display_rq_dlg_calc_20_test.c
new file mode 100644
index 000000000000..e6d3e356205c
--- /dev/null
+++ b/drivers/gpu/drm/amd/display/tests/dc/dml/dcn20/display_rq_dlg_calc_20_test.c
@@ -0,0 +1,124 @@
+// SPDX-License-Identifier: MIT
+/*
+ * KUnit tests for dml/dcn20/display_rq_dlg_calc_20.c
+ *
+ * Copyright (c) 2022, Isabella Basso <isabbasso@riseup.net>
+ */
+
+#include <kunit/test.h>
+#include "dml/display_mode_lib.h"
+
+/**
+ * get_bytes_per_element_test - KUnit test for get_bytes_per_element
+ * @test: represents a running instance of a test.
+ */
+static void get_bytes_per_element_test(struct kunit *test)
+{
+	/* last numbers should tell us the horizontal 4-element region binary
+	 * size N used for subsampling, thus giving us N/8 bytes per element
+	 */
+	/* note that 4:4:4 is not subsampled */
+	KUNIT_ASSERT_EQ(test, get_bytes_per_element(dm_444_16, false), 2);
+	KUNIT_ASSERT_EQ(test, get_bytes_per_element(dm_444_32, false), 4);
+	KUNIT_ASSERT_EQ(test, get_bytes_per_element(dm_444_64, false), 8);
+
+	/* dcn20 doesn't support bit depths over 10b */
+	KUNIT_ASSERT_EQ(test, get_bytes_per_element(dm_420_12, false), 0);
+	KUNIT_ASSERT_EQ(test, get_bytes_per_element(dm_420_12, true), 0);
+
+	/* dm_444_XX are not dual plane */
+	KUNIT_ASSERT_EQ(test, get_bytes_per_element(dm_444_16, true), 0);
+	KUNIT_ASSERT_EQ(test, get_bytes_per_element(dm_444_32, true), 0);
+	KUNIT_ASSERT_EQ(test, get_bytes_per_element(dm_444_64, true), 0);
+
+	/* in the dm_42* values, last numbers specify bit depth, demanding we
+	 * treat chroma and luma channels separately
+	 */
+	/* thus we'll now have ceil(N/8) bytes for luma */
+	KUNIT_ASSERT_EQ(test, get_bytes_per_element(dm_420_8, false), 1);
+	KUNIT_ASSERT_EQ(test, get_bytes_per_element(dm_420_10, false), 2);
+	/* and double the luma value for accommodating blue and red chroma
+	 * channels
+	 */
+	KUNIT_ASSERT_EQ(test, get_bytes_per_element(dm_420_8, true), 2);
+	KUNIT_ASSERT_EQ(test, get_bytes_per_element(dm_420_10, true), 4);
+
+	/* monochrome encodings should mirror non-subsampled variants */
+	KUNIT_ASSERT_EQ(test, get_bytes_per_element(dm_mono_8, false),
+			get_bytes_per_element(dm_444_8, false));
+	KUNIT_ASSERT_EQ(test, get_bytes_per_element(dm_mono_16, false),
+			get_bytes_per_element(dm_444_16, false));
+	KUNIT_ASSERT_EQ(test, get_bytes_per_element(dm_mono_16, true), 0);
+
+	/* dcn20 doesn't support 4:2:2 chroma subsampling */
+	KUNIT_ASSERT_EQ(test, get_bytes_per_element(dm_422_8, false), 0);
+	KUNIT_ASSERT_EQ(test, get_bytes_per_element(dm_422_8, true), 0);
+	KUNIT_ASSERT_EQ(test, get_bytes_per_element(dm_422_10, false), 0);
+	KUNIT_ASSERT_EQ(test, get_bytes_per_element(dm_422_10, true), 0);
+
+	/* dcn20 doesn't support RGBE encodings */
+	KUNIT_ASSERT_EQ(test, get_bytes_per_element(dm_rgbe, false), 0);
+	KUNIT_ASSERT_EQ(test, get_bytes_per_element(dm_rgbe, true), 0);
+	KUNIT_ASSERT_EQ(test, get_bytes_per_element(dm_rgbe_alpha, false), 0);
+	KUNIT_ASSERT_EQ(test, get_bytes_per_element(dm_rgbe_alpha, true), 0);
+
+	/* as in the first values, _8 here represents horizontal binary length */
+	KUNIT_ASSERT_EQ(test, get_bytes_per_element(dm_444_8, false), 1);
+	/* in a non-subsampled monochrome encoding chroma and luma should be the
+	 * same length
+	 */
+	KUNIT_ASSERT_EQ(test, get_bytes_per_element(dm_444_8, false),
+			get_bytes_per_element(dm_444_8, true));
+
+	/* as dm_mono_8 == dm_444_8, it must behave the same way */
+	KUNIT_ASSERT_EQ(test, get_bytes_per_element(dm_mono_8, false),
+			get_bytes_per_element(dm_mono_8, true));
+}
+
+/**
+ * is_dual_plane_test - KUnit test for is_dual_plane
+ * @test: represents a running instance of a test.
+ */
+static void is_dual_plane_test(struct kunit *test)
+{
+	/* strictly speaking monochrome formats are not dual plane, but they're
+	 * included here for completeness
+	 */
+	int source_format_count = 11;
+
+	for (int i = 0; i < source_format_count; i++) {
+		/* dcn20 doesn't support other dual plane formats */
+		if (i == 3 || i == 4)
+			KUNIT_ASSERT_TRUE(test, is_dual_plane(i));
+		else
+			KUNIT_ASSERT_FALSE(test, is_dual_plane(i));
+	}
+}
+
+/**
+ * get_blk_size_bytes_test - KUnit test for get_blk_size_bytes
+ * @test: represents a running instance of a test.
+ */
+static void get_blk_size_bytes_test(struct kunit *test)
+{
+	/* corresponds to 4^4 kB tiles */
+	KUNIT_ASSERT_EQ(test, get_blk_size_bytes(dm_256k_tile), 256 * 1024);
+	/* corresponds to 4^3 kB tiles */
+	KUNIT_ASSERT_EQ(test, get_blk_size_bytes(dm_64k_tile), 64 * 1024);
+	/* corresponds to 4^1 kB tiles */
+	KUNIT_ASSERT_EQ(test, get_blk_size_bytes(dm_4k_tile), 4 * 1024);
+}
+
+static struct kunit_case dcn20_rq_dlg_calc_20_test_cases[] = {
+	KUNIT_CASE(get_bytes_per_element_test),
+	KUNIT_CASE(is_dual_plane_test),
+	KUNIT_CASE(get_blk_size_bytes_test),
+	{  }
+};
+
+static struct kunit_suite dcn20_rq_dlg_calc_20_test_suite = {
+	.name = "display_rq_dlg_calc_20",
+	.test_cases = dcn20_rq_dlg_calc_20_test_cases,
+};
+
+kunit_test_suites(&dcn20_rq_dlg_calc_20_test_suite);
-- 
2.37.2

