Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DCC2A273C8C
	for <lists+dri-devel@lfdr.de>; Tue, 22 Sep 2020 09:49:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 86BA16E82F;
	Tue, 22 Sep 2020 07:49:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from huawei.com (szxga05-in.huawei.com [45.249.212.191])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4789C6E06D
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Sep 2020 13:10:10 +0000 (UTC)
Received: from DGGEMS406-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id 36BBFD2A5751974C9D3E;
 Mon, 21 Sep 2020 21:10:08 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.175.113.25) by
 DGGEMS406-HUB.china.huawei.com (10.3.19.206) with Microsoft SMTP Server id
 14.3.487.0; Mon, 21 Sep 2020 21:10:00 +0800
From: Qinglang Miao <miaoqinglang@huawei.com>
To: Eric Anholt <eric@anholt.net>, David Airlie <airlied@linux.ie>, "Daniel
 Vetter" <daniel@ffwll.ch>
Subject: [PATCH -next] drm/vc4: simplify the return expression of
 vc4_v3d_bin_bo_get()
Date: Mon, 21 Sep 2020 21:10:25 +0800
Message-ID: <20200921131025.91739-1-miaoqinglang@huawei.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Originating-IP: [10.175.113.25]
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Tue, 22 Sep 2020 07:46:36 +0000
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
 drivers/gpu/drm/vc4/vc4_bo.c | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_bo.c b/drivers/gpu/drm/vc4/vc4_bo.c
index 74ceebd62..dfd214386 100644
--- a/drivers/gpu/drm/vc4/vc4_bo.c
+++ b/drivers/gpu/drm/vc4/vc4_bo.c
@@ -795,19 +795,13 @@ vc4_prime_import_sg_table(struct drm_device *dev,
 
 static int vc4_grab_bin_bo(struct vc4_dev *vc4, struct vc4_file *vc4file)
 {
-	int ret;
-
 	if (!vc4->v3d)
 		return -ENODEV;
 
 	if (vc4file->bin_bo_used)
 		return 0;
 
-	ret = vc4_v3d_bin_bo_get(vc4, &vc4file->bin_bo_used);
-	if (ret)
-		return ret;
-
-	return 0;
+	return vc4_v3d_bin_bo_get(vc4, &vc4file->bin_bo_used);
 }
 
 int vc4_create_bo_ioctl(struct drm_device *dev, void *data,
-- 
2.23.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
