Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E74325E872F
	for <lists+dri-devel@lfdr.de>; Sat, 24 Sep 2022 03:59:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 142D310E416;
	Sat, 24 Sep 2022 01:59:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F12E310E40F
 for <dri-devel@lists.freedesktop.org>; Sat, 24 Sep 2022 01:58:51 +0000 (UTC)
Received: from dggpeml500024.china.huawei.com (unknown [172.30.72.55])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4MZBrs4thSzHtdg;
 Sat, 24 Sep 2022 09:54:05 +0800 (CST)
Received: from huawei.com (10.175.112.208) by dggpeml500024.china.huawei.com
 (7.185.36.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.31; Sat, 24 Sep
 2022 09:58:49 +0800
From: Yuan Can <yuancan@huawei.com>
To: <thierry.reding@gmail.com>, <sam@ravnborg.org>, <airlied@linux.ie>,
 <daniel@ffwll.ch>, <laurent.pinchart@ideasonboard.com>,
 <dianders@chromium.org>, <hanxu5@huaqin.corp-partner.google.com>,
 <dri-devel@lists.freedesktop.org>
Subject: [PATCH 04/10] drm/panel: leadtek-ltk050h3146w: Use dev_err_probe() to
 simplify code
Date: Sat, 24 Sep 2022 01:56:10 +0000
Message-ID: <20220924015616.34293-5-yuancan@huawei.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220924015616.34293-1-yuancan@huawei.com>
References: <20220924015616.34293-1-yuancan@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.175.112.208]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 dggpeml500024.china.huawei.com (7.185.36.10)
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

In the probe path, dev_err() can be replaced with dev_err_probe()
which will check if error code is -EPROBE_DEFER and prints the
error name. It also sets the defer probe reason which can be
checked later through debugfs.

Signed-off-by: Yuan Can <yuancan@huawei.com>
---
 .../gpu/drm/panel/panel-leadtek-ltk050h3146w.c | 18 ++++++------------
 1 file changed, 6 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-leadtek-ltk050h3146w.c b/drivers/gpu/drm/panel/panel-leadtek-ltk050h3146w.c
index 5619f186d28c..9b59edfbc98b 100644
--- a/drivers/gpu/drm/panel/panel-leadtek-ltk050h3146w.c
+++ b/drivers/gpu/drm/panel/panel-leadtek-ltk050h3146w.c
@@ -571,20 +571,14 @@ static int ltk050h3146w_probe(struct mipi_dsi_device *dsi)
 	}
 
 	ctx->vci = devm_regulator_get(dev, "vci");
-	if (IS_ERR(ctx->vci)) {
-		ret = PTR_ERR(ctx->vci);
-		if (ret != -EPROBE_DEFER)
-			dev_err(dev, "Failed to request vci regulator: %d\n", ret);
-		return ret;
-	}
+	if (IS_ERR(ctx->vci))
+		return dev_err_probe(dev, PTR_ERR(ctx->vci),
+				     "Failed to request vci regulator\n");
 
 	ctx->iovcc = devm_regulator_get(dev, "iovcc");
-	if (IS_ERR(ctx->iovcc)) {
-		ret = PTR_ERR(ctx->iovcc);
-		if (ret != -EPROBE_DEFER)
-			dev_err(dev, "Failed to request iovcc regulator: %d\n", ret);
-		return ret;
-	}
+	if (IS_ERR(ctx->iovcc))
+		return dev_err_probe(dev, PTR_ERR(ctx->iovcc),
+				     "Failed to request iovcc regulator\n");
 
 	mipi_dsi_set_drvdata(dsi, ctx);
 
-- 
2.17.1

