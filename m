Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EA10393D5D
	for <lists+dri-devel@lfdr.de>; Fri, 28 May 2021 08:53:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B2BFF6F57E;
	Fri, 28 May 2021 06:52:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 1033 seconds by postgrey-1.36 at gabe;
 Thu, 27 May 2021 09:06:52 UTC
Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F42F6EE40
 for <dri-devel@lists.freedesktop.org>; Thu, 27 May 2021 09:06:52 +0000 (UTC)
Received: from dggeml712-chm.china.huawei.com (unknown [172.30.72.54])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4FrLz45GX3zYn4g;
 Thu, 27 May 2021 16:46:56 +0800 (CST)
Received: from dggpeml500020.china.huawei.com (7.185.36.88) by
 dggeml712-chm.china.huawei.com (10.3.17.123) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2176.2; Thu, 27 May 2021 16:49:36 +0800
Received: from huawei.com (10.175.127.227) by dggpeml500020.china.huawei.com
 (7.185.36.88) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.2; Thu, 27 May
 2021 16:49:35 +0800
From: Baokun Li <libaokun1@huawei.com>
To: <mbroemme@libmpq.org>, <linux-fbdev@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH -next] video: fbdev: intelfb: Remove set but not used variable
 'val'
Date: Thu, 27 May 2021 16:59:04 +0800
Message-ID: <20210527085904.3861173-1-libaokun1@huawei.com>
X-Mailer: git-send-email 2.25.4
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.175.127.227]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 dggpeml500020.china.huawei.com (7.185.36.88)
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Fri, 28 May 2021 06:52:58 +0000
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
Cc: yuehaibing@huawei.com, libaokun1@huawei.com, weiyongjun1@huawei.com,
 yukuai3@huawei.com, yangjihong1@huawei.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fixes gcc '-Wunused-but-set-variable' warning:

drivers/video/fbdev/intelfb/intelfb_i2c.c: In function 'intelfb_gpio_setscl':
drivers/video/fbdev/intelfb/intelfb_i2c.c:58:6: warning:
 variable ‘val’ set but not used [-Wunused-but-set-variable]
drivers/video/fbdev/intelfb/intelfb_i2c.c: In function 'intelfb_gpio_setsda':
drivers/video/fbdev/intelfb/intelfb_i2c.c:69:6: warning:
 variable ‘val’ set but not used [-Wunused-but-set-variable]

It never used since introduction.

Signed-off-by: Baokun Li <libaokun1@huawei.com>
---
 drivers/video/fbdev/intelfb/intelfb_i2c.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/video/fbdev/intelfb/intelfb_i2c.c b/drivers/video/fbdev/intelfb/intelfb_i2c.c
index 3300bd31d9d7..4df2f1f8a18e 100644
--- a/drivers/video/fbdev/intelfb/intelfb_i2c.c
+++ b/drivers/video/fbdev/intelfb/intelfb_i2c.c
@@ -55,22 +55,20 @@ static void intelfb_gpio_setscl(void *data, int state)
 {
 	struct intelfb_i2c_chan *chan = data;
 	struct intelfb_info *dinfo = chan->dinfo;
-	u32 val;
 
 	OUTREG(chan->reg, (state ? SCL_VAL_OUT : 0) |
 	       SCL_DIR | SCL_DIR_MASK | SCL_VAL_MASK);
-	val = INREG(chan->reg);
+	INREG(chan->reg);
 }
 
 static void intelfb_gpio_setsda(void *data, int state)
 {
 	struct intelfb_i2c_chan *chan = data;
 	struct intelfb_info *dinfo = chan->dinfo;
-	u32 val;
 
 	OUTREG(chan->reg, (state ? SDA_VAL_OUT : 0) |
 	       SDA_DIR | SDA_DIR_MASK | SDA_VAL_MASK);
-	val = INREG(chan->reg);
+	INREG(chan->reg);
 }
 
 static int intelfb_gpio_getscl(void *data)
-- 
2.25.4

