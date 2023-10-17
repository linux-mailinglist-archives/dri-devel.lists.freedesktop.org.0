Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 029A87CCEFC
	for <lists+dri-devel@lfdr.de>; Tue, 17 Oct 2023 23:14:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0FD0310E335;
	Tue, 17 Oct 2023 21:14:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam04on2044.outbound.protection.outlook.com [40.107.100.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C57710E341;
 Tue, 17 Oct 2023 21:14:28 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=C7PRxcX1D0CsfLwN6XsrCBRCU9DFM5kYUVQRIfghkR6PS0ghCVgkVrd49RY+WypnDU4ei+jIilv+JOQGWm+Iku1Sk7T66AD7HKyrfqeCTQNpPbItke1s4AN+2abvxRc4WVizK2x/xZ/aQUQ4VJDjZroBTkyEtCGVGhK+BFBIKeR+fn/tFUanEuA2KLM57lxsEb/4trdNoegYfCsoTwq9/gFwNlNPQwcGcZqEvdl95n670sCCTG4mwA7x7KJq0fKKM6Lzxa11Dhd4ZhQEtqD7CXzVSZihatgpvPGqLl2gtOxYU+y1432dZgFGYtALic0MuSNXbLQe0xqZzJ6+6/CxqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+kWWqUPGmqJVUgYDSMPAAJ1OfD4ffYOtd8NRANLghYA=;
 b=f9XOwzvFlZ7f+DWlWk830dbVbyoJCIu8aE9afd6P7GyDMgaTqHlMadqHMwFHK3V2+bT0MHYbppl8mt0xj9uiD7UaBsrS0Iq0x7KSyxfH0YbwDyVEbNZOkFa90spcboy6EgJqdO6n8WUegqymdiMyLZL7Zub/AEQUc6ZqmipirawZ6CDJKZpCo8kyz3buXS0R9Up8tAUVZKAAAdbJzLpF84NcdUI6lk0TaytOFsfkNTD5S7wAYQ5Zq+/mcXvrujwRa2ERvuCOrixnQB7VLYo+VGtP4XN4pv87vfuqedkfy3BT1EN6/PlsNPnksBbtX3pY647O4Rx9saqS7Hd/IZzMhQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+kWWqUPGmqJVUgYDSMPAAJ1OfD4ffYOtd8NRANLghYA=;
 b=d8S5qXWyDRYgmOIRyJM4g3MbMQjg1C2rTEF0aYayMStuCvBDsKOXm/nqNcjbv6zNs1iX7CmERVrwHIwx7z3uGQRfBpNChPaQrZE9Vkzw1r4G8aiai+On/crYHKlnRhyrtVVDVKeS8ghzXSvqQPCvliv92BaPt+7spre1AH4reWQ=
Received: from BL0PR02CA0004.namprd02.prod.outlook.com (2603:10b6:207:3c::17)
 by DM4PR12MB5867.namprd12.prod.outlook.com (2603:10b6:8:66::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6886.34; Tue, 17 Oct
 2023 21:14:25 +0000
Received: from MN1PEPF0000ECD9.namprd02.prod.outlook.com
 (2603:10b6:207:3c:cafe::c9) by BL0PR02CA0004.outlook.office365.com
 (2603:10b6:207:3c::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6886.36 via Frontend
 Transport; Tue, 17 Oct 2023 21:14:24 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 MN1PEPF0000ECD9.mail.protection.outlook.com (10.167.242.138) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6838.22 via Frontend Transport; Tue, 17 Oct 2023 21:14:24 +0000
Received: from Harpoon.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Tue, 17 Oct
 2023 16:14:22 -0500
From: Felix Kuehling <Felix.Kuehling@amd.com>
To: <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 05/11] drm/amdgpu: update mappings not managed by KFD
Date: Tue, 17 Oct 2023 17:13:31 -0400
Message-ID: <20231017211337.1593869-6-Felix.Kuehling@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231017211337.1593869-1-Felix.Kuehling@amd.com>
References: <20231017211337.1593869-1-Felix.Kuehling@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN1PEPF0000ECD9:EE_|DM4PR12MB5867:EE_
X-MS-Office365-Filtering-Correlation-Id: 4cb45e49-39bd-43c4-9ac6-08dbcf560a2b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ObFmGHleIo1wzHP/lXTn7rx5rW5q3ennUYoLiOXb1QpPJOYipAI4moa/pz43aro1l4Gu41lkY+fuKA8s2ToVkrLJD0YMV7MxA8RKoBz7bf0nR5aMkzmNj2eiJb8+Agw9bYaZbcrcCN/J7HfV0aBQ3q/xXxBuNfK8tw9+H+uSG3E0eZGXx1DEkVEGWEWVq45f0Y5agqKqNKTKGVjlr5porhyAQo8ZxD7y1ok0fID0y/ZrKfeIae/BGtx93pgOxe9t4HvCExpIpC8WahDBV6CtcydUBas7q+CX1I6X65Tg33SpL82g8nq13ATiwfeKCii0Ii1bZSJzjQ0BKdUrhzbURc/z8FhfVzvmEi+ez2XYEaNtNyj8xKQlV6nwFDuZW2DBVw1Yh7ESdIbotzELeT75k5ZrIOZNpDlWsYmhLwl2wQNKr2n0Wtpj9aeO3Zp1pWNXTHjH4MyxCSwvalOeZtL+LfqOBD643QeqcezTauxHkZ3DnBd5Ef0783hnUk/dpfBURc9uax/XtcySicFWRps9llukrO8MoBPuoNobeeXtRoGOjMyzassFM1jQZ+v2iq7HQiSufn9+Iz6V213JInTjQwxDg0uvPIzrpzDdDzxTsI42OjliSpbOkkxGwXNp8kP3xYTS3PgZltnMQ9KosrpBh52PF+U8auOmv1Xv+kiZ6PH0L5sY+Cr/vdiDeLIYmMN6ArmVE9hu6biZvZTWjixc+p5EpjJfnRhOEtirftT/1D2MwBCAe/nNwNuFhuvRSx4eVWhSNIffNk32g3ta9JvkNg==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(4636009)(136003)(346002)(39860400002)(396003)(376002)(230922051799003)(186009)(82310400011)(1800799009)(64100799003)(451199024)(46966006)(40470700004)(36840700001)(40460700003)(70206006)(316002)(70586007)(110136005)(16526019)(1076003)(66574015)(40480700001)(86362001)(426003)(36756003)(83380400001)(82740400003)(356005)(47076005)(81166007)(36860700001)(2616005)(478600001)(6666004)(7696005)(54906003)(41300700001)(5660300002)(15650500001)(26005)(336012)(2906002)(450100002)(8676002)(4326008)(8936002)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Oct 2023 21:14:24.7355 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4cb45e49-39bd-43c4-9ac6-08dbcf560a2b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: MN1PEPF0000ECD9.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5867
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
Cc: Xiaogang.Chen@amd.com, Ramesh.Errabolu@amd.com,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

When restoring after an eviction, use amdgpu_vm_handle_moved to update
BO VA mappings in KFD VMs that are not managed through the KFD API. This
should allow using the render node API to create more flexible memory
mappings in KFD VMs.

Signed-off-by: Felix Kuehling <Felix.Kuehling@amd.com>
Acked-by: Christian König <christian.koenig@amd.com>
---
 .../gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c  | 28 +++++++++++++++----
 1 file changed, 22 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
index 7c29f6c377a8..2e302956a279 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
@@ -2892,12 +2892,6 @@ int amdgpu_amdkfd_gpuvm_restore_process_bos(void *info, struct dma_fence **ef)
 	if (ret)
 		goto validate_map_fail;
 
-	ret = process_sync_pds_resv(process_info, &sync_obj);
-	if (ret) {
-		pr_debug("Memory eviction: Failed to sync to PD BO moving fence. Try again\n");
-		goto validate_map_fail;
-	}
-
 	/* Validate BOs and map them to GPUVM (update VM page tables). */
 	list_for_each_entry(mem, &process_info->kfd_bo_list,
 			    validate_list.head) {
@@ -2948,6 +2942,19 @@ int amdgpu_amdkfd_gpuvm_restore_process_bos(void *info, struct dma_fence **ef)
 	if (failed_size)
 		pr_debug("0x%lx/0x%lx in system\n", failed_size, total_size);
 
+	/* Update mappings not managed by KFD */
+	list_for_each_entry(peer_vm, &process_info->vm_list_head,
+			vm_list_node) {
+		struct amdgpu_device *adev = amdgpu_ttm_adev(
+			peer_vm->root.bo->tbo.bdev);
+
+		ret = amdgpu_vm_handle_moved(adev, peer_vm, &ctx.ticket);
+		if (ret) {
+			pr_debug("Memory eviction: handle moved failed. Try again\n");
+			goto validate_map_fail;
+		}
+	}
+
 	/* Update page directories */
 	ret = process_update_pds(process_info, &sync_obj);
 	if (ret) {
@@ -2955,6 +2962,15 @@ int amdgpu_amdkfd_gpuvm_restore_process_bos(void *info, struct dma_fence **ef)
 		goto validate_map_fail;
 	}
 
+	/* Sync with fences on all the page tables. They implicitly depend on any
+	 * move fences from amdgpu_vm_handle_moved above.
+	 */
+	ret = process_sync_pds_resv(process_info, &sync_obj);
+	if (ret) {
+		pr_debug("Memory eviction: Failed to sync to PD BO moving fence. Try again\n");
+		goto validate_map_fail;
+	}
+
 	/* Wait for validate and PT updates to finish */
 	amdgpu_sync_wait(&sync_obj, false);
 
-- 
2.34.1

