Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 319BCA17FF8
	for <lists+dri-devel@lfdr.de>; Tue, 21 Jan 2025 15:38:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EAC8310E5D0;
	Tue, 21 Jan 2025 14:38:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="SXl+6qU4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::226])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 812F310E1F7
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Jan 2025 14:38:00 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 428A3C0004;
 Tue, 21 Jan 2025 14:37:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1737470279;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Kaj2PyzhoEIxwt/S/91A3XIhtvN9PQbzTybix3SaXcU=;
 b=SXl+6qU4/z2eH9MifpyOT5SE6MhXy4ymdVZ3RjcLUyLjizLJAjIqXenoECxuStk167TVV/
 sRx1ynf7GlWKAIJOsh8L4fbS4Qk3GTeuSZVhWAC2RZziPHolwBW6irNtt2W2q4njLu6+Ro
 Yc+2BE64EGvWc+zBMNtUfi3bMf3AFpYzzu6BOCf22n2CQ1lf4sz43rHvRhyYE2iOwo5NWO
 kSpDg82v2lftzm1icDSzrf6ksgsGAM5hR3gZTPRwN7Lmct8fbda6S4qVoQ3D2tPEdUQep4
 HhT+UZn3Ao5AZOWMnOPX2T+8iVRSGeetY/Fn8lX18T1IKdDUkoSFBffQ+nboRA==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Tue, 21 Jan 2025 15:34:45 +0100
Subject: [PATCH RFC v3 01/14] drm/vkms: Add vkms_delete/create_device
 helper
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250121-google-config-fs-v3-1-8154a6945142@bootlin.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1619;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=aKOGcFK92jCXXJZJ34r4ytIeQ4w1Xb8LDJmZmr/WMq0=;
 b=owEBbQKS/ZANAwAIASCtLsZbECziAcsmYgBnj7E/wd6Eqj/Edmitu3yXmSZrEses51e+aE56t
 9KdPFnZdr6JAjMEAAEIAB0WIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCZ4+xPwAKCRAgrS7GWxAs
 4v/RD/0THFZfy4jFDSzocbzsmDlfDscdmaVThix5m6PCN0bNWk/QFdCHBgiLHQK8ui7jQ2yFxw4
 DclePhDdxoRoPxMppLAuORAoplO2VW7G/mAQbxHYr71Z+MakfYQYwNLjWe9Vws/fPVOE4ucZvjr
 1qL5sRmsL33ehGCfE18f4b4TVKFuWiwroOAohPaldKQAAp7yPUD6/Y7ompwdex+RbhSuRz7cvu8
 gfc7nC8NKxw8PlnbowCd0Yd3gKAXFU611WylPgoEP7Jg9wiUThSrcMy1Pu4d3tQEkqEp+RYXybc
 THt7x4JnQMUSWoBsZdttSvakByFuGkD0JjJCaVfPNIHMkTKeyKQsCDulD3AUBC/ahI89pbs+MQV
 kXPVIeok3s7UZoWabYF9/xPBOKvcEKvLfNBSOjEEJBICOt6HSjHo3ZAKBGzuzeAG4f5Ne/KPf4K
 Y2PgbRSfDhyf/lIaOBcDSRK5liSw2+obdc+05MmyjljQXe2WM089DkOvMcu/kR3tfUiR4hQ3SG6
 exGbNgHcRzjfYJP8pM90YwkXZyxawVbQyMMkQO/VkKgGpbVGwGIx6htfPBgAZWV8ditrOVPZXGw
 lrO9nSzzSsCMmXWJkz3lC2j9SjUhWKFEI8PwzGviwXX7x3hI7isq7Ifyt48MEzvxWQYzPccrvA1
 R1OOnZc8pdFVU3g==
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
index 95fde2fbd711fe52a3a3b5a55778f5bc2029beb7..5f1958d59cc4c3102352599eee7a8e139fbb899c 100644
--- a/drivers/gpu/drm/vkms/vkms_drv.c
+++ b/drivers/gpu/drm/vkms/vkms_drv.c
@@ -150,7 +150,7 @@ static int vkms_modeset_init(struct vkms_device *vkmsdev)
 	return vkms_output_init(vkmsdev);
 }
 
-static int vkms_create(struct vkms_config *config)
+int vkms_create(struct vkms_config *config)
 {
 	int ret;
 	struct platform_device *pdev;
@@ -224,7 +224,7 @@ static int __init vkms_init(void)
 	return ret;
 }
 
-static void vkms_destroy(struct vkms_config *config)
+void vkms_destroy(struct vkms_config *config)
 {
 	struct platform_device *pdev;
 
diff --git a/drivers/gpu/drm/vkms/vkms_drv.h b/drivers/gpu/drm/vkms/vkms_drv.h
index 3a211cdb41bd1003366d9eaa1425e122d885e4a4..28d8c36d1de28aeda4daea7a30db969bc7943d65 100644
--- a/drivers/gpu/drm/vkms/vkms_drv.h
+++ b/drivers/gpu/drm/vkms/vkms_drv.h
@@ -208,6 +208,9 @@ struct vkms_device {
 	const struct vkms_config *config;
 };
 
+int vkms_create(struct vkms_config *config);
+void vkms_destroy(struct vkms_config *config);
+
 /*
  * The following helpers are used to convert a member of a struct into its parent.
  */

-- 
2.47.1

