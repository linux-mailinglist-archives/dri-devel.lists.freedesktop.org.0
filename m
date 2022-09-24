Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 361C15E8730
	for <lists+dri-devel@lfdr.de>; Sat, 24 Sep 2022 03:59:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D234910E41C;
	Sat, 24 Sep 2022 01:59:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2010210E412
 for <dri-devel@lists.freedesktop.org>; Sat, 24 Sep 2022 01:58:54 +0000 (UTC)
Received: from dggpeml500024.china.huawei.com (unknown [172.30.72.53])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4MZBrw0pZXzHtdk;
 Sat, 24 Sep 2022 09:54:08 +0800 (CST)
Received: from huawei.com (10.175.112.208) by dggpeml500024.china.huawei.com
 (7.185.36.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.31; Sat, 24 Sep
 2022 09:58:51 +0800
From: Yuan Can <yuancan@huawei.com>
To: <thierry.reding@gmail.com>, <sam@ravnborg.org>, <airlied@linux.ie>,
 <daniel@ffwll.ch>, <laurent.pinchart@ideasonboard.com>,
 <dianders@chromium.org>, <hanxu5@huaqin.corp-partner.google.com>,
 <dri-devel@lists.freedesktop.org>
Subject: [PATCH 09/10] drm/panel: s6d16d0: Use dev_err_probe() to simplify code
Date: Sat, 24 Sep 2022 01:56:15 +0000
Message-ID: <20220924015616.34293-10-yuancan@huawei.com>
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
 drivers/gpu/drm/panel/panel-samsung-s6d16d0.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-samsung-s6d16d0.c b/drivers/gpu/drm/panel/panel-samsung-s6d16d0.c
index 008e2b0d6652..2900b2c879dc 100644
--- a/drivers/gpu/drm/panel/panel-samsung-s6d16d0.c
+++ b/drivers/gpu/drm/panel/panel-samsung-s6d16d0.c
@@ -193,12 +193,9 @@ static int s6d16d0_probe(struct mipi_dsi_device *dsi)
 	/* This asserts RESET by default */
 	s6->reset_gpio = devm_gpiod_get_optional(dev, "reset",
 						 GPIOD_OUT_HIGH);
-	if (IS_ERR(s6->reset_gpio)) {
-		ret = PTR_ERR(s6->reset_gpio);
-		if (ret != -EPROBE_DEFER)
-			dev_err(dev, "failed to request GPIO (%d)\n", ret);
-		return ret;
-	}
+	if (IS_ERR(s6->reset_gpio))
+		return dev_err_probe(dev, PTR_ERR(s6->reset_gpio),
+				     "failed to request GPIO\n");
 
 	drm_panel_init(&s6->panel, dev, &s6d16d0_drm_funcs,
 		       DRM_MODE_CONNECTOR_DSI);
-- 
2.17.1

