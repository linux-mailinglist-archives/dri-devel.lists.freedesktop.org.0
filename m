Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C00FFAEC2C6
	for <lists+dri-devel@lfdr.de>; Sat, 28 Jun 2025 00:45:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F07DB10EA8E;
	Fri, 27 Jun 2025 22:45:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="IBziAalZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C393110EA85
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Jun 2025 22:45:29 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 9B04543AD0;
 Fri, 27 Jun 2025 22:45:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1751064328;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YQ8d/WjZleZAjhhPje5wk6/z6NUbO/uvPr/KAPPpwLk=;
 b=IBziAalZZvSygKzkHu0UuO/94CVAI5TEElcCzxpG6nE1S2ThmbmrzoWhea6rM2VEbIr9lY
 NzI103YqDnp5eKd8g5lpufXchwIZt53qKahM+4QseE5/i3fYPslDhQMJvATw+dVsvZxpkP
 lJcod6l2UFbQ7nck+WyHvfFc1LlncBf2VYMtFGr7VFFIKapK0VTlo5Eg7uN2BlsV2HWVcK
 w2QCBRtocHm113VFQstO9R6/MlickXI5lwC8NeE3xI76Ruar9h8h2jf8bqXSqG7hOP4DH1
 2QgbN/T5JZ3t5oJNIl+3Asyjeq3N6jXLsfvT8Rz0fdf8oUNz4gcZbzL+wrSOSA==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Sat, 28 Jun 2025 00:45:19 +0200
Subject: [PATCH v6 5/8] drm/vkms: Add support for RGB888 formats
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250628-b4-new-color-formats-v6-5-2125b193f91a@bootlin.com>
References: <20250628-b4-new-color-formats-v6-0-2125b193f91a@bootlin.com>
In-Reply-To: <20250628-b4-new-color-formats-v6-0-2125b193f91a@bootlin.com>
To: Melissa Wen <melissa.srw@gmail.com>, 
 =?utf-8?q?Ma=C3=ADra_Canal?= <mairacanal@riseup.net>, 
 Haneen Mohammed <hamohammed.sa@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rodrigo Siqueira <siqueira@igalia.com>, 
 Simona Vetter <simona.vetter@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, arthurgrillo@riseup.net, 
 linux-kernel@vger.kernel.org, jeremie.dautheribes@bootlin.com, 
 miquel.raynal@bootlin.com, thomas.petazzoni@bootlin.com, 
 seanpaul@google.com, nicolejadeyee@google.com, 
 Louis Chauvet <louis.chauvet@bootlin.com>, 
 =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=2003;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=QFgxyFHAJEf2laxUq9BXmSxgh7oBLS7xSxpQoHg3nhI=;
 b=owEBbQKS/ZANAwAIASCtLsZbECziAcsmYgBoXx7/6OGrbxhRfB8NMn9pBsSxufifrZMLdNSNQ
 AkyTsZWkAGJAjMEAAEIAB0WIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCaF8e/wAKCRAgrS7GWxAs
 4lOfD/92WTkbUzFx+xKgBlnzb4w0yTQ4cwFgQHlimRpmKOBujhU/Ahs4Epbf2E0sr4doJYz1sBH
 g4u6rODrzvwY9rMx3qM3+peznHGcu+XgVuN6+kTN970O31lUhb286n2C2P8WueVvfFDOPjpz9+z
 5idvQjQZw6knsBZpwol8q8o6AeKsriAjaXyKylhozm2NxczwIuhyO0Xx6ZqwD92BvjY4F98Ua81
 TjuDY4iqh72nmcQqmScxXaRgfx/4wJBLq9mdSwwl0I6QUW06YC00eZ+S1zu6iRz9itf2UMz9nvJ
 ngSCsMzAwGWMJFzl/a5QwOiO6rq0+8nJ9YLGeGDPA5ta9BHfK2FhCA8eLBE8liR7NEmptUqI8LA
 kpRHWeb+376siHMTBzPJHQwgAg8waogyw38TxPFXOgnQ1ssouS+oCDvru4ksckRPIvFfw8PsTxA
 IHjr35ZgQO7KEL6rQooTEvru6VvyCZNc8iy7lIclQ/2/we+AvFRqf1KDxOHALZGVM7xz0XSueud
 Cr7CvGORvg5jZJgzfBhSyq3lyA0EJQds4WA0Vqm8jNd9h7LTkYJwjxb+irS9Pr2FnqCwCw6Aj8G
 Ct3S0Eray3hWh1vfTMllvxnlK4ebBKMgQ8ufxrzXYGPEVQCtBl1QtalpZW+3GcmP2wrBn5eNctR
 lgDnjxmVGvoEZsg==
X-Developer-Key: i=louis.chauvet@bootlin.com; a=openpgp;
 fpr=8B7104AE9A272D6693F527F2EC1883F55E0B40A5
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdegvdelucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhfffugggtgffkfhgjvfevofesthekredtredtjeenucfhrhhomhepnfhouhhishcuvehhrghuvhgvthcuoehlohhuihhsrdgthhgruhhvvghtsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpedtieevieduhedttdfgtefhuddufeffudetkeegveeuteduveehheeivedttddtkeenucfkphepvddttddumeekiedumeegudegtdemtgekiedtmeehugeiudemieeffeelmeeiiegrieemvgdtjeehnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvddttddumeekiedumeegudegtdemtgekiedtmeehugeiudemieeffeelmeeiiegrieemvgdtjeehpdhhvghloheplgduledvrdduieekrddurddvjegnpdhmrghilhhfrhhomheplhhouhhishdrtghhrghuvhgvthessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepvddtpdhrtghpthhtohepmhhrihhprghrugeskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepshgvrghnphgruhhlsehgohhoghhlvgdrtghomhdprhgtphhtthhopehjvghrvghmihgvrdgurghuthhhvghrihgsvghssegsohhothhlihhnrdgtohhmpdhrtghpt
 hhtohepshhiqhhuvghirhgrsehighgrlhhirgdrtghomhdprhgtphhtthhopehsihhmohhnrgdrvhgvthhtvghrsehffhiflhhlrdgthhdprhgtphhtthhopehtiihimhhmvghrmhgrnhhnsehsuhhsvgdruggvpdhrtghpthhtohephhgrmhhohhgrmhhmvggurdhsrgesghhmrghilhdrtghomhdprhgtphhtthhopegrrhhthhhurhhgrhhilhhlohesrhhishgvuhhprdhnvght
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

Add the support for:
- RGB888
- BGR888

Reviewed-by: Maíra Canal <mcanal@igalia.com>
Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
 drivers/gpu/drm/vkms/vkms_formats.c | 7 +++++++
 drivers/gpu/drm/vkms/vkms_plane.c   | 2 ++
 2 files changed, 9 insertions(+)

diff --git a/drivers/gpu/drm/vkms/vkms_formats.c b/drivers/gpu/drm/vkms/vkms_formats.c
index c4c623472e04..5b50e8622521 100644
--- a/drivers/gpu/drm/vkms/vkms_formats.c
+++ b/drivers/gpu/drm/vkms/vkms_formats.c
@@ -449,6 +449,9 @@ READ_LINE_ARGB8888(ABGR8888_read_line, px, px[3], px[0], px[1], px[2])
 READ_LINE_ARGB8888(RGBA8888_read_line, px, px[0], px[3], px[2], px[1])
 READ_LINE_ARGB8888(BGRA8888_read_line, px, px[0], px[1], px[2], px[3])
 
+READ_LINE_ARGB8888(RGB888_read_line, px, 0xFF, px[2], px[1], px[0])
+READ_LINE_ARGB8888(BGR888_read_line, px, 0xFF, px[0], px[1], px[2])
+
 READ_LINE_le16161616(ARGB16161616_read_line, px, px[3], px[2], px[1], px[0])
 READ_LINE_le16161616(ABGR16161616_read_line, px, px[3], px[0], px[1], px[2])
 READ_LINE_le16161616(XRGB16161616_read_line, px, cpu_to_le16(0xFFFF), px[2], px[1], px[0])
@@ -670,6 +673,10 @@ pixel_read_line_t get_pixel_read_line_function(u32 format)
 		return &XRGB8888_read_line;
 	case DRM_FORMAT_XBGR8888:
 		return &XBGR8888_read_line;
+	case DRM_FORMAT_RGB888:
+		return &RGB888_read_line;
+	case DRM_FORMAT_BGR888:
+		return &BGR888_read_line;
 	case DRM_FORMAT_ARGB16161616:
 		return &ARGB16161616_read_line;
 	case DRM_FORMAT_ABGR16161616:
diff --git a/drivers/gpu/drm/vkms/vkms_plane.c b/drivers/gpu/drm/vkms/vkms_plane.c
index 6e7597ab935d..9f34f3a18d8c 100644
--- a/drivers/gpu/drm/vkms/vkms_plane.c
+++ b/drivers/gpu/drm/vkms/vkms_plane.c
@@ -19,6 +19,8 @@ static const u32 vkms_formats[] = {
 	DRM_FORMAT_RGBA8888,
 	DRM_FORMAT_XRGB8888,
 	DRM_FORMAT_XBGR8888,
+	DRM_FORMAT_RGB888,
+	DRM_FORMAT_BGR888,
 	DRM_FORMAT_XRGB16161616,
 	DRM_FORMAT_XBGR16161616,
 	DRM_FORMAT_ARGB16161616,

-- 
2.49.0

