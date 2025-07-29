Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 62CF7B15429
	for <lists+dri-devel@lfdr.de>; Tue, 29 Jul 2025 22:14:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8EF3410E10F;
	Tue, 29 Jul 2025 20:13:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="EDU3OhL8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam04on2088.outbound.protection.outlook.com [40.107.100.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2298A10E10F
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Jul 2025 20:13:57 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tramFC/OL+oYCppWW3kAgqgJkHjIXLWFHHE1TsUDcDzVupMvMcFU48YVFaa4XpEMcDWag+/XcXtwnF2YSjwM8p/a2y67XcFcQ+rxIDfCB8yV9rWz8mkiM1Z791b+5AwCcKgnoAqrj820WqgidusN10MfYAFNGjZv2b/vBqldiVl9x+SdbgI3fZ+s2lEb3BHZcfaoVEiGGiFddzQQrJey8ylcQldLbH9LSCFTvyFz3C6Z+MkWRw8Vi84EfifV4a2s2IBm9bYT+iLIO/DhHPn9izDdmFjGyowAlpTOSOszHgkt2PVaTJI54NuBp+wHLohBg6KoErVrwl2LzsepPuUQfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=q7vuiFpU2nPlxsusQCMZdYV/HJy8gelk99LSQtjeaOA=;
 b=u5jlr0J0lD8rlHjqks/2u3Ez50hp8CaveUf6kYjowOWCr5dPmrsU7RzpLEwBMvSGf/Pvr8zFAJhcypNYC2Ny8yFJnqkWfjqjsF220H1JLW6c+BwEkMHYCeW/e0k/w2tfbgmCIl7hEdLoEPOgyejN2OTuFCu5DxIF2MYYVNqcKzFUKFRX4fwJku4yT9sn0szgCrr1AlXvYdlnD3C7gqmjdP0bjbtSDZlYOxQAseH1bU7TxhG9Z5Uscp6nTG+P/sgn8XlyCXPu+iFmmZhx9G57un6JWFKpWFw2eKUa8nmnRv+qLRyLqv1XvNKi9ybegbO1hbT3Gb5m1CA5XWkbkNCeJA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=q7vuiFpU2nPlxsusQCMZdYV/HJy8gelk99LSQtjeaOA=;
 b=EDU3OhL8pjTyWF34J1N/GvZ/2gdy4ThE9h4a5osI+yrQtt10/sMXopQ0IybOH5Y6A6c0L/GNsJ7Vb6TmcEJKL0+T67HNksanJE/HyIxu8LqYGKwGqpiZuQmZTe7Le3c/P/MuSDsmLTpuLvoR5/AwrRxjDE5E3KPEXRLufdqMWx8LJhCCl5udx00rGykVWoGj3H/mAYh6HpjBeNQ/Ilq/RKAjsGsXSuFH5OEJJ5p8+vzIOPzfDuWI0T4EPVui0WsKGRAXGV7x0F3MBx38LttR5zAvBJSP2v4GwibkN1mpVWyxKhe7Fx2rUENtOt7MyKZIAQsuKHSy2jBzi61G8FTjzw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH3PR12MB8659.namprd12.prod.outlook.com (2603:10b6:610:17c::13)
 by DS5PPFDB3A23D1A.namprd12.prod.outlook.com (2603:10b6:f:fc00::663)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8943.25; Tue, 29 Jul
 2025 20:13:52 +0000
Received: from CH3PR12MB8659.namprd12.prod.outlook.com
 ([fe80::6eb6:7d37:7b4b:1732]) by CH3PR12MB8659.namprd12.prod.outlook.com
 ([fe80::6eb6:7d37:7b4b:1732%7]) with mapi id 15.20.8964.024; Tue, 29 Jul 2025
 20:13:52 +0000
Date: Tue, 29 Jul 2025 17:13:51 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Robin Murphy <robin.murphy@arm.com>
Cc: Leon Romanovsky <leon@kernel.org>,
 Alex Williamson <alex.williamson@redhat.com>,
 Leon Romanovsky <leonro@nvidia.com>, Christoph Hellwig <hch@lst.de>,
 Andrew Morton <akpm@linux-foundation.org>,
 Bjorn Helgaas <bhelgaas@google.com>,
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
 dri-devel@lists.freedesktop.org, iommu@lists.linux.dev,
 Jens Axboe <axboe@kernel.dk>,
 =?utf-8?B?SsOpcsO0bWU=?= Glisse <jglisse@redhat.com>,
 Joerg Roedel <joro@8bytes.org>, kvm@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org, linux-block@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 linux-mm@kvack.org, linux-pci@vger.kernel.org,
 Logan Gunthorpe <logang@deltatee.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Vivek Kasireddy <vivek.kasireddy@intel.com>, Will Deacon <will@kernel.org>
Subject: Re: [PATCH 10/10] vfio/pci: Add dma-buf export support for MMIO
 regions
Message-ID: <20250729201351.GA82395@nvidia.com>
References: <cover.1753274085.git.leonro@nvidia.com>
 <aea452cc27ca9e5169f7279d7b524190c39e7260.1753274085.git.leonro@nvidia.com>
 <8f912671-f1d9-4f73-9c1d-e39938bfc09f@arm.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8f912671-f1d9-4f73-9c1d-e39938bfc09f@arm.com>
X-ClientProxiedBy: YT3PR01CA0058.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:82::7) To CH3PR12MB8659.namprd12.prod.outlook.com
 (2603:10b6:610:17c::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR12MB8659:EE_|DS5PPFDB3A23D1A:EE_
X-MS-Office365-Filtering-Correlation-Id: e18af587-585b-4bcd-0efd-08ddcedc6fcf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?bkXJciCWyei9fNzRl68RjmW+hQwIatuDwiprnOZWe+TdUHVCHg+gitVGY7O9?=
 =?us-ascii?Q?axa0zbm6pMMAnZC9nBAhSfZT0vce9IFH0Q2EiaW5kMaRk2JZ/gtLP89kPYL0?=
 =?us-ascii?Q?fm3hCCQZQtHJGmBtMuZ1PoJw/WPEqc6kzqkl7OtleVNg5dZPcPI5rOtCIZXP?=
 =?us-ascii?Q?TGF/m6K5eHYpUDIyoRqvamREu5TWHCh9imFlsO+fcfJVybDEoIrk9viKWQWu?=
 =?us-ascii?Q?SiMwINOrUkJv6d8fLaY7icN69i7JzJnQf682d5ueU0luIT8ShIGpqdeGAvd0?=
 =?us-ascii?Q?n3TvOQYOb4TRISigfBK8g3H7fY1br+SRix58GasP/9UEh7HM3l9j0vPRHKRk?=
 =?us-ascii?Q?TC6MJnSEOlMQPtK+xIM+YvNpGHGhkDgMjXPCI1IbNl7XAblAEWmqSRNbXhGN?=
 =?us-ascii?Q?8Kq18oz3wShGBEOeKWkJIEK2mJN7Pl3Hq+mCmESUfS3CRAHKn+l1I9+sAkxf?=
 =?us-ascii?Q?9K3Uy0LOz1BEtpzqwiGPspnculOfYa+0HbSTt63QByxF7aELJjMc6Patex3e?=
 =?us-ascii?Q?7RfCRWtXTeS1G5mXwFzCeYPsK6Px00JPhnUm57Qm5/4a7VWVmzouNEIeMloB?=
 =?us-ascii?Q?cGzWn6HiwDY38Bhc/dBHoC6R63shfayQEMUPPnAESuCZ0Y/w0shRlmvAkVQr?=
 =?us-ascii?Q?x8s6Dv4rl3ms+GSj5EI4zb2A7qJLvThm84eqWWvjWGn56dsAP+mNM4FTuebs?=
 =?us-ascii?Q?506dEDihfxO4VWHhTTlMev6l9XGVevvGYLhwfBVVtyi76Kryg0pT8iNf4rBP?=
 =?us-ascii?Q?MLQ7Z7D03tnlFmqf90PzJFQPd5TayxQ08wSiQtxDGPKiLsim8rADaksUTn3K?=
 =?us-ascii?Q?pW08dblmm+Fil6UH+wrQGDNrOE4usop/Qeq+zUHrk5XhRFvI+9zq6NdZ2eNu?=
 =?us-ascii?Q?C0t0MpmhENMBhVOJaDI5jRJJCyfTpp9CsFZHYF2XbJzMJGWv2EbvTWe0LeFH?=
 =?us-ascii?Q?B5eVRyEhQisnoaBaW9KSI3TJQ5n8VGwfJs67OowjASV64N2iS10naSp0cxuh?=
 =?us-ascii?Q?AX51MLuics4lXQ2qWb4b34IJAQYwJOiAP+vrqPUBko7oHZCHgWPR3G43+rhG?=
 =?us-ascii?Q?jnRcszmqIPfToYtGBAvXyNnMN00IvyJFIGl72QFCuxzczgFH3ybA8kdoPlmv?=
 =?us-ascii?Q?VGGdY6J01ZIvyZ4yl4Iu3R816NFghmlGAojS9D05aoFljWg8+S58GJin7ejV?=
 =?us-ascii?Q?QMPcWKYskR8uFqoTPSsx4TYL+yBa9yRlmJOdzfvfeGV5WAc55XBnNhniXhfY?=
 =?us-ascii?Q?wm/u4ULw6k1cIfbR68TQMpmQeiGkijq08VpUfTftYkzEzGTcZCApS80gXnUF?=
 =?us-ascii?Q?K4QVDCZp/0CMvG2IXs8OIJVVwXtRrEpPOOEADppIiDySmZ8HyD/nVBzPd6zJ?=
 =?us-ascii?Q?NfK5lNtJn4vmF7mSTz66qRARborfFL331bVeZtEFCmkvx30ONa6Q9STGub21?=
 =?us-ascii?Q?XqclvQ7C8nE=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR12MB8659.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?bj1p8qsMr/ajXJmglGGGPl0TRWuHpahBE1P6hV3y7H3Zbz1A1Dvr8U4MD6mN?=
 =?us-ascii?Q?4NeRCsiltckRovk4cH/tFc8HwuzJj3BO7bDBbkrROOHcXYM/ptbj4EDtsya3?=
 =?us-ascii?Q?LC5P5PFOuaERGT8IDsFZwI8e2g1SsX67UTEs3L6GduOKb4gpHy3ehPz42ffo?=
 =?us-ascii?Q?NykcMTO06W28GlZqzE/YJvENemIPcz38P/rVMxBoyGAvkpNbsEHC4zQMMgdw?=
 =?us-ascii?Q?6rs7YCN/ZzDG3peGDBY5rHexqqiysf9ZSQy6Kna1g3iGR+0w3eovRcl9i5rS?=
 =?us-ascii?Q?F85s7Zp+V7UpkSEMkRdGcDFX9ysMsFeAV725tNrWWHeYDGyGNa+6KumDsdK8?=
 =?us-ascii?Q?sCaPU6vTTjoHRPjv/oabdI3I2fIwgICeEuxetosN9/GoqiDDACrmoiLOXUsE?=
 =?us-ascii?Q?Arh74ugTofVg41qktslDV/3avm572Ls77GtQ4kb0gyQzUuGgtbTR6THEzI3q?=
 =?us-ascii?Q?p8qXsoAl+sskKWIbkuN9ya0949LZHMT3yYW2HTDNHxsWkPppdYMBkfNM3qON?=
 =?us-ascii?Q?NBKH6iwEuK85Zjkth8+z28u4mZPQYCJTant14gFPmo7puFUXyl/Fdm6+LbQT?=
 =?us-ascii?Q?psyTrf+fJkyGCUAZlMBuTJosL9iVczx8H8cuy3in/n1Si30czww4ok+t3dKD?=
 =?us-ascii?Q?HA2HJS7/3t89f4hGsDqYuwrT+Gu+YstxXcu1BCm0W4/kIS6GeO3zdRnzjx9s?=
 =?us-ascii?Q?y1L2uRCXIBddHjLu3wK6XaBPs9w3sNL6+OzYkVmxbKr1WnXVzp+BAS6nYWZX?=
 =?us-ascii?Q?dXF1AOwnQ6Nk7ZMk0L8WG0QDBAvFHJywADGTbfw1g2P23/JlBjoF9BjrzZgz?=
 =?us-ascii?Q?kCS8Mm5cztIZZcH9WGe7v5Ak7m2p4eQyf/2LcYk6cic4iNvXU3VXNndGWG85?=
 =?us-ascii?Q?vQ/1Z7pdyRM3bV2y/IkSa+7X4KXstRnskvYziOUf1TEIfQKj4hakSbl/e/lD?=
 =?us-ascii?Q?jDJA4sEHoLvEEL1q05EOiVFMuE3mDN+tmwfFurU6bgZJYLDBAjtkC/kf+2KH?=
 =?us-ascii?Q?PCfQgcQyfK3iRtZRBkrv5VYh0yX0MMgDNeRe/HZl7KSlAL0Go/x+WCf7bWWa?=
 =?us-ascii?Q?BnYBEKoDOyIdODnpDnNb658du9nFXmVZ/IfkivEUwdXxaU9IXds70VYahfkl?=
 =?us-ascii?Q?8Ma5olMP3Zac+mK/3NkFIxvDpXysvj6wv4u8vIIJoE+I5SpA9TA6SzV2/R5E?=
 =?us-ascii?Q?j2f9YlXtoF/95mgoSZdBj74vlVGF9NCKA3axz6Ns/6KieSFjYhGhC31AeUt9?=
 =?us-ascii?Q?NKaoaMA8FMDYucXjegfre/2rkXYO8JByB5LJl/jpaP25tuNyKhBVQYc0mgn3?=
 =?us-ascii?Q?g5Q+PaZLlp6eLxTvw030wsBckIPKaKd2Sdnie+pE0aSVfNIf6r89R5Skq/d3?=
 =?us-ascii?Q?FqplykYPg/xqUBhSgsjIV5s9Cdoocd2Rl4IfDKxph1dN8ELQ/yIVdfBgZqRh?=
 =?us-ascii?Q?/rq10rVVp0AAXvY+hdBnPzEBx2+X69FcU4h3H7MrO8K6iuMrPDktdKm+oTE8?=
 =?us-ascii?Q?Wy2pALz0WeinADVleNF9wEDSzQWXaSr/VZYpr4pZ546QZB8xQFFZnCMOy3+3?=
 =?us-ascii?Q?ww0t9j6/gkn9w0A3xZk=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e18af587-585b-4bcd-0efd-08ddcedc6fcf
X-MS-Exchange-CrossTenant-AuthSource: CH3PR12MB8659.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jul 2025 20:13:52.2045 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vUxTpo/zHIlJAHDHH3TnwZkVdtExbipYoaNW5mR6DmYFt30ySRqTjN7Y+dZZapxZ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS5PPFDB3A23D1A
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

On Tue, Jul 29, 2025 at 08:44:21PM +0100, Robin Murphy wrote:

> In this case with just one single
> contiguous mapping, it is clearly objectively worse to have to bounce in and
> out of the IOMMU layer 3 separate times and store a dma_map_state,

The non-contiguous mappings are comming back, it was in earlier drafts
of this. Regardless, the point is to show how to use the general API
that we would want to bring into the DRM drivers that don't have
contiguity even though VFIO is a bit special.

> Oh yeah, and mapping MMIO with regular memory attributes (IOMMU_CACHE)
> rather than appropriate ones (IOMMU_MMIO), as this will end up doing, isn't
> guaranteed not to end badly either (e.g. if the system interconnect ends up
> merging consecutive write bursts and exceeding the target root port's MPS.)

Yes, I recently noticed this too, it should be fixed..

But so we are all on the same page, alot of the PCI P2P systems are
setup so P2P does not transit through the iommu. It either takes the
ACS path through a switch or it uses ATS and takes a different ACS
path through a switch. It only transits through the iommu in
misconfigured systems or in the rarer case of P2P between root ports.

> And again, if the IOMMU is in bypass (the idea of P2P with vfio-noiommu simply
> isn't worth entertaining) 

Not quite. DMABUF is sort of upside down.

For example if we are exporting a DMABUF from VFIO and importing it to
RDMA then RDMA will call VFIO to make an attachment and the above VFIO
code will perform the DMA map to the RDMA struct device. DMABUF
returns a dma mapped scatterlist back to the RDMA driver.

The above dma_map_phys(rdma_dev,...) can be in bypass because the rdma
device can legitimately be in bypass, or not have a iommu, or
whatever.

> AFAICS you're *depending* on this call being an effective no-op, and thus
> only demonstrating that the dma_map_phys() idea is still entirely
> unnecessary.

It should not be a full no-op, and it should be closer to
dma map resource to avoid the mmio issues.

It should be failing for cases where it is not supported (ie
swiotlb=force), it should still be calling the legacy dma_ops, and it
should be undoing any CC mangling with the address. (also the
pci_p2pdma_bus_addr_map() needs to deal with any CC issues too)

Jason
