Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E19E05EEB5A
	for <lists+dri-devel@lfdr.de>; Thu, 29 Sep 2022 03:57:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD2EB10E944;
	Thu, 29 Sep 2022 01:56:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A649410E945
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Sep 2022 01:56:47 +0000 (UTC)
Received: from dggpeml500024.china.huawei.com (unknown [172.30.72.54])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4MdGZt2vDfzWgnj;
 Thu, 29 Sep 2022 09:52:38 +0800 (CST)
Received: from huawei.com (10.175.112.208) by dggpeml500024.china.huawei.com
 (7.185.36.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.31; Thu, 29 Sep
 2022 09:56:45 +0800
From: Yuan Can <yuancan@huawei.com>
To: <dianders@chromium.org>, <thierry.reding@gmail.com>, <sam@ravnborg.org>,
 <airlied@gmail.com>, <daniel@ffwll.ch>, <dri-devel@lists.freedesktop.org>
Subject: [PATCH v2 2/2] drm/panel: simple: Use dev_err_probe() to simplify code
Date: Thu, 29 Sep 2022 01:55:03 +0000
Message-ID: <20220929015503.17301-3-yuancan@huawei.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220929015503.17301-1-yuancan@huawei.com>
References: <20220929015503.17301-1-yuancan@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.175.112.208]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
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
Cc: yuancan@huawei.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

In the probe path, dev_err() can be replaced with dev_err_probe()
which will check if error code is -EPROBE_DEFER and prints the
error name. It also sets the defer probe reason which can be
checked later through debugfs.

Signed-off-by: Yuan Can <yuancan@huawei.com>
Reviewed-by: Douglas Anderson <dianders@chromium.org>
---
 drivers/gpu/drm/panel/panel-simple.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
index 0cb3be26e2e6..1607824dc2b3 100644
--- a/drivers/gpu/drm/panel/panel-simple.c
+++ b/drivers/gpu/drm/panel/panel-simple.c
@@ -575,12 +575,9 @@ static int panel_simple_probe(struct device *dev, const struct panel_desc *desc)
 
 	panel->enable_gpio = devm_gpiod_get_optional(dev, "enable",
 						     GPIOD_OUT_LOW);
-	if (IS_ERR(panel->enable_gpio)) {
-		err = PTR_ERR(panel->enable_gpio);
-		if (err != -EPROBE_DEFER)
-			dev_err(dev, "failed to request GPIO: %d\n", err);
-		return err;
-	}
+	if (IS_ERR(panel->enable_gpio))
+		return dev_err_probe(dev, PTR_ERR(panel->enable_gpio),
+				     "failed to request GPIO\n");
 
 	err = of_drm_get_panel_orientation(dev->of_node, &panel->orientation);
 	if (err) {
-- 
2.17.1

