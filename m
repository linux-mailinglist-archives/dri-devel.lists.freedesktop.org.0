Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 98824296A44
	for <lists+dri-devel@lfdr.de>; Fri, 23 Oct 2020 09:23:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C28E96E4BB;
	Fri, 23 Oct 2020 07:23:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from huawei.com (szxga07-in.huawei.com [45.249.212.35])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 44BCD6E44C
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Oct 2020 02:11:08 +0000 (UTC)
Received: from DGGEMS409-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id 99216345CE1515F6B48B;
 Fri, 23 Oct 2020 10:11:01 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.175.113.25) by
 DGGEMS409-HUB.china.huawei.com (10.3.19.209) with Microsoft SMTP Server id
 14.3.487.0; Fri, 23 Oct 2020 10:10:53 +0800
From: Jing Xiangfeng <jingxiangfeng@huawei.com>
To: <maarten.lankhorst@linux.intel.com>, <mripard@kernel.org>,
 <tzimmermann@suse.de>, <airlied@linux.ie>, <daniel@ffwll.ch>,
 <sam@ravnborg.org>, <andrzej.p@collabora.com>, <a.hajda@samsung.com>,
 <narmstrong@baylibre.com>
Subject: [PATCH] drm: Add the missed device_unregister() in
 drm_sysfs_connector_add()
Date: Fri, 23 Oct 2020 10:16:48 +0800
Message-ID: <20201023021648.39214-1-jingxiangfeng@huawei.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Originating-IP: [10.175.113.25]
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Fri, 23 Oct 2020 07:22:29 +0000
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 jingxiangfeng@huawei.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

drm_sysfs_connector_add() misses to call device_unregister() when
sysfs_create_link() fails to create. Add the missed function call
to fix it.

Fixes: e1a29c6c5955 ("drm: Add ddc link in sysfs created by drm_connector")
Signed-off-by: Jing Xiangfeng <jingxiangfeng@huawei.com>
---
 drivers/gpu/drm/drm_sysfs.c | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/drm_sysfs.c b/drivers/gpu/drm/drm_sysfs.c
index f0336c804639..39e173e10cf7 100644
--- a/drivers/gpu/drm/drm_sysfs.c
+++ b/drivers/gpu/drm/drm_sysfs.c
@@ -274,6 +274,7 @@ static const struct attribute_group *connector_dev_groups[] = {
 int drm_sysfs_connector_add(struct drm_connector *connector)
 {
 	struct drm_device *dev = connector->dev;
+	int ret = 0;
 
 	if (connector->kdev)
 		return 0;
@@ -291,10 +292,16 @@ int drm_sysfs_connector_add(struct drm_connector *connector)
 		return PTR_ERR(connector->kdev);
 	}
 
-	if (connector->ddc)
-		return sysfs_create_link(&connector->kdev->kobj,
+	if (connector->ddc) {
+		ret = sysfs_create_link(&connector->kdev->kobj,
 				 &connector->ddc->dev.kobj, "ddc");
-	return 0;
+		if (ret) {
+			device_unregister(connector->kdev);
+			connector->kdev = NULL;
+		}
+	}
+
+	return ret;
 }
 
 void drm_sysfs_connector_remove(struct drm_connector *connector)
-- 
2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
