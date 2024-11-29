Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 87DE09DED70
	for <lists+dri-devel@lfdr.de>; Sat, 30 Nov 2024 00:05:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 36FAF10E35E;
	Fri, 29 Nov 2024 23:05:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="W1gxdIm0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A4CD810E35E
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Nov 2024 23:05:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1732921510;
 bh=/XjiQkz89NjPFaLmlTWkQFETq4k8QO+tV1ULpeWlfr4=;
 h=From:Date:Subject:To:Cc:From;
 b=W1gxdIm00MBYscJ39wRgOoITf53apLxQw1+GKwvkDoVLjAPPz6hPEmIPl/z6IfrRF
 WBh9o2iXMMsvHZXj2NF1AlfEZr3SAmTXkWrUylpsCeHwKM4vbeAfF1/5hCQdDeiRyD
 3WnAHzSvxKTh+n9469BVoTPfduwjZYZy3aEyiS86cqyKNAoiv9FRtU2EevuECPmNXU
 MdmmRgyFIvh16vyDMsxUrCMPR7Pal5Rhe+ege5h7z22HfS5XuLvr/cKg09s2KvHcHr
 1btQIKurTxLSXiXIC3OrDSyCNdPqqu9lA5gyA4DwpXieNKSB0GALqNwOdKjBZhBd6l
 a+n0SoflJYdHw==
Received: from localhost (unknown [86.120.21.57])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits)
 server-digest SHA256) (No client certificate requested)
 (Authenticated sender: cristicc)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 0AD6917E09F7;
 Sat, 30 Nov 2024 00:05:10 +0100 (CET)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Date: Sat, 30 Nov 2024 01:04:53 +0200
Subject: [PATCH] drm/bridge: dw-hdmi: Sync comments with actual bus formats
 order
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241130-dw-hdmi-bus-fmt-order-v1-1-510b5fb6b990@collabora.com>
X-B4-Tracking: v=1; b=H4sIAJRISmcC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIxNDQ2MD3ZRy3YyU3EzdpNJi3bTcEt38opTUIl3zNLOUJNOUJKM0g0QloN6
 CotS0zAqwudGxtbUAI+F0n2cAAAA=
X-Change-ID: 20241130-dw-hdmi-bus-fmt-order-7f6db5db2f0a
To: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: kernel@collabora.com, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
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

Commit d3d6b1bf85ae ("drm: bridge: dw_hdmi: fix preference of RGB modes
over YUV420") changed the order of the output bus formats, but missed to
update accordingly the affected comment blocks related to
dw_hdmi_bridge_atomic_get_output_bus_fmts().

Fix the misleading comments and a context related typo.

Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
 drivers/gpu/drm/bridge/synopsys/dw-hdmi.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
index 996733ed2c004c83a989cb8da54d8b630d9f2c02..d76aede757175d7ad5873c5d7623abf2d12da73c 100644
--- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
+++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
@@ -2621,6 +2621,7 @@ static int dw_hdmi_connector_create(struct dw_hdmi *hdmi)
  * - MEDIA_BUS_FMT_UYYVYY12_0_5X36,
  * - MEDIA_BUS_FMT_UYYVYY10_0_5X30,
  * - MEDIA_BUS_FMT_UYYVYY8_0_5X24,
+ * - MEDIA_BUS_FMT_RGB888_1X24,
  * - MEDIA_BUS_FMT_YUV16_1X48,
  * - MEDIA_BUS_FMT_RGB161616_1X48,
  * - MEDIA_BUS_FMT_UYVY12_1X24,
@@ -2631,7 +2632,6 @@ static int dw_hdmi_connector_create(struct dw_hdmi *hdmi)
  * - MEDIA_BUS_FMT_RGB101010_1X30,
  * - MEDIA_BUS_FMT_UYVY8_1X16,
  * - MEDIA_BUS_FMT_YUV8_1X24,
- * - MEDIA_BUS_FMT_RGB888_1X24,
  */
 
 /* Can return a maximum of 11 possible output formats for a mode/connector */
@@ -2669,7 +2669,7 @@ static u32 *dw_hdmi_bridge_atomic_get_output_bus_fmts(struct drm_bridge *bridge,
 	}
 
 	/*
-	 * If the current mode enforces 4:2:0, force the output but format
+	 * If the current mode enforces 4:2:0, force the output bus format
 	 * to 4:2:0 and do not add the YUV422/444/RGB formats
 	 */
 	if (conn->ycbcr_420_allowed &&
@@ -2698,14 +2698,14 @@ static u32 *dw_hdmi_bridge_atomic_get_output_bus_fmts(struct drm_bridge *bridge,
 		}
 	}
 
+	/* Default 8bit RGB fallback */
+	output_fmts[i++] = MEDIA_BUS_FMT_RGB888_1X24;
+
 	/*
 	 * Order bus formats from 16bit to 8bit and from YUV422 to RGB
-	 * if supported. In any case the default RGB888 format is added
+	 * if supported.
 	 */
 
-	/* Default 8bit RGB fallback */
-	output_fmts[i++] = MEDIA_BUS_FMT_RGB888_1X24;
-
 	if (max_bpc >= 16 && info->bpc == 16) {
 		if (info->color_formats & DRM_COLOR_FORMAT_YCBCR444)
 			output_fmts[i++] = MEDIA_BUS_FMT_YUV16_1X48;

---
base-commit: f486c8aa16b8172f63bddc70116a0c897a7f3f02
change-id: 20241130-dw-hdmi-bus-fmt-order-7f6db5db2f0a

