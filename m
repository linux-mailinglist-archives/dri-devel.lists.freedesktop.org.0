Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EDA149BD454
	for <lists+dri-devel@lfdr.de>; Tue,  5 Nov 2024 19:14:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A94BC10E5F6;
	Tue,  5 Nov 2024 18:14:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="ix3xOg95";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2089.outbound.protection.outlook.com [40.107.220.89])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3553710E5F6
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Nov 2024 18:14:32 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Q+vuUKAisc3Qvt65gYbca/pp1VkLcdrJ2qrjrrF6LAricMe5eZz3QOqin3sAGuAoTW0WT2mGac2AuI8SzzErtWONbkHqmO4j2EIAHB4jJAT1yrw5f4GS8lFUbH3wY4GU/ewOi5iuGP21EiMRmUhm9EASffjQhRVaqtWGUUwyiKJOSPPf9/F01XltILfR2wJWbA8RgcU027d+tACLaTBJ5x4+mM448V1FCmIWIcRioyTbsFO8Ga7FsY7E/Ac2Mffwuuqk1KXQMNUnm63wI9ssdRVChQlOri1ByE9vopVA0shV95nwmFZhnZ9EoGhAhMkAsQQ/qSDGCAmygQBDI3fYGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nSsxSmPxlksAOVGjYdQmoHC2LN7QlKhIRFvU/0aUrDE=;
 b=CMODATzuOphn/4KhGkurmO4OVXKAPCQXKMu6JXFeIdTQW4Y3oZRZ5m1nStSInb2TjRNKjWEU2yAmTO+BODflK7tHsvaT+rd4/BpW4APUOvYprwdyzVst+ITjkbG4TCn5X7EnwSSnMtBXtB3aZDiAD3ZgLQy/oVP+cpVkanb6sBUXNYgnUsNpGcKiXvFhmGz3OAG/HkMVYcF0RtJ0g2HGAOtgx/brtYHA8IJcbFFgwiYx194SufYgGGzRA/lrFbN+T5TM2rB8SBFYWON5TLG0AakKgdn04yiH1iso5imG3wu9ybRtENvuE/5HXFrCVNpn+5EvKqPDTFBwIe7pemitoQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nSsxSmPxlksAOVGjYdQmoHC2LN7QlKhIRFvU/0aUrDE=;
 b=ix3xOg95VV7fD34FVsFNxiNYrCYqM11njBLw/YSxT5wXr3ghNDukiuRw767X4Lo71qP2wRsuAdjmb5qa3nyZDdUznvuWqFWVciMmjv1SyHI/YlNiwb4KcVpQnHsckXB3EmlGbXErBcM87fLFfj+AX+74K2+p6n8sjRX4CafKLZHF+64KlR+H9nfpqMyeggurI8+UZfj1jfjGxI/wZhkm1/Se9NSJjXqFxS4+kG6J4b+ZYPhixoTR7Jv7V4p7Kbh9wO7Gu7rsnb5Qoz+J3wXunPIb6F0Sh1jYwszXvLVfwk0fyngHmbu3Up7lYs+6t3S3Cv0cFEY5CkGxM11xXnKZIQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH3PR12MB8659.namprd12.prod.outlook.com (2603:10b6:610:17c::13)
 by IA0PR12MB7508.namprd12.prod.outlook.com (2603:10b6:208:440::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.18; Tue, 5 Nov
 2024 18:14:28 +0000
Received: from CH3PR12MB8659.namprd12.prod.outlook.com
 ([fe80::6eb6:7d37:7b4b:1732]) by CH3PR12MB8659.namprd12.prod.outlook.com
 ([fe80::6eb6:7d37:7b4b:1732%4]) with mapi id 15.20.8137.018; Tue, 5 Nov 2024
 18:14:28 +0000
From: Jason Gunthorpe <jgg@nvidia.com>
To: iommu@lists.linux.dev, Joerg Roedel <joro@8bytes.org>,
 linux-arm-kernel@lists.infradead.org, Robin Murphy <robin.murphy@arm.com>,
 Will Deacon <will@kernel.org>
Cc: Boris Brezillon <boris.brezillon@collabora.com>,
 dri-devel@lists.freedesktop.org, Liviu Dudau <liviu.dudau@arm.com>,
 patches@lists.linux.dev, Steven Price <steven.price@arm.com>
Subject: [PATCH v3 2/3] iommu/io-pgtable-arm-v7s: Remove split on unmap
 behavior
Date: Tue,  5 Nov 2024 14:14:25 -0400
Message-ID: <2-v3-b3a5b5937f56+7bb-arm_no_split_jgg@nvidia.com>
In-Reply-To: <0-v3-b3a5b5937f56+7bb-arm_no_split_jgg@nvidia.com>
References: 
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MN2PR05CA0054.namprd05.prod.outlook.com
 (2603:10b6:208:236::23) To CH3PR12MB8659.namprd12.prod.outlook.com
 (2603:10b6:610:17c::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR12MB8659:EE_|IA0PR12MB7508:EE_
X-MS-Office365-Filtering-Correlation-Id: 8a7b208d-38aa-4d57-2897-08dcfdc5af95
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|7416014|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?okNpcY9dailgwi/fcAMGhW25C78owI2s5Lcl0614gGiJEeOkeuUr2q2EOTMQ?=
 =?us-ascii?Q?yC180xVHHepgGjGDFSss7uACRKIPxBVSQPGm8kxkY2iLpAzUuAaNyRlAxQkU?=
 =?us-ascii?Q?wniXlc34xrawfAkc5T8kDTke57KiJ4B0UtiSmrNuEzsklOQmPKQBAoDWQRyF?=
 =?us-ascii?Q?J2ARmEGhqLcJw+x5eUNTmjvqw2AqFAcQhNwYFkv0B4iepTle94uqLxop9jCq?=
 =?us-ascii?Q?zEhfbWhEx4oK3lEjmFEJT5c2JHlNV5OBeabnuRDaWbPkh+10nEDzD1GB3ljR?=
 =?us-ascii?Q?pVlTBBmqrzAkaZ6OUwkU+qdNHbAIZN8RaPSdP/4b8zZc61zPTXOUh8g1gBMk?=
 =?us-ascii?Q?k/QmGBubuSerTFP85ppc5CaPo0zkoArWDruUlvZS3azAoKo35nKcMGt3oRen?=
 =?us-ascii?Q?l9qQJfpqa8MZ0mRoNucpALxqKXnRgDwqKFRzENr6CTGLV+JnGuH9qJep2gQ7?=
 =?us-ascii?Q?YlZgfrrlVQ3KTRhU121AdvBmo4QiBoIlaT4fWdlhLFDkJq1k56HeM2BmhU2i?=
 =?us-ascii?Q?aY8n/ys3ugB/uNyIxBFD40MHTAmfQAWe89NyuC9D3FYjoFs37FlZKYP89wx6?=
 =?us-ascii?Q?b46S81bQpWsJa0i9owcqf6EEXOm+Sseuj/CKqO1jlOcfwDpvajSutHIHjzP3?=
 =?us-ascii?Q?OJGKO23ysdp6hsYBec0om2kY3mZyIKWTiwurSSO/OY3evNQZ3UJqfO1sufCy?=
 =?us-ascii?Q?x08lKaIfbwL4H3iprZ/U+mJcOD2kPdjaVcy0Y5oL+EYkwo4AfyV0H10knFCn?=
 =?us-ascii?Q?aOn0eqSNDbxp3d3rbxqPEEQ2rfHWI9V5DXMPrKPJuq7nWyY6npQj7yfCuGk8?=
 =?us-ascii?Q?gcqBafLH1wK3IdfxLfz68fqNB/LtjrxxSWjvD8/NavXBLqtNKtTX7uCdli1f?=
 =?us-ascii?Q?siwFxrMU5IFSE2/IP5dUH9B53EIdSOnhD1SHBc4bY9FdAUNCYiq5Qn3KP+M6?=
 =?us-ascii?Q?KbDE7OFg65yX5XDqBEuGGqn+T4J8airHttkbAAJOFehfa8mrwAfKRF8gNKhx?=
 =?us-ascii?Q?6Y2g3jeuZ9RV/WGcCfQCA5tvts+y80yj31rVd6YcUK1YcAwtI5BWeN+fitXr?=
 =?us-ascii?Q?2k4JApaywca/dJbd9462l8JJdF/lbAtT7rkLsJOO7bZsjQLBYodnVMHmWzVZ?=
 =?us-ascii?Q?CrSZsL5re1S/vYatbv3cFX3W7aXJgO8BiQPj5IZan52GCLb8WKEhgRSlJ2ly?=
 =?us-ascii?Q?1dMDTlnB3ovty9YihMoQSUYvQahy2fo2uOXVWtA1hpChad7B9g7Omvk9+a8T?=
 =?us-ascii?Q?euqiPKjyHvRlCatUL03MNIRvS+py0eUtaBeIVWPioyUfj7FV+pthIM5myY9l?=
 =?us-ascii?Q?AwpmZm7TSVjQSbMiNmV8pNgn?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR12MB8659.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(7416014)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?sFwDArlOtGr2PbxTse1Y4t1GPmxFnmrOICsK7o5zHSctcklKfbaYrJdASiVr?=
 =?us-ascii?Q?7WxpvPSBWfKHJOMy5zvC+S0WIc2QEZjFYuwT8katJxQ8KihmQGWaFeH9hH4l?=
 =?us-ascii?Q?PdDM7Mizsym6Dmn6lIipw25AMeLm3vio7A7PsZYMdNXab1VubFxOkMY7EWoD?=
 =?us-ascii?Q?bOATbhuxSEgYS9ApA+rIzFv4VkUFR+PhLEMcKRrYq68zZu4KO6NArusdf83K?=
 =?us-ascii?Q?9BjCX652oy5Yl/dEsG6Xq1VYr1nIt2GOdmncBiFUdxy+mQ8Oup6m9uSm8S/S?=
 =?us-ascii?Q?lSicWoOWoFubzlYvXXhVx/jjRdd5JIl4yjXrtdZnmArIilZp7v14BIowabLE?=
 =?us-ascii?Q?fz1SqVs+ieX7nCmVK4Vkc/Zrs6SLTsjhRZizFjk0eJYyp92f0lBwlAQgRSyb?=
 =?us-ascii?Q?9yyafhM791R1XDo2lkKCiDbUxMzxwABTGeghTZNExSTMhRBvutA2IHgW39QE?=
 =?us-ascii?Q?U8g1xh5xeDoWYYQceuoAso9MGj4+wdvrTDtejHbx++mjkdlmSbBd6ZEmQ/2i?=
 =?us-ascii?Q?B+F8n0xqKgNJU5BnB7n6SBxny91xne6cCDotqaZMF4EYkgkVFdjo6m/rsZLB?=
 =?us-ascii?Q?XT+jS+T/WKLgsiyf297MFfn0jeovHurtiYzgK30CY1Lfwz+ia+JtInDZpR5E?=
 =?us-ascii?Q?IHFnJcR+e5CSV9/Nad6B7ltHRr8xjVEwnZ/L/4r5SH3TTJIFTUy/cs8gXjiI?=
 =?us-ascii?Q?U81VtGKU2Bt0F0wQi5C0ZZpEpuOrV15M4FcobZlFpu8NXSX/hPmrHmJOAADf?=
 =?us-ascii?Q?R/ht3+omlI+RJoW0+AZGqpVPQcf8983GTJRKqzVyLFlqEzEgAVyVnw2/fv03?=
 =?us-ascii?Q?Di0FPIsG7QjEakVywNjIQ9LJbfnXoBiMIBJtFMHTK9J6hCy+TJyyIKKHngSs?=
 =?us-ascii?Q?OYDXKltRaX3dQaqBLtViti2fgG1sfPGZhhARkWLviHzLDQJySZCmc2X55Nk6?=
 =?us-ascii?Q?u4dOnfmUhI3WEm45jUU8bRgBJLji9F7fDPnqfOPBYL01Fhn/SSHojLcN2mNL?=
 =?us-ascii?Q?8TXpHaunMFbkJZJZ/viicUAI70AsNhbp4amGu1Pm6GItu+Vi87Gu7TJTlXi2?=
 =?us-ascii?Q?xSz+R40rgDaWxe3AnOhwDXeHH8169qAvG/J151qI3/92LbiNFqmnfBDTpCAa?=
 =?us-ascii?Q?EGtgjyicSkPRh77sybA0+UfcfJgI/Lzd1wuPlmbxym3KQ4bRRfmr64vqv3eV?=
 =?us-ascii?Q?e7Hq0rXsOF3za5js8xALdTG+0oUkBFz557Z2GRNM8wxDREqviikrZJp348jv?=
 =?us-ascii?Q?RMNoNkDtamaXRJaCZsdV4pRdEV/58CNP3KhOMCmkoNEzMF41kS5UIWgx+D1M?=
 =?us-ascii?Q?BGDt4tA4YFXARQWuoxL+wFbSbJwXQn/CRYJMowo1veEyv9uEIogu8WqzxKZz?=
 =?us-ascii?Q?Qhfd5IK+9ing0tHjbz80vJuAOG6+7B/XDmSRTGnVF0anY39ulloL/vtWbN1S?=
 =?us-ascii?Q?CrwoEhJfz7lH6K3RFto2vNOiHsUaGr/6qm6vn4x/5eVAIFmQ044Uei0gQnvs?=
 =?us-ascii?Q?1mOhGM92/BEGwcWdUVvPHASQEwqqQG9jh2rX8wYZpQZW9FP8JqPEm0wOwadp?=
 =?us-ascii?Q?KKYFqLimXbCRTzvL8rpMnYALPM9nDgsMPJVA6C2U?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8a7b208d-38aa-4d57-2897-08dcfdc5af95
X-MS-Exchange-CrossTenant-AuthSource: CH3PR12MB8659.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2024 18:14:27.7746 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YopAym4rrJD1iEjhynvnVj0GgYoJ18v1bPB/YPQHcnAqIWQMYI4mjEKAWpL3oaze
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB7508
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

A minority of page table implementations (arm_lpae, armv7) are unique in
how they handle partial unmap of large IOPTEs.

Other implementations will unmap the large IOPTE and return it's
length. For example if a 2M IOPTE is present and the first 4K is requested
to be unmapped then unmap will remove the whole 2M and report 2M as the
result.

armv7 instead will break up contiguous entries and replace an entry with a
whole table so it can unmap the requested 4k.

This seems copied from the arm_lpae implementation, which was analyzed
here:

 https://lore.kernel.org/all/20241024134411.GA6956@nvidia.com/

Bring consistency to the implementations and remove this unused
functionality.

There are no uses outside iommu, this effects the ARM_V7S drivers
msm_iommu, mtk_iommu, and arm-smmmu.

Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
---
 drivers/iommu/io-pgtable-arm-v7s.c | 146 +----------------------------
 1 file changed, 5 insertions(+), 141 deletions(-)

diff --git a/drivers/iommu/io-pgtable-arm-v7s.c b/drivers/iommu/io-pgtable-arm-v7s.c
index 06ffc683b28fee..9ae8cb8999ef51 100644
--- a/drivers/iommu/io-pgtable-arm-v7s.c
+++ b/drivers/iommu/io-pgtable-arm-v7s.c
@@ -166,7 +166,6 @@ struct arm_v7s_io_pgtable {
 
 	arm_v7s_iopte		*pgd;
 	struct kmem_cache	*l2_tables;
-	spinlock_t		split_lock;
 };
 
 static bool arm_v7s_pte_is_cont(arm_v7s_iopte pte, int lvl);
@@ -363,25 +362,6 @@ static arm_v7s_iopte arm_v7s_prot_to_pte(int prot, int lvl,
 	return pte;
 }
 
-static int arm_v7s_pte_to_prot(arm_v7s_iopte pte, int lvl)
-{
-	int prot = IOMMU_READ;
-	arm_v7s_iopte attr = pte >> ARM_V7S_ATTR_SHIFT(lvl);
-
-	if (!(attr & ARM_V7S_PTE_AP_RDONLY))
-		prot |= IOMMU_WRITE;
-	if (!(attr & ARM_V7S_PTE_AP_UNPRIV))
-		prot |= IOMMU_PRIV;
-	if ((attr & (ARM_V7S_TEX_MASK << ARM_V7S_TEX_SHIFT)) == 0)
-		prot |= IOMMU_MMIO;
-	else if (pte & ARM_V7S_ATTR_C)
-		prot |= IOMMU_CACHE;
-	if (pte & ARM_V7S_ATTR_XN(lvl))
-		prot |= IOMMU_NOEXEC;
-
-	return prot;
-}
-
 static arm_v7s_iopte arm_v7s_pte_to_cont(arm_v7s_iopte pte, int lvl)
 {
 	if (lvl == 1) {
@@ -398,23 +378,6 @@ static arm_v7s_iopte arm_v7s_pte_to_cont(arm_v7s_iopte pte, int lvl)
 	return pte;
 }
 
-static arm_v7s_iopte arm_v7s_cont_to_pte(arm_v7s_iopte pte, int lvl)
-{
-	if (lvl == 1) {
-		pte &= ~ARM_V7S_CONT_SECTION;
-	} else if (lvl == 2) {
-		arm_v7s_iopte xn = pte & BIT(ARM_V7S_CONT_PAGE_XN_SHIFT);
-		arm_v7s_iopte tex = pte & (ARM_V7S_CONT_PAGE_TEX_MASK <<
-					   ARM_V7S_CONT_PAGE_TEX_SHIFT);
-
-		pte ^= xn | tex | ARM_V7S_PTE_TYPE_CONT_PAGE;
-		pte |= (xn >> ARM_V7S_CONT_PAGE_XN_SHIFT) |
-		       (tex >> ARM_V7S_CONT_PAGE_TEX_SHIFT) |
-		       ARM_V7S_PTE_TYPE_PAGE;
-	}
-	return pte;
-}
-
 static bool arm_v7s_pte_is_cont(arm_v7s_iopte pte, int lvl)
 {
 	if (lvl == 1 && !ARM_V7S_PTE_IS_TABLE(pte, lvl))
@@ -591,77 +554,6 @@ static void arm_v7s_free_pgtable(struct io_pgtable *iop)
 	kfree(data);
 }
 
-static arm_v7s_iopte arm_v7s_split_cont(struct arm_v7s_io_pgtable *data,
-					unsigned long iova, int idx, int lvl,
-					arm_v7s_iopte *ptep)
-{
-	struct io_pgtable *iop = &data->iop;
-	arm_v7s_iopte pte;
-	size_t size = ARM_V7S_BLOCK_SIZE(lvl);
-	int i;
-
-	/* Check that we didn't lose a race to get the lock */
-	pte = *ptep;
-	if (!arm_v7s_pte_is_cont(pte, lvl))
-		return pte;
-
-	ptep -= idx & (ARM_V7S_CONT_PAGES - 1);
-	pte = arm_v7s_cont_to_pte(pte, lvl);
-	for (i = 0; i < ARM_V7S_CONT_PAGES; i++)
-		ptep[i] = pte + i * size;
-
-	__arm_v7s_pte_sync(ptep, ARM_V7S_CONT_PAGES, &iop->cfg);
-
-	size *= ARM_V7S_CONT_PAGES;
-	io_pgtable_tlb_flush_walk(iop, iova, size, size);
-	return pte;
-}
-
-static size_t arm_v7s_split_blk_unmap(struct arm_v7s_io_pgtable *data,
-				      struct iommu_iotlb_gather *gather,
-				      unsigned long iova, size_t size,
-				      arm_v7s_iopte blk_pte,
-				      arm_v7s_iopte *ptep)
-{
-	struct io_pgtable_cfg *cfg = &data->iop.cfg;
-	arm_v7s_iopte pte, *tablep;
-	int i, unmap_idx, num_entries, num_ptes;
-
-	tablep = __arm_v7s_alloc_table(2, GFP_ATOMIC, data);
-	if (!tablep)
-		return 0; /* Bytes unmapped */
-
-	num_ptes = ARM_V7S_PTES_PER_LVL(2, cfg);
-	num_entries = size >> ARM_V7S_LVL_SHIFT(2);
-	unmap_idx = ARM_V7S_LVL_IDX(iova, 2, cfg);
-
-	pte = arm_v7s_prot_to_pte(arm_v7s_pte_to_prot(blk_pte, 1), 2, cfg);
-	if (num_entries > 1)
-		pte = arm_v7s_pte_to_cont(pte, 2);
-
-	for (i = 0; i < num_ptes; i += num_entries, pte += size) {
-		/* Unmap! */
-		if (i == unmap_idx)
-			continue;
-
-		__arm_v7s_set_pte(&tablep[i], pte, num_entries, cfg);
-	}
-
-	pte = arm_v7s_install_table(tablep, ptep, blk_pte, cfg);
-	if (pte != blk_pte) {
-		__arm_v7s_free_table(tablep, 2, data);
-
-		if (!ARM_V7S_PTE_IS_TABLE(pte, 1))
-			return 0;
-
-		tablep = iopte_deref(pte, 1, data);
-		return __arm_v7s_unmap(data, gather, iova, size, 2, tablep);
-	}
-
-	io_pgtable_tlb_add_page(&data->iop, gather, iova, size);
-	return size;
-}
-
 static size_t __arm_v7s_unmap(struct arm_v7s_io_pgtable *data,
 			      struct iommu_iotlb_gather *gather,
 			      unsigned long iova, size_t size, int lvl,
@@ -694,11 +586,8 @@ static size_t __arm_v7s_unmap(struct arm_v7s_io_pgtable *data,
 	 * case in a lock for the sake of correctness and be done with it.
 	 */
 	if (num_entries <= 1 && arm_v7s_pte_is_cont(pte[0], lvl)) {
-		unsigned long flags;
-
-		spin_lock_irqsave(&data->split_lock, flags);
-		pte[0] = arm_v7s_split_cont(data, iova, idx, lvl, ptep);
-		spin_unlock_irqrestore(&data->split_lock, flags);
+		WARN_ONCE(true, "Unmap of a partial large IOPTE is not allowed");
+		return 0;
 	}
 
 	/* If the size matches this level, we're in the right place */
@@ -721,12 +610,8 @@ static size_t __arm_v7s_unmap(struct arm_v7s_io_pgtable *data,
 		}
 		return size;
 	} else if (lvl == 1 && !ARM_V7S_PTE_IS_TABLE(pte[0], lvl)) {
-		/*
-		 * Insert a table at the next level to map the old region,
-		 * minus the part we want to unmap
-		 */
-		return arm_v7s_split_blk_unmap(data, gather, iova, size, pte[0],
-					       ptep);
+		WARN_ONCE(true, "Unmap of a partial large IOPTE is not allowed");
+		return 0;
 	}
 
 	/* Keep on walkin' */
@@ -811,8 +696,6 @@ static struct io_pgtable *arm_v7s_alloc_pgtable(struct io_pgtable_cfg *cfg,
 	if (!data)
 		return NULL;
 
-	spin_lock_init(&data->split_lock);
-
 	/*
 	 * ARM_MTK_TTBR_EXT extend the translation table base support larger
 	 * memory address.
@@ -936,7 +819,7 @@ static int __init arm_v7s_do_selftests(void)
 		.quirks = IO_PGTABLE_QUIRK_ARM_NS,
 		.pgsize_bitmap = SZ_4K | SZ_64K | SZ_1M | SZ_16M,
 	};
-	unsigned int iova, size, iova_start;
+	unsigned int iova, size;
 	unsigned int i, loopnr = 0;
 	size_t mapped;
 
@@ -988,25 +871,6 @@ static int __init arm_v7s_do_selftests(void)
 		loopnr++;
 	}
 
-	/* Partial unmap */
-	i = 1;
-	size = 1UL << __ffs(cfg.pgsize_bitmap);
-	while (i < loopnr) {
-		iova_start = i * SZ_16M;
-		if (ops->unmap_pages(ops, iova_start + size, size, 1, NULL) != size)
-			return __FAIL(ops);
-
-		/* Remap of partial unmap */
-		if (ops->map_pages(ops, iova_start + size, size, size, 1,
-				   IOMMU_READ, GFP_KERNEL, &mapped))
-			return __FAIL(ops);
-
-		if (ops->iova_to_phys(ops, iova_start + size + 42)
-		    != (size + 42))
-			return __FAIL(ops);
-		i++;
-	}
-
 	/* Full unmap */
 	iova = 0;
 	for_each_set_bit(i, &cfg.pgsize_bitmap, BITS_PER_LONG) {
-- 
2.43.0

