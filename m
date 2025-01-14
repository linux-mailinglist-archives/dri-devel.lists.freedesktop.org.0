Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D483A10888
	for <lists+dri-devel@lfdr.de>; Tue, 14 Jan 2025 15:06:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 26E4A10E34F;
	Tue, 14 Jan 2025 14:06:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="e5eg7+xJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 795D110E339
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Jan 2025 14:06:08 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 6DD0AC0014;
 Tue, 14 Jan 2025 14:06:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1736863567;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=s6dIp4rzcIzAg5vGoAZF2DeDk0BH08IatA2EdlwvT9I=;
 b=e5eg7+xJEiraCoFiXZVFXGGB3YsXBaMjMQcke7f61cRyOwo259BdSAvzG5iyE857WtYGgh
 EOrSkWUsI047QAoD8NCJ+BKRjyvVNxhVRgeKXk0kKni7goIwZowPML0ssR+OprJ3zbLtDv
 eckmbClM4I3YT6R9bhModr2AnPjIHZgE0X8891egO7+tJbZxNgKoMdgtBCeib8Vez0UFSi
 SOscB2NpACPL9B5A6nxUiDbglGAXQkdesxDb5T4hWm1qEJBhfS5RamhcGhZM0+igf5EnAz
 i0WGkLdyS3S7p7TADoEMMyS9piIQ1nV391tgDy02g9aO5iLo6bOBkPavHVVSRA==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Tue, 14 Jan 2025 15:05:50 +0100
Subject: [PATCH v8 8/8] drm/vkms: Switch to managed for writeback connector
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250114-google-vkms-managed-v8-8-da4254aa3dd5@bootlin.com>
References: <20250114-google-vkms-managed-v8-0-da4254aa3dd5@bootlin.com>
In-Reply-To: <20250114-google-vkms-managed-v8-0-da4254aa3dd5@bootlin.com>
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
 Louis Chauvet <louis.chauvet@bootlin.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=3879;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=zEON8U4xfektoFrGFLGBfKHveoeJ4SqRMTmMY8YzcnY=;
 b=owEBbQKS/ZANAwAIASCtLsZbECziAcsmYgBnhm9Fa1eNf7XbIDvBh+53Fu0F2CczKy560q8n3
 UqobgZbnOyJAjMEAAEIAB0WIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCZ4ZvRQAKCRAgrS7GWxAs
 4hCuEACekOJ3wPE1eHHLv3bHQuuEXPy2wCHapfnkGjEHHJcHacDalgBTh5irR5FcHdEtvGaJ8Fa
 r9XmuNADvFK2SweEtrewUp0NH4l9GGZkhTsI6urjsCGze4/pud/+2xUo44V33nGgRruU52Y/KlJ
 RkX7qKlC3lBWDXO8BBbZyNyq8R4qURanAESGzvTYJVMmI56dlQobK2bdy3uSyZWbaBb3VLe+7hO
 E/NiIgHAB2c/n8Cu6SdvQSnP43yMl8MVWIfal3jkcajbVODPxYXc1SfnX9z5cDtFS+OYNW1suEV
 frSax6wx+H+XS8tt9rAkdYuPM5PBgyXckdE92qeQ9XnkMT2+ICKLQFU1BiBgvntx4KNEKadGoUR
 qXOWvkhQ3Z8I0K+0O8GWufXLxx3vBii022HOObqsn51QALyOXjtZSsLg4tUclwk+ZBAs2Qhm1YU
 YZT+fKnt3K5Hp+dAvqOroZ+j4mWI8EZiTuK03FvhVRIk9imsQ2Q2hMnCp2EhH9T8oET9kmCdMP+
 tnvXRnM1JPzuLvTdyIPGos5MrgHGb64UO39m3DBLMPE+JXwmzZdfd36NYGYevajRtUpL/hBEz77
 11VSjdcLkDmmamkksmfziUvoE9b7eRS2xtjuNQZ4/uH2QYCPCvZWEd8RVADbjjVVQYAM+gA5jwG
 3brXy5Ax3xT1rQA==
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

Acked-by: Thomas Zimmermann <tzimmermann@suse.de>
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

