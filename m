Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 527FC2EC8BE
	for <lists+dri-devel@lfdr.de>; Thu,  7 Jan 2021 04:04:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 97D4C6E448;
	Thu,  7 Jan 2021 03:03:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2065.outbound.protection.outlook.com [40.107.236.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA1EE6E430;
 Thu,  7 Jan 2021 03:03:04 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iKb2nX/y4agKCw4Qa4DiMuDNeoVLK5y/XL8qGvz3K8p6BPEUJg4LxP3tegA5u2N4fGA1htR7RkqZLDguMXzaQ0kEcxHFc/l7odVa3XIVdDiKubmEM/ng3OIQ8TGUUPEMiUIlNZpeKdlqN6rD+KQcSa7mimDTUYnR6ixhEmYQG4veD/DRr/nqh/5HvIITiiTNd4cyCyVaRKmJPb1V3UERQTbJ2gQ50EPA1O08M3gAZkOGr9ERP0WcnbEIFAh9xwavxN2oxw8N/PqhVAZkt5YMaPP7LTGIKhEKcL4LgS2bZP7FS6yTR1RoBhEdaL9RGfQ/xZZmhho5ona5vfmkybjlGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Y/HAlPdUW2Rf6mv7sQZjEM7Y3muC4WDSUOt90K1nNpw=;
 b=PzzyDpKTtSqf3S1iuZmQKNHJ1F5GNfZ4jpX+vICuIt93jgyq2RrTEE9FFd/3Bjq/7/2hs+PAEVgnlJ7IiJFsVsVzvhcIetUgjGHcUIvgNw3uVTijqE0uabmgY/jnNR7cmcx8vPpggPzZYG/XR6jXyONaT3EFRFytpPiWS3oeMDx8W6ewawjme1ISAboNmS6e9ZqXHdU7amQGLV/lJWwGji5z+PQ9ZU+7sMPT+bLh52Pm58LuzzNUge7McOpVrtU8/DziVhZJ4a9ShgUPSeQieVzBQ/YwGvyMH13hWOPTUTetXcFHqRKJuEsZfG/iAvsngb6WWAoV0XOUJUK8KZGy4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Y/HAlPdUW2Rf6mv7sQZjEM7Y3muC4WDSUOt90K1nNpw=;
 b=2dkVj2pCQXVzPbJflAWEz7v3sn4wBQP4+PytCz5GQRsvvKA2UJ4bHnalAd2sfKFWFoFhXxDsRJYPbyiFZaFWgSfEQQj6c8+YDuo4O1m8LjdDr9jdeiTaTX1UtibQ6vaVnttwGSDUJzkclhmV0SjoqlggK0t9odX1UXwN8Ng+tuw=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from BL0PR12MB4948.namprd12.prod.outlook.com (2603:10b6:208:1cc::20)
 by MN2PR12MB4408.namprd12.prod.outlook.com (2603:10b6:208:26c::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3742.6; Thu, 7 Jan
 2021 03:03:03 +0000
Received: from BL0PR12MB4948.namprd12.prod.outlook.com
 ([fe80::9425:559:83c0:991b]) by BL0PR12MB4948.namprd12.prod.outlook.com
 ([fe80::9425:559:83c0:991b%9]) with mapi id 15.20.3742.006; Thu, 7 Jan 2021
 03:03:02 +0000
From: Felix Kuehling <Felix.Kuehling@amd.com>
To: amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 25/35] drm/amdkfd: SVM API call to restore page tables
Date: Wed,  6 Jan 2021 22:01:17 -0500
Message-Id: <20210107030127.20393-26-Felix.Kuehling@amd.com>
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
 15.20.3742.6 via Frontend Transport; Thu, 7 Jan 2021 03:03:02 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 428d40e6-a4a3-47bb-df20-08d8b2b8bf86
X-MS-TrafficTypeDiagnostic: MN2PR12MB4408:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MN2PR12MB44086C789E2AF3C05204ED9392AF0@MN2PR12MB4408.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:569;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: rcYis5sqH9wq4PCa2AZbBftcAlbLZe5GLtNmiACBRB1kXRew2vTH0or3x+ZsmN4RhyJSboXzDd3y70KNRuC0et3wWBC4o7hdEMZiwMdJLziDFW0cA3Ci376GEaY3LIkKFA2t+FChMJYTOnmtBAdSqFAP9g6XtL6tGxj/W9SNEtH839wOgjPx2puT3kpm1BPEo8+POVcu/f3TLvVbbxpBxdHsrvZDRLR8vpjb2r5Tor0O8Vkm/ymOg7f5eSkCllOm5oUtYOdlN3cLs8GwBiVm2Xy8ZxY6gxsZ+RD1HxCg8gZYyc/pQkw/JBnkTIsBfHVB15r0x9keZp7fXd+aqUYg8LQZdHZV2iilCKvj6hFzeePSmLPL5fVqz29+q8JHtZGAHvxKblf7hg4IIKspDeM51g==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR12MB4948.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(136003)(346002)(366004)(396003)(376002)(8676002)(2906002)(86362001)(450100002)(66556008)(4326008)(66476007)(8936002)(5660300002)(66946007)(1076003)(6486002)(83380400001)(52116002)(316002)(7696005)(2616005)(36756003)(16526019)(956004)(478600001)(26005)(6666004)(186003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?Cx484TGHjHbEKFXrlPNt5elNOjk79k8gmMU6DuCoRHuCHCw2EFw0JzIlHB7y?=
 =?us-ascii?Q?thXsSjloVF5xUzMdIno9TE35EZoMQ/v3QvtShZ4afOUQSzvM0+5CfzK5LxGJ?=
 =?us-ascii?Q?w8ma/QT+Ix7BzZmuzY4dV07SxX3L5nFsknxBPKidfnK15mL0iZjgVAKPLLMQ?=
 =?us-ascii?Q?G3MUAVesl7zkGTbEQNd1922mi4MM0lNmhVzkDFFvv7Cm3j1EJ2cZ3rnzHq4I?=
 =?us-ascii?Q?8nW9RV8U9y8/K2tgJ4aBr+oeI+/hN30ByUG6z3ydIOXC42ohfd0CmnNYbWEn?=
 =?us-ascii?Q?Pgm7UcCTOW2hDx8Gg6me5taDPcWvUG4Vj/ma3QFt3W7QEvDp1VFwRCoD36pX?=
 =?us-ascii?Q?/Q/nmoMhxZFW9A4VM76EiLehsDn5rP945gKEj8tI52itrIMQJwKgHA/tbBvk?=
 =?us-ascii?Q?q5jzWIsp1SYGiOgZrDwNfkBLtYzK+sIMuDajD/cQ234LBNcwq+hXNYdIiLHd?=
 =?us-ascii?Q?eCBV7bvsZDDQTi6h3r8CS1RPMc169XQQ0QyjYsaCUeD/PhiRDtvFWQd8n0Ku?=
 =?us-ascii?Q?MiA/h6SxDfA6IoOodExXOhQy0C3/uAAqYswVvmZZcg5tJ+4WkebHZzCUYrc8?=
 =?us-ascii?Q?jUoOSdNd79e+MecmBPYxRpKBFbNIMHzzg2M0J1OOW/B4+fFd9HNrGtdoBJQz?=
 =?us-ascii?Q?8V/q9eiTDP29zgInpnl7NlPUgui5Nu6Je8Q/8Iq0g8DYlkzGQeCycFIqTTpA?=
 =?us-ascii?Q?EEXIi+VtuJs05+JKMe+HsOhwvcHwK2mSzpYPZgvKly0e2I3bNwq7GIPH3tI2?=
 =?us-ascii?Q?Z2wHRqbURVceW2is7esEe+VW6VoGRt/bsQ2X/+aiGHdlKhI3dkRUrp4axaEZ?=
 =?us-ascii?Q?6cdHYk/rPYoHZaGnyslV17aWrUaKTyAZvf4Qs9rtdhij1PMgN7Gu07CpePP5?=
 =?us-ascii?Q?f2pBq1LcuMvANJOmALtxY2Y/UfRdzskwQS+ZdDqvd2Y5kgEGKuIBWaUtal5v?=
 =?us-ascii?Q?zn9LGmq05oeDSkDIInnf/tnDhpJLVzlfq5KASTgnFuyNEYTPAbfxULTLTg4x?=
 =?us-ascii?Q?D0kS?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB4948.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jan 2021 03:03:02.8714 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-Network-Message-Id: 428d40e6-a4a3-47bb-df20-08d8b2b8bf86
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zCRYBd5ptfWn+5Kmeo6jYkHt02wKDQFFlA/MB0Cinxl13OBYbgmiTxGDpbUGkq2ebNvC+S6MjAgKA0NcPbxYNg==
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
Cc: alex.sierra@amd.com, philip.yang@amd.com
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
index 9c557e8bf0e5..abdd4e7b4c3b 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
@@ -37,6 +37,7 @@
 #include "amdgpu_gmc.h"
 #include "amdgpu_xgmi.h"
 #include "amdgpu_dma_buf.h"
+#include "kfd_svm.h"
 
 /**
  * DOC: GPUVM
@@ -3301,18 +3302,29 @@ bool amdgpu_vm_handle_fault(struct amdgpu_device *adev, unsigned int pasid,
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
@@ -3326,18 +3338,16 @@ bool amdgpu_vm_handle_fault(struct amdgpu_device *adev, unsigned int pasid,
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
2.29.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
