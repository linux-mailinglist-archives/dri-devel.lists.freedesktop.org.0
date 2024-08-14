Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EE396951D3C
	for <lists+dri-devel@lfdr.de>; Wed, 14 Aug 2024 16:36:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B43710E4AD;
	Wed, 14 Aug 2024 14:36:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="AoG8OPrO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ECF3E10E4AC
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Aug 2024 14:36:32 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id B0EA51C0005;
 Wed, 14 Aug 2024 14:36:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1723646191;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fjT0T1cDM1LYJFW8u10bh1Tm6iF9xcPCR84CrhIb5P0=;
 b=AoG8OPrOjndHgrPiSdy/9sdp+9BXVKUVWznI+EIuGNARGRB81pD8ZYvaihBEvnZY1adU/J
 csQq11NhRrAhS9FxX/soLqMC+kLiI/3gvOB/F0yPPEyX8tcRupzncuLKHCsrigAZNzxRCh
 4BlVLF7ue7a+vcuslOvDoXAtOY3RXGJBUm0CQiq3DrmQjldmoQK8Ua9+FR4yGSkddclGMu
 EZ7XBi96wybIwiOD1d5auHxrgkxq9qucC/38ScZdtQJUdpUh5G2ZgRoP5/t9x+5jKjYiGy
 DQwMa+vwRsT9tYGzlOZ0L2AnadDqDq4CzFGJ34mtneTlM13EOBEy7Sd6R2Rx0g==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Wed, 14 Aug 2024 16:36:24 +0200
Subject: [PATCH RFC 02/15] drm/vkms: remove possible crtc from parameters
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240814-google-remove-crtc-index-from-parameter-v1-2-6e179abf9fd4@bootlin.com>
References: <20240814-google-remove-crtc-index-from-parameter-v1-0-6e179abf9fd4@bootlin.com>
In-Reply-To: <20240814-google-remove-crtc-index-from-parameter-v1-0-6e179abf9fd4@bootlin.com>
To: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>, 
 Melissa Wen <melissa.srw@gmail.com>, 
 =?utf-8?q?Ma=C3=ADra_Canal?= <mairacanal@riseup.net>, 
 Haneen Mohammed <hamohammed.sa@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>
Cc: dri-devel@lists.freedesktop.org, arthurgrillo@riseup.net, 
 linux-kernel@vger.kernel.org, jeremie.dautheribes@bootlin.com, 
 miquel.raynal@bootlin.com, thomas.petazzoni@bootlin.com, 
 seanpaul@google.com, nicolejadeyee@google.com, 
 Louis Chauvet <louis.chauvet@bootlin.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=4108;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=MfhwABS17LHUoJ+jq0vYojOPf4se4zR6qFsIZKDDr88=;
 b=owEBbQKS/ZANAwAIASCtLsZbECziAcsmYgBmvMDquZQ5+AoQGUj3+2cFFoN4u9cdx+UkSdRXs
 xj7OCwvdhGJAjMEAAEIAB0WIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCZrzA6gAKCRAgrS7GWxAs
 4stqD/9mwWDPROPr03dSkdO8YCxBmJEv6IrxBZtDYGxCC8RyLOaghd59KJYilvHzepIsw1xTTQk
 cees94xvHFZaHmaeKQAFfh8VKE0wr1cMBz1+z1Efy8/Xta9QFR1mXYjlztblF196GSeBHZoftLD
 8GYYLMfkR1SVACsxCx3nHJTK81YB39F5J8CypeKtObWtAC2Isk1GK1a2nqQygAAUM/HjRsgCDKu
 NJjtmkGwdJ5bGKC1+iLO52MVP9KWEHpZURHy/vj4Mt4VotJLpfwz1yf9wDMVZZpr7A1HiMI7Z7p
 3NbPmFZkvpEw/ojKhq33nR2EJ10vNxjy9u0WYCqQJSvEzWXNr7IpR00+PKDO54VcXeNIL0pQ44Z
 2CGL3wvSKYg3k0+BxYukfVpcq2X7pN3T0lle/GyCbQAPZQfuMlPazy9ofw/jgVMCM8CvCXdlV/r
 s/oJXAFeC6lpKkXNINH64F2id+My4Uo9yayyFuG4cyKb06T9EJ29JzAMybvZNTBgztfZY6UdaHY
 f8qAm/9cMuDijz5zQlXS4p5jVqrPfKgwZR/NmlTcn0U9bdQvMffuP31iAdOnL4IpJM62IEwXENs
 NnrKoScH6Kzei++w3GlFKkm1orxiiWQGQ/opVz2lXb4Kfdz/3mqc0X/RN/c/TMbL85J++iZ/gTs
 mWbH+Y9Jx/2kyCQ==
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

As the crtc mask is dynamic, avoid hardcoding it. It is already computed
once all the planes are created, so it should be a no-op

Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
 drivers/gpu/drm/vkms/vkms_drv.c   | 10 +++++-----
 drivers/gpu/drm/vkms/vkms_plane.c |  5 +++--
 drivers/gpu/drm/vkms/vkms_plane.h |  4 +---
 3 files changed, 9 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/vkms/vkms_drv.c b/drivers/gpu/drm/vkms/vkms_drv.c
index 7ac3ab7e16e5..e71b45fcb9b8 100644
--- a/drivers/gpu/drm/vkms/vkms_drv.c
+++ b/drivers/gpu/drm/vkms/vkms_drv.c
@@ -166,7 +166,7 @@ static const struct drm_connector_helper_funcs vkms_conn_helper_funcs = {
 	.get_modes = vkms_conn_get_modes,
 };
 
-static int vkms_output_init(struct vkms_device *vkmsdev, int possible_crtc)
+static int vkms_output_init(struct vkms_device *vkmsdev)
 {
 	struct drm_device *dev = &vkmsdev->drm;
 	struct drm_connector *connector;
@@ -184,20 +184,20 @@ static int vkms_output_init(struct vkms_device *vkmsdev, int possible_crtc)
 	 * The overlay and cursor planes are not mandatory, but can be used to perform complex
 	 * composition.
 	 */
-	primary = vkms_plane_init(vkmsdev, DRM_PLANE_TYPE_PRIMARY, possible_crtc);
+	primary = vkms_plane_init(vkmsdev, DRM_PLANE_TYPE_PRIMARY);
 	if (IS_ERR(primary))
 		return PTR_ERR(primary);
 
 	if (vkmsdev->config->overlay) {
 		for (n = 0; n < NUM_OVERLAY_PLANES; n++) {
-			overlay = vkms_plane_init(vkmsdev, DRM_PLANE_TYPE_OVERLAY, possible_crtc);
+			overlay = vkms_plane_init(vkmsdev, DRM_PLANE_TYPE_OVERLAY);
 			if (IS_ERR(overlay))
 				return PTR_ERR(overlay);
 		}
 	}
 
 	if (vkmsdev->config->cursor) {
-		cursor = vkms_plane_init(vkmsdev, DRM_PLANE_TYPE_CURSOR, possible_crtc);
+		cursor = vkms_plane_init(vkmsdev, DRM_PLANE_TYPE_CURSOR);
 		if (IS_ERR(cursor))
 			return PTR_ERR(cursor);
 	}
@@ -284,7 +284,7 @@ static int vkms_modeset_init(struct vkms_device *vkmsdev)
 	dev->mode_config.preferred_depth = 0;
 	dev->mode_config.helper_private = &vkms_mode_config_helpers;
 
-	return vkms_output_init(vkmsdev, 0);
+	return vkms_output_init(vkmsdev);
 }
 
 static int vkms_create(struct vkms_config *config)
diff --git a/drivers/gpu/drm/vkms/vkms_plane.c b/drivers/gpu/drm/vkms/vkms_plane.c
index e549c9523a34..b5740c27180b 100644
--- a/drivers/gpu/drm/vkms/vkms_plane.c
+++ b/drivers/gpu/drm/vkms/vkms_plane.c
@@ -5,6 +5,7 @@
 #include <drm/drm_atomic.h>
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_blend.h>
+#include <drm/drm_plane.h>
 #include <drm/drm_fourcc.h>
 #include <drm/drm_gem_atomic_helper.h>
 #include <drm/drm_gem_framebuffer_helper.h>
@@ -222,12 +223,12 @@ static const struct drm_plane_helper_funcs vkms_plane_helper_funcs = {
 };
 
 struct vkms_plane *vkms_plane_init(struct vkms_device *vkmsdev,
-				   enum drm_plane_type type, int possible_crtc_index)
+				   enum drm_plane_type type)
 {
 	struct drm_device *dev = &vkmsdev->drm;
 	struct vkms_plane *plane;
 
-	plane = drmm_universal_plane_alloc(dev, struct vkms_plane, base, 1 << possible_crtc_index,
+	plane = drmm_universal_plane_alloc(dev, struct vkms_plane, base, 0,
 					   &vkms_plane_funcs,
 					   vkms_formats, ARRAY_SIZE(vkms_formats),
 					   NULL, type, NULL);
diff --git a/drivers/gpu/drm/vkms/vkms_plane.h b/drivers/gpu/drm/vkms/vkms_plane.h
index 90554c9fe250..95b2428331b8 100644
--- a/drivers/gpu/drm/vkms/vkms_plane.h
+++ b/drivers/gpu/drm/vkms/vkms_plane.h
@@ -52,11 +52,9 @@ struct vkms_frame_info {
  *
  * @vkmsdev: vkms device containing the plane
  * @type: type of plane to initialize
- * @possible_crtc_index: Crtc which can be attached to the plane. The caller must ensure that
- * possible_crtc_index is positive and less or equals to 31.
  */
 struct vkms_plane *vkms_plane_init(struct vkms_device *vkmsdev,
-				   enum drm_plane_type type, int possible_crtc_index);
+				   enum drm_plane_type type);
 
 #define drm_plane_state_to_vkms_plane_state(target) \
 	container_of(target, struct vkms_plane_state, base.base)

-- 
2.44.2

