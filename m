Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A6BCA17C2A
	for <lists+dri-devel@lfdr.de>; Tue, 21 Jan 2025 11:48:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 264EA10E552;
	Tue, 21 Jan 2025 10:48:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="RQthLFnz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::221])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE3A610E552
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Jan 2025 10:48:16 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 085AA24000C;
 Tue, 21 Jan 2025 10:48:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1737456495;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ChVdaZEBxgvUA4UbVcQXFzc7IvJlOB+v+/6/CwncXu8=;
 b=RQthLFnzuZ8e+Tgvk9/I8tyaxYQvqewuIIvDxRMRmk6F2NkC/u/lbNVz8S+JYK5I6C7tMm
 icYAkdlzJsoAg7ylHNU5bYt4ooATaETSgqtE2KFGg4L+SK5SG+3yVzRN7xkAHYVhmPP4iZ
 DA3Fvt13chBo5+2eD5+HpuVFulsV/lNXGTu4lnO/Tio54ZHBpKgyoP9lebYacAi/ZTKtj0
 AoccI3Fz45eeo9QDfTJTzvZN3JWeMpRaNx6F0h+yflkkBF2ZA+B5kpzDZV0ejP0STBJcDl
 MtoiTVSAidM3hTm2EflT/Bz3EvxbCLd9rPTytwEmw/RY1h2rLFry3fXwnBbdMA==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Tue, 21 Jan 2025 11:48:03 +0100
Subject: [PATCH v16 2/7] drm/vkms: Add range and encoding properties to the
 plane
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250121-yuv-v16-2-a61f95a99432@bootlin.com>
References: <20250121-yuv-v16-0-a61f95a99432@bootlin.com>
In-Reply-To: <20250121-yuv-v16-0-a61f95a99432@bootlin.com>
To: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>, 
 Melissa Wen <melissa.srw@gmail.com>, 
 =?utf-8?q?Ma=C3=ADra_Canal?= <mairacanal@riseup.net>, 
 Haneen Mohammed <hamohammed.sa@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, rdunlap@infradead.org, 
 arthurgrillo@riseup.net, Jonathan Corbet <corbet@lwn.net>, 
 pekka.paalanen@haloniitty.fi, Simona Vetter <simona@ffwll.ch>, 
 Simona Vetter <simona.vetter@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 jeremie.dautheribes@bootlin.com, miquel.raynal@bootlin.com, 
 thomas.petazzoni@bootlin.com, seanpaul@google.com, marcheu@google.com, 
 nicolejadeyee@google.com, linux-doc@vger.kernel.org, 
 Louis Chauvet <louis.chauvet@bootlin.com>, 
 Pekka Paalanen <pekka.paalanen@collabora.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1309;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=HyvmbiXZNdWLvhYkgRwbhVQB9LKmC17XVJjEGeUmRrk=;
 b=owEBbQKS/ZANAwAIASCtLsZbECziAcsmYgBnj3tokVQVD5GXWOr/3Ox9IoTMRNFoxwGbbeNd9
 AmZ8C9NJ/aJAjMEAAEIAB0WIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCZ497aAAKCRAgrS7GWxAs
 4hX8D/9KpZEEsrqXy+CDbqVrUdtazeRN9g4rWXsxUV0R7Uyjn+aI5Oh4dPkyMk7n0C2AKFuGGgD
 nwOpr/XouZIiZPFEbXt2xlOEAI9qHM9PcGk2KbXFeLsRLLQDkiaoL0u71PSzM4VHKx6u4rD9BDg
 VlMN+JQTpyGigKyaqZRrG1vNPEyRCB3Uzv0SCg9TGoEsCCfkGbkmx+I2NQNXVh2VM4IYP7Y2wwP
 7Fyt0c6O8eiK8gXxAfGkVAQdIaezFKgm/VzK4F1xiFuBpW+ovjkrxtw4fkH0fCsQwLf2poEg7LE
 cs7HLHVFX48OCWv2EO00UQOTCHNDMpnlMzMb8j+OwU32ekABmEW89aPtxwLkKJDB/oiCjpL1zB6
 lnaagVT0OZkv7g0bFSEX2yEcEbpir5Do9RAyrs7S1Mn6vovssryd1szkk7wqjFeq34IA0tGu36q
 FipDW8J+4v3u/heESuy0arx9RppDHvt8wzVpDShbAQoVewdGnW4K/WqGQEUKtPw7NpzEstIFuXl
 cD+PFskv9HnaClkSs/r8BPoh0ruPOBCyow5qksS4GDN/E9WldzbzJa6tqsr8/HhdjPuL/aaSu3/
 Gtyuglh27wjkQuWWs0jVePbDCT2ExBIbSFRK9dmpgaWAjMsSRHwGqvLKn0ioGsVMv5brrCllnF4
 G/xENL+sDHZdmYQ==
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
2.47.1

