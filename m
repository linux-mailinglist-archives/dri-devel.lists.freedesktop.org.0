Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D3FF52EC8C6
	for <lists+dri-devel@lfdr.de>; Thu,  7 Jan 2021 04:04:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 40DC96E428;
	Thu,  7 Jan 2021 03:03:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2073.outbound.protection.outlook.com [40.107.236.73])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 578C76E3E3;
 Thu,  7 Jan 2021 03:03:37 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lMYt6veoHnUKvBdRblqDzNBWQRdpIJPAOrlDIRNOXC5xQd53ATFnoeUz7HKJ7sbs9c6le6rKxaGpQ9yFm35io7xJ9bPB8EDOc9iYZAcLGF74jUIMkPEbepkUZh1bTDHs57UMpoEC6yBTbvTqHUcJwgxATJEnZxn7DzMQIpncg0UYyK4TY66gTVMWW7AUjx1tf4DpVIKkFsXHafe9ChSsW0KenYnQmI7n1VsWkZLOxV9brWeJ1qGgMy1f0A9x5XSuLXsIfxVGXqKLN44xmDVM6cuQMeyIr0WbtnhSiCQeV3qVXVtxj/CKXHas5Uv3IDzPRVPRR8F/rJTuZpSCSRYH9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uuiazCUO1hOo4reSR2GSOlmbRjsQXu6KgIJFEQvfThU=;
 b=KwzaA8Nufaa7jxddIkIdc9PfeJ3ldqjUjR7yC+fmeRyZ5rKESsRQeX4Z20P5fjfCXHSMTuOcGyVMNjqukdPyLynzpNFoB8N2ptMj7uknea/Iik818il1B/lfocNcFQKPTrqlVPJZbDKKJN+Ev3hiS/EFSdFA7p00PeN9mVXE6nDX+fmsnkurs6qv8aiflWIWWHBOkPf8YrQTBA4764QcBpA8u+MdzoyRimdHL7ON0APQ7FfVkghm3c6VbS5L2gqlV226PWyYU47o5L2ExM0vmp8hgkHbsCVrf4euDPCVQYodO2KqOP126+E839zoolb1aABZVLIZkfORAuRPpHMKuQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uuiazCUO1hOo4reSR2GSOlmbRjsQXu6KgIJFEQvfThU=;
 b=jQZDrXjQJiXnSmu8bZyUJduVOqG4Uh8Yvz8LHs388FGg5FTwDqZZhBsr/zqstX4MwvI8YTGgbyQ8slEHfjV/aohkBg46RsOPYHRb6kVn7AhtnAIn4/8RVU5l5J+pmkbIwa497D7d2m8kjx36bZWg1ccmLk9i38UKaX42/s8aCLg=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from BL0PR12MB4948.namprd12.prod.outlook.com (2603:10b6:208:1cc::20)
 by MN2PR12MB4408.namprd12.prod.outlook.com (2603:10b6:208:26c::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3742.6; Thu, 7 Jan
 2021 03:03:36 +0000
Received: from BL0PR12MB4948.namprd12.prod.outlook.com
 ([fe80::9425:559:83c0:991b]) by BL0PR12MB4948.namprd12.prod.outlook.com
 ([fe80::9425:559:83c0:991b%9]) with mapi id 15.20.3742.006; Thu, 7 Jan 2021
 03:03:36 +0000
From: Felix Kuehling <Felix.Kuehling@amd.com>
To: amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 31/35] drm/amdgpu: reserve fence slot to update page table
Date: Wed,  6 Jan 2021 22:01:23 -0500
Message-Id: <20210107030127.20393-32-Felix.Kuehling@amd.com>
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
 15.20.3742.6 via Frontend Transport; Thu, 7 Jan 2021 03:03:05 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 5256b76e-4cc0-4208-8822-08d8b2b8d34e
X-MS-TrafficTypeDiagnostic: MN2PR12MB4408:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MN2PR12MB4408A2D1AD1C922E465A1A9492AF0@MN2PR12MB4408.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:126;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: fOEgEFp3gsudx4KtN0bgkZfVb4VBJ+nrNP3faA1RdOMtwxn2VszNnlCzlxciFYCugfGxn0cCxzF+6nuS6UlvbhHH03uEzX0a0V8N8qvaIGaA2HI8id0bmvW0RKvu0qu+jeQXObiF5VfgtpoeMlzp785/pVG7LudT28joneO2xoHrJS2pUfqQQizB/0ZA1WVwLQGBY93gTPJ71TqrVIT5PULdBmV6+ZUXnQzUWh1W3X8hr1M9yJ3Yta2R+3vmzFFXTJTNC0sscVdBNxZjVvrENDtq/8pPQSKjo4uNMqw9UtGLusgG0P6vtyHljYuIzsdndR9vP0RIOb/o+ayC8KOA8qNeApHkqdZwzcdLfsCmErqBqGUPqudUiNpAJOri8nHyATYG6KslB7YpNYn2yTfjPw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR12MB4948.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(136003)(346002)(366004)(396003)(376002)(8676002)(2906002)(86362001)(450100002)(66556008)(4326008)(66476007)(8936002)(5660300002)(66946007)(1076003)(6486002)(83380400001)(52116002)(316002)(7696005)(2616005)(36756003)(16526019)(956004)(15650500001)(478600001)(26005)(6666004)(186003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?wXfgBTvhLZev7Y/+12Mkrvx/3rK+/XN701YWwjDVU294NYhjKQhdShRfJdzc?=
 =?us-ascii?Q?oz2de99qyiCPbQPVg7oJhJz7SRN2B47sZheIjwnlebOkkH/PXZW8r5YeFvUn?=
 =?us-ascii?Q?Ey9WsLiEcLJeGp0Jzp6+M0cOHeOQbndsK97N72yupetyD5adP7ddCkOWExLC?=
 =?us-ascii?Q?d52BVHG4B8c8Pv3YrPpKuss0qv/sjZJTZXZPQLsonx62prxWfbqMfRnIKqBr?=
 =?us-ascii?Q?n5wPMbkhyFjkPJpJS9UNRmnGblwBQcHoFM9I28D2Uvrhw7rTDFAaxLUCKo83?=
 =?us-ascii?Q?gj8qO+cfoXH9UYKl5jLEi79y03wYRIsbJL5fn2cjnO9hjuDc0Bon/+NJGSjZ?=
 =?us-ascii?Q?pRgiX5w/IawlO0ySXHoCO7x3jOMjtA6Cc9Jntoe7ZP/i1QvZyjGZqWX3NpW3?=
 =?us-ascii?Q?bnYcTaht88NIuUIROBC14rVKSMxFAnwLeO+aab3vN9k8+QGBlmytK6LuLDsl?=
 =?us-ascii?Q?gRCT/0qU/qjaneWISjTaJ45YHGfMGprTc/Gmz1nZR9CzI8mYjhOBBKDJ1tCp?=
 =?us-ascii?Q?kaotw58M/hOmV+aIivNbRF7IF+ch2Oi1G1/2BKzTeni2G0Q4SFtgopsWijOB?=
 =?us-ascii?Q?Tt+GlKwPsAmWc4svZwGYsAIyZmtHgfH2BcjKn3KMsBbZkMfSSK4u9cr82FH4?=
 =?us-ascii?Q?0mZB5daBtK2qmnwiu9sYVZwD1cJokoH16GpCBD1AyG/myG42Ax/BLMm4iL9k?=
 =?us-ascii?Q?LX+1N1P6xz2gdL3xHrXDR44GOj81My2i6nMEi4hXZfWhL69Dv1c9JBsg8Wri?=
 =?us-ascii?Q?xPWZtTqOoCcLXfLRd9YuIJ5F7wS2V5JZthQMBJ6hjccUrHV3KfVSvwCfIoUS?=
 =?us-ascii?Q?rf1TBQ4kso2x2T4jhmfmFyGjP33QmMktxwQWWrVs7s7hEjuQP7fLqlRayATU?=
 =?us-ascii?Q?fimrE5li1y8vP0RaEtfqZp44p2q9Mz5rY3Sd68YzIdLb80XtTwoEqgxeOURW?=
 =?us-ascii?Q?G6bFZwByoVw/93lp4pqq551swPUpaQgcrIOqJgXjSrflPasHT0zbXGJHvxbq?=
 =?us-ascii?Q?Iyja?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB4948.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jan 2021 03:03:05.9638 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-Network-Message-Id: 5256b76e-4cc0-4208-8822-08d8b2b8d34e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hrKMVundSkykos7gQfAPpBPx1+rSaejFnF+076VUoxRfktbE6zAXWtoEZjx6WyJyN/LdC5Zynz2ozOq/zGwTAQ==
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

Forgot to reserve a fence slot to use sdma to update page table, cause
below kernel BUG backtrace to handle vm retry fault while application is
exiting.

[  133.048143] kernel BUG at /home/yangp/git/compute_staging/kernel/drivers/dma-buf/dma-resv.c:281!
[  133.048487] Workqueue: events amdgpu_irq_handle_ih1 [amdgpu]
[  133.048506] RIP: 0010:dma_resv_add_shared_fence+0x204/0x280
[  133.048672]  amdgpu_vm_sdma_commit+0x134/0x220 [amdgpu]
[  133.048788]  amdgpu_vm_bo_update_range+0x220/0x250 [amdgpu]
[  133.048905]  amdgpu_vm_handle_fault+0x202/0x370 [amdgpu]
[  133.049031]  gmc_v9_0_process_interrupt+0x1ab/0x310 [amdgpu]
[  133.049165]  ? kgd2kfd_interrupt+0x9a/0x180 [amdgpu]
[  133.049289]  ? amdgpu_irq_dispatch+0xb6/0x240 [amdgpu]
[  133.049408]  amdgpu_irq_dispatch+0xb6/0x240 [amdgpu]
[  133.049534]  amdgpu_ih_process+0x9b/0x1c0 [amdgpu]
[  133.049657]  amdgpu_irq_handle_ih1+0x21/0x60 [amdgpu]
[  133.049669]  process_one_work+0x29f/0x640
[  133.049678]  worker_thread+0x39/0x3f0
[  133.049685]  ? process_one_work+0x640/0x640

Signed-off-by: Philip Yang <Philip.Yang@amd.com>
Signed-off-by: Felix Kuehling <Felix.Kuehling@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
index abdd4e7b4c3b..bd9de870f8f1 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
@@ -3301,7 +3301,7 @@ bool amdgpu_vm_handle_fault(struct amdgpu_device *adev, unsigned int pasid,
 	struct amdgpu_bo *root;
 	uint64_t value, flags;
 	struct amdgpu_vm *vm;
-	long r;
+	int r;
 	bool is_compute_context = false;
 
 	spin_lock(&adev->vm_manager.pasid_lock);
@@ -3359,6 +3359,12 @@ bool amdgpu_vm_handle_fault(struct amdgpu_device *adev, unsigned int pasid,
 		value = 0;
 	}
 
+	r = dma_resv_reserve_shared(root->tbo.base.resv, 1);
+	if (r) {
+		pr_debug("failed %d to reserve fence slot\n", r);
+		goto error_unlock;
+	}
+
 	r = amdgpu_vm_bo_update_mapping(adev, adev, vm, true, false, NULL, addr,
 					addr, flags, value, NULL, NULL,
 					NULL);
@@ -3370,7 +3376,7 @@ bool amdgpu_vm_handle_fault(struct amdgpu_device *adev, unsigned int pasid,
 error_unlock:
 	amdgpu_bo_unreserve(root);
 	if (r < 0)
-		DRM_ERROR("Can't handle page fault (%ld)\n", r);
+		DRM_ERROR("Can't handle page fault (%d)\n", r);
 
 error_unref:
 	amdgpu_bo_unref(&root);
-- 
2.29.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
