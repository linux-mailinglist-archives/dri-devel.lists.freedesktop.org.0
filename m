Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3023D343F08
	for <lists+dri-devel@lfdr.de>; Mon, 22 Mar 2021 12:08:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C65AF89FCE;
	Mon, 22 Mar 2021 11:07:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2067.outbound.protection.outlook.com [40.107.243.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC8806E084;
 Mon, 22 Mar 2021 11:07:50 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PVGZ5uIo2P+q/DNavGuUHMWA5lHd6vvXLnFATzC+R27JDCWM5eEHjsTJ9gzpvGPibxN3XGfzJjhwsZMxe86quK8mj8K8zzCWCkU9nJHlfSfM/A7AmVfxjh36HyS1TKZmxc/gAGlIGRDKIFjJTtFJiZPRC0IxDzo7QkHqK36oNVEchtNI5ctzfcPCV0Sjyu3yF2exsNtOMMClx4HtS5R5iOY6fHb72BWry1w4Sdv2aYJG+5pUE4qfNpNw73JH6aYk6tUbjybcnXrIxcvSO5DJnhAIZnewIhtW0HSP/5OGvLWwL4snwMGxbBQrs2hyyk5HNNeXPw2a54ZK8/RRSIj9ow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=v0X7YfFcFXT3XV07AP0ySRE68VyaQVsgS5LrGQaQzaA=;
 b=mDRC8QFMB2ilkBQ0t6cax4crXBooFKS4cM2/4XDR+oCvS9Sm4EG4aQM8PFkZUX9zctgQQI7phAHe8P+rnbxsfeXyr6nXKEa9tkG8N65Fk889alXndQmllpooTrvGA2s10pSyrk0CsC3Kvh6AL49UzLqdxZGIgIIauUT72Ut+Lfgl8x+Ey996NSpAgeVvibI8tKqBkPNSHWvM+LWbU4vYryPhYCEMrrmat3yGx+zOH6tiJcn7H6XMiLg8AB1yEizS6iVbvLftMG0ppg5eWG1JzloGT+GiBu377iX+8m6l5fsotAiBaOoSdTppMjUOIgFsjLoZVeIq4gS3IelR37u/mg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=v0X7YfFcFXT3XV07AP0ySRE68VyaQVsgS5LrGQaQzaA=;
 b=B7JQZsq+YirdvXjDHHXc4dKZD2QgYI/am/lZautcnQyAC4VtrjCx4kX9PkZdyp77RthacnVub/PbCqqwd0eg8sAu4DlXMBwQQqEfixVOdv/YWHtS6Cg5gge/4EE202nJs1sAvr5JQCS6Bi/1f+4iGXbRAbyjKgW+0tBG9TQJdoE=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from BL0PR12MB4948.namprd12.prod.outlook.com (2603:10b6:208:1cc::20)
 by BL0PR12MB4899.namprd12.prod.outlook.com (2603:10b6:208:1cf::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.18; Mon, 22 Mar
 2021 11:07:42 +0000
Received: from BL0PR12MB4948.namprd12.prod.outlook.com
 ([fe80::70f5:99ed:65a1:c033]) by BL0PR12MB4948.namprd12.prod.outlook.com
 ([fe80::70f5:99ed:65a1:c033%5]) with mapi id 15.20.3933.036; Mon, 22 Mar 2021
 11:07:42 +0000
From: Felix Kuehling <Felix.Kuehling@amd.com>
To: dri-devel@lists.freedesktop.org,
	amd-gfx@lists.freedesktop.org
Subject: [PATCH 23/44] drm/amdkfd: SVM API call to restore page tables
Date: Mon, 22 Mar 2021 06:58:39 -0400
Message-Id: <20210322105900.14068-24-Felix.Kuehling@amd.com>
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
 Transport; Mon, 22 Mar 2021 11:07:42 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 52deecea-80f1-4c41-69fd-08d8ed22b69f
X-MS-TrafficTypeDiagnostic: BL0PR12MB4899:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BL0PR12MB489925BD7AE18747B83E343B92659@BL0PR12MB4899.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:569;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 4k6A1gTuUjEcg+taAZYLSFjrC3oxd0QxFMwT27OQMREvINxriBtg5pAVdb6kkAP4OlchmJpnlmmGnnkiisWc4fNdIcuczQMyq/lyTJi2SUa56MeNXUSljZk/1drjrKUuGC/QMptOQRDHlg4NSINhCdFzZQLupThzgi86yKd9f1GWdCTERwVt2QtMymlJLL0w1Vui3Kws5iSAcfjtDYZ+vWdpDDJ0cFiiCknfwmnD9IPW5fyItb5Dukkq+yrL+N7pAJolyRle3wp+4MtRp94KAURnR8XmJROAz2xeBLKjkflYeiybYbjgGF8sUOEjta8lzn3vkQX1Mq6/ojQE/6aLUi6ktIAbUHvKlQvCh7xU8K0LZBRNaTSNnjGV9pM3ySsauLTPvvOgNl4pKX71mUuguEtGX+6M69cCWuXNtqGsO+hxLhpvFp7bB9olDRCJZm4C81TbhPU6gGnAwpeLtuHoaZKe/vG16QaDgOixbX+bW1KP+G+U6jQlFj8D7EgmffhVvVZJCH/TLJFd2p5YzuxSQxTHQyDm2378xe0aI7ZnmX7wLPNhCaJPjua/l8P78QNs45va5/NyLvTsvVn92VmOCb9KcY+TSPxKppp4jFjsbVnFecact1XVmLLkaLVKWCC3AWIJUqO6dh+HsxR+a48ec/RzcE1U93VQ6vMJIhoH/Bs=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR12MB4948.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(396003)(39860400002)(346002)(376002)(136003)(36756003)(83380400001)(66556008)(66476007)(186003)(66946007)(2616005)(8676002)(956004)(16526019)(86362001)(8936002)(26005)(478600001)(6486002)(5660300002)(4326008)(450100002)(316002)(2906002)(7696005)(1076003)(52116002)(38100700001)(6666004);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?09k1TyptuQatTBQE2RTJo4qr/65MckT3/MghfjimDVKilgYhbCBtZ+bxxkG4?=
 =?us-ascii?Q?avdv1l8cY39FZ+932tqQYUDpsi7EABLRqfB88TxSldX2dv2XwzkCUL1ZJ67G?=
 =?us-ascii?Q?evH8UQC5pMV7C0Mbo9Hu20avoPIV8D9/PrGr958W38x5UyFaqXC4ApfTYVcE?=
 =?us-ascii?Q?2kI74E6SFIl4ixyEE7qKgeSFFYUQjFHoeXA+ARJ0TPKL4OW6Sjl7qB6aHcB7?=
 =?us-ascii?Q?vTK6rYLBT8DAogQwwgFBmTJX5ZtFTqMKn+GaelNQxBX/T6eWJbupRXgfV8J3?=
 =?us-ascii?Q?r+P8DgXQPr8AF5Q4FOP7YRFLN9wlEGFQ0dh80ulGbn2dxtQrePwB1PZRUtHI?=
 =?us-ascii?Q?oaA56mADeinRj0BA8U3rO7N45OvPDlcCL4MqJzSHYnS2IsYInyegEWW2EgCv?=
 =?us-ascii?Q?fphXHjnlSufrcuVbsa+87D7TflqneXUZwgNVPzOrcdVX4KUSshe45NZbrUro?=
 =?us-ascii?Q?bgbkTDIJIZ4CQa7aSLx3olHq4IbSzytALCSgsJj7ItVv3CM3nR/yggWN8FXD?=
 =?us-ascii?Q?NufuT6mEXLavHrYPUBU88J5PjNeq/9T1Q9Oluj+zvDv7mfUGlFLbD9HMz0Ly?=
 =?us-ascii?Q?Jlypnmsvtp10AZRNMiaub6mYZbNjySbfwjonYMZJMdWH+IOswyhN3IMuLXMY?=
 =?us-ascii?Q?5iAyKoC6UCC0JEJSvJ1+i83DMmRmis7Fh7R6AFGp6+Iy58eckcp/hhrC0OXK?=
 =?us-ascii?Q?msMiugzxsQle46gi0s0zTJoRzz++Z+arrmmphyrSbiLzI+AOoSvnt1JRczxf?=
 =?us-ascii?Q?jQiHInba6UYGugxHgKJ2uIhqcjp8gw+SbpqXw5Ldkk0aT3vatfW68vrxrgYv?=
 =?us-ascii?Q?wHQvdC55qP60KIlJ4OCwnnOEt6n6o+g4wZUrus9tRIvE2oz+n8YFY/J67Jn9?=
 =?us-ascii?Q?4I1F/hj2OGLhsW6KgoR0thH931oqRmzFWuhRijWcgwgSjAeoR1eui/kKyDgD?=
 =?us-ascii?Q?ss+OBGVBPzj/HPF9Rg/0Pj2yC3nG593ok1WZISHsZcG2UcWaBvEZji81EAEh?=
 =?us-ascii?Q?/uVWlX7KqJN/XoC8DNUIcRPBzufykq4j69JXXCzYzsfZ4Pqyz2ncQFXx8C4n?=
 =?us-ascii?Q?MPNiEgpkV2/xbwnIouXMAG0FiHMI3j98GNP9jIEFUytsB71qnbA9xNVOrvYP?=
 =?us-ascii?Q?IDA3GLN0rBMMHz8J9RWjTFRlTl/K9IbunVME6NUlOuhTajK5tO/rwtp78DJL?=
 =?us-ascii?Q?t9rACrQ4l8sLG2t+cEyubUoz56cJg+qvLw9GfYPK0jVD+OLTfSvBK2msK+UI?=
 =?us-ascii?Q?UoOu6b7CnRvzHr3sx1WBbdWIKxaLVmTOFgXBWIKMqZwnRhumh2xcdIvnKba+?=
 =?us-ascii?Q?S0XSJQlj6WwIwVNNdY1aPTNI?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 52deecea-80f1-4c41-69fd-08d8ed22b69f
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB4948.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Mar 2021 11:07:42.3249 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JBbtCG8cpYVvuDlFAAPdBG7Zs1EKowhOflE0SpdCw0p7/dQv/kyga29fXSKYOVIOtDE0X0FXNb8uoYiPkilo3g==
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
Cc: Alex Sierra <alex.sierra@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Alex Sierra <alex.sierra@amd.com>

Use SVM API to restore page tables when retry fault and
compute context are enabled.

Signed-off-by: Alex Sierra <alex.sierra@amd.com>
Signed-off-by: Felix Kuehling <Felix.Kuehling@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c | 20 +++++++++++++++-----
 1 file changed, 15 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
index 0e9ae5f91c7c..a61df234f012 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
@@ -37,6 +37,7 @@
 #include "amdgpu_gmc.h"
 #include "amdgpu_xgmi.h"
 #include "amdgpu_dma_buf.h"
+#include "kfd_svm.h"
 
 /**
  * DOC: GPUVM
@@ -3302,18 +3303,29 @@ bool amdgpu_vm_handle_fault(struct amdgpu_device *adev, u32 pasid,
 	uint64_t value, flags;
 	struct amdgpu_vm *vm;
 	long r;
+	bool is_compute_context = false;
 
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
+	if (!amdgpu_noretry && is_compute_context &&
+		!svm_range_restore_pages(adev, pasid, addr)) {
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
2.31.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
