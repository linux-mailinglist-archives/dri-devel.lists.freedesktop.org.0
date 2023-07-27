Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F5AA76447B
	for <lists+dri-devel@lfdr.de>; Thu, 27 Jul 2023 05:38:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0126710E4D7;
	Thu, 27 Jul 2023 03:38:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B75410E4D7
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Jul 2023 03:38:44 +0000 (UTC)
Received: from kwepemi500008.china.huawei.com (unknown [172.30.72.55])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4RBGcP5K93zNmTG;
 Thu, 27 Jul 2023 11:35:17 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemi500008.china.huawei.com
 (7.221.188.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Thu, 27 Jul
 2023 11:38:40 +0800
From: Ruan Jinjie <ruanjinjie@huawei.com>
To: <tomi.valkeinen@ideasonboard.com>, <airlied@gmail.com>, <daniel@ffwll.ch>, 
 <laurent.pinchart@ideasonboard.com>, <u.kleine-koenig@pengutronix.de>,
 <guozhengkui@vivo.com>, <dianders@chromium.org>, <yuancan@huawei.com>,
 <arnd@arndb.de>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>
Subject: [PATCH -next] drm: omapdrm: dss: Remove redundant DSSERR()
Date: Thu, 27 Jul 2023 11:39:23 +0000
Message-ID: <20230727113923.3093070-1-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.90.53.73]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 kwepemi500008.china.huawei.com (7.221.188.139)
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
Cc: ruanjinjie@huawei.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

There is no need to call the DSSERR() function directly to print
a custom message when handling an error from platform_get_irq() function
as it is going to display an appropriate error message
in case of a failure.

Signed-off-by: Ruan Jinjie <ruanjinjie@huawei.com>
---
 drivers/gpu/drm/omapdrm/dss/dispc.c | 1 -
 drivers/gpu/drm/omapdrm/dss/dsi.c   | 4 +---
 drivers/gpu/drm/omapdrm/dss/hdmi4.c | 1 -
 drivers/gpu/drm/omapdrm/dss/hdmi5.c | 1 -
 4 files changed, 1 insertion(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/omapdrm/dss/dispc.c b/drivers/gpu/drm/omapdrm/dss/dispc.c
index c26aab4939fa..9209103f5dc5 100644
--- a/drivers/gpu/drm/omapdrm/dss/dispc.c
+++ b/drivers/gpu/drm/omapdrm/dss/dispc.c
@@ -4779,7 +4779,6 @@ static int dispc_bind(struct device *dev, struct device *master, void *data)
 
 	dispc->irq = platform_get_irq(dispc->pdev, 0);
 	if (dispc->irq < 0) {
-		DSSERR("platform_get_irq failed\n");
 		r = -ENODEV;
 		goto err_free;
 	}
diff --git a/drivers/gpu/drm/omapdrm/dss/dsi.c b/drivers/gpu/drm/omapdrm/dss/dsi.c
index ea63c64d3a1a..63cfe0776788 100644
--- a/drivers/gpu/drm/omapdrm/dss/dsi.c
+++ b/drivers/gpu/drm/omapdrm/dss/dsi.c
@@ -4935,10 +4935,8 @@ static int dsi_probe(struct platform_device *pdev)
 		return PTR_ERR(dsi->pll_base);
 
 	dsi->irq = platform_get_irq(pdev, 0);
-	if (dsi->irq < 0) {
-		DSSERR("platform_get_irq failed\n");
+	if (dsi->irq < 0)
 		return -ENODEV;
-	}
 
 	r = devm_request_irq(dev, dsi->irq, omap_dsi_irq_handler,
 			     IRQF_SHARED, dev_name(dev), dsi);
diff --git a/drivers/gpu/drm/omapdrm/dss/hdmi4.c b/drivers/gpu/drm/omapdrm/dss/hdmi4.c
index a26b77d99d52..d4fd6c680db3 100644
--- a/drivers/gpu/drm/omapdrm/dss/hdmi4.c
+++ b/drivers/gpu/drm/omapdrm/dss/hdmi4.c
@@ -782,7 +782,6 @@ static int hdmi4_probe(struct platform_device *pdev)
 
 	irq = platform_get_irq(pdev, 0);
 	if (irq < 0) {
-		DSSERR("platform_get_irq failed\n");
 		r = -ENODEV;
 		goto err_free;
 	}
diff --git a/drivers/gpu/drm/omapdrm/dss/hdmi5.c b/drivers/gpu/drm/omapdrm/dss/hdmi5.c
index e6611c683857..27c21ff8c4e5 100644
--- a/drivers/gpu/drm/omapdrm/dss/hdmi5.c
+++ b/drivers/gpu/drm/omapdrm/dss/hdmi5.c
@@ -756,7 +756,6 @@ static int hdmi5_probe(struct platform_device *pdev)
 
 	irq = platform_get_irq(pdev, 0);
 	if (irq < 0) {
-		DSSERR("platform_get_irq failed\n");
 		r = -ENODEV;
 		goto err_free;
 	}
-- 
2.34.1

