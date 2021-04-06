Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 194BB354A7D
	for <lists+dri-devel@lfdr.de>; Tue,  6 Apr 2021 03:47:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD69C6E1D6;
	Tue,  6 Apr 2021 01:47:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2049.outbound.protection.outlook.com [40.107.93.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C3376E2B6;
 Tue,  6 Apr 2021 01:47:09 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ePfu4jZdONefLUllfuLJqsaDdEDJl1L8yFKYT6udpqCXUORX/p6oKHfZWDjqNZtq7bFzLPpVdoGYkKJCqLRs+3fx4KcrDdK+mJTgnsMNz2hWf55CLsBM+41DCG6k5GudII4bUhrJO2X5GvHN52UipQYlONE2u7xjxsVx9p53KMh3IBLHCCAFkOLDEC4I3zH+ZlVH4AEHmOpOJbAAhlqvllus93J0q2S27QsJo25wPKK26GiQR91GUGqlnxmZ9JaKc0iOtJrnsLUjNN1lrUBHA2OP/zg1Nc58U4ugsY8+2fBRHU0Mohv+NWBDambY8tsgo0jimLmRRbZc3AXnGuD/iw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pa8a0YbFwyx7jlndfPZxRkVTxnk5yNkcnvVpbb01vNM=;
 b=Tp2IHl/CfAR6F4t57qOJiQydbE34oAa/a+atxfsCoAalScrxv2GjZfc57xdDZeytUtSyJUDEClDvZC/BPV2iyru+XateBw+llZZgkK/Vf4uFVqv82WaiQ8F8PHU0cKe5zyBNLXztqvxuceHWrRmCdufm2NMOR/63bpusIjkdl6CLGnjTHnWpwxsrFqlbcu5PLqzRTcsoQxaaIzwAotHebjraHDSvNPGspgrsuQ3PI/iNwT9jTkBjQpuflauvWjN2ca1QWoe7UpUlR3y6EifiMTMXVX5xqMWKiDnjd+VoYmSp6Xa57pppfMZf1IouBbr63X1fP8YHC96XCTh6Rw9DWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pa8a0YbFwyx7jlndfPZxRkVTxnk5yNkcnvVpbb01vNM=;
 b=ZFFPdAzultzrLQo/u2kf2I/Cyu2Z9D0zHqsaghVl1e3PQvvdQPEidIeEjwL/XS8wS13r701NqsU+DvAUzBbz5EpD0UWXf+jZ5OEJOguK/sc5ZW3V4TyEN13/obb2kj2JqUrQDkXBbV3ypS5qX4iU3lAV24EjaJ4TvFxSveqV1Cs=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from BL0PR12MB4948.namprd12.prod.outlook.com (2603:10b6:208:1cc::20)
 by MN2PR12MB4206.namprd12.prod.outlook.com (2603:10b6:208:1d5::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3999.26; Tue, 6 Apr
 2021 01:47:07 +0000
Received: from BL0PR12MB4948.namprd12.prod.outlook.com
 ([fe80::70f5:99ed:65a1:c033]) by BL0PR12MB4948.namprd12.prod.outlook.com
 ([fe80::70f5:99ed:65a1:c033%7]) with mapi id 15.20.3933.039; Tue, 6 Apr 2021
 01:47:07 +0000
From: Felix Kuehling <Felix.Kuehling@amd.com>
To: amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 24/34] drm/amdkfd: SVM API call to restore page tables
Date: Mon,  5 Apr 2021 21:46:19 -0400
Message-Id: <20210406014629.25141-25-Felix.Kuehling@amd.com>
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
 15.20.3999.32 via Frontend Transport; Tue, 6 Apr 2021 01:47:06 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: be0c35de-b2f6-4d8c-09e8-08d8f89de2c6
X-MS-TrafficTypeDiagnostic: MN2PR12MB4206:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MN2PR12MB4206928674C99BC37CCA217792769@MN2PR12MB4206.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:569;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: aQy8Xz6NBOl+MmhBBDoz9bW5B6RRzkHILwZ2tV2YQ1znLmTEsutP/UjA/6GTV55wFYsmvWMZw0rEl2gzHsjuiQfeTNZDzMU3ObDPIHzCTc+bgywZ1+O0U6IWXbmgjlY/fQdU4wVcgGSVYrBf9oeiT/aBQbfLzriFsxT/TyP+3aRuu023kBsskbVGG7KdLolryP26Eu+mNI9EDl2uMag0nwZr0b6Rw4DT4VLQuZoeX+FEAb0v6TyFu6XSOudjDh308MXW89EFVgstNhxgCRQKy3EB4BSbb7pEqHo+hjMwtCdhmwbVUGgtQPukd47gRKDatcfbyl5hNiEj+OMlkx/+7Lv68GvPpyqH4Mqv0ppir1s4fKh9uliPZX/f1LzlY4WNbFL8EFdabb+0ktnI4eyRPqITK5Afj9vPTiG2Guh5z6E44pY6YiMw5mXmdQDDrritfmebNwn6KwQ9XUIBdtzWAFnlP+NR/6NjPLAmizTaTJPDXjP28c4E3WIpb1AG1QEarrIxwIqcBHehxl6nrLP99wHX6fwLaZafmCPuN1Sc8Jymqs4qfQZx2LiiXJxpLWFvhXujgEEdzi4dF/twv8XpYV4IjuOXl8SipI0HxSAAUlB4zrqhtjN6fxj8xvrzP1LUAkyOhjr/IRaAFLtYhMN2Toxxf1cEzdfpkDIDaN6FsjjJgjuu1H4diES7QGb1tJOg
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR12MB4948.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(136003)(376002)(396003)(39860400002)(346002)(186003)(8936002)(6666004)(38100700001)(7696005)(52116002)(956004)(36756003)(2906002)(478600001)(316002)(6486002)(16526019)(26005)(1076003)(8676002)(66556008)(66476007)(86362001)(4326008)(5660300002)(66946007)(2616005)(83380400001)(450100002)(38350700001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?kpnQ6m1wEEI0rQ0iUqlAzl4c7Y4Rml9jW9e7bDBOAFXtZ5gRdUa0CzYkTOqt?=
 =?us-ascii?Q?bGf5oWONi4t1nFFo7hTZz6kZn9/dp3AIRf6vsSsnwnnJP61rd3idwu7GtEpS?=
 =?us-ascii?Q?hDny0oWDCebkFVq6EPNn0rSPS1FOpD7I6zcgUmcr4Qj9Evml6QPpdt5+lxvh?=
 =?us-ascii?Q?2nfEbkh/taCaGjGem1kjVZDKHXo8ActaWFn0VyCvofcJZlSbB4CUAhWutmWI?=
 =?us-ascii?Q?Jjkz+xz8qS5hr7Z234gWxflWhjsOldPQYCOVwmvJ7yngXAbI3D5bHYLjQm2+?=
 =?us-ascii?Q?dfDp94AKeECOY15HP+HsF/0ynelzgv6w0vpvmRlCh3kkNd82DVr/nmYXMzXU?=
 =?us-ascii?Q?o7hhI2DIXr2BYDg+HtqvdSOc5LoCPnmAKTEfi5lIsjScKGHPRASZCfiSwBjE?=
 =?us-ascii?Q?iCgpbs9C3/0owBfPS+j7nhpO7AkJOo6VhVgEOvYCYu2+/5/UYlvyYNu6PA4+?=
 =?us-ascii?Q?FLasHuUF0wd3kRNhkJRTaalz278uoJo+dVms44hwiqQ9PdJl6l5dqaINsCUc?=
 =?us-ascii?Q?HnRQlOGAPW+RGL1/lGUJYoGkYGwQTHrPaRlEQpUR5Xf3mAqt2S5jcdpHIwfO?=
 =?us-ascii?Q?8sHC4cIRCqWH/Ab/cPKklDGE7C1+T4pQHvfhF9x/4nm1bnyjwBvc8ForQViU?=
 =?us-ascii?Q?w1QEaix6guhi5OXpEOp+5HLapwiRnYXGOK/7NLVA5FeiPJk/HfOkeWfZtDch?=
 =?us-ascii?Q?ojL19eQlkfjtOihXNC39XrnwWkvhJyZjcjvpjKUjfRTp4BUpPMtPSncDYAiK?=
 =?us-ascii?Q?qbFSU4pZ04v7JzpLBBgbhTnbhPPRdtfObKCeA962zNXrcRqJ+WYCPYiOh7Ih?=
 =?us-ascii?Q?JsVE+dWnh6XxFiUXYVJ9NFEhHVWxdB1b53OnYOyAjux0EigX4MGjTvf0lIjL?=
 =?us-ascii?Q?J1D9Sh7Q1LL4RTxSow8AQoYcaEdEMyxiR9xlOa32VLsWh1/3hXXZ98xnjd5s?=
 =?us-ascii?Q?2y10nHsRZQ8sZ+7ic0wY+0NepvFs4HcAnp6Npd+mwUAiNxo/Yt/N5bpduEQX?=
 =?us-ascii?Q?5QOc/SnVNYzsFyvlUiDDwc0Itsyqyng/4cj6FUtSPw9Kah20WAiLRji/JRxJ?=
 =?us-ascii?Q?qYqSf7T30XQf8WaA+xZzC6+JtFj29Bj8dFnb6hma6uW77lBQgTXYjfWV+Da4?=
 =?us-ascii?Q?eCS3JVSsjJ49S8SckBMa4bro88j6mkQ+4S7ULHQMoP9ASdO+wB+KXGGV0Chj?=
 =?us-ascii?Q?O3IbY/CLMNI9o9SQ9MUvKf7FHUo06MVIzRmz8Jf98///qyH5jCsITYv3AR9Z?=
 =?us-ascii?Q?U7Eb0liUs4fOSXCYh60sINDSIjpPgs2v2/bzaID2FjOqoRLHqCYVNFTPTGIC?=
 =?us-ascii?Q?rSWSdPuQMvavnAIUBnZxZE6u?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: be0c35de-b2f6-4d8c-09e8-08d8f89de2c6
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB4948.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Apr 2021 01:47:07.2950 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5ZwAOfmnQh0M/jhCDb8FwkPuKG+O75440Y/V1MOT3IggfbuXXHKF5JxQOd1hloHmiQZm/GPLyYjpZe7rObF6+Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4206
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
Cc: Alex Sierra <alex.sierra@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Alex Sierra <alex.sierra@amd.com>

Use SVM API to restore page tables when retry fault and
compute context are enabled.

Signed-off-by: Alex Sierra <alex.sierra@amd.com>
Reviewed-by: Felix Kuehling <Felix.Kuehling@amd.com>
Signed-off-by: Felix Kuehling <Felix.Kuehling@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c | 20 +++++++++++++++-----
 1 file changed, 15 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
index f06de6dd7f16..f95bcda8463f 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
@@ -37,6 +37,7 @@
 #include "amdgpu_gmc.h"
 #include "amdgpu_xgmi.h"
 #include "amdgpu_dma_buf.h"
+#include "kfd_svm.h"
 
 /**
  * DOC: GPUVM
@@ -3298,6 +3299,7 @@ void amdgpu_vm_set_task_info(struct amdgpu_vm *vm)
 bool amdgpu_vm_handle_fault(struct amdgpu_device *adev, u32 pasid,
 			    uint64_t addr)
 {
+	bool is_compute_context = false;
 	struct amdgpu_bo *root;
 	uint64_t value, flags;
 	struct amdgpu_vm *vm;
@@ -3305,15 +3307,25 @@ bool amdgpu_vm_handle_fault(struct amdgpu_device *adev, u32 pasid,
 
 	spin_lock(&adev->vm_manager.pasid_lock);
 	vm = idr_find(&adev->vm_manager.pasid_idr, pasid);
-	if (vm)
+	if (vm) {
 		root = amdgpu_bo_ref(vm->root.base.bo);
-	else
+		is_compute_context = vm->is_compute_context;
+	} else {
 		root = NULL;
+	}
 	spin_unlock(&adev->vm_manager.pasid_lock);
 
 	if (!root)
 		return false;
 
+	addr /= AMDGPU_GPU_PAGE_SIZE;
+
+	if (is_compute_context &&
+	    !svm_range_restore_pages(adev, pasid, addr)) {
+		amdgpu_bo_unref(&root);
+		return true;
+	}
+
 	r = amdgpu_bo_reserve(root, true);
 	if (r)
 		goto error_unref;
@@ -3327,18 +3339,16 @@ bool amdgpu_vm_handle_fault(struct amdgpu_device *adev, u32 pasid,
 	if (!vm)
 		goto error_unlock;
 
-	addr /= AMDGPU_GPU_PAGE_SIZE;
 	flags = AMDGPU_PTE_VALID | AMDGPU_PTE_SNOOPED |
 		AMDGPU_PTE_SYSTEM;
 
-	if (vm->is_compute_context) {
+	if (is_compute_context) {
 		/* Intentionally setting invalid PTE flag
 		 * combination to force a no-retry-fault
 		 */
 		flags = AMDGPU_PTE_EXECUTABLE | AMDGPU_PDE_PTE |
 			AMDGPU_PTE_TF;
 		value = 0;
-
 	} else if (amdgpu_vm_fault_stop == AMDGPU_VM_FAULT_STOP_NEVER) {
 		/* Redirect the access to the dummy page */
 		value = adev->dummy_page_addr;
-- 
2.31.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
