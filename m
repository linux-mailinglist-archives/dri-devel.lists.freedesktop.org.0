Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F4451BD4D1
	for <lists+dri-devel@lfdr.de>; Wed, 29 Apr 2020 08:45:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 869F36EC96;
	Wed, 29 Apr 2020 06:45:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from huawei.com (szxga05-in.huawei.com [45.249.212.191])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 966606E57E
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Apr 2020 14:16:11 +0000 (UTC)
Received: from DGGEMS413-HUB.china.huawei.com (unknown [172.30.72.60])
 by Forcepoint Email with ESMTP id E70692BBD42DE853D15B;
 Tue, 28 Apr 2020 22:16:07 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.175.113.25) by
 DGGEMS413-HUB.china.huawei.com (10.3.19.213) with Microsoft SMTP Server id
 14.3.487.0; Tue, 28 Apr 2020 22:16:00 +0800
From: Wei Yongjun <weiyongjun1@huawei.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Kieran Bingham
 <kieran.bingham+renesas@ideasonboard.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Jacopo Mondi <jacopo+renesas@jmondi.org>
Subject: [PATCH -next] drm/rcar-du: Fix return value check in
 rcar_du_cmm_init()
Date: Tue, 28 Apr 2020 14:17:16 +0000
Message-ID: <20200428141716.87958-1-weiyongjun1@huawei.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Originating-IP: [10.175.113.25]
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Wed, 29 Apr 2020 06:45:00 +0000
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
Cc: linux-renesas-soc@vger.kernel.org, kernel-janitors@vger.kernel.org,
 Wei Yongjun <weiyongjun1@huawei.com>, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

In case of error, the function of_parse_phandle()/of_find_device_by_node()
returns NULL pointer not ERR_PTR(). The IS_ERR() test in the return value
check should be replaced with NULL test

Fixes: 8de707aeb452 ("drm: rcar-du: kms: Initialize CMM instances")
Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
---
 drivers/gpu/drm/rcar-du/rcar_du_kms.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/rcar-du/rcar_du_kms.c b/drivers/gpu/drm/rcar-du/rcar_du_kms.c
index 482329102f19..0da711d9b2f8 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_kms.c
+++ b/drivers/gpu/drm/rcar-du/rcar_du_kms.c
@@ -650,10 +650,10 @@ static int rcar_du_cmm_init(struct rcar_du_device *rcdu)
 		int ret;
 
 		cmm = of_parse_phandle(np, "renesas,cmms", i);
-		if (IS_ERR(cmm)) {
+		if (!cmm) {
 			dev_err(rcdu->dev,
 				"Failed to parse 'renesas,cmms' property\n");
-			return PTR_ERR(cmm);
+			return -ENODEV;
 		}
 
 		if (!of_device_is_available(cmm)) {
@@ -663,10 +663,10 @@ static int rcar_du_cmm_init(struct rcar_du_device *rcdu)
 		}
 
 		pdev = of_find_device_by_node(cmm);
-		if (IS_ERR(pdev)) {
+		if (!pdev) {
 			dev_err(rcdu->dev, "No device found for CMM%u\n", i);
 			of_node_put(cmm);
-			return PTR_ERR(pdev);
+			return -ENODEV;
 		}
 
 		of_node_put(cmm);



_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
