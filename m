Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C3825B086B
	for <lists+dri-devel@lfdr.de>; Wed,  7 Sep 2022 17:23:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8261D10E7A8;
	Wed,  7 Sep 2022 15:23:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2041.outbound.protection.outlook.com [40.107.236.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7391A10E7A8
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Sep 2022 15:23:31 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ag5vWjCUC/DPITMZLoJbf4o1HkMcTvNEE/g7bWjUNiACW0FpY18I87n9FKTPDKPHnmvY9iW9sE1GO0jVHUDX5GI7RYjhKDQ/kzByoPl0VRAxPyOf7aoraST6ebB/BL9gnn1Z4ceplyZlSyfDQsNjUhLo4yRaU66/qSQAFPiYXqyK9MGv0dh1h8whnueKW0KDWuPR3zEWuhF0tT/A985fg2v1gqWWQakF9o1hMWU8YvWd1OQTma3bTeFeqih4hCfT74mKb9QcVpX/0QiUr2Tzicdjd6KA88wCf4y3R2+4L/D4cj5MQ6s4nf9Dx4IaytnVjp77ZSc3F8wW84ViHu4+9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=V8DERML3z9h5+o593IGCxyePK0C6b23wM6dzB+xUHV4=;
 b=n52QnFn3aUtCZqjQfmKoncXLQ2d8dxHpntWK0FLeF8ikx8QLblByGjbG51biZgbeqHa4xI1Yi6iF5daUa5WjQXLib6WPE/oAbLuBgcZ6ufetbf2bZ6u8Q7qCYrJlQ2HDsPgy1fqaoBd3VdLPjHtS9Y1vkB0nr2kvWlxDXRpjft6Rri/a9CtBaYXjOYIhWzHl/Jb4HxvGdQl0Ge1irn23KwgN3pyfffx2qE1wvI5fshyoLIdthPqplkvFuuH6ccUIa09duq6jLL/ToOIlyp9TS+7JY62TC0fXEljcb8s6k0gu5W48+FZjED809cWaSwxjXo0gUwpbvwSKidNeOjJlGQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=V8DERML3z9h5+o593IGCxyePK0C6b23wM6dzB+xUHV4=;
 b=EPGW2j+0mraZ+2JpIx/Ta1IE9tsEfxB6BKMl8HuCHDlllUs1lSv2IPSUcyYlWtLVo7XnUJfFjdh4Z+f/w9p4xLvXkqd7vXWnEqabOswHJzOphAxhz/HJrA7DF4iTExPQSLwEhh575O5HeTdXMmx4IyWF6JZbd8HzkRUxUXg0Tjxzhny3xu2z3fkDfUYruE6CKGuuI2Mlhck5QjXGDStPiHqFTCV+MvBQg4WhhJgXU5CZw1Pb+4sQb4p1fXgZ7JaMGIThKrbcWS0aLKiknvN3hY35kB6GYAifMSn+cTFDxVE9MUIzTR6smEQkaFMKEAF37G/Xxm/eUUJx3jw8AgFI0Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MN2PR12MB4192.namprd12.prod.outlook.com (2603:10b6:208:1d5::15)
 by DM6PR12MB4435.namprd12.prod.outlook.com (2603:10b6:5:2a6::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.10; Wed, 7 Sep
 2022 15:23:29 +0000
Received: from MN2PR12MB4192.namprd12.prod.outlook.com
 ([fe80::462:7fe:f04f:d0d5]) by MN2PR12MB4192.namprd12.prod.outlook.com
 ([fe80::462:7fe:f04f:d0d5%7]) with mapi id 15.20.5588.018; Wed, 7 Sep 2022
 15:23:29 +0000
Date: Wed, 7 Sep 2022 12:23:28 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Christoph Hellwig <hch@infradead.org>
Subject: Re: [PATCH v2 4/4] vfio/pci: Allow MMIO regions to be exported
 through dma-buf
Message-ID: <Yxi3cFfs0SA4XWJw@nvidia.com>
References: <0-v2-472615b3877e+28f7-vfio_dma_buf_jgg@nvidia.com>
 <4-v2-472615b3877e+28f7-vfio_dma_buf_jgg@nvidia.com>
 <YxcYGzPv022G2vLm@infradead.org>
 <b6b5d236-c089-7428-4cc9-a08fe4f6b4a3@amd.com>
 <YxczjNIloP7TWcf2@nvidia.com> <YxiJJYtWgh1l0wxg@infradead.org>
 <YxiPh4u/92chN02C@nvidia.com> <Yxiq5sjf/qA7xS8A@infradead.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Yxiq5sjf/qA7xS8A@infradead.org>
X-ClientProxiedBy: BL1PR13CA0073.namprd13.prod.outlook.com
 (2603:10b6:208:2b8::18) To MN2PR12MB4192.namprd12.prod.outlook.com
 (2603:10b6:208:1d5::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 81736f63-3924-4cc6-e846-08da90e4eab1
X-MS-TrafficTypeDiagnostic: DM6PR12MB4435:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: AMYRRE07QFKgedKfToavYzQoSUV0zNps62Qc+kuhYRBf6ops/Jr7xZjbFjMHPwKSY44/J3+2VZNIYXSrJvOoK+o83Hw7+x81lXpRdf7vK9mFGVHchT+aee18Ajwdpc9i1p87qL8dQNyhuHbNtMqzzuKlWzFW4bgvchDo8thwYdHRFnIFtX7a/YecF38LTFvIsR2Lf5GZaBw/Upa1fFYeKZewpsKEUVsUFjztuLAyxaqoNkp94wH2tZxhwRKeh56NudLXzDN7IdriV8XKZR9XYyK993Mo1pgWl6sknTthWnjCHKIPNLkwmom5Uz9qkyQmDpCA4ycB0GVlfzwI8wrDBy2cDVobxUc7bUlUQ7pnRSvuOhAiz3RQxWHIY8u6rGlY+RaCEBEXzeMR6K5p4uE+fFHOUCB+efsuxGwma2YEr6Rhih+AmvvWmfWQynnbdxqD2Ds89OcZ00dDgXaYEDHNUS6ONj+1pEzc5BO7MeKScNVpyaCu9SaEAJfduIKXaApNK9iyCgmR4Ln0QL4mg5Gz2L+cvj5R9qskzhxdigd4J4rfAfXYXMZFiwWUR+Whh8V/dgnYckDhL7sd0CBMpTUK2gIUeNmQWs8Lmu6GBU4EFI32LcyOIX8QjV1FRCDA5dSPzPiihck3r4SIrqRx73x5Y1akvpv9qUt0nhrI4I0h2q11hJs2bkBVycN7Joz5sa0Ae6hmSaKGl7R7R1ztgh/5Bw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB4192.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(136003)(396003)(39860400002)(366004)(346002)(376002)(38100700002)(86362001)(36756003)(2616005)(6916009)(54906003)(186003)(316002)(6486002)(8936002)(478600001)(66946007)(5660300002)(8676002)(4326008)(66476007)(6506007)(66556008)(7416002)(6512007)(83380400001)(2906002)(26005)(41300700001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?+irHNfu/PVudF6B/oUtlxYFfmlLZ1QzdDJ9OQhQXSjWE6Xlhx8x8bDwumLI+?=
 =?us-ascii?Q?AyRf0tL8n8CLd/iOysWXmDvTAWwXlZIKvzAxeZycQr7mJZ81ksXnmGvII442?=
 =?us-ascii?Q?Eu35F1Et4jhdIe3nj/f0QSJr9zE+mtfVD1ldm6ampHkAfryxGayARokks57/?=
 =?us-ascii?Q?Lu2wkWcHl4cZ+9MKHJY2NmM9n2Zs36j1tWmXCaFafnw91ve8Dy1c/3LugmVE?=
 =?us-ascii?Q?opDmtPdbn03zd6EBfBAqk//trCwiIAyIgnNztwZtXogz5ZfyR2KDHBz7V0oP?=
 =?us-ascii?Q?/KOovAIpjIR8PfZYW3upfsK0ijNfN47l8T8MjnlyoTMS8biY3ru2CoH8EtuX?=
 =?us-ascii?Q?1cM+c0HnLzHef6aqo2TxyoiaIJazDPZSlIzaNE04+d7OM2OjPR3XLzndTobj?=
 =?us-ascii?Q?oT+KD9Iua4jYfvWF2wWM68nvZKskdjFzhs27JXmNn/cH/JVj01lxgrSZV7P4?=
 =?us-ascii?Q?vYHuWUlRmCCby6gV98Y/lbFmhYmFem4W6Unpy23OMPUySdlvRAsaEEFWQTDr?=
 =?us-ascii?Q?ohf5HSnlgaN6flqEatpDVdSl9nnCZ1KoyaZ61OxhKQMMGPq4vHwL+nJx4LuH?=
 =?us-ascii?Q?Pe2jNL+S0Ay2KOHUKbhqDkBlayOIlhgDW5nvAKVcpSLaf1XigGkBEc9vtUDc?=
 =?us-ascii?Q?QnKyiGq7YYrTYUiWZcf1B/ZtchF+o1WWSvnLN7gvaVKVBzKjjWWnsp89yUYr?=
 =?us-ascii?Q?ifboxkDao5RoyFYVZ4CX8/BnTUxAcj+hNgQvQClSPS52f/VI/Jgx8bDmzAEJ?=
 =?us-ascii?Q?A4ImpfxSpUD1WvUpc0FJMSPEhIKSo2mKf4AoJEgpBoGpFv1zd62J+ti68zJj?=
 =?us-ascii?Q?Z6zrrC2wFU9yVeFbrKmi0hfdfZtbT6qc0p47gYX2Q9xj5gnEMYTKuvroLxlO?=
 =?us-ascii?Q?DHPV1hFPY4x04RXwoiUF+qpeQ2GfOlmbKe+9cqw5aIHUR1uCQmcROSVpAyx5?=
 =?us-ascii?Q?GGajXTgGssqjw18mw6A0q1jJMN21wIwSKHX0vTktpFaHSD8g57X3qfCRplVt?=
 =?us-ascii?Q?4S/lQuYgqvUDwKrPOVHoSJv9F+iYitvtctIQJlkKq/AO8H89aNanuiiNgLW1?=
 =?us-ascii?Q?Sg8NGtZgGJmOE7+Z9Ad9OKmaT7QhNT1xXYyGY00PhqSmmVBvDKWwGgHVkoTo?=
 =?us-ascii?Q?Efvxrq2PLEJsZ8Yhoju+gKnW1LMVTWAkRwPJGhPfChqiglI7XszxioPdyY7I?=
 =?us-ascii?Q?h7dTdOD8+vTxxivbdciha68IsaP1r+RKjypXddHe0B6CB6xDMWWVUNCGCge7?=
 =?us-ascii?Q?VeckVqWglemhLjAIHGBtb3ioD3Qdc1FIGTgl79Jhhe9WayUd2cwQ7+YbS53B?=
 =?us-ascii?Q?hZJEQIO3eDLZMDOcKqmobnnrOsNrd2pNBitF3ZOdO6t/6zkAdCwmHl4CtFeV?=
 =?us-ascii?Q?//S0NVGxOuvJQtto1aIA3nJ4ahXniHFyZqyoYdoMGOy7c5zJadT57OTCUX+f?=
 =?us-ascii?Q?W14wbOYVMz4A4FmxHIgLHogSgcN9TL5h+mJw4DQBawA/qU5GlMlBrmEhyB9U?=
 =?us-ascii?Q?K44HYa8vDPXKd48uHHOaEz2ltVmDfUkKT45x9gZj/K2A+aqsGjtpVk/HZ6ie?=
 =?us-ascii?Q?mPN0QiCqM+kun0M6L37p3k0dGwMjJT0j+8FbyVTb?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 81736f63-3924-4cc6-e846-08da90e4eab1
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB4192.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Sep 2022 15:23:29.2848 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HQnHK8gkKnY1fjHPqKFKYdvR0SDLrQkjs/8yS5OmfLIgf2lqbUiCfAnJtykGDHKI
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4435
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

On Wed, Sep 07, 2022 at 07:29:58AM -0700, Christoph Hellwig wrote:
> On Wed, Sep 07, 2022 at 09:33:11AM -0300, Jason Gunthorpe wrote:
> > Yes, you said that, and I said that when the AMD driver first merged
> > it - but it went in anyhow and now people are using it in a bunch of
> > places.
> 
> drm folks made up their own weird rules, if they internally stick
> to it they have to listen to it given that they ignore review comments,
> but it violates the scatterlist API and has not business anywhere
> else in the kernel.  And yes, there probably is a reason or two why
> the drm code is unusually error prone.

That may be, but it is creating problems if DRM gets to do X crazy
thing and nobody else can..

So, we have two issues here

 1) DMABUF abuses the scatter list, but this is very constrainted we have
    this weird special "DMABUF scatterlist" that is only touched by DMABUF
    importers. The imports signal that they understand the format with
    a flag. This is ugly and would be nice to clean to a dma mapped
    address list of some sort.

    I spent alot of time a few years ago removing driver touches of
    the SGL and preparing the RDMA stack to do this kind of change, at
    least.

 2) DMABUF abuses dma_map_resource() for P2P and thus doesn't work in
    certain special cases.

    Rather than jump to ZONE_DEVICE and map_sgl I would like to
    continue to support non-struct page mapping. So, I would suggest
    adding a dma_map_p2p() that can cover off the special cases,
    include the two struct devices as arguments with a physical PFN/size. Do
    the same logic we do under the ZONE_DEVICE stuff.

    Drivers can choose if they want to pay the memory cost of
    ZONE_DEVICE and get faster dma_map or get slower dma_map and save
    memory.

I still think we can address them incrementally - but the
dma_map_p2p() might be small enough to sort out right away, if you are
OK with it.

> > > Why would small BARs be problematic for the pages?  The pages are more
> > > a problem for gigantic BARs do the memory overhead.
> > 
> > How do I get a struct page * for a 4k BAR in vfio?
> 
> I guess we have different definitions of small then :)
> 
> But unless my understanding of the code is out out of data,
> memremap_pages just requires the (virtual) start address to be 2MB
> aligned, not the size.  Adding Dan for comments.

Don't we need the virtual start address to equal the physical pfn for
everything to work properly? eg pfn_to_page?

And we can't over-allocate because another driver might want to also
use ZONE_DEVICE pages for its BAR that is now creating a collision.

So, at least as is, the memmap stuff seems unable to support the case
we have with VFIO.

> That being said, what is the point of mapping say a 4k BAR for p2p?
> You're not going to save a measurable amount of CPU overhead if that
> is the only place you transfer to.

For the purpose this series is chasing, it is for doorbell rings. The
actual data transfer may still bounce through CPU memory (if a CMB is
not available), but the latency reduction of directly signaling the
peer device that the transfer is ready is the key objective. 

Bouncing an interrupt through the CPU to cause it to do a writel() is
very tiem consuming, especially on slow ARM devices, while we have
adequate memory bandwidth for data transfer.

When I look at iommufd, it is for generality and compat. We don't have
knowledge of what the guest will do, so regardless of BAR size we have
to create P2P iommu mappings for every kind of PCI BAR. It is what
vfio is currently doing.

Jason
