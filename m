Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D3B8A17919
	for <lists+dri-devel@lfdr.de>; Tue, 21 Jan 2025 09:14:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B6EDB10E4F3;
	Tue, 21 Jan 2025 08:14:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=163.com header.i=@163.com header.b="HMn43862";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.3])
 by gabe.freedesktop.org (Postfix) with ESMTP id B430410E4F3
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Jan 2025 08:14:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=lnHDg
 B30BKfbeE3jVS8dTSbxptXgBhpJgVEJ1B3jgnQ=; b=HMn438621z6KnLeywtU5u
 mDT8BN4/KidHcDIv9FqA9qRQR9jMzN8qHKTWX0Xo55hbDd4oWrQIyFPmyEhWwZ0R
 t1YAsB4ts8fJo6yFvieaRw4RGLRHMdbx6OVt/3q/MZBs8mSBlobz7MsqWR47BYmd
 Vm9/cC9fSICKQW61/FwRwo=
Received: from localhost.localdomain (unknown [])
 by gzga-smtp-mtada-g0-0 (Coremail) with SMTP id
 _____wDnl1Q0V49nw9a6Hg--.31033S2; 
 Tue, 21 Jan 2025 16:13:42 +0800 (CST)
From: oushixiong1025@163.com
To: Andrzej Hajda <andrzej.hajda@intel.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Shixiong Ou <oushixiong@kylinos.cn>
Subject: [PATCH] drm/bridge: Use devm_platform_get_and_ioremap_resource()
Date: Tue, 21 Jan 2025 16:13:36 +0800
Message-Id: <20250121081336.218918-1-oushixiong1025@163.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wDnl1Q0V49nw9a6Hg--.31033S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxAr13KFWrWF43ZryfWF48JFb_yoW5GF1fpF
 4xGFyj9ry8Ga15Kay8AF18AF9IvasFvayfCr4UGwsI934xtF9rAr98AFyfZ3sxtrykC3Wf
 tws3trW8Za4jvF7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07UQVy3UUUUU=
X-Originating-IP: [116.128.244.169]
X-CM-SenderInfo: xrxvxxx0lr0wirqskqqrwthudrp/1tbiXA3bD2ePUJ95zwAAsU
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

From: Shixiong Ou <oushixiong@kylinos.cn>

Signed-off-by: Shixiong Ou <oushixiong@kylinos.cn>
---
 drivers/gpu/drm/bridge/analogix/analogix_dp_core.c | 4 +---
 drivers/gpu/drm/bridge/microchip-lvds.c            | 5 ++---
 drivers/gpu/drm/bridge/synopsys/dw-hdmi.c          | 3 +--
 3 files changed, 4 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
index bfa88409a7ff..284fd186eb5f 100644
--- a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
+++ b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
@@ -1605,9 +1605,7 @@ analogix_dp_probe(struct device *dev, struct analogix_dp_plat_data *plat_data)
 		return ERR_CAST(dp->clock);
 	}
 
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-
-	dp->reg_base = devm_ioremap_resource(&pdev->dev, res);
+	dp->reg_base = devm_platform_get_and_ioremap_resource(pdev, 0, &res);
 	if (IS_ERR(dp->reg_base)) {
 		ret = PTR_ERR(dp->reg_base);
 		goto err_disable_clk;
diff --git a/drivers/gpu/drm/bridge/microchip-lvds.c b/drivers/gpu/drm/bridge/microchip-lvds.c
index b8313dad6072..a679dd76962d 100644
--- a/drivers/gpu/drm/bridge/microchip-lvds.c
+++ b/drivers/gpu/drm/bridge/microchip-lvds.c
@@ -151,6 +151,7 @@ static int mchp_lvds_probe(struct platform_device *pdev)
 	struct device *dev = &pdev->dev;
 	struct mchp_lvds *lvds;
 	struct device_node *port;
+	struct resource *res;
 	int ret;
 
 	if (!dev->of_node)
@@ -161,9 +162,7 @@ static int mchp_lvds_probe(struct platform_device *pdev)
 		return -ENOMEM;
 
 	lvds->dev = dev;
-
-	lvds->regs = devm_ioremap_resource(lvds->dev,
-			platform_get_resource(pdev, IORESOURCE_MEM, 0));
+	lvds->regs = devm_platform_get_and_ioremap_resource(pdev, 0, &res);
 	if (IS_ERR(lvds->regs))
 		return PTR_ERR(lvds->regs);
 
diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
index 0031f3c54882..96e17776165c 100644
--- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
+++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
@@ -3386,8 +3386,7 @@ struct dw_hdmi *dw_hdmi_probe(struct platform_device *pdev,
 			return ERR_PTR(-EINVAL);
 		}
 
-		iores = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-		hdmi->regs = devm_ioremap_resource(dev, iores);
+		hdmi->regs = devm_platform_get_and_ioremap_resource(pdev, 0, &iores);
 		if (IS_ERR(hdmi->regs)) {
 			ret = PTR_ERR(hdmi->regs);
 			goto err_res;
-- 
2.25.1

