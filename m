Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BF3AF9DEDB4
	for <lists+dri-devel@lfdr.de>; Sat, 30 Nov 2024 01:00:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B05D410E368;
	Sat, 30 Nov 2024 00:00:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="Qi95bxbh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0340D10E368
 for <dri-devel@lists.freedesktop.org>; Sat, 30 Nov 2024 00:00:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1732924831;
 bh=Cza86IcsLPmgAtr3aY7j2z93JXxEWnTLFN4ccz2Y7tA=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=Qi95bxbhHt/xrTnYL0cSIahFCfQJ+geCLTtTT9ZKN0q/y+8JDtU9vLawsdyRU33jm
 ZQSvQ5i8ZF6kajwuv7rLkzrsS3X31bH5sly9fLdXDRib5AnBog1ivzlEI7dfSxuHOr
 le+fX1OobfmRz08cWD13rQxDs9U0RvHtbLyCx3541N+oa/YjwDubyw1T3EhgXyCY9x
 RD9TrRsd3ZDvBsYRWrYnHLd2xBW9WwWQbEJLPtCANMY6KAluBoXOWdXKr/SRGVZg49
 dVgvZE43UCYzV+cVIChVvEvSzCt/9nnJebpi1IZIr6EKn3Y2s6tWvBC8/KdaslCeqm
 TGo0Re6ei+/gg==
Received: from localhost (unknown [86.120.21.57])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits)
 server-digest SHA256) (No client certificate requested)
 (Authenticated sender: cristicc)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 4EC0317E0E6E;
 Sat, 30 Nov 2024 01:00:31 +0100 (CET)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Date: Sat, 30 Nov 2024 01:56:33 +0200
Subject: [PATCH 2/3] drm/connector: hdmi: Add support for YUV420 format
 verification
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241130-hdmi-conn-yuv-v1-2-254279a08671@collabora.com>
References: <20241130-hdmi-conn-yuv-v1-0-254279a08671@collabora.com>
In-Reply-To: <20241130-hdmi-conn-yuv-v1-0-254279a08671@collabora.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
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

Provide the necessary constraints verification in
sink_supports_format_bpc() in order to support handling of YUV420
output format.

Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
 drivers/gpu/drm/display/drm_hdmi_state_helper.c | 40 +++++++++++++++++++++++--
 1 file changed, 37 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/display/drm_hdmi_state_helper.c b/drivers/gpu/drm/display/drm_hdmi_state_helper.c
index 0cbcee7e77cd8dff387044487ce28ee5748f5587..3a55881a544a519bb1254968db891c814f831a0f 100644
--- a/drivers/gpu/drm/display/drm_hdmi_state_helper.c
+++ b/drivers/gpu/drm/display/drm_hdmi_state_helper.c
@@ -3,6 +3,7 @@
 #include <drm/drm_atomic.h>
 #include <drm/drm_connector.h>
 #include <drm/drm_edid.h>
+#include <drm/drm_modes.h>
 #include <drm/drm_print.h>
 
 #include <drm/display/drm_hdmi_helper.h>
@@ -114,6 +115,12 @@ sink_supports_format_bpc(const struct drm_connector *connector,
 		return false;
 	}
 
+	if (drm_mode_is_420_only(info, mode) && format != HDMI_COLORSPACE_YUV420) {
+		drm_dbg_kms(dev, "%s format unsupported by the sink for VIC%u.\n",
+			    drm_hdmi_connector_get_output_format_name(format), vic);
+		return false;
+	}
+
 	switch (format) {
 	case HDMI_COLORSPACE_RGB:
 		drm_dbg_kms(dev, "RGB Format, checking the constraints.\n");
@@ -144,9 +151,36 @@ sink_supports_format_bpc(const struct drm_connector *connector,
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
+			drm_dbg_kms(dev, "Sink doesn't support YUV420 for VIC%u.\n", vic);
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
2.47.0

