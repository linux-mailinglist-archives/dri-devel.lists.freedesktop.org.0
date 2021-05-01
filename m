Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AD41B3707B5
	for <lists+dri-devel@lfdr.de>; Sat,  1 May 2021 17:24:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E3CEC6E5B2;
	Sat,  1 May 2021 15:24:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp.smtpout.orange.fr (smtp03.smtpout.orange.fr
 [80.12.242.125])
 by gabe.freedesktop.org (Postfix) with ESMTP id D19736E15F
 for <dri-devel@lists.freedesktop.org>; Sat,  1 May 2021 15:20:51 +0000 (UTC)
Received: from localhost.localdomain ([86.243.172.93]) by mwinf5d06 with ME
 id zTDH2400S21Fzsu03TDJFe; Sat, 01 May 2021 17:13:20 +0200
X-ME-Helo: localhost.localdomain
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Sat, 01 May 2021 17:13:20 +0200
X-ME-IP: 86.243.172.93
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To: hjc@rock-chips.com, heiko@sntech.de, airlied@linux.ie, daniel@ffwll.ch,
 miquel.raynal@bootlin.com
Subject: [PATCH] drm/rockchip: Fix an error handling path
Date: Sat,  1 May 2021 17:13:16 +0200
Message-Id: <248220d4815dc8c8088cebfab7d6df5f70518438.1619881852.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-Mailman-Approved-At: Sat, 01 May 2021 15:24:43 +0000
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
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-rockchip@lists.infradead.org,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

'ret' is know to be 0 a this point. Checking the return value of
'phy_init()' and 'phy_set_mode()' was intended instead.

So add the missing assignments.

Fixes: cca1705c3d89 ("drm/rockchip: lvds: Add PX30 support")
Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 drivers/gpu/drm/rockchip/rockchip_lvds.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/rockchip/rockchip_lvds.c b/drivers/gpu/drm/rockchip/rockchip_lvds.c
index bd5ba10822c2..489d63c05c0d 100644
--- a/drivers/gpu/drm/rockchip/rockchip_lvds.c
+++ b/drivers/gpu/drm/rockchip/rockchip_lvds.c
@@ -499,11 +499,11 @@ static int px30_lvds_probe(struct platform_device *pdev,
 	if (IS_ERR(lvds->dphy))
 		return PTR_ERR(lvds->dphy);
 
-	phy_init(lvds->dphy);
+	ret = phy_init(lvds->dphy);
 	if (ret)
 		return ret;
 
-	phy_set_mode(lvds->dphy, PHY_MODE_LVDS);
+	ret = phy_set_mode(lvds->dphy, PHY_MODE_LVDS);
 	if (ret)
 		return ret;
 
-- 
2.30.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
