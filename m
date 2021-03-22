Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FCC2343630
	for <lists+dri-devel@lfdr.de>; Mon, 22 Mar 2021 02:19:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 12F8D89169;
	Mon, 22 Mar 2021 01:19:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from szxga06-in.huawei.com (szxga06-in.huawei.com [45.249.212.32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 08B7389169
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Mar 2021 01:19:08 +0000 (UTC)
Received: from DGGEMS402-HUB.china.huawei.com (unknown [172.30.72.60])
 by szxga06-in.huawei.com (SkyGuard) with ESMTP id 4F3c6v5vvDzkZFg;
 Mon, 22 Mar 2021 09:17:27 +0800 (CST)
Received: from localhost.localdomain (10.69.192.56) by
 DGGEMS402-HUB.china.huawei.com (10.3.19.202) with Microsoft SMTP Server id
 14.3.498.0; Mon, 22 Mar 2021 09:19:01 +0800
From: Tian Tao <tiantao6@hisilicon.com>
To: <maarten.lankhorst@linux.intel.com>, <mripard@kernel.org>,
 <tzimmermann@suse.de>, <airlied@linux.ie>, <daniel@ffwll.ch>
Subject: [PATCH] drm/sysfs: Convert sysfs sprintf/snprintf family to sysfs_emit
Date: Mon, 22 Mar 2021 09:19:38 +0800
Message-ID: <1616375978-12151-1-git-send-email-tiantao6@hisilicon.com>
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
drivers/gpu/drm/drm_sysfs.c:172:8-16: WARNING: use scnprintf or sprintf
drivers/gpu/drm/drm_sysfs.c:185:8-16: WARNING: use scnprintf or sprintf
drivers/gpu/drm/drm_sysfs.c:159:8-16: WARNING: use scnprintf or sprintf

Signed-off-by: Tian Tao <tiantao6@hisilicon.com>
---
 drivers/gpu/drm/drm_sysfs.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/drm_sysfs.c b/drivers/gpu/drm/drm_sysfs.c
index f0336c8..968a956 100644
--- a/drivers/gpu/drm/drm_sysfs.c
+++ b/drivers/gpu/drm/drm_sysfs.c
@@ -156,8 +156,8 @@ static ssize_t status_show(struct device *device,
 
 	status = READ_ONCE(connector->status);
 
-	return snprintf(buf, PAGE_SIZE, "%s\n",
-			drm_get_connector_status_name(status));
+	return sysfs_emit(buf, "%s\n",
+			  drm_get_connector_status_name(status));
 }
 
 static ssize_t dpms_show(struct device *device,
@@ -169,8 +169,7 @@ static ssize_t dpms_show(struct device *device,
 
 	dpms = READ_ONCE(connector->dpms);
 
-	return snprintf(buf, PAGE_SIZE, "%s\n",
-			drm_get_dpms_name(dpms));
+	return sysfs_emit(buf, "%s\n", drm_get_dpms_name(dpms));
 }
 
 static ssize_t enabled_show(struct device *device,
@@ -182,7 +181,7 @@ static ssize_t enabled_show(struct device *device,
 
 	enabled = READ_ONCE(connector->encoder);
 
-	return snprintf(buf, PAGE_SIZE, enabled ? "enabled\n" : "disabled\n");
+	return sysfs_emit(buf, enabled ? "enabled\n" : "disabled\n");
 }
 
 static ssize_t edid_show(struct file *filp, struct kobject *kobj,
-- 
2.7.4

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
