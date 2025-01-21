Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 200DFA17FFE
	for <lists+dri-devel@lfdr.de>; Tue, 21 Jan 2025 15:38:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F9EB10E5D5;
	Tue, 21 Jan 2025 14:38:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="YA0i0VLy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::226])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 49BF810E5D5
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Jan 2025 14:38:14 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 1F12CC0011;
 Tue, 21 Jan 2025 14:38:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1737470293;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=OFQ4Ff8PV/nQ3otAFU0pTp2obHz+6vw8l94Fypiq9Co=;
 b=YA0i0VLysGRnSoxKzQhmCpa0mijD7zPf1oYkPHXO+IVWToEbb4tzJ/1bd7MWhPJL3goZti
 N5rZMztoL+lZ6NzUjZ/cDBXsD91fTnd6ZeyWYlrRJJ4pzOF2t2OnwzGeOJmhIrMRI7O9cb
 fQWYgRlAJhTavAyi9kiI/9fWdco/ZOJWGWVLmeJ2nYmdiJKzIHK2ONik9ZnPp1GXhsjdxn
 E0NCqU9MGqxmZT2eyY7UqgIK4srQQWmfCtGsUakWFOxGLfgxy3LeUakIgDRAkt9dIMQ3iW
 SRBZaBO9Bs58YK9O5Qj0Lf7LZ0euZqI/ngahWseih21ILqzw9zWFRPhLXGxSTg==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Tue, 21 Jan 2025 15:34:57 +0100
Subject: [PATCH RFC v3 13/14] drm/vkms: Introduce configfs for connector EDID
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250121-google-config-fs-v3-13-8154a6945142@bootlin.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2441;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=74KM1HCxeJ9rIki3nH8P7Jl+BhT1o7myjLxUUlO3Zbk=;
 b=owEBbQKS/ZANAwAIASCtLsZbECziAcsmYgBnj7FDWykG7DumlhiIaLE+2dhJiHi63l/Ckduqy
 Z+9t7wN3VCJAjMEAAEIAB0WIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCZ4+xQwAKCRAgrS7GWxAs
 4pNYEACEbe3iBCi8a1zrun+ZzRhdFpRNewPtswtul3FQp1KopGzpaATQ2+WDAJ4xZLdY5m2YqPy
 7hFi5gOTNIWe86KZUqz8AiVVqMLuS01Pn6xgDH08ZIRil+Ui6PAwQ6+QReObyGmMjhhNE0pxmLC
 N25c7YdyyL7n/UoetL0aFjQBr2KeMCXHNBpw1EW5M2AHsgvPsJwr6S2PurZz2xdhwvSh0mDf22d
 wPCtkbVicmFGbNK4Yud3//BVg8HPlPvc20lwrpb84XgfdVYCXMAWS7PRXRFb9e1UiRH43YF6gig
 y4trOq3CPm/ip56uUAgrY+fK8XiTeyfuqee2YcIReZ2yl5kznJxVQx5/ML0TPIFHRKTtGOEiBuJ
 7xccnQL2f5u3anIYtKOSKLitC2AOuB+FC6FZWZ+MDWaFRa0+p/h9jn2OzzRG4pZtfFLs19o3+P9
 b2T/Ha/k9LlEBkgXiGy82bXBjQNgDhaOeYUFoLzfIZ4OqWysaK/xvfqqONTaXNA6Ib2+jWAJI8Z
 5t/Gswqh4THslK8mYZGHFlooJUNqSM9uRoC0Ue8JLFDvpAXl8Sn+DMWM/SaHzWVeWs6r4/bEbiY
 H1fFO8s/+P7im27LYroNMEohYcs0XCW3gNOepWrSpKT9o/a3M5/SWwSfwscIlxkX2YPkfYQZq4w
 7420Vhs3nyqSRgA==
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
index 76f28862c7652fbd9e84c42b60ad818ddee1485b..547b76d67c4cd1f9c2fb20e45f0f0583fa03b59a 100644
--- a/drivers/gpu/drm/vkms/vkms_configfs.c
+++ b/drivers/gpu/drm/vkms/vkms_configfs.c
@@ -814,6 +814,37 @@ static ssize_t connector_status_store(struct config_item *item,
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
@@ -833,12 +864,14 @@ static ssize_t connector_id_show(struct config_item *item, char *page)
 
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
2.47.1

