Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 95365A0BE5F
	for <lists+dri-devel@lfdr.de>; Mon, 13 Jan 2025 18:09:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 06A7F10E74A;
	Mon, 13 Jan 2025 17:09:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="UlOm2pJg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 69FCA10E74E
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Jan 2025 17:09:35 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 2EFE81C000F;
 Mon, 13 Jan 2025 17:09:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1736788154;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ORNcbjUscQPawEReOo+mB/rT9VuEfLQrTBsR3RDKoMc=;
 b=UlOm2pJgcZwajDylSYbEZaNN3Y5FUX46sHf+kesA/ohBYbd92JfWiw+E+eDFumwb4Lob6K
 LxcVepQmltydIYwp8WwwebqbOvVhyQMc7AwY3gxPyUE3s0jDH7Ui45IW5qWf3QbOXutAHy
 2vYtHR2cfiVEynvvDz0g6fMFwd2TRHKZgWv+jzl/dLcKXC6dRCn5BcoFPFRS9QPf+3dCOE
 uEPFXFy0AGYAJmmoC8Ag5H2uEgP2cR2C+axeVibPIYUzcE73zBWurCzfsVmeZpgdZZfugR
 62SsP1rYoq543NYTGgCDWJLjZEzDkk2NlUSOodyVX3/1uHVyAiwRjpjwgURASw==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Mon, 13 Jan 2025 18:09:03 +0100
Subject: [PATCH v7 2/7] drm/vkms: Switch to managed for encoder
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250113-google-vkms-managed-v7-2-4f81d1893e0b@bootlin.com>
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
 =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1949;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=6Q2vv/0lK0qmkxSO71I39a4RcXfCaF3f2eU4aUcvUP4=;
 b=owEBbQKS/ZANAwAIASCtLsZbECziAcsmYgBnhUizNhxp1556f1fpLrdpsN/LGcKTNOW/RPO75
 93ZmS/umWeJAjMEAAEIAB0WIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCZ4VIswAKCRAgrS7GWxAs
 4kZFD/4vYUrFGFq+DPZ7PD09Q73mDSokvWtOILOranPt9ISSAZoCquQQPZVyz91qZC0p5PkRrBY
 Qp38Yq5vFWiy4ecAOtlj89Un5xuLHJK9xwOwTqEjPcqhCYNxy5OJxXfn58DcuZ7hoIeLC/Gq4Rf
 qDxdpBXybB1eg3Fjoyjw5OFpXJIQpGljOL2PBLe9KTWm+8Pnc8+25l4hxI9ZqAHgTdiCHCQsEGg
 kYx3sLLFHV7bI0VuhsxbM/Uyp43d0pGLvEXnrsqxAOlMSJr0723HCmvrEAuAEHZruCZEiDwf2gR
 jL7s7/uqHZyV4LiAL1wTs5G/qUawY7JSU5zyBMRqu+PHN74I6VsmnWfRnZQ/8LHPpeXtW3SuNb1
 nyfi/TRKkVVT+y+UaFGgGSi8SWGHcciDi4YJKi4DKF+Zfts9xu1bHQoN3DK+fwkoChP+IuNJRdE
 Axxpx6NFGQj5yXZHGIjxkiUAOIeH9g06JHlC1mS/LUqu7fgM3kDn/o/Sfxax+lFvEFqqTe6xLZ9
 XHuDnAjnvKcJaTdxaQIcUWpXyTynWFScaRfdLHHjnsUsDMmBaV/QW4q8l5tgIg6YvM+1XWxe4Ll
 AR0+u4PvnT6oJ2ypv3PT7KQybtBsva07at6oTRKb9DE0HBU4drEssf27MykUyFh9djYjA9FRiFA
 sdyVvgMI+DfD2Mg==
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

The current VKMS driver uses non-managed function to create encoders. It
is not an issue yet, but in order to support multiple devices easily,
convert this code to use drm and device managed helpers.

Reviewed-by: Maxime Ripard <mripard@kernel.org>
Reviewed-by: Maíra Canal <mcanal@igalia.com>
Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
 drivers/gpu/drm/vkms/vkms_output.c | 12 +++---------
 1 file changed, 3 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/vkms/vkms_output.c b/drivers/gpu/drm/vkms/vkms_output.c
index 570823ecb28f589e6323036590ec05a2f633bc9b..ab9affa75b66ce9f00fe025052439405206144ec 100644
--- a/drivers/gpu/drm/vkms/vkms_output.c
+++ b/drivers/gpu/drm/vkms/vkms_output.c
@@ -13,10 +13,6 @@ static const struct drm_connector_funcs vkms_connector_funcs = {
 	.atomic_destroy_state = drm_atomic_helper_connector_destroy_state,
 };
 
-static const struct drm_encoder_funcs vkms_encoder_funcs = {
-	.destroy = drm_encoder_cleanup,
-};
-
 static int vkms_conn_get_modes(struct drm_connector *connector)
 {
 	int count;
@@ -84,8 +80,8 @@ int vkms_output_init(struct vkms_device *vkmsdev)
 
 	drm_connector_helper_add(connector, &vkms_conn_helper_funcs);
 
-	ret = drm_encoder_init(dev, encoder, &vkms_encoder_funcs,
-			       DRM_MODE_ENCODER_VIRTUAL, NULL);
+	ret = drmm_encoder_init(dev, encoder, NULL,
+				DRM_MODE_ENCODER_VIRTUAL, NULL);
 	if (ret) {
 		DRM_ERROR("Failed to init encoder\n");
 		return ret;
@@ -95,7 +91,7 @@ int vkms_output_init(struct vkms_device *vkmsdev)
 	ret = drm_connector_attach_encoder(connector, encoder);
 	if (ret) {
 		DRM_ERROR("Failed to attach connector to encoder\n");
-		goto err_attach;
+		return ret;
 	}
 
 	if (vkmsdev->config->writeback) {
@@ -108,7 +104,5 @@ int vkms_output_init(struct vkms_device *vkmsdev)
 
 	return 0;
 
-err_attach:
-	drm_encoder_cleanup(encoder);
 	return ret;
 }

-- 
2.47.1

