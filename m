Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BA3096E47F1
	for <lists+dri-devel@lfdr.de>; Mon, 17 Apr 2023 14:38:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3711010E2A0;
	Mon, 17 Apr 2023 12:38:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C016510E2A0
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Apr 2023 12:38:21 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <sha@pengutronix.de>)
 id 1poO7b-0006Br-ME; Mon, 17 Apr 2023 14:38:15 +0200
Received: from [2a0a:edc0:0:1101:1d::28] (helo=dude02.red.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
 (envelope-from <sha@pengutronix.de>)
 id 1poO7T-00BseC-Rd; Mon, 17 Apr 2023 14:38:07 +0200
Received: from sha by dude02.red.stw.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <sha@pengutronix.de>)
 id 1poO7T-00993Y-4i; Mon, 17 Apr 2023 14:38:07 +0200
From: Sascha Hauer <s.hauer@pengutronix.de>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/rockchip: vop2: Use regcache_sync() to fix suspend/resume
Date: Mon, 17 Apr 2023 14:37:47 +0200
Message-Id: <20230417123747.2179695-1-s.hauer@pengutronix.de>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: sha@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
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
Cc: =?UTF-8?q?K=C3=B6ry=20Maincent?= <kory.maincent@bootlin.com>,
 Sascha Hauer <s.hauer@pengutronix.de>, Sandy Huang <hjc@rock-chips.com>,
 stable@vger.kernel.org, Chris Morgan <macroalpha82@gmail.com>,
 Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
 linux-rockchip@lists.infradead.org,
 Michael Riesch <michael.riesch@wolfvision.net>, kernel@pengutronix.de
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

afa965a45e01 ("drm/rockchip: vop2: fix suspend/resume") uses
regmap_reinit_cache() to fix the suspend/resume issue with the VOP2
driver. During discussion it came up that we should rather use
regcache_sync() instead. As the original patch is already applied
fix this up in this follow-up patch.

Fixes: afa965a45e01 ("drm/rockchip: vop2: fix suspend/resume")
Cc: stable@vger.kernel.org
Link: https://lore.kernel.org/r/20230417094215.2049231-1-s.hauer@pengutronix.de
Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
---
 drivers/gpu/drm/rockchip/rockchip_drm_vop2.c | 10 +++-------
 1 file changed, 3 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
index d9daa686b014d..293c228a83f90 100644
--- a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
+++ b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
@@ -215,8 +215,6 @@ struct vop2 {
 	struct vop2_win win[];
 };
 
-static const struct regmap_config vop2_regmap_config;
-
 static struct vop2_video_port *to_vop2_video_port(struct drm_crtc *crtc)
 {
 	return container_of(crtc, struct vop2_video_port, crtc);
@@ -841,11 +839,7 @@ static void vop2_enable(struct vop2 *vop2)
 		return;
 	}
 
-	ret = regmap_reinit_cache(vop2->map, &vop2_regmap_config);
-	if (ret) {
-		drm_err(vop2->drm, "failed to reinit cache: %d\n", ret);
-		return;
-	}
+	regcache_sync(vop2->map);
 
 	if (vop2->data->soc_id == 3566)
 		vop2_writel(vop2, RK3568_OTP_WIN_EN, 1);
@@ -875,6 +869,8 @@ static void vop2_disable(struct vop2 *vop2)
 
 	pm_runtime_put_sync(vop2->dev);
 
+	regcache_mark_dirty(vop2->map);
+
 	clk_disable_unprepare(vop2->aclk);
 	clk_disable_unprepare(vop2->hclk);
 }
-- 
2.39.2

