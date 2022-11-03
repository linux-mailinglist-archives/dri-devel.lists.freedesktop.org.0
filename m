Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 147796173DD
	for <lists+dri-devel@lfdr.de>; Thu,  3 Nov 2022 02:49:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 982AE10E215;
	Thu,  3 Nov 2022 01:49:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from szxga03-in.huawei.com (szxga03-in.huawei.com [45.249.212.189])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E42010E215
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Nov 2022 01:49:24 +0000 (UTC)
Received: from dggpeml500024.china.huawei.com (unknown [172.30.72.54])
 by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4N2mnb090ZzJnR2;
 Thu,  3 Nov 2022 09:46:27 +0800 (CST)
Received: from huawei.com (10.175.112.208) by dggpeml500024.china.huawei.com
 (7.185.36.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.31; Thu, 3 Nov
 2022 09:49:21 +0800
From: Yuan Can <yuancan@huawei.com>
To: <linus.walleij@linaro.org>, <airlied@gmail.com>, <daniel@ffwll.ch>,
 <dri-devel@lists.freedesktop.org>
Subject: [PATCH] drm/mcde: Fix missing platform_unregister_drivers() call in
 mcde_drm_register()
Date: Thu, 3 Nov 2022 01:46:49 +0000
Message-ID: <20221103014649.109155-1-yuancan@huawei.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.175.112.208]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
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

A problem about modprobe mcde_drm failed is triggered with the following
log given:

 [ 2387.922993] Error: Driver 'mcde-dsi' is already registered, aborting...
 [ 2387.924272] failed to register platform driver mcde_dsi_driver [mcde_drm]: -16
 modprobe: ERROR: could not insert 'mcde_drm': Device or resource busy

The reason is that mcde_drm_register() returns platform_driver_register()
directly without checking its return value, if platform_driver_register()
fails, it returns without unregistering mcde_dsi_driver, resulting the
mcde_drm can never be installed later.
A simple call graph is shown as below:

 mcde_drm_register()
   platform_register_drivers() # mcde_dsi_driver are registered
   platform_driver_register()
     driver_register()
       bus_add_driver()
         priv = kzalloc(...) # OOM happened
   # return without unregister mcde_dsi_driver

Fixing this problem by checking the return value of
platform_driver_register() and do platform_unregister_drivers() if
error happened.

Fixes: 5fc537bfd000 ("drm/mcde: Add new driver for ST-Ericsson MCDE")
Signed-off-by: Yuan Can <yuancan@huawei.com>
---
 drivers/gpu/drm/mcde/mcde_drv.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/mcde/mcde_drv.c b/drivers/gpu/drm/mcde/mcde_drv.c
index 1c4482ad507d..0391a62dc1b8 100644
--- a/drivers/gpu/drm/mcde/mcde_drv.c
+++ b/drivers/gpu/drm/mcde/mcde_drv.c
@@ -494,7 +494,12 @@ static int __init mcde_drm_register(void)
 	if (ret)
 		return ret;
 
-	return platform_driver_register(&mcde_driver);
+	ret = platform_driver_register(&mcde_driver);
+	if (ret)
+		platform_unregister_drivers(component_drivers,
+					    ARRAY_SIZE(component_drivers));
+
+	return ret;
 }
 
 static void __exit mcde_drm_unregister(void)
-- 
2.17.1

