Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 964327B1B46
	for <lists+dri-devel@lfdr.de>; Thu, 28 Sep 2023 13:36:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0948910E625;
	Thu, 28 Sep 2023 11:36:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.whiteo.stw.pengutronix.de
 (metis.whiteo.stw.pengutronix.de [IPv6:2a0a:edc0:2:b01:1d::104])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A817410E624
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Sep 2023 11:36:32 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.whiteo.stw.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <l.stach@pengutronix.de>)
 id 1qlpJm-0001s1-4n; Thu, 28 Sep 2023 13:36:30 +0200
Received: from [2a0a:edc0:0:1101:1d::28] (helo=dude02.red.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
 (envelope-from <l.stach@pengutronix.de>)
 id 1qlpJl-009Z8S-N2; Thu, 28 Sep 2023 13:36:29 +0200
From: Lucas Stach <l.stach@pengutronix.de>
To: Marek Vasut <marex@denx.de>,
	Liu Ying <victor.liu@nxp.com>
Subject: [PATCH v3 4/8] drm: lcdif: control display clock from CRTC
 enable/disable
Date: Thu, 28 Sep 2023 13:36:25 +0200
Message-Id: <20230928113629.103188-4-l.stach@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230928113629.103188-1-l.stach@pengutronix.de>
References: <20230928113629.103188-1-l.stach@pengutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: l.stach@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: dri-devel@lists.freedesktop.org
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
Cc: linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org,
 NXP Linux Team <linux-imx@nxp.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>, patchwork-lst@pengutronix.de
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The display clock only required to be running when the CRTC
is enabled, so we have well defined points in the DRM atomic
sequence when this clock should be enabled or disabled.

Signed-off-by: Lucas Stach <l.stach@pengutronix.de>
---
v3: new patch
---
 drivers/gpu/drm/mxsfb/lcdif_drv.c | 4 ----
 drivers/gpu/drm/mxsfb/lcdif_kms.c | 5 +++++
 2 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/mxsfb/lcdif_drv.c b/drivers/gpu/drm/mxsfb/lcdif_drv.c
index 18de2f17e249..38dfd307adc1 100644
--- a/drivers/gpu/drm/mxsfb/lcdif_drv.c
+++ b/drivers/gpu/drm/mxsfb/lcdif_drv.c
@@ -306,8 +306,6 @@ static int __maybe_unused lcdif_rpm_suspend(struct device *dev)
 	struct drm_device *drm = dev_get_drvdata(dev);
 	struct lcdif_drm_private *lcdif = drm->dev_private;
 
-	/* These clock supply the DISPLAY CLOCK Domain */
-	clk_disable_unprepare(lcdif->clk);
 	/* These clock supply the System Bus, AXI, Write Path, LFIFO */
 	clk_disable_unprepare(lcdif->clk_disp_axi);
 	/* These clock supply the Control Bus, APB, APBH Ctrl Registers */
@@ -325,8 +323,6 @@ static int __maybe_unused lcdif_rpm_resume(struct device *dev)
 	clk_prepare_enable(lcdif->clk_axi);
 	/* These clock supply the System Bus, AXI, Write Path, LFIFO */
 	clk_prepare_enable(lcdif->clk_disp_axi);
-	/* These clock supply the DISPLAY CLOCK Domain */
-	clk_prepare_enable(lcdif->clk);
 
 	return 0;
 }
diff --git a/drivers/gpu/drm/mxsfb/lcdif_kms.c b/drivers/gpu/drm/mxsfb/lcdif_kms.c
index 6a292f4b332b..d43e3633bce0 100644
--- a/drivers/gpu/drm/mxsfb/lcdif_kms.c
+++ b/drivers/gpu/drm/mxsfb/lcdif_kms.c
@@ -545,6 +545,9 @@ static void lcdif_crtc_atomic_enable(struct drm_crtc *crtc,
 		writel(CTRLDESCL_HIGH0_4_ADDR_HIGH(upper_32_bits(paddr)),
 		       lcdif->base + LCDC_V8_CTRLDESCL_HIGH0_4);
 	}
+
+	clk_prepare_enable(lcdif->clk);
+
 	lcdif_enable_controller(lcdif);
 
 	drm_crtc_vblank_on(crtc);
@@ -561,6 +564,8 @@ static void lcdif_crtc_atomic_disable(struct drm_crtc *crtc,
 
 	lcdif_disable_controller(lcdif);
 
+	clk_disable_unprepare(lcdif->clk);
+
 	spin_lock_irq(&drm->event_lock);
 	event = crtc->state->event;
 	if (event) {
-- 
2.39.2

