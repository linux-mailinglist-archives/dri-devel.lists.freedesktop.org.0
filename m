Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A23C4DBB97
	for <lists+dri-devel@lfdr.de>; Thu, 17 Mar 2022 01:20:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 650A110EAB6;
	Thu, 17 Mar 2022 00:20:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1anam02on2072.outbound.protection.outlook.com [40.107.96.72])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C69D210EAB2;
 Thu, 17 Mar 2022 00:20:43 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nzSpnEZBasxbbs+bNd76vLaRK1WX3XU6AKImf1fKMmXVYbzkIdaI5lwkDjSoJDdSI6eflCnGSnH77K88iR45or5gynfAJ4RD4OWlmrgZoUq/ZY26uOoJ3Ucg29Y1T+V1jrNhu+tB3uKrcRkvjJyjND19xDjhtJJ/ZeqMn0PloBuoWivoqy4dAFgUGRU4RGIZf8Mek4Vh23ioybObjJdMqDCLYhAb4GnJiBzQXGvRXuFikc9H/Qb50g2WntOLNTdw47QSODOCz/e7VCYw5Jx5353gmTWoPj2TpfO4nRxAEBQ2+hdhfuatgfR0IEwwJfw2jTd/3KKkoa3SCTb9j9KUlg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=W4a6cLDE8u1pQ/vHugnG1+zNuImyJdWhTF829gyi5Pk=;
 b=Z3JAqlqbYw4QDTn43M9Wp8mP0r5VkdnLeBNHaHdiuwkEYHLrvFMgW04SSYljCAm2qBhqHADeqr2qTgXTtqddVssedacTfOr0j4kvkRPz/OdOyQhDgzUCyIOEiXGefGLGrdexF+NC0fGVqE14E4hoNZvV7BF3NoNHlb9Kn7k8ftzf5K5phnmlOZHHZSyCBVSSPDHco1qmO/hUS0dbHvG+a5W6QSDnFo3gjzPH1iQXGZQwsFUeLhsVKdIG3gXWzPb2ZV6abuVGMjlmqnBJZ73oOh5beGDwoPOmDjr9wyt1xnIoXGOFrrwf5lYI2OkFvvzg6SRUfd4YrYl9VnW+Q7ghyA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=W4a6cLDE8u1pQ/vHugnG1+zNuImyJdWhTF829gyi5Pk=;
 b=Vqu52dmJkcA5NJ7mB90F24nKnA9Whz75b2vUD9gVjHN6zE+jhOuWFnCxjJu8IiHFdyEZJEU1W12KLzu2tQjxr9Kcyz6F9DyOf4WsiuKrJFQZKpADXmfaUXa7psYXlDyhDR5z1G0BO0YbRjgkzw39mGq2rphbKQl25QMsFOQ9eaI=
Received: from BN9PR03CA0046.namprd03.prod.outlook.com (2603:10b6:408:fb::21)
 by BN7PR12MB2595.namprd12.prod.outlook.com (2603:10b6:408:30::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5081.15; Thu, 17 Mar
 2022 00:20:41 +0000
Received: from BN8NAM11FT045.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:fb:cafe::53) by BN9PR03CA0046.outlook.office365.com
 (2603:10b6:408:fb::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5061.23 via Frontend
 Transport; Thu, 17 Mar 2022 00:20:41 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT045.mail.protection.outlook.com (10.13.177.47) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5081.14 via Frontend Transport; Thu, 17 Mar 2022 00:20:41 +0000
Received: from Harpoon.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Wed, 16 Mar
 2022 19:20:39 -0500
From: Felix Kuehling <Felix.Kuehling@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [RFC PATCH 1/4] drm/amdkfd: Improve amdgpu_vm_handle_moved
Date: Wed, 16 Mar 2022 20:20:03 -0400
Message-ID: <20220317002006.342457-2-Felix.Kuehling@amd.com>
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
X-MS-Office365-Filtering-Correlation-Id: 5155305f-4356-4419-1bf2-08da07abf845
X-MS-TrafficTypeDiagnostic: BN7PR12MB2595:EE_
X-Microsoft-Antispam-PRVS: <BN7PR12MB2595F62C6DE7FA6B3516C3E492129@BN7PR12MB2595.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: B6XrkU/+aBMGu15B79eaQH7TOkUQGdteXjQavQs2RYILYprg6oheOj2V+wkTEk/jXcCmo4PRtYk3uWaKhR3jRnvki4gm/c2taee71xWepNNZ/h9CtKnryK3lFhO90wHiGrMPy7zmcHCS8/DMDgArxY8u7caX+1FHr9HwGbrA+v+HsAdktgSmj7xXKQOHxpfo2M3I/Ez25ogzL+sok3P3IgW4nmZCZztTf2pjXPiZ4lr0W5f1jyKuMWS5DrrDyA2lZGhqGaNurVU16qab10a3owQ3zRXpCu89b1Z6R7n4Hlwl3Vsgayzux/LwuPOzeOxlRd2UwphVwZv/Pr5BSh34wzl1NoJhnW84mF1UR9bQYlYbnUIbfdotYHe7tHa1YHlPVqZZgr2VZ5rg4rqlq/NYJSwdzgFHnN1hmNRXK7uPoU0wfMER7dA4deApIbLI/wfH2NYNP40HLcd5LBRutWKmV4qMLImAseKVTXK48AICL0/TERk18bZ+ZdXY4UBNFaPDrun6a1zj82bVGqZed2FOpk8DLMeYfXf+Rzbvtarbc74lOu1IfsyEvts/B+2O/zVZi1zHaoJKNxolDpVDlTGZ7oNIFcy8qqVKEi7sCRLG6H3ONdqICxMQrL9She/t6T+rviFTiPnoKq2JFbytUQlJBuIo5Id9Yi3wJV9XcRI0DWKs3molgfoMEkRUd6j9IDQ1/hJGXVHMpqlgf7oPKh+SXQ==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230001)(4636009)(36840700001)(46966006)(40470700004)(81166007)(47076005)(450100002)(508600001)(82310400004)(316002)(83380400001)(40460700003)(356005)(6666004)(8676002)(4326008)(36860700001)(7696005)(70586007)(70206006)(86362001)(2906002)(36756003)(16526019)(26005)(6916009)(186003)(336012)(426003)(8936002)(1076003)(5660300002)(54906003)(2616005)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Mar 2022 00:20:41.1646 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5155305f-4356-4419-1bf2-08da07abf845
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT045.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PR12MB2595
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

Let amdgpu_vm_handle_moved update all BO VA mappings of BOs reserved by
the caller. This will be useful for handling extra BO VA mappings in
KFD VMs that are managed through the render node API.

TODO: This may also allow simplification of amdgpu_cs_vm_handling. See
the TODO comment in the code.

Signed-off-by: Felix Kuehling <Felix.Kuehling@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c      |  6 +++++-
 drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c |  2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c      | 18 +++++++++++++-----
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h      |  3 ++-
 4 files changed, 21 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
index d162243d8e78..10941f0d8dde 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
@@ -826,6 +826,10 @@ static int amdgpu_cs_vm_handling(struct amdgpu_cs_parser *p)
 			return r;
 	}
 
+	/* TODO: Is this loop still needed, or could this be handled by
+	 * amdgpu_vm_handle_moved, now that it can handle all BOs that are
+	 * reserved under p->ticket?
+	 */
 	amdgpu_bo_list_for_each_entry(e, p->bo_list) {
 		/* ignore duplicates */
 		bo = ttm_to_amdgpu_bo(e->tv.bo);
@@ -845,7 +849,7 @@ static int amdgpu_cs_vm_handling(struct amdgpu_cs_parser *p)
 			return r;
 	}
 
-	r = amdgpu_vm_handle_moved(adev, vm);
+	r = amdgpu_vm_handle_moved(adev, vm, &p->ticket);
 	if (r)
 		return r;
 
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c
index 579adfafe4d0..50805613c38c 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c
@@ -414,7 +414,7 @@ amdgpu_dma_buf_move_notify(struct dma_buf_attachment *attach)
 
 		r = amdgpu_vm_clear_freed(adev, vm, NULL);
 		if (!r)
-			r = amdgpu_vm_handle_moved(adev, vm);
+			r = amdgpu_vm_handle_moved(adev, vm, ticket);
 
 		if (r && r != -EBUSY)
 			DRM_ERROR("Failed to invalidate VM page tables (%d))\n",
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
index fc4563cf2828..726b42c6d606 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
@@ -2190,11 +2190,12 @@ int amdgpu_vm_clear_freed(struct amdgpu_device *adev,
  * PTs have to be reserved!
  */
 int amdgpu_vm_handle_moved(struct amdgpu_device *adev,
-			   struct amdgpu_vm *vm)
+			   struct amdgpu_vm *vm,
+			   struct ww_acquire_ctx *ticket)
 {
 	struct amdgpu_bo_va *bo_va, *tmp;
 	struct dma_resv *resv;
-	bool clear;
+	bool clear, unlock;
 	int r;
 
 	list_for_each_entry_safe(bo_va, tmp, &vm->moved, base.vm_status) {
@@ -2212,17 +2213,24 @@ int amdgpu_vm_handle_moved(struct amdgpu_device *adev,
 		spin_unlock(&vm->invalidated_lock);
 
 		/* Try to reserve the BO to avoid clearing its ptes */
-		if (!amdgpu_vm_debug && dma_resv_trylock(resv))
+		if (!amdgpu_vm_debug && dma_resv_trylock(resv)) {
 			clear = false;
+			unlock = true;
+		/* The caller is already holding the reservation lock */
+		} else if (ticket && dma_resv_locking_ctx(resv) == ticket) {
+			clear = false;
+			unlock = false;
 		/* Somebody else is using the BO right now */
-		else
+		} else {
 			clear = true;
+			unlock = false;
+		}
 
 		r = amdgpu_vm_bo_update(adev, bo_va, clear, NULL);
 		if (r)
 			return r;
 
-		if (!clear)
+		if (unlock)
 			dma_resv_unlock(resv);
 		spin_lock(&vm->invalidated_lock);
 	}
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h
index a40a6a993bb0..120a76aaae75 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h
@@ -396,7 +396,8 @@ int amdgpu_vm_clear_freed(struct amdgpu_device *adev,
 			  struct amdgpu_vm *vm,
 			  struct dma_fence **fence);
 int amdgpu_vm_handle_moved(struct amdgpu_device *adev,
-			   struct amdgpu_vm *vm);
+			   struct amdgpu_vm *vm,
+			   struct ww_acquire_ctx *ticket);
 int amdgpu_vm_bo_update_mapping(struct amdgpu_device *adev,
 				struct amdgpu_device *bo_adev,
 				struct amdgpu_vm *vm, bool immediate,
-- 
2.32.0

