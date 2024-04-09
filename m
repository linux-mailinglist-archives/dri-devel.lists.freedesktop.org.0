Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 812CE89E179
	for <lists+dri-devel@lfdr.de>; Tue,  9 Apr 2024 19:24:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 63F94112E59;
	Tue,  9 Apr 2024 17:24:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="C+9xM0Cz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2102.outbound.protection.outlook.com [40.107.93.102])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 97447112E59;
 Tue,  9 Apr 2024 17:24:33 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NnoDgQheILVcm1e0sj1EjgqhTEXIjiM0p+c7XNfRiu+ND/ic/CqBD2PmLDw5B+Np0r9LGlySIm5P2BQD3oYyokh+hODr68T+/zIgiFv5jajBfpgYt1eOUxXwJpOcWI2S0hDnpYqhT4r5wkbCDwEScGB+ex7jpNrbulDT8xVxS8EUEjgDvjCQZ35jMrl9MNjd24v+1R/1jHcHurCU8K9TdMJnVYxnZX9M3pGLkH+XCKDjCwMlXaT94uajx0ShKAad5zea96olgxCPWmBaixH3jXKEP9hFFFCKgGBe+BCu+d0zXeArWhIdW7hv9ShspBi+wliCM7CpNhkIiNOb3tZXjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9bcKGKrspqUprqAmML8Wd5nl9zVl1HX1tRuVj4DRMbk=;
 b=d4Wf07fT68xVW1bj2K7iSlXYq5Ad29cRiMBKJLEaC3oN1+P17HRW0W9wJdDEo1UmQKsUXbJY5dzxxzbG8oxTwvyS4gKqCfAiHrXtaJSX/WnJc/aF8L9AOeeF9WKhpwx3YmuMWYZdvNFf5kfWTE2wV6OFx1bDb7FAhMIUThnb1P59PQ+Yl+eY2H9jELc2gmUJ1vp2Sj2CwPyf6sHZ0y34k8EyW4Gq4vD1ZgmWvgm2fOIU2apP/qxaBilpLvjAHrg+FWej+/4uoR2p+rtiQ9o7QDB8hlFpMxcfhvUhOtPJ3YwOuuN3lPKAgEhloePuAKGfkwx6lej5UoMfWcTave2ARg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9bcKGKrspqUprqAmML8Wd5nl9zVl1HX1tRuVj4DRMbk=;
 b=C+9xM0CzM/oV5oim3ZdKNSlSXVn323lwoUi6U95sOjCy2y/FtA/JO0sjZ8tagptWfROoXKn2wqf0CRe1abaSQvn4R/EsAunsfDJ6gZ/LS+btJGoW+PuaZ3IonTlAVGcaQS+yIkEArwIzAAEz4YMI7jJUxcysw4bapN6cDYqpddaVyPk1Rak2ayNo372dXFcG0Ig9aIY9/gnUWp95SpmLQjT+dDVH7GRso1Hlm4NW7TEgrktr7j8TKNQEragqRXxA1FcSVytd86e9VUVr+28OhdxTCT0sXCYrA5dBW2A/Y0ZKs3/+zz0SUDnQs5RnxgdehTY7oPR+gNFa2NqMaV323w==
Received: from DM6PR12MB3849.namprd12.prod.outlook.com (2603:10b6:5:1c7::26)
 by CH3PR12MB7499.namprd12.prod.outlook.com (2603:10b6:610:142::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.46; Tue, 9 Apr
 2024 17:24:20 +0000
Received: from DM6PR12MB3849.namprd12.prod.outlook.com
 ([fe80::6aec:dbca:a593:a222]) by DM6PR12MB3849.namprd12.prod.outlook.com
 ([fe80::6aec:dbca:a593:a222%5]) with mapi id 15.20.7409.053; Tue, 9 Apr 2024
 17:24:20 +0000
Date: Tue, 9 Apr 2024 14:24:18 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: "Zeng, Oak" <oak.zeng@intel.com>
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "Brost, Matthew" <matthew.brost@intel.com>,
 "Thomas.Hellstrom@linux.intel.com" <Thomas.Hellstrom@linux.intel.com>,
 "Welty, Brian" <brian.welty@intel.com>,
 "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>,
 "Bommu, Krishnaiah" <krishnaiah.bommu@intel.com>,
 "Vishwanathapura, Niranjana" <niranjana.vishwanathapura@intel.com>,
 Leon Romanovsky <leon@kernel.org>
Subject: Re: [PATCH 06/23] drm/xe/svm: Introduce a helper to build sg table
 from hmm range
Message-ID: <20240409172418.GA5383@nvidia.com>
References: <20240117221223.18540-1-oak.zeng@intel.com>
 <20240117221223.18540-7-oak.zeng@intel.com>
 <20240405003927.GA11940@nvidia.com>
 <SA1PR11MB6991E4CDCD61A5D1909BB4EF92032@SA1PR11MB6991.namprd11.prod.outlook.com>
 <20240405123725.GD5383@nvidia.com>
 <SA1PR11MB699170C0F6FFFA231985718092032@SA1PR11MB6991.namprd11.prod.outlook.com>
 <20240405180212.GG5383@nvidia.com>
 <SA1PR11MB6991A4BD0EDDDF051A9A2C5C92072@SA1PR11MB6991.namprd11.prod.outlook.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <SA1PR11MB6991A4BD0EDDDF051A9A2C5C92072@SA1PR11MB6991.namprd11.prod.outlook.com>
X-ClientProxiedBy: BLAPR03CA0012.namprd03.prod.outlook.com
 (2603:10b6:208:32b::17) To DM6PR12MB3849.namprd12.prod.outlook.com
 (2603:10b6:5:1c7::26)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR12MB3849:EE_|CH3PR12MB7499:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: SFaZhHZHX4dap0MFI+Kz2FcjXOPAG8PXa4PYTEsN//FM3HrWWcBvy8lLTYZ2yhg2L4bkHdKQLQ4ZGEKOe0b8n4MSaz67ojEadEQ3qT2R4GUbJ6GpaUAogUydHxGBt2TbhHCnbx94q9HBsZnbLxd+ILhRyo2SqbJWAQBWBNwatkbqD0xNac+Y2RNbnHWSIlk19odd3cfhSv3muXbZMRrbN2yd6Db1KBDN2J40Rcb1d+fyF0mVVPhMl3SUNis+HYq9dS+w0aIqMLeOVv6r1xxUTN3ryFtBVWAjjpsWw5JujeRRAn9NCIgsJj1ngsRi6B0+bY32tWDRWi8w4Y7lWVCUzo7/PiBSb0tnQl7Pio/gud3InrChPdxeROuUU8jtgaLA2GyANYvcohQnmlOzzry/vty81WEonzcX8W99NmM2TyTkBJ7MT6358QkBD6TEOeRkBWefS+pBbCw4Ly/RdTW57lYGfbecr13EdxL2xVSS1j74/861BljLyXgEGn6EdzDbBW54aNtMwu4pv4Vcc48CeL6+VB8Q5lI0r0R6naatS/ewqth7FrjXDJc9xWPQ5EAOIuPIkTC9LxpvUpxgRm5BBtL48RZJfnsVu/MNjfajKPg5JJLAs4FuZ69sBjO9Jv1Jfzr4SEx9zH5Yay6pBjuuzqdW5c/GsI2jKqMlGonqEHo=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB3849.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7416005)(376005)(1800799015)(366007); DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?YDtlw+0e8tMIG65gAxSG6yPBOk9erjvffdtJOzhauzyFtHRCpFuDBfYmCH6z?=
 =?us-ascii?Q?z42Z7RIAl5pkYQMjRA+Cuq9dsMeLhdY7sf2JvPweAySeNPR7ir3qyuT+bDJc?=
 =?us-ascii?Q?dDpa21+wkeFgU08DJyZGGgvJtN8ZyVz6BbAbpTT+31MJ2cj4pRIu9qzqmVEk?=
 =?us-ascii?Q?ubACWKyYAuKPUXV5Qblumps/d6nSX+vH1pIbXmu8fPfS2Xjiw4WBsjoQxWpb?=
 =?us-ascii?Q?WogGoqAoZu5TNAKF7yKv8IYdODxmcGys1dgxKV/JkIbtCkGC41VY7O/T/Yt+?=
 =?us-ascii?Q?1Beh3vzWI5QfJQR9i9cyWSgPwx1C9C6gH9xB/LBShCuqAjDsUHm3zDd8A3/z?=
 =?us-ascii?Q?c7UlVAqF5IVfDSNiDJe6qVPV6Rj4PKTL2AXr4Nq+HqxC/vXOvX/CcgoHjW8r?=
 =?us-ascii?Q?dILXn4PM6G0zPy84yg5VE6BTitLf8abFpIOW6OmI6seR0zRUXSlbZyReurEP?=
 =?us-ascii?Q?o58HXFnsMdmviaDYovSXPqDDbRklEaT8UhspQu04YPh9HLSIpJ4b/aqrLe6T?=
 =?us-ascii?Q?QTGDJgpGnsXoIOg2kTimok741ZRTRzh0T5Jx9SqMV86Balh++nZBHXrO6Vwn?=
 =?us-ascii?Q?HHPrEwCTZU5VTaS2E6BYsefRI2PrSknS+rajUHGfOash1Y1a3r3/THgEuMbY?=
 =?us-ascii?Q?jHhcpPvB/HoQp17TQOPDC7bXIT0ogTRMHe0RZPgieXsXdcY2ZSkIqjGiILgm?=
 =?us-ascii?Q?2sdwnRY3ZnSIUTXjYn/HqmoQH8/YLdNXY8dXusOzx5kmADIk4y0nQHMLJoiS?=
 =?us-ascii?Q?q3dPd7D9thbm91c4kBPNpan84rku+aiAk5ab2PARGpw1DibRN9Ihrybgt4b0?=
 =?us-ascii?Q?c07PANtaAN1LLN7j+jgF34hdHDCrf75s7w0r4UzNCHTWUQOu26wD+mlYOscV?=
 =?us-ascii?Q?+7BNe0576Nl4NDqAZI/f6RyhkV0DpcWeTAPlDSU23semQ0piI7SN4mUOGj4H?=
 =?us-ascii?Q?8pIDT3JvmLESkXUtz1+CrBzbT/JABJjdeiIw+ngVcL52bz1uBu4nXts2cg/6?=
 =?us-ascii?Q?/C50mdXXJopGNSSywH3K8gSRxvj3a5eDQwaUyUkog3xQTd96inv2by9ymHS/?=
 =?us-ascii?Q?ONYY4DwJdfhqUrpe2e4eww7xlpudo6g+v5UcFWmwzqT4un1bhbcsPJfHJbGS?=
 =?us-ascii?Q?lO290ccn7pbkZfmTlLmhNJ060d74GDX9eYyabHRg/mM/MTY4EDp49wNJKSrg?=
 =?us-ascii?Q?SQRQ+TGHd1ZmME7f4K//y8Acs5oyWFBlxCH8ezVL4mF9tM0oUSdAez0304iP?=
 =?us-ascii?Q?L7p2FoE5KSHu3/ojinE/QBIi7uys6gmUmV49qqFwTkJJr+Zng2Yb9bfYrrOv?=
 =?us-ascii?Q?k7WxAP4YLZc9Eb89cWPreDnCf3fkmsMdQPlirHU3KpFhSguiXaHV1H1jXao9?=
 =?us-ascii?Q?vH0CI7pud5pkrQl3J+oiIOq1fjfhJRrrM/WlXuGrBjgohmHRUeSD7YkAXINU?=
 =?us-ascii?Q?ntzJNj+VUVEneUQpc+SHQN9w968QoWzYp7H0Py2kN52TpcbTtYYAX7zevn57?=
 =?us-ascii?Q?hZobF5UDT6nc+5NIL3dJhMVB6dxvNwcFbsr7LmEHkpm105YKG/OoFjZnDoZS?=
 =?us-ascii?Q?8Cf4JMJsXx+ufZ4nORcjdrKOtYjeDHKWJH+swi7b?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 490a6394-f750-404b-88ee-08dc58b9e415
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB3849.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Apr 2024 17:24:19.9600 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4Q7oKVEUbQG6/1h7+yl835bdQ7Va1XDEE05JIil/Wj+FLHNTpMrHuCFs/4tHDsmx
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB7499
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

On Tue, Apr 09, 2024 at 04:45:22PM +0000, Zeng, Oak wrote:

> > I saw, I am saying this should not be done. You cannot unmap bits of
> > a sgl mapping if an invalidation comes in.
> 
> You are right, if we register a huge mmu interval notifier to cover
> the whole address space, then we should use dma map/unmap pages to
> map bits of the address space. We will explore this approach.
> 
> Right now, in xe driver, mmu interval notifier is dynamically
> registered with small address range. We map/unmap the whole small
> address ranges each time. So functionally it still works. But it
> might not be as performant as the method you said. 

Please don't do this, it is not how hmm_range_fault() should be
used.

It is intended to be page by page and there is no API surface
available to safely try to construct covering ranges. Drivers
definately should not try to invent such a thing.

> > Please don't use sg list at all for this.
> 
> As explained, we use sg list for device private pages so we can
> re-used the gpu page table update codes. 

I'm asking you not to use SGL lists for that too. SGL lists are not
generic data structures to hold DMA lists.

> > This is not what I'm talking about. The GPU VMA is bound to a specific
> > MM VA, it should not be created on demand.
> 
> Today we have two places where we create gpu vma: 1) create gpu vma
> during a vm_bind ioctl 2) create gpu vma during a page fault of the
> system allocator range (this will be in v2 of this series).

Don't do 2.

> I suspect something dynamic is still necessary, either a vma or a
> page table state (1 vma but many page table state created
> dynamically, as planned in our stage 2). 

I'm expecting you'd populate the page table memory on demand.

> The reason is, we still need some gpu corresponding structure to
> match the cpu vm_area_struct.

Definately not.

> For example, when gpu page fault happens, you look
> up the cpu vm_area_struct for the fault address and create a
> corresponding state/struct. And people can have as many cpu
> vm_area_struct as they want.

No you don't.

You call hmm_range_fault() and it does everything for you. A driver
should never touch CPU VMAs and must not be aware of them in any away.

Jason
