Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 87937350DDB
	for <lists+dri-devel@lfdr.de>; Thu,  1 Apr 2021 06:24:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA0FD6EC65;
	Thu,  1 Apr 2021 04:23:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2076.outbound.protection.outlook.com [40.107.94.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E25A6EC56;
 Thu,  1 Apr 2021 04:23:43 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ahn5opgd7XSpqVHq7eGBeXWBh0rdaErFELLS1mHLCDZMzuHw67t3oRLUk+HSO2SAxP6f8rkrnM3DCrM9TgtAgh4dNnyShf/r+lS96+zwbwfxj3Y8Nc5KV+L6bMHaN4z9Qs1dW/92x93vtv8HjxeusTO51bsc/boSdrFjUxQXjxumLl0ChEp7AjhtK6axUKhD5qKoIVpWKrJCvsSHqqw1jqUrRq4llH9Gl+z0PjSN4ncRTf/1uRBpvCLKrs/+jVdGVP5Rjm0OTcBkiBPhI40xQ0xOC/t2oIA4+s9Z1TsZc2DX1ZeYJ1vOg4lSB+i8EUNBzxgUEiwUVitKc55W3UhcEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=65sPXXpolWHhl9EqaMupGKuW6MYXylbfjplxSK10bCY=;
 b=aUGABIgM0FY8A1d5dcGKDytfqdnUPrs9pfiKImPmY0fzGZ7jeoHPCWiEpYO+lVEANlKD11WQ0VBd0phz7QZot4k7zssaj7DjHRNBsB/TDIeYZ2Yih7VarjqJQJToBT+y+VNSqhx9ZoOV7lcY3skWEKvyZL1DXEP6szZ58HcXL5BfetzdNXqiLy+2g8QIpz0BZ/+te86SY9rsTOvhE858y04149IqWgCFEqVUfNSYsbxCfGQQ/A/GdGUBRQhMs004/LmaLdP7w2mKpnYfUohYxX5T3Ns+f3gNqZ7xE8TYjQn9byVzPuxtX8/bD583VFtZTP061cOTFLycTDoad2P+0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=65sPXXpolWHhl9EqaMupGKuW6MYXylbfjplxSK10bCY=;
 b=2POcwkVD49eqRdJQD3VKg/mIUAV5OpvuHKzQzT1tyQ50D8vQr0UolDbS7zd9HL2r+lSeCsFcOYk5LSdhluwIRYiX34qFxruFhjkh+vcdmyapIg3LDU4YdExbnebgvyIQMBvmve7krWHZWtBxP/48gkpL2QizSboST7bNDaaFscU=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from BL0PR12MB4948.namprd12.prod.outlook.com (2603:10b6:208:1cc::20)
 by MN2PR12MB4222.namprd12.prod.outlook.com (2603:10b6:208:19a::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3977.24; Thu, 1 Apr
 2021 04:23:42 +0000
Received: from BL0PR12MB4948.namprd12.prod.outlook.com
 ([fe80::70f5:99ed:65a1:c033]) by BL0PR12MB4948.namprd12.prod.outlook.com
 ([fe80::70f5:99ed:65a1:c033%7]) with mapi id 15.20.3933.039; Thu, 1 Apr 2021
 04:23:42 +0000
From: Felix Kuehling <Felix.Kuehling@amd.com>
To: amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 31/34] drm/amdkfd: add svm range validate timestamp
Date: Thu,  1 Apr 2021 00:22:25 -0400
Message-Id: <20210401042228.1423-32-Felix.Kuehling@amd.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210401042228.1423-1-Felix.Kuehling@amd.com>
References: <20210401042228.1423-1-Felix.Kuehling@amd.com>
X-Originating-IP: [165.204.55.251]
X-ClientProxiedBy: YT1PR01CA0088.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2d::27) To BL0PR12MB4948.namprd12.prod.outlook.com
 (2603:10b6:208:1cc::20)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from Harpoon.amd.com (165.204.55.251) by
 YT1PR01CA0088.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2d::27) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3977.32 via Frontend Transport; Thu, 1 Apr 2021 04:23:11 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8560461a-cdc5-4ece-f3b4-08d8f4c5dc8b
X-MS-TrafficTypeDiagnostic: MN2PR12MB4222:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MN2PR12MB42228DC953FBAA132E0FA4B8927B9@MN2PR12MB4222.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: JacvjmoBOgR5LXxsdE2FNxyRSNzrAbtrsc2aoCWglN5PjazdPu8E8wajYZMPMJXIqXB1moi7mB+SAUR/sjpquBCQwAWHcyRZ/5SpDLfENiLU1SnTikHf/uzG9acsoQRs+FdWyRpd+p9ccKrQqgc0IryTLGF7ik3HcjKR6gj3U+BvvVoSnQiBS6KeoqrgnXEnVphu6/+R3q6WJail/9Y1XT+LfvgqY/nraFw/CMqdhd8gziEkQwwb16TuwY8gPr38L03fCfDfCVQNT10DhjrklsGdkSeK5b5XpvLiB2kMzEtJ77R4vx0oa2eJhhKOAftycg+wUd8Zgx4zDsxoKRAF/wqxpfTfFQtc+QHhdHCga74CI+FSC8lCggWJWH9sXjHNG++JCK6CXoHeVLttuogg9+YqKSEv6o9gvIsA3gS1K6PDMWTCgu9AeWw4ql1pHomK+XkbZnyljhnjnMpBKyCxAPWk2lxA2yYXzKpF5wyuHPOwkYi0lQDWD/dXYVmMzW/HPb653VKeHNk0LLyJw9jjvgZAdxpYA2enU36XsbtvTcLqyH/BYR59ylmaLkjp30csppiL42q2C8vF1AKgKyCJiPmC+4MEqGmXdvCELSh9jNhacrzvfSQ2kJtqGbh9f8GKYdoV4fLm1L7Hl/cbuk+XmiWRXOTetEsvk1wVMRDw1Bc=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR12MB4948.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(346002)(136003)(396003)(376002)(39860400002)(1076003)(316002)(52116002)(66476007)(38100700001)(2616005)(956004)(5660300002)(2906002)(6666004)(186003)(16526019)(4326008)(450100002)(66556008)(8936002)(83380400001)(36756003)(86362001)(8676002)(6486002)(7696005)(478600001)(15650500001)(26005)(66946007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?goCMRq++L+fCQhIjBrTXx8mkao48bk6ANubyc1n8lcpwS14Bjo/PasLx+wQg?=
 =?us-ascii?Q?PSF5Q8M4/N6kM5G+dWxRlOd/TjZM+ga+9V9HuRPaxpI0mU6qR0TnR+o7Kx+u?=
 =?us-ascii?Q?wRWwUZCjsWxC0z2JmIUzHZS7vDEjO8JhHy7NC+hDF7/LSR01Ujl+swQ9TXwP?=
 =?us-ascii?Q?8vzodcMST5uEm99IlYn8qe40xbgFyfNN1kj+7oMsgxLN6s9Azmcpe7vcYrkc?=
 =?us-ascii?Q?I8rtmPe4aE+qWh+hYDHBZB9wOAilT6rKR6crDCGOCMNr5mlM5h7l6vl/lfnS?=
 =?us-ascii?Q?PT8jPsrmKu1uOekSwfxcLAozguOgIUA4T3PmegBJ0781aF4w6WDkx7Lcymhe?=
 =?us-ascii?Q?oTWZgzegceKdHXa01hwMCWWb2gD5NxS2J2Rg2/8ZOQrBzYo9whDxwY1Dxc3p?=
 =?us-ascii?Q?91A225CIcVIV2A1awT84mSjTORnc3dgrOt9Bl/jlrH1jJu0ApzPCfnXTJmOR?=
 =?us-ascii?Q?9SiaEkOHNk1BML8t0aCBlWurWQbTLWpXJDVURvZnyrrO1aKDmlJk78bvKJKp?=
 =?us-ascii?Q?vxSZaQVOYZksLts8caWF5zQ1xrTGhHEU5srQGDVcusCeeHlH6GBLB9J9DbcD?=
 =?us-ascii?Q?D3kvq05/J0Ou93a766c88irG+syN1aYya772k7NJs6zubAcv5+9hOhyA+18x?=
 =?us-ascii?Q?hWc85LGko36UGOH1ZAJaoQ/gy71YzwGaiHSwZa35OKp3Gq+9QCG78b8MLveG?=
 =?us-ascii?Q?qPWv2xTVV0u9rn/4jHHdyZVr0jfH5JIezkBSeNIUXYekcR4WoNwnRK6RFzKy?=
 =?us-ascii?Q?H7MMAt8ttatrZO0BiwItKVJ9v9cJiH9swvPGPmXiTmwzebnJiFW1JH3cVLOp?=
 =?us-ascii?Q?kIaiWiKEF75HkUOwZoC0q5XHbHw9LDMgYWvgTYWALzijcOTn1INQxfyOuwkf?=
 =?us-ascii?Q?yTg1dELxvo0zHiiHmf6BofMlLKp0p42FUhdacRJK66MgAU5tp6FKxDeklmB5?=
 =?us-ascii?Q?pTlj7zsKxOsM0TUoeVL7zGuZ/g/qFCt215jHbYEx4XBAmRt1umvCfXry0OCN?=
 =?us-ascii?Q?fp0n2EVKUecLII4FbRcsatUlreQJlD4Dv3zaErLIZJEIV5N8JuoJcNxiSaTd?=
 =?us-ascii?Q?Zem5Ow91mzRjM9SXkgLdbM94DmgnfQ2alVyn6bxLsWGp/Gpb0LBjeuTQw9lJ?=
 =?us-ascii?Q?tVgoWP0kEuvjCXjiXF/Y7WY7s7cCKmvyY+PRVL6/4eLK0d7yxBD2yzNKMtI+?=
 =?us-ascii?Q?c/++DeZDI+dqWMFYflc36p5kbfPySNRm0gu92+tX2LkoyJot/HfjW5gy9JMS?=
 =?us-ascii?Q?kXu7zmt43y99SYHGUQB5MsKZJrEw6o2dMLsiKfVsMazG2rekyi3PQCsdN46F?=
 =?us-ascii?Q?ge4hbZoc/SFsH77waamuQYkj?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8560461a-cdc5-4ece-f3b4-08d8f4c5dc8b
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB4948.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Apr 2021 04:23:12.3996 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ihyyv5Gz4ejDwG8UTZ1cngKQmMispmth0WXz7Icp8Rs/nYttNEJlueNIsCAxTZrg5rYQ0VPKON4yTHIvY6UaDg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4222
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
 drivers/gpu/drm/amd/amdkfd/kfd_svm.c | 17 +++++++++++++++++
 drivers/gpu/drm/amd/amdkfd/kfd_svm.h |  2 ++
 2 files changed, 19 insertions(+)

diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_svm.c b/drivers/gpu/drm/amd/amdkfd/kfd_svm.c
index 61bf2df38e72..adb79b10f874 100644
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
@@ -268,6 +273,7 @@ svm_range *svm_range_new(struct svm_range_list *svms, uint64_t start,
 	INIT_LIST_HEAD(&prange->deferred_list);
 	INIT_LIST_HEAD(&prange->child_list);
 	atomic_set(&prange->invalid, 0);
+	prange->validate_timestamp = ktime_to_us(ktime_get());
 	mutex_init(&prange->migrate_mutex);
 	mutex_init(&prange->lock);
 	svm_range_set_default_attributes(&prange->preferred_loc,
@@ -1358,6 +1364,9 @@ static int svm_range_validate_and_map(struct mm_struct *mm,
 unreserve_out:
 	svm_range_unreserve_bos(&ctx);
 
+	if (!r)
+		prange->validate_timestamp = ktime_to_us(ktime_get());
+
 	return r;
 }
 
@@ -2098,6 +2107,7 @@ svm_range_restore_pages(struct amdgpu_device *adev, unsigned int pasid,
 	struct svm_range_list *svms;
 	struct svm_range *prange;
 	struct kfd_process *p;
+	uint64_t timestamp;
 	int32_t best_loc, gpuidx;
 	int r = 0;
 
@@ -2133,6 +2143,13 @@ svm_range_restore_pages(struct amdgpu_device *adev, unsigned int pasid,
 	}
 
 	mutex_lock(&prange->migrate_mutex);
+	timestamp = ktime_to_us(ktime_get()) - prange->validate_timestamp;
+	/* skip duplicate vm fault on different pages of same range */
+	if (timestamp < AMDGPU_SVM_RANGE_RETRY_FAULT_PENDING) {
+		pr_debug("svms 0x%p [0x%lx %lx] already restored\n",
+			 svms, prange->start, prange->last);
+		goto out_unlock_range;
+	}
 
 	best_loc = svm_range_best_restore_location(prange, adev, &gpuidx);
 	if (best_loc == -1) {
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_svm.h b/drivers/gpu/drm/amd/amdkfd/kfd_svm.h
index f157be434cfa..af853726b861 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_svm.h
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_svm.h
@@ -85,6 +85,7 @@ struct svm_work_list_item {
  * @actual_loc: the actual location, 0 for CPU, or GPU id
  * @granularity:migration granularity, log2 num pages
  * @invalid:    not 0 means cpu page table is invalidated
+ * @validate_timestamp: system timestamp when range is validated
  * @notifier:   register mmu interval notifier
  * @work_item:  deferred work item information
  * @deferred_list: list header used to add range to deferred list
@@ -121,6 +122,7 @@ struct svm_range {
 	uint32_t			actual_loc;
 	uint8_t				granularity;
 	atomic_t			invalid;
+	uint64_t			validate_timestamp;
 	struct mmu_interval_notifier	notifier;
 	struct svm_work_list_item	work_item;
 	struct list_head		deferred_list;
-- 
2.31.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
