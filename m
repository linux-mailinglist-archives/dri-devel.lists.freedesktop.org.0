Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B39EB7CCF05
	for <lists+dri-devel@lfdr.de>; Tue, 17 Oct 2023 23:15:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CEE6A10E349;
	Tue, 17 Oct 2023 21:14:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2040.outbound.protection.outlook.com [40.107.236.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2FED210E33A;
 Tue, 17 Oct 2023 21:14:27 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NXhwOa4P1rT5hbFvPbFFdwrFsbclpkriCkG+3ATUGLObhDtsFe8NjjE+fGIGTSqTsVCx707aAhGsprE0Z5/YYm6tv4r1TrW8uO1FBYv2tGyrqcslqccR0EBHd3mxE6HT29DLTOtBes77+wjzpj7kV8SxHgYiylk43wAgeRBzHH4loaukXdq4hFroH/CwJCLMHxENYLZ61MYIvhGHr7EhRCeEa+E+jQ4qkzs3r/3UrPc3NspccvbJsRjgWIo3BLplZxN5UC/IT992bu47aGrIzun0owVT0SR5agRsctMb8iQu23Y6lm/PA+6ZB6avZjly1kpclQIjc0qbNACX892c3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0WEtX89C7DraaGgxUehf/ObJUB3x2Z1jucUJmibLGio=;
 b=KuiLVh5xjeXzjxJCyr/TfX0t9p46Qzl4wapOjVevxLSzoaxBZZLnp+JRJRxwlmhvTF6YypF7Nd/eT3Fm9ZjxxTuFlY5W9tDzKBMGNCf2YCIStNySZR2hcIP30lovRFMZn76uQE40JvGjI2v9kqG4mqTbQ+JVKrExw/iO4slmvcylB2izr4WhRI4B5xgUDb5Q/Mg5gI1ptGK1sOni+lVzc8+3IDc8w/c2+tp94DRCQjsw4gUEI/SGhwATEwXZ4nz8jwYrdQ+HzUJx2i8UqPc9odXERMdGhHuWWcDOp4Lfj2ugI1bxgXpFi2UzVpzs9sy83jCRkh08/cm+Odq2mdND+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0WEtX89C7DraaGgxUehf/ObJUB3x2Z1jucUJmibLGio=;
 b=QkphjTHkJDb+89ClTmkLIZ01LyCoXlIBB4dRB7Sdqc2W4m+ctbWU+lr1Mx7HtbWyhuBqL1bngbaPpYYvck2UGfJc6DCK5lG2fyb2bjDNA9Z82r+sTbTXVUGJl4SfGkJMOmGmvLbgg2K89+HMLw3kBVTgGmeFVTVqG1azhXqSXpU=
Received: from BL0PR02CA0008.namprd02.prod.outlook.com (2603:10b6:207:3c::21)
 by MW4PR12MB5641.namprd12.prod.outlook.com (2603:10b6:303:186::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6886.34; Tue, 17 Oct
 2023 21:14:23 +0000
Received: from MN1PEPF0000ECD9.namprd02.prod.outlook.com
 (2603:10b6:207:3c:cafe::f5) by BL0PR02CA0008.outlook.office365.com
 (2603:10b6:207:3c::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6886.36 via Frontend
 Transport; Tue, 17 Oct 2023 21:14:22 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 MN1PEPF0000ECD9.mail.protection.outlook.com (10.167.242.138) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6838.22 via Frontend Transport; Tue, 17 Oct 2023 21:14:22 +0000
Received: from Harpoon.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Tue, 17 Oct
 2023 16:14:21 -0500
From: Felix Kuehling <Felix.Kuehling@amd.com>
To: <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 03/11] drm/amdkfd: Improve amdgpu_vm_handle_moved
Date: Tue, 17 Oct 2023 17:13:29 -0400
Message-ID: <20231017211337.1593869-4-Felix.Kuehling@amd.com>
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
X-MS-TrafficTypeDiagnostic: MN1PEPF0000ECD9:EE_|MW4PR12MB5641:EE_
X-MS-Office365-Filtering-Correlation-Id: 2fa95757-b709-4603-bb2a-08dbcf560908
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: x7vSbJhLWj5J4LWCIQq+aR5Hmk4CDAfRNbGMeMgyG5fQQJoMw7ZmA5/xgV0ThoBQOXlSV8DETQBEXZhedW0UanWEFIrrR9TJty7rh0kE9okC4K3AB/MHIq7OyRpumtSQP+aK4k/k7bHDfvtLv51dp5ZEEgAmHzPwVUdEqv1zTHi6MzQaDqy0DD8ElEVyJOvPDb4m9vvaSKNea/yIsxtuODzKSCL+IpV0+khjJVeBxZzZP7peD9hKDtAN3sHC7bnj+G33I0EERk2X/E+yMikNpgDj1pY+KHVl3CKxdWhDlnnbCC9f1yruxjwU+TqIt1AKyPgcOQVUVnPlkzg0KQapdmjvip+ROnz3Nf8BFPw3fR2ij+DT6QVKFZCRjFfXV/dUie8kIPyRe8TCKNK1vCz5+/ZS8XLPYCwKHiec6YL254B5dW9UhI3srfmX1C7geD9pnoJiey5hk+4g5i0/RP7zyLh32d91tDAIbG7j3H8NZZ+Kr5IkVry6A0+AlTh0IugcwW6Ahc8b4IpV5XLzJUlnsKwNd7fNPJjwTrFWEYHOOOwcYhDKQBf9BUGB5Kru2MtsqKJuKVjlEe2/aJnS118SzBzHmjbwWr5DBQyHYxqUvZTt0MTAhGlva6NsE4+CLF3fRolY1yxMroH6fRm9cCT07SvHciY9VOahYUkuhJOLKGOOS2SsGbi1wE6R4ix/7cMvvWJnNO/9FcY2ZqFx0YhsGZGaQN/0qcC7m1COv3l0CM7TBpraAlf20KAVMqVZSpBZ5YJ3LK8QlfBHKXgHTOQhAw==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(4636009)(136003)(396003)(376002)(346002)(39860400002)(230922051799003)(1800799009)(186009)(451199024)(82310400011)(64100799003)(40470700004)(46966006)(36840700001)(40460700003)(40480700001)(478600001)(70586007)(54906003)(110136005)(70206006)(47076005)(36860700001)(86362001)(82740400003)(356005)(83380400001)(66574015)(7696005)(316002)(336012)(26005)(16526019)(2616005)(1076003)(4326008)(426003)(81166007)(36756003)(41300700001)(2906002)(8936002)(5660300002)(8676002)(450100002)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Oct 2023 21:14:22.8292 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2fa95757-b709-4603-bb2a-08dbcf560908
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: MN1PEPF0000ECD9.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB5641
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

Let amdgpu_vm_handle_moved update all BO VA mappings of BOs reserved by
the caller. This will be useful for handling extra BO VA mappings in
KFD VMs that are managed through the render node API.

Signed-off-by: Felix Kuehling <Felix.Kuehling@amd.com>
Reviewed-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c      | 22 +--------------------
 drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c |  2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c      | 19 +++++++++++++-----
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h      |  3 ++-
 4 files changed, 18 insertions(+), 28 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
index 74769afaa33d..c8f2907ebd6f 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
@@ -1113,7 +1113,6 @@ static int amdgpu_cs_vm_handling(struct amdgpu_cs_parser *p)
 	struct amdgpu_vm *vm = &fpriv->vm;
 	struct amdgpu_bo_list_entry *e;
 	struct amdgpu_bo_va *bo_va;
-	struct amdgpu_bo *bo;
 	unsigned int i;
 	int r;
 
@@ -1141,26 +1140,7 @@ static int amdgpu_cs_vm_handling(struct amdgpu_cs_parser *p)
 			return r;
 	}
 
-	amdgpu_bo_list_for_each_entry(e, p->bo_list) {
-		/* ignore duplicates */
-		bo = ttm_to_amdgpu_bo(e->tv.bo);
-		if (!bo)
-			continue;
-
-		bo_va = e->bo_va;
-		if (bo_va == NULL)
-			continue;
-
-		r = amdgpu_vm_bo_update(adev, bo_va, false);
-		if (r)
-			return r;
-
-		r = amdgpu_sync_fence(&p->sync, bo_va->last_pt_update);
-		if (r)
-			return r;
-	}
-
-	r = amdgpu_vm_handle_moved(adev, vm);
+	r = amdgpu_vm_handle_moved(adev, vm, &p->ticket);
 	if (r)
 		return r;
 
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c
index b5e28fa3f414..e7e87a3b2601 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c
@@ -409,7 +409,7 @@ amdgpu_dma_buf_move_notify(struct dma_buf_attachment *attach)
 		if (!r)
 			r = amdgpu_vm_clear_freed(adev, vm, NULL);
 		if (!r)
-			r = amdgpu_vm_handle_moved(adev, vm);
+			r = amdgpu_vm_handle_moved(adev, vm, ticket);
 
 		if (r && r != -EBUSY)
 			DRM_ERROR("Failed to invalidate VM page tables (%d))\n",
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
index d72daf15662f..c586d0e93d75 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
@@ -1285,6 +1285,7 @@ int amdgpu_vm_clear_freed(struct amdgpu_device *adev,
  *
  * @adev: amdgpu_device pointer
  * @vm: requested vm
+ * @ticket: optional reservation ticket used to reserve the VM
  *
  * Make sure all BOs which are moved are updated in the PTs.
  *
@@ -1294,11 +1295,12 @@ int amdgpu_vm_clear_freed(struct amdgpu_device *adev,
  * PTs have to be reserved!
  */
 int amdgpu_vm_handle_moved(struct amdgpu_device *adev,
-			   struct amdgpu_vm *vm)
+			   struct amdgpu_vm *vm,
+			   struct ww_acquire_ctx *ticket)
 {
 	struct amdgpu_bo_va *bo_va;
 	struct dma_resv *resv;
-	bool clear;
+	bool clear, unlock;
 	int r;
 
 	spin_lock(&vm->status_lock);
@@ -1321,17 +1323,24 @@ int amdgpu_vm_handle_moved(struct amdgpu_device *adev,
 		spin_unlock(&vm->status_lock);
 
 		/* Try to reserve the BO to avoid clearing its ptes */
-		if (!adev->debug_vm && dma_resv_trylock(resv))
+		if (!adev->debug_vm && dma_resv_trylock(resv)) {
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
 
 		r = amdgpu_vm_bo_update(adev, bo_va, clear);
 		if (r)
 			return r;
 
-		if (!clear)
+		if (unlock)
 			dma_resv_unlock(resv);
 		spin_lock(&vm->status_lock);
 	}
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h
index 6e71978db13f..ebcc75132b74 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h
@@ -432,7 +432,8 @@ int amdgpu_vm_clear_freed(struct amdgpu_device *adev,
 			  struct amdgpu_vm *vm,
 			  struct dma_fence **fence);
 int amdgpu_vm_handle_moved(struct amdgpu_device *adev,
-			   struct amdgpu_vm *vm);
+			   struct amdgpu_vm *vm,
+			   struct ww_acquire_ctx *ticket);
 void amdgpu_vm_bo_base_init(struct amdgpu_vm_bo_base *base,
 			    struct amdgpu_vm *vm, struct amdgpu_bo *bo);
 int amdgpu_vm_update_range(struct amdgpu_device *adev, struct amdgpu_vm *vm,
-- 
2.34.1

