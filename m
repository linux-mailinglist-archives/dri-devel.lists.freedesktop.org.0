Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 60917A71764
	for <lists+dri-devel@lfdr.de>; Wed, 26 Mar 2025 14:23:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ADAC110E12A;
	Wed, 26 Mar 2025 13:23:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="aNzM1Vtg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7094810E6CB
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Mar 2025 13:23:25 +0000 (UTC)
Received: from [127.0.1.1] (91-158-153-178.elisa-laajakaista.fi
 [91.158.153.178])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id EF1871934;
 Wed, 26 Mar 2025 14:21:35 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1742995296;
 bh=n4H1G7bDwVSyN9af32Phxvop+mYwINBt64VvrVEfgwI=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=aNzM1Vtg24SjQ2sJTEyhHj0fPi9/oUHgRzhotAuQ2FagHu6244HzQzebUuZq5N7NI
 NmqPngMcW2GtVzQClTBLA31x1Yy58zq1Vmi8BM1THzWTHDWrH939P+KKfKGUdOQHae
 lvu9BKIavW/dEc6P6Hf5+OhFqY7vtfhHzgBEX7UI=
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Date: Wed, 26 Mar 2025 15:22:51 +0200
Subject: [PATCH v4 08/11] drm: xlnx: zynqmp: Add support for XV15 & XV20
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250326-xilinx-formats-v4-8-322a300c6d72@ideasonboard.com>
References: <20250326-xilinx-formats-v4-0-322a300c6d72@ideasonboard.com>
In-Reply-To: <20250326-xilinx-formats-v4-0-322a300c6d72@ideasonboard.com>
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
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
X-Mailer: b4 0.15-dev-c25d1
X-Developer-Signature: v=1; a=openpgp-sha256; l=936;
 i=tomi.valkeinen@ideasonboard.com; h=from:subject:message-id;
 bh=n4H1G7bDwVSyN9af32Phxvop+mYwINBt64VvrVEfgwI=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBn4//C9nW48zLc5yoHs96DcP2KozatkETh+iI3k
 sHsf2q7YkWJAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCZ+P/wgAKCRD6PaqMvJYe
 9QzSEACFG1eIBhJcW2WERjhx9t+sclrPU9jrPsfmW6Hy3GMW1qy2+p/m6DWqfyix6UPo/bSOhw8
 dIeqvx5BY7SbB9DSbkkQin9yDIbWi9XTwWpRDOkyZtM7Ufw78bchBZlTXu/F2tfQqpA/IgmDpTz
 1fBrPJUxBfDk3xI0LrH/3wlrKYmusg1arVlQt6LjQ7+TR0F+mvKSmMK1uDbq+K54RzexzdBQ+R/
 6dQI0LxArQ6HK4dLRJamSLHXTcbv/ahLCWHH8lAPjw6MVunRe7WOMLFEx0298F+b0Yddb1BrX1l
 4cx254ObM35yYoV3wvSq0RSZWPx1WHD1PKV9ObBF/nTy9DtleV0yr765ce8DXIXej+jOQxp+TOX
 IayCsjWO9S11EsA+Jh/4qUd4fR5kaUaP2oolZgmt28qbdI+iFP91XAxMAhDftDsXWwgnMALTyIW
 IZtr2WKiAKiNEwPiZgC5rkHpoYZeLfzkJbjzYciWJH6zrP4IgE0sgTeGAlfvQ9z0UfuUlHoVGRC
 9fkpu7oSFcwgNSE8FjmG9qsRTlyAP6Epi8WD/NBXtfYWNPYZjzPAFLcHAR58dh005VzGFee/dPW
 7fjdcIhOeipupxtoSYPPsVnsmJ8F2mWRqNKWVX5DMunOhNWe1vjePWEspTrr8vebH02qnpXudto
 TRzs8OZGqR/DGjw==
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

Add support for XV15 & XV20 formats.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
 drivers/gpu/drm/xlnx/zynqmp_disp.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/gpu/drm/xlnx/zynqmp_disp.c b/drivers/gpu/drm/xlnx/zynqmp_disp.c
index b9883ea2d03e..1dc77f2e4262 100644
--- a/drivers/gpu/drm/xlnx/zynqmp_disp.c
+++ b/drivers/gpu/drm/xlnx/zynqmp_disp.c
@@ -297,6 +297,16 @@ static const struct zynqmp_disp_format avbuf_vid_fmts[] = {
 		.buf_fmt	= ZYNQMP_DISP_AV_BUF_FMT_NL_VID_YV16CI_420,
 		.swap		= true,
 		.sf		= scaling_factors_888,
+	}, {
+		.drm_fmt	= DRM_FORMAT_XV15,
+		.buf_fmt	= ZYNQMP_DISP_AV_BUF_FMT_NL_VID_YV16CI_420_10,
+		.swap		= false,
+		.sf		= scaling_factors_101010,
+	}, {
+		.drm_fmt	= DRM_FORMAT_XV20,
+		.buf_fmt	= ZYNQMP_DISP_AV_BUF_FMT_NL_VID_YV16CI_10,
+		.swap		= false,
+		.sf		= scaling_factors_101010,
 	},
 };
 

-- 
2.43.0

