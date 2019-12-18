Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EF85A12414D
	for <lists+dri-devel@lfdr.de>; Wed, 18 Dec 2019 09:13:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 878196EA41;
	Wed, 18 Dec 2019 08:13:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from huawei.com (szxga05-in.huawei.com [45.249.212.191])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C80846E223;
 Wed, 18 Dec 2019 04:06:39 +0000 (UTC)
Received: from DGGEMS407-HUB.china.huawei.com (unknown [172.30.72.60])
 by Forcepoint Email with ESMTP id DBD97CB89925F0697028;
 Wed, 18 Dec 2019 11:50:28 +0800 (CST)
Received: from huawei.com (10.175.127.16) by DGGEMS407-HUB.china.huawei.com
 (10.3.19.207) with Microsoft SMTP Server id 14.3.439.0; Wed, 18 Dec 2019
 11:50:18 +0800
From: Pan Zhang <zhangpan26@huawei.com>
To: <zhangpan26@huawei.com>, <hushiyuan@huawei.com>,
 <alexander.deucher@amd.com>, <christian.koenig@amd.com>,
 <David1.Zhou@amd.com>, <airlied@linux.ie>, <daniel@ffwll.ch>,
 <ray.huang@amd.com>, <irmoy.das@amd.com>, <sam@ravnborg.org>
Subject: [PATCH 2/3] gpu: drm: dead code elimination
Date: Wed, 18 Dec 2019 11:50:00 +0800
Message-ID: <1576641000-14772-1-git-send-email-zhangpan26@huawei.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [10.175.127.16]
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Wed, 18 Dec 2019 08:13:02 +0000
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
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

this set adds support for removal of gpu drm dead code.

patch2:
`num_entries` is a data of unsigned type(compilers always treat as unsigned int) and SIZE_MAX == ~0,

so there is a impossible condition:
'(num_entries > ((~0) - 56) / 72) => (max(0-u32) > 256204778801521549)'.

Signed-off-by: Pan Zhang <zhangpan26@huawei.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_bo_list.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_bo_list.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_bo_list.c
index 85b0515..10a7f30 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_bo_list.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_bo_list.c
@@ -71,10 +71,6 @@ int amdgpu_bo_list_create(struct amdgpu_device *adev, struct drm_file *filp,
 	unsigned i;
 	int r;
 
-	if (num_entries > (SIZE_MAX - sizeof(struct amdgpu_bo_list))
-				/ sizeof(struct amdgpu_bo_list_entry))
-		return -EINVAL;
-
 	size = sizeof(struct amdgpu_bo_list);
 	size += num_entries * sizeof(struct amdgpu_bo_list_entry);
 	list = kvmalloc(size, GFP_KERNEL);
-- 
2.7.4

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
