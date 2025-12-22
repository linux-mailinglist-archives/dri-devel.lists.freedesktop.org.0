Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C788CD57FB
	for <lists+dri-devel@lfdr.de>; Mon, 22 Dec 2025 11:12:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 479DD10E60D;
	Mon, 22 Dec 2025 10:12:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="TGWKVPvY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7FC4710E583
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Dec 2025 10:12:14 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id 63219C1AE05;
 Mon, 22 Dec 2025 10:11:48 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 5FFD9606C1;
 Mon, 22 Dec 2025 10:12:13 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 0CFB110AB0194; Mon, 22 Dec 2025 11:12:07 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1766398329; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=LvPL07YQ2+ZbO1wTrUyzmuhR4CILGij69D3/1xLFg/k=;
 b=TGWKVPvYWzONttYZ2+Ug5ROaosxRRFDpyn9dyuewhy1fbWN98Ps/30yNwnHRjI+3hHKPne
 e0h9lN/EXYnhXQzpsoSkfLQMkrYD2ydt2kTcjc30AJ6971Yn7vghYpT2BWoFjK2y//IAGy
 wPFYApps4Uca+kjwFzJyCr8mvPiQl94vcObB0Eb0LzK2cPDL2dAu5G7SttM/Jhn6reqtu6
 Z8gBszOE2S8y/8IoOYqv2uZ0rT2ntSU5Q/N45V62cxf1YTqbMG+kvp1b3LqjIgBXawWt5t
 0iRYpwRGwBp7LJyQ28VRCtPsDj84An62v/q+hBk6eqECBdXLU7Y7XuK3tfqSLA==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Mon, 22 Dec 2025 11:11:23 +0100
Subject: [PATCH v3 21/33] drm/vkms: Introduce configfs for plane zpos property
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251222-vkms-all-config-v3-21-ba42dc3fb9ff@bootlin.com>
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
 linux-doc@vger.kernel.org, Louis Chauvet <louis.chauvet@bootlin.com>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=9470;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=zg66emRQ9vJX8Db5mLafvXO4tBtRi+ohu+fCJI2oHoc=;
 b=owEBiQJ2/ZANAwAIASCtLsZbECziAcsmYgBpSRlCeKdoP342N0jwBjUgZFHFtsi6hPJoMlwic
 craHDOaMoeJAk8EAAEIADkWIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCaUkZQhsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMSwyLDIACgkQIK0uxlsQLOIKWxAAs6zEXjqhz4ezTDqXyuaII/VQN7C85sR
 Bl6m8hEVI4Scp4gA/OSij8SBmk7yD7yfjC0YQN6/dHJHKrFkpSQNu3kTmh79wDcSdr4ShDIQKJY
 rVRFa/o7dfgDb1W11S+mTr1zP9QfHMzh3DaATTvidIKewFhW5E5e/ebR8qw9Ka/1vINsMgtt5Xj
 Ad6bMhYnA9AzEhoZ4V07HCzjFlYtfMUmKcIR9Rf9FuvGBBhgzd8MQnHppNvd68xvSZ7Cp1aCUSp
 hgEeMyFn0lSLS6avpZ9k3gKY/L4itpGd4BGF4wAhcq6o33fMHV8wL3Ciq5tjdITq60d1N5WnLHh
 TrfwZ2vweQMPrJAglILUuOEtC/8uXBaTtgnxgSqm4H5UTXkri8sRG/nLJd07bchq8n5AsbXof2U
 +rV326aZ1fFfHEe4BQ8mHYntnXIzfvJWfccfzagcqnR7+hrEhtt9e0Pl7BhXxYY9QBTL1yhmXIl
 bs2v/Kba74bZP1CfvXDyPWjLgqtkB5dhiY+o0bCe3lxb0b92z21u2wyU+u2E9cJ5lKc5S75lOKg
 eBtYPmZRIk6xIuJGrVS0BxGgooVNw1XsZf8EzFzishSNuVXEJ8H4MAsq1jpM+Tq6yq5b0U5mQR9
 mXDEA0CLnb2tDgWnmkc+4dOVwVmjwedgkLfCdMBIr3qeCh5Z2cQQ=
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

Modern compositor rely on zpos management to offload some processing to
deticated hardware. In order to test multiple configurations, add zpos
configuration to configFS.

Introduce multiple attributes to configure zpos:
- zpos_enabled - Create or not the zpos property. If not created, the zpos
  is undefined.
- zpos_mutable - If the zpos property is created, allow or not the
  userspace to modify it
- zpos_initial - Initial value for zpos property. Must be between zpos_min
  and zpos_max
- zpos_min - Minimum zpos value for this plane. Must be <= zpos_max
- zpos_max - Maximum zpos value for this plane. Must be >= zpos_min

Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
 Documentation/ABI/testing/configfs-vkms |  36 +++++++
 Documentation/gpu/vkms.rst              |   9 +-
 drivers/gpu/drm/vkms/vkms_configfs.c    | 180 ++++++++++++++++++++++++++++++++
 3 files changed, 224 insertions(+), 1 deletion(-)

diff --git a/Documentation/ABI/testing/configfs-vkms b/Documentation/ABI/testing/configfs-vkms
index 48f92538c602..34cb6aeec411 100644
--- a/Documentation/ABI/testing/configfs-vkms
+++ b/Documentation/ABI/testing/configfs-vkms
@@ -162,6 +162,42 @@ Description:
         use '-' prefix. Use '+*' to add all formats, '-*' to
         remove all.
 
+What:		/sys/kernel/config/vkms/<device>/planes/<plane>/zpos_enabled
+Date:		Nov 2025
+Contact:	dri-devel@lists.freedesktop.org
+Description:
+        Enable or disable the zpos property. Value: 1 - enabled,
+        0 - disabled.
+
+What:		/sys/kernel/config/vkms/<device>/planes/<plane>/zpos_mutable
+Date:		Nov 2025
+Contact:	dri-devel@lists.freedesktop.org
+Description:
+        Create the zpos property as mutable or immutable.
+        Value: 1 - mutable, 0 - immutable. No effect if
+        zpos_enabled is not set.
+
+What:		/sys/kernel/config/vkms/<device>/planes/<plane>/zpos_initial
+Date:		Nov 2025
+Contact:	dri-devel@lists.freedesktop.org
+Description:
+        Set the initial zpos value. Must be between zpos_min
+        and zpos_max. No effect if zpos_enabled is not set.
+
+What:		/sys/kernel/config/vkms/<device>/planes/<plane>/zpos_min
+Date:		Nov 2025
+Contact:	dri-devel@lists.freedesktop.org
+Description:
+        Set the minimal zpos value. No effect if zpos_enabled
+        is not set.
+
+What:		/sys/kernel/config/vkms/<device>/planes/<plane>/zpos_max
+Date:		Nov 2025
+Contact:	dri-devel@lists.freedesktop.org
+Description:
+        Set the maximal zpos value. No effect if zpos_enabled
+        is not set.
+
 What:		/sys/kernel/config/vkms/<device>/planes/<plane>/possible_crtcs
 Date:		Nov 2025
 Contact:	dri-devel@lists.freedesktop.org
diff --git a/Documentation/gpu/vkms.rst b/Documentation/gpu/vkms.rst
index 15d62ad963c9..791c4f33a90a 100644
--- a/Documentation/gpu/vkms.rst
+++ b/Documentation/gpu/vkms.rst
@@ -87,7 +87,7 @@ Start by creating one or more planes::
 
   sudo mkdir /config/vkms/my-vkms/planes/plane0
 
-Planes have 9 configurable attributes:
+Planes have 14 configurable attributes:
 
 - type: Plane type: 0 overlay, 1 primary, 2 cursor (same values as those
   exposed by the "type" property of a plane)
@@ -114,6 +114,13 @@ Planes have 9 configurable attributes:
   To remove a format, use a minus and its fourcc: -XR24
   To add all formats use +*
   To remove all formats, use -*
+- zpos_enabled: Enable or not the zpos property: 1 enable, 0 disable
+- zpos_mutable: Create the zpos property as a mutable or imutable property: 1 mutable,
+  0 immutable. No effect if zpos_enabled is not set.
+- zpos_initial: Set the initial zpos value. Must be between zpos_min and zpos_max. No
+  effect if zpos_enabled is not set.
+- zpos_min: Set the minimum zpos value. No effect if zpos_enabled is not set.
+- zpos_max: Set the maximum zpos value. No effect if zpos_enabled is not set.
 
 Continue by creating one or more CRTCs::
 
diff --git a/drivers/gpu/drm/vkms/vkms_configfs.c b/drivers/gpu/drm/vkms/vkms_configfs.c
index a451d1122acf..e7f3ab54b5a1 100644
--- a/drivers/gpu/drm/vkms/vkms_configfs.c
+++ b/drivers/gpu/drm/vkms/vkms_configfs.c
@@ -744,6 +744,176 @@ static ssize_t plane_supported_formats_store(struct config_item *item,
 	return count;
 }
 
+static ssize_t plane_zpos_enabled_show(struct config_item *item, char *page)
+{
+	struct vkms_configfs_plane *plane;
+	bool enabled;
+
+	plane = plane_item_to_vkms_configfs_plane(item);
+
+	scoped_guard(mutex, &plane->dev->lock)
+		enabled = vkms_config_plane_get_zpos_enabled(plane->config);
+
+	return sprintf(page, "%d\n", enabled);
+}
+
+static ssize_t plane_zpos_enabled_store(struct config_item *item, const char *page,
+					size_t count)
+{
+	struct vkms_configfs_plane *plane;
+	bool enabled;
+
+	plane = plane_item_to_vkms_configfs_plane(item);
+
+	if (kstrtobool(page, &enabled))
+		return -EINVAL;
+
+	scoped_guard(mutex, &plane->dev->lock) {
+		if (plane->dev->enabled)
+			return -EBUSY;
+
+		vkms_config_plane_set_zpos_enabled(plane->config, enabled);
+	}
+
+	return (ssize_t)count;
+}
+
+static ssize_t plane_zpos_mutable_show(struct config_item *item, char *page)
+{
+	struct vkms_configfs_plane *plane;
+	bool mutable;
+
+	plane = plane_item_to_vkms_configfs_plane(item);
+
+	scoped_guard(mutex, &plane->dev->lock)
+		mutable = vkms_config_plane_get_zpos_mutable(plane->config);
+
+	return sprintf(page, "%d\n", mutable);
+}
+
+static ssize_t plane_zpos_mutable_store(struct config_item *item, const char *page,
+					size_t count)
+{
+	struct vkms_configfs_plane *plane;
+	bool mutable;
+
+	plane = plane_item_to_vkms_configfs_plane(item);
+
+	if (kstrtobool(page, &mutable))
+		return -EINVAL;
+
+	scoped_guard(mutex, &plane->dev->lock) {
+		if (plane->dev->enabled)
+			return -EBUSY;
+
+		vkms_config_plane_set_zpos_mutable(plane->config, mutable);
+	}
+
+	return (ssize_t)count;
+}
+
+static ssize_t plane_zpos_initial_show(struct config_item *item, char *page)
+{
+	struct vkms_configfs_plane *plane;
+	unsigned int initial;
+
+	plane = plane_item_to_vkms_configfs_plane(item);
+
+	scoped_guard(mutex, &plane->dev->lock)
+		initial = vkms_config_plane_get_zpos_initial(plane->config);
+
+	return sprintf(page, "%u\n", initial);
+}
+
+static ssize_t plane_zpos_initial_store(struct config_item *item, const char *page,
+					size_t count)
+{
+	struct vkms_configfs_plane *plane;
+	unsigned int initial;
+
+	plane = plane_item_to_vkms_configfs_plane(item);
+
+	if (kstrtouint(page, 10, &initial))
+		return -EINVAL;
+
+	scoped_guard(mutex, &plane->dev->lock) {
+		if (plane->dev->enabled)
+			return -EBUSY;
+
+		vkms_config_plane_set_zpos_initial(plane->config, initial);
+	}
+
+	return (ssize_t)count;
+}
+
+static ssize_t plane_zpos_min_show(struct config_item *item, char *page)
+{
+	struct vkms_configfs_plane *plane;
+	unsigned int min;
+
+	plane = plane_item_to_vkms_configfs_plane(item);
+
+	scoped_guard(mutex, &plane->dev->lock)
+		min = vkms_config_plane_get_zpos_min(plane->config);
+
+	return sprintf(page, "%u\n", min);
+}
+
+static ssize_t plane_zpos_min_store(struct config_item *item, const char *page,
+				    size_t count)
+{
+	struct vkms_configfs_plane *plane;
+	unsigned int min;
+
+	plane = plane_item_to_vkms_configfs_plane(item);
+
+	if (kstrtouint(page, 10, &min))
+		return -EINVAL;
+
+	scoped_guard(mutex, &plane->dev->lock) {
+		if (plane->dev->enabled)
+			return -EBUSY;
+
+		vkms_config_plane_set_zpos_min(plane->config, min);
+	}
+
+	return (ssize_t)count;
+}
+
+static ssize_t plane_zpos_max_show(struct config_item *item, char *page)
+{
+	struct vkms_configfs_plane *plane;
+	unsigned int max;
+
+	plane = plane_item_to_vkms_configfs_plane(item);
+
+	scoped_guard(mutex, &plane->dev->lock)
+		max = vkms_config_plane_get_zpos_max(plane->config);
+
+	return sprintf(page, "%u\n", max);
+}
+
+static ssize_t plane_zpos_max_store(struct config_item *item, const char *page,
+				    size_t count)
+{
+	struct vkms_configfs_plane *plane;
+	unsigned int max;
+
+	plane = plane_item_to_vkms_configfs_plane(item);
+
+	if (kstrtouint(page, 10, &max))
+		return -EINVAL;
+
+	scoped_guard(mutex, &plane->dev->lock) {
+		if (plane->dev->enabled)
+			return -EBUSY;
+
+		vkms_config_plane_set_zpos_max(plane->config, max);
+	}
+
+	return (ssize_t)count;
+}
+
 CONFIGFS_ATTR(plane_, type);
 CONFIGFS_ATTR(plane_, name);
 CONFIGFS_ATTR(plane_, supported_rotations);
@@ -753,6 +923,11 @@ CONFIGFS_ATTR(plane_, default_color_range);
 CONFIGFS_ATTR(plane_, supported_color_encodings);
 CONFIGFS_ATTR(plane_, default_color_encoding);
 CONFIGFS_ATTR(plane_, supported_formats);
+CONFIGFS_ATTR(plane_, zpos_enabled);
+CONFIGFS_ATTR(plane_, zpos_mutable);
+CONFIGFS_ATTR(plane_, zpos_initial);
+CONFIGFS_ATTR(plane_, zpos_min);
+CONFIGFS_ATTR(plane_, zpos_max);
 
 static struct configfs_attribute *plane_item_attrs[] = {
 	&plane_attr_type,
@@ -764,6 +939,11 @@ static struct configfs_attribute *plane_item_attrs[] = {
 	&plane_attr_supported_color_encodings,
 	&plane_attr_default_color_encoding,
 	&plane_attr_supported_formats,
+	&plane_attr_zpos_enabled,
+	&plane_attr_zpos_mutable,
+	&plane_attr_zpos_initial,
+	&plane_attr_zpos_min,
+	&plane_attr_zpos_max,
 	NULL,
 };
 

-- 
2.51.2

