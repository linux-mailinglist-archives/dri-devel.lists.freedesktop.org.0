Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E750621FF3C
	for <lists+dri-devel@lfdr.de>; Tue, 14 Jul 2020 22:59:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 30A396E9D4;
	Tue, 14 Jul 2020 20:58:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0ADC56E974;
 Tue, 14 Jul 2020 20:58:38 +0000 (UTC)
IronPort-SDR: XQqnw0wnjp/YdkskGgURABCp/8fT7Ec/STgjVmDAmeR9dEClgfCyuNtpKE8HGkrQFhvuCX/57w
 oUJ7ywjo4YPg==
X-IronPort-AV: E=McAfee;i="6000,8403,9682"; a="150444592"
X-IronPort-AV: E=Sophos;i="5.75,352,1589266800"; d="scan'208";a="150444592"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jul 2020 13:58:37 -0700
IronPort-SDR: qZfaYR8KyalGc0Af33OgOJ1XqUthUNvAIIRIz54WTPoiFlhSU075gHa+QeMm1QLMzBhnCD43c5
 nmsNVqqQkrZw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,352,1589266800"; d="scan'208";a="316504212"
Received: from ahanamuk-mobl.amr.corp.intel.com (HELO
 achrisan-DESK2.amr.corp.intel.com) ([10.251.155.61])
 by orsmga008.jf.intel.com with ESMTP; 14 Jul 2020 13:58:37 -0700
From: Anitha Chrisanthus <anitha.chrisanthus@intel.com>
To: dri-devel@lists.freedesktop.org, anitha.chrisanthus@intel.com,
 bob.j.paauwe@intel.com, edmund.j.dea@intel.com
Subject: [PATCH v2 36/59] drm/kmb: Enable MIPI TX HS Test Pattern Generation
Date: Tue, 14 Jul 2020 13:57:22 -0700
Message-Id: <1594760265-11618-37-git-send-email-anitha.chrisanthus@intel.com>
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

From: Edmund Dea <edmund.j.dea@intel.com>

Added test pattern generator function. Enable this at compile time to
test if mipi is working. mipi->hdmi section

Signed-off-by: Edmund Dea <edmund.j.dea@intel.com>
Reviewed-by: Bob Paauwe <bob.j.paauwe@intel.com>
---
 drivers/gpu/drm/kmb/kmb_dsi.c  | 31 +++++++++++++++++++++++++++++++
 drivers/gpu/drm/kmb/kmb_dsi.h  |  7 +++++++
 drivers/gpu/drm/kmb/kmb_regs.h | 11 +++++++++++
 3 files changed, 49 insertions(+)

diff --git a/drivers/gpu/drm/kmb/kmb_dsi.c b/drivers/gpu/drm/kmb/kmb_dsi.c
index 01fa378..960ecfa 100644
--- a/drivers/gpu/drm/kmb/kmb_dsi.c
+++ b/drivers/gpu/drm/kmb/kmb_dsi.c
@@ -744,6 +744,32 @@ static void mipi_tx_ctrl_cfg(struct kmb_drm_private *dev_p, u8 fg_id,
 	kmb_write_mipi(dev_p, MIPI_TXm_HS_CTRL(ctrl_no), ctrl);
 }
 
+#ifdef MIPI_TX_TEST_PATTERN_GENERATION
+static void mipi_tx_hs_tp_gen(struct kmb_drm_private *dev_p, int vc,
+		int tp_sel, u32 stripe_width, u32 color0, u32 color1)
+{
+	u32 ctrl_no = MIPI_CTRL6;
+
+	/* Select test pattern mode on the virtual channel */
+	kmb_write_mipi(dev_p, MIPI_TXm_HS_TEST_PAT_CTRL(ctrl_no),
+			TP_SEL_VCm(vc, tp_sel));
+
+	if (tp_sel == MIPI_TX_HS_TP_V_STRIPES ||
+			tp_sel == MIPI_TX_HS_TP_H_STRIPES) {
+		kmb_write_mipi(dev_p, MIPI_TXm_HS_TEST_PAT_CTRL(ctrl_no),
+				TP_STRIPE_WIDTH(stripe_width));
+	}
+
+	/* Configure test pattern colors */
+	kmb_write_mipi(dev_p, MIPI_TX_HS_TEST_PAT_COLOR0, color0);
+	kmb_write_mipi(dev_p, MIPI_TX_HS_TEST_PAT_COLOR1, color1);
+
+	/* Enable test pattern generation on the virtual channel */
+	kmb_write_mipi(dev_p, MIPI_TXm_HS_TEST_PAT_CTRL(ctrl_no),
+			TP_EN_VCm(vc));
+}
+#endif
+
 static u32 mipi_tx_init_cntrl(struct kmb_drm_private *dev_p,
 		struct mipi_ctrl_cfg *ctrl_cfg)
 {
@@ -807,6 +833,11 @@ static u32 mipi_tx_init_cntrl(struct kmb_drm_private *dev_p,
 	/*Multi-Channel FIFO Configuration*/
 	mipi_tx_multichannel_fifo_cfg(dev_p, ctrl_cfg->active_lanes, frame_id);
 
+#ifdef MIPI_TX_TEST_PATTERN_GENERATION
+	mipi_tx_hs_tp_gen(dev_p, 0, MIPI_TX_HS_TP_WHOLE_FRAME_COLOR0, 0,
+			0xffffffff, 0);
+#endif
+
 	/*Frame Generator Enable */
 	mipi_tx_ctrl_cfg(dev_p, frame_id, ctrl_cfg);
 	return ret;
diff --git a/drivers/gpu/drm/kmb/kmb_dsi.h b/drivers/gpu/drm/kmb/kmb_dsi.h
index 811f3b8..3de68de 100644
--- a/drivers/gpu/drm/kmb/kmb_dsi.h
+++ b/drivers/gpu/drm/kmb/kmb_dsi.h
@@ -180,6 +180,13 @@ enum mipi_dsi_data_type {
 	DSI_LP_DT_RESERVED_3F = 0x3f
 };
 
+enum mipi_tx_hs_tp_sel {
+	MIPI_TX_HS_TP_WHOLE_FRAME_COLOR0 = 0,
+	MIPI_TX_HS_TP_WHOLE_FRAME_COLOR1,
+	MIPI_TX_HS_TP_V_STRIPES,
+	MIPI_TX_HS_TP_H_STRIPES,
+};
+
 enum dphy_mode {
 	MIPI_DPHY_SLAVE = 0,
 	MIPI_DPHY_MASTER
diff --git a/drivers/gpu/drm/kmb/kmb_regs.h b/drivers/gpu/drm/kmb/kmb_regs.h
index a3f1a3a..207a161 100644
--- a/drivers/gpu/drm/kmb/kmb_regs.h
+++ b/drivers/gpu/drm/kmb/kmb_regs.h
@@ -625,6 +625,17 @@
 			MIPI_TX_HS_IRQ_CLEAR \
 			+ HS_OFFSET(M), val)
 
+/* MIPI Test Pattern Generation */
+#define MIPI_TX_HS_TEST_PAT_CTRL			(0x230)
+#define   MIPI_TXm_HS_TEST_PAT_CTRL(M)			\
+				(MIPI_TX_HS_TEST_PAT_CTRL + HS_OFFSET(M))
+#define   TP_EN_VCm(M)					((M) * 0x04)
+#define   TP_SEL_VCm(M, N)				\
+				(N << (((M) * 0x04) + 1))
+#define   TP_STRIPE_WIDTH(M)				((M) << 16)
+#define MIPI_TX_HS_TEST_PAT_COLOR0			(0x234)
+#define MIPI_TX_HS_TEST_PAT_COLOR1			(0x238)
+
 /* D-PHY regs */
 #define DPHY_ENABLE				(0x100)
 #define DPHY_INIT_CTRL0				(0x104)
-- 
2.7.4

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
