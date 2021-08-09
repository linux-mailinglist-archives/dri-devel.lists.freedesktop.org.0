Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DF6D13E3D9E
	for <lists+dri-devel@lfdr.de>; Mon,  9 Aug 2021 03:35:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A3E8589993;
	Mon,  9 Aug 2021 01:35:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7973A89956
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Aug 2021 01:35:10 +0000 (UTC)
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id E86E218D3;
 Mon,  9 Aug 2021 03:35:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1628472909;
 bh=RXHqUK2ftjm6wyWTPDHxjVUvYewuKdP5G1PW2tsddKU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=EMM2S87IZOJ7oT38n4eQCxf6A/kS1C626+k1pwrXLzaYVBIza9vsfSj+m60k+I8fp
 Wchl504hD+k6y8dGn9EsA4qsv0lQB8UPRsWJunwGOqJZ064ZnLNZ8V+yQ1VX2pPicc
 xWDnjuk21eFPlOHTJ3nhHPjNr69BMVAaWd41M8uA=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: dri-devel@lists.freedesktop.org
Cc: Michal Simek <michal.simek@xilinx.com>,
 Jianqiang Chen <jianqian@xilinx.com>
Subject: [PATCH 13/36] drm: xlnx: zynqmp_dpsub: Don't pass CRTC to
 zynqmp_disp_setup_clock()
Date: Mon,  9 Aug 2021 04:34:34 +0300
Message-Id: <20210809013457.11266-14-laurent.pinchart@ideasonboard.com>
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

To prepare for usage of the clock setup function outside of the CRTC
code, replace the DRM-specific structures passed as parameters with a
pointer to the zynqmp_disp and the requested clock rate. This doesn't
introduce any functional change.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/gpu/drm/xlnx/zynqmp_disp.c | 18 ++++++++----------
 1 file changed, 8 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/xlnx/zynqmp_disp.c b/drivers/gpu/drm/xlnx/zynqmp_disp.c
index a6800cdb99e7..0f16e9e1f676 100644
--- a/drivers/gpu/drm/xlnx/zynqmp_disp.c
+++ b/drivers/gpu/drm/xlnx/zynqmp_disp.c
@@ -1404,16 +1404,9 @@ static void zynqmp_disp_disable(struct zynqmp_disp *disp)
 	zynqmp_disp_avbuf_disable(disp);
 }
 
-static inline struct zynqmp_disp *crtc_to_disp(struct drm_crtc *crtc)
+static int zynqmp_disp_setup_clock(struct zynqmp_disp *disp,
+				   unsigned long mode_clock)
 {
-	return container_of(crtc, struct zynqmp_disp, crtc);
-}
-
-static int zynqmp_disp_crtc_setup_clock(struct drm_crtc *crtc,
-					struct drm_display_mode *adjusted_mode)
-{
-	struct zynqmp_disp *disp = crtc_to_disp(crtc);
-	unsigned long mode_clock = adjusted_mode->clock * 1000;
 	unsigned long rate;
 	long diff;
 	int ret;
@@ -1438,6 +1431,11 @@ static int zynqmp_disp_crtc_setup_clock(struct drm_crtc *crtc,
 	return 0;
 }
 
+static inline struct zynqmp_disp *crtc_to_disp(struct drm_crtc *crtc)
+{
+	return container_of(crtc, struct zynqmp_disp, crtc);
+}
+
 static void
 zynqmp_disp_crtc_atomic_enable(struct drm_crtc *crtc,
 			       struct drm_atomic_state *state)
@@ -1448,7 +1446,7 @@ zynqmp_disp_crtc_atomic_enable(struct drm_crtc *crtc,
 
 	pm_runtime_get_sync(disp->dev);
 
-	zynqmp_disp_crtc_setup_clock(crtc, adjusted_mode);
+	zynqmp_disp_setup_clock(disp, adjusted_mode->clock * 1000);
 
 	ret = clk_prepare_enable(disp->pclk);
 	if (ret) {
-- 
Regards,

Laurent Pinchart

