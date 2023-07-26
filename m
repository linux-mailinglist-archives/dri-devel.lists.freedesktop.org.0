Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1781776481E
	for <lists+dri-devel@lfdr.de>; Thu, 27 Jul 2023 09:12:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD37510E50D;
	Thu, 27 Jul 2023 07:12:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 16C5D10E44D
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Jul 2023 10:24:12 +0000 (UTC)
Received: from dggpeml500025.china.huawei.com (unknown [172.30.72.56])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4R9qH707gKztRSb;
 Wed, 26 Jul 2023 18:03:47 +0800 (CST)
Received: from ubuntu1804.huawei.com (10.67.174.202) by
 dggpeml500025.china.huawei.com (7.185.36.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Wed, 26 Jul 2023 18:07:01 +0800
From: Zhu Wang <wangzhu9@huawei.com>
To: <andrzej.hajda@intel.com>, <neil.armstrong@linaro.org>,
 <rfoss@kernel.org>, <Laurent.pinchart@ideasonboard.com>, <jonas@kwiboo.se>,
 <jernej.skrabec@gmail.com>, <airlied@gmail.com>, <daniel@ffwll.ch>,
 <u.kleine-koenig@pengutronix.de>, <javierm@redhat.com>,
 <dianders@chromium.org>, <benjamin.mugnier@foss.st.com>, <kabel@kernel.org>,
 <anarsoul@gmail.com>, <duwe@suse.de>, <mripard@kernel.org>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH -next] drm/bridge: fix -Wunused-const-variable= warning
Date: Wed, 26 Jul 2023 18:06:26 +0800
Message-ID: <20230726100626.167490-1-wangzhu9@huawei.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.67.174.202]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 dggpeml500025.china.huawei.com (7.185.36.35)
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Thu, 27 Jul 2023 07:11:21 +0000
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

drivers/gpu/drm/bridge/analogix/analogix-anx78xx.c:48:17: warning: ‘anx781x_i2c_addresses’ defined but not used [-Wunused-const-variable=]
 static const u8 anx781x_i2c_addresses[] = {
                 ^~~~~~~~~~~~~~~~~~~~~
drivers/gpu/drm/bridge/analogix/analogix-anx78xx.c:40:17: warning: ‘anx7808_i2c_addresses’ defined but not used [-Wunused-const-variable=]
 static const u8 anx7808_i2c_addresses[] = {

The definition of above two data variables is included by the
macro CONFIG_OF, so we also include the data variable
definitions in the macro CONFIG_OF. And in addition the data
variable anx78xx_match_table is included in the macro CONFIG_OF,
so we add CONFIG_OF to the place where it is used.

Fixes: 5d97408e0d70 ("drm/bridge: move ANA78xx driver to analogix subdirectory")

Signed-off-by: Zhu Wang <wangzhu9@huawei.com>
---
 drivers/gpu/drm/bridge/analogix/analogix-anx78xx.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/bridge/analogix/analogix-anx78xx.c b/drivers/gpu/drm/bridge/analogix/analogix-anx78xx.c
index 06a3e3243e19..799b33cebdd5 100644
--- a/drivers/gpu/drm/bridge/analogix/analogix-anx78xx.c
+++ b/drivers/gpu/drm/bridge/analogix/analogix-anx78xx.c
@@ -37,6 +37,7 @@
 
 #define XTAL_CLK		270 /* 27M */
 
+#if IS_ENABLED(CONFIG_OF)
 static const u8 anx7808_i2c_addresses[] = {
 	[I2C_IDX_TX_P0] = 0x78,
 	[I2C_IDX_TX_P1] = 0x7a,
@@ -52,6 +53,7 @@ static const u8 anx781x_i2c_addresses[] = {
 	[I2C_IDX_RX_P0] = 0x7e,
 	[I2C_IDX_RX_P1] = 0x80,
 };
+#endif
 
 struct anx78xx_platform_data {
 	struct regulator *dvdd10;
@@ -1387,7 +1389,9 @@ MODULE_DEVICE_TABLE(of, anx78xx_match_table);
 static struct i2c_driver anx78xx_driver = {
 	.driver = {
 		   .name = "anx7814",
+#if IS_ENABLED(CONFIG_OF)
 		   .of_match_table = of_match_ptr(anx78xx_match_table),
+#endif
 		  },
 	.probe = anx78xx_i2c_probe,
 	.remove = anx78xx_i2c_remove,
-- 
2.17.1

