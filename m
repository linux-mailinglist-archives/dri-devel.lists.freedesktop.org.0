Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F434766F64
	for <lists+dri-devel@lfdr.de>; Fri, 28 Jul 2023 16:24:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 89BA410E6FB;
	Fri, 28 Jul 2023 14:24:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CDDF710E6AF
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Jul 2023 09:12:44 +0000 (UTC)
Received: from dggpeml500025.china.huawei.com (unknown [172.30.72.56])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4RC1zK1khTzNmZJ;
 Fri, 28 Jul 2023 17:09:17 +0800 (CST)
Received: from ubuntu1804.huawei.com (10.67.174.202) by
 dggpeml500025.china.huawei.com (7.185.36.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Fri, 28 Jul 2023 17:12:40 +0800
From: Zhu Wang <wangzhu9@huawei.com>
To: <andrzej.hajda@intel.com>, <neil.armstrong@linaro.org>,
 <rfoss@kernel.org>, <Laurent.pinchart@ideasonboard.com>, <jonas@kwiboo.se>,
 <jernej.skrabec@gmail.com>, <airlied@gmail.com>, <daniel@ffwll.ch>,
 <u.kleine-koenig@pengutronix.de>, <arnd@arndb.de>, <dianders@chromium.org>,
 <javierm@redhat.com>, <sebastian.reichel@collabora.com>,
 <dmitry.torokhov@gmail.com>, <tzimmermann@suse.de>,
 <luzmaximilian@gmail.com>, <peda@axentia.se>, <a-bhatia1@ti.com>,
 <nikhil.nd@ti.com>, <tomi.valkeinen@ti.com>,
 <penguin-kernel@I-love.SAKURA.ne.jp>, <eballetbo@kernel.org>,
 <drinkcat@chromium.org>, <treding@nvidia.com>,
 <dri-devel@lists.freedesktop.org>
Subject: [PATCH -next v2] drm/bridge: fix -Wunused-const-variable= warning
Date: Fri, 28 Jul 2023 17:12:08 +0800
Message-ID: <20230728091208.45506-1-wangzhu9@huawei.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.67.174.202]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 dggpeml500025.china.huawei.com (7.185.36.35)
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Fri, 28 Jul 2023 14:24:33 +0000
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

When building with W=1, the following warning occurs.

drivers/gpu/drm/bridge/analogix/analogix-anx78xx.c:48:17: warning: ‘anx781x_i2c_addresses’ defined but not used [-Wunused-const-variable=]  static const u8 anx781x_i2c_addresses[] = {
                 ^~~~~~~~~~~~~~~~~~~~~
drivers/gpu/drm/bridge/analogix/analogix-anx78xx.c:40:17: warning: ‘anx7808_i2c_addresses’ defined but not used [-Wunused-const-variable=]  static const u8 anx7808_i2c_addresses[] = {

When CONFIG_IO is disabled, above two variables are not used,
since the place where it is used is inclueded in the macro
CONFIG_OF.

The drivers under the directory drivers/gpu/drm/bridge depends
on the macro CONFIG_OF, it is not necessary to use CONFIG_OF
or of_match_ptr in related files in this directory, so we just
remove them all.

Fixes: 0647e7dd3f7a ("drm/bridge: Add Analogix anx78xx support")
Signed-off-by: Zhu Wang <wangzhu9@huawei.com>

Changes in v2
- remove CONFIG_OF and of_match_ptr in following files:
  drivers/gpu/drm/bridge/analogix/analogix-anx6345.c
  drivers/gpu/drm/bridge/analogix/analogix-anx78xx.c
  drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c
  drivers/gpu/drm/bridge/chrontel-ch7033.c
  drivers/gpu/drm/bridge/sil-sii8620.c
  drivers/gpu/drm/bridge/ti-tfp410.c
---
 drivers/gpu/drm/bridge/analogix/analogix-anx6345.c  | 2 +-
 drivers/gpu/drm/bridge/analogix/analogix-anx78xx.c  | 4 +---
 drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c | 2 +-
 drivers/gpu/drm/bridge/chrontel-ch7033.c            | 2 +-
 drivers/gpu/drm/bridge/sil-sii8620.c                | 2 +-
 drivers/gpu/drm/bridge/ti-tfp410.c                  | 2 +-
 6 files changed, 6 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/bridge/analogix/analogix-anx6345.c b/drivers/gpu/drm/bridge/analogix/analogix-anx6345.c
index 72ab2ab77081..c9e35731e6a1 100644
--- a/drivers/gpu/drm/bridge/analogix/analogix-anx6345.c
+++ b/drivers/gpu/drm/bridge/analogix/analogix-anx6345.c
@@ -813,7 +813,7 @@ MODULE_DEVICE_TABLE(of, anx6345_match_table);
 static struct i2c_driver anx6345_driver = {
 	.driver = {
 		   .name = "anx6345",
-		   .of_match_table = of_match_ptr(anx6345_match_table),
+		   .of_match_table = anx6345_match_table,
 		  },
 	.probe = anx6345_i2c_probe,
 	.remove = anx6345_i2c_remove,
diff --git a/drivers/gpu/drm/bridge/analogix/analogix-anx78xx.c b/drivers/gpu/drm/bridge/analogix/analogix-anx78xx.c
index 06a3e3243e19..800555aef97f 100644
--- a/drivers/gpu/drm/bridge/analogix/analogix-anx78xx.c
+++ b/drivers/gpu/drm/bridge/analogix/analogix-anx78xx.c
@@ -1373,7 +1373,6 @@ static const struct i2c_device_id anx78xx_id[] = {
 };
 MODULE_DEVICE_TABLE(i2c, anx78xx_id);
 
-#if IS_ENABLED(CONFIG_OF)
 static const struct of_device_id anx78xx_match_table[] = {
 	{ .compatible = "analogix,anx7808", .data = anx7808_i2c_addresses },
 	{ .compatible = "analogix,anx7812", .data = anx781x_i2c_addresses },
@@ -1382,12 +1381,11 @@ static const struct of_device_id anx78xx_match_table[] = {
 	{ /* sentinel */ },
 };
 MODULE_DEVICE_TABLE(of, anx78xx_match_table);
-#endif
 
 static struct i2c_driver anx78xx_driver = {
 	.driver = {
 		   .name = "anx7814",
-		   .of_match_table = of_match_ptr(anx78xx_match_table),
+		   .of_match_table = anx78xx_match_table,
 		  },
 	.probe = anx78xx_i2c_probe,
 	.remove = anx78xx_i2c_remove,
diff --git a/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c b/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c
index ecb935e46b62..e434c0b5784e 100644
--- a/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c
+++ b/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c
@@ -2656,7 +2656,7 @@ MODULE_DEVICE_TABLE(of, mhdp_ids);
 static struct platform_driver mhdp_driver = {
 	.driver	= {
 		.name		= "cdns-mhdp8546",
-		.of_match_table	= of_match_ptr(mhdp_ids),
+		.of_match_table	= mhdp_ids,
 	},
 	.probe	= cdns_mhdp_probe,
 	.remove	= cdns_mhdp_remove,
diff --git a/drivers/gpu/drm/bridge/chrontel-ch7033.c b/drivers/gpu/drm/bridge/chrontel-ch7033.c
index a854eb84e399..483c28c7fc99 100644
--- a/drivers/gpu/drm/bridge/chrontel-ch7033.c
+++ b/drivers/gpu/drm/bridge/chrontel-ch7033.c
@@ -607,7 +607,7 @@ static struct i2c_driver ch7033_driver = {
 	.remove = ch7033_remove,
 	.driver = {
 		.name = "ch7033",
-		.of_match_table = of_match_ptr(ch7033_dt_ids),
+		.of_match_table = ch7033_dt_ids,
 	},
 	.id_table = ch7033_ids,
 };
diff --git a/drivers/gpu/drm/bridge/sil-sii8620.c b/drivers/gpu/drm/bridge/sil-sii8620.c
index 79b09ccd1353..599164e3877d 100644
--- a/drivers/gpu/drm/bridge/sil-sii8620.c
+++ b/drivers/gpu/drm/bridge/sil-sii8620.c
@@ -2376,7 +2376,7 @@ MODULE_DEVICE_TABLE(i2c, sii8620_id);
 static struct i2c_driver sii8620_driver = {
 	.driver = {
 		.name	= "sii8620",
-		.of_match_table = of_match_ptr(sii8620_dt_match),
+		.of_match_table = sii8620_dt_match,
 	},
 	.probe		= sii8620_probe,
 	.remove		= sii8620_remove,
diff --git a/drivers/gpu/drm/bridge/ti-tfp410.c b/drivers/gpu/drm/bridge/ti-tfp410.c
index 22b07260a78e..28848a8eb42e 100644
--- a/drivers/gpu/drm/bridge/ti-tfp410.c
+++ b/drivers/gpu/drm/bridge/ti-tfp410.c
@@ -448,7 +448,7 @@ MODULE_DEVICE_TABLE(i2c, tfp410_i2c_ids);
 static struct i2c_driver tfp410_i2c_driver = {
 	.driver = {
 		.name	= "tfp410",
-		.of_match_table = of_match_ptr(tfp410_match),
+		.of_match_table = tfp410_match,
 	},
 	.id_table	= tfp410_i2c_ids,
 	.probe		= tfp410_i2c_probe,
-- 
2.17.1

