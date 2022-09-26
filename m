Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B37FE5EA81F
	for <lists+dri-devel@lfdr.de>; Mon, 26 Sep 2022 16:14:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 865CD10E411;
	Mon, 26 Sep 2022 14:14:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 100AC10E411
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Sep 2022 14:14:14 +0000 (UTC)
Received: from dggpemm500023.china.huawei.com (unknown [172.30.72.54])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4Mbl521P3szlVmD;
 Mon, 26 Sep 2022 22:09:58 +0800 (CST)
Received: from dggpemm500007.china.huawei.com (7.185.36.183) by
 dggpemm500023.china.huawei.com (7.185.36.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Mon, 26 Sep 2022 22:14:12 +0800
Received: from huawei.com (10.175.103.91) by dggpemm500007.china.huawei.com
 (7.185.36.183) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.31; Mon, 26 Sep
 2022 22:14:11 +0800
From: Yang Yingliang <yangyingliang@huawei.com>
To: <linux-fbdev@vger.kernel.org>, <dri-devel@lists.freedesktop.org>
Subject: [PATCH -next resend] backlight: ktd253: Switch to use dev_err_probe()
 helper
Date: Mon, 26 Sep 2022 22:20:59 +0800
Message-ID: <20220926142059.2294282-1-yangyingliang@huawei.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.175.103.91]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 dggpemm500007.china.huawei.com (7.185.36.183)
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
Cc: lee@kernel.org, daniel.thompson@linaro.org, yangyingliang@huawei.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

In the probe path, dev_err() can be replaced with dev_err_probe()
which will check if error code is -EPROBE_DEFER and prints the
error name. It also sets the defer probe reason which can be
checked later through debugfs. It's more simple in error path.

Signed-off-by: Yang Yingliang <yangyingliang@huawei.com>
Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>
---
Resend for adding Sob.
---
 drivers/video/backlight/ktd253-backlight.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/drivers/video/backlight/ktd253-backlight.c b/drivers/video/backlight/ktd253-backlight.c
index 37aa5a669530..d7d43454f64a 100644
--- a/drivers/video/backlight/ktd253-backlight.c
+++ b/drivers/video/backlight/ktd253-backlight.c
@@ -173,12 +173,9 @@ static int ktd253_backlight_probe(struct platform_device *pdev)
 	}
 
 	ktd253->gpiod = devm_gpiod_get(dev, "enable", GPIOD_OUT_LOW);
-	if (IS_ERR(ktd253->gpiod)) {
-		ret = PTR_ERR(ktd253->gpiod);
-		if (ret != -EPROBE_DEFER)
-			dev_err(dev, "gpio line missing or invalid.\n");
-		return ret;
-	}
+	if (IS_ERR(ktd253->gpiod))
+		return dev_err_probe(dev, PTR_ERR(ktd253->gpiod),
+				     "gpio line missing or invalid.\n");
 	gpiod_set_consumer_name(ktd253->gpiod, dev_name(dev));
 	/* Bring backlight to a known off state */
 	msleep(KTD253_T_OFF_MS);
-- 
2.25.1

