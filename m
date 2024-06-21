Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B0C4C912E67
	for <lists+dri-devel@lfdr.de>; Fri, 21 Jun 2024 22:18:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B5F1A89FCE;
	Fri, 21 Jun 2024 20:18:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.whiteo.stw.pengutronix.de
 (metis.whiteo.stw.pengutronix.de [185.203.201.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3761389FCE
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Jun 2024 20:18:04 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.whiteo.stw.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <l.stach@pengutronix.de>)
 id 1sKkho-00084d-SJ; Fri, 21 Jun 2024 22:17:56 +0200
Received: from [2a0a:edc0:0:1101:1d::28] (helo=dude02.red.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
 (envelope-from <l.stach@pengutronix.de>)
 id 1sKkhn-0041GP-85; Fri, 21 Jun 2024 22:17:55 +0200
From: Lucas Stach <l.stach@pengutronix.de>
To: Sandy Huang <hjc@rock-chips.com>,
 =?UTF-8?q?Heiko=20St=C3=BCbner?= <heiko@sntech.de>,
 Andy Yan <andy.yan@rock-chips.com>
Cc: dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, kernel@pengutronix.de,
 patchwork-lst@pengutronix.de
Subject: [PATCH] drm/rockchip: analogix_dp: allow to work without panel
Date: Fri, 21 Jun 2024 22:17:55 +0200
Message-Id: <20240621201755.500271-1-l.stach@pengutronix.de>
X-Mailer: git-send-email 2.39.2
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

When the DP output is routed to a external connector there is no
need for a fixed panel, as the panel may be detected via EDID on
the AUX channel. Allow to continue probing if no panel reference
is present.

Signed-off-by: Lucas Stach <l.stach@pengutronix.de>
---
 drivers/gpu/drm/rockchip/analogix_dp-rockchip.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/rockchip/analogix_dp-rockchip.c b/drivers/gpu/drm/rockchip/analogix_dp-rockchip.c
index 7069a3d4d581..2030a4e8c1a5 100644
--- a/drivers/gpu/drm/rockchip/analogix_dp-rockchip.c
+++ b/drivers/gpu/drm/rockchip/analogix_dp-rockchip.c
@@ -385,7 +385,7 @@ static int rockchip_dp_probe(struct platform_device *pdev)
 		return -ENODEV;
 
 	ret = drm_of_find_panel_or_bridge(dev->of_node, 1, 0, &panel, NULL);
-	if (ret < 0)
+	if (ret < 0 && ret != -ENODEV)
 		return ret;
 
 	dp = devm_kzalloc(dev, sizeof(*dp), GFP_KERNEL);
-- 
2.39.2

