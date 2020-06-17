Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AFAB1FEC2B
	for <lists+dri-devel@lfdr.de>; Thu, 18 Jun 2020 09:18:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F8036EAC1;
	Thu, 18 Jun 2020 07:17:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from huawei.com (szxga06-in.huawei.com [45.249.212.32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 251B96E8F8;
 Wed, 17 Jun 2020 10:52:53 +0000 (UTC)
Received: from DGGEMS404-HUB.china.huawei.com (unknown [172.30.72.60])
 by Forcepoint Email with ESMTP id 14886898A01E1CECCB7A;
 Wed, 17 Jun 2020 18:52:48 +0800 (CST)
Received: from huawei.com (10.67.174.156) by DGGEMS404-HUB.china.huawei.com
 (10.3.19.204) with Microsoft SMTP Server id 14.3.487.0; Wed, 17 Jun 2020
 18:52:40 +0800
From: Chen Tao <chentao107@huawei.com>
To: <airlied@linux.ie>, <daniel@ffwll.ch>
Subject: [PATCH v2 1/2] drm/amdgpu/debugfs: fix memory leak when
 pm_runtime_get_sync failed
Date: Wed, 17 Jun 2020 18:51:29 +0800
Message-ID: <20200617105130.207116-1-chentao107@huawei.com>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
X-Originating-IP: [10.67.174.156]
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Thu, 18 Jun 2020 07:17:31 +0000
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
Cc: tom.stdenis@amd.com, Jack.Xiao@amd.com, amd-gfx@lists.freedesktop.org,
 chentao107@huawei.com, dri-devel@lists.freedesktop.org,
 christian.koenig@amd.com, yttao@amd.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fix memory leak in amdgpu_debugfs_gpr_read not freeing data when
pm_runtime_get_sync failed.

Fixes: a9ffe2a983383 ("drm/amdgpu/debugfs: properly handle runtime pm")
Signed-off-by: Chen Tao <chentao107@huawei.com>
---
v1->v2:
 - remove the duplication of result and r here and then use "goto err"

 drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c
index 1a4894fa3693..7993b9eeff38 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c
@@ -863,7 +863,7 @@ static ssize_t amdgpu_debugfs_gpr_read(struct file *f, char __user *buf,
 
 	r = pm_runtime_get_sync(adev->ddev->dev);
 	if (r < 0)
-		return r;
+		goto err;
 
 	r = amdgpu_virt_enable_access_debugfs(adev);
 	if (r < 0)
@@ -893,7 +893,7 @@ static ssize_t amdgpu_debugfs_gpr_read(struct file *f, char __user *buf,
 		value = data[result >> 2];
 		r = put_user(value, (uint32_t *)buf);
 		if (r) {
-			result = r;
+			amdgpu_virt_disable_access_debugfs(adev);
 			goto err;
 		}
 
@@ -902,10 +902,13 @@ static ssize_t amdgpu_debugfs_gpr_read(struct file *f, char __user *buf,
 		size -= 4;
 	}
 
-err:
 	kfree(data);
 	amdgpu_virt_disable_access_debugfs(adev);
 	return result;
+
+err:
+	kfree(data);
+	return r;
 }
 
 /**
-- 
2.22.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
