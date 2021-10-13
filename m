Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 37D8142C7B9
	for <lists+dri-devel@lfdr.de>; Wed, 13 Oct 2021 19:35:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C82816E0EA;
	Wed, 13 Oct 2021 17:35:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 963 seconds by postgrey-1.36 at gabe;
 Wed, 13 Oct 2021 11:58:37 UTC
Received: from szxga08-in.huawei.com (szxga08-in.huawei.com [45.249.212.255])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C5FD06EA2F
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Oct 2021 11:58:37 +0000 (UTC)
Received: from dggemv703-chm.china.huawei.com (unknown [172.30.72.55])
 by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4HTrFf2Mvjz1DHNt;
 Wed, 13 Oct 2021 19:40:54 +0800 (CST)
Received: from kwepemm600001.china.huawei.com (7.193.23.3) by
 dggemv703-chm.china.huawei.com (10.3.19.46) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.8; Wed, 13 Oct 2021 19:42:31 +0800
Received: from huawei.com (10.175.104.82) by kwepemm600001.china.huawei.com
 (7.193.23.3) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.8; Wed, 13 Oct
 2021 19:42:30 +0800
From: Wang Hai <wanghai38@huawei.com>
To: <maarten.lankhorst@linux.intel.com>, <mripard@kernel.org>,
 <tzimmermann@suse.de>, <airlied@linux.ie>, <daniel@ffwll.ch>,
 <sam@ravnborg.org>
CC: <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH] drm: fix null-ptr-deref in drm_dev_init_release()
Date: Wed, 13 Oct 2021 19:41:39 +0800
Message-ID: <20211013114139.4042207-1-wanghai38@huawei.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.175.104.82]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 kwepemm600001.china.huawei.com (7.193.23.3)
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Wed, 13 Oct 2021 17:35:42 +0000
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

[drm:drm_dev_init [drm]] *ERROR* Cannot allocate anonymous inode: -12
==================================================================
BUG: KASAN: null-ptr-deref in iput+0x3c/0x4a0
...
Call Trace:
 dump_stack_lvl+0x6c/0x8b
 kasan_report.cold+0x64/0xdb
 __asan_load8+0x69/0x90
 iput+0x3c/0x4a0
 drm_dev_init_release+0x39/0xb0 [drm]
 drm_managed_release+0x158/0x2d0 [drm]
 drm_dev_init+0x3a7/0x4c0 [drm]
 __devm_drm_dev_alloc+0x55/0xd0 [drm]
 mi0283qt_probe+0x8a/0x2b5 [mi0283qt]
 spi_probe+0xeb/0x130
...
 entry_SYSCALL_64_after_hwframe+0x44/0xae

If drm_fs_inode_new() fails in drm_dev_init(), dev->anon_inode will point
to PTR_ERR(...) instead of NULL. This will result in null-ptr-deref when
drm_fs_inode_free(dev->anon_inode) is called.

drm_dev_init()
	drm_fs_inode_new() // fail, dev->anon_inode = PTR_ERR(...)
	drm_managed_release()
		drm_dev_init_release()
			drm_fs_inode_free() // access non-existent anon_inode

Define a temp variable and assign it to dev->anon_inode if the temp
variable is not PTR_ERR.

Fixes: 2cbf7fc6718b ("drm: Use drmm_ for drm_dev_init cleanup")
Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: Wang Hai <wanghai38@huawei.com>
---
 drivers/gpu/drm/drm_drv.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/drm_drv.c b/drivers/gpu/drm/drm_drv.c
index 7a5097467ba5..b3a1636d1b98 100644
--- a/drivers/gpu/drm/drm_drv.c
+++ b/drivers/gpu/drm/drm_drv.c
@@ -581,6 +581,7 @@ static int drm_dev_init(struct drm_device *dev,
 			const struct drm_driver *driver,
 			struct device *parent)
 {
+	struct inode *inode;
 	int ret;
 
 	if (!drm_core_init_complete) {
@@ -617,13 +618,15 @@ static int drm_dev_init(struct drm_device *dev,
 	if (ret)
 		return ret;
 
-	dev->anon_inode = drm_fs_inode_new();
-	if (IS_ERR(dev->anon_inode)) {
-		ret = PTR_ERR(dev->anon_inode);
+	inode = drm_fs_inode_new();
+	if (IS_ERR(inode)) {
+		ret = PTR_ERR(inode);
 		DRM_ERROR("Cannot allocate anonymous inode: %d\n", ret);
 		goto err;
 	}
 
+	dev->anon_inode = inode;
+
 	if (drm_core_check_feature(dev, DRIVER_RENDER)) {
 		ret = drm_minor_alloc(dev, DRM_MINOR_RENDER);
 		if (ret)
-- 
2.25.1

