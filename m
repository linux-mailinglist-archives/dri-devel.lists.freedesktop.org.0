Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 17F7BA17FFF
	for <lists+dri-devel@lfdr.de>; Tue, 21 Jan 2025 15:38:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F16E10E5D9;
	Tue, 21 Jan 2025 14:38:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="irVH5x98";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0BBEC10E0E7
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Jan 2025 14:38:09 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id DC723C0005;
 Tue, 21 Jan 2025 14:38:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1737470288;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bQdDURrLCeyHMFocs4AD2ik95r7Ex45a/kM7X1LnMy8=;
 b=irVH5x98+bMtwaDny2JlkBm4qODiHYgjFtO1jXJsGP44cKmpefxGTZrpLxrvfTGW4f4UgU
 R2inRfCmwCEd/QaWZZE0w4QmDSEu1ns/lvo3caqVJXjNy8U2PLeiJircFiZ3no/eXQkmes
 hfLHtJMm4p1JPMbbRRjeteZ+bBSkmb4+3wI1rqTiyxhZyfdl/vIWrwRwbsdEVVxGhi4XyS
 +LxeHluSkVhGkMBWa7vr1fDRhgaQuMxtETpdC+Cm3yRetepCkGSi1fy/8n1zEfXc2AxMpK
 XC5Vn5jP4GfivVTHi2dNfU89hgpqMZUGX+w9U5ztg21q/fdI3mdh+x7rJCkboQ==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Tue, 21 Jan 2025 15:34:53 +0100
Subject: [PATCH RFC v3 09/14] drm/vkms: Introduce configfs for plane format
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250121-google-config-fs-v3-9-8154a6945142@bootlin.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3805;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=59ocMuZiKn0fV0F1JxnVDqXfFu8e2TcR6P2zV61+WKo=;
 b=owEBbQKS/ZANAwAIASCtLsZbECziAcsmYgBnj7FCYoG0GfdRnCp1NhRxufEbP0kgQtojZ6trQ
 WnNaQybJZeJAjMEAAEIAB0WIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCZ4+xQgAKCRAgrS7GWxAs
 4ifCEACsvxKnaceQPUhXik1Yja+4yaFdUZEEoQZoPnSd71bZ9NzbwRLq0RwWErN7byPIxQn/drY
 UA0ghneMD6Xqi10Evp6N6RhGFNrB8kPCINXccAALnns143YNcn/OAvgSkjjVChelma6fvi/naCq
 S1XzBTXBjPZ7fd8qyfbu7hAi0P0CS2y2MDU6YAtwKRlxRNpsdtb0Vb4i6Ij6g8Xo0g74v3VIFAx
 SA3hqnCIHAO5naxeK0lVKANrasRjKkm2vssw1oZiPiepkeWN2V9drpRNkDi7GOehtIl9mdofaO4
 ZjLonN52WuKQg4pkchtq8hCfjUDr9lQZ6lqSHnDdT91mnMxCS4TlDXup7qISDeTLkg1/4NxtDXa
 6qPUtlCO1Bs+TjYqi5H8gb+s3/Rwgfx7zAyzmbenT0ErF5BJC7WjnLN01Fvj8a/Mn3dbEU1mVBR
 XZU1th3j4JTRtpBeIm/k6cot41n53JzglhVw514TkBuEYMjjwtguqXTQAZYZw//YMiJ272s5rbe
 sPdFz0AMy+6ZAeBQAAH2wRxJV9OoiekoLMk9UX+LpvxS6msw4ebw8xQrbcFTOCziPk6g5RpSZqj
 Cuxsfnm4gNnVFMqIH5+wp1GQzy1dfw3xCYhUpN5Q4eJjgxnbx4wdeNApMjeGTJmGGAPYAH1B9kY
 nkqXzayyPew2loQ==
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

To allows the userspace to test many hardware configuration, introduce a
new interface to configure the available formats per planes. VKMS
supports many formats, so the userspace can choose any combination of
them.

The supported formats are configured by writing in the file
supported_formats:
- `+*` - Add all available formats
- `-*` - Remove all formats
- `+<fourcc>` - Add the format (for example `+AR24` to add ARGB8888
  format)
- `-<FOURCC>` - Remove the format

The current interface is:
/config/vkms
        DEVICE_1
        ┣━ enable
        ┗━ planes
           ┗━ PLANE_1
              ┗━ supported_formats

Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
 drivers/gpu/drm/vkms/vkms_configfs.c | 75 ++++++++++++++++++++++++++++++++++++
 1 file changed, 75 insertions(+)

diff --git a/drivers/gpu/drm/vkms/vkms_configfs.c b/drivers/gpu/drm/vkms/vkms_configfs.c
index 5f416260f209fc98939f8addd175e5c3b8e35353..eeb0c1e1b225f2a1a35ac6deb9457b90ba6542e5 100644
--- a/drivers/gpu/drm/vkms/vkms_configfs.c
+++ b/drivers/gpu/drm/vkms/vkms_configfs.c
@@ -153,14 +153,89 @@ static ssize_t plane_default_rotation_store(struct config_item *item,
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
+CONFIGFS_ATTR(plane_, supported_formats);
 
 static struct configfs_attribute *plane_attrs[] = {
 	&plane_attr_type,
 	&plane_attr_supported_rotations,
 	&plane_attr_default_rotation,
+	&plane_attr_supported_formats,
 	NULL,
 };
 

-- 
2.47.1

