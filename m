Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F46168EA6C
	for <lists+dri-devel@lfdr.de>; Wed,  8 Feb 2023 10:02:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D89B10E704;
	Wed,  8 Feb 2023 09:02:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2065.outbound.protection.outlook.com [40.107.223.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 71C6610E704;
 Wed,  8 Feb 2023 09:02:47 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Kpq4dZfipFN9kKrQlQ9jHXSMSNXzuZ67V77XKt5GmWyasgmpLEQqOQCM63OGFT1NYyalsi7dSZScWq8XMuWAcuz+7VRErWRniPuAlHL+lmbBBggOY+E7FRb1A3QUOJz+Mj2rKBdOOmCIVcOVDsP0vEtHSJiVQLV0KphV3dbT8764LShx7F6inViLeNSMr93J9gngdD3q94r9NqseCxXmRM6LBRQDWFX7ksIHADsLtI+yPaOZEl4nqvH06GVHFesp+Bu11j9CySM599bnHp5lUprHgvt6ajhfZyuNQIH3T62LFwnF4fo/Q2h5A7tiC85q7BXoowgwmtbjj3QglNGdhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PounKTCxxcDXcHnibE8aa5/1nd3RV4pXYqzTUawbRkA=;
 b=M4udm7FjNd/8qXrTED/PLb2CiY1X4OD8vgTH9/CbU92pACLEbZlxD6tB8Hucd/y6Kpuo81CDaSpKUpEI7UT4IKmP+lKOjSp7eFACMwvLp6sXh/u+WxOhcI3mmtA9RqQH/y9veE20Ry+tXvSPiumZ9B2o+UajvDaYjnFEHkHoFavOaEU7KdwGo7qDO4tzg/ejdeWb2mvWvrL59HufSh//5bbVPKP7GCZ2kK3nLnMfCUCFzcbq67NLpamj+SMqoTwPboMFVH/4w9UUcxta6WVJd48qXPxRkkhBtLVuqmpVgv9nbMYnKZvwVvfRBPuT/ipXYTzjkAyfDuy8pxX5hOve/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PounKTCxxcDXcHnibE8aa5/1nd3RV4pXYqzTUawbRkA=;
 b=auEfLfmTMcUKmn/4rPzhYHifzTJYCbbBmYTeC7+MRcDdcxFiSjUokiwgbs9ax2JRWflyqq7PlrsknLrRj+hdgKMxhyTMlYzwzImgd1hcwmjtriQzHxUb81aYkhHXEsRAYG6vOIJRlCK1IwIFT1pylg9ZJrdttrwuWN3Nok/7sqk=
Received: from BN9PR03CA0356.namprd03.prod.outlook.com (2603:10b6:408:f6::31)
 by CH2PR12MB4279.namprd12.prod.outlook.com (2603:10b6:610:af::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6086.17; Wed, 8 Feb
 2023 09:02:41 +0000
Received: from BN8NAM11FT015.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:f6:cafe::e3) by BN9PR03CA0356.outlook.office365.com
 (2603:10b6:408:f6::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6086.17 via Frontend
 Transport; Wed, 8 Feb 2023 09:02:40 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT015.mail.protection.outlook.com (10.13.176.90) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6086.17 via Frontend Transport; Wed, 8 Feb 2023 09:02:40 +0000
Received: from amar-X570-AORUS-ELITE.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.34; Wed, 8 Feb 2023 03:02:14 -0600
From: Somalapuram Amaranath <Amaranath.Somalapuram@amd.com>
To: <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>,
 <intel-gfx@lists.freedesktop.org>, <nouveau@lists.freedesktop.org>,
 <linux-graphics-maintainer@vmware.com>
Subject: [PATCH 6/6] drm/amdgpu: Cleanup the GDS, GWS and OA allocations
Date: Wed, 8 Feb 2023 14:31:06 +0530
Message-ID: <20230208090106.9659-6-Amaranath.Somalapuram@amd.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20230208090106.9659-1-Amaranath.Somalapuram@amd.com>
References: <20230208090106.9659-1-Amaranath.Somalapuram@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT015:EE_|CH2PR12MB4279:EE_
X-MS-Office365-Filtering-Correlation-Id: a6773894-61ed-48b4-d20b-08db09b33bc4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: TFEawHphQX7RCC/8iYhv5PURzONbUi+0qZ6L1OI4/jTT8H3kZhF5IqArs3C5zQvHv7sicVC5o/2BWw9zAg4+tqH53iOxE3AA/KgLRkiQISsXPS4BnlcMl7ecpzvkp07neP7RqSM0VaBY27s/ZxYV5tK4Td9UwOzuUuogwmSk3VI37ee5xnXirZoM88hsfp84wn2HB7CYb0jSIjesMXlhkqfgtB75RKTF7/Yij6TovfTO6N7DyMRbHxVyJoYqTy5E7UO9wQeqw9klKhiEplE01InExzzSA/J4QC4WaLv0nkVPck+qMZNlpjWynuDnrzsGjcTlcio3W/26qtgM1ZxPrKAIWnmkajl0ORaNzDloMEgw0C9IiNiBqcFVo+ctIlDtFxw5SaZn7ZPx9C1kBhpoq6u1xwxCFdRZ/f5PM5mV7BSUrs3DpHzEHkggz/pguRzWf1xQg6vAr2PJK64I/a1C0OOQqWb3QEFx6GVkxoZsVafR38uGhF0cbqiJe4FVuRc0bTr3XZCaVoY7vVLA5Du6nUrZvXF+8Q9KzXEbUpLqWCXUu7zAlGw2pLOxtG4fYX6G3+95YV2W4bR40dAiIAPnyj9zgSaephIqg0L36TRmNgPz0DLj1YXlCLLgiuIkFL39XFHrJnOGU5FYLcVniivtPKFktlrVUQlN3HwQRogF8X0lkwML801DRZskXmKbM/eE9uRwag+MKo49fzO/PO4G+spPMLbWohNuyIJQnBKtyGQ=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230025)(4636009)(39860400002)(376002)(346002)(396003)(136003)(451199018)(40470700004)(46966006)(36840700001)(26005)(186003)(1076003)(2906002)(6666004)(36756003)(16526019)(5660300002)(478600001)(356005)(81166007)(82310400005)(8936002)(82740400003)(41300700001)(7696005)(40480700001)(2616005)(47076005)(8676002)(36860700001)(336012)(70586007)(70206006)(4326008)(83380400001)(426003)(86362001)(54906003)(110136005)(40460700003)(316002)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Feb 2023 09:02:40.9138 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a6773894-61ed-48b4-d20b-08db09b33bc4
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT015.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4279
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
Cc: shashank.sharma@amd.com, arunpravin.paneerselvam@amd.com,
 Somalapuram Amaranath <Amaranath.Somalapuram@amd.com>, arvind.yadav@amd.com,
 alexander.deucher@amd.com, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Change the size of GDS, GWS and OA from pages to bytes.
The initialized gds_size, gws_size and oa_size in bytes,
remove PAGE_SHIFT in amdgpu_ttm_init_on_chip().
:
Signed-off-by: Somalapuram Amaranath <Amaranath.Somalapuram@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_job.c    | 12 ++++++------
 drivers/gpu/drm/amd/amdgpu/amdgpu_object.c |  3 +--
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c    |  3 +--
 3 files changed, 8 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
index c3d9d75143f4..4641b25956fd 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
@@ -142,16 +142,16 @@ void amdgpu_job_set_resources(struct amdgpu_job *job, struct amdgpu_bo *gds,
 			      struct amdgpu_bo *gws, struct amdgpu_bo *oa)
 {
 	if (gds) {
-		job->gds_base = amdgpu_bo_gpu_offset(gds) >> PAGE_SHIFT;
-		job->gds_size = amdgpu_bo_size(gds) >> PAGE_SHIFT;
+		job->gds_base = amdgpu_bo_gpu_offset(gds);
+		job->gds_size = amdgpu_bo_size(gds);
 	}
 	if (gws) {
-		job->gws_base = amdgpu_bo_gpu_offset(gws) >> PAGE_SHIFT;
-		job->gws_size = amdgpu_bo_size(gws) >> PAGE_SHIFT;
+		job->gws_base = amdgpu_bo_gpu_offset(gws);
+		job->gws_size = amdgpu_bo_size(gws);
 	}
 	if (oa) {
-		job->oa_base = amdgpu_bo_gpu_offset(oa) >> PAGE_SHIFT;
-		job->oa_size = amdgpu_bo_size(oa) >> PAGE_SHIFT;
+		job->oa_base = amdgpu_bo_gpu_offset(oa);
+		job->oa_size = amdgpu_bo_size(oa);
 	}
 }
 
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
index f5d5eee09cea..9285037d6d88 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
@@ -541,12 +541,11 @@ int amdgpu_bo_create(struct amdgpu_device *adev,
 	if (bp->domain & (AMDGPU_GEM_DOMAIN_GWS | AMDGPU_GEM_DOMAIN_OA)) {
 		/* GWS and OA don't need any alignment. */
 		page_align = bp->byte_align;
-		size <<= PAGE_SHIFT;
 
 	} else if (bp->domain & AMDGPU_GEM_DOMAIN_GDS) {
 		/* Both size and alignment must be a multiple of 4. */
 		page_align = ALIGN(bp->byte_align, 4);
-		size = ALIGN(size, 4) << PAGE_SHIFT;
+		size = ALIGN(size, 4);
 	} else {
 		/* Memory should be aligned at least to a page size. */
 		page_align = ALIGN(bp->byte_align, PAGE_SIZE) >> PAGE_SHIFT;
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
index f0dabdfd3780..a8e444a31d8f 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
@@ -77,8 +77,7 @@ static int amdgpu_ttm_init_on_chip(struct amdgpu_device *adev,
 				    unsigned int type,
 				    uint64_t size)
 {
-	return ttm_range_man_init(&adev->mman.bdev, type,
-				  false, size << PAGE_SHIFT);
+	return ttm_range_man_init(&adev->mman.bdev, type, false, size);
 }
 
 /**
-- 
2.32.0

