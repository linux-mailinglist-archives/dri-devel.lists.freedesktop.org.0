Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AB8EF5EE994
	for <lists+dri-devel@lfdr.de>; Thu, 29 Sep 2022 00:48:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A76810E237;
	Wed, 28 Sep 2022 22:47:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8117210E768
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Sep 2022 22:47:45 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi
 [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 0C2806BE;
 Thu, 29 Sep 2022 00:47:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1664405264;
 bh=mnvvmWBQlDEpQqt8P5xsiz3pPGkyXZyA90VHZMDFQns=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Es3ps5IHgJKM76AbaMf0vzTsREoHP+2NazSeehUIZ/t5TPsfZ8b0br9WKXsYNyXLM
 N8kC463c23jUHkC8y6twrV0HpUuD7PcK4ZdLnA12GzsfkCEY12vNCkU0Vky5U3k/3i
 orlnsKLpijunnAWV1OslFlphUDhPpHy13v2MGUO8=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 13/37] drm: xlnx: zynqmp_dpsub: Don't pass CRTC to
 zynqmp_disp_setup_clock()
Date: Thu, 29 Sep 2022 01:46:55 +0300
Message-Id: <20220928224719.3291-14-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220928224719.3291-1-laurent.pinchart@ideasonboard.com>
References: <20220928224719.3291-1-laurent.pinchart@ideasonboard.com>
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
Cc: Michal Simek <michal.simek@xilinx.com>,
 Jianqiang Chen <jianqian@xilinx.com>
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
index eae28a3c6d45..14ecc58f5470 100644
--- a/drivers/gpu/drm/xlnx/zynqmp_disp.c
+++ b/drivers/gpu/drm/xlnx/zynqmp_disp.c
@@ -1410,16 +1410,9 @@ static void zynqmp_disp_disable(struct zynqmp_disp *disp)
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
@@ -1444,6 +1437,11 @@ static int zynqmp_disp_crtc_setup_clock(struct drm_crtc *crtc,
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
@@ -1454,7 +1452,7 @@ zynqmp_disp_crtc_atomic_enable(struct drm_crtc *crtc,
 
 	pm_runtime_get_sync(disp->dev);
 
-	zynqmp_disp_crtc_setup_clock(crtc, adjusted_mode);
+	zynqmp_disp_setup_clock(disp, adjusted_mode->clock * 1000);
 
 	ret = clk_prepare_enable(disp->pclk);
 	if (ret) {
-- 
Regards,

Laurent Pinchart

