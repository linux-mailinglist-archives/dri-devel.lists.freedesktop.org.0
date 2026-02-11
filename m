Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AG6mBBdajGnelgAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 11 Feb 2026 11:29:43 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A64F2123594
	for <lists+dri-devel@lfdr.de>; Wed, 11 Feb 2026 11:29:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BACD810E36A;
	Wed, 11 Feb 2026 10:29:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="TAjpeEp/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from SN4PR2101CU001.outbound.protection.outlook.com
 (mail-southcentralusazon11012055.outbound.protection.outlook.com
 [40.93.195.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E42210E3A4;
 Wed, 11 Feb 2026 10:29:38 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RkOWaxv3BRZyihaltoaJfyj70uXvFud9fPVC8vtijr5HP/z+2ykGp1PuwNXTb7yX3SXaOfKAWWVWANoPNFQTppvTl2uvjiabrKR4ZFpiWkFrlOKZ0yaY9JYOGHo8Xh5spoyDP9dVrJ9WLYdXNttW4j+sd/OoRAF6L5mLFtWvNJGZCvsn0O7qo74Pw3h6XHsPSEseSqnb0zOeECNW45AWSrmTXe/Ijjm0wnDyIbba/831h2EpGYrNehrPzyzEtsFJAS2Gg9d75ikpI8MZh4u2Ef0MCkk9b31uUi/rohgv4gJ/3f6iRzRTu8kS2N9b2/IeX9zRsvDeDT2m+0DwtQW0LA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uHceu7iAHQuM5HIY6q+KDeexBeEgkCwfj0lr0lphTh8=;
 b=J9Abt//PuEnDDD0n70M2w7hEDk5seaau41ognGQCzi3v7MZ84PE2af8dBTe928qLEKrmx2hrm6iMA5OaHhDt+xZXcr56hH6mVFp4cNUtGD4zUF35GNKAO46+J36s1+bd30eupbfAY8y+8w2KbzUNuoMNcP6iehXdx8JkweHGrGQNspB15nUkU2JgfYCN47F3zZZAHFy120BB4HeXnKMw1YFoJ5r0f9YeYcYeE1I9X4QaOgvYbUtPVET3uAKvvwkOeBhUDijRhYCEI/9wC2WAZirMhQXCI0Vb6i3pX8HGKgOINKvoLszYxgNtcWTwP4rR6s7LnDfQTTm8L8lgWnv/EQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=gmail.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uHceu7iAHQuM5HIY6q+KDeexBeEgkCwfj0lr0lphTh8=;
 b=TAjpeEp/WgpmSv+UoZaNbdONWxPj97ualZ/GcqtCBbMGopjhqSnFk+i/LGv1B4gNFEkVlbcnncUC2VeaYYUgIpXd0CoYwCg2yei3vxZ7KXvxIkxwPSQvaNArLqn4/VSYArUoUoeDY/6HavksWFKCdigRIHYgQJIqUP/L7j8nxxs=
Received: from SA1P222CA0192.NAMP222.PROD.OUTLOOK.COM (2603:10b6:806:3c4::13)
 by LV2PR12MB5941.namprd12.prod.outlook.com (2603:10b6:408:172::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.10; Wed, 11 Feb
 2026 10:29:35 +0000
Received: from SN1PEPF0002636D.namprd02.prod.outlook.com
 (2603:10b6:806:3c4:cafe::89) by SA1P222CA0192.outlook.office365.com
 (2603:10b6:806:3c4::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9611.10 via Frontend Transport; Wed,
 11 Feb 2026 10:29:33 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 SN1PEPF0002636D.mail.protection.outlook.com (10.167.241.138) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9611.8 via Frontend Transport; Wed, 11 Feb 2026 10:29:35 +0000
Received: from FRAPPELLOUX01-WSLPUB.amd.com (10.180.168.240) by
 satlexmb07.amd.com (10.181.42.216) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Wed, 11 Feb 2026 04:29:33 -0600
From: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
To: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
CC: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>,
 <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>
Subject: [PATCH v1 6/6] drm/amdgpu: dump job ibs in the devcoredump
Date: Wed, 11 Feb 2026 11:26:53 +0100
Message-ID: <20260211102657.4180-6-pierre-eric.pelloux-prayer@amd.com>
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
X-MS-TrafficTypeDiagnostic: SN1PEPF0002636D:EE_|LV2PR12MB5941:EE_
X-MS-Office365-Filtering-Correlation-Id: b138690e-58b9-4b92-c48f-08de69587395
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|1800799024|36860700013|376014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?k79gnTQ1d3NCXioCly5CBtkib7vVR7tp9mOKNaitDiHQdLKpMcOGsqOHXEfH?=
 =?us-ascii?Q?67Hni+Gjw/XweK8rQdrL1dRR3CNcZT6S+q2pUl+wXbzfuZiILSbHqPdsIcXI?=
 =?us-ascii?Q?SLmg6YavJcaSvthcE4Qv6COwnBuoHQCqMftzJYJn1PfOiYDdpNN2J5aWeZCq?=
 =?us-ascii?Q?l3klhG5f9BAQkZFvvi7vsc+sVkFJO4+uYRIO/KUsxUSUxDpzNi+mpq+l6uhh?=
 =?us-ascii?Q?IQ+8NlInhR7yDWhRH8dQZJj1cy4u/FV7PFKuU11hqug5wpgWrzcxYS94gv9b?=
 =?us-ascii?Q?srxuWvwWEuAdGMxaHhfBp9Es22bL0fbxH1KUWyS5mqJvvdaIN0OUZX7Uu6Ox?=
 =?us-ascii?Q?3r1jC/3J/2St2DwvjQpKZ/I63MBMgn6JwzzbD0vQONK/N/0SzYyYzsrXniDe?=
 =?us-ascii?Q?MJqqynCyMRuXQhZ5RucLMv3VaAxdFGtoImhTRMtVjByWgevqXj59PC5divND?=
 =?us-ascii?Q?GfXfIi5NJ/T8omWLWa3M5Fz61ZYVsta2HseUbLSwiuPwPVhuI+diXxlepcFp?=
 =?us-ascii?Q?aVp2Y8A+Bk/WGrhmo3IQUucgiQHM9AuShBOV6PNPFAIBoxUlVmqFApR7eFg5?=
 =?us-ascii?Q?zePWogi7cMwViEDOHvT1kfxHdV3iFdhsaTAwjSywbyvyaZlBjk2yAVeC2iV/?=
 =?us-ascii?Q?X5ZSmLrVbD31fio42BigCimCdn1n+qL/2MWxkc0VoLtEKL2yZiweluWNujyJ?=
 =?us-ascii?Q?XbAtIaVqvHBU0JOeqgz2LXX+97vtfUs/k3ekZeShT+e0eHudUqxBfTs5tSsK?=
 =?us-ascii?Q?ZBjSjKRsBzNEVUAmXcOOtDSSVV48zwtb5/y7qxHJ6Qyk1NeQiChdrw7vEUmE?=
 =?us-ascii?Q?jrCTKAOnH3xdPMiGVvjOCo2Yvns4crxP1E9qZutHeIQKkLpwhrhPR3medTSh?=
 =?us-ascii?Q?fo0NbYksiRpWqSqGKW+hj5/PjtQgUU0Woz3MhfoXztJfBhmbpWKRoDXKygIR?=
 =?us-ascii?Q?gGq5WMSmP8Jo5RmN5EoVOwQ9IQFYZRCCeY++QnSzKdMOjPBxI0df67f100Ho?=
 =?us-ascii?Q?wS+DuZztA362en64UwNctn/E73lpVdfycTN2RMu4Ufvlf4CGvbbb/ftCOFg9?=
 =?us-ascii?Q?SMlMmRXNGNAfrFQX0g6HtmIyeKHqrObdJMauFyqsn6nI4ZMdXfCyQXPApnUm?=
 =?us-ascii?Q?Cbt2M3vza3Lq2pMfkXPn1mZMG0OP0fAvzoOQCTuIkNGcuCMbfdazM+KhF4RK?=
 =?us-ascii?Q?j+VJ2VMHQUqMFxE34H2X3b0pz9ogHjLFaB5ZqXYd6JtYFHEu/aA0+jOTXjMw?=
 =?us-ascii?Q?2IHXjNAHGayz/h4pdio5fIA6CWy+o/UeJ7w+Yird0UbgCrLPHb41dUsQV7j+?=
 =?us-ascii?Q?dleUdH1dHHP/I6C5gjgXRVjtjVi1j/XvenYPhegw5vtO/FYhoD7ZCIdAcBR1?=
 =?us-ascii?Q?mQpVk92WM8kv9JYCqp42GBenp1P924BCnbjc/r3Vk+E+rCX4N7YaF1wXhiKr?=
 =?us-ascii?Q?7AGX+GXAZqgUcFI/Ql/7MmPKu79+MdP10ch9aTPaOFEQUg7t9BoS8E193lLD?=
 =?us-ascii?Q?nh2TMYd52pEt3Z+4UPmXotXr8oGTN58fdzEvEGNuFhUlyq2pfa5efV83csaM?=
 =?us-ascii?Q?8cRPFy1fnIq1jWZKORwiH4UXGVzzglg3d4Ypwwkc7PZkckvulyMvzD4ihq5d?=
 =?us-ascii?Q?/WWOsP3S2KGqc+d4kqu+qojCcmGvsfNEB9ETF1YGFOGlCN373w7MXYK+jzjf?=
 =?us-ascii?Q?wlLmJQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(1800799024)(36860700013)(376014); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: Bh2tFyFX1zbu4k5GvPUuhKxt93cz4a6b10MHa1x4CSF9FYvGnea5EzE0DRsL1eWPC+4yF5BrHs9r/S+Q5iYSgSC5upLm0UCQvjSJbWYGLSd5hAK5zGWyqequi8rvghwRb70XSTHB24dvIwLm4WAdpzErjRrfr7mg8ihvkPVEP+oWnpXAbqvWDB+kJtEkSwbVTmW7N8LV0Kp5Xbz5iw0J7+MDXpTNddjPs00Dc+xytrwaYGA1HMOufjjWSvAQM2FGdxOGhy/9pd5aLCa3jkohoN3QB1viRl5qy50b0IOnonwsLeLqX4VJuJDzRxzfGq5vZ4rWum+J+1zSFTBOW5PjfipsNBQIJzVoYyJXmQuNfjB501amRvx40lpbsx83Mut4/JFfJWsMW7h0lZ/ryBDiuVhdS44v5+JPdfC2cgDXFjT0buZGIihPdFhR6s3NaPGE
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Feb 2026 10:29:35.0063 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b138690e-58b9-4b92-c48f-08de69587395
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1PEPF0002636D.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR12MB5941
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
X-Rspamd-Queue-Id: A64F2123594
X-Rspamd-Action: no action

Now that we have a worker thread, we can try to access the
IBs of the job. The process is:
* get the VM from the PASID
* get the BO from its VA and the VM
* map the BO for CPU access
* copy everything, then add it to the dump
Each step can fail so we have to be cautious.
These operations can be slow so when amdgpu_devcoredump_format
is called only to determine the size of the buffer we skip all
of them and assume they will succeed.

Signed-off-by: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
---
 .../gpu/drm/amd/amdgpu/amdgpu_dev_coredump.c  | 84 ++++++++++++++++++-
 1 file changed, 83 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_dev_coredump.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_dev_coredump.c
index d0af8a294abf..d576518c212d 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_dev_coredump.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_dev_coredump.c
@@ -200,12 +200,20 @@ static void amdgpu_devcoredump_fw_info(struct amdgpu_device *adev,
 static ssize_t
 amdgpu_devcoredump_format(char *buffer, size_t count, struct amdgpu_coredump_info *coredump)
 {
+	struct amdgpu_device *adev = coredump->adev;
 	struct drm_printer p;
 	struct drm_print_iterator iter;
 	struct amdgpu_vm_fault_info *fault_info;
+	struct amdgpu_bo_va_mapping *mapping;
 	struct amdgpu_ip_block *ip_block;
+	struct amdgpu_res_cursor cursor;
+	struct amdgpu_bo *abo, *root;
+	uint64_t va_start, offset;
 	struct amdgpu_ring *ring;
-	int ver, i, j;
+	struct amdgpu_vm *vm;
+	u32 *ib_content;
+	uint8_t *kptr;
+	int ver, i, j, r;
 	u32 ring_idx, off;
 
 	iter.data = buffer;
@@ -323,6 +331,80 @@ amdgpu_devcoredump_format(char *buffer, size_t count, struct amdgpu_coredump_inf
 	else if (coredump->reset_vram_lost)
 		drm_printf(&p, "VRAM is lost due to GPU reset!\n");
 
+	if (coredump->num_ibs) {
+		if (buffer)
+			vm = amdgpu_vm_lock_by_pasid(adev, &root, coredump->pasid);
+		else
+			vm = NULL;
+
+		for (int i = 0; i < coredump->num_ibs && (!buffer || vm); i++) {
+			ib_content = kvmalloc_array(coredump->ibs[i].ib_size_dw, 4,
+						    GFP_KERNEL);
+			if (!ib_content)
+				continue;
+
+			if (!vm)
+				goto output_ib_content;
+
+			va_start = coredump->ibs[i].gpu_addr & AMDGPU_GMC_HOLE_MASK;
+			mapping = amdgpu_vm_bo_lookup_mapping(vm, va_start / AMDGPU_GPU_PAGE_SIZE);
+			if (!mapping)
+				goto free_ib_content;
+
+			offset = va_start - (mapping->start * AMDGPU_GPU_PAGE_SIZE);
+			abo = amdgpu_bo_ref(mapping->bo_va->base.bo);
+			r = amdgpu_bo_reserve(abo, false);
+			if (r)
+				goto free_ib_content;
+
+			if (abo->flags & AMDGPU_GEM_CREATE_NO_CPU_ACCESS) {
+				off = 0;
+
+				if (abo->tbo.resource->mem_type != TTM_PL_VRAM)
+					goto unreserve_abo;
+
+				amdgpu_res_first(abo->tbo.resource, offset,
+						 coredump->ibs[i].ib_size_dw * 4,
+						 &cursor);
+				while (cursor.remaining) {
+					amdgpu_device_mm_access(adev, cursor.start / 4,
+								&ib_content[off], cursor.size / 4,
+								false);
+					off += cursor.size;
+					amdgpu_res_next(&cursor, cursor.size);
+				}
+			} else {
+				r = ttm_bo_kmap(&abo->tbo, 0,
+						PFN_UP(abo->tbo.base.size),
+						&abo->kmap);
+				if (r)
+					goto unreserve_abo;
+
+				kptr = amdgpu_bo_kptr(abo);
+				kptr += offset;
+				memcpy(ib_content, kptr,
+				       coredump->ibs[i].ib_size_dw * 4);
+
+				amdgpu_bo_kunmap(abo);
+			}
+
+output_ib_content:
+			drm_printf(&p, "\nIB #%d 0x%llx %d dw\n",
+				   i, coredump->ibs[i].gpu_addr, coredump->ibs[i].ib_size_dw);
+			for (int j = 0; j < coredump->ibs[i].ib_size_dw; j++)
+				drm_printf(&p, "0x%08x\n", ib_content[j]);
+unreserve_abo:
+			if (vm)
+				amdgpu_bo_unreserve(abo);
+free_ib_content:
+			kfree(ib_content);
+		}
+		if (vm) {
+			amdgpu_bo_unreserve(root);
+			amdgpu_bo_unref(&root);
+		}
+	}
+
 	return count - iter.remain;
 }
 
-- 
2.43.0

