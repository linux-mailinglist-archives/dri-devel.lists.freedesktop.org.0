Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 78DC32EC8A2
	for <lists+dri-devel@lfdr.de>; Thu,  7 Jan 2021 04:03:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3BA706E429;
	Thu,  7 Jan 2021 03:03:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2040.outbound.protection.outlook.com [40.107.94.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D1B1F6E424;
 Thu,  7 Jan 2021 03:03:00 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NazjagVo9QbwDCMvOS0BBmqbgAVlZHwLqpQLNpQR5Yh+RaNWc8MZBGwVC/OIL2tNIXQZ6MFMd+Wwvj0T40xNEztB/nRftr2z8DWsw/Gjkwkq4AAZOMtIu9EJeb+GsfRt2neZWlVn9mIaHlusTsiPAgGQhBZFbV9ptKVuI+IKBnFOg0rE4XRwujG8Qlg0W0nyo9llbxtinyzth6nKwHiSPr29vKxO4LFjWqcEfc8fgmQm3lrqp5En6gIRkefkLbEDbIGTphR+Z7Hy7ZTH46f+ZXT5A1M7k+e33T1aaDGvRfMXq6My4eLMHvX1z9Y8gFVYjBO40hnGn2A1vSBaAJyPGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ivj7YCO0Wvwx4JveCDYaw9qSGzQX+MdE0/iktUvkdac=;
 b=NM0peFeLjHOQ69p/TMo2ZQRGNKXzzmqan/mM1Ot4VxM8cq5Dvev7HAt5pZWMGiyYbcuT/ZBtSVJXsAPnd1qZpBAdExPwLicqvJN+Xhd6bbcLD80XNEuTE8AWvdvcul0VVs0GV0qT3rJ9NyHPiVB80XkruwsIzSPZGw4WGRG1d2brvfp0f8LgBBdzTxOMnSDSAV4cd6BprOcH1/W6DOW8Ae/kNhkPBoLb4o26rEU1+NbtHMgVMM/mkNeHXiQfysQuPybED7e9FEDHPAS+yBWhkF470B3gvBH6CBKFjzczhraSrEWlKew2LDNYJ3VPY+VVw9g3eomQni7nZDvoR/kClw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ivj7YCO0Wvwx4JveCDYaw9qSGzQX+MdE0/iktUvkdac=;
 b=kIbQFW7/lZPS10+SVbh+/Xdln2GfhuUA1YqYc/a5bf/RgUFVpe4TMtVhV+oCJFqmZWMNc86jt8oxztgZ+44WYTkWiyw6ToCnBxL/4pOQRV9LOrDxbB7PtSB6Gsu5gYXeVUtzDN6yl+AXn77bDEg0zrJehK4UtPIpSHxv0FXSW0o=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from BL0PR12MB4948.namprd12.prod.outlook.com (2603:10b6:208:1cc::20)
 by MN2PR12MB3999.namprd12.prod.outlook.com (2603:10b6:208:158::27)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3721.24; Thu, 7 Jan
 2021 03:02:59 +0000
Received: from BL0PR12MB4948.namprd12.prod.outlook.com
 ([fe80::9425:559:83c0:991b]) by BL0PR12MB4948.namprd12.prod.outlook.com
 ([fe80::9425:559:83c0:991b%9]) with mapi id 15.20.3742.006; Thu, 7 Jan 2021
 03:02:59 +0000
From: Felix Kuehling <Felix.Kuehling@amd.com>
To: amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 20/35] drm/amdkfd: copy memory through gart table
Date: Wed,  6 Jan 2021 22:01:12 -0500
Message-Id: <20210107030127.20393-21-Felix.Kuehling@amd.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210107030127.20393-1-Felix.Kuehling@amd.com>
References: <20210107030127.20393-1-Felix.Kuehling@amd.com>
X-Originating-IP: [165.204.55.251]
X-ClientProxiedBy: YT1PR01CA0048.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2e::17) To BL0PR12MB4948.namprd12.prod.outlook.com
 (2603:10b6:208:1cc::20)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from Harpoon.amd.com (165.204.55.251) by
 YT1PR01CA0048.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2e::17) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3742.6 via Frontend Transport; Thu, 7 Jan 2021 03:02:59 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 34c08daa-6ce1-4d0e-8c96-08d8b2b8bda2
X-MS-TrafficTypeDiagnostic: MN2PR12MB3999:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MN2PR12MB399981DDD637F7C2A6F0658A92AF0@MN2PR12MB3999.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2582;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: S1VIiEUbG66+R/yJvxYZSNXhnMcU3xgEgYO/tu2rGVWGw3WvxOKQjaeCCywfRLLc8aR4kMdc9bhVgtA1HQFq5VW59EipRIhywz/mGaB5xyBFpzvFYcP88MVt7Rb0qzSzyEHm/5F6guT1kTfhFp49jM870FX+smaFLEBBSRfAV0rSpmVBbhi72epU0WIVhrkkp39Fb5HnNo0dSjTjDeyhE2MM29t81LncuCb1fyB7pj9NPFaOuKnR4aMeqq2WS6yJTxg0Ylr9scAyMbEXqVD6ASFMz61AWIICFnd6DCxYUkS6Fx1h2Q0yZ+irADImHmtoKj5ecI/jJdQ45mR2Sh1KBxlcby+VLR/nL+Ip9qAMRS/sRm1qh+NyhenPfJKcrOsMzfg/rjwBM6EL21CPgcU2ig==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR12MB4948.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(396003)(376002)(366004)(136003)(39860400002)(316002)(6666004)(7696005)(2616005)(956004)(8936002)(4326008)(66476007)(8676002)(478600001)(5660300002)(26005)(52116002)(1076003)(86362001)(16526019)(66946007)(450100002)(186003)(6486002)(36756003)(83380400001)(2906002)(66556008);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?iJpt9Y3ljmQdZtb7QhBMs4CaDZnnRB0c/NuIMlzXgFKW9HKIb+qWVQk6wtpQ?=
 =?us-ascii?Q?UxKJJhAOh7uzcsGH5VC2TNlWCGlcUAtovekTC8cmDNmzZTJursQ9Djzf+K0G?=
 =?us-ascii?Q?mYUeytyXw1vCsXYpG5VfMr8g8aHUuYVmpxaWu8ItDDDSXwxqY+MbI47heJlB?=
 =?us-ascii?Q?I8w7pa8L55c0oOSxznXfX1qQBEVcEEvMHqH2aHlIt3xLo8tDGqC+bkqSzfoN?=
 =?us-ascii?Q?FOsUMKgV3A6lH/slklzgdCWWv9vr9uK/kcyYqa3HWqDu8RxybP7oIMiGAyCN?=
 =?us-ascii?Q?Zd2k9cjS+JqcyAc5WGqiqrRcMFITewdlzCVCeZyw3z/205HPkjk09lyZofPi?=
 =?us-ascii?Q?VsbgoHjqCy8Ls9JLY/V/r4GvXsqxx9HSAbiAQuMy8Tkt97MjDcv3JgK25Klu?=
 =?us-ascii?Q?2UnL5mnYyl+mwcWrZ5qb3j6Sfths1RZtevL8G/6bpQ1M++zf5QVaDv3cir1X?=
 =?us-ascii?Q?5aKRJZNPee2UAHqpc67OZvC6VZLohmWqiLQEoBOIlYIIaEI3zXg0An7YozNT?=
 =?us-ascii?Q?EMwTodyEAhgHZrfS3V+MMqq914nBhZqz6Bd9y66szcJXQDHKAloG7zamaDEj?=
 =?us-ascii?Q?EOsjT5wpkxRr9efzvkUjeqlx7ZP8UjW2Q4guDTBgzfAaMDWFiZmDdIDwNbwp?=
 =?us-ascii?Q?1Qq0KqQWxMl4Q2AmSgNWjWvlIlQJHcNPLynjqyXIvZXDokFjirqlDMyWn9Rd?=
 =?us-ascii?Q?WqWIXAVjMAMmtLneer9RwA31Otlm5Lfy3g4T7mYsatLCeabWslajMinPhmzI?=
 =?us-ascii?Q?86qJgQsite/m0tvCVzA9b7tm6M915vErHjJZyPYXEGB4ljFFrjoDD8E4Zbro?=
 =?us-ascii?Q?OocDErEZaiXCm0Mv8XCCjEuz05oNAxk/Z0BOYM3txZH55YeYRBBLLVND9v5D?=
 =?us-ascii?Q?sCLSm2dCC1+ZHfvXJZWPMaKBt+MJcxSLNPjyq6i/JzJx5KCKn/zoOvwybNu8?=
 =?us-ascii?Q?vfcQG/YFTdlEgO3i/54njqRMx37oT6gRtQ03XDJfTX/fDdMI/zphsZ6XSMLN?=
 =?us-ascii?Q?ge5H?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB4948.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jan 2021 03:02:59.6057 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-Network-Message-Id: 34c08daa-6ce1-4d0e-8c96-08d8b2b8bda2
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PnQDf4lLpeqDKB5jInDo5c33q/5FJrHvnZwkQpv1zzWvtIB6wHsdqJU7jjWfl7EaS4j6dchiQkJcK7QjSexVMw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3999
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
Cc: alex.sierra@amd.com, Philip Yang <Philip.Yang@amd.com>
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
Signed-off-by: Felix Kuehling <Felix.Kuehling@amd.com>
---
 drivers/gpu/drm/amd/amdkfd/kfd_migrate.c | 172 +++++++++++++++++++++++
 drivers/gpu/drm/amd/amdkfd/kfd_migrate.h |   5 +
 2 files changed, 177 insertions(+)

diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c b/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
index 1950b86f1562..f2019c8f0b80 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
@@ -32,6 +32,178 @@
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
+		     uint64_t *addr, uint64_t *gart_addr, uint64_t flags)
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
+svm_migrate_copy_memory_gart(struct amdgpu_device *adev, uint64_t *src,
+			     uint64_t *dst, uint64_t npages,
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
+			gart_s = svm_migrate_direct_mapping_addr(adev, *src);
+			r = svm_migrate_gart_map(ring, size, dst, &gart_d, 0);
+
+		} else if (direction == FROM_RAM_TO_VRAM) {
+			r = svm_migrate_gart_map(ring, size, src, &gart_s,
+						 KFD_IOCTL_SVM_FLAG_GPU_RO);
+			gart_d = svm_migrate_direct_mapping_addr(adev, *dst);
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
+			src += size;
+			dst += size;
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
index 98ab685d3e17..5db5686fa46a 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_migrate.h
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_migrate.h
@@ -32,6 +32,11 @@
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
2.29.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
