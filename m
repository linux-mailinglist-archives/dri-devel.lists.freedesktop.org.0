Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BE0B4AEB342
	for <lists+dri-devel@lfdr.de>; Fri, 27 Jun 2025 11:48:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 08F0B10E9A9;
	Fri, 27 Jun 2025 09:48:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="grQjveN9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mslow3.mail.gandi.net (mslow3.mail.gandi.net [217.70.178.249])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 08E7C10E9A0
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Jun 2025 09:48:02 +0000 (UTC)
Received: from relay16.mail.gandi.net (relay16.mail.gandi.net [217.70.178.236])
 by mslow3.mail.gandi.net (Postfix) with ESMTP id 247855867F4
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Jun 2025 09:12:54 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 9396D438D0;
 Fri, 27 Jun 2025 09:12:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1751015572;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vr0T2pNUq0SPCwrqPVAq1LbhS4QqKuEpfagCHD6VWH8=;
 b=grQjveN9U/pV6SvlPOus1aXe29fD0EvQusl7JukqKZAozXABQipdzApIuRxiBIkFErBBt5
 Z9cld0/2rR71E9hLNTFQbs8QGglYi4vu6z2MCbVYdZiKyDF02qVQ5oSTi3QDWkoI+4Kqs+
 b/dLGNtltU2d67CrXWYfN2+FDL70tA6j4SHhLV1Miyu71Uzqd1y4fEN/Gm/4PYH+sWfflI
 /vV+5CM9ETthm3M7BW11s/iAU83ozwU+nGcxylU8j1g4PcBNYomrhH1JOPLX/A+LQyAPaX
 cgRF+VwnpZCmXwdGe7JSupugls1Ct4jt6JTm39Bemb7YDpZSRqFL50ljr4G13Q==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Fri, 27 Jun 2025 11:12:34 +0200
Subject: [PATCH v5 3/8] drm/vkms: Add support for ARGB16161616 formats
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250627-b4-new-color-formats-v5-3-94452f119c72@bootlin.com>
References: <20250627-b4-new-color-formats-v5-0-94452f119c72@bootlin.com>
In-Reply-To: <20250627-b4-new-color-formats-v5-0-94452f119c72@bootlin.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2135;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=eek1CthCd1RvO7Qs2r4Pe4gz/Q4+jCBePgrtnVHKvNE=;
 b=owEBbQKS/ZANAwAIASCtLsZbECziAcsmYgBoXmCMK7NeRjkHLIRkq5oYVaSuk7scg4NAjFbKL
 avuXqVC4zuJAjMEAAEIAB0WIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCaF5gjAAKCRAgrS7GWxAs
 4j5HD/0UeXy/3qzl9Do7DHk/dJ1EQ94gLCSPLXnTZCXhq1rzj+LzuyY9pTE5enl/SaIJMe4H0Jy
 D2TCWzntAprpF0E1SxDQVgsw2BTJAhi5/AJ9Dh2LxveF86Xa6uzPBBct/qENMK99ZZo+3P/LlNc
 8U9fUu+x8uulkgltw6bNYMcTk8ViIvigO1Iu/XlzRpEkGiYbCQgcC/4vqWXgEGix0e0luwDgDYn
 Xh0f1NqfkT4/um0bYThieZrnIz3vx5JJeLW7aolQ0TAR8Ef+Q3I2WuUZWmVBxVtPVoHLT4UqN6Z
 YLjv7Cj52cMQzfVKCyQn8rXZ2IlhSog0i6mLFn6Cz1WeBZNwXYkTcVIETdoHV2dykhek0STXxTp
 P0+vt5tFUsiEI2pGKpqHDo/p0v8ngLkLwXJDj3zMvgcMOD2nStdc00qVz1fjUSM3AO/JJBs8a46
 /mH5vhtRGGAfBZmRagyJv97Py2D4L3nALxAGHuLAuk4elVElSq3uBDn6dJRxd7D3YAZAet8qNnV
 hV/J4s5UxHdWESWIRxM2cOA0RK6SDDJCiDODPgfDkNtEDsK4WIfjwg/OGhhIZTUfWbSWXLE8vjQ
 wJ3VRJhY70hAe+C0NrSBHxefd6EhPR1Dpp8swHC84KBWICL+Ki5Niuwqq5aB6CWEmzHkPn8kYLs
 ccMwK5kMYxxPUkw==
X-Developer-Key: i=louis.chauvet@bootlin.com; a=openpgp;
 fpr=8B7104AE9A272D6693F527F2EC1883F55E0B40A5
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgddvieeiucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhfffugggtgffkfhgjvfevofesthekredtredtjeenucfhrhhomhepnfhouhhishcuvehhrghuvhgvthcuoehlohhuihhsrdgthhgruhhvvghtsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpedtieevieduhedttdfgtefhuddufeffudetkeegveeuteduveehheeivedttddtkeenucfkphepledtrdekledrudeifedruddvjeenucevlhhushhtvghrufhiiigvpedunecurfgrrhgrmhepihhnvghtpeeltddrkeelrdduieefrdduvdejpdhhvghloheplgduledvrdduieekrdegvddrieejngdpmhgrihhlfhhrohhmpehlohhuihhsrdgthhgruhhvvghtsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopedvtddprhgtphhtthhopehmrghirhgrtggrnhgrlhesrhhishgvuhhprdhnvghtpdhrtghpthhtohepshhiqhhuvghirhgrsehighgrlhhirgdrtghomhdprhgtphhtthhopegrrhhthhhurhhgrhhilhhlohesrhhishgvuhhprdhnvghtpdhrtghpthhtohepmhhrihhprghrugeskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepthiiihhmmhgvrhhmrghnnhesshhushgvrdguvgdprhgtphhtt
 hhopehsihhmohhnrgesfhhffihllhdrtghhpdhrtghpthhtoheplhhouhhishdrtghhrghuvhgvthessghoohhtlhhinhdrtghomhdprhgtphhtthhopehjvghrvghmihgvrdgurghuthhhvghrihgsvghssegsohhothhlihhnrdgtohhm
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

The formats XRGB16161616 and ARGB16161616 were already supported.
Add the support for:
- ABGR16161616
- XBGR16161616

Reviewed-by: Maíra Canal <mcanal@igalia.com>
Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
 drivers/gpu/drm/vkms/vkms_formats.c | 6 ++++++
 drivers/gpu/drm/vkms/vkms_plane.c   | 2 ++
 2 files changed, 8 insertions(+)

diff --git a/drivers/gpu/drm/vkms/vkms_formats.c b/drivers/gpu/drm/vkms/vkms_formats.c
index 231b327e86b3..44547f56e4b2 100644
--- a/drivers/gpu/drm/vkms/vkms_formats.c
+++ b/drivers/gpu/drm/vkms/vkms_formats.c
@@ -440,7 +440,9 @@ READ_LINE_ARGB8888(RGBA8888_read_line, px, px[0], px[3], px[2], px[1])
 READ_LINE_ARGB8888(BGRA8888_read_line, px, px[0], px[1], px[2], px[3])
 
 READ_LINE_le16161616(ARGB16161616_read_line, px, px[3], px[2], px[1], px[0])
+READ_LINE_le16161616(ABGR16161616_read_line, px, px[3], px[0], px[1], px[2])
 READ_LINE_le16161616(XRGB16161616_read_line, px, cpu_to_le16(0xFFFF), px[2], px[1], px[0])
+READ_LINE_le16161616(XBGR16161616_read_line, px, cpu_to_le16(0xFFFF), px[0], px[1], px[2])
 
 READ_LINE(RGB565_read_line, px, __le16, argb_u16_from_RGB565, px)
 
@@ -659,8 +661,12 @@ pixel_read_line_t get_pixel_read_line_function(u32 format)
 		return &XBGR8888_read_line;
 	case DRM_FORMAT_ARGB16161616:
 		return &ARGB16161616_read_line;
+	case DRM_FORMAT_ABGR16161616:
+		return &ABGR16161616_read_line;
 	case DRM_FORMAT_XRGB16161616:
 		return &XRGB16161616_read_line;
+	case DRM_FORMAT_XBGR16161616:
+		return &XBGR16161616_read_line;
 	case DRM_FORMAT_RGB565:
 		return &RGB565_read_line;
 	case DRM_FORMAT_NV12:
diff --git a/drivers/gpu/drm/vkms/vkms_plane.c b/drivers/gpu/drm/vkms/vkms_plane.c
index 01fed722808b..d4c51b4486f7 100644
--- a/drivers/gpu/drm/vkms/vkms_plane.c
+++ b/drivers/gpu/drm/vkms/vkms_plane.c
@@ -20,7 +20,9 @@ static const u32 vkms_formats[] = {
 	DRM_FORMAT_XRGB8888,
 	DRM_FORMAT_XBGR8888,
 	DRM_FORMAT_XRGB16161616,
+	DRM_FORMAT_XBGR16161616,
 	DRM_FORMAT_ARGB16161616,
+	DRM_FORMAT_ABGR16161616,
 	DRM_FORMAT_RGB565,
 	DRM_FORMAT_NV12,
 	DRM_FORMAT_NV16,

-- 
2.49.0

