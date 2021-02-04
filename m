Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 814F730EE72
	for <lists+dri-devel@lfdr.de>; Thu,  4 Feb 2021 09:33:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 46A9C6ED07;
	Thu,  4 Feb 2021 08:32:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out4436.biz.mail.alibaba.com (out4436.biz.mail.alibaba.com
 [47.88.44.36])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6956D6EC7F
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Feb 2021 06:38:48 +0000 (UTC)
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R171e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=e01e04394;
 MF=jiapeng.chong@linux.alibaba.com; NM=1; PH=DS; RN=9; SR=0;
 TI=SMTPD_---0UNpw7Hg_1612420709; 
Received: from
 j63c13417.sqa.eu95.tbsite.net(mailfrom:jiapeng.chong@linux.alibaba.com
 fp:SMTPD_---0UNpw7Hg_1612420709) by smtp.aliyun-inc.com(127.0.0.1);
 Thu, 04 Feb 2021 14:38:34 +0800
From: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
To: james.qian.wang@arm.com
Subject: [PATCH] drm/komeda: convert sysfs sprintf/snprintf family to
 sysfs_emit
Date: Thu,  4 Feb 2021 14:38:28 +0800
Message-Id: <1612420708-25297-1-git-send-email-jiapeng.chong@linux.alibaba.com>
X-Mailer: git-send-email 1.8.3.1
X-Mailman-Approved-At: Thu, 04 Feb 2021 08:32:37 +0000
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
Cc: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>, airlied@linux.ie,
 liviu.dudau@arm.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, mihail.atanassov@arm.com
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fix the following coccicheck warning:

./drivers/gpu/drm/arm/display/komeda/komeda_dev.c:97:8-16: WARNING: use
scnprintf or sprintf.

./drivers/gpu/drm/arm/display/komeda/komeda_dev.c:88:8-16: WARNING: use
scnprintf or sprintf.

./drivers/gpu/drm/arm/display/komeda/komeda_dev.c:65:8-16: WARNING: use
scnprintf or sprintf.

Reported-by: Abaci Robot<abaci@linux.alibaba.com>
Signed-off-by: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
---
 drivers/gpu/drm/arm/display/komeda/komeda_dev.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/arm/display/komeda/komeda_dev.c b/drivers/gpu/drm/arm/display/komeda/komeda_dev.c
index ca891ae..cc7664c 100644
--- a/drivers/gpu/drm/arm/display/komeda/komeda_dev.c
+++ b/drivers/gpu/drm/arm/display/komeda/komeda_dev.c
@@ -62,7 +62,7 @@ static void komeda_debugfs_init(struct komeda_dev *mdev)
 {
 	struct komeda_dev *mdev = dev_to_mdev(dev);
 
-	return snprintf(buf, PAGE_SIZE, "0x%08x\n", mdev->chip.core_id);
+	return sysfs_emit(buf, "0x%08x\n", mdev->chip.core_id);
 }
 static DEVICE_ATTR_RO(core_id);
 
@@ -85,7 +85,7 @@ static void komeda_debugfs_init(struct komeda_dev *mdev)
 		if (pipe->layers[i]->layer_type == KOMEDA_FMT_RICH_LAYER)
 			config_id.n_richs++;
 	}
-	return snprintf(buf, PAGE_SIZE, "0x%08x\n", config_id.value);
+	return sysfs_emit(buf, "0x%08x\n", config_id.value);
 }
 static DEVICE_ATTR_RO(config_id);
 
@@ -94,7 +94,7 @@ static void komeda_debugfs_init(struct komeda_dev *mdev)
 {
 	struct komeda_dev *mdev = dev_to_mdev(dev);
 
-	return snprintf(buf, PAGE_SIZE, "%lu\n", clk_get_rate(mdev->aclk));
+	return sysfs_emit(buf, "%lu\n", clk_get_rate(mdev->aclk));
 }
 static DEVICE_ATTR_RO(aclk_hz);
 
-- 
1.8.3.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
