Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E38B9BBC35
	for <lists+dri-devel@lfdr.de>; Mon,  4 Nov 2024 18:43:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 745A310E4A8;
	Mon,  4 Nov 2024 17:43:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="kSlXz3CB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2063.outbound.protection.outlook.com [40.107.223.63])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A164F10E4A1
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Nov 2024 17:43:04 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AIzEIylxcHRps6/EZCt4Sqm39kGABWndptlmWE4dYq8At/jyRE5xG33dgbuWJpdC+eIfhmgK/QJkBNrwQwDUxN+35mLk79LH4LVN3a74/lRNOOzXa0tQVrF6JsPVG8fNktYP80mFL9KTfUEIyXq8G3uyJ+GbO39ck6OpRwsuiM18TC/EzWkhANMqCsPdz7GKmKLCqvu8CsJs6pIIXK57f/ni3t7MQi0uv4Fr4UVqcMvNUYOdAT+PlP8Ytx1rX2r4DwStwQwQ6ZgIBHnzqFTOqtZ6+sp+wBI3dd8M3suL6zdGtAi46wFxJP8E9Y+y4g4J6fOVsZvz6o0YvXpbh94/7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3FmUti5hyPngciJaVxe7xicKq4d8a253X8yWeIASYzw=;
 b=HyC5W6Oa+VbH3BhUvBG9+bY/xhkUVfBJRE6KZk4j32g5WG9H/LfcptKCTgRqQKxyIP6ky+fmGjfqwSOMlJufuLDj/onLgy2ojX8wa3JPX3ySq4IzoyEtbI7gngaSEwonmvmSlBE6/KG10xP/sY5vey3zlmM9mNys8cK0FjuuXMHyWVgdZ7g/wNYe4y6n7hw4St+pXsA4KvxNnVCcwUxJixRvr/adqjpPuDBXaNeDrIMvoxpmcz947HpV6kpNcwfqHKzzGqeHbXVu+kCPnCYg+x/5fSu6szu0zoEW7uc0ltkGTsmaTx0Zpma7jcuTLpcXis00a4uyrqF9Du31CRIXMw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3FmUti5hyPngciJaVxe7xicKq4d8a253X8yWeIASYzw=;
 b=kSlXz3CBHdilCkShRtJU60f2d6VT2+q0XGV0wivq6MPRJ9JZGI5qMOvxjpdFsBUuyYOFUTFDX37kuWCucZawydQ39JzT+vBBLYyYrFdj73TId+iyKZ1Pr33gche9ZKxE310PwKcmZA9+ZPFLKrkCEm60O5KlXZCrJ9KHAzmQDDJ+72wuOw0NyEtVjODYn9txvLC+brOwhWrCMz4qeUvpdIE6YEIUlwp5h3SewXqUcpvOXbMOVj0mUPOYgNEMaezJD+H9B9fAQ9IOqtI+DoaSfqzaOXlC3gYN2ajdMQcz3PQhgPm76Mchn6YR7KghxToRdcQT/W7Q09D3RCwYTObYVQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH3PR12MB8659.namprd12.prod.outlook.com (2603:10b6:610:17c::13)
 by IA1PR12MB6578.namprd12.prod.outlook.com (2603:10b6:208:3a2::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8114.30; Mon, 4 Nov
 2024 17:41:33 +0000
Received: from CH3PR12MB8659.namprd12.prod.outlook.com
 ([fe80::6eb6:7d37:7b4b:1732]) by CH3PR12MB8659.namprd12.prod.outlook.com
 ([fe80::6eb6:7d37:7b4b:1732%4]) with mapi id 15.20.8114.015; Mon, 4 Nov 2024
 17:41:33 +0000
From: Jason Gunthorpe <jgg@nvidia.com>
To: iommu@lists.linux.dev, Joerg Roedel <joro@8bytes.org>,
 linux-arm-kernel@lists.infradead.org, Robin Murphy <robin.murphy@arm.com>,
 Will Deacon <will@kernel.org>
Cc: Boris Brezillon <boris.brezillon@collabora.com>,
 dri-devel@lists.freedesktop.org, Liviu Dudau <liviu.dudau@arm.com>,
 patches@lists.linux.dev, Steven Price <steven.price@arm.com>
Subject: [PATCH v2 3/3] iommu: Add a kdoc to iommu_unmap()
Date: Mon,  4 Nov 2024 13:41:31 -0400
Message-ID: <3-v2-fd55d00a60b2+c69-arm_no_split_jgg@nvidia.com>
In-Reply-To: <0-v2-fd55d00a60b2+c69-arm_no_split_jgg@nvidia.com>
References: 
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BL1PR13CA0433.namprd13.prod.outlook.com
 (2603:10b6:208:2c3::18) To CH3PR12MB8659.namprd12.prod.outlook.com
 (2603:10b6:610:17c::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR12MB8659:EE_|IA1PR12MB6578:EE_
X-MS-Office365-Filtering-Correlation-Id: 0ac6cfea-f5fc-4adc-6a5a-08dcfcf7ebd9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|7416014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?sZYyiaHSjmF9C2eyWM+0gsK/CmYCoTcHAHF6ct4e/8G6l5rrWlrwo02mPJO0?=
 =?us-ascii?Q?kI0e/sn1QwwQIfFQ3iKwsO1J5fHa/SaMlXI/HXCqyWBdyh9ReXM1D9Ozg3bn?=
 =?us-ascii?Q?WOBTa/A4PbpKyriOmBBaYZ1oqVVS/GRG4fVivxH1aC4jVAgpBCKOxeCqGK81?=
 =?us-ascii?Q?m37Ab63ve3XZxpVsSzLCLISqk489Ap3cHRjxfAbM7SDImlgWNCt6q3Lwegzw?=
 =?us-ascii?Q?+nChE2EF6j1sUhF7K3j511I04mvH9diE7g4cIMP5O2kZznkJz1bEb6Qon9ky?=
 =?us-ascii?Q?BEOOdA9sbnjdnt/qUhNug4PLKnW5evaZxKmErMsFcFjvNLTX9QSgbrvHA/kN?=
 =?us-ascii?Q?JbuP2bU4GfifJv6v35JwWMiZq/i9JP5akGJRktijo/SG3/NykNb0/cf/9bOg?=
 =?us-ascii?Q?ri2pNBw+txrWFo4pKYCb7V0BHvo3Nb+5YgS0erBQzDTKi92fPXV/4cCV8ksj?=
 =?us-ascii?Q?xMsZGPnw4U29pBz/suUNR07a1KWxRQYOwV71zr2Ef+uXwfAn9d8Yad3sP+BU?=
 =?us-ascii?Q?Ukjd7rxkMlP1g66HWws/v93PxGRiYg/xI9fR2UObpgJNfxc1QR8g4yokFxiG?=
 =?us-ascii?Q?AAgjyqKPsc1b0okHHMO/0Ko1H0Z2zAn4igH23cysgQG0ypL/tEByJZir3zUM?=
 =?us-ascii?Q?PWk73xY1wc3qnCgi7H4Rmz3DEbshoPfTvbWO6TB9DvU7AwtgGO/pm0RyVT3J?=
 =?us-ascii?Q?XSsyo5Gu1zJHye1c86usqjmvJtVs34bzYxeYGHncl8XgkvnwE24hCB0Q9R7m?=
 =?us-ascii?Q?co5veuDv3EBo4tNJzl4Ceaq45lomALR5wHqCDpRPe5ywkzmmkpVS8gxS8DWK?=
 =?us-ascii?Q?y23KndTaeeqpdhi7PPKYEaeHIfhT9nHEj6Wip+7AXAD6ZWR1yltVuV1o+fc4?=
 =?us-ascii?Q?7iu19vsYySRBmQXpmzZuSBGVkWL6Ow6febnnCCzX3IMO6sIAUywY1sLYkcy6?=
 =?us-ascii?Q?OzQIMHMK2YIbFciQx6Yvanc/W7SX+fnBqk+AbFTeKvjy4bg0Eq37QdGYRejs?=
 =?us-ascii?Q?NCZe+RjXlnE1z2qbrm87B7JCp7/PHzIL1+io+BrQY5kDoWD6f7g19fewxqu8?=
 =?us-ascii?Q?Q5L7kNFDWcJr4fjT9tZvpWiWLHEsrKlQMg0YqdFUFnSiH4+YBrDFv1BARuSk?=
 =?us-ascii?Q?nWBkJJ71vXEZcUhhmvn1eqcaFU8eZaDZmbt6wlghHbjJHVYnhHOmHDPhO8BF?=
 =?us-ascii?Q?2Y1WaUkFsPMkxEg0V1tqFhJ3P2gK+/PXi7AfKYKgPzMmnVxm5vK5WoQ/XOJb?=
 =?us-ascii?Q?Ip5iYZSzd7+Q5jqcT+HdkL6QgrbzWjraxpndDg9zUPg01Yb7Eu7sC3CeJUBM?=
 =?us-ascii?Q?xxGZHkNcJ5grFVvAJq+XWUJt?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR12MB8659.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(7416014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?R4DDVGzffy2OyPaaZrV8XRW2/W5tMUwbqeH8yrIoUu4U8i3b6ABAgV5774a6?=
 =?us-ascii?Q?suB+vl8nQWiV/j0+eQnsUwM2yyQF8Z79qhIz4QAGPs+72erC3dzK5Ucs8FZc?=
 =?us-ascii?Q?s2sZ20PVBnr2wT+7LA4BMhtTGgOAVLq1lZTU3Co6Krc4NGR2+9oxn2EDCF9i?=
 =?us-ascii?Q?pyqwjeYMcvMtpT8Nm2IBAM6refmwajtC3wvghoaSNwIYeQGaeKixthOXjHSo?=
 =?us-ascii?Q?13YboJNXYCw8pYdDvYLpRYxZ2zkkIQDS3J1sl7iQ7kpVf8AWYdYqyyXrju9v?=
 =?us-ascii?Q?c9prMPOG5rhIqHSuzAAb+6OPuQ/L5r6XPfigPhjbAoss2dxCpVAHFKDn5nft?=
 =?us-ascii?Q?WxD4R1aVP5kdpUtL4CSSFyQLRzt1Ku8ZDZss2SxPPx9uPT8x0WwitJYEoAvT?=
 =?us-ascii?Q?Yqfib41bR4QDXqmG+QoSeS6YRejXPvxfKNNghyFsMMK2q+zbslZgwrNggUDx?=
 =?us-ascii?Q?a1yxza23hvxcoL6oIdq316HKlreWY2peTOengBgkTNxJ+NCIoOwWgOO3o8QV?=
 =?us-ascii?Q?R9x22ZnGmIeJjQcJYWxRlLtKlcbK3Xxg03UHCT8qMG/kp9ubLaztTTC5ClZO?=
 =?us-ascii?Q?0MVxZCBlwYleUo41tmMJtZPTg7zX9rd6qF62z5HlteH+6FC/N7IC2EBcUeDk?=
 =?us-ascii?Q?j0AK5HXPUr4MH/UutJoQBg+knRdjH0JrGdHj8LEWz6RykuX/0BPbGM63LnuB?=
 =?us-ascii?Q?RcYLPD5SIC5P2PAZzCcHb9cWDKVo7F5sURWlXBZUFJs9QqF0Qx7Fd/AzGcS3?=
 =?us-ascii?Q?vaibdlBN9+UbzXQaZznrypb9X9E2n/M1PaXNEeW1oYZd0WFTfciVfLZFcI1x?=
 =?us-ascii?Q?u1ox6VLDNLUNFEPlfKl9AiFVflj2qhJDatlsWff5pdqyo1NnyT4lnEILpbQk?=
 =?us-ascii?Q?lc9VlZ6AVwIOg5BUB9CkxMQj0XbTBcBqn7frGEYl6lRxvWYm7RtJhRwvf07V?=
 =?us-ascii?Q?GI0xQTBbHLk/R0WABDXNtOA5p+iF+nRsbzBndSc1tymGVgR3dOIbc8/xQclx?=
 =?us-ascii?Q?lz7kEltvQdkqhhJT+/cOIaq5ycURd+t9L44Z99VUW/ENouB8+ZsaEwvNreN5?=
 =?us-ascii?Q?IvVhA1Hu8oV5PMFxwTeZqQYRfZvpjanPPT921E6PfJo976QDyiL1kxlQwiCt?=
 =?us-ascii?Q?uKpumZEsTC8zJcfoArnSC3D5pgbtnnlLC1qcW+9ztyH/jAkV6gaI7Lv77AiJ?=
 =?us-ascii?Q?UGMcgm0qIX04jkh9QnwbAuhCC9oXuODMVhgRhC5AwnYmJCkTQ75Vg9lTJMPJ?=
 =?us-ascii?Q?KaGxj1HsLaifVB5P9bh5zZvbY67JCdUK4yHAN4MXQFFivqMLfW8jlNnHcA6o?=
 =?us-ascii?Q?K9+LEp6e+buBszXGiFvL0cLlVS54lP8gsZmkvZ0S/h8X/FGpUMo9ue4qgulH?=
 =?us-ascii?Q?9WQBuvQY7HEmo+Cg8X1YOIKutDThg5tSAysjqTmM+RZMawYcgwvIH7Wedm9L?=
 =?us-ascii?Q?v8soq88PvNkardt0HWEVfVcyz3mrpMv35sSfPn/YkQmF5Iw+dMMM1yjfhbTE?=
 =?us-ascii?Q?EU813rh3gktPSPOzdU7/RENjFv99OiOt25f3uUGLjPmnHDhyQiOdbQfkN1pY?=
 =?us-ascii?Q?tQ2d7n5bLiW0eBnzMpbTm2bPN9ktgjBOLh69nBrE?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0ac6cfea-f5fc-4adc-6a5a-08dcfcf7ebd9
X-MS-Exchange-CrossTenant-AuthSource: CH3PR12MB8659.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2024 17:41:32.6334 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VffEiAghkG2nFxqpAdL4DKhEJioefqDnLF77zGzItlqhvtM6awX4tDVwSdm08nuC
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6578
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

Describe the most conservative version of the driver implementations.
All drivers should support this.

Many drivers support extending the range if a large page is hit, but
let's not make that officially approved API. The main point is to
document explicitly that split is not supported.

Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
---
 drivers/iommu/iommu.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/drivers/iommu/iommu.c b/drivers/iommu/iommu.c
index 83c8e617a2c588..d3cf7cc69c797c 100644
--- a/drivers/iommu/iommu.c
+++ b/drivers/iommu/iommu.c
@@ -2586,6 +2586,20 @@ static size_t __iommu_unmap(struct iommu_domain *domain,
 	return unmapped;
 }
 
+/**
+ * iommu_unmap() - Remove mappings from a range of IOVA
+ * @domain: Domain to manipulate
+ * @iova: IO virtual address to start
+ * @len: Length of the range starting from @iova
+ *
+ * iommu_unmap() will remove a translation created by iommu_map(). It cannot
+ * subdivide a mapping created by iommu_map(), so it should be called with IOVA
+ * ranges that match what was passed to iommu_map(). The range can aggregate
+ * contiguous iommu_map() calls so long as no individual range is split.
+ *
+ * Returns: Number of bytes of IOVA unmapped. iova + res will be the point
+ * unmapping stopped.
+ */
 size_t iommu_unmap(struct iommu_domain *domain,
 		   unsigned long iova, size_t size)
 {
-- 
2.43.0

