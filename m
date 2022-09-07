Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E5D875B09CD
	for <lists+dri-devel@lfdr.de>; Wed,  7 Sep 2022 18:13:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 014FC10E7B9;
	Wed,  7 Sep 2022 16:12:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2085.outbound.protection.outlook.com [40.107.244.85])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB39C10E7B9
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Sep 2022 16:12:54 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VelKTOqCHwGVafFprLytye3rsi0l54h0UuY1YLteJbx/T9nhFz3Eiuc+f+/cfz7JnS5e7wLCE6nAXukmEv6l3kBp2VNT6+xIUF0dHwepw30V72Nob9ovwiJONWZbT6Qrkem9C3ruExb7mnjeVhm8+9Qt7TyCdJZDs9SGEK+GAFsEZLDYNfqs3RL4tCqMrSBZUhOq2EReIgmdBT69ksm5qGGd6I+vsccPxuemIco+XPH4n5PJ0E2MTecM4Rfcc/RTjBJ0+mZdiTwxtYLn3uOtvRFHGPpO3T5awRKcfLyzDgnlQ68TYfugbiFue3T6fT0FotIrBahp7GcNGtfrr+FkNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1fpS2HEUH+gXTcE+CITh6CoMck63zatmBpJbw9hWhkU=;
 b=BraTIv7KL8y8PD/ROPw42mZSD8xdy+iLwV0a00oXsFMIRtKTlvFxXHZ/Jl978QAIcLMyl1Rg14yE8HBW5GmdeqYPXDNwlVPVvzykzcYoHPiCuWieiV3+mVoVZH6IqERiGX6KuuhK9q9zmZEvxaNu9Avx6bu8KMEjRwc7LfusWTDdLbeGr5i+e5g/cLoal4gBH2FGqAsWe7JqezAIYGLbq5GSJqh6+Pwzo6KEN8MzmZ9ixudrnYwmE2feGp5tJ1FxImNzUTCcTLHWBf/ld8CggSlYAcsdaH6Yrx3TVD9i0D81jpX4VuFbb+EHaXUQ9tx8Y8jo0QIe1Q2NnoKUsMLE9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1fpS2HEUH+gXTcE+CITh6CoMck63zatmBpJbw9hWhkU=;
 b=CQyDI7y4kHXsrjIkRljO9IeE5ZbV6l2VG4CB69k01cNDdDqCEVNBytCCyIBN/cJiDAAMhN/utILssqZNjHAm5Clm2k2PhCziCLbfpBVApS4R13ZLjBUJhw1pkPrLNGX8X+/15Mv8DWpWdoPz9+ocgABYcfAVlpoSri+Gxttb96nFY7gKxtajoYn0bME8NX3/fO7M/xZPhjxJhfHD01uvA9v+1tk/tYuAD4J0q7GHL2IfuvzcZgRF1mbmPkudSBholkGauWR4dGywq/Z9pAT8rwdzJj8rScZ6XFQxycS89UmGP0c+wzxGLJsLbT+CPKVyagUmulsmTDd2aF7ZrBP2rA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MN2PR12MB4192.namprd12.prod.outlook.com (2603:10b6:208:1d5::15)
 by DS0PR12MB6560.namprd12.prod.outlook.com (2603:10b6:8:d0::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.10; Wed, 7 Sep
 2022 16:12:53 +0000
Received: from MN2PR12MB4192.namprd12.prod.outlook.com
 ([fe80::462:7fe:f04f:d0d5]) by MN2PR12MB4192.namprd12.prod.outlook.com
 ([fe80::462:7fe:f04f:d0d5%7]) with mapi id 15.20.5588.018; Wed, 7 Sep 2022
 16:12:53 +0000
Date: Wed, 7 Sep 2022 13:12:52 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Christoph Hellwig <hch@infradead.org>
Subject: Re: [PATCH v2 4/4] vfio/pci: Allow MMIO regions to be exported
 through dma-buf
Message-ID: <YxjDBOIavc79ZByZ@nvidia.com>
References: <0-v2-472615b3877e+28f7-vfio_dma_buf_jgg@nvidia.com>
 <4-v2-472615b3877e+28f7-vfio_dma_buf_jgg@nvidia.com>
 <YxcYGzPv022G2vLm@infradead.org>
 <b6b5d236-c089-7428-4cc9-a08fe4f6b4a3@amd.com>
 <YxczjNIloP7TWcf2@nvidia.com> <YxiJJYtWgh1l0wxg@infradead.org>
 <YxiPh4u/92chN02C@nvidia.com> <Yxiq5sjf/qA7xS8A@infradead.org>
 <Yxi3cFfs0SA4XWJw@nvidia.com> <Yxi5h09JAzIo4Kh8@infradead.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Yxi5h09JAzIo4Kh8@infradead.org>
X-ClientProxiedBy: BLAPR03CA0046.namprd03.prod.outlook.com
 (2603:10b6:208:32d::21) To MN2PR12MB4192.namprd12.prod.outlook.com
 (2603:10b6:208:1d5::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 78ddd780-423e-48e4-8130-08da90ebd146
X-MS-TrafficTypeDiagnostic: DS0PR12MB6560:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 99AhXdd7jVerneL8CvPAJr3+GjBFhOgblgVOdGF2/kNVKQzlv52wmTTOq5cYxtD+dJ5p2+SwV4pvvvjNAeXyks6Ur3/i0a4cMUxXmi9OgjFcQnvLWHwK4sBO7ahuFVmPtPHGGfOtSXRSClRwrC842EHW07Wd3amhso0WOOyIDa2Ip+bxOIe1jpPGTVXgPy0Gx/72VY2B8l5MYBZyxeiYjrNadLJsDpiM4ZD4rIBFkhwp6S8d5sKi/d3/ZB2MaQYdBakju8LIYvVZhkMbCYjJTGqPVvHHXWx/9B7RRTySn1MW2cwKMEEyW3Tx3hrUojMy9CzYUeZ9EH4tW6ty3dRRT4ki/1VoK+zHaFjB+DvNqJGy7Ovo0Wl/Un/SrP/hvCaZc4+5e872VmYxSX/riLKbWytENvkSdGSM8vDZDGizbnLnFw0461uNpihCqElPehEmNpgkhjuo8N9PcZGVwnXBMPLOQ58JuNqTYMPfvctZdVQd7chVlETW2PGrkaMJLGgub2kcuHIfuAsD0Q/H4n64C5t08fA20AefsLvbIiLVUKW+b1CYm24uXBGDQPRx6XTPYdZMSCjKXnkKQBicFJagjiRqv4KDjv5dayT+7Mvl3gZs+dgujlN0BXR37BImi/qUfbjnEuP93/wvK9++N7bg5lABba21jyTtmzMjvCxJMB3v9exWcKtpK8BVxY0EqgHhyxTZvh/xeJ7kUcv/p7uVMA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB4192.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(136003)(39860400002)(396003)(376002)(346002)(366004)(66946007)(6916009)(4326008)(2906002)(66556008)(8676002)(66476007)(478600001)(6512007)(6486002)(316002)(54906003)(2616005)(41300700001)(6506007)(36756003)(26005)(86362001)(83380400001)(186003)(8936002)(7416002)(5660300002)(38100700002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?xL5RmghK/mTOmp1/PT5JfyJtBBKD6imbV641PZ8qqY+taGhg+qk9hPC0PJBl?=
 =?us-ascii?Q?QGjCfCqtI8LzwEoLf5U8ddlqKDVak6QFEQa/Rj0zXy6vJvrtem7of++Cm7hz?=
 =?us-ascii?Q?57vCpzoXS7SODWeFq2pf61GHQggNWucLjyJvfBTyCAAa0no2mjE5zyPvfBCd?=
 =?us-ascii?Q?FwQLdP/m6MsWWXEwSgXPANIdxbJg29PxzPAEotT76gmsY308kHi/juCiudkD?=
 =?us-ascii?Q?deDDVQI/uij6IzUBP1oBd6FF6iDYL1h4sGjkpYclXgb27wvHM5LtZoC7Ssux?=
 =?us-ascii?Q?Vacx54/pOliK2gHenNIXjiSpW4fmAPiS400tJhY0NZIx/8XgT5J/H4q/pGRJ?=
 =?us-ascii?Q?V9rqPuXhIbvrfI8Ozgm26jopKvZwveE7jgWEp0qdqjHGT8x2AazKszh4ru3Z?=
 =?us-ascii?Q?lP8zeLmcdzLUsgnEg4EW/wnjd0E8Ad1EAuO+gQYZMFuXlOGylzjEHSJiSp+G?=
 =?us-ascii?Q?Or2znQC0u2dEou24NGq6qobPumvwCZ21/+lv1y8f3EZV8fQ2CsbsTCefEBNE?=
 =?us-ascii?Q?ZNmmO3bFsFnqLaOwX/vYNupIB8ozsaJEL54CSypXFlKTzOy5D/r+atNlmhfE?=
 =?us-ascii?Q?6OTDJxnQZXlSzdxWwtwECQGpfobgAjFae/j9tQV4w7Vg6denjxwIB6ohl/8V?=
 =?us-ascii?Q?T9CYnERdowtRElklitoz/ZEm+rd0+EhIZzoCaY7nWE6V6zG2CTeq+C4FcTer?=
 =?us-ascii?Q?WwGN2+nGA+Lle3dW7QYptgZfDX8iUduk7OWLOntlQ5A7jNQD4pUzq3hHSZgv?=
 =?us-ascii?Q?otnJrFQw+2gQLpS+9FNKN+WudCBUVblSMA+ibsFXWn6JUCdEB+S4ZCfU/UVJ?=
 =?us-ascii?Q?LGqiPWGp7KuCIkwqUSpV35Ob0MVpVV6/wB/jiNiPTdajjsHic2/2ekKy1XXj?=
 =?us-ascii?Q?4TXg8G0SYLqHZJe9eoGnLNShanSz/wazPxMrpRguCHn7KFxThYNPn7AxOids?=
 =?us-ascii?Q?tvHO22Eyk6LV0eOXEyXSeVPBKkmbNcHi1Y+kxfqXP59f9TQWVyq7CvqHVMTS?=
 =?us-ascii?Q?oyBfECkAGUNBNsbhyaY7OdXH6xceqew2GNQ64FBuOW1ke8gQy0Hg1bseOm0Q?=
 =?us-ascii?Q?5Na0BfW6nipJsTlXtMlGS82He8elfKAIHJW2d+t8vdGIEHzzHVfNcK4tIwZK?=
 =?us-ascii?Q?3AaWoIL97iLDGRpsLoe2t0hIb03ykJl+KvBJ/fbQDGBIRCcFHzoJyRPApcvS?=
 =?us-ascii?Q?9cgZvpZd/J8lJePV6WUEskBDsYGuuJFSdb2nxpQlwdGrqNOjtyuC5XM+3AmJ?=
 =?us-ascii?Q?PACNYbU2JkiLRf9wdILTDH+BekFLQKzGw5GK0E68lMyC5yoHKnRBk2oCd0vg?=
 =?us-ascii?Q?8AmbqhZ/n57BLEAEWKYwIBWxelfnMrEAsqJEyLck0VLKbL53YSGWMqgx8FT/?=
 =?us-ascii?Q?NbuiDamh39X6z0AfPuVch5dZaWlCo9Et3pU7tSg1/mjNVStxzFMtv+xNvNZC?=
 =?us-ascii?Q?F6Cp1k8IJVKe7miTgU0H8qBnS1Ksoqo92TPKtFEV5LG/ZW6crcDtodYkWBM7?=
 =?us-ascii?Q?QTyYGhepfCOy8l7v/OlrsAhC3Zmbc7fymcnmWzogemp29dIYwV/5UkuhcRZn?=
 =?us-ascii?Q?cmA1Y0EDnPAtpObMzLet2ANuPZCKZZVdVNtRLDEy?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 78ddd780-423e-48e4-8130-08da90ebd146
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB4192.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Sep 2022 16:12:53.1787 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BzmR4LdLUOYxtb8SJfwlGOba/FEncrWG8HZ5C/F4J1uPyux0MTPlpLm/OLBHKfWR
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB6560
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

On Wed, Sep 07, 2022 at 08:32:23AM -0700, Christoph Hellwig wrote:
> On Wed, Sep 07, 2022 at 12:23:28PM -0300, Jason Gunthorpe wrote:
> >  2) DMABUF abuses dma_map_resource() for P2P and thus doesn't work in
> >     certain special cases.
> 
> Not just certain special cases, but one of the main use cases.
> Basically P2P can happen in two ways:
>
>  a) through a PCIe switch, or
>  b) through connected root ports

Yes, we tested both, both work.

> The open code version here only supports a), only supports it when there
> is no offset between the 'phyiscal' address of the BAR seen PCIe
> endpoint and the Linux way.  x86 usually (always?) doesn't have an
> offset there, but other architectures often do.

The PCI offset is some embedded thing - I've never seen it in a server
platform.

Frankly, it is just bad SOC design and there is good reason why
non-zero needs to be avoided. As soon as you create aliases between
the address spaces you invite trouble. IIRC a SOC I used once put the
memory at 0 -> 4G then put the only PCI aperture at 4g ->
4g+N. However this design requires 64 bit PCI support, which at the
time, the platform didn't have. So they used PCI offset to hackily
alias the aperture over the DDR. I don't remember if they threw out a
bit of DDR to resolve the alias, or if they just didn't support PCI
switches.

In any case, it is a complete mess. You either drastically limit your
BAR size, don't support PCI switches or loose a lot of DDR.

I also seem to remember that iommu and PCI offset don't play nice
together - so for the VFIO use case where the iommu is present I'm
pretty sure we can very safely assume 0 offset. That seems confirmed
by the fact that VFIO has never handled PCI offset in its own P2P path
and P2P works fine in VMs across a wide range of platforms.

That said, I agree we should really have APIs that support this
properly, and dma_map_resource is certainly technically wrong.

So, would you be OK with this series if I try to make a dma_map_p2p()
that resolves the offset issue?

> Last but not least I don't really see how the code would even work
> when an IOMMU is used, as dma_map_resource will return an IOVA that
> is only understood by the IOMMU itself, and not the other endpoint.

I don't understand this.

__iommu_dma_map() will put the given phys into the iommu_domain
associated with 'dev' and return the IOVA it picked.

Here 'dev' is the importing device, it is the device that will issue
the DMA:

+       dma_addr = dma_map_resource(
+               attachment->dev,
+               pci_resource_start(priv->vdev->pdev, priv->index) +
+                       priv->offset,
+               priv->dmabuf->size, dir, DMA_ATTR_SKIP_CPU_SYNC);

eg attachment->dev is the PCI device of the RDMA device, not the VFIO
device.

'phys' is the CPU physical of the PCI BAR page, which with 0 PCI
offset is the right thing to program into the IO page table.

> How was this code even tested?

It was tested on a few platforms, like I said above, the cases where
it doesn't work are special, largely embedded, and not anything we
have in our labs - AFAIK.

Jason
