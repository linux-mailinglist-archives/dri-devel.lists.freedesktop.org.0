Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 54628343F23
	for <lists+dri-devel@lfdr.de>; Mon, 22 Mar 2021 12:08:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7656D6E175;
	Mon, 22 Mar 2021 11:07:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2067.outbound.protection.outlook.com [40.107.243.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2FCDD89F43;
 Mon, 22 Mar 2021 11:07:50 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=P9d4tzKEOEJ2hKkAWyTdELXeIzUDbrMU/Umyh2jbRrX+0fU2vv5v6jGSD2q6S4ZqKm5d/Sv6BKWaoeBX9xrNuVvcdJeP/FeV99ELvEiNljXii08oTSS9DYLqNvfK3qAWruEu45hXPzYn/UJxKz5AnFheHQVeuoy/GOgCiCeHDaC9LMSMo1HgKcNlQkJBbKoncsrm4AgTEaRW71PYP5DroIclicW/rvPHaYy8aiHtHwr4Z2j0+7R1py/AlkIzs5+QkJSIMsDpHSiNE8tv5shWzS8SAnjh4RpSTgda1bstNodO5SK4zDSiUYt8KgLvI4u0PMcyEIRyoewe4qM7Q1XFjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8WsocFKaaMfkqXNLfv8YmfOY+VmBdAjI3ft21MomVWU=;
 b=N7yx2Ve5wKzBEbtfoHeXJff4GxODriWNa8S0v1miECtyqnv6Qr2UmoyS8nkNmyHKnzX/I9PFaUj+XU1/0ICxOGjeAcejrWrbbuPzEGUv4kjj7zCiZrlkPfym3WW+w9DZPSxMBmQ9U5QmGyYrcsA0ctAPgBdISLgElBSR1K6CmIDxgLos7LJnV79X+7ZPFynT68hQSFHYFtmwZvyhgOGC3brgGgXVPY3dKWnLRmZEt40tx+O29nKM/JT2oXsn0QLUz/J6+OKotNFBdBMQTlt588XISgLX7/1/3r4Nn7xMhuVZHFAwEB/Sk3KPSzgI8GDQJ8ISDEHwbpKWOymeXiK1xg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8WsocFKaaMfkqXNLfv8YmfOY+VmBdAjI3ft21MomVWU=;
 b=M97XZQ0PgilI7TBXJcxy/thDqOGZt4MCZn39WidAFdKZQ+DfAt06QrvX4NqXGDkCCGCUxmb+jIRG8Nh8uhw/fPbC2BT8cUL1T+5bEHlodUPgJWSX5LTnNu7JtzzGO38zcyf1h01UL0lcxUI/+KW7tnKU+xcGnO3545AOxsuxtNM=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from BL0PR12MB4948.namprd12.prod.outlook.com (2603:10b6:208:1cc::20)
 by BL0PR12MB4899.namprd12.prod.outlook.com (2603:10b6:208:1cf::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.18; Mon, 22 Mar
 2021 11:07:45 +0000
Received: from BL0PR12MB4948.namprd12.prod.outlook.com
 ([fe80::70f5:99ed:65a1:c033]) by BL0PR12MB4948.namprd12.prod.outlook.com
 ([fe80::70f5:99ed:65a1:c033%5]) with mapi id 15.20.3933.036; Mon, 22 Mar 2021
 11:07:45 +0000
From: Felix Kuehling <Felix.Kuehling@amd.com>
To: dri-devel@lists.freedesktop.org,
	amd-gfx@lists.freedesktop.org
Subject: [PATCH 29/44] drm/amdgpu: reserve fence slot to update page table
Date: Mon, 22 Mar 2021 06:58:45 -0400
Message-Id: <20210322105900.14068-30-Felix.Kuehling@amd.com>
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
 Transport; Mon, 22 Mar 2021 11:07:45 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: ce6e4b72-7a04-4699-26b6-08d8ed22b869
X-MS-TrafficTypeDiagnostic: BL0PR12MB4899:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BL0PR12MB489927CA3E16D9D57D0657F292659@BL0PR12MB4899.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:126;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: vnPb+8+nKmC0v5kpva5NOcH4GIKlFKxGPO2yO6msJTMEFuny6jT0UfvghtcTPs/hRQ0py8ueyblvpclX8YLwwNbrf6FBrZgqQh6RymF8KgH6Z+g5CR6cROnix43n+2SWp440aE9yIJ61Tu/TDU2cytnnnc3dPR4RFuHT4fvrP0P9Z1GCDy+ftV94aeZ4nsjV6NrgeOS6VTkjmts4tTQ8iLgbCq2htufyTKd/zVmWPYH+0pLtaXSB/9rsdZYrmr7b2Qaak584bJwKX+vNLMFDG8hxoC7fD4VNwm34ZisxF+XYAvF1E0r/CdwcJihlo0TOoCeh2ZNgkA4c+5dpPya5Zwqo+FStZEwOs3495AwW+HcDPROYoi+IXhLG+dv5VjTjk3x5l75Z1xxiw9yVzEzuMgH6hOFKPaO8GWrUHEYmmno4fBXsPMn0+URWSSKf9l4ppN0KsWoMpPjwuPWZ5ZXHIofak95k5kqE23di4iBF8hLAMkUCWzyaKt+m8qqaPp65Q8KpLKtpgaj+4UhTYVbVKZ29a4FUq28DOaYd+HQE+Ae+YwqcnxpsbUqMzSLth6Sw8ENpF6Or5wI/a5siCJuKdI2BCMfv82l8hfEJJ7EWOigdmFSIHMVJbIQomlbQ3hBof19mbj2UGzaQEgpqJUOvM7JIBB41sTqpoSg5Ocrm30A=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR12MB4948.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(396003)(39860400002)(346002)(376002)(136003)(36756003)(83380400001)(66556008)(66476007)(186003)(66946007)(2616005)(8676002)(956004)(16526019)(86362001)(8936002)(26005)(478600001)(6486002)(5660300002)(4326008)(450100002)(316002)(2906002)(7696005)(1076003)(52116002)(15650500001)(38100700001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?+iFBReVKmzFJ6ZYVeftOEvZAbaLM+W00KKuMtP8j1z5MuMRqMPIRfOw0jrky?=
 =?us-ascii?Q?81Y36kfdQ/Srx8aaRnqIpAlHoRtrvk4lZC8ia7WzfIEAkCyLepyGtex65M3Z?=
 =?us-ascii?Q?4JRfHy+IO7A1LTsQZZIcRemW0YqBPv0RxMFj8kJQer7tpAzDm4kCUo7vEnMX?=
 =?us-ascii?Q?opZRlgzMGd6kOOpUgPuBUaow9XuX/UDYcpdb6zfnMKokE9TcDg17D4C0AkDg?=
 =?us-ascii?Q?O4wI3rm+1OZb1dNZRP9yz3HBMPHRydMT8Hw5JhBiqIcIwPD8wVPY11YwxHT1?=
 =?us-ascii?Q?XP7t2CnhbrlmSGTqcGodvvUtj0fPLhPmj8KIMm2S17mY6tc07vKdC+N+7fA8?=
 =?us-ascii?Q?1d/wL5K3WJCcw4QLG7pe5aGrTiSrYU0JYQShYcBRSJi6mt21SbQQC2VVO6Sf?=
 =?us-ascii?Q?F43H6bQ0AIJEI4she5iW4g/37kRgf7GE9WLLC1uwhYnbR6xFcLZHGGlbwpsf?=
 =?us-ascii?Q?iBeo/jZ/M3aT/tkGuERQGrGelc8UoCxN2tkfwKqRW1jTjs/i7LdWSCg6VNcT?=
 =?us-ascii?Q?hGHhgXmSX3tdZY6XbDFhZAFxLEufacsV6EwNIJHxxGgdbtw9i4cxguJ79bUx?=
 =?us-ascii?Q?Ts45MPZ7kQdeex9eqPrzkSqzFVqA7cRvLWf8TKBX7FMF5tPSpqzwZdTjN+eI?=
 =?us-ascii?Q?Dxd8Ihvcg1+3SQWXBvE++QuFfBt+PsqisPGnmzc/vjgAv6/D1rYG0nLjoEEl?=
 =?us-ascii?Q?GEMZ1hZBImYtLEhM69wJrTdbnD2PXKJivmcqiKqJiR3jCrce0UWG5LjGtlV5?=
 =?us-ascii?Q?+RJmKZx0NyWppITVXTkbsAkLPYko3MHJLKS7VRDalVRJ9uyahI6sZM/cHmIr?=
 =?us-ascii?Q?n1AzzQLQNYnzfIueaSUZp+MvhgZ4iwpcMx5T/r+6g66dzyN9oMXbTYW4BpSx?=
 =?us-ascii?Q?FR2T/t+vl05hoW24geW0QatbuThjFLb90GdDX5+BWAJrr73zKuowdQ3TlVlb?=
 =?us-ascii?Q?C6b3ieAiNzshWcZhuabcx9iCnAE/BPw9a6yRsn7ip2OoZ45dmIPAxEowhAxZ?=
 =?us-ascii?Q?iJOrobyS4AGlD0r+B/+AVbkyoP0bEF9DvslYqq9TTW9KHuLeSdM1tRl63gsu?=
 =?us-ascii?Q?bYtVna5HTRjnj6dsaSgeHHgue3//xGqbsU3skf8tQiecqDzYAgNtArvoMxmH?=
 =?us-ascii?Q?fGaPLjaOTzlTT0vFxDZFP0NKJvtbmU4L5bcYao3Dsk1HXiG6fGvr+tvDGNtu?=
 =?us-ascii?Q?WXo7mwdjnpahjNRcEP2kTEmO8IN1mLHxseJfP646VpW1IYD+c13PRQyjtVJi?=
 =?us-ascii?Q?NT3Uy1ATlg432uEeFYw6k2wqzR8XL4a+OHTEJFFsjloEQlIOJe7kbU8Di13s?=
 =?us-ascii?Q?Uy4Y7aZdo53ngf5eS1sJn/gT?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ce6e4b72-7a04-4699-26b6-08d8ed22b869
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB4948.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Mar 2021 11:07:45.3526 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TS98tCFTFiT/QdaF9hY+IbEo0DUvxGIAwIk00urOPQI1+++FlkPckDJ/83VNJFzvhpwu+NPye7RpDSKDNXZZyw==
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
index a61df234f012..3e32f76cd7bb 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
@@ -3302,7 +3302,7 @@ bool amdgpu_vm_handle_fault(struct amdgpu_device *adev, u32 pasid,
 	struct amdgpu_bo *root;
 	uint64_t value, flags;
 	struct amdgpu_vm *vm;
-	long r;
+	int r;
 	bool is_compute_context = false;
 
 	spin_lock(&adev->vm_manager.pasid_lock);
@@ -3360,6 +3360,12 @@ bool amdgpu_vm_handle_fault(struct amdgpu_device *adev, u32 pasid,
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
@@ -3371,7 +3377,7 @@ bool amdgpu_vm_handle_fault(struct amdgpu_device *adev, u32 pasid,
 error_unlock:
 	amdgpu_bo_unreserve(root);
 	if (r < 0)
-		DRM_ERROR("Can't handle page fault (%ld)\n", r);
+		DRM_ERROR("Can't handle page fault (%d)\n", r);
 
 error_unref:
 	amdgpu_bo_unref(&root);
-- 
2.31.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
