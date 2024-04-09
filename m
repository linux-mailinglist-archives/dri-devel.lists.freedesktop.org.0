Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B18489DA2C
	for <lists+dri-devel@lfdr.de>; Tue,  9 Apr 2024 15:26:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B12D9112DA1;
	Tue,  9 Apr 2024 13:26:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="NPTZ89v1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4423D112DA0
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Apr 2024 13:26:00 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 04C8A240021;
 Tue,  9 Apr 2024 13:25:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1712669159;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=iNNUCkQ2cyInliwCdgtDUyF4TqooA01tBHRW2ik0cvU=;
 b=NPTZ89v1+tWlV0wBp7IVsyIjxuWwvi6XhNCIcMudsLJCInU7qots5PYo5YcPIykBUdElCc
 8ctRbFVXlWN4PSoM3XvfrUveVnGGdY92s/keEVnsWCh8Www3BUnmfCnjtgNQewOfQ4ItK5
 ySUgxaY7i3vSU6QJVNIM6RurY6wKrdqC2fQleGgMOW2Z1oe+LxkfrmMhUc9wZG6fHC0MBI
 m2Zsz7Qc59Tz72LiS7Iq7pqbF+PJ3e5mvcZuPQ+rdMncukvuDFKU7q/XWIY6w7d6er7kfO
 vvXCozJd5bV7xKPwq1LmgXLYQIrREBe7lLUYV4cBYsApaIaBlBFcHO7zued5sQ==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Tue, 09 Apr 2024 15:25:31 +0200
Subject: [PATCH v6 13/17] drm/vkms: Add range and encoding properties to
 the plane
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240409-yuv-v6-13-de1c5728fd70@bootlin.com>
References: <20240409-yuv-v6-0-de1c5728fd70@bootlin.com>
In-Reply-To: <20240409-yuv-v6-0-de1c5728fd70@bootlin.com>
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
 nicolejadeyee@google.com, Louis Chauvet <louis.chauvet@bootlin.com>
X-Mailer: b4 0.14-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1804;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=GuIKbTcZM/N7g93eJKZQXArSIEda7yyerndYbXPpZc8=;
 b=owEBbQKS/ZANAwAIASCtLsZbECziAcsmYgBmFUHT8fAqgtW0+UxhuEUv9drK2hP1v/IwEajg1
 aiTzd8kZRCJAjMEAAEIAB0WIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCZhVB0wAKCRAgrS7GWxAs
 4sBPD/9VvtfhYp0AXiF2aRidb45/dDbD/H4twtHgNHbP2Pr1Q72QQ5fNtPQX7R1hx1e9xnRlB0K
 lJF0GAyjqUMRxtjkk1/t8L5bjfUWF4jtEFPEIGBqge1ybRnxmloDksfWccss1dfXyY4s0NFjope
 kMYgjmzudZZAsDJoptL4/kCe+Nt/m3VdR/ikv5kJfDDS5ZlpzMQs+/jZsUn5Ypei/nPGg2cAQ6j
 x7bKxP6hFCGGf+R2V9WhfPHHF+v15orEpbgcEvsWpy6xazXRp74bSxBdIRLZ1t+tUKhNKiK+L8B
 iQZtoUPnfIF9KeLL9+pNNjk8dpgm9G3D7BEcDLpEBfyqVJqG2bhG18UMwdHF6QEfsN+/ATg/z3e
 2WEBXZIrui4OYwPEGT9ADPkiS7ddbIIYXIRJDyMUOyFs/Qog2SMe0C5JcQy215RkZHHvnnoGR3j
 fpTzKG3eMH3zqSOG9N1/8nnbK5YqdEePe/Jxyxe29bpKLozYtT9JuxUvJjc1uXn1NdWQh7mZjAO
 jzHGRVpyqc4REagxmW0H44znlfwH4+sE7OteCs2QcJk5nNR1D6XikKG+o6Qluadccsv8Emq1RFk
 Y4S9axvSRRaH1k96JbpD+U3YlwuDuhiVGwbjgwuWuJaS+eYU/dU0MnF0uUa0ek3o+vieCICsI/h
 7ZbTMgKgIVIQT+w==
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
Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
 drivers/gpu/drm/vkms/vkms_formats.c | 2 +-
 drivers/gpu/drm/vkms/vkms_plane.c   | 9 +++++++++
 2 files changed, 10 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/vkms/vkms_formats.c b/drivers/gpu/drm/vkms/vkms_formats.c
index 2d7445a3de93..a294744d29d6 100644
--- a/drivers/gpu/drm/vkms/vkms_formats.c
+++ b/drivers/gpu/drm/vkms/vkms_formats.c
@@ -238,7 +238,7 @@ static struct pixel_argb_u16 argb_u16_from_RGB565(const u16 *pixel)
 static struct pixel_argb_u16 argb_u16_from_yuv888(u8 y, u8 channel_1, u8 channel_2,
 						  const struct conversion_matrix *matrix)
 {
-	u8 r, g, b;
+	u16 r, g, b;
 	s64 fp_y, fp_channel_1, fp_channel_2;
 	s64 fp_r, fp_g, fp_b;
 
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
2.43.0

