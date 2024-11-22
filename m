Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 423829D635A
	for <lists+dri-devel@lfdr.de>; Fri, 22 Nov 2024 18:39:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A83210EC49;
	Fri, 22 Nov 2024 17:39:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="CfAQ1TW0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6EAF510EC3C
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Nov 2024 17:39:11 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 1F79FC0003;
 Fri, 22 Nov 2024 17:39:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1732297150;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=v8thBcBK5C6IbsTmxWfKXHXaUB+CSMrPfQq04FH+0t8=;
 b=CfAQ1TW0Q1ROrEt6DAiB67Fu3NqfJKA4dqgDSGwgI+P81dIWI2+SbTejTZmtl9QnnZer3Z
 Tto5f0kfxP06yQw4WhmvmvPBsKTPuov4djrunGrGdcH+ugyCN38trd+AD+KNI8GUF+eVfI
 Ajitdcm6zkAUn/aODMaY/BAoQd39NU2QnZ3Io1WfOhgySzbUv91viGHlosRJfWrEfOn4mU
 AwqbNXq2xh0zycFiaD+wIoichtdeQeNXpuEQPJOkiCQBQZ6OPewIPdGW0ieMCFBc7Kv2EQ
 yNwja6p3YFfwh6PTV1qOIeCtGp2wzRR30wlVOQxKGBMxyAFnAxsI/+FJn1NLAg==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Fri, 22 Nov 2024 18:38:39 +0100
Subject: [PATCH RFC v2 13/16] drm/vkms: Introduce configfs for connector status
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241122-google-config-fs-v2-13-4b7e6f183320@bootlin.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2106;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=EeP4OvWfDdFh1jcT0ibCxJNe0wB91SXrC/2Q6j0zaEg=;
 b=owEBbQKS/ZANAwAIASCtLsZbECziAcsmYgBnQMGtqkK3jIjpQEEKwk9EtqikKRJdy4QXJv2/K
 52HeXYM83aJAjMEAAEIAB0WIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCZ0DBrQAKCRAgrS7GWxAs
 4ufzEAC2Hf7lYezF+S7ZklJyoGhgiB3eFl5ugvA5ACC9i1aSaQZlyDy7+pJG1IKXm1cRMCCgldX
 6zpjNV16M5hnjBA6N09IT8Oe4mLg2Gvbxzc8q1FoFyT21a6X/pyb6cj1yNU/EpM8OJo3F5kgL+E
 Cfrr4gu9gjzs3O+3Smbd5XGU0fAwDZku0hfBrpdChTCiOgIdI4MBnepqIJh/P1yfoPqQVsjevj0
 T8OqMXydIbNTSAyFTO6h7yCo4L1o+5tdUkCmp35Wybg66lFPpF+LgjWtJDIWAQoIzi+e1KglpDH
 CbYS7HJk6ZwBGttWzmoYDPaR1c+b9MQCOz3ASBpwALPozxO37Dpu77panFIOtY69R6aJKTumXWB
 3rvg33DAjiPiuqws+OJ8AUtdyO94IdqQHG/Nv4EHkXyGfClJDIGjDIlOSMPFjf/wqD0CsFxGcaz
 dVho6QWL0xLCVHWQ/+4ObzRqSERLk8vCPDV4soXNP1vlN1ITzndRB/iLE5xcW618fuMmL3NMQdo
 /F+nj8UjTlvbuLoivHjp2vLdhKwlege752qFV4gTnYdvsJvOzhQOup7DFdDcRhGCpL7Kw3e+ZQE
 Mh0znW083dorv39KkuqKvmHnkQfcJo02j2AYSGQw8t0GREAb8vzt5DK6SoGt+OQWouhQ5sMvj/T
 OHOkuyX5iXt+b0A==
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
 drivers/gpu/drm/vkms/vkms_configfs.c | 45 ++++++++++++++++++++++++++++++++++++
 1 file changed, 45 insertions(+)

diff --git a/drivers/gpu/drm/vkms/vkms_configfs.c b/drivers/gpu/drm/vkms/vkms_configfs.c
index dede56a8a2c1e866734f9c979c76977370907680..6412a8b7b1066f2d3dca1135ebd7fbaed84027b6 100644
--- a/drivers/gpu/drm/vkms/vkms_configfs.c
+++ b/drivers/gpu/drm/vkms/vkms_configfs.c
@@ -981,10 +981,55 @@ static ssize_t connector_type_store(struct config_item *item,
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
2.47.0

