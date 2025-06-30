Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 89B22AEDA18
	for <lists+dri-devel@lfdr.de>; Mon, 30 Jun 2025 12:41:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A5F510E400;
	Mon, 30 Jun 2025 10:41:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="aW3iDEif";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2078.outbound.protection.outlook.com [40.107.93.78])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2CFAF10E402;
 Mon, 30 Jun 2025 10:41:39 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OEu7kVsKNGvB11OccxY/DOlpMCDhe7ffa6rk+kLpOWTZ3iwAKV1e8ViuTGLfyeCEgHdtrbr3Vv0Em0UzJCCpy0n9pyTnPksT3hqBP2OSEcIHtzzWwhhmNFGsDp6uYKMUGdc4H7K9JNSLSqr9xLcBRrHBhlmxw9yOLIVRg4BkIDXj/0LtGH9tG1Gpa23UJ+6CWnWSNBvxhKwePyqjKIgMdNHxZnGbQq0wDA7OUTxyA3rBckYIieCqO6jQaq0J0pEs9FzsI88uQ/xJ+m9JcfRAb07hmKnr4Zh/scJK1OLGvC0HWhUrJB7tx5HJPqxfyEjnx2Ou7f/1bnjXyX3z6efGDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KCseoRpCc1/28UrqFzQEy0Xjo4AGVgrSDtiCzhWtbe4=;
 b=nXUcHEEt9INi+NrauSsAfawjaAYB/LniIIdXUZMlXvgMxTEue+tUrGyKZq6BFsznNsaMfVq45/OgDWvM0L9v9H+Xppn6kS8VZbfAHj3aqrNylKMt1HEF4sn2Vs0xzFE3P/k4uSYMky/eA/pcWRUccMtb6RA/CkOSV3tIYVhna9rcABNO3xj6ot2EUAe/MGq8DkgaQ5/DgMul10WXUu/Nl95GyyvE9KeEMkz6qAPey3J5tSZnIS0k7u2PqXQGVcI26e47qqf/WRd52YnKAgUUOJgqkUZBBRAyO+7mRj4dVoiXLRiTkDOqd7/qZMgnNlYGBB4bR64Bv94U2w6w1fLXLQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KCseoRpCc1/28UrqFzQEy0Xjo4AGVgrSDtiCzhWtbe4=;
 b=aW3iDEifdZ8Stbt5K7SwIzzlO8XVWWxXghJjKlYIkyJFpd1kufsOLnhsNPstXWdqddSTCwYnR1P7wa2pVYHWdh+dxC2CJ0zAnr9HyZVnYTUMbsIGyfBfm1hTX4cfmkwjiOQgT592DFdP8ygsG7GztuC3XJh2FHh9rykmyNE60MI=
Received: from SJ0PR03CA0242.namprd03.prod.outlook.com (2603:10b6:a03:3a0::7)
 by DS0PR12MB8454.namprd12.prod.outlook.com (2603:10b6:8:15e::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.29; Mon, 30 Jun
 2025 10:41:36 +0000
Received: from CO1PEPF000042AD.namprd03.prod.outlook.com
 (2603:10b6:a03:3a0:cafe::91) by SJ0PR03CA0242.outlook.office365.com
 (2603:10b6:a03:3a0::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8880.30 via Frontend Transport; Mon,
 30 Jun 2025 10:41:36 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CO1PEPF000042AD.mail.protection.outlook.com (10.167.243.42) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8901.15 via Frontend Transport; Mon, 30 Jun 2025 10:41:36 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 30 Jun
 2025 05:41:30 -0500
Received: from hjbog-srdc-41.amd.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Mon, 30 Jun 2025 05:41:26 -0500
From: Samuel Zhang <guoqing.zhang@amd.com>
To: <rafael@kernel.org>, <len.brown@intel.com>, <pavel@kernel.org>,
 <alexander.deucher@amd.com>, <christian.koenig@amd.com>,
 <mario.limonciello@amd.com>, <lijo.lazar@amd.com>
CC: <victor.zhao@amd.com>, <haijun.chang@amd.com>, <Qing.Ma@amd.com>,
 <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <linux-pm@vger.kernel.org>, <linux-kernel@vger.kernel.org>, Samuel Zhang
 <guoqing.zhang@amd.com>
Subject: [PATCH 1/3] drm/amdgpu: move GTT to SHM after eviction for hibernation
Date: Mon, 30 Jun 2025 18:41:14 +0800
Message-ID: <20250630104116.3050306-2-guoqing.zhang@amd.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20250630104116.3050306-1-guoqing.zhang@amd.com>
References: <20250630104116.3050306-1-guoqing.zhang@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB03.amd.com: guoqing.zhang@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000042AD:EE_|DS0PR12MB8454:EE_
X-MS-Office365-Filtering-Correlation-Id: 515221fd-15b5-45e6-8fd2-08ddb7c2b010
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|82310400026|36860700013; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?cIoIgczDmW8cFTRZ6IGwPAAnYipGjI1yy77c6j75L71tIxoWZ3W2Q83topnk?=
 =?us-ascii?Q?BMDwfUjIyFb6xE503C91Hy5bdluz37HF4M0f7Q9CVbL42ebhOCfid1mhUBn9?=
 =?us-ascii?Q?Mz5PBkup1o5Uq6TQ8s1d1MhX6viChLfSI9PKf49LYFxijeGzrA0XG+waLHCp?=
 =?us-ascii?Q?XBT0gSujjPiSvIvk1VbUFtfMv3xzEfM/3CGIoS7RANPl17510ZmrLNN56Zuo?=
 =?us-ascii?Q?wncjNBLc1YukqdVuURNOkFyOz0/gSkojaXyII1OAwnlPrwzAGhZA6e4MqVbp?=
 =?us-ascii?Q?TtHeEa5jgD+zh7rQCwiEGhJezXO1wm9dOpkpNksqnjDIINCqIreJ9MUuJwki?=
 =?us-ascii?Q?5xWFWCrm6V/oYctpiiKlghXXzYeFev3jpQnnmw+0G6INY35hlWK8FhIcWXPP?=
 =?us-ascii?Q?k0Mfh26C/V5oepw0kI2sqbhxBliUMabUTAyBupupVbPGg5ugXrHLV/TCJdH+?=
 =?us-ascii?Q?L8oOhL8O85GjaCi72m+boyjjui+fSefA5Mkj68k2ofITB+Hp2VKoEkQrWEDb?=
 =?us-ascii?Q?iMHC61f3JvXwSxbQSJL4xHeKcx3Rn6nCZHPhZDGl1MY/9kGvDKWraiDYzgtU?=
 =?us-ascii?Q?iyd4hwwG8UvIezw1a0ZIq1Z5xIYARV3W/0S3kWR617Y05VWl2J7cwVy9c5I0?=
 =?us-ascii?Q?yONP1vzg+mgLRwSgkSNgG1UrtcsLW8JrXuqW0WBXYyIjvkxUxXq89ShUoOwK?=
 =?us-ascii?Q?AxzkT6LNC7pbzP4jPCtl8INKlwgXM2asW7N+LQOUE3gJIW+mOgdMOXR+TQjm?=
 =?us-ascii?Q?JdN14pRr1/G1rZ+1h+7NrTBJLJgsU1iExyN3R7ZWRZNhJkLfTJV3b7zAQMo5?=
 =?us-ascii?Q?Zu5iqMKgvxlct6y/dbSO8Khm6a3vVsFo3doQT1Xf5zxQ0leAwqlblsO280Qh?=
 =?us-ascii?Q?qcIbCwzNn1LJYW6cWkiSvt1mytQwG1sYHjLNtUFsgj7q3huSSNTiXFO0afP6?=
 =?us-ascii?Q?TnYrWb/hqGTUsNIfw4OI2Ak3oR+krua+GDzJlHngO/g0pQLFlHma2SwKFajr?=
 =?us-ascii?Q?klw0PwFFzyG6yOMueiflvXZmC0KRdHXej3PYKgn0fWE5qI+LGkWJfEHJaWdv?=
 =?us-ascii?Q?U5yP7sxqx7Wbh6PD/C3WNoKWpZN6K4wGxuQcRZFo1t+6fKS/E6Jt0vPT8BVB?=
 =?us-ascii?Q?ZrSqqRu0EvQctk2p1Vq0hHBTa8Rf78XWUcF1+BSvmCCzWCoj3Lk3TY63RNan?=
 =?us-ascii?Q?ughKnNnfkTJzLhsk4SoTN4IrBcKPg6pd7w73gui0dx9hUuzbeiSOfoejQrBI?=
 =?us-ascii?Q?ilwj/VHTgpdcVK7Y0f2rSGeVxXuTRlWSto+UkJycMWKs8XkHjGH0FNNpnryF?=
 =?us-ascii?Q?pHwdbbfLrYF9O1eKRKIDT6zM74e5Kc9IyMEBxqHxJMMxoMmqsI90ETLOcrH6?=
 =?us-ascii?Q?OLYk9SW/KfX3X5esbAi0dpAkw6oCFoJ3TM/+dYkn/Q0W6EZrXwUcmRbqazhm?=
 =?us-ascii?Q?EwSJzppOeoVYLYG0VZukPfC3RCKF7Ei12AhxskMYgmOPEiy3yrBBCHO6vd2c?=
 =?us-ascii?Q?rtQ+c7rndgpe0b1PRBqIrFAw61UHcEZZ4/Hv?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(82310400026)(36860700013); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jun 2025 10:41:36.0516 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 515221fd-15b5-45e6-8fd2-08ddb7c2b010
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1PEPF000042AD.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8454
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

When hibernate with data center dGPUs, huge number of VRAM BOs evicted
to GTT and takes too much system memory. This will cause hibernation
fail due to insufficient memory for creating the hibernation image.

Move GTT BOs to shmem in KMD, then shmem to swap disk in kernel
hibernation code to make room for hibernation image.

Signed-off-by: Samuel Zhang <guoqing.zhang@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c | 13 ++++++++++++-
 drivers/gpu/drm/ttm/ttm_resource.c      | 18 ++++++++++++++++++
 include/drm/ttm/ttm_resource.h          |  1 +
 3 files changed, 31 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
index 4d57269c9ca8..5aede907a591 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
@@ -2889,6 +2889,7 @@ int amdgpu_fill_buffer(struct amdgpu_bo *bo,
 int amdgpu_ttm_evict_resources(struct amdgpu_device *adev, int mem_type)
 {
 	struct ttm_resource_manager *man;
+	int r;
 
 	switch (mem_type) {
 	case TTM_PL_VRAM:
@@ -2903,7 +2904,17 @@ int amdgpu_ttm_evict_resources(struct amdgpu_device *adev, int mem_type)
 		return -EINVAL;
 	}
 
-	return ttm_resource_manager_evict_all(&adev->mman.bdev, man);
+	r = ttm_resource_manager_evict_all(&adev->mman.bdev, man);
+	if (r) {
+		DRM_ERROR("Failed to evict memory type %d\n", mem_type);
+		return r;
+	}
+	if (adev->in_s4 && mem_type == TTM_PL_VRAM) {
+		r = ttm_resource_manager_swapout();
+		if (r)
+			DRM_ERROR("Failed to swap out, %d\n", r);
+	}
+	return r;
 }
 
 #if defined(CONFIG_DEBUG_FS)
diff --git a/drivers/gpu/drm/ttm/ttm_resource.c b/drivers/gpu/drm/ttm/ttm_resource.c
index fd41b56e2c66..07b1f5a5afc2 100644
--- a/drivers/gpu/drm/ttm/ttm_resource.c
+++ b/drivers/gpu/drm/ttm/ttm_resource.c
@@ -534,6 +534,24 @@ void ttm_resource_manager_init(struct ttm_resource_manager *man,
 }
 EXPORT_SYMBOL(ttm_resource_manager_init);
 
+int ttm_resource_manager_swapout(void)
+{
+	struct ttm_operation_ctx ctx = {
+		.interruptible = false,
+		.no_wait_gpu = false,
+		.force_alloc = true
+	};
+	int ret;
+
+	while (true) {
+		ret = ttm_global_swapout(&ctx, GFP_KERNEL);
+		if (ret <= 0)
+			break;
+	}
+	return ret;
+}
+EXPORT_SYMBOL(ttm_resource_manager_swapout);
+
 /*
  * ttm_resource_manager_evict_all
  *
diff --git a/include/drm/ttm/ttm_resource.h b/include/drm/ttm/ttm_resource.h
index b873be9597e2..46181758068e 100644
--- a/include/drm/ttm/ttm_resource.h
+++ b/include/drm/ttm/ttm_resource.h
@@ -463,6 +463,7 @@ void ttm_resource_manager_init(struct ttm_resource_manager *man,
 
 int ttm_resource_manager_evict_all(struct ttm_device *bdev,
 				   struct ttm_resource_manager *man);
+int ttm_resource_manager_swapout(void);
 
 uint64_t ttm_resource_manager_usage(struct ttm_resource_manager *man);
 void ttm_resource_manager_debug(struct ttm_resource_manager *man,
-- 
2.43.5

