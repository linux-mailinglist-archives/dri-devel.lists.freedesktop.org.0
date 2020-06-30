Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 43A7D20FF02
	for <lists+dri-devel@lfdr.de>; Tue, 30 Jun 2020 23:30:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C410B6E45C;
	Tue, 30 Jun 2020 21:29:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 27F6D6E32A;
 Tue, 30 Jun 2020 21:28:51 +0000 (UTC)
IronPort-SDR: kwRcKou2BT+PJyD/IF0lC8gHxf63ycMAiNgnHNlWOKSZeSYrLZed/ZSzmzGyxPWb9V2YkN1adI
 p70GCqjnkX2w==
X-IronPort-AV: E=McAfee;i="6000,8403,9668"; a="133846902"
X-IronPort-AV: E=Sophos;i="5.75,298,1589266800"; d="scan'208";a="133846902"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jun 2020 14:28:50 -0700
IronPort-SDR: lzDfjPf1LYvuFPDX+q8wDIeQsvfLKEXGnizB/Zr/UMi12f3wuUq20OsO1y91AZcKw/1PKHCh3T
 bqy6HM2DY2Mg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,298,1589266800"; d="scan'208";a="481066775"
Received: from hdwiyono-mobl.amr.corp.intel.com (HELO
 achrisan-DESK2.amr.corp.intel.com) ([10.254.176.225])
 by fmsmga006.fm.intel.com with ESMTP; 30 Jun 2020 14:28:50 -0700
From: Anitha Chrisanthus <anitha.chrisanthus@intel.com>
To: dri-devel@lists.freedesktop.org, anitha.chrisanthus@intel.com,
 bob.j.paauwe@intel.com, edmund.j.dea@intel.com
Subject: [PATCH 39/59] drm/kmb: Fixed driver unload
Date: Tue, 30 Jun 2020 14:27:51 -0700
Message-Id: <1593552491-23698-40-git-send-email-anitha.chrisanthus@intel.com>
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

unmap MSSCAM registers

Signed-off-by: Anitha Chrisanthus <anitha.chrisanthus@intel.com>
---
 drivers/gpu/drm/kmb/kmb_drv.c  | 15 +++------------
 drivers/gpu/drm/kmb/kmb_drv.h  |  1 -
 drivers/gpu/drm/kmb/kmb_regs.h |  2 +-
 3 files changed, 4 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/kmb/kmb_drv.c b/drivers/gpu/drm/kmb/kmb_drv.c
index b5c8711..e9dd879 100644
--- a/drivers/gpu/drm/kmb/kmb_drv.c
+++ b/drivers/gpu/drm/kmb/kmb_drv.c
@@ -179,17 +179,6 @@ static int kmb_load(struct drm_device *drm, unsigned long flags)
 		iounmap(dev_p->mipi_mmio);
 		return -ENOMEM;
 	}
-/*testing*/
-	if (!request_mem_region(CPR_BASE_ADDR, 100, "cpr")) {
-		DRM_ERROR("failed to reserve %s registers\n", "cpr");
-		return -ENOMEM;
-	}
-	dev_p->cpr_mmio = ioremap_cache(CPR_BASE_ADDR, 0x100);
-	if (!dev_p->cpr_mmio) {
-		DRM_ERROR("failed to ioremap %s registers\n", "CPR");
-		release_mem_region(CPR_BASE_ADDR, 100);
-		return -ENOMEM;
-	}
 
 	if (IS_ERR(dev_p->msscam_mmio)) {
 		DRM_ERROR("failed to map MSSCAM registers\n");
@@ -509,8 +498,10 @@ static void kmb_drm_unload(struct device *dev)
 		release_mem_region(MIPI_BASE_ADDR, MIPI_MMIO_SIZE);
 	}
 
-	if (dev_p->msscam_mmio)
+	if (dev_p->msscam_mmio) {
 		iounmap(dev_p->msscam_mmio);
+		release_mem_region(MSS_CAM_BASE_ADDR, MSS_CAM_MMIO_SIZE);
+	}
 
 	of_reserved_mem_device_release(drm->dev);
 	drm_mode_config_cleanup(drm);
diff --git a/drivers/gpu/drm/kmb/kmb_drv.h b/drivers/gpu/drm/kmb/kmb_drv.h
index 58bb967..da1df5c 100644
--- a/drivers/gpu/drm/kmb/kmb_drv.h
+++ b/drivers/gpu/drm/kmb/kmb_drv.h
@@ -40,7 +40,6 @@ struct kmb_drm_private {
 	void __iomem			*lcd_mmio;
 	void __iomem			*mipi_mmio;
 	void __iomem			*msscam_mmio;
-	void __iomem			*cpr_mmio;
 	unsigned char			n_layers;
 	struct clk			*clk;
 	struct drm_crtc			crtc;
diff --git a/drivers/gpu/drm/kmb/kmb_regs.h b/drivers/gpu/drm/kmb/kmb_regs.h
index eb84320..255c44d 100644
--- a/drivers/gpu/drm/kmb/kmb_regs.h
+++ b/drivers/gpu/drm/kmb/kmb_regs.h
@@ -36,7 +36,7 @@
 #define MSS_CAM_BASE_ADDR			(MIPI_BASE_ADDR + 0x10000)
 #define LCD_MMIO_SIZE				(0x3000)
 #define MIPI_MMIO_SIZE				(0x4000)
-#define MSS_CAM_MMIO_SIZE			(0x10)
+#define MSS_CAM_MMIO_SIZE			(0x30)
 
 /***************************************************************************
  *		   LCD controller control register defines
-- 
2.7.4

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
