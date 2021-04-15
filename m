Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BE4B35FF67
	for <lists+dri-devel@lfdr.de>; Thu, 15 Apr 2021 03:25:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DBE316E9C8;
	Thu, 15 Apr 2021 01:24:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2087.outbound.protection.outlook.com [40.107.93.87])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B00986E9A8;
 Thu, 15 Apr 2021 01:24:07 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CxkwD+mBBQFkCzM8rtAtzCs0MtFbp63ZhXlhqf8dgGIO3A+KLueir8x0QH37kLTqpioMtxkjVdoo91GOUnHWFD0OApc4o8QL3K7jKspGSE6+H7IDQFvFnSfl4SXDpaSmfztifVKWzHqGAB3PtQ8uq6nMCBL79nCH0TuKaYUJHZnjwiVP94yt7xQfTOl9eNwjofgLgGQgtEX8NecowSPkTDhQT2rVao6HEllbGYLt3ehIP3+ztip0yj5O/BFr1mi4CKcaJLjMkyM02qSpmonVyYxOJDwjLbYeNt8ScxvE57OwBtryKDRslcD4ETP9AGldHEwamGKVHUNMY0mZATGtBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pa8a0YbFwyx7jlndfPZxRkVTxnk5yNkcnvVpbb01vNM=;
 b=durPP3Srm5D8sz3QhNKlfI33GUuvLDtnpxxa9KinHuZkp2RaHOlp02xx6kOZsae0Jrfte6+R6ouY2P/NtNQ8P+aSAt8nTrlYzriATa5TP3/hUALuG2e9cCsjrgyDhIetoB4cr7pc/v0Tt3Df/Ql0YtX6ZKG3cGPdTIXT2tWWb/V8KdMWyc/78rcEjjI/sMrfXDIrI1tW5IRi2XpkcJJt5hy4JF8bMjE0cnL6zUtBa2dOp71k9nIpaCECADw9my6A02pgebHi+a3sovDQOoPcjmyxrMfwvDjp7tRuK88arNxQW91gPkb0FTn2lOUUhqPfEqGn7elC++6oppRKCfbh5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pa8a0YbFwyx7jlndfPZxRkVTxnk5yNkcnvVpbb01vNM=;
 b=a1NtPp9N697fM2A8uhUJ0zS+NJ1Yf/+qANLch24rthpeTqYDJZlrgX+7u9NNW8x28xn9XkhUzgkp2nxvzGXD7hmBKyC90gs4eG9q8HNtIVuxrHIOHANi/5Brtw9zZc5vrB9ZYhOVuZheNIwttji1Do52PnVJxYNyXt4w5hLgRg0=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from BL0PR12MB4948.namprd12.prod.outlook.com (2603:10b6:208:1cc::20)
 by MN2PR12MB4208.namprd12.prod.outlook.com (2603:10b6:208:1d0::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4042.16; Thu, 15 Apr
 2021 01:24:07 +0000
Received: from BL0PR12MB4948.namprd12.prod.outlook.com
 ([fe80::70f5:99ed:65a1:c033]) by BL0PR12MB4948.namprd12.prod.outlook.com
 ([fe80::70f5:99ed:65a1:c033%7]) with mapi id 15.20.3933.040; Thu, 15 Apr 2021
 01:24:07 +0000
From: Felix Kuehling <Felix.Kuehling@amd.com>
To: amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 24/34] drm/amdkfd: SVM API call to restore page tables
Date: Wed, 14 Apr 2021 21:23:27 -0400
Message-Id: <20210415012337.1755-25-Felix.Kuehling@amd.com>
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
 Transport; Thu, 15 Apr 2021 01:24:06 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e4b8647e-d40f-4da9-c79c-08d8ffad2964
X-MS-TrafficTypeDiagnostic: MN2PR12MB4208:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MN2PR12MB420825D41670089E268E93C0924D9@MN2PR12MB4208.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:569;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: TW6u9d1ZHqBOrGYj+IWKHoCLzlS4SYfCAIQz/RMP5sZQUJRu3BLJhfOOmAntoDJS6HwJhY4XrGeTWXA6iiX2Yqx/lBhFCUT8t4bsKhG6CGHXLg2wd0SOfPdu4xmKd5cOCmjRXfHfdaOQ15BJc3CBQ/cXUwr+y8rzu7enWLG5ZJgBUquE4bkduQhCxADTSUjxmJSUEgfxvMbLGk0Ta19W28d7ufXdLe2iVsWRmj5toNyBsdTrl0kvHVT+dZJrrfgNmPmsMPCcT3srOUEqYZMTkdVpJfeTLnHjliCulvD4cjU2onAZNiRQATQD1f/MO7KN8s5bmuFFiiIwuZ/A6NczWqwMiKM/saj79QcYRhjY0i11jdLaU09KHVfXTj11ihV4NOPB7b3CHa20AAPb4ZSFaX7BdVhdlKBwQi00e1RsosYTVlHaPZOXgQPunmpMWaIM31wAFnRW2E8HU1dbwYnFYE8IZKJ47o2ul8HeNFC851pZUtfubalkQzT7b+fcOY86iHySnQncuaK+KUOF85XEHYKw1KfMT4Gulnz8Uz1RKSfsRDeW7gS4pL8j2aHn7n+TQzQV0xemNs9FwhZ3uVULqp/u4A7G+RyD0MrWGfD9QyaWbwEGvhNJVGU/Fe1EvehA6XbIbA05Lnuwr1VmNxlEnXNWHbExmsBOu4gahutllws=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR12MB4948.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(39860400002)(376002)(136003)(396003)(346002)(2906002)(8936002)(83380400001)(66556008)(8676002)(66946007)(38100700002)(186003)(86362001)(6666004)(2616005)(956004)(38350700002)(5660300002)(66476007)(7696005)(6486002)(52116002)(16526019)(36756003)(450100002)(478600001)(4326008)(1076003)(316002)(26005);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?Ang/jlVG/Bea6JnI6wy/SMYCFz2tNnrF7rOUquQmkYuy3IS70r/3g1f30e6E?=
 =?us-ascii?Q?ua3PsiqBjEmGg613AkNb7GIATt1lj2MlqEAKfOZP69nWCU38j0fBYKbTLetT?=
 =?us-ascii?Q?uT6KWgzELhTSZ80c477rxnzIYgoxNMVJSW3xk59yUNCBnfGBFoj6AsbhThto?=
 =?us-ascii?Q?SbHj9y4D67rwHXOnfHcR/zTi8PA8YKeUpXz6oyDKyGPHpf+xvoT0M6rm4tGk?=
 =?us-ascii?Q?byHHRjFjmc9KUA6HoNFqx/xqydPo1FO97djzyOHtR10jGw3CZHRQP3fzB5FW?=
 =?us-ascii?Q?3XTnO6pJDpqbaza4le4gWxYW6XYRzCKTHmVIRPPCkm4cZ7QH37yXnw6ARnhS?=
 =?us-ascii?Q?wbaB2Dc6n8PzqaPolkrIsAXbOHp+CvIpNZKZogtRakqYM8CJqlEYGm6BKDRE?=
 =?us-ascii?Q?X9CX2xfByER4EKD22wvFBIM92yo3h6adTnyx0koiTCECDksBMbuxArMrjmjV?=
 =?us-ascii?Q?KXzfLxOWEAf03oq3HwAtrTi6gSk49s/b2imAiQ5f6TynMrs00Vcwzhu61zqV?=
 =?us-ascii?Q?cqkbBtFNgr/0cdV4AqWwpQA8XB0ytJzCz3ElBqoTfQtdBWIupSLtpZ9XP01I?=
 =?us-ascii?Q?hb7/4usZoh5j+yjeoFQC3/BXX6hvofvvoU+OCBzB30vX6RY7nA3jq1aDh1UO?=
 =?us-ascii?Q?czRjjQliUIcYfihCHB/vf5oCYHkh8+tdQgg+h9FgsyivB+3in68igGM00rZA?=
 =?us-ascii?Q?MAa2X/mJA11UL6ef5UzCQRfr6peJ8oA5vur7DnO0Mi6cKUnxIQ5VxGiHNpnF?=
 =?us-ascii?Q?sygyWJSqaw6F+E89YPYcOsDRZBgaoJUIO96C1RGjTf83krOnBBE0c9v6axQ+?=
 =?us-ascii?Q?7edQK4bydYHg2rp3NbzHySRRMejBOYdlKcLStiLnYxX9vsMY2TKlXMZzoClz?=
 =?us-ascii?Q?YqxYKj1kzbxGXoS83nuzhT7KZAbRMjCRf67jToRyjk4xCUugqKFVOLeBwD1s?=
 =?us-ascii?Q?AEyGN4YeRrdMwRkY2HW2ZTQbVY57Co80d6YVFPKe3FIjJlO8J7mN1n1tRVPa?=
 =?us-ascii?Q?pdjkcRw4y703IcJeBxU1ABWJD3WE3BglboocwOLVsqsH3RAY0QeCu8hjJcor?=
 =?us-ascii?Q?1zbanmwqUX7LCs8Ub1R6F4cy7s7fg2GemaHkhxIjvupkmac74Atx4kOEjKNG?=
 =?us-ascii?Q?alAEnTsdJB8QsEXSgy+7nv4aduIWUFfdjLFS3gvaOLPVOHd1ji67p/iXCsz0?=
 =?us-ascii?Q?ALJ4LKHtn41LF16aPOQmeJhtYoYgvDMt+Z6orGqx/ba9toq/E1KI3vibEdnx?=
 =?us-ascii?Q?VEvcctTIp7VJ7TQyMIk+TKqyOqLZRoEQuT4nk87tfLbadrjMKaj6JlJDJI8u?=
 =?us-ascii?Q?dl1nYMTht7+qGC4RXPRpEJHz?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e4b8647e-d40f-4da9-c79c-08d8ffad2964
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB4948.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Apr 2021 01:24:06.3453 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eyv/W3WQvBFfY5Z62jV2kN+ejOcKEcNwp4zk0aM72Meb9hENSHtAOLQhHmrvje1OOiS7ohH00uPAk60/8Knqog==
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
