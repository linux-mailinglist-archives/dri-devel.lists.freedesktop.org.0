Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 883159D6348
	for <lists+dri-devel@lfdr.de>; Fri, 22 Nov 2024 18:39:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0678310EC29;
	Fri, 22 Nov 2024 17:39:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="TvYfvOqT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB90D10E1DD
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Nov 2024 17:38:58 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 5CBD2C0005;
 Fri, 22 Nov 2024 17:38:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1732297137;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FBkM1WMn2Ucut+MxptAqo72bzc6IetcnqSt6Z29iw1I=;
 b=TvYfvOqT+LpCytteXXJNt06lkYZbEGRUjKc6UmCPnhs+aOtDAtaJgE/fYIMhBi3i7ULsDm
 OOXicL7vllKFSf0pD8bsOsFzaYxgUvwYWIqQpkkwgVIefd/0bYUfd4WW35StebJIzdAp1C
 qpiwoJcV2W6+zKuuGv87zHPLjZz/Vf6geyNPAq2rIRPnCPcOX6pQ4i1JKuCd+qSAYBWWuj
 oFJKivG0cca+5mUXtZPPWisZYNjV47UptCNNcaFFp+VlgA8lQ8tx3ZtWDg6xdx3zqPjt00
 899n7yTUXkLlZh0oFkDRJ7iiCh1TOlWBkxqfmHSEMBxoZ5OrLwM2E3Q5lE7O8g==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Fri, 22 Nov 2024 18:38:27 +0100
Subject: [PATCH RFC v2 01/16] drm/vkms: Add vkms_delete/create_device
 helper
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241122-google-config-fs-v2-1-4b7e6f183320@bootlin.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1619;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=arFPfBvkyojFw2UpPJF4s2GkOllumMgZfpsQfgBfcuE=;
 b=owEBbQKS/ZANAwAIASCtLsZbECziAcsmYgBnQMGpCQj8Jt9fbd6PpIlfJ2MZdP1Sg5XKYX29J
 OQFgYT93d2JAjMEAAEIAB0WIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCZ0DBqQAKCRAgrS7GWxAs
 4obYEACwzMhDfuO1In8gQEcRttWndvFngdxSb4RmW7W/ZRR9C7+qpQpyBErmwQ2RRllmXBVsFmG
 cINoA29G4KxnR/V6J2Ve8GDjFxnid5EnbnVQbbExbUSQlxv7W88KpU7cEPfRkvmlLz4fvETSMeN
 eUI+Wo7yxdDm1W2qHbK6hVKZ5E9s82X0+qruP54DWzUOsv10FrzkFYqkJ0YUb8w2VQAp7DDr6Zb
 uXs6tsyT6jgDYCRvVlA+46FhbTocRI5MMJA84jj4F5vLhvrlO1GjpPWxRejQ6FBuWutuiNfUVLM
 ornYXmJhWxkR41w+TIlXYuWDlLzd0LLcbQp7c2UeCpq7AYzjN9tykHDZOzufR+jRFlTaw1e9NJa
 GkuIvNkoaiOLr75xnJr4GQRe2865VET7FDM3FCNigHCP02sJBocQR6/fD8/BbjdoJkPBkm1x7Gg
 foAf0k+pVtVk4LBVBhUcVvD5G7aEJ7VMwDwEYYskIrqHtpvS8I856vACGfDdqWjdvmqfl/CM2xE
 eHSvdrpwFGYhT6KwdqMbp18lVMWyRF4/XE8xTSTIa/KdlUW3Q7wkiU4COpznfD5YnyaVsgsAMK3
 os1zOraueJOhRnUdTa48fYExpEFdZ1jv1/liOnnHurbj76C7s6z3x7HxEM8o1v5iq1JjBgNGutN
 E1AkicuK+SaDTLg==
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

In preparation for introduction of ConfigFS support, expose the
vkms_destroy/create helper to remove a vkms device.

Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
 drivers/gpu/drm/vkms/vkms_drv.c | 4 ++--
 drivers/gpu/drm/vkms/vkms_drv.h | 3 +++
 2 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/vkms/vkms_drv.c b/drivers/gpu/drm/vkms/vkms_drv.c
index eb6fd570b4549639f6818ff63fb334f2a461b23d..2db393f5782eb26a5aa469a4774b2e19c886ee7e 100644
--- a/drivers/gpu/drm/vkms/vkms_drv.c
+++ b/drivers/gpu/drm/vkms/vkms_drv.c
@@ -152,7 +152,7 @@ static int vkms_modeset_init(struct vkms_device *vkmsdev)
 	return vkms_output_init(vkmsdev);
 }
 
-static int vkms_create(struct vkms_config *config)
+int vkms_create(struct vkms_config *config)
 {
 	int ret;
 	struct platform_device *pdev;
@@ -226,7 +226,7 @@ static int __init vkms_init(void)
 	return ret;
 }
 
-static void vkms_destroy(struct vkms_config *config)
+void vkms_destroy(struct vkms_config *config)
 {
 	struct platform_device *pdev;
 
diff --git a/drivers/gpu/drm/vkms/vkms_drv.h b/drivers/gpu/drm/vkms/vkms_drv.h
index a772bf4168e11730c6ee2e3c79abce3a6351203f..5521d59f775170d828dea734b4ed3d177debdd0d 100644
--- a/drivers/gpu/drm/vkms/vkms_drv.h
+++ b/drivers/gpu/drm/vkms/vkms_drv.h
@@ -231,6 +231,9 @@ struct vkms_device {
 	const struct vkms_config *config;
 };
 
+int vkms_create(struct vkms_config *config);
+void vkms_destroy(struct vkms_config *config);
+
 /*
  * The following helpers are used to convert a member of a struct into its parent.
  */

-- 
2.47.0

