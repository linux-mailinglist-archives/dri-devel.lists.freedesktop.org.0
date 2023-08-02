Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D3D176C736
	for <lists+dri-devel@lfdr.de>; Wed,  2 Aug 2023 09:42:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5040110E05B;
	Wed,  2 Aug 2023 07:42:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B214810E05B
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Aug 2023 07:42:37 +0000 (UTC)
Received: from dggpeml500025.china.huawei.com (unknown [172.30.72.56])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4RG3mx71pbzVjqS;
 Wed,  2 Aug 2023 15:40:49 +0800 (CST)
Received: from ubuntu1804.huawei.com (10.67.174.202) by
 dggpeml500025.china.huawei.com (7.185.36.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Wed, 2 Aug 2023 15:42:34 +0800
From: Zhu Wang <wangzhu9@huawei.com>
To: <linux@armlinux.org.uk>, <airlied@gmail.com>, <daniel@ffwll.ch>,
 <dri-devel@lists.freedesktop.org>, <andriy.shevchenko@linux.intel.com>,
 <arnd@arndb.de>
Subject: [PATCH -next v3] drm/i2c: tda998x: remove redundant CONFIG_OF and
 of_match_ptr()
Date: Wed, 2 Aug 2023 15:42:04 +0800
Message-ID: <20230802074204.229699-1-wangzhu9@huawei.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.67.174.202]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
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
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

---
Changes in v2:
- Remove CONFIG_OF which includes tda998x_ids.

---
Changes in v3:
- Changes of_match_ptr to of_match_ptr() in the commit message.
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

