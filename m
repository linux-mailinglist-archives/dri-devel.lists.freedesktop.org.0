Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C708B63232A
	for <lists+dri-devel@lfdr.de>; Mon, 21 Nov 2022 14:09:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE46A10E2C7;
	Mon, 21 Nov 2022 13:08:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from szxga08-in.huawei.com (szxga08-in.huawei.com [45.249.212.255])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A580892E0;
 Mon, 21 Nov 2022 13:08:48 +0000 (UTC)
Received: from kwepemi500022.china.huawei.com (unknown [172.30.72.55])
 by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4NG7420Vtrz15Mml;
 Mon, 21 Nov 2022 21:08:18 +0800 (CST)
Received: from huawei.com (10.67.175.34) by kwepemi500022.china.huawei.com
 (7.221.188.64) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.31; Mon, 21 Nov
 2022 21:08:45 +0800
From: Ren Zhijie <renzhijie2@huawei.com>
To: <alexander.deucher@amd.com>, <christian.koenig@amd.com>,
 <airlied@gmail.com>, <daniel@ffwll.ch>
Subject: [PATCH] drm/amdgpu: fix unused-function error
Date: Mon, 21 Nov 2022 13:04:18 +0000
Message-ID: <20221121130418.53267-1-renzhijie2@huawei.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.67.175.34]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 kwepemi500022.china.huawei.com (7.221.188.64)
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
Cc: yusongping@huawei.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, renzhijie2@huawei.com, weiyongjun1@huawei.com,
 amd-gfx@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

If CONFIG_DRM_AMDGPU=y and CONFIG_DRM_AMD_DC is not set,
gcc complained about unused-function :

drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c:1705:13: error: ‘amdgpu_discovery_set_sriov_display’ defined but not used [-Werror=unused-function]
 static void amdgpu_discovery_set_sriov_display(struct amdgpu_device *adev)
             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
cc1: all warnings being treated as errors

To fix this error, use CONFIG_DRM_AMD_DC to wrap
the definition of amdgpu_discovery_set_sriov_display().

Fixes: 25263da37693 ("drm/amdgpu: rework SR-IOV virtual display handling")
Signed-off-by: Ren Zhijie <renzhijie2@huawei.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c
index 6b48178455bc..2509341df92d 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c
@@ -1702,11 +1702,13 @@ static int amdgpu_discovery_set_smu_ip_blocks(struct amdgpu_device *adev)
 	return 0;
 }
 
+#if defined(CONFIG_DRM_AMD_DC)
 static void amdgpu_discovery_set_sriov_display(struct amdgpu_device *adev)
 {
 	amdgpu_device_set_sriov_virtual_display(adev);
 	amdgpu_device_ip_block_add(adev, &amdgpu_vkms_ip_block);
 }
+#endif
 
 static int amdgpu_discovery_set_display_ip_blocks(struct amdgpu_device *adev)
 {
-- 
2.17.1

