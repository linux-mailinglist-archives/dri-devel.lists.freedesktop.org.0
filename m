Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 62F835E872B
	for <lists+dri-devel@lfdr.de>; Sat, 24 Sep 2022 03:59:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2856B10E412;
	Sat, 24 Sep 2022 01:58:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8BABA10E412
 for <dri-devel@lists.freedesktop.org>; Sat, 24 Sep 2022 01:58:51 +0000 (UTC)
Received: from dggpeml500024.china.huawei.com (unknown [172.30.72.55])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4MZBsT3vgDzlXSs;
 Sat, 24 Sep 2022 09:54:37 +0800 (CST)
Received: from huawei.com (10.175.112.208) by dggpeml500024.china.huawei.com
 (7.185.36.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.31; Sat, 24 Sep
 2022 09:58:47 +0800
From: Yuan Can <yuancan@huawei.com>
To: <thierry.reding@gmail.com>, <sam@ravnborg.org>, <airlied@linux.ie>,
 <daniel@ffwll.ch>, <laurent.pinchart@ideasonboard.com>,
 <dianders@chromium.org>, <hanxu5@huaqin.corp-partner.google.com>,
 <dri-devel@lists.freedesktop.org>
Subject: [PATCH 01/10] drm/panel: himax8279d: Use dev_err_probe() to simplify
 code
Date: Sat, 24 Sep 2022 01:56:07 +0000
Message-ID: <20220924015616.34293-2-yuancan@huawei.com>
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
 drivers/gpu/drm/panel/panel-boe-himax8279d.c | 27 +++++++-------------
 1 file changed, 9 insertions(+), 18 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-boe-himax8279d.c b/drivers/gpu/drm/panel/panel-boe-himax8279d.c
index d879b3b14c48..6a6ba351bde7 100644
--- a/drivers/gpu/drm/panel/panel-boe-himax8279d.c
+++ b/drivers/gpu/drm/panel/panel-boe-himax8279d.c
@@ -854,28 +854,19 @@ static int panel_add(struct panel_info *pinfo)
 	int ret;
 
 	pinfo->pp18_gpio = devm_gpiod_get(dev, "pp18", GPIOD_OUT_HIGH);
-	if (IS_ERR(pinfo->pp18_gpio)) {
-		ret = PTR_ERR(pinfo->pp18_gpio);
-		if (ret != -EPROBE_DEFER)
-			dev_err(dev, "failed to get pp18 gpio: %d\n", ret);
-		return ret;
-	}
+	if (IS_ERR(pinfo->pp18_gpio))
+		return dev_err_probe(dev, PTR_ERR(pinfo->pp18_gpio),
+				     "failed to get pp18 gpio\n");
 
 	pinfo->pp33_gpio = devm_gpiod_get(dev, "pp33", GPIOD_OUT_HIGH);
-	if (IS_ERR(pinfo->pp33_gpio)) {
-		ret = PTR_ERR(pinfo->pp33_gpio);
-		if (ret != -EPROBE_DEFER)
-			dev_err(dev, "failed to get pp33 gpio: %d\n", ret);
-		return ret;
-	}
+	if (IS_ERR(pinfo->pp33_gpio))
+		return dev_err_probe(dev, PTR_ERR(pinfo->pp33_gpio),
+				     "failed to get pp33 gpio\n");
 
 	pinfo->enable_gpio = devm_gpiod_get(dev, "enable", GPIOD_OUT_HIGH);
-	if (IS_ERR(pinfo->enable_gpio)) {
-		ret = PTR_ERR(pinfo->enable_gpio);
-		if (ret != -EPROBE_DEFER)
-			dev_err(dev, "failed to get enable gpio: %d\n", ret);
-		return ret;
-	}
+	if (IS_ERR(pinfo->enable_gpio))
+		return dev_err_probe(dev, PTR_ERR(pinfo->enable_gpio),
+				     "failed to get enable gpio\n");
 
 	drm_panel_init(&pinfo->base, dev, &panel_funcs,
 		       DRM_MODE_CONNECTOR_DSI);
-- 
2.17.1

