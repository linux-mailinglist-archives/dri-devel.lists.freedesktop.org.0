Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2580675E9DF
	for <lists+dri-devel@lfdr.de>; Mon, 24 Jul 2023 04:43:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A47DF10E266;
	Mon, 24 Jul 2023 02:43:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2074.outbound.protection.outlook.com [40.107.243.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2829310E0BF
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jul 2023 02:43:05 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eC3QdxqfWJxb1TM1R/iU4M+Lq5TEER0991ekQ+IolG/Os+Wkbqw2N1QS6e/dfbbE0gA0eshtyxSPcjyxhLDkRVxSAANCg5v/dUZkPFFMRr4zDzfNbsGmdcaY389ilkgUvU3t8Ugb4KJN64zN+G3CcfPVoO5uFKdBRCo1mti7jnEXMiXgALWGnPPNgFNO30Y97WtdWYcOxhwmMaCdYnzSyZMSPyyxyVAWcITxPRyyGVXc7t+zjuiCssINGoty31wIDBmWNGk5GU05KVTs87JVfRLzLdOlCYuTTD8PhWbXu1cACaJk2/AR8Wl2ZS5kJv7H2CbM0J2c4vVatTu2Sswyog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rSC/p5Af9Ic3qtibMIlyGwbjQ+V5KvUoy7/FiiCYjlc=;
 b=M0M16c4CKN14YYeM/cNONG9+Gvz9h3xgSz3CK9V79qpMwmP3mK4GHGsiZOl29iBrnuwDUltYNhTYV+8Ef8fZDYO65EEYDwF6WPhPiUI7pUO8dk4jAanGLbFjTQH6IM3YwpVQT10Wtkj9zdnWdHSw5RKwTSdfixqNDDDBIp7fUHjoudDC42XWaRuJCgjhDRA9nxnQDfWoodlgco47nR5kcRLZ/PRWXtFrjICYY80ILLl4F8KXg26VRmmHlMRnKi4K81X8iseFufW0DnHl5lPzUyW7M77MALNgkCxjpr7OoFDhfDHJfB8lPyyJSfgb6Q25K44tQ2cIx/MMJODPMDfl+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=gmail.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rSC/p5Af9Ic3qtibMIlyGwbjQ+V5KvUoy7/FiiCYjlc=;
 b=xBSkHUQQ6xO0xlGSWwmlhotCv05azJqwqx4oe5ImSqt3acEwWLagxXzt6zKHxV5MYkHLQPxh68dFnR6eDY8Xyvvn5s+cCZv8GpdPdGMM7URc/9il7S0BuQO7Le7zvLUf/OY5+R1jhZTIQo/3pwHQndsggUcswZJ6/zXYDfHYjrc=
Received: from BN0PR03CA0048.namprd03.prod.outlook.com (2603:10b6:408:e7::23)
 by DS0PR12MB7803.namprd12.prod.outlook.com (2603:10b6:8:144::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.32; Mon, 24 Jul
 2023 02:43:01 +0000
Received: from BN8NAM11FT044.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:e7:cafe::8b) by BN0PR03CA0048.outlook.office365.com
 (2603:10b6:408:e7::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.32 via Frontend
 Transport; Mon, 24 Jul 2023 02:43:01 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT044.mail.protection.outlook.com (10.13.177.219) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6631.22 via Frontend Transport; Mon, 24 Jul 2023 02:43:01 +0000
Received: from guchchen-System-Product-Name.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Sun, 23 Jul 2023 21:42:53 -0500
From: Guchun Chen <guchun.chen@amd.com>
To: <alexander.deucher@amd.com>, <christian.koenig@amd.com>,
 <airlied@gmail.com>, <daniel@ffwll.ch>, <dri-devel@lists.freedesktop.org>
Subject: [PATCH] drm/ttm: check null pointer before accessing when swapping
Date: Mon, 24 Jul 2023 10:42:29 +0800
Message-ID: <20230724024229.1118444-1-guchun.chen@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT044:EE_|DS0PR12MB7803:EE_
X-MS-Office365-Filtering-Correlation-Id: 93140b37-445b-4f5e-a1cb-08db8befb272
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: LoRSJ5GA5gadJa9UvMtNSyC8pP6ZvZbwilkFnzwgrrWeDGOWajTPykwMQuPBfHxw1wdIWGXO4ne0YihFxRhVHcDA5JDOMZCwbfuE7T8I29YpPPUUAymJ/Y/gxwsPTPiqL76aJnbC2yG0kU6OB83q04vZRYUE6qx8PhKsEwO53Z7KVwU4vcXUmPmUQZK15mmheOrCBM2oRxdAUZmwTTuA72G8+m9z3Zx5cRN4jbOldxCyaf1GUjvc2f576zyGQQ756WGivzugrafso/52+foYbWxumACcqygHNqrx1SyFJAS+H1+H2LmGqwobLPNjF//R0lZe6hBqgiK9BzZFZAC2IslvypQmL6tXCDFO9tjngBb/kazT3b8uR0X15KCABpEnyZwD9iTbAD4jlt81nHn94Rof/b2KmhToUn5mZKyx1NzndMcv1Io556IcDUKSK6OBAmc1+Jjd3UogIqMuWHVapHzEMTwsqd4PD197pLCQGTCtYu9pekBrK6yY6Y31bADkm4zBa7xepj6Qu7d2b1TWOSjOz/s/AunlPkvJKZPuD09if9d+2Ol1H2tLWZeYwCdnSa23hu0Eilmrv5Mg6miaq+q7xvCxFdsJF3KI5qxONSJAezWHsxMDl+7HG5eSAiZyh6nnlmxLCG47syn7y7SLvz7/Vd0jdgRvR4neTYe85xKs6xJRfLZf4DwnboqjMcUbQWaV3B0sp2681Vccpk5g9QuZdqMtMdevxRo6psuFDfBx2PbWOHqmKw0KUGw4f3pJ9LOhh3iojgQwPY/19ylEePc+opLpI1tvjI8tkKiSxTM=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230028)(4636009)(376002)(39860400002)(396003)(136003)(346002)(451199021)(82310400008)(46966006)(40470700004)(36840700001)(7696005)(6666004)(478600001)(110136005)(54906003)(16526019)(336012)(2616005)(186003)(1076003)(26005)(2906002)(44832011)(316002)(41300700001)(70206006)(70586007)(4326008)(5660300002)(8676002)(8936002)(356005)(82740400003)(81166007)(36756003)(40460700003)(86362001)(36860700001)(426003)(83380400001)(47076005)(40480700001)(36900700001)(2101003);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jul 2023 02:43:01.0046 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 93140b37-445b-4f5e-a1cb-08db8befb272
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT044.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7803
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
Cc: Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>,
 Guchun Chen <guchun.chen@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add a check to avoid null pointer dereference as below:

[   90.002283] general protection fault, probably for non-canonical
address 0xdffffc0000000000: 0000 [#1] PREEMPT SMP KASAN NOPTI
[   90.002292] KASAN: null-ptr-deref in range
[0x0000000000000000-0x0000000000000007]
[   90.002346]  ? exc_general_protection+0x159/0x240
[   90.002352]  ? asm_exc_general_protection+0x26/0x30
[   90.002357]  ? ttm_bo_evict_swapout_allowable+0x322/0x5e0 [ttm]
[   90.002365]  ? ttm_bo_evict_swapout_allowable+0x42e/0x5e0 [ttm]
[   90.002373]  ttm_bo_swapout+0x134/0x7f0 [ttm]
[   90.002383]  ? __pfx_ttm_bo_swapout+0x10/0x10 [ttm]
[   90.002391]  ? lock_acquire+0x44d/0x4f0
[   90.002398]  ? ttm_device_swapout+0xa5/0x260 [ttm]
[   90.002412]  ? lock_acquired+0x355/0xa00
[   90.002416]  ? do_raw_spin_trylock+0xb6/0x190
[   90.002421]  ? __pfx_lock_acquired+0x10/0x10
[   90.002426]  ? ttm_global_swapout+0x25/0x210 [ttm]
[   90.002442]  ttm_device_swapout+0x198/0x260 [ttm]
[   90.002456]  ? __pfx_ttm_device_swapout+0x10/0x10 [ttm]
[   90.002472]  ttm_global_swapout+0x75/0x210 [ttm]
[   90.002486]  ttm_tt_populate+0x187/0x3f0 [ttm]
[   90.002501]  ttm_bo_handle_move_mem+0x437/0x590 [ttm]
[   90.002517]  ttm_bo_validate+0x275/0x430 [ttm]
[   90.002530]  ? __pfx_ttm_bo_validate+0x10/0x10 [ttm]
[   90.002544]  ? kasan_save_stack+0x33/0x60
[   90.002550]  ? kasan_set_track+0x25/0x30
[   90.002554]  ? __kasan_kmalloc+0x8f/0xa0
[   90.002558]  ? amdgpu_gtt_mgr_new+0x81/0x420 [amdgpu]
[   90.003023]  ? ttm_resource_alloc+0xf6/0x220 [ttm]
[   90.003038]  amdgpu_bo_pin_restricted+0x2dd/0x8b0 [amdgpu]
[   90.003210]  ? __x64_sys_ioctl+0x131/0x1a0
[   90.003210]  ? do_syscall_64+0x60/0x90

Fixes: a2848d08742c ("drm/ttm: never consider pinned BOs for eviction&swap")
Tested-by: Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>
Signed-off-by: Guchun Chen <guchun.chen@amd.com>
---
 drivers/gpu/drm/ttm/ttm_bo.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/ttm/ttm_bo.c b/drivers/gpu/drm/ttm/ttm_bo.c
index 7139a522b2f3..54e3083076b7 100644
--- a/drivers/gpu/drm/ttm/ttm_bo.c
+++ b/drivers/gpu/drm/ttm/ttm_bo.c
@@ -519,7 +519,8 @@ static bool ttm_bo_evict_swapout_allowable(struct ttm_buffer_object *bo,
 
 	if (bo->pin_count) {
 		*locked = false;
-		*busy = false;
+		if (busy)
+			*busy = false;
 		return false;
 	}
 
-- 
2.25.1

