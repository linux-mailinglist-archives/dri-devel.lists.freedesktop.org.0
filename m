Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6798EA17C5D
	for <lists+dri-devel@lfdr.de>; Tue, 21 Jan 2025 11:55:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6EF8910E564;
	Tue, 21 Jan 2025 10:55:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="CvHhwFQ8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::222])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 09D0910E560
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Jan 2025 10:55:37 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 06E6940004;
 Tue, 21 Jan 2025 10:55:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1737456936;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=W86h+/A1r0cJ9xJo5orIgxe7yVfofGkp//jbkB7pOdY=;
 b=CvHhwFQ8IhKkuH54OCA0UmIPkSv0YmixipS8YZkLX6+bBqKsDiWkZc7hmyPZ04NiPFRxEm
 IdFDPfBOI/3dFAhUbkdwvmKDCTxhmZlmQVW5atdyClRSJpGdkJqpUcRwLY+o/48obBIDcY
 WrjP838DRYLMafn0sLxhcyc6TOGv4E79T8Lp/tV6YKTbwiAG0cXM+4P9dcE3vr6/rx1AZz
 WTSJGzQtDjgy0xTtoXQ7ap2veWs2sdsD9XqNDxlbBxNOcsivh/gOLYq6JvskehZ+ZVcVn/
 p9T+3qroB9ChspkoySoGTxhv+v0BL2lWyRH3IkKbBK9pw+xetvM8YXwdM0ZVng==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Tue, 21 Jan 2025 11:55:26 +0100
Subject: [PATCH v3 02/16] drm/vkms: Add a validation function for vkms
 configuration
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250121-google-remove-crtc-index-from-parameter-v3-2-cac00a3c3544@bootlin.com>
References: <20250121-google-remove-crtc-index-from-parameter-v3-0-cac00a3c3544@bootlin.com>
In-Reply-To: <20250121-google-remove-crtc-index-from-parameter-v3-0-cac00a3c3544@bootlin.com>
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
 bh=GzP6lw0znHG7/h4ORxGII88qWMwWVl3of4Ml1+pfkbs=;
 b=owEBbQKS/ZANAwAIASCtLsZbECziAcsmYgBnj30gBsz2xuZl79HQIoPEKNngLva+g6jikqMvA
 waCE0ZohGuJAjMEAAEIAB0WIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCZ499IAAKCRAgrS7GWxAs
 4iJUEACMgQy2eaWZOPpfAXofkQ+sj1bIW1juq2Vj4XfLOLcCFuUEi1zc5P9agQ4BYSj6OpWH4Tz
 xrQpHcYE1u2IjslnZ8Zx1FLCDq975N84sw3CYh/b37trNfzZg6m36uIuuQQkSxTJUmqxkKbHQ2M
 rpkww5vZmIFx8VtOwifbSjJ0cYB4nSEcE0PYlail/jjzJ7uB39iEFWaY8AGsXvtEsCJtswQZQjI
 cw3Mytd0edh2pWtStu/xLuvorhHjkQrA8SQbNHEuOgfH+S94CnR8d0ApvXSUotWCwKhPduo6j1w
 V7vKLlUbEcOusPhLvUXGq+WJU+g6EOnbHLHaG1Jncti7yxnRLrdz3uMFSc8OQIQ+/vrmiyheSvB
 cOiatRwGotkTXnB9TzNQoMLq6v59XKrgjZSDH8aP1r/SFgMdHlNYARVzBxcpn8YYxHTSE16vRYI
 IpTTnSCKlY2sjTmfnNRXMryaIXxrpokOavQ5FmQsPiuTUB95oJ06cpMB3uO3Ar8aA9e3kKb+Q6C
 P8lXPPtadhH0EPGEXRKhW4mCAgjRxX9fQKU+0xlEzj4c7LDC7Dh0KCAkr4XXsel52swnXsVdMDa
 fFRaFx5RnMi4UPXaNBcgNAn6lClXQWpFFt+R6aBR+QrRjGlzVxKvaSJ8VHI5AGfA7GDOY2I4yDV
 myQ6mZb40buluVw==
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
2.47.1

