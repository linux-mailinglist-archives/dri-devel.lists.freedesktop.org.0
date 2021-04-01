Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 52CC4350DD2
	for <lists+dri-devel@lfdr.de>; Thu,  1 Apr 2021 06:23:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF0716EC52;
	Thu,  1 Apr 2021 04:23:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2041.outbound.protection.outlook.com [40.107.243.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C40356EC50;
 Thu,  1 Apr 2021 04:23:11 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZjkpIvQq+7dNfttIOPJ6XeQwtqNMhAa5i8za83Ud5BBm+oCYUJ+Gz2aTuYoTAMv4Ho8UaE0dFMU8FpJMx4eC51Ke1x8ezWnpDlo/xam3VYFpZ+OOJ/fP9tvJ6JyR/zC4dlugxUZpLTdcPCmSsGDz8IWMZNdAaJ8DAFjgPwVcJKCj9JTs8fSynZ/EWIL572098F6mXcMToXtP0i4Ugoun5zWK24gqeziEQVhkgN40rajwOfYw+miRSRwZ6vRpgySN/RPktpv797TZq0VCQatG6rTsthB8WEyu0UlWxBnHDBQOigBI2ujkN2vagrVdxPqwR76Ety/OqvE6KZ7ApuSSYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IpJ7awmqYXscB5lnp2MRATpjRS1ySf9ZAAvAFjezJjs=;
 b=J9+HbhGfTWPbA6zaZ3+2+/2uJ8qskeA3ln5QtvJLHizTMASduNa983hr4Ws9CnzZ+OFxwYHELbBKxwv6scFeYOD2Jp76lgIAN9RjK8ccqPZP7sCnwVMk+7c4rEHMlqYtBp53Qr2cjTCcKKr5yjxKRvgcbH6Xa3awc+/9SwPYfl1k6+fzl7YWc8RG8G3KMFwVM8rQGmAoBcKirGHSk1KcVWX55MKXKLRi1sFXG1nAeeSOYd92fZMbFWRhyv+v+l24KUSulBCKlDP+kKaGvEHx6xqsLYkya9eZJX1/469y7P01ZStdpLLv2cXhludmqGqFDsTYsAD0ihHg3CE9uV63bg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IpJ7awmqYXscB5lnp2MRATpjRS1ySf9ZAAvAFjezJjs=;
 b=FYOWDpRnx0crXzm68yZJEt+4I9QQsnTez8qm6ytFO23qpKbzREal6P3uX7I2x8Eg5aUrN7Xln4tB5/h7U49uymGsdgufm2T3qroc9omWitYjxhfC3Mg9nCntZJh7k7mh2r9Eegm0YDXyaBTgFFXwDR6QvzY2WrlZsdIabO0bRqg=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from BL0PR12MB4948.namprd12.prod.outlook.com (2603:10b6:208:1cc::20)
 by MN2PR12MB4222.namprd12.prod.outlook.com (2603:10b6:208:19a::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3977.24; Thu, 1 Apr
 2021 04:23:10 +0000
Received: from BL0PR12MB4948.namprd12.prod.outlook.com
 ([fe80::70f5:99ed:65a1:c033]) by BL0PR12MB4948.namprd12.prod.outlook.com
 ([fe80::70f5:99ed:65a1:c033%7]) with mapi id 15.20.3933.039; Thu, 1 Apr 2021
 04:23:10 +0000
From: Felix Kuehling <Felix.Kuehling@amd.com>
To: amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 29/34] drm/amdgpu: reserve fence slot to update page table
Date: Thu,  1 Apr 2021 00:22:23 -0400
Message-Id: <20210401042228.1423-30-Felix.Kuehling@amd.com>
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
 15.20.3977.32 via Frontend Transport; Thu, 1 Apr 2021 04:23:09 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1dd166de-457f-4098-b521-08d8f4c5db6f
X-MS-TrafficTypeDiagnostic: MN2PR12MB4222:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MN2PR12MB42222F81B33D9855404AE610927B9@MN2PR12MB4222.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:126;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: CUOe5kgiyRRXylJ6zLlHis8TtptzEAh8SLcz6XFXvfeXTdPePoaRFpSSAKPo4zIukZRzWblMtGvuf9LP0ZFmALuLhhaA00w2d5ipaUOABQLzSrqcZv4LPjUK1V1AdJCFnl1xhYfv9TvMMKhryefcVRzpcAylIdrwQkGAurVbj3BFbMW0/71d4PnqtVhAgngSRlHTnmfp/7gG6VTm5IGU5ggH3ODa4VOGSoPptwUNxpIS0UzkncJRAikZeqKwuEylAfPEjcU0p0xuRQV2Hch9lNiXbtO0VN68cGlB0D8W9DuA4zXp+7/15IVNleJ4Z/TUT4ohUOLh275Bd16uMiN1C+hLWPAWsnhI3xuWxMKkajJMUjQf4D5s2gZfmbFe4RCRmQ1oOYjmxzKySl6ftk+TvaTrQFnGJr9B3ag6zuFI3jdgYNQTIgaxLhr5q4QXqhXqSJqx+hay7nLCL+WvpATE7EHxz3WM8+a/XFsiIAzRxE3qSx7QL8msCpu3qJiNQEwRU615S3NWff+rvvb3vIBcu16F/FufPpqLKgtjLzVpuTkhp4aELt/ajXygr9yq0tk5iOKDf3gyC7AzgCFY++lpeJFMlboa4Hr41S9cBHuma5afT/JsX75zHOybd6ijXYfllpRf6j/0cgKqFC3MqXo1cDLTjS82rChYSOw6pg4LvBA=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR12MB4948.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(346002)(136003)(396003)(376002)(39860400002)(1076003)(316002)(52116002)(66476007)(38100700001)(2616005)(956004)(5660300002)(2906002)(6666004)(186003)(16526019)(4326008)(450100002)(66556008)(8936002)(83380400001)(36756003)(86362001)(8676002)(6486002)(7696005)(478600001)(15650500001)(26005)(66946007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?NQt5/XT9QNIS65ZkDLYl0YIPa2f2a2S3/lBVsa71EM4lvxNxJgkRBVnDulzU?=
 =?us-ascii?Q?Pio6oIGFTwV1ZJutpKN3ee8FBdcq0TkDOPLDoi4YVFzzY64prr5ZNllh1Jle?=
 =?us-ascii?Q?Lk1Pt7Au56F8SAp/fwj6mzS4mgCR8nlhN3xqbLKUJLnB4EERprDYEWJu1Xrx?=
 =?us-ascii?Q?WTf2z+bRK4qHtRHQFbzcxyUVZyhc7E9kyW16pVtpkLG8zcA7oFyxT6+iQkdU?=
 =?us-ascii?Q?Qopmr3LmJMfzqw9+gkoTk+ST2FIEaKzl5/3DAFY6ZSUIVc+FKs1+UHGdrqEl?=
 =?us-ascii?Q?SMRTy5z7qDJ7ltPN4q1N4+uovq6RymP/PlQilFHNgBRYLVlSTa6zHXWZ07A4?=
 =?us-ascii?Q?r2JF7c8/SNymOBjGtQXC2axUcmXroDrKud9AqGlklQ9rUCZVaB4FCO0VBsbT?=
 =?us-ascii?Q?jMqN0qYwcLD3ln9bQb44bB7Tm27fizZ64eE7VLwVt44D4qIZorxobmiXeNS6?=
 =?us-ascii?Q?Fob+cL6ytPnfV7zSQOjbVbheHlPkllk3KYuZFLKMI6dLQsWRLlozK6R4sFdl?=
 =?us-ascii?Q?VPdVMmWC7dkPiif7xbkRfvK2ZlXQXXUW9ilPjrk3OUCYQbGsh1LhVTrLkiT5?=
 =?us-ascii?Q?GjiikmrSqGiTKReTgUV0MwcuHyTMcYYXXy2zmIOLxHGbZANRMKUf/ulzn6Zf?=
 =?us-ascii?Q?PU9zYDjXiNRBdYCuDZveDUQf7b87/xBusF2HGuHVxLvSz+zxKIKPvvDG8eGK?=
 =?us-ascii?Q?/J2+kkYcrdEyBCP1/v+fJTqZd50OKrJwDm6LEnwwxezZSVntsw70ZjdrkPN5?=
 =?us-ascii?Q?JLKuO8uwuCLbzOcEmSPDLBeHHSIygN9Kl31WjeBVnuLLSGuO6RwJmMPsj0Az?=
 =?us-ascii?Q?W9bT86iJjz7euavC3H8fwyb/mwSdowbgKzAdVAzy8/6zzhiWWGeM6sAdXHIa?=
 =?us-ascii?Q?kfOkuML8rwkm4bVhVlL1ksZ3k89hw7aIYgxWPmIMlHYC3dj/yFbQikysQykg?=
 =?us-ascii?Q?TbqqoAuvAXlnM+JErJu20vhYQ56OVCcSYarbXdyAnH7DmcQrx+T5DeeG/lW5?=
 =?us-ascii?Q?6UNUD6RZPtEiitQ2XrfXE3kJVfVZMDc7tzPJOPMLJLEpGWyXd3k6Zm2xhVu3?=
 =?us-ascii?Q?HwJbNgYVaBEFiWF2yGYmC9ZDmZuGfzBTiKchs/2EN2RCnXJRuLliZsemXzdj?=
 =?us-ascii?Q?a2d8KbSNwExmufukKMDh4+S12/Dli7JIaZSQeA7RcS3/vqJavWWVQns+AAd7?=
 =?us-ascii?Q?TRu+liLodz2xmcoxziyDvO57TNInb8p7byzlbvHsJG/q59oUDJEPa6Zx5Cna?=
 =?us-ascii?Q?ioPZ9pra5Eq1N4D5iqPP+JGlPjDRP0/vsjjXn49RUNBN2mBMxACta4Fl/2q0?=
 =?us-ascii?Q?phx2RyuJlZ/KhXKZbtGXUChc?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1dd166de-457f-4098-b521-08d8f4c5db6f
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB4948.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Apr 2021 04:23:10.3058 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JGehVtgb9ijDkHKOR4eVapDZ3t5ZoTJTPAPD7hbGFc0mRP85JrP/oGfmjfdOaYiKdXuuNuqDwGxEJseCkTisyw==
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
index 83c020411e52..7f696f5c55a1 100644
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
2.31.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
