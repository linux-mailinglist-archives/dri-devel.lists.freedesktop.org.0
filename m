Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A7723D09B0
	for <lists+dri-devel@lfdr.de>; Wed, 21 Jul 2021 09:28:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3BEF26E870;
	Wed, 21 Jul 2021 07:28:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 543 seconds by postgrey-1.36 at gabe;
 Wed, 21 Jul 2021 02:41:30 UTC
Received: from cmccmta1.chinamobile.com (cmccmta1.chinamobile.com
 [221.176.66.79])
 by gabe.freedesktop.org (Postfix) with ESMTP id DCBC06E85C
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Jul 2021 02:41:30 +0000 (UTC)
Received: from spf.mail.chinamobile.com (unknown[172.16.121.17]) by
 rmmx-syy-dmz-app01-12001 (RichMail) with SMTP id 2ee160f7871b045-4461b;
 Wed, 21 Jul 2021 10:31:56 +0800 (CST)
X-RM-TRANSID: 2ee160f7871b045-4461b
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG: 00000000
Received: from localhost.localdomain (unknown[112.0.144.134])
 by rmsmtp-syy-appsvr09-12009 (RichMail) with SMTP id 2ee960f787184d6-c2b18;
 Wed, 21 Jul 2021 10:31:56 +0800 (CST)
X-RM-TRANSID: 2ee960f787184d6-c2b18
From: Tang Bin <tangbin@cmss.chinamobile.com>
To: a.hajda@samsung.com, narmstrong@baylibre.com,
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se, airlied@linux.ie,
 daniel@ffwll.ch
Subject: [PATCH] drm/bridge/analogix/dp_core: Use
 devm_platform_ioremap_resource() to simplify code
Date: Wed, 21 Jul 2021 10:32:39 +0800
Message-Id: <20210721023239.29284-1-tangbin@cmss.chinamobile.com>
X-Mailer: git-send-email 2.20.1.windows.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Wed, 21 Jul 2021 07:27:54 +0000
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Tang Bin <tangbin@cmss.chinamobile.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Use devm_platform_ioremap_resource() instead of
platform_get_resource() & devm_ioremap_resource().

Signed-off-by: Tang Bin <tangbin@cmss.chinamobile.com>
---
 drivers/gpu/drm/bridge/analogix/analogix_dp_core.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
index 76736fb8e..71537cf8c 100644
--- a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
+++ b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
@@ -1656,7 +1656,6 @@ analogix_dp_probe(struct device *dev, struct analogix_dp_plat_data *plat_data)
 {
 	struct platform_device *pdev = to_platform_device(dev);
 	struct analogix_dp_device *dp;
-	struct resource *res;
 	unsigned int irq_flags;
 	int ret;
 
@@ -1710,9 +1709,7 @@ analogix_dp_probe(struct device *dev, struct analogix_dp_plat_data *plat_data)
 
 	clk_prepare_enable(dp->clock);
 
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-
-	dp->reg_base = devm_ioremap_resource(&pdev->dev, res);
+	dp->reg_base = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(dp->reg_base))
 		return ERR_CAST(dp->reg_base);
 
-- 
2.20.1.windows.1



