Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F8F275C1BE
	for <lists+dri-devel@lfdr.de>; Fri, 21 Jul 2023 10:33:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E45AC10E636;
	Fri, 21 Jul 2023 08:33:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F44610E632
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Jul 2023 08:33:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
 t=1689928402; x=1721464402;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ih/v3JlPgjnunjeMXetvHkaR0ZTTwffvOCV3Ri/27Bg=;
 b=LaMZ3XdE5CM/s2nGGpEy97XOXujgIcVCiRuSre8jVMtVed/46GY+bdJn
 PzCtC06bJYhOfHcJudSuKB0SH6boR6Vnguv37/91Ee6ut5EfmLK2l0gaC
 mT0tIBUjnBDsZS0/g4nKv910UBsFdxR1vFe2qK3YvbNA3EdGql9NjMkhO
 JHIzM0MQJSUnUFDCahs9xFSs76+bwS3XgswQM184X6j7Ap6Nsa/4wX2gm
 MYFHL7STRWTCh/pV4NPCLYGhUTJyyjtkoaFvdal7C3pKZ1gyebkrVl7Hb
 FvNGR59OGBgxRC62DAFCQMWMqv8iqlp/860xJHzZYaLoZJGfs6xqwRBuv g==;
X-IronPort-AV: E=Sophos;i="6.01,220,1684792800"; d="scan'208";a="32048650"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
 by mx1.tq-group.com with ESMTP; 21 Jul 2023 10:33:19 +0200
Received: from steina-w.tq-net.de (unknown [10.123.53.21])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id 55D45280084;
 Fri, 21 Jul 2023 10:33:19 +0200 (CEST)
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Stefan Agner <stefan@agner.ch>, Alison Wang <alison.wang@nxp.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Matthias Schiffer <matthias.schiffer@tq-group.com>
Subject: [RESEND 2/2] drm: fsl-dcu: enable PIXCLK on LS1021A
Date: Fri, 21 Jul 2023 10:33:14 +0200
Message-Id: <20230721083314.1190614-2-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230721083314.1190614-1-alexander.stein@ew.tq-group.com>
References: <20230721083314.1190614-1-alexander.stein@ew.tq-group.com>
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
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Matthias Schiffer <matthias.schiffer@tq-group.com>

The PIXCLK needs to be enabled in SCFG before accessing certain DCU
registers, or the access will hang.

Signed-off-by: Matthias Schiffer <matthias.schiffer@tq-group.com>
Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
 drivers/gpu/drm/fsl-dcu/Kconfig           |  1 +
 drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_drv.c | 14 ++++++++++++++
 drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_drv.h |  3 +++
 3 files changed, 18 insertions(+)

diff --git a/drivers/gpu/drm/fsl-dcu/Kconfig b/drivers/gpu/drm/fsl-dcu/Kconfig
index 5ca71ef87325..c9ee98693b48 100644
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
index 90cbd18f096d..283858350961 100644
--- a/drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_drv.c
+++ b/drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_drv.c
@@ -100,12 +100,26 @@ static void fsl_dcu_irq_uninstall(struct drm_device *dev)
 static int fsl_dcu_load(struct drm_device *dev, unsigned long flags)
 {
 	struct fsl_dcu_drm_device *fsl_dev = dev->dev_private;
+	struct regmap *scfg;
 	int ret;
 
 	ret = fsl_dcu_drm_modeset_init(fsl_dev);
 	if (ret < 0)
 		return dev_err_probe(dev->dev, ret, "failed to initialize mode setting\n");
 
+	scfg = syscon_regmap_lookup_by_compatible("fsl,ls1021a-scfg");
+	if (PTR_ERR(scfg) != -ENODEV) {
+		/*
+		 * For simplicity, enable the PIXCLK unconditionally. Disabling
+		 * the clock in PM or on unload could be implemented as a future
+		 * improvement.
+		 */
+		ret = regmap_update_bits(scfg, SCFG_PIXCLKCR, SCFG_PIXCLKCR_PXCEN,
+					SCFG_PIXCLKCR_PXCEN);
+		if (ret < 0)
+			return dev_err_probe(dev->dev, ret, "failed to enable pixclk\n");
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
2.34.1

