Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F218666872
	for <lists+dri-devel@lfdr.de>; Thu, 12 Jan 2023 02:33:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D89A10E84B;
	Thu, 12 Jan 2023 01:32:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2057.outbound.protection.outlook.com [40.107.220.57])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DBFC210E2DA;
 Thu, 12 Jan 2023 01:32:31 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=O89PNh7waA6isg5eXi127hvSwhDxkqK2KcgKcWHPbVW6U1BIwB5dqCAXxQc1tmSySbjuYiZxkTC+SATbyoJymBZUq6pzLQC+Pue6ikUL8OQpMcFv2SGSe7RSeSbDCZPNTfX9yn7cRhrV70mctb54FnUhlTt6MLIjiLKcTim+TgT6W6k11zRspl4SKY8GgK1jHKaCM0Z1Be1Ixc6XBLYat9y8Ay2xoblvvbuiY4dLva/kJuHvrLZ8ug0r0tKdevROlPetlsyza5x6K4Xf/5JYkVTvgmkt6d1+1Pedv2OPqbW/n0KNl3he1lDklG0tbVjCy1gRFuTPyYTUEUBOxbpVGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=++T3VQVoj24pNcg2/m48++Kfit5g6REbDL4xXoK5QNg=;
 b=g5bmKMhtEAvAAiFiu+MPZBN6lFQmB0O7EXCYQ6Cvx2ctWWN3BS/E57DTNZN6d2AONJUP9RnOHd7PIaFiyCKjYPo9zDi3vjQOtmpnnPRpyhkuaqllMOuxAPjSydk2KRC39wVFRvqpf5btH0/p3dRoDIC4wwS8WcvAefdt6gJ6ipytk9He5ylnl48+apmO1Ur6ZjNpGUAc5AW8fC6j3qQ5pMMidmVeajRStcndlA1/wq/QONPOLPxpEu0bj+T6/Zx7YMnyevAkWqNFLPEBTOS2gzNTswZ9VPE1kfizPSvp+T2twzH6kq19Iz42ZzPTVozHaBq6oV/d7rsHj3kGJtOXNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=++T3VQVoj24pNcg2/m48++Kfit5g6REbDL4xXoK5QNg=;
 b=hmi4zU8w3yzw+iQ1QyBOmAWG3u2NhY387OD2Xe7lXeSgjTzfw1SeHYkXpthl/kLbyfHDzyf9p80EBu9+INTirsdh+BCrIIIokCXDQt/gmB/VizphMDCD2fUH32cUAQa7V/Dyyahygma8GAW9BBJACKL+Fcip9S1iaiRoo4ASN0M=
Received: from MW4PR04CA0170.namprd04.prod.outlook.com (2603:10b6:303:85::25)
 by IA1PR12MB6387.namprd12.prod.outlook.com (2603:10b6:208:389::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.18; Thu, 12 Jan
 2023 01:32:30 +0000
Received: from CO1NAM11FT063.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:85:cafe::c6) by MW4PR04CA0170.outlook.office365.com
 (2603:10b6:303:85::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.13 via Frontend
 Transport; Thu, 12 Jan 2023 01:32:29 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT063.mail.protection.outlook.com (10.13.175.37) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5986.18 via Frontend Transport; Thu, 12 Jan 2023 01:32:29 +0000
Received: from Harpoon.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Wed, 11 Jan
 2023 19:32:27 -0600
From: Felix Kuehling <Felix.Kuehling@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
Subject: [PATCH 5/6] drm/amdgpu: update mappings not managed by KFD
Date: Wed, 11 Jan 2023 20:31:56 -0500
Message-ID: <20230112013157.750568-6-Felix.Kuehling@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230112013157.750568-1-Felix.Kuehling@amd.com>
References: <20230112013157.750568-1-Felix.Kuehling@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1NAM11FT063:EE_|IA1PR12MB6387:EE_
X-MS-Office365-Filtering-Correlation-Id: df4dca30-1511-46bf-30b4-08daf43cde83
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: JUJpwiSEPtBmI5ovj3tBSwMunSRIlEkTty1U65oUyCLwS9PM9empJbyBSDDZaqPaE/Xtj2TF1aEObRfVrlvIjY/RKPY8+qYHQ2gjx7kXUIM1aw2uuQM/pXNRuy2P9qLg31qr7cOfQGmRlvtqvFwVwBLH0P5I2ub2+bpVskUegUJkAL9F2lgPTjAbKvoC8ej2IWjqEAxshOjgtEW7VAl+e1REAspkAlokcXyDO29jnfEhAVuGCGvg4GMBppzxBI4L6CaySgdr5S2qpJS4YgWi+eY++FDjUn3XANsvum9/7jI1YUDHlhBEteXsyQRNS8a9FuHn+eP0Fs4VlGhPjTiSud0CRBUxLm9AwVFkZAzxTd+NdzMkIhYW5gr/vdZQwIe+psF1WunY/e082HVTcNYMEtkRkmlGstVjhYFGkjYvtDPq7/aP76u6bY6OukaFl3CX5XWxJ1RliolT5NsND5W5GQT2tBAxc4iiXYabt7Ey/gk1Q0KjVcF4/ZZP1j9mUzU+9lIV2A8Jwoepra28ODblTR2iPMYandau1aItBQLOZ8wNopr/mmtMlwlzqjO1bucv6fFyyZ/wn+jJ7N/EZiZegN+bLGlutVKdhLJ0kZyOk29joNjvI0qBl321ww3uhjqjlssUfhaNW8UZxjc7C96G2qXt2ADckqRO5m37Ef2/i7Q3G7Joe1Op9/Fge8uu2ijZ0aFm8LFUb7HkMqM+x/4NnkdVVtns2ZKNs2ET+pkgcLc=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230022)(4636009)(396003)(136003)(376002)(346002)(39860400002)(451199015)(40470700004)(36840700001)(46966006)(4326008)(7696005)(70586007)(8676002)(316002)(54906003)(70206006)(15650500001)(110136005)(356005)(2906002)(5660300002)(81166007)(47076005)(26005)(8936002)(426003)(41300700001)(450100002)(36756003)(83380400001)(36860700001)(478600001)(6666004)(1076003)(2616005)(40480700001)(82740400003)(16526019)(40460700003)(186003)(336012)(86362001)(82310400005)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jan 2023 01:32:29.3295 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: df4dca30-1511-46bf-30b4-08daf43cde83
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT063.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6387
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
Cc: xiaogang.chen@amd.com, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

When restoring after an eviction, use amdgpu_vm_handle_moved to update
BO VA mappings in KFD VMs that are not managed through the KFD API. This
should allow using the render node API to create more flexible memory
mappings in KFD VMs.

v2: Sync with pd fence after all page table updates
v3: Update comments, remove TODOs that are no longer applicable

Signed-off-by: Felix Kuehling <Felix.Kuehling@amd.com>
---
 .../gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c  | 28 +++++++++++++++----
 1 file changed, 22 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
index 79213f476493..df08e84f01d7 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
@@ -2728,12 +2728,6 @@ int amdgpu_amdkfd_gpuvm_restore_process_bos(void *info, struct dma_fence **ef)
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
@@ -2781,6 +2775,19 @@ int amdgpu_amdkfd_gpuvm_restore_process_bos(void *info, struct dma_fence **ef)
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
@@ -2788,6 +2795,15 @@ int amdgpu_amdkfd_gpuvm_restore_process_bos(void *info, struct dma_fence **ef)
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

