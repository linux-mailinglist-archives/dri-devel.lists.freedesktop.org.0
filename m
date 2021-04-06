Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AD413354A8C
	for <lists+dri-devel@lfdr.de>; Tue,  6 Apr 2021 03:48:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1787A6E250;
	Tue,  6 Apr 2021 01:47:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2078.outbound.protection.outlook.com [40.107.223.78])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 73A2A6E25A;
 Tue,  6 Apr 2021 01:47:43 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mCoLRcrlR6te3Wf1HW7k8bruONIAGgoKWoid2PHB4IWH9HIiBHbqWavtlB0eGOhUb09TceUYREwzLa7lioMJ0Kv7/Hym+VYbKBJQtUAAyS0ZCCbGZGSDM37IQwGed4FsaMQtSFuwVfU+V4FR728R5CmX75QPGdpLuL4oDwBCnH2hzP6UQVh0fj/Nk6veXOAz5lYuTQipprSVmjbAvWHUAmu8LNfQEDKTYabzMKDU7hg48s/wveM01oEaD7xR8izMEWH0eavV9LRpSoWOYjZ+WGS5XfcHWbq9V8KT1y/7dP/GH2axmZdyk2vy+dV8myQ7V2yotBMlK9Yog/YxxgcGWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RUKq33LcSrThjjXHCGYZFrfco9PAW/d3dmb0wOwZBOc=;
 b=lCwtfL47FjmbfxBvGB4es9aKhB4VHi2x2Z82D6X+QQDMisGSfPEl8Vf95axo434PRCXRPiV+bfmqk/Ybpwb3iqrAkYqUSjt0syvDul0FRlPAMQlQRUY0gNIn8WVztzdcceZ0z4op07EpDDFLmcwVKzEtMbdC09nChphPtet8UnO6W0k0zU+OQESE0/YlZdVcqUL6ghlm1356MRooASGVksn075bGVljHmjL5ab0Gan8vzjgvopNBS9QmhTGJyoUID5beZ5yJqMTAvvsE4e+tmSDlt7slnFVWzkjh2I0ONti22pxt1A833D/M6o3s9MxDWNQVomQfZsIVzfoRrtSYDw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RUKq33LcSrThjjXHCGYZFrfco9PAW/d3dmb0wOwZBOc=;
 b=AYbz/lLejWr6p7Shf9DLVZ0uUvKIwVubmnNyH7B0PA+k7Sv2JhxfOwoL1/IROU1kGeyINRsF5Ied5svQ1vHalc0hTmyUF67/iKvSu4t6aElVX1OLczSpHw8OmUC9VBVaVM8ZjN54LPwFp9JxPSRvZydiPo64hC5O+mR6ugTUqdc=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from BL0PR12MB4948.namprd12.prod.outlook.com (2603:10b6:208:1cc::20)
 by MN2PR12MB4159.namprd12.prod.outlook.com (2603:10b6:208:1da::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3999.32; Tue, 6 Apr
 2021 01:47:42 +0000
Received: from BL0PR12MB4948.namprd12.prod.outlook.com
 ([fe80::70f5:99ed:65a1:c033]) by BL0PR12MB4948.namprd12.prod.outlook.com
 ([fe80::70f5:99ed:65a1:c033%7]) with mapi id 15.20.3933.039; Tue, 6 Apr 2021
 01:47:42 +0000
From: Felix Kuehling <Felix.Kuehling@amd.com>
To: amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 31/34] drm/amdkfd: add svm range validate timestamp
Date: Mon,  5 Apr 2021 21:46:26 -0400
Message-Id: <20210406014629.25141-32-Felix.Kuehling@amd.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210406014629.25141-1-Felix.Kuehling@amd.com>
References: <20210406014629.25141-1-Felix.Kuehling@amd.com>
X-Originating-IP: [165.204.55.251]
X-ClientProxiedBy: YT1PR01CA0071.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2d::10) To BL0PR12MB4948.namprd12.prod.outlook.com
 (2603:10b6:208:1cc::20)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from Harpoon.amd.com (165.204.55.251) by
 YT1PR01CA0071.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2d::10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3999.32 via Frontend Transport; Tue, 6 Apr 2021 01:47:10 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: da2b43fd-caf5-4077-997d-08d8f89de4ec
X-MS-TrafficTypeDiagnostic: MN2PR12MB4159:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MN2PR12MB4159026B137909CB080F1D2692769@MN2PR12MB4159.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: tQWV+oqsZlb1MlxWmyhoo53lxf5EOVb0nCqcmP6hcUVq5Z5o1EvO9V1gaVyX1PnW3XXTGYQqRsjDjflYN99Ug5NkQvo+amgnKm2PssYoF+sBxYY6g1fnlpLImAn3WmRBnyNoaM5Rj2lc7PWDl5W0p84/UboQaJ7a/Z5yJh1I1ec6xZLhdOJKiNtnhnMpuoHNmj4XcXSk8vrq388G3AlPKuW7Y7h78lNwAkhKB8QlABkvDFCwqLnqJeq1J4EdgpCA+XfLTPXkvDWmhv/1ey1SA/UG8mhrwPX3wGpScxVAcNoSFXUwlP3F0gxsJ24UwLlapNhYIx5Ci4cPrRKHC2dL/9SBVsfGOmViSp37Cs9EeYmuRXBeESxN8WfGnrELtJL/04cZwHZ1nwTu2z+NiQoEqPge72SjXbCsX1nqOQO5XlDGdoBlasvBC+xYV6One83XsrI826mtWjtVl7g53TZChKIHigkrDzPgE089pWfvXCfbPdUrp6GwygsYdCh9+MOXuZTtKqoVYOinOFo8Bl0a0oXiO9wBwPQAiYcgSimPPajI8qP9e71WeJlRQnIn+/n3O8nkpgK+VJpnFyNELoS2P9ZpRziXvWdg+PbusCc/jCXtSVoQUedbFfYv0xDYy3j2gYlniQaD9DPJRa6DT/mE0B8qjHiAVVoJgEVK527UAQRaSLXKRF696ki0Uj0ia5q/
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR12MB4948.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(39860400002)(376002)(396003)(366004)(136003)(66556008)(2906002)(66946007)(66476007)(5660300002)(8676002)(26005)(6666004)(186003)(8936002)(316002)(4326008)(15650500001)(83380400001)(478600001)(450100002)(52116002)(7696005)(38100700001)(36756003)(2616005)(956004)(6486002)(16526019)(38350700001)(1076003)(86362001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?1LGEHlvvF/GywsTCvlc3SxwQ+UpEBCZovbjMaty4kablG+RAnQVavFL5Vr6K?=
 =?us-ascii?Q?GRgMP7X1/gTjjXI3Grv7pN2Sk7IJiKFDuyeWplwZSKCJNCwpNGCM/D/k4kxq?=
 =?us-ascii?Q?9q6riVcHLyCkGgkU02EiHPM7jQXcZy8/gBOTFI47LuGbwgmTgZH6HEX6/D2S?=
 =?us-ascii?Q?y5/B9aDoxay4+lQ3s+Rm0BFF7J2UUd4mck8awniFwgsQfc4jDReyf6ttam9h?=
 =?us-ascii?Q?W2l9dZQWSCyq3lq29+PQ9JSlNz9o0xjntbBU4FMBvLDJe8UgIq+68fz04JOK?=
 =?us-ascii?Q?tJUlTrub8PLBL1N18KHNi/jnCZHKJ+gwb3caCLXI1fZyouSpYRAs4YG2K4SA?=
 =?us-ascii?Q?rTWrjpQdjvBFmmbuF0J1WkVl66lsq6wybFE/88ynv0N3z+ylZrd0si4NVJta?=
 =?us-ascii?Q?Jkf1i5QbbUZ4GyiFxoXDF8pJzQVylQwH1u5gnTefmHoEHdp6ewfDhX7WwDsd?=
 =?us-ascii?Q?5UDrVbJq6XgTg6IWL42N5HeQRjbI/eOEKBjtrMj/fZkvcpOLIA/wk7Ff6qsR?=
 =?us-ascii?Q?BeOdUUN2WcIqDSHt/WycuWWNuwcoW0+6xR0fD2yVPsNYu5kHKlTNdxUUJ7fV?=
 =?us-ascii?Q?WLLAVZEwDhWEEupcjUIZHzLLSwS0a1BRhXa5/P+Ruv71YKN5uOe1GF9jgauk?=
 =?us-ascii?Q?l2t0ivnTiz05ddYRZ9Sf7+uEA3mjRDYUhVcTKGnCYJTGPbP4H74Pv5IrzrgI?=
 =?us-ascii?Q?ZuZjmtA2FszA5iffBEZFNTfWuwWFLIzN/aZrNggEuhawmrMOygK1necMqqSx?=
 =?us-ascii?Q?1fKjgW+Eq2MGmOueYjnmS8ulcz2Wma4ArzdoNSHzficvAbrnYMphCm6KbSDk?=
 =?us-ascii?Q?fNixCgVy8Y67s5Hso3PuLJEKbeiIOm0pfOsQJyQDry7XrSDk/RNtRD2C1oOU?=
 =?us-ascii?Q?PWseHqbTS0hdSpSKf8pX+iMd37169Ce1oOp3Ehbyz7r8cNMxNg9IZOUAfsI3?=
 =?us-ascii?Q?FSdDxtNRl/5pvFNYaZVLuGX0I7Zzze5o4TYGgfc7bYp4Hr+dGiRnpbL5WaLi?=
 =?us-ascii?Q?wCNV1KZuO7zsY36I76XmLynw5sKadKCkIh9V7ltabDXxJ3OZ9dpaLFUCCzq3?=
 =?us-ascii?Q?rAlaPg2oHXts8DVMAc0rA5ekZFUSUJ8FRakRCcAJ8H1pt/mr52QwRKxK0t6J?=
 =?us-ascii?Q?w6tBrr9m46Oz0kv4SCQSlE3CyaLMtzuFueyN4qGTBWgGrSDVcXQ/sZak/+fa?=
 =?us-ascii?Q?gTUfLcjWFywKnjTP9FfzDUhuP4YwIq/AbXNvAtekYCiAxV871STieP+Ui6Nx?=
 =?us-ascii?Q?0bwzOxcvGtuj7gewEjG9PyrU0GaKdYv5Dg6qXwggewmfcGKXl+K5+eNE6sAU?=
 =?us-ascii?Q?EP7psvf4wOxeaqshvnN4M7yu?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: da2b43fd-caf5-4077-997d-08d8f89de4ec
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB4948.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Apr 2021 01:47:10.9111 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: H8AEVtrcRIlBd/nqko8ETAOfVfKp5dooTZptmS088WFD92o0U1ltTJfpilJQNdX44ksb+I2YTuuq5/XSkUwaLQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4159
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
index da2ca264753c..06238194a06c 100644
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
@@ -1396,6 +1402,9 @@ static int svm_range_validate_and_map(struct mm_struct *mm,
 unreserve_out:
 	svm_range_unreserve_bos(&ctx);
 
+	if (!r)
+		prange->validate_timestamp = ktime_to_us(ktime_get());
+
 	return r;
 }
 
@@ -2135,6 +2144,7 @@ svm_range_restore_pages(struct amdgpu_device *adev, unsigned int pasid,
 	struct svm_range_list *svms;
 	struct svm_range *prange;
 	struct kfd_process *p;
+	uint64_t timestamp;
 	int32_t best_loc, gpuidx;
 	int r = 0;
 
@@ -2170,6 +2180,13 @@ svm_range_restore_pages(struct amdgpu_device *adev, unsigned int pasid,
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
