Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B2007CD1F7C
	for <lists+dri-devel@lfdr.de>; Fri, 19 Dec 2025 22:31:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C047810F0C4;
	Fri, 19 Dec 2025 21:31:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="F/qsotH4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 262BF10ED16;
 Fri, 19 Dec 2025 21:31:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1766179883;
 bh=kAdbuGzTo4qVO4VAnrYdAE1DVQRXSzK5HOCSNqyMoeo=;
 h=From:Date:Subject:To:Cc:From;
 b=F/qsotH4kBRr+1clLWcZTFypr5v9DC4Bpuh+ic3P7fxgWvUp27c/gCcV+YPxdahlY
 JdGKOk2wScIUoo0VtF7QQT35HwT6Sktrh7CkJ/YuROlZkAxvwRGvurZmTtfWJ76YdH
 G86RbzgZS1HZ6eEPVwt1dqXdLPTv7ueZnCI6XcmIPvUei9F8uGQl9QeSutmW/1duxG
 4MiIbsaHwQfB1Gy1JD21HzL8udaC9foZrR1DirH9Z0l0Z9Sssmgy5z9wne4hxxm3cF
 X3iOf0m6X/xAYs1q+tnEgphWa6oTTPimccG65Oyt/oqm6bqYtEfseVpC6zRGLUQ7zP
 D58wwGuFUE/7w==
Received: from localhost (unknown [82.79.138.145])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits)
 server-digest SHA256) (No client certificate requested)
 (Authenticated sender: cristicc)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 8AE9E17E0181;
 Fri, 19 Dec 2025 22:31:23 +0100 (CET)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Date: Fri, 19 Dec 2025 23:27:58 +0200
Subject: [PATCH i-g-t v3] tests: (Re)add kms_crtc_background_color test
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20251219-crtc-bgcolor-v3-1-31b589911588@collabora.com>
X-B4-Tracking: v=1; b=H4sIAF3DRWkC/23NQQ7CIBAF0KuYWTsGqMXiynsYF0CHlqQWAw3RN
 L27hJVpXP4/+W9WSBQ9JbgeVoiUffJhLqE5HsCOeh4IfV8yCCZazjlDGxeLZrBhChGdpF7ptiN
 mHJTJK5Lz78rdweOACzxKPfq0hPipTzKvx/9e5shRdFIqI5VQF3Yr/aRNiPpkw7NiWfwC3Q4QB
 egtnZlsXNdqtQe2bfsClogIE/QAAAA=
X-Change-ID: 20251110-crtc-bgcolor-f6ed9a58e0bf
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Sandy Huang <hjc@rock-chips.com>, 
 =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
 Andy Yan <andy.yan@rock-chips.com>, 
 Louis Chauvet <louis.chauvet@bootlin.com>, 
 Haneen Mohammed <hamohammed.sa@gmail.com>, 
 Melissa Wen <melissa.srw@gmail.com>, 
 Kamil Konieczny <kamil.konieczny@linux.intel.com>, 
 Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>, 
 Juha-Pekka Heikkila <juha-pekka.heikkila@intel.com>, 
 Karthik B S <karthik.b.s@intel.com>, Swati Sharma <swati2.sharma@intel.com>
Cc: igt-dev@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, kernel@collabora.com
X-Mailer: b4 0.14.3
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

Provide test to verify the behavior of BACKGROUND_COLOR DRM CRTC
property.

This is achieved by filling a full-screen primary plane with a given
color and comparing the resulting CRC with the one obtained after
turning off all planes while having the CRTC background set to the same
color.

Also note this is a reworked version of the test that has been dropped
over 5 years ago via commit 33f07391e5f6 ("tests: Remove
kms_crtc_background_color test"), as the required kernel changes never
landed because of missing support in userland.

Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
This has been tested on both VKMS and the Rockchip RK3588 SoC based
Radxa ROCK 5B board.  It relies on the kernel series [1] introducing the
BACKGROUND_COLOR CRTC property and a few additional patches from [2]
enabling the required CRC functionality for the Rockchip platform.

It's worth noting CRC is only supported by the display controller (VOP2)
present in the RK3576 SoC variant.  However, the computation is done by
the hardware before applying the background color, hence it has limited
usage in IGT testing.

Luckily, the frame CRCs can be captured through DPCD, i.e. at
DisplayPort AUX channel level, hence I used the USB-C DP AltMode capable
port of the aforementioned board to perform the actual validation.

[1] https://lore.kernel.org/all/20251118-rk3588-bgcolor-v3-0-a2cc909428ea@collabora.com/
[2] https://gitlab.collabora.com/hardware-enablement/rockchip-3588/linux/-/commits/cristicc/rk3588-vop2-crc

* Test results on VKMS

virtme-ng$ IGT_FORCE_DRIVER=vkms build/tests/kms_crtc_background_color

IGT-Version: 2.2-gf50583245 (x86_64) (Linux: 6.18.0-rc5-next-20251111+ x86_64)
Using IGT_SRANDOM=1763159189 for randomisation
Opened device: /dev/dri/card0
Starting subtest: background-color-red
Starting dynamic subtest: pipe-A-Virtual-1
Dynamic subtest pipe-A-Virtual-1: SUCCESS (0.071s)
Subtest background-color-red: SUCCESS (0.072s)
Starting subtest: background-color-green
Starting dynamic subtest: pipe-A-Virtual-1
Dynamic subtest pipe-A-Virtual-1: SUCCESS (0.072s)
Subtest background-color-green: SUCCESS (0.072s)
Starting subtest: background-color-blue
Starting dynamic subtest: pipe-A-Virtual-1
Dynamic subtest pipe-A-Virtual-1: SUCCESS (0.072s)
Subtest background-color-blue: SUCCESS (0.072s)
Starting subtest: background-color-yellow
Starting dynamic subtest: pipe-A-Virtual-1
Dynamic subtest pipe-A-Virtual-1: SUCCESS (0.073s)
Subtest background-color-yellow: SUCCESS (0.073s)
Starting subtest: background-color-purple
Starting dynamic subtest: pipe-A-Virtual-1
Dynamic subtest pipe-A-Virtual-1: SUCCESS (0.073s)
Subtest background-color-purple: SUCCESS (0.073s)
Starting subtest: background-color-cyan
Starting dynamic subtest: pipe-A-Virtual-1
Dynamic subtest pipe-A-Virtual-1: SUCCESS (0.073s)
Subtest background-color-cyan: SUCCESS (0.073s)
Starting subtest: background-color-black
Starting dynamic subtest: pipe-A-Virtual-1
Dynamic subtest pipe-A-Virtual-1: SUCCESS (0.073s)
Subtest background-color-black: SUCCESS (0.073s)
Starting subtest: background-color-white
Starting dynamic subtest: pipe-A-Virtual-1
Dynamic subtest pipe-A-Virtual-1: SUCCESS (0.072s)
Subtest background-color-white: SUCCESS (0.072s)

* Test results on ROCK5B

rock5b$ cat /sys/kernel/debug/dri/1/vop2/summary

Video Port0: DISABLED
Video Port1: DISABLED
Video Port2: ACTIVE
    Connector: DP-1
	bus_format[1018]: RGB101010_1X30
	output_mode[f] color_space[0]
	background color (10bpc): r=0x0 g=0x0 b=0x0
    Display mode: 3840x2160p60
	clk[594000] real_clk[594000] type[48] flag[9]
	H: 3840 4016 4104 4400
	V: 2160 2164 2174 2250
    Cluster2-win0: ACTIVE
	win_id: 2
	format: XR24 little-endian (0x34325258) glb_alpha[0xff]
	rotate: xmirror: 0 ymirror: 0 rotate_90: 0 rotate_270: 0
	zpos: 0
	src: pos[0, 0] rect[3840 x 2160]
	dst: pos[0, 0] rect[3840 x 2160]
	buf[0]: addr: 0x0000000000000000 pitch: 15360 offset: 0

rock5b$ build/tests/kms_crtc_background_color --device drm:/dev/dri/card1

IGT-Version: 2.2-g3e4ec308e (aarch64) (Linux: 6.18.0-rc1 aarch64)
Using IGT_SRANDOM=1762774806 for randomisation
Opened device: /dev/dri/card1
Starting subtest: background-color-red
Starting dynamic subtest: pipe-C-DP-1
Dynamic subtest pipe-C-DP-1: SUCCESS (0.491s)
Subtest background-color-red: SUCCESS (0.493s)
Starting subtest: background-color-green
Starting dynamic subtest: pipe-C-DP-1
Dynamic subtest pipe-C-DP-1: SUCCESS (0.533s)
Subtest background-color-green: SUCCESS (0.535s)
Starting subtest: background-color-blue
Starting dynamic subtest: pipe-C-DP-1
Dynamic subtest pipe-C-DP-1: SUCCESS (0.541s)
Subtest background-color-blue: SUCCESS (0.544s)
Starting subtest: background-color-yellow
Starting dynamic subtest: pipe-C-DP-1
Dynamic subtest pipe-C-DP-1: SUCCESS (0.535s)
Subtest background-color-yellow: SUCCESS (0.537s)
Starting subtest: background-color-purple
Starting dynamic subtest: pipe-C-DP-1
Dynamic subtest pipe-C-DP-1: SUCCESS (0.536s)
Subtest background-color-purple: SUCCESS (0.538s)
Starting subtest: background-color-cyan
Starting dynamic subtest: pipe-C-DP-1
Dynamic subtest pipe-C-DP-1: SUCCESS (0.539s)
Subtest background-color-cyan: SUCCESS (0.541s)
Starting subtest: background-color-black
Starting dynamic subtest: pipe-C-DP-1
(kms_crtc_background_color:744) igt_pipe_crc-WARNING: Warning on condition all_zero in function crc_sanity_checks, file ../lib/igt_pipe_crc.c:475
(kms_crtc_background_color:744) igt_pipe_crc-WARNING: Suspicious CRC: All values are 0.
(kms_crtc_background_color:744) igt_pipe_crc-WARNING: Warning on condition all_zero in function crc_sanity_checks, file ../lib/igt_pipe_crc.c:475
(kms_crtc_background_color:744) igt_pipe_crc-WARNING: Suspicious CRC: All values are 0.
Dynamic subtest pipe-C-DP-1: SUCCESS (0.535s)
Subtest background-color-black: SUCCESS (0.537s)
Starting subtest: background-color-white
Starting dynamic subtest: pipe-C-DP-1
Dynamic subtest pipe-C-DP-1: SUCCESS (0.540s)
Subtest background-color-white: SUCCESS (0.542s)
---
Changes in v3:
- Added TEST & SUBTEST comment blocks to enable Intel CI testing (Kamil)
- Updated cover letter to reference a newer revision of the kernel
  series [1] which includes VKMS support
- Rebased onto latest upstream changes
  * Made igt_fixture look like an iterator
  * Made igt_main() look like normal function definition
  * Dropped igt_pipe_has_prop()
  * Replaced igt_output_set_pipe() with igt_output_set_crtc()
- Link to v2: https://lore.kernel.org/r/20251118-crtc-bgcolor-v2-1-dce4063f85a9@collabora.com

Changes in v2:
- Added VKMS test report
- Set the value of the CRTC background color property with 16bpc instead
  of 8bpc, to avoid CRC check failures because of framebuffer format
  precision mismatch - display controller drivers shall convert it back
  from 16bpc to their internal representation of the pixel color if
  necessary, e.g. VKMS already uses 16bpc, hence no conversion is
  required in that case
- Replaced deprecated DRM_FORMAT_MOD_NONE with DRM_FORMAT_MOD_LINEAR
- Updated copyright section
- Link to v1: https://lore.kernel.org/r/20251110-crtc-bgcolor-v1-1-28669b692970@collabora.com
---
 lib/igt_kms.c                     |   1 +
 lib/igt_kms.h                     |   3 +-
 tests/kms_crtc_background_color.c | 163 ++++++++++++++++++++++++++++++++++++++
 tests/meson.build                 |   1 +
 4 files changed, 167 insertions(+), 1 deletion(-)

diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index e3e9bf9bce07..546bb3dc1047 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -718,6 +718,7 @@ const char * const igt_colorop_prop_names[IGT_NUM_COLOROP_PROPS] = {
 };
 
 const char * const igt_crtc_prop_names[IGT_NUM_CRTC_PROPS] = {
+	[IGT_CRTC_BACKGROUND] = "BACKGROUND_COLOR",
 	[IGT_CRTC_CTM] = "CTM",
 	[IGT_CRTC_GAMMA_LUT] = "GAMMA_LUT",
 	[IGT_CRTC_GAMMA_LUT_SIZE] = "GAMMA_LUT_SIZE",
diff --git a/lib/igt_kms.h b/lib/igt_kms.h
index b00884640e16..8c1ac5a545a7 100644
--- a/lib/igt_kms.h
+++ b/lib/igt_kms.h
@@ -154,7 +154,8 @@ void kmstest_restore_vt_mode(void);
 void kmstest_set_vt_text_mode(void);
 
 enum igt_atomic_crtc_properties {
-       IGT_CRTC_CTM = 0,
+       IGT_CRTC_BACKGROUND = 0,
+       IGT_CRTC_CTM,
        IGT_CRTC_GAMMA_LUT,
        IGT_CRTC_GAMMA_LUT_SIZE,
        IGT_CRTC_DEGAMMA_LUT,
diff --git a/tests/kms_crtc_background_color.c b/tests/kms_crtc_background_color.c
new file mode 100644
index 000000000000..b1859964291f
--- /dev/null
+++ b/tests/kms_crtc_background_color.c
@@ -0,0 +1,163 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2013,2014 Intel Corporation
+ * Copyright © 2025 Amazon.com, Inc. or its affiliates.
+ * Copyright © 2025 Collabora, Ltd.
+ */
+
+/**
+ * TEST: crtc background color
+ * Category: Display
+ * Description: Test background color feature with CRC at CRTC
+ * Driver requirement: i915, xe
+ * Mega feature: General Display Features
+ */
+
+#include "igt.h"
+
+IGT_TEST_DESCRIPTION("Test crtc background color feature");
+
+typedef struct {
+	int drm_fd;
+	int debugfs;
+	igt_display_t display;
+} data_t;
+
+#define __DRM_ARGB64_PREP(c, shift)					\
+	(((__u64)(c) & 0xffffU) << (shift))
+
+#define DRM_ARGB64_PREP(alpha, red, green, blue)			\
+	(__DRM_ARGB64_PREP(alpha, 48) |					\
+	 __DRM_ARGB64_PREP(red,   32) |					\
+	 __DRM_ARGB64_PREP(green, 16) |					\
+	 __DRM_ARGB64_PREP(blue,   0))
+
+static void test_background(data_t *data, enum pipe pipe, igt_output_t *output,
+			    __u16 red, __u16 green, __u16 blue)
+{
+	igt_display_t *display = &data->display;
+	igt_crc_t plane_crc, bg_crc;
+	igt_pipe_crc_t *pipe_crc;
+	igt_plane_t *plane;
+	drmModeModeInfo *mode;
+	struct igt_fb fb;
+
+	igt_display_reset(display);
+
+	igt_output_set_crtc(output, igt_crtc_for_pipe(output->display, pipe));
+	mode = igt_output_get_mode(output);
+
+	plane = igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
+
+	/* Fill the primary plane and set the background to the same color */
+	igt_create_color_fb(data->drm_fd,
+			    mode->hdisplay, mode->vdisplay,
+			    DRM_FORMAT_XRGB8888,
+			    DRM_FORMAT_MOD_LINEAR,
+			    (double)red / 0xffff,
+			    (double)green / 0xffff,
+			    (double)blue / 0xffff,
+			    &fb);
+
+	igt_plane_set_fb(plane, &fb);
+	igt_pipe_set_prop_value(&data->display, pipe, IGT_CRTC_BACKGROUND,
+				DRM_ARGB64_PREP(0xffff, red, green, blue));
+	igt_display_commit2(&data->display, COMMIT_ATOMIC);
+
+	pipe_crc = igt_pipe_crc_new(data->drm_fd, pipe, IGT_PIPE_CRC_SOURCE_AUTO);
+	igt_pipe_crc_collect_crc(pipe_crc, &plane_crc);
+
+	/* Turn off the primary plane so that only the background is visible */
+	igt_plane_set_fb(plane, NULL);
+	igt_display_commit2(&data->display, COMMIT_ATOMIC);
+	igt_pipe_crc_collect_crc(pipe_crc, &bg_crc);
+
+	/*
+	 * The test assumes hardware is able to generate valid CRCs when setting
+	 * the background color. Some platforms, e.g. Intel, might require at
+	 * least one plane to be visible before reading the pipe-level ("dmux")
+	 * CRC. Other platforms, e.g. Rockchip, do not take background color
+	 * into account when computing CRC at CRTC level.
+	 * A possible workaround would be to use alternative CRC sources, e.g.
+	 * where computation is performed at encoder or sink level.
+	 */
+	igt_assert_crc_equal(&plane_crc, &bg_crc);
+
+	/* Clean-up */
+	igt_pipe_set_prop_value(&data->display, pipe, IGT_CRTC_BACKGROUND,
+				DRM_ARGB64_PREP(0xffff, 0, 0, 0));
+	igt_pipe_crc_free(pipe_crc);
+	igt_output_set_crtc(output, NULL);
+	igt_display_commit(display);
+	igt_remove_fb(data->drm_fd, &fb);
+}
+
+/**
+ * SUBTEST: background-color-%s
+ * Description: Tests %arg[1] in background color
+ *
+ * arg[1]:
+ *
+ * @red:      red
+ * @green:    green
+ * @blue:     blue
+ * @yellow:   yellow
+ * @purple:   purple
+ * @cyan:     cyan
+ * @black:    black
+ * @white:    white
+ */
+
+int igt_main()
+{
+	igt_output_t *output;
+	data_t data = {};
+	enum pipe pipe;
+	int i;
+
+	struct {
+		const char *color;
+		__u16 red;
+		__u16 green;
+		__u16 blue;
+	} tests[] = {
+		{ "red",    0xffff, 0x0000, 0x0000, },
+		{ "green",  0x0000, 0xffff, 0x0000, },
+		{ "blue",   0x0000, 0x0000, 0xffff, },
+		{ "yellow", 0xffff, 0xffff, 0x0000, },
+		{ "purple", 0xffff, 0x0000, 0xffff, },
+		{ "cyan",   0x0000, 0xffff, 0xffff, },
+		{ "black",  0x0000, 0x0000, 0x0000, },
+		{ "white",  0xffff, 0xffff, 0xffff, },
+	};
+
+	igt_fixture() {
+		data.drm_fd = drm_open_driver_master(DRIVER_ANY);
+
+		kmstest_set_vt_graphics_mode();
+
+		igt_display_require(&data.display, data.drm_fd);
+		igt_display_require_output(&data.display);
+		igt_require_pipe_crc(data.drm_fd);
+
+		data.debugfs = igt_debugfs_dir(data.drm_fd);
+	}
+
+	for (i = 0; i < ARRAY_SIZE(tests); i++) {
+		igt_describe_f("Test crtc background color %s", tests[i].color);
+		igt_subtest_with_dynamic_f("background-color-%s", tests[i].color) {
+			for_each_pipe_with_single_output(&data.display, pipe, output) {
+				igt_require(data.display.pipes[pipe].props[IGT_CRTC_BACKGROUND]);
+
+				igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(pipe), output->name)
+					test_background(&data, pipe, output, tests[i].red,
+							tests[i].green, tests[i].blue);
+			}
+		}
+	}
+
+	igt_fixture() {
+		igt_display_fini(&data.display);
+		drm_close_driver(data.drm_fd);
+	}
+}
diff --git a/tests/meson.build b/tests/meson.build
index 8847070252ce..045acb5973fd 100644
--- a/tests/meson.build
+++ b/tests/meson.build
@@ -28,6 +28,7 @@ test_progs = [
 	'kms_concurrent',
 	'kms_colorop',
 	'kms_content_protection',
+	'kms_crtc_background_color',
 	'kms_cursor_crc',
 	'kms_cursor_edge_walk',
 	'kms_cursor_legacy',

---
base-commit: f38f4d8e9c65aff45ac807e646d06e38bc3193a2
change-id: 20251110-crtc-bgcolor-f6ed9a58e0bf

