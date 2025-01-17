Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 06711A14BCD
	for <lists+dri-devel@lfdr.de>; Fri, 17 Jan 2025 10:05:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9DC7B10EAB8;
	Fri, 17 Jan 2025 09:05:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="Sc5vsiiA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D274F10EAB8
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Jan 2025 09:05:26 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id CBE001C0007;
 Fri, 17 Jan 2025 09:05:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1737104705;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cszNEYrIo94KSnanXnADpJN0/+0LWYylvzxge4u5AM0=;
 b=Sc5vsiiAuRzhJfy0BFlBdQCVfZm50ZStU6lV8RCc86IXL0Oy5W1OQj6wghRyCtL3GOAviJ
 fblJicJBSBITLO1MFWJyHSvgrjTULus0KWAQwAE/ftCXGTBQoaBcBcMyJKvBp4n48JS+Rh
 j29RE7SuIRZSwC4iOFWIq0DpEL/u0EgANizEpchw32QZsJbCTUTAsPWDwYAxHZHI8CzoQy
 JP71NZYc3xbDgAe2a65XvoTop53FlFDdCDcMGccWhaJWJY1385qhS8RrMBTaqhdYA/bBI7
 JaywlmE+4ywec/x6MBzM7BGq3Nf/hle8NhkDw4V4jYLGFIRzhxdSZcg3N+E/Wg==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Fri, 17 Jan 2025 10:04:28 +0100
Subject: [PATCH v4 2/3] drm/vkms: Switch to dynamic allocation for encoder
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250117-b4-vkms-allocated-v4-2-8ec8fd21aaf6@bootlin.com>
References: <20250117-b4-vkms-allocated-v4-0-8ec8fd21aaf6@bootlin.com>
In-Reply-To: <20250117-b4-vkms-allocated-v4-0-8ec8fd21aaf6@bootlin.com>
To: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>, 
 =?utf-8?q?Ma=C3=ADra_Canal?= <mairacanal@riseup.net>, 
 Haneen Mohammed <hamohammed.sa@gmail.com>, 
 Melissa Wen <melissa.srw@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Simona Vetter <simona.vetter@ffwll.ch>
Cc: thomas.petazzoni@bootlin.com, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, Louis Chauvet <louis.chauvet@bootlin.com>, 
 =?utf-8?q?Jos=C3=A9_Exp=C3=B3sito?= <jose.exposito89@gmail.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=2092;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=8IOvnQFVZlbgJX/4bD914D9g8sen2qDKHUBLgMavrik=;
 b=owEBbQKS/ZANAwAIASCtLsZbECziAcsmYgBnih09MF5kUrZs91gH25+EJLgpLoXu8geSN7zHs
 bnBa/nYFVKJAjMEAAEIAB0WIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCZ4odPQAKCRAgrS7GWxAs
 4m+9EACtbCvG9VubCkBAQa//KQVkaHPAo1YsEiq7BAwcOfxjqIZvN3Ym5A1bvtWOzPkH5hNoh4X
 5ZtJO9aPIoNpuZGWWv42QIpERNpjR5Y4xBx6hkvse/pQJRbx2P2cZMh6eDVVOgZwVxpRXja1ULP
 HfyHOjGU7oMDCv2HIU9MbXs3vlaOk6o5XTYU8xGGRCbpC6uVkWNuHRqzEtTzyxJ+j0rbhwGN2/b
 zqUICKivHNz+CN2CM8DTOMSlUwJgMm4AepidA1FQXYvkQhbNz9i+4Ic3CiGGDemdlQFLQxhGRPc
 zb2VAetEUx9RGm67AtLs3p0W/wYXq1aeHA8fsfuBXH7mq848nt0pWsqgUH0leD/H9stvjG3Y7JW
 i+0PxUKEGe3v+cqXH8didb8Wq2OsI8WYi71dvKDFOIob1U0Fy82NFAmV3GGxmgausCKMzfAqJ9G
 SAHLjMjJMC7cXyz14PjDoeiehFFl0CuwrGkVFrE2MABtcZIel0iE1Nz49ntsBufP9bTnLIWGiC6
 Xc9jqxsxTJ6lGO9IqU2I78tEW/W2Wn97+lKtDYSGbByoUzd3chOO3LGPHvn8KV/fBKn6cFzPVXZ
 IBJEAp89qA3Ptb9cI66lQTDnbsHZ4oDFwBjKMpQrwdrXA+Q1gHoDgynJHl0ax30ZiKFjNHfWvnu
 vIhVMf6R9LzXNGQ==
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

A specific allocation for the encoder is not strictly necessary  at this
point, but in order to implement dynamic configuration of VKMS (configFS),
it will be easier to have one allocation per encoder.

Reviewed-by: Maxime Ripard <mripard@kernel.org>
Reviewed-by: José Expósito <jose.exposito89@gmail.com>
Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
 drivers/gpu/drm/vkms/vkms_drv.h    | 1 -
 drivers/gpu/drm/vkms/vkms_output.c | 7 ++++++-
 2 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/vkms/vkms_drv.h b/drivers/gpu/drm/vkms/vkms_drv.h
index afa625457b6156135d2b07cbd5b5e3f3c7f8f33a..333983bcf8d46ef85101e7c344e256df57551b78 100644
--- a/drivers/gpu/drm/vkms/vkms_drv.h
+++ b/drivers/gpu/drm/vkms/vkms_drv.h
@@ -176,7 +176,6 @@ struct vkms_crtc_state {
  */
 struct vkms_output {
 	struct drm_crtc crtc;
-	struct drm_encoder encoder;
 	struct drm_writeback_connector wb_connector;
 	struct drm_encoder wb_encoder;
 	struct hrtimer vblank_hrtimer;
diff --git a/drivers/gpu/drm/vkms/vkms_output.c b/drivers/gpu/drm/vkms/vkms_output.c
index a41d7a29a377c14a3281968dfeb8f2b43000b120..21ca975e424d148b0669b87784d86f5da2a8b333 100644
--- a/drivers/gpu/drm/vkms/vkms_output.c
+++ b/drivers/gpu/drm/vkms/vkms_output.c
@@ -33,7 +33,7 @@ int vkms_output_init(struct vkms_device *vkmsdev)
 	struct vkms_output *output = &vkmsdev->output;
 	struct drm_device *dev = &vkmsdev->drm;
 	struct drm_connector *connector;
-	struct drm_encoder *encoder = &output->encoder;
+	struct drm_encoder *encoder;
 	struct drm_crtc *crtc = &output->crtc;
 	struct vkms_plane *primary, *overlay, *cursor = NULL;
 	int ret;
@@ -86,6 +86,11 @@ int vkms_output_init(struct vkms_device *vkmsdev)
 
 	drm_connector_helper_add(connector, &vkms_conn_helper_funcs);
 
+	encoder = drmm_kzalloc(dev, sizeof(*encoder), GFP_KERNEL);
+	if (!encoder) {
+		DRM_ERROR("Failed to allocate encoder\n");
+		return -ENOMEM;
+	}
 	ret = drmm_encoder_init(dev, encoder, NULL,
 				DRM_MODE_ENCODER_VIRTUAL, NULL);
 	if (ret) {

-- 
2.47.1

