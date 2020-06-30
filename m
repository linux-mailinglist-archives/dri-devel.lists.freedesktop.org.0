Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 55EF120FEC6
	for <lists+dri-devel@lfdr.de>; Tue, 30 Jun 2020 23:28:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B5B96E314;
	Tue, 30 Jun 2020 21:28:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 216726E2E9;
 Tue, 30 Jun 2020 21:28:37 +0000 (UTC)
IronPort-SDR: YDoxadaPiEMsX7nWaLnpAvEOjJAwQtviIwC/PI5doihU5Ulr2v+miSUt6YfJqSARTPPJleMLXo
 iuv7a6pxR1HA==
X-IronPort-AV: E=McAfee;i="6000,8403,9668"; a="146386944"
X-IronPort-AV: E=Sophos;i="5.75,298,1589266800"; d="scan'208";a="146386944"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jun 2020 14:28:36 -0700
IronPort-SDR: AD+E1+uQi6JZgSpDAont1NDOBcCJ3IrpvV1Q1gJZku5HjmRc1QJVQl+5V7Xtgvp0kNCKHH+EXE
 0eGdXMvUOnjQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,298,1589266800"; d="scan'208";a="481066628"
Received: from hdwiyono-mobl.amr.corp.intel.com (HELO
 achrisan-DESK2.amr.corp.intel.com) ([10.254.176.225])
 by fmsmga006.fm.intel.com with ESMTP; 30 Jun 2020 14:28:36 -0700
From: Anitha Chrisanthus <anitha.chrisanthus@intel.com>
To: dri-devel@lists.freedesktop.org, anitha.chrisanthus@intel.com,
 bob.j.paauwe@intel.com, edmund.j.dea@intel.com
Subject: [PATCH 07/59] drm/kmb: Set OUT_FORMAT_CFG register
Date: Tue, 30 Jun 2020 14:27:19 -0700
Message-Id: <1593552491-23698-8-git-send-email-anitha.chrisanthus@intel.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1593552491-23698-1-git-send-email-anitha.chrisanthus@intel.com>
References: <1593552491-23698-1-git-send-email-anitha.chrisanthus@intel.com>
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
Cc: daniel.vetter@intel.com, intel-gfx@lists.freedesktop.org,
 rodrigo.vivi@intel.com
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

v2: code review changes
Signed-off-by: Anitha Chrisanthus <anitha.chrisanthus@intel.com>
Reviewed-by: Bob Paauwe <bob.j.paauwe@intel.com>
---
 drivers/gpu/drm/kmb/kmb_plane.c | 14 +++++++++++++-
 drivers/gpu/drm/kmb/kmb_regs.h  |  1 +
 2 files changed, 14 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/kmb/kmb_plane.c b/drivers/gpu/drm/kmb/kmb_plane.c
index 886229a..f609283 100644
--- a/drivers/gpu/drm/kmb/kmb_plane.c
+++ b/drivers/gpu/drm/kmb/kmb_plane.c
@@ -228,7 +228,7 @@ static void kmb_plane_atomic_update(struct drm_plane *plane,
 	unsigned int dma_len;
 	struct kmb_plane *kmb_plane = to_kmb_plane(plane);
 	unsigned int dma_cfg;
-	unsigned int ctrl = 0, val = 0;
+	unsigned int ctrl = 0, val = 0, out_format = 0;
 	unsigned int src_w, src_h, crtc_x, crtc_y;
 	unsigned char plane_id = kmb_plane->id;
 
@@ -299,6 +299,18 @@ static void kmb_plane_atomic_update(struct drm_plane *plane,
 	/* enable DMA */
 	kmb_write(lcd, LCD_LAYERn_DMA_CFG(plane_id), dma_cfg);
 
+	/* FIXME no doc on how to set output format - may need to change
+	 * this later
+	 */
+	if (val & LCD_LAYER_BGR_ORDER)
+		out_format |= LCD_OUTF_BGR_ORDER;
+	else if (val & LCD_LAYER_CRCB_ORDER)
+		out_format |= LCD_OUTF_CRCB_ORDER;
+	/* do not interleave RGB channels for mipi Tx compatibility */
+	out_format |= LCD_OUTF_MIPI_RGB_MODE;
+	/* pixel format from LCD_LAYER_CFG */
+	out_format |= ((val >> 9) & 0x1F);
+	kmb_write(lcd, LCD_OUT_FORMAT_CFG, out_format);
 }
 
 static const struct drm_plane_helper_funcs kmb_plane_helper_funcs = {
diff --git a/drivers/gpu/drm/kmb/kmb_regs.h b/drivers/gpu/drm/kmb/kmb_regs.h
index 14466b8..299ab99 100644
--- a/drivers/gpu/drm/kmb/kmb_regs.h
+++ b/drivers/gpu/drm/kmb/kmb_regs.h
@@ -340,6 +340,7 @@
 #define LCD_OUTF_BGR_ORDER			  (1 << 5)
 #define LCD_OUTF_Y_ORDER			  (1 << 6)
 #define LCD_OUTF_CRCB_ORDER			  (1 << 7)
+#define LCD_OUTF_MIPI_RGB_MODE			  (1 << 18)
 
 #define LCD_HSYNC_WIDTH				(0x4 * 0x801)
 #define LCD_H_BACKPORCH				(0x4 * 0x802)
-- 
2.7.4

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
