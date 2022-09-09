Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C991A5B3A6A
	for <lists+dri-devel@lfdr.de>; Fri,  9 Sep 2022 16:09:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D754D10EDC0;
	Fri,  9 Sep 2022 14:09:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2040.outbound.protection.outlook.com [40.107.92.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 64E4E10EDC0
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Sep 2022 14:09:11 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AwqV17AQmgaxRuXlIDsykTD4n+bY4nKXB0/q6yPoXuJ/G3gCW1viM+9LWaWDy0hBN+b9hEraZ/5ko5nbNEYx3Up7nGue4TXHYgS+qSOdANcbhQ5qrY+Kl/w/PwbYWp5FtXcipUlPBx0yQDoUK/ySe+9y10d8kBa7GnMZcNAixPmFdBBRzNVJS3gCz4GhMVzU/Dkukou8eftQaZb67z2mbYRpoOEBiGcJ2/CfHIyIBtedptJBSr1hjzc2Jt6XzEWgnM7vGTzFrcpQ8nDrYRlUihvBWKzBAex8wGQ5cWRKgmsWimZPOzqKLbPnrUkPwARpgRLQJNgyC8LE5cLmR1Fsrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VDDx3Gzl0z/3q1o5OT+nLG/+juHQj0ulWrpoO/hsV0Y=;
 b=UtRfvSP9qVrvI1E1Tuxrnzg35nz5DSpbAZ2GD1BlnCqKbGnRuA2aulULbpbsDtoR01frMGetGQ3lfM16KnmvR6pRVSsEHkImbLq2aPIwlfU7EJaGpM17JTjXtp/I6LuOMN2QXpOXeE+iFQOHC9iqd5eKsDNuRZqXE1niRTopWJtFofdQD1bxQ2RUZpqAwnkr2Rtn9dN68ZE2IlM5pHhFdmi9WkiU8J56skWK14dtB32EauiJ1DyaeI5ijRLiY23SRvGcty6JlxSx8teh0E0enY+AOn28VZA3Zp8okc4AhEppavBmw43e7frp6rT0KKcLc97VEPNsc98bOODSxNUN9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VDDx3Gzl0z/3q1o5OT+nLG/+juHQj0ulWrpoO/hsV0Y=;
 b=Zt0HNVYhpZG4nNgdZNbNUeKyqFgoiUUyrCPuXqflrhR3dZiPBtQw9HA1qW0v0PzHjjEOuZzvVAUbG4LhK1mx1ztc70bsF0YUbwM1zHCna+VceXKxjVReZT3Or+hqEgeBgwoUyrDzeBS1JiTz4XqIcJMobGZIWU/rLnejSvIPrueK/tOC4UBVRHkU0qoPkhUxxG8gH1Nk9+B2cCo+YQ93JC8nIb2DSZMVpJndMjiKSYIJbt+b7YuzgG+gPobZydzlOaGyLRI06RBySVa9PARGP3JXcnNhuvpQyplvBAF9Sj3rvQdBNsF7kHwYBfVxghBO1W+Q352aDlDmXk966kYpkA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MN2PR12MB4192.namprd12.prod.outlook.com (2603:10b6:208:1d5::15)
 by DM4PR12MB7551.namprd12.prod.outlook.com (2603:10b6:8:10d::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5612.19; Fri, 9 Sep
 2022 14:09:08 +0000
Received: from MN2PR12MB4192.namprd12.prod.outlook.com
 ([fe80::462:7fe:f04f:d0d5]) by MN2PR12MB4192.namprd12.prod.outlook.com
 ([fe80::462:7fe:f04f:d0d5%7]) with mapi id 15.20.5612.019; Fri, 9 Sep 2022
 14:09:08 +0000
Date: Fri, 9 Sep 2022 11:09:07 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Christoph Hellwig <hch@infradead.org>
Subject: Re: [PATCH v2 4/4] vfio/pci: Allow MMIO regions to be exported
 through dma-buf
Message-ID: <YxtJA34l5pYhZaCQ@nvidia.com>
References: <YxcYGzPv022G2vLm@infradead.org>
 <b6b5d236-c089-7428-4cc9-a08fe4f6b4a3@amd.com>
 <YxczjNIloP7TWcf2@nvidia.com> <YxiJJYtWgh1l0wxg@infradead.org>
 <YxiPh4u/92chN02C@nvidia.com> <Yxiq5sjf/qA7xS8A@infradead.org>
 <Yxi3cFfs0SA4XWJw@nvidia.com> <Yxi5h09JAzIo4Kh8@infradead.org>
 <YxjDBOIavc79ZByZ@nvidia.com> <Yxs+k6psNfBLDqdv@infradead.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Yxs+k6psNfBLDqdv@infradead.org>
X-ClientProxiedBy: MN2PR01CA0019.prod.exchangelabs.com (2603:10b6:208:10c::32)
 To MN2PR12MB4192.namprd12.prod.outlook.com
 (2603:10b6:208:1d5::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN2PR12MB4192:EE_|DM4PR12MB7551:EE_
X-MS-Office365-Filtering-Correlation-Id: 3e33b889-8257-4473-b5a2-08da926cdcd7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: lvGBu2QoSoqQMITYZEFsZzW9aAbXhGVaPQ9pVFAqNXJmuJai/GiT76EbK8VGtshmiIQzy+XDMJnZ4W5V2ZB5pmxMUOxK4PWe59sq7pYlBDjU+S8XW7IEtZXdWYiwFVKINi5ERs5f+aHyKzL3nbkDZYcjvkqxOZsw5fVqMohJB5qhnpTVKPSwvcvgajiJP9Q1rMOTt0JL3rzbLw2nwoom1rfgOmG9YRJyt2QP5gBy21LKZRbpzU6wqTj/oUi83c1Ob2eryulRqJC+sXmNGSgaymTVKFxqAsC64tV0+2+IEcaVhwBV00bMZSHGX70Jx1BRTNDkR4DOYpUJuIhmRiPxNb3tGJbKHMcQR7bpBfSVwjpkQCxB7jqe30HuraT2IEbeqcs0gOgoP2vrLNnso9RhscVZNfvT20zOaqz/YZBU+2sP9U5UkqdOMcY7tj5ih8zirlXST1E3pCzCRuKqTDJXbO5aMTL0qZcShuqIHzpvFdw6NXXfZvVEvp3olAN5BX2nuR8179FhyQwVSu7tt3n7xt7QOlT2xQInyw9OcHtWAZmllfRbwvCRniEyJ3BUyQ26OgFxwxSqyVdhWcIVYPhWNqQWehTXhEVfwM/6MkLgK1edFNA3MCmAppgzGuse4jNPDPGHnuSV402Ul/6BfQOivH61cz4kiTEgp2KFGyaar3r06u8K8vDXnACilvzupJpU3wYjH0qczwuLMF1PCfNMbA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB4192.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(346002)(376002)(366004)(39860400002)(396003)(136003)(6916009)(6486002)(316002)(54906003)(86362001)(2616005)(186003)(478600001)(7416002)(6506007)(38100700002)(26005)(6512007)(2906002)(66556008)(8936002)(5660300002)(41300700001)(8676002)(4326008)(66476007)(66946007)(36756003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?o2t8RfIp3LClSwtaZmn/53MaLtcfx53Y/bcuxTmaQ0Y4E4FzaQ6I8QwOoqli?=
 =?us-ascii?Q?cRu33CLP3QzwXiy+Hrk+9OI71hCc8rNd+06j+vIvIrIa+o08V4PEZQMDUHcU?=
 =?us-ascii?Q?DlUAo9vaOgWYLK1eyjvQ9VyyUNbJ4+eXdkfteJtHkfvqSPyiZmQwlsf1xAMa?=
 =?us-ascii?Q?uxyHf0Yi6Z3L0c6kV8HX/Ov0KYTx54Mqbv6h/zJg/pbWyhS8RKiJb0SfbUvp?=
 =?us-ascii?Q?Hwve1rQux53Et89z7M3ZGe79tSdTghaab5xdMnRJzSf7d4/mM8LZ1LIcjrjh?=
 =?us-ascii?Q?hAjMGqjyEno3sfNBi6nevZQpwsDgbJuyLmotfbCyNjA4Jd3Mj6N9dmLbEXTB?=
 =?us-ascii?Q?lmEfbjWcXDQQB1ynOapvxMOPsFQVsBScy/gXX2RrpnMURTCVrria/2kLGGxK?=
 =?us-ascii?Q?Smkf8DJsY/fAx+MonNX7XdSzlGX0nu8RHLUEkG9EUu4oJCPKz1lQX6Af6mCs?=
 =?us-ascii?Q?ZRH7hOHOfjFs439iMop3TPZwKjQUv2uJWphSMF/Cfa4qH66MIaWzCarJ+XBk?=
 =?us-ascii?Q?aSlubpNNl3esIa6bMIhmLRItMXtvrBbVnPEdjOPpR0L7OwHswCu+MoWwx7/L?=
 =?us-ascii?Q?jtX6rCjvsdW9Djj63qzuhlE38IcPlCOaxhGGB3uIbpLExnMvID8M2X2kZEHw?=
 =?us-ascii?Q?Fq5PMw1NFvnfrUK8rMxAvVmxu3kSD/We/AZjRCbsgu2sMuW3+PVUyZCqu9so?=
 =?us-ascii?Q?nP0jTwowqrfOnn09AWcsh7WkTSwQA/SZAeQjZthv0/e6tIosp/sHuGTLYzSB?=
 =?us-ascii?Q?79YB7GDudmj7VN9rVBQwTh4NM5z4qTpjtFFUs/Q7D1h+IY8qiFYlXvcjR6PW?=
 =?us-ascii?Q?SRKKtkQ37fUxjUKgFc+VPoaJHYDGMuwDFOQ/9gcXjT/DuGOZDDe39a0wv5TT?=
 =?us-ascii?Q?d36btNADQ2SI6/Hif5yspm+Whv8omRT2WbFEq4cbLyyntllg4exea59LghD2?=
 =?us-ascii?Q?wUkV6rgLT5kuwsVH9ZdFTo9uTX2Ph2TPZ5Ux1hKUzDjJZZ2I/vn4vt5SsxW9?=
 =?us-ascii?Q?hVH7+WqGJskwsDQlRflUiGyWTJKHd6Ay5I2WR5LsbHs6UYQyLF3OwLNYcaDU?=
 =?us-ascii?Q?ZgEjTsKBwY2qO/HMxbHfdey3G31WinJ1P6n1OGlgdsNydFLlQ8xFTs1nEk5B?=
 =?us-ascii?Q?CW0/K04pGZjGEKOavUXNESxdSwoOldKGlT3KwuvYF7PAAghTk8/QSgop67nn?=
 =?us-ascii?Q?o8hi6a1Gdu3nJCfgSXgv2Yl8ibSTQwmRRcYnqDqcT0PM5LuGWvA5UdXJ41yD?=
 =?us-ascii?Q?F7CGDNGsCP0qi+vAliQFNGgzelOkGcEIFiSP6tmiQiGKOEIc0Q4xyHEm8NRP?=
 =?us-ascii?Q?m65t3JMT98rbCnYpkmUoujq9+ppNtbUpHoMhatbpNSM29LJWngKvXJtS3AAQ?=
 =?us-ascii?Q?8UdiYpnAVPrk4IZCOBBe3ZFhvEE2e7cpQv5GCDMFINb8mXNhEEO9w6LwHXoc?=
 =?us-ascii?Q?HS7iWmODW9wCpcFl3QzOtt67VP/EGpkhE5QS/+M9tibV07rtN5i8Q4KJYOYB?=
 =?us-ascii?Q?4nVGxLxAmJZt7u9Gezb3B9sduKnTSYSyy803H0qiuPsfRU6h2LTTblIOoQUJ?=
 =?us-ascii?Q?fsiAcpl+yaS/RIzXfryoFgUTX1tWK68g6t2nIiuX?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3e33b889-8257-4473-b5a2-08da926cdcd7
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB4192.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Sep 2022 14:09:08.7000 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vwuAk4RxKxbKYgMkqNUcQLWVy1c1om0V2U4vi15nid1b/xX8usyodY15nvilTI7W
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB7551
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
Cc: Leon Romanovsky <leon@kernel.org>, kvm@vger.kernel.org,
 linux-rdma@vger.kernel.org, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Oded Gabbay <ogabbay@kernel.org>, Cornelia Huck <cohuck@redhat.com>,
 dri-devel@lists.freedesktop.org, Sumit Semwal <sumit.semwal@linaro.org>,
 linaro-mm-sig@lists.linaro.org, Alex Williamson <alex.williamson@redhat.com>,
 Dan Williams <dan.j.williams@intel.com>, Maor Gottlieb <maorg@nvidia.com>,
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Sep 09, 2022 at 06:24:35AM -0700, Christoph Hellwig wrote:
> On Wed, Sep 07, 2022 at 01:12:52PM -0300, Jason Gunthorpe wrote:
> > The PCI offset is some embedded thing - I've never seen it in a server
> > platform.
> 
> That's not actually true, e.g. some power system definitively had it,
> althiugh I don't know if the current ones do.

I thought those were all power embedded systems.

> There is a reason why we have these proper APIs and no one has any
> business bypassing them.

Yes, we should try to support these things, but you said this patch
didn't work and wasn't tested - that is not true at all.

And it isn't like we have APIs just sitting here to solve this
specific problem. So lets make something.

> > So, would you be OK with this series if I try to make a dma_map_p2p()
> > that resolves the offset issue?
> 
> Well, if it also solves the other issue of invalid scatterlists leaking
> outside of drm we can think about it.

The scatterlist stuff has already leaked outside of DRM anyhow.

Again, I think it is very problematic to let DRM get away with things
and then insist all the poor non-DRM people be responsible to clean up
their mess.

I'm skeptical I can fix AMD GPU, but I can try to create a DMABUF op
that returns something that is not a scatterlist and teach RDMA to use
it. So at least the VFIO/RDMA part can avoid the scatter list abuse. I
expected to need non-scatterlist for iommufd anyhow.

Coupled with a series to add some dma_map_resource_pci() that handles
the PCI_P2PDMA_MAP_BUS_ADDR and the PCI offset, would it be an
agreeable direction?

> Take a look at iommu_dma_map_sg and pci_p2pdma_map_segment to see how
> this is handled.

So there is a bug in all these DMABUF implementations, they do ignore
the PCI_P2PDMA_MAP_BUS_ADDR "distance type".

This isn't a real-world problem for VFIO because VFIO is largely
incompatible with the non-ACS configuration that would trigger
PCI_P2PDMA_MAP_BUS_ADDR, and explains why we never saw any
problem. All our systems have ACS turned on so we can use VFIO.

I'm unclear how Habana or AMD have avoided a problem here..

This is much more serious than the pci offset in my mind.

Thanks,
Jason
