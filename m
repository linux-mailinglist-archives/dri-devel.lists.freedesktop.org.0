Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AC7128C772F
	for <lists+dri-devel@lfdr.de>; Thu, 16 May 2024 15:06:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6021610ED0D;
	Thu, 16 May 2024 13:06:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="jYLw1Ggj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D1B4C10ED04
 for <dri-devel@lists.freedesktop.org>; Thu, 16 May 2024 13:05:38 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id C5215C0010;
 Thu, 16 May 2024 13:05:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1715864737;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5Rm+coOfyuVkQO9evbSIShb9ufh/OnsJJk+xovmjQ24=;
 b=jYLw1Ggjlsdx4PIWplS+5RI1Beayns2pte8TZwDKAlfz1B7b4kZgf11IvAwLRciibqiZkY
 ALR/4gkWN70KtlY2UPSEnSzdgSP/yhl5PfNIpx4H6qCA3uJj2DE7yHrcGysOrHenJe7Hfg
 lDgxarVLn/FaztsKl0t7jRrjA28kYeZz3dlMc3pOvKHLcCF9wsadIYoqZx33Ixw9XB13q5
 KwYFZ+qM8dOjaS8tpfr3VleLCbsuMsEQCSz82jyd3RgF6KQIIq8SNU4BpToctUDJTCePyV
 ymKCmYJkWn4exfcZq8KPUgVB/ce+aTH9YQ42p1MrGDKHyIxFIemyyG0Q2DQWPA==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Thu, 16 May 2024 15:04:58 +0200
Subject: [PATCH v8 13/17] drm/vkms: Add range and encoding properties to
 the plane
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240516-yuv-v8-13-cf8d6f86430e@bootlin.com>
References: <20240516-yuv-v8-0-cf8d6f86430e@bootlin.com>
In-Reply-To: <20240516-yuv-v8-0-cf8d6f86430e@bootlin.com>
To: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>, 
 Melissa Wen <melissa.srw@gmail.com>, 
 =?utf-8?q?Ma=C3=ADra_Canal?= <mairacanal@riseup.net>, 
 Haneen Mohammed <hamohammed.sa@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, rdunlap@infradead.org, 
 arthurgrillo@riseup.net, Jonathan Corbet <corbet@lwn.net>, 
 pekka.paalanen@haloniitty.fi
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 jeremie.dautheribes@bootlin.com, miquel.raynal@bootlin.com, 
 thomas.petazzoni@bootlin.com, seanpaul@google.com, marcheu@google.com, 
 nicolejadeyee@google.com, Louis Chauvet <louis.chauvet@bootlin.com>, 
 Pekka Paalanen <pekka.paalanen@collabora.com>
X-Mailer: b4 0.14-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1253;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=5x6LmxTgmFsdwCLT6+4+DnviNaQ8VRiCYQVGWxE2tsU=;
 b=owEBbQKS/ZANAwAIASCtLsZbECziAcsmYgBmRgSCrMaPJppa5EXf89c+jUw1u+WXXHm5Jkbq7
 5e4U5RCh5iJAjMEAAEIAB0WIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCZkYEggAKCRAgrS7GWxAs
 4soMD/928uGLMwM5rThI8JlEfUt8F724voCt1x0BpitIhER72gb60gFxN42ERkAe7rjzXWcn2IK
 JM1deQlOLeOgwynHpxVbQy2AMbrti59i/59d8od+E/uepyM9r0N9/+J/7B5KEJrFMC+r/ijl1U6
 4RcgnUFE0DM6JbIP8vFuEyVlPJb7DQUMezNm5uHfzkQ5ucBitDtjwrjG0bc9M489aDV5DQLKQri
 uCCeSEMQ3gQbQC54tbHxUUeq2R8Uapy2vODc5IokJkdStcOaJoRqlwJwK8AvIkYspJS7kdSH9KL
 dYQ69tGx5OaqLutyyuw+PV6cAOriRuiuzyzUteHyePH+u5M5DG5CccMEqaB/jKiZ6x+7XTJwWbk
 C9Qc7FkN2E3/n7K15RZF5nxZxOKhxa1a0tKk0vd0ZEXUilmAwbZJae3rqEDR7tKv9+T3hOLpl8a
 d8hNBxp2CZwz6ss51+dhlmcS5Y2qZVStIT9/2YmGZq1spV5Fm3SVacaPk5k+m2z7qH/G84y98re
 Kb8nHS3VtUmSkWru1nzSe+yyh6sAfwniSYiyIhI4chlffGouN2C2G0NSSZogfFyBHaFWQfZFOuF
 l5Pj0pXSdj58novlujFPeABhOclk+AhMmADukTRYasrGszVFCfuYjuq8ibEfZIGHHiDWxfLoXDT
 ds4Rl3YK2FaNOrA==
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

From: Arthur Grillo <arthurgrillo@riseup.net>

Now that the driver internally handles these quantization ranges and YUV
encoding matrices, expose the UAPI for setting them.

Signed-off-by: Arthur Grillo <arthurgrillo@riseup.net>
[Louis Chauvet: retained only relevant parts, updated the commit message]
Acked-by: Pekka Paalanen <pekka.paalanen@collabora.com>
Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
 drivers/gpu/drm/vkms/vkms_plane.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/gpu/drm/vkms/vkms_plane.c b/drivers/gpu/drm/vkms/vkms_plane.c
index d4e375913122..8f764a108b00 100644
--- a/drivers/gpu/drm/vkms/vkms_plane.c
+++ b/drivers/gpu/drm/vkms/vkms_plane.c
@@ -218,5 +218,14 @@ struct vkms_plane *vkms_plane_init(struct vkms_device *vkmsdev,
 	drm_plane_create_rotation_property(&plane->base, DRM_MODE_ROTATE_0,
 					   DRM_MODE_ROTATE_MASK | DRM_MODE_REFLECT_MASK);
 
+	drm_plane_create_color_properties(&plane->base,
+					  BIT(DRM_COLOR_YCBCR_BT601) |
+					  BIT(DRM_COLOR_YCBCR_BT709) |
+					  BIT(DRM_COLOR_YCBCR_BT2020),
+					  BIT(DRM_COLOR_YCBCR_LIMITED_RANGE) |
+					  BIT(DRM_COLOR_YCBCR_FULL_RANGE),
+					  DRM_COLOR_YCBCR_BT601,
+					  DRM_COLOR_YCBCR_FULL_RANGE);
+
 	return plane;
 }

-- 
2.43.2

