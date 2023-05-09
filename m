Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 830F86FD26C
	for <lists+dri-devel@lfdr.de>; Wed, 10 May 2023 00:15:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F79110E422;
	Tue,  9 May 2023 22:15:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2082.outbound.protection.outlook.com [40.107.220.82])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7579A10E41A;
 Tue,  9 May 2023 22:15:33 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Pc663TfYN4e//18Nub/E4vXUAjzMssPMxYd9MDSKHzrNlPOMEQwk3sF1FC8frMyG1V5aOpLt90xJbyMP2xil6Xu3K+GAmC10mqXBkg3BHM2XWUWD1bOachVPmAXwuvX77wasYIEr22U6RhVSF0aJ1s3ea6I58JW1B/BMaQy4GWpQGGR0aPYV8jRiAn8tZc4jBjtG93IMAdaxc+ZiPmvvFiEKcDaO2esZrWcO4qqN8fbadxTDt4HbCrgQPuA/xhSHM9TBRhZImdiHgMyzSdOZGT9wD2zkp+q0nEZMcq7tswgRxfO/rOSAQJHVzxuq13MHNZtp+xI3gjyz2AOStsOaGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=y8MfPrhoFdoRzioq+o4vqk8J0BFSaUapjDMGGavZNDk=;
 b=mcGAcj+RliDAV6tKTDGHS4BcyFo9iEDv59CI0FsqwCDYJahUFFTXGQBcmmvQqNy4azXZAUEwy5qLIC9pEDyfGy2KAeNwSpUV4GnNT0Yf5NcIGFuXwjBs0ilvzF1ipJiV5YVMRCsyOpkeV1lrHJoUc3FSWpkpPb+bIMPiAeM1XHHxHbM4SLBekhdHdLrfOcd06ytw7qPy0Accef4LsrWkIwbujpH4KlTuXlxcuun1th5DABjYJgrk5th6eMWVhjJMpbW6J1i/zpHTW0ab56amkiHi5BK5FWEOAZDn3QQIBLJllMLdmCFBDhW3NMqsdJL0lbs0+0muq+QwN9+/MrzGFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=y8MfPrhoFdoRzioq+o4vqk8J0BFSaUapjDMGGavZNDk=;
 b=wZExzkmuztl3a9yLgEKofBycdK1LTuoZgUFCG9p/Mmw5z1e8/Of/wNs9OSlv31lGa6W+YOf8UfG3fgnegMOCnN9hDwOHuicQpO5szClbc3Xo1eSHWLZEanSE0F7wFObbDXsQbAMOlyYzzxozUZaPb9y+hJFu/VlXEz+rhwT1tes=
Received: from BN8PR12CA0025.namprd12.prod.outlook.com (2603:10b6:408:60::38)
 by SA0PR12MB4590.namprd12.prod.outlook.com (2603:10b6:806:93::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.31; Tue, 9 May
 2023 22:15:31 +0000
Received: from BN8NAM11FT113.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:60:cafe::40) by BN8PR12CA0025.outlook.office365.com
 (2603:10b6:408:60::38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6387.18 via Frontend
 Transport; Tue, 9 May 2023 22:15:31 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT113.mail.protection.outlook.com (10.13.176.163) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6387.18 via Frontend Transport; Tue, 9 May 2023 22:15:31 +0000
Received: from tr4.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Tue, 9 May
 2023 17:15:29 -0500
From: Alex Deucher <alexander.deucher@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
Subject: [PATCH 3/3] drm/amdkfd: Native mode memory partition support
Date: Tue, 9 May 2023 18:15:16 -0400
Message-ID: <20230509221516.477025-3-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230509221516.477025-1-alexander.deucher@amd.com>
References: <20230509221516.477025-1-alexander.deucher@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT113:EE_|SA0PR12MB4590:EE_
X-MS-Office365-Filtering-Correlation-Id: e8b43520-c75e-4adf-4ce4-08db50dae72b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: yVzPnpIgR8F/oA5mx3haVlHHM13E9O4m7jPiimf5fjaantKK+cjiHliJILaBt8n158zld+6aOzv8fJ4iXAArZBfBgYZ60wOEmt9KwqQzY1hItyevgm8LbVWSdDb1hDxHcTg9aMDSBQk5qnqhJiQ8Ou803cxAMG/JNm2iiudaVbfq8wPKxG/2d5k1hVNjnpZkyXo8wo2wmdDDSf8+398w/kkOVmHYHuyJlVN9L4g/G+6gJkDHuRDqsskqqOvAasqN1QvvJenOMxn5/vo0tnP1WfqfrLWOBr6kXW/UnMjv+eIilCdmFUzNdDP9d9868Y4LNWkt8ywe2Axryi4W8gSvM8nkPlZHbXe/8JY2+/gWyOYO7q/NSILmf8jRFqzzZU/PktVlBpeHgeXbZ0TXj6841Lud7LtI0pgPmVxxDaxjQFftupcR3REROISzf2KWQaUXING3ZIE+XqHvm+tGAxgicUzHHuFFRg8WO+EoygjQl4BuBfs/LJKbcfNbsFHXgfO/SVbi8u1445+0EIdjqRribAupaykIf2Hod4TdeNr+6Ar2Xvs1ePDnvNlSX09VBnKctzve26YF6V0eAg0Re4rkayc1+dI4EHH08WugnqI6ZBL53oWiSULZ+TUHIwYUFPMmrF09/yriagvWmNwox2cUYOPjNyA2j/1c9qeN3UqE9lQUz2asP9ecCqFrTSEHcrlWzuh7pUjmH2x1L9O3UAhMLR+EOfS5OgIP7ourEwdW2J4=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230028)(4636009)(376002)(136003)(396003)(346002)(39860400002)(451199021)(46966006)(36840700001)(40470700004)(82310400005)(8676002)(8936002)(5660300002)(41300700001)(316002)(4326008)(16526019)(40460700003)(36860700001)(83380400001)(450100002)(70206006)(70586007)(1076003)(36756003)(186003)(478600001)(26005)(7696005)(2906002)(40480700001)(82740400003)(47076005)(2616005)(426003)(336012)(86362001)(110136005)(356005)(81166007)(54906003)(6666004)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 May 2023 22:15:31.4055 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e8b43520-c75e-4adf-4ce4-08db50dae72b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT113.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4590
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
Cc: Alex Deucher <alexander.deucher@amd.com>, Mukul Joshi <mukul.joshi@amd.com>,
 Felix Kuehling <Felix.Kuehling@amd.com>,
 Rajneesh Bhardwaj <rajneesh.bhardwaj@amd.com>,
 Philip Yang <Philip.Yang@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Rajneesh Bhardwaj <rajneesh.bhardwaj@amd.com>

For native mode, after amdgpu_bo is created on CPU domain, then call
amdgpu_ttm_tt_set_mem_pool to select the TTM pool using bo->mem_id.
ttm_bo_validate will allocate the memory to the correct memory partition
before mapping to GPUs.

Reviewed-by: Felix Kuehling <Felix.Kuehling@amd.com>
Acked-and-tested-by:  Mukul Joshi <mukul.joshi@amd.com>
Signed-off-by: Philip Yang <Philip.Yang@amd.com>
Signed-off-by: Rajneesh Bhardwaj <rajneesh.bhardwaj@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
---
 .../gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c   |  7 +++++++
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c        | 18 ++++++++++++++++++
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h        |  1 +
 3 files changed, 26 insertions(+)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
index 0ebd39a41e74..c6bf66c9377f 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
@@ -1642,6 +1642,7 @@ int amdgpu_amdkfd_gpuvm_alloc_memory_of_gpu(
 	uint64_t aligned_size;
 	u64 alloc_flags;
 	int ret;
+	int mem_id = 0; /* Fixme : to be changed when mem_id support patch lands, until then NPS1, SPX only */
 
 	/*
 	 * Check on which domain to allocate BO
@@ -1749,6 +1750,11 @@ int amdgpu_amdkfd_gpuvm_alloc_memory_of_gpu(
 	    ((*mem)->alloc_flags & KFD_IOC_ALLOC_MEM_FLAGS_VRAM)) {
 		bo->allowed_domains = AMDGPU_GEM_DOMAIN_GTT;
 		bo->preferred_domains = AMDGPU_GEM_DOMAIN_GTT;
+		ret = amdgpu_ttm_tt_set_mem_pool(&bo->tbo, mem_id);
+		if (ret) {
+			pr_debug("failed to set ttm mem pool %d\n", ret);
+			goto err_set_mem_partition;
+		}
 	}
 
 	add_kgd_mem_to_kfd_bo_list(*mem, avm->process_info, user_addr);
@@ -1777,6 +1783,7 @@ int amdgpu_amdkfd_gpuvm_alloc_memory_of_gpu(
 allocate_init_user_pages_failed:
 err_pin_bo:
 	remove_kgd_mem_from_kfd_bo_list(*mem, avm->process_info);
+err_set_mem_partition:
 	drm_vma_node_revoke(&gobj->vma_node, drm_priv);
 err_node_allow:
 	/* Don't unreserve system mem limit twice */
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
index f4f92133f505..7885162b7368 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
@@ -1159,6 +1159,24 @@ static void amdgpu_ttm_tt_unpopulate(struct ttm_device *bdev,
 	return ttm_pool_free(pool, ttm);
 }
 
+/**
+ * amdgpu_ttm_tt_set_mem_pool - Set the TTM memory pool for the TTM BO
+ * @tbo: The ttm_buffer_object that backs the VRAM bo
+ * @mem_id: to select the initialized ttm pool corresponding to the memory partition
+ */
+int amdgpu_ttm_tt_set_mem_pool(struct ttm_buffer_object *tbo, int mem_id)
+{
+	struct ttm_tt *ttm = tbo->ttm;
+	struct amdgpu_ttm_tt *gtt;
+
+	if (!ttm && !ttm_tt_is_populated(ttm))
+		return -EINVAL;
+
+	gtt = ttm_to_amdgpu_ttm_tt(ttm);
+	gtt->pool_id = mem_id;
+	return 0;
+}
+
 /**
  * amdgpu_ttm_tt_get_userptr - Return the userptr GTT ttm_tt for the current
  * task
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h
index 8ef048a0a33e..fe32de1bf4d5 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h
@@ -192,6 +192,7 @@ bool amdgpu_ttm_tt_has_userptr(struct ttm_tt *ttm);
 struct mm_struct *amdgpu_ttm_tt_get_usermm(struct ttm_tt *ttm);
 bool amdgpu_ttm_tt_affect_userptr(struct ttm_tt *ttm, unsigned long start,
 				  unsigned long end, unsigned long *userptr);
+int amdgpu_ttm_tt_set_mem_pool(struct ttm_buffer_object *tbo, int mem_id);
 bool amdgpu_ttm_tt_userptr_invalidated(struct ttm_tt *ttm,
 				       int *last_invalidated);
 bool amdgpu_ttm_tt_is_userptr(struct ttm_tt *ttm);
-- 
2.40.1

