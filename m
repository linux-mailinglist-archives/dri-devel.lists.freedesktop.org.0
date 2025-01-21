Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C56EA17C65
	for <lists+dri-devel@lfdr.de>; Tue, 21 Jan 2025 11:55:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B39E810E578;
	Tue, 21 Jan 2025 10:55:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="FYPXFg02";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::222])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 80ED610E562
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Jan 2025 10:55:40 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 86F494000D;
 Tue, 21 Jan 2025 10:55:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1737456939;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rZcwtHI8+1dN0/SLlMiTp/ryUEVBiLmGMxRlYoqZrlY=;
 b=FYPXFg02iu2Ko0nmZ5ic6AtIaw4B0AW5gf6aTSjp1iu1jZVeQo8RxES7m964HAeTzkK/EI
 EzOuvDRpicBAIGwcvtqiDYHQeHze5Td/BZ6N0pz6z7LNj/W9iIEOwdbDcGkGHU1qvtgbxV
 FazmloIRlNNwitemAqTM1ql41iE4/DqXfw+x6Su1nouK74pXJ8VfAH+80MKtgiCFBvpBra
 ni/Ual+NPaag7U4MnL0NzFjf6R7zMjP74LK5HGkW5XLA3tU1rH4ytyJOPUtfTsAvnXUlYm
 yiE3OsKdMQ4RatbwupctUzc/1fOm5m6aEgZwVUxQk9iLXsBDfHfuKAwgw02WJQ==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Tue, 21 Jan 2025 11:55:29 +0100
Subject: [PATCH v3 05/16] drm/vkms: Introduce config for plane name
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250121-google-remove-crtc-index-from-parameter-v3-5-cac00a3c3544@bootlin.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3777;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=Q4JNIVSGM6yjHh69qGFrGrMv69I5kWOImsa10E9crF0=;
 b=owEBbQKS/ZANAwAIASCtLsZbECziAcsmYgBnj30h2HpIbZERw8CtbNtFiLzBfLqQ8xZm0cw6w
 aflIInxFj6JAjMEAAEIAB0WIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCZ499IQAKCRAgrS7GWxAs
 4uLHEADBRT60MdbXTR1tHRt5DffiwnkpywTA9dt1W3puJIOduUacC+1GBFZMRE96TrEuUfZspsj
 AgRmot0GxCVtaByEjjimRDX2eG8kSR9Irt0WiMPDzqsMWCwfa/tdqSX07x+6Xr0xbvHNNgu3BDu
 qsAVBe+kKgnPODJ8ilJ2U+mhK8JJDMMVzXwd8p6V33l87B0iU4ktAJAbZzZh7BOHYv898aomv5e
 y/LdGm9uKt5M9jfdBTR8GVsDfBpMshBaeBdc25pwr1QG1uWwAdYCdUvCGQWJDtXFlEU9jM336oy
 Jgs+Mo2F7pK+ZR5/uj+d+yvLQ+8MJVxbl39FCHWmATYSFLlJODLsgZdSSnczgjETdTKaBIsjFzc
 y+GFZc3amrWXwKh6ju2TLH4IJssJwSs+m7BJvusv6p1P4CsdchD4HzAqOQm++SLV6dse8bSFwyQ
 0IDH5GvvG61lUuzz0sDBKm4RGIJdxIfrYwNjairdoPjMpuCrRpBsU2Ra8Ukpn9kj3bYNxeI93Ub
 LMWqeuJgm/H+pAKVzZrkFXUJH6k9fZPbQV7oBpmTWgFpMk36hSj0sFvGs4tctnsrbE2VIAqjleg
 b9G+RYftkVcYNPASi/fR92p4trgVY/SVlpqxVM60k4hpNWKSjr01EdKMDi8W6qShtjd/mdOhLkI
 y072mZyrOqfuvng==
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

As a plane will be a folder in ConfigFS, add name configuration for plane
so it will reflect the folder name.

Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
 drivers/gpu/drm/vkms/vkms_config.c | 14 ++++++++++++++
 drivers/gpu/drm/vkms/vkms_config.h |  2 ++
 drivers/gpu/drm/vkms/vkms_plane.c  |  2 +-
 3 files changed, 17 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/vkms/vkms_config.c b/drivers/gpu/drm/vkms/vkms_config.c
index 495056ce988ab32738701f00c94c709457aefbd3..0caa6bfccb5e409efa37ea48a52299e0dc132728 100644
--- a/drivers/gpu/drm/vkms/vkms_config.c
+++ b/drivers/gpu/drm/vkms/vkms_config.c
@@ -36,6 +36,10 @@ struct vkms_config *vkms_config_alloc_default(bool enable_writeback, bool enable
 		goto err_alloc;
 
 	plane->type = DRM_PLANE_TYPE_PRIMARY;
+	plane->name = kzalloc(sizeof("primary"), GFP_KERNEL);
+	if (!plane->name)
+		goto err_alloc;
+	sprintf(plane->name, "primary");
 
 	if (enable_overlay) {
 		for (int i = 0; i < NUM_OVERLAY_PLANES; i++) {
@@ -43,6 +47,10 @@ struct vkms_config *vkms_config_alloc_default(bool enable_writeback, bool enable
 			if (!plane)
 				goto err_alloc;
 			plane->type = DRM_PLANE_TYPE_OVERLAY;
+			plane->name = kzalloc(10, GFP_KERNEL);
+			if (!plane->name)
+				goto err_alloc;
+			snprintf(plane->name, 10, "plane-%d", i);
 		}
 	}
 	if (enable_cursor) {
@@ -50,6 +58,10 @@ struct vkms_config *vkms_config_alloc_default(bool enable_writeback, bool enable
 		if (!plane)
 			goto err_alloc;
 		plane->type = DRM_PLANE_TYPE_CURSOR;
+		plane->name = kzalloc(sizeof("cursor"), GFP_KERNEL);
+		if (!plane->name)
+			goto err_alloc;
+		sprintf(plane->name, "cursor");
 	}
 	return vkms_config;
 
@@ -82,6 +94,7 @@ void vkms_config_delete_plane(struct vkms_config_plane *vkms_config_overlay)
 	if (!vkms_config_overlay)
 		return;
 	list_del(&vkms_config_overlay->link);
+	kfree(vkms_config_overlay->name);
 	kfree(vkms_config_overlay);
 }
 
@@ -136,6 +149,7 @@ static int vkms_config_show(struct seq_file *m, void *data)
 	seq_printf(m, "writeback=%d\n", vkmsdev->config->writeback);
 	list_for_each_entry(config_plane, &vkmsdev->config->planes, link) {
 		seq_puts(m, "plane:\n");
+		seq_printf(m, "\tname: %s\n", config_plane->name);
 		seq_printf(m, "\ttype: %d\n", config_plane->type);
 	}
 
diff --git a/drivers/gpu/drm/vkms/vkms_config.h b/drivers/gpu/drm/vkms/vkms_config.h
index ac99f1df6d9a17bd7040a1e7a6acce14cd8fd9d0..3e70bce8d4f7b06f44ec79b3a3d8e6897f9a44c7 100644
--- a/drivers/gpu/drm/vkms/vkms_config.h
+++ b/drivers/gpu/drm/vkms/vkms_config.h
@@ -27,6 +27,7 @@ struct vkms_config {
  * struct vkms_config_plane
  *
  * @link: Link to the others planes
+ * @name: Name of the plane
  * @type: Type of the plane. The creator of configuration needs to ensures that at least one
  *        plane is primary.
  * @plane: Internal usage. This pointer should never be considered as valid. It can be used to
@@ -36,6 +37,7 @@ struct vkms_config {
 struct vkms_config_plane {
 	struct list_head link;
 
+	char *name;
 	enum drm_plane_type type;
 
 	/* Internal usage */
diff --git a/drivers/gpu/drm/vkms/vkms_plane.c b/drivers/gpu/drm/vkms/vkms_plane.c
index 4663002c9c54030ff6243631a2a1cff26415e7a3..b3a9a42476ef340986c8961f076236d76a7c73e3 100644
--- a/drivers/gpu/drm/vkms/vkms_plane.c
+++ b/drivers/gpu/drm/vkms/vkms_plane.c
@@ -196,7 +196,7 @@ struct vkms_plane *vkms_plane_init(struct vkms_device *vkmsdev,
 	plane = drmm_universal_plane_alloc(dev, struct vkms_plane, base, 0,
 					   &vkms_plane_funcs,
 					   vkms_formats, ARRAY_SIZE(vkms_formats),
-					   NULL, config->type, NULL);
+					   NULL, config->type, config->name);
 	if (IS_ERR(plane))
 		return plane;
 

-- 
2.47.1

