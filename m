Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uBKJJLKJhWkWDQQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 06 Feb 2026 07:26:58 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 44C32FAA80
	for <lists+dri-devel@lfdr.de>; Fri, 06 Feb 2026 07:26:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8814A10E394;
	Fri,  6 Feb 2026 06:26:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="QxeFea7m";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from BL2PR02CU003.outbound.protection.outlook.com
 (mail-eastusazon11011055.outbound.protection.outlook.com [52.101.52.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5447710E38A;
 Fri,  6 Feb 2026 06:26:52 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VscrMbsOI6e2Hc0yi3fJnmm8CUEaztco7po9BLbincQjIjHhT8uLRzi9pjbAGfDQTZa9i+du49cejhj3zk2QITQv6kV89MpLuH/2yEy73N3n2MOgTBb0UDWeZ8xE0orLPgCZJWPMP/guWpWGHMZYUTUbjllWIXZLRcL6oomTkr+0j/0IRlkDyX8AcynEFziMYX3WjG1wlMDScI6+96fVdFVsakXaiXjl7RP/yQrbDBra1e0o0DvKbdBptuuCKhM4lWp7MK0YxRcw4y2hwQp1QwRo/PUOZK+t0yv5N5BfzcfV0+hFrr91noQ9Oh9SCqNwlDpB7SzSNSW+AzD/NZK44g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=S3hJHpnfViHF1yf+goF0/Lb83b1vt3zrrOPqrembubQ=;
 b=vqrderwuTG6vRMkkj0GTHxkOMDZDLq8QURGK7c9e5UKepXIdsjBLkwuXrh631eKS67JvdagM9xl0AsjmZEisokAf4U+rx2T4YqvD0Fdks7lH+AVDObBOh9CJkEY3aHjSFNDAGKPpAxtO49V18ckg5Bn1JTwThKNMVT0GBKqf+33r8OcmU8KLWeZllirmrpYf9LXCcR/+/uKBZHe0GhxO4qbUCE2iwcpk2AgYcQryHlyKrltHqVdyPsYNGCNL0vM42GblRl+cpL8Fq0ssGHnIethbtwfdU6NMv8UdRp0kEMtEvkpX/I0Ju8u+Y5GZKJ+HpUbGDCkeuz1LujsWkbhKUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=collabora.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=S3hJHpnfViHF1yf+goF0/Lb83b1vt3zrrOPqrembubQ=;
 b=QxeFea7mbvCX5zeZpTkLwRAHHRpp/G/cgBkr4VOLreN27rKO7Lmd3OTQudcCvyXBoanrKnY0p1oYxcu9v2NHM+RV1STdB1qmo1TB2ty433EqOUVCpYPpRR7RggYsiBiB4AveY2FFwv0NBfEWQhU+NgqRtx2NlQTmNiNKhU5NE/M=
Received: from MN2PR19CA0017.namprd19.prod.outlook.com (2603:10b6:208:178::30)
 by PH7PR12MB8825.namprd12.prod.outlook.com (2603:10b6:510:26a::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.14; Fri, 6 Feb
 2026 06:26:44 +0000
Received: from BL6PEPF00022573.namprd02.prod.outlook.com
 (2603:10b6:208:178:cafe::e5) by MN2PR19CA0017.outlook.office365.com
 (2603:10b6:208:178::30) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9587.15 via Frontend Transport; Fri,
 6 Feb 2026 06:26:47 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BL6PEPF00022573.mail.protection.outlook.com (10.167.249.41) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9587.10 via Frontend Transport; Fri, 6 Feb 2026 06:26:44 +0000
Received: from honglei-remote.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Fri, 6 Feb
 2026 00:26:40 -0600
From: Honglei Huang <honglei1.huang@amd.com>
To: <Felix.Kuehling@amd.com>, <alexander.deucher@amd.com>,
 <christian.koenig@amd.com>, <Ray.Huang@amd.com>
CC: <dmitry.osipenko@collabora.com>, <Xinhui.Pan@amd.com>,
 <airlied@gmail.com>, <daniel@ffwll.ch>, <amd-gfx@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
 <linux-mm@kvack.org>, <akpm@linux-foundation.org>, <honghuan@amd.com>
Subject: [PATCH v3 7/8] drm/amdkfd: Unify userptr cleanup and update paths
Date: Fri, 6 Feb 2026 14:25:56 +0800
Message-ID: <20260206062557.3718801-8-honglei1.huang@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260206062557.3718801-1-honglei1.huang@amd.com>
References: <20260206062557.3718801-1-honglei1.huang@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF00022573:EE_|PH7PR12MB8825:EE_
X-MS-Office365-Filtering-Correlation-Id: 1a14b2e5-3d6e-49c0-3908-08de6548b2bc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|36860700013|376014|82310400026; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?GuJroFy6F6j+HwLhWHMf70pU8LQ6cMgZj0U7C58ZBSfnDA2//mqnBC7a3dvL?=
 =?us-ascii?Q?o4FYtjKVP/rLcDROVTLRZSEp6n8GDmD1yHmmgomQKm7Mg+QaLixBNXPO/Q6I?=
 =?us-ascii?Q?D1n2f4MbmAMrt48hQCMCDs9RmUYcVjg311v0+Gc8BAZwu/n4RFoOuGNlvA8K?=
 =?us-ascii?Q?71QtDaLzqu4dA0RXAK/tINs8hLQwLghODIF2w+6ObNNhtq5QgAHB5/buhB3y?=
 =?us-ascii?Q?Eb4a5vaIITAYv+5XEthaKNAjCscWRHN7jFJiF67j+5wtPnljqoN6b8jI39Te?=
 =?us-ascii?Q?gkUrRKrdk9fkiqjLu5Z8Q3ttpZ624YDszhk9fgblz1ux/gunK3JOi10QPNLx?=
 =?us-ascii?Q?x6/yRwuaE32Km2gAvCLV3AtxqxfPkteHwRS+/bysMYFcCUzwBQcaevIi5DWS?=
 =?us-ascii?Q?+9Wa3A5XP/GVbyqAru0l60yNltl6q1hv6r9zYYdqSHCmZXWs9RU3k+8j0VZn?=
 =?us-ascii?Q?nWyLve/xq7PcH6MRDHSisK1QRgpgZ/Npz9kG+Tk1hvDzDBMKNYcPAl3hFHMj?=
 =?us-ascii?Q?OsqER/RSKnVHzqCmhD+nXSkqQ7UPlaUsOoqQf/Ds/t8+/CMtrHJqj6c0qOSV?=
 =?us-ascii?Q?sffZlaUcvtvGxR9y6MbY7XcoEi+MXMy3VoFPQVfZlGjirjJSLDUNckKizo2O?=
 =?us-ascii?Q?paiyLN/jb//lE7xTDrpkW6ez7nhs036dnaArQHhs6kat4U1N3wdZnBFfDk42?=
 =?us-ascii?Q?kDm+38Cgij6MhXoHUiom1G3h5phl1rUnohl5qHaV9PYjsEOJLGLpAT0ypYUq?=
 =?us-ascii?Q?Sps/kdHf+ku3UzcztZPnqSqfO+y2amtX3jNjvCj7GFokUx7wG5iqoxfN8Czn?=
 =?us-ascii?Q?WDqFY2rak5ArjaM2cevKHDOLhuqYdqpX4qLX3tPFcy4kCo4MCiObFQc2Hd/8?=
 =?us-ascii?Q?3Mntr26h2p0TmWTzb1mswlwrqdlM+fRgl8oecdJHn1ayIFjqv7OprXGvV3wv?=
 =?us-ascii?Q?IQ3dNjlX0PuKRvL3OegghMotA18KsrTKOzJCbapoY3YtNcnLOBufJCWAVrA4?=
 =?us-ascii?Q?mFQZWZMjNWAG1cscUdNSe4zALHXTkCI5ihrESEftTca9+ezeNMAFGj8g+QYX?=
 =?us-ascii?Q?T+1i48qMuEDCClrrOi3i0O7+qSgYxcJYmyy6rZ2Gbz/SwsIzk5cA3SpyQxUy?=
 =?us-ascii?Q?DroRYIC6wJfGpBUHbvc2J0ESowRQApxQyj5s0ajZ1r5mcmzdjVMaM4E9dDlk?=
 =?us-ascii?Q?Gunv+KXwtKhPcHJSnEYlXdemIotB40n7hTiQoztVhGygQihYPjQILV125/v/?=
 =?us-ascii?Q?4ZmpyaZdkfvQzZHJzlg733UQUv66BQX61Rk4EVBIMsm62Jdos5hPeBfM7+HT?=
 =?us-ascii?Q?3Gsgxy0/NmPdGO7eHCnrworvvWn1uH7cr1DF95bKKFzn4NDAcaErpfqINCR1?=
 =?us-ascii?Q?p41RTXFwtHoiZmqNHuIuuv0c10/rCmhzI61Znc8eGDRoESEFMFrYrlnqji02?=
 =?us-ascii?Q?cJfpUMC+pibqZ16OaIR0YQkXInUAKjNKXd/nXd+t5HqIEkXukZjPDtgn7Yh9?=
 =?us-ascii?Q?s0mKIG63NRihFRsE/YQWANwLKKLJkF6TVGwC0rr9VruXEh/1iUD4opKL19iF?=
 =?us-ascii?Q?99gKh/Wy+NY1T1EFC8+F/sBJEtxV7evHS9Dbr5+LIVtXMihZBmPz0uKllJJK?=
 =?us-ascii?Q?UdtHdibJEjEWpEsW8iwjrPip3NWpnz1cO5T6c+xOTUnp7gDSdQwfNDRYWHIx?=
 =?us-ascii?Q?9kxSvA=3D=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(36860700013)(376014)(82310400026); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: PPj0p+3sOWHaWCurAMvKCOef6fjOrT4M4kjtPtdpkUGksPAELsjfy3+3AOJNOyHRdfBzcbJ4JeP6FYCVWDsw9hA+PnrKYCXGxaLiFes2i9YRpOS9nxh1uiTwqxi+UkpAjv99hKhPKoNYLy1LpYoVccN2WrjpAawjRzcRyfy68eDM8lc96WcfgZpLWN+/n0OFx6J7biidvkgjGoHLf7I2k2zPIwiDkNA3qieoob/5ako+mCoJftzgxoLXBx6j4HWJM+fvBZVt+3PmjCUQmz95sC9+RX+GBmMNfxxFo7AXde77cXCnNd7+jHodCsrwiWZrro3MY+nqvOc/DGQAbr2e0BsLUNpN6wnneLRyByQ94goaBBavxTYKQ7g4VjhUHTgG11qaY/RxnaqjJ+s8YdkopvCdpt2C4yispPhHiXM7pJ/W9onDO0HWvEpdjET0ssSc
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Feb 2026 06:26:44.3488 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1a14b2e5-3d6e-49c0-3908-08de6548b2bc
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BL6PEPF00022573.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB8825
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
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_MISSING_CHARSET(0.50)[];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[collabora.com,amd.com,gmail.com,ffwll.ch,lists.freedesktop.org,vger.kernel.org,kvack.org,linux-foundation.org];
	DKIM_TRACE(0.00)[amd.com:+];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCPT_COUNT_TWELVE(0.00)[14];
	RCVD_COUNT_FIVE(0.00)[6];
	FROM_NEQ_ENVFROM(0.00)[honglei1.huang@amd.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_NONE(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	HAS_XOIP(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:email,amd.com:dkim,amd.com:mid,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 44C32FAA80
X-Rspamd-Action: no action

From: Honglei Huang <honghuan@amd.com>

Refactor userptr management code to handle both single and batch
allocations uniformly.

This adds:
- cleanup_userptr_resources(): unified cleanup for single/batch
- discard_user_pages_batch(): discard pages for batch ranges
- amdgpu_amdkfd_update_user_pages_batch(): update pages for batch
- valid_user_pages_batch(): validate batch pages

Modified functions to support batch mode:
- update_invalid_user_pages(): uses batch update when applicable
- confirm_valid_user_pages_locked(): checks batch validity
- amdgpu_amdkfd_gpuvm_free_memory_of_gpu(): uses unified cleanup

Signed-off-by: Honglei Huang <honghuan@amd.com>
---
 .../gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c  | 143 +++++++++++++++---
 1 file changed, 126 insertions(+), 17 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
index bc075f5f1..bea365bdc 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
@@ -2276,6 +2276,35 @@ int amdgpu_amdkfd_gpuvm_alloc_memory_of_gpu_batch(
 	return ret;
 }
 
+static void cleanup_userptr_resources(struct kgd_mem *mem,
+				      struct amdkfd_process_info *process_info)
+{
+	uint32_t i;
+
+	if (!amdgpu_ttm_tt_get_usermm(mem->bo->tbo.ttm))
+		return;
+
+	if (mem->num_user_ranges > 0 && mem->user_ranges) {
+		for (i = 0; i < mem->num_user_ranges; i++)
+			interval_tree_remove(&mem->user_ranges[i].it_node,
+					     &mem->user_ranges_itree);
+
+		if (mem->batch_notifier.mm) {
+			mmu_interval_notifier_remove(&mem->batch_notifier);
+			mem->batch_notifier.mm = NULL;
+		}
+
+		kvfree(mem->user_ranges);
+		mem->user_ranges = NULL;
+		mem->num_user_ranges = 0;
+	} else {
+		amdgpu_hmm_unregister(mem->bo);
+		mutex_lock(&process_info->notifier_lock);
+		amdgpu_ttm_tt_discard_user_pages(mem->bo->tbo.ttm, mem->range);
+		mutex_unlock(&process_info->notifier_lock);
+	}
+}
+
 int amdgpu_amdkfd_gpuvm_free_memory_of_gpu(
 		struct amdgpu_device *adev, struct kgd_mem *mem, void *drm_priv,
 		uint64_t *size)
@@ -2317,12 +2346,7 @@ int amdgpu_amdkfd_gpuvm_free_memory_of_gpu(
 	mutex_unlock(&process_info->lock);
 
 	/* Cleanup user pages and MMU notifiers */
-	if (amdgpu_ttm_tt_get_usermm(mem->bo->tbo.ttm)) {
-		amdgpu_hmm_unregister(mem->bo);
-		mutex_lock(&process_info->notifier_lock);
-		amdgpu_ttm_tt_discard_user_pages(mem->bo->tbo.ttm, mem->range);
-		mutex_unlock(&process_info->notifier_lock);
-	}
+	cleanup_userptr_resources(mem, process_info);
 
 	ret = reserve_bo_and_cond_vms(mem, NULL, BO_VM_ALL, &ctx);
 	if (unlikely(ret))
@@ -2909,6 +2933,44 @@ int amdgpu_amdkfd_evict_userptr(struct mmu_interval_notifier *mni,
 	return r;
 }
 
+static void discard_user_pages_batch(struct amdgpu_bo *bo, struct kgd_mem *mem)
+{
+	uint32_t i;
+
+	for (i = 0; i < mem->num_user_ranges; i++) {
+		if (mem->user_ranges[i].invalid && mem->user_ranges[i].range) {
+			amdgpu_ttm_tt_discard_user_pages(bo->tbo.ttm,
+							 mem->user_ranges[i].range);
+			mem->user_ranges[i].range = NULL;
+		}
+	}
+}
+
+static int amdgpu_amdkfd_update_user_pages_batch(struct mm_struct *mm,
+						 struct amdgpu_bo *bo,
+						 struct kgd_mem *mem)
+{
+	uint32_t i;
+	int ret = 0;
+
+	for (i = 0; i < mem->num_user_ranges; i++) {
+		if (!mem->user_ranges[i].invalid)
+			continue;
+
+		ret = get_user_pages_batch(
+			mm, mem, &mem->user_ranges[i],
+			&mem->user_ranges[i].range,
+			amdgpu_ttm_tt_is_readonly(bo->tbo.ttm));
+		if (ret) {
+			pr_debug("Failed %d to get user pages for range %u\n",
+				 ret, i);
+			break;
+		}
+	}
+
+	return ret;
+}
+
 /* Update invalid userptr BOs
  *
  * Moves invalidated (evicted) userptr BOs from userptr_valid_list to
@@ -2946,8 +3008,12 @@ static int update_invalid_user_pages(struct amdkfd_process_info *process_info,
 
 		bo = mem->bo;
 
-		amdgpu_ttm_tt_discard_user_pages(bo->tbo.ttm, mem->range);
-		mem->range = NULL;
+		if (mem->num_user_ranges > 0 && mem->user_ranges)
+			discard_user_pages_batch(bo, mem);
+		else {
+			amdgpu_ttm_tt_discard_user_pages(bo->tbo.ttm, mem->range);
+			mem->range = NULL;
+		}
 
 		/* BO reservations and getting user pages (hmm_range_fault)
 		 * must happen outside the notifier lock
@@ -2971,7 +3037,11 @@ static int update_invalid_user_pages(struct amdkfd_process_info *process_info,
 		}
 
 		/* Get updated user pages */
-		ret = amdgpu_ttm_tt_get_user_pages(bo, &mem->range);
+		if (mem->num_user_ranges > 0 && mem->user_ranges)
+			ret = amdgpu_amdkfd_update_user_pages_batch(mm, bo, mem);
+		else
+			ret = amdgpu_ttm_tt_get_user_pages(bo, &mem->range);
+
 		if (ret) {
 			pr_debug("Failed %d to get user pages\n", ret);
 
@@ -3005,7 +3075,10 @@ static int update_invalid_user_pages(struct amdkfd_process_info *process_info,
 			ret = 0;
 		}
 
-		amdgpu_ttm_tt_set_user_pages(bo->tbo.ttm, mem->range);
+		if (mem->num_user_ranges == 0)
+			amdgpu_ttm_tt_set_user_pages(bo->tbo.ttm, mem->range);
+		else
+			set_user_pages_batch(bo->tbo.ttm, mem->user_ranges, mem->num_user_ranges);
 
 		mutex_lock(&process_info->notifier_lock);
 
@@ -3019,6 +3092,14 @@ static int update_invalid_user_pages(struct amdkfd_process_info *process_info,
 		 /* set mem valid if mem has hmm range associated */
 		if (mem->range)
 			mem->invalid = 0;
+
+		if (mem->num_user_ranges > 0 && mem->user_ranges) {
+			uint32_t i;
+
+			for (i = 0; i < mem->num_user_ranges; i++)
+				mem->user_ranges[i].invalid = 0;
+			mem->invalid = 0;
+		}
 	}
 
 unlock_out:
@@ -3126,6 +3207,29 @@ static int validate_invalid_user_pages(struct amdkfd_process_info *process_info)
 	return ret;
 }
 
+static bool valid_user_pages_batch(struct kgd_mem *mem)
+{
+	uint32_t i;
+	bool all_valid = true;
+
+	if (!mem->user_ranges || mem->num_user_ranges == 0)
+		return true;
+
+	for (i = 0; i < mem->num_user_ranges; i++) {
+		if (!mem->user_ranges[i].range)
+			continue;
+
+		if (!amdgpu_ttm_tt_get_user_pages_done(mem->bo->tbo.ttm,
+							mem->user_ranges[i].range)) {
+			all_valid = false;
+		}
+
+		mem->user_ranges[i].range = NULL;
+	}
+
+	return all_valid;
+}
+
 /* Confirm that all user pages are valid while holding the notifier lock
  *
  * Moves valid BOs from the userptr_inval_list back to userptr_val_list.
@@ -3140,15 +3244,20 @@ static int confirm_valid_user_pages_locked(struct amdkfd_process_info *process_i
 				 validate_list) {
 		bool valid;
 
-		/* keep mem without hmm range at userptr_inval_list */
-		if (!mem->range)
-			continue;
+		if (mem->num_user_ranges > 0 && mem->user_ranges)
+			valid = valid_user_pages_batch(mem);
+		else {
+			/* keep mem without hmm range at userptr_inval_list */
+			if (!mem->range)
+				continue;
 
-		/* Only check mem with hmm range associated */
-		valid = amdgpu_ttm_tt_get_user_pages_done(
-					mem->bo->tbo.ttm, mem->range);
+			/* Only check mem with hmm range associated */
+			valid = amdgpu_ttm_tt_get_user_pages_done(
+						mem->bo->tbo.ttm, mem->range);
+
+			mem->range = NULL;
+		}
 
-		mem->range = NULL;
 		if (!valid) {
 			WARN(!mem->invalid, "Invalid BO not marked invalid");
 			ret = -EAGAIN;
-- 
2.34.1

