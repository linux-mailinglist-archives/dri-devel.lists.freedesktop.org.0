Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EB58951D3F
	for <lists+dri-devel@lfdr.de>; Wed, 14 Aug 2024 16:36:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 73A4E10E4AF;
	Wed, 14 Aug 2024 14:36:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="MXGRxFmD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB90810E4AF
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Aug 2024 14:36:37 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id B0DD11C0010;
 Wed, 14 Aug 2024 14:36:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1723646196;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dRWAqKA456PEAxWaDDwcuxE5W1Q6ZbfOxo+io/+QmQI=;
 b=MXGRxFmDKodAsLwrwTUu4iPTbsj2NEo1/e7JBsbVWwxHdYePzbO2xzWiMhORdW2/LEFhlK
 24YyiXLfp/9FLM507t//+mcDt5j1F7RetDpAQXZDVIa6TPnnePhFRkxb5wAKdsYRFNGdLI
 uqy9eExBHM3N4aUjjf+m+ilFfQoQ88nHyIG5OEWBHg+zqEmT77RJGjdEaW3KgZLi8K15+m
 Wz5HHl9HzddhZFtH4qwx1PATxLXBqgBEt+15AojBBURFhrRlDKqJpzXCbWnTqle5xmPVbD
 zasURkafKpks/m9NGgSQ8jV/47ASyku2HUTK/8gRywtA7aZ6ZWnTG9tVj6iZ/g==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Wed, 14 Aug 2024 16:36:29 +0200
Subject: [PATCH RFC 07/15] drm/vkms: Introduce plane name configuration
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240814-google-remove-crtc-index-from-parameter-v1-7-6e179abf9fd4@bootlin.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3609;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=+iZgtQZR6Ktwhu+GqlUxVEhFVxw8MKckjIPLA9mX6qQ=;
 b=owEBbQKS/ZANAwAIASCtLsZbECziAcsmYgBmvMDq9ALWKsv6owkvIaNijjmwfjKqyqMgB/cPv
 aahY4LqckWJAjMEAAEIAB0WIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCZrzA6gAKCRAgrS7GWxAs
 4jSiEACvx0hwL19ubQAsK6eB+31JSMV19Bd+CWgIZGO5k8/Votg/z64EMbBu7SRnTSTBjD6PAS/
 i//b9thOQcDdJvoJtjeA6ATniGI+fmctOQ7KEZ6BgE3tlpBbeY5LnorbffgGVj3m2vCuUEXVJNe
 LejOupotcvKpB9bAt27IglJenV1lXfM1gFrxKk4gMYezFVnXvAOxvfuZYrhl8Zb86lgh4I0Gqpj
 fxpM0BLQV5lFqqnPPHqmAL7E0zsfmJWw01QzNkvhEDWdwnJxYWi5qNY/CCIZU5Lf40bI/bb6Xss
 Ccuzv0dptIh9q73oq9XVERgzhoxmia+lfuAMewDNW73SH9OJ90NrMUYhWoq03fXVDQ78lLFUz5V
 543ReTkXJ4BP+RiAgeIlxQwGaQgHUZgIdr60KvQ/O99CVkmrAtIohkuaf3SPTf8RZ/QBZRQ4cjG
 XEUmlmEBOQtBYDGtR7csWjGQ9PB+goaqv3BS7rAtW7f+/kM1xjmRGHHhHVbd63vVdDpnE8QeUpr
 71d0eu6PrD9bC5ahp9UxlbOHtuSRERaoA0nYGMV2ZgVYUPZFWq7Wz0eRzsVWrQbGCSDEUn49Iom
 qqrQrJQocBHELeYpONibwf5/f/xWr1HDEzfyM4S6tc+LpOm4d+1wejwUFc7v/A1UwRlohRvQ3MQ
 jWLzRPsPYV8tLQA==
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
index b1c6160d350f..b8e235a22e90 100644
--- a/drivers/gpu/drm/vkms/vkms_config.c
+++ b/drivers/gpu/drm/vkms/vkms_config.c
@@ -34,6 +34,10 @@ struct vkms_config *vkms_config_alloc_default(bool enable_writeback, bool enable
 		goto err_alloc;
 
 	plane->type = DRM_PLANE_TYPE_PRIMARY;
+	plane->name = kzalloc(sizeof("primary"), GFP_KERNEL);
+	if (!plane->name)
+		goto err_alloc;
+	sprintf(plane->name, "primary");
 
 	if (enable_overlay) {
 		for (int i = 0; i < NUM_OVERLAY_PLANES; i++) {
@@ -41,6 +45,10 @@ struct vkms_config *vkms_config_alloc_default(bool enable_writeback, bool enable
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
@@ -48,6 +56,10 @@ struct vkms_config *vkms_config_alloc_default(bool enable_writeback, bool enable
 		if (!plane)
 			goto err_alloc;
 		plane->type = DRM_PLANE_TYPE_CURSOR;
+		plane->name = kzalloc(sizeof("cursor"), GFP_KERNEL);
+		if (!plane->name)
+			goto err_alloc;
+		sprintf(plane->name, "cursor");
 	}
 
 	return vkms_config;
@@ -79,6 +91,7 @@ void vkms_config_delete_plane(struct vkms_config_plane *vkms_config_overlay)
 	if (!vkms_config_overlay)
 		return;
 	list_del(&vkms_config_overlay->link);
+	kfree(vkms_config_overlay->name);
 	kfree(vkms_config_overlay);
 }
 
@@ -131,6 +144,7 @@ static int vkms_config_show(struct seq_file *m, void *data)
 	seq_printf(m, "writeback=%d\n", vkmsdev->config->writeback);
 	list_for_each_entry(config_plane, &vkmsdev->config->planes, link) {
 		seq_puts(m, "plane:\n");
+		seq_printf(m, "\tname: %s\n", config_plane->name);
 		seq_printf(m, "\ttype: %d\n", config_plane->type);
 	}
 
diff --git a/drivers/gpu/drm/vkms/vkms_config.h b/drivers/gpu/drm/vkms/vkms_config.h
index 77c1c3934189..792c5e904aa1 100644
--- a/drivers/gpu/drm/vkms/vkms_config.h
+++ b/drivers/gpu/drm/vkms/vkms_config.h
@@ -25,6 +25,7 @@ struct vkms_config {
  * struct vkms_config_plane
  *
  * @link: Link to the others planes
+ * @name: Name of the plane
  * @type: Type of the plane. The creator of configuration needs to ensures that at least one
  *        plane is primary.
  * @plane: Internal usage. This pointer should never be considered as valid. It can be used to
@@ -34,6 +35,7 @@ struct vkms_config {
 struct vkms_config_plane {
 	struct list_head link;
 
+	char *name;
 	enum drm_plane_type type;
 
 	/* Internal usage */
diff --git a/drivers/gpu/drm/vkms/vkms_plane.c b/drivers/gpu/drm/vkms/vkms_plane.c
index dc9bccf60071..d2b1b524499f 100644
--- a/drivers/gpu/drm/vkms/vkms_plane.c
+++ b/drivers/gpu/drm/vkms/vkms_plane.c
@@ -231,7 +231,7 @@ struct vkms_plane *vkms_plane_init(struct vkms_device *vkmsdev,
 	plane = drmm_universal_plane_alloc(dev, struct vkms_plane, base, 0,
 					   &vkms_plane_funcs,
 					   vkms_formats, ARRAY_SIZE(vkms_formats),
-					   NULL, config->type, NULL);
+					   NULL, config->type, config->name);
 	if (IS_ERR(plane))
 		return plane;
 

-- 
2.44.2

