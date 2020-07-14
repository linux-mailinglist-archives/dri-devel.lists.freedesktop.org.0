Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 64F5021FF44
	for <lists+dri-devel@lfdr.de>; Tue, 14 Jul 2020 23:00:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 77FD86E9DA;
	Tue, 14 Jul 2020 20:59:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C18FD6E9C1;
 Tue, 14 Jul 2020 20:58:36 +0000 (UTC)
IronPort-SDR: rioO5kvhZe5hwCxzcZ+q6eeAZL17VHTyPkorQCUqPlKkfgQPB8B4MSVRRDoYtrOeeMfQ1M665b
 vbC3aMdL6HDQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9682"; a="150444585"
X-IronPort-AV: E=Sophos;i="5.75,352,1589266800"; d="scan'208";a="150444585"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jul 2020 13:58:36 -0700
IronPort-SDR: 8iYkJ6uNkEQxrRZO9zZLuejZCWJZV2Odd0GTKcXWDABhH714ACrqppdpsQpwZtiOnP3as3+ihU
 RsZ7VotuMhYQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,352,1589266800"; d="scan'208";a="316504202"
Received: from ahanamuk-mobl.amr.corp.intel.com (HELO
 achrisan-DESK2.amr.corp.intel.com) ([10.251.155.61])
 by orsmga008.jf.intel.com with ESMTP; 14 Jul 2020 13:58:36 -0700
From: Anitha Chrisanthus <anitha.chrisanthus@intel.com>
To: dri-devel@lists.freedesktop.org, anitha.chrisanthus@intel.com,
 bob.j.paauwe@intel.com, edmund.j.dea@intel.com
Subject: [PATCH v2 34/59] drm/kmb: Enable MSS_CAM_CLK_CTRL for LCD and MIPI
Date: Tue, 14 Jul 2020 13:57:20 -0700
Message-Id: <1594760265-11618-35-git-send-email-anitha.chrisanthus@intel.com>
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

Enable clocks for LCD, mipi common and mipi tx0
Renamed MSS_CAM_CLK_CTRL and also fixed bug in the
call to set this register.

Signed-off-by: Anitha Chrisanthus <anitha.chrisanthus@intel.com>
---
 drivers/gpu/drm/kmb/kmb_drv.c  |  8 ++++----
 drivers/gpu/drm/kmb/kmb_drv.h  | 14 ++++++++++++++
 drivers/gpu/drm/kmb/kmb_dsi.c  |  6 ++++--
 drivers/gpu/drm/kmb/kmb_regs.h |  7 ++++++-
 4 files changed, 28 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/kmb/kmb_drv.c b/drivers/gpu/drm/kmb/kmb_drv.c
index 9dc5f91..90db07c 100644
--- a/drivers/gpu/drm/kmb/kmb_drv.c
+++ b/drivers/gpu/drm/kmb/kmb_drv.c
@@ -241,6 +241,9 @@ static int kmb_load(struct drm_device *drm, unsigned long flags)
 		DRM_INFO("Get clk_mipi_cfg after set = %ld\n", clk);
 	}
 
+	/* enable MSS_CAM_CLK_CTRL for MIPI TX and LCD */
+	kmb_set_bitmask_msscam(dev_p, MSS_CAM_CLK_CTRL, LCD | MIPI_COMMON |
+			MIPI_TX0);
 #ifdef WIP
 	/* Register irqs here - section 17.3 in databook
 	 * lists LCD at 79 and 82 for MIPI under MSS CPU -
@@ -292,10 +295,7 @@ static int kmb_load(struct drm_device *drm, unsigned long flags)
 
 	/* Initialize MIPI DSI */
 	ret = kmb_dsi_init(drm, adv_bridge);
-	if (ret == -EPROBE_DEFER) {
-		DRM_INFO("%s: wait for external bridge driver DT", __func__);
-		return -EPROBE_DEFER;
-	} else if (ret) {
+	if (ret) {
 		DRM_ERROR("failed to initialize DSI\n");
 		goto setup_fail;
 	}
diff --git a/drivers/gpu/drm/kmb/kmb_drv.h b/drivers/gpu/drm/kmb/kmb_drv.h
index 8c5ccf7..71dc883 100644
--- a/drivers/gpu/drm/kmb/kmb_drv.h
+++ b/drivers/gpu/drm/kmb/kmb_drv.h
@@ -88,6 +88,20 @@ static inline void kmb_write_msscam(struct kmb_drm_private *dev_p,
 	writel(value, (dev_p->msscam_mmio + reg));
 }
 
+static inline u32 kmb_read_msscam(struct kmb_drm_private *dev_p,
+		unsigned int reg)
+{
+	return readl(dev_p->msscam_mmio + reg);
+}
+
+static inline void kmb_set_bitmask_msscam(struct kmb_drm_private *dev_p,
+		unsigned int reg, u32 mask)
+{
+	u32 reg_val = kmb_read_msscam(dev_p, reg);
+
+	kmb_write_msscam(dev_p, reg, (reg_val | mask));
+}
+
 static inline u32 kmb_read_lcd(struct kmb_drm_private *dev_p, unsigned int reg)
 {
 	return readl(dev_p->lcd_mmio + reg);
diff --git a/drivers/gpu/drm/kmb/kmb_dsi.c b/drivers/gpu/drm/kmb/kmb_dsi.c
index 4ec1753..01fa378 100644
--- a/drivers/gpu/drm/kmb/kmb_dsi.c
+++ b/drivers/gpu/drm/kmb/kmb_dsi.c
@@ -794,9 +794,11 @@ static u32 mipi_tx_init_cntrl(struct kmb_drm_private *dev_p,
 		active_vchannels++;
 
 		/*connect lcd to mipi */
-		kmb_write_msscam(dev_p, MSS_CAM_BASE_ADDR +
-				MIPI_TX_MSS_LCD_MIPI_CFG, 1);
+		kmb_write_msscam(dev_p, MSS_LCD_MIPI_CFG, 1);
 
+		/*stop iterating as only one virtual channel shall be used for
+		 * LCD connection
+		 */
 		break;
 	}
 
diff --git a/drivers/gpu/drm/kmb/kmb_regs.h b/drivers/gpu/drm/kmb/kmb_regs.h
index e98e144..a3f1a3a 100644
--- a/drivers/gpu/drm/kmb/kmb_regs.h
+++ b/drivers/gpu/drm/kmb/kmb_regs.h
@@ -677,6 +677,11 @@
 			& (1 << (dphy - MIPI_DPHY6)))
 #define DPHY_CFG_CLK_EN				(0x18c)
 
-#define MIPI_TX_MSS_LCD_MIPI_CFG		(0x04)
+#define MSS_LCD_MIPI_CFG		(0x04)
+#define MSS_CAM_CLK_CTRL		(0x10)
+#define   LCD				(1<<1)
+#define   MIPI_COMMON			(1<<2)
+#define   MIPI_TX0			(1<<9)
+
 #define BIT_MASK_16				(0xffff)
 #endif /* __KMB_REGS_H__ */
-- 
2.7.4

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
