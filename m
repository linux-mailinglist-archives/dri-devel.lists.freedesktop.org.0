Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B063962D411
	for <lists+dri-devel@lfdr.de>; Thu, 17 Nov 2022 08:29:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4AC8A10E553;
	Thu, 17 Nov 2022 07:29:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9217C10E021
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Nov 2022 04:53:09 +0000 (UTC)
Received: from dggemv703-chm.china.huawei.com (unknown [172.30.72.55])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4NCSG50NLtzRp1W;
 Thu, 17 Nov 2022 12:52:45 +0800 (CST)
Received: from kwepemm600014.china.huawei.com (7.193.23.54) by
 dggemv703-chm.china.huawei.com (10.3.19.46) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Thu, 17 Nov 2022 12:53:05 +0800
Received: from ubuntu1804.huawei.com (10.67.175.28) by
 kwepemm600014.china.huawei.com (7.193.23.54) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Thu, 17 Nov 2022 12:53:05 +0800
From: Yi Yang <yiyang13@huawei.com>
To: <maarten.lankhorst@linux.intel.com>, <mripard@kernel.org>,
 <tzimmermann@suse.de>, <airlied@gmail.com>, <daniel@ffwll.ch>,
 <eric@anholt.net>, <yiyang13@huawei.com>
Subject: [PATCH] drm: Fix possible UAF in drm_addmap_core
Date: Thu, 17 Nov 2022 12:49:54 +0800
Message-ID: <20221117044954.26277-1-yiyang13@huawei.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.67.175.28]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 kwepemm600014.china.huawei.com (7.193.23.54)
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Thu, 17 Nov 2022 07:29:39 +0000
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

smatch report warning as follows:

drivers/gpu/drm/drm_bufs.c:365 drm_addmap_core() warn:
 '&list->head' not removed from list

If drm_map_handle() fails in drm_addmap_core(), the list will be
freed, but the list->head will not be removed from dev->maplist,
then list traversal may cause UAF.

Fix by removeing it from list->head before free().

Fixes: 9a298b2acd77 ("drm: Remove memory debugging infrastructure.")
Signed-off-by: Yi Yang <yiyang13@huawei.com>
---
 drivers/gpu/drm/drm_bufs.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/drm_bufs.c b/drivers/gpu/drm/drm_bufs.c
index fcca21e8efac..e739e577902c 100644
--- a/drivers/gpu/drm/drm_bufs.c
+++ b/drivers/gpu/drm/drm_bufs.c
@@ -362,6 +362,7 @@ static int drm_addmap_core(struct drm_device *dev, resource_size_t offset,
 		if (map->type == _DRM_REGISTERS)
 			iounmap(map->handle);
 		kfree(map);
+		list_del(&list->head);
 		kfree(list);
 		mutex_unlock(&dev->struct_mutex);
 		return ret;
-- 
2.17.1

