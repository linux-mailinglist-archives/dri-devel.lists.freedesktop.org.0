Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EB559D61CB
	for <lists+dri-devel@lfdr.de>; Fri, 22 Nov 2024 17:15:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B2D610EBEC;
	Fri, 22 Nov 2024 16:15:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="TzJ0wrK6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF41010EBEA
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Nov 2024 16:15:10 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 333C61C0003;
 Fri, 22 Nov 2024 16:15:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1732292109;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+pwLDbgu9jtYV4f1M50fqXd9jWC2o3HSRBRiNLxp+j4=;
 b=TzJ0wrK6XmrRm3xGQDt9lgl0Yxh/jQfnuNaJCoTBltvu+C0eoKLKGoZx1B+nHR0mxizAri
 yXmwySkLzCPWwzlx492l55Y1A+K/MJlS7QU+oS3Y+ApwtA7V61lyUTNvnNrFKAMYsQfC68
 X1xgxT6fdEhuWv2Ch4Q2+B4h6QDCE1+XgIAZ1suAbiqIpvho81hSyPl73k3LLp2Zefc13E
 kxp/NizTiUp+QXfUUsorIgWSwqGVVbLN/PB6lN61WNmiwgR89fh/wS3jGmVcBOXrROCMje
 P6Ab9CF6rpb4iaY7/T+6AGBp9e/XVtJXczjFVSCPcPHUmy3V4ld20rNR4F3EGQ==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Fri, 22 Nov 2024 17:15:02 +0100
Subject: [PATCH v14 2/7] drm/vkms: Add range and encoding properties to the
 plane
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241122-yuv-v14-2-e66d83d28d0c@bootlin.com>
References: <20241122-yuv-v14-0-e66d83d28d0c@bootlin.com>
In-Reply-To: <20241122-yuv-v14-0-e66d83d28d0c@bootlin.com>
To: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>, 
 Melissa Wen <melissa.srw@gmail.com>, 
 =?utf-8?q?Ma=C3=ADra_Canal?= <mairacanal@riseup.net>, 
 Haneen Mohammed <hamohammed.sa@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, rdunlap@infradead.org, 
 arthurgrillo@riseup.net, Jonathan Corbet <corbet@lwn.net>, 
 pekka.paalanen@haloniitty.fi, Simona Vetter <simona.vetter@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 jeremie.dautheribes@bootlin.com, miquel.raynal@bootlin.com, 
 thomas.petazzoni@bootlin.com, seanpaul@google.com, marcheu@google.com, 
 nicolejadeyee@google.com, Louis Chauvet <louis.chauvet@bootlin.com>, 
 Pekka Paalanen <pekka.paalanen@collabora.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1309;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=3qxUodTpFhGEQUZhya3OvUZpOZdhecRKqdRQipLiUwM=;
 b=owEBbQKS/ZANAwAIASCtLsZbECziAcsmYgBnQK4HddvcCxD1JVvtGNXQIdg92GB/lL0+bPGxI
 PactfCnFM6JAjMEAAEIAB0WIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCZ0CuBwAKCRAgrS7GWxAs
 4qi6D/9Pq1Gwe3AULloaYgUUWkL35YnHFCLjXE7TldWGRaM7cbjzFCFnlnlhFOAif6NGstI6wRc
 iKx7kui82YyJmIZzolzXn/3aqqpY0dHnavHa9QsLSRa0Doq80QhzK8NcrTD6O9LyVKtgp9PnO8A
 SdPHrPRz+8kICVkKU9sTAephIO4xiZAGuYpEef6t0WLQnB/dSvc1ee1zLpURSI0ONCAfVNV5G0m
 1w4IvA/1NeWGPd4dBHNjxQU0lmpxFi5rKl+Tpaj2WNCACEVsyNdQvHFEoD3iekmcXrmbCGT/IDK
 uyOVgh1tg04qCi1bd4PL8nWQAvNEPIjlxV+xQjouudVF9C54ESIW1F2o/nQlcip/r/jgWx0nSyH
 HZd2Na25+hPhR9NnEZ7nZ9nmjMMY9nIz4NtSy5Sr56uewe8GpYReVtUEM3YYJ1XbEpj/wrL/JUP
 ooqWvqCq8N/1engWdnkEdnzsK5NXQ9MjUxdGtWACewq4sEtD/q1UnTK3Q6nGEgeXV65I572QIMp
 TOAjbVfyykrcNM5/F90xseeSJt1aSmAbN+/qm7vEV6fFU4ESHKyL5eF1y9gh2ePQz1LhtTrebUk
 52kWX3gbarppOMizNxmIm855y5xXc4cDLldVRxjLqqLitwX0pXYz46dS94sDuTwpGUozDJcYsSg
 RYdTaqwYAOV57lQ==
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
index 10e032e146f093d0fd99a82c7b58d62a0d987fd7..e6ca8f2db32d92068ddba7eed92cfae0d28cd45f 100644
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
2.47.0

