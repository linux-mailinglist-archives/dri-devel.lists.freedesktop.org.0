Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B747431E13
	for <lists+dri-devel@lfdr.de>; Mon, 18 Oct 2021 15:55:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C555E6E0C6;
	Mon, 18 Oct 2021 13:55:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 65F236E0C6
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Oct 2021 13:55:27 +0000 (UTC)
Received: from dggemv704-chm.china.huawei.com (unknown [172.30.72.56])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4HXyyW1K8yzZcJQ;
 Mon, 18 Oct 2021 21:53:39 +0800 (CST)
Received: from kwepemm600001.china.huawei.com (7.193.23.3) by
 dggemv704-chm.china.huawei.com (10.3.19.47) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.15; Mon, 18 Oct 2021 21:55:23 +0800
Received: from huawei.com (10.175.104.82) by kwepemm600001.china.huawei.com
 (7.193.23.3) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.15; Mon, 18 Oct
 2021 21:55:22 +0800
From: Wang Hai <wanghai38@huawei.com>
To: <maarten.lankhorst@linux.intel.com>, <mripard@kernel.org>,
 <tzimmermann@suse.de>, <airlied@linux.ie>, <daniel@ffwll.ch>,
 <sam@ravnborg.org>
CC: <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH] drm: fix null-ptr-deref in drm_minor_alloc_release
Date: Mon, 18 Oct 2021 21:54:28 +0800
Message-ID: <20211018135428.3971329-1-wanghai38@huawei.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.175.104.82]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 kwepemm600001.china.huawei.com (7.193.23.3)
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

I got a null-ptr-deref report:

BUG: kernel NULL pointer dereference, address: 0000000000000030
...
RIP: 0010:kobject_put+0x2a/0x180
...
Call Trace:
 put_device+0x25/0x30
 drm_minor_alloc_release.cold+0x45/0x7f [drm]
 drm_managed_release+0x158/0x2d0 [drm]
 drm_dev_init+0x3a7/0x4a0 [drm]
 __devm_drm_dev_alloc+0x55/0xd0 [drm]
 mi0283qt_probe+0x8a/0x2b5 [mi0283qt]
 spi_probe+0xeb/0x130
...
 entry_SYSCALL_64_after_hwframe+0x44/0xae

If drm_sysfs_minor_alloc() fails in drm_minor_alloc(), minor->kdev will
point to PTR_ERR(...) instead of NULL. This will result in null-ptr-deref
when put_device(minor->kdev) is called.

drm_dev_init()
	drm_minor_alloc()
		drm_sysfs_minor_alloc(); // fail, minor->kdev = PTR_ERR(...)
	drm_managed_release()
		drm_minor_alloc_release()
			put_device(minor->kdev); // access non-existent kdev

Define a temp variable and assign it to minor->kdev if the temp variable
is not PTR_ERR.

Fixes: f96306f9892b ("drm: manage drm_minor cleanup with drmm_")
Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: Wang Hai <wanghai38@huawei.com>
---
 drivers/gpu/drm/drm_drv.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/drm_drv.c b/drivers/gpu/drm/drm_drv.c
index b3a1636d1b98..b302536edbce 100644
--- a/drivers/gpu/drm/drm_drv.c
+++ b/drivers/gpu/drm/drm_drv.c
@@ -112,6 +112,7 @@ static int drm_minor_alloc(struct drm_device *dev, unsigned int type)
 {
 	struct drm_minor *minor;
 	unsigned long flags;
+	struct device *kdev;
 	int r;
 
 	minor = drmm_kzalloc(dev, sizeof(*minor), GFP_KERNEL);
@@ -140,9 +141,11 @@ static int drm_minor_alloc(struct drm_device *dev, unsigned int type)
 	if (r)
 		return r;
 
-	minor->kdev = drm_sysfs_minor_alloc(minor);
-	if (IS_ERR(minor->kdev))
-		return PTR_ERR(minor->kdev);
+	kdev = drm_sysfs_minor_alloc(minor);
+	if (IS_ERR(kdev))
+		return PTR_ERR(kdev);
+
+	minor->kdev = kdev;
 
 	*drm_minor_get_slot(dev, type) = minor;
 	return 0;
-- 
2.25.1

