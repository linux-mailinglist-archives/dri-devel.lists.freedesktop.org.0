Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A76335ED79
	for <lists+dri-devel@lfdr.de>; Wed, 14 Apr 2021 08:46:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0AE296E8C0;
	Wed, 14 Apr 2021 06:46:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2074.outbound.protection.outlook.com [40.107.92.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D5416E8C0
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Apr 2021 06:46:51 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JcDIwxHEBbbUdN8EyYG+Gt3zLpD9jLOug5pRUlHnFiZQv7AX+q1FfZVImmbOb61l9Q7I8Otwxx3DZBX0Sply8JHRnUtyK1/Vt8Ke7s+qSvttum5Hp3tLiZXBLlIDr3y3E6eQBSKQpR0NsPxM7MWOwd4C+BeBYH4+LOzpCCDXu/AvX31vv8Ov1FqXsSbMZ+Ar8Wn+yR6vit10N5G/OrJnO5d4n5wgpiqU7WRyVo/hhZnuIqdaNMhi243VLDQOyCxg5rpgm0/Pn6vGJdTeJBSMsa02wgIz0eyybR7gAwwSqj50okR3kZ5gBocrcJMj0Gala5paSgLCShWznEXyb4daJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XUcSThGOmgW2TkEvH03AiiupJoZbHEnbE0vI9a2WclU=;
 b=ILeyx4xuflXgIamAATIiseQ/qFD8oqjcWX6knuSPJLDnwxszW9HQFL//PS+d1wE8YZCauQRuM50ttr70/phiUYMHMmBQfCJiEjMdB5QjoXJzrZTJiGL5iYrjYltPM+fzi8pYt5JjSLPSe2hOy3dgNT5YoH7EVVjzK52f5UJctZpfnh7M5sOIqYg1A1uJskXmxrLJVrNTCUXlXbUqw2+qNQnt9WSPsRADYhVb5+rQQ8xLMBG0jgd6sgw+Zlf4x1KOSIvCLyYXG2y9eovc64o2Rv2HMIL0eFqZT1PcOaIrYoHrQGQD6zDINPSZdbS772J8iR5BRxLMAW2x/XkNXtSsjg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XUcSThGOmgW2TkEvH03AiiupJoZbHEnbE0vI9a2WclU=;
 b=HngMhq/qri/nhAf89Q6CnZIYVYSP3RPr/UV6EwWhu7o/2kiWaMvakw52KdN5K4v2/Jhg04P8SgKlfacNeE34YB/m5E6EvhguVyQmtrTYDeoaLGj2WIE7gOjndpc51Or0LGAgEHLbGVgVkEjO6j348xuUIOQmRJkuYge/cQFDYFI=
Authentication-Results: lists-freedesktop.org; dkim=none (message not signed)
 header.d=none; lists-freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from BL0PR12MB4948.namprd12.prod.outlook.com (2603:10b6:208:1cc::20)
 by MN2PR12MB4125.namprd12.prod.outlook.com (2603:10b6:208:1d9::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4020.21; Wed, 14 Apr
 2021 06:46:49 +0000
Received: from BL0PR12MB4948.namprd12.prod.outlook.com
 ([fe80::70f5:99ed:65a1:c033]) by BL0PR12MB4948.namprd12.prod.outlook.com
 ([fe80::70f5:99ed:65a1:c033%7]) with mapi id 15.20.3933.040; Wed, 14 Apr 2021
 06:46:49 +0000
From: Felix Kuehling <Felix.Kuehling@amd.com>
To: amd-gfx@lists-freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 2/9] drm/amdgpu: Keep a bo-reference per-attachment
Date: Wed, 14 Apr 2021 02:46:14 -0400
Message-Id: <20210414064621.29273-3-Felix.Kuehling@amd.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210414064621.29273-1-Felix.Kuehling@amd.com>
References: <20210414064621.29273-1-Felix.Kuehling@amd.com>
X-Originating-IP: [165.204.55.251]
X-ClientProxiedBy: YT1PR01CA0026.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01::39)
 To BL0PR12MB4948.namprd12.prod.outlook.com
 (2603:10b6:208:1cc::20)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from Harpoon.amd.com (165.204.55.251) by
 YT1PR01CA0026.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01::39) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4020.21 via Frontend Transport; Wed, 14 Apr 2021 06:46:49 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0e39de6d-5ee3-4ac4-8f40-08d8ff11143d
X-MS-TrafficTypeDiagnostic: MN2PR12MB4125:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MN2PR12MB412510981A663443A3132317924E9@MN2PR12MB4125.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: S+H8L41uGw0UBCoFEkJVGW6O3KJ2B6ZSu3rXDX8/z9w5aQSq1mRPv8/NS6IQSkONNQ0fXfHdebWTzQMbhgf976dPZVe3q+s7Z2gWo6qh+Z99pelw7xtZVbNXKbKx/+GLBZNJz9Bp5vRG5JH5BZL3MkoSdHDrJsA5QRXrnStaWLnQTVkiJg2B5DeaSPT++Z+k650gNoJGNTP7QGTUfdoJOyoEwUMKlVFV3p8xNYdRR2mtzb5lDS++dvUTZ0OEJTUQdJebZViQXIgHTxNkPyJN7mqG0DrUYBDdC7/N2W4/PIGTALsqzk2YmMo9wE3btxUhl095ZNf87Y9+vpVdQX0GP3ERr6+ZlhpvGWRFF8PEgHEm+ErKEVz6o7CKc32aq965ZRrlxir0a/QQftXKNjTe4drE28hpfBmJ/uiBLgLjzQm7SKsDIhhDBww3OGroafWZX4uJMEiqxdciZ/2EhvcY9jKEj/KfjRfUZrNMK3BOoMUQiob5z3vA84i356PbhyamQPKZf1CeV9rHzp8mDZp+TXdK+CCEaN65/uIHaATrmJ/fAZvjeCZcgymxBVbrl9C8ovteOWZCQFggPxeoZONNrlW2SKEm+lUNFnsXi++LRXBLrHvCPDXP1eh8pzU4C+TbffvQQtO0aZiv9ohW6wQljVJLPuS9m37QklL/AVc35k4=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR12MB4948.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(39860400002)(136003)(366004)(396003)(376002)(5660300002)(478600001)(6666004)(316002)(186003)(16526019)(66946007)(8676002)(83380400001)(4326008)(6486002)(2906002)(66556008)(52116002)(38350700002)(8936002)(86362001)(7696005)(26005)(66476007)(36756003)(956004)(1076003)(38100700002)(2616005);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?f+sj+FsCrxXnWyyhkR7Oe0SNepqfiyxeRbr+o0j2wv6REAizNB6LilCIfWY8?=
 =?us-ascii?Q?SY26H6aFVovGaWx39/k0JJZJxoCz1Y1qdjW+a22yNSH8H4QqBSXGt5kZOWOw?=
 =?us-ascii?Q?jp+Hie+zjR13gK2hgo1vrgzAHj8kUb727FnpUF0uuhbnYY1ij49dlUJ6Ipmk?=
 =?us-ascii?Q?FCJAZ3IAKQfn9inLc1k70pe0uvUPYq8icWTIoLbCWXyHeeHmswPYL3bhRQbr?=
 =?us-ascii?Q?6Q2wYPSkM5yRzimZ9mD93bbm3zGfLmXcIE/AMN9fCGdgqtJSWFVdmDBy2e4z?=
 =?us-ascii?Q?Od8Meb7jwff+p+cZxEwUJJg5TPCoHE1g/v+1i2c/1LX/Gxkj7YhGoCGWx5wq?=
 =?us-ascii?Q?9PDj/FZGh52HYp2Fd75zAJ6/gRHTUL8A8z3q0ZH956cvarSx4N1PYlh7uPmy?=
 =?us-ascii?Q?GL9gORXyp7Mc88QQ/2OZJVsY2xvB776blu8Dk7oYffuaXUYt7vxOF4Sw7b0u?=
 =?us-ascii?Q?A4rIEDLK4CtRpKXkmv5XEspemqRs1ytu2RAUNkK0tq+PChB/SeY+ieh54eMH?=
 =?us-ascii?Q?n1pMg07940p8hhVbrx0XQ82syZgTBYlNVm8edamSyFI+AOfgAik+f+LkLXg5?=
 =?us-ascii?Q?+Cr2lexVt0mL0kmJp82PUFebdeIZynKbaULpUTHhdsbomEGCCls8k0g3vaoQ?=
 =?us-ascii?Q?es32dSoCi3EnzNIudBHkQ3nQT/oicTjWNFbV9Y8oLtnC68alx2n5uSjoO/HE?=
 =?us-ascii?Q?R/RfpH9KtEiVaUHpHZLFaROIzbDaW83nLus5goX/sZyLDULEde/71Tpw8V1V?=
 =?us-ascii?Q?I3aVQSVvplyHtAmjiNSVwqVseCJFPcYiMibP9rCfyuD7tj98Eiwj3Q0hPvl4?=
 =?us-ascii?Q?io3UIuEjSLUL2WdAIE4QFZCy3xP6fRPyKTxm1t565Nm6Yz9gZmklD2yMcS5L?=
 =?us-ascii?Q?AJ42TfndwqwmVNxWLjNze7MG0mNa5yWCF0W9X/1cYc+N+AXxFiW7znC8vhwf?=
 =?us-ascii?Q?Lg3VTfXP2kdYwflwbEuOyOe7T5COeULL65CBTzg1YV8Gtq9+MUw9uDvCXabP?=
 =?us-ascii?Q?LBT605aL4FDQGk3VXqwbwL5pZU7h1696dgV87tQLbVwaJ1wCgPvF42bjxNgd?=
 =?us-ascii?Q?YvosG3gOoNpuVS4NNzGY4ngZ4L8qKnrKrHm0CWisJs+2EReFZYwe25Ah1bww?=
 =?us-ascii?Q?t79LcYVEGGedhcpXbMjOLkOGnZ/hngcUcDd0bC6iYOGYgCz+orYRYzBePvWj?=
 =?us-ascii?Q?s1gJRYs8Exw6W225SKVDxiKBGsxsvi8Tl2iOE+J2io7QL+qjPh3ZZovMbMB5?=
 =?us-ascii?Q?vDv72aZX7eEt/sIgsgtUEfs+IYQTyA9NSBRIPm13z+dtUD8kud9jCPsJfm8P?=
 =?us-ascii?Q?NrzPQw/PuY2L/893hCswt0zg?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0e39de6d-5ee3-4ac4-8f40-08d8ff11143d
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB4948.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Apr 2021 06:46:49.3096 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: x1TdZt9TZbYzOc9WA+NeTlHcOGBW3mp/hb18wAoPXsVxAnfJC8RAH2rbA3g/+P3hp+MZROQ5mhhvi/mWCmbXrw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4125
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
Cc: christian.koenig@amd.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

For now they all reference the same BO. For correct DMA mappings they will
refer to different BOs per-GPU.

Signed-off-by: Felix Kuehling <Felix.Kuehling@amd.com>
---
 .../gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c  | 22 ++++++++++++++-----
 1 file changed, 17 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
index d021152314ad..40a296ca37b9 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
@@ -487,11 +487,11 @@ static int kfd_mem_attach(struct amdgpu_device *adev, struct kgd_mem *mem,
 		struct amdgpu_vm *vm, bool is_aql,
 		struct kfd_mem_attachment **p_attachment)
 {
-	int ret;
-	struct kfd_mem_attachment *attachment;
-	struct amdgpu_bo *bo = mem->bo;
+	unsigned long bo_size = mem->bo->tbo.base.size;
 	uint64_t va = mem->va;
-	unsigned long bo_size = bo->tbo.base.size;
+	struct kfd_mem_attachment *attachment;
+	struct amdgpu_bo *bo;
+	int ret;
 
 	if (!va) {
 		pr_err("Invalid VA when adding BO to VM\n");
@@ -508,6 +508,14 @@ static int kfd_mem_attach(struct amdgpu_device *adev, struct kgd_mem *mem,
 	pr_debug("\t add VA 0x%llx - 0x%llx to vm %p\n", va,
 			va + bo_size, vm);
 
+	/* FIXME: For now all attachments use the same BO. This is incorrect
+	 * because one BO can only have one DMA mapping for one GPU. We need
+	 * one BO per GPU, e.g. a DMABuf import with dynamic attachment. This
+	 * will be addressed one BO-type at a time in subsequent patches.
+	 */
+	bo = mem->bo;
+	drm_gem_object_get(&bo->tbo.base);
+
 	/* Add BO to VM internal data structures*/
 	attachment->bo_va = amdgpu_vm_bo_add(adev, vm, bo);
 	if (!attachment->bo_va) {
@@ -527,7 +535,7 @@ static int kfd_mem_attach(struct amdgpu_device *adev, struct kgd_mem *mem,
 
 	/* Allocate validate page tables if needed */
 	ret = vm_validate_pt_pd_bos(vm);
-	if (ret) {
+	if (unlikely(ret)) {
 		pr_err("validate_pt_pd_bos() failed\n");
 		goto err_alloc_pts;
 	}
@@ -538,15 +546,19 @@ static int kfd_mem_attach(struct amdgpu_device *adev, struct kgd_mem *mem,
 	amdgpu_vm_bo_rmv(adev, attachment->bo_va);
 	list_del(&attachment->list);
 err_vmadd:
+	drm_gem_object_put(&bo->tbo.base);
 	kfree(attachment);
 	return ret;
 }
 
 static void kfd_mem_detach(struct kfd_mem_attachment *attachment)
 {
+	struct amdgpu_bo *bo = attachment->bo_va->base.bo;
+
 	pr_debug("\t remove VA 0x%llx in entry %p\n",
 			attachment->va, attachment);
 	amdgpu_vm_bo_rmv(attachment->adev, attachment->bo_va);
+	drm_gem_object_put(&bo->tbo.base);
 	list_del(&attachment->list);
 	kfree(attachment);
 }
-- 
2.31.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
