Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 73791783AAA
	for <lists+dri-devel@lfdr.de>; Tue, 22 Aug 2023 09:15:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1894D10E2DB;
	Tue, 22 Aug 2023 07:15:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D9C710E2DB
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Aug 2023 07:15:32 +0000 (UTC)
Received: from kwepemi500008.china.huawei.com (unknown [172.30.72.56])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4RVLBB0NN1ztS2T;
 Tue, 22 Aug 2023 15:11:46 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemi500008.china.huawei.com
 (7.221.188.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.31; Tue, 22 Aug
 2023 15:15:28 +0800
From: Jinjie Ruan <ruanjinjie@huawei.com>
To: <andrzej.hajda@intel.com>, <neil.armstrong@linaro.org>,
 <rfoss@kernel.org>, <Laurent.pinchart@ideasonboard.com>, <jonas@kwiboo.se>,
 <jernej.skrabec@gmail.com>, <airlied@gmail.com>, <daniel@ffwll.ch>,
 <thierry.reding@gmail.com>, <mperttunen@nvidia.com>, <jonathanh@nvidia.com>,
 <dri-devel@lists.freedesktop.org>, <linux-tegra@vger.kernel.org>
Subject: [PATCH -next 1/2] drm/bridge: Use PTR_ERR_OR_ZERO() to simplify code
Date: Tue, 22 Aug 2023 15:15:02 +0800
Message-ID: <20230822071503.178000-2-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230822071503.178000-1-ruanjinjie@huawei.com>
References: <20230822071503.178000-1-ruanjinjie@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.90.53.73]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 kwepemi500008.china.huawei.com (7.221.188.139)
X-CFilter-Loop: Reflected
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
Cc: ruanjinjie@huawei.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Return PTR_ERR_OR_ZERO() instead of return 0 or PTR_ERR() to
simplify code.

Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
---
 drivers/gpu/drm/bridge/tc358762.c | 10 ++--------
 drivers/gpu/drm/bridge/tc358764.c |  5 +----
 2 files changed, 3 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/bridge/tc358762.c b/drivers/gpu/drm/bridge/tc358762.c
index 46198af9eebb..49fd60a08c1c 100644
--- a/drivers/gpu/drm/bridge/tc358762.c
+++ b/drivers/gpu/drm/bridge/tc358762.c
@@ -240,19 +240,13 @@ static int tc358762_parse_dt(struct tc358762 *ctx)
 
 	/* Reset GPIO is optional */
 	ctx->reset_gpio = devm_gpiod_get_optional(dev, "reset", GPIOD_OUT_LOW);
-	if (IS_ERR(ctx->reset_gpio))
-		return PTR_ERR(ctx->reset_gpio);
-
-	return 0;
+	return PTR_ERR_OR_ZERO(ctx->reset_gpio);
 }
 
 static int tc358762_configure_regulators(struct tc358762 *ctx)
 {
 	ctx->regulator = devm_regulator_get(ctx->dev, "vddc");
-	if (IS_ERR(ctx->regulator))
-		return PTR_ERR(ctx->regulator);
-
-	return 0;
+	return PTR_ERR_OR_ZERO(ctx->regulator);
 }
 
 static int tc358762_probe(struct mipi_dsi_device *dsi)
diff --git a/drivers/gpu/drm/bridge/tc358764.c b/drivers/gpu/drm/bridge/tc358764.c
index deccb3995022..738ea6e11712 100644
--- a/drivers/gpu/drm/bridge/tc358764.c
+++ b/drivers/gpu/drm/bridge/tc358764.c
@@ -319,10 +319,7 @@ static int tc358764_parse_dt(struct tc358764 *ctx)
 	}
 
 	ctx->next_bridge = devm_drm_of_get_bridge(dev, dev->of_node, 1, 0);
-	if (IS_ERR(ctx->next_bridge))
-		return PTR_ERR(ctx->next_bridge);
-
-	return 0;
+	return PTR_ERR_OR_ZERO(ctx->next_bridge);
 }
 
 static int tc358764_configure_regulators(struct tc358764 *ctx)
-- 
2.34.1

