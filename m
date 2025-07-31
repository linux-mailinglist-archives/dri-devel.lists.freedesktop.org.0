Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2ACB3B1699B
	for <lists+dri-devel@lfdr.de>; Thu, 31 Jul 2025 02:21:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C5FD10E134;
	Thu, 31 Jul 2025 00:21:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="S2KpM2d8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2049.outbound.protection.outlook.com [40.107.92.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2901610E134
 for <dri-devel@lists.freedesktop.org>; Thu, 31 Jul 2025 00:21:43 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yv01aNHLgoFQNcGQcfjwFjxPM+lpExQRhQl2bdrBRQXt2Dy5a1V3LmeB5Rq/Q+xIZbWCU31Llf+IZVek09xBMDn/kgo17qU2JelQS763t/rSAri/Tcwc61uCInTQGj/Q2XQpPJarXVEh89to4aKzX+JgwtL55LH7qSgur4Dauq1GHIcIGO2CbHr/co0EdyH+ynW9wa7FmA0pYwpgki5HrpxC6U08G6Vwp+8xRFeuPyBtssGM8RFJReg4xMxs7b4juSuiaRM6A6PfcL/3YvTyR0PeaFsYEJuu5E/TtaJkb/l4EPE15Rb++E0etylJeiVgrKiz5vJfZTaAZQxFWfi0uw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IKc63Cawmn7SJjTjCyD85gAEB1IHRvkPC2bj/0KNU/A=;
 b=WV0HTyjQpk9CcpjraftJGGNwQ2u6Q9ZaGvdj3eJGv0erTAIJDWhMOntuZqPfoFQQID0d6oMZ12oRabTtDd6IMNKCZgLsZsbr/vWD+5TvwWIriiQjsxP1mzzqxI5YeONGwJF9DaeeEjPLGcCG5old/bdyTqBe4lhlZYH8NhCp+uRmeq22hiPpWOQAqcDXtVejOLhWi7U59mjAFu9XKy4GsFvwke696yYpssa+0mnKNCM895mIshVtipy3qiE+4kgxrGE+jjOF1tvsozD9bU2AK6VbjRDT5y94BRttvYiUFInlZ2rBRaz1tXeHqnL5YlqaqyKTy2EZvcxOTPu1WEUaiA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IKc63Cawmn7SJjTjCyD85gAEB1IHRvkPC2bj/0KNU/A=;
 b=S2KpM2d8/DX1kqdkMY+cvt2mKK5wtQH+6CCUGCoWe+50umC6gIG9fGI1rzPq2hODW4zfaoshtoA/NW8qGQWKRdCQ4Xw56wCDbw0pQrC+CNiCY24k6xxk6uGIUeSZFyNeQea66VL4a7IN6F59dt5HjaBOPI63wC4L7fjyGYAK50pw4tSrmkN8wFVWTVqh/lM2RSC8NcZvX3k0TZHbMMdVHNchh1JnxiSZRr5UUp/KN4bHuUQ9id2Cv6Pxjet7G8iKKz0fgvknj4b7hTvK7fKp/oWrIYbqUhKLf0AwkkOZlepY6ySsazchyn9LwAlnPbZ0QueE22yqtn1kwPIMZKbyFg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH3PR12MB8659.namprd12.prod.outlook.com (2603:10b6:610:17c::13)
 by BL1PR12MB5778.namprd12.prod.outlook.com (2603:10b6:208:391::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8964.24; Thu, 31 Jul
 2025 00:21:39 +0000
Received: from CH3PR12MB8659.namprd12.prod.outlook.com
 ([fe80::6eb6:7d37:7b4b:1732]) by CH3PR12MB8659.namprd12.prod.outlook.com
 ([fe80::6eb6:7d37:7b4b:1732%7]) with mapi id 15.20.8989.011; Thu, 31 Jul 2025
 00:21:39 +0000
Date: Wed, 30 Jul 2025 21:21:38 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Alex Williamson <alex.williamson@redhat.com>
Cc: Leon Romanovsky <leon@kernel.org>, Leon Romanovsky <leonro@nvidia.com>,
 Christoph Hellwig <hch@lst.de>, Andrew Morton <akpm@linux-foundation.org>,
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
 Robin Murphy <robin.murphy@arm.com>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Vivek Kasireddy <vivek.kasireddy@intel.com>, Will Deacon <will@kernel.org>
Subject: Re: [PATCH 00/10] vfio/pci: Allow MMIO regions to be exported
 through dma-buf
Message-ID: <20250731002138.GD89283@nvidia.com>
References: <cover.1753274085.git.leonro@nvidia.com>
 <20250730135846.2208fe89.alex.williamson@redhat.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250730135846.2208fe89.alex.williamson@redhat.com>
X-ClientProxiedBy: YT4PR01CA0073.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:ff::24) To CH3PR12MB8659.namprd12.prod.outlook.com
 (2603:10b6:610:17c::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR12MB8659:EE_|BL1PR12MB5778:EE_
X-MS-Office365-Filtering-Correlation-Id: d1ffe96d-a53d-47f9-aafa-08ddcfc837bf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|7416014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?dxRWaf01AGlEQXan3FZtyaRabWJoZR+VzqRozd71Ryhs0/blct8Ty48AbqCL?=
 =?us-ascii?Q?glyCF6l9Rsx7MRs1wuvlPpQhmd++NEWlApfzH2U9XUDmiCKD/2lPmk8ahGwr?=
 =?us-ascii?Q?wd6bWFgyJlgG0R1cBk1mt9LWQj3eauRyrmSBKd6ya4QL3RcwUMq6EGBBYD7t?=
 =?us-ascii?Q?lYghugsWSSzV1/XGdOnhqjcPdNP0S9j4MMxmdOc5cXcmzGjLLxs7Teq+MekX?=
 =?us-ascii?Q?ny4DwdHBu7DDRMXWXZjAOXi3RdkpRnSVGekSyhnNJZndufX72SClTqrp+AvN?=
 =?us-ascii?Q?D18x1cAFGAEN8cAQsSZTa8KRLnjjnBXik7e35QpnuUakU26+tNmrrWxEhAJi?=
 =?us-ascii?Q?SYQrwAKODKD6Ds8GPJH/0SG8HOlhq+WR9dxYzyCUPNjDOjNqRsvIJHZL/8Js?=
 =?us-ascii?Q?JdBpMtSigyvMryameBm1+yBd+ebmOjZcIKl1KqBese81HnyDPZ/UxJGUb1vS?=
 =?us-ascii?Q?NfhIpszvAcyG9DtLirgTAZufDtB27HSBqYXo7mq2/w/nwLVPAd+DC8ASFj1H?=
 =?us-ascii?Q?pSmtj6a+p/5C18rlWno/FbfJDiGjNdDuNvqHhB4hHvHCjGWKjvv3UUKP0ADX?=
 =?us-ascii?Q?mtKP/1W9bwuc5efACcIBK4V86CnU5ulyvF4213KcQniGKFZ2LW2iUuVVB5ne?=
 =?us-ascii?Q?7S0UDkE1lI3ZFSx+45nXN6OM77Gk9zWrjcnNtdnxmgRc8Ft8zGUX3f0PO1hB?=
 =?us-ascii?Q?h70UuirG9/jK99+hMJM70I1Re2fxSh7KiKutWuzdXg+Y1269bm5ExRgtcDXP?=
 =?us-ascii?Q?aJ5rLHwOnWWc7D6mUJTm7EUsdFOSlA31RuLofO74B+tF/3KEHh2RdphOCNjM?=
 =?us-ascii?Q?rcNWEZQpJBeoXHMsAPoC9OzDwWlLINjsXOEmQFw0/L3jef2j049ffxeFwOgW?=
 =?us-ascii?Q?hM1TbpjAWKsRinRtoZTdOAZaFNLJdemNV5UGMmDyYIgYyF3J/qfayJkdV5Ft?=
 =?us-ascii?Q?KjtNeLFulf4VRQreCmj77OjiyaamLO1iYs8Adyz8nCxYjbJukOlb2vYceAvC?=
 =?us-ascii?Q?SBwLkBqlCwBZNWE7r7209pPVOGTnThq3INdlRbHs7xXkxzMZ3kBn/D8dIH7f?=
 =?us-ascii?Q?bx9W3OL+BDSNM9T+S/fB2SNciUCcPCRKPcySU0jEy9PRnmokMjvvmGePb6Fl?=
 =?us-ascii?Q?8rzyUCQwzx1rpuOwklQfBBIOq8XETkIOgO4WAH1H1DKoQmxyqnh4fOL+0gRX?=
 =?us-ascii?Q?kiPk9qwHf6mta9PbqwRUhLLfP9L3kMJyF3GIu1Vrm/LkL5DV5CKsFWXn/Gf0?=
 =?us-ascii?Q?WB1LZdEIV+lUposIMC5WjzQz1RLBEsrKhkzVW9KFvTVwIRXvQcgP1xZJxTC4?=
 =?us-ascii?Q?hQOvokPq7pbOIjV9CyWfRrzIPKWpkxNQVp5C6CzTcxO1ohy9V2oGbB0Oj0n0?=
 =?us-ascii?Q?+B96NqUAyZJtBTq3rXYn7IVBefcJQ7jJBSTKN5XP0/BGJYzNollD2ipBsDgR?=
 =?us-ascii?Q?DeAqypsi2EQ=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR12MB8659.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(7416014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?xKQLOU782IHWQbOI9s+JVlVD4xQ/rfUmlW1rQIQq/0sMVjQC1VA1azM9HTyo?=
 =?us-ascii?Q?GnRXQoIpRga5MeOOw0fgAgXpA4+dliSyHD7V3MKhPbebad79vk9aYyTj/iDm?=
 =?us-ascii?Q?9YkoJvE9HpinruzZUAflCDip8YlSrBVEU02L8hOUhFNUfqkYdial4i6fWLd7?=
 =?us-ascii?Q?KEhMWV+GGQ50RNfgo62kGN2VCiTTeuT6R++f2aPRPDdFJXtctxi8nEOu0Nbj?=
 =?us-ascii?Q?pUH58e/xFFQ0ptDGGau5N+7ee+Z4L3WwR5qW0T4ITvdOQzk/QeAVLueMFVwg?=
 =?us-ascii?Q?8QVn+8vqNzwvz3Q5B9OiW76E4nmQPYpK/xGQ/NJc8AAgK8VNxNKcEH1OHBc9?=
 =?us-ascii?Q?Uh5B2D2/Yk3nWECmPh1Ix0FI9irisrVcbmYImzxMMj2ZTdJwMz6vLT1UdrvF?=
 =?us-ascii?Q?xA2Hvqf7qS6gFIIKrBU4dKHGQFUGK0V+mLDgTTuWU68OXtrlNFqk2lPJDUNu?=
 =?us-ascii?Q?8NG2AxuUZs5y9PZYpxcNIGxWBddcV6gbB2vbZiLe5ffPXwORPXt3BjR3j3tM?=
 =?us-ascii?Q?TnkwrlOPG9UOcIr8Gs8Ee6kUnlZxp2rvNbjqfnnFRX9eIbcZNLVeiGApnRlb?=
 =?us-ascii?Q?TGZP9LuP2GkoCDL8wGM7V0wA652ySoLgyElntR2a1GbiZVOMDBU03MFkZEZi?=
 =?us-ascii?Q?29w5iMdg5qtN8mIx2iZix37lQsD1IeVBc37cjyZI7JfAETTdwTxrowJ7OqU+?=
 =?us-ascii?Q?QmHvQB9vgduD/3c1o/C2T0vtHWG+pOB2nyOJdIB3J1TFfHxlIR3bV7zwWT11?=
 =?us-ascii?Q?ur7uq4nv3lAjr5psmpwqRO8yaktD+GoG55vi37r44mIbVrnXHDq9cYXBOOtI?=
 =?us-ascii?Q?ujS+Q1Sbz0SUhyuFCynx+YEaKMWu21GYLzEsxf1h5Ug94m0Fkk44rgvDnmq+?=
 =?us-ascii?Q?J4YaI7iCidVdrcTfnRUIDTjJQRf3qYBMMdRgmsRGSn2xJJ0HNWTOJJ1XQZXZ?=
 =?us-ascii?Q?efZCuTb+B7of7Dhh4u6ZxZiGi3Wfkeg4qGi/dy4BVf2FTRXRtJxHF/AHKheh?=
 =?us-ascii?Q?QlEhxRUjd8N5OyiQnKysPbDDbJRCRiId7/IH/LzB60v1WyAKMdzxQNZ380n/?=
 =?us-ascii?Q?K5FVno/DfooD9vcMAfJcglG68wvciNDC1yqo4507KbCIX19vUdTMSZQuMNRn?=
 =?us-ascii?Q?Mbj7yPra5ROXAns9Fe/srSUb0rtjQy6Z4HTFTtTrdAhw+FOduBpv6rJXk3lW?=
 =?us-ascii?Q?f4Y0mnoKMdDG8joSfiLQqGExVDAuwfq9Rum3y6aizAwEMA2dGjY7s2i2zkuz?=
 =?us-ascii?Q?a73jNIIbynrNzFPjW1AXdw5d563pgyTfMOvWVWvAStDZjdVDqiShYhNc2W5E?=
 =?us-ascii?Q?m+GtUf2xx4vbCAMrTjSt28QBNYkeML00GxcJYTK/j7oXQpCiOVTYXEphKxUD?=
 =?us-ascii?Q?pOlDFmNVl3eeo27uFM61QXoRBuDbymIIcXISUF8664nxxSuRnr6Gr0nDpk/s?=
 =?us-ascii?Q?GCFOaSnwtjSO7sAVT0hBmXVNcow0lHk2kG0aLXZW7ck8juVLh+SEXig/r9Br?=
 =?us-ascii?Q?iUfdgQJiP56f7MscCEbI8jjoDwKWUouB6P84IR6Wgoljca7+oHUMaE/zcWF6?=
 =?us-ascii?Q?TSbq4Nm5YgbQKZ2urxs=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d1ffe96d-a53d-47f9-aafa-08ddcfc837bf
X-MS-Exchange-CrossTenant-AuthSource: CH3PR12MB8659.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jul 2025 00:21:39.5092 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fBZKic+StbzkFL29chHmNUk/woDv7MiDJk3hrz/b5ExZHWvZ5RyJI+O2dUe3aKYN
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5778
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

On Wed, Jul 30, 2025 at 01:58:46PM -0600, Alex Williamson wrote:
> On Wed, 23 Jul 2025 16:00:01 +0300
> Leon Romanovsky <leon@kernel.org> wrote:
> 
> > From: Leon Romanovsky <leonro@nvidia.com>
> > 
> > ---------------------------------------------------------------------------
> > Based on blk and DMA patches which will be sent during coming merge window.
> > ---------------------------------------------------------------------------
> > 
> > This series extends the VFIO PCI subsystem to support exporting MMIO regions
> > from PCI device BARs as dma-buf objects, enabling safe sharing of non-struct
> > page memory with controlled lifetime management. This allows RDMA and other
> > subsystems to import dma-buf FDs and build them into memory regions for PCI
> > P2P operations.
> > 
> > The series supports a use case for SPDK where a NVMe device will be owned
> > by SPDK through VFIO but interacting with a RDMA device. The RDMA device
> > may directly access the NVMe CMB or directly manipulate the NVMe device's
> > doorbell using PCI P2P.
> > 
> > However, as a general mechanism, it can support many other scenarios with
> > VFIO. This dmabuf approach can be usable by iommufd as well for generic
> > and safe P2P mappings.
> 
> I think this will eventually enable DMA mapping of device MMIO through
> an IOMMUFD IOAS for the VM P2P use cases, right?  

This is the plan

> How do we get from
> what appears to be a point-to-point mapping between two devices to a
> shared IOVA between multiple devices?

You have it right below, it is a point to point mapping between the
vfio device and the iommufd.

> I'm guessing we need IOMMUFD to support something like
> IOMMU_IOAS_MAP_FILE for dma-buf, 

1) The dma phys series which needs more work
2) This series to get basic 'movable' DMABUF support in VFIO
3) Add 'revokable' as a DMABUF concept and implement it with mlx5 and
   vfio
4) Add some way to get the phys_addr list from the DMABUF
5) IOMMU_IOAS_MAP_FILE using a revokable attachment and the phys_addr
   list. When VFIO does FLR the iommufd can remove the IOPTEs and then
   put them back when FLR is done.

It is not so much more code, but I think every step will take a lot of
work to get agreements.

Then we reuse all of the above with some tweaks for the CC problems
too.

Jason
