Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F5C87665A8
	for <lists+dri-devel@lfdr.de>; Fri, 28 Jul 2023 09:45:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3772310E676;
	Fri, 28 Jul 2023 07:44:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m12.mail.163.com (m12.mail.163.com [220.181.12.196])
 by gabe.freedesktop.org (Postfix) with ESMTP id 48E8410E1E4
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Jul 2023 01:54:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=From:Subject:Date:Message-Id; bh=gjJMd9nkH4Mf0R1Uns
 gI9bP8PjpttgyTbr+YjirneSA=; b=ERFKW72sPyoH8chSxXlX4yviepByxXzHVh
 AiL0uaXDWFArT0jOV3jmXcuIGyEAuXmZgZcZ7xWZuB6h1GezdtdcatpMfDtNYJDm
 /tjuY8Xh6GXs4SlQenMlrJkZoZ+2G8sws7//HOnRQNe0Zs6EAN6AKxsIop402LJT
 UbFqqpS9I=
Received: from localhost.localdomain (unknown [202.112.113.212])
 by zwqz-smtp-mta-g2-0 (Coremail) with SMTP id _____wDXBuOkH8NkZOP4BQ--.61958S4;
 Fri, 28 Jul 2023 09:53:48 +0800 (CST)
From: Yuanjun Gong <ruc_gongyuanjun@163.com>
To: christophe.jaillet@wanadoo.fr
Subject: [PATCH v2 1/1] gpu: drm: aspeed: use devm_clk_get_enabled() in
 aspeed_gfx_load()
Date: Fri, 28 Jul 2023 09:53:35 +0800
Message-Id: <20230728015335.5021-1-ruc_gongyuanjun@163.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <2419973d-1e21-5754-d309-436dc9c62be8@wanadoo.fr>
References: <2419973d-1e21-5754-d309-436dc9c62be8@wanadoo.fr>
X-CM-TRANSID: _____wDXBuOkH8NkZOP4BQ--.61958S4
X-Coremail-Antispam: 1Uf129KBjvdXoWrtrWfJw1xJF13tw4UAFyUGFg_yoWkAFXE9r
 4xursxXrsruFyDCw1rZwn3JFWxKFZ5urWFgry09w4FyF9ruryDW3yDGFy5Zw43Ww47Cr95
 tF1UAFW3Cr18GjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
 9fnUUvcSsGvfC2KfnxnUUI43ZEXa7VUUO6pDUUUUU==
X-Originating-IP: [202.112.113.212]
X-CM-SenderInfo: 5uxfsw5rqj53pdqm30i6rwjhhfrp/xtbBiA665VaEF9HHCQAAsD
X-Mailman-Approved-At: Fri, 28 Jul 2023 07:44:51 +0000
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
Cc: andrew@aj.id.au, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, ruc_gongyuanjun@163.com, joel@jms.id.au
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

in aspeed_gfx_load(), clk_prepare_enable() might return an
unexpected value. using devm_clk_get_enabled() instead of
devm_clk_get() and clk_prepare_enable() can avoid this problem.

Fixes: 4f2a8f5898ec ("drm: Add ASPEED GFX driver")
Signed-off-by: Yuanjun Gong <ruc_gongyuanjun@163.com>
---
 drivers/gpu/drm/aspeed/aspeed_gfx_drv.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/aspeed/aspeed_gfx_drv.c b/drivers/gpu/drm/aspeed/aspeed_gfx_drv.c
index c8c7f8215155..3d3ee70fb5ea 100644
--- a/drivers/gpu/drm/aspeed/aspeed_gfx_drv.c
+++ b/drivers/gpu/drm/aspeed/aspeed_gfx_drv.c
@@ -193,13 +193,12 @@ static int aspeed_gfx_load(struct drm_device *drm)
 	}
 	reset_control_deassert(priv->rst);
 
-	priv->clk = devm_clk_get(drm->dev, NULL);
+	priv->clk = devm_clk_get_enabled(drm->dev, NULL);
 	if (IS_ERR(priv->clk)) {
 		dev_err(&pdev->dev,
 			"missing or invalid clk device tree entry");
 		return PTR_ERR(priv->clk);
 	}
-	clk_prepare_enable(priv->clk);
 
 	/* Sanitize control registers */
 	writel(0, priv->base + CRT_CTRL1);
-- 
2.17.1

