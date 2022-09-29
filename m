Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E69925EF720
	for <lists+dri-devel@lfdr.de>; Thu, 29 Sep 2022 16:04:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D22510E2B0;
	Thu, 29 Sep 2022 14:04:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from szxga08-in.huawei.com (szxga08-in.huawei.com [45.249.212.255])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BDD3310E2B0;
 Thu, 29 Sep 2022 14:04:24 +0000 (UTC)
Received: from dggpemm500021.china.huawei.com (unknown [172.30.72.56])
 by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4MdZk91psTz1P6th;
 Thu, 29 Sep 2022 22:00:01 +0800 (CST)
Received: from dggpemm500007.china.huawei.com (7.185.36.183) by
 dggpemm500021.china.huawei.com (7.185.36.109) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Thu, 29 Sep 2022 22:04:18 +0800
Received: from huawei.com (10.175.103.91) by dggpemm500007.china.huawei.com
 (7.185.36.183) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.31; Thu, 29 Sep
 2022 22:04:18 +0800
From: Yang Yingliang <yangyingliang@huawei.com>
To: <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>
Subject: [PATCH -next] drm/amdgpu/sdma: add missing release_firmware() in
 amdgpu_sdma_init_microcode()
Date: Thu, 29 Sep 2022 22:20:15 +0800
Message-ID: <20220929142015.746674-1-yangyingliang@huawei.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.175.103.91]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 dggpemm500007.china.huawei.com (7.185.36.183)
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
Cc: alexander.deucher@amd.com, Likun.Gao@amd.com, yangyingliang@huawei.com,
 Hawking.Zhang@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

In some error path in amdgpu_sdma_init_microcode(), release_firmware() is
not called, the memory allocated in request_firmware() will be leaked,
calling amdgpu_sdma_destroy_inst_ctx() which calls release_firmware() to
avoid memory leak.

Fixes: 60704abdddd9 ("drm/amdgpu: add function to init SDMA microcode")
Signed-off-by: Yang Yingliang <yangyingliang@huawei.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_sdma.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_sdma.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_sdma.c
index 3949b7e3907f..43cf8632cc1a 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_sdma.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_sdma.c
@@ -222,8 +222,10 @@ int amdgpu_sdma_init_microcode(struct amdgpu_device *adev,
 		adev->sdma.instance[instance].fw->data;
 	version_major = le16_to_cpu(header->header_version_major);
 
-	if ((duplicate && instance) || (!duplicate && version_major > 1))
-		return -EINVAL;
+	if ((duplicate && instance) || (!duplicate && version_major > 1)) {
+		err = -EINVAL;
+		goto out;
+	}
 
 	err = amdgpu_sdma_init_inst_ctx(&adev->sdma.instance[instance]);
 	if (err)
@@ -272,7 +274,7 @@ int amdgpu_sdma_init_microcode(struct amdgpu_device *adev,
 				ALIGN(le32_to_cpu(sdma_hdr->ctl_ucode_size_bytes), PAGE_SIZE);
 			break;
 		default:
-			return -EINVAL;
+			err = -EINVAL;
 		}
 	}
 
-- 
2.25.1

