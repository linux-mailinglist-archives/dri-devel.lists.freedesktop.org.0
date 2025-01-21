Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C6C4A17C64
	for <lists+dri-devel@lfdr.de>; Tue, 21 Jan 2025 11:55:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C87410E575;
	Tue, 21 Jan 2025 10:55:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="nYZFc3d6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::222])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5EFBA10E562
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Jan 2025 10:55:41 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 5B06440010;
 Tue, 21 Jan 2025 10:55:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1737456940;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HqcY0DyYtlO489ogTF+qU/dH02tuwjudbhOD1uwQSKo=;
 b=nYZFc3d66EUYFVln8sqGE2eOnY75Ptngj4UMTlAAfiTHwfn8GzB03e/XXDBaSWuzhUpiRo
 3ZiLx6ZaETlaMl8LnmVV8IxM/QPPj423IKQZYHVcxl7mctFWL1KDvQ76Gk9yfeWenrKy05
 ml3Hwx9tU8+PVrVvWprnUKAUDzJ4fOKUb2Ua9m4j2vQHtWcNBCFGyd/BFm0NLbRrE5r4ZI
 TRW22oDBcBU55/Zer+1sFGKlE8B2Jb06U9D4XiqIQhvHmrM5z67YHrzzP+sRWMxWhjYB2w
 OElb4DcF+bGnEl2pq91rwRh/uH/iN67l6PEngg/AkmycMH2G8IGZfjD/ZnvWmw==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Tue, 21 Jan 2025 11:55:30 +0100
Subject: [PATCH v3 06/16] drm/vkms: Introduce config for plane rotation
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250121-google-remove-crtc-index-from-parameter-v3-6-cac00a3c3544@bootlin.com>
References: <20250121-google-remove-crtc-index-from-parameter-v3-0-cac00a3c3544@bootlin.com>
In-Reply-To: <20250121-google-remove-crtc-index-from-parameter-v3-0-cac00a3c3544@bootlin.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3836;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=/+tB6p8BZyzbvr8BpDgZBRbkRtslJ2ufkBFxa/NbvvQ=;
 b=owEBbQKS/ZANAwAIASCtLsZbECziAcsmYgBnj30h3+PgIgWWW6uszuYC0FX9x5fswGz4iDZE/
 KPg8ENAeMeJAjMEAAEIAB0WIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCZ499IQAKCRAgrS7GWxAs
 4sd5D/452OUg4UptAlh29AkMOVyxmnuupUTNypqsPf5EUrqQeLlcIe1dhD0B7L5h7h8dLeRrkwy
 ldMmQ7niZ3C3qj9TXHWNz2/sHShyk5/uWShDqaFj1in4JOmawaUnUHHNTv/I0PSU5paexqdXSGx
 5cMYG67o6L1PEKy4DMJiLXZfms0+e1PGOzJ5umYjwnUNiQNLrellR7vp3yqLxOqdK7nSj2RPhXD
 zVNAlTeDpMGODZqQC+su7y3lUPXqk2V8QFitWjPU4BXOaDbX5uU4uh4P/DAtd9WCOwAsZH21ySx
 aN14Tr1npS2Dt/W488H/Ml7jbveWuHpSXlLaOlQyGmsK7SI5EXoB1z/OIaTrfrS2QYIX9DCaR4D
 /btt0PrbApNtMJukEqlvvLtV2n8BXnlWQaBN1A8BKwLb2tfu5VG/dJzI17e16obM2DqHDuq5yHt
 ZtpJLldpJBzCdxaHyC9HyWd0m7OCfJpl3WLBsvcXqAyOYDT+yKtgAMVvMzajP5+FRBdqPN/lvh8
 sOck0uuI/f0GaaI6DO+Fr3dVZyhEFAvCqfadJMix7iGMr1tB6JrPxilAgz7zqPSjQ1d92VVlsPz
 IVaNFeK6yOiW4Gsb0UnfAenZ0SJr/4iqKL9Yeb141tx4Mj6vJCU2kxNIF1GuMtZJAPhshOAxR7d
 dCDFuoHvVQEiI4Q==
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
index 0caa6bfccb5e409efa37ea48a52299e0dc132728..c7a39cde8cfbcd0ff4f5ae137cfb709b7a2240e2 100644
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
index b3a9a42476ef340986c8961f076236d76a7c73e3..c23ac8687dedaa956cfd6622321f1026521ff13f 100644
--- a/drivers/gpu/drm/vkms/vkms_plane.c
+++ b/drivers/gpu/drm/vkms/vkms_plane.c
@@ -202,8 +202,9 @@ struct vkms_plane *vkms_plane_init(struct vkms_device *vkmsdev,
 
 	drm_plane_helper_add(&plane->base, &vkms_plane_helper_funcs);
 
-	drm_plane_create_rotation_property(&plane->base, DRM_MODE_ROTATE_0,
-					   DRM_MODE_ROTATE_MASK | DRM_MODE_REFLECT_MASK);
+	drm_plane_create_rotation_property(&plane->base,
+					   config->default_rotation,
+					   config->supported_rotations);
 
 	return plane;
 }

-- 
2.47.1

