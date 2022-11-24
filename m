Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C613E636F8D
	for <lists+dri-devel@lfdr.de>; Thu, 24 Nov 2022 02:02:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4793510E235;
	Thu, 24 Nov 2022 01:02:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from szxga08-in.huawei.com (szxga08-in.huawei.com [45.249.212.255])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F262E10E235
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Nov 2022 01:02:23 +0000 (UTC)
Received: from kwepemi500012.china.huawei.com (unknown [172.30.72.56])
 by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4NHfpN6sNDz15MrH;
 Thu, 24 Nov 2022 09:01:48 +0800 (CST)
Received: from cgs.huawei.com (10.244.148.83) by
 kwepemi500012.china.huawei.com (7.221.188.12) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Thu, 24 Nov 2022 09:02:20 +0800
From: Gaosheng Cui <cuigaosheng1@huawei.com>
To: <maarten.lankhorst@linux.intel.com>, <mripard@kernel.org>,
 <tzimmermann@suse.de>, <airlied@gmail.com>, <daniel@ffwll.ch>,
 <chris@chris-wilson.co.uk>, <alexander.deucher@amd.com>, <airlied@linux.ie>,
 <cuigaosheng1@huawei.com>
Subject: [PATCH] drm: Fix possible memleak and UAF in drm_addmap_core()
Date: Thu, 24 Nov 2022 09:02:19 +0800
Message-ID: <20221124010219.2653190-1-cuigaosheng1@huawei.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.244.148.83]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 kwepemi500012.china.huawei.com (7.221.188.12)
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The dma_free_coherent() should be called when memory fails to
be allocated for list, or drm_map_handle() fails, otherwise there
will be a memory leak, so add dma_free_coherent to fix it.

In addition, if drm_map_handle() fails in drm_addmap_core(), list
will be freed, but list->head will not be removed from dev->map_list,
then list traversal may cause UAF, fix it by removeing it from
dev->map_list before kfree().

Fixes: 8e4ff9b56957 ("drm: Remove the dma_alloc_coherent wrapper for internal usage")
Fixes: 8d153f7107ff ("drm: update user token hashing and map handles")
Signed-off-by: Gaosheng Cui <cuigaosheng1@huawei.com>
---
 drivers/gpu/drm/drm_bufs.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/gpu/drm/drm_bufs.c b/drivers/gpu/drm/drm_bufs.c
index fcca21e8efac..3b9563194715 100644
--- a/drivers/gpu/drm/drm_bufs.c
+++ b/drivers/gpu/drm/drm_bufs.c
@@ -344,6 +344,8 @@ static int drm_addmap_core(struct drm_device *dev, resource_size_t offset,
 	if (!list) {
 		if (map->type == _DRM_REGISTERS)
 			iounmap(map->handle);
+		if (map->type == _DRM_CONSISTENT)
+			dma_free_coherent(dev->dev, map->size, map->handle, map->offset);
 		kfree(map);
 		return -EINVAL;
 	}
@@ -361,7 +363,10 @@ static int drm_addmap_core(struct drm_device *dev, resource_size_t offset,
 	if (ret) {
 		if (map->type == _DRM_REGISTERS)
 			iounmap(map->handle);
+		if (map->type == _DRM_CONSISTENT)
+			dma_free_coherent(dev->dev, map->size, map->handle, map->offset);
 		kfree(map);
+		list_del(&list->head);
 		kfree(list);
 		mutex_unlock(&dev->struct_mutex);
 		return ret;
-- 
2.25.1

