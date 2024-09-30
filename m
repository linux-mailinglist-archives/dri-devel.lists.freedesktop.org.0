Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 263B298A88E
	for <lists+dri-devel@lfdr.de>; Mon, 30 Sep 2024 17:33:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C85E10E537;
	Mon, 30 Sep 2024 15:33:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="prTV6ARJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D5DB010E533
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Sep 2024 15:33:05 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 9FECE40003;
 Mon, 30 Sep 2024 15:32:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1727710384;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LZZXCAOt96HKPNadssGl+s0w7QDIgwJlOE/lg2YiDu4=;
 b=prTV6ARJcXBFFXjrSbDkag4zYRA9VqLogczeMYVoaEQoDWV+FRdX8CHiblbkEne713WIzD
 P2X11qZKmezvHXMZj5DQCVic5WcwG1+eHuAWel5JyoxPsSujzqvBqq6TQ5gR2N+aU3ov9M
 VrKLgI0mDbwKgEEH7iPfaFFt4YIXFJvGhwosEmCdVWIalujoieT7daeI/HjxKlydcDPW4b
 5GePnn6iiwfgmM65YrFBJSWuSYDfz3S19xr35a04hlwV4nWdH1teVFitme8rHi2xZVa01R
 Z74tWy6zpP9YsYO+Q7xqLxuqfbl3JAuhWA0Sjvuu1nrnrpEz5I0f0agzGGJZoA==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Mon, 30 Sep 2024 17:31:51 +0200
Subject: [PATCH v11 11/15] drm/vkms: Add range and encoding properties to
 the plane
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240930-yuv-v11-11-4b1a26bcfc96@bootlin.com>
References: <20240930-yuv-v11-0-4b1a26bcfc96@bootlin.com>
In-Reply-To: <20240930-yuv-v11-0-4b1a26bcfc96@bootlin.com>
To: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>, 
 Melissa Wen <melissa.srw@gmail.com>, 
 =?utf-8?q?Ma=C3=ADra_Canal?= <mairacanal@riseup.net>, 
 Haneen Mohammed <hamohammed.sa@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Jonathan Corbet <corbet@lwn.net>, 
 Louis Chauvet <louis.chauvet@bootlin.com>, Simona Vetter <simona@ffwll.ch>, 
 rdunlap@infradead.org, arthurgrillo@riseup.net, 
 pekka.paalanen@haloniitty.fi, Simona Vetter <simona.vetter@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-doc@vger.kernel.org, thomas.petazzoni@bootlin.com, 
 jeremie.dautheribes@bootlin.com, miquel.raynal@bootlin.com, 
 seanpaul@google.com, marcheu@google.com, nicolejadeyee@google.com, 
 Pekka Paalanen <pekka.paalanen@collabora.com>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1253;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=VB/TChUFVIfTCJz1NYTIIebS+nzvAngxAg3Yry+8p1o=;
 b=owEBbQKS/ZANAwAIASCtLsZbECziAcsmYgBm+sRwhH7a6V7XPIvJplFcV8V9Grv/RfSfJM5Rz
 uV/c1IJ77uJAjMEAAEIAB0WIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCZvrEcAAKCRAgrS7GWxAs
 4rFtD/4mYYJxPNfaLXGp6MtcaCKNr2kZBN6VJmVrHVWXLp8zwu84l5ef32rOdWYpiBkkwLF6wj3
 K7nxdLzoyNQ9HUnPDniwpzzadlXvOjWhOoIOcR8V9C2I7pDa3uY7it2r4/rWJyQKhrMV6+sPz+h
 DdhmXOdN4+L+rFch71KdTLk3OZlhjJhgqvdqJfKi+rPBheetz+UQloxF10rnyIstvXVQNUbCbTl
 NUfybTV9okcYT4D6Bt6eOTJBSSJFQHRY/IinDnEayKkVtDJ+FAPPLvNJv/1LS7EcI/OQ3UqUl4I
 CSbjCFqOTgQyjVxcP+Hgqqqr/yhf1cNbSI5DMDqSAt8hj7lxlIrAkRsrrmrxvk4n5tnEbuHs1bj
 Attp1HcSWlzmrvsYQ7yAdcSNcHvGSS2ihinzfYK2BjARk2cycI4ojU9xQwDwg0kKO82IhuSfTUT
 5p36Yi566PtZe5yz11xM/QObvl9qLFG4i/jBZyphhHt9oGIy1v/KqvUBZDTyeqaa64VgCJvZnef
 eDHkCQC9OkHhQts+K37Nh8AKw2qaO/P2W2B5KJT40sps47xZmL0Ok7R/KyuUUi2sKTHaJdALpn5
 gYPzaR3IV1F85IsyaEC8P1LYlXXJhRS1jL1y9m6HwuWmF3wvqDh+RAS2yRex+FnDlyS9ugJhd8z
 WmkX48lrx9mx5eQ==
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
2.46.2

