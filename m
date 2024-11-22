Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DBED99D62D8
	for <lists+dri-devel@lfdr.de>; Fri, 22 Nov 2024 18:20:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EEC1B10EC1F;
	Fri, 22 Nov 2024 17:20:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="i2yKyxRN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A5A710EC1D
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Nov 2024 17:20:23 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 363CF1C0008;
 Fri, 22 Nov 2024 17:20:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1732296022;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LVbsawSCI+cNQQUSUvFQ3M/hXSyx3BQzl3u4EwEAYsM=;
 b=i2yKyxRNkA8zlgpt4Vx9R5HYP124E8d8qOwRY9DJj3oX4TBsdPQOQWuM5SZTtBEpVKWXCR
 DN5MAFz+KUCJM/mim1hb2C5EwABjyiy2mHwIaJlQd3BjAQURiJUGmilHnZxv1plyhG8qQD
 YmPwDPRolcBpaTwFvooSPrfCNSiNyxZjO78MyyOJaOstJRFFsgIvzoTwRJWy+YH1dx4Q2E
 7ZHUFHokQWEQ1dvWuB7uobKoiK0cmw/Ghxypc76fJq1NvGL7FImUppPRKcGBYkAKMMGJ8T
 oyN1oVAkwNhvQSrBTZGvZqbx1K/EkLWWpC1MIWKD3VbcuQnJwrJBQX+yer2ZuQ==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Fri, 22 Nov 2024 18:20:06 +0100
Subject: [PATCH RFC v2 02/18] drm/vkms: Add a validation function for vkms
 configuration
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241122-google-remove-crtc-index-from-parameter-v2-2-81540742535a@bootlin.com>
References: <20241122-google-remove-crtc-index-from-parameter-v2-0-81540742535a@bootlin.com>
In-Reply-To: <20241122-google-remove-crtc-index-from-parameter-v2-0-81540742535a@bootlin.com>
To: =?utf-8?q?Ma=C3=ADra_Canal?= <mairacanal@riseup.net>, 
 Haneen Mohammed <hamohammed.sa@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Melissa Wen <melissa.srw@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>
Cc: arthurgrillo@riseup.net, jeremie.dautheribes@bootlin.com, 
 miquel.raynal@bootlin.com, thomas.petazzoni@bootlin.com, 
 seanpaul@google.com, nicolejadeyee@google.com, linux-kernel@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, Louis Chauvet <louis.chauvet@bootlin.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1917;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=O3J5NrNzQvmEMPf1LtkrT4Rjj+8JjoV8IYUZ6CL3lbA=;
 b=owEBbQKS/ZANAwAIASCtLsZbECziAcsmYgBnQL1MnCxUSxlqHgS2+RV+OlFmTNtbD4x5DjcG2
 CHAzu9HNz2JAjMEAAEIAB0WIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCZ0C9TAAKCRAgrS7GWxAs
 4sIcD/47MVc2OXG42yiTwonKS1y4FWPhPH2tqUeYs6tc9adNIDB6yxBSOAk3okR6Y351kiT6ftx
 ILcIrn0nsd1/LwCPusB6srTwSwR89iubAlka4IAkhkpSy3xYKYgB0H5vvkbjaPLcu0Ld3IQkr1E
 hQRakfEXiFWZxioqcOfxKnbxYzCc1jrS170TPwbFrCCFIGSKSHNAftA4TsD2n1kQCUt6qCoucKT
 jAGC8Xoi95FFJLeRzbuVJaWd3xG8SXco38vJ3JOieYkCKV/66F/ictu8m7GwYEv9LiC+LRSvIQy
 VPLTGX3ilRRkvhYjmpjFVfas3fHTV7jr6pGRQ+Id6x7VYOGlV3pQyCtbXybMHQkietb0HAJyU12
 2hazC5R7qKzbVIUGAqtxAdbn517gSGvjGpmJ4yDzphT++4pVx8QjRsCKu+yiX5Ldtyjfyo7SwP8
 OVnfBnNimOH1tvskjVpvnYVNpfVNiID6J8jPb79C0ll77mnnHcBb13o7Blj/zzP2BNc1uH8A9W3
 FEVfJCQzW3hVRyLf3BDJolPGsok7bmS5VDu6RmdvzrjFIE8xGGEGNJzknAMotqoPgnqW4vFQUGk
 R23l8PqO/uF3F8TKmSUJtg7I4iFIjQxTDsk1WBoSKe+buaesLy9F2vFaGxjon4e28NWJ+C9QlIb
 Zuggc+RP2dS4Osg==
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

As the configuration will be used by userspace, add a validator to avoid
creating a broken DRM device

Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
 drivers/gpu/drm/vkms/vkms_config.c |  6 ++++++
 drivers/gpu/drm/vkms/vkms_config.h | 13 +++++++++++++
 2 files changed, 19 insertions(+)

diff --git a/drivers/gpu/drm/vkms/vkms_config.c b/drivers/gpu/drm/vkms/vkms_config.c
index 76355174a6ca54b880218c2bd458c8339a3dabaa..8d5c1429e6e196ef46c95c6ae73330bc4be2be39 100644
--- a/drivers/gpu/drm/vkms/vkms_config.c
+++ b/drivers/gpu/drm/vkms/vkms_config.c
@@ -24,6 +24,12 @@ void vkms_config_destroy(struct vkms_config *config)
 }
 EXPORT_SYMBOL_IF_KUNIT(vkms_config_destroy);
 
+bool vkms_config_is_valid(struct vkms_config *config)
+{
+	return true;
+}
+EXPORT_SYMBOL_IF_KUNIT(vkms_config_is_valid);
+
 static int vkms_config_show(struct seq_file *m, void *data)
 {
 	struct drm_debugfs_entry *entry = m->private;
diff --git a/drivers/gpu/drm/vkms/vkms_config.h b/drivers/gpu/drm/vkms/vkms_config.h
index b284831738743f6d7c452be03f917a7d3975d173..df571dd67352ca90fb47bd937fb9f11ceb95fcb2 100644
--- a/drivers/gpu/drm/vkms/vkms_config.h
+++ b/drivers/gpu/drm/vkms/vkms_config.h
@@ -29,4 +29,17 @@ void vkms_config_register_debugfs(struct vkms_device *vkms_device);
 struct vkms_config *vkms_config_create(void);
 void vkms_config_destroy(struct vkms_config *config);
 
+/**
+ * vkms_config_is_valid() - Validate a configuration
+ *
+ * Check if all the property defined in the configuration are valids. This will return false for
+ * example if:
+ * - no or many primary planes are present;
+ * - the default rotation of a plane is not in its supported rotation;
+ * - a CRTC don't have any encoder...
+ *
+ * @vkms_config: Configuration to validate
+ */
+bool vkms_config_is_valid(struct vkms_config *vkms_config);
+
 #endif //_VKMS_CONFIG_H

-- 
2.47.0

