Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B56F235FF7D
	for <lists+dri-devel@lfdr.de>; Thu, 15 Apr 2021 03:25:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EBD9C6E9C0;
	Thu, 15 Apr 2021 01:24:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-BN3-obe.outbound.protection.outlook.com
 (mail-eopbgr680072.outbound.protection.outlook.com [40.107.68.72])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 86D316E9BD;
 Thu, 15 Apr 2021 01:24:41 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=P2di+vXHvPxFlc//XGFNjCxCpwU6ET3LHrqdP06SJt2N1DgktiJ9FnfFqXLmVJSMmhU2x+IebIwI0dvui/Ngs2u1MEmbZZ2LVy+vrE/d1s6z9otbgN0ZgxmerijheRVf4/XPLUn+GKGi/MpIqf3fxwbkRDBDa/1jp+/Q6gCHQOxMH7i+eKlVrbNuEMBJ4fcjcV4ocYAh5TRfD+asEGuryBRbUop9xjNuBmwgea8iVjP8s9Gzx+K3guyzR5XNbR/ZZ1z/hqKEGxfV2qzO27RTwujjYolvrJ4NufmGKpJjlywPSvxq/HwKXSLfEFHxmpFfaY4RGiTON9Mjpk0CQSDclQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wN18pxGXuB8ZWGT711lGUV98M/PEOp/cdx/fsLk3vNE=;
 b=FV7uEGIH7vZEk6sFNeJ0AV+01HXRtEOz+aEQ3SA48TtbARB5bFCPNvO+g3FJ0yGJU5K58GA0mON6fXGD7D9WE7Ktfc+WiAR2YwjMvUfQxW8XWPujU69vTf36dLQWUXCbjlxCixnsRST9pMLVkmhbI7qsg9mBg4zJ9Ankm7t1EshcWy2PpB0KdbTjDATzHYKQwQiRcc9xmAx2yPyX7kfJCwHOs/SZc8e1pRTCLhgpTNQPHwcMUA1ObRgUdwua5V+nPfGoeUttJMT75vF0m0Smjf0lSXQ7fLVKsQEGyw4LtrMt6EPYIpkCKLBP2FROGAKxft0AtuSjfvOuksC7xvgYgw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wN18pxGXuB8ZWGT711lGUV98M/PEOp/cdx/fsLk3vNE=;
 b=yDueiatdYMkF4gDjrC2ad1B4+E+3CvGOCPC22CKPIt7owvfXX8QHOsYfm92sKJXRtWCCGr2EWpriaGHurxB88orM8MKitJ2qtjJNgHjM7IXCUQ/F6NXqYbBtNpqt3sVkWOwXNd7mPpj2Dsom2l5PFbcyy42PLQIfMAywewI/ZmY=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from BL0PR12MB4948.namprd12.prod.outlook.com (2603:10b6:208:1cc::20)
 by MN2PR12MB4797.namprd12.prod.outlook.com (2603:10b6:208:a4::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4020.22; Thu, 15 Apr
 2021 01:24:39 +0000
Received: from BL0PR12MB4948.namprd12.prod.outlook.com
 ([fe80::70f5:99ed:65a1:c033]) by BL0PR12MB4948.namprd12.prod.outlook.com
 ([fe80::70f5:99ed:65a1:c033%7]) with mapi id 15.20.3933.040; Thu, 15 Apr 2021
 01:24:39 +0000
From: Felix Kuehling <Felix.Kuehling@amd.com>
To: amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 31/34] drm/amdkfd: add svm range validate timestamp
Date: Wed, 14 Apr 2021 21:23:34 -0400
Message-Id: <20210415012337.1755-32-Felix.Kuehling@amd.com>
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
 Transport; Thu, 15 Apr 2021 01:24:09 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3610694e-ff8d-496c-31f4-08d8ffad2b60
X-MS-TrafficTypeDiagnostic: MN2PR12MB4797:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MN2PR12MB47977B6310274855645ED1E6924D9@MN2PR12MB4797.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: M1iGD2GyEkoLZmViSZSNcuMDN2EpmebPS0SI+gLtOekhgduyk7OtZkePpyDVXGe2aujBQQmqcJ5W2hYpFl9rTGv29/P2MX+daBtV3qwEobYdQqD0426pTzP6gDM1DWXq5/17nu4XLsidEBO6DNPQ+cSD2aMyGG/N2gn0sk0LSeoEII8U+Ml/PMdal+fLICCAMTAUBvWSRtATMgojpSkx/MdB9QtEjkGJSPqmePPWm8IklsjX05CTESGaYmX/SjIHZlaySo2YdnQWruJy0Bvx2cB8v0L9See58zQkLYa92BP+26RD2V0GGsP2tQ6CFjwBIdtfAympz6iV8q1R6BldRcPTV0hu39omoeN2Yo6wcMMOxWFDGOTaihyaPiMkdftgrgoXZKkQmzH2ZeKVVtJt/d2lBlyJQR4SNP8gdl8lj9GMxm0bpNpupd3T/gevseqVLj3qH18nSgnvt2Kr4IAz3+vW2O1nIY+VkHryi5gBEzropYVjMt82/ZzlZ2BSXREIPG9IPBk7j3bnQZk78KtIqGd16mtF+gDXMx7XrAVqThQQPTuVyejsM5BPeF/fTNbk0KcNXrITElBYE3X/7wUO01JW4yK/hzZqiTXUrLT/1QWNhFIrNVZ2luYA+iI+Z3vlduyNBk2lOWxrql3bobeS09KUe7m2bB1QJc6bJWJvsmU=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR12MB4948.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(366004)(39860400002)(136003)(346002)(376002)(86362001)(66476007)(15650500001)(66946007)(2906002)(38350700002)(186003)(36756003)(16526019)(450100002)(38100700002)(5660300002)(83380400001)(66556008)(4326008)(52116002)(7696005)(478600001)(6486002)(8936002)(2616005)(8676002)(1076003)(6666004)(956004)(26005)(316002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?xCWfH0Ydea3afwE5Jv1fBMuuNiW1byW2J9P1a7Gec1r46Xgowjj9cFNYHn8z?=
 =?us-ascii?Q?8STUoHfOLvqSgiG42gYsLzflJgcsiPbD/XujIba4xFp5ITj7U1fuDsjMAqxm?=
 =?us-ascii?Q?T9kKRGxRsA+P8ezixG1YaAatfb4HdDFiybiFFzAaVZQo9e+BR6JGglNJVcZT?=
 =?us-ascii?Q?M1grExTQMGBHAAcdoOx911AY9zVZC3VyfqlTTne8xSgs/gpP5dUxKDu4/PHJ?=
 =?us-ascii?Q?d3js9ziCUojwzHwAr7Dd2l3++zL47fOkPRuRlKe5x49YSahLrsbbvM/FHIWg?=
 =?us-ascii?Q?8xO8WSpU67egG6hfjPBginq20YWtIZYaYYqAeHGZjq2tx0HvOcClkTDH4aNY?=
 =?us-ascii?Q?OkKJE91ptk8IGRlKRENwlz5uOgXY0isdRtDxL98ruBswlPpvGirVHQR3qQGN?=
 =?us-ascii?Q?Z+bDCTfqt8IXBOQVYJdPLyK2jldU5fhQeTUwCmyXUKYixBQAKxjHH7UJiWZS?=
 =?us-ascii?Q?EDmRuV6MELWv7h4qQttssrb1LesJivzuDITxQ1vnQL+oI4esQ5crB3+cwFJs?=
 =?us-ascii?Q?eEZeagTrNJxVgv/gKCyJSfwPzceP7OurJ2cTTkqGwteg5h0Rnivu2o2bpQ0F?=
 =?us-ascii?Q?LnI85otSTbwTNsK1KfSl49OSIUTSlYUWuISaZz0yQvARTWfNz/j+dqW39LN1?=
 =?us-ascii?Q?B8h6nZ2YOa6vnx7tp6PtxBmkex85BFjRHLqayu+Auj82TXsRQ6wcD6AWu1vW?=
 =?us-ascii?Q?5J7JaJ6pgloG0krjwT+b3EYUstzmngOUUWD9B2HkyZJp5/+BNTcn5z35gZBX?=
 =?us-ascii?Q?Cj+xiHDbvuWZC+Uj9CMDuqutMsliqFbrV18hV2pDgjqjhcJZGKCZjDdUckAp?=
 =?us-ascii?Q?ky6N+z7FpajkI6EsZuvB3M75qK4Wx2tmh23q8RaXGQOtrHdF0aOTGwewWS7o?=
 =?us-ascii?Q?zKpCgzNPwL+NYordS7Fgqik+JeIcam8Kb/rcR7v+Dq9n4uMjdel3U05/b0ji?=
 =?us-ascii?Q?B3VI/71jT/Ba8d8jK/w3tINJI+z+8tYDFkF+uYCwHpR/ZgvrW4kLq44YMV3r?=
 =?us-ascii?Q?absuvEHu5Y7na4lZSoI7Q1w/6FKZyIVz5jPWuaPGzasH62566XvjVPVxNPmH?=
 =?us-ascii?Q?FXEKy1ar+BwWVVPNYISxFRwfSDA1Q54HQzI3T4dj6OD+zfhe/rroqg2ixstE?=
 =?us-ascii?Q?l1IcZ+3bBqtDa7oAfTk/TB+jXEMcoTMCLVVdbMsB8a5Xi2TkrWqdPn3zsQPj?=
 =?us-ascii?Q?dZgg+4d9SzaEqfRRizuYOEfBOQNGD3/Lkymf3nI5FazEB2ZnkYmpL0N14oyF?=
 =?us-ascii?Q?w2qO2txFu9BY0ty9RYkhbQ4uSYcTHsCjFwlEHJb44+evIzUd4uONoQwZXd0C?=
 =?us-ascii?Q?kIFPj3gsjmhnFBEfnrAotnlE?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3610694e-ff8d-496c-31f4-08d8ffad2b60
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB4948.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Apr 2021 01:24:09.6438 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mDGdhl0KGGBhkMvF9MZnA2GlU+xnnxHJtsI0q7dIvWELMIK3zZdIOmENpgPgNbVqDHl8LA3r7xIOVyex2UmR4w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4797
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
Reviewed-by: Felix Kuehling <Felix.Kuehling@amd.com>
Signed-off-by: Felix Kuehling <Felix.Kuehling@amd.com>
---
 drivers/gpu/drm/amd/amdkfd/kfd_svm.c | 17 +++++++++++++++++
 drivers/gpu/drm/amd/amdkfd/kfd_svm.h |  2 ++
 2 files changed, 19 insertions(+)

diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_svm.c b/drivers/gpu/drm/amd/amdkfd/kfd_svm.c
index 40e1dc42a981..7b698b0e4e41 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_svm.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_svm.c
@@ -35,6 +35,11 @@
 
 #define AMDGPU_SVM_RANGE_RESTORE_DELAY_MS 1
 
+/* Long enough to ensure no retry fault comes after svm range is restored and
+ * page table is updated.
+ */
+#define AMDGPU_SVM_RANGE_RETRY_FAULT_PENDING	2000
+
 static void svm_range_evict_svm_bo_worker(struct work_struct *work);
 static bool
 svm_range_cpu_invalidate_pagetables(struct mmu_interval_notifier *mni,
@@ -269,6 +274,7 @@ svm_range *svm_range_new(struct svm_range_list *svms, uint64_t start,
 	INIT_LIST_HEAD(&prange->deferred_list);
 	INIT_LIST_HEAD(&prange->child_list);
 	atomic_set(&prange->invalid, 0);
+	prange->validate_timestamp = ktime_to_us(ktime_get());
 	mutex_init(&prange->migrate_mutex);
 	mutex_init(&prange->lock);
 	svm_range_set_default_attributes(&prange->preferred_loc,
@@ -1392,6 +1398,9 @@ static int svm_range_validate_and_map(struct mm_struct *mm,
 unreserve_out:
 	svm_range_unreserve_bos(&ctx);
 
+	if (!r)
+		prange->validate_timestamp = ktime_to_us(ktime_get());
+
 	return r;
 }
 
@@ -2131,6 +2140,7 @@ svm_range_restore_pages(struct amdgpu_device *adev, unsigned int pasid,
 	struct svm_range_list *svms;
 	struct svm_range *prange;
 	struct kfd_process *p;
+	uint64_t timestamp;
 	int32_t best_loc, gpuidx;
 	int r = 0;
 
@@ -2166,6 +2176,13 @@ svm_range_restore_pages(struct amdgpu_device *adev, unsigned int pasid,
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
index 11b04a706ff9..aa829b3c992d 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_svm.h
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_svm.h
@@ -86,6 +86,7 @@ struct svm_work_list_item {
  * @actual_loc: the actual location, 0 for CPU, or GPU id
  * @granularity:migration granularity, log2 num pages
  * @invalid:    not 0 means cpu page table is invalidated
+ * @validate_timestamp: system timestamp when range is validated
  * @notifier:   register mmu interval notifier
  * @work_item:  deferred work item information
  * @deferred_list: list header used to add range to deferred list
@@ -122,6 +123,7 @@ struct svm_range {
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
