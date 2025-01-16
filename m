Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AF8C4A14132
	for <lists+dri-devel@lfdr.de>; Thu, 16 Jan 2025 18:50:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E35E110E9FD;
	Thu, 16 Jan 2025 17:50:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="YbWbU+LB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E3B7910E9F7
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Jan 2025 17:50:26 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id BBD7760003;
 Thu, 16 Jan 2025 17:50:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1737049825;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=C55lE0ZX4SLEBnGzIQ+kPoz6hSe2chdNlu0VIsQzufs=;
 b=YbWbU+LBmv5Wk1wSbPn/SNoqwwF7VHHvD0b52KGEspIvmBSx9oUzdIzuBkuLjsSo1fCU+w
 CzqZBSxC65GWsYF2mnRs7Un/IwSOJ5CWjyj90PFQz6WZsLOcMHamNCe6TYKHYKJ7OeZPH9
 0UtBKB2CX4F0kMVSW+ZlIrqIkP+f/6vPtVQwCzbLYXZqTE5k4UJizSwyKwbxFOyik6WiMm
 4erWegVILKnE9aAOQyVcBEHGJJIJLggr9EPZvkIsivtvyafHx0DsQDZ3gfqx4y/Fxk6zRj
 k/0tdDiYs0TQjWlmmCiR1kAHUZJz6ACDGuddgFlwfkOXWemslmTWamj6T06Q4g==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Thu, 16 Jan 2025 18:47:15 +0100
Subject: [PATCH v9 3/8] drm/managed: Add DRM-managed
 alloc_ordered_workqueue
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250116-google-vkms-managed-v9-3-3e4ae1bd05a0@bootlin.com>
References: <20250116-google-vkms-managed-v9-0-3e4ae1bd05a0@bootlin.com>
In-Reply-To: <20250116-google-vkms-managed-v9-0-3e4ae1bd05a0@bootlin.com>
To: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>, 
 Melissa Wen <melissa.srw@gmail.com>, 
 =?utf-8?q?Ma=C3=ADra_Canal?= <mairacanal@riseup.net>, 
 Haneen Mohammed <hamohammed.sa@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Simona Vetter <simona.vetter@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, arthurgrillo@riseup.net, 
 linux-kernel@vger.kernel.org, jeremie.dautheribes@bootlin.com, 
 miquel.raynal@bootlin.com, thomas.petazzoni@bootlin.com, 
 seanpaul@google.com, nicolejadeyee@google.com, 
 Louis Chauvet <louis.chauvet@bootlin.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1874;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=LCLwmCM9c7LwCX1PNAjtkYs3KXzru4Sc/zivj1tkBlM=;
 b=owEBbQKS/ZANAwAIASCtLsZbECziAcsmYgBniUbal7Q1fP6gFFM71jVzOhnCkb03sJkY/yDV/
 65FNMz3dOuJAjMEAAEIAB0WIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCZ4lG2gAKCRAgrS7GWxAs
 4poCEADRNvwy6l1heqN4VSEF9s73+cfQQqHAH7wjmXCJoVvxa6SeLc0353ZznO4GoV/rDAYOGGp
 lc8su3afg9FQWE+EHnH+6KzXtlt11UgibNshjeO2h4BlCZbfa5QNuXZbXKP65z9RoGhvUM3LEEE
 ZBiTqToxC2vLIvKVlq7wUzpPyphfxWFYICoCkv1Qiy7TUz2FhgCNbaHXqYoCr/xSDZoxCZ0AaAg
 VRJmyrcLBl+BCDoO0KFMaQdrxAirSkdppA7DBSNt04+R2PVaRm/GgLOrEfU5HW6koT7ovWPhAbw
 G/rehKRAetKae3JtiMIOwHk/MLqYKzoMjh/vPQ+qtF2LfnIAZw+URqlmyevMid69Yi/8Av7QXES
 olKVYMlJYtkkgwqz3tIVdL4C4PkMKU77ZftLjfJol7Hlo48A+2vlaXUGoySoOS6iyLYTfyJJGBn
 e+d//v0egPnXa1+RhnCmOtN3Esak2jHN5ushhv7Mj2Yi/8Ov7RrRG7P+Q/sxqwMk6SwEoMyOkRu
 PTfLeo3f1lRxr9PDY0iqbv+xF2poQa9u9X6atB1Mc+4mytLJSzHcm9kwS4cv4wHMGbkMzHeI5mT
 AGO3PZWhuCNcBLjeNTBjNgWzmIUA3fZakQpVgcxMZdUPBO1/xoveIi8SJloUg8VA3EMf78efFwX
 khDmNRKLa3267qQ==
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

Add drmm_alloc_ordered_workqueue(), a helper that provides managed ordered
workqueue cleanup. The workqueue will be destroyed with the final
reference of the DRM device.

Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>
Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
 drivers/gpu/drm/drm_managed.c |  8 ++++++++
 include/drm/drm_managed.h     | 12 ++++++++++++
 2 files changed, 20 insertions(+)

diff --git a/drivers/gpu/drm/drm_managed.c b/drivers/gpu/drm/drm_managed.c
index 79ce86a5bd67a7201f5d60550a12364f2628e0ec..cc4c463daae7ca44914d3468457a22574cdd0a54 100644
--- a/drivers/gpu/drm/drm_managed.c
+++ b/drivers/gpu/drm/drm_managed.c
@@ -310,3 +310,11 @@ void __drmm_mutex_release(struct drm_device *dev, void *res)
 	mutex_destroy(lock);
 }
 EXPORT_SYMBOL(__drmm_mutex_release);
+
+void __drmm_workqueue_release(struct drm_device *device, void *res)
+{
+	struct workqueue_struct *wq = res;
+
+	destroy_workqueue(wq);
+}
+EXPORT_SYMBOL(__drmm_workqueue_release);
diff --git a/include/drm/drm_managed.h b/include/drm/drm_managed.h
index f547b09ca0239dd7c4fb734038bae4438321395c..53017cc609ac617283e3be70cb5759908b049c4d 100644
--- a/include/drm/drm_managed.h
+++ b/include/drm/drm_managed.h
@@ -127,4 +127,16 @@ void __drmm_mutex_release(struct drm_device *dev, void *res);
 	drmm_add_action_or_reset(dev, __drmm_mutex_release, lock);	     \
 })									     \
 
+void __drmm_workqueue_release(struct drm_device *device, void *wq);
+
+#define drmm_alloc_ordered_workqueue(dev, fmt, flags, args...)					\
+	({											\
+		struct workqueue_struct *wq = alloc_ordered_workqueue(fmt, flags, ##args);	\
+		wq ? ({										\
+			int ret = drmm_add_action_or_reset(dev, __drmm_workqueue_release, wq);	\
+			ret ? ERR_PTR(ret) : wq;						\
+		}) :										\
+			wq;									\
+	})
+
 #endif

-- 
2.47.1

