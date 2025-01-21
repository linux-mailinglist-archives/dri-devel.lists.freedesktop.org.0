Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E0A18A17FFD
	for <lists+dri-devel@lfdr.de>; Tue, 21 Jan 2025 15:38:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F47C10E0E7;
	Tue, 21 Jan 2025 14:38:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="QzFdpQCM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2504610E0E7
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Jan 2025 14:38:12 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 097B9C0010;
 Tue, 21 Jan 2025 14:38:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1737470290;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NX98o/Rl6NdAlU9ltpjlyQYuJMH4YW29knwFHP1bdzM=;
 b=QzFdpQCMv3l0wUEp1U4LxD58jA6Erl6A/MouEig8+X6WbmZ0gPuSrTgXig8FEKIRYlC0sM
 u7QImBC2SP/zK3uaHqi1DDNBdp6D4fAalY8cZwgXFAUw/RO7P8nahg4Ac4hg9zcKfyao6t
 FLTw/KgqWfWuXjWnRGJmeYwtY4vrxgv55Rnh+l8k7NsOPOOUUSRk4A8csR6wPcbWpGYbCh
 FKbqY7q0I7oQ+AHClYCq9w0+sf7Mi4/PSeDOapr8F7X219HC7IvVmLfyDD//iIZG2rjUIq
 88VqKvUzSi/HSpEeNX+BsJZaTTOnyMrLEkEIz9NyutetQCoXtDfU/PWUKkAamA==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Tue, 21 Jan 2025 15:34:55 +0100
Subject: [PATCH RFC v3 11/14] drm/vkms: Introduce configfs for connector status
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250121-google-config-fs-v3-11-8154a6945142@bootlin.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2230;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=Zf2mHAfhpssSgBnJiUlEoh26cihTH7swHtR1ZXs7sHw=;
 b=owEBbQKS/ZANAwAIASCtLsZbECziAcsmYgBnj7FDLcIqxCqEWSNHW+CT+XzDL1Nj/jv83+qH7
 lBzQX6T5fiJAjMEAAEIAB0WIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCZ4+xQwAKCRAgrS7GWxAs
 4j56EACKu6hjW2ZaKZZyJhC/UtS3JdQsQVgerNiIC8XLQujUBFYbRWgAIScea34TTsKDq+PEIPs
 hjlT+4+k03kkgQT7jAnPX5Jcp+3RTI1+jBeIKE13EVVngOFFHuD3Z5vCzY/a4/uAvuUviPI3Z3U
 ucVexo9U0iI6xSCd3OooumAC//xUIj1gRuUVdPnX15q3GLNfcLVhCrUY9fUDXoru8UK8lZi3Vs8
 4kozq8nI4XP7Za8Fuy5VfyGQ38W2ulh1Z43DsFTHYMTrm4Ija6IBRvOyYFsYnx1PBVXFYWQNU5j
 Eqc4MWg95XpE/1E6J9TgyQGiAmXLfGJFsVPE5KHUcCx4cKgc7A2sBiwoTP8lA9VKm6jrjWW402a
 NqSjZE7kILcL6A/Bpg882AFHPCCa+JpOQMQF6fAPQyqobTaYmeRwKAItsmIAoVRv7rv5XKEoNz5
 djMUapp/3hSx8poK6Q9FUjVlg4pKmWY1qfe2KNUtAwl/E2ZbHp6c9wLe36QR9GV4F2vdKCOihTV
 gijZHtIq3hDQgsjPFiTzkjm1vlyBgT2IRKwiZ3bN5XdSzcRnA3TlDQDsIZqtvFqDd+hTkX7t5Wy
 j2RJmK922xBX8QiK8sT1Kqg41TduCugY1YEnn+8G9t3YrbGKOy69vKtJf2inM4kzOpEXcrOHxKP
 oGLy4GU8e69zwfg==
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

As a connector can be connected and disconnected once a device is created,
create a file to allow changing this status.

Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
 drivers/gpu/drm/vkms/vkms_configfs.c | 45 ++++++++++++++++++++++++++++++++++++
 1 file changed, 45 insertions(+)

diff --git a/drivers/gpu/drm/vkms/vkms_configfs.c b/drivers/gpu/drm/vkms/vkms_configfs.c
index d0bc6adfdae85b82ca043d318f84fca70840526c..09d9ac3cb3e25e980473686b7b0d2e66e78cf163 100644
--- a/drivers/gpu/drm/vkms/vkms_configfs.c
+++ b/drivers/gpu/drm/vkms/vkms_configfs.c
@@ -771,10 +771,55 @@ static ssize_t connector_type_store(struct config_item *item,
 	return count;
 }
 
+static ssize_t connector_status_show(struct config_item *item, char *page)
+{
+	struct vkms_config_connector *connector;
+	enum drm_connector_status status;
+	struct vkms_configfs_device *vkms_configfs = connector_child_item_to_vkms_configfs_device(item);
+
+	mutex_lock(&vkms_configfs->lock);
+	connector = connector_item_to_vkms_configfs_connector(item)->vkms_config_connector;
+	status = connector->status;
+	mutex_unlock(&vkms_configfs->lock);
+
+	return sprintf(page, "%u", status);
+}
+
+static ssize_t connector_status_store(struct config_item *item,
+				      const char *page, size_t count)
+{
+	struct vkms_config_connector *connector;
+	enum drm_connector_status status = connector_status_unknown;
+	struct vkms_configfs_device *vkms_configfs = connector_child_item_to_vkms_configfs_device(item);
+	int ret;
+
+	ret = kstrtouint(page, 10, &status);
+	if (ret)
+		return ret;
+
+	switch (status) {
+	case connector_status_unknown:
+	case connector_status_connected:
+	case connector_status_disconnected:
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	scoped_guard(mutex, &vkms_configfs->lock) {
+		connector = connector_item_to_vkms_configfs_connector(item)->vkms_config_connector;
+		vkms_config_connector_update_status(connector, status);
+	}
+
+	return count;
+}
+
 CONFIGFS_ATTR(connector_, type);
+CONFIGFS_ATTR(connector_, status);
 
 static struct configfs_attribute *connector_attrs[] = {
 	&connector_attr_type,
+	&connector_attr_status,
 	NULL,
 };
 

-- 
2.47.1

