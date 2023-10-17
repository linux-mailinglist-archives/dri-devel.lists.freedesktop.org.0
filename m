Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B57DC7CCEF1
	for <lists+dri-devel@lfdr.de>; Tue, 17 Oct 2023 23:14:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD8C710E332;
	Tue, 17 Oct 2023 21:14:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2077.outbound.protection.outlook.com [40.107.223.77])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2DC3810E32B;
 Tue, 17 Oct 2023 21:14:24 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=E3yDyWFj2+o/ALO6vSuUx7KuFivbCfcbNU7+B3cWO9KFNN8FdRls6HcClnp08J7t8LiHwkPCQ5fZlLfSO4if/u9hPmg/VFbAgXwqIIusx2pHJ7hAKWXPdSHbEcmjsjMXa/fQ9vnOP/T0k/5fcOsy+Vy0nbFe9MiHE/TGpDv0O9wzFgpdrKp8+dMI31T0s6chiwnjwfQZtTT6EUIODyKxIrZLUqGFn5xJZR6Wv/+4eN45cJBKWWCOPxN6N7PJo72aJHXHZNjF5qHGh+2+1SgfqFR11swwoaV2//OBJLwidHx9vhBT0N/FS7qpJAHI4bcEYKKaD68hrfXlt2YJAClXcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7sZinNPWFmaotSiWfnlXYvYAEgtu3zQtdKvllRSF47s=;
 b=ZVvd0TDCm2jxbZJrpY2wrUGA6WkzYqDNwNFrp5EliVrq8Jl/8D4wfzQqxZfJIu12yoVFKpFJniHm8zNp4n15JyqDJWLZs9cCKxBubEhHC39t2paSe2Sgl1+gVMcAOkcKcOqYUCpWDAJlF6PXu0pajslH1WpkMXw1hLKWOpYM6/gB6wGjWM0Iccc+2tWYB2fgpx+uNojwKLZ5to+eJk7CT2J48/FQE8HwTBbw4KF+UUlp4DhbHRFWKpGX9Lj295WYjkNwAi833xc5R01iOtfftEXzEaRgkZxFRDDWCi8pYMq0TxA8FSay7Q6utAH1x8ArZNj7JTnbmJxuSdOzCJBdIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7sZinNPWFmaotSiWfnlXYvYAEgtu3zQtdKvllRSF47s=;
 b=Rcf5nD75BwBdjRMcZTVei9a8B3fHQaDRS5MoueDK3gSNi+RSlFSBT0zdIT7w6TurqyhcuvQHJY87zYQr+uTrEWEkUdo5vk8WT9fn4MRIW48BO/pHhO6ZdtkAwelVBQiTMCmOBK3EgP6vR/4P3bueVE4lQupT0dGuBOBdzewPgfw=
Received: from BL0PR02CA0025.namprd02.prod.outlook.com (2603:10b6:207:3c::38)
 by CH2PR12MB4214.namprd12.prod.outlook.com (2603:10b6:610:aa::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6863.37; Tue, 17 Oct
 2023 21:14:21 +0000
Received: from MN1PEPF0000ECD9.namprd02.prod.outlook.com
 (2603:10b6:207:3c:cafe::f9) by BL0PR02CA0025.outlook.office365.com
 (2603:10b6:207:3c::38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6907.21 via Frontend
 Transport; Tue, 17 Oct 2023 21:14:21 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 MN1PEPF0000ECD9.mail.protection.outlook.com (10.167.242.138) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6838.22 via Frontend Transport; Tue, 17 Oct 2023 21:14:21 +0000
Received: from Harpoon.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Tue, 17 Oct
 2023 16:14:20 -0500
From: Felix Kuehling <Felix.Kuehling@amd.com>
To: <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 01/11] drm/amdgpu: Fix possible null pointer dereference
Date: Tue, 17 Oct 2023 17:13:27 -0400
Message-ID: <20231017211337.1593869-2-Felix.Kuehling@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231017211337.1593869-1-Felix.Kuehling@amd.com>
References: <20231017211337.1593869-1-Felix.Kuehling@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN1PEPF0000ECD9:EE_|CH2PR12MB4214:EE_
X-MS-Office365-Filtering-Correlation-Id: a5bad8f0-b11f-4db5-7787-08dbcf56085f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: dOV8ox7xSzNgRcVXVHv3okWHt0mNFjF6dXG+9zQwIzOZEAvzFDxF4l0iLPe7+Ar9fOdOwBiBEt/lQkpQXWNiuTGjkQ4YkMCNYClpb6nZgOQIrc8p8eTD7csAm+O6zKLHNdooj6vKZuf5C0gr3xrbfPx+JIKvacmNu2KRjreTJSzy8/xXowNTnGDhyy6vLWduGGgrRfFGyJKnCgQFsCPXJcKOXbfSp6D+VLXxw4tWPV2pyzwMbJBg3+Bl2axqY61qLpDyI3VN8bLmd3dfAs1z/P9R8wqTpZb/f0bXgac4vs1pQ0Sk0qVDXui09RuWS/TNsfEgaE4jeebP2hFUdyRguMdLpG9p9Sm+jSWiElb6jcQ5/XgZH7JCIxK9V+KpOMJVNYJ9bwS6/NlVwCZXz7qqezGrWMLkudgoIACb7fNB7r87ws0xF3IgLAB4qPxobC79l/y1q3RBjLgY5y0aKn1WSKN9mF1STO2xI+OuU9r+Mon2E/A0qs6UopX6If9FlbeFaTjp2uePpJf1sEG5TOh0dONtcGDnCzCUxSYyLkRX+KKk9gFH2vziijcG5W0il57YIS6wv//7HVfpf3OwXdUJWGeKKdIU4X6VNEeGzbicWoWoB3M70L4EKhZ5g8sqluPWQW5EaQ9cuWG6cJYVcc4DZwY+/WkWXEms+kwW0+bRY5WEKOL0UyNi1jLobTFSJkLOrwc/Zm3bQl4npqiLup5WgIG2q/Pq9DXT34no327zoR7KPZ6Hds+GMoGjVw9w0MgIV4pR82JUuKbA8zbLazGWUw==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(4636009)(376002)(396003)(346002)(39860400002)(136003)(230922051799003)(64100799003)(82310400011)(1800799009)(186009)(451199024)(46966006)(36840700001)(40470700004)(110136005)(86362001)(8676002)(450100002)(41300700001)(5660300002)(54906003)(8936002)(70586007)(4326008)(316002)(70206006)(40460700003)(4744005)(2616005)(2906002)(36860700001)(47076005)(356005)(40480700001)(82740400003)(83380400001)(81166007)(16526019)(1076003)(26005)(7696005)(478600001)(426003)(336012)(36756003)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Oct 2023 21:14:21.7198 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a5bad8f0-b11f-4db5-7787-08dbcf56085f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: MN1PEPF0000ECD9.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4214
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
Cc: Xiaogang.Chen@amd.com, Ramesh.Errabolu@amd.com, Christian.Koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

abo->tbo.resource may be NULL in amdgpu_vm_bo_update.

Fixes: 180253782038 ("drm/ttm: stop allocating dummy resources during BO creation")
Signed-off-by: Felix Kuehling <Felix.Kuehling@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
index 46d27c8ffff7..d72daf15662f 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
@@ -1007,7 +1007,8 @@ int amdgpu_vm_bo_update(struct amdgpu_device *adev, struct amdgpu_bo_va *bo_va,
 			struct drm_gem_object *gobj = dma_buf->priv;
 			struct amdgpu_bo *abo = gem_to_amdgpu_bo(gobj);
 
-			if (abo->tbo.resource->mem_type == TTM_PL_VRAM)
+			if (abo->tbo.resource &&
+			    abo->tbo.resource->mem_type == TTM_PL_VRAM)
 				bo = gem_to_amdgpu_bo(gobj);
 		}
 		mem = bo->tbo.resource;
-- 
2.34.1

