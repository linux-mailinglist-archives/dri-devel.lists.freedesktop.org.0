Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C004A18003
	for <lists+dri-devel@lfdr.de>; Tue, 21 Jan 2025 15:38:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E5AF10E5DC;
	Tue, 21 Jan 2025 14:38:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="EieIFKQl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::226])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F2DB10E0E7
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Jan 2025 14:38:08 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id CED82C0004;
 Tue, 21 Jan 2025 14:38:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1737470287;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=y2AG+SekWjl6u9VvxwoAYEavv+hkp5txg1P7sPS35uA=;
 b=EieIFKQlKqSF8FUdqvBG60LKKGoLehI54OpbEHNc7VvebPtz3XbkXfIlLhcvZTjabEeLdD
 GDNHoXeHfJW72ttF6cZG5JUW/sx4yUo+SMHVNredJuOoKeh3IVRYUudviHKARNa3d9MAk3
 N1sqHlw8TmkEQtQprOh1F4uwMYBryFGrDGCFXFUWDcza0gWZr0BCP9Xv1VA1G7ltMru2FA
 /4Ved5mFEEHM2XBsPvaoWPMNRq2GqLgX8+kLWXkSpl9vyYtiVWtRoTz1659Obiw1wwa3kB
 U6D/7bmqzTpaAhpomxz8S+vxDgiIao065uNgYHYgCGByZi2y+dp53NgkAW5VZw==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Tue, 21 Jan 2025 15:34:52 +0100
Subject: [PATCH RFC v3 08/14] drm/vkms: Introduce configfs for connector type
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250121-google-config-fs-v3-8-8154a6945142@bootlin.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3441;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=XNwYAF+nVvs1wVarheQorDdkzMZEXBdkjAOYLwB9GdI=;
 b=owEBbQKS/ZANAwAIASCtLsZbECziAcsmYgBnj7FCnC9S0p60fBDiN7sXUB98zfJjwfMuBD6p1
 Bra96dQ/S+JAjMEAAEIAB0WIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCZ4+xQgAKCRAgrS7GWxAs
 4kUrD/90TYiUyzAs5ysi++7EUyOCndV3h6nNDbF4OjsKsblGR6nR8j/cP7UXu8caQFAJO1gWaCF
 lV+Vo/zfrBwyo03297uHwcNDvKWuC3z5q5pvUKqachUtpKwom6DjxOSMNMpDFs9joiYNBWX4Zci
 MmtY4MDZORLDPaUkb7eavNTof7iYoBJ4djMHWaLXSRslJ2dExA6r9Nv8MxMxNmpiVNh5m4g6t4S
 Ftb60xPEyTNNPpzY83SUdKHBpmj2fhoIkv48KI/OlkFub5OW7BcoA6AGeU8sOXrAlOT3NsJTwGn
 QBGU9e5Va5BQM9owc7R/V8za10iFGXPH161kMmCfKdcZdCbh3IV4/nhSlphCRAYARnbvvS1nMaV
 5gTHmkuvxCtALTZVWQdCE4lrkdEmWzswm4WnL8ReVtHBEemmFVlM2oLaWyCzhKgAnMKW5Hej3lm
 rh3lgWJWblbuLRU7ALw9Tfv8pUiAtqJRvq8lEY4at7NxL8ocjMUta0vNGnGeEryBT60QN0Li+F7
 +NrySTImpgDnOad28/pwqvWdB7A0XFzpQBEV2BELKgQ6aeUBERuCsBIKQsm3xk52e8PRsWmxJ45
 yK2jT3Doy0eDNShxJQLWJImZefdVg50FZ/TEZKBM3r8QAy3cO7FwB2NdP8mibCBg2AnuqbNSwYS
 seTfmq271UBGBLQ==
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
new interface to change a connector type.

The type of a connector can be changed by editing the file type and by
writing the connector type number.

The current interface is:
/config/vkms
	DEVICE_1
        ┣━ enable
        ┣━ planes
        ┃  ┗━ [...]
        ┣━ connectors
        ┃  ┗━ CONNECTOR_1
        ┃     ┣━ possible_encoders
        ┃     ┗━ type
        ┗━ encoders
           ┗━ [...]

Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
 drivers/gpu/drm/vkms/vkms_configfs.c | 71 ++++++++++++++++++++++++++++++++++++
 1 file changed, 71 insertions(+)

diff --git a/drivers/gpu/drm/vkms/vkms_configfs.c b/drivers/gpu/drm/vkms/vkms_configfs.c
index 8bb3223c810dddb7d713ad4b01cece825f9939f6..5f416260f209fc98939f8addd175e5c3b8e35353 100644
--- a/drivers/gpu/drm/vkms/vkms_configfs.c
+++ b/drivers/gpu/drm/vkms/vkms_configfs.c
@@ -633,12 +633,83 @@ static void connector_release(struct config_item *item)
 	kfree(vkms_configfs_connector);
 }
 
+static ssize_t connector_type_show(struct config_item *item, char *page)
+{
+	struct vkms_config_connector *connector;
+	int connector_type;
+	struct vkms_configfs_device *vkms_configfs = connector_child_item_to_vkms_configfs_device(item);
+
+	mutex_lock(&vkms_configfs->lock);
+	connector = connector_item_to_vkms_configfs_connector(item)->vkms_config_connector;
+	connector_type = connector->type;
+	mutex_unlock(&vkms_configfs->lock);
+
+	return sprintf(page, "%u", connector_type);
+}
+
+static ssize_t connector_type_store(struct config_item *item,
+				    const char *page, size_t count)
+{
+	struct vkms_config_connector *connector;
+	int val = DRM_MODE_CONNECTOR_VIRTUAL;
+	struct vkms_configfs_device *vkms_configfs = connector_child_item_to_vkms_configfs_device(item);
+	int ret;
+
+	ret = kstrtouint(page, 10, &val);
+	if (ret)
+		return ret;
+
+	switch (val) {
+	case DRM_MODE_CONNECTOR_Unknown:
+	case DRM_MODE_CONNECTOR_VGA:
+	case DRM_MODE_CONNECTOR_DVII:
+	case DRM_MODE_CONNECTOR_DVID:
+	case DRM_MODE_CONNECTOR_DVIA:
+	case DRM_MODE_CONNECTOR_Composite:
+	case DRM_MODE_CONNECTOR_SVIDEO:
+	case DRM_MODE_CONNECTOR_LVDS:
+	case DRM_MODE_CONNECTOR_Component:
+	case DRM_MODE_CONNECTOR_9PinDIN:
+	case DRM_MODE_CONNECTOR_DisplayPort:
+	case DRM_MODE_CONNECTOR_HDMIA:
+	case DRM_MODE_CONNECTOR_HDMIB:
+	case DRM_MODE_CONNECTOR_TV:
+	case DRM_MODE_CONNECTOR_eDP:
+	case DRM_MODE_CONNECTOR_VIRTUAL:
+	case DRM_MODE_CONNECTOR_DSI:
+	case DRM_MODE_CONNECTOR_DPI:
+	case DRM_MODE_CONNECTOR_SPI:
+	case DRM_MODE_CONNECTOR_USB:
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	scoped_guard(mutex, &vkms_configfs->lock) {
+		if (vkms_configfs->enabled)
+			return -EINVAL;
+
+		connector = connector_item_to_vkms_configfs_connector(item)->vkms_config_connector;
+		connector->type = val;
+	}
+
+	return count;
+}
+
+CONFIGFS_ATTR(connector_, type);
+
+static struct configfs_attribute *connector_attrs[] = {
+	&connector_attr_type,
+	NULL,
+};
+
 static struct configfs_item_operations connector_item_operations = {
 	.release = connector_release,
 };
 
 static const struct config_item_type connector_item_type = {
 	.ct_item_ops = &connector_item_operations,
+	.ct_attrs = connector_attrs,
 	.ct_owner = THIS_MODULE,
 };
 

-- 
2.47.1

