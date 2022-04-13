Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6993A4FFFBB
	for <lists+dri-devel@lfdr.de>; Wed, 13 Apr 2022 22:04:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B67A10E253;
	Wed, 13 Apr 2022 20:04:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam08on2071.outbound.protection.outlook.com [40.107.100.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BEFE210E160;
 Wed, 13 Apr 2022 20:04:21 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HFHrnI7xUHXa43iLx+Iv9w8IGgR92SNJs2PvKoWlz060OcydGunOpvNC55IExbdK7QOl3+tKX241uUJdzilK8dNXm0dJw1SXVd0V8OLI9msxEboiccvVY7KLFv3/QfkEeK/QPFG9bczlHsHPp+FYV8TO7FlLfpcQU4WRnYQqbb/R1xoSTuXMbbE8oDZ2wx6oAKKMg6NZKQil3btYuOyLilXSkt3xdh5T0XUJgIXxP+8rdKNi5A5f5LoA/sUk4A/6fG/Dn1x3+Ur7KkGZ8UGuJXHraIImGheFjv+N8RPM1pjax76ugJb6JJbIGJCvmZwQZ4Kju8wpl/b1S0s2n8i45g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=65qaXMr7DRJeV1Kj8u0EXLr+PoshN2WQPLqKGR+j3pk=;
 b=fNBJoNRKpAPOJs/2MewNSftEJpDzKrX/muiQI3O3/h9UfuHo1wIWBAk46vDOt9J/OfbA6fPUU1ENgRGscGuItAxzSN7pbOoldDMMxrB4YLqNLfiRhqdexPbBGYKExitklkkXGqu/VRtVRNkqQ0XZ40IVLqyAaxLvkqPZuSPPcEjhNUrripDtVvI7Rv9O72xwhb20to7KTNGC1DXvn2N222801wJcrN19tSRF+n/aTdhz+WZ7B6gEIsM3XGv6H6tHdnTQzURpC6c+lNoyf/U5PFLzFImsJtpGyINDfAhrfJufyJ1A9neM24uxIkKppS/NlFtDP21h75BBoKE0NnWxuQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=65qaXMr7DRJeV1Kj8u0EXLr+PoshN2WQPLqKGR+j3pk=;
 b=uVFHP9iEoZNvO1kGHb71nfERLGYPpGUJTm1QQkF87la4jB4NDtezi2MLOvCCPaAHA6LFjVlerseV9Gua2NGLSh8+3/NvO4tGajLJJFWHPDXTV1M544oDoiqgMad+kdCrE8UPJQQVdBwYio3zZx1e9KBT3SdKrBx4o0jJ3sPQ/bCukgOVj00sVx/5L40ZHoz/DORKX7fmdsJr5ick50I6OmMeAYSj3BGsYcrlM+dNfDXRZtjmr+OwCCZY2Ydg4e5Y0RV6i7wgmup2mlsNKA9OmIRbQpdCqLfwgj2PJ7pT0jCADUH5HxvdlOB1PUBx/2o1IHySDSfAKJdLy1pMou20AQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MN2PR12MB4192.namprd12.prod.outlook.com (2603:10b6:208:1d5::15)
 by CY4PR12MB1784.namprd12.prod.outlook.com (2603:10b6:903:11e::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5144.29; Wed, 13 Apr
 2022 20:04:19 +0000
Received: from MN2PR12MB4192.namprd12.prod.outlook.com
 ([fe80::ec2d:9167:1b47:2db2]) by MN2PR12MB4192.namprd12.prod.outlook.com
 ([fe80::ec2d:9167:1b47:2db2%5]) with mapi id 15.20.5164.018; Wed, 13 Apr 2022
 20:04:19 +0000
Date: Wed, 13 Apr 2022 17:04:18 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: "Wang, Zhi A" <zhi.a.wang@intel.com>
Subject: Re: [PATCH 1/9] vfio: Make vfio_(un)register_notifier accept a
 vfio_device
Message-ID: <20220413200418.GX2120790@nvidia.com>
References: <0-v1-a8faf768d202+125dd-vfio_mdev_no_group_jgg@nvidia.com>
 <1-v1-a8faf768d202+125dd-vfio_mdev_no_group_jgg@nvidia.com>
 <20220413055524.GB32092@lst.de>
 <20220413113952.GN2120790@nvidia.com>
 <20220413160601.GA29631@lst.de>
 <20220413161814.GS2120790@nvidia.com>
 <20220413162946.GB31053@lst.de>
 <20220413173727.GU2120790@nvidia.com>
 <661447fd-b041-c08d-cedc-341b31c405f8@intel.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <661447fd-b041-c08d-cedc-341b31c405f8@intel.com>
X-ClientProxiedBy: BL1PR13CA0136.namprd13.prod.outlook.com
 (2603:10b6:208:2bb::21) To MN2PR12MB4192.namprd12.prod.outlook.com
 (2603:10b6:208:1d5::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a18a78d0-5c2e-4778-21b1-08da1d88cb97
X-MS-TrafficTypeDiagnostic: CY4PR12MB1784:EE_
X-Microsoft-Antispam-PRVS: <CY4PR12MB17848B3D288E6D8514DF586DC2EC9@CY4PR12MB1784.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: TL0l4aaBY6A6iWour5Ztsfjdu3e/rCTlJazgxBHBq+FSmcNn7JAUpdO7+hptegpaKxMby48Er0YU1aRunY7jETXwg20bWihVAyoUn9ZyF4uwDqMLj5UTncsJ5oVoKAaq0NPIWXSpmcktHcKS/2yPhMZaGM/msaAS3KFrH4fNNlp/MSW1fqGfeT92Sk4LRoy9kO/a7lCYBY2Se6fuDnq+3glgV7j0h3M3GrQ05CgTL1tp2dYUZh3Ih8ytl7ZQv6cMXyvFRQA8o1EiSCzyCDMnFyfiWOubGp4s9uwzp5YqO/K9pnK/7w2NOmnKTFNyzdZNiKN4Y2inAgfkHwZsjZZz8AzcZw/0LHh5HJAfFgF97HJTSrfHx3JENgYsIpHsVPXzMG058yy8JGDk3HZRWAEeWESbjbUpRxujyqgivoBwfNquEow6V8wbkTyefteiVnUnqjH5sn66HrxFLt9wvVTophaN7hDFMNhj8f/Fi78pU4oXzfIaDf1OWq3aaV7slieqBoFrvVcS8cKcKDBI3nJQz2IvGHwO7Owtz+aUuqNbQVCbAcGE82nrtLtzwMrFeJ9JvujAsTpMEgvPH6vidtwmtD6YWSgdBV+yOfwfRnox6qbRN7hPEbPsMmZ3bnTPCf7wrnkpF06WhlTZ3PXz11hWPQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB4192.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(8676002)(66556008)(66476007)(7416002)(2616005)(5660300002)(38100700002)(6512007)(1076003)(8936002)(186003)(66946007)(7406005)(36756003)(4326008)(26005)(33656002)(54906003)(6506007)(2906002)(6916009)(53546011)(6486002)(508600001)(86362001)(316002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?0amULtKcJIiru5NdLMWAJ3MuwellzjrMHLMQRNovPTG30u8Mb+UaFWXjbm/a?=
 =?us-ascii?Q?WwBrXDg6AaPbbnP0p7GX4lVOaU3vht4gfP/mAJvY5Q39nDKod0hyU5IOHRin?=
 =?us-ascii?Q?DmBs6c2Rwmt9HooOoPMG6Vx4kg5Es+94qcIn6fREziG/8IJAJsYxUfFfCv4W?=
 =?us-ascii?Q?35f9jM/xG3Yn+ZbCQcmbfh4qFxC/X5ftA6YXf6e533U5tkFEN2oAdhAGqLfe?=
 =?us-ascii?Q?FRo4R/HR+cZBh7XgH9rTeDcbr7prRWJoYFEt2/GWjSVo+Z5N6/Iu5QiMdAaN?=
 =?us-ascii?Q?Dn6chN5SApRwXq2Ly84XHJ69f0yI+Di38rVCBLBCZicOGrha56O8lqOlTkGe?=
 =?us-ascii?Q?MKrY46rD0f4l1v3nk2ddS8MVOjfjSRO18gL9t6dUB2BgO2KvQb5PZ9exNe4C?=
 =?us-ascii?Q?qVAJ3LvspOizIqXACtg/my8J9+pV9TOrYTShfpsU4fBWzDLl8/lsVw/zDY8f?=
 =?us-ascii?Q?vfygTXAMiWU2wCq8oFjq3vKnmNj10JFexIjXCBk/0ynsQZ44jW80V4D1NPvW?=
 =?us-ascii?Q?tRNeo7fnD3an9jRV2RNTZdRH2QJxEI6r3xL2O5PWVkR+wAaQiWWAB6DUVKT8?=
 =?us-ascii?Q?Rid7QiJCOK3epPryah0zd62iIyg2iLLN68a+WvRRlJvj9Slb9HIEEC7698ya?=
 =?us-ascii?Q?OrFknMWsI2KpQLpwMpS1t1MnD9Ac1bX3SdID84e10c1GbKlEhoHtPCARlMKI?=
 =?us-ascii?Q?QgPaXYYNySq312JANQnT2qJmIzX3ie4viz4CXOxoAql1RWlAjJdW/zQ0c20x?=
 =?us-ascii?Q?hCgjZHV2ZVkTLGGYvi5aUQeVBNP2Y0BTyyTPvnmB+BK9e6Gd7zBCksRVtDeu?=
 =?us-ascii?Q?PSvTezQJRoDqvJ1sKfLe24YkHPR6mzAELVM3MC7HdXHMUr4fLIcu1OY5QY3+?=
 =?us-ascii?Q?+DTMR5cgSLc8yNH2NV8C3OYakiaHZgGTyrKJamSLHzOr1jdM+SJH6hNc2gYK?=
 =?us-ascii?Q?9snGM4ymaocOdKU3eZyntXo39WpJG9zhJCNYS6gRnx3PVxQVq2ILj8OhE/hn?=
 =?us-ascii?Q?yl6KWdJBpj2HVzW/OJ5R6PA6fUls2R85QrQNfEr6MPOU+WNq84deOX9zPfD3?=
 =?us-ascii?Q?FiOLwyaKaicH01fjdbr3OhN77MNaVsIf2TeGOJjSmPiJc+fFCKjvdVt/jI68?=
 =?us-ascii?Q?VIyRmmKxFYEv3IyVIRBzshbvpa9bFsdmNjaHNoSu2wZ4F+Ao8vmI6tgYpPAt?=
 =?us-ascii?Q?oCiXmMQBNzP397dxyEMHsBi3/ZYA3zbCVXag4WRe0uipf421BpQy/VfODVEg?=
 =?us-ascii?Q?RKkGAj0VGLsw51warLpLG1f5D2dtJLtoiPBL3hGNzBOi1mhTJjXVtxPv1yUm?=
 =?us-ascii?Q?n92amVANTRPJNNYvpCFQnM/0/8fgSCSYh/HTd6/YDj8h+yRTBGVbp+li0kmD?=
 =?us-ascii?Q?8y/rbz8OM9WI04OMUVxT1XDXhIY/FJX/OuOYwqM3GatDkQWijO1b9x5vVJ22?=
 =?us-ascii?Q?Rlznd8x3dIndGH2d6fovg+I+JHXfKOz8sZThu/XfdvmEb1J0rJ/Z9YFWZs7S?=
 =?us-ascii?Q?xZgVyFU4ZsGvO+Z5CsgQKCOWU8aeHuvEFbAEkF/IkJn5u+T6sDiXcmenHpHj?=
 =?us-ascii?Q?uK0RS1IXAC5aXXFgPm2xMmG/+4N0gF9+pZkl0j/6+Al86VQjoC1JlZkS44a6?=
 =?us-ascii?Q?90QvxMLZSYAFjA28udKv74+LmDlA/OMXxJU7fSrhPDMKQc35X4UJzhg3Pcgq?=
 =?us-ascii?Q?9Ly7hyg9OukTcd65C3CghwVq+RlxB4Qp+4F9sFGGFDPvU/rI1qYW/1NT1v80?=
 =?us-ascii?Q?v5z4vImPiw=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a18a78d0-5c2e-4778-21b1-08da1d88cb97
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB4192.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Apr 2022 20:04:19.6814 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JV7YfsVbgiZWTnWyS8a+o1rVyW+DaNqL1f3MvBvYcEp33VowtVRJgydm27tokrGV
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR12MB1784
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
Cc: "kvm@vger.kernel.org" <kvm@vger.kernel.org>,
 "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
 David Airlie <airlied@linux.ie>, "Tian, Kevin" <kevin.tian@intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Kirti Wankhede <kwankhede@nvidia.com>, Vineeth Vijayan <vneethv@linux.ibm.com>,
 Alexander Gordeev <agordeev@linux.ibm.com>, Christoph Hellwig <hch@lst.de>,
 "linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>, "Liu,
 Yi L" <yi.l.liu@intel.com>, Matthew Rosato <mjrosato@linux.ibm.com>,
 Jonathan Corbet <corbet@lwn.net>, Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 Jason Herne <jjherne@linux.ibm.com>, Eric Farman <farman@linux.ibm.com>,
 Vasily Gorbik <gor@linux.ibm.com>, Heiko Carstens <hca@linux.ibm.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Harald Freudenberger <freude@linux.ibm.com>, "Vivi,
 Rodrigo" <rodrigo.vivi@intel.com>,
 "intel-gvt-dev@lists.freedesktop.org" <intel-gvt-dev@lists.freedesktop.org>,
 Tony Krowiak <akrowiak@linux.ibm.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Cornelia Huck <cohuck@redhat.com>, Peter Oberparleiter <oberpar@linux.ibm.com>,
 Sven Schnelle <svens@linux.ibm.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Apr 13, 2022 at 07:17:52PM +0000, Wang, Zhi A wrote:
> On 4/13/22 5:37 PM, Jason Gunthorpe wrote:
> > On Wed, Apr 13, 2022 at 06:29:46PM +0200, Christoph Hellwig wrote:
> >> On Wed, Apr 13, 2022 at 01:18:14PM -0300, Jason Gunthorpe wrote:
> >>> Yeah, I was thinking about that too, but on the other hand I think it
> >>> is completely wrong that gvt requires kvm at all. A vfio_device is not
> >>> supposed to be tightly linked to KVM - the only exception possibly
> >>> being s390..
> >>
> >> So i915/gvt uses it for:
> >>
> >>  - poking into the KVM GFN translations
> >>  - using the KVM page track notifier
> >>
> >> No idea how these could be solved in a more generic way.
> > 
> > TBH I'm not sure how any of this works fully correctly..
> > 
> > I see this code getting something it calls a GFN and then passing
> > them to vfio - which makes no sense. Either a value is a GFN - the
> > physical memory address of the VM, or it is an IOVA. VFIO only takes
> > in IOVA and kvm only takes in GFN. So these are probably IOVAs really..
> > 
> Can you let me know the place? So that I can take a look.

Well, for instance:

static int gvt_pin_guest_page(struct intel_vgpu *vgpu, unsigned long gfn,
		unsigned long size, struct page **page)

There is no way that is a GFN, it is an IOVA.

> > It seems the purpose is to shadow a page table, and it is capturing
> > user space CPU writes to this page table memory I guess?
> > 
> Yes.The shadow page will be built according to the guest GPU page table.
> When a guest workload is executed in the GPU, the root pointer of the
> shadow page table in the shadow GPU context is used. If the host enables
> the IOMMU, the pages used by the shadow page table needs to be mapped as
> IOVA, and the PFNs in the shadow entries are IOVAs.

So if the page table in the guest has IOVA addreses then why can you
use them as GFNs?

Or is it that only the page table levels themselves are GFNs and the
actual DMA's are IOVA? The unclear mixing of GFN as IOVA in the code
makes it inscrutible.

Jason
