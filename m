Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 06E1C7B1B45
	for <lists+dri-devel@lfdr.de>; Thu, 28 Sep 2023 13:36:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8249610E624;
	Thu, 28 Sep 2023 11:36:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.whiteo.stw.pengutronix.de
 (metis.whiteo.stw.pengutronix.de [IPv6:2a0a:edc0:2:b01:1d::104])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F14A510E05D
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Sep 2023 11:36:32 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.whiteo.stw.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <l.stach@pengutronix.de>)
 id 1qlpJm-0001s3-8f; Thu, 28 Sep 2023 13:36:30 +0200
Received: from [2a0a:edc0:0:1101:1d::28] (helo=dude02.red.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
 (envelope-from <l.stach@pengutronix.de>)
 id 1qlpJl-009Z8S-R3; Thu, 28 Sep 2023 13:36:29 +0200
From: Lucas Stach <l.stach@pengutronix.de>
To: Marek Vasut <marex@denx.de>,
	Liu Ying <victor.liu@nxp.com>
Subject: [PATCH v3 6/8] drm: lcdif: remove superfluous setup of framebuffer
 DMA address
Date: Thu, 28 Sep 2023 13:36:27 +0200
Message-Id: <20230928113629.103188-6-l.stach@pengutronix.de>
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

Now that the plane state is fully programmed into the hardware before
the scanout is started there is no need to program the plane framebuffer
DMA address from the CRTC atomic_enable anymore.

Signed-off-by: Lucas Stach <l.stach@pengutronix.de>
Reviewed-by: Marek Vasut <marex@denx.de>
---
v2/3: no changes
---
 drivers/gpu/drm/mxsfb/lcdif_kms.c | 10 ----------
 1 file changed, 10 deletions(-)

diff --git a/drivers/gpu/drm/mxsfb/lcdif_kms.c b/drivers/gpu/drm/mxsfb/lcdif_kms.c
index 1b90014d055a..a5859c83fe08 100644
--- a/drivers/gpu/drm/mxsfb/lcdif_kms.c
+++ b/drivers/gpu/drm/mxsfb/lcdif_kms.c
@@ -529,7 +529,6 @@ static void lcdif_crtc_atomic_enable(struct drm_crtc *crtc,
 									    crtc->primary);
 	struct drm_display_mode *m = &lcdif->crtc.state->adjusted_mode;
 	struct drm_device *drm = lcdif->drm;
-	dma_addr_t paddr;
 
 	clk_set_rate(lcdif->clk, m->crtc_clock * 1000);
 
@@ -541,15 +540,6 @@ static void lcdif_crtc_atomic_enable(struct drm_crtc *crtc,
 
 	lcdif_crtc_mode_set_nofb(new_cstate, new_pstate);
 
-	/* Write cur_buf as well to avoid an initial corrupt frame */
-	paddr = drm_fb_dma_get_gem_addr(new_pstate->fb, new_pstate, 0);
-	if (paddr) {
-		writel(lower_32_bits(paddr),
-		       lcdif->base + LCDC_V8_CTRLDESCL_LOW0_4);
-		writel(CTRLDESCL_HIGH0_4_ADDR_HIGH(upper_32_bits(paddr)),
-		       lcdif->base + LCDC_V8_CTRLDESCL_HIGH0_4);
-	}
-
 	clk_prepare_enable(lcdif->clk);
 
 	lcdif_enable_controller(lcdif);
-- 
2.39.2

