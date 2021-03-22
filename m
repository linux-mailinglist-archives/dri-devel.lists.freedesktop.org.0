Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 583BD343F47
	for <lists+dri-devel@lfdr.de>; Mon, 22 Mar 2021 12:09:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 76BAB6E425;
	Mon, 22 Mar 2021 11:08:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2045.outbound.protection.outlook.com [40.107.243.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E46E96E226;
 Mon, 22 Mar 2021 11:08:27 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XtR0l+aKFOuWgtGScWtkAFl7ijxu8V1ldxWxA1VzRME9Y9gCrTOUCBSSdXg3XC3reu7O6XPbP5Jdqg55vK0w7nGf6SWxBXHbtrSZ4ZlGtpvOj0cCOWzbCEeTTzMynmhLoBsdCyg/chJAfOCliSxXo/anDZT9z0KKtVaDBEucjj50dqb2MIxIiKKWTOoiHbcLfyP4yZ55oJJUNpMiXXrVODcyMZnIHzvOP/udQcanYbFNDBWy8fhP92QeFaL0k44lDiyDIuK24nrVXudWl9EBwOs3D3Wt+piq+/Nw0Em+oILoZCLPhqLG62xaX02suhpGDMCstEIRxBrxZ4onppA8oQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ScsvdE99eeiugznlhS42lTQYOKbMlIoPsISEjrkiK6s=;
 b=YFod+NSGNbzbJDqB8KO2GSUkCK4Ih4sJkPoxjiVfkaBDyPTiT4p0TyKoCn7B58/qpbdKbh8XDMdFjqA9f2TJfHb/6SvhMXShni8jti3b1mCq3K3+WhGRoyJH7v1UCmcH9ywAcK/36PvAVKi3NyBLAnCCUbjA/RqnirNyDTif7VEy2jGQBEkMyEWuVchIvMChziAuPYH6sPzX3go7nWUtBE2hwljtNcVJXielaeLFBQAg5qsMyg0ABydQIzMjf5fJdR0//rN3QHjQrkCW5uAsPhdnjMNANXOFIPOrJPZ1j9JuOqYfHnfMu3iuVw6Bxz0zW1xPEnXbaPDAe0aosJ76LQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ScsvdE99eeiugznlhS42lTQYOKbMlIoPsISEjrkiK6s=;
 b=i7KXgGSg+T4Qj/zjbJbwfJ/aN0bBdtOc+Aw2elfI4GWtMD8MxSCypJplWRtarIaAJxmwUd2PLfaHabFIDxx86g6FVkYxVbvYjXHduJ/ppo/ewW8IJzpvJx821sHfPVl1f7KrlqIslvALhhJPhQ1YF7KuXHBHfnaNEBnOkwoizE0=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from BL0PR12MB4948.namprd12.prod.outlook.com (2603:10b6:208:1cc::20)
 by MN2PR12MB4255.namprd12.prod.outlook.com (2603:10b6:208:198::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.24; Mon, 22 Mar
 2021 11:08:23 +0000
Received: from BL0PR12MB4948.namprd12.prod.outlook.com
 ([fe80::70f5:99ed:65a1:c033]) by BL0PR12MB4948.namprd12.prod.outlook.com
 ([fe80::70f5:99ed:65a1:c033%5]) with mapi id 15.20.3933.036; Mon, 22 Mar 2021
 11:08:23 +0000
From: Felix Kuehling <Felix.Kuehling@amd.com>
To: dri-devel@lists.freedesktop.org,
	amd-gfx@lists.freedesktop.org
Subject: [PATCH 43/44] drm/amdkfd: Correct locking during migration and mapping
Date: Mon, 22 Mar 2021 06:58:59 -0400
Message-Id: <20210322105900.14068-44-Felix.Kuehling@amd.com>
X-Mailer: git-send-email 2.31.0
In-Reply-To: <20210322105900.14068-1-Felix.Kuehling@amd.com>
References: <20210322105900.14068-1-Felix.Kuehling@amd.com>
X-Originating-IP: [165.204.55.251]
X-ClientProxiedBy: YTOPR0101CA0008.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:15::21) To BL0PR12MB4948.namprd12.prod.outlook.com
 (2603:10b6:208:1cc::20)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from Harpoon.amd.com (165.204.55.251) by
 YTOPR0101CA0008.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b00:15::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.24 via Frontend
 Transport; Mon, 22 Mar 2021 11:07:51 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: a9c7d274-b24c-4c96-93f1-08d8ed22bc67
X-MS-TrafficTypeDiagnostic: MN2PR12MB4255:
X-Microsoft-Antispam-PRVS: <MN2PR12MB4255FF109490F1D849D58B4292659@MN2PR12MB4255.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: bURxYpGoAswTPyYQwMLO8hoo2j/8SDRWkdmjkIHkqdn6sG6EtmEezplRN/katlmH8rcZbEgkIdbvuUz+1y9N3o92KMaGS5qXf3qGot8v8LZPGOkyqtwhk6C0tfk9usVPLoL+6ogKegbezvTXB1E/f0F+drjfi2/cGgjy7jzVRY+nq4PSC9/mrO6mCtGXF/6+mJvsp/ZXYM2i6RWOK9fCQxwipGLx7BQE490D1jRkUau+OVwfDsFCID2wnTUJlFJ/6KAvL1c8Z4EGY6iAF1igMkkS8wMRthi6BzgWiLPOnPj5Gzxc/IJFt2+YZUMQ7co1vHHApAcXpR6udNZeE8o3QgLFFZoGO5qNgk19jl9gJGfGoraA7H9VumFATbTVeAST/ifa2+7R5fmTqzdmkM4Cm0jDgzSjYNTfkaSHumZ5PRTzo6KfHmQJBB3Dq78DTeDc8e9WMUGTMsSqOxBjR98di3wkrm+hVrNTBZtnTh8gZoEYi00IBI2xN2OkKO4Hh9Us2hENLw8Apzd4bVvn2NwEKXbsM2qlbMG4G3fJ0Ga775t+m0PHfjMGEXWghRGEN3bHrX1vSch1ng41E6jkequ+za9uGxpjkWU/ed+CQ6R4+kgVIc0pcJUf2Jf/SB9aXlOKdCuKsZqIikqElmbClzTu4w==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR12MB4948.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(136003)(366004)(39860400002)(376002)(346002)(450100002)(1076003)(36756003)(38100700001)(30864003)(66946007)(83380400001)(66556008)(66476007)(5660300002)(16526019)(186003)(8676002)(26005)(7696005)(52116002)(86362001)(478600001)(8936002)(2616005)(956004)(6486002)(2906002)(316002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?uO2THRP66z7Ws1mXtWbb+bVhRe03dovp2VjQKOrjnpT4sUdcn4eSrSTk+3xL?=
 =?us-ascii?Q?2zJ2a06mHP6JUrury/nmkmIlwc+2gkJuZgYkSzxvxvEFLDKUVrKsP43Sa9hF?=
 =?us-ascii?Q?9gYHnYPYiL+V/fvbL00qVNLVfT5M+zSISEGK035Y5qDJL1mC7CnxiG3uIvsf?=
 =?us-ascii?Q?NSEj9qFrAhMLA9tWGSG2i6ZJekLME7J9Sn5nNIJUZs+plQZJUuaMxbeMy5IH?=
 =?us-ascii?Q?pKDUJF9loq/k7ma/4XKLXsYNOjqx/6+FtGol3mWh41JGPHI9S2Pc93efXIOk?=
 =?us-ascii?Q?TRX1TwCBQDtoG4etB1JRlXpjrKsZjM+5/YM1S8AdVfVqKxKqBDMWFBCb6k5v?=
 =?us-ascii?Q?UYFOq2SpgQ8oAhhZODbCaanwgHtGNcTXAoA2btR2qAR6vIJ1tZjLqHSHAF/K?=
 =?us-ascii?Q?DIAg8euE9bG76/ZuCAa2Vt1UW7Xb1tiz1TAs/8n1jvsgLkjyj1QhNp8pSzZv?=
 =?us-ascii?Q?6vAv/Gqzr8HNvU3MS01HDRkMHoB4t0hCDGIyokj9D4L1x6MScgWmAIxgoqEx?=
 =?us-ascii?Q?2LWy52ztITQa21kxSmptpbHJz1HuBr8BXJBdJSmpjz47tiHtI4EHtWirvdVa?=
 =?us-ascii?Q?I/3BQxz7a8JyQIL1sgF19NDGa103gi3lJBm6qyIXHfbDIYT1zZxGFDbzi7Y9?=
 =?us-ascii?Q?edltIb4z5uc26mlwt9Jcgm3WENcFGWjJMJcCoyaIibLEsDOvzZI7PmweYj5Y?=
 =?us-ascii?Q?lMBXl7y/ctz38mh6zm9L0ZsrBJHNjCbPxHSRtTytHtQKPzQjUhpWquPYKdi6?=
 =?us-ascii?Q?tK3p5oLEdsdi1UHTu77ythHGO+rU6DVVY2UlcS3oUUMJ8Y0bIaJ5ARYYRfSD?=
 =?us-ascii?Q?TH/3Cjj/sxJLG8RgpIyLue5I5DIBntp14qLx4XuQXkA9BkybS8GkXh+nlilF?=
 =?us-ascii?Q?zjeX5/HjYj0JDTdcM7mRaHSVacjWffeIH+QW14qYnHwzAzUy1e146ML0ULvL?=
 =?us-ascii?Q?nqcuEZoahDD5VBa4LehsfSKx0Ab1iv3Yz0cfJJBxkG51bZ2PIq0gpdmYRvKi?=
 =?us-ascii?Q?yNO8dqwCG1kp7Pq4/fWM6ONQ379lbXB7MVvg8IoNFSKMYaB4yYL77YsTRks1?=
 =?us-ascii?Q?GbebP177smpt40JROF6ofrc4ThAOmIk/5mrcPQ4Bjh/36x84PZc+CjIqZ+ob?=
 =?us-ascii?Q?h9igE9MXgA9tGyOEWRmtiLOKCGo/G+XUtGIWXf/PldjPJ3DXxwfj/krmvJ1n?=
 =?us-ascii?Q?T5PqgNP/ikSGF3fXWIu6rD8POOlexgiRT5iCmhHDejRgaXdQbG1qiox16YD+?=
 =?us-ascii?Q?CgLPnNQLadTNtDF7NBhHZoOAomBCx5TTV634WEGEAb5dT85lrSwgcniKkSnd?=
 =?us-ascii?Q?xE859/JXbPX9YnRWLS6dtzZc?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a9c7d274-b24c-4c96-93f1-08d8ed22bc67
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB4948.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Mar 2021 11:07:52.0452 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6irYgKIYOMd5KNvbf0XRuL61Rl7ME37MTHBkdJc/mPcWJ7bmXcMXU5H/w5QdLG7BpWN5DZ1ktJzbnyLjKvfRlA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4255
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This fixes potential race conditions between any code that validates and
maps SVM ranges and MMU notifiers. The whole sequence is encapsulated in
svm_range_validate_and_map. The page_addr and hmm_range structures are
not useful outside that function, so they were removed from
struct svm_range.

Validation of system memory pages before migration to VRAM is maintained
as an explicit workaround. It should not be needed, but without it there
are still some page locking deadlocks to be investigated.

Signed-off-by: Felix Kuehling <Felix.Kuehling@amd.com>
---
 drivers/gpu/drm/amd/amdkfd/kfd_migrate.c |   6 +-
 drivers/gpu/drm/amd/amdkfd/kfd_svm.c     | 573 ++++++++++++-----------
 drivers/gpu/drm/amd/amdkfd/kfd_svm.h     |   9 +-
 3 files changed, 310 insertions(+), 278 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c b/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
index 87561b907543..4d79d69d8aac 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
@@ -466,9 +466,6 @@ svm_migrate_vma_to_vram(struct amdgpu_device *adev, struct svm_range *prange,
 		migrate_vma_finalize(&migrate);
 	}
 
-	kvfree(prange->pages_addr);
-	prange->pages_addr = NULL;
-
 	svm_range_dma_unmap(adev->dev, scratch, 0, npages);
 	svm_range_free_dma_mappings(prange);
 
@@ -513,6 +510,9 @@ svm_migrate_ram_to_vram(struct svm_range *prange, uint32_t best_loc,
 	pr_debug("svms 0x%p [0x%lx 0x%lx] to gpu 0x%x\n", prange->svms,
 		 prange->start, prange->last, best_loc);
 
+	/* FIXME: workaround for page locking bug with invalid pages */
+	svm_range_prefault(prange, mm);
+
 	start = prange->start << PAGE_SHIFT;
 	end = (prange->last + 1) << PAGE_SHIFT;
 
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_svm.c b/drivers/gpu/drm/amd/amdkfd/kfd_svm.c
index aedb2c84131e..0a6e28f0dcaf 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_svm.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_svm.c
@@ -39,6 +39,16 @@
  */
 #define AMDGPU_SVM_RANGE_RETRY_FAULT_PENDING	2000
 
+struct svm_validate_context {
+	struct kfd_process *process;
+	struct svm_range *prange;
+	bool intr;
+	unsigned long bitmap[MAX_GPU_INSTANCE];
+	struct ttm_validate_buffer tv[MAX_GPU_INSTANCE+1];
+	struct list_head validate_list;
+	struct ww_acquire_ctx ticket;
+};
+
 static void svm_range_evict_svm_bo_worker(struct work_struct *work);
 static bool
 svm_range_cpu_invalidate_pagetables(struct mmu_interval_notifier *mni,
@@ -118,17 +128,14 @@ static void svm_range_remove_notifier(struct svm_range *prange)
 }
 
 static int
-svm_range_dma_map(struct device *dev, dma_addr_t **dma_addr,
-		  unsigned long *pages_addr, uint64_t npages)
+svm_range_dma_map_dev(struct device *dev, dma_addr_t **dma_addr,
+		      unsigned long *hmm_pfns, uint64_t npages)
 {
 	enum dma_data_direction dir = DMA_BIDIRECTIONAL;
 	dma_addr_t *addr = *dma_addr;
 	struct page *page;
 	int i, r;
 
-	if (!pages_addr)
-		return 0;
-
 	if (!addr) {
 		addr = kvmalloc_array(npages, sizeof(*addr),
 				      GFP_KERNEL | __GFP_ZERO);
@@ -142,7 +149,7 @@ svm_range_dma_map(struct device *dev, dma_addr_t **dma_addr,
 			      "leaking dma mapping\n"))
 			dma_unmap_page(dev, addr[i], PAGE_SIZE, dir);
 
-		page = hmm_pfn_to_page(pages_addr[i]);
+		page = hmm_pfn_to_page(hmm_pfns[i]);
 		addr[i] = dma_map_page(dev, page, 0, PAGE_SIZE, dir);
 		r = dma_mapping_error(dev, addr[i]);
 		if (r) {
@@ -155,6 +162,37 @@ svm_range_dma_map(struct device *dev, dma_addr_t **dma_addr,
 	return 0;
 }
 
+static int
+svm_range_dma_map(struct svm_range *prange, unsigned long *bitmap,
+		  unsigned long *hmm_pfns)
+{
+	struct kfd_process *p;
+	uint32_t gpuidx;
+	int r;
+
+	p = container_of(prange->svms, struct kfd_process, svms);
+
+	for_each_set_bit(gpuidx, bitmap, MAX_GPU_INSTANCE) {
+		struct kfd_process_device *pdd;
+		struct amdgpu_device *adev;
+
+		pr_debug("mapping to gpu idx 0x%x\n", gpuidx);
+		pdd = kfd_process_device_from_gpuidx(p, gpuidx);
+		if (!pdd) {
+			pr_debug("failed to find device idx %d\n", gpuidx);
+			return -EINVAL;
+		}
+		adev = (struct amdgpu_device *)pdd->dev->kgd;
+
+		r = svm_range_dma_map_dev(adev->dev, &prange->dma_addr[gpuidx],
+					  hmm_pfns, prange->npages);
+		if (r)
+			break;
+	}
+
+	return r;
+}
+
 void svm_range_dma_unmap(struct device *dev, dma_addr_t *dma_addr,
 			 unsigned long offset, unsigned long npages)
 {
@@ -207,7 +245,6 @@ static void svm_range_free(struct svm_range *prange)
 
 	svm_range_vram_node_free(prange);
 	svm_range_free_dma_mappings(prange);
-	kvfree(prange->pages_addr);
 	mutex_destroy(&prange->lock);
 	mutex_destroy(&prange->migrate_mutex);
 	kfree(prange);
@@ -258,45 +295,6 @@ svm_range *svm_range_new(struct svm_range_list *svms, uint64_t start,
 	return prange;
 }
 
-/**
- * svm_range_validate_ram - get system memory pages of svm range
- *
- * @mm: the mm_struct of process
- * @prange: the range struct
- *
- * After mapping system memory to GPU, system memory maybe invalidated anytime
- * during application running, we use HMM callback to sync GPU with CPU page
- * table update, so we don't need use lock to prevent CPU invalidation and check
- * hmm_range_get_pages_done return value.
- *
- * Return:
- * 0 - OK, otherwise error code
- */
-static int
-svm_range_validate_ram(struct mm_struct *mm, struct svm_range *prange)
-{
-	int r;
-
-	r = amdgpu_hmm_range_get_pages(&prange->notifier, mm, NULL,
-				       prange->start << PAGE_SHIFT,
-				       prange->npages, &prange->hmm_range,
-				       false, true);
-	if (r) {
-		pr_debug("failed %d to get svm range pages\n", r);
-		return r;
-	}
-
-	kvfree(prange->pages_addr);
-	svm_range_free_dma_mappings(prange);
-	prange->pages_addr = prange->hmm_range->hmm_pfns;
-	prange->hmm_range->hmm_pfns = NULL;
-
-	amdgpu_hmm_range_get_pages_done(prange->hmm_range);
-	prange->hmm_range = NULL;
-
-	return 0;
-}
-
 static bool svm_bo_ref_unless_zero(struct svm_range_bo *svm_bo)
 {
 	if (!svm_bo || !kref_get_unless_zero(&svm_bo->kref))
@@ -568,57 +566,13 @@ svm_range_get_adev_by_id(struct svm_range *prange, uint32_t gpu_id)
 	return (struct amdgpu_device *)pdd->dev->kgd;
 }
 
-static int svm_range_validate_vram(struct svm_range *prange)
-{
-	struct amdgpu_device *adev;
-	int r;
-
-	pr_debug("svms 0x%p [0x%lx 0x%lx] actual_loc 0x%x\n", prange->svms,
-		 prange->start, prange->last, prange->actual_loc);
-
-	if (prange->ttm_res) {
-		pr_debug("validation skipped after migration\n");
-		return 0;
-	}
-
-	adev = svm_range_get_adev_by_id(prange, prange->actual_loc);
-	if (!adev) {
-		pr_debug("failed to get device by id 0x%x\n",
-			 prange->actual_loc);
-		return -EINVAL;
-	}
-
-	r = svm_range_vram_node_new(adev, prange, true);
-	if (r)
-		pr_debug("failed %d to alloc vram\n", r);
-
-	return r;
-}
-
-static int
-svm_range_validate(struct mm_struct *mm, struct svm_range *prange)
+static int svm_range_bo_validate(void *param, struct amdgpu_bo *bo)
 {
-	struct kfd_process *p;
-	int r;
-
-	pr_debug("svms 0x%p prange 0x%p [0x%lx 0x%lx] actual loc 0x%x\n",
-		 prange->svms, prange, prange->start, prange->last,
-		 prange->actual_loc);
-
-	p = container_of(prange->svms, struct kfd_process, svms);
-
-	if (!prange->actual_loc)
-		r = svm_range_validate_ram(mm, prange);
-	else
-		r = svm_range_validate_vram(prange);
-
-	if (!r)
-		prange->validate_timestamp = ktime_to_us(ktime_get());
+	struct ttm_operation_ctx ctx = { false, false };
 
-	pr_debug("svms 0x%p [0x%lx 0x%lx] ret %d\n", prange->svms,
-		 prange->start, prange->last, r);
+	amdgpu_bo_placement_from_domain(bo, AMDGPU_GEM_DOMAIN_VRAM);
 
-	return r;
+	return ttm_bo_validate(&bo->tbo, &bo->placement, &ctx);
 }
 
 static int
@@ -722,7 +676,7 @@ svm_range_apply_attrs(struct kfd_process *p, struct svm_range *prange,
  * svm_range_debug_dump - print all range information from svms
  * @svms: svm range list header
  *
- * debug output svm range start, end, pages_addr, prefetch location from svms
+ * debug output svm range start, end, prefetch location from svms
  * interval tree and link list
  *
  * Context: The caller must hold svms->lock
@@ -733,25 +687,23 @@ static void svm_range_debug_dump(struct svm_range_list *svms)
 	struct svm_range *prange;
 
 	pr_debug("dump svms 0x%p list\n", svms);
-	pr_debug("range\tstart\tpage\tend\t\tpages_addr\tlocation\n");
+	pr_debug("range\tstart\tpage\tend\t\tlocation\n");
 
 	list_for_each_entry(prange, &svms->list, list) {
-		pr_debug("0x%p 0x%lx\t0x%llx\t0x%llx\t0x%lx\t0x%x\n",
+		pr_debug("0x%p 0x%lx\t0x%llx\t0x%llx\t0x%x\n",
 			 prange, prange->start, prange->npages,
 			 prange->start + prange->npages - 1,
-			 prange->pages_addr ? *prange->pages_addr : 0,
 			 prange->actual_loc);
 	}
 
 	pr_debug("dump svms 0x%p interval tree\n", svms);
-	pr_debug("range\tstart\tpage\tend\t\tpages_addr\tlocation\n");
+	pr_debug("range\tstart\tpage\tend\t\tlocation\n");
 	node = interval_tree_iter_first(&svms->objects, 0, ~0ULL);
 	while (node) {
 		prange = container_of(node, struct svm_range, it_node);
-		pr_debug("0x%p 0x%lx\t0x%llx\t0x%llx\t0x%lx\t0x%x\n",
+		pr_debug("0x%p 0x%lx\t0x%llx\t0x%llx\t0x%x\n",
 			 prange, prange->start, prange->npages,
 			 prange->start + prange->npages - 1,
-			 prange->pages_addr ? *prange->pages_addr : 0,
 			 prange->actual_loc);
 		node = interval_tree_iter_next(node, 0, ~0ULL);
 	}
@@ -817,12 +769,6 @@ svm_range_split_pages(struct svm_range *new, struct svm_range *old,
 			return r;
 	}
 
-	r = svm_range_split_array(&new->pages_addr, &old->pages_addr,
-				  sizeof(*old->pages_addr), old->start, npages,
-				  new->start, new->npages);
-	if (r)
-		return r;
-
 	return 0;
 }
 
@@ -860,7 +806,7 @@ svm_range_split_nodes(struct svm_range *new, struct svm_range *old,
  * @start: the old range adjust to start address in pages
  * @last: the old range adjust to last address in pages
  *
- * Copy system memory pages, pages_addr or vram ttm_res in old range to new
+ * Copy system memory dma_addr or vram ttm_res in old range to new
  * range from new_start up to size new->npages, the remaining old range is from
  * start to last
  *
@@ -882,15 +828,16 @@ svm_range_split_adjust(struct svm_range *new, struct svm_range *old,
 		return -EINVAL;
 	}
 
-	if (old->pages_addr)
-		r = svm_range_split_pages(new, old, start, last);
-	else if (old->actual_loc && old->ttm_res)
-		r = svm_range_split_nodes(new, old, start, last);
-	else
-		WARN_ONCE(1, "split adjust invalid pages_addr and nodes\n");
+	r = svm_range_split_pages(new, old, start, last);
 	if (r)
 		return r;
 
+	if (old->actual_loc && old->ttm_res) {
+		r = svm_range_split_nodes(new, old, start, last);
+		if (r)
+			return r;
+	}
+
 	old->npages = last - start + 1;
 	old->start = start;
 	old->last = last;
@@ -1088,9 +1035,9 @@ svm_range_get_pte_flags(struct amdgpu_device *adev, struct svm_range *prange)
 	/* Apply ASIC specific mapping flags */
 	amdgpu_gmc_get_vm_pte(adev, &prange->mapping, &pte_flags);
 
-	pr_debug("svms 0x%p [0x%lx 0x%lx] vram %d system %d PTE flags 0x%llx\n",
+	pr_debug("svms 0x%p [0x%lx 0x%lx] vram %d PTE flags 0x%llx\n",
 		 prange->svms, prange->start, prange->last,
-		 prange->ttm_res ? 1:0, prange->pages_addr ? 1:0, pte_flags);
+		 prange->ttm_res ? 1:0, pte_flags);
 
 	return pte_flags;
 }
@@ -1153,56 +1100,18 @@ svm_range_unmap_from_gpus(struct svm_range *prange, unsigned long start,
 	return r;
 }
 
-static int svm_range_bo_validate(void *param, struct amdgpu_bo *bo)
-{
-	struct ttm_operation_ctx ctx = { false, false };
-
-	amdgpu_bo_placement_from_domain(bo, AMDGPU_GEM_DOMAIN_VRAM);
-
-	return ttm_bo_validate(&bo->tbo, &bo->placement, &ctx);
-}
-
 static int
 svm_range_map_to_gpu(struct amdgpu_device *adev, struct amdgpu_vm *vm,
-		     struct svm_range *prange, dma_addr_t *pages_addr,
-		     bool reserve_vm, struct amdgpu_device *bo_adev,
-		     struct dma_fence **fence)
+		     struct svm_range *prange, dma_addr_t *dma_addr,
+		     struct amdgpu_device *bo_adev, struct dma_fence **fence)
 {
-	struct ttm_validate_buffer tv[2];
-	struct ww_acquire_ctx ticket;
 	struct amdgpu_bo_va bo_va;
-	struct list_head list;
 	uint64_t pte_flags;
 	int r = 0;
 
 	pr_debug("svms 0x%p [0x%lx 0x%lx]\n", prange->svms, prange->start,
 		 prange->last);
 
-	if (reserve_vm) {
-		INIT_LIST_HEAD(&list);
-
-		tv[0].bo = &vm->root.base.bo->tbo;
-		tv[0].num_shared = 4;
-		list_add(&tv[0].head, &list);
-		if (prange->svm_bo && prange->ttm_res) {
-			tv[1].bo = &prange->svm_bo->bo->tbo;
-			tv[1].num_shared = 1;
-			list_add(&tv[1].head, &list);
-		}
-		r = ttm_eu_reserve_buffers(&ticket, &list, true, NULL);
-		if (r) {
-			pr_debug("failed %d to reserve bo\n", r);
-			goto out;
-		}
-
-		r = amdgpu_vm_validate_pt_bos(adev, vm, svm_range_bo_validate,
-					      NULL);
-		if (r) {
-			pr_debug("failed %d validate pt bos\n", r);
-			goto unreserve_out;
-		}
-	}
-
 	if (prange->svm_bo && prange->ttm_res) {
 		bo_va.is_xgmi = amdgpu_xgmi_same_hive(adev, bo_adev);
 		prange->mapping.bo_va = &bo_va;
@@ -1220,10 +1129,10 @@ svm_range_map_to_gpu(struct amdgpu_device *adev, struct amdgpu_vm *vm,
 					prange->mapping.offset,
 					prange->ttm_res ?
 						prange->ttm_res->mm_node : NULL,
-					pages_addr, &vm->last_update);
+					dma_addr, &vm->last_update);
 	if (r) {
 		pr_debug("failed %d to map to gpu 0x%lx\n", r, prange->start);
-		goto unreserve_out;
+		goto out;
 	}
 
 
@@ -1231,23 +1140,21 @@ svm_range_map_to_gpu(struct amdgpu_device *adev, struct amdgpu_vm *vm,
 	if (r) {
 		pr_debug("failed %d to update directories 0x%lx\n", r,
 			 prange->start);
-		goto unreserve_out;
+		goto out;
 	}
 
 	if (fence)
 		*fence = dma_fence_get(vm->last_update);
 
-unreserve_out:
-	prange->mapping.bo_va = NULL;
-	if (reserve_vm)
-		ttm_eu_backoff_reservation(&ticket, &list);
 out:
+	prange->mapping.bo_va = NULL;
+
 	return r;
 }
 
-int svm_range_map_to_gpus(struct svm_range *prange, bool reserve_vm)
+static int svm_range_map_to_gpus(struct svm_range *prange,
+				 unsigned long *bitmap, bool wait)
 {
-	DECLARE_BITMAP(bitmap, MAX_GPU_INSTANCE);
 	struct kfd_process_device *pdd;
 	struct amdgpu_device *bo_adev;
 	struct amdgpu_device *adev;
@@ -1262,29 +1169,6 @@ int svm_range_map_to_gpus(struct svm_range *prange, bool reserve_vm)
 		bo_adev = NULL;
 
 	p = container_of(prange->svms, struct kfd_process, svms);
-	if (p->xnack_enabled) {
-		bitmap_copy(bitmap, prange->bitmap_aip, MAX_GPU_INSTANCE);
-
-		/* If prefetch range to GPU, or GPU retry fault migrate range to
-		 * GPU, which has ACCESS attribute to the range, create mapping
-		 * on that GPU.
-		 */
-		if (prange->actual_loc) {
-			gpuidx = kfd_process_gpuidx_from_gpuid(p,
-							prange->actual_loc);
-			if (gpuidx < 0) {
-				WARN_ONCE(1, "failed get device by id 0x%x\n",
-					 prange->actual_loc);
-				return -EINVAL;
-			}
-			if (test_bit(gpuidx, prange->bitmap_access))
-				bitmap_set(bitmap, gpuidx, 1);
-		}
-	} else {
-		bitmap_or(bitmap, prange->bitmap_access, prange->bitmap_aip,
-			  MAX_GPU_INSTANCE);
-	}
-
 	for_each_set_bit(gpuidx, bitmap, MAX_GPU_INSTANCE) {
 		pr_debug("mapping to gpu idx 0x%x\n", gpuidx);
 		pdd = kfd_process_device_from_gpuidx(p, gpuidx);
@@ -1304,14 +1188,9 @@ int svm_range_map_to_gpus(struct svm_range *prange, bool reserve_vm)
 			continue;
 		}
 
-		r = svm_range_dma_map(adev->dev, &prange->dma_addr[gpuidx],
-				      prange->pages_addr, prange->npages);
-		if (r)
-			break;
-
 		r = svm_range_map_to_gpu(adev, pdd->vm, prange,
-					 prange->dma_addr[gpuidx], reserve_vm,
-					 bo_adev, &fence);
+					 prange->dma_addr[gpuidx], bo_adev,
+					 wait ? &fence : NULL);
 		if (r)
 			break;
 
@@ -1329,6 +1208,207 @@ int svm_range_map_to_gpus(struct svm_range *prange, bool reserve_vm)
 	return r;
 }
 
+int svm_range_reserve_bos(struct svm_validate_context *ctx)
+{
+	struct kfd_process_device *pdd;
+	struct amdgpu_device *adev;
+	struct amdgpu_vm *vm;
+	uint32_t gpuidx;
+	int r;
+
+	INIT_LIST_HEAD(&ctx->validate_list);
+	for_each_set_bit(gpuidx, ctx->bitmap, MAX_GPU_INSTANCE) {
+		pdd = kfd_process_device_from_gpuidx(ctx->process, gpuidx);
+		if (!pdd) {
+			pr_debug("failed to find device idx %d\n", gpuidx);
+			return -EINVAL;
+		}
+		adev = (struct amdgpu_device *)pdd->dev->kgd;
+		vm = pdd->vm;
+
+		ctx->tv[gpuidx].bo = &vm->root.base.bo->tbo;
+		ctx->tv[gpuidx].num_shared = 4;
+		list_add(&ctx->tv[gpuidx].head, &ctx->validate_list);
+	}
+	if (ctx->prange->svm_bo && ctx->prange->ttm_res) {
+		ctx->tv[MAX_GPU_INSTANCE].bo = &ctx->prange->svm_bo->bo->tbo;
+		ctx->tv[MAX_GPU_INSTANCE].num_shared = 1;
+		list_add(&ctx->tv[MAX_GPU_INSTANCE].head, &ctx->validate_list);
+	}
+
+	r = ttm_eu_reserve_buffers(&ctx->ticket, &ctx->validate_list,
+				   ctx->intr, NULL);
+	if (r) {
+		pr_debug("failed %d to reserve bo\n", r);
+		return r;
+	}
+
+	for_each_set_bit(gpuidx, ctx->bitmap, MAX_GPU_INSTANCE) {
+		pdd = kfd_process_device_from_gpuidx(ctx->process, gpuidx);
+		if (!pdd) {
+			pr_debug("failed to find device idx %d\n", gpuidx);
+			r = -EINVAL;
+			goto unreserve_out;
+		}
+		adev = (struct amdgpu_device *)pdd->dev->kgd;
+
+		r = amdgpu_vm_validate_pt_bos(adev, pdd->vm,
+					      svm_range_bo_validate, NULL);
+		if (r) {
+			pr_debug("failed %d validate pt bos\n", r);
+			goto unreserve_out;
+		}
+	}
+
+	return 0;
+
+unreserve_out:
+	ttm_eu_backoff_reservation(&ctx->ticket, &ctx->validate_list);
+	return r;
+}
+
+void svm_range_unreserve_bos(struct svm_validate_context *ctx)
+{
+	ttm_eu_backoff_reservation(&ctx->ticket, &ctx->validate_list);
+}
+
+/*
+ * Validation+GPU mapping with concurrent invalidation (MMU notifiers)
+ *
+ * To prevent concurrent destruction or change of range attributes, the
+ * svm_read_lock must be held. The caller must not hold the svm_write_lock
+ * because that would block concurrent evictions and lead to deadlocks. To
+ * serialize concurrent migrations or validations of the same range, the
+ * prange->migrate_mutex must be held.
+ *
+ * The range must be in the inverval tree and have an MMU notifier to catch
+ * concurrent invalidations of the virtual address range. This means it cannot
+ * be a child range.
+ *
+ * For VRAM ranges, the SVM BO must be allocated and valid (protected by its
+ * eviction fence.
+ *
+ * The following sequence ensures race-free validation and GPU mapping:
+ *
+ * 1. Reserve page table (and SVM BO if range is in VRAM)
+ * 2. hmm_range_fault to get page addresses (if system memory)
+ * 3. DMA-map pages (if system memory)
+ * 4-a. Take notifier lock
+ * 4-b. Check that pages still valid (mmu_interval_read_retry)
+ * 4-c. Check that the range was not split or otherwise invalidated
+ * 4-d. Update GPU page table
+ * 4.e. Release notifier lock
+ * 5. Release page table (and SVM BO) reservation
+ */
+static int svm_range_validate_and_map(struct mm_struct *mm,
+				      struct svm_range *prange,
+				      uint32_t gpuidx, bool intr, bool wait)
+{
+	struct svm_validate_context ctx;
+	struct hmm_range *hmm_range;
+	int r = 0;
+
+	ctx.process = container_of(prange->svms, struct kfd_process, svms);
+	ctx.prange = prange;
+	ctx.intr = intr;
+
+	if (gpuidx < MAX_GPU_INSTANCE) {
+		bitmap_zero(ctx.bitmap, MAX_GPU_INSTANCE);
+		bitmap_set(ctx.bitmap, gpuidx, 1);
+	} else if (ctx.process->xnack_enabled) {
+		bitmap_copy(ctx.bitmap, prange->bitmap_aip, MAX_GPU_INSTANCE);
+
+		/* If prefetch range to GPU, or GPU retry fault migrate range to
+		 * GPU, which has ACCESS attribute to the range, create mapping
+		 * on that GPU.
+		 */
+		if (prange->actual_loc) {
+			gpuidx = kfd_process_gpuidx_from_gpuid(ctx.process,
+							prange->actual_loc);
+			if (gpuidx < 0) {
+				WARN_ONCE(1, "failed get device by id 0x%x\n",
+					 prange->actual_loc);
+				return -EINVAL;
+			}
+			if (test_bit(gpuidx, prange->bitmap_access))
+				bitmap_set(ctx.bitmap, gpuidx, 1);
+		}
+	} else {
+		bitmap_or(ctx.bitmap, prange->bitmap_access,
+			  prange->bitmap_aip, MAX_GPU_INSTANCE);
+	}
+
+	if (bitmap_empty(ctx.bitmap, MAX_GPU_INSTANCE))
+		return 0;
+
+	if (prange->actual_loc && !prange->ttm_res) {
+		struct amdgpu_device *adev;
+
+		/* This should never happen. actual_loc gets set by
+		 * svm_migrate_ram_to_vram after allocating a BO.
+		 */
+		WARN(1, "creating new VRAM BO during validation\n");
+		adev = svm_range_get_adev_by_id(prange, prange->actual_loc);
+		if (!adev) {
+			pr_debug("failed to get device by id 0x%x\n",
+				 prange->actual_loc);
+			return -EINVAL;
+		}
+
+		r = svm_range_vram_node_new(adev, prange, true);
+		if (r) {
+			pr_debug("failed %d to allocate vram\n", r);
+			return r;
+		}
+	}
+
+	svm_range_reserve_bos(&ctx);
+
+	if (!prange->actual_loc) {
+		r = amdgpu_hmm_range_get_pages(&prange->notifier, mm, NULL,
+					       prange->start << PAGE_SHIFT,
+					       prange->npages, &hmm_range,
+					       false, true);
+		if (r) {
+			pr_debug("failed %d to get svm range pages\n", r);
+			goto unreserve_out;
+		}
+
+		r = svm_range_dma_map(prange, ctx.bitmap,
+				      hmm_range->hmm_pfns);
+		if (r) {
+			pr_debug("failed %d to dma map range\n", r);
+			goto unreserve_out;
+		}
+
+		prange->validated_once = true;
+	}
+
+	svm_range_lock(prange);
+	if (!prange->actual_loc) {
+		if (amdgpu_hmm_range_get_pages_done(hmm_range)) {
+			r = -EAGAIN;
+			goto unlock_out;
+		}
+	}
+	if (!list_empty(&prange->child_list)) {
+		r = -EAGAIN;
+		goto unlock_out;
+	}
+
+	r = svm_range_map_to_gpus(prange, ctx.bitmap, wait);
+
+unlock_out:
+	svm_range_unlock(prange);
+unreserve_out:
+	svm_range_unreserve_bos(&ctx);
+
+	if (!r)
+		prange->validate_timestamp = ktime_to_us(ktime_get());
+
+	return r;
+}
+
 /**
  * svm_range_list_lock_and_flush_work - flush pending deferred work
  *
@@ -1401,20 +1481,12 @@ static void svm_range_restore_work(struct work_struct *work)
 		 */
 		mutex_lock(&prange->migrate_mutex);
 
-		r = svm_range_validate(mm, prange);
-		if (r) {
-			pr_debug("failed %d to validate [0x%lx 0x%lx]\n", r,
-				 prange->start, prange->last);
-
-			goto out_unlock;
-		}
-
-		r = svm_range_map_to_gpus(prange, true);
+		r = svm_range_validate_and_map(mm, prange, MAX_GPU_INSTANCE,
+					       false, true);
 		if (r)
-			pr_debug("failed %d to map 0x%lx to gpu\n", r,
+			pr_debug("failed %d to map 0x%lx to gpus\n", r,
 				 prange->start);
 
-out_unlock:
 		mutex_unlock(&prange->migrate_mutex);
 		if (r)
 			goto out_reschedule;
@@ -1498,7 +1570,9 @@ svm_range_evict(struct svm_range *prange, struct mm_struct *mm,
 	} else {
 		pr_debug("invalidate unmap svms 0x%p [0x%lx 0x%lx] from GPUs\n",
 			 prange->svms, start, last);
+		svm_range_lock(prange);
 		svm_range_unmap_from_gpus(prange, start, last);
+		svm_range_unlock(prange);
 	}
 
 	return r;
@@ -1512,17 +1586,6 @@ struct svm_range *svm_range_clone(struct svm_range *old)
 	if (!new)
 		return NULL;
 
-	if (old->pages_addr) {
-		new->pages_addr = kvmalloc_array(new->npages,
-						 sizeof(*new->pages_addr),
-						 GFP_KERNEL);
-		if (!new->pages_addr) {
-			kfree(new);
-			return NULL;
-		}
-		memcpy(new->pages_addr, old->pages_addr,
-		       old->npages * sizeof(*old->pages_addr));
-	}
 	if (old->svm_bo) {
 		new->ttm_res = old->ttm_res;
 		new->offset = old->offset;
@@ -2051,19 +2114,10 @@ svm_range_best_restore_location(struct svm_range *prange,
 	return -1;
 }
 
-/* FIXME: This function can race with MMU notifiers. MMU notifiers can
- * invalidate the page addresses concurrently, so we may end up mapping
- * invalid addresses here. We cannot hold the prange->lock (held in MMU
- * notifier) while updating page tables because of lock dependencies,
- * as SDMA page table updates need reservation locks. Only unmapping
- * works without reservations. May need to hold the mmap_write_lock to
- * prevent concurrent MMU notifiers.
- */
 int
 svm_range_restore_pages(struct amdgpu_device *adev, unsigned int pasid,
 			uint64_t addr)
 {
-	struct amdgpu_device *bo_adev;
 	struct mm_struct *mm = NULL;
 	struct svm_range_list *svms;
 	struct svm_range *prange;
@@ -2134,23 +2188,7 @@ svm_range_restore_pages(struct amdgpu_device *adev, unsigned int pasid,
 		}
 	}
 
-	r = svm_range_validate(mm, prange);
-	if (r) {
-		pr_debug("failed %d to validate svms %p [0x%lx 0x%lx]\n", r,
-			 svms, prange->start, prange->last);
-		goto out_unlock_range;
-	}
-
-	if (prange->svm_bo && prange->ttm_res)
-		bo_adev = amdgpu_ttm_adev(prange->svm_bo->bo->tbo.bdev);
-	else
-		bo_adev = NULL;
-
-	pr_debug("restoring svms 0x%p [0x%lx %lx] mapping, bo_adev is %s\n",
-		 svms, prange->start, prange->last,
-		 bo_adev ? "not NULL" : "NULL");
-
-	r = svm_range_map_to_gpus(prange, true);
+	r = svm_range_validate_and_map(mm, prange, MAX_GPU_INSTANCE, false, true);
 	if (r)
 		pr_debug("failed %d to map svms 0x%p [0x%lx 0x%lx] to gpus\n",
 			 r, svms, prange->start, prange->last);
@@ -2366,6 +2404,27 @@ svm_range_best_prefetch_location(struct svm_range *prange)
 	return best_loc;
 }
 
+/* FIXME: This is a workaround for page locking bug when some pages are
+ * invalid during migration to VRAM
+ */
+void svm_range_prefault(struct svm_range *prange, struct mm_struct *mm)
+{
+	struct hmm_range *hmm_range;
+	int r;
+
+	if (prange->validated_once)
+		return;
+
+	r = amdgpu_hmm_range_get_pages(&prange->notifier, mm, NULL,
+				       prange->start << PAGE_SHIFT,
+				       prange->npages, &hmm_range,
+				       false, true);
+	if (!r) {
+		amdgpu_hmm_range_get_pages_done(hmm_range);
+		prange->validated_once = true;
+	}
+}
+
 /* svm_range_trigger_migration - start page migration if prefetch loc changed
  * @mm: current process mm_struct
  * @prange: svm range structure
@@ -2420,15 +2479,6 @@ svm_range_trigger_migration(struct mm_struct *mm, struct svm_range *prange,
 		return r;
 	}
 
-	if (!prange->actual_loc && !prange->pages_addr) {
-		pr_debug("host access and prefetch to gpu\n");
-		r = svm_range_validate_ram(mm, prange);
-		if (r) {
-			pr_debug("failed %d to validate on ram\n", r);
-			return r;
-		}
-	}
-
 	r = svm_migrate_to_vram(prange, best_loc, mm);
 	*migrated = !r;
 
@@ -2587,23 +2637,8 @@ svm_range_set_attr(struct kfd_process *p, uint64_t start, uint64_t size,
 			continue;
 		}
 
-		/* FIXME: With xnack on, this can race with MMU notifiers.
-		 * They may invalidate page addresses before we map them.
-		 * Then we end up mapping invalid addresses in the GPU page
-		 * table. May need to find a way to still hold the mmap write
-		 * for map_to_gpus but drop it for validate to allow
-		 * concurrent evictions. This will lead to some retry logic
-		 * and the need to protect the update list differently.
-		 * Maybe factor migration and validation into a common helper
-		 * function shared with the GPU page fault handler.
-		 */
-		r = svm_range_validate(mm, prange);
-		if (r) {
-			pr_debug("failed %d to validate svm range\n", r);
-			goto out_unlock_range;
-		}
-
-		r = svm_range_map_to_gpus(prange, true);
+		r = svm_range_validate_and_map(mm, prange, MAX_GPU_INSTANCE,
+					       true, true);
 		if (r)
 			pr_debug("failed %d to map svm range\n", r);
 
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_svm.h b/drivers/gpu/drm/amd/amdkfd/kfd_svm.h
index 7fce3fccfe58..af853726b861 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_svm.h
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_svm.h
@@ -70,16 +70,14 @@ struct svm_work_list_item {
  * @update_list:link list node used to add to update_list
  * @remove_list:link list node used to add to remove list
  * @insert_list:link list node used to add to insert list
- * @hmm_range:  hmm range structure used by hmm_range_fault to get system pages
  * @mapping:    bo_va mapping structure to create and update GPU page table
  * @npages:     number of pages
- * @pages_addr: list of system memory physical page address
  * @dma_addr:   dma mapping address on each GPU for system memory physical page
  * @ttm_res:    vram ttm resource map
  * @offset:     range start offset within mm_nodes
  * @svm_bo:     struct to manage splited amdgpu_bo
  * @svm_bo_list:link list node, to scan all ranges which share same svm_bo
- * @lock:       protect prange start, last, child_list, svm_bo_list, pages_addr
+ * @lock:       protect prange start, last, child_list, svm_bo_list
  * @saved_flags:save/restore current PF_MEMALLOC flags
  * @flags:      flags defined as KFD_IOCTL_SVM_FLAG_*
  * @perferred_loc: perferred location, 0 for CPU, or GPU id
@@ -109,10 +107,8 @@ struct svm_range {
 	struct list_head		update_list;
 	struct list_head		remove_list;
 	struct list_head		insert_list;
-	struct hmm_range		*hmm_range;
 	struct amdgpu_bo_va_mapping	mapping;
 	uint64_t			npages;
-	unsigned long			*pages_addr;
 	dma_addr_t			*dma_addr[MAX_GPU_INSTANCE];
 	struct ttm_resource		*ttm_res;
 	uint64_t			offset;
@@ -133,6 +129,7 @@ struct svm_range {
 	struct list_head		child_list;
 	DECLARE_BITMAP(bitmap_access, MAX_GPU_INSTANCE);
 	DECLARE_BITMAP(bitmap_aip, MAX_GPU_INSTANCE);
+	bool				validated_once;
 };
 
 static inline void svm_range_lock(struct svm_range *prange)
@@ -166,7 +163,6 @@ int svm_range_split_by_granularity(struct kfd_process *p, struct mm_struct *mm,
 int svm_range_restore_pages(struct amdgpu_device *adev,
 			    unsigned int pasid, uint64_t addr);
 int svm_range_schedule_evict_svm_bo(struct amdgpu_amdkfd_fence *fence);
-int svm_range_map_to_gpus(struct svm_range *prange, bool reserve_vm);
 void svm_range_add_list_work(struct svm_range_list *svms,
 			     struct svm_range *prange, struct mm_struct *mm,
 			     enum svm_work_list_ops op);
@@ -174,5 +170,6 @@ void schedule_deferred_list_work(struct svm_range_list *svms);
 void svm_range_dma_unmap(struct device *dev, dma_addr_t *dma_addr,
 			 unsigned long offset, unsigned long npages);
 void svm_range_free_dma_mappings(struct svm_range *prange);
+void svm_range_prefault(struct svm_range *prange, struct mm_struct *mm);
 
 #endif /* KFD_SVM_H_ */
-- 
2.31.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
