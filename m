Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CAF4D4DBB99
	for <lists+dri-devel@lfdr.de>; Thu, 17 Mar 2022 01:20:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8DF2510EAB9;
	Thu, 17 Mar 2022 00:20:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam08on2088.outbound.protection.outlook.com [40.107.102.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B09210EAB2;
 Thu, 17 Mar 2022 00:20:45 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=j7gCnZTnfLEMF93HNnqcIbYkGceaH5tfImrrL2h8SPV+W81JJrHlF+itLM/4JEciHcpPFBDY/NKacoA2ZarDe1nNYkkH/9fPDB0OyymHD44ACoYC27hxAoKwmzEXemPzDH8DnBhKpi6THL9Hns73RTV+fBihbBxvdqBIDsAbxeJk0e07D5ZBBuxjYHyvDmeUONDUinv55PxFDI3VQ6dDUe0YXrbQxO4tSLjHB74TK+RvDMeVfiFWKEg8XUmsMI4qbte30YvzshZJpbybiR0TYeBi1jAX+3no9ZG6lj64C6gqhSApfDFaMjqxZiArRfFqmNvgrHrEVl9XuvupCpQxtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WDoHN+JZFMvmGS9jKuh/kf6G9e3ZTX4JHS3fZk7+TUc=;
 b=W7Gpzk0YEChwd/CGX02HadiMPiAZy2B8QZC6MCNehJS6WRihkOTsx/DfqJ1oEIlKi/WynrIQIXwYyYaO+IKbgblF5w6i0kw/qLJtWSRr+n2DIdMuzFy4RecEniBMBL+DDcP8BgUEvZFhIDEh9nfoc4OA3KHxXGEshyLbDEZueeAER/y75JlpI/5l1X/rNWJ5s27VF0lGZq+dqYjpzpLcXkpPMFohUZ4wbx+hSc3BCTIMYRjJcXKlY13U5Uys0Q3H4fgRTPShSSFv2pfQf2I2NNT5fIdoWmN3GovbWms47HZ0zlAp+u8agmvdlna3NPwDp2D6cJqJzE9ko1PJLuJcVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WDoHN+JZFMvmGS9jKuh/kf6G9e3ZTX4JHS3fZk7+TUc=;
 b=Knp4KLcAKQFrhBovSpsodAn0gxokKTs+DomfIGKPhrnbNty8jlzXtspCzyOwPtRdiocFpOt5mZYNefoGpXc6vj1P3K3KbOR/W6XsOzakNela5oxFJdbb5M/w9kodoiOMUyP+qdZNbyalLK37JjvqRhi2UVbr0+Ez+n9RQS1mDPU=
Received: from BN9PR03CA0052.namprd03.prod.outlook.com (2603:10b6:408:fb::27)
 by DM4PR12MB5722.namprd12.prod.outlook.com (2603:10b6:8:5d::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5081.14; Thu, 17 Mar
 2022 00:20:43 +0000
Received: from BN8NAM11FT045.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:fb:cafe::6c) by BN9PR03CA0052.outlook.office365.com
 (2603:10b6:408:fb::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5081.14 via Frontend
 Transport; Thu, 17 Mar 2022 00:20:43 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT045.mail.protection.outlook.com (10.13.177.47) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5081.14 via Frontend Transport; Thu, 17 Mar 2022 00:20:42 +0000
Received: from Harpoon.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Wed, 16 Mar
 2022 19:20:41 -0500
From: Felix Kuehling <Felix.Kuehling@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [RFC PATCH 3/4] drm/amdgpu: update mappings not managed by KFD
Date: Wed, 16 Mar 2022 20:20:05 -0400
Message-ID: <20220317002006.342457-4-Felix.Kuehling@amd.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220317002006.342457-1-Felix.Kuehling@amd.com>
References: <20220317002006.342457-1-Felix.Kuehling@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 04272772-7cd1-4593-4796-08da07abf938
X-MS-TrafficTypeDiagnostic: DM4PR12MB5722:EE_
X-Microsoft-Antispam-PRVS: <DM4PR12MB57224C20718B69D1B264BFEB92129@DM4PR12MB5722.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: W25c1lD+1qC+ALEbUrPs36ocOIvJLjasWjvuPAi97zwPQsIh06kVS3kos9Yv0wJRW24dNFMWlxvbxR9Xk2p4tagUKGXQ6+NwFv8/eph2Ae+X4sqSibbn6hwFLItXyx+7kL4QQJM56K24dn96fNJXIP7IyvWPftE7uoV4+jcIDs9ILadAnEmY0LXWlEWwGHSnP1eoIVC1WcSa+FiQcAEd1JMRD0LCwIbW/63obQrWiZgQA8ldbGY5Wr7+Cj+sqmtDN6BnlrZCoU3fsRD5w4J5k5luFj6gT9D+qBMboNInZg4NOsuNr+tkoNBKcBtc42u7BdOiDlKkdIAVwNGB89DiimCvREbLNXKDXTWcGxXIvIUkoDhjjWDTVKx8r70y8Aw22kPkzcUGIGIvSfmf9yk5UT6vyj6qDvh1o1rZbe4306QMCu1mpmal9wA7XmMh/elx2o5fLVKuBfZeNozf15NafGOGD3kpn/q5amhOHc8acMqDfQysTCKB52Vuzw0IVYi0KyhNshlNK8WvaadTuThT8KEtF5ikBpxApKt0YUSrchROflvNCykNydYlEfuSSC0h3j6stxN4t1VEn/iv0Z8hM0+lI/neY7FUD5HbsO+jvNtiosmSR0qA4YCtV/nwwbGgag+KE0FO0xlg09AZR1OG+q5n0bIPZsUnQsD+NDxG1e98RK5Z48CCrYf+SE8l/LyWD1M/DhoeTAD0XmjQXm4y7Q==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230001)(4636009)(36840700001)(40470700004)(46966006)(54906003)(4326008)(8676002)(316002)(6916009)(47076005)(450100002)(2616005)(1076003)(82310400004)(426003)(6666004)(16526019)(86362001)(40460700003)(83380400001)(7696005)(15650500001)(26005)(70206006)(70586007)(186003)(336012)(2906002)(36860700001)(36756003)(508600001)(356005)(81166007)(5660300002)(8936002)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Mar 2022 00:20:42.7269 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 04272772-7cd1-4593-4796-08da07abf938
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT045.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5722
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
Cc: christian.koenig@amd.com, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

When restoring after an eviction, use amdgpu_vm_handle_moved to update
BO VA mappings in KFD VMs that are not managed through the KFD API. This
should allow using the render node API to create more flexible memory
mappings in KFD VMs.

Signed-off-by: Felix Kuehling <Felix.Kuehling@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
index 019e6e363fd2..6f90ff4b485d 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
@@ -2535,6 +2535,7 @@ int amdgpu_amdkfd_gpuvm_restore_process_bos(void *info, struct dma_fence **ef)
 				continue;
 
 			kfd_mem_dmaunmap_attachment(mem, attachment);
+			/* TODO: Could amdgpu_vm_handle_moved do this? */
 			ret = update_gpuvm_pte(mem, attachment, &sync_obj, NULL);
 			if (ret) {
 				pr_debug("Memory eviction: update PTE failed. Try again\n");
@@ -2546,6 +2547,20 @@ int amdgpu_amdkfd_gpuvm_restore_process_bos(void *info, struct dma_fence **ef)
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
+		/* TODO: how to update the sync object? */
+	}
+
 	/* Update page directories */
 	ret = process_update_pds(process_info, &sync_obj);
 	if (ret) {
-- 
2.32.0

