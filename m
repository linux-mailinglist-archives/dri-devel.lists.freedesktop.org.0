Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 189179E36A7
	for <lists+dri-devel@lfdr.de>; Wed,  4 Dec 2024 10:31:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5729610ECA3;
	Wed,  4 Dec 2024 09:31:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="hTxi8s/9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B98B10EC9E
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Dec 2024 09:31:41 +0000 (UTC)
Received: from [127.0.1.1] (91-157-155-49.elisa-laajakaista.fi [91.157.155.49])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id D15961BAE;
 Wed,  4 Dec 2024 10:31:11 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1733304672;
 bh=vSNfl+dk45d5cm6nnQngiziPUpAD1SE0JXcPFtyqb6E=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=hTxi8s/9pGX0RXDCw/5wUmsbDZLdcqEyGbq2h2eXYvHIuwhXnetvc+UDTJlMbLi9z
 kvO0/Sx6VpkBORWhthm/DS9KznquwO3G4hmnZ8Mp/Hk1z2OCVfS9nyKgn5J02fXpwm
 3BwBSoRP6Q0gStzLTzQWtKtnjS9+GM8xel3UbEGw=
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Date: Wed, 04 Dec 2024 11:31:08 +0200
Subject: [PATCH 08/10] drm: xlnx: zynqmp: Add support for Y8 and Y10_LE32
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241204-xilinx-formats-v1-8-0bf2c5147db1@ideasonboard.com>
References: <20241204-xilinx-formats-v1-0-0bf2c5147db1@ideasonboard.com>
In-Reply-To: <20241204-xilinx-formats-v1-0-0bf2c5147db1@ideasonboard.com>
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
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBnUCFz7vKwL/JknjDOTrW3yKdDoVLc847EBOBYe
 fqlqXtBeuKJAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCZ1AhcwAKCRD6PaqMvJYe
 9VFqEACObI98inSgLPDGEREQkqyBJlHdMI9Vu8S1Oj9irzsyK1xj6RQKZc6BzdeH8EnxxAMjQWn
 hn5ydfZYeY36La7UAH/xFjB+vQCgD/Y8aHXotS5BEFD7Rimhu3936ldJ+OH0rsIHNM+QS2FZj4n
 GnJMwRRiXqUfoVE4fS/XwCriSG5RtVUO/aQLUJtOrT1p3dM4Jh3MpHjFRV+EJrt9TjT+i2km55i
 il0V9bRmQUmTD+20wN4BcDb4aBGJF4vxPam5sGCcTwwdImsXMdtkXDw9xlbOJKoDsM7FMTnXg6T
 yZakjwN4i5ePrHhZU43VlL67jpIqvMCQsFk4o0tnAeigZ9I83LeIcxYRp6jbPjSmG++jT3wt+C0
 ktCspNfd325GPImrY0vhYvxLfkBzOSg5mC53H15zEEHmQ0KJJnxPx9FkZFsAPmOL1+JQGCjXczD
 m0vco/6XsEQcuV9yjbRIkbUZ+z24zBTsTZfzP8UQk6LAHAn493Q4tgK7hEg3MngzF2oNPyq2tc5
 5yyj9jk6V9w57i3OyhqbuvruA8X+YTVR8Z834itz0bZYOMa0hSknuGC8hvRCEdly/eK/Id19vb7
 fH9lPEHJV8NKBHcfzNPVtQ3BR3w13UUk4eKWi6THPQc1+eR1H9N6lkwAn1jUgiVGBxlG5CniiIC
 VZevhcWbSVN7OZw==
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

