Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CE99BE5D9A
	for <lists+dri-devel@lfdr.de>; Fri, 17 Oct 2025 02:02:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB23B10E071;
	Fri, 17 Oct 2025 00:01:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="ZRoOZV7d";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from BL2PR02CU003.outbound.protection.outlook.com
 (mail-eastusazon11011067.outbound.protection.outlook.com [52.101.52.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 17E4710E071
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Oct 2025 00:01:56 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eO0Tnpm1JrA2hZphdCIZMrevJJo2mjGzL7U0ipp+YM8MgOqjkGKwGTQD4C3YODLDbk3joSu0LkpKEw8JIHnVbBhKgyOh3IrU9IaUXbdZO7RtmRAmXKF9qSwKEEmMSvzS1Q2LTbOZHyiCMabPjlW9F4KUJKzWqC/nYeS9Aw0svtnAcjDv/1rThwaeqSckm2QKvyG7QgxuHgGrxXjqe4miAXun3me/82y/GZ+RYTtqFpS2/eCZqFeTUZia9a8CntaJd/n0+UAwwA3mK8KljlsV6/rD15TFj3eXPV/AoHJjAk4cVjvSK/g5T6U3q1vVd/U+rYa0SE/7ZAb3bbwvEYyLaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qNFi/T0O6onYwX6wMbMLQY7Fi8krZio4eToeCivwXwE=;
 b=R9yGI6oxyKzECJeNImplsyoYLh0QQ1NLWBLBLA9fg1yFdv2lwgTm72hb1HtoF79xw6RS0WNslKJ9D1/oSA87WeGaEDPPlAoK7DIJ4qi0hZEwHYx0B3ooiunwuI34GmFcQzILKYWHe0m0CYtHIlqt2QwUJB7qoZz+d8rOob+3XeYEbJczTMUR7JirF3ALkWwppiaFNJNVwxY/UxEQWSPnIIRT/jlLoR4vt1vL1G6blqNy/V5J3oHzlN4uZH04I7Vk7HRLnSSeDTBWeoZ+FIzTrh3J2mPQxKKDnzm7RCXVcS2NO3SgR8nRqofn9N+MakjBqNscjQBJM2sgHkA0ij77Qg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qNFi/T0O6onYwX6wMbMLQY7Fi8krZio4eToeCivwXwE=;
 b=ZRoOZV7dYRg6m+Y+GM6SofIfaChQsEChOOl2CpG9/Bv5kIs/faTscqx3Z8UgI9Br/GBs/U18luGcV3O909t94fuObHvA3Uf1X5dDNS9bPw3Pi2LHf1ZgEHCk5DoVn+mvYRIwG8jl51Eks4WOvlMxeHPWCKkPTEf1Ri8jT1EiKd5cs3ZSR4rq7ANklpOuQOfUHGz19oRGdV7FVLCosArzyCH0F5TyunKYdD5pSUan5SDxIhFTUSsDG1eGOuBuZezctyVHm0VuDM8GqeqIoRmPe6YE083poptoqcazOjO0CeDDaQE5s1GFthxnXg8/Vwc7tmons+ocip6aB59fIbU3fw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MN2PR12MB3613.namprd12.prod.outlook.com (2603:10b6:208:c1::17)
 by CY5PR12MB6273.namprd12.prod.outlook.com (2603:10b6:930:22::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.13; Fri, 17 Oct
 2025 00:01:50 +0000
Received: from MN2PR12MB3613.namprd12.prod.outlook.com
 ([fe80::1b3b:64f5:9211:608b]) by MN2PR12MB3613.namprd12.prod.outlook.com
 ([fe80::1b3b:64f5:9211:608b%4]) with mapi id 15.20.9228.010; Fri, 17 Oct 2025
 00:01:50 +0000
Date: Thu, 16 Oct 2025 21:01:48 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Leon Romanovsky <leon@kernel.org>
Cc: Alex Williamson <alex.williamson@redhat.com>,
 Leon Romanovsky <leonro@nvidia.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Bjorn Helgaas <bhelgaas@google.com>,
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
 dri-devel@lists.freedesktop.org, iommu@lists.linux.dev,
 Jens Axboe <axboe@kernel.dk>, Joerg Roedel <joro@8bytes.org>,
 kvm@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
 linux-block@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, linux-mm@kvack.org,
 linux-pci@vger.kernel.org, Logan Gunthorpe <logang@deltatee.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Robin Murphy <robin.murphy@arm.com>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Vivek Kasireddy <vivek.kasireddy@intel.com>, Will Deacon <will@kernel.org>
Subject: Re: [PATCH v5 9/9] vfio/pci: Add dma-buf export support for MMIO
 regions
Message-ID: <20251017000148.GB265079@nvidia.com>
References: <cover.1760368250.git.leon@kernel.org>
 <72ecaa13864ca346797e342d23a7929562788148.1760368250.git.leon@kernel.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <72ecaa13864ca346797e342d23a7929562788148.1760368250.git.leon@kernel.org>
X-ClientProxiedBy: DS7PR05CA0003.namprd05.prod.outlook.com
 (2603:10b6:5:3b9::8) To MN2PR12MB3613.namprd12.prod.outlook.com
 (2603:10b6:208:c1::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN2PR12MB3613:EE_|CY5PR12MB6273:EE_
X-MS-Office365-Filtering-Correlation-Id: 2323c3cc-8071-4249-0649-08de0d105f41
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7416014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?IVl3uEn/tGdy+KFySrOqQCK65JuY4gChC4O8RRvzMR6yZhsMGaW4Ey0RTCQV?=
 =?us-ascii?Q?T8SEKVG5JyqCmB5DFUYgLm2+ITOoqn6KZQ96Qo3h5BjKem2vz/eF16G6Qhzn?=
 =?us-ascii?Q?7Vb1k2lpvjNxVmQ3wBYNfW8aYMQFr9kKANQAG+GkccAMHafQ0zU+QwEe2kWu?=
 =?us-ascii?Q?aQ6o9tXVmvFWvGOIfKPcq1/N29ySPluR4NRUjxSjJU46B+qFqLdi0euQjLjf?=
 =?us-ascii?Q?TzWXmGgF6uVUoy6oSEJkXwA/jI2wg4M58GqeabEpNL7yY8EXzqTBT7AzjRG1?=
 =?us-ascii?Q?/uMCRZcAESzGdLkP2E+Er23OWn2tdWiD6ty5bTL/bxQIBHcuC0SA2uTskjn/?=
 =?us-ascii?Q?GnEujgIKsoNd/8OFahcHA3H/Ea82k1fuCtLKYYRct4UNGuZFO6/0/B+txszT?=
 =?us-ascii?Q?Q7T/ryJMsw7feCMKkXUBCNg3LqYqkiym/rGfsYOrAhTuCUlD8nfN5SLSZxG2?=
 =?us-ascii?Q?FaMX48E3NL3b1Bekr6wXA4n2KA4s+C4rLrX0UXoOs/V06lHM9IiVeQdfMYPi?=
 =?us-ascii?Q?086+X+u1bAdXe+XWg9pxcltAIU9LA98g7SpEwV8nN+3AvxdFtxEELXAlOT3E?=
 =?us-ascii?Q?wXmkwc/2WvCoYsywry9OKiPxu1UFWLaRbQ5rLPQdJ9k9sz1Ax0cinyl4jVBl?=
 =?us-ascii?Q?nr4N06dReFGqcXHo8818jgRnStnolqJ7sm2hwJiVjziMctoGrqGMnfElwg2a?=
 =?us-ascii?Q?VtO45z3MuvHKrKHagZQ4KHCAvyp77Y4JfBgXQAV4tC3X9e6pu3tKhqzPzcBk?=
 =?us-ascii?Q?9exoZTpBeH0JiI5PMBqr+iBaa0O1kreg2WFm8z9y02Qy/5VOjckEVxQzUKc8?=
 =?us-ascii?Q?lx1zpzLRUPgS4kJZGqcNgF+6NW7SbJ14EMMeUH5yAhuwSN+3fEyFVuxJ2ksr?=
 =?us-ascii?Q?XOAMD46Z2S3+e/nxglHLd6NFCMVGAvjlFRGcapgzUhBGnMuNdnsk9NqPCnzP?=
 =?us-ascii?Q?oB+XsA8pbI4MXV1WG7ugE3wX0SBKIZ/tfFPr/o7ZEFP5fUQltwH4tpWispnF?=
 =?us-ascii?Q?Qw3JSNnOLvlzKgpK+eI377/KAT2MtMkE/eimmRMZbnrAkjzQQMjHno58No/s?=
 =?us-ascii?Q?A3O1Z31CWczMBO9DU8LgDmpGkIVN92JU2gYFiLNVIQXa5G4t9MjMwH4PfthK?=
 =?us-ascii?Q?/rh7fphu4JQHQzVXXUEqSacwV9rcLNWESeWY27xj+6LExQm7B5wPWbTvJyOx?=
 =?us-ascii?Q?IqmQLSyvZ+V32cVKOgmaFL2KbEmwvTLejhjbn+uWuCO87AhX5vXm0it3+Q6D?=
 =?us-ascii?Q?sytzyUk+lcSvgZwX7OSBXtxQRYqKbklKoe/c+zcvlnGSxBdpFc0viCTyvGAp?=
 =?us-ascii?Q?i+TQVN87dzcVtZtDHnPmsVyWfXRNZXQdqLUBKzH3v8bOfmPLEWnAMaqEkuoZ?=
 =?us-ascii?Q?BiHwl5op1KgMS6/ElH1k/cupOvhxOxpmZQJ2itsym/ct7kt/46p/GLIf7BR1?=
 =?us-ascii?Q?RaqOAix7+f7LB0KIJHNxFaPpr5yfZLR3HMgsI7lZ8a0aaeMfk22KRw=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3613.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7416014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?7jIUOGUuyP5n6kK5KC+4875YQ9fZuUWgtWbbCiJL29DJB4jsf5kXsDZEPvp8?=
 =?us-ascii?Q?BAUVYDRGBGDW4pGTfmdW/76gEAsJUWIxyylUgz89+J4jfLPgSXpi+bufK0E7?=
 =?us-ascii?Q?SNKWQ2TSesu+poeAvnJykXTDnIAeiGX5gYl7mO5hN1UxRgyfgM0q+4rNdHFa?=
 =?us-ascii?Q?R5mbhtRiPtTEnfYH2/8bmcX/N68bhMEDrT8MbsmrmqFHMk2u/jfdIw0KcUN6?=
 =?us-ascii?Q?lH6aact9TnRt+pxravffANhmR3Sa3gwMfwSTNbRduN2RjzYr0uwt4cMPioQN?=
 =?us-ascii?Q?ohgaBKvlXHOfjH6dO9h/UTqIMds6aNGbwtHA2Sb8aM3KnBHFR2gc7fwsEF0V?=
 =?us-ascii?Q?MThtSkTCo7DSAARQCvwSfk9XU0ldUITvKQtWiQ6/CY6CFriGFXM19fvtRNtc?=
 =?us-ascii?Q?HXyXYEMviigjJWwXzQdWu+6tICfAKSnHTL3iZba/CTD3ttLr677w4ghwY5XL?=
 =?us-ascii?Q?l6mjd9bqceF9H2PhiMc+rKR7jU5jLi+P4wu9gRXNAALi7cL2QJ7LDssrgDHf?=
 =?us-ascii?Q?YslTsqR4938Qt5znZz0RhFnHrOiWuuz/xTA43SDtzDKFf0gHdmEu3c6rvObZ?=
 =?us-ascii?Q?tLU6u5cvLU575kAYlbYea1G5e3+PJXX7udQjA6lg26Nd3N3bMboGq5e2IID6?=
 =?us-ascii?Q?exutH+k3wa7SvyMq8VhbUTezIkWhk4kKTA9Glw54PBd3IsOLgTOHv1URU/H8?=
 =?us-ascii?Q?P70hWKcXCLCH8v3cYIrmJEgKRxSgpcbf7IN3R0Bc85VyrDFh88mEaKhr/Njv?=
 =?us-ascii?Q?ACAsAO2GHxwZdbC520jZgBh2QCsZNQsuWm0d6JFacRSP7QhK53UPybMOLCe8?=
 =?us-ascii?Q?TCRcsm+SE36qXogCe+7K4Q7vEDQX9nGvRuB50YMe6Iy6wIWUziDyxc/evtu0?=
 =?us-ascii?Q?BekxzHKFV+TUMvHQzGU3F4NLvgZATPBPvak2cNTSyDQZMdJvXLyWhdbsBJnH?=
 =?us-ascii?Q?C2L5tcYEN1dwvITmTr/xLTuDYYhxuWb0Xe/We/l0FT7rMPQuSHCOTMA75yCb?=
 =?us-ascii?Q?EbUDQVBUyL9czvpppKQAK75LIo3vutDB3gjJdfwxSpFGOCWwqcvKbPuicSGq?=
 =?us-ascii?Q?I6KRLl08PWkj1QK2AqwupOeGi3sjBmbewKjhsqpB0xjGyVGPn4CeGut4tLPg?=
 =?us-ascii?Q?docp5RSt+3V8vRLrnIs9XznnUGrhlRxZQacPJSwHp2jkIOCp53how6zUK78n?=
 =?us-ascii?Q?pXvjMSdvMQL9YsFCT5VCwXK+ked9XsJIs64YNH3FFH07g59rcFfIVtPzWFT/?=
 =?us-ascii?Q?ogqKPuONWJ8tfzhGoyJ6VGsUZhNYmEG4G9hpVLlY5JXAHLKKSu8P14m6Geh1?=
 =?us-ascii?Q?CsNRQDa6KGgvrtk/F7Wr7G+NAyqFuVG3uFrdYiPbOtkr3vbWb5ROwqIk75W1?=
 =?us-ascii?Q?4hn0LODLYyYlBNV6pTCXCHlcPMtEaceYNDpSd7PLDjg239LI3K01Ikx3Svt4?=
 =?us-ascii?Q?ZfM3IUDMREZ9zHQgzZU4EiSrBDKUIiwKy+LUG+52W+2XhdrF5ewlLggrJkmH?=
 =?us-ascii?Q?oOMj0f76yQEeUYsT2p7HGLKByHWQvoAaShGYACpdIchD52jvqwbQS9Xpfv7d?=
 =?us-ascii?Q?1oBcCoJfh7yJ3n4xJI6tepXdS5YkKLNT+LvWovwR?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2323c3cc-8071-4249-0649-08de0d105f41
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3613.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Oct 2025 00:01:50.6287 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MVfEc4OwOXa36QaSzTdnEFDXSNbA4jEap5/NO1z81Y7+cBlUdATyFglhUEbUaqPW
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6273
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

On Mon, Oct 13, 2025 at 06:26:11PM +0300, Leon Romanovsky wrote:
> From: Leon Romanovsky <leonro@nvidia.com>
> 
> Add support for exporting PCI device MMIO regions through dma-buf,
> enabling safe sharing of non-struct page memory with controlled
> lifetime management. This allows RDMA and other subsystems to import
> dma-buf FDs and build them into memory regions for PCI P2P operations.
> 
> The implementation provides a revocable attachment mechanism using
> dma-buf move operations. MMIO regions are normally pinned as BARs
> don't change physical addresses, but access is revoked when the VFIO
> device is closed or a PCI reset is issued. This ensures kernel
> self-defense against potentially hostile userspace.

I have drafted the iommufd importer side of this using the private
interconnect approach for now.

https://github.com/jgunthorpe/linux/commits/iommufd_dmabuf/

Due to this iommufd never calls map and we run into trouble here:

> +static int vfio_pci_dma_buf_attach(struct dma_buf *dmabuf,
> +				   struct dma_buf_attachment *attachment)
> +{
> +	struct vfio_pci_dma_buf *priv = dmabuf->priv;
> +
> +	if (!attachment->peer2peer)
> +		return -EOPNOTSUPP;
> +
> +	if (priv->revoked)
> +		return -ENODEV;
> +
> +	switch (pci_p2pdma_map_type(priv->provider, attachment->dev)) {
> +	case PCI_P2PDMA_MAP_THRU_HOST_BRIDGE:
> +		break;
> +	case PCI_P2PDMA_MAP_BUS_ADDR:
> +		/*
> +		 * There is no need in IOVA at all for this flow.
> +		 * We rely on attachment->priv == NULL as a marker
> +		 * for this mode.
> +		 */
> +		return 0;
> +	default:
> +		return -EINVAL;

Where the dev from iommufd is also not p2p capable so the attach
fails.

This is OK since it won't call map.

So I reworked this logic to succeed attach but block map in this
case.. Can we fold this in for the next version? This diff has the
fixing for the iova lifecycle too.

I have a few more checks to make but so far it looks Ok and with some
luck we can get some iommufd p2p support this cycle..

Jason

diff --git a/drivers/vfio/pci/vfio_pci_dmabuf.c b/drivers/vfio/pci/vfio_pci_dmabuf.c
index eaba010777f3b7..a0650bd816d99b 100644
--- a/drivers/vfio/pci/vfio_pci_dmabuf.c
+++ b/drivers/vfio/pci/vfio_pci_dmabuf.c
@@ -20,10 +20,21 @@ struct vfio_pci_dma_buf {
 	u8 revoked : 1;
 };
 
+struct vfio_pci_attach {
+	struct dma_iova_state state;
+	enum {
+		VFIO_ATTACH_NONE,
+		VFIO_ATTACH_HOST_BRIDGE_DMA,
+		VFIO_ATTACH_HOST_BRIDGE_IOVA,
+		VFIO_ATTACH_BUS
+	} kind;
+};
+
 static int vfio_pci_dma_buf_attach(struct dma_buf *dmabuf,
 				   struct dma_buf_attachment *attachment)
 {
 	struct vfio_pci_dma_buf *priv = dmabuf->priv;
+	struct vfio_pci_attach *attach;
 
 	if (!attachment->peer2peer)
 		return -EOPNOTSUPP;
@@ -31,32 +42,38 @@ static int vfio_pci_dma_buf_attach(struct dma_buf *dmabuf,
 	if (priv->revoked)
 		return -ENODEV;
 
+	attach = kzalloc(sizeof(*attach), GFP_KERNEL);
+	if (!attach)
+		return -ENOMEM;
+	attachment->priv = attach;
+
 	switch (pci_p2pdma_map_type(priv->provider, attachment->dev)) {
 	case PCI_P2PDMA_MAP_THRU_HOST_BRIDGE:
-		break;
+		if (dma_iova_try_alloc(attachment->dev, &attach->state, 0,
+				       priv->size))
+			attach->kind = VFIO_ATTACH_HOST_BRIDGE_IOVA;
+		else
+			attach->kind = VFIO_ATTACH_HOST_BRIDGE_DMA;
+		return 0;
 	case PCI_P2PDMA_MAP_BUS_ADDR:
-		/*
-		 * There is no need in IOVA at all for this flow.
-		 * We rely on attachment->priv == NULL as a marker
-		 * for this mode.
-		 */
+		/* There is no need in IOVA at all for this flow. */
+		attach->kind = VFIO_ATTACH_BUS;
 		return 0;
 	default:
-		return -EINVAL;
+		attach->kind = VFIO_ATTACH_NONE;
+		return 0;
 	}
-
-	attachment->priv = kzalloc(sizeof(struct dma_iova_state), GFP_KERNEL);
-	if (!attachment->priv)
-		return -ENOMEM;
-
-	dma_iova_try_alloc(attachment->dev, attachment->priv, 0, priv->size);
 	return 0;
 }
 
 static void vfio_pci_dma_buf_detach(struct dma_buf *dmabuf,
 				    struct dma_buf_attachment *attachment)
 {
-	kfree(attachment->priv);
+	struct vfio_pci_attach *attach = attachment->priv;
+
+	if (attach->kind == VFIO_ATTACH_HOST_BRIDGE_IOVA)
+		dma_iova_free(attachment->dev, &attach->state);
+	kfree(attach);
 }
 
 static struct scatterlist *fill_sg_entry(struct scatterlist *sgl, u64 length,
@@ -83,22 +100,23 @@ static struct scatterlist *fill_sg_entry(struct scatterlist *sgl, u64 length,
 }
 
 static unsigned int calc_sg_nents(struct vfio_pci_dma_buf *priv,
-				  struct dma_iova_state *state)
+				  struct vfio_pci_attach *attach)
 {
 	struct phys_vec *phys_vec = priv->phys_vec;
 	unsigned int nents = 0;
 	u32 i;
 
-	if (!state || !dma_use_iova(state))
+	if (attach->kind != VFIO_ATTACH_HOST_BRIDGE_IOVA) {
 		for (i = 0; i < priv->nr_ranges; i++)
 			nents += DIV_ROUND_UP(phys_vec[i].len, UINT_MAX);
-	else
+	} else {
 		/*
 		 * In IOVA case, there is only one SG entry which spans
 		 * for whole IOVA address space, but we need to make sure
 		 * that it fits sg->length, maybe we need more.
 		 */
 		nents = DIV_ROUND_UP(priv->size, UINT_MAX);
+	}
 
 	return nents;
 }
@@ -108,7 +126,7 @@ vfio_pci_dma_buf_map(struct dma_buf_attachment *attachment,
 		     enum dma_data_direction dir)
 {
 	struct vfio_pci_dma_buf *priv = attachment->dmabuf->priv;
-	struct dma_iova_state *state = attachment->priv;
+	struct vfio_pci_attach *attach = attachment->priv;
 	struct phys_vec *phys_vec = priv->phys_vec;
 	unsigned long attrs = DMA_ATTR_MMIO;
 	unsigned int nents, mapped_len = 0;
@@ -127,7 +145,7 @@ vfio_pci_dma_buf_map(struct dma_buf_attachment *attachment,
 	if (!sgt)
 		return ERR_PTR(-ENOMEM);
 
-	nents = calc_sg_nents(priv, state);
+	nents = calc_sg_nents(priv, attach);
 	ret = sg_alloc_table(sgt, nents, GFP_KERNEL | __GFP_ZERO);
 	if (ret)
 		goto err_kfree_sgt;
@@ -135,35 +153,42 @@ vfio_pci_dma_buf_map(struct dma_buf_attachment *attachment,
 	sgl = sgt->sgl;
 
 	for (i = 0; i < priv->nr_ranges; i++) {
-		if (!state) {
+		switch (attach->kind) {
+		case VFIO_ATTACH_BUS:
 			addr = pci_p2pdma_bus_addr_map(priv->provider,
 						       phys_vec[i].paddr);
-		} else if (dma_use_iova(state)) {
-			ret = dma_iova_link(attachment->dev, state,
+			break;
+		case VFIO_ATTACH_HOST_BRIDGE_IOVA:
+			ret = dma_iova_link(attachment->dev, &attach->state,
 					    phys_vec[i].paddr, 0,
 					    phys_vec[i].len, dir, attrs);
 			if (ret)
 				goto err_unmap_dma;
 
 			mapped_len += phys_vec[i].len;
-		} else {
+			break;
+		case VFIO_ATTACH_HOST_BRIDGE_DMA:
 			addr = dma_map_phys(attachment->dev, phys_vec[i].paddr,
 					    phys_vec[i].len, dir, attrs);
 			ret = dma_mapping_error(attachment->dev, addr);
 			if (ret)
 				goto err_unmap_dma;
+			break;
+		default:
+			ret = -EINVAL;
+			goto err_unmap_dma;
 		}
 
-		if (!state || !dma_use_iova(state))
+		if (attach->kind != VFIO_ATTACH_HOST_BRIDGE_IOVA)
 			sgl = fill_sg_entry(sgl, phys_vec[i].len, addr);
 	}
 
-	if (state && dma_use_iova(state)) {
+	if (attach->kind == VFIO_ATTACH_HOST_BRIDGE_IOVA) {
 		WARN_ON_ONCE(mapped_len != priv->size);
-		ret = dma_iova_sync(attachment->dev, state, 0, mapped_len);
+		ret = dma_iova_sync(attachment->dev, &attach->state, 0, mapped_len);
 		if (ret)
 			goto err_unmap_dma;
-		sgl = fill_sg_entry(sgl, mapped_len, state->addr);
+		sgl = fill_sg_entry(sgl, mapped_len, attach->state.addr);
 	}
 
 	/*
@@ -174,15 +199,22 @@ vfio_pci_dma_buf_map(struct dma_buf_attachment *attachment,
 	return sgt;
 
 err_unmap_dma:
-	if (!i || !state)
-		; /* Do nothing */
-	else if (dma_use_iova(state))
-		dma_iova_destroy(attachment->dev, state, mapped_len, dir,
-				 attrs);
-	else
+	switch (attach->kind) {
+	case VFIO_ATTACH_HOST_BRIDGE_IOVA:
+		if (mapped_len)
+			dma_iova_unlink(attachment->dev, &attach->state, 0,
+					mapped_len, dir, attrs);
+		break;
+	case VFIO_ATTACH_HOST_BRIDGE_DMA:
+		if (!i)
+			break;
 		for_each_sgtable_dma_sg(sgt, sgl, i)
 			dma_unmap_phys(attachment->dev, sg_dma_address(sgl),
-					sg_dma_len(sgl), dir, attrs);
+				       sg_dma_len(sgl), dir, attrs);
+		break;
+	default:
+		break;
+	}
 	sg_free_table(sgt);
 err_kfree_sgt:
 	kfree(sgt);
@@ -194,20 +226,24 @@ static void vfio_pci_dma_buf_unmap(struct dma_buf_attachment *attachment,
 				   enum dma_data_direction dir)
 {
 	struct vfio_pci_dma_buf *priv = attachment->dmabuf->priv;
-	struct dma_iova_state *state = attachment->priv;
+	struct vfio_pci_attach *attach = attachment->priv;
 	unsigned long attrs = DMA_ATTR_MMIO;
 	struct scatterlist *sgl;
 	int i;
 
-	if (!state)
-		; /* Do nothing */
-	else if (dma_use_iova(state))
-		dma_iova_destroy(attachment->dev, state, priv->size, dir,
-				 attrs);
-	else
+	switch (attach->kind) {
+	case VFIO_ATTACH_HOST_BRIDGE_IOVA:
+		dma_iova_destroy(attachment->dev, &attach->state, priv->size,
+				 dir, attrs);
+		break;
+	case VFIO_ATTACH_HOST_BRIDGE_DMA:
 		for_each_sgtable_dma_sg(sgt, sgl, i)
 			dma_unmap_phys(attachment->dev, sg_dma_address(sgl),
 				       sg_dma_len(sgl), dir, attrs);
+		break;
+	default:
+		break;
+	}
 
 	sg_free_table(sgt);
 	kfree(sgt);
