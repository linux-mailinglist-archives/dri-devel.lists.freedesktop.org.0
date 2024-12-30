Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 32D029FEA07
	for <lists+dri-devel@lfdr.de>; Mon, 30 Dec 2024 19:40:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 07F8310E56D;
	Mon, 30 Dec 2024 18:40:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="T3jg/XvQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7436910E56D
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Dec 2024 18:40:20 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 2B1D660006;
 Mon, 30 Dec 2024 18:40:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1735584018;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=J1A9pb0GMwj8iBETDvV4cmtpIcpfSITNuH7NBvhE/dY=;
 b=T3jg/XvQLdLAefdPCZziJLoNZ0a089aHvirv8Wcn6B82jLdGuBfYubb/H2UDjZNApKXdJd
 oWx/vfeF2V8A1C26z/pK3XjL0sAIKox3wWtXNGfE5irvpj2yrVHyITSvU4pUfyBB8D6KUa
 zD3ghKZPNL2eCWatJIV3f8sGDzjshiHq3B815Vli1NuWDqZ3aXQRjmIrvYDQTBoNO+A0V6
 z+/WGpbemmNKiHVYrpegTCwx3Hxsh3oAACF9+NvURqp95umZ5p+DwZIzA0QkA2AIUG0Pxe
 yZWzwFkKTTgzjmTean/nI7pg8xf1IySuiT/A7izsmQ2Ue8jp4lxMlKBwY/zemw==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Mon, 30 Dec 2024 19:39:45 +0100
Subject: [PATCH v3 2/3] drm/vkms: Switch to dynamic allocation for encoder
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20241230-b4-vkms-allocated-v3-2-5dda4c1bd459@bootlin.com>
References: <20241230-b4-vkms-allocated-v3-0-5dda4c1bd459@bootlin.com>
In-Reply-To: <20241230-b4-vkms-allocated-v3-0-5dda4c1bd459@bootlin.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2080;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=POMPML9yUE0ObUiIqQmK6mj1RyDxFdGqid0Ge0WrG+M=;
 b=owEBbQKS/ZANAwAIASCtLsZbECziAcsmYgBncukO4SpjQnSiOKiglJPiacp64R1Ns8GYdpKjp
 PvJ17m6YM2JAjMEAAEIAB0WIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCZ3LpDgAKCRAgrS7GWxAs
 4oUaEACBQAYoVCtQ/dqTv4CBnr0vgE6TA9I14qbvHkPEGCIY0JAqFEdu2akz+84dUTvYLXLLtoR
 6gPhmNMJ29uMUw3JUMiecC8+hNZknzRz7mpgU/o74jU8Bdc7deBEo1e1HFJHa9Oe6FFDBWchB2h
 tzZge2+2mOt442eigOpkkTA24uFZATjVVs3lrUrGEx+PPegAQ0OTAvF/mlHlE1qkyeyv81TgPs2
 BmlNNrJ9Rsxp/E8Q5CrZ5f8HycmDTEuLV80eBKkRFll+iySLqz/J4toGkf9OjRjaV3s8C+PVIe1
 MYEWtkSA/P9VNIfjNeXqGJvrH9EBsloi1VmIy6U+dsHznLks6pzsO/58JJe+TFaavTehONtSsFd
 xAWaD1VN/WoudjEczjD6YxCNk/7U0qc1QfKt9cY7RaDBSNk4Tu6NtSAkrJg8GUn0lPXFjXweKYr
 jYL+drp49lyBBt9Qly8lIlPIJfrWsqRxCw9HX9WtBYVdrTIHRSN48ANluSReUsDLVpsAlvMsyLv
 jbS/cIVzFc56vrD0f+mMntY/DuQC6j+eVXh62Dm6iccR3WCnQSvLBk7FtxFExshScPgIufwDFh5
 EvS72gkP1zpvaQ7l/N/Jg6pgoDDm7xXPc7WlLkJDFtN8LUyWelvrIf6wKMQJj2L55EDpjR29lx9
 Qvxo+Jxtn82dmjg==
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
index 820e7899cb049b45d8bdbe5a0dc7be08eee6db69..19fd99b8e506c4454d7878b67f692a0441c22665 100644
--- a/drivers/gpu/drm/vkms/vkms_drv.h
+++ b/drivers/gpu/drm/vkms/vkms_drv.h
@@ -176,7 +176,6 @@ struct vkms_crtc_state {
  */
 struct vkms_output {
 	struct drm_crtc crtc;
-	struct drm_encoder encoder;
 	struct drm_writeback_connector wb_connector;
 	struct hrtimer vblank_hrtimer;
 	ktime_t period_ns;
diff --git a/drivers/gpu/drm/vkms/vkms_output.c b/drivers/gpu/drm/vkms/vkms_output.c
index ec3545730ef79af0db51d8ec605b9cdfff52c2a3..102b6ad466cb4f7c6704f30cea669e5d7f81540a 100644
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

