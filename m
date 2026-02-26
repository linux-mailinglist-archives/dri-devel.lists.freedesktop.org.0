Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gFANJ94UoGlAfgQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 26 Feb 2026 10:39:42 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F9071A3977
	for <lists+dri-devel@lfdr.de>; Thu, 26 Feb 2026 10:39:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E78110E89E;
	Thu, 26 Feb 2026 09:39:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="GRKWxX5V";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CH4PR04CU002.outbound.protection.outlook.com
 (mail-northcentralusazon11013055.outbound.protection.outlook.com
 [40.107.201.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C852B10E89D;
 Thu, 26 Feb 2026 09:39:37 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MgmTJDzNgivdcrxbeRXsgfPkjXARcB0DARglUzkGVXmQgntnxlI7PdfP91JbcAOeM71LvM0H04MyASxQuzSMqy6k7NTrd31mgzcmGkuvvJp/fqNBuajkdHy4BS//g66l4Zdjzinn3nkyCX43tFr+sql9x2HsNtjY9iA5eSXLoZi62dPaaXtuLdIJM+dFaHJ1nTQSk4i/mBSogdFzJMXpudhI9Hy5NaoXdrl8G1BTRho9hIObpgq69SGXDPE3BOH66EUcW3YBANvsYXTH5Uer9zmzETDzXlUTOdDkRsDGrtuv1sQS2rV7ohKFkTfyUotqg68TC1PeZGpJTGZxmgAw0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Q4rITWv9OU08zmFiVBjqua+/fgC++9xNKGZkviD7X64=;
 b=N5Kd6qvSyVqsPJOKW//xdhWQC20Q7yK0yvJ/z8k/XbnuqbWNFUNmZ/ETq1yD6TEaVpaqBihmHYMiyV2sBx22BVBX03FAS1IJngEfWVK7Za1WmykyYXjSMLoq5v8WIy7PUAn7Qx0QVFrOuxVajoYMgYx2Jxlhtz6ENbTxzAXeuEqBO/MqtQL8lHMzLzuX22GK3sZnGj1hfwqCEcbHWlT14VWst9QI+iUW2lHjHi3XvJNZ1fdLlGluzSk2UFlHj2h0fY+n8N/MpPOiGlbSi1okMvC9MPvmq0FatFFtS+bwHdjRgc3PjFIcONZ5QQYFIc8eSsb3VKpQN+k0cJqfg/0BBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=gmail.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Q4rITWv9OU08zmFiVBjqua+/fgC++9xNKGZkviD7X64=;
 b=GRKWxX5VhbdsgpvpWMKZBLLQFRsZM9jisfD1HcY9mwoFIMP/wDeko63Bs3PxZ793VJAwg+57ThlgSfJuiJoXyko+s6Z3kYwmWjjAsTVBuFtmNWbyPHafG9H3UorHyz9w57coG47oXT/znA0JpvA0er5t0BPj9QQKqS7fws5FLns=
Received: from SA0PR13CA0001.namprd13.prod.outlook.com (2603:10b6:806:130::6)
 by LV8PR12MB9334.namprd12.prod.outlook.com (2603:10b6:408:20b::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.14; Thu, 26 Feb
 2026 09:39:33 +0000
Received: from SA2PEPF00001507.namprd04.prod.outlook.com
 (2603:10b6:806:130:cafe::a6) by SA0PR13CA0001.outlook.office365.com
 (2603:10b6:806:130::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.22 via Frontend Transport; Thu,
 26 Feb 2026 09:39:33 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 SA2PEPF00001507.mail.protection.outlook.com (10.167.242.39) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9632.12 via Frontend Transport; Thu, 26 Feb 2026 09:39:33 +0000
Received: from FRAPPELLOUX01-WSLPUB.amd.com (10.180.168.240) by
 satlexmb07.amd.com (10.181.42.216) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Thu, 26 Feb 2026 03:39:31 -0600
From: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
To: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
CC: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>,
 <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>
Subject: [PATCH v2 4/6] drm/amdgpu: extract amdgpu_vm_lock_by_pasid from
 amdgpu_vm_handle_fault
Date: Thu, 26 Feb 2026 10:37:22 +0100
Message-ID: <20260226093727.2584-4-pierre-eric.pelloux-prayer@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260226093727.2584-1-pierre-eric.pelloux-prayer@amd.com>
References: <20260226093727.2584-1-pierre-eric.pelloux-prayer@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb08.amd.com (10.181.42.217) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF00001507:EE_|LV8PR12MB9334:EE_
X-MS-Office365-Filtering-Correlation-Id: 15d3de98-6c8f-49fd-368b-08de751af2ba
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|36860700013|82310400026|376014; 
X-Microsoft-Antispam-Message-Info: 56UlVP1E5r9hqT2z7cmBpkm225V55QaWZVLv+T1HdLqjAnAtFcAKwsYhQAp/LMi7czA4RZayz4apZIaqFe/+c6K7ApJSYnZQXxA6SgunDTnQjXA49JdZGpRxHKkdzQpAkh7IHpokolE32NOa9KpKYLWQeJeAzzIID1GYa9/Bb35Kbere/PorwyW6/oY0kAZf3y/qAdCAoYcm70vaGOgUMbekuE4lmx/iWvHOI9m/paYmCMjZa754VoAOVjD9cKu+oHRU8GPfT+KHnDZq6cGOBgv7uOZdyJ/F8qxqlHSE6hv+our1VLfstXHZQnzbx9EtTfrcbzxQ7Uer9Uglla3FHA0FCsWrPDa/UL/GKpNbz/DTyzrCGoAe2HQZ3j0f7usjjBw3ImVHJ78xxczcMna6FMvC5RLO/9zn6YCDmPbcSNohSz8epHTgLpa80pQu8FAmmWbiFeSyS0ldWJzcp4wmvJh7JvRg18CaXimcQ9g3w/YFx/oeRXeAfo+jTAvYRo1tBFC8zGpiGif5TTTSeIpHReXTkZtAinU/+caCQbK404EsOPRJNn4i6wjxC7G7WhB3yGOtrdlE4XXRUQD0nJpDnohPVgviboszt7TpxuX00tmfM7aVJGeau2j5ay/08EAt/L4luxbByySKEj2umxTTnKjfAqhmVAywiIDdJigteHlEWd6mRwaQiKgt8rz6IYa2zleuDq2x6bWBSUKfcOK6gITT/FrmwGz/zYmZ12Gvx8DjXUeNE3bo3tUJu/bv+qmxvKaOkhQynMrhJgHwE11ArrFeQWWZk9VRem6eGFrJnwLp7BMjCX48ynAtnKn1qgPa1sqHVxvH5QOE3y7P6nsHeQ==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(36860700013)(82310400026)(376014); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: PszW2YFShCJVquxMEzhxC39Ndp/DH4hzm3tK4/qyDYNUIVMfXhv0QKgTMJSKG/51F50UKyozR7Cp0n0fDNd3LBF9hhiyUlpVBgKUIlAts/YX/sjiOCjgCL0UoXyuuDY7IJniBoICfEsf0KIjURoVTkhVAvWFtnrTqyRbL3UNb5FW+5mJjYuGOR+Z3/1ZIf46u/pPqeB7AnQ3Iye3czHp94KTM3FBIbm4lCp/Wkry0XuvH5CjBvgb9lDRkjB16/r4NJTz5I8MymqkB8Jk+rKgJcfvnUQyuq6Pj1K6vBYeYzvRCen4EPJJEIbC9okxLGFwK+BBaXA7PKOYldKxTnSPxipKdk2mAXKMVG39mD+4pJPJdElyEVUx8ySKGAg3jxVGqXKZAK8ToBprR0WF8J3gBk+4kHR3CF6W6puM+xknS+Q7DrQEJ3X2Y7FGfcOQgTkh
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2026 09:39:33.4425 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 15d3de98-6c8f-49fd-368b-08de751af2ba
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SA2PEPF00001507.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR12MB9334
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
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,amd.com:mid,amd.com:dkim,amd.com:email]
X-Rspamd-Queue-Id: 4F9071A3977
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

