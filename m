Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EDAE484FCFE
	for <lists+dri-devel@lfdr.de>; Fri,  9 Feb 2024 20:39:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 97BAD10FB81;
	Fri,  9 Feb 2024 19:39:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=riseup.net header.i=@riseup.net header.b="OdEslVis";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.riseup.net (mx1.riseup.net [198.252.153.129])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A58F10FB79;
 Fri,  9 Feb 2024 19:39:24 +0000 (UTC)
Received: from fews02-sea.riseup.net (fews02-sea-pn.riseup.net [10.0.1.112])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx1.riseup.net (Postfix) with ESMTPS id 4TWkgw0NrvzDqLY;
 Fri,  9 Feb 2024 19:39:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=riseup.net; s=squak;
 t=1707507564; bh=sYvMKFDzek6t7rEQBpeVyHuy9VkZ0Ujvlepo00gMB6k=;
 h=From:Date:Subject:To:Cc:From;
 b=OdEslVisyOna3Of/Ux91ZiyeM0PxiEmbfJLITnnwKt4PASdbXQcOvo38E/1w8kOcm
 f9KW3Ttjx1ZdcbetxuFXngpP0OyxYrpBlWiCZeC6EKrsWWfTfcmX6DHJPfGR3+tfQu
 J+PC+/DYXnmcYVmSIWDei2z8O2kjWATUoFJErxa4=
X-Riseup-User-ID: 0D63C274C99F943F03DA0D2A95A1F7CA86479FDCA1985320419B625F4D742BFB
Received: from [127.0.0.1] (localhost [127.0.0.1])
 by fews02-sea.riseup.net (Postfix) with ESMTPSA id 4TWkgm0VSVzFsYw;
 Fri,  9 Feb 2024 19:39:15 +0000 (UTC)
From: Arthur Grillo <arthurgrillo@riseup.net>
Date: Fri, 09 Feb 2024 16:39:09 -0300
Subject: [PATCH i-g-t v3] benchmarks: Add VKMS benchmark
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240209-bench-v3-1-24a01f366d3b@riseup.net>
X-B4-Tracking: v=1; b=H4sIAFx/xmUC/12Myw6CMBBFf4XM2po+gBZX/odxUcoosymkxUZD+
 u8WEhN1eW7uOStEDIQRTtUKARNFmnwBdajAjdbfkdFQGCSXNZdcsx69G5nqlDYd2t7WGsp3Dni
 j5965XAuPFJcpvPZsEtv6X0iCCaaFauxQy9a0/Bwo4mM+elxgSyT5rZmPJosm0DlEwZsi/2g55
 zcLEwRk0gAAAA==
To: dri-devel@lists.freedesktop.org, igt-dev@lists.freedesktop.org
Cc: Petri Latvala <adrinael@adrinael.net>, Arkadiusz Hiler <arek@hiler.eu>, 
 Kamil Konieczny <kamil.konieczny@linux.intel.com>, 
 Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>, 
 Bhanuprakash Modem <bhanuprakash.modem@intel.com>, 
 Ashutosh Dixit <ashutosh.dixit@intel.com>, 
 Pekka Paalanen <pekka.paalanen@haloniitty.fi>, 
 Louis Chauvet <louis.chauvet@bootlin.com>, 
 Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>, 
 Melissa Wen <melissa.srw@gmail.com>, 
 =?utf-8?q?Ma=C3=ADra_Canal?= <mairacanal@riseup.net>, 
 Haneen Mohammed <hamohammed.sa@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Pekka Paalanen <pekka.paalanen@collabora.com>, 
 =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>, 
 Arthur Grillo <arthurgrillo@riseup.net>
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

Create a benchmark for the VKMS driver. Use a KMS layout with deliberate
odd sizes to try to avoid alignment accidents and run it for FRAME_COUNT
frames flipping framebuffers in each plane.

This benchmark was suggested by Pekka Paalanen to better analyse
possible performance regression on the Virtual Kernel Modesetting(VKMS)
driver.

With this benchmark I was able to determine two performance regression:

- 322d716a3e8a ("drm/vkms: isolate pixel conversion functionality")
- cc4fd2934d41 ("drm/vkms: Isolate writeback pixel conversion functions")

Link: https://lore.kernel.org/all/20240202214527.1d97c881@ferris.localdomain/
Suggested-by: Pekka Paalanen <pekka.paalanen@haloniitty.fi>
Acked-by: Pekka Paalanen <pekka.paalanen@collabora.com>
Acked-by: Maíra Canal <mcanal@igalia.com>
Acked-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Signed-off-by: Arthur Grillo <arthurgrillo@riseup.net>
---
Changes in v3:
- Change primary plane width to not extend outside the CRTC size
- Explicitly set a big CRTC size (Peeka Paalanen)
- Report time spent in the loop (Peeka Paalanen)
- Put file name in alphabetical order on meson script (Kamil Konieczny)
- Link to v2: https://lore.kernel.org/r/20240208-bench-v2-1-1eccee1055ad@riseup.net

Changes in v2:
- Zero initialize data
- Don't wrap igt_create_* functions (Juha-Pekka Heikkila)
- Add a `break;` when a pipe is found (Pekka Paalanen)
- Rename file to kms_fb_stress.c (Kamil Konieczny)
- Replace 2 by NUM_FBS (Juha-Pekka Heikkila)
- Replace license text by SPDX License (Kamil Konieczny)
- Move explanations to commit description (Kamil Konieczny)
- Require output after find_wb_output() (Pekka Paalanen & Juha-Pekka
  Heikkila)
- Remove unnecessary commit (Pekka Paalanen)
- Link to v1: https://lore.kernel.org/r/20240207-bench-v1-1-7135ad426860@riseup.net
---
 benchmarks/kms_fb_stress.c | 208 +++++++++++++++++++++++++++++++++++++++++++++
 benchmarks/meson.build     |   1 +
 2 files changed, 209 insertions(+)

diff --git a/benchmarks/kms_fb_stress.c b/benchmarks/kms_fb_stress.c
new file mode 100644
index 000000000000..9a0e98bed8ad
--- /dev/null
+++ b/benchmarks/kms_fb_stress.c
@@ -0,0 +1,208 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2024 Arthur Grillo
+ */
+
+#include "igt.h"
+
+#define FRAME_COUNT 100
+#define NUM_FBS 2
+
+struct rect_t {
+	int x, y;
+	int width, height;
+};
+
+struct plane_t {
+	igt_plane_t *base;
+	struct rect_t rect;
+	uint32_t format;
+	struct igt_fb fbs[NUM_FBS];
+};
+
+struct kms_t {
+	struct rect_t crtc;
+	struct plane_t primary;
+	struct plane_t overlay_a;
+	struct plane_t overlay_b;
+	struct plane_t writeback;
+};
+
+struct data_t {
+	int fd;
+	igt_display_t display;
+	igt_output_t *wb_output;
+	drmModeModeInfo *mode;
+	struct kms_t kms;
+};
+
+static void plane_setup(struct plane_t *plane, int index)
+{
+	igt_plane_set_size(plane->base, plane->rect.width, plane->rect.height);
+	igt_plane_set_position(plane->base, plane->rect.x, plane->rect.y);
+	igt_plane_set_fb(plane->base, &plane->fbs[index]);
+}
+
+static void gen_fbs(struct data_t *data)
+{
+	struct kms_t *kms = &data->kms;
+	drmModeModeInfo *mode = igt_output_get_mode(data->wb_output);
+
+	for (int i = 0; i < NUM_FBS; i++) {
+		igt_create_color_fb(data->fd, kms->primary.rect.width, kms->primary.rect.height,
+				    kms->primary.format, DRM_FORMAT_MOD_LINEAR,
+				    !i, i, i,
+				    &kms->primary.fbs[i]);
+
+		igt_create_color_fb(data->fd, kms->overlay_a.rect.width, kms->overlay_a.rect.height,
+				    kms->overlay_a.format, DRM_FORMAT_MOD_LINEAR,
+				    i, !i, i,
+				    &kms->overlay_a.fbs[i]);
+
+		igt_create_color_fb(data->fd, kms->overlay_b.rect.width, kms->overlay_b.rect.height,
+				    kms->overlay_b.format, DRM_FORMAT_MOD_LINEAR,
+				    i, i, !i,
+				    &kms->overlay_b.fbs[i]);
+
+		kms->writeback.rect.width = mode->hdisplay;
+		kms->writeback.rect.height = mode->vdisplay;
+		igt_create_fb(data->fd, kms->writeback.rect.width, kms->writeback.rect.height,
+			      kms->writeback.format, DRM_FORMAT_MOD_LINEAR,
+			      &kms->writeback.fbs[i]);
+	}
+}
+
+static igt_output_t *find_wb_output(struct data_t *data)
+{
+	for (int i = 0; i < data->display.n_outputs; i++) {
+		igt_output_t *output = &data->display.outputs[i];
+
+		if (output->config.connector->connector_type != DRM_MODE_CONNECTOR_WRITEBACK)
+			continue;
+
+		return output;
+
+	}
+
+	return NULL;
+}
+
+static void set_crtc_size(struct data_t *data)
+{
+	drmModeModeInfo *mode;
+	struct rect_t *crtc = &data->kms.crtc;
+
+	for_each_connector_mode(data->wb_output) {
+		mode = &data->wb_output->config.connector->modes[j__];
+		if (mode->hdisplay == crtc->width && mode->vdisplay == crtc->height) {
+			igt_output_override_mode(data->wb_output, mode);
+			return;
+		}
+	}
+
+
+	igt_assert_f(0, "CRTC size %dx%d not supported\n", crtc->width, crtc->height);
+}
+
+static struct kms_t default_kms = {
+	.crtc = {
+		.width = 4096, .height = 2160,
+	},
+	.primary = {
+		.rect = {
+			.x = 101, .y = 0,
+			.width = 3639, .height = 2160,
+		},
+		.format = DRM_FORMAT_XRGB8888,
+	},
+	.overlay_a = {
+		.rect = {
+			.x = 201, .y = 199,
+			.width = 3033, .height = 1777,
+		},
+		.format = DRM_FORMAT_XRGB16161616,
+	},
+	.overlay_b = {
+		.rect = {
+			.x = 1800, .y = 250,
+			.width = 1507, .height = 1400,
+		},
+		.format = DRM_FORMAT_ARGB8888,
+	},
+	.writeback = {
+		.rect = {
+			.x = 0, .y = 0,
+			// Size is to be determined at runtime
+		},
+		.format = DRM_FORMAT_XRGB8888,
+	},
+};
+
+
+igt_simple_main
+{
+	struct data_t data = {0};
+	enum pipe pipe = PIPE_NONE;
+	struct timespec then, now;
+	double elapsed;
+
+	data.kms = default_kms;
+
+	data.fd = drm_open_driver_master(DRIVER_ANY);
+
+	igt_display_require(&data.display, data.fd);
+
+	kmstest_set_vt_graphics_mode();
+
+	igt_display_require(&data.display, data.fd);
+	igt_require(data.display.is_atomic);
+
+	igt_display_require_output(&data.display);
+
+	igt_display_reset(&data.display);
+
+	data.wb_output = find_wb_output(&data);
+	igt_require(data.wb_output);
+
+	for_each_pipe(&data.display, pipe) {
+		igt_debug("Selecting pipe %s to %s\n",
+			  kmstest_pipe_name(pipe),
+			  igt_output_name(data.wb_output));
+		igt_output_set_pipe(data.wb_output, pipe);
+		break;
+	}
+
+	set_crtc_size(&data);
+
+	gen_fbs(&data);
+
+	data.kms.primary.base = igt_output_get_plane_type(data.wb_output, DRM_PLANE_TYPE_PRIMARY);
+	data.kms.overlay_a.base = igt_output_get_plane_type_index(data.wb_output,
+								  DRM_PLANE_TYPE_OVERLAY, 0);
+	data.kms.overlay_b.base = igt_output_get_plane_type_index(data.wb_output,
+								  DRM_PLANE_TYPE_OVERLAY, 1);
+
+	igt_assert_eq(igt_gettime(&then), 0);
+
+	for (int i = 0; i < FRAME_COUNT; i++) {
+		int fb_index = i % NUM_FBS;
+
+		plane_setup(&data.kms.primary, fb_index);
+
+		plane_setup(&data.kms.overlay_a, fb_index);
+
+		plane_setup(&data.kms.overlay_b, fb_index);
+
+		igt_output_set_writeback_fb(data.wb_output, &data.kms.writeback.fbs[fb_index]);
+
+		igt_display_commit2(&data.display, COMMIT_ATOMIC);
+	}
+
+	igt_assert_eq(igt_gettime(&now), 0);
+	elapsed = igt_time_elapsed(&then, &now);
+
+	igt_info("Time spent in the loop with %d frames: %lfs.\n", FRAME_COUNT, elapsed);
+
+	igt_display_fini(&data.display);
+	drm_close_driver(data.fd);
+}
diff --git a/benchmarks/meson.build b/benchmarks/meson.build
index c451268bc44f..2c9a88fd3b00 100644
--- a/benchmarks/meson.build
+++ b/benchmarks/meson.build
@@ -17,6 +17,7 @@ benchmark_progs = [
 	'intel_upload_blit_large_gtt',
 	'intel_upload_blit_large_map',
 	'intel_upload_blit_small',
+	'kms_fb_stress',
 	'kms_vblank',
 	'prime_lookup',
 	'vgem_mmap',

---
base-commit: c58c5fb6aa1cb7d3627a15e364816a7a2add9edc
change-id: 20240207-bench-393789eaba47

Best regards,
-- 
Arthur Grillo <arthurgrillo@riseup.net>

