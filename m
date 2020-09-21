Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 83454273C4E
	for <lists+dri-devel@lfdr.de>; Tue, 22 Sep 2020 09:46:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 150246E0C4;
	Tue, 22 Sep 2020 07:46:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from huawei.com (szxga05-in.huawei.com [45.249.212.191])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3DCC389B0C
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Sep 2020 13:10:05 +0000 (UTC)
Received: from DGGEMS414-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id E7E95384D5219CC99EB4;
 Mon, 21 Sep 2020 21:10:01 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.175.113.25) by
 DGGEMS414-HUB.china.huawei.com (10.3.19.214) with Microsoft SMTP Server id
 14.3.487.0; Mon, 21 Sep 2020 21:09:55 +0800
From: Qinglang Miao <miaoqinglang@huawei.com>
To: Rob Herring <robh@kernel.org>, Tomeu Vizoso <tomeu.vizoso@collabora.com>, 
 Steven Price <steven.price@arm.com>, Alyssa Rosenzweig
 <alyssa.rosenzweig@collabora.com>, David Airlie <airlied@linux.ie>, "Daniel
 Vetter" <daniel@ffwll.ch>, Philipp Zabel <p.zabel@pengutronix.de>
Subject: [PATCH -next] drm/panfrost: simplify the return expression of
 cz_ih_hw_init()
Date: Mon, 21 Sep 2020 21:10:19 +0800
Message-ID: <20200921131019.91558-1-miaoqinglang@huawei.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Originating-IP: [10.175.113.25]
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Tue, 22 Sep 2020 07:46:35 +0000
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
Cc: Qinglang Miao <miaoqinglang@huawei.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Simplify the return expression.

Signed-off-by: Qinglang Miao <miaoqinglang@huawei.com>
---
 drivers/gpu/drm/panfrost/panfrost_device.c | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/panfrost/panfrost_device.c b/drivers/gpu/drm/panfrost/panfrost_device.c
index e68967338..ea8d31863 100644
--- a/drivers/gpu/drm/panfrost/panfrost_device.c
+++ b/drivers/gpu/drm/panfrost/panfrost_device.c
@@ -18,19 +18,13 @@
 
 static int panfrost_reset_init(struct panfrost_device *pfdev)
 {
-	int err;
-
 	pfdev->rstc = devm_reset_control_array_get(pfdev->dev, false, true);
 	if (IS_ERR(pfdev->rstc)) {
 		dev_err(pfdev->dev, "get reset failed %ld\n", PTR_ERR(pfdev->rstc));
 		return PTR_ERR(pfdev->rstc);
 	}
 
-	err = reset_control_deassert(pfdev->rstc);
-	if (err)
-		return err;
-
-	return 0;
+	return reset_control_deassert(pfdev->rstc);
 }
 
 static void panfrost_reset_fini(struct panfrost_device *pfdev)
-- 
2.23.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
