Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CE11534DDD2
	for <lists+dri-devel@lfdr.de>; Tue, 30 Mar 2021 03:54:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 57C0D6E7FA;
	Tue, 30 Mar 2021 01:54:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from szxga04-in.huawei.com (szxga04-in.huawei.com [45.249.212.190])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 501C36E7FA
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Mar 2021 01:54:21 +0000 (UTC)
Received: from DGGEMS408-HUB.china.huawei.com (unknown [172.30.72.59])
 by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4F8XWM0tNMz17Pn3;
 Tue, 30 Mar 2021 09:52:15 +0800 (CST)
Received: from localhost.localdomain (10.69.192.56) by
 DGGEMS408-HUB.china.huawei.com (10.3.19.208) with Microsoft SMTP Server id
 14.3.498.0; Tue, 30 Mar 2021 09:54:17 +0800
From: Tian Tao <tiantao6@hisilicon.com>
To: <thierry.reding@gmail.com>, <airlied@linux.ie>, <daniel@ffwll.ch>
Subject: [PATCH] drm/panel: Convert sysfs sprintf/snprintf family to sysfs_emit
Date: Tue, 30 Mar 2021 09:54:48 +0800
Message-ID: <1617069288-8317-1-git-send-email-tiantao6@hisilicon.com>
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
drivers/gpu/drm/panel//panel-tpo-td043mtea1.c:217:8-16: WARNING:
use scnprintf or sprintf
drivers/gpu/drm/panel//panel-tpo-td043mtea1.c:189:8-16: WARNING:
use scnprintf or sprintf

Signed-off-by: Tian Tao <tiantao6@hisilicon.com>
---
 drivers/gpu/drm/panel/panel-tpo-td043mtea1.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-tpo-td043mtea1.c b/drivers/gpu/drm/panel/panel-tpo-td043mtea1.c
index 49e6c93..bacaf1b 100644
--- a/drivers/gpu/drm/panel/panel-tpo-td043mtea1.c
+++ b/drivers/gpu/drm/panel/panel-tpo-td043mtea1.c
@@ -186,7 +186,7 @@ static ssize_t vmirror_show(struct device *dev, struct device_attribute *attr,
 {
 	struct td043mtea1_panel *lcd = dev_get_drvdata(dev);
 
-	return snprintf(buf, PAGE_SIZE, "%d\n", lcd->vmirror);
+	return sysfs_emit(buf, "%d\n", lcd->vmirror);
 }
 
 static ssize_t vmirror_store(struct device *dev, struct device_attribute *attr,
@@ -214,7 +214,7 @@ static ssize_t mode_show(struct device *dev, struct device_attribute *attr,
 {
 	struct td043mtea1_panel *lcd = dev_get_drvdata(dev);
 
-	return snprintf(buf, PAGE_SIZE, "%d\n", lcd->mode);
+	return sysfs_emit(buf, "%d\n", lcd->mode);
 }
 
 static ssize_t mode_store(struct device *dev, struct device_attribute *attr,
-- 
2.7.4

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
