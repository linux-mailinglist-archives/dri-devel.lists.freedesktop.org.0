Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 50F11A0BE63
	for <lists+dri-devel@lfdr.de>; Mon, 13 Jan 2025 18:09:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD3D710E753;
	Mon, 13 Jan 2025 17:09:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="VGy0oUNX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6EEDB10E753
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Jan 2025 17:09:40 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 3D6B61C0002;
 Mon, 13 Jan 2025 17:09:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1736788159;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8Opgd83E1kbsxTBGQ+iNZVkk1b4ntm5v/M8pnYqyoxY=;
 b=VGy0oUNX1XCIuEEUoiRvu4V7h2QeD+aijXRWL23er5ODw48XEFJK+6pt18KV+e5NILK0Wo
 1pxpGJ4ZLl/+QjlHaJdTB65lJ/gCBk2t24DYa5ZArokCLAiFtgttsqYmUcW8nX0HmOuLSJ
 uD6HbSYsOInByV+GJSpi1orKVnnsO6K56uCvA7AkiXXImPlZP3+Wo//xN9Z5pO6AxzOt4y
 NTl3glyq7+nH27sv2MLr4IpiM+du78AqOZR6Dw2HUTrd5P94p7k9pVEcv22XPp31xfljZc
 8ddLTsUwR/2ny3x2rmMdw8f2fYA5X2SlvLjVdk4Sq7926LyXGOhyPYrC6HULvw==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Mon, 13 Jan 2025 18:09:08 +0100
Subject: [PATCH v7 7/7] drm/vkms: Switch to managed for writeback connector
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250113-google-vkms-managed-v7-7-4f81d1893e0b@bootlin.com>
References: <20250113-google-vkms-managed-v7-0-4f81d1893e0b@bootlin.com>
In-Reply-To: <20250113-google-vkms-managed-v7-0-4f81d1893e0b@bootlin.com>
To: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>, 
 Melissa Wen <melissa.srw@gmail.com>, 
 =?utf-8?q?Ma=C3=ADra_Canal?= <mairacanal@riseup.net>, 
 Haneen Mohammed <hamohammed.sa@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Simona Vetter <simona.vetter@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, arthurgrillo@riseup.net, 
 linux-kernel@vger.kernel.org, jeremie.dautheribes@bootlin.com, 
 miquel.raynal@bootlin.com, thomas.petazzoni@bootlin.com, 
 seanpaul@google.com, nicolejadeyee@google.com, 
 Louis Chauvet <louis.chauvet@bootlin.com>, 
 =?utf-8?q?Jos=C3=A9_Exp=C3=B3sito?= <jose.exposito89@gmail.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=3886;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=iExjIo72bcu0kyT4QK9hMtyH/I0rWLbCXQIFq+d+7Zk=;
 b=owEBbQKS/ZANAwAIASCtLsZbECziAcsmYgBnhUi1tCnwrydWcnI/Zzc+3aN8YgTrQuMCt/ifz
 IiT7ItLpkeJAjMEAAEIAB0WIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCZ4VItQAKCRAgrS7GWxAs
 4lNTEAC9Fv5CiH1O8fmAkszsGKsf9ygqBZnu/hXI/fbHc27tuBuEfBxduH8huEY+/nLYsyDMO9Z
 p+psRCHkGmDIyn/4kDn3ObsvzSQsVzZu3i9BVHEP/CgTuNxi00UA9BE09m2JCag7dz4lKnGv8+m
 bb+ZPAKYfQye45cEK8aWOP3ga7Z4X7J7SSpCu8wFjH+Il4rXPwGYYGRvC0bLev5b1SDd3kJL6wo
 bzMGtl0Y3s5DZymN8pZBtI/rsa9hdc/8Wtxcmyj25roVl2bU0GDuoVufTQwcTd4T2f67VBGa7ZQ
 wRgNsj2HWmwrE667aKDUBrBMEPPY2W7pewvsJIrVFIs4lUC4ggW3M+gjMIZRuYF1pdDif8nAmmn
 Npj11VgnbUEYyAdFi1XiX6Y4qnwpl3Gjxm7RfKYu6HSLCWG6q+i5BO2evtZ506zTHduQ8hJB0dG
 P+cRzlxAgYGkx8PHcGTK7fh3m39sn7epUyI4/Gs4KSnBYjPNDm+EYpjT8SMBGnQ8YkSwYtncxuO
 /vZ5jTW4+O8gc28HdcWtXh+XxRol9xC/pTKbDBnDJ/kLSFQzy8PHX710Z6vyK1xWe9Ql8/D+EE6
 1ICBKvqIdsFp1PpDgbt3ANdBZ/4kI6SxRKAz4T6R8uwlS8ItHjEEz3oF5WpTMkJoaqxzVazVagz
 2o/xcB8eDWVwj3w==
X-Developer-Key: i=louis.chauvet@bootlin.com; a=openpgp;
 fpr=8B7104AE9A272D6693F527F2EC1883F55E0B40A5
X-GND-Sasl: louis.chauvet@bootlin.com
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

The current VKMS driver uses non-managed function to create
writeback connectors. It is not an issue yet, but in order
to support multiple devices easily, convert this code to
use drm and device managed helpers.

Reviewed-by: José Expósito <jose.exposito89@gmail.com>
Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
 drivers/gpu/drm/vkms/vkms_drv.h       |  3 ++-
 drivers/gpu/drm/vkms/vkms_output.c    |  2 +-
 drivers/gpu/drm/vkms/vkms_writeback.c | 21 +++++++++++++--------
 3 files changed, 16 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/vkms/vkms_drv.h b/drivers/gpu/drm/vkms/vkms_drv.h
index 00541eff3d1b0aa4b374fb94c8fe34932df31509..46ac36aebb27ce8d9018224735007c1b3fe7d0a5 100644
--- a/drivers/gpu/drm/vkms/vkms_drv.h
+++ b/drivers/gpu/drm/vkms/vkms_drv.h
@@ -179,6 +179,7 @@ struct vkms_output {
 	struct drm_encoder encoder;
 	struct drm_connector connector;
 	struct drm_writeback_connector wb_connector;
+	struct drm_encoder wb_encoder;
 	struct hrtimer vblank_hrtimer;
 	ktime_t period_ns;
 	struct workqueue_struct *composer_workq;
@@ -275,6 +276,6 @@ void vkms_set_composer(struct vkms_output *out, bool enabled);
 void vkms_writeback_row(struct vkms_writeback_job *wb, const struct line_buffer *src_buffer, int y);
 
 /* Writeback */
-int vkms_enable_writeback_connector(struct vkms_device *vkmsdev);
+int vkms_enable_writeback_connector(struct vkms_device *vkmsdev, struct drm_crtc *crtc);
 
 #endif /* _VKMS_DRV_H_ */
diff --git a/drivers/gpu/drm/vkms/vkms_output.c b/drivers/gpu/drm/vkms/vkms_output.c
index ab9affa75b66ce9f00fe025052439405206144ec..de817e2794860f9071a71b3631460691e0d73a85 100644
--- a/drivers/gpu/drm/vkms/vkms_output.c
+++ b/drivers/gpu/drm/vkms/vkms_output.c
@@ -95,7 +95,7 @@ int vkms_output_init(struct vkms_device *vkmsdev)
 	}
 
 	if (vkmsdev->config->writeback) {
-		writeback = vkms_enable_writeback_connector(vkmsdev);
+		writeback = vkms_enable_writeback_connector(vkmsdev, crtc);
 		if (writeback)
 			DRM_ERROR("Failed to init writeback connector\n");
 	}
diff --git a/drivers/gpu/drm/vkms/vkms_writeback.c b/drivers/gpu/drm/vkms/vkms_writeback.c
index 79918b44fedd7ae2451d1d530fc6d5aabf2d99a3..981975c2b0a0c75e4a3aceca2a965f5876ae0a8f 100644
--- a/drivers/gpu/drm/vkms/vkms_writeback.c
+++ b/drivers/gpu/drm/vkms/vkms_writeback.c
@@ -24,7 +24,6 @@ static const u32 vkms_wb_formats[] = {
 
 static const struct drm_connector_funcs vkms_wb_connector_funcs = {
 	.fill_modes = drm_helper_probe_single_connector_modes,
-	.destroy = drm_connector_cleanup,
 	.reset = drm_atomic_helper_connector_reset,
 	.atomic_duplicate_state = drm_atomic_helper_connector_duplicate_state,
 	.atomic_destroy_state = drm_atomic_helper_connector_destroy_state,
@@ -163,16 +162,22 @@ static const struct drm_connector_helper_funcs vkms_wb_conn_helper_funcs = {
 	.atomic_check = vkms_wb_atomic_check,
 };
 
-int vkms_enable_writeback_connector(struct vkms_device *vkmsdev)
+int vkms_enable_writeback_connector(struct vkms_device *vkmsdev, struct drm_crtc *crtc)
 {
 	struct drm_writeback_connector *wb = &vkmsdev->output.wb_connector;
+	int ret;
+
+	ret = drmm_encoder_init(&vkmsdev->drm, &vkmsdev->output.wb_encoder,
+				NULL, DRM_MODE_ENCODER_VIRTUAL, NULL);
+	if (ret)
+		return ret;
+	vkmsdev->output.wb_encoder.possible_crtcs |= drm_crtc_mask(crtc);
 
 	drm_connector_helper_add(&wb->base, &vkms_wb_conn_helper_funcs);
 
-	return drm_writeback_connector_init(&vkmsdev->drm, wb,
-					    &vkms_wb_connector_funcs,
-					    NULL,
-					    vkms_wb_formats,
-					    ARRAY_SIZE(vkms_wb_formats),
-					    1);
+	return drmm_writeback_connector_init(&vkmsdev->drm, wb,
+					     &vkms_wb_connector_funcs,
+					     &vkmsdev->output.wb_encoder,
+					     vkms_wb_formats,
+					     ARRAY_SIZE(vkms_wb_formats));
 }

-- 
2.47.1

