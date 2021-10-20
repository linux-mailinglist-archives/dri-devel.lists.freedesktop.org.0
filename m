Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EFE9D43561A
	for <lists+dri-devel@lfdr.de>; Thu, 21 Oct 2021 00:48:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A6586EA1A;
	Wed, 20 Oct 2021 22:48:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2072.outbound.protection.outlook.com [40.107.237.72])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C1C86EA16;
 Wed, 20 Oct 2021 22:48:30 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=F0cQXdErpPXpixwbjyKbi8ck+UWH8B9rGcL1J/dX+WT7K+92XNNGDxwPW7JjWCZ+x8uHo7VtmCmXla/scF1SJgraiiFI2z1QSxGYUX+VohjJZNgshES7KZvkY1ua3Y2jk05lz8QgslDnI8G+m2YvZ8F0uOBxaU0ltE4LyDndzzrnamBxwumZoBpnaPh1Hn4OcCfy0+FkOW0SgOgC9ZDxNcYlgx2JEwucyyvrHnD/EHZSf+GBKwwacntZGuICfUp2R2P/gGT76QQcTg23HxBElFIgBpDzuq5S/0kwLxdRzabmCznZpNyS+KAsSoELheLfoS4d3ILOSG/JfANDNvc8Sw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6MRBuQUw+MiwNtx/pyd2IslHBxO+DIOutCOp8svui+0=;
 b=JULd2oZh8TGpRRWpr+E+6PxhJNKlA0Qawhyu9s+jmFLHnpH+VHF1VQb41s6yj9Ln2pVGSBTkvzbtulvPvNUo+dNt22zRshl1Gf6LUtxet/IxULc5X9mFqijOP5K0prCsoapQnyTegcu5ATsnDw+Fwd2WNLRq4vLpjiBTuPJf6B8aG+DYFh6ZNjcL2sVTMGPFiML2VTJIm3O+9GtLW955jzjJ7QniohsUqLKffQX/3+/C6BsChCQh/FSUu+iPQSnYMdEFuHr2vbtlw+yj0R9kBE7TqHm5x7NQ5jfohAqweMewZFgqLvC3zeG4X5p4ZCx8ZUapEv6pSGD3EKdtsbwwnw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6MRBuQUw+MiwNtx/pyd2IslHBxO+DIOutCOp8svui+0=;
 b=WcCSobfCo1iCa1sFgPPdac5g2FubCTnaswp5bqMPPGlBNUOvVv8v+z4hIcHoJQ97Uwn2cWXVALa5AtuFZ+9TUN0aR0jjL+L7Y24Kypme+XPWh6/Led6EeRjNEtGXrwE2ckR5IeWUSnX75tQKIpggJbEPeSs8gpqLp6+qluS15gk82LICqbvfccAIryK4nrbtP0qnbap8xzznN5PZ5RKv7bLEHV5qJ483SYtUhVVS8A4B5uQxvReNBPIgVjnkorwuWPxS/8kKyeTG2+Z7agCnJBXsCKdaQylGUHOPeV7cWY6xAS/jhkhajNiA8nvRkYnll+BKsjGFkoyZAWM+GYsLBg==
Authentication-Results: linux.ie; dkim=none (message not signed)
 header.d=none;linux.ie; dmarc=none action=none header.from=nvidia.com;
Received: from BL0PR12MB5506.namprd12.prod.outlook.com (2603:10b6:208:1cb::22)
 by BL1PR12MB5378.namprd12.prod.outlook.com (2603:10b6:208:31d::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.17; Wed, 20 Oct
 2021 22:48:28 +0000
Received: from BL0PR12MB5506.namprd12.prod.outlook.com
 ([fe80::e8af:232:915e:2f95]) by BL0PR12MB5506.namprd12.prod.outlook.com
 ([fe80::e8af:232:915e:2f95%8]) with mapi id 15.20.4628.016; Wed, 20 Oct 2021
 22:48:28 +0000
Date: Wed, 20 Oct 2021 19:48:26 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: David Airlie <airlied@linux.ie>, Tony Krowiak <akrowiak@linux.ibm.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Cornelia Huck <cohuck@redhat.com>, Jonathan Corbet <corbet@lwn.net>,
 Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org,
 Eric Farman <farman@linux.ibm.com>,
 Harald Freudenberger <freude@linux.ibm.com>,
 Vasily Gorbik <gor@linux.ibm.com>,
 Heiko Carstens <hca@linux.ibm.com>, intel-gfx@lists.freedesktop.org,
 intel-gvt-dev@lists.freedesktop.org,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Jason Herne <jjherne@linux.ibm.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 kvm@vger.kernel.org, Kirti Wankhede <kwankhede@nvidia.com>,
 linux-doc@vger.kernel.org, linux-s390@vger.kernel.org,
 Matthew Rosato <mjrosato@linux.ibm.com>,
 Peter Oberparleiter <oberpar@linux.ibm.com>,
 Halil Pasic <pasic@linux.ibm.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Vineeth Vijayan <vneethv@linux.ibm.com>,
 Zhenyu Wang <zhenyuw@linux.intel.com>, Zhi Wang <zhi.a.wang@intel.com>
Cc: Christoph Hellwig <hch@infradead.org>, Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH v3 00/10] Move vfio_ccw to the new mdev API
Message-ID: <20211020224826.GA21930@nvidia.com>
References: <0-v3-57c1502c62fd+2190-ccw_mdev_jgg@nvidia.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0-v3-57c1502c62fd+2190-ccw_mdev_jgg@nvidia.com>
X-ClientProxiedBy: BL1PR13CA0327.namprd13.prod.outlook.com
 (2603:10b6:208:2c1::32) To BL0PR12MB5506.namprd12.prod.outlook.com
 (2603:10b6:208:1cb::22)
MIME-Version: 1.0
Received: from mlx.ziepe.ca (142.162.113.129) by
 BL1PR13CA0327.namprd13.prod.outlook.com (2603:10b6:208:2c1::32) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4628.16 via Frontend
 Transport; Wed, 20 Oct 2021 22:48:27 +0000
Received: from jgg by mlx with local (Exim 4.94)	(envelope-from
 <jgg@nvidia.com>)	id 1mdKNm-0005k7-K5; Wed, 20 Oct 2021 19:48:26 -0300
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: cde92296-29f4-4b41-e95b-08d9941bbb69
X-MS-TrafficTypeDiagnostic: BL1PR12MB5378:
X-Microsoft-Antispam-PRVS: <BL1PR12MB5378398A9381E73A43FA1325C2BE9@BL1PR12MB5378.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: AsPNrd62FsqjO078p6s5/3dfJJzcJxPWQql5coCq5SJwJ6Ub86nQ2QW4ptLYMQRovPfWpgBTmC33tAc8IjlD559XgDf4WMYAx19yZjLKQ0BQ0LH7+9NysYBrVk6UVYlUnGQAQAnTfraGulVRWGseeLPZJy+jrCb0aW/g6TdpeRtxl7cRRiVcI7Uxt1zJSSD1OdskLC0Ki4j/oNvj9FaLCmoKofeZAQhllLZ9cd74vb/PgK8rN1syjvYTu3877C9quGMde0hyE5LxQB/WFfyWcQHOo013Ak62NnCRwxSTFm+ooQXbUdwJi8w5yEzcbeuL+hpg6t8nBjT3DgCoYtkdU1yzl1Di00ArsnDCnPTbCI0vH8QvoiiELcPSvLA7TwvmVDqEOsrxL9rymNeFJssuCuzCS66JZ9Mn1wRt8WofRYrXA0AAEEt3ktKw5HQigpK6hstZvHPvxd9YlJsVHPmFSvjmToqk7/CipA3tj2tLQoIiP7m5aH6RXVgAc9ekN/wFzD2HQyX311wDLyqgOzBSmUQJ+YJQZECZ/NCTo7/I1Tu4hPImhw4Z5cO+9nf3zLdZ5nYemKOMTAjcANL+Q4pRvuKTljyfkUDPXgb7guLjqtE/wB1/RwYiLGAs05/zSNsUFCJEzitGhWtEO/1uw5FLVPpuJKS6a4YA/mrKd/c7sAxNPTaprfDrw7cCNGOGhJMppjOsYhw4pyzRRmTxg1h56s+FWTlZschTNpcdjgSakEX8GqHtOCICeZtnLJYAb2ybE239jgOo+8ULTlaJVT04teuF+3KSskstLUs551jJ7QYW6OVt9VzlCUO0g0U8jOzj
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR12MB5506.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(966005)(186003)(1076003)(8676002)(26005)(316002)(5660300002)(8936002)(508600001)(66476007)(38100700002)(86362001)(33656002)(9786002)(921005)(9746002)(426003)(110136005)(36756003)(54906003)(7416002)(66946007)(2616005)(2906002)(4326008)(66556008)(83380400001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?zqm1kabHFmHkVwxGcFLqEMThXh8cT8NO2VggsE9tcRoOJbzwaSBgk0RcFZsp?=
 =?us-ascii?Q?VY2KEO4NbaAYjaD5ArPSMM2aj8M1F1hQrCI3HDPvZcReP0Z78R1mAufjTZoN?=
 =?us-ascii?Q?PKdKaHMyPpg7b46hLc6zlM1Jupoe++k+FtrynAqKUparhRob2j2wz+S5Llde?=
 =?us-ascii?Q?RHNs+JtD9HAnW3D9+IbWLHloEmlz+aCiH+9/npjIL6UZWHvtBIKHi13eJWyf?=
 =?us-ascii?Q?INgqp5ii0+WMNH32fiyVVtB+uJ3nubCP///LFOKkW4vLHALA9BirLTjAYqf0?=
 =?us-ascii?Q?hWuxf07z/3+Dbj+I4w9+O7ie5It1x8oojiBcOtyVDq4d+SlN2XX/sFtf6buq?=
 =?us-ascii?Q?LsgV2VVFcVBxiib2XyLuRFGxylfXPmYxozfvhhuCalwi2n1yPDNZ517V4r6I?=
 =?us-ascii?Q?M9HxKMLnwwkRIG4xbLT5MWCj1autQdsbt5Fjm1UfdidTl6aukuY/sxH80eIm?=
 =?us-ascii?Q?dWxfqGXwXUEGJ6hm3Wo/zVw2dvpb5lNLZJPYiGW7Ii2e8prGEhIAz9hgbxKU?=
 =?us-ascii?Q?4ofGYoI7xYjlHfSODo6ubGub6Tf+dnyuM0SSDTIjqmHECVz8AaoMKq167jeb?=
 =?us-ascii?Q?e1mhQYWaRcLUBg5BVp3Hm+9LPY6RvZ8aPLOslElN3kam//7iPI1B2U10ZoKZ?=
 =?us-ascii?Q?HIY42S+iyO0WOGrUy80ZaJE2hKVV/xrBMz5S1rTjU/+l3dCLStDZM03PqyZt?=
 =?us-ascii?Q?r+K27kBDP9400NI85PAUxaTD+zjnIlWPLvgGclo2sOKdy6at/9ZzKOa20mmt?=
 =?us-ascii?Q?diD5hspqeQtbGbJ+NRbMkKp7/chXVvS0Dywp9QMcETaqeA1NduTCmH7ndetc?=
 =?us-ascii?Q?8mNKoGaDmrYoKB18BrOBWALEnkIpNyNeraVfdpe7W8BrZtZciXL2YXdFM75+?=
 =?us-ascii?Q?S4v8tZJE0t73res7dKIOaoAT+dBrLWkB0hHeLnDwR9c1IMnivS0fCnlAM4yg?=
 =?us-ascii?Q?uiMzme+fmY4v+90z68NYbzLdExs3qn5krTmVbp/ifGghBGf+/vPhY2msvavi?=
 =?us-ascii?Q?tikI9LM5o6WyD+XEwshL2Rks2xe548phxpH6uzNTo33SxZ8L8U3RBjtwa5cd?=
 =?us-ascii?Q?uqS9Puboj42M1kmkRY3eUQPKxwrBBqgJi/gWTOU5XRm7QCK8xEI5fU60cYHx?=
 =?us-ascii?Q?XfxuhUlz+GoBcn2Pa7TGMaJpFfINXhAWDcyqYm+torjrgrUvpuTxKB9q4AGd?=
 =?us-ascii?Q?Kvnn3uTpXf4dxKV9gQeg8AxIGNpc0YGTVm9/6ljAuPBmTVIbHEj9oe2cbuK2?=
 =?us-ascii?Q?tDTM/WM5THxly+9WdXVHSmHX/h6j1G39XXGL6D22Rj9EWRqYBWH8uIQTlneQ?=
 =?us-ascii?Q?bNpZRheye7lG7WqZtCyv9Alx?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cde92296-29f4-4b41-e95b-08d9941bbb69
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB5506.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Oct 2021 22:48:28.3563 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jgg@nvidia.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5378
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

On Fri, Oct 01, 2021 at 02:52:41PM -0300, Jason Gunthorpe wrote:
> This addresses Cornelia's remark on the earlier patch that ccw has a
> confusing lifecycle. While it doesn't seem like the original attempt was
> functionally wrong, the result can be made better with a lot of further
> work.
> 
> Reorganize the driver so that the mdev owns the private memory and
> controls the lifecycle, not the css_driver. The memory associated with the
> css_driver lifecycle is only the mdev_parent/mdev_type registration.
> 
> Along the way we change when the sch is quiescent or not to be linked to
> the open/close_device lifetime of the vfio_device, which is sort of what
> it was tring to do already, just not completely.
> 
> The troublesome racey lifecycle of the css_driver callbacks is made clear
> with simple vfio_device refcounting so a callback is only delivered into a
> registered vfio_device and has obvious correctness.
> 
> Move the only per-css_driver state, the "available instance" counter, into
> the core code and share that logic with many of the other drivers. The
> value is kept in the mdev_type memory.
> 
> This is on github: https://github.com/jgunthorpe/linux/commits/vfio_ccw
> 
> v3:
>  - Rebase to Christoph's group work & rc3; use
>    vfio_register_emulated_iommu_dev()
>  - Remove GFP_DMA
>  - Order mdev_unregister_driver() symmetrically with init
>  - Rework what is considered a BROKEN event in fsm_close()
>  - NOP both CCW_EVENT_OPEN/CLOSE
>  - Documentation updates
>  - Remane goto label to err_init vfio_ccw_mdev_probe()
>  - Fix NULL pointer deref in mdev_device_create()
> v2: https://lore.kernel.org/r/0-v2-7d3a384024cf+2060-ccw_mdev_jgg@nvidia.com
>  - Clean up the lifecycle in ccw with 7 new patches
>  - Rebase
> v1: https://lore.kernel.org/all/7-v2-7667f42c9bad+935-vfio3_jgg@nvidia.com
> 
> Jason Gunthorpe (10):
>   vfio/ccw: Remove unneeded GFP_DMA
>   vfio/ccw: Use functions for alloc/free of the vfio_ccw_private
>   vfio/ccw: Pass vfio_ccw_private not mdev_device to various functions
>   vfio/ccw: Convert to use vfio_register_emulated_iommu_dev()

IBM folks, what do you want to do with this? I would like to go ahead
with these patches so we can get closer to unblocking some of the VFIO
core work.

These patches:

>   vfio/ccw: Make the FSM complete and synchronize it to the mdev
>   vfio/mdev: Consolidate all the device_api sysfs into the core code
>   vfio/mdev: Add mdev available instance checking to the core
>   vfio/ccw: Remove private->mdev
>   vfio: Export vfio_device_try_get()
>   vfio/ccw: Move the lifecycle of the struct vfio_ccw_private to the
>     mdev

Where made to show how to structure this more cleanly as Cornelia
asked but are not essential and IBMers could test and fix to get this
cleanup when time permits..

Thoughts?

Thanks,
Jason
