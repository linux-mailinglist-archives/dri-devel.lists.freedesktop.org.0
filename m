Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A9029FF0E0
	for <lists+dri-devel@lfdr.de>; Tue, 31 Dec 2024 18:32:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F2B6F10E029;
	Tue, 31 Dec 2024 17:32:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="VPc7Y9aT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 23F8F10E029
 for <dri-devel@lists.freedesktop.org>; Tue, 31 Dec 2024 17:32:00 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id A698BFF80A;
 Tue, 31 Dec 2024 17:31:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1735666318;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JJaae2di248INTyIxrbFsGIlO3L32V5gEL21XGT13do=;
 b=VPc7Y9aTsnc/1gZVsaPfUpLBme3guTnTAzf1FUlQaIoLBSC7kok3IE0F+uITsV+t2SyimA
 a/1ujgEdKoFTDMI4jzbJLjV1Ap60DoRl9XdvwDHixHgmxLi0rnA5inYejVJNRY/10htlHq
 F/DV6VN/ya/boZRWbBWlFlB3n4OD9MDUXmgWuKTGo07CPfZsbDTytUV4fm6N8Tl2k1dhIo
 Z8mTUMBvxm9zKSIKULTye4q9ts27MacIMN+Z3i6K/OMaizF1GuvalX6gGECSypAE71wbd6
 72FLWN0BBe1G/92ZvfZX0RrZutOdSpjtH+v5azq2bA3SaLOlVEV/Kg0DDPaD2Q==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Tue, 31 Dec 2024 18:31:47 +0100
Subject: [PATCH v15 4/7] drm: Export symbols to use in tests
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241231-yuv-v15-4-eda6bb3028e6@bootlin.com>
References: <20241231-yuv-v15-0-eda6bb3028e6@bootlin.com>
In-Reply-To: <20241231-yuv-v15-0-eda6bb3028e6@bootlin.com>
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
 Louis Chauvet <louis.chauvet@bootlin.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1319;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=zI9PBYaXL9n8tKDCycFK0oO5/fSOH1r4rcy6X4UZ82E=;
 b=owEBbQKS/ZANAwAIASCtLsZbECziAcsmYgBndCqGnwHmBR2a7J7mXAlCgKOJPsV/W1Si8arsd
 peKQtBaOe+JAjMEAAEIAB0WIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCZ3QqhgAKCRAgrS7GWxAs
 4uHCD/92wpnom8qNZR23MWuvjfUjoMFCZ7J2lyS0IaBID5NhG3z1nlU03DZpJLCGuEe1nv9hj2R
 wBVo8rMFl0krec7ozBecsf6s5+kfSVTpzwCzjE5HlvJDy3Ww5ftMBT8d21qFcVknqxf4Jx3AQa3
 uA9UTXIofHg75k2cm1XVOWZ0mozYnboNefGNzjPa3ntt8DRGranXCkIaoZ19B/eSX3CV3GMfG4v
 mcFkj+H8oduftysnTGnAVkQSsr6XLfZgvbxeRv2ntD2o617xZN+jd4F1d/lLoLFO5fMPUnDFBR7
 6P36CJksg8PuHySqC4P9n9w/mgORB27NSyRti8l1VgtyVYIbAIVcPD3U0vBOZIytcMj6uDeSDTs
 On2j0P+n27hN3rU1fFbPCxqSsj6g+jpMllKQlqCoehTdaddSRO9jllLOdtHUA+w8fNSGYRBUF+d
 rXRYVkblvg5fBcqmfeMJaR3mtlE+YOy/v/f9LM7PcykS2siK9vYeZ0YLWR9iRByJn+tEBF8DGp6
 XYFp6uC1/02Un69eEbNP1PT+KsyPYzaI9voqB/6U71agIodfd6DoIMNnZoMcEYu5W5hw5wkNcre
 LrscMipeHhdxBlJ5qIeXhGk4i5cegtqSrYyoHNL5NkpxaSrdhii1si7XdSm78/QsCUUplRSBtfN
 s2kiKeE/7PTZUUQ==
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

The functions drm_get_color_encoding_name and drm_get_color_range_name
are useful for clarifying test results. Therefore, export them so they
can be used in tests built as modules.

Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
 drivers/gpu/drm/drm_color_mgmt.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/drm_color_mgmt.c b/drivers/gpu/drm/drm_color_mgmt.c
index 3969dc548cff605cbdd3d56dceafb2ca00a5c886..b73a998352d175a26c69e0878da28a6288cfc8b7 100644
--- a/drivers/gpu/drm/drm_color_mgmt.c
+++ b/drivers/gpu/drm/drm_color_mgmt.c
@@ -28,6 +28,7 @@
 #include <drm/drm_device.h>
 #include <drm/drm_drv.h>
 #include <drm/drm_print.h>
+#include <kunit/visibility.h>
 
 #include "drm_crtc_internal.h"
 
@@ -494,6 +495,7 @@ const char *drm_get_color_encoding_name(enum drm_color_encoding encoding)
 
 	return color_encoding_name[encoding];
 }
+EXPORT_SYMBOL_IF_KUNIT(drm_get_color_encoding_name);
 
 /**
  * drm_get_color_range_name - return a string for color range
@@ -509,6 +511,7 @@ const char *drm_get_color_range_name(enum drm_color_range range)
 
 	return color_range_name[range];
 }
+EXPORT_SYMBOL_IF_KUNIT(drm_get_color_range_name);
 
 /**
  * drm_plane_create_color_properties - color encoding related plane properties

-- 
2.47.1

