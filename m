Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 03F6BA18009
	for <lists+dri-devel@lfdr.de>; Tue, 21 Jan 2025 15:38:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 61CE910E5DA;
	Tue, 21 Jan 2025 14:38:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="SOB8O30Z";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5EBC110E5D7
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Jan 2025 14:38:15 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 27287C0004;
 Tue, 21 Jan 2025 14:38:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1737470294;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=u4FW97gmv0h8v6YZVl7BcMluaaWrqGSIDWALmXfXyf4=;
 b=SOB8O30ZvZMfAg/U/DmPeydfe0P/N0ur4FnUDJvXkScKtOuzHIUOllodl2N/91VPtrB2jE
 50Epk2tIkd1EHuqN5+GJRrXX2g78yWPm59SUJAwE46klCbl4QaLP0tcwwuJlSC28bzeSSX
 2wVWK8O2rsV9sLAOdDqa0DRp4K74y6MPIfaWgPEzL/lRxd4rw2I5mEWCPF+/5JknbcV3yr
 cJqiNZOdHsb0SqE62/gtMTBYKCdp3zsLaLZYir3u2Ghwe648Fly2zlAr0Iw/gRSb+IpFBC
 kdzmBq7jKZg/Lwia13/J/MZ8PzMwSgkppRXsgwr04qLQns4Do6xOmx1M3O/yOg==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Tue, 21 Jan 2025 15:34:58 +0100
Subject: [PATCH RFC v3 14/14] drm/vkms: Introduce configfs for encoder type
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250121-google-config-fs-v3-14-8154a6945142@bootlin.com>
References: <20250121-google-config-fs-v3-0-8154a6945142@bootlin.com>
In-Reply-To: <20250121-google-config-fs-v3-0-8154a6945142@bootlin.com>
To: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>, 
 Melissa Wen <melissa.srw@gmail.com>, 
 =?utf-8?q?Ma=C3=ADra_Canal?= <mairacanal@riseup.net>, 
 Haneen Mohammed <hamohammed.sa@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Simona Vetter <simona.vetter@ffwll.ch>
Cc: jose.exposito89@gmail.com, dri-devel@lists.freedesktop.org, 
 arthurgrillo@riseup.net, linux-kernel@vger.kernel.org, 
 jeremie.dautheribes@bootlin.com, miquel.raynal@bootlin.com, 
 thomas.petazzoni@bootlin.com, seanpaul@google.com, nicolejadeyee@google.com, 
 Louis Chauvet <louis.chauvet@bootlin.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=2882;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=9jSFWvf5VmPPMVhisDd6GJDN4cLc45xFfuqW/qC8DN0=;
 b=owEBbQKS/ZANAwAIASCtLsZbECziAcsmYgBnj7FE4zPy3IFkf02hziZ05eEyHbNKtEK5j01zy
 uuW66pNgJCJAjMEAAEIAB0WIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCZ4+xRAAKCRAgrS7GWxAs
 4ju4EADVEou2XXCds+pr2DdT2xfJRCFOAA+E8pdOJuAu8ZaDK7KZyiYFAF36LXtEW4sxermIafz
 PBvPRP/kqAqG1zVw/ywXFB9FtvhD2n8SKl9iXTQxmwxWsw7JbTlyKqzw2dq2eieyfubf2kEht51
 79udId+47rWUMYjJOEMNov2W1bdaQxTyMU3S+WmwxZYJGkADW/aZNvO/DO1MNknABfeQwkJf/B/
 SUcGFg9ttZsw6G4Ete72Tn1YNttd9dPyeNKC0/2QpWiPqC2tVk/cRCkJ43gmUJQIhQXaYuiZegU
 L0Q6QTT/okpxv4gEPt6d+KKyGJK8HODkTLIrecVViDf3Ay1jVEP7Yh944KV46V6ye2FdJ8NgvOb
 QwOItLRTdVUhATQOMOtxdxJ29LDCjwdtov96wgtC/flSHRuXeDxNa7YPX4rPvBVmcqhZ5PjR0fX
 xgcauGFuHnJFRJQSgn3jue4+Qrp9cpaOpE4qphFTtCjOOJ3+66PjZO/pFDvZbINnlBHLGZ5rnhg
 MzaZXiCskXfGZjzHJj+33GeO8TqgnfmQ5JfDOOhgwJt3v0c4BzpLGYpqq7cwxu/tLRt0emApb66
 nZW5+UBNzYFuzONrs8pvoBhroBnzddreG4fJLnlCXO2zqdyH8cetnF33meogqwQF/BLUFD3sLrr
 lcre+76Q6NNJd1A==
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

In order to support multiple configuration, add the possibility to change
the encoder type.

Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
 drivers/gpu/drm/vkms/vkms_configfs.c | 57 ++++++++++++++++++++++++++++++++++++
 1 file changed, 57 insertions(+)

diff --git a/drivers/gpu/drm/vkms/vkms_configfs.c b/drivers/gpu/drm/vkms/vkms_configfs.c
index 547b76d67c4cd1f9c2fb20e45f0f0583fa03b59a..dd4de385dadbdb24647cc59debb0284f94033b4b 100644
--- a/drivers/gpu/drm/vkms/vkms_configfs.c
+++ b/drivers/gpu/drm/vkms/vkms_configfs.c
@@ -1,5 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0+
 
+#include "drm/drm_mode.h"
 #include <linux/configfs.h>
 #include <linux/mutex.h>
 #include <drm/drm_print.h>
@@ -544,6 +545,61 @@ static void encoder_possible_crtcs_drop_link(struct config_item *src,
 	mutex_unlock(&vkms_configfs->lock);
 }
 
+static ssize_t encoder_type_show(struct config_item *item, char *page)
+{
+	struct vkms_config_encoder *encoder;
+	char encoder_type = DRM_MODE_ENCODER_NONE;
+	struct vkms_configfs_device *vkms_configfs = encoder_item_to_vkms_configfs_device(item);
+
+	scoped_guard(mutex, &vkms_configfs->lock)
+	{
+		encoder = encoder_item_to_vkms_configfs_encoder(item)->vkms_config_encoder;
+		encoder_type = encoder->type;
+	}
+
+	return sprintf(page, "%u", encoder_type);
+}
+
+static ssize_t encoder_type_store(struct config_item *item,
+				  const char *page, size_t count)
+{
+	struct vkms_configfs_device *vkms_configfs = encoder_item_to_vkms_configfs_device(item);
+	int val = DRM_MODE_ENCODER_VIRTUAL;
+	struct vkms_config_encoder *encoder;
+	int ret;
+
+	ret = kstrtouint(page, 10, &val);
+	if (ret)
+		return ret;
+
+	if (val != DRM_MODE_ENCODER_DAC &&
+	    val != DRM_MODE_ENCODER_DPI &&
+	    val != DRM_MODE_ENCODER_DSI &&
+	    val != DRM_MODE_ENCODER_LVDS &&
+	    val != DRM_MODE_ENCODER_NONE &&
+	    val != DRM_MODE_ENCODER_TMDS &&
+	    val != DRM_MODE_ENCODER_TVDAC &&
+	    val != DRM_MODE_ENCODER_VIRTUAL)
+		return -EINVAL;
+
+	scoped_guard(mutex, &vkms_configfs->lock) {
+		if (vkms_configfs->enabled)
+			return -EINVAL;
+
+		encoder = encoder_item_to_vkms_configfs_encoder(item)->vkms_config_encoder;
+		encoder->type = val;
+	}
+
+	return count;
+}
+
+CONFIGFS_ATTR(encoder_, type);
+
+static struct configfs_attribute *encoder_attrs[] = {
+	&encoder_attr_type,
+	NULL,
+};
+
 static struct configfs_item_operations encoder_possible_crtcs_item_operations = {
 	.allow_link	= &encoder_possible_crtcs_allow_link,
 	.drop_link	= &encoder_possible_crtcs_drop_link,
@@ -572,6 +628,7 @@ static struct configfs_item_operations encoder_item_operations = {
 
 static const struct config_item_type encoder_item_type = {
 	.ct_item_ops	= &encoder_item_operations,
+	.ct_attrs       = encoder_attrs,
 	.ct_owner	= THIS_MODULE,
 };
 

-- 
2.47.1

