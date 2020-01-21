Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 62485144D51
	for <lists+dri-devel@lfdr.de>; Wed, 22 Jan 2020 09:21:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2DF386FAE6;
	Wed, 22 Jan 2020 08:21:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from huawei.com (szxga04-in.huawei.com [45.249.212.190])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 58CD86FAE1;
 Tue, 21 Jan 2020 14:01:20 +0000 (UTC)
Received: from DGGEMS413-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id 327131CA956AD12FCC62;
 Tue, 21 Jan 2020 22:01:07 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.175.113.25) by
 DGGEMS413-HUB.china.huawei.com (10.3.19.213) with Microsoft SMTP Server id
 14.3.439.0; Tue, 21 Jan 2020 22:00:58 +0800
From: Chen Zhou <chenzhou10@huawei.com>
To: <alexander.deucher@amd.com>, <christian.koenig@amd.com>,
 <David1.Zhou@amd.com>, <airlied@linux.ie>, <daniel@ffwll.ch>
Subject: [PATCH -next 11/14] drm/amdgpu: remove unnecessary conversion to bool
 in amdgpu_device.c
Date: Tue, 21 Jan 2020 21:55:37 +0800
Message-ID: <20200121135540.165798-12-chenzhou10@huawei.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200121135540.165798-1-chenzhou10@huawei.com>
References: <20200121135540.165798-1-chenzhou10@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.175.113.25]
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Wed, 22 Jan 2020 08:21:10 +0000
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
Cc: chenzhou10@huawei.com, Felix.Kuehling@amd.com, tao.zhou1@amd.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, Hawking.Zhang@amd.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fixes coccicheck warning:

./drivers/gpu/drm/amd/amdgpu/amdgpu_device.c:2883:68-73: WARNING:
	conversion to bool not needed here

and many more similar messages.

Signed-off-by: Chen Zhou <chenzhou10@huawei.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
index 1f0e6b9..29b54d4 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
@@ -986,7 +986,7 @@ static void amdgpu_device_check_vm_size(struct amdgpu_device *adev)
 static void amdgpu_device_check_smu_prv_buffer_size(struct amdgpu_device *adev)
 {
 	struct sysinfo si;
-	bool is_os_64 = (sizeof(void *) == 8) ? true : false;
+	bool is_os_64 = sizeof(void *) == 8;
 	uint64_t total_memory;
 	uint64_t dram_size_seven_GB = 0x1B8000000;
 	uint64_t dram_size_three_GB = 0xB8000000;
@@ -2881,7 +2881,7 @@ int amdgpu_device_init(struct amdgpu_device *adev,
 	INIT_WORK(&adev->xgmi_reset_work, amdgpu_device_xgmi_reset_func);
 
 	adev->gfx.gfx_off_req_count = 1;
-	adev->pm.ac_power = power_supply_is_system_supplied() > 0 ? true : false;
+	adev->pm.ac_power = power_supply_is_system_supplied() > 0;
 
 	/* Registers mapping */
 	/* TODO: block userspace mapping of io register */
@@ -3999,9 +3999,7 @@ int amdgpu_device_gpu_recover(struct amdgpu_device *adev,
 	struct amdgpu_device *tmp_adev = NULL;
 	int i, r = 0;
 	bool in_ras_intr = amdgpu_ras_intr_triggered();
-	bool use_baco =
-		(amdgpu_asic_reset_method(adev) == AMD_RESET_METHOD_BACO) ?
-		true : false;
+	bool use_baco = amdgpu_asic_reset_method(adev) == AMD_RESET_METHOD_BACO;
 
 	/*
 	 * Flush RAM to disk so that after reboot
-- 
2.7.4

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
