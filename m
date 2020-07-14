Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E77421FF17
	for <lists+dri-devel@lfdr.de>; Tue, 14 Jul 2020 22:59:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D7C816E9B7;
	Tue, 14 Jul 2020 20:58:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 173EC6E972;
 Tue, 14 Jul 2020 20:58:23 +0000 (UTC)
IronPort-SDR: 1Zo9wzWMfR8lwdkOHPwv4dh1SvXz2DtNe36olShneMyLrvIShB0DHgRsrjCtY73I8URdGH3g8H
 ODsgIzLRe3+A==
X-IronPort-AV: E=McAfee;i="6000,8403,9682"; a="233883727"
X-IronPort-AV: E=Sophos;i="5.75,352,1589266800"; d="scan'208";a="233883727"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jul 2020 13:58:22 -0700
IronPort-SDR: 0BVX6WTWqi6nAkt9QxXQnNBgSEfnWnzJ/j4rl9d/Z9ksznFWgiZ7lHD1W+Ti2wmjXiRyszVVj6
 vBOvbu2mZJTg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,352,1589266800"; d="scan'208";a="316504082"
Received: from ahanamuk-mobl.amr.corp.intel.com (HELO
 achrisan-DESK2.amr.corp.intel.com) ([10.251.155.61])
 by orsmga008.jf.intel.com with ESMTP; 14 Jul 2020 13:58:21 -0700
From: Anitha Chrisanthus <anitha.chrisanthus@intel.com>
To: dri-devel@lists.freedesktop.org, anitha.chrisanthus@intel.com,
 bob.j.paauwe@intel.com, edmund.j.dea@intel.com
Subject: [PATCH v2 07/59] drm/kmb: Set OUT_FORMAT_CFG register
Date: Tue, 14 Jul 2020 13:56:53 -0700
Message-Id: <1594760265-11618-8-git-send-email-anitha.chrisanthus@intel.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1594760265-11618-1-git-send-email-anitha.chrisanthus@intel.com>
References: <1594760265-11618-1-git-send-email-anitha.chrisanthus@intel.com>
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
index 74a3573..cb05cb8 100644
--- a/drivers/gpu/drm/kmb/kmb_plane.c
+++ b/drivers/gpu/drm/kmb/kmb_plane.c
@@ -208,7 +208,7 @@ static void kmb_plane_atomic_update(struct drm_plane *plane,
 	unsigned int dma_len;
 	struct kmb_plane *kmb_plane = to_kmb_plane(plane);
 	unsigned int dma_cfg;
-	unsigned int ctrl = 0, val = 0;
+	unsigned int ctrl = 0, val = 0, out_format = 0;
 	unsigned int src_w, src_h, crtc_x, crtc_y;
 	unsigned char plane_id = kmb_plane->id;
 
@@ -279,6 +279,18 @@ static void kmb_plane_atomic_update(struct drm_plane *plane,
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
index 8346a04..8b67f2b 100644
--- a/drivers/gpu/drm/kmb/kmb_regs.h
+++ b/drivers/gpu/drm/kmb/kmb_regs.h
@@ -320,6 +320,7 @@
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
