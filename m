Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 11A1462776C
	for <lists+dri-devel@lfdr.de>; Mon, 14 Nov 2022 09:21:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0724010E07D;
	Mon, 14 Nov 2022 08:21:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D5E6710E07D
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Nov 2022 08:21:41 +0000 (UTC)
Received: from dggpeml500024.china.huawei.com (unknown [172.30.72.55])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4N9j275g9NzmW1d;
 Mon, 14 Nov 2022 16:21:19 +0800 (CST)
Received: from huawei.com (10.175.112.208) by dggpeml500024.china.huawei.com
 (7.185.36.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.31; Mon, 14 Nov
 2022 16:21:38 +0800
From: Yuan Can <yuancan@huawei.com>
To: <thierry.reding@gmail.com>, <sam@ravnborg.org>, <airlied@gmail.com>,
 <daniel@ffwll.ch>, <f.fainelli@gmail.com>,
 <bcm-kernel-feedback-list@broadcom.com>, <architt@codeaurora.org>,
 <eric@anholt.net>, <dri-devel@lists.freedesktop.org>,
 <linux-rpi-kernel@lists.infradead.org>,
 <linux-arm-kernel@lists.infradead.org>
Subject: [PATCH] drm/panel/raspberrypi-touchscreen: Fix error handling in
 rpi_touchscreen_init()
Date: Mon, 14 Nov 2022 08:19:56 +0000
Message-ID: <20221114081956.37853-1-yuancan@huawei.com>
X-Mailer: git-send-email 2.17.1
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
Cc: yuancan@huawei.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

A problem about modprobe panel-raspberrypi-touchscreen is triggered with
the following log given:

 [  542.980748] Error: Driver 'rpi-ts-dsi' is already registered, aborting...

And with this log printed, the panel_raspberrypi_touchscreen is listed by
lsmod, rmmod on it can trigger the WARN of "Unexpected driver unregister".

The reason is that the return value of mipi_dsi_driver_register() and
i2c_add_driver() is not checked in rpi_touchscreen_init(), if
i2c_add_driver() failed, the rpi_touchscreen_dsi_driver is never
unregistered, and next time when install this module, the
mipi_dsi_driver_register() is failed but rpi_touchscreen_init() returns 0,
leading to the panel_raspberrypi_touchscreen listed by lsmod.

Call graph of modprobe panel-raspberrypi-touchscreen at the first time:
 rpi_touchscreen_init()
   mipi_dsi_driver_register() # register rpi_touchscreen_dsi_driver
   i2c_add_driver()
     driver_register()
       bus_add_driver()
         priv = kzalloc(...) # OOM happened
 # return without unregister rpi_touchscreen_dsi_driver

Call graph of retrying modprobe panel-raspberrypi-touchscreen:
 rpi_touchscreen_init()
   mipi_dsi_driver_register() # Error message printed, register failed!
   i2c_add_driver() # succeed and return

Fix by checking the return value of both functions and unregister
rpi_touchscreen_dsi_driver if i2c_add_driver() failed.

Fixes: 2f733d6194bd ("drm/panel: Add support for the Raspberry Pi 7" Touchscreen.")
Signed-off-by: Yuan Can <yuancan@huawei.com>
---
 .../gpu/drm/panel/panel-raspberrypi-touchscreen.c   | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-raspberrypi-touchscreen.c b/drivers/gpu/drm/panel/panel-raspberrypi-touchscreen.c
index 79f852465a84..9f3d0fedc3f2 100644
--- a/drivers/gpu/drm/panel/panel-raspberrypi-touchscreen.c
+++ b/drivers/gpu/drm/panel/panel-raspberrypi-touchscreen.c
@@ -497,8 +497,17 @@ static struct i2c_driver rpi_touchscreen_driver = {
 
 static int __init rpi_touchscreen_init(void)
 {
-	mipi_dsi_driver_register(&rpi_touchscreen_dsi_driver);
-	return i2c_add_driver(&rpi_touchscreen_driver);
+	int ret;
+
+	ret = mipi_dsi_driver_register(&rpi_touchscreen_dsi_driver);
+	if (ret)
+		return ret;
+
+	ret = i2c_add_driver(&rpi_touchscreen_driver);
+	if (ret)
+		mipi_dsi_driver_unregister(&rpi_touchscreen_dsi_driver);
+
+	return ret;
 }
 module_init(rpi_touchscreen_init);
 
-- 
2.17.1

