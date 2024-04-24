Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 307B78B0B70
	for <lists+dri-devel@lfdr.de>; Wed, 24 Apr 2024 15:48:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 55814113B6C;
	Wed, 24 Apr 2024 13:48:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="CSIzFPp+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2046.outbound.protection.outlook.com [40.107.94.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC191113B6C;
 Wed, 24 Apr 2024 13:48:44 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GPCXc/7xzBJd1gMf/GDjBTrmrGL0ouITATpEJT+YVgst8Ix4WvUAUuAm17Ca2X8z1A0DltJRrYcE8mM0p5mX6SnciRWiQZClPiCVWlpi76705LGeu13bnmAyeD4jGzA7FtCPz2SI2rOQIRFcoMymQbCSIVS6rBYMHzuxAozd6Kdny+vrPZpPzBZN9De4uVoX98/IJtaAOAKGSYjGeunHbUGbphaxPR1fk5yZ5J0fIe9sb9lu7heecJ07g16SNPHlWcPKrh1V64AjAAH1YyBkf8Z+pvRwQyd/0c5qMLQHcSgvx/paIBahm3gflt6VmU3v1gPiLctinXsvTHLpHXsASA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+tfp8/m6vSgLSRGyInBXXgGzW7LJyy8osZNyU9uHx5Q=;
 b=T9sCsNVrNWCLY+oqN42VK4A7YHmGLxgZt6aYD4aDYyrT85g38nBV63yKUIKcNNRmzwcKSd3UqOY8m7C2wCz1I7GCBldbVbvl4KexJa9OWYCjg3VupI+fevHpBJsBA4DL+wQ4DIRSNMaHrkOIc/ojqdwfoiEvLYchfZARUzV1565ms8EEE04fatyZdO9gxAmiG15X6RRrw6rowiILAHUgQMQzWemR0k1HiwcrsFnOJMsGlXmiT0t4t8fwBak/iptmA1cj528+wsn2zyYADTiDbwKqFIEhwMFwbPKmbB+kwSzFULTNuls2zf4eA9L6yQ2sVy8EYBXXFeG632K4s8bN4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+tfp8/m6vSgLSRGyInBXXgGzW7LJyy8osZNyU9uHx5Q=;
 b=CSIzFPp+ubNku4vOcOawvavf0H0uGOgs5fFyz78vTKjALYLYPlJQsWXmGnz7F8PArG+4IJVJCrmV50ExIAhaUmydqbXpR5cC/vWQ6Nbodx/DOwVj020Xm4NgJCTdFfSWMbGKjJbKOqA603vAN9RnNkN/am+rf4s7BVbZyPuozfz7Rq+PMtPBhKR29YcEDM9L48ZQlzvEv/YKZ+HVZVsqSw0L/mgXn/Xgpx3Gt2clgrZZzfxFziOtuIKLRCPtloXhENCsMMb0eVCMD4BnGpxhLklOKm4nVuBXcsFV7xahHVc56DJUGPwROIzVMVfAn20CduXa2MStZnpV3qODFWwImA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM6PR12MB3849.namprd12.prod.outlook.com (2603:10b6:5:1c7::26)
 by IA1PR12MB7687.namprd12.prod.outlook.com (2603:10b6:208:421::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7472.44; Wed, 24 Apr
 2024 13:48:42 +0000
Received: from DM6PR12MB3849.namprd12.prod.outlook.com
 ([fe80::c296:774b:a5fc:965e]) by DM6PR12MB3849.namprd12.prod.outlook.com
 ([fe80::c296:774b:a5fc:965e%3]) with mapi id 15.20.7519.021; Wed, 24 Apr 2024
 13:48:41 +0000
Date: Wed, 24 Apr 2024 10:48:40 -0300
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
Message-ID: <20240424134840.GJ941030@nvidia.com>
References: <20240117221223.18540-1-oak.zeng@intel.com>
 <20240117221223.18540-7-oak.zeng@intel.com>
 <20240405003927.GA11940@nvidia.com>
 <SA1PR11MB6991E4CDCD61A5D1909BB4EF92032@SA1PR11MB6991.namprd11.prod.outlook.com>
 <20240405123725.GD5383@nvidia.com>
 <SA1PR11MB699170C0F6FFFA231985718092032@SA1PR11MB6991.namprd11.prod.outlook.com>
 <20240405180212.GG5383@nvidia.com>
 <SA1PR11MB6991A4BD0EDDDF051A9A2C5C92072@SA1PR11MB6991.namprd11.prod.outlook.com>
 <20240409172418.GA5383@nvidia.com>
 <SA1PR11MB6991EDB4351D99B4E76EBC2992112@SA1PR11MB6991.namprd11.prod.outlook.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <SA1PR11MB6991EDB4351D99B4E76EBC2992112@SA1PR11MB6991.namprd11.prod.outlook.com>
X-ClientProxiedBy: SN7PR04CA0020.namprd04.prod.outlook.com
 (2603:10b6:806:f2::25) To DM6PR12MB3849.namprd12.prod.outlook.com
 (2603:10b6:5:1c7::26)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR12MB3849:EE_|IA1PR12MB7687:EE_
X-MS-Office365-Filtering-Correlation-Id: 76913d23-fc6a-463a-1a61-08dc64654090
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Ad4roHmot5L+izea2MAAdDBZ3+WSai77nyOc9OMlTogDpP1v/U7T9c729klJ?=
 =?us-ascii?Q?Cr5HTkF2JiKy1Q1QdO+pvFCv/fb/VRIJ7rfrz5mNMKuhe+0czVAsGubzwdkC?=
 =?us-ascii?Q?/iae10IQ2FXB0Exa3ckZ3MSnqtDX6xiFyk2xserfxMlMKVKSm09RvkYSl68p?=
 =?us-ascii?Q?nHyKDjdJjsTAUHn7XGUlCQoJ9Y2T2xUHXPw9gNFjCLrCKDrTeoCJkdrRJmfa?=
 =?us-ascii?Q?iGqJJ7xsFUa1PTXzZKtCkCx+Yi8BFcJNc149o57NC3En/rVMxEN2GZmEMO1Y?=
 =?us-ascii?Q?VuieAAT7/00QRu311QwGz8fRouj1FcnXQDgQiMG7wRIj1UZzd2GD7BksHrt4?=
 =?us-ascii?Q?vFSP1uN27ZfXaYnq6OdXZ/zQWeULKr4XprnhMsROqi+MHkelWP3ktgN+f39z?=
 =?us-ascii?Q?BIDbStxTrXXefVg2jnc/nvEO7+dtYuRX7QK4EQW3iC+3Rt9uxQBLcHLVspH+?=
 =?us-ascii?Q?6GIRxxCm5X4ZFR9zs97/Bz0bvs167jtPeq7yGnsRv5yqWLF/yWE+CQQHhKqc?=
 =?us-ascii?Q?w7NX2HBewNB6Cjo+sqKk5D6wj8xw9EPQC/ZsAgpql7pChC217CKeqbo4lXPC?=
 =?us-ascii?Q?wnJBf4jBZzHxKN8/ON+JVmLGhCokQ0nw02+3vqFcFFub/k3/v9On9ralO4qp?=
 =?us-ascii?Q?2/pQgb0wth3VAfpGLGhLn5IspbdZTAnWfZRFfPp5te3RA2k8ZUXWsFm5LQgm?=
 =?us-ascii?Q?d35PkYNbPKn3QrTpq0yM97zBrFtlc9ZEJi5vnq4Hj5cW9jEDMHBOGVvtkIgA?=
 =?us-ascii?Q?SgGlwH7OmlLei+uKoqV2DdoBVU6qN3ojNtwrJbnFmxelrM0JTTktQzokpHzK?=
 =?us-ascii?Q?aATOo99BR+57fSm7w9nnMWu+dXLZPfoUnL4UsSw47Sfht66i3MYIONNBhUfw?=
 =?us-ascii?Q?cBE5sCoDhArVMxXXeuaWHsiKvhDECvP/IZ7a2PZYWmvml9HfmhNRMJElHkrt?=
 =?us-ascii?Q?PUqugBY7iHpOBMoCrp8UYKs11uVEaifoxW3vBAXsSHgwk/8vZQGoa6PCHzz4?=
 =?us-ascii?Q?cVTkR0lWa3BMI6/UR7+T4CVsnhgQzAtgKNOHUr/eZtqPVOhonYsZLXLVXo2V?=
 =?us-ascii?Q?leU4VgrG5f+GqBYnddrBBaOlqkh9w4S2JOaOmh3sDn7nJNJk8XOD01oPpt/q?=
 =?us-ascii?Q?qejZVIe1XN4zPKI8MM/f9NzMkdWRky8xSCXLn1Jlre09EF6w3LwGMWsN6oiE?=
 =?us-ascii?Q?k+3PogC6BV5NxCWQ8qxIc94/pQoMUMPezqETTbyleNvGQZN4xw2sIKVky5G6?=
 =?us-ascii?Q?J79dlQAk7mNjN9FFoqvSjcI6TpTm2QD8I2WI7lNuWg=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB3849.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(7416005)(1800799015)(366007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?62/ZOerx9tS0tcfPiinC0E7SdCWdgzaDMuHs1rwkCtkEYPXHqlhb/CND+UOz?=
 =?us-ascii?Q?gWYEAq8gNTKUrh8Z4bZipuAyFfC61sc/wPoVKv4CS92ll4RAMYqfd/l/y1vn?=
 =?us-ascii?Q?6keXSyizTytruLmCeiUO02FK0x9/8d/zmdaNO4N/g84l+CFgp5Smek9jlo8/?=
 =?us-ascii?Q?CRfZWRZoY7aOEF/I8tJgpPkWiGnDhb+7eDjfoVIotYPzkcLpk6RUvpqWRJd9?=
 =?us-ascii?Q?IOs5so+MzriLiulU2q1sBm5ONklxQbJ1ulITcw0WYxMRj4FJ4kCMrXhhUCP3?=
 =?us-ascii?Q?NS0nao77dfKoTi9PjtDmC5+PArPoE0Q3n5vS9a9chJZffoW5TVh2JAKNh4az?=
 =?us-ascii?Q?lf+wpY+2j4jtlAl5fCzDtM4gKcgLDKHCXzjIVCVbOKx0Vh/AakOHoHCb5Ibg?=
 =?us-ascii?Q?5ToVARGsYtZ81pkfwMdFKPZ3oQBMQTPuEYT+n4ImIK7QVWKNbv9ekxSob/rN?=
 =?us-ascii?Q?otJ8EzxIsW0I+12EVsJ47jSOIfY5COBdeCyK5Y9fkX2NyDNpMfh55ngoT6At?=
 =?us-ascii?Q?QI9ufudLd/6baOBWy4JajIFrZHeMVwUTwqKxdman48okjKN4NVPGHb9xzI6L?=
 =?us-ascii?Q?/ginx9uReN6mgmIDKW3NpDwU71bBoTsreHld2SI5YkwozEsq87PgWFqNZN1d?=
 =?us-ascii?Q?99Xqj2pl8RD1h6/s3gEGqPFyjDFdThMQwpGqlstcoS+Sb8xShKzjKF/G/VPY?=
 =?us-ascii?Q?NpMG+jhBUNSLB5fLPrndxA4zV5lSxgHKxTp3ta9Nlq6GoWjZmnZo0RR9qj1A?=
 =?us-ascii?Q?yrGtFn91WmTX6JL4Lf3aYeh6DMMR5qf3Dt/cUO/h2NOjf3xsQrBoXOdpJ+qD?=
 =?us-ascii?Q?MlShqMSuqFSadO4xksi3Rk3kRU+StIyBG8tjiR85gkGksQHhcBeZwl+UYbwT?=
 =?us-ascii?Q?T7LYC8qJJ/8LZ3GnLv9xkCEV/Czuzd1wzqu/faXXs9iSsM+bDZwGFISk+E3H?=
 =?us-ascii?Q?VzgwZlvDDc4VLSD+gOmUuM9GcneJ/VUNHZJ+/MgwkOu6VHWHx0MuPSNyf5yh?=
 =?us-ascii?Q?I6R0s2dwliUIUMz0PggUjK+5AEvjKlSBaD1n5BT0vueuj1DcDuVJaDoCrlN9?=
 =?us-ascii?Q?0Pg1CEdnEV2LrM/PRF6Bwnw8abVB9hP/fDn1cFLCIg8/czR7/bGBQfOuTxgK?=
 =?us-ascii?Q?xyDHzcrhn56yL5U870zutrD8YsdDtSnIwcjrgexcbM/FnzUQAew7x4DJGIw5?=
 =?us-ascii?Q?Ie38LF3pUVtuW7Y8W6Q63vNShjOYkeN29ZXys5qj0m/ZHxzKunpACQx40B+G?=
 =?us-ascii?Q?j0xjF5grX3IyvXDyY1Rg2MSaa/Q3/qiPy+NfK0FDJtCi7c6yfrwvPlUMlCPn?=
 =?us-ascii?Q?FuTgoIaM3i1XfmDvi3EmR8J/jkeLgX+0pXySooDHOJFVPaYmQ9GOZ/CQuJeM?=
 =?us-ascii?Q?EDiniPMOd9hI2x3+KO1sqa4WnQM/9NQAETHXA/F6c1NVSWnATsa/M9XkQCl9?=
 =?us-ascii?Q?NWapXuZ3IRs+MPKYifFKNOgGoJrEIH4uG6yRYgqw1RKxDPvFhIeut0QxqxQl?=
 =?us-ascii?Q?YfkuOiJnNJVzaxYZc6t148mNfrkXFYrAqVIqNR5JUXcYHy/H6uAQC+RcRuy1?=
 =?us-ascii?Q?v7CS3MNDMufYEVRTTDM=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 76913d23-fc6a-463a-1a61-08dc64654090
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB3849.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Apr 2024 13:48:41.8569 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hlAPKMA2+1Asrh1eXAhZuY6ZQ5R/5ZF51nimxQWa+erF+XCiQenUn/g3H0WDkBxk
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

On Tue, Apr 23, 2024 at 09:17:03PM +0000, Zeng, Oak wrote:
> > On Tue, Apr 09, 2024 at 04:45:22PM +0000, Zeng, Oak wrote:
> > 
> > > > I saw, I am saying this should not be done. You cannot unmap bits of
> > > > a sgl mapping if an invalidation comes in.
> > >
> > > You are right, if we register a huge mmu interval notifier to cover
> > > the whole address space, then we should use dma map/unmap pages to
> > > map bits of the address space. We will explore this approach.
> > >
> > > Right now, in xe driver, mmu interval notifier is dynamically
> > > registered with small address range. We map/unmap the whole small
> > > address ranges each time. So functionally it still works. But it
> > > might not be as performant as the method you said.
> > 
> > Please don't do this, it is not how hmm_range_fault() should be
> > used.
> > 
> > It is intended to be page by page and there is no API surface
> > available to safely try to construct covering ranges. Drivers
> > definately should not try to invent such a thing.
> 
> I need your help to understand this comment. Our gpu mirrors the
> whole CPU virtual address space. It is the first design pattern in
> your previous reply (entire exclusive owner of a single device
> private page table and fully mirrors the mm page table into the
> device table.)
> 
> What do you mean by "page by page"/" no API surface available to
> safely try to construct covering ranges"? As I understand it,
> hmm_range_fault take a virtual address range (defined in hmm_range
> struct), and walk cpu page table in this range. It is a range based
> API.

Yes, but invalidation is not linked to range_fault so you can get
invalidations of single pages. You are binding range_fault to
dma_map_sg but then you can't handle invalidation at all sanely.

> From your previous reply ("So I find it a quite strange that this
> RFC is creating VMA's, notifiers and ranges on the fly "), it seems
> you are concerning why we are creating vma and register mmu interval
> notifier on the fly. Let me try to explain it. Xe_vma is a very
> fundamental concept in xe driver. 

I understand, but SVA/hmm_range_fault/invalidation are *NOT* VMA based
and you do need to ensure the page table manipulation has an API that
is usable. "populate an entire VMA" / "invalidate an entire VMA" is
not a sufficient primitive.

> The gpu page table update, invalidation are all vma-based. This
> concept exists before this svm work. For svm, we create a 2M (the
> size is user configurable) vma during gpu page fault handler and
> register this 2M range to mmu interval notifier.

You can create VMAs, but they can't be fully populated and they should
be alot bigger than 2M. ODP uses a similar 2 level scheme for it's
SVA, the "vma" granual is 512M.

The key thing is the VMA is just a container for the notifier and
other data structures, it doesn't insist the range be fully populated
and it must support page-by-page unmap/remap/invalidateion.

> Now I try to figure out if we don't create vma, what can we do? We
> can map one page (which contains the gpu fault address) to gpu page
> table. But that doesn't work for us because the GPU cache and TLB
> would not be performant for 4K page each time. One way to think of
> the vma is a chunk size which is good for GPU HW performance.

From this perspective invalidation is driven by the range the
invalidation callback gets, it could be a single page, but probably
bigger.

mapping is driven by the range passed to hmm_range_fault() during
fault handling, which is entirely based on your drivers prefetch
logic.

GPU TLB invalidation sequences should happen once, at the end, for any
invalidation or range_fault sequence regardless. Nothing about "gpu
vmas" should have anything to do with this.

> And the mmu notifier... if we don't register the mmu notifier on the
> fly, do we register one mmu notifier to cover the whole CPU virtual
> address space (which would be huge, e.g., 0~2^56 on a 57 bit
> machine, if we have half half user space kernel space split)? That
> won't be performant as well because for any address range that is
> unmapped from cpu program, but even if they are never touched by
> GPU, gpu driver still got a invalidation callback. In our approach,
> we only register a mmu notifier for address range that we know gpu
> would touch it.

When SVA is used something, somewhere, has to decide if a CPU VA
intersects with a HW VA.

The mmu notifiers are orginized in an interval (red/black) tree, so if
you have a huge number of them the RB search becomes very expensive.

Conversly your GPU page table is organized in a radix tree, so
detecting no-presence during invalidation is a simple radix
walk. Indeed for the obviously unused ranges it is probably a pointer
load and single de-ref to check it.

I fully expect the radix walk is much, much faster than a huge number
of 2M notifiers in the red/black tree.

Notifiers for SVA cases should be giant. If not the entire memory
space, then at least something like 512M/1G kind of size, neatly
aligned with something in your page table structure so the radix walk
can start lower in the tree automatically.

> > > For example, when gpu page fault happens, you look
> > > up the cpu vm_area_struct for the fault address and create a
> > > corresponding state/struct. And people can have as many cpu
> > > vm_area_struct as they want.
> > 
> > No you don't.
> 
> See explains above. I need your help to understand how we can do it
> without a vma (or chunk). One thing GPU driver is different from
> RDMA driver is, RDMA doesn't have device private memory so no
> migration. 

I want to be very clear, there should be no interaction of your
hmm_range_fault based code with MM centric VMAs. You MUST NOT look up
the CPU vma_area_struct in your driver.

> It only need to dma-map the system memory pages and use
> them to fill RDMA page table. so RDMA don't need another memory
> manager such as our buddy. RDMA only deal with system memory which
> is completely struct page based management. Page by page make 100 %
> sense for RDMA.

I don't think this is the issue at hand, you just have some historical
poorly designed page table manipulation code from what I can
understand..

Jason
