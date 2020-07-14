Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CECF621FF56
	for <lists+dri-devel@lfdr.de>; Tue, 14 Jul 2020 23:00:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C1106E9F6;
	Tue, 14 Jul 2020 20:59:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B2606E9C6;
 Tue, 14 Jul 2020 20:58:50 +0000 (UTC)
IronPort-SDR: CrlyTM+ZIp3zF3uWd0Y2H7rZAcdp1jxw2j/0DHs8Mrb5ILqyTRmHACyLraVM0T+nua79u+/0fW
 0ayA92xCkYWg==
X-IronPort-AV: E=McAfee;i="6000,8403,9682"; a="150444631"
X-IronPort-AV: E=Sophos;i="5.75,352,1589266800"; d="scan'208";a="150444631"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jul 2020 13:58:50 -0700
IronPort-SDR: DieDNag0FfYm+xOqAYzOqDgq+SkOJ8MDGwMmGjW93BE0vEokYkp2RrQ2T52S4d9NVEu1BVzwZT
 051oSn2u+t+g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,352,1589266800"; d="scan'208";a="316504328"
Received: from ahanamuk-mobl.amr.corp.intel.com (HELO
 achrisan-DESK2.amr.corp.intel.com) ([10.251.155.61])
 by orsmga008.jf.intel.com with ESMTP; 14 Jul 2020 13:58:49 -0700
From: Anitha Chrisanthus <anitha.chrisanthus@intel.com>
To: dri-devel@lists.freedesktop.org, anitha.chrisanthus@intel.com,
 bob.j.paauwe@intel.com, edmund.j.dea@intel.com
Subject: [PATCH v2 58/59] drm/kmb: Get System Clock from SCMI
Date: Tue, 14 Jul 2020 13:57:44 -0700
Message-Id: <1594760265-11618-59-git-send-email-anitha.chrisanthus@intel.com>
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

System clock is different for A0 and B0 silicons, so get it directly
from clk_PLL0 through SCMI calls.

Signed-off-by: Anitha Chrisanthus <anitha.chrisanthus@intel.com>
Reviewed-by: Bob Paauwe <bob.j.paauwe@intel.com>
---
 drivers/gpu/drm/kmb/kmb_drv.c | 11 +++++++++++
 drivers/gpu/drm/kmb/kmb_drv.h |  1 +
 drivers/gpu/drm/kmb/kmb_dsi.c | 12 +-----------
 3 files changed, 13 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/kmb/kmb_drv.c b/drivers/gpu/drm/kmb/kmb_drv.c
index 559742b8..17d303f 100644
--- a/drivers/gpu/drm/kmb/kmb_drv.c
+++ b/drivers/gpu/drm/kmb/kmb_drv.c
@@ -39,6 +39,7 @@ static struct clk *clk_lcd;
 static struct clk *clk_mipi;
 static struct clk *clk_mipi_ecfg;
 static struct clk *clk_mipi_cfg;
+static struct clk *clk_pll0;
 
 struct drm_bridge *adv_bridge;
 
@@ -122,6 +123,7 @@ static int kmb_load(struct drm_device *drm, unsigned long flags)
 #ifdef ICAM_LCD_QOS
 	int val = 0;
 #endif
+	struct device_node *vpu_dev;
 
 	/* Map MIPI MMIO registers */
 	dev_p->mipi_mmio = kmb_map_mmio(pdev, "mipi_regs");
@@ -188,6 +190,15 @@ static int kmb_load(struct drm_device *drm, unsigned long flags)
 		DRM_ERROR("clk_get() failed clk_mipi_cfg\n");
 		goto setup_fail;
 	}
+	vpu_dev = of_find_node_by_path("/soc/vpu-ipc");
+	DRM_INFO("vpu node = %pOF", vpu_dev);
+	clk_pll0 = of_clk_get_by_name(vpu_dev, "pll_0_out_0");
+	if (IS_ERR(clk_pll0)) {
+		DRM_ERROR("clk_get() failed clk_pll0 ");
+		goto setup_fail;
+	}
+	dev_p->sys_clk_mhz = clk_get_rate(clk_pll0)/1000000;
+	DRM_INFO("system clk = %d Mhz", dev_p->sys_clk_mhz);
 #ifdef LCD_TEST
 	/* Set LCD clock to 200 Mhz */
 	DRM_DEBUG("Get clk_lcd before set = %ld\n", clk_get_rate(clk_lcd));
diff --git a/drivers/gpu/drm/kmb/kmb_drv.h b/drivers/gpu/drm/kmb/kmb_drv.h
index 939f8b4..72d0746 100644
--- a/drivers/gpu/drm/kmb/kmb_drv.h
+++ b/drivers/gpu/drm/kmb/kmb_drv.h
@@ -38,6 +38,7 @@ struct kmb_drm_private {
 	spinlock_t			irq_lock;
 	int				irq_lcd;
 	int				irq_mipi;
+	int				sys_clk_mhz;
 	dma_addr_t			fb_addr;
 };
 
diff --git a/drivers/gpu/drm/kmb/kmb_dsi.c b/drivers/gpu/drm/kmb/kmb_dsi.c
index 47798ed..8f8b50c 100644
--- a/drivers/gpu/drm/kmb/kmb_dsi.c
+++ b/drivers/gpu/drm/kmb/kmb_dsi.c
@@ -588,20 +588,10 @@ static void mipi_tx_fg_cfg_regs(struct kmb_drm_private *dev_p, u8 frame_gen,
 	u32 ppl_llp_ratio;
 	u32 ctrl_no = MIPI_CTRL6, reg_adr, val, offset;
 
-#ifdef GET_SYS_CLK
-	/* Get system clock for blanking period cnfigurations */
-	sc = get_clock_frequency(CPR_CLK_SYSTEM, &sysclk);
-	if (sc)
-		return sc;
-
-	/* Convert to MHZ */
-	sysclk /= 1000;
-#else
 	/* 500 Mhz system clock minus 50 to account for the difference in
 	 * MIPI clock speed in RTL tests
 	 */
-	sysclk = KMB_SYS_CLK_MHZ - 50;
-#endif
+	sysclk = dev_p->sys_clk_mhz - 50;
 
 	/* PPL-Pixel Packing Layer, LLP-Low Level Protocol
 	 * Frame genartor timing parameters are clocked on the system clock,
-- 
2.7.4

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
