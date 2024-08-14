Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 73ECC951D42
	for <lists+dri-devel@lfdr.de>; Wed, 14 Aug 2024 16:36:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E35EC10E4B4;
	Wed, 14 Aug 2024 14:36:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="R8BbihmT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D700A10E4B2
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Aug 2024 14:36:39 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id A1FB81C0011;
 Wed, 14 Aug 2024 14:36:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1723646198;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=exr93NbJHH1MlNSiTo8r2EJM59HebLID6gRxLw+2zrQ=;
 b=R8BbihmTed7j0v5zUZhIHIvmMbpwnJErHuffKS3/bRRRGXjNWq9VHrhK1dAcNg+kAbH2df
 ihdk03anLjK08GhQZRRz3Z/jJpv1rjtLSHJgJqA1IHlJmzRTxdY6moBTgHRFQb1KfXBCCs
 yLrRjsMMgeD6+RkxUqCtckZboqeWP9LEvGWH/dJCsxMxkVGqZt+jjN6ehqWnLNnMGlyzMN
 AgdlQaDWxmxjakLJ2evYzcly83Sl90r5R/+yCu2K6gBQfOrbfU20+2uDMgsSF0qKDf1jVO
 rBPNjs4e7CF8ErX90C76Fqz9adWLJCfc/4ryZYSBn0XGvk9mTBUW3M8s1Y2nzw==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Wed, 14 Aug 2024 16:36:31 +0200
Subject: [PATCH RFC 09/15] drm/vkms: Introduce configuration for plane
 color encoding
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240814-google-remove-crtc-index-from-parameter-v1-9-6e179abf9fd4@bootlin.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4266;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=roexYR8lijwFeTIa49SgBUoPN3tjM1s+BV+z3H4eZvQ=;
 b=owEBbQKS/ZANAwAIASCtLsZbECziAcsmYgBmvMDrPPw2Fuyl3KoFXT298AI8LDJ6IEG6Ak70T
 OevBVrEpBOJAjMEAAEIAB0WIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCZrzA6wAKCRAgrS7GWxAs
 4r/bEADCmLzL4RFCr1UjfTq3vAQLCzYLM2TFMx99cBrPfBjpeEzjG0wyQ+KjSss1WKS+pntK/cJ
 2LcmAOlLnYXrfmgxWad3XBKE3/b7UpdiYp+fc2gDWSu6HAG2fULmC05nKz0ScFhlToVCtFo7MVy
 iKOzzOqSmq2IGaRodMSK9aCNZ4I8SnObLx7N9wph5IqPl+B+jAlT5g4hmezIzOzI5/bDGZtJwBM
 cdhRvHWXv4Eh+wcYJD/xmv6NWLH5vjVuof8y5eFHj20psTc1rLyxk/tY21EKYuUknB3tSGua/Ho
 xXbJzpo5zykKOXDSoFuWf68qiEMhS7UGcc/sg3l00DhCazSVTDBNYxkH9E/ZYJtLYWhNiOc6fYE
 J43pQ71YtxijtoGVEiqc/3FtViJPNYLIy3z+tEANyQ59bEs1aOKw1EgZ8TQupXyaO9tTOhYFVQh
 te4TXlOmUtLjE+z50YoUY0AhTtcpL2QfYIekuhQtCK0s8gqrHJtYfuiiyhIaG+oioN4Bos32IfQ
 kDZ+8QLGWn0PdANODpoHchxnjhXjZDnIDHnZQfn+ir8NsLtQw3wWJJlKIuKAlmtZdnd+IMqtVx/
 F7SSRJYGjpx0TdJaBeA0I6Q3v5V/WPai7t4N6W/AcSwreC2o7UopGs5sjH2K4IPY74EKC7wuhLZ
 0AkGkH2+KylG9XQ==
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
index 2a24da9c0fc9..dabb8cb13314 100644
--- a/drivers/gpu/drm/vkms/vkms_config.c
+++ b/drivers/gpu/drm/vkms/vkms_config.c
@@ -82,6 +82,11 @@ struct vkms_config_plane *vkms_config_create_plane(struct vkms_config *vkms_conf
 	vkms_config_overlay->type = DRM_PLANE_TYPE_OVERLAY;
 	vkms_config_overlay->supported_rotations = DRM_MODE_ROTATE_MASK | DRM_MODE_REFLECT_MASK;
 	vkms_config_overlay->default_rotation = DRM_MODE_ROTATE_0;
+	vkms_config_overlay->supported_color_encoding = BIT(DRM_COLOR_YCBCR_BT601) |
+							BIT(DRM_COLOR_YCBCR_BT709) |
+							BIT(DRM_COLOR_YCBCR_BT2020);
+	vkms_config_overlay->default_color_encoding = DRM_COLOR_YCBCR_BT601;
+
 
 	list_add(&vkms_config_overlay->link, &vkms_config->planes);
 
@@ -121,6 +126,12 @@ bool vkms_config_is_valid(struct vkms_config *config)
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
@@ -155,6 +166,10 @@ static int vkms_config_show(struct seq_file *m, void *data)
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
index 77a72a3a637c..c8802bfb9ab2 100644
--- a/drivers/gpu/drm/vkms/vkms_config.h
+++ b/drivers/gpu/drm/vkms/vkms_config.h
@@ -30,6 +30,8 @@ struct vkms_config {
  *        plane is primary.
  * @default_rotation: Default rotation that should be used by this plane
  * @supported_rotation: Rotation that this plane will support
+ * @default_color_encoding: Default color encoding that should be used by this plane
+ * @supported_color_encoding: Color encoding that this plane will support
  * @plane: Internal usage. This pointer should never be considered as valid. It can be used to
  *         store a temporary reference to a vkms plane during device creation. This pointer is
  *         not managed by the configuration and must be managed by other means.
@@ -41,6 +43,8 @@ struct vkms_config_plane {
 	enum drm_plane_type type;
 	unsigned int default_rotation;
 	unsigned int supported_rotations;
+	enum drm_color_encoding default_color_encoding;
+	unsigned int supported_color_encoding;
 
 	/* Internal usage */
 	struct vkms_plane *plane;
diff --git a/drivers/gpu/drm/vkms/vkms_plane.c b/drivers/gpu/drm/vkms/vkms_plane.c
index 3a2b8b0b5980..ef20da7ccb17 100644
--- a/drivers/gpu/drm/vkms/vkms_plane.c
+++ b/drivers/gpu/drm/vkms/vkms_plane.c
@@ -242,12 +242,10 @@ struct vkms_plane *vkms_plane_init(struct vkms_device *vkmsdev,
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
2.44.2

