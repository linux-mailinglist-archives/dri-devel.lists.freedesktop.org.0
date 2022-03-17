Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 666974DBB91
	for <lists+dri-devel@lfdr.de>; Thu, 17 Mar 2022 01:19:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E515510EAB1;
	Thu, 17 Mar 2022 00:19:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2045.outbound.protection.outlook.com [40.107.93.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8EA6D10EA1C;
 Thu, 17 Mar 2022 00:19:40 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dPv/djmFgupJ8hd7jWevFg91k9geJk6MP28RQO9sjqjeceD0IEFhDMuJ/9rpZkCF2ilx56s5xtjdNLfB4359qAj661muePpAyXwW6XItOB+k3Lt18sizr7iqsH+GU31k1RbT8/T5RXcmmIU5b+QzRhQjz9g7awdQd3OV9LOt5UM5vqts+9XZex1ka44LtnsnCIbrEbPldU4MGF3yi09eZfuUF4Q8j8B9e3S/bVwpok8RSv23qBXI5kG4n/W/k+clUx/ZcWK/7naGJZaAHZEB96sKslrlgcoJIEEKXsPhzBsUWQCzxoeSUgSunlrWSm8xpsZCG8DKg213qkupzfWppQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=N6fUFZYewKWExqvTYod9A4/buZHaNToKFOIQetTAZzk=;
 b=LM4uMU352FxOkCDAden852rBrJC+372ZPILvzLVabjC2PX0ZWTh8TqdlYc8kQJfaY/UBr9732zwdKdkClx2sJeQ27JnHo8Vj/LRvqzpUlWW49Hr2dw1lmzqVgada4ZfXoUEZ01PbAOOc3s6l/3GChT0rm5Ldl0Dw069mETUTfQByzSAemcwPoIhqh2kzYk8aDXOTWV6EkWrJsSAtrEhJwv82jlvn0Z7zzTmrIM9CEXkWfzhmK9M0XY9VN+UrVxJOCCxT+8/J837JyD6sOgdeBK6EblRsze/PwdpkQrB/aSqn6MygR++M7GlHim0K1yDZtDDRBzeX0NMbhcOiyPoc2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=N6fUFZYewKWExqvTYod9A4/buZHaNToKFOIQetTAZzk=;
 b=sFxobDydI7sJA8dmXgGBoOxUJAGSxL7W/VTyDKpI8d2N+Spbna1vU8iXbspTq8xAQ7wN4ulroLlhy4qL1tsaBESZ2h5sL3/0bfBFPZBAxbIo1fuU38Phgj/f7ZZgC8yPe1DI8m09bM0RwHzHHOIDKUKG0xw6emXKEvL0chLdi2U=
Received: from BN9PR03CA0562.namprd03.prod.outlook.com (2603:10b6:408:138::27)
 by CH0PR12MB5251.namprd12.prod.outlook.com (2603:10b6:610:d2::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5081.15; Thu, 17 Mar
 2022 00:19:37 +0000
Received: from BN8NAM11FT057.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:138:cafe::82) by BN9PR03CA0562.outlook.office365.com
 (2603:10b6:408:138::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5061.25 via Frontend
 Transport; Thu, 17 Mar 2022 00:19:37 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT057.mail.protection.outlook.com (10.13.177.49) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5081.14 via Frontend Transport; Thu, 17 Mar 2022 00:19:37 +0000
Received: from Harpoon.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Wed, 16 Mar
 2022 19:19:36 -0500
From: Felix Kuehling <Felix.Kuehling@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH v2 1/2] drm/amdgpu: Generalize KFD dmabuf import
Date: Wed, 16 Mar 2022 20:19:11 -0400
Message-ID: <20220317001912.342369-1-Felix.Kuehling@amd.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c74166f1-a59f-437b-9b01-08da07abd223
X-MS-TrafficTypeDiagnostic: CH0PR12MB5251:EE_
X-Microsoft-Antispam-PRVS: <CH0PR12MB5251E72C99D7FD0F39956CD092129@CH0PR12MB5251.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: sP3ooq8j30k8YT4ervWF24K8nstoqz62PwY+IgGZE6gf7k0/ln9dMB5fvjEpW8RkV55e/RdOIs68+rQo2FtVP8BFCWZMLZscrqsqqvhU6CrcnNJB+hZeWJZ+Ivc+754LuEYr9vnMwQ23Z5ddC7vkXhac+aBEAzWfh9nbyoGRjGPtCG6V8+WlpUESvF2OkjQ30d3Oo+r1MUL/KIAyqrSrWDbaTeJbdoIuV1YUl3LAQ7X2InAKhlxvI9nIBIbIrSP8wRxvXsZb62aUtc/h30iB87tYLfDsYh6pMbb4pF3CSETawuXa1CujrKvDWuzaWI/ebquwkqkBGyKpKXDjlDHuw4/GP/pYIY0dk7jqJILeyp16+Zmc+weWZrzlwBAfh6zvOy3zJw8lcGa3ttB0lAqR8hT8DS9o5ymObVnUv84OZxnXNPK9Px+pqzFlh9oCPwBh4Lj5j1NxKiJIWPJhMzGCffF6wtrOHQgZhQJA5IzEmf3NIjmssXtSh6u1rZ7yK/5wDSxXzeIVQxWPgmXuL7bb2GFHdzu5ppkubBsaguPvJUNvR6lEktieU6E3R1Ox3YlTmbHAnADWgEmZX//3OW7YHAge68tRdOrOL58DIReaY7i1dKuLyu/NITi4LvW93QWozmrQlksCWACf64ImBs4MlBOegEZ1QFOYJaSn1cqreiq8aUx23B+SLP7oMDKEG4DPBBE8pnEn8HOh+moBm1LOGQ==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230001)(4636009)(36840700001)(40470700004)(46966006)(6916009)(16526019)(70206006)(70586007)(316002)(450100002)(86362001)(8676002)(82310400004)(186003)(26005)(4326008)(1076003)(7696005)(81166007)(356005)(36860700001)(2616005)(6666004)(508600001)(36756003)(47076005)(83380400001)(40460700003)(5660300002)(336012)(426003)(2906002)(8936002)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Mar 2022 00:19:37.1916 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c74166f1-a59f-437b-9b01-08da07abd223
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT057.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR12MB5251
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
 .../gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c  | 38 ++++++++++---------
 1 file changed, 21 insertions(+), 17 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
index cd89d2e46852..2ac61a1e665e 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
@@ -2033,30 +2033,27 @@ int amdgpu_amdkfd_gpuvm_import_dmabuf(struct amdgpu_device *adev,
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
-		kfree(mem);
-		return ret;
-	}
+	if (ret)
+		goto err_free_mem;
 
 	if (size)
 		*size = amdgpu_bo_size(bo);
@@ -2073,7 +2070,8 @@ int amdgpu_amdkfd_gpuvm_import_dmabuf(struct amdgpu_device *adev,
 		| KFD_IOC_ALLOC_MEM_FLAGS_WRITABLE
 		| KFD_IOC_ALLOC_MEM_FLAGS_EXECUTABLE;
 
-	drm_gem_object_get(&bo->tbo.base);
+	get_dma_buf(dma_buf);
+	(*mem)->dmabuf = dma_buf;
 	(*mem)->bo = bo;
 	(*mem)->va = va;
 	(*mem)->domain = (bo->preferred_domains & AMDGPU_GEM_DOMAIN_VRAM) ?
@@ -2085,6 +2083,12 @@ int amdgpu_amdkfd_gpuvm_import_dmabuf(struct amdgpu_device *adev,
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

