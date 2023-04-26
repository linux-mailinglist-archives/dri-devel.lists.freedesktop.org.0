Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D15F66EEC20
	for <lists+dri-devel@lfdr.de>; Wed, 26 Apr 2023 03:53:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B7D4210E85F;
	Wed, 26 Apr 2023 01:53:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2046.outbound.protection.outlook.com [40.107.93.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D278210E85A;
 Wed, 26 Apr 2023 01:53:34 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LrIY22a1R1nas76pMQsr3GP0QJVYGyRpNo1MrNdtmq5MLZUGZke0eeUl//JHuPmR0vMlPqMMpqeH15MJOHsacgqx9f6pDVjrMa/Uzn03PH2l25HR4UmX6w7BejTNUE/GkZgzv5snQT3JdSMeRgFHnVUnLeiLxILOih21kAOg9QmSGx69cfhoHxeih85rCW6ko7dSP1zpvUM0ZrEUOLQ7wbEwOIJCXztZl3HFYXxwVEwKJJHpubO/4jsecYa5D+/Ncc4zhSpgIxBoyuV9sgvbu2BFVqPHsh4al+I/r1IttruZjlxkOpVuwZ8btdDuf7/3k7H+lxTOZLgy5Bx1UbsUWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=s8KF3RBhh7gAyaMhhKJtTEG8FmQpurj1kHgGTgvrvew=;
 b=UfRepsSavOunOT43WZfOEZ59GiT/Bx/cbwojts50wTLM/vB9UjDxdpJn41qGySPEEcYo8hOtE7S8Sp8+1MZI3e3al0yC3vjoR8UACdjbs/kqu2RqiVtxhbkJE5j5T/zpU9X+gypZTevKl1ckuIsMtbEaHYtnNPZJZhES7mlgu6F+CF9WLydjAAi3vFWIJPaWybezZoXAhKfNBSQtM3uQRenQURLLAnD4FK5Pcrkgw8/mpL2HJt1ZjkBZcWfK/C7i1bZukbPMilMDtPleETBrIz5Y/vt046xL9CDYb2oLbFlSBMgzY0ZSEGPn4pNUv90HK/Bnm/0eMcbwad8FRZ0FkQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s8KF3RBhh7gAyaMhhKJtTEG8FmQpurj1kHgGTgvrvew=;
 b=F4153ZwEEmIXorKaj2D3hyg1mMbHFlnuiUSfrsf24bE9FKyEI9JwFXOMalEGxdYXK2naIRlsCWg4qyPWIstiaRdwgHZ4hELLjPMGoFomv71UtCCV85Nph/bLWg75is12b7TBcvojlluIaXH+2kHklUE8PM8jnwxK6n+d/AE5vW8=
Received: from DM6PR03CA0069.namprd03.prod.outlook.com (2603:10b6:5:100::46)
 by SA1PR12MB8920.namprd12.prod.outlook.com (2603:10b6:806:38e::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6319.33; Wed, 26 Apr
 2023 01:53:32 +0000
Received: from DM6NAM11FT050.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:100:cafe::54) by DM6PR03CA0069.outlook.office365.com
 (2603:10b6:5:100::46) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6319.34 via Frontend
 Transport; Wed, 26 Apr 2023 01:53:32 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT050.mail.protection.outlook.com (10.13.173.111) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6340.21 via Frontend Transport; Wed, 26 Apr 2023 01:53:32 +0000
Received: from mukjoshi-dev.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Tue, 25 Apr
 2023 20:53:31 -0500
From: Mukul Joshi <mukul.joshi@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
Subject: [PATCH 3/3] drm/amdkfd: Update KFD TTM mem limit
Date: Tue, 25 Apr 2023 21:52:51 -0400
Message-ID: <20230426015251.551223-3-mukul.joshi@amd.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20230426015251.551223-1-mukul.joshi@amd.com>
References: <20230426015251.551223-1-mukul.joshi@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6NAM11FT050:EE_|SA1PR12MB8920:EE_
X-MS-Office365-Filtering-Correlation-Id: 9995e102-0bd5-43ce-3bd0-08db45f90a23
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 57Q1vGeokc7jjWn0c8jJPpXFVbjrvxBbtHuxa5L1H9qRXC0OVqap1IvQcz/4p9tIHFO0GkVFREtFlCCXaU9+43eSHP4onhhddEW6GpLom9QMkqXMazO+6iuuP5B4ghtTnqeG4NCvoDFkwjMtkTnqZn8u73BYoRlKGsROuK1MeMgGWdwrUFeIJaIk0j8/wHfEXYXeoTkNMNXzDRqjwhQY1sDKZXEmIhYENAdEd5oV+SZ7d2S7FPWjI0FxYgxTzvtuQA8BQFXnsBARRl17odn/pfY+1JlJwfgKlGtSeeivasmOncl6LhlntxafafD85MXnXqs/G/xM0mq6Pp/7+rxcsLregneFduVemOc48FbKTI19YAy4pdmHvu7+G9DkF7cwTMQ3o5t3p+f2FyfKrRojWZFtBXclMp7TUMXuKTebLs9UH61c2Iqeab0kDgrw37h0A894ySGBuEIp7t7r6gX+Zo+6Unzn1gr+KBDiILJ9RCRKKEoXaHvZsZWtGlKa7YvuqqdOcx+8aTJnAB8r+9GUhR9DXnoXFORBAwxwrXZo7SUF1/r7PP3DLtXnFd5A+363a92kqs+e8uLrzBJ7vt0PelXzRctzlJVmRZBSLfTC9HHnRUCWrI42OVHUdXQSUdExBEzU1M1pjRV3at8Nx1Yes1KL0u1GC3J9vIWRVdonfYsZjyiKGcXhi5fZpwgs5u+JU7gtorkbOYCXlAOfYjh2+kfRxc7xqHIuydRCWY/5vKQ=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230028)(4636009)(376002)(346002)(136003)(396003)(39860400002)(451199021)(36840700001)(46966006)(40470700004)(478600001)(16526019)(40460700003)(110136005)(54906003)(86362001)(36756003)(186003)(26005)(82310400005)(1076003)(40480700001)(4326008)(316002)(6666004)(82740400003)(44832011)(83380400001)(70206006)(70586007)(36860700001)(450100002)(2906002)(41300700001)(336012)(8676002)(356005)(426003)(81166007)(7696005)(5660300002)(8936002)(47076005)(2616005)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Apr 2023 01:53:32.1530 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9995e102-0bd5-43ce-3bd0-08db45f90a23
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT050.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB8920
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
Cc: Mukul Joshi <mukul.joshi@amd.com>, Felix.Kuehling@amd.com,
 christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Use the helper function in TTM to get TTM memory
limit and set KFD's internal mem limit. This ensures
that KFD's TTM mem limit and actual TTM mem limit are
exactly same.

Signed-off-by: Mukul Joshi <mukul.joshi@amd.com>
Reviewed-by: Felix Kuehling <Felix.Kuehling@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.c       | 3 ++-
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c | 6 +++++-
 2 files changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.c
index fed8bb9a721f..a46285841d17 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.c
@@ -53,7 +53,6 @@ int amdgpu_amdkfd_init(void)
 	amdgpu_amdkfd_total_mem_size *= si.mem_unit;
 
 	ret = kgd2kfd_init();
-	amdgpu_amdkfd_gpuvm_init_mem_limits();
 	kfd_initialized = !ret;
 
 	return ret;
@@ -143,6 +142,8 @@ void amdgpu_amdkfd_device_init(struct amdgpu_device *adev)
 	int i;
 	int last_valid_bit;
 
+	amdgpu_amdkfd_gpuvm_init_mem_limits();
+
 	if (adev->kfd.dev) {
 		struct kgd2kfd_shared_resources gpu_resources = {
 			.compute_vmid_bitmap =
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
index 862e94fbf53c..1002c7834386 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
@@ -35,6 +35,7 @@
 #include <uapi/linux/kfd_ioctl.h>
 #include "amdgpu_xgmi.h"
 #include "kfd_smi_events.h"
+#include <drm/ttm/ttm_tt.h>
 
 /* Userptr restore delay, just long enough to allow consecutive VM
  * changes to accumulate
@@ -109,13 +110,16 @@ void amdgpu_amdkfd_gpuvm_init_mem_limits(void)
 	struct sysinfo si;
 	uint64_t mem;
 
+	if (kfd_mem_limit.max_system_mem_limit)
+		return;
+
 	si_meminfo(&si);
 	mem = si.freeram - si.freehigh;
 	mem *= si.mem_unit;
 
 	spin_lock_init(&kfd_mem_limit.mem_limit_lock);
 	kfd_mem_limit.max_system_mem_limit = mem - (mem >> 4);
-	kfd_mem_limit.max_ttm_mem_limit = (mem >> 1) - (mem >> 3);
+	kfd_mem_limit.max_ttm_mem_limit = ttm_tt_pages_limit() << PAGE_SHIFT;
 	pr_debug("Kernel memory limit %lluM, TTM limit %lluM\n",
 		(kfd_mem_limit.max_system_mem_limit >> 20),
 		(kfd_mem_limit.max_ttm_mem_limit >> 20));
-- 
2.35.1

