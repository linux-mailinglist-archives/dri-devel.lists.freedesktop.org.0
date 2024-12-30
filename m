Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F22529FE9FA
	for <lists+dri-devel@lfdr.de>; Mon, 30 Dec 2024 19:38:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4209F10E56B;
	Mon, 30 Dec 2024 18:38:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="oO+b8RN1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1410310E56B
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Dec 2024 18:38:06 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 66CCCE0005;
 Mon, 30 Dec 2024 18:37:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1735583865;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ORNcbjUscQPawEReOo+mB/rT9VuEfLQrTBsR3RDKoMc=;
 b=oO+b8RN1/jmSTs3gSYctllDj+GE6sb2P45xOMYD55WeSmC+N6Oyy5y6oWsEgtsgx45DFGY
 6XjWwWVQHVbgvUDgdsajGZU+jIeS3ib/PSyjiK+WjD1VfuJZ3D+wmmC02KK3EZayNOy0fM
 n+slbFAhS59xWFxFeGFoOTK2HCpoVbGvDPCLnI+W/gtZi0EGGdWHlCkzhTjnVaaN+ArspG
 7RRlmSkri7dotRc7AoLGmFQk9BLntyxcK9TnYUgxTie42oF7dSsfypd3iy+rfYaEd3EB6C
 yXElUi84DAbfg1jY66PM6vcRY262z06v1ybg3vZ1Sn7A8UUXssokV6QhXSDWtQ==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Mon, 30 Dec 2024 19:37:32 +0100
Subject: [PATCH v6 2/8] drm/vkms: Switch to managed for encoder
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20241230-google-vkms-managed-v6-2-15c7d65cd63b@bootlin.com>
References: <20241230-google-vkms-managed-v6-0-15c7d65cd63b@bootlin.com>
In-Reply-To: <20241230-google-vkms-managed-v6-0-15c7d65cd63b@bootlin.com>
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
 b=owEBbQKS/ZANAwAIASCtLsZbECziAcsmYgBncuhwiaifnM4iL5bqHUyzJfo8vsij6lcri0Leh
 GFKcy43gm+JAjMEAAEIAB0WIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCZ3LocAAKCRAgrS7GWxAs
 4qwtEACpB7/iroulh+D5FoPeo7OsVPErTDpykJXypL95jvbv/sZJ69c6LEVIhiBJSAhbOJ8VJT0
 vQtlERWeXvIpNSAo3oPKsuf6yddzjfqaeVI+7raF3E+pElf5j4RSLTXpSjrb1PopUtvu91JfQ+K
 iuTcgrr7uNeZO7GBG/utildhj2jm4OZ0CyKSsttXw5fKQKUzHNXzhhbWa6jUGhseTc9VWQNiYhe
 EZGDjIMqZ4ZKFNYYlobbwRDqMmu2BLBkHMa0112yebKQv59bEhqMTjnW41EXfGFkiM97SxA8I6O
 Ca/YxDl45yoPKC3rKHxYhJjdniXEemeUzQXPZKEu3Xp58AwRQW/7J+MNB8l/60hTKm5lCgDEmRX
 VH9DXV6b8IYtqpEqNiWpoPfyLntbNoqCUVmTflAHnBikRbzvJZOCtvbf1hWZQ4OGghMhMQmcQiO
 VKbZHIAoL4ThdrwTQQ0S7FFYG8p7mGnCZVTaNqUEG1vRkwQmnLHi5rGUSdH0j7p4Er6yeH3H4La
 jFpRLtcnmZROGpPB07r57v85P5QqBQD4CRZgrh9hWWak7j1s68H1JC/ZZk1yQy56R4+h8w4VlLX
 jFny1kiHYoJZTvjD0vVhHy0/9JS2hwE7UPyo5tYRGGQaoTdgrEhN9fp8clNTriGit74WywPEaEW
 Vv3V70ERHM/ubUA==
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

