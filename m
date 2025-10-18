Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D4D28BEC42F
	for <lists+dri-devel@lfdr.de>; Sat, 18 Oct 2025 04:02:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C6D110E27C;
	Sat, 18 Oct 2025 02:02:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="JzdnpRlR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 63F5810E1D5
 for <dri-devel@lists.freedesktop.org>; Sat, 18 Oct 2025 02:02:00 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id 557601A14AA;
 Sat, 18 Oct 2025 02:01:59 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 2540C60701;
 Sat, 18 Oct 2025 02:01:59 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 64D08102F237B; 
 Sat, 18 Oct 2025 04:01:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1760752917; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=SVWglRXAb3sduyLpdPObgcLLPU6kNFYMuqUjpNzcatw=;
 b=JzdnpRlRCnnQtM5MjcbGajA2T00BGxnLdKt1azfP/PC8h8KoZsk4r/4tF17u3t79KRQdAK
 n5fqZHYDbMLpGY+mnm8fdzMV9CuXENLpxN71D1sq0mZfEMbY1SkbfkpVPSmMs86hnXRjAQ
 Kxz7qv92g8o3qfE28d9UH+AnNsi4hTFjDgMGDSy+qqNu1OP0ZdRUZd+5PBrLH+kYeVdyCY
 xbVCubyKU/v0rd5pXhyl1+19CWFzVFg2DrZzwIk+cxKtHjFtNgddK6OQ/zuHpItfutOo02
 MOfeBzgmpFGRYqxOCPv5yx+ff74jO8Py7IT17y2GtACLzR/WVeDlmtqmenhssw==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Sat, 18 Oct 2025 04:01:05 +0200
Subject: [PATCH 05/22] drm/vkms: Introduce config for plane color encoding
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251018-vkms-all-config-v1-5-a7760755d92d@bootlin.com>
References: <20251018-vkms-all-config-v1-0-a7760755d92d@bootlin.com>
In-Reply-To: <20251018-vkms-all-config-v1-0-a7760755d92d@bootlin.com>
To: Haneen Mohammed <hamohammed.sa@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Melissa Wen <melissa.srw@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, jose.exposito89@gmail.com, 
 Jonathan Corbet <corbet@lwn.net>
Cc: victoria@system76.com, sebastian.wick@redhat.com, victoria@system76.com, 
 airlied@gmail.com, thomas.petazzoni@bootlin.com, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-doc@vger.kernel.org, Louis Chauvet <louis.chauvet@bootlin.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=5382;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=FBi9wj02YrH6AcpfOsoy4T2nViBT0k8WVr4xLZc3ieA=;
 b=owEBbQKS/ZANAwAKASCtLsZbECziAcsmYgBo8vT9+XgSREWK0HTSgMLz7+zkkAWeHa+71gdfK
 5J3f323XL6JAjMEAAEKAB0WIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCaPL0/QAKCRAgrS7GWxAs
 4stcEAC9mmtne2kuCw5/VuRopbmGem2c5kJzFqjOH9i9ls7NQspD4GC0o+8c/zZFduqFTJJ8QgO
 NEznRUaEhwUGWOIchnlMFHXeY/s7TNBHGfiFLBltOF7s2UkiYLrShWDswfFW9Gg7PvMXTDMy1sM
 lf7yHobBTKoS0S9ERr81LTB91jpNJX/kCfZnO+bp8jXz1YUe1+9JY61Zs7HKI5MpF6EIvaBntP8
 bNRhXDThJDdNtKHrKIMmvoyA1+jLw8i7URmGGY6y39F/OUOhULB4hodrnBsBhbA/d0lNfjA1Zyy
 qwJqOci2HnG+ZDjZk/VHC/Y2mb9SwYB0+rfkE1tEugk06AqxRSLkFXppO32irmoyu0JNbT/mqhI
 zym1YPkmgix97ZzH8feopupl9qUGJSiEh1KrblFrpt3ZObXlj8W2il0e6LA8HZFyhryb21Cre3E
 ga5FZHXCKKNTFLqmXKlDc+XqyNq01mwDkBxfg9qkXKeJf5iFjaS1W8yw/sHp8nBjrINLcVl04Z5
 9k+jDOa8TxqTR6aGDDvx23ELL6WNZJhXlaIpEEm+fASvmRk5bhcjVjr9xxdZ1krOmtUjYnXGqrT
 bM3bTKIokpUV1MBz5EIKg3LDFaUI5NsJOTIeA/asKlAer1YaBH7pKrnxr2+h+qB8e4w55FqDGbD
 uuQP2hijzQznD1w==
X-Developer-Key: i=louis.chauvet@bootlin.com; a=openpgp;
 fpr=8B7104AE9A272D6693F527F2EC1883F55E0B40A5
X-Last-TLS-Session-Version: TLSv1.3
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
 drivers/gpu/drm/vkms/vkms_config.h | 30 ++++++++++++++++++++++++++++++
 drivers/gpu/drm/vkms/vkms_plane.c  |  6 ++----
 3 files changed, 47 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/vkms/vkms_config.c b/drivers/gpu/drm/vkms/vkms_config.c
index b8cabe6f6cf8..5353719a476d 100644
--- a/drivers/gpu/drm/vkms/vkms_config.c
+++ b/drivers/gpu/drm/vkms/vkms_config.c
@@ -156,6 +156,13 @@ static bool valid_plane_properties(const struct vkms_config *config)
 			drm_info(dev, "Configured default rotation is not supported by the plane\n");
 			return false;
 		}
+
+		if ((BIT(vkms_config_plane_get_default_color_encoding(plane_cfg)) &
+		     vkms_config_plane_get_supported_color_encoding(plane_cfg)) !=
+		    BIT(vkms_config_plane_get_default_color_encoding(plane_cfg))) {
+			drm_info(dev, "Configured default color encoding is not supported by the plane\n");
+			return false;
+		}
 	}
 	return true;
 }
@@ -375,6 +382,10 @@ static int vkms_config_show(struct seq_file *m, void *data)
 			   vkms_config_plane_get_supported_rotations(plane_cfg));
 		seq_printf(m, "\tdefault rotation: 0x%x\n",
 			   vkms_config_plane_get_default_rotation(plane_cfg));
+		seq_printf(m, "\tsupported color encoding: 0x%x\n",
+			   vkms_config_plane_get_supported_color_encoding(plane_cfg));
+		seq_printf(m, "\tdefault color encoding: %d\n",
+			   vkms_config_plane_get_default_color_encoding(plane_cfg));
 	}
 
 	vkms_config_for_each_crtc(vkmsdev->config, crtc_cfg) {
@@ -418,6 +429,10 @@ struct vkms_config_plane *vkms_config_create_plane(struct vkms_config *config)
 	vkms_config_plane_set_name(plane_cfg, NULL);
 	vkms_config_plane_set_supported_rotations(plane_cfg, DRM_MODE_ROTATE_MASK);
 	vkms_config_plane_set_default_rotation(plane_cfg, DRM_MODE_ROTATE_0);
+	vkms_config_plane_set_supported_color_encoding(plane_cfg, BIT(DRM_COLOR_YCBCR_BT601) |
+							BIT(DRM_COLOR_YCBCR_BT709) |
+							BIT(DRM_COLOR_YCBCR_BT2020));
+	vkms_config_plane_set_default_color_encoding(plane_cfg, DRM_COLOR_YCBCR_BT601);
 
 	xa_init_flags(&plane_cfg->possible_crtcs, XA_FLAGS_ALLOC);
 
diff --git a/drivers/gpu/drm/vkms/vkms_config.h b/drivers/gpu/drm/vkms/vkms_config.h
index 3c3cbefcc67f..11160c3c13bc 100644
--- a/drivers/gpu/drm/vkms/vkms_config.h
+++ b/drivers/gpu/drm/vkms/vkms_config.h
@@ -45,6 +45,8 @@ struct vkms_config {
  *         It can be used to store a temporary reference to a VKMS plane during
  *         device creation. This pointer is not managed by the configuration and
  *         must be managed by other means.
+ * @default_color_encoding: Default color encoding that should be used by this plane
+ * @supported_color_encoding: Color encoding that this plane will support
  */
 struct vkms_config_plane {
 	struct list_head link;
@@ -54,6 +56,8 @@ struct vkms_config_plane {
 	enum drm_plane_type type;
 	unsigned int default_rotation;
 	unsigned int supported_rotations;
+	enum drm_color_encoding default_color_encoding;
+	unsigned int supported_color_encoding;
 	struct xarray possible_crtcs;
 
 	/* Internal usage */
@@ -344,6 +348,32 @@ vkms_config_plane_set_supported_rotations(struct vkms_config_plane *plane_cfg,
 	plane_cfg->supported_rotations = supported_rotations;
 }
 
+static inline enum drm_color_encoding
+vkms_config_plane_get_default_color_encoding(struct vkms_config_plane *plane_cfg)
+{
+	return plane_cfg->default_color_encoding;
+}
+
+static inline void
+vkms_config_plane_set_default_color_encoding(struct vkms_config_plane *plane_cfg,
+					     enum drm_color_encoding default_color_encoding)
+{
+	plane_cfg->default_color_encoding = default_color_encoding;
+}
+
+static inline unsigned int
+vkms_config_plane_get_supported_color_encoding(struct vkms_config_plane *plane_cfg)
+{
+	return plane_cfg->supported_color_encoding;
+}
+
+static inline void
+vkms_config_plane_set_supported_color_encoding(struct vkms_config_plane *plane_cfg,
+					       unsigned int supported_color_encoding)
+{
+	plane_cfg->supported_color_encoding = supported_color_encoding;
+}
+
 /**
  * vkms_config_plane_set_name() - Set the plane name
  * @plane_cfg: Plane to set the name to
diff --git a/drivers/gpu/drm/vkms/vkms_plane.c b/drivers/gpu/drm/vkms/vkms_plane.c
index 6e6bfe1b7400..5869000415e4 100644
--- a/drivers/gpu/drm/vkms/vkms_plane.c
+++ b/drivers/gpu/drm/vkms/vkms_plane.c
@@ -239,12 +239,10 @@ struct vkms_plane *vkms_plane_init(struct vkms_device *vkmsdev,
 					   vkms_config_plane_get_supported_rotations(config));
 
 	drm_plane_create_color_properties(&plane->base,
-					  BIT(DRM_COLOR_YCBCR_BT601) |
-					  BIT(DRM_COLOR_YCBCR_BT709) |
-					  BIT(DRM_COLOR_YCBCR_BT2020),
+					  vkms_config_plane_get_supported_color_encoding(config),
 					  BIT(DRM_COLOR_YCBCR_LIMITED_RANGE) |
 					  BIT(DRM_COLOR_YCBCR_FULL_RANGE),
-					  DRM_COLOR_YCBCR_BT601,
+					  vkms_config_plane_get_default_color_encoding(config),
 					  DRM_COLOR_YCBCR_FULL_RANGE);
 
 	return plane;

-- 
2.51.0

