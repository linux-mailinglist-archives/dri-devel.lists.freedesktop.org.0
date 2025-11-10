Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 67A01C46D41
	for <lists+dri-devel@lfdr.de>; Mon, 10 Nov 2025 14:18:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E648010E386;
	Mon, 10 Nov 2025 13:18:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="Awepr4/2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B35E10E386;
 Mon, 10 Nov 2025 13:18:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1762780716;
 bh=tjWjbZez+jeeg8E2wv4o2/fvFb63tGgqen521+zuFgM=;
 h=From:Date:Subject:To:Cc:From;
 b=Awepr4/2JmKBRcxQZeATqn9nBAkrRDcpOfEAR5aV09s0rLKysfCJgypk094I80cCl
 9qxVk/EO71m4y+Mj2A2jE37+uF8D+LkByFQl5EIxc4iXjy1J2FdpOflRTxACEExwOI
 9RiP/ne1Y6mkaDdCm0h7IZ0eTAIpE/EkhlTSQkx9K+IyPAnRwcprjG5Lw1JUWd2/Ut
 Dxt/yBCBRVfoktp6f5N9fhF7etQx1fRxo+xwKggzftW93CqbZxiBiux4Y6xKleOdoL
 aiIEWLRQytourre2NUQaKTU4uxr0qfRkv/UN5wgj/tElikBn+4lO7w0tmixChOFi6o
 UK69cpFXXkw+Q==
Received: from localhost (unknown [82.79.138.145])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits)
 server-digest SHA256) (No client certificate requested)
 (Authenticated sender: cristicc)
 by bali.collaboradmins.com (Postfix) with UTF8SMTPSA id CF20917E12C4;
 Mon, 10 Nov 2025 14:18:35 +0100 (CET)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Date: Mon, 10 Nov 2025 15:18:05 +0200
Subject: [PATCH i-g-t] tests: (Re)add kms_crtc_background_color test
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20251110-crtc-bgcolor-v1-1-28669b692970@collabora.com>
X-B4-Tracking: v=1; b=H4sIAAzmEWkC/x3MQQqAIBBA0avErBvQoKiuEi1KRxsIjTEiEO+et
 HyL/zMkEqYEc5NB6OHEMVTotgFzbMETsq2GTnW91lqhkdvg7k08o6AbyE5bP5LaHdTkEnL8/rs
 FGD3esJbyAYMZ7hFlAAAA
X-Change-ID: 20251110-crtc-bgcolor-f6ed9a58e0bf
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Sandy Huang <hjc@rock-chips.com>, 
 =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
 Andy Yan <andy.yan@rock-chips.com>
Cc: igt-dev@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
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

This is done by filling a full-screen primary plane with a given color
and comparing the resulting CRC with the one obtained after turning off
all planes while having the CRTC background set to the same color.

It's worth noting this is a reworked version of the test that has been
dropped over 5 years ago via commit 33f07391e5f6 ("tests: Remove
kms_crtc_background_color test"), as the required kernel changes never
landed because of missing userspace support.

Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
This has been tested on a Radxa ROCK 5B board which is based on Rockchip
RK3588 SoC.  It relies on the kernel series [1] introducing the
BACKGROUND_COLOR CRTC property and a few additional patches from [2]
enabling the required CRC functionality for the Rockchip platform (still
require a bit more work before sending those upstream).

It's worth noting CRC is only supported by the display controller (VOP2)
present in the RK3576 SoC variant.  However, the computation is done by
the hardware before applying the background color, hence it has limited
usage in IGT testing.

Luckily, the frame CRCs can be captured through DPCD, i.e. at
DisplayPort AUX channel level, hence I used the USB-C DP AltMode capable
port of the aforementioned board to perform the actual validation.

[1] https://lore.kernel.org/all/20251013-rk3588-bgcolor-v2-0-25cc3810ba8c@collabora.com/
[2] https://gitlab.collabora.com/hardware-enablement/rockchip-3588/linux/-/commits/cristicc/rk3588-vop2-crc

root@rock5b$ cat /sys/kernel/debug/dri/1/vop2/summary

cat /sys/kernel/debug/dri/1/vop2/summary
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

root@rock5b$ ./kms_crtc_background_color --device drm:/dev/dri/card1

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
 lib/igt_kms.c                     |   1 +
 lib/igt_kms.h                     |   3 +-
 tests/kms_crtc_background_color.c | 139 ++++++++++++++++++++++++++++++++++++++
 tests/meson.build                 |   1 +
 4 files changed, 143 insertions(+), 1 deletion(-)

diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index 9208c8dbfc86..7c0848865038 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -705,6 +705,7 @@ const char * const igt_plane_prop_names[IGT_NUM_PLANE_PROPS] = {
 };
 
 const char * const igt_crtc_prop_names[IGT_NUM_CRTC_PROPS] = {
+	[IGT_CRTC_BACKGROUND] = "BACKGROUND_COLOR",
 	[IGT_CRTC_CTM] = "CTM",
 	[IGT_CRTC_GAMMA_LUT] = "GAMMA_LUT",
 	[IGT_CRTC_GAMMA_LUT_SIZE] = "GAMMA_LUT_SIZE",
diff --git a/lib/igt_kms.h b/lib/igt_kms.h
index eff76f0de0b3..a19f8d126a8d 100644
--- a/lib/igt_kms.h
+++ b/lib/igt_kms.h
@@ -156,7 +156,8 @@ void kmstest_restore_vt_mode(void);
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
index 000000000000..4e6d183b736d
--- /dev/null
+++ b/tests/kms_crtc_background_color.c
@@ -0,0 +1,139 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2013,2014 Intel Corporation
+ * Copyright © 2025 Collabora, Ltd.
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
+#define __DRM_ARGB64_PREP(c, shift, bpc)			\
+	(((__u64)(c) << (16 - (bpc)) & 0xffffU) << (shift))
+
+#define DRM_ARGB64_PREP_BPC(alpha, red, green, blue, bpc)	\
+	(__DRM_ARGB64_PREP(alpha, 48, bpc) |			\
+	 __DRM_ARGB64_PREP(red,   32, bpc) |			\
+	 __DRM_ARGB64_PREP(green, 16, bpc) |			\
+	 __DRM_ARGB64_PREP(blue,   0, bpc))
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
+	igt_output_set_pipe(output, pipe);
+	mode = igt_output_get_mode(output);
+
+	plane = igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
+
+	/* Fill the primary plane and set the background to the same color */
+	igt_create_color_fb(data->drm_fd,
+			    mode->hdisplay, mode->vdisplay,
+			    DRM_FORMAT_XRGB8888,
+			    DRM_FORMAT_MOD_NONE,
+			    (double)red / 0xffff,
+			    (double)green / 0xffff,
+			    (double)blue / 0xffff,
+			    &fb);
+
+	igt_plane_set_fb(plane, &fb);
+	igt_pipe_set_prop_value(&data->display, pipe, IGT_CRTC_BACKGROUND,
+				DRM_ARGB64_PREP_BPC(0xffff, red, green, blue, 8));
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
+				DRM_ARGB64_PREP_BPC(0xffff, 0, 0, 0, 8));
+	igt_pipe_crc_free(pipe_crc);
+	igt_output_set_pipe(output, PIPE_NONE);
+	igt_display_commit(display);
+	igt_remove_fb(data->drm_fd, &fb);
+}
+
+igt_main
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
+	igt_fixture {
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
+				igt_require(igt_pipe_has_prop(&data.display, pipe,
+							      IGT_CRTC_BACKGROUND));
+
+				igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(pipe), output->name)
+					test_background(&data, pipe, output, tests[i].red,
+							tests[i].green, tests[i].blue);
+			}
+		}
+	}
+
+	igt_fixture {
+		igt_display_fini(&data.display);
+		drm_close_driver(data.drm_fd);
+	}
+}
diff --git a/tests/meson.build b/tests/meson.build
index 9736f2338507..06827b41a00c 100644
--- a/tests/meson.build
+++ b/tests/meson.build
@@ -27,6 +27,7 @@ test_progs = [
 	'kms_color',
 	'kms_concurrent',
 	'kms_content_protection',
+	'kms_crtc_background_color',
 	'kms_cursor_crc',
 	'kms_cursor_edge_walk',
 	'kms_cursor_legacy',

---
base-commit: 862eb176244feac8ee711f381fe1be1fdc6a7ede
change-id: 20251110-crtc-bgcolor-f6ed9a58e0bf

