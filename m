Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A08D9A14131
	for <lists+dri-devel@lfdr.de>; Thu, 16 Jan 2025 18:50:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA26610E9FE;
	Thu, 16 Jan 2025 17:50:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="hmUC/mnE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::223])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DEB8D10E9F3
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Jan 2025 17:50:25 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 977E360009;
 Thu, 16 Jan 2025 17:50:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1737049824;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jEZHk/1SbjAWFJgGVljCi7CCHvNiVINr3GrqFQeJNvQ=;
 b=hmUC/mnE6kGC3NfBHbYG0a86lUZZJS+rlvpChu5fErRSAsbPoUcohraRLZTxjOdFGwmEYr
 1v8aH3wdMdptDyd12aVMbe9LOyi03cnecrOnpNOXGeI3xFK0ZWAlGO1HKQQXpYbgOBUaSJ
 +TCAurRgZd1a8rvEiqs0mf/spz0KzQVbXTX5XKyRyBV9fnvAAgdFLrO0f0slr+ChiK476Q
 eencke991rmPYwDwAU299vWKSygHbGQtmHTZvDnqkfxS8uCHrV9R65InIsoLTqCsefAIJw
 WDcEGPOatDjT1yMLqpMqfUglrMJI9dBE3upJEEzBwBesLhOg6GrmUSYr2HZBWA==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Thu, 16 Jan 2025 18:47:14 +0100
Subject: [PATCH v9 2/8] drm/vkms: Switch to managed for encoder
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250116-google-vkms-managed-v9-2-3e4ae1bd05a0@bootlin.com>
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
 =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>, 
 =?utf-8?q?Jos=C3=A9_Exp=C3=B3sito?= <jose.exposito89@gmail.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=2061;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=KX/HAkpNK4I0905KpjeAVbCo6ZEtfEvZdVMjcNb0FPw=;
 b=owEBbQKS/ZANAwAIASCtLsZbECziAcsmYgBniUbaB9GjM17vIvmIm1h990QAP/kMnzoB78Jl/
 TygW0hqka2JAjMEAAEIAB0WIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCZ4lG2gAKCRAgrS7GWxAs
 4jDaD/4/TmWNKnw2T9d8qeFpvIzhLPWGpxF4ZncZWZefYrDFX30xLXUH86lN7+yNb5+700+pUKA
 GnwkbZqfQtA9h/buqWeP5rkPlbt+H02xlyw9iLXEDhL/Gwce0rIEgsaFZCpqz9uUiVu/L5j0Ucv
 NifJQAfxtQbDTzNznCDcr2cqtV6qv8A66NIPqI88BdnWW1JpanPdUUYpb6IoK3/SH9a3NewVzPp
 G3pc6CTMJ8X/CjCiW8m1i1oCzfDiAYcM907bgoVlz4rsHLUx4v6cDMVCiuDAfCs04pdlh2FqHgW
 094WxEcDgxgV//JX+xqYeJKe2vjrdeh98a8VAfIFPJszX4UEZuJgHinhGRcR48s8UsY9N0B3Z4Y
 tcT3G6rBjqpHyyqQNsUomh5GY8SjW50zTASU1t9gaCAyL/vCoADfDf2bEgLkAyagTD6eAR324ns
 986kCDynIHex0uvViAA6FTsw3QRbNoqLHYZ2BXVfbKkPuq6Wh2GBZu0Gd1T0cYsnsY4cM7bSL/b
 zcd5S5igf4wcQO4DXMNoopKhVOrEYrpiW8AZoulNe9e0BUQt0hnHI5QkkezRUzMX7tck8+kWsVp
 g3envLnhLSs+FqgTSwubK35bY4wEI55osQ8e2sstWEgyOa/KkzZvYW2us/HEK4OCsuWDsgBIAqX
 T8e+AnYCx4QAW7g==
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
Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: José Expósito <jose.exposito89@gmail.com>
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

