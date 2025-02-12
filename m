Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 757D7A32946
	for <lists+dri-devel@lfdr.de>; Wed, 12 Feb 2025 15:57:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D50E10E8E5;
	Wed, 12 Feb 2025 14:56:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="wUVJvYpb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CCE2C10E8E4
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Feb 2025 14:56:56 +0000 (UTC)
Received: from [127.0.1.1] (91-158-153-178.elisa-laajakaista.fi
 [91.158.153.178])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 85FF51AB3;
 Wed, 12 Feb 2025 15:55:35 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1739372136;
 bh=rZ+iMADIBNdMO0mVy7oobeXfg2lKZKrn5V9QH3VTLRw=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=wUVJvYpbm6RHZwXxY71g3mkHaZjgji+traGy6PPKiXGJy6WS3OOHJiEV/k+HgMqaU
 tcIlrhq5Bnluij+M470c45N5oeU2cpINx+9M5Yi7RGq/OTBarJh0QeOx0fPFMNjrRO
 RNtEZmwbmE0M2D/1gFrAPQOML+guI24FkCMPnBIo=
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Date: Wed, 12 Feb 2025 16:56:13 +0200
Subject: [PATCH v3 09/11] drm: xlnx: zynqmp: Add support for Y8 and
 Y10_LE32
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250212-xilinx-formats-v3-9-90d0fe106995@ideasonboard.com>
References: <20250212-xilinx-formats-v3-0-90d0fe106995@ideasonboard.com>
In-Reply-To: <20250212-xilinx-formats-v3-0-90d0fe106995@ideasonboard.com>
To: Vishal Sagar <vishal.sagar@amd.com>, 
 Anatoliy Klymenko <anatoliy.klymenko@amd.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Michal Simek <michal.simek@amd.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, 
 Geert Uytterhoeven <geert@linux-m68k.org>, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1964;
 i=tomi.valkeinen@ideasonboard.com; h=from:subject:message-id;
 bh=rZ+iMADIBNdMO0mVy7oobeXfg2lKZKrn5V9QH3VTLRw=;
 b=kA0DAAgB+j2qjLyWHvUByyZiAGestquh7IET5CXQqVbouRNgLjXdlQkfpTxWV+ns75w+6eyML
 YkCMwQAAQgAHRYhBMQ4DD6WXv2BB5/zp/o9qoy8lh71BQJnrLarAAoJEPo9qoy8lh71948P/1bF
 ay+8vlWNZUKEsEZRBwwWgcYhW/6Qj81AdLt3rWChxCZmVxY2ZEfXbd515YFUfJtopKBd0jEp4Kw
 xEMLhxn1H29FJdQhO9IK8oZG7BrhQcGBKKi413L4Q2/Qzluorr6JmpeRtI7on66m5GvM9icsTJ+
 C7B27jAGblyP4SaFeDcU4ReURcozb6p5V1PVI/UaeBGT18+hJnSO5ebaoijo2cp7LjhTKc5l2Lf
 5wi9Ae2Pr1Z4Rp05ByT8MrHGT3rcG2CtNwhLW/77KNSY1EoQmpzJ5YFPCPRuQQ9Z9o/CD3sAGO6
 NFMUJBiD6PnNDEyc5adOSD7VzKxwnmufrfte956JU1SQazRTc8ams5i97b10AafOoI/yX8JxMgx
 78QmLl0sqj4SGJSybyEyI6wu78xrNyUug+oMV3f68SHTuH0Oe//C43l5vRoSi1xmWkIcpzXJD2A
 vHLsf5fF/5Y10CmW2x4W9fXgoYhJiv/GCO+x7DRo8u0nE7UxrM55vv+TvsYnVNXJ/Kb0lR4ZoOe
 jj3dl/T4DUgrYDnse8yPwjnmARvLZ/frLtnOkPN1eBdERLdgZDOJgtKnY49QjnlUQDehegb27jl
 i74s19z84qRUg/H11OT54FlngyeXLlgp8ZJ0MKawezEy+29S09w3zXCb2dTN6wJkMl0p7nFRQtJ
 szJRi
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
index 32031f52e114..c820df97aa28 100644
--- a/drivers/gpu/drm/xlnx/zynqmp_disp.c
+++ b/drivers/gpu/drm/xlnx/zynqmp_disp.c
@@ -307,6 +307,16 @@ static const struct zynqmp_disp_format avbuf_vid_fmts[] = {
 		.buf_fmt	= ZYNQMP_DISP_AV_BUF_FMT_NL_VID_YV16CI_10,
 		.swap		= false,
 		.sf		= scaling_factors_101010,
+	}, {
+		.drm_fmt	= DRM_FORMAT_Y8,
+		.buf_fmt	= ZYNQMP_DISP_AV_BUF_FMT_NL_VID_MONO,
+		.swap		= false,
+		.sf		= scaling_factors_888,
+	}, {
+		.drm_fmt	= DRM_FORMAT_Y10_P32,
+		.buf_fmt	= ZYNQMP_DISP_AV_BUF_FMT_NL_VID_YONLY_10,
+		.swap		= false,
+		.sf		= scaling_factors_101010,
 	},
 };
 
@@ -697,6 +707,16 @@ static const u32 csc_sdtv_to_rgb_offsets[] = {
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
@@ -846,7 +866,11 @@ static void zynqmp_disp_blend_layer_enable(struct zynqmp_disp *disp,
 				ZYNQMP_DISP_V_BLEND_LAYER_CONTROL(layer->id),
 				val);
 
-	if (layer->drm_fmt->is_yuv) {
+	if (layer->drm_fmt->format == DRM_FORMAT_Y8 ||
+	    layer->drm_fmt->format == DRM_FORMAT_Y10_P32) {
+		coeffs = csc_sdtv_to_rgb_yonly_matrix;
+		offsets = csc_sdtv_to_rgb_yonly_offsets;
+	} else if (layer->drm_fmt->is_yuv) {
 		coeffs = csc_sdtv_to_rgb_matrix;
 		offsets = csc_sdtv_to_rgb_offsets;
 	} else {

-- 
2.43.0

