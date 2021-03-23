Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 83AD33455EC
	for <lists+dri-devel@lfdr.de>; Tue, 23 Mar 2021 04:05:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0EA576E82F;
	Tue, 23 Mar 2021 03:05:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from szxga05-in.huawei.com (szxga05-in.huawei.com [45.249.212.191])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 11C6F6E82F
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Mar 2021 03:05:50 +0000 (UTC)
Received: from DGGEMS401-HUB.china.huawei.com (unknown [172.30.72.59])
 by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4F4GR73MtYzwPSt;
 Tue, 23 Mar 2021 11:03:47 +0800 (CST)
Received: from localhost.localdomain (10.69.192.56) by
 DGGEMS401-HUB.china.huawei.com (10.3.19.201) with Microsoft SMTP Server id
 14.3.498.0; Tue, 23 Mar 2021 11:05:42 +0800
From: Tian Tao <tiantao6@hisilicon.com>
To: <a.hajda@samsung.com>, <narmstrong@baylibre.com>, <airlied@linux.ie>,
 <daniel@ffwll.ch>
Subject: [PATCH] drm/bridge/lontium-lt9611uxc: Convert sysfs sprintf/snprintf
 family to sysfs_emit
Date: Tue, 23 Mar 2021 11:06:18 +0800
Message-ID: <1616468778-52287-1-git-send-email-tiantao6@hisilicon.com>
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
drivers/gpu//drm/bridge/lontium-lt9611uxc.c:858:8-16: WARNING: use
scnprintf or sprintf

Signed-off-by: Tian Tao <tiantao6@hisilicon.com>
---
 drivers/gpu/drm/bridge/lontium-lt9611uxc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/bridge/lontium-lt9611uxc.c b/drivers/gpu/drm/bridge/lontium-lt9611uxc.c
index fee2795..3cac16d 100644
--- a/drivers/gpu/drm/bridge/lontium-lt9611uxc.c
+++ b/drivers/gpu/drm/bridge/lontium-lt9611uxc.c
@@ -855,7 +855,7 @@ static ssize_t lt9611uxc_firmware_show(struct device *dev, struct device_attribu
 {
 	struct lt9611uxc *lt9611uxc = dev_get_drvdata(dev);
 
-	return snprintf(buf, PAGE_SIZE, "%02x\n", lt9611uxc->fw_version);
+	return sysfs_emit(buf, "%02x\n", lt9611uxc->fw_version);
 }
 
 static DEVICE_ATTR_RW(lt9611uxc_firmware);
-- 
2.7.4

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
