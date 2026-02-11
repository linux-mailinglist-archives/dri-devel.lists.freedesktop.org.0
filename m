Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EKPXMwVajGm9lQAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 11 Feb 2026 11:29:25 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E845123571
	for <lists+dri-devel@lfdr.de>; Wed, 11 Feb 2026 11:29:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0300310E37F;
	Wed, 11 Feb 2026 10:29:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="ijg2e9p3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from BL0PR03CU003.outbound.protection.outlook.com
 (mail-eastusazon11012047.outbound.protection.outlook.com [52.101.53.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9191E10E36D;
 Wed, 11 Feb 2026 10:29:21 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qaFDYYNcn6/2Tn56XvXRmMzN7FHj/10jsSAz24ry2gwxrqiZ2L97QZeUatPGAxtwkxDmG8FdrrLbFZZ88hxrhVdayPU1qKKhXZqGQmzRJL2MO2Kkvk2jZaywhVJlBPQ0Y1z0sr6R930t2xdg4Xo8lPox+3O2E9ARtPMft5b9Gj722BEuUZViVYwXdRLyY8NiFIXu2IX8QS8O7gNDaApfQT5Z2hRqlGjVRI67ZwRCSq6Gv7dWasIGVhZxI8W47Gg8rnuFNoJ0LrVL9spEBmCrW+465jJOBIE8Fasicd5uUwCh/LwfoOEyQZckMBq8m0r8ItzqQ+yi70zu6dZAKfySaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tdIX4S4irjefsHgt4FgurTrOPGm5ifj19vdH1Pe0gLI=;
 b=rWVcqaX/fWBQDOaU27+e2Ot4r3lVZSSgaamijbd5PTQjRMs4vs5II47i7exiVwoNn46L3zLsJJlAW5wAILMtN9jtiH2SW5SYXeWI+fGLIAyrTOhl0a87oYvO3Qd/ZomzFtt9wIYwivX5Hh5cZjMa1jPSsEaHq5uSeCi+nzle487vD4MO0Pk+8/w6CRtBdo2JxJmn0JSvO6QX2bPDHSv0BC6lumlPBjUZGzacnnlXHsEv0K4QQdfzxs4K7W2zPGEUpjLpjVk1oDv9jO/f4RKrpcGEGB4CDfV2U5WnDbvgi9pHFEbFLTFVSVEINZaHvhgBU9ikKYHAqrAPBDCzkhb5WQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=gmail.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tdIX4S4irjefsHgt4FgurTrOPGm5ifj19vdH1Pe0gLI=;
 b=ijg2e9p3c2tvy3Vc0MErGQo6vZKbhbsGF/VjX8i5LtdvyUTFkez7vCwVKSLH6xfspEPwre6vZAjzHB2Oy7xW7tv012Sau5ugapg5A25R6SI15cyF94azyTzxjuSA5bqqvX4WJacHBdGgsOhAFXo2KykPdIxC0nFEoIG1POvHUQE=
Received: from SA9PR13CA0122.namprd13.prod.outlook.com (2603:10b6:806:27::7)
 by SN7PR12MB7276.namprd12.prod.outlook.com (2603:10b6:806:2af::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.19; Wed, 11 Feb
 2026 10:29:15 +0000
Received: from SN1PEPF00026368.namprd02.prod.outlook.com
 (2603:10b6:806:27:cafe::a5) by SA9PR13CA0122.outlook.office365.com
 (2603:10b6:806:27::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9611.8 via Frontend Transport; Wed,
 11 Feb 2026 10:29:15 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 SN1PEPF00026368.mail.protection.outlook.com (10.167.241.133) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9611.8 via Frontend Transport; Wed, 11 Feb 2026 10:29:15 +0000
Received: from FRAPPELLOUX01-WSLPUB.amd.com (10.180.168.240) by
 satlexmb07.amd.com (10.181.42.216) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Wed, 11 Feb 2026 04:29:13 -0600
From: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
To: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
CC: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>,
 <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>
Subject: [PATCH v1 4/6] drm/amdgpu: extract amdgpu_vm_lock_by_pasid from
 amdgpu_vm_handle_fault
Date: Wed, 11 Feb 2026 11:26:51 +0100
Message-ID: <20260211102657.4180-4-pierre-eric.pelloux-prayer@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260211102657.4180-1-pierre-eric.pelloux-prayer@amd.com>
References: <20260211102657.4180-1-pierre-eric.pelloux-prayer@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF00026368:EE_|SN7PR12MB7276:EE_
X-MS-Office365-Filtering-Correlation-Id: 07914757-70f1-47db-fb4b-08de6958682b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|82310400026|36860700013|376014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?IqluKBbKIbfU0XuZw+kHf4kdUwKCv/elRcuU+BElgwOP8eEXLtxGa8GobleD?=
 =?us-ascii?Q?YWYrAaf4YTTqEx+ykUsoJZU/+bmfa0efDRD1XtBdKY6VVYy40H+4zBQvFIic?=
 =?us-ascii?Q?j8HWq1tcLa/ZygoOH2iBWxpMiS3URsW7aCICFgIHXZRRKWiTldhxmGA1H7Y2?=
 =?us-ascii?Q?+9cQmqtCkDuvMVD5y89oC662NW3CDgA018f5CRyFuGinJkL5kJLaQrAC697J?=
 =?us-ascii?Q?nWBcvfhKtfL2pbXZDH8L6Fu2hAIbEUAlErRjCyWM8HHZiRJKOvdCIU4FfOn7?=
 =?us-ascii?Q?PbRM43oDi9kPQ+L9kTT0uaIMkj0q7dV5KllJqagRAKSrR8xFLeFLPfXca4MD?=
 =?us-ascii?Q?HcmiWLpkulC19m4yuobNzcERT8UOt2hi000Tb6QrIg5k4FPjTNCZdx9sTDda?=
 =?us-ascii?Q?SA0bWZYYv9M74Y9K8AvmvNbpRs4crNBudCCOnv0klhm+tpdqGnMtJVCudYJI?=
 =?us-ascii?Q?x3cT41liGWGR6LPpCtG3sXUXUVTpQMu1g25rOPSjM4He5v8Fzwpt4NYH0Ldu?=
 =?us-ascii?Q?L+TsvL1j2FdKSfOJDiDdVhAvHEb38QGMlFK14qGM2+L36Y3fkbJYprF4LxTL?=
 =?us-ascii?Q?uxsPNPEru8DLWSg6nun1LmU8/0jhnrMJHveaUCh0xfCd8N7ImOajJGuVTUX0?=
 =?us-ascii?Q?AVx58nDfpNLRdLXQ5IEXxxXl+2ZHMIjV5B9DYuWY2jyzhYcz8jFfzRKUIUmG?=
 =?us-ascii?Q?Q3iy6I22u9OtH6ENUhMf1m5GnVUg97M4gA5q0vvW0jgtQ5QiVfK/d4or5qPk?=
 =?us-ascii?Q?6u7M0jpEaJbvnJfu/P79xD8BDTgtGeESx5vxO8a5zdddd8Z/FKApbWSwfERK?=
 =?us-ascii?Q?I/2KphfvtjAh9BOWEvTXkNBg93R13HW4s/a2Gj1pLpqfwzZ8R3VBsRJzIHi7?=
 =?us-ascii?Q?0eZZ4NPV5Op20pzyLGhYbKjscTvnbs9u+wlzFKxHFqRur/ARKrVmM0LO63Tb?=
 =?us-ascii?Q?DkdZMe5yifl1TpTZrCGbaZLiHcZj10fP6Vdeu0fklJPKf46G0lw7LAN2uAdw?=
 =?us-ascii?Q?ofA6YFeBYjIAODTOeswEFqJGTy0bBrPuQY/9Y18TkVagWzU4KprlJ7dE/PPq?=
 =?us-ascii?Q?mPVNbrskNlDQ2cWEE05bZMjeplXju8CaDzEz3JR99Y0qj1VdLqlJfPBgizFX?=
 =?us-ascii?Q?+NHsFX7tbqslUAUhNJNIEMcQDlRymxpwKxt4fyP4wHwvJ5Zk+M2IeT2WeLZb?=
 =?us-ascii?Q?/xO4fTmCpyoRQgNji6foGS3d/cbDQhMutF4D3Bryo6LWMgfF5IfJzYQqfhBf?=
 =?us-ascii?Q?DT/xOY/K40BAE8QI31upniHcMIoOzmrRQ7/cna8qKHGDG8W4lfzMd3auBLNS?=
 =?us-ascii?Q?kSkS7yM/wC/mWQviEV4NlNafophpC+vP4czBDqwUB+rEby7ZLps6ImUk7zlZ?=
 =?us-ascii?Q?LsHEAzrTUdhc1IMB5j5wKQSPnWq21fvJ0enoJZc8oORiVdOPq1uRerQ0iZtw?=
 =?us-ascii?Q?OJ1YbWxK29dc23cSSSJTulvTc6us3TxKDFsOUe7iOv9AO+nBRFELz/lYTD4m?=
 =?us-ascii?Q?ldRWQOY0Grg2fB5SCVy6GXf08O341k/UyFNM4LbphCCXKob6Rbfo4gRuux52?=
 =?us-ascii?Q?W1i/JhXugbq2QEzbcjAgoA60lJuIBgmZ8NKeKEhgNjgVZ5erR82prnIebsl5?=
 =?us-ascii?Q?/FKP6to7GO3p+icGm1Kf80zTGFCorzU+qBd5cl8axgOnTrFS6P/Dw4mbLlz/?=
 =?us-ascii?Q?Tf8F0Q=3D=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(82310400026)(36860700013)(376014); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 5Hv76HJk1xk+DkO0ynJeVsQLO6Fobvj4mLjtfat9M6s3mZucLqVYBOj4vAXtXlTQRmEHEBJOY5uMv5CDNIY0cmRbPYfOf6A44b82I26D+hODNZoOYdZl2V8wicXWNE0ThKOo1vbFKrLa8LadqZdQp8NFai4irMydm12ZSkUTEuMWXpTO6zhEsaneSu6g9A4T1KE2XQZ5S6tH0j9TMIgI6D3r6dPEh8FdEh0zFgmt8/V9odQLnQWrRyGr+dEfByNKOoO4xp5ZsQbxAJLz0BxvK4OsP9q+Q0l9JCEke3BgfO6+fNiPmgtL2HhPIA9hfoVpaSS5rCH+P9PVk4LwOAVxO52W126lpcuJEF7TRbMgbX7jlvzlxn2fWei+yROJMd9UjG+ItB6Lal4C8aDfuBXrhJxHJ9WycOje8/57JIRHrZPQcTyndN2GRL4TJUav39Ps
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Feb 2026 10:29:15.8293 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 07914757-70f1-47db-fb4b-08de6958682b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1PEPF00026368.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7276
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
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[amd.com,gmail.com,ffwll.ch];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	FROM_NEQ_ENVFROM(0.00)[pierre-eric.pelloux-prayer@amd.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[amd.com:+];
	HAS_XOIP(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	RCPT_COUNT_SEVEN(0.00)[8];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:mid,amd.com:dkim,amd.com:email,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 3E845123571
X-Rspamd-Action: no action

This is tricky to implement right and we're going to need
it from the devcoredump.

Signed-off-by: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
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

