Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D56FD2EC8C8
	for <lists+dri-devel@lfdr.de>; Thu,  7 Jan 2021 04:04:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 31DF26E450;
	Thu,  7 Jan 2021 03:03:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2073.outbound.protection.outlook.com [40.107.236.73])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB4706E428;
 Thu,  7 Jan 2021 03:03:37 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JyIZwJMQNc/jTKeYZJeNFeUddDhll9O7nQ1iuIkpNJf2vOHjB3qN8zqoS0XOZYckLAmkyJcVxYoPJIojC4d1aLov3kNMt1+gy5rZRAJGHUAZSqReZRs2uTrK3RyWEkpPcd722neVWLeAGWCM95I183MspyWT6ts8QSMNt8VIA/RqT3BQgsvYetA4AeiyxM0yCHSegzer7N2Vw3jUvsulxrRXz2EHdGvFW7oeLKljzrn1RYjLe4eOM9EBA1KH3vfHxEJmSzwKtMv6mrks2agn5NgW6rNYKhGn6AK/n8Ot0NuRZrmeI0sFrbGZIKVyUp/nspgvaWwCM4Tx9P9myg3vdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OxPU990mTj12O9Eva3IfuefKlwAtgJmYSXf2VG45FMM=;
 b=O8ungtuKcU9KWRo6eD13DUqQ6EGHZWX7w1jIytOR00wDhTzyJLly4AyQaOu/Sbh5C4hkh8FEcnRjZtRgmwysMVZI0v8ItX1eM48q5FT0DcQp3kS7j3V6F7r08yQh4mt2VHF1+QBHGeSLxgSktZZTpVdTjZDRzoU4RGaV/p+dSJmRw8DB8F7nBBGgGB7b6DUCVyU1mLkTnc0CjvpUX06V4wnF6jZp8uHf+G1rZG+hd267GL/92k3ad2zTNyCKQ7KSvHpipb6sdushPcaBRyW+HcZITdKXdga3yPXUlb0MyPRAOzCpl/7nNDRleRlsta4+bpbrcHwmGoUBD00wOuAPxw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OxPU990mTj12O9Eva3IfuefKlwAtgJmYSXf2VG45FMM=;
 b=BcfEoo+C4QtmOlb7u4ErchwzLHsHkMlzb9Wp/Y56g5o81Y/rOaX+GBgiXZhE3rKCDo+GpH0EjHOCJr/DWDGn3+SVBxsgCKXhUDA9oLTtou6rUxav38q8OK4UQS+CxEPz1GrWQSb/BZH/dVuaQsQI6jUYpRyhDpFPlJ8EyKm5/iA=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from BL0PR12MB4948.namprd12.prod.outlook.com (2603:10b6:208:1cc::20)
 by MN2PR12MB4408.namprd12.prod.outlook.com (2603:10b6:208:26c::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3742.6; Thu, 7 Jan
 2021 03:03:37 +0000
Received: from BL0PR12MB4948.namprd12.prod.outlook.com
 ([fe80::9425:559:83c0:991b]) by BL0PR12MB4948.namprd12.prod.outlook.com
 ([fe80::9425:559:83c0:991b%9]) with mapi id 15.20.3742.006; Thu, 7 Jan 2021
 03:03:37 +0000
From: Felix Kuehling <Felix.Kuehling@amd.com>
To: amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 34/35] drm/amdkfd: add svm range validate timestamp
Date: Wed,  6 Jan 2021 22:01:26 -0500
Message-Id: <20210107030127.20393-35-Felix.Kuehling@amd.com>
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
 15.20.3742.6 via Frontend Transport; Thu, 7 Jan 2021 03:03:07 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: a8d9c98d-871b-4a8f-f5ab-08d8b2b8d3ee
X-MS-TrafficTypeDiagnostic: MN2PR12MB4408:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MN2PR12MB4408E25B67B091380390D13A92AF0@MN2PR12MB4408.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: NXQZ6QEpPbB9UJpq55f8cO8EZgOJ3wbGYKR7LWJz489YE3K/7yZGjFzMFlSXGsOH2J5cyBN+kojBLA0Rh6OxGRbCjvpwXMauGXIAfvgILEJ68Q5L2Tm+chagSPMb34reauNFelxhKtqRwezpQQWYcmnLHo/nfnkbYgRGVahisadRRxWwYFN8dnhfwD4iTdnGyeddPxtjlA+sH6zUk6qSel5vh2I3n9jyPe5xa4owheTAQghPnOLmFFVpd2gtyl3ITejGaudEsg5sRS/WTy72/HiiFfjHLOlczAP3xMzTa55VMgdK/spuwbpzPKT00nTw0yB362IdOzRI9Wj4WlGQitCh7CV7NDmZOSRh0s6s7DutU/p0lum4o/sih3I8ftLxDQSkFHUmSemwN2Q5FoWQUw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR12MB4948.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(136003)(346002)(366004)(396003)(376002)(8676002)(2906002)(86362001)(450100002)(66556008)(4326008)(66476007)(8936002)(5660300002)(66946007)(1076003)(6486002)(83380400001)(52116002)(316002)(7696005)(2616005)(36756003)(16526019)(956004)(15650500001)(478600001)(26005)(6666004)(186003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?VXMlyZDPvAkaemExBWQVNveZnOcFRimZKTLTZq8F4wmkQR3rJTSuAZMDGGJz?=
 =?us-ascii?Q?V57aP6mwJvBqp4BGbyH9rZ8mUqlz+G+7K9e6zhNqN8FUjdBS/pvXot4Hl5oU?=
 =?us-ascii?Q?9ywDUxiYc8+k5CYKfl3BlMTFGqP256pcDyKmxxmEEPq4aH1hCKS1a16FTbUn?=
 =?us-ascii?Q?wlqap5KATXC78BWRnq6x173Di80FEVAtfrGdfvQfZ6w1bU0GHLdsLKKUi3ZM?=
 =?us-ascii?Q?r38llX1n9mvvkq3Jyl0luW4KgdeX8q3vm8c8btYimmHUL5PMyzwd50Uvxpbi?=
 =?us-ascii?Q?FthwlsL0UKFVml23VPpCRpsZRNC5hs+CQvd+jVrTWBk/DMR4wzZI3oHpPP1g?=
 =?us-ascii?Q?94HAXKZKyY8vZ1iAE0Oo73zrB4K5v2Xid4LmMlxCP+KqrcCmtqO3SXFxZd/i?=
 =?us-ascii?Q?cfk1JHIKAkan7eO395k+nO3u9Nq9dNFzcnVvFk7pWH2DLRuhvLIRmVzmd/eq?=
 =?us-ascii?Q?Y18KuawwhEDk4nG+FHmSx4fwa0OY2Gc/4zRY3JWg04aeAVaVem5I4hpafRRw?=
 =?us-ascii?Q?z9qj8eRDHTMtmdGTMq4FZ9EzFWhgbzPnVBG64T/BEP99PYHvFo4Gb9jgUcEs?=
 =?us-ascii?Q?D+Lb5x1WX7Pk2PhO9OVAvMrNcD0kFlKKmIeUm+EQo55GwB9MsPN/63GoAZLN?=
 =?us-ascii?Q?ZON6CGx/vN4do56/cNAXUFQHEHSMi5iMzJw9DrAxBHjl4lYRpOqkQhmX/dNk?=
 =?us-ascii?Q?/6Uq6w0G+Vw2QpF6mUe9bvVyDyweFlo3KFib4Vl2inmjsr5n9/ryFNefnaHY?=
 =?us-ascii?Q?T5nnXMWjJ4MZschztZkL7omdknuYElXMvPr0fwCkV8fhEOzqxcgyoKMeb0GV?=
 =?us-ascii?Q?9gBgd6PI0sqUTGins71sb8GmvFVC4x3be4WvVNA6FZvsgltaBtpmSt/DPPUw?=
 =?us-ascii?Q?v53InXyDhQy8G2xjY6+3c6BDSJobqmO3sP/k88dyb5O6ZQAyaGpqffQDhETq?=
 =?us-ascii?Q?y3yBlDrR8LxxbYSNro3TOZ9jxrYKOf+u3Gv8VKn7ifaL4S5mwxokeFMQakJS?=
 =?us-ascii?Q?edIp?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB4948.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jan 2021 03:03:07.4811 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-Network-Message-Id: a8d9c98d-871b-4a8f-f5ab-08d8b2b8d3ee
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: P0bSKFGlykZvzIPZ4hoq+QOsOzs40Q7tH9PHTzcsA77AOpuYHSN4xkJEKuy4+fVtK3JIaJGL2GpP2n+gjzwf2w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4408
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
 drivers/gpu/drm/amd/amdkfd/kfd_svm.c | 27 +++++++++++++++++++++++----
 drivers/gpu/drm/amd/amdkfd/kfd_svm.h |  2 ++
 2 files changed, 25 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_svm.c b/drivers/gpu/drm/amd/amdkfd/kfd_svm.c
index 8b57f5a471bd..65f20a72ddcb 100644
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
 /**
  * svm_range_unlink - unlink svm_range from lists and interval tree
@@ -122,6 +127,7 @@ svm_range *svm_range_new(struct svm_range_list *svms, uint64_t start,
 	INIT_LIST_HEAD(&prange->remove_list);
 	INIT_LIST_HEAD(&prange->svm_bo_list);
 	atomic_set(&prange->invalid, 0);
+	prange->validate_timestamp = ktime_to_us(ktime_get());
 	mutex_init(&prange->mutex);
 	spin_lock_init(&prange->svm_bo_lock);
 	svm_range_set_default_attributes(&prange->preferred_loc,
@@ -482,20 +488,28 @@ static int svm_range_validate_vram(struct svm_range *prange)
 static int
 svm_range_validate(struct mm_struct *mm, struct svm_range *prange)
 {
+	struct kfd_process *p;
 	int r;
 
 	pr_debug("svms 0x%p [0x%lx 0x%lx] actual loc 0x%x\n", prange->svms,
 		 prange->it_node.start, prange->it_node.last,
 		 prange->actual_loc);
 
+	p = container_of(prange->svms, struct kfd_process, svms);
+
 	if (!prange->actual_loc)
 		r = svm_range_validate_ram(mm, prange);
 	else
 		r = svm_range_validate_vram(prange);
 
-	pr_debug("svms 0x%p [0x%lx 0x%lx] ret %d invalid %d\n", prange->svms,
-		 prange->it_node.start, prange->it_node.last,
-		 r, atomic_read(&prange->invalid));
+	if (!r) {
+		if (p->xnack_enabled)
+			atomic_set(&prange->invalid, 0);
+		prange->validate_timestamp = ktime_to_us(ktime_get());
+	}
+
+	pr_debug("svms 0x%p [0x%lx 0x%lx] ret %d\n", prange->svms,
+		 prange->it_node.start, prange->it_node.last, r);
 
 	return r;
 }
@@ -1766,6 +1780,7 @@ svm_range_restore_pages(struct amdgpu_device *adev, struct amdgpu_vm *vm,
 	struct svm_range_list *svms;
 	struct svm_range *prange;
 	struct kfd_process *p;
+	uint64_t timestamp;
 	int32_t best_loc;
 	int srcu_idx;
 	int r = 0;
@@ -1790,7 +1805,11 @@ svm_range_restore_pages(struct amdgpu_device *adev, struct amdgpu_vm *vm,
 		goto out_srcu_unlock;
 	}
 
-	if (!atomic_read(&prange->invalid)) {
+	mutex_lock(&prange->mutex);
+	timestamp = ktime_to_us(ktime_get()) - prange->validate_timestamp;
+	mutex_unlock(&prange->mutex);
+	/* skip duplicate vm fault on different pages of same range */
+	if (timestamp < AMDGPU_SVM_RANGE_RETRY_FAULT_PENDING) {
 		pr_debug("svms 0x%p [0x%lx %lx] already restored\n",
 			 svms, prange->it_node.start, prange->it_node.last);
 		goto out_srcu_unlock;
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_svm.h b/drivers/gpu/drm/amd/amdkfd/kfd_svm.h
index 0685eb04b87c..466ec5537bbb 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_svm.h
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_svm.h
@@ -66,6 +66,7 @@ struct svm_range_bo {
  * @actual_loc: the actual location, 0 for CPU, or GPU id
  * @granularity:migration granularity, log2 num pages
  * @invalid:    not 0 means cpu page table is invalidated
+ * @validate_timestamp: system timestamp when range is validated
  * @bitmap_access: index bitmap of GPUs which can access the range
  * @bitmap_aip: index bitmap of GPUs which can access the range in place
  *
@@ -95,6 +96,7 @@ struct svm_range {
 	uint32_t			actual_loc;
 	uint8_t				granularity;
 	atomic_t			invalid;
+	uint64_t			validate_timestamp;
 	DECLARE_BITMAP(bitmap_access, MAX_GPU_INSTANCE);
 	DECLARE_BITMAP(bitmap_aip, MAX_GPU_INSTANCE);
 };
-- 
2.29.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
