Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B46B5E8734
	for <lists+dri-devel@lfdr.de>; Sat, 24 Sep 2022 04:00:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D0F6610E423;
	Sat, 24 Sep 2022 01:59:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C739310E412
 for <dri-devel@lists.freedesktop.org>; Sat, 24 Sep 2022 01:58:52 +0000 (UTC)
Received: from dggpeml500024.china.huawei.com (unknown [172.30.72.54])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4MZBsW6nPZzlWvk;
 Sat, 24 Sep 2022 09:54:39 +0800 (CST)
Received: from huawei.com (10.175.112.208) by dggpeml500024.china.huawei.com
 (7.185.36.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.31; Sat, 24 Sep
 2022 09:58:50 +0800
From: Yuan Can <yuancan@huawei.com>
To: <thierry.reding@gmail.com>, <sam@ravnborg.org>, <airlied@linux.ie>,
 <daniel@ffwll.ch>, <laurent.pinchart@ideasonboard.com>,
 <dianders@chromium.org>, <hanxu5@huaqin.corp-partner.google.com>,
 <dri-devel@lists.freedesktop.org>
Subject: [PATCH 06/10] drm/panel: lvds: Use dev_err_probe() to simplify code
Date: Sat, 24 Sep 2022 01:56:12 +0000
Message-ID: <20220924015616.34293-7-yuancan@huawei.com>
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
 drivers/gpu/drm/panel/panel-lvds.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-lvds.c b/drivers/gpu/drm/panel/panel-lvds.c
index de8758c30e6e..e2ed96770abc 100644
--- a/drivers/gpu/drm/panel/panel-lvds.c
+++ b/drivers/gpu/drm/panel/panel-lvds.c
@@ -178,12 +178,9 @@ static int panel_lvds_probe(struct platform_device *pdev)
 	if (IS_ERR(lvds->supply)) {
 		ret = PTR_ERR(lvds->supply);
 
-		if (ret != -ENODEV) {
-			if (ret != -EPROBE_DEFER)
-				dev_err(lvds->dev, "failed to request regulator: %d\n",
-					ret);
-			return ret;
-		}
+		if (ret != -ENODEV)
+			return dev_err_probe(lvds->dev, ret,
+					     "failed to request regulator\n");
 
 		lvds->supply = NULL;
 	}
-- 
2.17.1

