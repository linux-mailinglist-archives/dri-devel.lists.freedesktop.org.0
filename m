Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 687AE47BF11
	for <lists+dri-devel@lfdr.de>; Tue, 21 Dec 2021 12:41:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C23510FFAB;
	Tue, 21 Dec 2021 11:40:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com
 [185.176.79.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 567EC10FFA9
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Dec 2021 11:40:58 +0000 (UTC)
Received: from fraeml714-chm.china.huawei.com (unknown [172.18.147.207])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4JJDx02Q80z67Mdm;
 Tue, 21 Dec 2021 19:38:28 +0800 (CST)
Received: from roberto-ThinkStation-P620.huawei.com (10.204.63.22) by
 fraeml714-chm.china.huawei.com (10.206.15.33) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Tue, 21 Dec 2021 12:40:54 +0100
From: Roberto Sassu <roberto.sassu@huawei.com>
To: <maarten.lankhorst@linux.intel.com>, <mripard@kernel.org>,
 <tzimmermann@suse.de>, <airlied@linux.ie>, <daniel@ffwll.ch>
Subject: [PATCH] drm: Fix gem obj imbalance due to calling
 drm_gem_object_put() twice
Date: Tue, 21 Dec 2021 12:38:37 +0100
Message-ID: <20211221113837.1607448-1-roberto.sassu@huawei.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.204.63.22]
X-ClientProxiedBy: lhreml752-chm.china.huawei.com (10.201.108.202) To
 fraeml714-chm.china.huawei.com (10.206.15.33)
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
Cc: stable@vger.kernel.org,
 syzbot+c8ae65286134dd1b800d@syzkaller.appspotmail.com,
 Roberto Sassu <roberto.sassu@huawei.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

After commit 9786b65bc61ac ("drm/ttm: fix mmap refcounting"),
drm_gem_mmap_obj() takes a reference of the passed drm_gem_object at the
beginning of the function to safely dereference the mmap offset pointer,
and releases it at the end, if an error occurred. However, the cma and
shmem helpers are also releasing that reference in case of an error,
which causes the imbalance of the reference counter and the panic
reported by syzbot.

Don't release the reference in drm_gem_mmap_obj() if the mmap method was
called and it returned an error, and uniformly apply the same behavior of
the cma and shmem helpers to the ttm helper (release the reference in the
helper, not in the caller, when an error occurs).

Cc: stable@vger.kernel.org
Signed-off-by: Roberto Sassu <roberto.sassu@huawei.com>
Reported-by: syzbot+c8ae65286134dd1b800d@syzkaller.appspotmail.com
Fixes: 9786b65bc61ac ("drm/ttm: fix mmap refcounting")
---
 drivers/gpu/drm/drm_gem.c            | 3 ++-
 drivers/gpu/drm/drm_gem_ttm_helper.c | 4 +---
 2 files changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/drm_gem.c b/drivers/gpu/drm/drm_gem.c
index 4dcdec6487bb..7264a1a7a8d2 100644
--- a/drivers/gpu/drm/drm_gem.c
+++ b/drivers/gpu/drm/drm_gem.c
@@ -1049,8 +1049,9 @@ int drm_gem_mmap_obj(struct drm_gem_object *obj, unsigned long obj_size,
 
 	if (obj->funcs->mmap) {
 		ret = obj->funcs->mmap(obj, vma);
+		/* All helpers call drm_gem_object_put() */
 		if (ret)
-			goto err_drm_gem_object_put;
+			return ret;
 		WARN_ON(!(vma->vm_flags & VM_DONTEXPAND));
 	} else {
 		if (!vma->vm_ops) {
diff --git a/drivers/gpu/drm/drm_gem_ttm_helper.c b/drivers/gpu/drm/drm_gem_ttm_helper.c
index ecf3d2a54a98..c44bfdbb722d 100644
--- a/drivers/gpu/drm/drm_gem_ttm_helper.c
+++ b/drivers/gpu/drm/drm_gem_ttm_helper.c
@@ -101,8 +101,6 @@ int drm_gem_ttm_mmap(struct drm_gem_object *gem,
 	int ret;
 
 	ret = ttm_bo_mmap_obj(vma, bo);
-	if (ret < 0)
-		return ret;
 
 	/*
 	 * ttm has its own object refcounting, so drop gem reference
@@ -110,7 +108,7 @@ int drm_gem_ttm_mmap(struct drm_gem_object *gem,
 	 */
 	drm_gem_object_put(gem);
 
-	return 0;
+	return ret;
 }
 EXPORT_SYMBOL(drm_gem_ttm_mmap);
 
-- 
2.32.0

