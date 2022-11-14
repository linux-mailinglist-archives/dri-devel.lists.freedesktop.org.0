Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C225E627818
	for <lists+dri-devel@lfdr.de>; Mon, 14 Nov 2022 09:47:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1ADEB10E285;
	Mon, 14 Nov 2022 08:47:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3EE5210E255
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Nov 2022 01:10:24 +0000 (UTC)
Received: from kwepemi500016.china.huawei.com (unknown [172.30.72.56])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4N9WNW3WdJzqSP6;
 Mon, 14 Nov 2022 09:06:35 +0800 (CST)
Received: from huawei.com (10.175.100.227) by kwepemi500016.china.huawei.com
 (7.221.188.220) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.31; Mon, 14 Nov
 2022 09:10:20 +0800
From: Shang XiaoJing <shangxiaojing@huawei.com>
To: <FlorianSchandinat@gmx.de>, <deller@gmx.de>, <corbet@lwn.net>,
 <linux-fbdev@vger.kernel.org>, <dri-devel@lists.freedesktop.org>
Subject: [PATCH] video: fbdev: via: Fix error in via_core_init()
Date: Mon, 14 Nov 2022 09:08:52 +0800
Message-ID: <20221114010852.24654-1-shangxiaojing@huawei.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.175.100.227]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 kwepemi500016.china.huawei.com (7.221.188.220)
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Mon, 14 Nov 2022 08:47:13 +0000
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
Cc: shangxiaojing@huawei.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

via_core_init() won't exit the driver when pci_register_driver() failed.
Exit the viafb-i2c and the viafb-gpio in failed path to prevent error.

VIA Graphics Integration Chipset framebuffer 2.4 initializing
Error: Driver 'viafb-i2c' is already registered, aborting...
Error: Driver 'viafb-gpio' is already registered, aborting...

Fixes: 7582eb9be85f ("viafb: Turn GPIO and i2c into proper platform devices")
Signed-off-by: Shang XiaoJing <shangxiaojing@huawei.com>
---
 drivers/video/fbdev/via/via-core.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/drivers/video/fbdev/via/via-core.c b/drivers/video/fbdev/via/via-core.c
index 2ee8fcae08df..b2e3b5df38cd 100644
--- a/drivers/video/fbdev/via/via-core.c
+++ b/drivers/video/fbdev/via/via-core.c
@@ -730,7 +730,15 @@ static int __init via_core_init(void)
 		return ret;
 	viafb_i2c_init();
 	viafb_gpio_init();
-	return pci_register_driver(&via_driver);
+	ret = pci_register_driver(&via_driver);
+	if (ret) {
+		viafb_gpio_exit();
+		viafb_i2c_exit();
+		viafb_exit();
+		return ret;
+	}
+
+	return 0;
 }
 
 static void __exit via_core_exit(void)
-- 
2.17.1

