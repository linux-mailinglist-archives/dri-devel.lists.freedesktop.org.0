Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 61E1D45538F
	for <lists+dri-devel@lfdr.de>; Thu, 18 Nov 2021 04:56:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3AE706E57A;
	Thu, 18 Nov 2021 03:56:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1anam02on2049.outbound.protection.outlook.com [40.107.96.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A872D6E57A;
 Thu, 18 Nov 2021 03:56:15 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GqTBYxMrAG/abwDvPsOjY1um4fdfDWYvNMFym6ig2syZojmrqiKh96Eo6UMTuvDbrr1Mu920xaPS2bfUEoxYPhsqw1l+k5vLe5h/G6Gm739fLP5XiLzopR0jqEyOsDtP22zAzc0Wx2gPlmu41k6m1YRSvIJTEwr4ZfdLNDyZo361aLTqYNAeU7m3wup0sGZ8/4/G+PVMIp36KxbljTr/UxLYcikWs6FJNjqJsKoOEJnpKrVbyon/cCkzzVeHqX4PHdnMe5N2iiyA/ZvLWXIBmDK8JfElCmOXqmjIgCArDQRlGPxauMK4ZbpkZrJmUwNAdyS2vcswMIa+HhNpQJdXCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UMR5bhnh8bYYObQTqr8UbXM660/7ysbmNwdD2K2Hp7w=;
 b=RwqtrxIcSN9iYu8NVwwHUwqm1bGwJdRo9KrKl1Ryy+odnFciQ/b2LuyBUDSHSsnt34so6sYcA+vBbs7pRMYK+i8HsfUNkIowIVKswyvf5VOpELmmTgC7A9NmftqxoYWH0BA7GQu7vZfhZTjN5ApD5fa+Scun412f4lpNPbVs/+e79eH4uo/UVvnPo2TXf9sE44HI2lEtU3ip85MIeyDM3t+EN2FXJ5WoydWgI4DZ70ZIdR23sZVNX4CvXE4ol6/6+X38pZiEoM9yWfcJRl77kLySkwbX5L+fW1ctQ1dDeBSyNDM1hhCjGKrk6omW9Ur9iUBAplOz1QNsbQIiB2DO9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UMR5bhnh8bYYObQTqr8UbXM660/7ysbmNwdD2K2Hp7w=;
 b=aQy0L/BOyDE5P9+hE9m55Wk7bB3a81wCLbPXDS0JRapmYHX5RNbygsDFMCCdxzSEcJaGgjiHSk+j5p75dLaVGVQMMpqgFy6pwEzm+6pe6FqFyMVCR/2AOA15sV8Z91eiDT+6vOgkTGJhTPwf9IgMMAIrG6MKV/cmKSAPotEZQGo=
Received: from BN1PR10CA0019.namprd10.prod.outlook.com (2603:10b6:408:e0::24)
 by BYAPR12MB2663.namprd12.prod.outlook.com (2603:10b6:a03:72::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.17; Thu, 18 Nov
 2021 03:56:13 +0000
Received: from BN8NAM11FT036.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:e0:cafe::8f) by BN1PR10CA0019.outlook.office365.com
 (2603:10b6:408:e0::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.21 via Frontend
 Transport; Thu, 18 Nov 2021 03:56:12 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT036.mail.protection.outlook.com (10.13.177.168) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4713.20 via Frontend Transport; Thu, 18 Nov 2021 03:56:12 +0000
Received: from Harpoon.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17; Wed, 17 Nov
 2021 21:56:11 -0600
From: Felix Kuehling <Felix.Kuehling@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 1/2] drm/amdgpu: Generalize KFD dmabuf import
Date: Wed, 17 Nov 2021 22:55:58 -0500
Message-ID: <20211118035559.327835-1-Felix.Kuehling@amd.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 15f127b9-dd22-47a2-5e83-08d9aa475cee
X-MS-TrafficTypeDiagnostic: BYAPR12MB2663:
X-Microsoft-Antispam-PRVS: <BYAPR12MB26637578F9C72D7CFA2C9EF9929B9@BYAPR12MB2663.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1923;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 17Okb87T3L/lP/6nF/mb+MqkCmFlWafzxD4p/TrY5nid4znSibdXy/c+BYwzoBXjBWK4cP6OPdLOZDKbI6iHNfWjQtpC0x8TT5GSeuNql8kTdOfqY6bULZ9yO//+m4i3hn1nMekVJUKrnZ2BT8uCjmJxHV1GP4rYb4DbHE2xBK+M9fMJ+uUCpIywZP/+g7dWj9gigAmsWc4pg13+9NAqx4p1i4dt5bXSrl11bQA/DSd3bv7lqOhZ6JEbXRrVfdsfSdzBNApSqpU0vS0HWssI7qonGi2FVFEJsGXr9SRL1mBgqKmtqJ5uQojaljc1uFBDR8xAaubUobI9RChZq/bUGO+2b9ns8mPC1z+ItstZ+0u+cjaSDhQXk5dnS6R9MxKVfZcmN5ofPLg8OD6SJXZQOEF0eutpQrmdT8PkWrWMra6f4WsR2b50s84XKDTsA9sQzDsQ1UG2iJR9KWZCyXR2hxExneNueZsWiQk/ESM1029DTF6ozrtsXW010heoR7sJLsCstHmdipHUX4dho7JQccvinLVffTFX9fJsfCA5Gl7RrmLvTA/kwxj1/BrSJXWyuIXF91yJZIbA8gOhMg0iGRUBIgHbkP3P9GX+FUcu87c5jQLksAV9t5sIiltBIdwOU4TTjycAdYbSEhBlZ35cag/wiuAAsrw3IBLYFbLE52nN/fJriw9VFsGrE+vmE4WKaPdcg6N0+Girpg5cPBnGnCnPi6egXbZN6vZHJu0vLNA=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(46966006)(36840700001)(1076003)(81166007)(316002)(6916009)(26005)(186003)(16526019)(6666004)(8936002)(336012)(508600001)(2616005)(426003)(356005)(83380400001)(36860700001)(70206006)(4326008)(5660300002)(82310400003)(8676002)(86362001)(70586007)(7696005)(450100002)(47076005)(36756003)(2906002)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2021 03:56:12.7591 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 15f127b9-dd22-47a2-5e83-08d9aa475cee
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT036.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB2663
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Use proper amdgpu_gem_prime_import function to handle all kinds of
imports. Remember the dmabuf reference to enable proper multi-GPU
attachment to multiple VMs without erroneously re-exporting the
underlying BO multiple times.

Signed-off-by: Felix Kuehling <Felix.Kuehling@amd.com>
---
 .../gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c  | 45 ++++++++++++-------
 1 file changed, 28 insertions(+), 17 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
index 90b985436878..d53d19b9d6dc 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
@@ -2000,30 +2000,34 @@ int amdgpu_amdkfd_gpuvm_import_dmabuf(struct amdgpu_device *adev,
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
+	if (obj->import_attach) {
+		/* Import takes an extra reference if it creates a dynamic
+		 * dmabuf attachment. Release that reference to avoid
+		 * leaking it. FIXME: I think this is a bug.
+		 */
+		dma_buf_put(dma_buf);
+	}
 
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
-		kfree(mem);
-		return ret;
-	}
+	if (ret)
+		goto err_free_mem;
 
 	if (size)
 		*size = amdgpu_bo_size(bo);
@@ -2040,7 +2044,8 @@ int amdgpu_amdkfd_gpuvm_import_dmabuf(struct amdgpu_device *adev,
 		| KFD_IOC_ALLOC_MEM_FLAGS_WRITABLE
 		| KFD_IOC_ALLOC_MEM_FLAGS_EXECUTABLE;
 
-	drm_gem_object_get(&bo->tbo.base);
+	get_dma_buf(dma_buf);
+	(*mem)->dmabuf = dma_buf;
 	(*mem)->bo = bo;
 	(*mem)->va = va;
 	(*mem)->domain = (bo->preferred_domains & AMDGPU_GEM_DOMAIN_VRAM) ?
@@ -2052,6 +2057,12 @@ int amdgpu_amdkfd_gpuvm_import_dmabuf(struct amdgpu_device *adev,
 	(*mem)->is_imported = true;
 
 	return 0;
+
+err_free_mem:
+	kfree(mem);
+err_put_obj:
+	drm_gem_object_put(obj);
+	return ret;
 }
 
 /* Evict a userptr BO by stopping the queues if necessary
-- 
2.32.0

