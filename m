Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 825CA747C7B
	for <lists+dri-devel@lfdr.de>; Wed,  5 Jul 2023 07:36:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 243FD10E0EC;
	Wed,  5 Jul 2023 05:36:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2046.outbound.protection.outlook.com [40.107.244.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E9EC410E0EC;
 Wed,  5 Jul 2023 05:36:01 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=T6q8+T6BOE7g3a3OfBMqvHqMkD1mAPOgtzyIDpThzj30meJBXy0u5PzkXgcJdLafjDQM6JtHX84P212g+jW/bmvicay1rFPx4R8HU1RU0sYTOgxlJ9xf/WzTE/tuISgMxQvtwuhMCDaouDxrnIjkhH7rHZnqjTQ1dd1HsYH/YsgsLWu27TELIGnl7nPFMFnAPtWrF2D0519SYlAfo1t+4BmspMYep6/ZJcsjUp2Xb+YPUBYdaz033Z2ltc3UCawxbqHzJn40c99woq48rfSAEwpKtq/nFZ3sDQ2MVq+nX3jMyAi3cxhNlFRq8lS036CQCYKJ+q4K8sUiLIbEbwjNmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZrBZgP6Jfn7eOG+SQ489FxlFfpTgwLFIEHe61j+Bevs=;
 b=Zqnx8tDW1qc3D3/uv4pFjngenQa/E05Q5q/VrRiSnnk5SH4694cg2n93yAIh93ipDjgRBouW0db5/bKQacM27VzlQD5jO6UGy061DLKelmXfjycQepdrgR6POAN3XNOTR+RbgNEFI4uBSFAtFtFXnmFy9YI/Uu2B62Pohmiw+VzBlAE1zhanT/4tYiw9Tgx4vs8tOOO1UluUojR16oNVRv9ENBJOjMaj/TXY9GxOoTRSPLsIU5m3qT29I+MzYjYa2hY0PT3nQPTJ5EsN9ySwfq7t7SQR5+zdrh+Z7FEJ3BPLL9LN30bbCxTHRvaNc+zm8M3Vbz26Agucqzxw77vLrg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZrBZgP6Jfn7eOG+SQ489FxlFfpTgwLFIEHe61j+Bevs=;
 b=uZgQwe2jgxSiq5V5wiV93F1Y5XMm3Wt94u91hHheLwQPaCFLwTE8NS16Rpfc8d+jOvlORWLRbym5DcXePE88q/ZvV26aSDeEyE1KjLNgJhoRvsIC+WYh+KpMzTeGfGPo1kUc9q+zSZDwKadEZr59H17M5NqxW36JKxUHUH3SxSw=
Received: from DM6PR12CA0023.namprd12.prod.outlook.com (2603:10b6:5:1c0::36)
 by PH7PR12MB7233.namprd12.prod.outlook.com (2603:10b6:510:204::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6544.24; Wed, 5 Jul
 2023 05:36:00 +0000
Received: from DM6NAM11FT050.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:1c0:cafe::1) by DM6PR12CA0023.outlook.office365.com
 (2603:10b6:5:1c0::36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.18 via Frontend
 Transport; Wed, 5 Jul 2023 05:35:59 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT050.mail.protection.outlook.com (10.13.173.111) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6521.45 via Frontend Transport; Wed, 5 Jul 2023 05:35:59 +0000
Received: from lang-desktop.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.23; Wed, 5 Jul
 2023 00:35:57 -0500
From: Lang Yu <Lang.Yu@amd.com>
To: <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>
Subject: [PATCH] drm/ttm: fix one use-after-free
Date: Wed, 5 Jul 2023 13:35:44 +0800
Message-ID: <20230705053544.346139-1-Lang.Yu@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6NAM11FT050:EE_|PH7PR12MB7233:EE_
X-MS-Office365-Filtering-Correlation-Id: 1a440a17-d5be-4dea-776a-08db7d19b690
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: trvxkyCXBfvfRk7h7QUOXZl9T4c0z2/Kufk7xIvEY+DLYmhW95GVVyRYLQIQIR4qyVYJEnxKYvmFIeRkVk+hW/T3oDCOlScDCK2L6YqwXA3WzAXquhz+a7m9olaBqQ7p0ZDCawbAR2wht4IDtYOiAib4UHOqPnzKJNqzSUNulFF0y77KecViL9E+fxgrrEUmWyun9ameumAU6Ps3gf+RdjB4CMCiRZsuBk0s7xx6ZR4etcUWRF/jD6b3mmJ+W7wTwi+MULzrYhnNqNI64szVePDcnZSyCBA7JsNger9BHwK4lm1I6Quv33f7PuF0o8OjC/8HDqWA0w5iQx7Ps1U94FmNNKBZtX2S3jE7RExeKwmEnS5NLmGpA4CDhsBkx+4Ilt140dEJD3HaD7ZNfxPnrTgKhbhNx1oSJiP7n0glHTDC2ByY0xnuDNnPZ8HL/Ixlnpw+WJHPYRLscUoGLPCtmNkZeIrajS1+Oo3J6h8ev/EbCVDRVh5WGLJuZbAmulV8JRaOTycpEqklLg54M7+pARaP22MNbETquh3hPsSnhs0JiMHwAyc7Oq9PFD0zJovUcN7ZiXtNuZhFK8ORQq/92ZRHLBtu1GI4NgebkaUolBTPn8D++5Y0LzkEL6FR3Yh53QtWA30hstRVWjQzhwzEn8Gf7BmaQgIOsU5OtxPQAnnCEeclAx6h+t+5N28qiIVevHZt+CiTDZf1Wc1ivYSi07tiiiJA4KnXNwwDflgdVJvCpsAucwQflc7bo3Gz6IXOY/WQJzxHGd5/RGc9GZEKCA==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230028)(4636009)(136003)(376002)(346002)(396003)(39860400002)(451199021)(46966006)(40470700004)(36840700001)(1076003)(81166007)(82740400003)(70206006)(356005)(4326008)(40480700001)(70586007)(41300700001)(478600001)(40460700003)(450100002)(316002)(426003)(36860700001)(47076005)(2616005)(83380400001)(336012)(82310400005)(16526019)(186003)(26005)(54906003)(110136005)(2906002)(5660300002)(7696005)(36756003)(86362001)(8936002)(8676002)(6666004)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jul 2023 05:35:59.2851 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1a440a17-d5be-4dea-776a-08db7d19b690
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT050.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7233
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
Cc: Lang Yu <Lang.Yu@amd.com>, Christian Koenig <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

[   67.399887] refcount_t: underflow; use-after-free.
[   67.399901] WARNING: CPU: 0 PID: 3172 at lib/refcount.c:28 refcount_warn_saturate+0xc2/0x110
[   67.400124] RIP: 0010:refcount_warn_saturate+0xc2/0x110
[   67.400173] Call Trace:
[   67.400176]  <TASK>
[   67.400181]  ttm_mem_evict_first+0x4fe/0x5b0 [ttm]
[   67.400216]  ttm_bo_mem_space+0x1e3/0x240 [ttm]
[   67.400239]  ttm_bo_validate+0xc7/0x190 [ttm]
[   67.400253]  ? ww_mutex_trylock+0x1b1/0x390
[   67.400266]  ttm_bo_init_reserved+0x183/0x1c0 [ttm]
[   67.400280]  ? __rwlock_init+0x3d/0x70
[   67.400292]  amdgpu_bo_create+0x1cd/0x4f0 [amdgpu]
[   67.400607]  ? __pfx_amdgpu_bo_user_destroy+0x10/0x10 [amdgpu]
[   67.400980]  amdgpu_bo_create_user+0x38/0x70 [amdgpu]
[   67.401291]  amdgpu_gem_object_create+0x77/0xb0 [amdgpu]
[   67.401641]  ? __pfx_amdgpu_bo_user_destroy+0x10/0x10 [amdgpu]
[   67.401958]  amdgpu_amdkfd_gpuvm_alloc_memory_of_gpu+0x228/0xa30 [amdgpu]
[   67.402433]  kfd_ioctl_alloc_memory_of_gpu+0x14e/0x390 [amdgpu]
[   67.402824]  ? lock_release+0x13f/0x290
[   67.402838]  kfd_ioctl+0x1e0/0x640 [amdgpu]
[   67.403205]  ? __pfx_kfd_ioctl_alloc_memory_of_gpu+0x10/0x10 [amdgpu]
[   67.403579]  ? tomoyo_file_ioctl+0x19/0x20
[   67.403590]  __x64_sys_ioctl+0x95/0xd0
[   67.403601]  do_syscall_64+0x3b/0x90
[   67.403609]  entry_SYSCALL_64_after_hwframe+0x72/0xdc

Fixes: 9bff18d13473 ("drm/ttm: use per BO cleanup workers")

Signed-off-by: Lang Yu <Lang.Yu@amd.com>
---
 drivers/gpu/drm/ttm/ttm_bo.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/ttm/ttm_bo.c b/drivers/gpu/drm/ttm/ttm_bo.c
index bd5dae4d1624..e047b191001c 100644
--- a/drivers/gpu/drm/ttm/ttm_bo.c
+++ b/drivers/gpu/drm/ttm/ttm_bo.c
@@ -308,6 +308,9 @@ static void ttm_bo_delayed_delete(struct work_struct *work)
 
 	bo = container_of(work, typeof(*bo), delayed_delete);
 
+	if (!ttm_bo_get_unless_zero(bo))
+		return;
+
 	dma_resv_wait_timeout(bo->base.resv, DMA_RESV_USAGE_BOOKKEEP, false,
 			      MAX_SCHEDULE_TIMEOUT);
 	dma_resv_lock(bo->base.resv, NULL);
-- 
2.25.1

