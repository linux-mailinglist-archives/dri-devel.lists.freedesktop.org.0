Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DA76C9D635C
	for <lists+dri-devel@lfdr.de>; Fri, 22 Nov 2024 18:39:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E45510EC4A;
	Fri, 22 Nov 2024 17:39:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="OEKaV7j/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 79A1B10EC3C
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Nov 2024 17:39:13 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 48D99C0007;
 Fri, 22 Nov 2024 17:39:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1732297152;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8XbqLTDSSiPRq89qPf8jbVunz5efAkAkeZ2X6gdPmdU=;
 b=OEKaV7j/K4xyhJwKfW2H+7gCpInP+awZcPi51/Uz+kEgkz9Snch8ul6PCzNRMbPBBqjCa5
 LlofQK1qkBspbZpXjgjM8rUaZ+SPzgevuak/5DmQU0nkVqxlEfY2Jub7uPdfe6ZL0n5FAq
 pDjtvXBP+Y2CXS5r6H05yG8UD4wzNOAjytQm9D57Q/XxyXLQKwnRNYP70DC5apIJ9SvY6S
 +7GnlLjuW3JfKGFlbGfCKdZ8g2EuU7ej8ZKCe2uLhwyLlyuPy7rIHSn1fh1yUgRnD4NUI6
 NQqgSZPzFx6aFPjgz3Gch2kxeNDpUdQ4TCAiZf0qYWaZDCAmlPQYDi6OikLBcw==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Fri, 22 Nov 2024 18:38:41 +0100
Subject: [PATCH RFC v2 15/16] drm/vkms: Introduce configfs for connector EDID
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241122-google-config-fs-v2-15-4b7e6f183320@bootlin.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2445;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=3UBaLkaY10Xs7sZjf6PzQZCdjAZrwE6GT25BhYncrBA=;
 b=owEBbQKS/ZANAwAIASCtLsZbECziAcsmYgBnQMGtqTlMBrBheWpxj7pFke2IGncV8tyIsCCMR
 4AxF4NxJ9KJAjMEAAEIAB0WIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCZ0DBrQAKCRAgrS7GWxAs
 4nKjD/oDjX73fI4s2L+Svp0K35LDMJ0dmks+PkoMoeYh8nRgqmR29f3CHABHdc+9E53zcCfUkGn
 r6LaDDjrsTaXuJqIUGB982UphbrZ10mZHuFyHnYkxvTq77Rv2fUr6+AJTCtm7DWzLiR/3HXy9T4
 +Qk0K/Ev7AWXlXJhAFGZXxG8qk/yC6aStT4sLjLH3f+6P1BANv+BwtDaRWYt2VvGRK9MMzbBwsL
 0GjXc3rqEwxaVr2l4XruQGVlcMIZgHps0xDOUiJwBInq39iGi92vE8QBx7ebFZwLUrhFjimP1Aw
 jaEoLEPmoeLcvZctxKD+LySa5OlzQLXoKSg4z+xaB2s+1ZsgwCOdbMzYzuyKnRt8m/3/rdJEoKb
 bNwyxf4aY4A222aQ7etbJoZer8t6DjSgRQn2nmpb34vIKATkW+pJkWylROTlJNT8KLlJZI9WlCN
 B8mCjWjVw0mC90HANX1Vv4uf7NLO7dhqGXrGaj2KcEQfiAHXOS0c2Ffz8TvUp2MiJFdHHnaUV6M
 xX91gT46xJxmpQ8wTdwrv03o4UIaEFlnPCg7JRRV+fTM4N3czlmPed3DrQvKWQ29SDQ+mfEb9AK
 pUp2YP8jKPXsgTLX5KYNJ98/v4UiMzNO6CSmG7OluUBXzXqXdngCOMR2aSAHYHlESO6dpDiGYs5
 YB0kgobqiS7XpZg==
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

Due to limitation of ConfigFS, the max len of EDID is PAGE_SIZE (4kB on
x86), it should be sufficient for many tests. One possible evolution is
using a ConfigFS blob to allow bigger EDID.

The EDID can be changed at any time. As for physical display, you need
to trigger an HPD event to refresh the modes.

Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
 drivers/gpu/drm/vkms/vkms_configfs.c | 33 +++++++++++++++++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/drivers/gpu/drm/vkms/vkms_configfs.c b/drivers/gpu/drm/vkms/vkms_configfs.c
index 45738707f1f6c11b561e695fe0aef245d946b418..55bd0b9a31d35eca49c67a2fe2d58e3ea84367a4 100644
--- a/drivers/gpu/drm/vkms/vkms_configfs.c
+++ b/drivers/gpu/drm/vkms/vkms_configfs.c
@@ -1024,6 +1024,37 @@ static ssize_t connector_status_store(struct config_item *item,
 	return count;
 }
 
+static ssize_t connector_edid_show(struct config_item *item, char *page)
+{
+	struct vkms_config_connector *connector;
+	struct vkms_configfs_device *vkms_configfs = connector_child_item_to_vkms_configfs_device(item);
+
+	scoped_guard(mutex, &vkms_configfs->lock)
+	{
+		connector = connector_item_to_vkms_configfs_connector(item)->vkms_config_connector;
+		memcpy(page, &connector->edid_blob, connector->edid_blob_len);
+		return connector->edid_blob_len;
+	}
+
+	return -EINVAL;
+}
+
+static ssize_t connector_edid_store(struct config_item *item,
+				    const char *page, size_t count)
+{
+	struct vkms_configfs_device *vkms_configfs = connector_child_item_to_vkms_configfs_device(item);
+
+	scoped_guard(mutex, &vkms_configfs->lock)
+	{
+		struct vkms_config_connector *connector =
+			connector_item_to_vkms_configfs_connector(item)->vkms_config_connector;
+		memcpy(&connector->edid_blob, page, count);
+		connector->edid_blob_len = count;
+	}
+
+	return count;
+}
+
 static ssize_t connector_id_show(struct config_item *item, char *page)
 {
 	struct vkms_configfs_device *vkms_configfs =
@@ -1043,12 +1074,14 @@ static ssize_t connector_id_show(struct config_item *item, char *page)
 
 CONFIGFS_ATTR(connector_, type);
 CONFIGFS_ATTR(connector_, status);
+CONFIGFS_ATTR(connector_, edid);
 CONFIGFS_ATTR_RO(connector_, id);
 
 static struct configfs_attribute *connector_attrs[] = {
 	&connector_attr_type,
 	&connector_attr_status,
 	&connector_attr_id,
+	&connector_attr_edid,
 	NULL,
 };
 

-- 
2.47.0

