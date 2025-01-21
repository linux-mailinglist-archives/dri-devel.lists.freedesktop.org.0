Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E4904A18000
	for <lists+dri-devel@lfdr.de>; Tue, 21 Jan 2025 15:38:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E90EA10E5D8;
	Tue, 21 Jan 2025 14:38:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="lAzhUjYz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 295A010E5D9
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Jan 2025 14:38:11 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id E5E84C0013;
 Tue, 21 Jan 2025 14:38:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1737470289;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rT/oqkmtB9cijaiL9lDgfKvYzJqMxUaAub35WR3p/3U=;
 b=lAzhUjYzdFB7c3mneC/XmAbMwFPac8mbflotUekD5sjC4swrpRZ13sGE/4XZpOjp1CiWPz
 /3RcUGXhLamIZQGqk7Dl8GYMwLH9KmstFhduko5N4QUe3f0c6iib8IiG79bGUb5X/DN/CP
 8hSeS7jlV2zp8PMANQbpM6NRjW9JYPhkXOqI9dG4n7h225nZVvG4tIe36xDcQEhyVHnp2Q
 +coS9bnlZ3+82rt/ot0kZTJ8IJL3uhCbNW/6qd+qgLNj6Ew2Qr4NAN+rZv2DVU0didUUgj
 EbeYxYnYy74XMeDiEofwvBGekMAY+eyVI3kPhUlf0feL32GTaBnSGXsGoPOGNQ==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Tue, 21 Jan 2025 15:34:54 +0100
Subject: [PATCH RFC v3 10/14] drm/vkms: Introduce configfs for device name
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250121-google-config-fs-v3-10-8154a6945142@bootlin.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1415;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=GBQ7JzpZcLe0OOn0aZ2W0MmxaOx2G1PAWm82kEXTnl0=;
 b=owEBbQKS/ZANAwAIASCtLsZbECziAcsmYgBnj7FCZ4QKkm3W+y5H+KYypp+zcp4E7kDRYnQdR
 PVtmAO1qRSJAjMEAAEIAB0WIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCZ4+xQgAKCRAgrS7GWxAs
 4kxkD/wP1GcgDe3vWuTqb+9KrdXu+JEiiUVcVAXUZALeFJaUZ868q4DHEQ5iZSNvveTd+A51Be4
 CyO6/B1CRIXuIhdrFiNiXcKdWM6r0U1SvmUII2gxJatKXIVNDMg7VA3s45RqG2ZBM4rC/jAcifB
 2ElHshy6uL/lKJEVYuYJiBsUI0+0aKmi+Hx9dsn64i406fa9H6kiFCsLu1mu0XbWnP0MU9d3xHV
 0I/xS+cuEdigTIvzYRVyECiLbao+dAwE4QT5Xlnc0FMqA1uujpUDJXR94kFBpixSmtPCHVHqLEa
 +7BYFLGinaLlohYaa+LBwI/zAaonj8elD/WA9/ohndZIp7OK0jtZBP+h/++1nE7cLDvlbCGpPzX
 NnTBtcCMwpp1Rs+y29jBXXY1hdpYOIqzLh1/6TxMgvvZg8kyRNznESDeq65VSAgF9wrKM4adMl7
 Tx77y4k1K+y11OLlCZHKsLNE1JQAtksuf2uhLjcUE++YB3Kf0BE9LDSDQ0IPqBs9Et60CFLLlmh
 dXq1dmlo0SCgeE+M0u4e3IeA3QPeQ2oNo/WNJ0n6q2BykF+7x6aT4K7W2lbPvAVLu35kFjP0V/C
 9Bo7u/SJUHir52ObNoz48yfTZgjAryVkC2doXcoKsXME8SfZdJfyCoZonK0kjMmlEmf+XQF6VKk
 EwoJ6DNggVW/F3A==
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

To allows the userspace to identify the device once it is enabled, create
a file to fetch it.

This file can only be read once the device is enabled, and will return the
device name, which can later be used to use it.

Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
 drivers/gpu/drm/vkms/vkms_configfs.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/drivers/gpu/drm/vkms/vkms_configfs.c b/drivers/gpu/drm/vkms/vkms_configfs.c
index eeb0c1e1b225f2a1a35ac6deb9457b90ba6542e5..d0bc6adfdae85b82ca043d318f84fca70840526c 100644
--- a/drivers/gpu/drm/vkms/vkms_configfs.c
+++ b/drivers/gpu/drm/vkms/vkms_configfs.c
@@ -927,10 +927,26 @@ static ssize_t device_enable_store(struct config_item *item,
 	return (ssize_t)count;
 }
 
+static ssize_t device_device_name_show(struct config_item *item, char *page)
+{
+	struct vkms_configfs_device *configfs_device = config_item_to_vkms_configfs_device(item);
+
+	scoped_guard(mutex, &configfs_device->lock)
+	{
+		if (configfs_device->enabled)
+			return sprintf(page, "%s\n",
+				       dev_name(configfs_device->vkms_config->dev->drm.dev));
+		return -EINVAL;
+	}
+	return -EINVAL;
+}
+
 CONFIGFS_ATTR(device_, enable);
+CONFIGFS_ATTR_RO(device_, device_name);
 
 static struct configfs_attribute *device_attrs[] = {
 	&device_attr_enable,
+	&device_attr_device_name,
 	NULL,
 };
 

-- 
2.47.1

