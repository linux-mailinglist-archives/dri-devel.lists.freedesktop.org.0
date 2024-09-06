Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E98D96E766
	for <lists+dri-devel@lfdr.de>; Fri,  6 Sep 2024 03:54:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9EBEE10E87F;
	Fri,  6 Sep 2024 01:54:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 66DC910E87F;
 Fri,  6 Sep 2024 01:54:03 +0000 (UTC)
Received: from mail.maildlp.com (unknown [172.19.163.252])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4X0K4X25L9zyRCD;
 Fri,  6 Sep 2024 09:53:00 +0800 (CST)
Received: from kwepemh500013.china.huawei.com (unknown [7.202.181.146])
 by mail.maildlp.com (Postfix) with ESMTPS id 1BD5C180AE8;
 Fri,  6 Sep 2024 09:54:00 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemh500013.china.huawei.com
 (7.202.181.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Fri, 6 Sep
 2024 09:53:59 +0800
From: Jinjie Ruan <ruanjinjie@huawei.com>
To: <alexander.deucher@amd.com>, <christian.koenig@amd.com>,
 <Xinhui.Pan@amd.com>, <airlied@gmail.com>, <daniel@ffwll.ch>,
 <mario.limonciello@amd.com>, <lijo.lazar@amd.com>, <le.ma@amd.com>,
 <Jun.Ma2@amd.com>, <hamza.mahfooz@amd.com>, <andrealmeid@igalia.com>,
 <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <tglx@linutronix.de>
CC: <ruanjinjie@huawei.com>
Subject: [PATCH] drm/amdgpu: Fix incorrect resource realease in amdgpu_init()
Date: Fri, 6 Sep 2024 10:02:33 +0800
Message-ID: <20240906020233.272405-1-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.90.53.73]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 kwepemh500013.china.huawei.com (7.202.181.146)
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

If pci_register_driver() fails, amdgpu_sync_slab and amdgpu_fence_slab
should be freed in the error path, fix it.

Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
Suggested-by: Thomas Gleixner <tglx@linutronix.de>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
index 094498a0964b..3e73306a883d 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
@@ -3046,7 +3046,14 @@ static int __init amdgpu_init(void)
 	amdgpu_amdkfd_init();
 
 	/* let modprobe override vga console setting */
-	return pci_register_driver(&amdgpu_kms_pci_driver);
+	r = pci_register_driver(&amdgpu_kms_pci_driver);
+	if (r)
+		goto error_pci_register;
+
+	return 0;
+
+error_pci_register:
+	amdgpu_fence_slab_fini();
 
 error_fence:
 	amdgpu_sync_fini();
-- 
2.34.1

