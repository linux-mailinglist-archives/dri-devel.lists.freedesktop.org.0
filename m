Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C9092A14133
	for <lists+dri-devel@lfdr.de>; Thu, 16 Jan 2025 18:50:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2CBA410E576;
	Thu, 16 Jan 2025 17:50:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="C3L1b53V";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 15E3E10E576
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Jan 2025 17:50:31 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id DADB76000E;
 Thu, 16 Jan 2025 17:50:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1737049830;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nhzZxvrPnDnYlsii6eFj0OJ2McwKdDbJQWyRh6qYcPQ=;
 b=C3L1b53Vl1shEOSK8JEIwz9xlMNDtr/Kk8EQTnJwGA/z+VqQQPVGRYg3PFK28KJ/N7Zpqc
 zQDz+JlGYhe+QsLZ6Sy1ciWUJy6rIIk8PoP+R0nckIVzyFWGyTfAmFM3yeDms3v5jtV7VX
 EZQsb7Tm5PnS/fFwujSl35/tmmSjLOmnYjUHhf4TBdTgJ2XXDgIP/sslJfZkQFNo7rr7Di
 tyY9jZhVpBdDPKr+X6+W6AR7UfOM5g+7g1mKgFiYlT5XX8iPVKN6EfIv+0dRtTIj2AxpAx
 5M2Ca3NZMJWNi0fO00ZubTQJV66nLnAzmiunpBCGDvfNAff6nSOgVU+7Ob7PyA==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Thu, 16 Jan 2025 18:47:20 +0100
Subject: [PATCH v9 8/8] drm/vkms: Switch to managed for writeback connector
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250116-google-vkms-managed-v9-8-3e4ae1bd05a0@bootlin.com>
References: <20250116-google-vkms-managed-v9-0-3e4ae1bd05a0@bootlin.com>
In-Reply-To: <20250116-google-vkms-managed-v9-0-3e4ae1bd05a0@bootlin.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3983;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=1suYtLtB3tLbHIVeZkXY+G8WjvuJbilA7ygZ52O3ACg=;
 b=owEBbQKS/ZANAwAIASCtLsZbECziAcsmYgBniUbcdVGluHlUhSgEfTXVnF6Y6ZQgLpNb++E0j
 X51Tn/FmTGJAjMEAAEIAB0WIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCZ4lG3AAKCRAgrS7GWxAs
 4sd9EADJsTG/AmFCopZSkuTyB4N0w2J4o7A+j5Kr5iCWcnwzKIKnkKPflGmHh43gRrmfIMkX9Hi
 Q8rLnT8jOI0NqssEAHs1cprKYguoy0AtjgyVMDlS4bWOgW634A1OCrJLjg9ymcIilZedsuH1TvI
 e6SWpxfHUAM0G8Yy21Xy6udfgcDs+S9DcSwfV7bLO8zbWG3d6ReZPCsfqNWdiDMysHwq36oBPkp
 z+gKc71wGSfqAbHyIYKALH9HMULJPEHawkA+Kj91fDvm006WU5cXTqCT8Rdc4N0ObFV+T6ovBfL
 w8WF6Gb2eIjEl9gxUohKnJhNrxOKAsWgN9F05FgX3YuJZcYCe7RNYvJ8JLPZA942Ob7AJaZGxzz
 eMID9J62PNvExy1MPG7ip9jMyW6oUwCsXJ3FFqh9JaN8wGGj8+BXs2e36wq0hBYk2HUzCTsxwCl
 qHH9wR4imQAyAECASLiAEoK3wEeOWsZkqYomK5gWxzGhwTrgSxqT3i9GU/Td237E3zfELZX5unG
 Danq3y3A2binB42MoOZiejb02QAm7QNLIf+m6IWsEHRxatdYR6jWMZYe3iM+vy+IPCzm4dX09l4
 mO60302N9LG1hRp1aTYdV8N9fB9DXVFKrX4eH0a9QAqwTrP6esNtsouVFEE6zI8Jz5vNeoOxkiR
 z76b0D+UU1pkodA==
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
Acked-by: Maxime Ripard <mripard@kernel.org>
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

