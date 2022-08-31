Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 521BF5A8451
	for <lists+dri-devel@lfdr.de>; Wed, 31 Aug 2022 19:26:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 62AF710E4BB;
	Wed, 31 Aug 2022 17:25:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0.riseup.net (mx0.riseup.net [198.252.153.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 03CA3893DB;
 Wed, 31 Aug 2022 17:25:49 +0000 (UTC)
Received: from fews2.riseup.net (fews2-pn.riseup.net [10.0.1.84])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
 client-signature RSA-PSS (2048 bits) client-digest SHA256)
 (Client CN "mail.riseup.net", Issuer "R3" (not verified))
 by mx0.riseup.net (Postfix) with ESMTPS id 4MHrg13Vqfz9sXD;
 Wed, 31 Aug 2022 17:25:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=riseup.net; s=squak;
 t=1661966749; bh=zgz/vqcZ7xIgcfUJNphyU+VB98g7c6kVyKHZi3Qv44g=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=awNsb26KDq1wa27YilzWiVH8Z+P53NUiREF6nFGuWcHzPUse8tpHoFPDqp9SzqZ1l
 GXtkW17Y4//h2SckpwtfM2nlYuhqyFutP7dOvEpHgByJiqP+WNTtV/Qem9lmque488
 WmbpQcQGZmfc4KJcFCYJCbp9LeVOrKK0tiwKbrck=
X-Riseup-User-ID: CC5CC2AD114115B0E0042B7646EABB7DB293DA808DAA0258312EE7BC6F476138
Received: from [127.0.0.1] (localhost [127.0.0.1])
 by fews2.riseup.net (Postfix) with ESMTPSA id 4MHrfs5xQvz1y9N;
 Wed, 31 Aug 2022 17:25:41 +0000 (UTC)
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
Subject: [PATCH v2 7/8] drm/amd/display: Introduce KUnit tests to dc_dmub_srv
 library
Date: Wed, 31 Aug 2022 14:22:38 -0300
Message-Id: <20220831172239.344446-8-mairacanal@riseup.net>
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

Add unit test to the SubVP feature in order to avoid possible
regressions and assure the code robustness.

Signed-off-by: Maíra Canal <mairacanal@riseup.net>
---
 drivers/gpu/drm/amd/display/Kconfig           |  13 +
 drivers/gpu/drm/amd/display/dc/dc_dmub_srv.c  |   4 +
 .../gpu/drm/amd/display/tests/.kunitconfig    |   1 +
 .../amd/display/tests/dc/dc_dmub_srv_test.c   | 285 ++++++++++++++++++
 4 files changed, 303 insertions(+)
 create mode 100644 drivers/gpu/drm/amd/display/tests/dc/dc_dmub_srv_test.c

diff --git a/drivers/gpu/drm/amd/display/Kconfig b/drivers/gpu/drm/amd/display/Kconfig
index 039227baedfa..f667b954f89f 100644
--- a/drivers/gpu/drm/amd/display/Kconfig
+++ b/drivers/gpu/drm/amd/display/Kconfig
@@ -93,4 +93,17 @@ config AMD_DC_BASICS_KUNIT_TEST
 
 		If unsure, say N.
 
+config AMD_DC_KUNIT_TEST
+	bool "Enable KUnit tests for the 'utils' sub-component of DAL" if !KUNIT_ALL_TESTS
+	depends on DRM_AMD_DC && KUNIT
+	default KUNIT_ALL_TESTS
+	help
+		Enables unit tests for the basics folder of Display Core. Only useful for
+		kernel devs running KUnit.
+
+		For more information on KUnit and unit tests in general please refer to
+		the KUnit documentation in Documentation/dev-tools/kunit/.
+
+		If unsure, say N.
+
 endmenu
diff --git a/drivers/gpu/drm/amd/display/dc/dc_dmub_srv.c b/drivers/gpu/drm/amd/display/dc/dc_dmub_srv.c
index cd7225d98b3d..86f78fe017a6 100644
--- a/drivers/gpu/drm/amd/display/dc/dc_dmub_srv.c
+++ b/drivers/gpu/drm/amd/display/dc/dc_dmub_srv.c
@@ -819,3 +819,7 @@ void dc_dmub_srv_log_diagnostic_data(struct dc_dmub_srv *dc_dmub_srv)
 		diag_data.is_cw0_enabled,
 		diag_data.is_cw6_enabled);
 }
+
+#if IS_ENABLED(CONFIG_AMD_DC_KUNIT_TEST)
+#include "../tests/dc/dc_dmub_srv_test.c"
+#endif
diff --git a/drivers/gpu/drm/amd/display/tests/.kunitconfig b/drivers/gpu/drm/amd/display/tests/.kunitconfig
index eb6f81601757..4c5861ad58bd 100644
--- a/drivers/gpu/drm/amd/display/tests/.kunitconfig
+++ b/drivers/gpu/drm/amd/display/tests/.kunitconfig
@@ -4,5 +4,6 @@ CONFIG_DRM=y
 CONFIG_DRM_AMDGPU=y
 CONFIG_DRM_AMD_DC=y
 CONFIG_AMD_DC_BASICS_KUNIT_TEST=y
+CONFIG_AMD_DC_KUNIT_TEST=y
 CONFIG_DCE_KUNIT_TEST=y
 CONFIG_DML_KUNIT_TEST=y
diff --git a/drivers/gpu/drm/amd/display/tests/dc/dc_dmub_srv_test.c b/drivers/gpu/drm/amd/display/tests/dc/dc_dmub_srv_test.c
new file mode 100644
index 000000000000..3f1f15397090
--- /dev/null
+++ b/drivers/gpu/drm/amd/display/tests/dc/dc_dmub_srv_test.c
@@ -0,0 +1,285 @@
+// SPDX-License-Identifier: MIT
+/*
+ * KUnit tests for dc_dmub_srv.c
+ *
+ * Copyright (C) 2022, Maíra Canal <mairacanal@riseup.net>
+ */
+
+#include <kunit/test.h>
+#include "dc_dmub_srv.h"
+
+struct populate_subvp_cmd_drr_info_test_case {
+	const char *desc;
+	struct dc *dc;
+	struct pipe_ctx *subvp_pipe;
+	struct pipe_ctx *vblank_pipe;
+	const u8 drr_in_use;
+	const u8 drr_window_size_ms;
+	const u16 min_vtotal_supported;
+	const u16 max_vtotal_supported;
+	const u8 use_ramping;
+};
+
+struct populate_subvp_cmd_drr_info_test_case populate_subvp_cmd_drr_info_cases[] = {
+	{
+		.desc = "Same Clock Frequency",
+		.dc = &(struct dc) {
+			.caps = {
+				.subvp_prefetch_end_to_mall_start_us = 0,
+			}
+		},
+		.subvp_pipe = &(struct pipe_ctx) {
+			.stream = &(struct dc_stream_state) {
+				.timing = {
+					.h_total = 2784,
+					.v_addressable = 1080,
+					.pix_clk_100hz = 1855800,
+				},
+				.mall_stream_config = {
+					.paired_stream = &(struct dc_stream_state) {
+						.timing = {
+							.h_total = 3600,
+							.v_total = 1111,
+							.v_addressable = 1080,
+							.v_front_porch = 3,
+							.pix_clk_100hz = 1855800,
+						},
+					},
+				},
+			},
+		},
+		.vblank_pipe = &(struct pipe_ctx) {
+			.stream = &(struct dc_stream_state) {
+				.timing = {
+					.h_total = 2784,
+					.v_total = 1111,
+					.v_addressable = 1080,
+					.pix_clk_100hz = 1855800,
+				},
+			},
+		},
+		.drr_in_use = true,
+		.use_ramping = false,
+		.drr_window_size_ms = 4,
+		.min_vtotal_supported = 63709,
+		.max_vtotal_supported = 363,
+	},
+	{
+		.desc = "Same Clock Frequency with Prefetch End to Mall Start",
+		.dc = &(struct dc) {
+			.caps = {
+				.subvp_prefetch_end_to_mall_start_us = 500,
+			}
+		},
+		.subvp_pipe = &(struct pipe_ctx) {
+			.stream = &(struct dc_stream_state) {
+				.timing = {
+					.h_total = 2784,
+					.v_addressable = 1080,
+					.pix_clk_100hz = 1855800,
+				},
+				.mall_stream_config = {
+					.paired_stream = &(struct dc_stream_state) {
+						.timing = {
+							.h_total = 3600,
+							.v_total = 1111,
+							.v_addressable = 1080,
+							.v_front_porch = 3,
+							.pix_clk_100hz = 1855800,
+						},
+					},
+				},
+			},
+		},
+		.vblank_pipe = &(struct pipe_ctx) {
+			.stream = &(struct dc_stream_state) {
+				.timing = {
+					.h_total = 2784,
+					.v_total = 1111,
+					.v_addressable = 1080,
+					.pix_clk_100hz = 1855800,
+				},
+			},
+		},
+		.drr_in_use = true,
+		.use_ramping = false,
+		.drr_window_size_ms = 4,
+		.min_vtotal_supported = 63709,
+		.max_vtotal_supported = 346,
+	},
+	{
+		.desc = "Same Clock Frequency Not Multiple of 2",
+		.dc = &(struct dc) {
+			.caps = {
+				.subvp_prefetch_end_to_mall_start_us = 0,
+			}
+		},
+		.subvp_pipe = &(struct pipe_ctx) {
+			.stream = &(struct dc_stream_state) {
+				.timing = {
+					.h_total = 2784,
+					.v_addressable = 1080,
+					.pix_clk_100hz = 1866743,
+				},
+				.mall_stream_config = {
+					.paired_stream = &(struct dc_stream_state) {
+						.timing = {
+							.h_total = 3600,
+							.v_total = 2400,
+							.v_addressable = 2360,
+							.v_front_porch = 4,
+							.pix_clk_100hz = 1866743,
+						},
+					},
+				},
+			},
+		},
+		.vblank_pipe = &(struct pipe_ctx) {
+			.stream = &(struct dc_stream_state) {
+				.timing = {
+					.h_total = 3600,
+					.v_total = 2400,
+					.v_addressable = 2360,
+					.pix_clk_100hz = 1866743,
+				},
+			},
+		},
+		.drr_in_use = true,
+		.use_ramping = false,
+		.drr_window_size_ms = 4,
+		.min_vtotal_supported = 1387,
+		.max_vtotal_supported = 399,
+	},
+	{
+		.desc = "Different Clock Frequency for smaller h_total and v_total",
+		.dc = &(struct dc) {
+			.caps = {
+				.subvp_prefetch_end_to_mall_start_us = 300,
+			}
+		},
+		.subvp_pipe = &(struct pipe_ctx) {
+			.stream = &(struct dc_stream_state) {
+				.timing = {
+					.h_total = 1280,
+					.v_addressable = 600,
+					.pix_clk_100hz = 1855800,
+				},
+				.mall_stream_config = {
+					.paired_stream = &(struct dc_stream_state) {
+						.timing = {
+							.h_total = 1280,
+							.v_total = 720,
+							.v_addressable = 600,
+							.v_front_porch = 4,
+							.pix_clk_100hz = 1866743,
+						},
+					},
+				},
+			},
+		},
+		.vblank_pipe = &(struct pipe_ctx) {
+			.stream = &(struct dc_stream_state) {
+				.timing = {
+					.h_total = 1280,
+					.v_total = 720,
+					.v_addressable = 600,
+					.pix_clk_100hz = 2100800,
+				},
+			},
+		},
+		.drr_in_use = true,
+		.use_ramping = false,
+		.drr_window_size_ms = 4,
+		.min_vtotal_supported = 1477,
+		.max_vtotal_supported = 212,
+	},
+	{
+		.desc = "Different Clock Frequency for approximately 1920x1080",
+		.dc = &(struct dc) {
+			.caps = {
+				.subvp_prefetch_end_to_mall_start_us = 0,
+			}
+		},
+		.subvp_pipe = &(struct pipe_ctx) {
+			.stream = &(struct dc_stream_state) {
+				.timing = {
+					.h_total = 1920,
+					.v_addressable = 1000,
+					.pix_clk_100hz = 1855800,
+				},
+				.mall_stream_config = {
+					.paired_stream = &(struct dc_stream_state) {
+						.timing = {
+							.h_total = 1911,
+							.v_total = 1080,
+							.v_addressable = 1000,
+							.v_front_porch = 7,
+							.pix_clk_100hz = 1866743,
+						},
+					},
+				},
+			},
+		},
+		.vblank_pipe = &(struct pipe_ctx) {
+			.stream = &(struct dc_stream_state) {
+				.timing = {
+					.h_total = 1280,
+					.v_total = 720,
+					.v_addressable = 600,
+					.pix_clk_100hz = 2100800,
+				},
+			},
+		},
+		.drr_in_use = true,
+		.use_ramping = false,
+		.drr_window_size_ms = 4,
+		.min_vtotal_supported = 2482,
+		.max_vtotal_supported = 247,
+	},
+};
+
+static void populate_subvp_cmd_drr_info_test_to_desc(struct
+		populate_subvp_cmd_drr_info_test_case * t, char *desc)
+{
+	strcpy(desc, t->desc);
+}
+
+KUNIT_ARRAY_PARAM(populate_subvp_cmd_drr_info, populate_subvp_cmd_drr_info_cases,
+		  populate_subvp_cmd_drr_info_test_to_desc);
+
+static void populate_subvp_cmd_drr_info_test(struct kunit *test)
+{
+	const struct populate_subvp_cmd_drr_info_test_case *test_param =
+		test->param_value;
+	struct dmub_cmd_fw_assisted_mclk_switch_pipe_data_v2 *pipe_data;
+
+	pipe_data = kunit_kzalloc(test,
+				  sizeof(struct dmub_cmd_fw_assisted_mclk_switch_pipe_data_v2),
+				  GFP_KERNEL);
+
+	populate_subvp_cmd_drr_info(test_param->dc, test_param->subvp_pipe,
+				    test_param->vblank_pipe, pipe_data);
+
+	KUNIT_EXPECT_EQ(test, test_param->drr_in_use,
+			pipe_data->pipe_config.vblank_data.drr_info.drr_in_use);
+	KUNIT_EXPECT_EQ(test, test_param->drr_window_size_ms,
+			pipe_data->pipe_config.vblank_data.drr_info.drr_window_size_ms);
+	KUNIT_EXPECT_EQ(test, test_param->use_ramping,
+			pipe_data->pipe_config.vblank_data.drr_info.use_ramping);
+	KUNIT_EXPECT_EQ(test, test_param->min_vtotal_supported,
+			pipe_data->pipe_config.vblank_data.drr_info.min_vtotal_supported);
+	KUNIT_EXPECT_EQ(test, test_param->max_vtotal_supported,
+			pipe_data->pipe_config.vblank_data.drr_info.max_vtotal_supported);
+}
+
+static struct kunit_case dc_dmub_srv_cases[] = {
+	KUNIT_CASE_PARAM(populate_subvp_cmd_drr_info_test, populate_subvp_cmd_drr_info_gen_params),
+	{  }
+};
+
+static struct kunit_suite dc_dmub_srv_suite = {
+	.name = "dc_dmub_srv",
+	.test_cases = dc_dmub_srv_cases,
+};
+
+kunit_test_suite(dc_dmub_srv_suite);
-- 
2.37.2

