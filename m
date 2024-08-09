Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E3B3194D5C1
	for <lists+dri-devel@lfdr.de>; Fri,  9 Aug 2024 19:55:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D90F10E9C7;
	Fri,  9 Aug 2024 17:55:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="pegPyi1X";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 19F4610E9C6
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Aug 2024 17:55:12 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id ABD8EFF802;
 Fri,  9 Aug 2024 17:55:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1723226111;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=k1N2wKhCx93t2SWK5sURoLWP8YIYqRV+8fF3gnv/nic=;
 b=pegPyi1XrFfwfvrJc9HqcEgkQ7fk6hSfFO7vHZIbDeodexTrGLLnKjdPm+66YnzyJhcHbW
 /37sIskymzyFGamT26z7bDIr3wzWEckttnqizy0KiRAq3P/vY0Of/++OPNVM6DVh9viRRO
 8iTbxyaKcGNCx4nI+ZECTBvmAHMssDcQEOhIhfgEzKbndikIVknmUzmL1QGIvHFzcTuWPP
 gUI94nYXoBAdME3juTR7dMXcgfuiIa+SK1hl+LeUtZ2vCTT85SnYC0iQL72itGuvwKnvTH
 ya+9HAMRVJjUC+jKORZTRGTGJLIVcMNfau4d9SXtcmO/a3rSlMiK9ej/VJcWPg==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Fri, 09 Aug 2024 19:54:53 +0200
Subject: [PATCH v10 12/16] drm/vkms: Add range and encoding properties to
 the plane
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240809-yuv-v10-12-1a7c764166f7@bootlin.com>
References: <20240809-yuv-v10-0-1a7c764166f7@bootlin.com>
In-Reply-To: <20240809-yuv-v10-0-1a7c764166f7@bootlin.com>
To: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>, 
 Melissa Wen <melissa.srw@gmail.com>, 
 =?utf-8?q?Ma=C3=ADra_Canal?= <mairacanal@riseup.net>, 
 Haneen Mohammed <hamohammed.sa@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Jonathan Corbet <corbet@lwn.net>, 
 rdunlap@infradead.org, arthurgrillo@riseup.net, 
 pekka.paalanen@haloniitty.fi
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-doc@vger.kernel.org, jeremie.dautheribes@bootlin.com, 
 miquel.raynal@bootlin.com, thomas.petazzoni@bootlin.com, 
 seanpaul@google.com, marcheu@google.com, nicolejadeyee@google.com, 
 Louis Chauvet <louis.chauvet@bootlin.com>, 
 Pekka Paalanen <pekka.paalanen@collabora.com>
X-Mailer: b4 0.14-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1253;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=lX/b6aaWAzynVQwgJ4uAbWlqpIRVGyKzYZlNlczj/Es=;
 b=owEBbQKS/ZANAwAIASCtLsZbECziAcsmYgBmtlfqXInQ0T7WeY08BqYeex2VR4d1+WX6YCHqk
 JYK2ibYpV+JAjMEAAEIAB0WIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCZrZX6gAKCRAgrS7GWxAs
 4uqaD/9YLD8u729GH1VibT8fQeotsBcoLiLAaiiZ3wSrvsqUA+WyiTuiXIu9AWxlRJ3dfGruked
 u/PwhhbnRxFUpn4xxWo7YjBHq3iBVPROxy6DBOTMd5sVA+UDUBYCg1PrjyGS2GqrzA4oAeTd0Gu
 fQaJ3IhBKWOAt5CFp2TyuF+8ILRY20sYA75bcMqRX42jcEa/D563OTYhfDnrVw+j2rJqCrqYbU1
 F3ESeNhIWV3W19n3kCHO8IBvAFcje8c8duA8u+63Epet2jtFHN9FdJyp/pVOzzsqVsaONmyfeHz
 6T3rDh6Q0ALV0ohUw1Z8zqbwiyrhVKTai77yEYTlVdPu0TkeiwagkX9j+cTE8HW6+O/DF7Uenj7
 rQs7F33yIGPuUahAtrborbbvnfZTMd57NSZgJNIDTq1JamR6iAg7grVpB+KBhDhh/6KfaSM+9Uq
 VmrOjD/llXuDnH6mrQt6JBRzOMMMlDZPbAdxtvUWljNs+h4ntpSIExdXeAPF1EJwtv/z+Kd6X5f
 s9vyZKnKobkfItreby9KWpuhs8GEWGfFqHTf6u5BQS8tD1tt4BT1NP/xRS5IvYGexpfpGFwgb5n
 90ttRgPrAeKWqXxuwaBIUOC9VOdN1CuuvLlAQSemndXZoMtiSddtMQDk3GajEgc+kpFQ1xtKIJ9
 N2PLxMTAhBk8w+A==
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
2.44.2

