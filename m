Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DE142343EF1
	for <lists+dri-devel@lfdr.de>; Mon, 22 Mar 2021 12:08:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 747C889EF7;
	Mon, 22 Mar 2021 11:07:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2058.outbound.protection.outlook.com [40.107.237.58])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3EEC489BF5;
 Mon, 22 Mar 2021 11:07:37 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lSionmR/b6fjNfKK0EuNmiZQZCdQ54aOMtAK9MZmtuYAMaANNpdhqR0pkXH4FccGjGJqAKxhK+E+ZRUhAIlnSGDHxzBzrCuDzrZ91ZVs4GmzRIEe54hEL2w/Dnakv8AERjlGcEU8/xkqZmkHYsKY7I63UbDp712P5gRgHBqLVOrqz3f2xvA6fQa4ADlb4En6IkvkLnjNbx2iwogTOhmKYjl1C7B+XaqhpEa0SBKrKXwuqyD/Y4Azhwe7AdenPDGom4dFqZXKE+IOh6BTTeShYNl3irlQunDcV3UPxdcOb2IKLXeG40oY53p7afykQMB64ha5mhYbnoNoaqnnO6ekWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WGe2Ikg/vsojRLYLsLsboCdpRGRawCN8SVJFs/lkgUA=;
 b=fCvUgnYwZpUpLgnkvh1lKdyEnIvTZtcTpdlNhb28OGuYoUz326XJD76k8ZuHkE8W1630kOc4DH2tZmK1kjS/aalSuY7CWPAK5DownOS0u0daDp2oXEG0OWIw6hIfnnTk97OFVdbqzNo2W/dPNC1cymZ5YcwrX3Hz4B3y7U+WOxB7ZNhE8URx0O2tkE+tsdkcIe810YNcRMXiT4UePcsvkqZZXdpeluqA2bbdSzZxQRd6wh/23OE7CCkcX3ZEz/s7C720sY/KJ8otUIsKcYgCiPfoNg5UavJupEve4MDJ5JQ8w8RIsuDGeMPzLb80Gw3CfJ5LyJrvC2k+HQAoCLWk9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WGe2Ikg/vsojRLYLsLsboCdpRGRawCN8SVJFs/lkgUA=;
 b=PwSjZJ0e6Z+EF/UAL9RoDfkRxO8beporIO4LbD8wSsxKs9AyP5hERRKiqm8U+2ijP/rTQpizaisO2EQMWBkCdtlNBv7+UDRNlU5JW9iLbhFpxIWiJLzDgPTaWM/84cNR+MG2hAyHC0v+T2bp9fZ9yZ2FtCYVXeBLicYY+PIXmkU=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from BL0PR12MB4948.namprd12.prod.outlook.com (2603:10b6:208:1cc::20)
 by MN2PR12MB3678.namprd12.prod.outlook.com (2603:10b6:208:158::26)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.18; Mon, 22 Mar
 2021 11:07:35 +0000
Received: from BL0PR12MB4948.namprd12.prod.outlook.com
 ([fe80::70f5:99ed:65a1:c033]) by BL0PR12MB4948.namprd12.prod.outlook.com
 ([fe80::70f5:99ed:65a1:c033%5]) with mapi id 15.20.3933.036; Mon, 22 Mar 2021
 11:07:35 +0000
From: Felix Kuehling <Felix.Kuehling@amd.com>
To: dri-devel@lists.freedesktop.org,
	amd-gfx@lists.freedesktop.org
Subject: [PATCH 10/44] drm/amdkfd: map svm range to GPUs
Date: Mon, 22 Mar 2021 06:58:26 -0400
Message-Id: <20210322105900.14068-11-Felix.Kuehling@amd.com>
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
 Transport; Mon, 22 Mar 2021 11:07:34 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 8c908fc7-9595-4092-bf14-08d8ed22b246
X-MS-TrafficTypeDiagnostic: MN2PR12MB3678:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MN2PR12MB36784AC0CE45B1B3B97F096E92659@MN2PR12MB3678.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:270;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ySeFgDiEGkH5CJiCOPbPbixBAdKOYsgy91GNbPU1sM2OPZBVqCWqsy1ACaDLrVuVQKVncEopey/L3RUf+nkJmdDFCizm742OUhk0sg5HM5a/Ii21u36TKU1JNF8OeVZqojFjJJ6CPU4SpCbZloC13GjNYvZMC8kmm8ntfIoZntvN7GlciN/gtXRdzV5msMAUZkmPbYCCEoxipfKSzl9p6XvJt68ChPD7b183fjyvoo1pYFhVMginY376KRzq1JWS9aXrH36PvbFm8S5k2el6a6tiE0RTaf7sdQyS8U8mO6xaWEPossPdyGc+InsXtVZMFzLufsfEujnQpsTs2DImVWihShp84E7miwjL96gqjRJPMm8LI/5CZZp7FtKkVxbJmIbNp74CIgxiCRuwGVgABZkRnT1MeAuHuNx2PZtf7XFfx7xfQpce85ZakPzgmb4egKt7pPf2oaVCxGxsSDJ9ElIXLiBoVOv8kuK9eGfNkTDkdy4KBwLMV+hUcy06cMMcJ/bCvkv0Uw7cDXt/L2iZM2SJNbbPbPHci1TEkGIrJHJ5QPDm0InaSOd0+M0LF6oWmoAPws3XEeqIYIvOQBueud/6QC+jq7mNzGlJ1lSyRW4TIg2erPP46vSorYjPldkUZc6UHxbEdLX/8UITkqb2yQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR12MB4948.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(376002)(136003)(366004)(39860400002)(346002)(52116002)(7696005)(54906003)(6486002)(1076003)(36756003)(30864003)(38100700001)(6666004)(83380400001)(478600001)(2616005)(956004)(4326008)(450100002)(16526019)(2906002)(186003)(26005)(5660300002)(66556008)(66476007)(8936002)(66946007)(316002)(86362001)(8676002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?E1RcMzrled4HDzPSkPi0LXKs1/+FgDVydawoBdRKa0jUwQH66BE7H5WkLetf?=
 =?us-ascii?Q?ToH0X8Jja/O8RScRwAK//tUfuYCbBojNa7UgTCEvYKalT1wEgiuzGosIaYYR?=
 =?us-ascii?Q?gieDdTSSJwJlbkjoc6OJg/3cBYCKDN8DQ3B3dMl4zjjUzWI22xYxLI3uw9dQ?=
 =?us-ascii?Q?Vk2hazmgqLOTDmUy3xEfE9MGdA/6+rzWlkaWi58Np9mN6SUh8E8/7muPeRQo?=
 =?us-ascii?Q?tGhvCW1bQr4kQ4ijjtZX5OrdcNnR6CbvehOVy0X8A/VLalf6gGbd0c8k0H8r?=
 =?us-ascii?Q?F13F2Rv+ZU4V2aXZYkCQLsvPytM114aFcB24BKeg1RbGd4RAlW8ndR7B2whU?=
 =?us-ascii?Q?7c0VWn8xlBxjoQlcfELwcsBWu3LbA1S6o3E7wRkgOVWZd9h7QBwifyZU/R73?=
 =?us-ascii?Q?g+IfAidvUbC9GuSMFYNPiBcFe47s6Ibl4NrLDIdx90qj69lppDvJOJGE4D3D?=
 =?us-ascii?Q?bqw+SCVy1FCGNpkrXsZl0aWPrgWIZSMNa/o6iZ8WtsSTqhX4zdPxzSPAiwvx?=
 =?us-ascii?Q?qKtJbyv+gQnsQEp9JPsdMjHrBMwFA5eBYcpCyB0sNLGwG1KQ9UdkdMfzO4jW?=
 =?us-ascii?Q?itHTGcL+JsFEmCpDfG7gfV305kuKOuQI4/Ax3+kFuFex/o1yf5DRIF1xwEMj?=
 =?us-ascii?Q?h4jnTw3EPUCW2H6SoNcdTdwyflj8IDUoIzaz4h/qFmL7kaFLrqnsm8gzV+4m?=
 =?us-ascii?Q?YY+x5I/J7iREq0575hL/sD1E4Ckpf7+DbDvxPYRx7gKUd9VNhcORRfho4KTC?=
 =?us-ascii?Q?znKqef2fTtpPw658L4OS6v63+P9wZFeaOtF5zzkB4J5mpCWnHUoJyw+XsYIr?=
 =?us-ascii?Q?D9+Vziaq2atQQ69bEF7kqA8nzmiOj702V3VpCdU/7YCSugZZASw3N+NB7x+y?=
 =?us-ascii?Q?v/gWgH8r1E/9V6Bb9WwPIcnQUk3ZiJ9/Mfw7JWb02aOFNJRaK6QG+HCJA49U?=
 =?us-ascii?Q?Bz0AQTqhWtgHfKza/hGs62hXqcP2lVza7BQi2tNTVYw+hVjzfcYCDs5+NIvB?=
 =?us-ascii?Q?/OK3WXEbR/kXVeiJVfjYEQxn4n8ZJD7HJxpKxcm4cNMFj/F9vGLpcOY4Frw8?=
 =?us-ascii?Q?97hCECyNggobUq4jZxLWoDMxuyAtxC24VGHNNEMqY4yZIHgdZkGdixHUS+O5?=
 =?us-ascii?Q?A/hrzqz83rkTrCU1yNUIA60iv3m1yj3RqRR3IUJZz6ot8EuMs3XezqQqY1wj?=
 =?us-ascii?Q?PTS4NPX2GdxAGS5u4/ltVsetJuoCDw6DXbHyM7kfCqpjAHOiReT1K+HqRRIi?=
 =?us-ascii?Q?b8syPmifh+ziYa2S6RDeYaXwQehhNmDtfKgNwVmAwcNwi3K7+Q6Rawc/ETtp?=
 =?us-ascii?Q?/LI+zxikTaumqdQWelXCjdtK?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8c908fc7-9595-4092-bf14-08d8ed22b246
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB4948.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Mar 2021 11:07:35.1563 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mO3wNF4rbQIhwIYa4Ye0MV/IOu4NzZeF1WYBTIXfd28N3v27ClNsQNVMsA6bZYAINabt0nLYVz9oN31/c9bSEg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3678
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
Cc: Alex Sierra <alex.sierra@amd.com>, Philip Yang <Philip.Yang@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Use amdgpu_vm_bo_update_mapping to update GPU page table to map or unmap
svm range system memory pages address to GPUs.

Signed-off-by: Philip Yang <Philip.Yang@amd.com>
Signed-off-by: Alex Sierra <alex.sierra@amd.com>
Signed-off-by: Felix Kuehling <Felix.Kuehling@amd.com>
---
 drivers/gpu/drm/amd/amdkfd/kfd_svm.c | 395 +++++++++++++++++++++++++--
 drivers/gpu/drm/amd/amdkfd/kfd_svm.h |   4 +
 2 files changed, 374 insertions(+), 25 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_svm.c b/drivers/gpu/drm/amd/amdkfd/kfd_svm.c
index e23171ac866a..1244ba380292 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_svm.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_svm.c
@@ -98,11 +98,99 @@ static void svm_range_remove_notifier(struct svm_range *prange)
 		mmu_interval_notifier_remove(&prange->notifier);
 }
 
+static int
+svm_range_dma_map(struct device *dev, dma_addr_t **dma_addr,
+		  unsigned long *pages_addr, uint64_t npages)
+{
+	enum dma_data_direction dir = DMA_BIDIRECTIONAL;
+	dma_addr_t *addr = *dma_addr;
+	struct page *page;
+	int i, r;
+
+	if (!pages_addr)
+		return 0;
+
+	if (!addr) {
+		addr = kvmalloc_array(npages, sizeof(*addr),
+				      GFP_KERNEL | __GFP_ZERO);
+		if (!addr)
+			return -ENOMEM;
+		*dma_addr = addr;
+	}
+
+	for (i = 0; i < npages; i++) {
+		if (WARN_ONCE(addr[i] && !dma_mapping_error(dev, addr[i]),
+			      "leaking dma mapping\n"))
+			dma_unmap_page(dev, addr[i], PAGE_SIZE, dir);
+
+		page = hmm_pfn_to_page(pages_addr[i]);
+		addr[i] = dma_map_page(dev, page, 0, PAGE_SIZE, dir);
+		r = dma_mapping_error(dev, addr[i]);
+		if (r) {
+			pr_debug("failed %d dma_map_page\n", r);
+			return r;
+		}
+		pr_debug("dma mapping 0x%llx for page addr 0x%lx\n",
+			 addr[i] >> PAGE_SHIFT, page_to_pfn(page));
+	}
+	return 0;
+}
+
+void svm_range_dma_unmap(struct device *dev, dma_addr_t *dma_addr,
+			 unsigned long offset, unsigned long npages)
+{
+	enum dma_data_direction dir = DMA_BIDIRECTIONAL;
+	int i;
+
+	if (!dma_addr)
+		return;
+
+	for (i = offset; i < offset + npages; i++) {
+		if (!dma_addr[i] || dma_mapping_error(dev, dma_addr[i]))
+			continue;
+		pr_debug("dma unmapping 0x%llx\n", dma_addr[i] >> PAGE_SHIFT);
+		dma_unmap_page(dev, dma_addr[i], PAGE_SIZE, dir);
+		dma_addr[i] = 0;
+	}
+}
+
+static void svm_range_free_dma_mappings(struct svm_range *prange)
+{
+	DECLARE_BITMAP(bitmap, MAX_GPU_INSTANCE);
+	struct kfd_dev *kfd_dev;
+	dma_addr_t *dma_addr;
+	struct device *dev;
+	struct kfd_process *p;
+	uint32_t gpuidx;
+	int r;
+
+	p = container_of(prange->svms, struct kfd_process, svms);
+	bitmap_or(bitmap, prange->bitmap_access, prange->bitmap_aip,
+		  MAX_GPU_INSTANCE);
+
+	for_each_set_bit(gpuidx, bitmap, MAX_GPU_INSTANCE) {
+		dma_addr = prange->dma_addr[gpuidx];
+		if (!dma_addr)
+			continue;
+
+		r = kfd_process_device_from_gpuidx(p, gpuidx, &kfd_dev);
+		if (r) {
+			pr_debug("failed to find device idx %d\n", gpuidx);
+			return;
+		}
+		dev = &kfd_dev->pdev->dev;
+		svm_range_dma_unmap(dev, dma_addr, 0, prange->npages);
+		kvfree(dma_addr);
+		prange->dma_addr[gpuidx] = NULL;
+	}
+}
+
 static void svm_range_free(struct svm_range *prange)
 {
 	pr_debug("svms 0x%p prange 0x%p [0x%lx 0x%lx]\n", prange->svms, prange,
 		 prange->start, prange->last);
 
+	svm_range_free_dma_mappings(prange);
 	kvfree(prange->pages_addr);
 	kfree(prange);
 }
@@ -342,41 +430,62 @@ svm_range_is_same_attrs(struct svm_range *old, struct svm_range *new)
 }
 
 static int
-svm_range_split_pages(struct svm_range *new, struct svm_range *old,
-		      uint64_t start, uint64_t last)
+svm_range_split_array(void *ppnew, void *ppold, size_t size,
+		      uint64_t old_start, uint64_t old_n,
+		      uint64_t new_start, uint64_t new_n)
 {
-	unsigned long old_start;
-	unsigned long *pages_addr;
+	unsigned char *new, *old, *pold;
 	uint64_t d;
 
-	old_start = old->start;
-	new->pages_addr = kvmalloc_array(new->npages,
-					 sizeof(*new->pages_addr),
-					 GFP_KERNEL | __GFP_ZERO);
-	if (!new->pages_addr)
-		return -ENOMEM;
+	if (!ppold)
+		return 0;
+	pold = *(unsigned char **)ppold;
+	if (!pold)
+		return 0;
 
-	d = new->start - old_start;
-	memcpy(new->pages_addr, old->pages_addr + d,
-	       new->npages * sizeof(*new->pages_addr));
+	new = kvmalloc_array(new_n, size, GFP_KERNEL);
+	if (!new)
+		return -ENOMEM;
 
-	old->npages = last - start + 1;
-	old->start = start;
-	old->last = last;
+	d = (new_start - old_start) * size;
+	memcpy(new, pold + d, new_n * size);
 
-	pages_addr = kvmalloc_array(old->npages, sizeof(*pages_addr),
-				    GFP_KERNEL);
-	if (!pages_addr) {
-		kvfree(new->pages_addr);
+	old = kvmalloc_array(old_n, size, GFP_KERNEL);
+	if (!old) {
+		kvfree(new);
 		return -ENOMEM;
 	}
 
-	d = start - old_start;
-	memcpy(pages_addr, old->pages_addr + d,
-	       old->npages * sizeof(*pages_addr));
+	d = (new_start == old_start) ? new_n * size : 0;
+	memcpy(old, pold + d, old_n * size);
 
-	kvfree(old->pages_addr);
-	old->pages_addr = pages_addr;
+	kvfree(pold);
+	*(void **)ppold = old;
+	*(void **)ppnew = new;
+
+	return 0;
+}
+
+static int
+svm_range_split_pages(struct svm_range *new, struct svm_range *old,
+		      uint64_t start, uint64_t last)
+{
+	uint64_t npages = last - start + 1;
+	int i, r;
+
+	for (i = 0; i < MAX_GPU_INSTANCE; i++) {
+		r = svm_range_split_array(&new->dma_addr[i], &old->dma_addr[i],
+					  sizeof(*old->dma_addr[i]), old->start,
+					  npages, new->start, new->npages);
+		if (r)
+			return r;
+	}
+
+	r = svm_range_split_array(&new->pages_addr, &old->pages_addr,
+				  sizeof(*old->pages_addr), old->start, npages,
+				  new->start, new->npages);
+	if (r)
+		return r;
 
 	return 0;
 }
@@ -525,6 +634,234 @@ void svm_range_add_child(struct svm_range *prange, struct mm_struct *mm,
 	list_add_tail(&pchild->child_list, &prange->child_list);
 }
 
+static uint64_t
+svm_range_get_pte_flags(struct amdgpu_device *adev, struct svm_range *prange)
+{
+	uint32_t flags = prange->flags;
+	uint32_t mapping_flags;
+	uint64_t pte_flags;
+
+	pte_flags = AMDGPU_PTE_VALID;
+	pte_flags |= AMDGPU_PTE_SYSTEM | AMDGPU_PTE_SNOOPED;
+
+	mapping_flags = AMDGPU_VM_PAGE_READABLE | AMDGPU_VM_PAGE_WRITEABLE;
+
+	if (flags & KFD_IOCTL_SVM_FLAG_GPU_RO)
+		mapping_flags &= ~AMDGPU_VM_PAGE_WRITEABLE;
+	if (flags & KFD_IOCTL_SVM_FLAG_GPU_EXEC)
+		mapping_flags |= AMDGPU_VM_PAGE_EXECUTABLE;
+	if (flags & KFD_IOCTL_SVM_FLAG_COHERENT)
+		mapping_flags |= AMDGPU_VM_MTYPE_UC;
+	else
+		mapping_flags |= AMDGPU_VM_MTYPE_NC;
+
+	/* TODO: add CHIP_ARCTURUS new flags for vram mapping */
+
+	pte_flags |= amdgpu_gem_va_map_flags(adev, mapping_flags);
+
+	/* Apply ASIC specific mapping flags */
+	amdgpu_gmc_get_vm_pte(adev, &prange->mapping, &pte_flags);
+
+	pr_debug("PTE flags 0x%llx\n", pte_flags);
+
+	return pte_flags;
+}
+
+static int
+svm_range_unmap_from_gpu(struct amdgpu_device *adev, struct amdgpu_vm *vm,
+			 uint64_t start, uint64_t last,
+			 struct dma_fence **fence)
+{
+	uint64_t init_pte_value = 0;
+
+	pr_debug("[0x%llx 0x%llx]\n", start, last);
+
+	return amdgpu_vm_bo_update_mapping(adev, adev, vm, false, true, NULL,
+					   start, last, init_pte_value, 0,
+					   NULL, NULL, fence);
+}
+
+static int
+svm_range_unmap_from_gpus(struct svm_range *prange, unsigned long start,
+			  unsigned long last)
+{
+	DECLARE_BITMAP(bitmap, MAX_GPU_INSTANCE);
+	struct kfd_process_device *pdd;
+	struct dma_fence *fence = NULL;
+	struct amdgpu_device *adev;
+	struct kfd_process *p;
+	struct kfd_dev *dev;
+	uint32_t gpuidx;
+	int r = 0;
+
+	bitmap_or(bitmap, prange->bitmap_access, prange->bitmap_aip,
+		  MAX_GPU_INSTANCE);
+	p = container_of(prange->svms, struct kfd_process, svms);
+
+	for_each_set_bit(gpuidx, bitmap, MAX_GPU_INSTANCE) {
+		pr_debug("unmap from gpu idx 0x%x\n", gpuidx);
+		r = kfd_process_device_from_gpuidx(p, gpuidx, &dev);
+		if (r) {
+			pr_debug("failed to find device idx %d\n", gpuidx);
+			return -EINVAL;
+		}
+
+		pdd = kfd_get_process_device_data(dev, p);
+		if (!pdd)
+			return -EINVAL;
+
+		adev = (struct amdgpu_device *)dev->kgd;
+
+		r = svm_range_unmap_from_gpu(adev, pdd->vm, start, last,
+					     &fence);
+		if (r)
+			break;
+
+		if (fence) {
+			r = dma_fence_wait(fence, false);
+			dma_fence_put(fence);
+			fence = NULL;
+			if (r)
+				break;
+		}
+
+		svm_range_dma_unmap(adev->dev, prange->dma_addr[gpuidx],
+				    start - prange->start,
+				    last - start + 1);
+
+		amdgpu_amdkfd_flush_gpu_tlb_pasid((struct kgd_dev *)adev,
+						  p->pasid);
+	}
+
+	return r;
+}
+
+static int svm_range_bo_validate(void *param, struct amdgpu_bo *bo)
+{
+	struct ttm_operation_ctx ctx = { false, false };
+
+	amdgpu_bo_placement_from_domain(bo, AMDGPU_GEM_DOMAIN_VRAM);
+
+	return ttm_bo_validate(&bo->tbo, &bo->placement, &ctx);
+}
+
+static int
+svm_range_map_to_gpu(struct amdgpu_device *adev, struct amdgpu_vm *vm,
+		     struct svm_range *prange, dma_addr_t *pages_addr,
+		     bool reserve_vm, struct dma_fence **fence)
+{
+	struct amdgpu_bo *root;
+	uint64_t pte_flags;
+	int r = 0;
+
+	pr_debug("svms 0x%p [0x%lx 0x%lx]\n", prange->svms, prange->start,
+		 prange->last);
+
+	if (reserve_vm) {
+		root = amdgpu_bo_ref(vm->root.base.bo);
+		r = amdgpu_bo_reserve(root, true);
+		if (r) {
+			pr_debug("failed %d to reserve root bo\n", r);
+			amdgpu_bo_unref(&root);
+			goto out;
+		}
+		r = amdgpu_vm_validate_pt_bos(adev, vm, svm_range_bo_validate,
+					      NULL);
+		if (r) {
+			pr_debug("failed %d validate pt bos\n", r);
+			goto unreserve_out;
+		}
+	}
+
+	prange->mapping.start = prange->start;
+	prange->mapping.last = prange->last;
+	prange->mapping.offset = 0;
+	pte_flags = svm_range_get_pte_flags(adev, prange);
+	prange->mapping.flags = pte_flags;
+
+	r = amdgpu_vm_bo_update_mapping(adev, adev, vm, false, false, NULL,
+					prange->mapping.start,
+					prange->mapping.last, pte_flags,
+					prange->mapping.offset, NULL,
+					pages_addr, &vm->last_update);
+	if (r) {
+		pr_debug("failed %d to map to gpu 0x%lx\n", r, prange->start);
+		goto unreserve_out;
+	}
+
+
+	r = amdgpu_vm_update_pdes(adev, vm, false);
+	if (r) {
+		pr_debug("failed %d to update directories 0x%lx\n", r,
+			 prange->start);
+		goto unreserve_out;
+	}
+
+	if (fence)
+		*fence = dma_fence_get(vm->last_update);
+
+unreserve_out:
+	if (reserve_vm) {
+		amdgpu_bo_unreserve(root);
+		amdgpu_bo_unref(&root);
+	}
+
+out:
+	return r;
+}
+
+static int svm_range_map_to_gpus(struct svm_range *prange, bool reserve_vm)
+{
+	DECLARE_BITMAP(bitmap, MAX_GPU_INSTANCE);
+	struct kfd_process_device *pdd;
+	struct amdgpu_device *adev;
+	struct kfd_process *p;
+	struct kfd_dev *dev;
+	struct dma_fence *fence = NULL;
+	uint32_t gpuidx;
+	int r = 0;
+
+	bitmap_or(bitmap, prange->bitmap_access, prange->bitmap_aip,
+		  MAX_GPU_INSTANCE);
+	p = container_of(prange->svms, struct kfd_process, svms);
+
+	for_each_set_bit(gpuidx, bitmap, MAX_GPU_INSTANCE) {
+		r = kfd_process_device_from_gpuidx(p, gpuidx, &dev);
+		if (r) {
+			pr_debug("failed to find device idx %d\n", gpuidx);
+			return -EINVAL;
+		}
+
+		pdd = kfd_bind_process_to_device(dev, p);
+		if (IS_ERR(pdd))
+			return -EINVAL;
+		adev = (struct amdgpu_device *)dev->kgd;
+
+		r = svm_range_dma_map(adev->dev, &prange->dma_addr[gpuidx],
+				      prange->pages_addr, prange->npages);
+		if (r)
+			break;
+
+		r = svm_range_map_to_gpu(adev, pdd->vm, prange,
+					 prange->dma_addr[gpuidx], reserve_vm,
+					 &fence);
+		if (r)
+			break;
+
+		if (fence) {
+			r = dma_fence_wait(fence, false);
+			dma_fence_put(fence);
+			fence = NULL;
+			if (r) {
+				pr_debug("failed %d to dma fence wait\n", r);
+				break;
+			}
+		}
+	}
+
+	return r;
+}
+
 /**
  * svm_range_list_lock_and_flush_work - flush pending deferred work
  *
@@ -897,6 +1234,8 @@ svm_range_unmap_from_cpu(struct mm_struct *mm, struct svm_range *prange,
 	pr_debug("svms 0x%p prange 0x%p [0x%lx 0x%lx] [0x%lx 0x%lx]\n", svms,
 		 prange, prange->start, prange->last, start, last);
 
+	svm_range_unmap_from_gpus(prange, start, last);
+
 	unmap_parent = start <= prange->start && last >= prange->last;
 
 	list_for_each_entry(pchild, &prange->child_list, child_list)
@@ -1138,6 +1477,12 @@ svm_range_set_attr(struct kfd_process *p, uint64_t start, uint64_t size,
 			pr_debug("failed %d to validate svm range\n", r);
 			break;
 		}
+
+		r = svm_range_map_to_gpus(prange, true);
+		if (r) {
+			pr_debug("failed %d to map svm range\n", r);
+			break;
+		}
 	}
 
 	svm_range_debug_dump(svms);
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_svm.h b/drivers/gpu/drm/amd/amdkfd/kfd_svm.h
index f9b81245b94a..596c881f7674 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_svm.h
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_svm.h
@@ -57,8 +57,10 @@ struct svm_work_list_item {
  * @remove_list:link list node used to add to remove list
  * @insert_list:link list node used to add to insert list
  * @hmm_range:  hmm range structure used by hmm_range_fault to get system pages
+ * @mapping:    bo_va mapping structure to create and update GPU page table
  * @npages:     number of pages
  * @pages_addr: list of system memory physical page address
+ * @dma_addr:   dma mapping address on each GPU for system memory physical page
  * @flags:      flags defined as KFD_IOCTL_SVM_FLAG_*
  * @perferred_loc: perferred location, 0 for CPU, or GPU id
  * @perfetch_loc: last prefetch location, 0 for CPU, or GPU id
@@ -85,8 +87,10 @@ struct svm_range {
 	struct list_head		remove_list;
 	struct list_head		insert_list;
 	struct hmm_range		*hmm_range;
+	struct amdgpu_bo_va_mapping	mapping;
 	uint64_t			npages;
 	unsigned long			*pages_addr;
+	dma_addr_t			*dma_addr[MAX_GPU_INSTANCE];
 	uint32_t			flags;
 	uint32_t			preferred_loc;
 	uint32_t			prefetch_loc;
-- 
2.31.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
