Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FE5276FF2F
	for <lists+dri-devel@lfdr.de>; Fri,  4 Aug 2023 13:07:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7934510E0A3;
	Fri,  4 Aug 2023 11:07:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 33C3E10E0A3
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Aug 2023 11:06:58 +0000 (UTC)
Received: from dggpeml500025.china.huawei.com (unknown [172.30.72.56])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4RHNCk74PfzVjdL;
 Fri,  4 Aug 2023 19:05:06 +0800 (CST)
Received: from ubuntu1804.huawei.com (10.67.174.202) by
 dggpeml500025.china.huawei.com (7.185.36.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Fri, 4 Aug 2023 19:06:54 +0800
From: Zhu Wang <wangzhu9@huawei.com>
To: <linux@armlinux.org.uk>, <airlied@gmail.com>, <daniel@ffwll.ch>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH -next v4] drm/i2c: tda998x: remove redundant CONFIG_OF and
 of_match_ptr()
Date: Fri, 4 Aug 2023 19:06:25 +0800
Message-ID: <20230804110625.98520-1-wangzhu9@huawei.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.67.174.202]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 dggpeml500025.china.huawei.com (7.185.36.35)
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
Cc: wangzhu9@huawei.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The driver depends on CONFIG_OF, so it is not necessary to use CONFIG_OF
and of_match_ptr() here, we remove them all.

Even for drivers that do not depend on CONFIG_OF, it's almost always
better to leave out the of_match_ptr(), since the only thing it can
possibly do is to save a few bytes of .text if a driver can be used both
with and without it.

Signed-off-by: Zhu Wang <wangzhu9@huawei.com>
Reviewed-by: Arnd Bergmann <arnd@arndb.de>

---
Changes in v2:
- Remove CONFIG_OF which includes tda998x_ids.

---
Changes in v3:
- Changes of_match_ptr to of_match_ptr() in the commit message.

---
Changes in v4:
- Remove "Reviewed-by: Andy Shevchenko".
---
 drivers/gpu/drm/i2c/tda998x_drv.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/i2c/tda998x_drv.c b/drivers/gpu/drm/i2c/tda998x_drv.c
index d8d7de18dd65..9666e0746240 100644
--- a/drivers/gpu/drm/i2c/tda998x_drv.c
+++ b/drivers/gpu/drm/i2c/tda998x_drv.c
@@ -2084,13 +2084,11 @@ static void tda998x_remove(struct i2c_client *client)
 	tda998x_destroy(&client->dev);
 }
 
-#ifdef CONFIG_OF
 static const struct of_device_id tda998x_dt_ids[] = {
 	{ .compatible = "nxp,tda998x", },
 	{ }
 };
 MODULE_DEVICE_TABLE(of, tda998x_dt_ids);
-#endif
 
 static const struct i2c_device_id tda998x_ids[] = {
 	{ "tda998x", 0 },
@@ -2103,7 +2101,7 @@ static struct i2c_driver tda998x_driver = {
 	.remove = tda998x_remove,
 	.driver = {
 		.name = "tda998x",
-		.of_match_table = of_match_ptr(tda998x_dt_ids),
+		.of_match_table = tda998x_dt_ids,
 	},
 	.id_table = tda998x_ids,
 };
-- 
2.17.1

