Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B91E0946170
	for <lists+dri-devel@lfdr.de>; Fri,  2 Aug 2024 18:10:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 66E9C10E1BB;
	Fri,  2 Aug 2024 16:10:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="dfUD1zFL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C2AD010E1A7
 for <dri-devel@lists.freedesktop.org>; Fri,  2 Aug 2024 16:10:21 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 5BDE41C0002;
 Fri,  2 Aug 2024 16:10:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1722615020;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kC6rGUyDBbAOLm93Wq8KTDogWyBbuAcpNFYSnVc73eM=;
 b=dfUD1zFLis+p+xl3XxKSNgkXQsf2czMg+Vvqq18K/Avrw585YDKjvxzWNHyeuWouh6UoG0
 X2/6ouFMElOG5D24fLClrXSKiRkQdOg2cJgaIHt/vuxZBJClbs+xfk2YtZGzyWvLoI0MIs
 Fh2TTGoRTsXemP6TYraSaK2tVmms92SIPhDgyWlhdoYdW9z9CbMO3H1c3ByqlKvVv6Y+j8
 885X/eQZ08e2Xi7R9HpM7YiKc8KDxIuh/yPHmzmUJJQXiTbcYd5JCUmdLm0cKHAYlFdwBh
 cg8Xze7fc3EvU8ofHnChcBDDRaErUvKSnwib2cdwFUGcK3FPY1ZynMJRD1AeLA==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Fri, 02 Aug 2024 18:09:56 +0200
Subject: [PATCH v9 11/17] drm/vkms: Remove useless drm_rotation_simplify
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240802-yuv-v9-11-08a706669e16@bootlin.com>
References: <20240802-yuv-v9-0-08a706669e16@bootlin.com>
In-Reply-To: <20240802-yuv-v9-0-08a706669e16@bootlin.com>
To: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>, 
 Melissa Wen <melissa.srw@gmail.com>, 
 =?utf-8?q?Ma=C3=ADra_Canal?= <mairacanal@riseup.net>, 
 Haneen Mohammed <hamohammed.sa@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Jonathan Corbet <corbet@lwn.net>, 
 rdunlap@infradead.org, arthurgrillo@riseup.net, 
 pekka.paalanen@haloniitty.fi
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-doc@vger.kernel.org, jeremie.dautheribes@bootlin.com, 
 miquel.raynal@bootlin.com, thomas.petazzoni@bootlin.com, 
 seanpaul@google.com, marcheu@google.com, nicolejadeyee@google.com, 
 Louis Chauvet <louis.chauvet@bootlin.com>
X-Mailer: b4 0.14-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1084;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=G5C5+e6eHFv/QVAB4jYLixOzCVec4t/0lYgv2kvZHy0=;
 b=owEBbQKS/ZANAwAIASCtLsZbECziAcsmYgBmrQTb5OBjRUFHQXcY9UveicUxZ2dNKzeFoJjWs
 GpAxUTm+L+JAjMEAAEIAB0WIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCZq0E2wAKCRAgrS7GWxAs
 4t/OEADPNrdS5BqCpLPwpok1vRfMpCTmOxPO+dhu/Xsf72Oa5oh79S/F710jSrgIgg/hA6MHOV9
 tjWRCl2X2SMpjz2XOO32L+4nMI6M69nGLfW6Qcwf9kS0CJuAX6ngqcE0iEwb7HKR2N6Mle3wDfm
 Tfye3ekjPPwgc4JL6IpIlvDDQzxXUiahSUKmoOQ9qlwR5n+m37z3hR2TjQX2eQcHe0yN8Bav86R
 c88Xzv3kn5onerkwe/OKe/IKmnAoK8IHVF2MWobC/86Tql2hHVYir+8MOSXntLvO/OofrtiSVq8
 6RFNgpCRlcVuqeRbOxgEs8o0sPl5GVQHDIb2WM3T8E44hXV+4B35GZ/RpB/G5YUYNwq+V51CEsC
 /4PkWA5vNyk22fwddtf/l8cfhIbIpcVGl5FKX7yOXjD8nJujt0FCpREnKN9gHvWzwYAFXIah1Qk
 wXYUycmBoh4IEvHxgFC3ALZ1dN260JeDfIWasSBURIQXsyrKAeD2HTrGhewc2hznYuIDBSs943t
 Fo4fJ/3K3gQNLAh0ykaQdtmmIMSPlD7JdNj4adby8Ug9tNC3IqpDMQkoObgsaHFBoKUgqcfu8NL
 1kyKVdYh3iw+m92GnWGxz5f1q4ZccocEXvSM9qCnIz+vdGYysMiZ1PKsbeUURuwiCl+OvtDeu8U
 BFT9wHVO0BgLLbg==
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
2.44.2

