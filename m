Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D6B09D6358
	for <lists+dri-devel@lfdr.de>; Fri, 22 Nov 2024 18:39:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5214610EC47;
	Fri, 22 Nov 2024 17:39:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="JHPUpjeO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A891C10EC3C
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Nov 2024 17:39:14 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 5E794C0004;
 Fri, 22 Nov 2024 17:39:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1732297153;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hj9CwfeF6o027ybdXGATpTDOE50up/2fWiEDIVtzBEo=;
 b=JHPUpjeOmNysKwvgoFCW3gpDKU/eyvgfKJ0Jm7a2aCZNSCwxjG3i7C/Jd2G8GSz8HTfIcv
 dQBb9nKUWh/U4f93b8UBsROF/ZucALGGBxbE2FO0AbBRpMVTiRrn0C7qEZH3vvAQEqTPaz
 U8TeR5esWWyppbNkvI1P2um47fYNira8NjIQ4RbqBpjsgqgThI9QFWTUT/t82RIXQflX04
 3y+Ajz2gEOXvk+8h8WVU01V20E71r6+jNN1VBN4hjCeejixrFylh/sZHT/exVZN34oo/Jd
 DJnllg7bP4kyhttXw8l5uh0v1goyy0xSdLqnRKoHsAsAqHlFXmsiRnYw7ZJIIA==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Fri, 22 Nov 2024 18:38:42 +0100
Subject: [PATCH RFC v2 16/16] drm/vkms: Introduce configfs for encoder type
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241122-google-config-fs-v2-16-4b7e6f183320@bootlin.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2786;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=K0YQanDFtYen2DYvGJHhkjozmdVGaLCxqx1SSXyopZA=;
 b=owEBbQKS/ZANAwAIASCtLsZbECziAcsmYgBnQMGuJ1BDzmEtq5eT075LQQL8d81HB/aWBkdha
 FVABvV8GR2JAjMEAAEIAB0WIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCZ0DBrgAKCRAgrS7GWxAs
 4qXxD/429dAuBnACRdzBaEm+ouQkpW+dMVI3KD9lrqBlRBtegC6/94d8Y7O21FGTM78OFd8UGwW
 hzf69hnWzzu7FCcur1ftoA1Jk2PG8QFTtnjhaIIftQDQdj3sJIMHF3uSHtsJLjbcKsmWATSPLsB
 6OZDpGUl1n76s3tGY+BnZAtHZ5wW1D3mfQ7wRD0uV3rzlDTCvRHh5bK08LlGJnmOI7fjWrMsDre
 QmGNL1j5En2npXMDcA6EVS4KSxUzMH51XRUfcaqgP58y3cCIBXwh+rL02oY2/09fXCVtQtbQ9tH
 iUu1r8MoN8KEW3vuvxxkMaB/4fGuf4AU3iXIsAsyAtrJljYRSaZxkvEnND8Ni4B7KS7P84fQvBy
 5RWUHiZQsVQFhj2EhK3tOQUPMNLRKbCXou379F9CvYZTfTduWW2Tsd5RGU4msakVXu4ujgwTCyK
 FZR1YyNfZNTwpGRwyhHBquMml53+TdtzDY2IWv08hArd0oTM68YJeY5jLsO1tk7i3Ln9jnjFJP5
 ScvkEQpuVif9btjiMZg9ESJNS38BohIjtxA0uyMiLccgPJql/qyjepQaSaou+4TpWAsKrXCI8lb
 eLKrWcyfRMBPngmrefzjcPV+y9wCG5JK/RFk5vZDCk3QJOKPsjpxf4V/+tpVT3m+SHkB/rolhjF
 C3XSmww+EN8yyPA==
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
 drivers/gpu/drm/vkms/vkms_configfs.c | 57 ++++++++++++++++++++++++++++++++++++
 1 file changed, 57 insertions(+)

diff --git a/drivers/gpu/drm/vkms/vkms_configfs.c b/drivers/gpu/drm/vkms/vkms_configfs.c
index 55bd0b9a31d35eca49c67a2fe2d58e3ea84367a4..bfd3c3a0851b2cc76da52b8a190511f22d3f9fbc 100644
--- a/drivers/gpu/drm/vkms/vkms_configfs.c
+++ b/drivers/gpu/drm/vkms/vkms_configfs.c
@@ -1,5 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0+
 
+#include "drm/drm_mode.h"
 #include <linux/configfs.h>
 #include <linux/mutex.h>
 #include <drm/drm_print.h>
@@ -754,6 +755,61 @@ static void encoder_possible_crtcs_drop_link(struct config_item *src,
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
@@ -782,6 +838,7 @@ static struct configfs_item_operations encoder_item_operations = {
 
 static const struct config_item_type encoder_item_type = {
 	.ct_item_ops	= &encoder_item_operations,
+	.ct_attrs       = encoder_attrs,
 	.ct_owner	= THIS_MODULE,
 };
 

-- 
2.47.0

