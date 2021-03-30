Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3972C34DD6B
	for <lists+dri-devel@lfdr.de>; Tue, 30 Mar 2021 03:24:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 056126E5CE;
	Tue, 30 Mar 2021 01:24:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from szxga04-in.huawei.com (szxga04-in.huawei.com [45.249.212.190])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BEC276E5CE
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Mar 2021 01:24:52 +0000 (UTC)
Received: from DGGEMS412-HUB.china.huawei.com (unknown [172.30.72.59])
 by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4F8WsK5Rvrz17PNC;
 Tue, 30 Mar 2021 09:22:45 +0800 (CST)
Received: from localhost.localdomain (10.69.192.56) by
 DGGEMS412-HUB.china.huawei.com (10.3.19.212) with Microsoft SMTP Server id
 14.3.498.0; Tue, 30 Mar 2021 09:24:47 +0800
From: Tian Tao <tiantao6@hisilicon.com>
To: <airlied@linux.ie>, <daniel@ffwll.ch>
Subject: [PATCH] drm/komeda: Convert sysfs sprintf/snprintf family to
 sysfs_emit
Date: Tue, 30 Mar 2021 09:25:18 +0800
Message-ID: <1617067518-31091-1-git-send-email-tiantao6@hisilicon.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [10.69.192.56]
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
Cc: dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fix the following coccicheck warning:
drivers/gpu/drm/arm/display/komeda/komeda_dev.c:97:8-16: WARNING:
use scnprintf or sprintf
drivers/gpu/drm/arm/display/komeda/komeda_dev.c:88:8-16: WARNING:
use scnprintf or sprintf
drivers/gpu/drm/arm/display/komeda/komeda_dev.c:65:8-16: WARNING:
use scnprintf or sprintf

Signed-off-by: Tian Tao <tiantao6@hisilicon.com>
---
 drivers/gpu/drm/arm/display/komeda/komeda_dev.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/arm/display/komeda/komeda_dev.c b/drivers/gpu/drm/arm/display/komeda/komeda_dev.c
index ca891ae..cc7664c 100644
--- a/drivers/gpu/drm/arm/display/komeda/komeda_dev.c
+++ b/drivers/gpu/drm/arm/display/komeda/komeda_dev.c
@@ -62,7 +62,7 @@ core_id_show(struct device *dev, struct device_attribute *attr, char *buf)
 {
 	struct komeda_dev *mdev = dev_to_mdev(dev);
 
-	return snprintf(buf, PAGE_SIZE, "0x%08x\n", mdev->chip.core_id);
+	return sysfs_emit(buf, "0x%08x\n", mdev->chip.core_id);
 }
 static DEVICE_ATTR_RO(core_id);
 
@@ -85,7 +85,7 @@ config_id_show(struct device *dev, struct device_attribute *attr, char *buf)
 		if (pipe->layers[i]->layer_type == KOMEDA_FMT_RICH_LAYER)
 			config_id.n_richs++;
 	}
-	return snprintf(buf, PAGE_SIZE, "0x%08x\n", config_id.value);
+	return sysfs_emit(buf, "0x%08x\n", config_id.value);
 }
 static DEVICE_ATTR_RO(config_id);
 
@@ -94,7 +94,7 @@ aclk_hz_show(struct device *dev, struct device_attribute *attr, char *buf)
 {
 	struct komeda_dev *mdev = dev_to_mdev(dev);
 
-	return snprintf(buf, PAGE_SIZE, "%lu\n", clk_get_rate(mdev->aclk));
+	return sysfs_emit(buf, "%lu\n", clk_get_rate(mdev->aclk));
 }
 static DEVICE_ATTR_RO(aclk_hz);
 
-- 
2.7.4

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
