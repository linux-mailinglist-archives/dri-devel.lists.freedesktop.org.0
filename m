Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AC5E3FC8D0
	for <lists+dri-devel@lfdr.de>; Tue, 31 Aug 2021 15:51:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BAA7089A57;
	Tue, 31 Aug 2021 13:51:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from baidu.com (mx21.baidu.com [220.181.3.85])
 by gabe.freedesktop.org (Postfix) with ESMTP id 9AA2089A57
 for <dri-devel@lists.freedesktop.org>; Tue, 31 Aug 2021 13:51:35 +0000 (UTC)
Received: from BC-Mail-Ex15.internal.baidu.com (unknown [172.31.51.55])
 by Forcepoint Email with ESMTPS id 67E125BF96C6CBF0CB15;
 Tue, 31 Aug 2021 21:51:33 +0800 (CST)
Received: from BJHW-MAIL-EX27.internal.baidu.com (10.127.64.42) by
 BC-Mail-Ex15.internal.baidu.com (172.31.51.55) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2242.12; Tue, 31 Aug 2021 21:51:33 +0800
Received: from LAPTOP-UKSR4ENP.internal.baidu.com (172.31.63.8) by
 BJHW-MAIL-EX27.internal.baidu.com (10.127.64.42) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2308.14; Tue, 31 Aug 2021 21:51:32 +0800
From: Cai Huoqing <caihuoqing@baidu.com>
To: <caihuoqing@baidu.com>
CC: Andrzej Hajda <a.hajda@samsung.com>, Neil Armstrong
 <narmstrong@baylibre.com>, Robert Foss <robert.foss@linaro.org>, "Laurent
 Pinchart" <Laurent.pinchart@ideasonboard.com>, Jonas Karlman
 <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, David Airlie
 <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH] drm/bridge: cdns: Make use of the helper function
 devm_platform_ioremap_resource()
Date: Tue, 31 Aug 2021 21:50:47 +0800
Message-ID: <20210831135048.4305-1-caihuoqing@baidu.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [172.31.63.8]
X-ClientProxiedBy: BC-Mail-Ex30.internal.baidu.com (172.31.51.24) To
 BJHW-MAIL-EX27.internal.baidu.com (10.127.64.42)
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

Use the devm_platform_ioremap_resource() helper instead of
calling platform_get_resource() and devm_ioremap_resource()
separately

Signed-off-by: Cai Huoqing <caihuoqing@baidu.com>
---
 drivers/gpu/drm/bridge/cdns-dsi.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/bridge/cdns-dsi.c b/drivers/gpu/drm/bridge/cdns-dsi.c
index e6e331071a00..d8a15c459b42 100644
--- a/drivers/gpu/drm/bridge/cdns-dsi.c
+++ b/drivers/gpu/drm/bridge/cdns-dsi.c
@@ -1171,7 +1171,6 @@ static int cdns_dsi_drm_probe(struct platform_device *pdev)
 {
 	struct cdns_dsi *dsi;
 	struct cdns_dsi_input *input;
-	struct resource *res;
 	int ret, irq;
 	u32 val;
 
@@ -1183,8 +1182,7 @@ static int cdns_dsi_drm_probe(struct platform_device *pdev)
 
 	input = &dsi->input;
 
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	dsi->regs = devm_ioremap_resource(&pdev->dev, res);
+	dsi->regs = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(dsi->regs))
 		return PTR_ERR(dsi->regs);
 
-- 
2.25.1

