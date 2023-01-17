Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B75A66DBE0
	for <lists+dri-devel@lfdr.de>; Tue, 17 Jan 2023 12:08:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 738FF10E199;
	Tue, 17 Jan 2023 11:08:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A0CE10E16A
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Jan 2023 11:08:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
 t=1673953687; x=1705489687;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=L4l3fBcFfRGdtz6KUN3jrhJukfsBfTgFO++kKAbhRco=;
 b=oYzzYlHj3/AcZhi4isgjxVRWxokvPWT6ysmrASY2T5VdpIBlHfIz3B9A
 9Snj2BzP40NZ84gfmNe1yG3crc3Msk+bMMjQm2VfhWms5wsG8GGqr+FiS
 /HhSkNjVrvLf1jq3lXUi6AErCLCgNZMLt6te4yL+m9xmkux2gb9nrES7f
 B/UsR3FWcaJ4FLoT7ddkjKZO1y1uSfFfk1tV+HtI/NnBYx+o228ZxqJPP
 TuVGiN4MJ6pOYCp5Kkb/nDEf/K6RlsuHydKmOm5jmpmmB4xYcWjRHop3w
 T/M4z6duwkFfE4F/wvfwSnoV7yKh/0SMrx5RbvRbgU+VOhx3DyYr5IJNY w==;
X-IronPort-AV: E=Sophos;i="5.97,222,1669071600"; d="scan'208";a="28473969"
Received: from unknown (HELO tq-pgp-pr1.tq-net.de) ([192.168.6.15])
 by mx1-pgp.tq-group.com with ESMTP; 17 Jan 2023 12:08:05 +0100
Received: from mx1.tq-group.com ([192.168.6.7])
 by tq-pgp-pr1.tq-net.de (PGP Universal service);
 Tue, 17 Jan 2023 12:08:05 +0100
X-PGP-Universal: processed;
 by tq-pgp-pr1.tq-net.de on Tue, 17 Jan 2023 12:08:05 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
 t=1673953685; x=1705489685;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=L4l3fBcFfRGdtz6KUN3jrhJukfsBfTgFO++kKAbhRco=;
 b=PsPz7fk65juIPEkAbiYg9tunJeGe7jr+msSxB7VyfdLyeXALHF5BK4IC
 5JlOy70e+WJ14fYtHYGZwksrjXOBmmSwdaUroB0GXbn6f7KZQogPLnaCO
 sJYvQUv285DCT5TtQ7OlWptHWfefgHRU35fnBBjMDVU1lPdXAM+TRP/7R
 MuEdbmESB91asprddKQvFz5KxrYlrEF6jkq6WJK4KIKpFBYqryINN+Cgh
 WhXmSy1I8j0VEt7BvvK/GPqePvku7bda4Q2SHDTD1LIyeXyd0BeXGiat1
 XqXBmKv1fxpTVskpNzRQoGSH0p42boqxySdXnH3Cfrjt6HJMbJxbeRsHC g==;
X-IronPort-AV: E=Sophos;i="5.97,222,1669071600"; d="scan'208";a="28473968"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
 by mx1.tq-group.com with ESMTP; 17 Jan 2023 12:08:04 +0100
Received: from steina-w.tq-net.de (unknown [10.123.53.21])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id C3B8A280072;
 Tue, 17 Jan 2023 12:08:04 +0100 (CET)
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Stefan Agner <stefan@agner.ch>, Alison Wang <alison.wang@nxp.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH 2/2] drm: fsl-dcu: enable PIXCLK on LS1021A
Date: Tue, 17 Jan 2023 12:08:01 +0100
Message-Id: <20230117110801.2069761-2-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230117110801.2069761-1-alexander.stein@ew.tq-group.com>
References: <20230117110801.2069761-1-alexander.stein@ew.tq-group.com>
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
 dri-devel@lists.freedesktop.org,
 Matthias Schiffer <matthias.schiffer@tq-group.com>
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
index 418887654bac..314cb8af89ee 100644
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

