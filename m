Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 356A15A8450
	for <lists+dri-devel@lfdr.de>; Wed, 31 Aug 2022 19:26:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D6C3610E4B8;
	Wed, 31 Aug 2022 17:25:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.riseup.net (mx1.riseup.net [198.252.153.129])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B01210E4B6;
 Wed, 31 Aug 2022 17:25:38 +0000 (UTC)
Received: from fews2.riseup.net (fews2-pn.riseup.net [10.0.1.84])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
 client-signature RSA-PSS (2048 bits) client-digest SHA256)
 (Client CN "mail.riseup.net", Issuer "R3" (not verified))
 by mx1.riseup.net (Postfix) with ESMTPS id 4MHrfn12QJzDqVh;
 Wed, 31 Aug 2022 17:25:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=riseup.net; s=squak;
 t=1661966737; bh=Zl2DbSptfwvJ6z4ghhCleWXTJO/O1HiPPh6AzZvhaUk=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=GhdYE+NL83iyUQmtUjTX8NogkPtwjs4LhK3hA0jEx1WRItCQLE8QwGVWx8mdJp7U6
 HiOEGKJ32dK6kG0AdbgsVHdYETgB6xv9cHptBUsUqD+cmuXPqu11NnRClpGOI0CLlu
 c2egzyRYDX3BGZ3h/rUKb9MV2vqU1yvnQJnZ+pZQ=
X-Riseup-User-ID: DC118332539F4CC1490CE1F4F8DA739303F1957D88862E3F14EDD2974476CF79
Received: from [127.0.0.1] (localhost [127.0.0.1])
 by fews2.riseup.net (Postfix) with ESMTPSA id 4MHrfd381Gz1y9N;
 Wed, 31 Aug 2022 17:25:29 +0000 (UTC)
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
Subject: [PATCH v2 6/8] drm/amd/display: Introduce KUnit tests for dcn20_fpu
Date: Wed, 31 Aug 2022 14:22:37 -0300
Message-Id: <20220831172239.344446-7-mairacanal@riseup.net>
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

From: Magali Lemes <magalilemes00@gmail.com>

This commit adds unit tests to the functions dcn20_cap_soc_clocks and
dcn21_update_bw_bounding_box from dcn20/dcn20_fpu.

Signed-off-by: Magali Lemes <magalilemes00@gmail.com>
Signed-off-by: Maíra Canal <mairacanal@riseup.net>
---
 drivers/gpu/drm/amd/display/tests/Makefile    |   3 +-
 .../tests/dc/dml/dcn20/dcn20_fpu_test.c       | 561 ++++++++++++++++++
 2 files changed, 563 insertions(+), 1 deletion(-)
 create mode 100644 drivers/gpu/drm/amd/display/tests/dc/dml/dcn20/dcn20_fpu_test.c

diff --git a/drivers/gpu/drm/amd/display/tests/Makefile b/drivers/gpu/drm/amd/display/tests/Makefile
index cc1e9edd38c3..a34677808e48 100644
--- a/drivers/gpu/drm/amd/display/tests/Makefile
+++ b/drivers/gpu/drm/amd/display/tests/Makefile
@@ -9,7 +9,8 @@ endif
 
 ifdef CONFIG_DML_KUNIT_TEST
 	CFLAGS_$(AMDDALPATH)/tests/dc/dml/display_mode_vba_test.o := $(dml_ccflags)
-	DC_TESTS += dc/dml/display_mode_vba_test.o
+	CFLAGS_$(AMDDALPATH)/tests/dc/dml/dcn20/dcn20_fpu_test.o := $(dml_ccflags)
+	DC_TESTS += dc/dml/display_mode_vba_test.o dc/dml/dcn20/dcn20_fpu_test.o
 endif
 
 AMD_DAL_DC_TESTS = $(addprefix $(AMDDALPATH)/tests/,$(DC_TESTS))
diff --git a/drivers/gpu/drm/amd/display/tests/dc/dml/dcn20/dcn20_fpu_test.c b/drivers/gpu/drm/amd/display/tests/dc/dml/dcn20/dcn20_fpu_test.c
new file mode 100644
index 000000000000..6b7ebb78fec9
--- /dev/null
+++ b/drivers/gpu/drm/amd/display/tests/dc/dml/dcn20/dcn20_fpu_test.c
@@ -0,0 +1,561 @@
+// SPDX-License-Identifier: MIT
+/*
+ * KUnit tests for dml/dcn20/dcn20_fpu.h
+ *
+ * Copyright (C) 2022, Magali Lemes <magalilemes00@gmail.com>
+ */
+
+#include <kunit/test.h>
+
+#include "dc/inc/resource.h"
+#include "dc/inc/hw/clk_mgr.h"
+#include "dc/dcn21/dcn21_resource.h"
+
+#include "dml/dcn20/dcn20_fpu.h"
+
+/**
+ * DOC: Unit tests for AMDGPU DML dcn20/dcn20_fpu.h
+ */
+
+struct dcn20_cap_soc_clocks_test_case {
+	const char *desc;
+	struct _vcs_dpi_soc_bounding_box_st bb;
+	struct pp_smu_nv_clock_table max_clocks;
+	const int clock_states;
+	const struct _vcs_dpi_voltage_scaling_st expected_clock_limits[DC__VOLTAGE_STATES];
+};
+
+struct dcn21_update_bw_bounding_box_test_case {
+	const char *desc;
+	struct dc dc;
+	struct clk_bw_params bw_params;
+	const int clocks_to_compare;
+	const struct _vcs_dpi_voltage_scaling_st expected_clock_limits[DC__VOLTAGE_STATES];
+};
+
+struct dcn20_cap_soc_clocks_test_case dcn20_cap_soc_clocks_test_cases[] = {
+	{
+		.desc = "4-state bounding box clock limits ",
+		.bb = {
+			.clock_limits = {
+				{
+					.dcfclk_mhz = 506.0,
+					.fabricclk_mhz = 506.0,
+					.dispclk_mhz = 1284.0,
+					.dppclk_mhz = 400.0,
+					.phyclk_mhz = 810.0,
+					.socclk_mhz = 506.0,
+					.dscclk_mhz = 428.0,
+					.dram_speed_mts = 1600.0,
+				},
+				{
+					.dcfclk_mhz = 540.0,
+					.fabricclk_mhz = 540.0,
+					.dispclk_mhz = 1284.0,
+					.dppclk_mhz = 1284.0,
+					.phyclk_mhz = 810.0,
+					.socclk_mhz = 540.0,
+					.dscclk_mhz = 428.0,
+					.dram_speed_mts = 8000.0,
+				},
+				{
+					.dcfclk_mhz = 675.0,
+					.fabricclk_mhz = 675.0,
+					.dispclk_mhz = 1284.0,
+					.dppclk_mhz = 1284.0,
+					.phyclk_mhz = 810.0,
+					.socclk_mhz = 675.0,
+					.dscclk_mhz = 428.0,
+					.dram_speed_mts = 10000.0,
+				},
+				{
+					.dcfclk_mhz = 1265.0,
+					.fabricclk_mhz = 1266.0,
+					.dispclk_mhz = 1284.0,
+					.dppclk_mhz = 1284.0,
+					.phyclk_mhz = 810.0,
+					.socclk_mhz = 1266.0,
+					.dscclk_mhz = 428.0,
+					.dram_speed_mts = 15000.0,
+				},
+			},
+			.num_states = 4,
+		},
+		.max_clocks = {
+			.dcfClockInKhz = 1265000,
+			.uClockInKhz = 875000,
+			.fabricClockInKhz = 0,
+			.displayClockInKhz = 1284000,
+			.dppClockInKhz = 0,
+			.phyClockInKhz = 810000,
+			.socClockInKhz = 1266000,
+			.dscClockInKhz = 0,
+		},
+		.clock_states = 4,
+		.expected_clock_limits = {
+			{
+				.dcfclk_mhz = 506.0,
+				.fabricclk_mhz = 506.0,
+				.dispclk_mhz = 1284.0,
+				.dppclk_mhz = 400.0,
+				.phyclk_mhz = 810.0,
+				.socclk_mhz = 506.0,
+				.dscclk_mhz = 428.0,
+				.dram_speed_mts = 1600.0,
+			},
+			{
+				.dcfclk_mhz = 540.0,
+				.fabricclk_mhz = 540.0,
+				.dispclk_mhz = 1284.0,
+				.dppclk_mhz = 1284.0,
+				.phyclk_mhz = 810.0,
+				.socclk_mhz = 540.0,
+				.dscclk_mhz = 428.0,
+				.dram_speed_mts = 8000.0,
+			},
+			{
+				.dcfclk_mhz = 675.0,
+				.fabricclk_mhz = 675.0,
+				.dispclk_mhz = 1284.0,
+				.dppclk_mhz = 1284.0,
+				.phyclk_mhz = 810.0,
+				.socclk_mhz = 675.0,
+				.dscclk_mhz = 428.0,
+				.dram_speed_mts = 10000.0,
+			},
+			{
+				.dcfclk_mhz = 1265.0,
+				.fabricclk_mhz = 1266.0,
+				.dispclk_mhz = 1284.0,
+				.dppclk_mhz = 1284.0,
+				.phyclk_mhz = 810.0,
+				.socclk_mhz = 1266.0,
+				.dscclk_mhz = 428.0,
+				.dram_speed_mts = 14000.0,
+			},
+		},
+	},
+	{
+		.desc = "One duplicate clock state",
+		.bb = {
+			.clock_limits = {
+				{
+					.dcfclk_mhz = 506.0,
+					.fabricclk_mhz = 506.0,
+					.dispclk_mhz = 1284.0,
+					.dppclk_mhz = 400.0,
+					.phyclk_mhz = 810.0,
+					.socclk_mhz = 506.0,
+					.dscclk_mhz = 428.0,
+					.dram_speed_mts = 1600.0,
+				},
+				{
+					.dcfclk_mhz = 675.0,
+					.fabricclk_mhz = 675.0,
+					.dispclk_mhz = 1284.0,
+					.dppclk_mhz = 1284.0,
+					.phyclk_mhz = 810.0,
+					.socclk_mhz = 675.0,
+					.dscclk_mhz = 428.0,
+					.dram_speed_mts = 10000.0,
+				},
+				{
+					.dcfclk_mhz = 675.0,
+					.fabricclk_mhz = 675.0,
+					.dispclk_mhz = 1284.0,
+					.dppclk_mhz = 1284.0,
+					.phyclk_mhz = 810.0,
+					.socclk_mhz = 675.0,
+					.dscclk_mhz = 428.0,
+					.dram_speed_mts = 10000.0,
+				},
+				{
+					.dcfclk_mhz = 1265.0,
+					.fabricclk_mhz = 1266.0,
+					.dispclk_mhz = 1284.0,
+					.dppclk_mhz = 1284.0,
+					.phyclk_mhz = 810.0,
+					.socclk_mhz = 1266.0,
+					.dscclk_mhz = 428.0,
+					.dram_speed_mts = 15000.0,
+				},
+			},
+			.num_states = 4,
+		},
+		.max_clocks = {
+			.dcfClockInKhz = 1265000,
+			.uClockInKhz = 875000,
+			.fabricClockInKhz = 0,
+			.displayClockInKhz = 1284000,
+			.dppClockInKhz = 0,
+			.phyClockInKhz = 810000,
+			.socClockInKhz = 1266000,
+			.dscClockInKhz = 0,
+		},
+		.clock_states = 3,
+		.expected_clock_limits = {
+			{
+				.dcfclk_mhz = 506.0,
+				.fabricclk_mhz = 506.0,
+				.dispclk_mhz = 1284.0,
+				.dppclk_mhz = 400.0,
+				.phyclk_mhz = 810.0,
+				.socclk_mhz = 506.0,
+				.dscclk_mhz = 428.0,
+				.dram_speed_mts = 1600.0,
+			},
+			{
+				.dcfclk_mhz = 675.0,
+				.fabricclk_mhz = 675.0,
+				.dispclk_mhz = 1284.0,
+				.dppclk_mhz = 1284.0,
+				.phyclk_mhz = 810.0,
+				.socclk_mhz = 675.0,
+				.dscclk_mhz = 428.0,
+				.dram_speed_mts = 10000.0,
+			},
+			{
+				.dcfclk_mhz = 675.0,
+				.fabricclk_mhz = 675.0,
+				.dispclk_mhz = 1284.0,
+				.dppclk_mhz = 1284.0,
+				.phyclk_mhz = 810.0,
+				.socclk_mhz = 675.0,
+				.dscclk_mhz = 428.0,
+				.dram_speed_mts = 10000.0,
+			},
+		},
+	},
+	{
+		.desc = "Zeroed max clocks",
+		.bb = {
+			.clock_limits = {
+				{
+					.dcfclk_mhz = 506.0,
+					.fabricclk_mhz = 506.0,
+					.dispclk_mhz = 1284.0,
+					.dppclk_mhz = 400.0,
+					.phyclk_mhz = 810.0,
+					.socclk_mhz = 506.0,
+					.dscclk_mhz = 428.0,
+					.dram_speed_mts = 1600.0,
+				},
+			},
+			.num_states = 1,
+		},
+		.max_clocks = {
+			.dcfClockInKhz = 0,
+			.uClockInKhz = 0,
+			.fabricClockInKhz = 0,
+			.displayClockInKhz = 0,
+			.dppClockInKhz = 0,
+			.phyClockInKhz = 0,
+			.socClockInKhz = 0,
+			.dscClockInKhz = 0,
+		},
+		.clock_states = 1,
+		.expected_clock_limits = {
+			{
+				.dcfclk_mhz = 506.0,
+				.fabricclk_mhz = 506.0,
+				.dispclk_mhz = 1284.0,
+				.dppclk_mhz = 400.0,
+				.phyclk_mhz = 810.0,
+				.socclk_mhz = 506.0,
+				.dscclk_mhz = 428.0,
+				.dram_speed_mts = 1600.0,
+			},
+		},
+	},
+};
+
+struct dcn21_update_bw_bounding_box_test_case dcn21_update_bw_bounding_box_test_data[] = {
+	{
+		.desc = "5-entry bounding box clocks table",
+		.dc = {
+			.res_pool = &(struct resource_pool) {
+				.pipe_count = 2,
+				.res_cap = &(struct resource_caps) {
+					.num_timing_generator = 3
+				},
+			},
+		},
+		.bw_params = {
+			.num_channels = 1,
+			.clk_table = {
+				.entries = {
+					{
+						.voltage = 0,
+						.dcfclk_mhz = 200,
+						.fclk_mhz = 400,
+						.memclk_mhz = 800,
+						.socclk_mhz = 0,
+					},
+					{
+						.voltage = 0,
+						.dcfclk_mhz = 201,
+						.fclk_mhz = 800,
+						.memclk_mhz = 1600,
+						.socclk_mhz = 0,
+					},
+					{
+						.voltage = 0,
+						.dcfclk_mhz = 553,
+						.fclk_mhz = 1067,
+						.memclk_mhz = 1067,
+						.socclk_mhz = 0,
+					},
+					{
+						.voltage = 0,
+						.dcfclk_mhz = 602,
+						.fclk_mhz = 1333,
+						.memclk_mhz = 1600,
+						.socclk_mhz = 0,
+					},
+					{
+						.voltage = 0,
+						.dispclk_mhz = 1372,
+						.dppclk_mhz = 1372,
+						.phyclk_mhz = 810,
+						.phyclk_d18_mhz = 667,
+						.dtbclk_mhz = 600,
+					},
+				},
+
+				.num_entries = 5,
+			},
+		},
+		.expected_clock_limits = {
+			{
+				.state = 0,
+				.dcfclk_mhz = 200.0,
+				.fabricclk_mhz = 400.0,
+				.dispclk_mhz = 600.0,
+				.dppclk_mhz = 400.0,
+				.phyclk_mhz = 600.0,
+				.socclk_mhz = 0.0,
+				.dscclk_mhz = 205.67,
+				.dram_speed_mts = 1600.0,
+			},
+			{
+				.state = 1,
+				.dcfclk_mhz = 200.0,
+				.fabricclk_mhz = 400.0,
+				.dispclk_mhz = 600.0,
+				.dppclk_mhz = 400.0,
+				.phyclk_mhz = 600.0,
+				.socclk_mhz = 0.0,
+				.dscclk_mhz = 205.67,
+				.dram_speed_mts = 1600.0,
+			},
+			{
+				.state = 2,
+				.dcfclk_mhz = 201,
+				.fabricclk_mhz = 800.0,
+				.dispclk_mhz = 600.0,
+				.dppclk_mhz = 400.0,
+				.phyclk_mhz = 600.0,
+				.socclk_mhz = 0.0,
+				.dscclk_mhz = 205.67,
+				.dram_speed_mts = 3200.0,
+			},
+			{
+				.state = 3,
+				.dcfclk_mhz = 553.0,
+				.fabricclk_mhz = 1067.0,
+				.dispclk_mhz = 757.89,
+				.dppclk_mhz = 685.71,
+				.phyclk_mhz = 600.0,
+				.socclk_mhz = 0.0,
+				.dscclk_mhz = 287.67,
+				.dram_speed_mts = 2134.0,
+			},
+			{
+				.state = 4,
+				.dcfclk_mhz = 602.0,
+				.fabricclk_mhz = 1333.0,
+				.dispclk_mhz = 847.06,
+				.dppclk_mhz = 757.89,
+				.phyclk_mhz = 600.0,
+				.socclk_mhz = 0.0,
+				.dscclk_mhz = 318.334,
+				.dram_speed_mts = 3200.0,
+			},
+			{
+				.state = 5,
+				.dcfclk_mhz = 0.0,
+				.fabricclk_mhz = 0.0,
+				.dispclk_mhz = 600.0,
+				.dppclk_mhz = 400.0,
+				.phyclk_mhz = 600.0,
+				.socclk_mhz = 0.0,
+				.dscclk_mhz = 205.67,
+				.dram_speed_mts = 0.0,
+			},
+			{
+				.state = 6,
+				.dcfclk_mhz = 0.0,
+				.fabricclk_mhz = 0.0,
+				.dispclk_mhz = 600.0,
+				.dppclk_mhz = 400.0,
+				.phyclk_mhz = 600.0,
+				.socclk_mhz = 0.0,
+				.dscclk_mhz = 205.67,
+				.dram_speed_mts = 0.0,
+			},
+		},
+		.clocks_to_compare = 6,
+	},
+};
+
+/**
+ * dcn20_cap_soc_clocks_test - KUnit test for dcn20_cap_soc_clocks
+ * @test: represents a running instance of a test.
+ */
+static void dcn20_cap_soc_clocks_test(struct kunit *test)
+{
+	struct dcn20_cap_soc_clocks_test_case *test_param =
+		(struct dcn20_cap_soc_clocks_test_case *)test->param_value;
+	int i;
+
+	DC_FP_START();
+	dcn20_cap_soc_clocks(&test_param->bb, test_param->max_clocks);
+	DC_FP_END();
+
+	/* Check if no clock limit is higher than the specified maximum */
+	for (i = 0; i < test_param->bb.num_states; i++) {
+		KUNIT_EXPECT_EQ(test, test_param->bb.clock_limits[i].dcfclk_mhz,
+				test_param->expected_clock_limits[i].dcfclk_mhz);
+		KUNIT_EXPECT_EQ(test, test_param->bb.clock_limits[i].fabricclk_mhz,
+				test_param->expected_clock_limits[i].fabricclk_mhz);
+		KUNIT_EXPECT_EQ(test, test_param->bb.clock_limits[i].dispclk_mhz,
+				test_param->expected_clock_limits[i].dispclk_mhz);
+		KUNIT_EXPECT_EQ(test, test_param->bb.clock_limits[i].dppclk_mhz,
+				test_param->expected_clock_limits[i].dppclk_mhz);
+		KUNIT_EXPECT_EQ(test, test_param->bb.clock_limits[i].phyclk_mhz,
+				test_param->expected_clock_limits[i].phyclk_mhz);
+		KUNIT_EXPECT_EQ(test, test_param->bb.clock_limits[i].socclk_mhz,
+				test_param->expected_clock_limits[i].socclk_mhz);
+		KUNIT_EXPECT_EQ(test, test_param->bb.clock_limits[i].dscclk_mhz,
+				test_param->expected_clock_limits[i].dscclk_mhz);
+		KUNIT_EXPECT_EQ(test, test_param->bb.clock_limits[i].dram_speed_mts,
+				test_param->expected_clock_limits[i].dram_speed_mts);
+	}
+
+	KUNIT_EXPECT_EQ(test, test_param->clock_states, test_param->bb.num_states);
+}
+
+static struct _vcs_dpi_soc_bounding_box_st original_dcn2_1_soc;
+static struct _vcs_dpi_ip_params_st original_dcn2_1_ip;
+
+/**
+ * dcn20_fpu_dcn21_update_bw_bounding_box_test_init - Store backup copies of DCN global structures
+ * @test: represents a running instance of a test.
+ */
+int dcn20_fpu_dcn21_update_bw_bounding_box_test_init(struct kunit *test)
+{
+	memcpy(&original_dcn2_1_soc, &dcn2_1_soc, sizeof(struct _vcs_dpi_soc_bounding_box_st));
+	memcpy(&original_dcn2_1_ip, &dcn2_1_ip, sizeof(struct _vcs_dpi_ip_params_st));
+
+	return 0;
+}
+
+/**
+ * dcn20_fpu_dcn21_update_bw_bounding_box_test_exit - Restore original values
+ * of DCN global structures
+ * @test: represents a running instance of a test.
+ */
+static void dcn20_fpu_dcn21_update_bw_bounding_box_test_exit(struct kunit *test)
+{
+	memcpy(&dcn2_1_soc, &original_dcn2_1_soc, sizeof(struct _vcs_dpi_soc_bounding_box_st));
+	memcpy(&dcn2_1_ip, &original_dcn2_1_ip, sizeof(struct _vcs_dpi_ip_params_st));
+}
+
+/**
+ * dcn21_update_bw_bounding_box_test - KUnit test for dcn21_update_bw_bounding_box
+ * @test: represents a running instance of a test.
+ */
+static void dcn21_update_bw_bounding_box_test(struct kunit *test)
+{
+	struct dcn21_update_bw_bounding_box_test_case *test_param =
+		(struct dcn21_update_bw_bounding_box_test_case *)test->param_value;
+	int i;
+
+	DC_FP_START();
+	dcn21_update_bw_bounding_box(&test_param->dc, &test_param->bw_params);
+	DC_FP_END();
+
+	KUNIT_EXPECT_EQ(test, test_param->dc.res_pool->res_cap->num_timing_generator,
+			dcn2_1_ip.max_num_otg);
+	KUNIT_EXPECT_EQ(test, test_param->dc.res_pool->pipe_count, dcn2_1_ip.max_num_dpp);
+	KUNIT_EXPECT_EQ(test, test_param->bw_params.num_channels, dcn2_1_soc.num_chans);
+
+	for (i = 0; i <= test_param->clocks_to_compare; i++) {
+		KUNIT_EXPECT_EQ(test, test_param->expected_clock_limits[i].state,
+				dcn2_1_soc.clock_limits[i].state);
+		KUNIT_EXPECT_EQ(test, test_param->expected_clock_limits[i].dcfclk_mhz,
+				dcn2_1_soc.clock_limits[i].dcfclk_mhz);
+		KUNIT_EXPECT_EQ(test, test_param->expected_clock_limits[i].fabricclk_mhz,
+				dcn2_1_soc.clock_limits[i].fabricclk_mhz);
+		KUNIT_EXPECT_EQ(test, test_param->expected_clock_limits[i].dispclk_mhz,
+				dcn2_1_soc.clock_limits[i].dispclk_mhz);
+		KUNIT_EXPECT_EQ(test, test_param->expected_clock_limits[i].dppclk_mhz,
+				dcn2_1_soc.clock_limits[i].dppclk_mhz);
+		KUNIT_EXPECT_EQ(test, test_param->expected_clock_limits[i].phyclk_mhz,
+				dcn2_1_soc.clock_limits[i].phyclk_mhz);
+		KUNIT_EXPECT_EQ(test, test_param->expected_clock_limits[i].socclk_mhz,
+				dcn2_1_soc.clock_limits[i].socclk_mhz);
+		KUNIT_EXPECT_EQ(test, test_param->expected_clock_limits[i].dscclk_mhz,
+				dcn2_1_soc.clock_limits[i].dscclk_mhz);
+		KUNIT_EXPECT_EQ(test, test_param->expected_clock_limits[i].dram_speed_mts,
+				dcn2_1_soc.clock_limits[i].dram_speed_mts);
+	}
+
+	if (test_param->bw_params.clk_table.num_entries)
+		KUNIT_EXPECT_EQ(test, test_param->bw_params.clk_table.num_entries,
+				dcn2_1_soc.num_states);
+}
+
+static void dcn20_cap_soc_clocks_test_to_desc(struct dcn20_cap_soc_clocks_test_case *t, char *desc)
+{
+	strcpy(desc, t->desc);
+}
+
+static void dcn21_update_bw_bounding_box_test_to_desc
+(struct dcn21_update_bw_bounding_box_test_case *t, char *desc)
+{
+	strcpy(desc, t->desc);
+}
+
+KUNIT_ARRAY_PARAM(dcn20_cap_soc_clocks,
+		  dcn20_cap_soc_clocks_test_cases,
+		  dcn20_cap_soc_clocks_test_to_desc);
+
+static struct kunit_case dcn20_fpu_test_cases[] = {
+	KUNIT_CASE_PARAM(dcn20_cap_soc_clocks_test, dcn20_cap_soc_clocks_gen_params),
+	{  }
+};
+
+static struct kunit_suite dcn20_fpu_test_suite = {
+	.name = "dml_dcn20_fpu",
+	.test_cases = dcn20_fpu_test_cases,
+};
+
+KUNIT_ARRAY_PARAM(dcn21_update_bw_bounding_box,
+		  dcn21_update_bw_bounding_box_test_data,
+		  dcn21_update_bw_bounding_box_test_to_desc);
+
+static struct kunit_case dcn20_fpu_dcn21_update_bw_bounding_box_test_cases[] = {
+	KUNIT_CASE_PARAM(dcn21_update_bw_bounding_box_test,
+			 dcn21_update_bw_bounding_box_gen_params),
+	{  }
+};
+
+static struct kunit_suite dcn21_update_bw_bounding_box_test_suite = {
+	.name = "dml_dcn20_fpu_dcn21_update_bw_bounding_box_test",
+	.init = dcn20_fpu_dcn21_update_bw_bounding_box_test_init,
+	.exit = dcn20_fpu_dcn21_update_bw_bounding_box_test_exit,
+	.test_cases = dcn20_fpu_dcn21_update_bw_bounding_box_test_cases,
+};
+
+kunit_test_suites(&dcn20_fpu_test_suite, &dcn21_update_bw_bounding_box_test_suite);
-- 
2.37.2

