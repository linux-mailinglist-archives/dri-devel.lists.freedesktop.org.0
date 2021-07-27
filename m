Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A4D813D74E0
	for <lists+dri-devel@lfdr.de>; Tue, 27 Jul 2021 14:12:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 36F386E8EB;
	Tue, 27 Jul 2021 12:12:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2048.outbound.protection.outlook.com [40.107.244.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 47DEF6E1F9;
 Tue, 27 Jul 2021 12:12:28 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DHb51Jds55Vmemy+UXZikHN5Ry3tlIn5xcuzPW4EF49n8Nn+/khoOvSCjKB8R3V3acNZFxDGzJa7npA77NeOGQt6ZmaxBWRsf/M567A6BveBrURnfahBjVewC8BhvybHST2fDjDNbLidrDsp44iKajuyjAseKVb0FeeLR3JiDFm+Xk4TmnD28M6qzOXY9nBV5KJEGUWH+5rsul6UwAI1GNlUzyz6Rwg06uDNiTd0hwom429D/Tj1+U7uL9nABePJVDPlovb+7Nht0+B8gB1lYMevfpuUK7gxzo7LrF58JPyxxyJ8wern7xApKYrdN3JsK0JBR/EqI4XT8++d27WeTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UrEYKOq/sGyYUSRo5SkO+A5OOZRVsK+9a0F+8JmE4Ic=;
 b=in6SKVkSUCTfCnwQPYovx23D8KtFyxFHq4GT91csYyiFB2Trk1IZ7YmT0+ltaK+HTPCktr+y6qxa3bFXZwo3n9AHVxHcNfMzdchIbdpm3BWgc9fgSZ3Q66IjdKGfwio6433QQHXJbBFwgxhIchqZeVBdraURD88LO1lvfuLXFJdpFCj6fm9r0kPGXnEC7p/VsRjUPmzJm79pfwus7BPY2mit2PKBJvwCqplG3HmmfLefJToQWcJXnw9cx2+ihWBAgNDstYaESAZY504KBJXoSKS062wtFgsUyc1TB/DfXS2TaM1d3Qmp015O0gm5EznmGWJjXVjXDp+n+VcxT97GiQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UrEYKOq/sGyYUSRo5SkO+A5OOZRVsK+9a0F+8JmE4Ic=;
 b=QLzqWFgRGyUey2+vm8H6uWqBs5OZWZRZazP5k8QZbfQNa8XYh0LbhKwKNS3Wb/Ux3QhI1OLWN5BXEnCVHZmaR80MszuqD+Z3xeKgtV9G9lRvqv2EltKm3wRhq9TaChbEyboIYebaAkQBrxU9GcZFUBWRlxg6AgnXV6sM9y3mf8Uux+P4Y5Ty+69BUEGcbPeEmya6JRSTBj3/NFXL6DUO9Eu3JW6nb5USinVk738cxjnBg60Sszz7quviwQLF/aueuEc8bCJiCfYq/fSYoioxTz2/qokob+g49FTeBe929lej8fulPfmCZI6XFIrn8OBMR259JyirC8YEOpnsNSYHow==
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=nvidia.com;
Received: from BL0PR12MB5506.namprd12.prod.outlook.com (2603:10b6:208:1cb::22)
 by BL1PR12MB5377.namprd12.prod.outlook.com (2603:10b6:208:31f::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4352.30; Tue, 27 Jul
 2021 12:12:25 +0000
Received: from BL0PR12MB5506.namprd12.prod.outlook.com
 ([fe80::d017:af2f:7049:5482]) by BL0PR12MB5506.namprd12.prod.outlook.com
 ([fe80::d017:af2f:7049:5482%4]) with mapi id 15.20.4352.031; Tue, 27 Jul 2021
 12:12:25 +0000
Date: Tue, 27 Jul 2021 09:12:24 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Gerd Hoffmann <kraxel@redhat.com>
Subject: Re: refactor the i915 GVT support
Message-ID: <20210727121224.GA2145868@nvidia.com>
References: <20210721155355.173183-1-hch@lst.de>
 <DM4PR11MB55496531B246A4604FC86998CAE49@DM4PR11MB5549.namprd11.prod.outlook.com>
 <20210722112636.wj277vqhg4dez5ug@sirius.home.kraxel.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210722112636.wj277vqhg4dez5ug@sirius.home.kraxel.org>
X-ClientProxiedBy: BL1PR13CA0316.namprd13.prod.outlook.com
 (2603:10b6:208:2c1::21) To BL0PR12MB5506.namprd12.prod.outlook.com
 (2603:10b6:208:1cb::22)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from mlx.ziepe.ca (142.162.113.129) by
 BL1PR13CA0316.namprd13.prod.outlook.com (2603:10b6:208:2c1::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4373.7 via Frontend
 Transport; Tue, 27 Jul 2021 12:12:24 +0000
Received: from jgg by mlx with local (Exim 4.94)	(envelope-from
 <jgg@nvidia.com>)	id 1m8Lwe-0090T1-4Z; Tue, 27 Jul 2021 09:12:24 -0300
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c15eb4c8-fd97-47ca-2c8c-08d950f7cb66
X-MS-TrafficTypeDiagnostic: BL1PR12MB5377:
X-Microsoft-Antispam-PRVS: <BL1PR12MB5377EC895A9E585F64EC1B2AC2E99@BL1PR12MB5377.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: z1pVTNLASbZI5xDDcV0rZcuP/MymJuVoaWzSL2ORhGwDlL8r8RdSh5+AxsihG3VKUBQGk8/Isc3W+ZAL1RxcHIylQmHm1Z2K/mPTsfPQXbiEJRjtEnFOjQ6jmhIXgoRBPJTlrUVIrXbs0tdB+Vc1nrOkitGgPDfXmXCzJjgTmpFHVS8awg8ITj5tWL2MKkzCC9rj/UpTJ6SOf40Pdt0L+s+gQl8czmn2InusiUPARDelEwX2guI5YcKKxgkr4PlHAcYbZHa4xzQFuxZx8WYYr4+xSj5fjtOAoJ0ysyrrMoIicrcikrbKfjds8kW6Bvz6mkIOwaWXVrwYarrAmjugSLNNrQSZl6WqylvrRMGYXh7Wexga1j41Uvv53udMG5c0dv/SrH00y++yAlbdhsyjkcRhbpeWpIQAs3BAXZERL9jbeCkWGh2p9EelBp+EL3QbgliyiFEsJb2yuFEw5bT2xKL9UjsqqywlSQtK74XWhfbNnzm70ra92pH+mmiQVfTR5YC2xnss+IYz7g5y1ukxfGggkc+muacB7LG73DJqCOj/ptgfMaOOyzog4SFlVAvCkfA8FDuUHj8S/qFAczCniS297lkasrXbr0NFvtqMk4virXU2Pbo/AirxR+sf0eRDo2uKrg2W+nUXxji9HUg3k4o7AYzkawYrnJ10BcLreiThxPXeN1jc6GyTVGSsdvM9S5i4AFA+akoZ6Wlzr4rA2ErCSxHolvLSb7rtXCX9NI8=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR12MB5506.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(346002)(396003)(39860400002)(366004)(136003)(6916009)(2616005)(426003)(2906002)(316002)(478600001)(8936002)(36756003)(4326008)(38100700002)(5660300002)(8676002)(66946007)(33656002)(186003)(1076003)(9746002)(9786002)(26005)(66476007)(86362001)(54906003)(7416002)(966005)(66556008);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?kCJrr7k/C0lrhulkQfDP85c6Nb53pADC9icnxYkfTzL6q+uNorbRYZiy7Bmx?=
 =?us-ascii?Q?c/9/FyF8KoCADPGsdAem0JM7acV1etmsShu6fHbrZlqAffPWbn4r1hF+rc/+?=
 =?us-ascii?Q?8lvMUuH7TgDVd0FVJEPMYi8ZdhFGNOeLIWnjg+UeLEV0T9v7XJd+iZUXI38W?=
 =?us-ascii?Q?26pEs1tLe8EhsGIDDdVncHYBZOBkaRaeEcriRfXoBhab2hiUxTZ1gdMDIdaf?=
 =?us-ascii?Q?f61VwuT16sOFhuIGGSxKutm0eM8RRLJCQANzdW8QoFewBg7rE9h2xh8LZQJ2?=
 =?us-ascii?Q?PhvncP08HVrn1mjXYIrj3B+JiCqtJhYUOEc7E2pD6yVKCTh3O0eySPXaWsqD?=
 =?us-ascii?Q?EYIjVEQRZbweBod6LIdIshU4RSHN7iWOA1VJiGM/riAHso5pOPfe8Q8QDAC5?=
 =?us-ascii?Q?m7vVrv/SIo4NmeT6NJucw1O79XzS7PzClIfFy5FfIZe0/xgWvAcFzh8U5lzh?=
 =?us-ascii?Q?1jUEWERDSASf6FzrNKsllb5swe1oKJ+sY7yymD0SMSRcOAOA18McnKFtAqLY?=
 =?us-ascii?Q?CRRdAnPK33oZ/WeC+7L4a5jSQ+U2UKNjBIU52l3foN9ejTaoOsTuwiW+So+J?=
 =?us-ascii?Q?TAqXpAic4IKPTOi1f5nAVHV6bXJuDomZJA9elaqUOui7MoTVIA4HAyBMgmP6?=
 =?us-ascii?Q?lYMnIRdqoOIQV2ZKnjGvCh2DAZfFq4Lof9bDpUxDuCxpj9gqmFJ5zggBOs4M?=
 =?us-ascii?Q?RTT7elStcdU1jUn9Mb6Cv/FnNcfCFTs/lNzpArat/+JKBBnVXSOqH61rbMVg?=
 =?us-ascii?Q?G9U4Ra7rfvDwjAiSWh0afR1ebgUuKg5FpXArPN2G53Afd0lc3vrhzGpaX6Ao?=
 =?us-ascii?Q?Y6AhkUjHQb0lakI0wb6G2SS/NKIWs6W+FftxTdR0P3rIYAmdHL7VIzNVZv8b?=
 =?us-ascii?Q?j5XKLA02IHQAgkowlo6568LkY9FaqAfJMtQpCuPg+L6HAEH0NhgCTGn3R+x9?=
 =?us-ascii?Q?RZmm7bM+HyF/FP5j4JuJuBJ1NtCfdybOY9Al7gQC6i3aBrOFTIROsUT9684G?=
 =?us-ascii?Q?G8emgVWJSQzcPSgarseyZePQRP90pxrVs5rzFvQR7OXzheb1EBqttCRvSXe+?=
 =?us-ascii?Q?kU2JViKZoX7lAbzZx2yBNLTipDfnjL3Ge/1SOoTdZATTzStW18c6nPL9ZKiF?=
 =?us-ascii?Q?ZseX1rZxvp+/RQ1W7bLbpoyMsEgdSBw8urHHO88V+EGQexQJWHhikltYCiVF?=
 =?us-ascii?Q?VhzwfNdcrB5uEKxrRraebWHBayQIEUJpYOvpDs9y1kfGqyQ3OKKWghyTw2Dp?=
 =?us-ascii?Q?mkjtSt9gQhBMz2ixk0EzIJjKVQ99N4Bq9RDRi8u0QSrRZgrKDfQXcB40Pb2/?=
 =?us-ascii?Q?ZxsGl7xu1P5ov8NwIF0l5inX?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c15eb4c8-fd97-47ca-2c8c-08d950f7cb66
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB5506.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jul 2021 12:12:25.5473 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VLScr8E7o1RmxGyA6QdVqWLdV0n/HkO/Rhsd77MDQx7r0acMxbFexnlWy5OxrWCe
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5377
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
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "Vivi,
 Rodrigo" <rodrigo.vivi@intel.com>,
 "intel-gvt-dev@lists.freedesktop.org" <intel-gvt-dev@lists.freedesktop.org>,
 Christoph Hellwig <hch@lst.de>, "Wang, Zhi A" <zhi.a.wang@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jul 22, 2021 at 01:26:36PM +0200, Gerd Hoffmann wrote:
>   Hi,
> 
> > https://github.com/intel/gvt-linux/blob/topic/gvt-xengt/drivers/gpu/drm/i915/gvt/xengt.c
> 
> > But it's hard for some customers to contribute their own "hypervisor"
> > module to the upstream Linux kernel. I am thinking what would be a
> > better solution here? The MPT layer in the kernel helps a lot for
> > customers, but only one open-source "hypervisor" module is there in
> > the kernel. That can confuse people which don't know the story.  One
> > thing I was thinking is to put a document about the background and
> > more description in the MPT headers. So it won't confuse more people. 
> 
> Getting the xengt module linked above merged into mainline
> would also nicely explain why there are hypervisor modules.

It would also be nice to explain why a GPU driver needs a hypervisor
specific shim like this in the first place.

        enum hypervisor_type type;
        int (*host_init)(struct device *dev, void *gvt, const void *ops);
        void (*host_exit)(struct device *dev, void *gvt);
        int (*attach_vgpu)(void *vgpu, unsigned long *handle);
        void (*detach_vgpu)(void *vgpu);

Doesn't vfio provide all this generically with notifiers?

        int (*inject_msi)(unsigned long handle, u32 addr, u16 data);

Isn't this one just an eventfd?

        unsigned long (*from_virt_to_mfn)(void *p);
        int (*read_gpa)(unsigned long handle, unsigned long gpa, void *buf,
                        unsigned long len);
        int (*write_gpa)(unsigned long handle, unsigned long gpa, void *buf,
                         unsigned long len);
        unsigned long (*gfn_to_mfn)(unsigned long handle, unsigned long gfn);

        int (*dma_map_guest_page)(unsigned long handle, unsigned long gfn,
                                  unsigned long size, dma_addr_t *dma_addr);
        void (*dma_unmap_guest_page)(unsigned long handle, dma_addr_t dma_addr);

        int (*dma_pin_guest_page)(unsigned long handle, dma_addr_t dma_addr);

        int (*map_gfn_to_mfn)(unsigned long handle, unsigned long gfn,
                              unsigned long mfn, unsigned int nr, bool map);
        bool (*is_valid_gfn)(unsigned long handle, unsigned long gfn);

Shouldn't the vfio page SW IOMMU do all of this generically?

        int (*enable_page_track)(unsigned long handle, u64 gfn);
        int (*disable_page_track)(unsigned long handle, u64 gfn);
        int (*set_trap_area)(unsigned long handle, u64 start, u64 end,
                             bool map);
        int (*set_opregion)(void *vgpu);
        int (*set_edid)(void *vgpu, int port_num);

edid depends on hypervisor??

        int (*get_vfio_device)(void *vgpu);
        void (*put_vfio_device)(void *vgpu);

Jason
