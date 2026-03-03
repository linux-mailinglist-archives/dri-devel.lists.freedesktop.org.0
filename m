Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +NR4Cm8Kp2kDcgAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 03 Mar 2026 17:21:03 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C96381F39C4
	for <lists+dri-devel@lfdr.de>; Tue, 03 Mar 2026 17:21:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC7E810E84B;
	Tue,  3 Mar 2026 16:21:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="nmAiXuzt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CH4PR04CU002.outbound.protection.outlook.com
 (mail-northcentralusazon11013051.outbound.protection.outlook.com
 [40.107.201.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 18D2310E84B;
 Tue,  3 Mar 2026 16:21:00 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VrBWlLTHxPqEKF/k6R797SVcH+3LQV48JXhTC2vVt4JNYZVMLpVwb8os/T/thNbovJYSKZ0TneTmF3w787/0LzTZJ/MSQFSiSVlaS8ZbN81/KFCR+GAobXtFjCO/VHmgq0jPvIbQ3rnsnXEioEYPMMa6qfKFyEMSjF26rR5QzoStinvg52VxlydmbQkE/2ZtsjGxpjanTVgd4ZM6xtRu/WoqHCofLhaZ2Qwp2/M9hX9sj25B98zwI2wEoS1s0JPl0aOyQ4/jb9/cIQagjszMmXmCMm8/Qpn/t58IMWU1Qu3OwLIEOvcX0wZp1zCxq/j22rEcAUR5QvMRZiPNCJRzMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Q4rITWv9OU08zmFiVBjqua+/fgC++9xNKGZkviD7X64=;
 b=U0v1FSDEIgAIL/IbU9JRuSQ7i7OgbibkXv6OoM+pltvONFhqZEXx5z8tXCWRLHvBONBqytQn+IGLK9ZN/1l3Et+Jfag2mcWDEryN1Pimu6P+bDa1YjgvdNfMDhzFsCaWnTZa7MduCBloAfX+CAj1AeiTTrItZl0jEX96T8PqRcIvQv4zojdH3CY8tC+r45lmQkquX3Np8EBDjkg1w1HPX/wU3dfFaHWhTTjMSfknE9iRnsx44wEmilvhgZDhsslLPgrsT0J39hLkb1IYCRRTz2tLm8/HN9RHzIOE0aYjDYIZCOvO2M9nDHBOTB+iHXFPZdQ7+wqSabR3rJ5Dwlibyw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=gmail.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Q4rITWv9OU08zmFiVBjqua+/fgC++9xNKGZkviD7X64=;
 b=nmAiXuztU0NfUB207XxjF+vZSYWIJLgEtVtNmZtmuOf93b2AZongHNJxc0oS/uQUhH4lVs2uzgxpMPoiI8CHwlxo1vrKrv75ew/mNeoVZMPZVWaRrKLd39oMYo9fo0+yCQDUdultY1DuSNdNzzlRvZ3b0GwvPApnjVTIDr67uas=
Received: from SN7PR18CA0005.namprd18.prod.outlook.com (2603:10b6:806:f3::24)
 by CH2PR12MB4311.namprd12.prod.outlook.com (2603:10b6:610:a8::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.22; Tue, 3 Mar
 2026 16:20:54 +0000
Received: from SN1PEPF0002BA50.namprd03.prod.outlook.com
 (2603:10b6:806:f3:cafe::c1) by SN7PR18CA0005.outlook.office365.com
 (2603:10b6:806:f3::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9654.22 via Frontend Transport; Tue,
 3 Mar 2026 16:20:48 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 SN1PEPF0002BA50.mail.protection.outlook.com (10.167.242.73) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9654.16 via Frontend Transport; Tue, 3 Mar 2026 16:20:52 +0000
Received: from FRAPPELLOUX01-WSLPUB.amd.com (10.180.168.240) by
 satlexmb07.amd.com (10.181.42.216) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Tue, 3 Mar 2026 10:20:50 -0600
From: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
To: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
CC: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>,
 <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>
Subject: [PATCH v3 4/6] drm/amdgpu: extract amdgpu_vm_lock_by_pasid from
 amdgpu_vm_handle_fault
Date: Tue, 3 Mar 2026 17:18:17 +0100
Message-ID: <20260303161824.7765-4-pierre-eric.pelloux-prayer@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260303161824.7765-1-pierre-eric.pelloux-prayer@amd.com>
References: <20260303161824.7765-1-pierre-eric.pelloux-prayer@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb08.amd.com (10.181.42.217) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF0002BA50:EE_|CH2PR12MB4311:EE_
X-MS-Office365-Filtering-Correlation-Id: 790101d6-bc0c-446b-a9f4-08de7940d6f9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|36860700013|1800799024|376014; 
X-Microsoft-Antispam-Message-Info: BTk4iOFR0SIY9mjB3VG+NL+N963XSMeZ6iWI4Hw5z4FIMoQP3gkriO7OUCbfxBVn6PUSD/X/yqzDiZMMKKsKZ9vuf2BjQPu0o5EixryVmYpYpfQCKc1TnRklhlK7ftQT8k+pmDqTYJSqDCktcyp/I8TeaMVLvayTS/G5bHxkKzQ8vu0ONHQOE/ui/NoAKYwUM0mo2zAKBrAzi6C9IXZiIuCAGDfEospQ38I8blhVDB1gjolgtM5cw9wpMU1byVTGjL7V5luRNuGfFp01U+BvYVFaAgnQU6YQlZMvZbuW0uMZhLLO4isFhFJ/y1MSXZH9BcUEfjt+VdY2bUun2Abcs9xeMvWCIIj2SCKAFrJvo1ZSkIp21IgKXk+5dWqsilx27nlmcSQHOpfrXImlzqxiw043Zi/wlT8kP2goR4Hdmxvh0xbstmg7Lo5ueXq8e4w+kTrnjaDBqR/6cBz8mYb7kJVLG9DtMh5Ub7MmKhf+8CUr0+MylQWEUT6IVuzsUSu50WNbvbqedXFqraVmyBZmP+2zP1jRlXIBEvRryLiU2czbV3PMeoNJ2jQN3NNRkU2aMaqvWfF/zCIbZFoMO70RBobGJOWDI710mXzPAlgeA8L5iZEnJHkYNqXLgkr9Rvwj6K47a2ST0Hbsf18Y4LulQ0dWq59NVqWruPz6e6wTi3uAcQT6/L3RrFasbeIpgYQVyaJSljzqC2w+wupLIs+14uZmfm/NuEKiX5j0k3UMTUTN9Wlh/0OHPZDg6qXGLvwPm+W+rT9P2PGCYIwqVErSVb7ZEn9e/W5FL8wpBnFGnbjg36GTQiBP6NjMw7uMfuFTZtuTipwTEUa1GxtfTF3XJg==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(36860700013)(1800799024)(376014); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: jyeLe2spuwEy0W/T+LkIh/cA9uNg5EaDTeeLJuKywKNir0gNd4/dQptMpuaZnp4SDn4x2QSSnMLToDHa1LVfaz+XissTBhQSkgWg4vsNXww3v5nUrTvF77090LEnW19GJtEiUA0OQFmgTE/U2Yml6ntAUgVSL6W7AeWMxCRCrt+YSl9xFDmTawbA7o87xD+Cykg/vSY3Wv2FT+afmJM14XJkiSyC8UgdutbvYhsWTCCrKUnW1/5SYoc5lUziEyO2KR99jdmhYIDj4gZwh+l//YK+dfG/9Rn4/x6esVBryoF/9WM7IQNbDvx1woQEYW5rZIruIMgnMbDwZb84y303mS3rLz6OE2A8Dzhh8m4670PowrK70pfSvblYJ5Y30tXzdiaicCUAs3ZjWZyNcRMY3KJ2svTEKY6YzX8kzk6r9bufWJbRNwxRQyIZpz2iQU23
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Mar 2026 16:20:52.4126 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 790101d6-bc0c-446b-a9f4-08de7940d6f9
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1PEPF0002BA50.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4311
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
X-Rspamd-Queue-Id: C96381F39C4
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.81 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[amd.com,gmail.com,ffwll.ch];
	FORGED_SENDER_MAILLIST(0.00)[];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[amd.com:+];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	FROM_NEQ_ENVFROM(0.00)[pierre-eric.pelloux-prayer@amd.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	HAS_XOIP(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:dkim,amd.com:email,amd.com:mid,gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo]
X-Rspamd-Action: no action

This is tricky to implement right and we're going to need
it from the devcoredump.

Signed-off-by: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
Acked-by: Alex Deucher <alexander.deucher@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c | 84 +++++++++++++++++---------
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h |  3 +
 2 files changed, 57 insertions(+), 30 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
index 807f8bcc7de5..6a5b3e148554 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
@@ -2930,6 +2930,50 @@ int amdgpu_vm_ioctl(struct drm_device *dev, void *data, struct drm_file *filp)
 	return 0;
 }
 
+/**
+ * amdgpu_vm_lock_by_pasid - return an amdgpu_vm and its root bo from a pasid, if possible.
+ * @adev: amdgpu device pointer
+ * @root: root BO of the VM
+ * @pasid: PASID of the VM
+ * The caller needs to unreserve and unref the root bo on success.
+ */
+struct amdgpu_vm *amdgpu_vm_lock_by_pasid(struct amdgpu_device *adev,
+					  struct amdgpu_bo **root, u32 pasid)
+{
+	unsigned long irqflags;
+	struct amdgpu_vm *vm;
+	int r;
+
+	xa_lock_irqsave(&adev->vm_manager.pasids, irqflags);
+	vm = xa_load(&adev->vm_manager.pasids, pasid);
+	*root = vm ? amdgpu_bo_ref(vm->root.bo) : NULL;
+	xa_unlock_irqrestore(&adev->vm_manager.pasids, irqflags);
+
+	if (!*root)
+		return NULL;
+
+	r = amdgpu_bo_reserve(*root, true);
+	if (r)
+		goto error_unref;
+
+	/* Double check that the VM still exists */
+	xa_lock_irqsave(&adev->vm_manager.pasids, irqflags);
+	vm = xa_load(&adev->vm_manager.pasids, pasid);
+	if (vm && vm->root.bo != *root)
+		vm = NULL;
+	xa_unlock_irqrestore(&adev->vm_manager.pasids, irqflags);
+	if (!vm)
+		goto error_unlock;
+
+	return vm;
+error_unlock:
+	amdgpu_bo_unreserve(*root);
+
+error_unref:
+	amdgpu_bo_unref(root);
+	return NULL;
+}
+
 /**
  * amdgpu_vm_handle_fault - graceful handling of VM faults.
  * @adev: amdgpu device pointer
@@ -2945,50 +2989,31 @@ int amdgpu_vm_ioctl(struct drm_device *dev, void *data, struct drm_file *filp)
  * shouldn't be reported any more.
  */
 bool amdgpu_vm_handle_fault(struct amdgpu_device *adev, u32 pasid,
-			    u32 vmid, u32 node_id, uint64_t addr, uint64_t ts,
-			    bool write_fault)
+			    u32 vmid, u32 node_id, uint64_t addr,
+			    uint64_t ts, bool write_fault)
 {
 	bool is_compute_context = false;
 	struct amdgpu_bo *root;
-	unsigned long irqflags;
 	uint64_t value, flags;
 	struct amdgpu_vm *vm;
 	int r;
 
-	xa_lock_irqsave(&adev->vm_manager.pasids, irqflags);
-	vm = xa_load(&adev->vm_manager.pasids, pasid);
-	if (vm) {
-		root = amdgpu_bo_ref(vm->root.bo);
-		is_compute_context = vm->is_compute_context;
-	} else {
-		root = NULL;
-	}
-	xa_unlock_irqrestore(&adev->vm_manager.pasids, irqflags);
-
-	if (!root)
+	vm = amdgpu_vm_lock_by_pasid(adev, &root, pasid);
+	if (!vm)
 		return false;
 
+	is_compute_context = vm->is_compute_context;
+
 	addr /= AMDGPU_GPU_PAGE_SIZE;
 
-	if (is_compute_context && !svm_range_restore_pages(adev, pasid, vmid,
-	    node_id, addr, ts, write_fault)) {
+	if (is_compute_context &&
+		!svm_range_restore_pages(adev, pasid, vmid, node_id, addr,
+					ts, write_fault)) {
+		amdgpu_bo_unreserve(root);
 		amdgpu_bo_unref(&root);
 		return true;
 	}
 
-	r = amdgpu_bo_reserve(root, true);
-	if (r)
-		goto error_unref;
-
-	/* Double check that the VM still exists */
-	xa_lock_irqsave(&adev->vm_manager.pasids, irqflags);
-	vm = xa_load(&adev->vm_manager.pasids, pasid);
-	if (vm && vm->root.bo != root)
-		vm = NULL;
-	xa_unlock_irqrestore(&adev->vm_manager.pasids, irqflags);
-	if (!vm)
-		goto error_unlock;
-
 	flags = AMDGPU_PTE_VALID | AMDGPU_PTE_SNOOPED |
 		AMDGPU_PTE_SYSTEM;
 
@@ -3027,7 +3052,6 @@ bool amdgpu_vm_handle_fault(struct amdgpu_device *adev, u32 pasid,
 	if (r < 0)
 		dev_err(adev->dev, "Can't handle page fault (%d)\n", r);
 
-error_unref:
 	amdgpu_bo_unref(&root);
 
 	return false;
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h
index 139642eacdd0..2051eda55c99 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h
@@ -589,6 +589,9 @@ bool amdgpu_vm_handle_fault(struct amdgpu_device *adev, u32 pasid,
 			    u32 vmid, u32 node_id, uint64_t addr, uint64_t ts,
 			    bool write_fault);
 
+struct amdgpu_vm *amdgpu_vm_lock_by_pasid(struct amdgpu_device *adev,
+					  struct amdgpu_bo **root, u32 pasid);
+
 void amdgpu_vm_set_task_info(struct amdgpu_vm *vm);
 
 void amdgpu_vm_move_to_lru_tail(struct amdgpu_device *adev,
-- 
2.43.0

