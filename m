Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B6E826D5BB
	for <lists+dri-devel@lfdr.de>; Thu, 17 Sep 2020 10:08:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1BBCE6EB79;
	Thu, 17 Sep 2020 08:08:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from huawei.com (szxga04-in.huawei.com [45.249.212.190])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D06A6E03C
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Sep 2020 06:27:45 +0000 (UTC)
Received: from DGGEMS404-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id ABD6CC185155CD6D8066;
 Thu, 17 Sep 2020 14:27:40 +0800 (CST)
Received: from huawei.com (10.175.124.27) by DGGEMS404-HUB.china.huawei.com
 (10.3.19.204) with Microsoft SMTP Server id 14.3.487.0; Thu, 17 Sep 2020
 14:27:36 +0800
From: Wang Xiaojun <wangxiaojun11@huawei.com>
To: <jsarha@ti.com>, <tomi.valkeinen@ti.com>, <airlied@linux.ie>,
 <daniel@ffwll.ch>
Subject: [PATCH -next] drm/tidss: use devm_platform_ioremap_resource_byname
Date: Thu, 17 Sep 2020 14:29:58 +0800
Message-ID: <20200917062958.2183496-1-wangxiaojun11@huawei.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Originating-IP: [10.175.124.27]
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Thu, 17 Sep 2020 08:08:02 +0000
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
Cc: dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Use the devm_platform_ioremap_resource_byname() helper instead of
calling platform_get_resource_byname() and devm_ioremap_resource()
separately.

Signed-off-by: Wang Xiaojun <wangxiaojun11@huawei.com>
---
 drivers/gpu/drm/tidss/tidss_dispc.c | 9 +--------
 1 file changed, 1 insertion(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/tidss/tidss_dispc.c b/drivers/gpu/drm/tidss/tidss_dispc.c
index c3ece2c9d1c8..78f94a51a811 100644
--- a/drivers/gpu/drm/tidss/tidss_dispc.c
+++ b/drivers/gpu/drm/tidss/tidss_dispc.c
@@ -2605,16 +2605,9 @@ void dispc_remove(struct tidss_device *tidss)
 static int dispc_iomap_resource(struct platform_device *pdev, const char *name,
 				void __iomem **base)
 {
-	struct resource *res;
 	void __iomem *b;
 
-	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, name);
-	if (!res) {
-		dev_err(&pdev->dev, "cannot get mem resource '%s'\n", name);
-		return -EINVAL;
-	}
-
-	b = devm_ioremap_resource(&pdev->dev, res);
+	b = devm_platform_ioremap_resource_byname(pdev, name);
 	if (IS_ERR(b)) {
 		dev_err(&pdev->dev, "cannot ioremap resource '%s'\n", name);
 		return PTR_ERR(b);
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
