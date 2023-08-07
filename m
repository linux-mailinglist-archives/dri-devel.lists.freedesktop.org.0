Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3843D772566
	for <lists+dri-devel@lfdr.de>; Mon,  7 Aug 2023 15:22:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B03189EBB;
	Mon,  7 Aug 2023 13:22:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 956 seconds by postgrey-1.36 at gabe;
 Mon, 07 Aug 2023 13:21:58 UTC
Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C6AA889EBB;
 Mon,  7 Aug 2023 13:21:58 +0000 (UTC)
Received: from dggpemm500002.china.huawei.com (unknown [172.30.72.55])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4RKGjf5Dd1zVk29;
 Mon,  7 Aug 2023 21:04:06 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.175.113.25) by
 dggpemm500002.china.huawei.com (7.185.36.229) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Mon, 7 Aug 2023 21:05:58 +0800
From: Xiongfeng Wang <wangxiongfeng2@huawei.com>
To: <alexander.deucher@amd.com>, <christian.koenig@amd.com>,
 <Xinhui.Pan@amd.com>, <airlied@gmail.com>, <daniel@ffwll.ch>,
 <mario.limonciello@amd.com>, <lijo.lazar@amd.com>, <tim.huang@amd.com>,
 <le.ma@amd.com>, <Bokun.Zhang@amd.com>, <srinivasan.shanmugam@amd.com>
Subject: [PATCH] drm/amd: Use pci_dev_id() to simplify the code
Date: Mon, 7 Aug 2023 21:17:59 +0800
Message-ID: <20230807131759.107914-1-wangxiongfeng2@huawei.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.175.113.25]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 dggpemm500002.china.huawei.com (7.185.36.229)
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
Cc: wangxiongfeng2@huawei.com, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, yangyingliang@huawei.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

PCI core API pci_dev_id() can be used to get the BDF number for a pci
device. We don't need to compose it mannually. Use pci_dev_id() to
simplify the code a little bit.

Signed-off-by: Xiongfeng Wang <wangxiongfeng2@huawei.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c
index 385c6acb5728..aee0cfdc6da3 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c
@@ -706,7 +706,7 @@ int amdgpu_acpi_pcie_performance_request(struct amdgpu_device *adev,
 
 	atcs_input.size = sizeof(struct atcs_pref_req_input);
 	/* client id (bit 2-0: func num, 7-3: dev num, 15-8: bus num) */
-	atcs_input.client_id = adev->pdev->devfn | (adev->pdev->bus->number << 8);
+	atcs_input.client_id = pci_dev_id(adev->pdev);
 	atcs_input.valid_flags_mask = ATCS_VALID_FLAGS_MASK;
 	atcs_input.flags = ATCS_WAIT_FOR_COMPLETION;
 	if (advertise)
@@ -776,7 +776,7 @@ int amdgpu_acpi_power_shift_control(struct amdgpu_device *adev,
 
 	atcs_input.size = sizeof(struct atcs_pwr_shift_input);
 	/* dGPU id (bit 2-0: func num, 7-3: dev num, 15-8: bus num) */
-	atcs_input.dgpu_id = adev->pdev->devfn | (adev->pdev->bus->number << 8);
+	atcs_input.dgpu_id = pci_dev_id(adev->pdev);
 	atcs_input.dev_acpi_state = dev_state;
 	atcs_input.drv_state = drv_state;
 
@@ -1141,7 +1141,7 @@ int amdgpu_acpi_get_tmr_info(struct amdgpu_device *adev, u64 *tmr_offset,
 	if (!tmr_offset || !tmr_size)
 		return -EINVAL;
 
-	bdf = (adev->pdev->bus->number << 8) | adev->pdev->devfn;
+	bdf = pci_dev_id(adev->pdev);
 	dev_info = amdgpu_acpi_get_dev(bdf);
 	if (!dev_info)
 		return -ENOENT;
@@ -1162,7 +1162,7 @@ int amdgpu_acpi_get_mem_info(struct amdgpu_device *adev, int xcc_id,
 	if (!numa_info)
 		return -EINVAL;
 
-	bdf = (adev->pdev->bus->number << 8) | adev->pdev->devfn;
+	bdf = pci_dev_id(adev->pdev);
 	dev_info = amdgpu_acpi_get_dev(bdf);
 	if (!dev_info)
 		return -ENOENT;
-- 
2.20.1

