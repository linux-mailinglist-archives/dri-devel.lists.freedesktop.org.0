Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E71AEAC4E58
	for <lists+dri-devel@lfdr.de>; Tue, 27 May 2025 14:11:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E03C810E477;
	Tue, 27 May 2025 12:11:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="prwHG+aQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3871410E4BD
 for <dri-devel@lists.freedesktop.org>; Tue, 27 May 2025 12:11:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1748347883;
 bh=ozLZjulX/zJsG4ctxBw/HBy+KYKTHzkW7T/oqzmDhLg=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=prwHG+aQEdW23t0aOAQp0Ki5FHGeTfwWxrXn8bzkj99dp+66uq6gd5kUE5LyrjYU7
 9EOwZM6AZct2LZjfG/3rSfQEmKWu660U3gtmmK2/xOFuXgdB2o4rPmFybtFN3faUpx
 6wvi45IKOup2NQgtILsgQqoAy/SLf1YvWydJkaYkQ8odFgGb0SKq0ekhlUPPV5cdm9
 7VblUlD+96goTz5gGnLBvmN9jNLTSeH1kGwzkL/FAeiYA2LIV6CtkB5OMK1oi8mV9H
 dwVwHRvUQcOAE7LevAxkc9Z9veM5MrQHhijwQXbwwoWi1b5rMK6Pi2krm57NGNtQcP
 A0HxD1LX3n5EQ==
Received: from localhost (unknown [82.76.59.134])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits)
 server-digest SHA256) (No client certificate requested)
 (Authenticated sender: cristicc)
 by bali.collaboradmins.com (Postfix) with UTF8SMTPSA id 6815C17E1509;
 Tue, 27 May 2025 14:11:23 +0200 (CEST)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Date: Tue, 27 May 2025 15:11:10 +0300
Subject: [PATCH v5 02/19] drm/connector: hdmi: Add support for YUV420
 format verification
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250527-hdmi-conn-yuv-v5-2-74c9c4a8ac0c@collabora.com>
References: <20250527-hdmi-conn-yuv-v5-0-74c9c4a8ac0c@collabora.com>
In-Reply-To: <20250527-hdmi-conn-yuv-v5-0-74c9c4a8ac0c@collabora.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, Dmitry Baryshkov <lumag@kernel.org>
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

Provide the necessary constraints verification in
sink_supports_format_bpc() in order to support handling of YUV420
output format.

Reviewed-by: Maxime Ripard <mripard@kernel.org>
Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
 drivers/gpu/drm/display/drm_hdmi_state_helper.c | 39 +++++++++++++++++++++++--
 1 file changed, 36 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/display/drm_hdmi_state_helper.c b/drivers/gpu/drm/display/drm_hdmi_state_helper.c
index 97cb4f29c4b5d88f4b6288bd93c6abb33bb7c17a..e026f1ca82848f3be874245c06093d3be8355c5c 100644
--- a/drivers/gpu/drm/display/drm_hdmi_state_helper.c
+++ b/drivers/gpu/drm/display/drm_hdmi_state_helper.c
@@ -3,6 +3,7 @@
 #include <drm/drm_atomic.h>
 #include <drm/drm_connector.h>
 #include <drm/drm_edid.h>
+#include <drm/drm_modes.h>
 #include <drm/drm_print.h>
 
 #include <drm/display/drm_hdmi_audio_helper.h>
@@ -408,6 +409,11 @@ sink_supports_format_bpc(const struct drm_connector *connector,
 		return false;
 	}
 
+	if (drm_mode_is_420_only(info, mode) && format != HDMI_COLORSPACE_YUV420) {
+		drm_dbg_kms(dev, "Mode can be only supported in YUV420 format.\n");
+		return false;
+	}
+
 	switch (format) {
 	case HDMI_COLORSPACE_RGB:
 		drm_dbg_kms(dev, "RGB Format, checking the constraints.\n");
@@ -438,9 +444,36 @@ sink_supports_format_bpc(const struct drm_connector *connector,
 		return true;
 
 	case HDMI_COLORSPACE_YUV420:
-		/* TODO: YUV420 is unsupported at the moment. */
-		drm_dbg_kms(dev, "YUV420 format isn't supported yet.\n");
-		return false;
+		drm_dbg_kms(dev, "YUV420 format, checking the constraints.\n");
+
+		if (!(info->color_formats & DRM_COLOR_FORMAT_YCBCR420)) {
+			drm_dbg_kms(dev, "Sink doesn't support YUV420.\n");
+			return false;
+		}
+
+		if (!drm_mode_is_420(info, mode)) {
+			drm_dbg_kms(dev, "Mode cannot be supported in YUV420 format.\n");
+			return false;
+		}
+
+		if (bpc == 10 && !(info->hdmi.y420_dc_modes & DRM_EDID_YCBCR420_DC_30)) {
+			drm_dbg_kms(dev, "10 BPC but sink doesn't support Deep Color 30.\n");
+			return false;
+		}
+
+		if (bpc == 12 && !(info->hdmi.y420_dc_modes & DRM_EDID_YCBCR420_DC_36)) {
+			drm_dbg_kms(dev, "12 BPC but sink doesn't support Deep Color 36.\n");
+			return false;
+		}
+
+		if (bpc == 16 && !(info->hdmi.y420_dc_modes & DRM_EDID_YCBCR420_DC_48)) {
+			drm_dbg_kms(dev, "16 BPC but sink doesn't support Deep Color 48.\n");
+			return false;
+		}
+
+		drm_dbg_kms(dev, "YUV420 format supported in that configuration.\n");
+
+		return true;
 
 	case HDMI_COLORSPACE_YUV422:
 		drm_dbg_kms(dev, "YUV422 format, checking the constraints.\n");

-- 
2.49.0

