Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AB93C522427
	for <lists+dri-devel@lfdr.de>; Tue, 10 May 2022 20:34:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5016710E43C;
	Tue, 10 May 2022 18:34:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 1162 seconds by postgrey-1.36 at gabe;
 Tue, 10 May 2022 14:12:40 UTC
Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4EFDB10F639
 for <dri-devel@lists.freedesktop.org>; Tue, 10 May 2022 14:12:40 +0000 (UTC)
Received: from kwepemi100012.china.huawei.com (unknown [172.30.72.55])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4KyKDf49VnzGpdw;
 Tue, 10 May 2022 21:50:26 +0800 (CST)
Received: from kwepemm600005.china.huawei.com (7.193.23.191) by
 kwepemi100012.china.huawei.com (7.221.188.202) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Tue, 10 May 2022 21:53:14 +0800
Received: from ubuntu1804.huawei.com (10.67.175.30) by
 kwepemm600005.china.huawei.com (7.193.23.191) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Tue, 10 May 2022 21:53:13 +0800
From: Hui Tang <tanghui20@huawei.com>
To: <emma@anholt.net>
Subject: [PATCH -next] drm/vc4: hdmi: Fix build error for implicit function
 declaration
Date: Tue, 10 May 2022 21:51:48 +0800
Message-ID: <20220510135148.247719-1-tanghui20@huawei.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.67.175.30]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 kwepemm600005.china.huawei.com (7.193.23.191)
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Tue, 10 May 2022 18:34:47 +0000
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
Cc: airlied@linux.ie, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

drivers/gpu/drm/vc4/vc4_hdmi.c: In function ‘vc4_hdmi_connector_detect’:
drivers/gpu/drm/vc4/vc4_hdmi.c:228:7: error: implicit declaration of function ‘gpiod_get_value_cansleep’; did you mean ‘gpio_get_value_cansleep’? [-Werror=implicit-function-declaration]
   if (gpiod_get_value_cansleep(vc4_hdmi->hpd_gpio))
       ^~~~~~~~~~~~~~~~~~~~~~~~
       gpio_get_value_cansleep
  CC [M]  drivers/gpu/drm/vc4/vc4_validate.o
  CC [M]  drivers/gpu/drm/vc4/vc4_v3d.o
  CC [M]  drivers/gpu/drm/vc4/vc4_validate_shaders.o
  CC [M]  drivers/gpu/drm/vc4/vc4_debugfs.o
drivers/gpu/drm/vc4/vc4_hdmi.c: In function ‘vc4_hdmi_bind’:
drivers/gpu/drm/vc4/vc4_hdmi.c:2883:23: error: implicit declaration of function ‘devm_gpiod_get_optional’; did you mean ‘devm_clk_get_optional’? [-Werror=implicit-function-declaration]
  vc4_hdmi->hpd_gpio = devm_gpiod_get_optional(dev, "hpd", GPIOD_IN);
                       ^~~~~~~~~~~~~~~~~~~~~~~
                       devm_clk_get_optional
drivers/gpu/drm/vc4/vc4_hdmi.c:2883:59: error: ‘GPIOD_IN’ undeclared (first use in this function); did you mean ‘GPIOF_IN’?
  vc4_hdmi->hpd_gpio = devm_gpiod_get_optional(dev, "hpd", GPIOD_IN);
                                                           ^~~~~~~~
                                                           GPIOF_IN
drivers/gpu/drm/vc4/vc4_hdmi.c:2883:59: note: each undeclared identifier is reported only once for each function it appears in
cc1: all warnings being treated as errors

Fixes: 6800234ceee0 ("drm/vc4: hdmi: Convert to gpiod")
Signed-off-by: Hui Tang <tanghui20@huawei.com>
---
 drivers/gpu/drm/vc4/vc4_hdmi.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
index 6aadb65eb640..823d812f4982 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.c
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
@@ -38,6 +38,7 @@
 #include <drm/drm_simple_kms_helper.h>
 #include <linux/clk.h>
 #include <linux/component.h>
+#include <linux/gpio/consumer.h>
 #include <linux/i2c.h>
 #include <linux/of_address.h>
 #include <linux/of_gpio.h>
-- 
2.17.1

