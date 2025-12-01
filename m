Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E192C97341
	for <lists+dri-devel@lfdr.de>; Mon, 01 Dec 2025 13:19:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 816ED10E3C1;
	Mon,  1 Dec 2025 12:19:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="hDa4Za0s";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AEFF410E3BF
 for <dri-devel@lists.freedesktop.org>; Mon,  1 Dec 2025 12:19:29 +0000 (UTC)
Received: from [127.0.1.1] (91-158-153-178.elisa-laajakaista.fi
 [91.158.153.178])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 6E9561F06;
 Mon,  1 Dec 2025 13:17:14 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1764591435;
 bh=L1FSsg0Qh6Izmf4vGGUqKbG48MvEYOAEvR+4KJGxUuI=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=hDa4Za0sW5Oo7XHFNupAV4PRc1Nt3gz8rkNRYzCipCzmK9Spwgf+sHcBZN33VZWFm
 ue3oEbiI0Y1bOQwmJoAHrxDRpDpEmhvlLbttJ6uhsG8b3TtVtC8kADdgzBBtWeyB+m
 yY3iVoFec7XJQLrd3Ld0juK32m8VNMwcM3iQ1YRU=
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Date: Mon, 01 Dec 2025 14:18:51 +0200
Subject: [PATCH v7 09/11] drm: xlnx: zynqmp: Add support for Y8 and Y10_P32
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251201-xilinx-formats-v7-9-1e1558adfefc@ideasonboard.com>
References: <20251201-xilinx-formats-v7-0-1e1558adfefc@ideasonboard.com>
In-Reply-To: <20251201-xilinx-formats-v7-0-1e1558adfefc@ideasonboard.com>
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
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Pekka Paalanen <ppaalanen@gmail.com>, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
X-Mailer: b4 0.15-dev-c25d1
X-Developer-Signature: v=1; a=openpgp-sha256; l=2007;
 i=tomi.valkeinen@ideasonboard.com; h=from:subject:message-id;
 bh=L1FSsg0Qh6Izmf4vGGUqKbG48MvEYOAEvR+4KJGxUuI=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBpLYfFIqEgs4lbSgiKpq5FRbRJAzhzSWQ/j6qGC
 jjdjCvPduaJAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCaS2HxQAKCRD6PaqMvJYe
 9fbKD/9Tsg0ErQBoTlrY4x2PU0Sj9mgyinbQx0UA4azdeiRfgPieTK3wwRtXvLOGsRCib/RONoP
 Dp6JgoIwa593CLxWBSJzfEyzvARseCPXqYDQSqyrejEdVD5+GpiQIEOkPu3OjAKkJ917CknJaPs
 dfzswwEV/9ueE3TtkafujVXD/RgQkJAjkJ5nf4RJ7C4YhiPiIPK84kvWX7ZORFjHo/KTCq+sMmI
 USBjpbfZJn+XFIczwKPbVtoCGe1Qh5OjxMBE1ge5Czwa0NH8cObca96rDWkAHi8WPO5Mpgjto4Q
 Q3vraT3OTWCSLiHGVIxq41NzU9BRjBq2hG5LICluWtHw5r9qh2Vsd3Pud/PR+gb6rCiFEZzVsBE
 G91wHIngOKNgZjyVLbk6vpvDdn2MOi1atQOBjWLS3OnwfKYbGyQoEzuh71GVG5tvTKCmbrRmdsH
 XCg80x/je0VPDPpdieQuqyR4/z0BuKPSMD4mEW+S1dWB9twX1O5Qfc5Ewf+bEnzDw57C+x0Kq8l
 HktEao+p3IV5hR3IgGAyfR5O0ardTL9dr4YEhtOyMyA8JCBU2OKWOExDu+qFVc3ijXMEcdZDPIg
 h4M7SteiJ6Mf7XZzHH1bKngMuYaRmXlvWdimCitGcVhfG3Eq1bImW86rms8k6Ayg9ZUC9HsHAJR
 +0we/uJW10GHkuQ==
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

Add support for Y8 and Y10_P32 formats. We also need to add new csc
matrices for the y-only formats.

Reviewed-by: Vishal Sagar <vishal.sagar@amd.com>
Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
 drivers/gpu/drm/xlnx/zynqmp_disp.c | 26 +++++++++++++++++++++++++-
 1 file changed, 25 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xlnx/zynqmp_disp.c b/drivers/gpu/drm/xlnx/zynqmp_disp.c
index 1dc77f2e4262..fe111fa8cc13 100644
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
+	0x0, 0x0, 0x0
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

