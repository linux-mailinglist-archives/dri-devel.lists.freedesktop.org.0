Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CBC83D84BA
	for <lists+dri-devel@lfdr.de>; Wed, 28 Jul 2021 02:32:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F1EA96EB4F;
	Wed, 28 Jul 2021 00:32:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 066466EB4A
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Jul 2021 00:32:34 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10058"; a="209442030"
X-IronPort-AV: E=Sophos;i="5.84,275,1620716400"; d="scan'208";a="209442030"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jul 2021 17:32:33 -0700
X-IronPort-AV: E=Sophos;i="5.84,275,1620716400"; d="scan'208";a="634583490"
Received: from mamarti1-mobl.amr.corp.intel.com (HELO
 achrisan-desk3.intel.com) ([10.212.71.161])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jul 2021 17:32:33 -0700
From: Anitha Chrisanthus <anitha.chrisanthus@intel.com>
To: dri-devel@lists.freedesktop.org, anitha.chrisanthus@intel.com,
 edmund.j.dea@intel.com
Subject: [PATCH 12/14] drm/kmb: Fix possible oops in error handling
Date: Tue, 27 Jul 2021 17:31:24 -0700
Message-Id: <20210728003126.1425028-12-anitha.chrisanthus@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210728003126.1425028-1-anitha.chrisanthus@intel.com>
References: <20210728003126.1425028-1-anitha.chrisanthus@intel.com>
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
Cc: Dan Carpenter <dan.carpenter@oracle.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

If kmb_dsi_init() fails the "kmb->kmb_dsi" variable is an error pointer.
This can potentially result in kernel panic when kmb_dsi_host_unregister is
called.

Fixes: 7f7b96a8a0a1 ("drm/kmb: Add support for KeemBay Display")
Fixes: 98521f4d4b4c ("drm/kmb: Mipi DSI part of the display driver")
Cc: Dan Carpenter <dan.carpenter@oracle.com>
Signed-off-by: Anitha Chrisanthus <anitha.chrisanthus@intel.com>
---
 drivers/gpu/drm/kmb/kmb_drv.c | 9 ++++++---
 drivers/gpu/drm/kmb/kmb_dsi.c | 9 +++++----
 drivers/gpu/drm/kmb/kmb_dsi.h | 3 ++-
 3 files changed, 13 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/kmb/kmb_drv.c b/drivers/gpu/drm/kmb/kmb_drv.c
index bb7eca9e13ae..12f35c43d838 100644
--- a/drivers/gpu/drm/kmb/kmb_drv.c
+++ b/drivers/gpu/drm/kmb/kmb_drv.c
@@ -454,8 +454,9 @@ static int kmb_remove(struct platform_device *pdev)
 	dev_set_drvdata(dev, NULL);
 
 	/* Unregister DSI host */
-	kmb_dsi_host_unregister(kmb->kmb_dsi);
+	kmb_dsi_host_unregister();
 	drm_atomic_helper_shutdown(drm);
+	drm_dev_put(drm);
 	return 0;
 }
 
@@ -519,7 +520,7 @@ static int kmb_probe(struct platform_device *pdev)
 	if (IS_ERR(kmb->kmb_dsi)) {
 		drm_err(&kmb->drm, "failed to initialize DSI\n");
 		ret = PTR_ERR(kmb->kmb_dsi);
-		goto err_free1;
+		goto err_free2;
 	}
 
 	kmb->kmb_dsi->dev = &dsi_pdev->dev;
@@ -555,8 +556,10 @@ static int kmb_probe(struct platform_device *pdev)
 	drm_crtc_cleanup(&kmb->crtc);
 	drm_mode_config_cleanup(&kmb->drm);
  err_free1:
+	kmb_dsi_clk_disable(kmb->kmb_dsi);
+ err_free2:
 	dev_set_drvdata(dev, NULL);
-	kmb_dsi_host_unregister(kmb->kmb_dsi);
+	kmb_dsi_host_unregister();
 
 	return ret;
 }
diff --git a/drivers/gpu/drm/kmb/kmb_dsi.c b/drivers/gpu/drm/kmb/kmb_dsi.c
index 1cca0fe6f35f..a500172ada87 100644
--- a/drivers/gpu/drm/kmb/kmb_dsi.c
+++ b/drivers/gpu/drm/kmb/kmb_dsi.c
@@ -172,17 +172,17 @@ mipi_hs_freq_range[MIPI_DPHY_DEFAULT_BIT_RATES] = {
 	{.default_bit_rate_mbps = 2500, .hsfreqrange_code = 0x49}
 };
 
-static void kmb_dsi_clk_disable(struct kmb_dsi *kmb_dsi)
+void kmb_dsi_clk_disable(struct kmb_dsi *kmb_dsi)
 {
 	clk_disable_unprepare(kmb_dsi->clk_mipi);
 	clk_disable_unprepare(kmb_dsi->clk_mipi_ecfg);
 	clk_disable_unprepare(kmb_dsi->clk_mipi_cfg);
 }
 
-void kmb_dsi_host_unregister(struct kmb_dsi *kmb_dsi)
+void kmb_dsi_host_unregister(void)
 {
-	kmb_dsi_clk_disable(kmb_dsi);
-	mipi_dsi_host_unregister(kmb_dsi->host);
+	if (dsi_host)
+		mipi_dsi_host_unregister(dsi_host);
 }
 
 /*
@@ -229,6 +229,7 @@ int kmb_dsi_host_bridge_init(struct device *dev)
 			dsi_device = kzalloc(sizeof(*dsi_device), GFP_KERNEL);
 			if (!dsi_device) {
 				kfree(dsi_host);
+				dsi_host = NULL;
 				return -ENOMEM;
 			}
 		}
diff --git a/drivers/gpu/drm/kmb/kmb_dsi.h b/drivers/gpu/drm/kmb/kmb_dsi.h
index 66b7c500d9bc..89e85c993609 100644
--- a/drivers/gpu/drm/kmb/kmb_dsi.h
+++ b/drivers/gpu/drm/kmb/kmb_dsi.h
@@ -378,7 +378,8 @@ static inline void kmb_clr_bit_mipi(struct kmb_dsi *kmb_dsi,
 
 int kmb_dsi_host_bridge_init(struct device *dev);
 struct kmb_dsi *kmb_dsi_init(struct platform_device *pdev);
-void kmb_dsi_host_unregister(struct kmb_dsi *kmb_dsi);
+void kmb_dsi_host_unregister(void);
+void kmb_dsi_clk_disable(struct kmb_dsi *kmb_dsi);
 int kmb_dsi_mode_set(struct kmb_dsi *kmb_dsi, struct drm_display_mode *mode,
 		     int sys_clk_mhz);
 int kmb_dsi_map_mmio(struct kmb_dsi *kmb_dsi);
-- 
2.25.1

