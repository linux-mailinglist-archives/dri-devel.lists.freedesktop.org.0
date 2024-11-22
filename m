Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 38FC29D62E2
	for <lists+dri-devel@lfdr.de>; Fri, 22 Nov 2024 18:20:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 72B3910EC2F;
	Fri, 22 Nov 2024 17:20:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="oC82NXd8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D44A10EC1D
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Nov 2024 17:20:27 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 503FD1C0006;
 Fri, 22 Nov 2024 17:20:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1732296026;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pBZIFQD7HtgRakJub3/6eX8TMYjNFlLaLh92/GPSFRs=;
 b=oC82NXd8veok57UZ19VecTSWSRZP4BKkBAFtrPc4dve27p8h3qRs7AV+2oPY9tz390kOl4
 pndXo/eLG2D8UjduIc75b/ugsArB6rWoYcZ4NHFcN+aNGbzfYufEK9PXQ14wXtX8V1lmZ2
 omjJM3+VPi7vqAha+Alog/Itcx+mX4gWMGXtelWpxHkvKTsuZkhvHp1JZkzzp9ZmbXjB1p
 6whgL1G7VMHKJwSkVgYOaTxTatm91vRxc0BVQBgfTyRIZPOe14gxfiWAhpkCyYh+s0XZHS
 /T/tAnWk/o1pZrHccN3yK+axoYbaM6AquFrWsBKbgUOr36YHhOgz2WtUNKNQbg==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Fri, 22 Nov 2024 18:20:10 +0100
Subject: [PATCH RFC v2 06/18] drm/vkms: Introduce config for plane rotation
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241122-google-remove-crtc-index-from-parameter-v2-6-81540742535a@bootlin.com>
References: <20241122-google-remove-crtc-index-from-parameter-v2-0-81540742535a@bootlin.com>
In-Reply-To: <20241122-google-remove-crtc-index-from-parameter-v2-0-81540742535a@bootlin.com>
To: =?utf-8?q?Ma=C3=ADra_Canal?= <mairacanal@riseup.net>, 
 Haneen Mohammed <hamohammed.sa@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Melissa Wen <melissa.srw@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>
Cc: arthurgrillo@riseup.net, jeremie.dautheribes@bootlin.com, 
 miquel.raynal@bootlin.com, thomas.petazzoni@bootlin.com, 
 seanpaul@google.com, nicolejadeyee@google.com, linux-kernel@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, Louis Chauvet <louis.chauvet@bootlin.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=3904;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=ZF8/pyVrcBVVQ61iaXg6JYk5ufRwAGwyVd/mV0bBoCs=;
 b=owEBbQKS/ZANAwAIASCtLsZbECziAcsmYgBnQL1OIox1qOJnF5YSbYHa9W+bIw7Tk6QtlpHxh
 E87nh6JKQCJAjMEAAEIAB0WIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCZ0C9TgAKCRAgrS7GWxAs
 4gUoD/97Pd/OaENfT2DfMoKYzRWUFCrWIUddD5kQKvqldateYfNna3w1ASAdOMK5x/Y/eWv60xf
 6QuKAaukCM9j0LA3/B5SeryLJeYSD7D9vHlgwHmJV3naJVgWb2tqwGH4AvSIMI3fKWvzzPmTiTa
 44OvKI1G6C0rs6tiioM+sj70JIe3EWiRRtThG8qZjI0Es4DMjlzLjkzqnUvRextI1eRJk9Wr2tb
 2z5zZ4bRZozO1mLdCheVxGX504rB7HNjv6v4ozqqf9kuCx9mw6mhdqaqBseJO+Goc+NrSsGd0/z
 y4SqEFsivw0T9xsoCtl04BiF9vlE4HOh/QUWZZVHh3xlvgLf1++hSQZLq6G3AXLkvK7JdTDUY3n
 9xfHdAwQb6cAsIWSpebwoKlhZwujTdmncLkRshm9viTuAQvmvbnEN3UVFbADksuWhkq4U9cYZWo
 +NK6Mm8g59o6+FFLu7thyRPL8jfQ2lmWns8/leKIjRAHlvJMQlVlqQVuTyJcAIHLmxQ3zM+1lT5
 RccJjr+aCN/ga2EWSNnFQ2MlhrbBmuic8UnxBaVgYj0WauONFOCVJBJn9mJuZFI9gt272jAvbme
 Rrzq5yxcoJWP92Bf9vOiSzPeeYB8SSZqHAY0QsgBvaXXp8EqjeSVAuF5VRS8HQKnYWTszLEcyJS
 vRJqb8V2PgECAjQ==
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

VKMS driver supports all the rotation on planes, but for testing it can be
useful to only advertise few of them. This new configuration interface
will allow configuring the rotation per planes.

Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
 drivers/gpu/drm/vkms/vkms_config.c | 9 +++++++++
 drivers/gpu/drm/vkms/vkms_config.h | 4 ++++
 drivers/gpu/drm/vkms/vkms_plane.c  | 5 +++--
 3 files changed, 16 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/vkms/vkms_config.c b/drivers/gpu/drm/vkms/vkms_config.c
index 8af7b80d1fea201102f45f8ee49fd88ce26733e3..6a2e5f0c580a348effc12b474a7f87dcd4e36642 100644
--- a/drivers/gpu/drm/vkms/vkms_config.c
+++ b/drivers/gpu/drm/vkms/vkms_config.c
@@ -82,6 +82,8 @@ struct vkms_config_plane *vkms_config_create_plane(struct vkms_config *vkms_conf
 		return NULL;
 
 	vkms_config_overlay->type = DRM_PLANE_TYPE_OVERLAY;
+	vkms_config_overlay->supported_rotations = DRM_MODE_ROTATE_MASK | DRM_MODE_REFLECT_MASK;
+	vkms_config_overlay->default_rotation = DRM_MODE_ROTATE_0;
 
 	list_add(&vkms_config_overlay->link, &vkms_config->planes);
 
@@ -118,6 +120,11 @@ bool vkms_config_is_valid(struct vkms_config *config)
 	bool has_primary = false;
 
 	list_for_each_entry(config_plane, &config->planes, link) {
+		// Default rotation not in supported rotations
+		if ((config_plane->default_rotation & config_plane->supported_rotations) !=
+		    config_plane->default_rotation)
+			return false;
+
 		if (config_plane->type == DRM_PLANE_TYPE_PRIMARY) {
 			// Multiple primary planes for only one CRTC
 			if (has_primary)
@@ -151,6 +158,8 @@ static int vkms_config_show(struct seq_file *m, void *data)
 		seq_puts(m, "plane:\n");
 		seq_printf(m, "\tname: %s\n", config_plane->name);
 		seq_printf(m, "\ttype: %d\n", config_plane->type);
+		seq_printf(m, "\tsupported rotations: 0x%x\n", config_plane->supported_rotations);
+		seq_printf(m, "\tdefault rotation: 0x%x\n", config_plane->default_rotation);
 	}
 
 	return 0;
diff --git a/drivers/gpu/drm/vkms/vkms_config.h b/drivers/gpu/drm/vkms/vkms_config.h
index 3e70bce8d4f7b06f44ec79b3a3d8e6897f9a44c7..fd5e0df11647f145d53e71a1b6a244951af3ec0d 100644
--- a/drivers/gpu/drm/vkms/vkms_config.h
+++ b/drivers/gpu/drm/vkms/vkms_config.h
@@ -30,6 +30,8 @@ struct vkms_config {
  * @name: Name of the plane
  * @type: Type of the plane. The creator of configuration needs to ensures that at least one
  *        plane is primary.
+ * @default_rotation: Default rotation that should be used by this plane
+ * @supported_rotation: Rotation that this plane will support
  * @plane: Internal usage. This pointer should never be considered as valid. It can be used to
  *         store a temporary reference to a vkms plane during device creation. This pointer is
  *         not managed by the configuration and must be managed by other means.
@@ -39,6 +41,8 @@ struct vkms_config_plane {
 
 	char *name;
 	enum drm_plane_type type;
+	unsigned int default_rotation;
+	unsigned int supported_rotations;
 
 	/* Internal usage */
 	struct vkms_plane *plane;
diff --git a/drivers/gpu/drm/vkms/vkms_plane.c b/drivers/gpu/drm/vkms/vkms_plane.c
index 56725f243382d75668ab2bf23423a69c75cb366b..306af498543cbc39b8af3e5b5879f8b3972d5a4a 100644
--- a/drivers/gpu/drm/vkms/vkms_plane.c
+++ b/drivers/gpu/drm/vkms/vkms_plane.c
@@ -234,8 +234,9 @@ struct vkms_plane *vkms_plane_init(struct vkms_device *vkmsdev,
 
 	drm_plane_helper_add(&plane->base, &vkms_plane_helper_funcs);
 
-	drm_plane_create_rotation_property(&plane->base, DRM_MODE_ROTATE_0,
-					   DRM_MODE_ROTATE_MASK | DRM_MODE_REFLECT_MASK);
+	drm_plane_create_rotation_property(&plane->base,
+					   config->default_rotation,
+					   config->supported_rotations);
 
 	drm_plane_create_color_properties(&plane->base,
 					  BIT(DRM_COLOR_YCBCR_BT601) |

-- 
2.47.0

