Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D415951D44
	for <lists+dri-devel@lfdr.de>; Wed, 14 Aug 2024 16:36:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8264110E4B0;
	Wed, 14 Aug 2024 14:36:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="OWddzPar";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DDF7310E4AF
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Aug 2024 14:36:38 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id A9E3C1C000D;
 Wed, 14 Aug 2024 14:36:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1723646197;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LK1EgB/4twCKJpxkgjhlb8wicG63JKzh5KKMfEjM5zI=;
 b=OWddzParWxfSNCFFG52mbmKIMer+fpp7rc3t/kiid0ciSF3/49tQ6bgBleLx7gSUCwgYQH
 9E8czTE3yzCT7VO4WNFQa7kqmQYjggLmvLxVX38wZFgYTapWubAdkNa16frhZ4aVI1wbCX
 DMtfpEJgGAJf+/y1TYrEYrbzXe/P0/0Z8Au6ZBDqZW4u0tnSXDM+UUa0Qiu3ayzWxlB84K
 Aq/NajZ4mH2DMJt0AABg++n7KNS57VEkmrHRDbJ/1SpNA+3phhHgQQ4xOq024CNuFU/+AH
 NP6vs8Pqz7JNypgmkx2h0sz+rLCwOLVGWQmV9pMa0YMEExoiOJys/iTL0AJ4GA==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Wed, 14 Aug 2024 16:36:30 +0200
Subject: [PATCH RFC 08/15] drm/vkms: Introduce plane rotation configuration
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240814-google-remove-crtc-index-from-parameter-v1-8-6e179abf9fd4@bootlin.com>
References: <20240814-google-remove-crtc-index-from-parameter-v1-0-6e179abf9fd4@bootlin.com>
In-Reply-To: <20240814-google-remove-crtc-index-from-parameter-v1-0-6e179abf9fd4@bootlin.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3736;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=c5MBjt3UhZKnqUp2mCLTQStcuKGhOS2gJkqsBSwtG/g=;
 b=owEBbQKS/ZANAwAIASCtLsZbECziAcsmYgBmvMDqLAJ4ql/Jqx4j92ZfOLMCDhYcIhl+dMs/I
 GdY7mxB2LuJAjMEAAEIAB0WIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCZrzA6gAKCRAgrS7GWxAs
 4nHJD/96MjTVqDlBQ7p9Pnos9sm5CF5QqCW2vCy58KMUreLa1mtrMcvLBjNDWId8zH5VkAdTb0U
 GSIV4rgn66I75kObPlLdH3mV8/Whqgy4ZSnHz5T77xJhqHi13olATeaXZCcJYcSDDY5CfXuMBUQ
 MrmgLMO1N9Uw7F8Pfp3KQIS6jmmooqkuPEdiZ3Wp29yIsnjrYe0C3dFmBhHcq8ovP52aMlWmGCK
 NNTxYFnvj1/O3tD+svIDd8SncFC4xkG4Yt/r2rTj11sjUHh/WNuut9vlXB4Vpk+CetJfFnpA9Sg
 8r/SK+WItJKG+irijTX1IOgzhO/lzNGfEb6C9N7DsOv6+dlJ+srS/Y6q58i4hSFx6kL+A02xJ6g
 g9VCpgZyplDJpMrjTesftp6oeLGcsQb33lnToYuDRrchracK+Efh1lmpLuUp8Syo6AIvVeXo6Yw
 oJTHkEhZa4kX1P0qkbilKXk9730zVovf6kJrhQxHUHrl5zeUTpcsNNIHBEWFPh2eAIaFuUEvtKq
 yn5sqz+zM4wZnn2RB11cCTpL6UnldIJvWOel8p/t2aRhsNWtr7eKc7+aynpwQehx2nPeQ13T90I
 Gq5QT/N6krGXm6Ays0RgeKNpKGyEe4nO/DiH7xKh7TXvOz6CqJhGK1r/X4HwQwFXSjrt96cnxA3
 CKIBHqrrKN5aQkg==
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
index b8e235a22e90..2a24da9c0fc9 100644
--- a/drivers/gpu/drm/vkms/vkms_config.c
+++ b/drivers/gpu/drm/vkms/vkms_config.c
@@ -80,6 +80,8 @@ struct vkms_config_plane *vkms_config_create_plane(struct vkms_config *vkms_conf
 		return NULL;
 
 	vkms_config_overlay->type = DRM_PLANE_TYPE_OVERLAY;
+	vkms_config_overlay->supported_rotations = DRM_MODE_ROTATE_MASK | DRM_MODE_REFLECT_MASK;
+	vkms_config_overlay->default_rotation = DRM_MODE_ROTATE_0;
 
 	list_add(&vkms_config_overlay->link, &vkms_config->planes);
 
@@ -114,6 +116,11 @@ bool vkms_config_is_valid(struct vkms_config *config)
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
@@ -146,6 +153,8 @@ static int vkms_config_show(struct seq_file *m, void *data)
 		seq_puts(m, "plane:\n");
 		seq_printf(m, "\tname: %s\n", config_plane->name);
 		seq_printf(m, "\ttype: %d\n", config_plane->type);
+		seq_printf(m, "\tsupported rotations: 0x%x\n", config_plane->supported_rotations);
+		seq_printf(m, "\tdefault rotation: 0x%x\n", config_plane->default_rotation);
 	}
 
 	return 0;
diff --git a/drivers/gpu/drm/vkms/vkms_config.h b/drivers/gpu/drm/vkms/vkms_config.h
index 792c5e904aa1..77a72a3a637c 100644
--- a/drivers/gpu/drm/vkms/vkms_config.h
+++ b/drivers/gpu/drm/vkms/vkms_config.h
@@ -28,6 +28,8 @@ struct vkms_config {
  * @name: Name of the plane
  * @type: Type of the plane. The creator of configuration needs to ensures that at least one
  *        plane is primary.
+ * @default_rotation: Default rotation that should be used by this plane
+ * @supported_rotation: Rotation that this plane will support
  * @plane: Internal usage. This pointer should never be considered as valid. It can be used to
  *         store a temporary reference to a vkms plane during device creation. This pointer is
  *         not managed by the configuration and must be managed by other means.
@@ -37,6 +39,8 @@ struct vkms_config_plane {
 
 	char *name;
 	enum drm_plane_type type;
+	unsigned int default_rotation;
+	unsigned int supported_rotations;
 
 	/* Internal usage */
 	struct vkms_plane *plane;
diff --git a/drivers/gpu/drm/vkms/vkms_plane.c b/drivers/gpu/drm/vkms/vkms_plane.c
index d2b1b524499f..3a2b8b0b5980 100644
--- a/drivers/gpu/drm/vkms/vkms_plane.c
+++ b/drivers/gpu/drm/vkms/vkms_plane.c
@@ -237,8 +237,9 @@ struct vkms_plane *vkms_plane_init(struct vkms_device *vkmsdev,
 
 	drm_plane_helper_add(&plane->base, &vkms_plane_helper_funcs);
 
-	drm_plane_create_rotation_property(&plane->base, DRM_MODE_ROTATE_0,
-					   DRM_MODE_ROTATE_MASK | DRM_MODE_REFLECT_MASK);
+	drm_plane_create_rotation_property(&plane->base,
+					   config->default_rotation,
+					   config->supported_rotations);
 
 	drm_plane_create_color_properties(&plane->base,
 					  BIT(DRM_COLOR_YCBCR_BT601) |

-- 
2.44.2

