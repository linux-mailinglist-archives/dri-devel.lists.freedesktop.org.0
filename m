Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A0A759D62E4
	for <lists+dri-devel@lfdr.de>; Fri, 22 Nov 2024 18:20:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A6D4910EC31;
	Fri, 22 Nov 2024 17:20:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="oMtAb9H/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 908AE10EC28
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Nov 2024 17:20:28 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 4F2E61C0004;
 Fri, 22 Nov 2024 17:20:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1732296027;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ktawcOolQxrYmPaqwiDnraP2XPOZ45oKEBQAwhE213s=;
 b=oMtAb9H/2mSXg4pB/kN/CZe1IBf0mJQ2Y9rBPOMS1odtIZac57aixaETv1P7HBdetsX6Mr
 FxJqxi+y4FQdwzB6SYaurDM2w0AoIKk1FnG6okiXkVuuxNT9fb0sW9SGyMDDGq9XFbgJiE
 TER3Mg74kpJYBa8WOvVPm+/nb8Hh328iDymbXov5Ly2wakjkD0tnxOxHiow2tfmDZVFJlo
 CAF9qPTjvo9cl2yclVINnQcpmq3LMS94Tvcarb8M7ICyuK21/tTDdcE50x/53Xvs7Aqu5c
 i+zePwCXNBVIl285/lKvNPzPd/7+FmKlAQgyL3rCsFdwPPuL4MvbxdJjwV5x5A==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Fri, 22 Nov 2024 18:20:11 +0100
Subject: [PATCH RFC v2 07/18] drm/vkms: Introduce config for plane color
 encoding
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241122-google-remove-crtc-index-from-parameter-v2-7-81540742535a@bootlin.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4434;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=BF0yRjAMyDjPU9RolEhuXzgfCND9f1KlhkLeU6VUXIA=;
 b=owEBbQKS/ZANAwAIASCtLsZbECziAcsmYgBnQL1OpfzvGPhi5nbgVTIP6JnGt047EF7mfamOi
 pxenGUuXs6JAjMEAAEIAB0WIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCZ0C9TgAKCRAgrS7GWxAs
 4jn3D/9XTXmzSLdEBdnwiOtk+vlzWX4GjMEwjVySVgf6P1aTfE14F2h3zwVSfpEySyzf8oqZkwf
 dnPI6vWOo27Wgcr7d71tRugyArDcMAH5BA00ZrjvrhgG2ucssqDjdABMFZGKeHK9tfA4AmBFiQn
 bx7fHjyc4VUoCrr7SIMefcSY45kw2Z7smbAnqawcaISuEG4eofR895J3ONpQy1J7tMSYEG9RKJW
 5HdJvtnY+50HEhApspf6OxGjaf+q/DjRigUVRxC3R1B+FzHYbEkOiVhfDMRmvZAfWTnIK8wTVJA
 5hH3irC8CH/+RCSzl8L0uryzzGnLpw5npMQGIXeW/SMSeB4/in+ZiOF/Nf1vsHFSOvgL8DSx1oN
 UFOIUn77SOup0RscPxmScSAzSHJxaq5t2DYZuNcGvRsalP2hbgnt/DM1OOiTQhdxvbej/6AX5Qp
 k+YclDnR9D4zU6kVEa+CHhUffz7/zaWXV79WJwzCK7AjTcWV1ltJYy6DubrcpRJ4LQFudvg5nF1
 aIonJ4z+RkhZOmYLeB22TUDLS7bYyGzsY9FYn9VmPpOIxRwB4qaZ1sj2JYs69pDI0BXo+i4Zv9k
 ljR6Bp6QLGksigmtAwkoIVO3q5nQR22c8BgkF/EpdF3fE+Hzw4n2P2sCQJ0Lh+1yjddt3lyKWdE
 vz9TpuJOfiMeOdQ==
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

VKMS driver supports all the color encoding on planes, but for testing it
can be useful to only advertise few of them. This new configuration
interface will allow configuring the color encoding per planes.

Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
 drivers/gpu/drm/vkms/vkms_config.c | 15 +++++++++++++++
 drivers/gpu/drm/vkms/vkms_config.h |  4 ++++
 drivers/gpu/drm/vkms/vkms_plane.c  |  6 ++----
 3 files changed, 21 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/vkms/vkms_config.c b/drivers/gpu/drm/vkms/vkms_config.c
index 6a2e5f0c580a348effc12b474a7f87dcd4e36642..9f9ebe674f6cbe03ac15e5380e4584c40a8bdea7 100644
--- a/drivers/gpu/drm/vkms/vkms_config.c
+++ b/drivers/gpu/drm/vkms/vkms_config.c
@@ -84,6 +84,11 @@ struct vkms_config_plane *vkms_config_create_plane(struct vkms_config *vkms_conf
 	vkms_config_overlay->type = DRM_PLANE_TYPE_OVERLAY;
 	vkms_config_overlay->supported_rotations = DRM_MODE_ROTATE_MASK | DRM_MODE_REFLECT_MASK;
 	vkms_config_overlay->default_rotation = DRM_MODE_ROTATE_0;
+	vkms_config_overlay->supported_color_encoding = BIT(DRM_COLOR_YCBCR_BT601) |
+							BIT(DRM_COLOR_YCBCR_BT709) |
+							BIT(DRM_COLOR_YCBCR_BT2020);
+	vkms_config_overlay->default_color_encoding = DRM_COLOR_YCBCR_BT601;
+
 
 	list_add(&vkms_config_overlay->link, &vkms_config->planes);
 
@@ -125,6 +130,12 @@ bool vkms_config_is_valid(struct vkms_config *config)
 		    config_plane->default_rotation)
 			return false;
 
+		// Default color range not in supported color range
+		if ((BIT(config_plane->default_color_encoding) &
+		     config_plane->supported_color_encoding) !=
+		    BIT(config_plane->default_color_encoding))
+			return false;
+
 		if (config_plane->type == DRM_PLANE_TYPE_PRIMARY) {
 			// Multiple primary planes for only one CRTC
 			if (has_primary)
@@ -160,6 +171,10 @@ static int vkms_config_show(struct seq_file *m, void *data)
 		seq_printf(m, "\ttype: %d\n", config_plane->type);
 		seq_printf(m, "\tsupported rotations: 0x%x\n", config_plane->supported_rotations);
 		seq_printf(m, "\tdefault rotation: 0x%x\n", config_plane->default_rotation);
+		seq_printf(m, "\tsupported color encoding: 0x%x\n",
+			   config_plane->supported_color_encoding);
+		seq_printf(m, "\tdefault color encoding: %d\n",
+			   config_plane->default_color_encoding);
 	}
 
 	return 0;
diff --git a/drivers/gpu/drm/vkms/vkms_config.h b/drivers/gpu/drm/vkms/vkms_config.h
index fd5e0df11647f145d53e71a1b6a244951af3ec0d..6cc9b89a996fe26c04951981cfeff7b603c6aec4 100644
--- a/drivers/gpu/drm/vkms/vkms_config.h
+++ b/drivers/gpu/drm/vkms/vkms_config.h
@@ -32,6 +32,8 @@ struct vkms_config {
  *        plane is primary.
  * @default_rotation: Default rotation that should be used by this plane
  * @supported_rotation: Rotation that this plane will support
+ * @default_color_encoding: Default color encoding that should be used by this plane
+ * @supported_color_encoding: Color encoding that this plane will support
  * @plane: Internal usage. This pointer should never be considered as valid. It can be used to
  *         store a temporary reference to a vkms plane during device creation. This pointer is
  *         not managed by the configuration and must be managed by other means.
@@ -43,6 +45,8 @@ struct vkms_config_plane {
 	enum drm_plane_type type;
 	unsigned int default_rotation;
 	unsigned int supported_rotations;
+	enum drm_color_encoding default_color_encoding;
+	unsigned int supported_color_encoding;
 
 	/* Internal usage */
 	struct vkms_plane *plane;
diff --git a/drivers/gpu/drm/vkms/vkms_plane.c b/drivers/gpu/drm/vkms/vkms_plane.c
index 306af498543cbc39b8af3e5b5879f8b3972d5a4a..77704ee2d49d2ce1551f67cab6308dc69b329ef5 100644
--- a/drivers/gpu/drm/vkms/vkms_plane.c
+++ b/drivers/gpu/drm/vkms/vkms_plane.c
@@ -239,12 +239,10 @@ struct vkms_plane *vkms_plane_init(struct vkms_device *vkmsdev,
 					   config->supported_rotations);
 
 	drm_plane_create_color_properties(&plane->base,
-					  BIT(DRM_COLOR_YCBCR_BT601) |
-					  BIT(DRM_COLOR_YCBCR_BT709) |
-					  BIT(DRM_COLOR_YCBCR_BT2020),
+					  config->supported_color_encoding,
 					  BIT(DRM_COLOR_YCBCR_LIMITED_RANGE) |
 					  BIT(DRM_COLOR_YCBCR_FULL_RANGE),
-					  DRM_COLOR_YCBCR_BT601,
+					  config->default_color_encoding,
 					  DRM_COLOR_YCBCR_FULL_RANGE);
 
 	return plane;

-- 
2.47.0

