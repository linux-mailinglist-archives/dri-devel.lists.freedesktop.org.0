Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4883421FF0E
	for <lists+dri-devel@lfdr.de>; Tue, 14 Jul 2020 22:58:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 50DBE6E99E;
	Tue, 14 Jul 2020 20:58:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC8FF6E98F;
 Tue, 14 Jul 2020 20:58:25 +0000 (UTC)
IronPort-SDR: 3bdIQCwBRtoIW+aQhAEQKpu8sOh4C/1LEeoCsWe4E+CuE0RHEpBm96vkVGVpdO1Rs0kjpciN1p
 XpsEL3Y6943A==
X-IronPort-AV: E=McAfee;i="6000,8403,9682"; a="150444557"
X-IronPort-AV: E=Sophos;i="5.75,352,1589266800"; d="scan'208";a="150444557"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jul 2020 13:58:25 -0700
IronPort-SDR: 5NYUGcvRvLUDmshhQwdd4G8sJ/b8bW8kqAyX6mJFVLlcOg8MtcZW/zaNBIixS82drWTLnTYMBU
 Hnp6GbmVRLbQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,352,1589266800"; d="scan'208";a="316504107"
Received: from ahanamuk-mobl.amr.corp.intel.com (HELO
 achrisan-DESK2.amr.corp.intel.com) ([10.251.155.61])
 by orsmga008.jf.intel.com with ESMTP; 14 Jul 2020 13:58:25 -0700
From: Anitha Chrisanthus <anitha.chrisanthus@intel.com>
To: dri-devel@lists.freedesktop.org, anitha.chrisanthus@intel.com,
 bob.j.paauwe@intel.com, edmund.j.dea@intel.com
Subject: [PATCH v2 14/59] drm/kmb: Correct address offsets for mipi registers
Date: Tue, 14 Jul 2020 13:57:00 -0700
Message-Id: <1594760265-11618-15-git-send-email-anitha.chrisanthus@intel.com>
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

Mipi HS registers start at an additional offset of 0x400 which needs to be
added at the register macro definition and not at the read/write function
level.

v2: replaced calculations with macro to make code simpler
Signed-off-by: Anitha Chrisanthus <anitha.chrisanthus@intel.com>
Reviewed-by: Bob Paauwe <bob.j.paauwe@intel.com>
---
 drivers/gpu/drm/kmb/kmb_dsi.c  |  16 +++---
 drivers/gpu/drm/kmb/kmb_regs.h | 116 ++++++++++++++++++++++++-----------------
 2 files changed, 75 insertions(+), 57 deletions(-)

diff --git a/drivers/gpu/drm/kmb/kmb_dsi.c b/drivers/gpu/drm/kmb/kmb_dsi.c
index a685a7a..a255210 100644
--- a/drivers/gpu/drm/kmb/kmb_dsi.c
+++ b/drivers/gpu/drm/kmb/kmb_dsi.c
@@ -423,20 +423,20 @@ static void mipi_tx_fg_cfg_regs(struct kmb_drm_private *dev_priv,
 	 *REG_VSYNC_WIDTH0: [15:0]-VSA for channel0, [31:16]-VSA for channel1
 	 *REG_VSYNC_WIDTH1: [15:0]-VSA for channel2, [31:16]-VSA for channel3
 	 */
-	offset = (frame_gen % 2) * 16;
-	reg_adr = MIPI_TXm_HS_VSYNC_WIDTHn(ctrl_no, frame_gen);
+	offset = (frame_gen % 2)*16;
+	reg_adr = MIPI_TXm_HS_VSYNC_WIDTHn(ctrl_no, frame_gen/2);
 	kmb_write_bits_mipi(reg_adr, offset, 16, fg_cfg->vsync_width);
 
-	/*v backporch - same register config like vsync width */
-	reg_adr = MIPI_TXm_HS_V_BACKPORCHESn(ctrl_no, frame_gen);
+	/*v backporch - same register config like vsync width*/
+	reg_adr = MIPI_TXm_HS_V_BACKPORCHESn(ctrl_no, frame_gen/2);
 	kmb_write_bits_mipi(reg_adr, offset, 16, fg_cfg->v_backporch);
 
-	/*v frontporch - same register config like vsync width */
-	reg_adr = MIPI_TXm_HS_V_FRONTPORCHESn(ctrl_no, frame_gen);
+	/*v frontporch - same register config like vsync width*/
+	reg_adr = MIPI_TXm_HS_V_FRONTPORCHESn(ctrl_no, frame_gen/2);
 	kmb_write_bits_mipi(reg_adr, offset, 16, fg_cfg->v_frontporch);
 
-	/*v active - same register config like vsync width */
-	reg_adr = MIPI_TXm_HS_V_ACTIVEn(ctrl_no, frame_gen);
+	/*v active - same register config like vsync width*/
+	reg_adr = MIPI_TXm_HS_V_ACTIVEn(ctrl_no, frame_gen/2);
 	kmb_write_bits_mipi(reg_adr, offset, 16, fg_cfg->v_active);
 
 	/*hsyc width */
diff --git a/drivers/gpu/drm/kmb/kmb_regs.h b/drivers/gpu/drm/kmb/kmb_regs.h
index 2d25c50..381e255 100644
--- a/drivers/gpu/drm/kmb/kmb_regs.h
+++ b/drivers/gpu/drm/kmb/kmb_regs.h
@@ -375,10 +375,10 @@
  *		   MIPI controller control register defines
  ***********************************************i****************************/
 #define MIPI0_HS_BASE_ADDR			(MIPI_BASE_ADDR + 0x400)
-#define MIPI_CTRL_HS_BASE_ADDR			(0x400)
+#define HS_OFFSET(M)				((M + 1) * 0x400)
 
 #define MIPI_TX_HS_CTRL				(0x0)
-#define   MIPI_TXm_HS_CTRL(M)			(MIPI_TX_HS_CTRL + (0x400*M))
+#define   MIPI_TXm_HS_CTRL(M)			(MIPI_TX_HS_CTRL + HS_OFFSET(M))
 #define   HS_CTRL_EN				(1 << 0)
 #define   HS_CTRL_CSIDSIN			(1 << 2) /*1:CSI 0:DSI*/
 #define   TX_SOURCE				(1 << 3) /*1:LCD, 0:DMA*/
@@ -391,7 +391,7 @@
 #define   HSCLKIDLE_CNT				(1 << 24)
 #define MIPI_TX_HS_SYNC_CFG			(0x8)
 #define   MIPI_TXm_HS_SYNC_CFG(M)		(MIPI_TX_HS_SYNC_CFG \
-						+ (0x400*M))
+						+ HS_OFFSET(M))
 #define   LINE_SYNC_PKT_ENABLE			(1 << 0)
 #define   FRAME_COUNTER_ACTIVE			(1 << 1)
 #define   LINE_COUNTER_ACTIVE			(1 << 2)
@@ -408,75 +408,93 @@
 #define   FRAME_GEN_EN(f)			((f) << 23)
 #define   HACT_WAIT_STOP(f)			((f) << 28)
 #define MIPI_TX0_HS_FG0_SECT0_PH		(0x40)
-#define MIPI_TXm_HS_FGn_SECTo_PH(M, N, O)	(MIPI_TX0_HS_FG0_SECT0_PH + \
-						(0x400*M) + (0x2C*N) + (8*O))
-#define MIPI_TX_SECT_WC_MASK			  (0xffff)
-#define	MIPI_TX_SECT_VC_MASK			  (3)
-#define MIPI_TX_SECT_VC_SHIFT			  (22)
-#define MIPI_TX_SECT_DT_MASK			  (0x3f)
-#define MIPI_TX_SECT_DT_SHIFT			  (16)
-#define MIPI_TX_SECT_DM_MASK			  (3)
-#define MIPI_TX_SECT_DM_SHIFT			  (24)
-#define MIPI_TX_SECT_DMA_PACKED			  (1<<26)
+#define   MIPI_TXm_HS_FGn_SECTo_PH(M, N, O)	(MIPI_TX0_HS_FG0_SECT0_PH + \
+						HS_OFFSET(M) + (0x2C*N) + (8*O))
+#define   MIPI_TX_SECT_WC_MASK			(0xffff)
+#define	  MIPI_TX_SECT_VC_MASK			(3)
+#define   MIPI_TX_SECT_VC_SHIFT			(22)
+#define   MIPI_TX_SECT_DT_MASK			(0x3f)
+#define   MIPI_TX_SECT_DT_SHIFT			(16)
+#define   MIPI_TX_SECT_DM_MASK			(3)
+#define   MIPI_TX_SECT_DM_SHIFT			(24)
+#define   MIPI_TX_SECT_DMA_PACKED		(1<<26)
 #define MIPI_TX_HS_FG0_SECT_UNPACKED_BYTES0	(0x60)
 #define MIPI_TX_HS_FG0_SECT_UNPACKED_BYTES1	(0x64)
-#define MIPI_TXm_HS_FGn_SECT_UNPACKED_BYTES0(M, N) \
-	(MIPI_TX_HS_FG0_SECT_UNPACKED_BYTES0 + (0x400*M) + (0x2C*N))
+#define   MIPI_TXm_HS_FGn_SECT_UNPACKED_BYTES0(M, N)	\
+					(MIPI_TX_HS_FG0_SECT_UNPACKED_BYTES0 \
+					+ HS_OFFSET(M) + (0x2C*N))
 #define MIPI_TX_HS_FG0_SECT0_LINE_CFG		(0x44)
-#define MIPI_TXm_HS_FGn_SECTo_LINE_CFG(M, N, O) \
-	(MIPI_TX_HS_FG0_SECT0_LINE_CFG + (0x400*M) + (0x2C*N) + (8*O))
+#define   MIPI_TXm_HS_FGn_SECTo_LINE_CFG(M, N, O)	\
+				(MIPI_TX_HS_FG0_SECT0_LINE_CFG + HS_OFFSET(M) \
+				+ (0x2C*N) + (8*O))
 
 #define MIPI_TX_HS_FG0_NUM_LINES		(0x68)
-#define MIPI_TXm_HS_FGn_NUM_LINES(M, N)		(MIPI_TX_HS_FG0_NUM_LINES + \
-						(0x400*M) + (0x2C*N))
+#define   MIPI_TXm_HS_FGn_NUM_LINES(M, N)	\
+				(MIPI_TX_HS_FG0_NUM_LINES + HS_OFFSET(M) \
+				+ (0x2C*N))
 #define MIPI_TX_HS_VSYNC_WIDTHS0		(0x104)
-#define MIPI_TXm_HS_VSYNC_WIDTHn(M, N)		(MIPI_TX_HS_VSYNC_WIDTHS0 + \
-						(0x400*M) + (0x4*N))
+#define   MIPI_TXm_HS_VSYNC_WIDTHn(M, N)		\
+				(MIPI_TX_HS_VSYNC_WIDTHS0 + HS_OFFSET(M) \
+				+ (0x4*N))
 #define MIPI_TX_HS_V_BACKPORCHES0		(0x16c)
-#define MIPI_TXm_HS_V_BACKPORCHESn(M, N)	(MIPI_TX_HS_V_BACKPORCHES0 + \
-						(0x400*M) + (0x4*N))
+#define   MIPI_TXm_HS_V_BACKPORCHESn(M, N)	\
+				(MIPI_TX_HS_V_BACKPORCHES0 + HS_OFFSET(M) \
+				+ (0x4*N))
 #define MIPI_TX_HS_V_FRONTPORCHES0		(0x174)
-#define MIPI_TXm_HS_V_FRONTPORCHESn(M, N)	(MIPI_TX_HS_V_FRONTPORCHES0 + \
-						(0x400*M) + (0x4*N))
+#define   MIPI_TXm_HS_V_FRONTPORCHESn(M, N)	\
+				(MIPI_TX_HS_V_FRONTPORCHES0 + HS_OFFSET(M) \
+				+ (0x4*N))
 #define MIPI_TX_HS_V_ACTIVE0			(0x17c)
-#define MIPI_TXm_HS_V_ACTIVEn(M, N)		(MIPI_TX_HS_V_ACTIVE0 + \
-						(0x400*M) + (0x4*N))
+#define   MIPI_TXm_HS_V_ACTIVEn(M, N)		\
+				(MIPI_TX_HS_V_ACTIVE0 + HS_OFFSET(M) \
+				+ (0x4*N))
 #define MIPI_TX_HS_HSYNC_WIDTH0			(0x10c)
-#define MIPI_TXm_HS_HSYNC_WIDTHn(M, N)		(MIPI_TX_HS_HSYNC_WIDTH0 + \
-						(0x400*M) + (0x4*N))
+#define   MIPI_TXm_HS_HSYNC_WIDTHn(M, N)		\
+				(MIPI_TX_HS_HSYNC_WIDTH0 + HS_OFFSET(M) \
+				+ (0x4*N))
 #define MIPI_TX_HS_H_BACKPORCH0			(0x11c)
-#define MIPI_TXm_HS_H_BACKPORCHn(M, N)		(MIPI_TX_HS_H_BACKPORCH0 + \
-						(0x400*M) + (0x4*N))
+#define   MIPI_TXm_HS_H_BACKPORCHn(M, N)		\
+				(MIPI_TX_HS_H_BACKPORCH0 + HS_OFFSET(M) \
+				+ (0x4*N))
 #define MIPI_TX_HS_H_FRONTPORCH0		(0x12c)
-#define MIPI_TXm_HS_H_FRONTPORCHn(M, N)		(MIPI_TX_HS_H_FRONTPORCH0 + \
-						(0x400*M) + (0x4*N))
+#define   MIPI_TXm_HS_H_FRONTPORCHn(M, N)	\
+				(MIPI_TX_HS_H_FRONTPORCH0 + HS_OFFSET(M) \
+				+ (0x4*N))
 #define MIPI_TX_HS_H_ACTIVE0			(0x184)
-#define MIPI_TXm_HS_H_ACTIVEn(M, N)		(MIPI_TX_HS_H_ACTIVE0 + \
-						(0x400*M) + (0x4*N))
+#define   MIPI_TXm_HS_H_ACTIVEn(M, N)		\
+				(MIPI_TX_HS_H_ACTIVE0 + HS_OFFSET(M) \
+				+ (0x4*N))
 #define MIPI_TX_HS_LLP_HSYNC_WIDTH0		(0x13c)
-#define MIPI_TXm_HS_LLP_HSYNC_WIDTHn(M, N)	(MIPI_TX_HS_LLP_HSYNC_WIDTH0 + \
-						(0x400*M) + (0x4*N))
+#define   MIPI_TXm_HS_LLP_HSYNC_WIDTHn(M, N)	\
+				(MIPI_TX_HS_LLP_HSYNC_WIDTH0 + HS_OFFSET(M) \
+				+ (0x4*N))
 #define MIPI_TX_HS_LLP_H_BACKPORCH0		(0x14c)
-#define MIPI_TXm_HS_LLP_H_BACKPORCHn(M, N)	(MIPI_TX_HS_LLP_H_BACKPORCH0 + \
-						(0x400*M) + (0x4*N))
+#define   MIPI_TXm_HS_LLP_H_BACKPORCHn(M, N)	\
+				(MIPI_TX_HS_LLP_H_BACKPORCH0 + HS_OFFSET(M) \
+				+ (0x4*N))
 #define MIPI_TX_HS_LLP_H_FRONTPORCH0		(0x15c)
-#define MIPI_TXm_HS_LLP_H_FRONTPORCHn(M, N)	(MIPI_TX_HS_LLP_H_FRONTPORCH0 \
-						+ (0x400*M) + (0x4*N))
+#define   MIPI_TXm_HS_LLP_H_FRONTPORCHn(M, N)	\
+				(MIPI_TX_HS_LLP_H_FRONTPORCH0 + HS_OFFSET(M) \
+				+ (0x4*N))
+
 #define MIPI_TX_HS_MC_FIFO_CTRL_EN		(0x194)
-#define MIPI_TXm_HS_MC_FIFO_CTRL_EN(M)		(MIPI_TX_HS_MC_FIFO_CTRL_EN \
-						+ (0x400*M))
+#define   MIPI_TXm_HS_MC_FIFO_CTRL_EN(M)	\
+				(MIPI_TX_HS_MC_FIFO_CTRL_EN + HS_OFFSET(M))
+
 #define MIPI_TX_HS_MC_FIFO_CHAN_ALLOC0		(0x198)
 #define MIPI_TX_HS_MC_FIFO_CHAN_ALLOC1		(0x19c)
 #define   MIPI_TXm_HS_MC_FIFO_CHAN_ALLOCn(M, N)	\
-			(MIPI_TX_HS_MC_FIFO_CHAN_ALLOC0 + (0x400*M) + (0x4*N))
+				(MIPI_TX_HS_MC_FIFO_CHAN_ALLOC0 + HS_OFFSET(M) \
+				+ (0x4*N))
 #define   SET_MC_FIFO_CHAN_ALLOC(ctrl, vc, sz)	\
-	kmb_write_bits_mipi(MIPI_TXm_HS_MC_FIFO_CHAN_ALLOCn(ctrl, vc/2), \
-			(vc % 2)*16, 16, sz)
+		kmb_write_bits_mipi(MIPI_TXm_HS_MC_FIFO_CHAN_ALLOCn(ctrl, \
+					vc/2), (vc % 2)*16, 16, sz)
 #define MIPI_TX_HS_MC_FIFO_RTHRESHOLD0		(0x1a0)
 #define MIPI_TX_HS_MC_FIFO_RTHRESHOLD1		(0x1a4)
-#define MIPI_TXm_HS_MC_FIFO_RTHRESHOLDn(M, N)	\
-		(MIPI_TX_HS_MC_FIFO_RTHRESHOLD0 + (0x400*M) + (0x4*N))
-#define SET_MC_FIFO_RTHRESHOLD(ctrl, vc, th)	\
+#define   MIPI_TXm_HS_MC_FIFO_RTHRESHOLDn(M, N)	\
+				(MIPI_TX_HS_MC_FIFO_RTHRESHOLD0 + HS_OFFSET(M) \
+				+ (0x4*N))
+#define   SET_MC_FIFO_RTHRESHOLD(ctrl, vc, th)	\
 	kmb_write_bits_mipi(MIPI_TXm_HS_MC_FIFO_RTHRESHOLDn(ctrl, vc/2), \
 			(vc % 2)*16, 16, th)
 
-- 
2.7.4

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
