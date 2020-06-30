Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 21E0620FECA
	for <lists+dri-devel@lfdr.de>; Tue, 30 Jun 2020 23:29:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 55F156E328;
	Tue, 30 Jun 2020 21:28:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 779496E2E9;
 Tue, 30 Jun 2020 21:28:38 +0000 (UTC)
IronPort-SDR: 2c6wUnGdkuonhfCmS8UkSKCMc0MmyWQmrgv9mWgdL5ISL2mKsGo1i1tfVbHC5aJ/mherQ1qZFk
 72N97hqfefgA==
X-IronPort-AV: E=McAfee;i="6000,8403,9668"; a="146386949"
X-IronPort-AV: E=Sophos;i="5.75,298,1589266800"; d="scan'208";a="146386949"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jun 2020 14:28:38 -0700
IronPort-SDR: l0QJ/bR5XT/ZTzV6+O28p0D1pd9QkGK9vzIdle9W+5yV3PWJZ1XnkM/3oVXUaaBiHGgxc7xt87
 h8ksTJTsantg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,298,1589266800"; d="scan'208";a="481066641"
Received: from hdwiyono-mobl.amr.corp.intel.com (HELO
 achrisan-DESK2.amr.corp.intel.com) ([10.254.176.225])
 by fmsmga006.fm.intel.com with ESMTP; 30 Jun 2020 14:28:37 -0700
From: Anitha Chrisanthus <anitha.chrisanthus@intel.com>
To: dri-devel@lists.freedesktop.org, anitha.chrisanthus@intel.com,
 bob.j.paauwe@intel.com, edmund.j.dea@intel.com
Subject: [PATCH 10/59] drm/kmb: Part 2 of Mipi Tx Initialization
Date: Tue, 30 Jun 2020 14:27:22 -0700
Message-Id: <1593552491-23698-11-git-send-email-anitha.chrisanthus@intel.com>
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

Mipi TX Frame generator timing configuration

Compute and set frame generator timings like hactive, front porch,
back porch etc.

v2: minor code review changes
Signed-off-by: Anitha Chrisanthus <anitha.chrisanthus@intel.com>
Reviewed-by: Bob Paauwe <bob.j.paauwe@intel.com>
---
 drivers/gpu/drm/kmb/kmb_dsi.c  | 132 ++++++++++++++++++++++++++++++++++++++++-
 drivers/gpu/drm/kmb/kmb_regs.h |  37 ++++++++++++
 2 files changed, 166 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/kmb/kmb_dsi.c b/drivers/gpu/drm/kmb/kmb_dsi.c
index 17e1383..1435ed8 100644
--- a/drivers/gpu/drm/kmb/kmb_dsi.c
+++ b/drivers/gpu/drm/kmb/kmb_dsi.c
@@ -411,6 +411,123 @@ static u32 mipi_tx_fg_section_cfg(struct kmb_drm_private *dev_priv,
 	return 0;
 }
 
+static void mipi_tx_fg_cfg_regs(struct kmb_drm_private *dev_priv,
+				u8 frame_gen,
+				struct mipi_tx_frame_timing_cfg *fg_cfg)
+{
+	u32 sysclk;
+	/*float ppl_llp_ratio; */
+	u32 ppl_llp_ratio;
+	u32 ctrl_no = MIPI_CTRL6, reg_adr, val, offset;
+
+	/*Get system clock for blanking period cnfigurations */
+	/*TODO need to get system clock from clock driver */
+	/* Assume 700 Mhz system clock for now */
+	sysclk = 700;
+
+	/*ppl-pixel packing layer, llp-low level protocol
+	 * frame genartor timing parameters are clocked on the system clock
+	 * whereas as the equivalent parameters in the LLP blocks are clocked
+	 * on LLP Tx clock from the D-PHY - BYTE clock
+	 */
+
+	/*multiply by 1000 to keep the precision */
+	ppl_llp_ratio = ((fg_cfg->bpp / 8) * sysclk * 1000) /
+	    ((fg_cfg->lane_rate_mbps / 8) * fg_cfg->active_lanes);
+
+	/*frame generator number of lines */
+	reg_adr = MIPI_TXm_HS_FGn_NUM_LINES(ctrl_no, frame_gen);
+	kmb_write(dev_priv, reg_adr, fg_cfg->v_active);
+
+	/*vsync width */
+	/*
+	 *there are 2 registers for vsync width -VSA in lines for channels 0-3
+	 *REG_VSYNC_WIDTH0: [15:0]-VSA for channel0, [31:16]-VSA for channel1
+	 *REG_VSYNC_WIDTH1: [15:0]-VSA for channel2, [31:16]-VSA for channel3
+	 */
+	offset = (frame_gen % 2) * 16;
+	reg_adr = MIPI_TXm_HS_VSYNC_WIDTHn(ctrl_no, frame_gen);
+	kmb_write_bits(dev_priv, reg_adr, offset, 16, fg_cfg->vsync_width);
+
+	/*v backporch - same register config like vsync width */
+	reg_adr = MIPI_TXm_HS_V_BACKPORCHESn(ctrl_no, frame_gen);
+	kmb_write_bits(dev_priv, reg_adr, offset, 16, fg_cfg->v_backporch);
+
+	/*v frontporch - same register config like vsync width */
+	reg_adr = MIPI_TXm_HS_V_FRONTPORCHESn(ctrl_no, frame_gen);
+	kmb_write_bits(dev_priv, reg_adr, offset, 16, fg_cfg->v_frontporch);
+
+	/*v active - same register config like vsync width */
+	reg_adr = MIPI_TXm_HS_V_ACTIVEn(ctrl_no, frame_gen);
+	kmb_write_bits(dev_priv, reg_adr, offset, 16, fg_cfg->v_active);
+
+	/*hsyc width */
+	reg_adr = MIPI_TXm_HS_HSYNC_WIDTHn(ctrl_no, frame_gen);
+	kmb_write(dev_priv, reg_adr,
+		  (fg_cfg->hsync_width * ppl_llp_ratio) / 1000);
+
+	/*h backporch */
+	reg_adr = MIPI_TXm_HS_H_BACKPORCHn(ctrl_no, frame_gen);
+	kmb_write(dev_priv, reg_adr,
+		  (fg_cfg->h_backporch * ppl_llp_ratio) / 1000);
+
+	/*h frontporch */
+	reg_adr = MIPI_TXm_HS_H_FRONTPORCHn(ctrl_no, frame_gen);
+	kmb_write(dev_priv, reg_adr,
+		  (fg_cfg->h_frontporch * ppl_llp_ratio) / 1000);
+
+	/*h active */
+	reg_adr = MIPI_TXm_HS_H_ACTIVEn(ctrl_no, frame_gen);
+	/*convert h_active which is wc in bytes to cycles */
+	val = (fg_cfg->h_active * sysclk * 1000) /
+	    ((fg_cfg->lane_rate_mbps / 8) * fg_cfg->active_lanes);
+	val /= 1000;
+	kmb_write(dev_priv, reg_adr, val);
+
+	/* llp hsync width */
+	reg_adr = MIPI_TXm_HS_LLP_HSYNC_WIDTHn(ctrl_no, frame_gen);
+	kmb_write(dev_priv, reg_adr, fg_cfg->hsync_width * (fg_cfg->bpp / 8));
+
+	/* llp h backporch */
+	reg_adr = MIPI_TXm_HS_LLP_H_BACKPORCHn(ctrl_no, frame_gen);
+	kmb_write(dev_priv, reg_adr, fg_cfg->h_backporch * (fg_cfg->bpp / 8));
+
+	/* llp h frontporch */
+	reg_adr = MIPI_TXm_HS_LLP_H_FRONTPORCHn(ctrl_no, frame_gen);
+	kmb_write(dev_priv, reg_adr, fg_cfg->h_frontporch * (fg_cfg->bpp / 8));
+}
+
+static void mipi_tx_fg_cfg(struct kmb_drm_private *dev_priv, u8 frame_gen,
+			   u8 active_lanes, u32 bpp, u32 wc,
+			   u32 lane_rate_mbps, struct mipi_tx_frame_cfg *fg_cfg)
+{
+	u32 i, fg_num_lines = 0;
+	struct mipi_tx_frame_timing_cfg fg_t_cfg;
+
+	/*calculate the total frame generator number of lines based on it's
+	 * active sections
+	 */
+	for (i = 0; i < MIPI_TX_FRAME_GEN_SECTIONS; i++) {
+		if (fg_cfg->sections[i] != NULL)
+			fg_num_lines += fg_cfg->sections[i]->height_lines;
+	}
+
+	fg_t_cfg.bpp = bpp;
+	fg_t_cfg.lane_rate_mbps = lane_rate_mbps;
+	fg_t_cfg.hsync_width = fg_cfg->hsync_width;
+	fg_t_cfg.h_backporch = fg_cfg->h_backporch;
+	fg_t_cfg.h_frontporch = fg_cfg->h_frontporch;
+	fg_t_cfg.h_active = wc;
+	fg_t_cfg.vsync_width = fg_cfg->vsync_width;
+	fg_t_cfg.v_backporch = fg_cfg->v_backporch;
+	fg_t_cfg.v_frontporch = fg_cfg->v_frontporch;
+	fg_t_cfg.v_active = fg_num_lines;
+	fg_t_cfg.active_lanes = active_lanes;
+
+	/*apply frame generator timing setting */
+	mipi_tx_fg_cfg_regs(dev_priv, frame_gen, &fg_t_cfg);
+}
+
 static u32 mipi_tx_init_cntrl(struct kmb_drm_private *dev_priv,
 			      struct mipi_ctrl_cfg *ctrl_cfg)
 {
@@ -432,12 +549,13 @@ static u32 mipi_tx_init_cntrl(struct kmb_drm_private *dev_priv,
 		if (ctrl_cfg->tx_ctrl_cfg.frames[frame_id] == NULL)
 			continue;
 
+		/* Frame Section configuration */
 		/*TODO - assume there is only one valid section in a frame, so
 		 * bits_per_pclk and word_count are only set once
 		 */
 		for (sect = 0; sect < MIPI_CTRL_VIRTUAL_CHANNELS; sect++) {
 			if (ctrl_cfg->tx_ctrl_cfg.frames[frame_id]->sections[sect]
-					== NULL)
+			    == NULL)
 				continue;
 
 			ret = mipi_tx_fg_section_cfg(dev_priv, frame_id, sect,
@@ -449,9 +567,17 @@ static u32 mipi_tx_init_cntrl(struct kmb_drm_private *dev_priv,
 
 		}
 
+		/* set frame specific parameters */
+		mipi_tx_fg_cfg(dev_priv, frame_id, ctrl_cfg->active_lanes,
+			       bits_per_pclk,
+			       word_count,
+			       ctrl_cfg->lane_rate_mbps,
+			       ctrl_cfg->tx_ctrl_cfg.frames[frame_id]);
 		/*function for setting frame sepecific parameters will be
-		 * called here bits_per_pclk and word_count will be passed
-		 * in to this function
+		 * called here
+		 */
+		/*bits_per_pclk and word_count will be passed in to this
+		 * function
 		 */
 
 	}
diff --git a/drivers/gpu/drm/kmb/kmb_regs.h b/drivers/gpu/drm/kmb/kmb_regs.h
index 06324ba..8715c7b 100644
--- a/drivers/gpu/drm/kmb/kmb_regs.h
+++ b/drivers/gpu/drm/kmb/kmb_regs.h
@@ -410,4 +410,41 @@
 				+ (0x400*M) + (0x2C*N) + (8*O))
 #define MIPI_TX_HS_FG0_SECT0_LINE_CFG		(0x44)
 
+#define MIPI_TX_HS_FG0_NUM_LINES		(0x68)
+#define MIPI_TXm_HS_FGn_NUM_LINES(M, N)		(MIPI_TX_HS_FG0_NUM_LINES + \
+						(0x400*M) + (0x2C*N))
+#define MIPI_TX_HS_VSYNC_WIDTHS0		(0x104)
+#define MIPI_TXm_HS_VSYNC_WIDTHn(M, N)		(MIPI_TX_HS_VSYNC_WIDTHS0 + \
+						(0x400*M) + (0x4*N))
+#define MIPI_TX_HS_V_BACKPORCHES0		(0x16c)
+#define MIPI_TXm_HS_V_BACKPORCHESn(M, N)	(MIPI_TX_HS_V_BACKPORCHES0 + \
+						(0x400*M) + (0x4*N))
+#define MIPI_TX_HS_V_FRONTPORCHES0		(0x174)
+#define MIPI_TXm_HS_V_FRONTPORCHESn(M, N)	(MIPI_TX_HS_V_FRONTPORCHES0 + \
+						(0x400*M) + (0x4*N))
+#define MIPI_TX_HS_V_ACTIVE0			(0x17c)
+#define MIPI_TXm_HS_V_ACTIVEn(M, N)		(MIPI_TX_HS_V_ACTIVE0 + \
+						(0x400*M) + (0x4*N))
+#define MIPI_TX_HS_HSYNC_WIDTH0			(0x10c)
+#define MIPI_TXm_HS_HSYNC_WIDTHn(M, N)		(MIPI_TX_HS_HSYNC_WIDTH0 + \
+						(0x400*M) + (0x4*N))
+#define MIPI_TX_HS_H_BACKPORCH0			(0x11c)
+#define MIPI_TXm_HS_H_BACKPORCHn(M, N)		(MIPI_TX_HS_H_BACKPORCH0 + \
+						(0x400*M) + (0x4*N))
+#define MIPI_TX_HS_H_FRONTPORCH0		(0x12c)
+#define MIPI_TXm_HS_H_FRONTPORCHn(M, N)		(MIPI_TX_HS_H_FRONTPORCH0 + \
+						(0x400*M) + (0x4*N))
+#define MIPI_TX_HS_H_ACTIVE0			(0x184)
+#define MIPI_TXm_HS_H_ACTIVEn(M, N)		(MIPI_TX_HS_H_ACTIVE0 + \
+						(0x400*M) + (0x4*N))
+#define MIPI_TX_HS_LLP_HSYNC_WIDTH0		(0x13c)
+#define MIPI_TXm_HS_LLP_HSYNC_WIDTHn(M, N)	(MIPI_TX_HS_LLP_HSYNC_WIDTH0 + \
+						(0x400*M) + (0x4*N))
+#define MIPI_TX_HS_LLP_H_BACKPORCH0		(0x14c)
+#define MIPI_TXm_HS_LLP_H_BACKPORCHn(M, N)	(MIPI_TX_HS_LLP_H_BACKPORCH0 + \
+						(0x400*M) + (0x4*N))
+#define MIPI_TX_HS_LLP_H_FRONTPORCH0		(0x15c)
+#define MIPI_TXm_HS_LLP_H_FRONTPORCHn(M, N)	(MIPI_TX_HS_LLP_H_FRONTPORCH0 \
+						+ (0x400*M) + (0x4*N))
+
 #endif /* __KMB_REGS_H__ */
-- 
2.7.4

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
