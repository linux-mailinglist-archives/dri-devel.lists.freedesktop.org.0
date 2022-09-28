Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ED8CF5EE9BB
	for <lists+dri-devel@lfdr.de>; Thu, 29 Sep 2022 00:50:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E880510E7E3;
	Wed, 28 Sep 2022 22:50:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 58CB910E139
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Sep 2022 22:47:47 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi
 [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id A013F47C;
 Thu, 29 Sep 2022 00:47:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1664405265;
 bh=/1YwH4AbghH1yPzBGxuazl2sQOXyIcjiLWvsFqZPD2I=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=kRcULpwpu8tgMhM0CSJymigTuEJrDViMrvMVPNcyy2Zr9NV8YxSPJCGbMeqwPQDoM
 7enX9v5P0WmLUXDAElhT2CpZbhBUCeUqjnxGjW2r+RqLF5KTNYBnY5RIe9Pjsg8XDY
 XLycqkXb1pcXBYls3JviRhWR2ZfoCAzJr3cS7MwY=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 14/37] drm: xlnx: zynqmp_dpsub: Configure blender in
 zynqmp_disp_enable()
Date: Thu, 29 Sep 2022 01:46:56 +0300
Message-Id: <20220928224719.3291-15-laurent.pinchart@ideasonboard.com>
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

To prepare for control of the blender outside of the CRTC code, move the
setup of the blender to the zynqmp_disp_enable() function. This doesn't
introduce any functional change.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/gpu/drm/xlnx/zynqmp_disp.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xlnx/zynqmp_disp.c b/drivers/gpu/drm/xlnx/zynqmp_disp.c
index 14ecc58f5470..c21405e8f9dd 100644
--- a/drivers/gpu/drm/xlnx/zynqmp_disp.c
+++ b/drivers/gpu/drm/xlnx/zynqmp_disp.c
@@ -1387,6 +1387,9 @@ static int zynqmp_disp_create_layers(struct zynqmp_disp *disp)
  */
 static void zynqmp_disp_enable(struct zynqmp_disp *disp)
 {
+	zynqmp_disp_blend_set_output_format(disp, ZYNQMP_DPSUB_FORMAT_RGB);
+	zynqmp_disp_blend_set_bg_color(disp, 0, 0, 0);
+
 	zynqmp_disp_avbuf_enable(disp);
 	/* Choose clock source based on the DT clock handle. */
 	zynqmp_disp_avbuf_set_clocks_sources(disp, disp->pclk_from_ps,
@@ -1461,9 +1464,6 @@ zynqmp_disp_crtc_atomic_enable(struct drm_crtc *crtc,
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

