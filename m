Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E7B31BEC432
	for <lists+dri-devel@lfdr.de>; Sat, 18 Oct 2025 04:02:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CCECC10E2AA;
	Sat, 18 Oct 2025 02:02:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="gHoQs7fK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 400F610E1D5
 for <dri-devel@lists.freedesktop.org>; Sat, 18 Oct 2025 02:01:58 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 0127D4E4115A;
 Sat, 18 Oct 2025 02:01:57 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id CC36160701;
 Sat, 18 Oct 2025 02:01:56 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 15304102F236F; 
 Sat, 18 Oct 2025 04:01:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1760752915; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=d1kn9HeUTtSXJBlNNXm4t8OytepygXuiiRcvBqcRHBE=;
 b=gHoQs7fK3MII6jnNA4GD5i1a2DSVXBLvivX9Jps064MEJptiz3Nmd0cgoebFjVfWpLtWMc
 sxPzBahYAlAIhgMql5WeJQNwtmCEwUlXJal6/Y1TguVxC57icToZozqq3OfSlL1fhVdEKJ
 FMbwbc2IGoX8H+7ssrDXZYoVn/vAUbdaWI6HEpxzZKoi5SyC0WQb/Bv0X64FiuJbM76MQv
 GRi57anu75Df0BWDanHRosyVNF7wRPeHGmeTFn93LAbudX5NSxDK7p7m6919aN5dInCE58
 hoZEd/zgK6YzkdVRO6zL3eIKVlbOb4JwTg05Npi7lNAmks6IBnNJVdsKQoYi0g==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Sat, 18 Oct 2025 04:01:04 +0200
Subject: [PATCH 04/22] drm/vkms: Introduce configfs for plane rotation
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20251018-vkms-all-config-v1-4-a7760755d92d@bootlin.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=5015;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=jLseadG4liEn2N5pyi/KD1v5Q5WKn00ARvAN7rBRh1k=;
 b=owEBbQKS/ZANAwAKASCtLsZbECziAcsmYgBo8vT9xhb2k+gfTY9euP4jA9UrA/sZZs3Ny/V8s
 PQlGai7HQiJAjMEAAEKAB0WIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCaPL0/QAKCRAgrS7GWxAs
 4qA5D/9zVzaA8+0a4QvRPHPKU40gFSQJin+8MLjZc4C0X8CPWWW/ZGtF2ZvGbT33S7K2LFsRzl1
 obuFDYtfo1xz38f7Fku98v0bYepqPQm1h+wJj/C6T+G9z+S+lFctc+oGqWR3Ky65ObVHXEACtk3
 YbVKHJoz7h/oTyPEtYL3192BR3pffP3h4rs7vuXo4KTdR6sdBj3H0Z96v976Nup5uv+09FyRXr/
 VntGXiIqU+Ej+rt0T5sy0XIZ2UrJhMadFGHtNaDyEkkpEvpVwEREV6N1X18HIRdcLVd0NiJlrLE
 qZ7nmvgyKhHA5s+oh9NY1H2ta5T/FcKFc0rtQzRoS8HU9KanOczHiEn4mYoeKkrAqTFkUZ33Fwp
 /E0vgxs5ycPHuspgBUNYhlyqs8JiBj1GolQBwZ+PbtxGlM2vx7CjOH06oit4Z0uvGOFOhzWRigw
 NTbt38vHqXXK7kpfp9Nz39h5MtBzuSDO62HLXm5jKVK8Upt5r52polzUUL1ICkXJYH6GIVPR+vF
 cjbFFfBLWLOZJdX669GM2zi2MrCVoDnry3KAX7jRdiMfLsHW6P1ZtnXWXReZuhi/nKtY8x/ZgLs
 iI6QBrvmaUmuKsFEZNuFG561uaEL+dAgRVVtY9B60ET7ieQ2lVMYhXQ7ttzZovJ1JWRV98XhV8P
 2z0DDB0MEkoRsFQ==
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

To allows the userspace to test many hardware configuration, introduce a
new interface to configure the available rotation per planes. VKMS
supports any rotation and reflection, so the userspace can choose any
combination.

The supported rotations are configured by writing a rotation bitmask to
the file `supported_rotations` and the default rotation is chosen by
writing a rotation bitmask to `default_rotation`.

Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
 Documentation/gpu/vkms.rst           |  7 ++-
 drivers/gpu/drm/vkms/vkms_configfs.c | 94 ++++++++++++++++++++++++++++++++++++
 2 files changed, 100 insertions(+), 1 deletion(-)

diff --git a/Documentation/gpu/vkms.rst b/Documentation/gpu/vkms.rst
index 3574e01b928d..a432968cc711 100644
--- a/Documentation/gpu/vkms.rst
+++ b/Documentation/gpu/vkms.rst
@@ -87,10 +87,15 @@ Start by creating one or more planes::
 
   sudo mkdir /config/vkms/my-vkms/planes/plane0
 
-Planes have 1 configurable attribute:
+Planes have 3 configurable attribute:
 
 - type: Plane type: 0 overlay, 1 primary, 2 cursor (same values as those
   exposed by the "type" property of a plane)
+- possible_rotations: Available rotation for a plane, as a bitmask: 0x01 no rotation,
+  0x02 rotate 90°, 0x04 rotate 180°, 0x08 rotate 270°, 0x10 reflect x, 0x20 reflect y
+  (same values as those exposed by the "rotation" property of a plane)
+- default_rotation: Default rotation presented to the userspace, same values as
+  possible_rotations.
 
 Continue by creating one or more CRTCs::
 
diff --git a/drivers/gpu/drm/vkms/vkms_configfs.c b/drivers/gpu/drm/vkms/vkms_configfs.c
index ea245e2e2fd2..450e45e66a45 100644
--- a/drivers/gpu/drm/vkms/vkms_configfs.c
+++ b/drivers/gpu/drm/vkms/vkms_configfs.c
@@ -322,10 +322,104 @@ static ssize_t plane_type_store(struct config_item *item, const char *page,
 	return (ssize_t)count;
 }
 
+static ssize_t plane_supported_rotations_show(struct config_item *item, char *page)
+{
+	struct vkms_configfs_plane *plane;
+	unsigned int plane_supported_rotations;
+
+	plane = plane_item_to_vkms_configfs_plane(item);
+
+	scoped_guard(mutex, &plane->dev->lock) {
+		plane_supported_rotations = vkms_config_plane_get_supported_rotations(plane->config);
+	}
+
+	return sprintf(page, "%u", plane_supported_rotations);
+}
+
+static ssize_t plane_supported_rotations_store(struct config_item *item,
+					       const char *page, size_t count)
+{
+	struct vkms_configfs_plane *plane = plane_item_to_vkms_configfs_plane(item);
+	int ret, val = 0;
+
+	ret = kstrtouint(page, 0, &val);
+	if (ret)
+		return ret;
+
+	/* Should be a supported value */
+	if (val & ~(DRM_MODE_ROTATE_MASK | DRM_MODE_REFLECT_MASK))
+		return -EINVAL;
+	/* Should at least provide one rotation */
+	if (!(val & DRM_MODE_ROTATE_MASK))
+		return -EINVAL;
+
+	scoped_guard(mutex, &plane->dev->lock) {
+		/* Ensures that the default rotation is included in supported rotation */
+		if (plane->dev->enabled ||
+		    (val & vkms_config_plane_get_default_rotation(plane->config)) !=
+		     vkms_config_plane_get_default_rotation(plane->config))
+			return -EINVAL;
+
+		vkms_config_plane_set_supported_rotations(plane->config, val);
+	}
+
+	return count;
+}
+
+static ssize_t plane_default_rotation_show(struct config_item *item, char *page)
+{
+	struct vkms_configfs_plane *plane;
+	unsigned int plane_default_rotation;
+
+	plane = plane_item_to_vkms_configfs_plane(item);
+
+	scoped_guard(mutex, &plane->dev->lock) {
+		plane_default_rotation = vkms_config_plane_get_default_rotation(plane->config);
+	}
+
+	return sprintf(page, "%u", plane_default_rotation);
+}
+
+static ssize_t plane_default_rotation_store(struct config_item *item,
+					    const char *page, size_t count)
+{
+	struct vkms_configfs_plane *plane = plane_item_to_vkms_configfs_plane(item);
+	int ret, val = 0;
+
+	ret = kstrtouint(page, 10, &val);
+	if (ret)
+		return ret;
+
+	/* Should be a supported value */
+	if (val & ~(DRM_MODE_ROTATE_MASK | DRM_MODE_REFLECT_MASK))
+		return -EINVAL;
+	/* Should at least provide one rotation */
+	if ((val & DRM_MODE_ROTATE_MASK) == 0)
+		return -EINVAL;
+	/* Should contains only one rotation */
+	if (!is_power_of_2(val & DRM_MODE_ROTATE_MASK))
+		return -EINVAL;
+
+	scoped_guard(mutex, &plane->dev->lock) {
+		/* Ensures that the default rotation is included in supported rotation */
+		if (plane->dev->enabled ||
+		    (val & vkms_config_plane_get_supported_rotations(plane->config)) != val)
+			return -EINVAL;
+
+		vkms_config_plane_set_default_rotation(plane->config, val);
+	}
+
+	return count;
+}
+
 CONFIGFS_ATTR(plane_, type);
+CONFIGFS_ATTR(plane_, supported_rotations);
+CONFIGFS_ATTR(plane_, default_rotation);
 
 static struct configfs_attribute *plane_item_attrs[] = {
 	&plane_attr_type,
+	&plane_attr_supported_rotations,
+	&plane_attr_default_rotation,
 	NULL,
 };
 

-- 
2.51.0

