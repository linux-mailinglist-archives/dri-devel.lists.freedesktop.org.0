Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 48318393DA8
	for <lists+dri-devel@lfdr.de>; Fri, 28 May 2021 09:22:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 39CB86F583;
	Fri, 28 May 2021 07:22:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 687886F583
 for <dri-devel@lists.freedesktop.org>; Fri, 28 May 2021 07:22:12 +0000 (UTC)
Received: from dggeml766-chm.china.huawei.com (unknown [172.30.72.53])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4FrwzR576Zz66WK;
 Fri, 28 May 2021 15:19:15 +0800 (CST)
Received: from dggema769-chm.china.huawei.com (10.1.198.211) by
 dggeml766-chm.china.huawei.com (10.1.199.176) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2176.2; Fri, 28 May 2021 15:22:09 +0800
Received: from localhost (10.174.179.215) by dggema769-chm.china.huawei.com
 (10.1.198.211) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Fri, 28
 May 2021 15:22:08 +0800
From: YueHaibing <yuehaibing@huawei.com>
To: <inki.dae@samsung.com>, <jy0922.shim@samsung.com>,
 <sw0312.kim@samsung.com>, <kyungmin.park@samsung.com>, <airlied@linux.ie>,
 <daniel@ffwll.ch>, <krzysztof.kozlowski@canonical.com>,
 <yuehaibing@huawei.com>
Subject: [PATCH -next] drm/exynos-vidi: use DEVICE_ATTR_RW macro
Date: Fri, 28 May 2021 15:21:20 +0800
Message-ID: <20210528072120.21332-1-yuehaibing@huawei.com>
X-Mailer: git-send-email 2.10.2.windows.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.174.179.215]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 dggema769-chm.china.huawei.com (10.1.198.211)
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
Cc: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Use DEVICE_ATTR_RW() helper instead of plain DEVICE_ATTR(),
which makes the code a bit shorter and easier to read.

Signed-off-by: YueHaibing <yuehaibing@huawei.com>
---
 drivers/gpu/drm/exynos/exynos_drm_vidi.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_vidi.c b/drivers/gpu/drm/exynos/exynos_drm_vidi.c
index e5662bdcbbde..a3a95a2c0bae 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_vidi.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_vidi.c
@@ -165,8 +165,8 @@ static void vidi_fake_vblank_timer(struct timer_list *t)
 			jiffies + msecs_to_jiffies(VIDI_REFRESH_TIME) - 1);
 }
 
-static ssize_t vidi_show_connection(struct device *dev,
-				struct device_attribute *attr, char *buf)
+static ssize_t connection_show(struct device *dev,
+			       struct device_attribute *attr, char *buf)
 {
 	struct vidi_context *ctx = dev_get_drvdata(dev);
 	int rc;
@@ -180,7 +180,7 @@ static ssize_t vidi_show_connection(struct device *dev,
 	return rc;
 }
 
-static ssize_t vidi_store_connection(struct device *dev,
+static ssize_t connection_store(struct device *dev,
 				struct device_attribute *attr,
 				const char *buf, size_t len)
 {
@@ -211,8 +211,7 @@ static ssize_t vidi_store_connection(struct device *dev,
 	return len;
 }
 
-static DEVICE_ATTR(connection, 0644, vidi_show_connection,
-			vidi_store_connection);
+static DEVICE_ATTR_RW(connection);
 
 static struct attribute *vidi_attrs[] = {
 	&dev_attr_connection.attr,
-- 
2.17.1

