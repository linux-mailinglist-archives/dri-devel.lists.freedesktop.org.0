Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EE9059BBC31
	for <lists+dri-devel@lfdr.de>; Mon,  4 Nov 2024 18:42:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 637AB10E48E;
	Mon,  4 Nov 2024 17:42:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="r4Dj0MIz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2060.outbound.protection.outlook.com [40.107.94.60])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB4B910E48E
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Nov 2024 17:42:17 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KRbN9s9N3Cv5uUW2BeiattptOvl/RaMSSOGYu2VoPkICCoO7GMfmx5ABep1tpHT5IQ5e1ZO0vpsIas38+Q5qTUlOJYWjk/DqSxgXtPeDr98X7pCKHUrRQz+PDPXJLBIPawfOZ8/4A7aunAFpv6NCUihcJ9sqVfR3ujmW32ezwxXAoMx4vbgAUs56dTci05Wj7V+sqjaSTNwPOy9te9xkgHBKMZE6i+rtLWiwTOwDNIqRQ6o2K8YUj94awYAB7ylWX+9fSG3sC6CKku2hHXa9ZYXecVHd7JdpoYCuqakQJJNK51QNywIK9AdblldbYAc1yxHvXpfJGTBiYFIfmWG+nA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=w5dyMpaxVKJ7sq3235EVEehNwOlgEvvq442grvZzSWI=;
 b=gIUDeXpzj7l+oWIB+B/262/2im8eohvzntNrY/+5dyEm/VACEp34eS4aouCmUDFhs2bmZfUeoqivR15BzrWowm+xp6JQDsWf+AJUJjaQVBlk1K8jDmVRwNv3D9D32uzAmW1DJ7ZLSMwdbxlbh4Ce1oH8gyH5Ps43+loLE+i8Aksy1x2WlmOEmyhyO/3lEuWmTwz3KW7WPmBlpZK8Rzj70QuhwtNflmuNT8RGD72OD4xTyUlCr+NmWHeRF7yaRc7TzJ+DtHKvaouQdBkAk0nG1Sa08vZ3l1W+G+Efj/Eq0rHSyksjwtjHbc8AeyxoxTZQy69DfPrnRKH1XHn0tWrehQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=w5dyMpaxVKJ7sq3235EVEehNwOlgEvvq442grvZzSWI=;
 b=r4Dj0MIzhdDxj/fhldTu8jJncnmCCDWhjyJgGcKBLAOCZ/nWJGbf8LIug4s4bnS1rqIDscAx+DtaUI+PKDyXL5Wjq6q5cx+lOEDZmu7dM/J/EySFSxSq3e330nnq9BBei8fBswkqereR2UvOaZu3EqTZ7k/TpopG0D8wyWT6Hui/dvreeEL15v6XY0Krw6IyV8q14BOps/q0K4YSzMxO9Zms75vemncAEyK+z6DaDZ5TyrewZpnwN1r6ZATw4UlnbFHeak8NvR/MdqjN7w9b3iTggG9AlSA4plVX3pNQb9eT1Iixa22ISI3cHoM9BZegxXtQHQMs8UH52zJRnx8ozg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH3PR12MB8659.namprd12.prod.outlook.com (2603:10b6:610:17c::13)
 by PH7PR12MB5619.namprd12.prod.outlook.com (2603:10b6:510:136::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8114.26; Mon, 4 Nov
 2024 17:42:15 +0000
Received: from CH3PR12MB8659.namprd12.prod.outlook.com
 ([fe80::6eb6:7d37:7b4b:1732]) by CH3PR12MB8659.namprd12.prod.outlook.com
 ([fe80::6eb6:7d37:7b4b:1732%4]) with mapi id 15.20.8114.015; Mon, 4 Nov 2024
 17:42:14 +0000
From: Jason Gunthorpe <jgg@nvidia.com>
To: iommu@lists.linux.dev, Joerg Roedel <joro@8bytes.org>,
 linux-arm-kernel@lists.infradead.org, Robin Murphy <robin.murphy@arm.com>,
 Will Deacon <will@kernel.org>
Cc: Boris Brezillon <boris.brezillon@collabora.com>,
 dri-devel@lists.freedesktop.org, Liviu Dudau <liviu.dudau@arm.com>,
 patches@lists.linux.dev, Steven Price <steven.price@arm.com>
Subject: [PATCH v2 2/3] iommu/io-pgtable-arm-v7s: Remove split on unmap
 behavior
Date: Mon,  4 Nov 2024 13:41:30 -0400
Message-ID: <2-v2-fd55d00a60b2+c69-arm_no_split_jgg@nvidia.com>
In-Reply-To: <0-v2-fd55d00a60b2+c69-arm_no_split_jgg@nvidia.com>
References: 
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BL1PR13CA0411.namprd13.prod.outlook.com
 (2603:10b6:208:2c2::26) To CH3PR12MB8659.namprd12.prod.outlook.com
 (2603:10b6:610:17c::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR12MB8659:EE_|PH7PR12MB5619:EE_
X-MS-Office365-Filtering-Correlation-Id: cc683a0e-d0b2-48ea-4756-08dcfcf7ec7d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?p8BKxDqxAZ79LCeFJVtsDcpb+UgJkSnLGnmuTQ+REPY3unaTGKoSf4yjmAN1?=
 =?us-ascii?Q?p4lmGPFHTm4IfvXu4xcDP+UqaCy0OFjZuVaBOFexCRQXUJC9lDeyoJeZxkBB?=
 =?us-ascii?Q?HGYAN8py6VxXD2u/qfXER2N7IlaqIdhB/qYrAyz+rPlzc9uGnajyRZgWhji7?=
 =?us-ascii?Q?AYIkn8d4SmAHiT8K6TL+YLI6D7pQEbuQX2FELtWHFNfuL0q+OFC2FaDa6zRP?=
 =?us-ascii?Q?I/mDCho6Grlr3zhov5XM7DXkXmMVDmkAQOS8PC5O+z98/3pbsmV057AA2oNY?=
 =?us-ascii?Q?N1bldwrjFxU5t0XVVvD/mcj0ZfaCgxM116NCdROdE6Hbe6yOZITcDw3CimKT?=
 =?us-ascii?Q?yJiMVxpSAAfLcib2rwvoind53gd5uWiZXiRrWpMeDZyfB0rJG+78xblwm5jN?=
 =?us-ascii?Q?g4ZM2Xc5S6+ea3wq1NYxRPXXszkpP18t7ztXJeDrf7S/Bmqd112MhuN6IGxS?=
 =?us-ascii?Q?1tMnj22yfC76FA+VptTuBl01QWiCaMXJfOj+pds1DOyPm0QvTM3OHfPcXCXb?=
 =?us-ascii?Q?f7IVIUa2wExtDfKE3REJ9x0M0d6aXE3QZEwDO1Nr7eLXK/eoB/otA2oDEbT2?=
 =?us-ascii?Q?HiXeYNYWX/f/Z++Qew4X6YbZitRtmok0wU4Hh4bAAX2z1YUr9MQKEa/0gGrt?=
 =?us-ascii?Q?Qi+NnwqbJaRsnfZ4FyrGMyHviIdIR5Kktr6SK6p7VYk0Khwb2NxhN/gz/mB4?=
 =?us-ascii?Q?BLuMUYCRM5IqcbMZbFAWi3iVnOeyFXp2zTzIw+b36DFzQXKEnJ+FMdRsxHu4?=
 =?us-ascii?Q?beZTrlakT2EIoAWINUfhrM/1u4CoseQBrHrWwHKAt2y8We5AqZuMQNtTAklZ?=
 =?us-ascii?Q?nsvAbMYmnw/zwX0fZUjGgADogjsW/g6/Ax2DMsUjbyX/RFU1FcuGgQkihifr?=
 =?us-ascii?Q?uEycwZ2d8UcsB5k0taI1RI3xnpPdzHypDUMwmjqo+NksDSiwVHEjU6bd8XKe?=
 =?us-ascii?Q?Zs7NbLDwVLrzF8P59Ki7Oc80bCkJiQv5xjgol3KBDsg3ofUbhQeJPV+SC1lC?=
 =?us-ascii?Q?2OxZ3FaL+EqnvI4MPL19AsQi84ceEacFfxo/kTWo40XjAuyLcTw/GYwJpzys?=
 =?us-ascii?Q?kRTIYEaG9hT2aj7ZtBcu9UvgtohUzFvqylZwt+bk6h/xbwAQE5l+jSQNS8Ur?=
 =?us-ascii?Q?KkOD5beyIJPKHbrszR3cYBkhci1dXL5iDogoaWQmRlOu8m6c5FMq4C7u2rl5?=
 =?us-ascii?Q?dC5CkmxMzbsXcRQl6QK7aKPt7ngJt7S1r6xKXoygSZ7SW7YR3uQuDssLkanM?=
 =?us-ascii?Q?dbSUxS20E/hKF+feytSRnpIFam4lvvIDIV08K8suFX7AaDJZaFNKWdjQr99/?=
 =?us-ascii?Q?sYIGcnFd45kCFsnfksOczpMM?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR12MB8659.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?fJ28kxfHJFZ2RUYFcf3+M8+ZJbY2ybI4rC0Jtr2f779CysZ6N5BoP5Z+5OZL?=
 =?us-ascii?Q?LHAsWUB9BlGJhxboNOfQLNt/zuqRe8oFgZEGHScLVwZZNa8dgB623fpV5B2W?=
 =?us-ascii?Q?PCBJYbM2mM7+SSZFJkF8/yXIwkNfALKpDJR78nO9qMUD+IbipWC5YQ6kNrU/?=
 =?us-ascii?Q?TnkNXpEVo3vFGWqKyJ+hoDwtXEXCNVDnuYekc2CTvZGz5kSZkjf0YuIjqVrA?=
 =?us-ascii?Q?gO1lB58+vB0Of6euz2w0l5Gqh8jxdeK7YPdESBXIHmmpH8HqODykzi8Ro7/V?=
 =?us-ascii?Q?hUMH+Fo7wLJpBax8MHcim1UUQFRFdVBkDspDy0bOxAo02wxE8cuen8RP86z2?=
 =?us-ascii?Q?ft3VhsnlvWnTWl1QHB/ic2RaRoN7gGFA/z3wmhow4aYM5TLOgDa67eg4f0s7?=
 =?us-ascii?Q?NdgYVX/KXlyqtGqlrkZ18UcBdPiQMHyTa6q2can2t7heqL9koRxHBZqoFji4?=
 =?us-ascii?Q?o37pO0BS0/c/uaqN4aLhL+zrOeZxKTrpeh3g6+4u9ihbyrmH7W3hT8L6sCTk?=
 =?us-ascii?Q?tBTe269RGFsIKj2ZDzS/dR9GyMczjJZpVbPW25BNd7riXvOcGGB7iEoFi1FZ?=
 =?us-ascii?Q?2A0SP48rTzPwIWdfMgddgswJSt2g0L8Fg8KokdG1N/3QLaZCJ8h8/kC3DfE3?=
 =?us-ascii?Q?C5yYuJ0PHztzJnRe3QMlINQG/cVuj8oVyj9N65pT7MIJ5hpfsjigIEPCXnKG?=
 =?us-ascii?Q?pcB/bQMe1Rh0fc9RLtXkTEVYMKNGZclsUARuTC6P93qzeEqUGZiPGNasEqWK?=
 =?us-ascii?Q?gtZwaoOLmzwMymluqEatfYAZsUumHB+SMXrrLXVgyQ6wnFSmjkj+no7fpJal?=
 =?us-ascii?Q?QCDsVUZA1+svYGqNPlSjHMkTeZ2xLzFYs90pUOUGgZUQoSx9nMzaghekSdav?=
 =?us-ascii?Q?e7N2AJQ7nnH7gmC5KlyNj3732MhHxzzUJPPy/QrmGa6V7R5iuNtymEdiMVKh?=
 =?us-ascii?Q?WXrG5iPpIJeuX7EaZ1piPNgB2k2kF8HnaMcCHb/uAftpX/4ijW4XhPtcLGhe?=
 =?us-ascii?Q?bpdN7STE1O39BA3IW4usviZfhvBF3ggzwNJCtws8EA/HIv53z8GRcRauQtQJ?=
 =?us-ascii?Q?L4cgIlshQUx8Ofi8k8p/ZW1pP4dpRagk0Vz+t3Y+mPsOihCodYS5TEewc0oP?=
 =?us-ascii?Q?cVGZ4Xddx1rEzPaqXzzpWXTwD4pf6qd63ejbXERAoCNgBmh1/dRp9MwYZH2s?=
 =?us-ascii?Q?eNVjESRNz7EVUmuRMiy8uaNjorM+7s11MeUN8olk1XYuKJYNmiUry63zsc7z?=
 =?us-ascii?Q?vfB31JFl3yGJqK4snp2o9N7N7t7SQnprcRMeqQske/3whLA6WKUNSOcCE0HT?=
 =?us-ascii?Q?5V2rkizl+p9Xv8DQHJYWOkdxd8D7FqbllSuvHGoRLlB1kZ0NVNKQcdMmR9pa?=
 =?us-ascii?Q?nWn+VhbSG5crKuROmMJqAZF0wcKatj7ALEpGvEfY0NclijodWof5zTriRW8d?=
 =?us-ascii?Q?f+7D1yTdCKV6j8JI9slzPBFP6GSSUYBUe33eBIlyHf5kWbNfWhkFTvmHwz2i?=
 =?us-ascii?Q?YjkKGanuT0zU4GSWhEXasE3ameWhTCTcAgN/yRICiueYrk99+FW4V8+cNBOY?=
 =?us-ascii?Q?1vrmLPbA36Tf+G3048Y=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cc683a0e-d0b2-48ea-4756-08dcfcf7ec7d
X-MS-Exchange-CrossTenant-AuthSource: CH3PR12MB8659.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2024 17:41:33.6003 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UA/vnZc/KZnaDqHK7UMYFnJZry8hZyxFvI2kKBQKeSinfV68ei27DyfUxfmmmQnY
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB5619
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
 drivers/iommu/io-pgtable-arm-v7s.c | 125 +----------------------------
 1 file changed, 4 insertions(+), 121 deletions(-)

diff --git a/drivers/iommu/io-pgtable-arm-v7s.c b/drivers/iommu/io-pgtable-arm-v7s.c
index 06ffc683b28fee..7e37459cd28332 100644
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
-- 
2.43.0

