Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C0B0C819BE
	for <lists+dri-devel@lfdr.de>; Mon, 24 Nov 2025 17:37:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D9CE810E24C;
	Mon, 24 Nov 2025 16:37:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="mMikRWu9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from SN4PR0501CU005.outbound.protection.outlook.com
 (mail-southcentralusazon11011019.outbound.protection.outlook.com
 [40.93.194.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD06C10E24C;
 Mon, 24 Nov 2025 16:37:19 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=roWb+5ivqYmR/wX6XtS4LEMOEgFlDshO95oWYYLJoWKVhHQIvz3ng48AhQs5CDvoseJHc69A/Rl53AH/xXQrkBVXR+WwpXRYB7oFZfdAGtwu7nt0KIaiKeItK9HVOS26bNbiRIOybv9CdtrWpr30FoT0RezhzCdYN3FiTAmBGzEQV601o6BxMkwlWu9SLAVQJMaFCa9ez9C6OQrbTUvo2QaPAVNf/EB9qC/Yj7Nn9ZlftiibZ30fqTNJmAObcBkgMyQ9B/XUUGkyJr3nz7dCvAksS3TxJv881vfWa8ltH+lMs3hgES4PaZZNs3x5S9BEWMbeXhJasqV2ME/hSHpO5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BHZeYL0pg3OrNwHJ/ksLJ7sr668Uj67wvjzZTS5aikc=;
 b=wQDzBD9Ft7fJFMXiEJeKbcPj/bHUXwfqjhCd7wky5/AaTueVbBJWzEJbkwzA+aP1gMfitvhMt+9aKZx3nobktN0HYHLHh/Bg23wETdVtIsTm/tfsB7M2rRzyfDLvNepNywL6JYjqaBHTg6ymTtAAuSpL6S2cI3AxrsPnBfKUrrq3hvcb24WXSKyXftv4c7g8scRUZs5HhA4jpTrOcoAPzInJK0xOtmFArFIXb7kqFD9MKeK7I/HL2567nHk67YW+/88P35+k0anVZe91e2o2Z6CGMxX1gERH3vUuTSFeSTd1SokmKrWjn2BeriRqBveMit1bJpws36Ldz3Q6HRRETA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=gmail.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BHZeYL0pg3OrNwHJ/ksLJ7sr668Uj67wvjzZTS5aikc=;
 b=mMikRWu9HtJ+o8dAaqlE27KlVYdZFQDPkSiJABHji7fCEFw15n1Yrf8qKxcqcbb69fX07pnFoSAxB/zD/6HKu6aY8F0Wa7hd/U7HmJLcHDQE0jJFkQlKAtttN+vAb90pFDWxFuulgNgH72aSxSZGGkYa5kyHujYAu4YVpzb5l3s=
Received: from BN9PR03CA0656.namprd03.prod.outlook.com (2603:10b6:408:13b::31)
 by DS4PR12MB999077.namprd12.prod.outlook.com (2603:10b6:8:2f9::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.17; Mon, 24 Nov
 2025 16:37:16 +0000
Received: from BL6PEPF0001AB54.namprd02.prod.outlook.com
 (2603:10b6:408:13b:cafe::8b) by BN9PR03CA0656.outlook.office365.com
 (2603:10b6:408:13b::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9343.17 via Frontend Transport; Mon,
 24 Nov 2025 16:36:59 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BL6PEPF0001AB54.mail.protection.outlook.com (10.167.241.6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9366.7 via Frontend Transport; Mon, 24 Nov 2025 16:37:15 +0000
Received: from FRAPPELLOUX01-WSLPUB.amd.com (10.180.168.240) by
 satlexmb07.amd.com (10.181.42.216) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Mon, 24 Nov 2025 10:37:13 -0600
From: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
To: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, "David (Ming Qiang) Wu"
 <David.Wu3@amd.com>
CC: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>,
 <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>
Subject: [PATCH v1 2/2] drm/amdgpu: free job fences on failure in
 amdgpu_job_alloc_with_ib
Date: Mon, 24 Nov 2025 17:36:14 +0100
Message-ID: <20251124163615.6388-2-pierre-eric.pelloux-prayer@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251124163615.6388-1-pierre-eric.pelloux-prayer@amd.com>
References: <20251124163615.6388-1-pierre-eric.pelloux-prayer@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb08.amd.com (10.181.42.217) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB54:EE_|DS4PR12MB999077:EE_
X-MS-Office365-Filtering-Correlation-Id: e0bc9004-6b7d-4ff2-77f2-08de2b77ba13
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|1800799024|376014|36860700013; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?v+3kSJVAe6TSeobPgRHbWQVij2JJHfooTkz8jHOpHjTbhcWn/p+2G0Vs4dlC?=
 =?us-ascii?Q?4XxgtFNxmV4e0u9Yzb8APevvVtte4HDtDmbCQWNqzaSSdkycHwA8GcF0ySx8?=
 =?us-ascii?Q?08ksOPdiuMlUdo56kM2Sh0uvCidSNO/bNiuZHz85axXQ2/6UNO+4dd7bwOi5?=
 =?us-ascii?Q?xqdr2gvMLczizCgNsnsOw5iSVzdkPNGlbro9uWEUWPXloBpEc8u9SofCphTZ?=
 =?us-ascii?Q?ZTUt9fHTGOpsMDGqiJ5LtO8fovZu53LkEUh6hx2qiSTT/lh6aBy1ubjR9PEv?=
 =?us-ascii?Q?ttbJKnziZxWMavbJSPgOrDKuysDK9DiP45kykSvl6Uw2TRX56hd52dkN6BZn?=
 =?us-ascii?Q?cuiZTJDCzFqF2FluMykRyukzoWpFkVUds49IIZiZAeq2qe5kzQ84mCbGQjfq?=
 =?us-ascii?Q?x3fYrbl1flvQeQbj2NvNW7w71cwDtfzVpBVyanlr+U00bqOVPolHbwaVsQ4C?=
 =?us-ascii?Q?xTNXkdaYDutgBbhCvrXzBu1QgK2+w3KRQHYTBoPcvWM7wqWXhjXI5vel1K+a?=
 =?us-ascii?Q?Jfdo1Hss1z+8Ewf7+/mCtQlGUG07NhAxfdC+7IJoEPIeJE79QjBXcw1UITeY?=
 =?us-ascii?Q?k8LisY0496rjd+mJQJ9aDh23O+Gao7dGfX6HpiVuw9IHlq6jYm3KrX/XywSB?=
 =?us-ascii?Q?5R5gn7+j3ngEeUK/ry2WUX0EI9C2kgz19r/V5VpwG6HSVDN1qK+TXKpdRFuC?=
 =?us-ascii?Q?NVBp3nGbsVzQoI5DqLl/0P/1bKiGlaCo6JCVWvhjPvcwVkwXxWD53L2fUERR?=
 =?us-ascii?Q?GT4RKP6nBqhNRwNBx0ieiIjPll6Ud5i9qyfFtd5/LmcdC3OA38w28irNN4Ps?=
 =?us-ascii?Q?Wa9PyF+XNhcWPAj3lvajv9+3fg0URgaTTYVo/beVPJplDDMH6cjGknkAaoQ8?=
 =?us-ascii?Q?wkjQFS2zpVsq6cmMFi8oNazFQGEYMFOtD0mjlNqOpA62QqFyN9+k4aFtEe8q?=
 =?us-ascii?Q?oKKV+5yVwnY0SNcs5alzMfDLvmo0DU8vNzI08uB4q08JfH6idTs/RG53dV06?=
 =?us-ascii?Q?jpcf8KwyO7dUpyninc64V9/KEkkBGxPg3pH/9cBiJg9n7oWFh6W/RdGM5VmB?=
 =?us-ascii?Q?EawhPuNAw57/lOD/yRMwZ+GqdGEiNEDn1VOX3flwYnH0haBdYntiD8/ibV0b?=
 =?us-ascii?Q?Hgg0uL8QGUgxhBWvoBFiMGO/WOesqQNF7a113S8/nN6LCnITOprABb6UvfmF?=
 =?us-ascii?Q?dCUi3Kl9eT+E9xL9imuYr2V7123+Vq3yZHX3D+Owp6WyooGpPDLGcb048o2Q?=
 =?us-ascii?Q?SwLiK62pUuQniMSP22Rf2JD7E/ptsfKBN40W35Ky5FuLBc6Fry1R0QB1jn6d?=
 =?us-ascii?Q?ud67DX+gDh00xiQv8M+RsKJVrxa34VyQDJsrWRUyeCFfS9Cw+OSH6OtcgB9u?=
 =?us-ascii?Q?qswr1yBV8Yw5j6ZXQrTv9Vs4PCJmUtXa6/+7rxlyYcmDjX/0SGdAcsqx1DfV?=
 =?us-ascii?Q?jZttt9sD+R7y46ZEGRXT2FXKHNk3cWVk65TFEiqFfP+JM8r4MYYCfk8xoYE4?=
 =?us-ascii?Q?hPXk6/YsYOH7MCn70aKuiwbHh9U7/CU5UaKVJxV0Dh5T6dMXNWn3UErzKP59?=
 =?us-ascii?Q?ObsHPVdBMHKLaawYq3s=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(1800799024)(376014)(36860700013); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Nov 2025 16:37:15.5700 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e0bc9004-6b7d-4ff2-77f2-08de2b77ba13
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BL6PEPF0001AB54.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PR12MB999077
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

Otherwise we're leaking memory.

Fixes: a35c520c1611 ("drm/amdgpu: clean up and unify hw fence handling")
Signed-off-by: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_job.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
index 2fc3d9da0fe7..91f1232b7d41 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
@@ -246,6 +246,8 @@ int amdgpu_job_alloc_with_ib(struct amdgpu_device *adev,
 	if (r) {
 		if (entity)
 			drm_sched_job_cleanup(&(*job)->base);
+		kfree((*job)->hw_vm_fence);
+		kfree((*job)->hw_fence);
 		kfree(*job);
 		*job = NULL;
 	}
-- 
2.43.0

