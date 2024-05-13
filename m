Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EBC6F8C3C7A
	for <lists+dri-devel@lfdr.de>; Mon, 13 May 2024 09:50:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8997510E4C0;
	Mon, 13 May 2024 07:50:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="nAt27+4x";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0604410E4B7
 for <dri-devel@lists.freedesktop.org>; Mon, 13 May 2024 07:50:53 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 2F6AF20016;
 Mon, 13 May 2024 07:50:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1715586652;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=z6QJBejRB4UIVVBulKVlIb1TBeEN2xAQAhfhefcDJuU=;
 b=nAt27+4xF6kS9qKcoRQG30arhbc5tvm4lADaWLU0HXkgVy2Vwa0gZOFbh1N4i2QnAL3Qt+
 RJ2m3VoBfbeRWjJbHSUMpgaIp0jg9uq4wu/9y4hiOrokYL7DaypDCQpmmWueOcy5CfYiYz
 0SAM2Hf+Fqr1rRqXSRkOyb2CwIYrNcnDw6L8zoSjovjcHo5BqaJXntY59Cw//IFCZiPQKQ
 gx3iPHhuwQvjb3aAZzAScsWYty22Bu6hWlKZMlxBHZKbrKhjbivmm31aVwIoqEm0m2ArwC
 0+nKO8qGxr5v3Q9rOEELMrO9iIx4/OJzZReUN/CQ+041N3de/qHgyUqnm9Mqkw==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Mon, 13 May 2024 09:50:32 +0200
Subject: [PATCH v7 11/17] drm/vkms: Remove useless drm_rotation_simplify
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240513-yuv-v7-11-380e9ffec502@bootlin.com>
References: <20240513-yuv-v7-0-380e9ffec502@bootlin.com>
In-Reply-To: <20240513-yuv-v7-0-380e9ffec502@bootlin.com>
To: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>, 
 Melissa Wen <melissa.srw@gmail.com>, 
 =?utf-8?q?Ma=C3=ADra_Canal?= <mairacanal@riseup.net>, 
 Haneen Mohammed <hamohammed.sa@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, rdunlap@infradead.org, 
 arthurgrillo@riseup.net, Jonathan Corbet <corbet@lwn.net>, 
 pekka.paalanen@haloniitty.fi
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 jeremie.dautheribes@bootlin.com, miquel.raynal@bootlin.com, 
 thomas.petazzoni@bootlin.com, seanpaul@google.com, marcheu@google.com, 
 nicolejadeyee@google.com, Louis Chauvet <louis.chauvet@bootlin.com>
X-Mailer: b4 0.14-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1084;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=wUSBUJCSOtsms0zYAayKwF/xjzoMjd+l5I3zX1xUo2g=;
 b=owEBbQKS/ZANAwAIASCtLsZbECziAcsmYgBmQcZD+LHWXLuD8UC/V2SidZJGkv8n0aUZiZbIL
 RxqTEZBxoqJAjMEAAEIAB0WIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCZkHGQwAKCRAgrS7GWxAs
 4oDgEADY87bjjEV2efg9Fo/rPkHxgg+fydezcZIl6O+9mBqI4g4dme4e0GynlaOiORH7N+0Xn+T
 zNRSK3w9Rms/z3w2Mf+P/dx+/ciq+gSpiZxWZlm1D3VBT3cJgwVoFmz8Z88yXUeSjR7QkFXMk3z
 DJahJ4dAPqtOOai9QBjWPHqhHuT7ivrvnJYOsQV/cJd5xnJ6UYNo2vJx9V6Ab0uveKMHSwK7ukr
 KE8xlfirD7aLbtae7Xi41WP5AICtfCUTSTjzdUJ3pqLqQPGOQe8DUdlpUluBeCDyj3kxa7snpGO
 P+zNIhBmzJQm3ELeWrxjYU6mcUb4Q4QRxJi5eXmRGuQUMp3nYJfjWJKYYICUsSMLdDrZB90E9DO
 Im8XsDFdoF4us9if+YonM065rthmG/7pLsC1MA9yLKdume1bH9GNcDiN5kPRFqo83LxJJSUapNq
 dB2bsyJD//LFlxgELcWY5WlKYLCpeHCwtt/hRKsF8hw/yDH5X+AuZL3pZUqIfyxpEOCq1vynF3i
 cBOe4p5zmUP5Gqh7sg/UA0rcwJwl2Hf/TAJq/ASAYypHMVoFBTsBh4q/TshRfGBXrW+YbBDvAaR
 VJoV9BqntwSlkeqefJ2gD9ulm6ThAIO+CS3mD6XneiHXYSbLnNJ+m6j1onwmSQT3teb6wjC2y7h
 VFc5RzrKPlfi1FA==
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
2.43.2

