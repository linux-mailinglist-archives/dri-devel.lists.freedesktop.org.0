Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AF71B35FF5C
	for <lists+dri-devel@lfdr.de>; Thu, 15 Apr 2021 03:24:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 27AA16E9BA;
	Thu, 15 Apr 2021 01:24:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2087.outbound.protection.outlook.com [40.107.93.87])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 794E56E9B0;
 Thu, 15 Apr 2021 01:24:06 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kAJshEhR/98SjVF5oR3J1LcEatQ3N9DGXNPpPSTxNZIuEv3ZFdd2P1Tz4UTfQFqoJtUdoKTEWmX9sArBcqm3/omVi7K32yGdTUt/5A3bLeEGYXhOQoXnCuTPDnX1nlSJ+7bbAXPhSRSc8Ui7Ju+aOLcPU48QvWRKCha0lP2noCQlMi4/gqy3LDFQ5UVS69KXz0b+mOyGVb+ilcZCzkCeOjXF01gGQ26u+Ycm3nTc60QxoejnndhGyc85qnjfnaLgzB8PS+9/zu2XpdOYOr0TW1m4X2OfdPGKauyBxOYrr12k4QYnyFYTD/2PGD+ASCBoJi2LQaQ1Ze6+bVod0C4OFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=M8t5FYUNStYk9BC/Yb1Rb1cr6PEYT56mh5gPeeFB0aM=;
 b=VRyB1MOWCrjo9gzY/1WcEQPAj2EjVYrWo4w21st4V6llJGYs6vR7kyCQp+9V6jyP489m10jDSJNbHOrma4sq2RI7WzeOyRXCX/ha71gV2LIIpcnb7n6g198Iq0V3to2S5jgWrtLsJkgRZHtUh/1utvW8uAKJL5B/bQu/UNFXAvT7W6EmVhE7VAPxMQEYH9CkJZhmSkJCAPTHJ7JEv5aJaAszocCf5ejJRd9gJqfcWD93hugOBE/dDyyzxLjujpbscB/p7I44d4AB0oXnTsQzVvd9fFDJ7GkE62vmyeHQxIgGkDo79Q8tYq9+a2om8+UNWoF/wC2F4h532zTeIzlKbA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=M8t5FYUNStYk9BC/Yb1Rb1cr6PEYT56mh5gPeeFB0aM=;
 b=S3+vaJr5FDJwvXq89E3Db6DwwKor7eEywz5Vg9tO2sJZ8MJwIDmVBvBt6/2a8LF3Teb+yhwL+K1oyRXJOJQls5sAlk7gUzEQVc+gWuHOeoVvt3dIeSMCFpyVYADyxPtR+/a+DzGPt9kOD8roW/iRyvQaIdQ5w5k8u9nAUpypjas=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from BL0PR12MB4948.namprd12.prod.outlook.com (2603:10b6:208:1cc::20)
 by MN2PR12MB4208.namprd12.prod.outlook.com (2603:10b6:208:1d0::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4042.16; Thu, 15 Apr
 2021 01:24:04 +0000
Received: from BL0PR12MB4948.namprd12.prod.outlook.com
 ([fe80::70f5:99ed:65a1:c033]) by BL0PR12MB4948.namprd12.prod.outlook.com
 ([fe80::70f5:99ed:65a1:c033%7]) with mapi id 15.20.3933.040; Thu, 15 Apr 2021
 01:24:04 +0000
From: Felix Kuehling <Felix.Kuehling@amd.com>
To: amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 18/34] drm/amdkfd: copy memory through gart table
Date: Wed, 14 Apr 2021 21:23:21 -0400
Message-Id: <20210415012337.1755-19-Felix.Kuehling@amd.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210415012337.1755-1-Felix.Kuehling@amd.com>
References: <20210415012337.1755-1-Felix.Kuehling@amd.com>
X-Originating-IP: [165.204.55.251]
X-ClientProxiedBy: YTOPR0101CA0035.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:15::48) To BL0PR12MB4948.namprd12.prod.outlook.com
 (2603:10b6:208:1cc::20)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from Harpoon.amd.com (165.204.55.251) by
 YTOPR0101CA0035.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b00:15::48) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4020.21 via Frontend
 Transport; Thu, 15 Apr 2021 01:24:02 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 84755444-1eca-4eea-fa37-08d8ffad278d
X-MS-TrafficTypeDiagnostic: MN2PR12MB4208:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MN2PR12MB420807A9F27B12F1D277BB47924D9@MN2PR12MB4208.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2582;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: x1ncZL5DuYQyJQdN5/A0mGddavfZ70oIPLyXI9ZLIPlc06lLMVGeCcq/5m3dN1hYFdYGKyEHy3/RENn0mmMUhaH8t7vuHsXbvTv5pJk/ayR+kHT+1OlASc4nsOskfnI0FKqT534ekyJJeBdZiyXGVYfW43QhIlHiEuvDRFeHgvimvnmhq8u1wre/7y5juPvsfisWIVA6P/r0CU747nG0SzttZACRjZbw9VrNr8WOJRVAqkvM8hUxKo+GIIRRaIG0kQHb5JIwaZ9NPMtZbJvrjqZa006S3x0G+tQ4Lg30t87EuNrv9J0xMiR0rhwAuBv/0g4d7aJAzdvyNbxeqLg/BUCB/sVxIHPT1izsldT8idG9wbNl1uVNNWpEMwO6gonYuVH2vPiG8oZkIo7rJ52GiMxLCKK/OvB1y7xx+3u85kgJenoelEoqmVQ6b8EmILGrJHdxfZmn1R+QRi81DXDvMa8vHyFj7pvLhNt6rQkBpXUUVC9Va37fWUzK7W14d1V9cBQcCZNl+A6/dUGuiIn8meph1L4pHJ9jA7a0ecKzdujrqIjSsF0GttlVWVGvPiGBGlNZSEiFXphl6OpD2pxXiKdWfv1/a/aifCrxFFHxX1TD77KqNOa+MWbGW8OL7YAxwpYwLG2Ka+69hai3+ThgYptcTouNZiu79qijc0fBe7g=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR12MB4948.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(39860400002)(376002)(136003)(396003)(346002)(2906002)(8936002)(83380400001)(66556008)(8676002)(66946007)(38100700002)(186003)(86362001)(6666004)(2616005)(956004)(38350700002)(5660300002)(66476007)(7696005)(6486002)(52116002)(16526019)(36756003)(450100002)(478600001)(4326008)(1076003)(316002)(26005);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?flcCBJL/VmFI4fifhHidZbSoD7nJnCDH1o8lJnWeWdawI6MXiTr5uuwSCbuv?=
 =?us-ascii?Q?U/NaWZ8ZuauriR4gW5mHqRl/ML3lOtWLWQo5TOis5C2K/rJxa0NHzVOZwXdB?=
 =?us-ascii?Q?wvF5dpKfeMeE61USQ0jOKyI9p7LCu+oSIACJTjhhSL8BSCx4Zh6D1mlRI3Rw?=
 =?us-ascii?Q?sTJu0E4nb9knFzMMY1RAlSr7/2CowFpUnYMvf2AQiZ+tjuyp2ewHoLNPiWiO?=
 =?us-ascii?Q?B6ipy69QVTUDgRE5lLglhsDecFbVsOND3iMzEmqtw6EOHAoaxkWi3/Ar5Zkf?=
 =?us-ascii?Q?r9lP8Vbgg0eNv1CRsWoA1zb3K1Rjf8qBWo+NjZBNflr/eVYsYCWfOeDWq6JT?=
 =?us-ascii?Q?phFMh4wUzK55bSBjmgbHgkqTJM92p14umWWsbd3jWCaov+6j7NiCbZAA2UUE?=
 =?us-ascii?Q?SpbM9f5vGuBfz2h6gUTpYf6QNrzWaqZOHEu31a8nL6T4pkCz7kJGokN0qXOh?=
 =?us-ascii?Q?RfAK5mwlWkhY3J7xWbICdMBivEuC2xVQ9C3AcL9qWQ490ceOGS7ITTXCmTL0?=
 =?us-ascii?Q?GrcU2/aEt1yygpMZZKmW4NjYU2e7FA5ruTf+UTuzzImTZTw8IGuOaLHl66ag?=
 =?us-ascii?Q?VMEqPjIVkGSVGbwnu14OFsVMwxiUU1bYrj98g3tqKTlevRYuXcy7dKghC1Ut?=
 =?us-ascii?Q?yCVDEGHfBod8fnqaDuywUyaIUGMQFiBTwsOnslWlXGgJWlVAPVZR+e0iLHwa?=
 =?us-ascii?Q?RiSXQioCI7tuuNT8QvVm2UaTBjBOpnK99w1YFV8JaeyDuWWOezS6MO0Ju3mN?=
 =?us-ascii?Q?mmU2ygIVRVT+GylK9F3vdxaW4corMTYmYGzhaCkcs6MbapPzh4fgV4l0njTr?=
 =?us-ascii?Q?FFaw0BKjn2+5VZUWzIgvG278JCZagllwsYVsIRwbemIbI6Y5jp1pXFH3Na1w?=
 =?us-ascii?Q?uQ5EuStckQBSGutgnI8XT3E1OOtHsZWfhAbKWMQ0kDuGO23d7oiiCFB69oOi?=
 =?us-ascii?Q?uBMe6xuimvTLkNIf9tJGHq3e9DoMOEGAdnmDXG1Qf1pChhgiso2KHm5P7eN4?=
 =?us-ascii?Q?caxigdN/wDJLqa6FL1Pv0UlrqaSjLkVp5r7vPkoqjhdD3nxrrB0AHDmvpdca?=
 =?us-ascii?Q?ONhr1JfK/x1hkdS+cyxkuP56TZodHEdi1tZrrV00P+eBya3XIQawzNSq1tog?=
 =?us-ascii?Q?NT3t6HtyQevIwLfQL9qbDauSpTJ97ncjo0x5Jwl+9PKgHiK15ig2Cyt1V13H?=
 =?us-ascii?Q?IAu426y8xB7YK6eO5e+45ln94ypq0Zg6EVPOIi3hdm+ue27zwOLkdMtUvVz1?=
 =?us-ascii?Q?QN/JoZwuCEbxGC/23oiIniOLRQ/nNX+sapsAeGTqsXehhVKxvGwWZ9OCOtlf?=
 =?us-ascii?Q?a8r9bMAn1KN0cA0uOZV3O542?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 84755444-1eca-4eea-fa37-08d8ffad278d
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB4948.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Apr 2021 01:24:03.2439 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gbsUkgN5caEtAIlnhcCecoQOc3OiN8aI7FRxLyAIi+cRY03WudD059JE62oNAnCo2hfz/LpsnMcDWHsTfizq6g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4208
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
Cc: Philip Yang <Philip.Yang@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Philip Yang <Philip.Yang@amd.com>

Use sdma linear copy to migrate data between ram and vram. The sdma
linear copy command uses kernel buffer function queue to access system
memory through gart table.

Use reserved gart table window 0 to map system page address, and vram
page address is direct mapping. Use the same kernel buffer function to
fill in gart table mapping, so this is serialized with memory copy by
sdma job submit. We only need wait for the last memory copy sdma fence
for larger buffer migration.

Signed-off-by: Philip Yang <Philip.Yang@amd.com>
Reviewed-by: Felix Kuehling <Felix.Kuehling@amd.com>
Signed-off-by: Felix Kuehling <Felix.Kuehling@amd.com>
---
 drivers/gpu/drm/amd/amdkfd/kfd_migrate.c | 172 +++++++++++++++++++++++
 drivers/gpu/drm/amd/amdkfd/kfd_migrate.h |   5 +
 2 files changed, 177 insertions(+)

diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c b/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
index 0361396d17cb..9971c210cb4c 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
@@ -33,6 +33,178 @@
 #include "kfd_svm.h"
 #include "kfd_migrate.h"
 
+static uint64_t
+svm_migrate_direct_mapping_addr(struct amdgpu_device *adev, uint64_t addr)
+{
+	return addr + amdgpu_ttm_domain_start(adev, TTM_PL_VRAM);
+}
+
+static int
+svm_migrate_gart_map(struct amdgpu_ring *ring, uint64_t npages,
+		     dma_addr_t *addr, uint64_t *gart_addr, uint64_t flags)
+{
+	struct amdgpu_device *adev = ring->adev;
+	struct amdgpu_job *job;
+	unsigned int num_dw, num_bytes;
+	struct dma_fence *fence;
+	uint64_t src_addr, dst_addr;
+	uint64_t pte_flags;
+	void *cpu_addr;
+	int r;
+
+	/* use gart window 0 */
+	*gart_addr = adev->gmc.gart_start;
+
+	num_dw = ALIGN(adev->mman.buffer_funcs->copy_num_dw, 8);
+	num_bytes = npages * 8;
+
+	r = amdgpu_job_alloc_with_ib(adev, num_dw * 4 + num_bytes,
+				     AMDGPU_IB_POOL_DELAYED, &job);
+	if (r)
+		return r;
+
+	src_addr = num_dw * 4;
+	src_addr += job->ibs[0].gpu_addr;
+
+	dst_addr = amdgpu_bo_gpu_offset(adev->gart.bo);
+	amdgpu_emit_copy_buffer(adev, &job->ibs[0], src_addr,
+				dst_addr, num_bytes, false);
+
+	amdgpu_ring_pad_ib(ring, &job->ibs[0]);
+	WARN_ON(job->ibs[0].length_dw > num_dw);
+
+	pte_flags = AMDGPU_PTE_VALID | AMDGPU_PTE_READABLE;
+	pte_flags |= AMDGPU_PTE_SYSTEM | AMDGPU_PTE_SNOOPED;
+	if (!(flags & KFD_IOCTL_SVM_FLAG_GPU_RO))
+		pte_flags |= AMDGPU_PTE_WRITEABLE;
+	pte_flags |= adev->gart.gart_pte_flags;
+
+	cpu_addr = &job->ibs[0].ptr[num_dw];
+
+	r = amdgpu_gart_map(adev, 0, npages, addr, pte_flags, cpu_addr);
+	if (r)
+		goto error_free;
+
+	r = amdgpu_job_submit(job, &adev->mman.entity,
+			      AMDGPU_FENCE_OWNER_UNDEFINED, &fence);
+	if (r)
+		goto error_free;
+
+	dma_fence_put(fence);
+
+	return r;
+
+error_free:
+	amdgpu_job_free(job);
+	return r;
+}
+
+/**
+ * svm_migrate_copy_memory_gart - sdma copy data between ram and vram
+ *
+ * @adev: amdgpu device the sdma ring running
+ * @src: source page address array
+ * @dst: destination page address array
+ * @npages: number of pages to copy
+ * @direction: enum MIGRATION_COPY_DIR
+ * @mfence: output, sdma fence to signal after sdma is done
+ *
+ * ram address uses GART table continuous entries mapping to ram pages,
+ * vram address uses direct mapping of vram pages, which must have npages
+ * number of continuous pages.
+ * GART update and sdma uses same buf copy function ring, sdma is splited to
+ * multiple GTT_MAX_PAGES transfer, all sdma operations are serialized, wait for
+ * the last sdma finish fence which is returned to check copy memory is done.
+ *
+ * Context: Process context, takes and releases gtt_window_lock
+ *
+ * Return:
+ * 0 - OK, otherwise error code
+ */
+
+static int
+svm_migrate_copy_memory_gart(struct amdgpu_device *adev, dma_addr_t *sys,
+			     uint64_t *vram, uint64_t npages,
+			     enum MIGRATION_COPY_DIR direction,
+			     struct dma_fence **mfence)
+{
+	const uint64_t GTT_MAX_PAGES = AMDGPU_GTT_MAX_TRANSFER_SIZE;
+	struct amdgpu_ring *ring = adev->mman.buffer_funcs_ring;
+	uint64_t gart_s, gart_d;
+	struct dma_fence *next;
+	uint64_t size;
+	int r;
+
+	mutex_lock(&adev->mman.gtt_window_lock);
+
+	while (npages) {
+		size = min(GTT_MAX_PAGES, npages);
+
+		if (direction == FROM_VRAM_TO_RAM) {
+			gart_s = svm_migrate_direct_mapping_addr(adev, *vram);
+			r = svm_migrate_gart_map(ring, size, sys, &gart_d, 0);
+
+		} else if (direction == FROM_RAM_TO_VRAM) {
+			r = svm_migrate_gart_map(ring, size, sys, &gart_s,
+						 KFD_IOCTL_SVM_FLAG_GPU_RO);
+			gart_d = svm_migrate_direct_mapping_addr(adev, *vram);
+		}
+		if (r) {
+			pr_debug("failed %d to create gart mapping\n", r);
+			goto out_unlock;
+		}
+
+		r = amdgpu_copy_buffer(ring, gart_s, gart_d, size * PAGE_SIZE,
+				       NULL, &next, false, true, false);
+		if (r) {
+			pr_debug("failed %d to copy memory\n", r);
+			goto out_unlock;
+		}
+
+		dma_fence_put(*mfence);
+		*mfence = next;
+		npages -= size;
+		if (npages) {
+			sys += size;
+			vram += size;
+		}
+	}
+
+out_unlock:
+	mutex_unlock(&adev->mman.gtt_window_lock);
+
+	return r;
+}
+
+/**
+ * svm_migrate_copy_done - wait for memory copy sdma is done
+ *
+ * @adev: amdgpu device the sdma memory copy is executing on
+ * @mfence: migrate fence
+ *
+ * Wait for dma fence is signaled, if the copy ssplit into multiple sdma
+ * operations, this is the last sdma operation fence.
+ *
+ * Context: called after svm_migrate_copy_memory
+ *
+ * Return:
+ * 0		- success
+ * otherwise	- error code from dma fence signal
+ */
+int
+svm_migrate_copy_done(struct amdgpu_device *adev, struct dma_fence *mfence)
+{
+	int r = 0;
+
+	if (mfence) {
+		r = dma_fence_wait(mfence, false);
+		dma_fence_put(mfence);
+		pr_debug("sdma copy memory fence done\n");
+	}
+
+	return r;
+}
+
 static void svm_migrate_page_free(struct page *page)
 {
 }
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_migrate.h b/drivers/gpu/drm/amd/amdkfd/kfd_migrate.h
index 89392548ec44..df84e4143e25 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_migrate.h
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_migrate.h
@@ -33,6 +33,11 @@
 #include "kfd_priv.h"
 #include "kfd_svm.h"
 
+enum MIGRATION_COPY_DIR {
+	FROM_RAM_TO_VRAM = 0,
+	FROM_VRAM_TO_RAM
+};
+
 #if defined(CONFIG_DEVICE_PRIVATE)
 int svm_migrate_init(struct amdgpu_device *adev);
 void svm_migrate_fini(struct amdgpu_device *adev);
-- 
2.31.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
