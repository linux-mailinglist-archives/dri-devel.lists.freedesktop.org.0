Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A1BF343F2E
	for <lists+dri-devel@lfdr.de>; Mon, 22 Mar 2021 12:09:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ADEA96E199;
	Mon, 22 Mar 2021 11:08:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2055.outbound.protection.outlook.com [40.107.244.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 87F8D6E11F;
 Mon, 22 Mar 2021 11:08:17 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZwcDDpDZGiSqOyajA0IcEjWsmdAoTnzntSrF1RVrK6E9jMPec24AE8Xn/TO3d23rRbvz4idatzs3UlGpVQH+dUHtHRaaTjZYrwVoZ/Ufn3R7Rf+HI1Jr4LSCjEtbDNdGjcK9e0uILJ7HxXfUtrxWFxhs0mnJKDOo6aEU4/XMYckyPoPhZQOTbDZkGC5yZAgO2TuZDHNpkb8kkltmRJtKQMKBHX7ipjd9Wd2vDiPqTFYeyYZzHnEJ8vcPS2VxQleRXkecwysBDP7srcW2dycDHiTh+cUJo4DGD3K/5v5c6rgvaI94ZQr2GaD8EQGZnXkGUj3HVR3PRy20m2COdNrSng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BlEYzgsQYI2T3/t9V8hO0Z/JKWzWyGyu+FmeHzpja8k=;
 b=LI+HdTBKeVB/AhM8NJAfxNsRDGzgkrRYQrm4aRsfZJ1EGpFgz/KUQQkqf/XRUIV5lmxbpNGvTBn4vHVSmawOprWqiq/Yp6ryJIqIcxew9DFUEN0uGJYev3BDfCKc7WlIb+evYj01xv0CCwf/GVJweJyXux7JieXzWM3KVnuMMkLie6NxkDu9LSWH/uDGNFpS8FnSo+bQ9F8Fr+vEfcenlaoWX4/gXZrhrLf00+OikJKLNYIVHdMUhbu6czwlm210240uJSwUowZrFqV1yiEgt9/k+/Vv/4CopGc+V2L4+NssmBqlGGCud9CxSz0l/XMRtGTelAOUrYs+FkJBoUEqag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BlEYzgsQYI2T3/t9V8hO0Z/JKWzWyGyu+FmeHzpja8k=;
 b=WVMiZ0SICsFyF3YoYqBMb4C1P4DeS2RDMoohBhUuBRJvvcNHNF8xmyVnCqJusEXaWC4YHlt9mxfA2MVUPQGUzi2+1T6bgesMvRcdBle6NUDH7TJcsGepCdcuOzvpXEO31pyB5bSeEASR4ixjf9QSVeAWrwpyG8jj74+xW6VREnc=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from BL0PR12MB4948.namprd12.prod.outlook.com (2603:10b6:208:1cc::20)
 by BL0PR12MB4899.namprd12.prod.outlook.com (2603:10b6:208:1cf::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.18; Mon, 22 Mar
 2021 11:08:16 +0000
Received: from BL0PR12MB4948.namprd12.prod.outlook.com
 ([fe80::70f5:99ed:65a1:c033]) by BL0PR12MB4948.namprd12.prod.outlook.com
 ([fe80::70f5:99ed:65a1:c033%5]) with mapi id 15.20.3933.036; Mon, 22 Mar 2021
 11:08:16 +0000
From: Felix Kuehling <Felix.Kuehling@amd.com>
To: dri-devel@lists.freedesktop.org,
	amd-gfx@lists.freedesktop.org
Subject: [PATCH 31/44] drm/amdkfd: add svm range validate timestamp
Date: Mon, 22 Mar 2021 06:58:47 -0400
Message-Id: <20210322105900.14068-32-Felix.Kuehling@amd.com>
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
 Transport; Mon, 22 Mar 2021 11:07:46 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 1815aaa5-d16d-4f52-40a0-08d8ed22b917
X-MS-TrafficTypeDiagnostic: BL0PR12MB4899:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BL0PR12MB4899DB640D432AC786A0322B92659@BL0PR12MB4899.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: O7sCbuQ3lHkDWewFzIneioVfNifHBNVCUnGI02tig37tEuEIYQofNVjcPsWIOk5FNesTO8DW1b4wJkgX2P0JkVb0rLwuD16wcUx0urdhF+asN5ve3LlIy6Bre5pKsKLIivigBVU25Sif75Ov9C0u6DuQlH9gfoBfw7hks33Tru5s6wlmYQGQpBmDLKGuXIzDHZK5jNbczA9g+YrLJwd4zKhdy9sd3zZgNCKrUT89qh2yV6LyU49NMOpgpNucenraa1wfNWkdGUZxZ6RNOOrNFkSu8gGx7IrP5K3XNtR6NkxBbGYwNbuGiRdrL2jOn7DoIU5rvb+qdeXqLR5R5OiVX0YihRGxv4wcmUzwL9//QWx6S5DpOLfCTHpQIo3dN92/LjnLC8/exwAUbA1q74rGN8q8Iw8GVtKjogyL92mSwiIoLNKM78pqnONC5DMu7VzqjXgPpqat4fPsW2MCdREJJndukXDCWF5269AKr82nQCWY6ISHEP++UjqMA/nNd3uMWDLRix0WIifqXuSLHVatuJmfUd6BHgkjXQv5vxgfB34hjqIly5L6ZFH3JMkdvqlrnaRhoky1Xu9yIfzCysFkY7NpoTOmYGbCxvHjiB6zFqNiRBJILi5XDgeoJxX0Qd7rVcOQS7cRD39hjn8Y+5oAP6PyhnTfA7L100TEXbYhXt8=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR12MB4948.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(396003)(39860400002)(346002)(376002)(136003)(36756003)(83380400001)(66556008)(66476007)(186003)(66946007)(2616005)(8676002)(956004)(16526019)(86362001)(8936002)(26005)(478600001)(6486002)(5660300002)(4326008)(450100002)(316002)(2906002)(7696005)(1076003)(52116002)(15650500001)(38100700001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?crkFh1ai1qbAe1YOP+T3Ck6ysmkEZMSs6aR3ju4o+k8+0Rv1iwO+dDHYr9ZV?=
 =?us-ascii?Q?CgJgSDci2RoGI4XRrS1OtOch8u4BFwtI49dJuoQkjsidvM+/0dpvGFWkmZLR?=
 =?us-ascii?Q?1wSggqnQ+5XLKPd8NBOK9JrXV4wxMGvXs77cpOu8mTZeju5d49+tojyaPZ7v?=
 =?us-ascii?Q?lsAnvJADMyVFoxWoEXXwtUOLFBonqJmj4gzUQm0RhU1B+pg4UatSsf7CLccH?=
 =?us-ascii?Q?tLDwFJB6OFxchN6DdUN0e4vT6Zpl366HdmgANU68ZpixdKtqIzhKOOoqiXvE?=
 =?us-ascii?Q?MfzcKYiYkAGh2qfvZRkgdXocTf9mTDfKegiC1dIvNf4Nx0EXRROKO5DMgdjN?=
 =?us-ascii?Q?ZjcqWWXix3HvFIWIE6IvKxZoPzkCTupznDzpy11zkULWjG+hULoOw7fMo9Nw?=
 =?us-ascii?Q?G6SrZFCACtnOIfbbpzSQQogtQ0YeYMS0UjrJtFNJzRMVtPMswqiB0QvNFDFg?=
 =?us-ascii?Q?9008q6l8XHPAJfSTzx0XvIuu9xyOf8H1HkBT0icEkegilk+Y8Hy2+gHzQjJg?=
 =?us-ascii?Q?P9yCG6kFVpMT1rkoiZdNyjbkQGKd0Gtp7WFsIUHN9Mswg6rMz1DILiyW90uF?=
 =?us-ascii?Q?Uu++HdfkIzBuQboFOPQ7bJjivUPKoxagwPNG1eGFC5VJnXtH99CHc71OYbZc?=
 =?us-ascii?Q?cyVPH67uv6Z7dhlUpHfKtp+6PTw+RLPi+BtHxJq3Lbgkasj6ceArDPlasiET?=
 =?us-ascii?Q?dRqIsZJwHzhJ920NVuD6F3idT9RXYfhd80F7ZbV7HFqkQnd42AOVebTIxAfv?=
 =?us-ascii?Q?IiHHSYwNj/1vQwHkEo2C8z7y3/PKYAawmyB84+gPSEOlWSDXyKn5kS+2VGqO?=
 =?us-ascii?Q?ai9uFj1YeziwKglPl+JcSVwOO2LSMntmPQ6x6vluvGWBvJGZCxngitl+hw73?=
 =?us-ascii?Q?x1z57LEK9kAklkArZ6mO79nUtc+jhc9SL+QuTHfRoVSAtWQCfydvf3N7hsCb?=
 =?us-ascii?Q?nYfEWK/mBbIdomjgZqXo49NTeYBQshH/eBSbZxQKK8xPwe9dT3Bra9v4uaoo?=
 =?us-ascii?Q?tbDvda3RWwgLtUXq5C291hXu31uHq0k3wURjZNKXX4kqvEj1E2ji55RNc8uR?=
 =?us-ascii?Q?uD4yiQr3LtbX+SP4IBEI5yYhwLDbmePHokVbAeaUEP/7+I1V2N3j3pnKaKNY?=
 =?us-ascii?Q?q/i2xyieXGc/jG73ZS7DT7vuXGSNUJc5Uo7LuUHqwiOLtlavGzjdApzVwsuK?=
 =?us-ascii?Q?Rl/yhnPb1xLYnjmTgWynX/1Vu1gRjGa86+4k3Lr1tdC+FMrv2IDvI0D+Fvl+?=
 =?us-ascii?Q?ghZNDyNjiaoAhakUlS5Q1jYgvq0PsvwSFnrTqJAOL64C1wTCYIn2jpOftkrF?=
 =?us-ascii?Q?aysvZnsbNy4DOsp0JTNxTjPL?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1815aaa5-d16d-4f52-40a0-08d8ed22b917
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB4948.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Mar 2021 11:07:46.4806 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fZTwiOj3uu3kREoTOItAB+WKVI1GQRHgSXAj9usQ7Eqr6bREu/AxQOdyTCiKA2W4RfzDihVk4KQ/huiges50Cg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB4899
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

With xnack on, add validate timestamp in order to handle GPU vm fault
from multiple GPUs.

If GPU retry fault need migrate the range to the best restore location,
use range validate timestamp to record system timestamp after range is
restored to update GPU page table.

Because multiple pages of same range have multiple retry fault, define
AMDGPU_SVM_RANGE_RETRY_FAULT_PENDING to the long time period that
pending retry fault may still comes after page table update, to skip
duplicate retry fault of same range.

If difference between system timestamp and range last validate timestamp
is bigger than AMDGPU_SVM_RANGE_RETRY_FAULT_PENDING, that means the
retry fault is from another GPU, then continue to handle retry fault
recover.

Signed-off-by: Philip Yang <Philip.Yang@amd.com>
Signed-off-by: Felix Kuehling <Felix.Kuehling@amd.com>
---
 drivers/gpu/drm/amd/amdkfd/kfd_svm.c | 24 ++++++++++++++++++++++--
 drivers/gpu/drm/amd/amdkfd/kfd_svm.h |  2 ++
 2 files changed, 24 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_svm.c b/drivers/gpu/drm/amd/amdkfd/kfd_svm.c
index 98c049dc3a63..f4b4fea06ac9 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_svm.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_svm.c
@@ -34,6 +34,11 @@
 
 #define AMDGPU_SVM_RANGE_RESTORE_DELAY_MS 1
 
+/* Long enough to ensure no retry fault comes after svm range is restored and
+ * page table is updated.
+ */
+#define AMDGPU_SVM_RANGE_RETRY_FAULT_PENDING	2000
+
 static void svm_range_evict_svm_bo_worker(struct work_struct *work);
 static bool
 svm_range_cpu_invalidate_pagetables(struct mmu_interval_notifier *mni,
@@ -246,6 +251,7 @@ svm_range *svm_range_new(struct svm_range_list *svms, uint64_t start,
 	INIT_LIST_HEAD(&prange->deferred_list);
 	INIT_LIST_HEAD(&prange->child_list);
 	atomic_set(&prange->invalid, 0);
+	prange->validate_timestamp = ktime_to_us(ktime_get());
 	mutex_init(&prange->migrate_mutex);
 	mutex_init(&prange->lock);
 	svm_range_set_default_attributes(&prange->preferred_loc,
@@ -578,19 +584,25 @@ static int svm_range_validate_vram(struct svm_range *prange)
 static int
 svm_range_validate(struct mm_struct *mm, struct svm_range *prange)
 {
+	struct kfd_process *p;
 	int r;
 
 	pr_debug("svms 0x%p prange 0x%p [0x%lx 0x%lx] actual loc 0x%x\n",
 		 prange->svms, prange, prange->start, prange->last,
 		 prange->actual_loc);
 
+	p = container_of(prange->svms, struct kfd_process, svms);
+
 	if (!prange->actual_loc)
 		r = svm_range_validate_ram(mm, prange);
 	else
 		r = svm_range_validate_vram(prange);
 
-	pr_debug("svms 0x%p [0x%lx 0x%lx] ret %d invalid %d\n", prange->svms,
-		 prange->start, prange->last, r, atomic_read(&prange->invalid));
+	if (!r)
+		prange->validate_timestamp = ktime_to_us(ktime_get());
+
+	pr_debug("svms 0x%p [0x%lx 0x%lx] ret %d\n", prange->svms,
+		 prange->start, prange->last, r);
 
 	return r;
 }
@@ -2086,6 +2098,7 @@ svm_range_restore_pages(struct amdgpu_device *adev, unsigned int pasid,
 	struct svm_range_list *svms;
 	struct svm_range *prange;
 	struct kfd_process *p;
+	uint64_t timestamp;
 	int32_t best_loc;
 	int r = 0;
 
@@ -2119,6 +2132,13 @@ svm_range_restore_pages(struct amdgpu_device *adev, unsigned int pasid,
 	}
 
 	mutex_lock(&prange->migrate_mutex);
+	timestamp = ktime_to_us(ktime_get()) - prange->validate_timestamp;
+	/* skip duplicate vm fault on different pages of same range */
+	if (timestamp < AMDGPU_SVM_RANGE_RETRY_FAULT_PENDING) {
+		pr_debug("svms 0x%p [0x%lx %lx] already restored\n",
+			 svms, prange->start, prange->last);
+		goto out_unlock_range;
+	}
 
 	best_loc = svm_range_best_restore_location(prange, adev);
 	if (best_loc == -1) {
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_svm.h b/drivers/gpu/drm/amd/amdkfd/kfd_svm.h
index fed28e487878..fea9c63b5f95 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_svm.h
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_svm.h
@@ -87,6 +87,7 @@ struct svm_work_list_item {
  * @actual_loc: the actual location, 0 for CPU, or GPU id
  * @granularity:migration granularity, log2 num pages
  * @invalid:    not 0 means cpu page table is invalidated
+ * @validate_timestamp: system timestamp when range is validated
  * @notifier:   register mmu interval notifier
  * @work_item:  deferred work item information
  * @deferred_list: list header used to add range to deferred list
@@ -125,6 +126,7 @@ struct svm_range {
 	uint32_t			actual_loc;
 	uint8_t				granularity;
 	atomic_t			invalid;
+	uint64_t			validate_timestamp;
 	struct mmu_interval_notifier	notifier;
 	struct svm_work_list_item	work_item;
 	struct list_head		deferred_list;
-- 
2.31.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
