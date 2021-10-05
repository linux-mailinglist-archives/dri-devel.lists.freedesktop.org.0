Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F926422A4A
	for <lists+dri-devel@lfdr.de>; Tue,  5 Oct 2021 16:11:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8BBDC6EB84;
	Tue,  5 Oct 2021 14:11:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D2666EB84
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Oct 2021 14:11:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
 t=1633443063; x=1664979063;
 h=from:to:cc:subject:date:message-id;
 bh=cWnKOg8r6C/fFZOvhLtC59xTSJGhJiS1xNWLXoHO2TQ=;
 b=JlUyG4e3gsIWAzS/y+cc3YBqasBoll9Jv0vcZA8cA/Slp9x+lUbQNQfo
 b5I/hVT8edGIASoXOm9W6IQf+XWwPUxRD8emZZT0XlDwjlCm3zKp1zDpe
 dJezMTbvYDiq83DmesBB+WmXT7DWSHo5BMnEo1nYn8nJaJEJko9HO1DQr
 XNfC1jA93OspRQDFC8LypW8fO/YBpA3zb1XajDEnKy4EHFC7du+1qmj+5
 /kZczXonU7krpsZ5AYjiIDsJt/GbaAe98BpX3znVj/C/GaqN2qH3e0uOT
 SKkUYlvDNc/mySWxjFCU9fIgXFy8kgWr9xlng2/2heSUhHFnK33MhhHsW w==;
X-IronPort-AV: E=Sophos;i="5.85,349,1624312800"; d="scan'208";a="19875743"
Received: from unknown (HELO tq-pgp-pr1.tq-net.de) ([192.168.6.15])
 by mx1-pgp.tq-group.com with ESMTP; 05 Oct 2021 16:11:01 +0200
Received: from mx1.tq-group.com ([192.168.6.7])
 by tq-pgp-pr1.tq-net.de (PGP Universal service);
 Tue, 05 Oct 2021 16:11:01 +0200
X-PGP-Universal: processed;
 by tq-pgp-pr1.tq-net.de on Tue, 05 Oct 2021 16:11:01 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
 t=1633443061; x=1664979061;
 h=from:to:cc:subject:date:message-id;
 bh=cWnKOg8r6C/fFZOvhLtC59xTSJGhJiS1xNWLXoHO2TQ=;
 b=g9aRSx+gE9xbAgsy6F4R5hD5+jPtUDFVHRWsQJ1RBP60/qK29/pKNnnu
 DOK9SNFluc63DL8rHdPQnvO+H4oqhuL7DqJNWgFv+R6yXDg2L4ygsKEqG
 PMkfsy+cuH673zBILjQIimeiD0AlMSINS0rZl1PooGOs/86dVPDng6PgD
 O0W92WsJTEKEFcymSUgXYnOzgjaslpRJmnIgedzzZ1hS6Lxs6D0t0tzX2
 Yxu5XraXEvXRY8tkq55CUR/WSLaS6h8S5XCxY9D8T0lWyw74Le9ttZnH9
 BEyWWeoOQqm4RaltNPNvmJs4UXmCwBErOtuRWvWeUsStGNTSVXaQ8EnAs Q==;
X-IronPort-AV: E=Sophos;i="5.85,349,1624312800"; d="scan'208";a="19875742"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
 by mx1.tq-group.com with ESMTP; 05 Oct 2021 16:11:01 +0200
Received: from schifferm-ubuntu4.tq-net.de (schifferm-ubuntu4.tq-net.de
 [10.121.48.12])
 by vtuxmail01.tq-net.de (Postfix) with ESMTPA id 937D5280065;
 Tue,  5 Oct 2021 16:11:01 +0200 (CEST)
From: Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
To: Stefan Agner <stefan@agner.ch>, Alison Wang <alison.wang@nxp.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
Subject: [PATCH v2] drm: fsl-dcu: enable PIXCLK on LS1021A
Date: Tue,  5 Oct 2021 16:10:41 +0200
Message-Id: <20211005141041.2988-1-matthias.schiffer@ew.tq-group.com>
X-Mailer: git-send-email 2.17.1
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The PIXCLK needs to be enabled in SCFG before accessing the DCU on LS1021A,
or the access will hang.

Signed-off-by: Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
---

v2:
- rebase
- remove unnecessary argument of fsl_dcu_scfg_config_ls1021a()


 drivers/gpu/drm/fsl-dcu/Kconfig           |  1 +
 drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_drv.c | 25 +++++++++++++++++++++++
 drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_drv.h |  3 +++
 3 files changed, 29 insertions(+)

diff --git a/drivers/gpu/drm/fsl-dcu/Kconfig b/drivers/gpu/drm/fsl-dcu/Kconfig
index d7dd8ba90e3a..9e5a35e7c00c 100644
--- a/drivers/gpu/drm/fsl-dcu/Kconfig
+++ b/drivers/gpu/drm/fsl-dcu/Kconfig
@@ -8,6 +8,7 @@ config DRM_FSL_DCU
 	select DRM_PANEL
 	select REGMAP_MMIO
 	select VIDEOMODE_HELPERS
+	select MFD_SYSCON if SOC_LS1021A
 	help
 	  Choose this option if you have an Freescale DCU chipset.
 	  If M is selected the module will be called fsl-dcu-drm.
diff --git a/drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_drv.c b/drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_drv.c
index 660fe573db96..b6b1cb75fc41 100644
--- a/drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_drv.c
+++ b/drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_drv.c
@@ -50,6 +50,23 @@ static const struct regmap_config fsl_dcu_regmap_config = {
 	.volatile_reg = fsl_dcu_drm_is_volatile_reg,
 };
 
+static int fsl_dcu_scfg_config_ls1021a(void)
+{
+	struct regmap *scfg;
+
+	scfg = syscon_regmap_lookup_by_compatible("fsl,ls1021a-scfg");
+	if (IS_ERR(scfg))
+		return PTR_ERR(scfg);
+
+	/*
+	 * For simplicity, enable the PIXCLK unconditionally. It might
+	 * be possible to disable the clock in PM or on unload as a future
+	 * improvement.
+	 */
+	return regmap_update_bits(scfg, SCFG_PIXCLKCR, SCFG_PIXCLKCR_PXCEN,
+				  SCFG_PIXCLKCR_PXCEN);
+}
+
 static void fsl_dcu_irq_reset(struct drm_device *dev)
 {
 	struct fsl_dcu_drm_device *fsl_dev = dev->dev_private;
@@ -108,6 +125,14 @@ static int fsl_dcu_load(struct drm_device *dev, unsigned long flags)
 		return ret;
 	}
 
+	if (of_device_is_compatible(fsl_dev->np, "fsl,ls1021a-dcu")) {
+		ret = fsl_dcu_scfg_config_ls1021a();
+		if (ret < 0) {
+			dev_err(dev->dev, "failed to enable pixclk\n");
+			goto done_vblank;
+		}
+	}
+
 	ret = drm_vblank_init(dev, dev->mode_config.num_crtc);
 	if (ret < 0) {
 		dev_err(dev->dev, "failed to initialize vblank\n");
diff --git a/drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_drv.h b/drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_drv.h
index e2049a0e8a92..566396013c04 100644
--- a/drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_drv.h
+++ b/drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_drv.h
@@ -160,6 +160,9 @@
 #define FSL_DCU_ARGB4444		12
 #define FSL_DCU_YUV422			14
 
+#define SCFG_PIXCLKCR			0x28
+#define SCFG_PIXCLKCR_PXCEN		BIT(31)
+
 #define VF610_LAYER_REG_NUM		9
 #define LS1021A_LAYER_REG_NUM		10
 
-- 
2.17.1

