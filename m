Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AD9C29932AC
	for <lists+dri-devel@lfdr.de>; Mon,  7 Oct 2024 18:11:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 94A8810E3D0;
	Mon,  7 Oct 2024 16:11:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="SWkhdD1N";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A567010E3D3
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Oct 2024 16:10:58 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 4DCAA4000F;
 Mon,  7 Oct 2024 16:10:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1728317457;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0BsU4INOE1CHTascqSt5xwkugSRCgOxTbOYvghbcOx8=;
 b=SWkhdD1Noq/TnMpLyGIYwkE1taZTzB1IUEVHF8zOxIMRzch7B17FKcMLoL0FmFGoQEagt4
 L84gFLk/Jbu8PjkK3yINXgOkwXu0es9rOMZhvmvfPic9AzPT6ZONdtd/LtKKebJXB+SM4B
 Dp5v2wBj7h1CrH8n5EIdxZrJB2X4bienUSJ2eKO6L48kmy266umfaxAboP/YCLNAfc4VCG
 scyGf7BQYJeDuiFcIjSvBYJ2hx6C8LgFZNj/5633c6pfEuaCrQ+bdi05J9b2ox6HvQ36Ym
 ZQAmU9RKoy/uU+Ohs4x3UfHacciC5iyf9zeCBZL98dCxDZZtcKYAtI5/UfAwjg==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Mon, 07 Oct 2024 18:10:43 +0200
Subject: [PATCH v12 09/15] drm/vkms: Remove useless drm_rotation_simplify
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241007-yuv-v12-9-01c1ada6fec8@bootlin.com>
References: <20241007-yuv-v12-0-01c1ada6fec8@bootlin.com>
In-Reply-To: <20241007-yuv-v12-0-01c1ada6fec8@bootlin.com>
To: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>, 
 Melissa Wen <melissa.srw@gmail.com>, 
 =?utf-8?q?Ma=C3=ADra_Canal?= <mairacanal@riseup.net>, 
 Haneen Mohammed <hamohammed.sa@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Jonathan Corbet <corbet@lwn.net>, 
 Louis Chauvet <louis.chauvet@bootlin.com>, Simona Vetter <simona@ffwll.ch>, 
 rdunlap@infradead.org, arthurgrillo@riseup.net, 
 pekka.paalanen@haloniitty.fi, Simona Vetter <simona.vetter@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-doc@vger.kernel.org, thomas.petazzoni@bootlin.com, 
 jeremie.dautheribes@bootlin.com, miquel.raynal@bootlin.com, 
 seanpaul@google.com, marcheu@google.com, nicolejadeyee@google.com
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1084;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=PFGhswxeEmLZHlnqofeGdDJ2SDZWzjkoeeHK9t5I21Y=;
 b=owEBbQKS/ZANAwAIASCtLsZbECziAcsmYgBnBAgC3LnWqr3zY/IDAl7m5lcqwe0RZYXrq/YdS
 TAmMeF+QBOJAjMEAAEIAB0WIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCZwQIAgAKCRAgrS7GWxAs
 4ujjD/0RwacmovX0q32XNvaQZ5P5o1CyOaB8ZeyB6TjnnrpD/zUhrWK6ptEmeRgDgiSz4ochFsO
 8cyh5k0zscYUIQL0mrU7XR9HfGYjqC/1V1AR+giimaH+MgnplyYwtB9a6ahRcyMc000HxZddbIZ
 TzXC7Krrpshe4PndqOewj/m8H+wXay70uFXdhKuAu4//eMHeAUnNNY+hVKsYGtn9kgGGFloGWRi
 EKDMhGd43x/nmeHdJLE33fklHC5lf6iWu9uFbKgIhB3pVCd7FbnNjMbK6cogSzaJoJSeCfrrpvA
 O5utSjeyBJBl6o9vHNqLhurgZ3lhpFgbVK92xAPzGjEay+CjFVfUNL2kp9ZjBMjF8B6Pow/Ig8Q
 uP4Le8zdp8On9REU0I3r9R8kr7zkML/J6naibbnRss39rz93xiklY0d5hSndivToKY9Zm7UWQoe
 NWe5IJBG7BT5Rhs5APBxbfyasFtP+TlGUTVqW3c71on1mZldEMVu6fG5etMS3aq6iuMJmk8YSqZ
 V0USovd/QMzPphNuy/8+U/dxseVKhMxAHNW7xe3yHTkZijo9hPQIucDaB6MU/RwczkK/3LHlFa9
 a7U9zuXwggVv7Ey/m1TnizuVwLZ0H/IPVxwXJfqRygiYITC27zKu7Faf32RnceVCFVU89GEvkEK
 pX00Uwsg54uB+oA==
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

As all the rotation are now supported by VKMS, this simplification does
not make sense anymore, so remove it.

Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
 drivers/gpu/drm/vkms/vkms_plane.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/vkms/vkms_plane.c b/drivers/gpu/drm/vkms/vkms_plane.c
index 8875bed76410..5a028ee96c91 100644
--- a/drivers/gpu/drm/vkms/vkms_plane.c
+++ b/drivers/gpu/drm/vkms/vkms_plane.c
@@ -115,12 +115,7 @@ static void vkms_plane_atomic_update(struct drm_plane *plane,
 	frame_info->fb = fb;
 	memcpy(&frame_info->map, &shadow_plane_state->data, sizeof(frame_info->map));
 	drm_framebuffer_get(frame_info->fb);
-	frame_info->rotation = drm_rotation_simplify(new_state->rotation, DRM_MODE_ROTATE_0 |
-									  DRM_MODE_ROTATE_90 |
-									  DRM_MODE_ROTATE_270 |
-									  DRM_MODE_REFLECT_X |
-									  DRM_MODE_REFLECT_Y);
-
+	frame_info->rotation = new_state->rotation;
 
 	vkms_plane_state->pixel_read_line = get_pixel_read_line_function(fmt);
 }

-- 
2.46.2

