Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 338FC2C7FB4
	for <lists+dri-devel@lfdr.de>; Mon, 30 Nov 2020 09:25:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3684F6E413;
	Mon, 30 Nov 2020 08:25:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from szxga07-in.huawei.com (szxga07-in.huawei.com [45.249.212.35])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7780B6E419
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Nov 2020 02:04:18 +0000 (UTC)
Received: from DGGEMS406-HUB.china.huawei.com (unknown [172.30.72.60])
 by szxga07-in.huawei.com (SkyGuard) with ESMTP id 4CkpS63TmDz75sm;
 Mon, 30 Nov 2020 10:03:50 +0800 (CST)
Received: from localhost.localdomain (10.175.103.91) by
 DGGEMS406-HUB.china.huawei.com (10.3.19.206) with Microsoft SMTP Server id
 14.3.487.0; Mon, 30 Nov 2020 10:04:08 +0800
From: Jialin Zhang <zhangjialin11@huawei.com>
To: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>, David Airlie
 <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, Alan Cox
 <alan@linux.intel.com>, Dave Airlie <airlied@redhat.com>
Subject: [PATCH] drm/gma500: Fix error return code in psb_driver_load()
Date: Mon, 30 Nov 2020 10:02:16 +0800
Message-ID: <20201130020216.1906141-1-zhangjialin11@huawei.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Originating-IP: [10.175.103.91]
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Mon, 30 Nov 2020 08:25:11 +0000
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
Cc: huawei.libin@huawei.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fix to return a negative error code from the error handling
case instead of 0, as done elsewhere in this function.

Fixes: 5c49fd3aa0ab ("gma500: Add the core DRM files and headers")
Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: Jialin Zhang <zhangjialin11@huawei.com>
---
 drivers/gpu/drm/gma500/psb_drv.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/gma500/psb_drv.c b/drivers/gpu/drm/gma500/psb_drv.c
index 34b4aae9a15e..074f403d7ca0 100644
--- a/drivers/gpu/drm/gma500/psb_drv.c
+++ b/drivers/gpu/drm/gma500/psb_drv.c
@@ -313,6 +313,8 @@ static int psb_driver_load(struct drm_device *dev, unsigned long flags)
 	if (ret)
 		goto out_err;
 
+	ret = -ENOMEM;
+
 	dev_priv->mmu = psb_mmu_driver_init(dev, 1, 0, 0);
 	if (!dev_priv->mmu)
 		goto out_err;
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
