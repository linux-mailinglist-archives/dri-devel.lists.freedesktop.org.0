Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E72308B0BAF
	for <lists+dri-devel@lfdr.de>; Wed, 24 Apr 2024 15:58:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 06BEB10FEE5;
	Wed, 24 Apr 2024 13:58:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="mcmEEP8g";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2079.outbound.protection.outlook.com [40.107.92.79])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED94910E79E;
 Wed, 24 Apr 2024 13:58:01 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ByXaN/OJln29zOxYAcmzGA8FoKC7UdEtl4sWEhoeBGS0ns1K53t1srqAEwsuTF4u1I701mOkaWRaPEeXIGKMo+6sxtmCIBqZYKhONxeRzMNUz03cmhjVYhJ15/i3Wk0K8qjzW2tZc9ej0CFf7XAF6Z63/+P8ILpzxb1f38+t4tZEiANqHmbLIf1uEIszPOaLdmA5tke5rtFTxBV/25rJOBluDZxGlP6m5q8QMuK7mMM8fvXuPrDp263Ne+jCLSB9X2LVnlDN5zoB0UBAZNisAlp/pKInzYW4IgpCCOb5MGV1tJ+7cjlMFHtKX2aHZ2E9/PUBO+C7i/GH9Rz/QvDzIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2BFDnoihkGfQ9eqw/hn7yLGHG89oulEijOGTgKAk6rY=;
 b=e9gAVuZouLP1QMNbODafhBtcaWJ8COEvo9BUJtETnS/hfD6bp9a60op4ma7P5jge8g6nbrBB9fVyfzuARpw0T4ysV39ugxQ1Mkx40n/meK4xgoIfsGgtSVUZo7Wqsgb2QXx7LAuUXwuSXqR1iAZTw3eN1U8z7APNKeGIdDWKhb/sjNcmlfgWw2OhjgnKk7ElDLnHCaphPl6z6nn+SdPE/2HG+PuaaG/r5N+s5FYPS5TR0DCumwGQAV1rWaFqwK105D8uAoCPYFrHcNsJ/6rbIhu5euvFxpGF0qC5CSXQ17YcqQ8Ge5LHoItXo+RWOZG3gRlb80vqXcTqSdD/tmax3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2BFDnoihkGfQ9eqw/hn7yLGHG89oulEijOGTgKAk6rY=;
 b=mcmEEP8gH4KkaW1h/+WDUiw66RE9S6R324xQR5MPoSwu6o3mBqhciLD0GXoaHYG+6c8jJJF/fIlY0vTeeOHBEM+7vrpZ2GHm4zNxRylSPok1bvSffVr1AFoaDeHKn/0kqvy7AYSt7Qgqd42xrt6pG3c6QeUC1Ud4PoakguGKmjOV8yzHoDWRLlvMSFPt8FWBjLcXeIwuD52f//2jUUyK8n8tSe9z0AE1odg9CpNIzZo0tUClbrAfEuKBEX+VtcNa9lMDYsNa/9yvG9903Z4x4hf9kbbfS/8rsfNNicRbZTcdUgtPpqbT8Xcd+tCDQnAet4VIzTrRXD8gM0RZfCik5Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM6PR12MB3849.namprd12.prod.outlook.com (2603:10b6:5:1c7::26)
 by IA1PR12MB7687.namprd12.prod.outlook.com (2603:10b6:208:421::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7472.44; Wed, 24 Apr
 2024 13:57:58 +0000
Received: from DM6PR12MB3849.namprd12.prod.outlook.com
 ([fe80::c296:774b:a5fc:965e]) by DM6PR12MB3849.namprd12.prod.outlook.com
 ([fe80::c296:774b:a5fc:965e%3]) with mapi id 15.20.7519.021; Wed, 24 Apr 2024
 13:57:56 +0000
Date: Wed, 24 Apr 2024 10:57:54 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Matthew Brost <matthew.brost@intel.com>
Cc: "Zeng, Oak" <oak.zeng@intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "Thomas.Hellstrom@linux.intel.com" <Thomas.Hellstrom@linux.intel.com>,
 "Welty, Brian" <brian.welty@intel.com>,
 "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>,
 "Bommu, Krishnaiah" <krishnaiah.bommu@intel.com>,
 "Vishwanathapura, Niranjana" <niranjana.vishwanathapura@intel.com>,
 Leon Romanovsky <leon@kernel.org>
Subject: Re: [PATCH 06/23] drm/xe/svm: Introduce a helper to build sg table
 from hmm range
Message-ID: <20240424135754.GK941030@nvidia.com>
References: <20240117221223.18540-7-oak.zeng@intel.com>
 <20240405003927.GA11940@nvidia.com>
 <SA1PR11MB6991E4CDCD61A5D1909BB4EF92032@SA1PR11MB6991.namprd11.prod.outlook.com>
 <20240405123725.GD5383@nvidia.com>
 <SA1PR11MB699170C0F6FFFA231985718092032@SA1PR11MB6991.namprd11.prod.outlook.com>
 <20240405180212.GG5383@nvidia.com>
 <SA1PR11MB6991A4BD0EDDDF051A9A2C5C92072@SA1PR11MB6991.namprd11.prod.outlook.com>
 <20240409172418.GA5383@nvidia.com>
 <SA1PR11MB6991EDB4351D99B4E76EBC2992112@SA1PR11MB6991.namprd11.prod.outlook.com>
 <ZihvCKYRRw1NzoNl@DUT025-TGLU.fm.intel.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZihvCKYRRw1NzoNl@DUT025-TGLU.fm.intel.com>
X-ClientProxiedBy: SN4PR0501CA0098.namprd05.prod.outlook.com
 (2603:10b6:803:42::15) To DM6PR12MB3849.namprd12.prod.outlook.com
 (2603:10b6:5:1c7::26)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR12MB3849:EE_|IA1PR12MB7687:EE_
X-MS-Office365-Filtering-Correlation-Id: 3f477716-37ef-4146-5d6d-08dc64668b23
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?AJurOz6Ipo9GAGgMolJoGkObb8NOrFbXh06I75BLTJe4t8aYsdJbVL5p5wu1?=
 =?us-ascii?Q?9xEngYTPSNtZ9GBcfbg9soJXTIBKK9ecgkPTwGvNuPAcg8fK6tBboxN2VsL5?=
 =?us-ascii?Q?jT/wTlBZUs3D6UwFfjR2uFt6FZx/pYdA0XsnYzXxzbtDFusfj+XZx4Vw0g+y?=
 =?us-ascii?Q?PPrFi84J7POosGAKL8MWC7REwNcAD0WQxOE+YUcime2EfMsHUXSnYPoUNUMc?=
 =?us-ascii?Q?/lPooOqeeKzT5xrPEm0coHCfERRxK5/yUWb9WkWR2tOnHrDGmYEi0vY8xwTo?=
 =?us-ascii?Q?5DvX/OPUwSc9a8iH4oe+fF+rK1XibXQ25TKR/gDkRK8i825kVqGFlqttQzez?=
 =?us-ascii?Q?hSbZnvAR0r7XiWj5mI7+3feiBVivbfe66o3yCfz2fttb2WmNOIE34+RghVl7?=
 =?us-ascii?Q?xa5trbW2J5L0Bjq8cmXobU3wN929jXX7DP85QX7PVwzv4+WaZAOntPHwz1Zz?=
 =?us-ascii?Q?sC1aRY8wH0nTO7ZMm0NBgzvmbc8q/u2/vyq9O1UDPC0MabmaV9ICM7PJAx2D?=
 =?us-ascii?Q?u/ZFuNFw/Euya4XVXS2qIlYkvtvY2ocCsqw/s+xl7esW93BD4chqUTopY+ud?=
 =?us-ascii?Q?HUdwCbSPj5w3d9rMB9/VB3Pz5ZZCg6nqcm4yybkncOGP8lyW6x7kFp3dzzoR?=
 =?us-ascii?Q?F1ln1PjVbBzJhnMI61Q4lFXytzMYqH4hnSZ8eRSEC+bHswxqvfGlwt6DydXE?=
 =?us-ascii?Q?l7EOCQAWNg0bygfKvZi54qONXsdyLVc/9Xsi19clTq+LBzbGwsJ61UNut1Tg?=
 =?us-ascii?Q?bZSgPPGLRnErh1FGT82qhQmUSaYrewEKxrVblkiQE0pxIUdtyv4+lFVADmIA?=
 =?us-ascii?Q?m7bKSfKj5/BP2GVuJIEro0abPedIVWVih9t/CaUDaXewO6xwHJjBy4d+6ymj?=
 =?us-ascii?Q?jtiIkArgE6QhNK6yzcZlmrKkiZEEIXlX2RxPj2PfbLZtLCwbDOxAXWtjMop/?=
 =?us-ascii?Q?kXd/3A8TKFBCBvXMirl3/DxZ/8tfrvxHZtf5xzp/CEVUKMy+zqKOfzC/386G?=
 =?us-ascii?Q?AReJ07OJFOE4xCDjBPX9BoDTiynT82ldkhfo/DghyojJ54TCTY32L6VGH2Ey?=
 =?us-ascii?Q?UdAxuJYtZhC23/25nclbS1fItk4GWuzT8nBNcrvckWIrlCqDjh3wxZWtCu2a?=
 =?us-ascii?Q?mbHYKSPKqOKm8xogUuKZD/1U6/Qhy4GDRUTh1zEK8xS6LzNEBuJIX6YWySra?=
 =?us-ascii?Q?1qY5kU266/msprmIVGlg6CtL9H2463GvJOYvE1ltc2pGdEOUlwqAc+UGowUD?=
 =?us-ascii?Q?2W49cxvlJsFmMo5QWlL7upbcCNytngpShlBSLtRDnw=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB3849.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(7416005)(1800799015)(366007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?K5kJqp57Hps1JiiTz4pm+uArDLyJ6h1T/OBJGbYVC8L6taE8clpGyCgamH4+?=
 =?us-ascii?Q?qEUpkF4l7bv9/43kAAhbd/DxhUjZhaI4vBNwr4xUCljgCUUWcpA0bbmuXQ+D?=
 =?us-ascii?Q?7o7OBATaIFw+Qr1tHqjUcCxmyq9pZDlereWLd26mR4/THs1mS0zhs+nKCK37?=
 =?us-ascii?Q?KFpybDwyM9ht46DUXW5xVR0fplOWYm0JATKsf32fBYNKliW7qIqTwUQP930j?=
 =?us-ascii?Q?gG/r0KAhmMubpkkvtLNTAmn54luWF3RpBm/PAcTAXJxu9HDbkRity2EZ/zZg?=
 =?us-ascii?Q?sP5b8MB/IZ/0k4QTW0mPB7e17dxrDQYPFMQN3rU5eF3pjLE0vsXA8deYXYLr?=
 =?us-ascii?Q?qB994XJeiSxMLxdGtYNqak98xNM1m//UQ/T/Bef0odxsRj/qe/a+lWtfWiIB?=
 =?us-ascii?Q?kNMnceGl3ruK7P/1q6bOIC3UvPQhL0HW2JEOW/Y6W5EUkPjc/4J1CukRMRwA?=
 =?us-ascii?Q?uVbC2Tvfa9Lk2sKW9YIYr0ZxXKOTp4uZoM5fqSoAAb9gsVb/rEz+8tkMr63E?=
 =?us-ascii?Q?oox4A6cBGBfaIqYTU8Jxfh11uZHHN976HMeev+M9V+wtemZA6TQ4oXdjo2Q5?=
 =?us-ascii?Q?BE69f49f10s0mMOfs30Ct1GEOI3DFgQaHIVj38DXW7Ub2MfQwU8uK9RgO2n1?=
 =?us-ascii?Q?o2fXGX5n81BS1E4iMNukVdobgTwGXY71FVMqZmg3YyuuToiljQsXBXv3E5Gz?=
 =?us-ascii?Q?m2yVCiPtEPguxtrV8JyADgrgEWo53cie4sjhfgM55+k/qDO8m34X+o37rTof?=
 =?us-ascii?Q?bcwIl0qJAzt85+iqLiz0+g3Vyqf5Nm3QoFtHL5pe3WEkWcoTj7LNEhcrv9J0?=
 =?us-ascii?Q?u8Ko4/wzOKJ+2tEVogfkEnRYt9ilCpPz2fKW6VFqB7QuzjxhdoCeDt6haBQw?=
 =?us-ascii?Q?++h+EAaK2QvE0Z6r/wWa4DCaTvZ52FxXkbW8x4dxFgkHuGH6wmnOds05c+GJ?=
 =?us-ascii?Q?wlmzTqWiRGGowxypKuojsGFAKSD3aaeH6Wnqfoh/lQ3T8hknaroeJmsv10ZS?=
 =?us-ascii?Q?N5AgJpGrYlT4UqNYfWh45C4jC6EsYqTJf3r5FYzdmy02g8IcQ30pGwxnu9wr?=
 =?us-ascii?Q?YA41kddQHs144J5qipcpGq4rwX17LLvRtq8qJ6UMIccQVnxOlyj5Leya7nGe?=
 =?us-ascii?Q?30VyfvGCGk7u8/ex+NlIScVBFiEQ5GkDF5QiVtqzNLoccNwZukWp0fiOkFcO?=
 =?us-ascii?Q?XWIlAVdClR42lHr+o7xDuCJW1TQc9J4hrYWbcZQeKRo8Aco4nLUAVT+JFzRb?=
 =?us-ascii?Q?yecd4JPCYQJDVYeyH2/2raGrg0LOLS2xl4MWagaafQfYbXYTvvU3P+PISAGq?=
 =?us-ascii?Q?WIMnENMOh+JGUB1YljVmEZ61M1XIHWJH0QsekgJYMxm72c1WvakEUTZHRuft?=
 =?us-ascii?Q?8Inv/f6/HYhriaJPkAParVaMyMFPN4169gTsPzTxEe1pUBQVX9ne1eJsG7vB?=
 =?us-ascii?Q?yU/J8CwtfCxw06FIzRWbeGGqSZJUxxYmSXVwqE7zpyIWmECMKeYB491cELYV?=
 =?us-ascii?Q?/KT1SdTM5BIwhNwAQeqWmc7KnpewYkkX4L/0iRxJKoTZl7EDqLVT/oRM55S+?=
 =?us-ascii?Q?3tkMteL+IxIlJgXKHEQ=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3f477716-37ef-4146-5d6d-08dc64668b23
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB3849.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Apr 2024 13:57:56.4605 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: D/ZunPmHFyxZV88M/j08cEOe2/g03dadIArxZ3e3IDyEhC/Nq6X4A1Bn9HU7HvxW
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB7687
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

On Wed, Apr 24, 2024 at 02:31:36AM +0000, Matthew Brost wrote:

> AMD seems to register notifiers on demand for parts of the address space
> [1], I think Nvidia's open source driver does this too (can look this up
> if needed). We (Intel) also do this in Xe and the i915 for userptrs
> (explictly binding a user address via IOCTL) too and it seems to work
> quite well.

I always thought AMD's implementation of this stuff was bad..

> > > > > This is not what I'm talking about. The GPU VMA is bound to a specific
> > > > > MM VA, it should not be created on demand.
> > > >
> > > > Today we have two places where we create gpu vma: 1) create gpu vma
> > > > during a vm_bind ioctl 2) create gpu vma during a page fault of the
> > > > system allocator range (this will be in v2 of this series).
> > > 
> > > Don't do 2.
> 
> You have to create something, actually 2 things, on a GPU page fault.
> Something to track the page table state and something to track VRAM
> memory allocation. Both AMD and Nvidia's open source driver do this.

VRAM memory allocation should be tracked by the mm side, under the
covers of hmm_range_fault (or migration prior to invoke
hmm_range_fault).

VRAM memory allocation or management has nothing to do with SVA.

From there the only need is to copy hmm_range_fault results into GPU
PTEs. You definately do not *need* some other data structure.

> > > > The reason is, we still need some gpu corresponding structure to
> > > > match the cpu vm_area_struct.
> > > 
> > > Definately not.
> > 
> > See explanation above.
> 
> Agree GPU doesn't need to match vm_area_struct but the allocation must
> be subset (or equal) to a vm_area_struct. Again other driver do this
> too.

No, absolutely not. There can be no linking of CPU vma_area_struct to
how a driver operates hmm_range_fault().

You probably need to do something like this for your migration logic,
but that is seperate.

> > > You call hmm_range_fault() and it does everything for you. A driver
> > > should never touch CPU VMAs and must not be aware of them in any away.
> 
> struct vm_area_struct is an argument to the migrate_vma* functions [4], so
> yes drivers need to be aware of CPU VMAs.

That is something else. If you want to mess with migration during your
GPU fault path then fine that is some "migration module", but it
should have NOTHING to do with how hmm_range_fault() is invoked or how
the *SVA* flow operates.

You are mixing things up here, this thread is talking about
hmm_range_fault() and SVA.

migration is something that happens before doing the SVA mirroring
flows.

Jason
