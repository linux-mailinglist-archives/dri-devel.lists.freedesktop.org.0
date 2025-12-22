Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D1D1CD57CE
	for <lists+dri-devel@lfdr.de>; Mon, 22 Dec 2025 11:11:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D1E2E10E605;
	Mon, 22 Dec 2025 10:11:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="cATUu8ez";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6CA7910E60B
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Dec 2025 10:11:43 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 3C5EC4E41D33;
 Mon, 22 Dec 2025 10:11:42 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 0C1DF606C1;
 Mon, 22 Dec 2025 10:11:42 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id A660010AB0199; Mon, 22 Dec 2025 11:11:35 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1766398297; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=mh17FwdIwDJQmgWmaf9u9me3jrBUTLLPhPQ/n8f+ag8=;
 b=cATUu8ez9NTSRBrCqOwNIbVLAnOTgHNm6VXEVsMb72VO1poGznZ36hamwlx6bFG+Hl/3u1
 8vvO2F7+V3bv67WJ+/fINRfmN83Y6bOoYd1UqZS0+l+Ws9Twnc3lhEmVWse0qMk1d22T9H
 YG6HUpyw+DJ9umt6ywnaDtl4wH/h2IGIFE4RkXwCAD5CKYjabwFdV6nW670oMCTFGRCFYB
 1ezDMx/FVbCnnL46vCk4RmhDAftEBNxkEMSulSD8iSuoLlvZeCtAO4a+zA+6aSf/XBVKUH
 hB5YOIDN7D2bMJaVHprYrNzcBnMBgJmYIBnwxB4VJ3he6s+962trE3dE7Oii7w==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Mon, 22 Dec 2025 11:11:12 +0100
Subject: [PATCH v3 10/33] drm/vkms: Introduce configfs for plane rotation
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20251222-vkms-all-config-v3-10-ba42dc3fb9ff@bootlin.com>
References: <20251222-vkms-all-config-v3-0-ba42dc3fb9ff@bootlin.com>
In-Reply-To: <20251222-vkms-all-config-v3-0-ba42dc3fb9ff@bootlin.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=6203;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=clPxtmEMbNIK+Z0tE5WO5KEo2WR06dFkUJbJl2Yf2Ww=;
 b=owEBiQJ2/ZANAwAIASCtLsZbECziAcsmYgBpSRlAXUWxlvJWLQOT7OldLv1ZBk5r+7NDiPoQs
 vNv0kO/8MWJAk8EAAEIADkWIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCaUkZQBsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMSwyLDIACgkQIK0uxlsQLOIUcA/+NVaZ/QIYC7NumR3ZiBdZ4MlufBjFcB0
 gOBbeAudDHdv1MboxXkAi1cPpzhy62Dm7NH/p5OWoKIT2fKgniEQWsyOdSvNiObtY8NOrVokxFn
 aRO2RAtcMFJcovamaH8sSxVG8LVa7u9E5BHuv/nN4cRuRzpfNiZx6WlUl4ZN30Z1CooFawfBPv8
 YciLEvj+brheH09Lq/0A0w1eMWTZB0te6LzNPViyGxqSQMFv11TQ3EsnPpbBR5ftesEt2Pq/+XN
 g82UUt+yWK3C1HlbvoU6Ek261aMSSi3imiiGVB48RLlUY+6ro070Mo+Pa3NNGt6Fgl221EROl2r
 piY/1xtCvS2PX2aCusKwWsMYzaYYCpqzGTSyPRtkzgLsdXgqZZqF5t5wpg8DZ9JOYhvQ9s8lCT5
 ee4dGsKD++8rB5pSCxM/LiEb2SusTpLipzXGydr9kzjq4nSD7yQ2prMYQGydFG9xrtbd670k4JE
 T/g69A+q+GsthxEuTFZmcpFfjbboSGOS68dsi1tCkYGzZkwpk/1L7KgZ4q1c+lPVnvrC8SibMUE
 vDbtKqdUt1xy4GYmyRQ4lV/C3UFROEyiYS1oSx0LXsiu6w9PkBbVHPKxmrKNA9v3VyN1JUDvNTf
 z+0u6DXkdweCfBI9cLQBt7wq3pPMgQu26IZtKx5GUsp1GICPxAu0=
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

To allows the userspace to test many hardware configurations, introduce a
new interface to configure the available rotation per planes. VKMS
supports any rotation and reflection, so the userspace can choose any
combination.

The supported rotations are configured by writing a rotation bitmask to
the file `supported_rotations` and the default rotation is chosen by
writing a rotation bitmask to `default_rotation`.

Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
 Documentation/ABI/testing/configfs-vkms | 15 ++++++
 Documentation/gpu/vkms.rst              |  7 ++-
 drivers/gpu/drm/vkms/vkms_configfs.c    | 93 ++++++++++++++++++++++++++++++---
 3 files changed, 108 insertions(+), 7 deletions(-)

diff --git a/Documentation/ABI/testing/configfs-vkms b/Documentation/ABI/testing/configfs-vkms
index 6fe375d1636f..9b74375bbf35 100644
--- a/Documentation/ABI/testing/configfs-vkms
+++ b/Documentation/ABI/testing/configfs-vkms
@@ -109,6 +109,21 @@ Contact:	dri-devel@lists.freedesktop.org
 Description:
         Name of the plane.
 
+What:		/sys/kernel/config/vkms/<device>/planes/<plane>/possible_rotations
+Date:		Nov 2025
+Contact:	dri-devel@lists.freedesktop.org
+Description:
+        Available rotations for the plane, as a bitmask:
+        0x01 - no rotation, 0x02 - rotate 90°, 0x04 - rotate 180°,
+        0x08 - rotate 270°, 0x10 - reflect x, 0x20 - reflect y.
+
+What:		/sys/kernel/config/vkms/<device>/planes/<plane>/default_rotation
+Date:		Nov 2025
+Contact:	dri-devel@lists.freedesktop.org
+Description:
+        Default rotation presented to userspace, same values as
+        possible_rotations.
+
 What:		/sys/kernel/config/vkms/<device>/planes/<plane>/possible_crtcs
 Date:		Nov 2025
 Contact:	dri-devel@lists.freedesktop.org
diff --git a/Documentation/gpu/vkms.rst b/Documentation/gpu/vkms.rst
index 79f1185d8645..7fd746dd6ee2 100644
--- a/Documentation/gpu/vkms.rst
+++ b/Documentation/gpu/vkms.rst
@@ -87,11 +87,16 @@ Start by creating one or more planes::
 
   sudo mkdir /config/vkms/my-vkms/planes/plane0
 
-Planes have 2 configurable attributes:
+Planes have 4 configurable attributes:
 
 - type: Plane type: 0 overlay, 1 primary, 2 cursor (same values as those
   exposed by the "type" property of a plane)
 - name: Name of the plane. Allowed characters are [A-Za-z1-9_-]
+- possible_rotations: Available rotation for a plane, as a bitmask: 0x01 no rotation,
+  0x02 rotate 90°, 0x04 rotate 180°, 0x08 rotate 270°, 0x10 reflect x, 0x20 reflect y
+  (same values as those exposed by the "rotation" property of a plane)
+- default_rotation: Default rotation presented to the userspace, same values as
+  possible_rotations.
 
 Continue by creating one or more CRTCs::
 
diff --git a/drivers/gpu/drm/vkms/vkms_configfs.c b/drivers/gpu/drm/vkms/vkms_configfs.c
index 989788042191..bcc3e222e6b3 100644
--- a/drivers/gpu/drm/vkms/vkms_configfs.c
+++ b/drivers/gpu/drm/vkms/vkms_configfs.c
@@ -365,24 +365,105 @@ static ssize_t plane_name_store(struct config_item *item, const char *page,
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
+		if (plane->dev->enabled)
+			return -EBUSY;
+
+		vkms_config_plane_set_supported_rotations(plane->config, val);
+	}
+
+	return count;
+}
+
+static ssize_t plane_default_rotation_show(struct config_item *item, char *page)
+{
+	struct vkms_configfs_plane *plane = plane_item_to_vkms_configfs_plane(item);
+	unsigned int plane_default_rotation;
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
+
+	/* Should contain exactly one rotation */
+	if (!is_power_of_2(val & DRM_MODE_ROTATE_MASK))
+		return -EINVAL;
+
+	scoped_guard(mutex, &plane->dev->lock) {
+		if (plane->dev->enabled)
+			return -EBUSY;
+
+		vkms_config_plane_set_default_rotation(plane->config, val);
+	}
+
+	return count;
+}
+
 CONFIGFS_ATTR(plane_, type);
 CONFIGFS_ATTR(plane_, name);
+CONFIGFS_ATTR(plane_, supported_rotations);
+CONFIGFS_ATTR(plane_, default_rotation);
 
 static struct configfs_attribute *plane_item_attrs[] = {
 	&plane_attr_type,
 	&plane_attr_name,
+	&plane_attr_supported_rotations,
+	&plane_attr_default_rotation,
 	NULL,
 };
 
 static void plane_release(struct config_item *item)
 {
-	struct vkms_configfs_plane *plane;
-	struct mutex *lock;
-
-	plane = plane_item_to_vkms_configfs_plane(item);
-	lock = &plane->dev->lock;
+	struct vkms_configfs_plane *plane = plane_item_to_vkms_configfs_plane(item);
 
-	scoped_guard(mutex, lock) {
+	scoped_guard(mutex, &plane->dev->lock) {
 		vkms_config_destroy_plane(plane->config);
 		kfree(plane);
 	}

-- 
2.51.2

