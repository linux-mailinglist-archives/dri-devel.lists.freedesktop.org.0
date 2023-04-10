Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 24DB06DC6F2
	for <lists+dri-devel@lfdr.de>; Mon, 10 Apr 2023 14:55:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 57BF310E081;
	Mon, 10 Apr 2023 12:54:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 020CD10E081
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Apr 2023 12:54:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=WJCj+V70hpVc3xrgHcQqTuyuJDo+GPXNf6JHMzFdl8s=; b=KHhbuXdKuX3aK1aJKS3b6YXYD5
 2wVDsytSbZjKnMPf1b49xSE1w9M6CcNplY4FZbA0bBsUAiejv5HuXoRRWsrrkq6M3jbxEoWyPczs1
 tmrKx10XJuZIvm+osf3lqprZTTclhg4pEhs2hxc4Sf8WSqktqQUnljC+tPZnnyZUXStyU8Aypsvo+
 bN7CYOimHQStcGjXGIGIZkEWcCjha/eVeGoTEXDgK8lgEjbGXYTTV2BWysj9aVXxRlvKDyxpJKnXP
 YcokfE9Tby1Dn9RYQ9iL50iQI7/dMyW2xQNmCCtTDXu7HCxrtEqMiEZCb012rn4H0sSj4ykoN9md4
 Z8wB6Mfw==;
Received: from [177.34.168.16] (helo=bowie..)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1plr2q-00DrKZ-Vd; Mon, 10 Apr 2023 14:54:53 +0200
From: =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>
To: David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
 Melissa Wen <mwen@igalia.com>, Haneen Mohammed <hamohammed.sa@gmail.com>,
 Igor Matheus Andrade Torrente <igormtorrente@gmail.com>
Subject: [PATCH v2] drm/vkms: add module parameter to set background color
Date: Mon, 10 Apr 2023 09:54:35 -0300
Message-Id: <20230410125435.128689-1-mcanal@igalia.com>
X-Mailer: git-send-email 2.39.2
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
Cc: =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

After commit 8ba1648567e2 ("drm: vkms: Refactor the plane composer to
accept new formats") the composition is no longer performed on top of
the primary plane, but instead on top of the CRTC, which means that
now we have a background.

This opens to the possibility of coloring the background with a
personalized color. Therefore, create a module parameter that takes a
unsigned int number as an XRGB8888 color and set the background
color to it. That said, the composition will be performed on top of
this background color. By default, the background color is black.

Signed-off-by: Maíra Canal <mcanal@igalia.com>
---

In order to test this functionality, I wrote some IGT tests to ensure that
it is working correctly [1]. The tests take the CRC of a colored primary
plane, offset the primary plane out of the screen, and take the CRC
of the colored background. The two CRC must be equal.

v1 -> v2 [2]

* Use XRGB8888 as input format to avoid compilation errors on PPC (kernel test robot)

[1] https://gitlab.freedesktop.org/mairacanal/igt-gpu-tools/-/tree/vkms/background-color
[2] https://lore.kernel.org/dri-devel/20230406172002.124456-1-mcanal@igalia.com/T/

Best Regards,
- Maíra Canal

---
 Documentation/gpu/vkms.rst           |  2 --
 drivers/gpu/drm/vkms/vkms_composer.c | 20 ++++++++++++++------
 drivers/gpu/drm/vkms/vkms_drv.c      |  6 ++++++
 drivers/gpu/drm/vkms/vkms_drv.h      |  4 ++++
 4 files changed, 24 insertions(+), 8 deletions(-)

diff --git a/Documentation/gpu/vkms.rst b/Documentation/gpu/vkms.rst
index 49db221c0f52..dc01689d8c76 100644
--- a/Documentation/gpu/vkms.rst
+++ b/Documentation/gpu/vkms.rst
@@ -121,8 +121,6 @@ There's lots of plane features we could add support for:
 - ARGB format on primary plane: blend the primary plane into background with
   translucent alpha.
 
-- Add background color KMS property[Good to get started].
-
 - Full alpha blending on all planes.
 
 - Rotation, scaling.
diff --git a/drivers/gpu/drm/vkms/vkms_composer.c b/drivers/gpu/drm/vkms/vkms_composer.c
index 8e53fa80742b..b0056fad908e 100644
--- a/drivers/gpu/drm/vkms/vkms_composer.c
+++ b/drivers/gpu/drm/vkms/vkms_composer.c
@@ -79,7 +79,8 @@ static void fill_background(const struct pixel_argb_u16 *background_color,
  * from all planes, calculates the crc32 of the output from the former step,
  * and, if necessary, convert and store the output to the writeback buffer.
  */
-static void blend(struct vkms_writeback_job *wb,
+static void blend(struct vkms_device *vkms_dev,
+		  struct vkms_writeback_job *wb,
 		  struct vkms_crtc_state *crtc_state,
 		  u32 *crc32, struct line_buffer *stage_buffer,
 		  struct line_buffer *output_buffer, size_t row_size)
@@ -87,7 +88,12 @@ static void blend(struct vkms_writeback_job *wb,
 	struct vkms_plane_state **plane = crtc_state->active_planes;
 	u32 n_active_planes = crtc_state->num_active_planes;
 
-	const struct pixel_argb_u16 background_color = { .a = 0xffff };
+	const struct pixel_argb_u16 background_color = {
+		.a =  0xffff,
+		.r = ((*vkms_dev->config->background_color >> 16) & 0xff) * 257,
+		.g = ((*vkms_dev->config->background_color >> 8) & 0xff) * 257,
+		.b = (*vkms_dev->config->background_color & 0xff) * 257,
+	};
 
 	size_t crtc_y_limit = crtc_state->base.crtc->mode.vdisplay;
 
@@ -139,7 +145,8 @@ static int check_iosys_map(struct vkms_crtc_state *crtc_state)
 	return 0;
 }
 
-static int compose_active_planes(struct vkms_writeback_job *active_wb,
+static int compose_active_planes(struct vkms_device *vkms_dev,
+				 struct vkms_writeback_job *active_wb,
 				 struct vkms_crtc_state *crtc_state,
 				 u32 *crc32)
 {
@@ -178,7 +185,7 @@ static int compose_active_planes(struct vkms_writeback_job *active_wb,
 		goto free_stage_buffer;
 	}
 
-	blend(active_wb, crtc_state, crc32, &stage_buffer,
+	blend(vkms_dev, active_wb, crtc_state, crc32, &stage_buffer,
 	      &output_buffer, line_width * pixel_size);
 
 	kvfree(output_buffer.pixels);
@@ -205,6 +212,7 @@ void vkms_composer_worker(struct work_struct *work)
 	struct drm_crtc *crtc = crtc_state->base.crtc;
 	struct vkms_writeback_job *active_wb = crtc_state->active_writeback;
 	struct vkms_output *out = drm_crtc_to_vkms_output(crtc);
+	struct vkms_device *vkms_dev = vkms_output_to_vkms_device(out);
 	bool crc_pending, wb_pending;
 	u64 frame_start, frame_end;
 	u32 crc32 = 0;
@@ -228,9 +236,9 @@ void vkms_composer_worker(struct work_struct *work)
 		return;
 
 	if (wb_pending)
-		ret = compose_active_planes(active_wb, crtc_state, &crc32);
+		ret = compose_active_planes(vkms_dev, active_wb, crtc_state, &crc32);
 	else
-		ret = compose_active_planes(NULL, crtc_state, &crc32);
+		ret = compose_active_planes(vkms_dev, NULL, crtc_state, &crc32);
 
 	if (ret)
 		return;
diff --git a/drivers/gpu/drm/vkms/vkms_drv.c b/drivers/gpu/drm/vkms/vkms_drv.c
index 6d3a2d57d992..bb6990882608 100644
--- a/drivers/gpu/drm/vkms/vkms_drv.c
+++ b/drivers/gpu/drm/vkms/vkms_drv.c
@@ -51,6 +51,10 @@ static bool enable_overlay;
 module_param_named(enable_overlay, enable_overlay, bool, 0444);
 MODULE_PARM_DESC(enable_overlay, "Enable/Disable overlay support");
 
+static unsigned int background_color;
+module_param_named(background_color, background_color, uint, 0644);
+MODULE_PARM_DESC(background_color, "Background color (0xRRGGBB)");
+
 DEFINE_DRM_GEM_FOPS(vkms_driver_fops);
 
 static void vkms_release(struct drm_device *dev)
@@ -99,6 +103,7 @@ static int vkms_config_show(struct seq_file *m, void *data)
 	seq_printf(m, "writeback=%d\n", vkmsdev->config->writeback);
 	seq_printf(m, "cursor=%d\n", vkmsdev->config->cursor);
 	seq_printf(m, "overlay=%d\n", vkmsdev->config->overlay);
+	seq_printf(m, "background_color=0x%x\n", *vkmsdev->config->background_color);
 
 	return 0;
 }
@@ -226,6 +231,7 @@ static int __init vkms_init(void)
 	config->cursor = enable_cursor;
 	config->writeback = enable_writeback;
 	config->overlay = enable_overlay;
+	config->background_color = &background_color;
 
 	ret = vkms_create(config);
 	if (ret)
diff --git a/drivers/gpu/drm/vkms/vkms_drv.h b/drivers/gpu/drm/vkms/vkms_drv.h
index 4a248567efb2..95e779ef017b 100644
--- a/drivers/gpu/drm/vkms/vkms_drv.h
+++ b/drivers/gpu/drm/vkms/vkms_drv.h
@@ -113,6 +113,7 @@ struct vkms_config {
 	bool writeback;
 	bool cursor;
 	bool overlay;
+	unsigned int *background_color;
 	/* only set when instantiated */
 	struct vkms_device *dev;
 };
@@ -127,6 +128,9 @@ struct vkms_device {
 #define drm_crtc_to_vkms_output(target) \
 	container_of(target, struct vkms_output, crtc)
 
+#define vkms_output_to_vkms_device(target) \
+	container_of(target, struct vkms_device, output)
+
 #define drm_device_to_vkms_device(target) \
 	container_of(target, struct vkms_device, drm)
 
-- 
2.39.2

