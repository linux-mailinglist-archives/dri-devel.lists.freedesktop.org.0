Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 59AD89D6357
	for <lists+dri-devel@lfdr.de>; Fri, 22 Nov 2024 18:39:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 31A4410EC44;
	Fri, 22 Nov 2024 17:39:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="E8437X3l";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 53E0910EC3E
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Nov 2024 17:39:09 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 0C40CC0005;
 Fri, 22 Nov 2024 17:39:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1732297148;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=K62+SyNAzYsmI5c6NH75SjeRnt+jsy02BCREo3E62AI=;
 b=E8437X3la9DzCtXncDoexxcOl8LIzcMhtBe76IrN7n9mIaF6hCIoYqX4m1iDUtSxJGTpuP
 UWzPzD3aqeaDtgLeZX31zK2XJfLSE1Q8ALG2oul00+ZVZVPZx5A7pbz9kCazS1zWCK2p09
 yCbjEOylzLZGLHNOBVLBOEHBBkFjm/s37m76Y+C+RqqJA/20Z9A8clOZU3oPiNsr39m2zS
 d8YIXWNhc71p2xVRClXAoL5LIVZJEoyO+EKjJ+SxCQXhpedyoFjdD3RXmgHFEhrqvXH7O5
 mz+WqruK0a5xyxuCR4LlQR2B01DTXhi42MmD1cWfbtItQAQqwrxOd0wJ3b7SjA==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Fri, 22 Nov 2024 18:38:37 +0100
Subject: [PATCH RFC v2 11/16] drm/vkms: Introduce configfs for plane format
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241122-google-config-fs-v2-11-4b7e6f183320@bootlin.com>
References: <20241122-google-config-fs-v2-0-4b7e6f183320@bootlin.com>
In-Reply-To: <20241122-google-config-fs-v2-0-4b7e6f183320@bootlin.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3475;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=nyn61gEI5cxIOk33UuCcsn0hzoPdV29oV/sQS13cyvI=;
 b=owEBbQKS/ZANAwAIASCtLsZbECziAcsmYgBnQMGs9X5jLX7eybIjcC7XVZ18awx4EhJYJMnWY
 6PdjgkwcQ6JAjMEAAEIAB0WIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCZ0DBrAAKCRAgrS7GWxAs
 4hbkD/0U2jCG6Ed34iwiN4ftzEyVwtGeWnJQmV0/BDVHJn3DI3puBiTg6UgxBCJ2lg77X42jQrQ
 GAA8Wlx86qg++zbemn9ADIWJy5zQWF0ZmPlHD+OUU4J6zcBnpQiHL95MTw4AsH4UoC4+kfd+5NJ
 OlhgARcvWzDnrARtwWmX/jclGUe6mJcUzb1ORToQ53bdjD0jnT0rXTxtT8kH0/7eefLY/7ABTqa
 n3YXrf3jxjLGGkMXYe5X7RxZQHj+a9iATWRtzaSsb9lgbnz59P2MizS0nAHY7iNXV8XWxzqJ/X7
 O/cGMrS7ur9uHy8rOkRVBJSdbpE/h0Fy167V83kyaExWQ7h2I0cMlnBWabmj8LQxRuAHnHGkQzB
 wF+m1DBfvOPWTtRXcYBYBxdsvEK0+uV9b1jrb15t+1CYo8Ncvnf84wzIuajc/T9l1NoDi0oBzwI
 QmwXxTxypKmouZnxkwSvS0c93AOqR+W2yXYk7sbAHPRYSYQxIDy78k5Ah/LMP1ekFwYfvksXZMZ
 dyv4h/KNv83bOKWT18wTCUTWQWGJ/8ODOeAXJwRAptc43pSPsJ83O7f6KfkKtQyjDRVxmlAGnKI
 X9LTicWpKeiQFIazCBsHgeLMq9lM+qrpniWeMbX0D9JmCkCTEDf6d9LGle5ZrtlDO4pXn9emC7e
 BbRC6Uj+4H84CIQ==
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

Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
 drivers/gpu/drm/vkms/vkms_configfs.c | 75 ++++++++++++++++++++++++++++++++++++
 1 file changed, 75 insertions(+)

diff --git a/drivers/gpu/drm/vkms/vkms_configfs.c b/drivers/gpu/drm/vkms/vkms_configfs.c
index ef9a00c41b7b030d0d60ffe078809f9799539f40..a1ddf25ab6f882ae1857bc82fb4b4a425b6d287d 100644
--- a/drivers/gpu/drm/vkms/vkms_configfs.c
+++ b/drivers/gpu/drm/vkms/vkms_configfs.c
@@ -355,6 +355,79 @@ static ssize_t plane_default_color_encoding_store(struct config_item *item,
 	return count;
 }
 
+static ssize_t plane_supported_formats_show(struct config_item *item, char *page)
+{
+	struct vkms_config_plane *plane = plane_item_to_vkms_configfs_plane(item)->vkms_config_plane;
+	struct vkms_configfs_device *vkms_configfs = plane_item_to_vkms_configfs_device(item);
+
+	page[0] = '\0';
+
+	scoped_guard(mutex, &vkms_configfs->lock)
+	{
+		for (int i = 0; i < plane->supported_formats_count; i++) {
+			char tmp[6] = { 0 };
+			const ssize_t ret = snprintf(tmp, ARRAY_SIZE(tmp), "%.*s\n",
+					       (int)sizeof(plane->supported_formats[i]),
+					       (char *)&plane->supported_formats[i]);
+			if (ret < 0)
+				return ret;
+			/* Limitation of ConfigFS attributes, an attribute can't be bigger than PAGE_SIZE */
+			if (ret + strlen(page) > PAGE_SIZE - 1)
+				return -ENOMEM;
+			strncat(page, tmp, ARRAY_SIZE(tmp));
+		}
+	}
+
+	return strlen(page);
+}
+
+static ssize_t plane_supported_formats_store(struct config_item *item,
+					     const char *page, size_t count)
+{
+	struct vkms_config_plane *plane = plane_item_to_vkms_configfs_plane(item)->vkms_config_plane;
+	struct vkms_configfs_device *vkms_configfs = plane_item_to_vkms_configfs_device(item);
+	int ret = 0;
+	int ptr = 0;
+
+	scoped_guard(mutex, &vkms_configfs->lock)
+	{
+		while (ptr < count) {
+			if (page[ptr] == '+') {
+				char tmp[4] = { ' ', ' ', ' ', ' ' };
+
+				memcpy(tmp, &page[ptr + 1], min(sizeof(tmp), count - (ptr + 1)));
+				if (tmp[0] == '*') {
+					ret = vkms_config_plane_add_all_formats(plane);
+					if (ret)
+						return ret;
+					ptr += 1;
+				} else {
+					ret = vkms_config_plane_add_format(plane, *(int *)tmp);
+					if (ret)
+						return ret;
+					ptr += 4;
+				}
+			} else if (page[ptr] == '-') {
+				char tmp[4] = { ' ', ' ', ' ', ' ' };
+
+				memcpy(tmp, &page[ptr + 1], min(sizeof(tmp), count - (ptr + 1)));
+				if (tmp[0] == '*') {
+					vkms_config_plane_remove_all_formats(plane);
+					ptr += 1;
+				} else {
+					vkms_config_plane_remove_format(plane, *(int *)tmp);
+
+					ptr += 4;
+				}
+			}
+			/* Skip anything that is not a + or a - */
+			ptr += 1;
+		}
+	}
+
+	return count;
+}
+
 CONFIGFS_ATTR(plane_, type);
 CONFIGFS_ATTR(plane_, supported_rotations);
 CONFIGFS_ATTR(plane_, default_rotation);
@@ -362,6 +435,7 @@ CONFIGFS_ATTR(plane_, color_range);
 CONFIGFS_ATTR(plane_, default_color_range);
 CONFIGFS_ATTR(plane_, supported_color_encoding);
 CONFIGFS_ATTR(plane_, default_color_encoding);
+CONFIGFS_ATTR(plane_, supported_formats);
 
 static struct configfs_attribute *plane_attrs[] = {
 	&plane_attr_type,
@@ -371,6 +445,7 @@ static struct configfs_attribute *plane_attrs[] = {
 	&plane_attr_default_color_range,
 	&plane_attr_supported_color_encoding,
 	&plane_attr_default_color_encoding,
+	&plane_attr_supported_formats,
 	NULL,
 };
 

-- 
2.47.0

