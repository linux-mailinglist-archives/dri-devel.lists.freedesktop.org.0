Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D41C5574A34
	for <lists+dri-devel@lfdr.de>; Thu, 14 Jul 2022 12:13:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A10EAA3FC6;
	Thu, 14 Jul 2022 10:12:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam02on2086.outbound.protection.outlook.com [40.107.95.86])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C103FA36C2;
 Thu, 14 Jul 2022 10:12:49 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DwdQFtAnEA2FEYFv0hsUd/oV3FNg8gWL/Y/an9MlwU6OMP4PrDf1RpHATuVld49tiyERsXiOZL9b/yQ+kHX02Hs3Z8PsMSAMjZCqRYS1LHZ6OlOt7MEDmj2KfnsKLFqxNyBi2mg2kEZGq1mGjcYzHox3WU3ryTqMCgnzrbRZ+iYCLfTZGaliFRUtLNMrxxEV8tufzdb34lSnIK7DUHd9TkO2l9NP7ZyPuFBPhEz5b6K5PTM7Nvdc1yobCe8Ehma2h8lW3NUEjuddI2RM3jUYNznyvHNIhncKcvIKVuR8hzWd/ixEAGfh9z24s+aH7Fq0imRJrQzTMkGos41ukEG4QA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lZKMp4PTEJftDYBEJbtJExHIrmSB0xob1gl+TQaz2XY=;
 b=BLKeqcAsAjz1CUPJeucL/0+7pmh9snaMF6TwoN3d7pNjYaujxRcXNU2pbfp38pVWqGG7S/UsnAvgqDpI+kOB/Vk+H3F7zN/tGO4bQ/S0H/YPgcWyPWBc9RhhUK2G5GUEhSlZPO5y7pCvVJn4JfKCtVny3BmwBXk9MvAbUdXiURtcoS5P1m6QSqYm6xuvNbB4yLXtMXN9Usayo5WPd7b3HrRHB4jyxz6YgdRRSl+zW0I9VChD4ogATVyYNxU5AjaLhRUgw2OR/HDpQPRoIq8ENa0U7a3G8XSU15cI59SUDjVuT79qY1ERIIPamaLq5uCwY75SGts8TuIY3jYVn3ujwg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lZKMp4PTEJftDYBEJbtJExHIrmSB0xob1gl+TQaz2XY=;
 b=fHcA16ts+kzJzOt0lfNxaOnOZT6C8mLKifmSUTX0ulZ4t1q5RUThkOBcHIL2wSvGbH94LS0XkxzFhvtiK5Sby+wACnVJ8JO/hnOTVSy/SoXc5SM3K3/GREjCpFxj7GPR9UWKS7pN456oZ7kdKZREJEjM1/q13U+bhF8kMlhEvIs=
Received: from MW4PR04CA0087.namprd04.prod.outlook.com (2603:10b6:303:6b::32)
 by CY4PR12MB1480.namprd12.prod.outlook.com (2603:10b6:910:f::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.19; Thu, 14 Jul
 2022 10:12:47 +0000
Received: from CO1NAM11FT014.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:6b:cafe::17) by MW4PR04CA0087.outlook.office365.com
 (2603:10b6:303:6b::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5438.12 via Frontend
 Transport; Thu, 14 Jul 2022 10:12:47 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT014.mail.protection.outlook.com (10.13.175.99) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5438.12 via Frontend Transport; Thu, 14 Jul 2022 10:12:46 +0000
Received: from amd-X570-AORUS-ELITE.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28; Thu, 14 Jul 2022 05:12:35 -0500
From: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>
To: <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>
Subject: [PATCH] drm/amdgpu: Fix for drm buddy memory corruption
Date: Thu, 14 Jul 2022 03:12:14 -0700
Message-ID: <20220714101214.7620-1-Arunpravin.PaneerSelvam@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 461db88e-b3fc-4810-1417-08da6581666b
X-MS-TrafficTypeDiagnostic: CY4PR12MB1480:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: VGesFKhtpWNjlxlSAGDNN08GvDjqcOQ2ikk5SgP00b33IFg6q5MtNaOHlYJFlwKXPYqImJk1hR0j2/vmU4kM81OEiEQt4Uff+qFUm8rWaauuDqBnoPeAldHIzfumZgArdj0Cl9QkUFGzHMe5e/bzRNR6VxpyNVt9qxMLRhSzg4iHiADGzKSvZLFzZMe5sVss5nfjKq3hub9Cdb13eTD7pydbFMBpJeS5vu4NieE2o9KdZsLFwz7m28X9t2lcE2OcqGm8WWesPVuKkhUMB0oJNib8D9Nak2Pwh1l3+Y1nQ0IzExFSDiFk6vgl62CRaAALVxY7qtea7CVYnpMIfViLKXi+B0HmPSObgTDdV2DrVi117APdcAs0DCQAXxAAfd97dQlVT2pB5fPVAzVqCpyJXjMAM20A/yFbuBsDO1fVWg58tS56i9L6Xc+WdftLjpg6TwN18BfN4PZb+60GktP5qcv1u7uRrE2gY8gzvMduG3hio7RjxqmhGEfboab8uCPcrMBikmFuDl3mGs3QE3FzZuETlQKYPJl3ZIgRlBVQn83KbMH+pygAnzmDSjNO0qfKi0nPf0hxRSO3Md1KL4o4deYyGOadtWYMRy1BI1DgK+qEq/y5rWeFH9bLRbPubRlB+Tyt1Kdgq2vxY2keMjWSBc3Vp6aiRGL/CGN0FIJL4hULjuzHKRjjbzcGfoddRZmxz6TTfz8cN67M/80qpwq4NfRBMf1UGEyC3saswr/eyrrvUVOa1nSArPQgfqVIbbFsT3uSSHGc7LkpRE29uMv3yDNkmil5oo06wJvmnuixv3TjsIkc7uloxbHidbFoZU4N/vgyUkwi4gsFUJGhK1wSB5Zf4UUL6FfNvk5iGvfUqQM=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230016)(4636009)(396003)(346002)(376002)(136003)(39860400002)(40470700004)(46966006)(36840700001)(110136005)(86362001)(26005)(7696005)(82310400005)(478600001)(2906002)(81166007)(8936002)(356005)(82740400003)(54906003)(16526019)(70586007)(316002)(6666004)(2616005)(70206006)(426003)(47076005)(36860700001)(8676002)(40460700003)(4326008)(336012)(5660300002)(1076003)(186003)(83380400001)(40480700001)(41300700001)(36756003)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jul 2022 10:12:46.7951 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 461db88e-b3fc-4810-1417-08da6581666b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT014.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR12MB1480
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
Cc: alexander.deucher@amd.com, christian.koenig@amd.com,
 Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

User reported gpu page fault when running graphics applications
and in some cases garbaged graphics are observed as soon as X
starts. This patch fixes all the issues.

Fixed the typecast issue for fpfn and lpfn variables, thus
preventing the overflow problem which resolves the memory
corruption.

Signed-off-by: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>
Reported-by: Mike Lothian <mike@fireburn.co.uk>
Tested-by: Mike Lothian <mike@fireburn.co.uk>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c | 16 ++++++++--------
 drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.h |  2 +-
 2 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c
index 49e4092f447f..34d789054ec8 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c
@@ -366,11 +366,11 @@ static int amdgpu_vram_mgr_new(struct ttm_resource_manager *man,
 	unsigned long pages_per_block;
 	int r;
 
-	lpfn = place->lpfn << PAGE_SHIFT;
+	lpfn = (u64)place->lpfn << PAGE_SHIFT;
 	if (!lpfn)
 		lpfn = man->size;
 
-	fpfn = place->fpfn << PAGE_SHIFT;
+	fpfn = (u64)place->fpfn << PAGE_SHIFT;
 
 	max_bytes = adev->gmc.mc_vram_size;
 	if (tbo->type != ttm_bo_type_kernel)
@@ -410,12 +410,12 @@ static int amdgpu_vram_mgr_new(struct ttm_resource_manager *man,
 		/* Allocate blocks in desired range */
 		vres->flags |= DRM_BUDDY_RANGE_ALLOCATION;
 
-	remaining_size = vres->base.num_pages << PAGE_SHIFT;
+	remaining_size = (u64)vres->base.num_pages << PAGE_SHIFT;
 
 	mutex_lock(&mgr->lock);
 	while (remaining_size) {
 		if (tbo->page_alignment)
-			min_block_size = tbo->page_alignment << PAGE_SHIFT;
+			min_block_size = (u64)tbo->page_alignment << PAGE_SHIFT;
 		else
 			min_block_size = mgr->default_page_size;
 
@@ -424,12 +424,12 @@ static int amdgpu_vram_mgr_new(struct ttm_resource_manager *man,
 		/* Limit maximum size to 2GiB due to SG table limitations */
 		size = min(remaining_size, 2ULL << 30);
 
-		if (size >= pages_per_block << PAGE_SHIFT)
-			min_block_size = pages_per_block << PAGE_SHIFT;
+		if (size >= (u64)pages_per_block << PAGE_SHIFT)
+			min_block_size = (u64)pages_per_block << PAGE_SHIFT;
 
 		cur_size = size;
 
-		if (fpfn + size != place->lpfn << PAGE_SHIFT) {
+		if (fpfn + size != (u64)place->lpfn << PAGE_SHIFT) {
 			/*
 			 * Except for actual range allocation, modify the size and
 			 * min_block_size conforming to continuous flag enablement
@@ -469,7 +469,7 @@ static int amdgpu_vram_mgr_new(struct ttm_resource_manager *man,
 		LIST_HEAD(temp);
 
 		trim_list = &vres->blocks;
-		original_size = vres->base.num_pages << PAGE_SHIFT;
+		original_size = (u64)vres->base.num_pages << PAGE_SHIFT;
 
 		/*
 		 * If size value is rounded up to min_block_size, trim the last
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.h
index 9a2db87186c7..bef0f561ba60 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.h
@@ -50,7 +50,7 @@ static inline u64 amdgpu_vram_mgr_block_start(struct drm_buddy_block *block)
 
 static inline u64 amdgpu_vram_mgr_block_size(struct drm_buddy_block *block)
 {
-	return PAGE_SIZE << drm_buddy_block_order(block);
+	return (u64)PAGE_SIZE << drm_buddy_block_order(block);
 }
 
 static inline struct drm_buddy_block *
-- 
2.25.1

