Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 261D2A6C71F
	for <lists+dri-devel@lfdr.de>; Sat, 22 Mar 2025 03:39:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD7E610E263;
	Sat, 22 Mar 2025 02:38:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from szxga05-in.huawei.com (szxga05-in.huawei.com [45.249.212.191])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7657710E263
 for <dri-devel@lists.freedesktop.org>; Sat, 22 Mar 2025 02:38:54 +0000 (UTC)
Received: from mail.maildlp.com (unknown [172.19.163.44])
 by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4ZKNg83sDfz1g2Ck;
 Sat, 22 Mar 2025 10:34:12 +0800 (CST)
Received: from dggpemf500002.china.huawei.com (unknown [7.185.36.57])
 by mail.maildlp.com (Postfix) with ESMTPS id 42A73140144;
 Sat, 22 Mar 2025 10:38:46 +0800 (CST)
Received: from huawei.com (10.175.101.6) by dggpemf500002.china.huawei.com
 (7.185.36.57) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Sat, 22 Mar
 2025 10:38:45 +0800
From: Yue Haibing <yuehaibing@huawei.com>
To: <hverkuil@xs4all.nl>, <mchehab@kernel.org>, <lumag@kernel.org>,
 <dmitry.baryshkov@linaro.org>
CC: <linux-media@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <yuehaibing@huawei.com>, <dri-devel@lists.freedesktop.org>
Subject: [PATCH v2 -next] media: cec: tda9950: Add missing I2C dependency
Date: Sat, 22 Mar 2025 10:49:14 +0800
Message-ID: <20250322024914.3622546-1-yuehaibing@huawei.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.175.101.6]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 dggpemf500002.china.huawei.com (7.185.36.57)
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

If CONFIG_I2C is not set, build fails:

drivers/media/cec/i2c/tda9950.c: In function ‘tda9950_probe’:
drivers/media/cec/i2c/tda9950.c:391:14: error: implicit declaration of function ‘i2c_check_functionality’ [-Werror=implicit-function-declaration]
	if (!i2c_check_functionality(client->adapter, I2C_FUNC_I2C)) {
      |              ^~~~~~~~~~~~~~~~~~~~~~~
  CC      crypto/aes_generic.o
drivers/media/cec/i2c/tda9950.c: At top level:
drivers/media/cec/i2c/tda9950.c:503:1: warning: data definition has no type or storage class
  503 | module_i2c_driver(tda9950_driver);
      | ^~~~~~~~~~~~~~~~~
drivers/media/cec/i2c/tda9950.c:503:1: error: type defaults to ‘int’ in declaration of ‘module_i2c_driver’ [-Werror=implicit-int]
drivers/media/cec/i2c/tda9950.c:503:1: warning: parameter names (without types) in function declaration

Add missing I2C dependency to fix this.

Fixes: caa6f4a75e9f ("media: cec: move driver for TDA9950 from drm/i2c")
Signed-off-by: Yue Haibing <yuehaibing@huawei.com>
---
v2: Fix patch title, also cc dri-devel list
---
 drivers/media/cec/i2c/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/media/cec/i2c/Kconfig b/drivers/media/cec/i2c/Kconfig
index b9d21643eef1..c31abc26f602 100644
--- a/drivers/media/cec/i2c/Kconfig
+++ b/drivers/media/cec/i2c/Kconfig
@@ -16,6 +16,7 @@ config CEC_CH7322
 
 config CEC_NXP_TDA9950
 	tristate "NXP Semiconductors TDA9950/TDA998X HDMI CEC"
+	depends on I2C
 	select CEC_NOTIFIER
 	select CEC_CORE
 	default DRM_I2C_NXP_TDA998X
-- 
2.34.1

