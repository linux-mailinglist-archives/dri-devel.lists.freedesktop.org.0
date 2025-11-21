Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 11536C78672
	for <lists+dri-devel@lfdr.de>; Fri, 21 Nov 2025 11:14:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 949B110E81F;
	Fri, 21 Nov 2025 10:14:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="J2AEpepo";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DM5PR21CU001.outbound.protection.outlook.com
 (mail-centralusazon11011062.outbound.protection.outlook.com [52.101.62.62])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F31610E816;
 Fri, 21 Nov 2025 10:14:28 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZTx0VgDRzIt0X74vZj36GieoXOk3w5rjUcIXSfVG6xRKPjaWJdNarW75GDrmSeXVdHFqsIZy2CIBFnKn8zfrOtIVIzoSx1JqxPIcuC4nswJ01P9qQeK4kVvrGefUhdKdqPBMEoReAnjebqyF9gLNzPdlaSfAd+pyd8cNdbrAJLo17dLcU73bi4lUANn7TYT7z8x7q3dvqCh9Z5dL4EPgl4ZWanmWNXVoAsbF9y1aY8Ia0zJgMkmBKxiGvdHrxvXU7D+CgOCOUd4bcVSMwG72zKL+AKyTb5duL9ESAxGkD8g/KA2rjMYg+g9DD+bQj820dwfoOD0t+SAB/3FOPnKsiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DNPjW4gjZGCF7Xbyeqm/c0oqYq+nlfeoWL3Hkc7uv3w=;
 b=KJfIuCkEGdvTMZ+vjWwFk6VZqRPJKtWH45wfGIubQfPkg2suyA6B/rmHM0Jj18y9jQNuGSZYs0d7BmF1S4OJNmb6WUHq8HdWO7jK+W4KmiRiBUAiPPmWikC2KkffK4ZpoRjbhpQyBPCQmhRBAeZGuav1GOcJ+1KBEjDeTBl7+jzm/HQqBpTGg3F1/JFdMNX0SdR795OCuzZNmay5CGHnWpkku5isAWmIN2rHqI3V5kHdjzPlOxYemKHvXNwRb9ZtP7Li0Bpp6N4TR3n9uC9fTV9Xrbu1Q6QOk0xFHlhlAdNjWVXT4+nBC7lQ6yEpErrl6YIA34eNiG2zJder61pLAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=gmail.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DNPjW4gjZGCF7Xbyeqm/c0oqYq+nlfeoWL3Hkc7uv3w=;
 b=J2AEpepo8IXT4lhxHFhzlEc53iWV2oJML5HKbxQACJ4iCJCYZpg1oM5eqYQ0g6XvKIw8FPxryESrviB+zRXndJHJPAppgCR5yVyOuRfCUWOlvDXvL4LWSvOULvFsKWpu0AW5NxPuUhvef2ODvpl/ycNE728WTtwNYEz7jcIqSeI=
Received: from BN9PR03CA0602.namprd03.prod.outlook.com (2603:10b6:408:106::7)
 by DM4PR12MB5890.namprd12.prod.outlook.com (2603:10b6:8:66::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.10; Fri, 21 Nov
 2025 10:14:25 +0000
Received: from BN2PEPF000055DE.namprd21.prod.outlook.com
 (2603:10b6:408:106:cafe::51) by BN9PR03CA0602.outlook.office365.com
 (2603:10b6:408:106::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9343.12 via Frontend Transport; Fri,
 21 Nov 2025 10:14:16 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BN2PEPF000055DE.mail.protection.outlook.com (10.167.245.8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9366.1 via Frontend Transport; Fri, 21 Nov 2025 10:14:25 +0000
Received: from FRAPPELLOUX01-WSLPUB.amd.com (10.180.168.240) by
 satlexmb07.amd.com (10.181.42.216) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Fri, 21 Nov 2025 02:14:23 -0800
From: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
To: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
CC: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>,
 <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>
Subject: [PATCH v3 07/28] drm/amdgpu: fix error handling in amdgpu_copy_buffer
Date: Fri, 21 Nov 2025 11:12:17 +0100
Message-ID: <20251121101315.3585-8-pierre-eric.pelloux-prayer@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251121101315.3585-1-pierre-eric.pelloux-prayer@amd.com>
References: <20251121101315.3585-1-pierre-eric.pelloux-prayer@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF000055DE:EE_|DM4PR12MB5890:EE_
X-MS-Office365-Filtering-Correlation-Id: eab09efa-6aef-46b7-dfac-08de28e6bf62
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|1800799024|376014|36860700013; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?51Ur8LppUj6p0POU9T3i1E9rw2HHGjfhZCiH8E+h0sUFRTHd5gZaOmYhkUG4?=
 =?us-ascii?Q?PWCrBwDyo3n4dqivh0ANpzXs9/cW3M0Iba0QSNcFs1dIY86uLq47jqImYpyx?=
 =?us-ascii?Q?pnZN8P6qLIfPhyvctdEgNXFiBOKN877T/UpLqfa3a2W18F+ftCZhG5GYN3/P?=
 =?us-ascii?Q?8EHuJ4rLYr15BO23xsP5erQOKfWHwC+r+WuHxZVbB9Oe4yKlw5vgVBz9nIVv?=
 =?us-ascii?Q?/Ki1YaovtiqMaaMIOZN0Xh45L/JHo7K0Ag+Sdj/C+IEIIIiEQ/dujjoDC21p?=
 =?us-ascii?Q?XTZz0WJoJ5qrjRK8MZqWUdhO9fWh/ol6FDx5ph97LpMIHLJJNpbb4jmYM95X?=
 =?us-ascii?Q?BLIAPg3D/xDtPARjgKr6fqH97gWcX8Hjlt2XezDSBK63NOZZCO7rdjXFOwyH?=
 =?us-ascii?Q?LbRLdJJScYpoVnXlk05gGLui02Jw/DbJFN36S9bV5SGMK8s4S+4A8nuQIL/h?=
 =?us-ascii?Q?mMLPc1ivuvz4KFLKrChlkGSxISYX3Xi1fn83MirgxU0VOz/VScRWISEeyS3c?=
 =?us-ascii?Q?Av9to1eGG2Uvn3Fy93MFZXdhPu/ZW1lqfbKxpg03czx7FpdwWeh+Ksr6tsAM?=
 =?us-ascii?Q?N//2otIWr/szuGCt1TzTCOWTQtzXTO4ERZzLPWzJXqmxD/3yJCYKMWDcQocT?=
 =?us-ascii?Q?8wiHZcHuqiwSBDYpUxFU6F+i2dYYZFiQSHdnX3uTcICCAkDfI+/ewxaWH4+h?=
 =?us-ascii?Q?SbQWvQrLnqJ80Ch5/W+f1ycFa++4PSHKELRkLyzC2T3j8Dan5DjlmUrODaDv?=
 =?us-ascii?Q?4hZPQTpyUfa596e4iSKaYgrn13YXNeoF+C5cSH8+6rcpEKSxVcyDws2wl+Rl?=
 =?us-ascii?Q?0Qab2ZVOn4acPcDiHYN4KrPjZrVBi+C93kB9pKa7Kh0YrSVM3m0xKzjgAHNc?=
 =?us-ascii?Q?WnpNxOmXRgYnzeThQXKeLGd31nwuuiBiliw0y1wXJ7M2NYka4Znu+GLwUPkE?=
 =?us-ascii?Q?PEprw67D1ARpis3LECfLCIowj/13AE+NcY0CvvR6H5qhzS6mvaBN1Xu0AMiZ?=
 =?us-ascii?Q?lcKYSLeqFQHZv80ZswoK76tSZE0WdGD25dEzulqeet8Y4rTUS8SjArD0JxuY?=
 =?us-ascii?Q?5Dh7oo7glcxp5oGFcFf/W4tTLJTMQp4AuTyNN4QgSXz3VzOGNH2X1Vq1VNZz?=
 =?us-ascii?Q?ZhM2BYr6LIdMElF7j7Tzt6FapUIMfdi+Lv/8NLerX70aIalRQXIr1GO/Qjqs?=
 =?us-ascii?Q?mKwd+frC0osz61aOzMEyLBTf/NwqGNEc8DL/VorpxvaqR6PV81jj2mBwHQ1c?=
 =?us-ascii?Q?T5tZtvvU7vtzsxN6k9+s7Al9DqYqkdjF1iRt0DPXpf7nEM/W1dw109CdEctt?=
 =?us-ascii?Q?Js4F4zrGGEb9F4O9WrmBHu3V45oUu6D1xfB9x9yOTKkzk+073aYkPa4lo61W?=
 =?us-ascii?Q?uIcyt4O/KuYCqQXYnnExZPAbLZFX/amN2PWZ6AMp2XlThH/4pyqyAKHyvdZ1?=
 =?us-ascii?Q?nW2RhMDe3XuL1MYUpUHMq2+9KYAVFDvOSoVV1bUgC68HQivTB0W/TyC8vuY+?=
 =?us-ascii?Q?Xqii3Wna8Rb1Q45X6mnpKarJFoAnHK++5mWVMdmV2rZPrsA+oRSn107hxDER?=
 =?us-ascii?Q?fW1tQqNdDCD3u5eNHK0=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(1800799024)(376014)(36860700013); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Nov 2025 10:14:25.1297 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: eab09efa-6aef-46b7-dfac-08de28e6bf62
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN2PEPF000055DE.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5890
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

If amdgpu_job_alloc_with_ib fails, amdgpu_ttm_prepare_job should
clear the pointer to NULL, this way the caller can call
amdgpu_job_free on all failures without risking a double free.

Signed-off-by: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
index be1232b2d55e..353682c0e8f0 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
@@ -2233,8 +2233,10 @@ static int amdgpu_ttm_prepare_job(struct amdgpu_device *adev,
 	r = amdgpu_job_alloc_with_ib(adev, entity,
 				     AMDGPU_FENCE_OWNER_UNDEFINED,
 				     num_dw * 4, pool, job, k_job_id);
-	if (r)
+	if (r) {
+		*job = NULL;
 		return r;
+	}
 
 	if (vm_needs_flush) {
 		(*job)->vm_pd_addr = amdgpu_gmc_pd_addr(adev->gmc.pdb0_bo ?
@@ -2277,7 +2279,7 @@ int amdgpu_copy_buffer(struct amdgpu_device *adev, uint64_t src_offset,
 				   resv, vm_needs_flush, &job, false,
 				   AMDGPU_KERNEL_JOB_ID_TTM_COPY_BUFFER);
 	if (r)
-		return r;
+		goto error_free;
 
 	for (i = 0; i < num_loops; i++) {
 		uint32_t cur_size_in_bytes = min(byte_count, max_bytes);
@@ -2289,11 +2291,9 @@ int amdgpu_copy_buffer(struct amdgpu_device *adev, uint64_t src_offset,
 		byte_count -= cur_size_in_bytes;
 	}
 
-	if (r)
-		goto error_free;
 	*fence = amdgpu_ttm_job_submit(adev, job, num_dw);
 
-	return r;
+	return 0;
 
 error_free:
 	amdgpu_job_free(job);
-- 
2.43.0

