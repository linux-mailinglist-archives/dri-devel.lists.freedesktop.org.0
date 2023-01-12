Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 92167666866
	for <lists+dri-devel@lfdr.de>; Thu, 12 Jan 2023 02:32:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 80D1F10E17B;
	Thu, 12 Jan 2023 01:32:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam04on2067.outbound.protection.outlook.com [40.107.102.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C27D210E0D8;
 Thu, 12 Jan 2023 01:32:28 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Oob3hSBFJd7QSY5ZLT0HoLgj3kYoaUBLImNv8eEp58AdGqsn7VLcYGRp8x+bSawzemQNevJndn+1Aiya0BprHaGVUaJdBiWAc5tKUEXlZExfXNvmdkLE70sPeLkSZQGE7RUxNjYa/fW2GfTwR2oVbMrM9FV6ThA+Pr9ZOtPsnI32u+SFzFC20rGTaWBye/pzaU8UuI8qS9riW5ZZkVUPC7xmEL8IfoyQZWfYAxmRCfChiLg6xgXgsp5EM3potvYfLtdgv3Tey98hToE/KkdaMlIwjEGiu5nQgOYBYnwsxVTSrExNzewNbeudogRuyQAQWtrsyzs/eK/Ed8eLEVCNRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eNPSTBRUEEVfGiBJWQG93+oz02EzEPjReVVmAR8FpIY=;
 b=Yo8ERHouEzgxq/88n/b3gOuCw7L1lw/+WnIUQ2SHJTZu3crlF98vRBOvVrVEQuJP2L9m9EQYATM6fhzxIW0N4W/9CQ+gA6JYTKu+/hyC+37DgYm5tAyvlKv35vBHpyk1/NSs84Xv2fS+IIvB3WdK373a7NWNkZYH8cMlO1SPrSBp606DdkzzFX2GRNLMdYdYPaY3/kzMC/qsNlQA5Or3MMTYBRqTAx5SJ1CR7Cpeqoq2JHxB2dOLzcxin0oNaClZwxkEJSw65m4BQxSEW+PbdQk46ebS8dfAVKv0D175dkr6HVgVQu1PZy7QSpneWlxoxZneSCS5LNzKd132xoFCZg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eNPSTBRUEEVfGiBJWQG93+oz02EzEPjReVVmAR8FpIY=;
 b=NPssILSFi0eFo4dMXqiN8gSuWy55hEFl3LfMe3oDWTg0Uw5CHufnRvfsYtt/uUzkBA1d152K8kYxvOECZH/YcUyGpqceqKFE58lt/X4Ae/tCTSxxnhvh+ww/ueHr/TPcFelaavNK/NBViH4StLZc9cEjdOeuDzDWBOHI81bVgpc=
Received: from MW4PR04CA0171.namprd04.prod.outlook.com (2603:10b6:303:85::26)
 by PH0PR12MB7885.namprd12.prod.outlook.com (2603:10b6:510:28f::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.18; Thu, 12 Jan
 2023 01:32:26 +0000
Received: from CO1NAM11FT063.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:85:cafe::d0) by MW4PR04CA0171.outlook.office365.com
 (2603:10b6:303:85::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.13 via Frontend
 Transport; Thu, 12 Jan 2023 01:32:26 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT063.mail.protection.outlook.com (10.13.175.37) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5986.18 via Frontend Transport; Thu, 12 Jan 2023 01:32:26 +0000
Received: from Harpoon.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Wed, 11 Jan
 2023 19:32:24 -0600
From: Felix Kuehling <Felix.Kuehling@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
Subject: [PATCH 1/6] drm/amdgpu: Generalize KFD dmabuf import
Date: Wed, 11 Jan 2023 20:31:52 -0500
Message-ID: <20230112013157.750568-2-Felix.Kuehling@amd.com>
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
X-MS-TrafficTypeDiagnostic: CO1NAM11FT063:EE_|PH0PR12MB7885:EE_
X-MS-Office365-Filtering-Correlation-Id: 12121bd0-13a5-4412-3885-08daf43cdcdd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: p23jZAGGdFromcCz62bRCEtxng+eLqr4omsLer/oJlCWQmXP2XWrzXnqTL7abg0yTYE0r1oMPlnqDHsIkNANNq53iLpOAgnIzlohTLDR6CPJh7dM+712EoREee6xTm0OgQJstLrJruH3wMUVwC/iIGbzXbiPbSloDMj/lFlVy+yQx3Nrbjh+8/TC6ijoonb4s05Ahc4TOqJuoTpHnSi841g72+Jlf/sGaubg43aF1TSqRNTaZjF2YrJT0klzwduZvr3WOacjqUHz+V0yw4439N4qnWWwuWXvZd//v2NcAScF97cNlpHQU2q8ER1ARh1T3WDniw/I4lUq95yZD9cS5t/EA7hetMtMwjuSaUFrUcAz8RTkXHdVUfsZ/Xt6FIYbiZRwgqE0zh804XNgPV9u6jeWnFBajgE0H+8D6ZTfoeCpIj8IOOC+XY/FV/r+r9+YtX8nKFLWewk1jhbzyvBwRap2GUp9bmKvHflOs7VUzS7YrZM+Gg7uVqzmsby8+bgiM0YABDut/0auscNxuZ+4SgsZqUkAxnzrq/dfn8HxHMr7UuBUQry1m0d3Z+kr+afXKzSK/m8GnP5mYKK2f58u8/29fij10xuEHVTHWHuuLj9Z1L1BcjGFczGcbIMxXtO36kuibGa7nmPjY0zHmXFGJXLZvYAP/Byds5SURrhsI8Okm7QK/ysOiaTSJV2yS2sV6DZJXYSGUStkpcLgsJmx2wTfNICAc83THtyUplt5BB4=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230022)(4636009)(39860400002)(396003)(136003)(346002)(376002)(451199015)(46966006)(40470700004)(36840700001)(36756003)(26005)(6666004)(186003)(8936002)(7696005)(2616005)(1076003)(81166007)(16526019)(40480700001)(5660300002)(478600001)(316002)(450100002)(40460700003)(4326008)(356005)(82740400003)(41300700001)(110136005)(54906003)(86362001)(8676002)(70206006)(70586007)(82310400005)(83380400001)(47076005)(2906002)(426003)(336012)(36860700001)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jan 2023 01:32:26.5484 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 12121bd0-13a5-4412-3885-08daf43cdcdd
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT063.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB7885
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

Use proper amdgpu_gem_prime_import function to handle all kinds of
imports. Remember the dmabuf reference to enable proper multi-GPU
attachment to multiple VMs without erroneously re-exporting the
underlying BO multiple times.

Signed-off-by: Felix Kuehling <Felix.Kuehling@amd.com>
---
 .../gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c  | 38 ++++++++++---------
 1 file changed, 21 insertions(+), 17 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
index 6f236ded5f12..e13c3493b786 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
@@ -2209,30 +2209,27 @@ int amdgpu_amdkfd_gpuvm_import_dmabuf(struct amdgpu_device *adev,
 	struct amdgpu_bo *bo;
 	int ret;
 
-	if (dma_buf->ops != &amdgpu_dmabuf_ops)
-		/* Can't handle non-graphics buffers */
-		return -EINVAL;
-
-	obj = dma_buf->priv;
-	if (drm_to_adev(obj->dev) != adev)
-		/* Can't handle buffers from other devices */
-		return -EINVAL;
+	obj = amdgpu_gem_prime_import(adev_to_drm(adev), dma_buf);
+	if (IS_ERR(obj))
+		return PTR_ERR(obj);
 
 	bo = gem_to_amdgpu_bo(obj);
 	if (!(bo->preferred_domains & (AMDGPU_GEM_DOMAIN_VRAM |
-				    AMDGPU_GEM_DOMAIN_GTT)))
+				    AMDGPU_GEM_DOMAIN_GTT))) {
 		/* Only VRAM and GTT BOs are supported */
-		return -EINVAL;
+		ret = -EINVAL;
+		goto err_put_obj;
+	}
 
 	*mem = kzalloc(sizeof(struct kgd_mem), GFP_KERNEL);
-	if (!*mem)
-		return -ENOMEM;
+	if (!*mem) {
+		ret = -ENOMEM;
+		goto err_put_obj;
+	}
 
 	ret = drm_vma_node_allow(&obj->vma_node, drm_priv);
-	if (ret) {
-		kfree(*mem);
-		return ret;
-	}
+	if (ret)
+		goto err_free_mem;
 
 	if (size)
 		*size = amdgpu_bo_size(bo);
@@ -2249,7 +2246,8 @@ int amdgpu_amdkfd_gpuvm_import_dmabuf(struct amdgpu_device *adev,
 		| KFD_IOC_ALLOC_MEM_FLAGS_WRITABLE
 		| KFD_IOC_ALLOC_MEM_FLAGS_EXECUTABLE;
 
-	drm_gem_object_get(&bo->tbo.base);
+	get_dma_buf(dma_buf);
+	(*mem)->dmabuf = dma_buf;
 	(*mem)->bo = bo;
 	(*mem)->va = va;
 	(*mem)->domain = (bo->preferred_domains & AMDGPU_GEM_DOMAIN_VRAM) ?
@@ -2261,6 +2259,12 @@ int amdgpu_amdkfd_gpuvm_import_dmabuf(struct amdgpu_device *adev,
 	(*mem)->is_imported = true;
 
 	return 0;
+
+err_free_mem:
+	kfree(*mem);
+err_put_obj:
+	drm_gem_object_put(obj);
+	return ret;
 }
 
 /* Evict a userptr BO by stopping the queues if necessary
-- 
2.34.1

