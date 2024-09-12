Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A79E976A73
	for <lists+dri-devel@lfdr.de>; Thu, 12 Sep 2024 15:25:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C3BC510E00A;
	Thu, 12 Sep 2024 13:25:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="pE4xfwPS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1DADD10E00A
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Sep 2024 13:25:20 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 1EBA04000D;
 Thu, 12 Sep 2024 13:25:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1726147519;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZU22e0/TQ7MJ3yFJWCIrZsJEcPRhtvo7WlcHoOwghGA=;
 b=pE4xfwPSWQF8+5sKIWJgXqjsCbLhf6rHdkZk8qWEKLU7WXh3tYVHhUDuWjYnXTUrCeQyQK
 FKgaEja6Wd0heGeHtCapItx6LQMiuYmIm1rRlN2wkf4FGjIDXiNhwDsa/ZvkPkXeI4N7PJ
 a+idTvgnN/mgOfy/qIRi0uAz+n9eQxMFUK492Toz8dNM18WvZkT0m41ID9Xnqx9zSs15x5
 MkLzRp0qfWXFE2RbrzCwwAhx0/O+AJtzvdN8E3sM3uc43El7WYv4LNO8eT1Tv3zfNEf/Aw
 jPiWMSLj2efTiz9N9BZvEKyb8V7RLJdkrQKcksIcRs6SjETvqCs1gZ+Sp2B7Zg==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Thu, 12 Sep 2024 15:25:15 +0200
Subject: [PATCH v3 2/4] drm/vkms: Switch to managed for encoder
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240912-google-vkms-managed-v3-2-7708d6ad262d@bootlin.com>
References: <20240912-google-vkms-managed-v3-0-7708d6ad262d@bootlin.com>
In-Reply-To: <20240912-google-vkms-managed-v3-0-7708d6ad262d@bootlin.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1909;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=bM44tHCPJrHTE+kJWXIrV417+Q33Eyk1EOPqV9M8sYw=;
 b=owEBbQKS/ZANAwAIASCtLsZbECziAcsmYgBm4uu8MZi6SumIboPrHUhfYXcn7YAGOwxchgcz7
 j88asy8FWeJAjMEAAEIAB0WIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCZuLrvAAKCRAgrS7GWxAs
 4lfoD/4vF8usdGpAQ8dBZlkeDh22CqCZHZWgese9ruXdDPEPx66ojjzG6ml0/JqSRQbUYhfMGmp
 1fqEUKWnzzM1+HluGxIJMX7HWwpKxtQwAeHNJ8taFYHf4FnVrUum6btIGh7JCVGWOfLk+wSPBrU
 8c9u6kwVq0A1IftCfxjCFr2Jq5bNBH/cRcRKxyxnZRpzdEs9hjaz9kpggK6/z054hV9LwhJP6ww
 8vVojV95V2qfTMyEqQ6raC4phBi0tNJGBywS1IYLxL93KsW+67L3HZzvkeMNP38NpnvnhWoH5PY
 BevSUh+/P1I/YXUAjOGND19Ng1eCy00x4xlUs/qmEogjCI8vgiYyNLVjkyzz23IVXikh31aYIeP
 aHxtkn7i/HydMXgF5ld/vl+VxunsDAdm+VK9HNVFA1qNkdHt7Fm+muYYF2hQmwwrxjXerbTx7IP
 5ojlHZ3lnZiMTV2A+MAiefLR63MkotXw2xp2+EIbSuBIaJHStZKtEjdRijADs6hLkD6P6kX1KXp
 KZBfgkto5YvnL/CkNtC2m5/kcy9nOPwzm6py6mrfq4gdf3DZjNPw+9p1zSXsewmE8qQ5pGBPtkE
 zsHFzqORqw9alw3MDqPiem5nvw+9PwjIpQ7Aj5PYlSakJVXkTSrrRsCD7G9goHgjs0H+gvO8v4j
 LmqG50vr6K4MpMw==
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

Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
 drivers/gpu/drm/vkms/vkms_output.c | 14 ++++----------
 1 file changed, 4 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/vkms/vkms_output.c b/drivers/gpu/drm/vkms/vkms_output.c
index 1a445a4ff6ffb023a1c1ef7e141c771277146251..2226ba1972f3ff51483abacac45ee8914be0c94a 100644
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
@@ -75,18 +71,18 @@ int vkms_output_init(struct vkms_device *vkmsdev)
 
 	drm_connector_helper_add(connector, &vkms_conn_helper_funcs);
 
-	ret = drm_encoder_init(dev, encoder, &vkms_encoder_funcs,
-			       DRM_MODE_ENCODER_VIRTUAL, NULL);
+	ret = drmm_encoder_init(dev, encoder, NULL,
+				DRM_MODE_ENCODER_VIRTUAL, NULL);
 	if (ret) {
 		DRM_ERROR("Failed to init encoder\n");
-		return ret;
+		goto err_connector;
 	}
 	encoder->possible_crtcs = drm_crtc_mask(crtc);
 
 	ret = drm_connector_attach_encoder(connector, encoder);
 	if (ret) {
 		DRM_ERROR("Failed to attach connector to encoder\n");
-		goto err_attach;
+		return ret;
 	}
 
 	if (vkmsdev->config->writeback) {
@@ -99,8 +95,6 @@ int vkms_output_init(struct vkms_device *vkmsdev)
 
 	return 0;
 
-err_attach:
-	drm_encoder_cleanup(encoder);
 err_connector:
 	drm_crtc_cleanup(crtc);
 	return ret;

-- 
2.44.2

