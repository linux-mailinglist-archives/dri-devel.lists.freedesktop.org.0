Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A45983E3D9B
	for <lists+dri-devel@lfdr.de>; Mon,  9 Aug 2021 03:35:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D79B189949;
	Mon,  9 Aug 2021 01:35:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ECE968991D
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Aug 2021 01:35:10 +0000 (UTC)
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 603B71929;
 Mon,  9 Aug 2021 03:35:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1628472909;
 bh=srmwVR4A7AwLD/qZR+UYiCgNT8hQKr1ngQayb3yTkDY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=q7YCTEMeqZ2iNneHPC4l+l6VaX+oXbQWWhHdNgAPyi4x8nLgNq5Hap8D8cqdsbGuU
 pGtvTiqTu+Veid8zS08kRRMLIJV8uqPwZZsSf7qlXdBcjAiROu/Q2GdXQzVM82cPUD
 /68vKFUWyykrNj+Q+S0G69o61lqfG9/n/5TvxRrM=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: dri-devel@lists.freedesktop.org
Cc: Michal Simek <michal.simek@xilinx.com>,
 Jianqiang Chen <jianqian@xilinx.com>
Subject: [PATCH 14/36] drm: xlnx: zynqmp_dpsub: Configure blender in
 zynqmp_disp_enable()
Date: Mon,  9 Aug 2021 04:34:35 +0300
Message-Id: <20210809013457.11266-15-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210809013457.11266-1-laurent.pinchart@ideasonboard.com>
References: <20210809013457.11266-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

To prepare for control of the blender outside of the CRTC code, move the
setup of the blender to the zynqmp_disp_enable() function. This doesn't
introduce any functional change.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/gpu/drm/xlnx/zynqmp_disp.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xlnx/zynqmp_disp.c b/drivers/gpu/drm/xlnx/zynqmp_disp.c
index 0f16e9e1f676..bfa38a0b5199 100644
--- a/drivers/gpu/drm/xlnx/zynqmp_disp.c
+++ b/drivers/gpu/drm/xlnx/zynqmp_disp.c
@@ -1381,6 +1381,9 @@ static int zynqmp_disp_create_layers(struct zynqmp_disp *disp)
  */
 static void zynqmp_disp_enable(struct zynqmp_disp *disp)
 {
+	zynqmp_disp_blend_set_output_format(disp, ZYNQMP_DPSUB_FORMAT_RGB);
+	zynqmp_disp_blend_set_bg_color(disp, 0, 0, 0);
+
 	zynqmp_disp_avbuf_enable(disp);
 	/* Choose clock source based on the DT clock handle. */
 	zynqmp_disp_avbuf_set_clocks_sources(disp, disp->pclk_from_ps,
@@ -1455,9 +1458,6 @@ zynqmp_disp_crtc_atomic_enable(struct drm_crtc *crtc,
 		return;
 	}
 
-	zynqmp_disp_blend_set_output_format(disp, ZYNQMP_DPSUB_FORMAT_RGB);
-	zynqmp_disp_blend_set_bg_color(disp, 0, 0, 0);
-
 	zynqmp_disp_enable(disp);
 
 	/* Delay of 3 vblank intervals for timing gen to be stable */
-- 
Regards,

Laurent Pinchart

