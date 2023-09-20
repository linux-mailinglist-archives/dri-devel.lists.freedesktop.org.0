Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 609897A793D
	for <lists+dri-devel@lfdr.de>; Wed, 20 Sep 2023 12:31:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6EA7B10E46E;
	Wed, 20 Sep 2023 10:31:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.whiteo.stw.pengutronix.de
 (metis.whiteo.stw.pengutronix.de [IPv6:2a0a:edc0:2:b01:1d::104])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4105810E468
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Sep 2023 10:31:30 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.whiteo.stw.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <l.stach@pengutronix.de>)
 id 1qiuUR-0003mR-Ps; Wed, 20 Sep 2023 12:31:27 +0200
Received: from [2a0a:edc0:0:1101:1d::28] (helo=dude02.red.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
 (envelope-from <l.stach@pengutronix.de>)
 id 1qiuUR-007fJ0-7Z; Wed, 20 Sep 2023 12:31:27 +0200
From: Lucas Stach <l.stach@pengutronix.de>
To: Marek Vasut <marex@denx.de>,
	Liu Ying <victor.liu@nxp.com>
Subject: [PATCH 2/5] drm: lcdif: move controller enable into atomic_flush
Date: Wed, 20 Sep 2023 12:31:23 +0200
Message-Id: <20230920103126.2759601-3-l.stach@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230920103126.2759601-1-l.stach@pengutronix.de>
References: <20230920103126.2759601-1-l.stach@pengutronix.de>
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

Allow drm_atomic_helper_commit_tail_rpm to setup all the plane
state before the scanout is started.

Signed-off-by: Lucas Stach <l.stach@pengutronix.de>
---
 drivers/gpu/drm/mxsfb/lcdif_kms.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/mxsfb/lcdif_kms.c b/drivers/gpu/drm/mxsfb/lcdif_kms.c
index f5bfe8b52920..4acf6914a8d1 100644
--- a/drivers/gpu/drm/mxsfb/lcdif_kms.c
+++ b/drivers/gpu/drm/mxsfb/lcdif_kms.c
@@ -505,6 +505,8 @@ static int lcdif_crtc_atomic_check(struct drm_crtc *crtc,
 static void lcdif_crtc_atomic_flush(struct drm_crtc *crtc,
 				    struct drm_atomic_state *state)
 {
+	struct drm_crtc_state *crtc_state = drm_atomic_get_new_crtc_state(state,
+									  crtc);
 	struct lcdif_drm_private *lcdif = to_lcdif_drm_private(crtc->dev);
 	struct drm_pending_vblank_event *event;
 	u32 reg;
@@ -513,6 +515,9 @@ static void lcdif_crtc_atomic_flush(struct drm_crtc *crtc,
 	reg |= CTRLDESCL0_5_SHADOW_LOAD_EN;
 	writel(reg, lcdif->base + LCDC_V8_CTRLDESCL0_5);
 
+	if (drm_atomic_crtc_needs_modeset(crtc_state))
+		lcdif_enable_controller(lcdif);
+
 	event = crtc->state->event;
 	crtc->state->event = NULL;
 
@@ -552,7 +557,6 @@ static void lcdif_crtc_atomic_enable(struct drm_crtc *crtc,
 		writel(CTRLDESCL_HIGH0_4_ADDR_HIGH(upper_32_bits(paddr)),
 		       lcdif->base + LCDC_V8_CTRLDESCL_HIGH0_4);
 	}
-	lcdif_enable_controller(lcdif);
 
 	drm_crtc_vblank_on(crtc);
 }
-- 
2.39.2

