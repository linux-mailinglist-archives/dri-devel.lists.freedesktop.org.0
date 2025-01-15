Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E9C2A11CD3
	for <lists+dri-devel@lfdr.de>; Wed, 15 Jan 2025 10:04:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 041CF10E589;
	Wed, 15 Jan 2025 09:04:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="noYiI5DA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B5ADA10E57A
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Jan 2025 09:04:04 +0000 (UTC)
Received: from [127.0.1.1] (91-158-153-178.elisa-laajakaista.fi
 [91.158.153.178])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 82C233EEC;
 Wed, 15 Jan 2025 10:03:05 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1736931786;
 bh=vSNfl+dk45d5cm6nnQngiziPUpAD1SE0JXcPFtyqb6E=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=noYiI5DAFQ6kPyO3/qVdw3HTWXDGdKEyFyz83owDgBSAKxh10Ii+5GZB5Igag/+2v
 yZp9rmVcyFn/stYtvzUoZtTXvlZwvgC/SdpIHuSF5kX35H0QufQ/N0MppSHDzIY6WP
 ASSCowLPVcLujeWHrlFqZMGF4+3p3GTNlsf/w9Rk=
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Date: Wed, 15 Jan 2025 11:03:37 +0200
Subject: [PATCH v2 08/10] drm: xlnx: zynqmp: Add support for Y8 and
 Y10_LE32
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250115-xilinx-formats-v2-8-160327ca652a@ideasonboard.com>
References: <20250115-xilinx-formats-v2-0-160327ca652a@ideasonboard.com>
In-Reply-To: <20250115-xilinx-formats-v2-0-160327ca652a@ideasonboard.com>
To: Vishal Sagar <vishal.sagar@amd.com>, 
 Anatoliy Klymenko <anatoliy.klymenko@amd.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Michal Simek <michal.simek@amd.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1966;
 i=tomi.valkeinen@ideasonboard.com; h=from:subject:message-id;
 bh=vSNfl+dk45d5cm6nnQngiziPUpAD1SE0JXcPFtyqb6E=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBnh3n6RKceVGVDHfg+MYO+EE3OqKVDxw4mxlMrB
 yzt/Jj5WiqJAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCZ4d5+gAKCRD6PaqMvJYe
 9bSHD/4jmLy2w6nPu78ohwU4OdHwdovGAZ8LtpyIrZ9aOLc3qAbLLUCXwwA3hELlGG3jvUj7Mlg
 bvJknJuvbWfu5ekLhGAr/4R5ie/dt0dpKcEoe7ISN0MRxh13SHL/1oE1joCpgaAwdtJlJq8gyoJ
 ybGldR+PNsxvHASpvK4uGSL69+XLJp8/OyEjFN3ccwi417kUVJzushnPkM3pNQPdZSBY0yCYXoR
 v5JosH1dBNOT59MgfDiTWdtE2m42reAxa8Fdnzxba8TZdUO4p4ZyuG3ERUheH7nJZk7HRXSS44E
 PnY7Pe/9VkAg+XqpBVujWF1AnvUPL940E2Un0vs544YFs1cX4eTkxLubCnRc8bu9G55D2T5NX/e
 S/dfQDtSED6OIbf5FBKXVmM9Uz/GXUXXcnnhkwpQuRGu7z7ynPSQimS5SU1kXK+YWnCbqoGH33Z
 L5zzsZFNVfISUttrQKYkRJZ71D+zaDLIqUGv+rK//RJsARNw7zk15jLRyEnHm/fKzTq13iJ4zKr
 ESm4QHaytEGvmTmODaKJg6PM8FksqkQYoEOKIwWLwL/+Kv5TKACFUrql40zPC7CHO96PRoEI2dz
 mWFlK6l7FVYKy+YV1P+uLqSZztvK8OqGdtcwZr/wL/K9Q/5PCjB4CU2BaC0ftrAsIaAsKZcmi6/
 tBkZdZu6xkOFzxw==
X-Developer-Key: i=tomi.valkeinen@ideasonboard.com; a=openpgp;
 fpr=C4380C3E965EFD81079FF3A7FA3DAA8CBC961EF5
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

Add support for Y8 and Y10_LE32 formats. We also need to add new csc
matrices for the y-only formats.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
 drivers/gpu/drm/xlnx/zynqmp_disp.c | 26 +++++++++++++++++++++++++-
 1 file changed, 25 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xlnx/zynqmp_disp.c b/drivers/gpu/drm/xlnx/zynqmp_disp.c
index 3998754e367e..44cfee6a0e32 100644
--- a/drivers/gpu/drm/xlnx/zynqmp_disp.c
+++ b/drivers/gpu/drm/xlnx/zynqmp_disp.c
@@ -309,6 +309,16 @@ static const struct zynqmp_disp_format avbuf_vid_fmts[] = {
 		.buf_fmt	= ZYNQMP_DISP_AV_BUF_FMT_NL_VID_YV16CI_10,
 		.swap		= false,
 		.sf		= scaling_factors_101010,
+	}, {
+		.drm_fmt	= DRM_FORMAT_Y8,
+		.buf_fmt	= ZYNQMP_DISP_AV_BUF_FMT_NL_VID_MONO,
+		.swap		= false,
+		.sf		= scaling_factors_888,
+	}, {
+		.drm_fmt	= DRM_FORMAT_Y10_LE32,
+		.buf_fmt	= ZYNQMP_DISP_AV_BUF_FMT_NL_VID_YONLY_10,
+		.swap		= false,
+		.sf		= scaling_factors_101010,
 	},
 };
 
@@ -699,6 +709,16 @@ static const u32 csc_sdtv_to_rgb_offsets[] = {
 	0x0, 0x1800, 0x1800
 };
 
+static const u16 csc_sdtv_to_rgb_yonly_matrix[] = {
+	0x0, 0x0, 0x1000,
+	0x0, 0x0, 0x1000,
+	0x0, 0x0, 0x1000,
+};
+
+static const u32 csc_sdtv_to_rgb_yonly_offsets[] = {
+	0x1800, 0x1800, 0x0
+};
+
 /**
  * zynqmp_disp_blend_set_output_format - Set the output format of the blender
  * @disp: Display controller
@@ -848,7 +868,11 @@ static void zynqmp_disp_blend_layer_enable(struct zynqmp_disp *disp,
 				ZYNQMP_DISP_V_BLEND_LAYER_CONTROL(layer->id),
 				val);
 
-	if (layer->drm_fmt->is_yuv) {
+	if (layer->drm_fmt->format == DRM_FORMAT_Y8 ||
+	    layer->drm_fmt->format == DRM_FORMAT_Y10_LE32) {
+		coeffs = csc_sdtv_to_rgb_yonly_matrix;
+		offsets = csc_sdtv_to_rgb_yonly_offsets;
+	} else if (layer->drm_fmt->is_yuv) {
 		coeffs = csc_sdtv_to_rgb_matrix;
 		offsets = csc_sdtv_to_rgb_offsets;
 	} else {

-- 
2.43.0

