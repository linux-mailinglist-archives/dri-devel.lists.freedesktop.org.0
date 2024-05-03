Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 69FDA8BB0E0
	for <lists+dri-devel@lfdr.de>; Fri,  3 May 2024 18:28:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C54C910E6D4;
	Fri,  3 May 2024 16:28:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="eYK9YhMJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam02on2054.outbound.protection.outlook.com [40.107.95.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C5BA10EE7B;
 Fri,  3 May 2024 16:28:22 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IqFTJ8+cAjKNl9HS/deInjwzyAek8nXoH4FRXsMVysEpvDXE0M783XOQc0B4wwMgRtPLUsYMWs+ZwlxWqxCmcuLn2asXdWzktK1hBMN8gvRJZ6OhgRODUt9GvIePmTUtWKamfvK9QxVVZDPnFa+fHZFjl/rqwuI37DStA2H5C/4Ok75+SD/EDhzJ6tEtizbemEQtLjosLR6q6xvtcBkHnWcQZbroMGx9mE5h7x17LyyRTJrBkZA4OAuQ24opUnV2tGYKY4aW3EH1F9CznKHen9FJD/JQw56i8O+jiOH59PMRPw//EtV/Jg2m2caolxFwh3Q1XWVe68OvJ2RPGijZ/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mm4NmM2rnH52svoY4fJw20soXSyriCoL9QEgahweUDQ=;
 b=NO7TGRTcLjCarzp1kil4cJakhRAb+vT9caRXwYkVIBlpC//FTBHHMJsAj1aT9jrjkE8sxSRl1YQqdTtWgxCOk3mNb5Hs+iXg+LETzKsUOm7AMgiBoieVKzg5IN65x0DakBC7k/9RLvPOQxlsNS6RbHddwhVgXDWy4MyAYlBkMAyVX/K38P+Pp6bCEd5OKQB+rFRXbZVLvDJ7E1IvfnqNr2cxmXGayBTuCuEXMjZKwV0C9e5FNItG97e9PgByyHXsuzK4l7EktpgD9+MJf9SCrWhe1Nc/I9LppPrm6JQ9eTG+Dp8VglZPPFkpBvhJuSnge54j11pYRuXN41Ks6XOV5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mm4NmM2rnH52svoY4fJw20soXSyriCoL9QEgahweUDQ=;
 b=eYK9YhMJdZY3mP1mKhKCK60hla6pS9hzjY5b+cJQiTcAfdRUve5SOAW2EPfplOeSVFYiQ8m2PO+7W1zlngR9fiqZ7ibon7tgTYKDtzL/JF8TXr1Phy+IfYfiOfalyTqfPLDgWRHx1LsPGrvDpgYkcdHyQwj4xtk+mSMUZ8LwyIWDxt+f2+9iKthebo8O2nqVezXCXTDmPz6RhmNCuUvsNAs/23WiQHog4XPy4N8+8o+Wvypoo2WTo68DnIq1LteaOuOptyvG2zSq/ztNK0nezarx3c7SqL8YW+dLROhz4tCfHqw95bnbBIkAe4+b47QN2vPP6eFZoNGD5DZ6CXQijQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM6PR12MB3849.namprd12.prod.outlook.com (2603:10b6:5:1c7::26)
 by SJ0PR12MB6782.namprd12.prod.outlook.com (2603:10b6:a03:44d::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.30; Fri, 3 May
 2024 16:28:14 +0000
Received: from DM6PR12MB3849.namprd12.prod.outlook.com
 ([fe80::c296:774b:a5fc:965e]) by DM6PR12MB3849.namprd12.prod.outlook.com
 ([fe80::c296:774b:a5fc:965e%3]) with mapi id 15.20.7544.029; Fri, 3 May 2024
 16:28:13 +0000
Date: Fri, 3 May 2024 13:28:12 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: "Zeng, Oak" <oak.zeng@intel.com>
Cc: Thomas =?utf-8?Q?Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Daniel Vetter <daniel@ffwll.ch>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "Brost, Matthew" <matthew.brost@intel.com>,
 "Welty, Brian" <brian.welty@intel.com>,
 "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>,
 "Bommu, Krishnaiah" <krishnaiah.bommu@intel.com>,
 "Vishwanathapura, Niranjana" <niranjana.vishwanathapura@intel.com>,
 Leon Romanovsky <leon@kernel.org>
Subject: Re: [PATCH 06/23] drm/xe/svm: Introduce a helper to build sg table
 from hmm range
Message-ID: <20240503162812.GF3341011@nvidia.com>
References: <20240430173002.GV941030@nvidia.com>
 <ZjE_LJ7AFFQk0Eep@phenom.ffwll.local>
 <20240501000915.GY941030@nvidia.com>
 <ZjNJASw0JdXS6dTa@phenom.ffwll.local>
 <93fca752517f0120baa770992fd0f9160b0c14d1.camel@linux.intel.com>
 <20240502124632.GB3341011@nvidia.com>
 <0b700baf6fc3d41b4adf6301b1b4dbc4ff7078fa.camel@linux.intel.com>
 <SA1PR11MB6991945628597BCD9D111ECD92182@SA1PR11MB6991.namprd11.prod.outlook.com>
 <20240503133732.GD3341011@nvidia.com>
 <SA1PR11MB699156AB3B2603DF1762BEA7921F2@SA1PR11MB6991.namprd11.prod.outlook.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <SA1PR11MB699156AB3B2603DF1762BEA7921F2@SA1PR11MB6991.namprd11.prod.outlook.com>
X-ClientProxiedBy: DM6PR01CA0027.prod.exchangelabs.com (2603:10b6:5:296::32)
 To DM6PR12MB3849.namprd12.prod.outlook.com (2603:10b6:5:1c7::26)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR12MB3849:EE_|SJ0PR12MB6782:EE_
X-MS-Office365-Filtering-Correlation-Id: 8633726c-c24d-4367-e571-08dc6b8e0761
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|376005|7416005|366007|1800799015;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?AL1dNfSHJ0gvXB4Z5+aboHT8X+Ur3CPj09IDDm6fIeApX+q2ODZ9pma0W+CK?=
 =?us-ascii?Q?RKb9b6igJugeteC5X9DxEEMfsPBoFBkw+m9CvhH2IZAUcOpuuNOaF+ag3NQ8?=
 =?us-ascii?Q?y9qvZ6ow/096kulaxQA6kV6g68ayLZBgr8ae7+eGYqVznGaN+fmc0S8FXZyh?=
 =?us-ascii?Q?ROnwpno7zabhnr2ZuTsOB3u6cn6f/aFG4ZGD9mi0AhYvAg97hyKeuTg9ZJa4?=
 =?us-ascii?Q?ClioFrPLormSLw7cCfCRJy39kXmeuZiCtMycyI9xKqtO5e9fVi5giWYM958j?=
 =?us-ascii?Q?SO2PC49HnKuGKMokTGsB16VajYumhM1HSTjeMBh9oSn50TdtuM1imXb9gx0P?=
 =?us-ascii?Q?SrMhpUoUWslO0xNvCgRsYpok60I+ixI2XR7uaGnN6eFeLz39GNms7iD0Ot/+?=
 =?us-ascii?Q?6q7cd374f1h6BMek9tPAsN5zTg/OQ+fXouOwtdhPRMv1MWmmE2msm/rEPmSZ?=
 =?us-ascii?Q?lvzWh183gt+zGwK9/8sIGrmlTa4kZLzUtcsO6HtJECxPfHC8SScUAy9W5fTY?=
 =?us-ascii?Q?pUoI4j+jqYE26l0KyLN/kK/Z0D6qrk4DDytda48i89do6e6yQJ0ElYYsL4pA?=
 =?us-ascii?Q?h1I+562OkvmDePRIQNR+K01bF43NRWBFbqkk3SgPLq7vdaNzHlRuf/iBWIkj?=
 =?us-ascii?Q?UOnhhQRAJ0QxSbDFXRBjqX/+40SdKZGsv6gQlBaMkwNHmN1yhus1iQ4BxsGt?=
 =?us-ascii?Q?s7MEDTr5Rjv8vB+ukhAaZZAntVGxSikz37R2XcqtHE8Nwr1IfYh9C99SHgwU?=
 =?us-ascii?Q?fXawLLhDArL6vE+CDuVfh+CE5cbVpoHTwEuryzyx7Scv6dB7ihrtThWEIqo+?=
 =?us-ascii?Q?rDMAeqwt3wBM5JmY8zpGvOiCei3tXGQxdvXs9K+kaMCzejsIi1zLFZqipZZo?=
 =?us-ascii?Q?+pk8Pwi2BB1WF7WwY44GIbgXIwwD0EJAI7U8Aq7nuJlCcnFiNhl3qQhWIEhl?=
 =?us-ascii?Q?SacspetSvLBq37HRzw80v6PwPDY9+TFPGkFww9WwXx+Sj8l67RNpYz8qyOVC?=
 =?us-ascii?Q?pWCoDPUqdQz5iXCj4ELWf0+FthsOhSgoE5Cu+pYvdcgVjcw8DxD1xa10ZU/z?=
 =?us-ascii?Q?ObdGiyPRrO2OBAPujhymQN0xVCYu/buaz1XxQGsv6h6YEmx4f30EbKzo0piV?=
 =?us-ascii?Q?Gif/j72HmCUrl76oWWvgJnqvGzWOriEuC90hpI5QnrkrXm1e06f3hX8k4yBn?=
 =?us-ascii?Q?rMx0mWx5YS3cCmLIcAOB1RVaqxc0/q+qsh9p9bZV9BSCaK2RHjhmV/WBP+yq?=
 =?us-ascii?Q?IHdfJFX7MjZnZRBkYuhDIWdFmz+W+5lD9+KBYbLt7A=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB3849.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(7416005)(366007)(1800799015); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?9MRKVM1h9QGaXPG6bAwghdZ3NmRT/vlhRekFZVnp0guwuaGfth5ODmSsjdo/?=
 =?us-ascii?Q?sxbGe1x2B6FOKtBboRQvD4ZbvS5jBOwlteK37mPe5vVxRJYOoB2e/JUQzO9I?=
 =?us-ascii?Q?OOeDLaLqnPj7d4opsQnGYMbvhNgyd/zhqTKjnP0EIWC7ZH6xVQ22iMRJwq11?=
 =?us-ascii?Q?FMvPloLx5B4gDNyERDJIf89+md6YFIpKyPPEOwYd1zmGR4OHSfp6gk0cB9TT?=
 =?us-ascii?Q?U4BI5qMhhuIWxjZa3IXs+YnQY+ocH6rwTz3+ONYw53IdStCrD6WAg/oALMtY?=
 =?us-ascii?Q?Yh1NOxejmfhtJH5mdMPn/AxGJS2R2fPt/sEelH9I+Enf84CxEn4TpsWG/bDg?=
 =?us-ascii?Q?SmEWhLCi0Fp3FT06ZZecax0ePUHVamlCEEraqWUx/0S/0BpoFa6mt16Jc7Vq?=
 =?us-ascii?Q?kdnU+e1UcPCIxjzE4rNpSC5coZfdMvb0PwrqRjx9WJyRGSbckuB5kbNWIp/P?=
 =?us-ascii?Q?B0sK7MFB3a3rlaiMPRbwOy1azAb6aXtSitWdAhskWbnM18L4FcU34zCvwyUS?=
 =?us-ascii?Q?ppg189uMPIxL/fmqyEmo2N2w18Ner/5ybermp+Y0ApSCw/PJa/+L4ecP1k9d?=
 =?us-ascii?Q?4ovPtY6QWdNWdRZ81rQ3qPKdQYZ445tjAWaOUp00+j/YyijBVcWCu6o199K1?=
 =?us-ascii?Q?SmuB70nlaGBXPgDWkHe47hua1rd0wiFZOYHe2ialXduQYpsCJP9MKA8NaTs9?=
 =?us-ascii?Q?K0LMFlKpczbdVpRpjt3yh+LEn73KRHvFZ6Eeb3/dx4w0BZ1NXSaTdQ4fYiGj?=
 =?us-ascii?Q?gkYkVuDcfqEQLg2Ebh+s+5pknzCav08V3FZYd4ua+OTk0aOiuTXfWw3bXq2r?=
 =?us-ascii?Q?KMuDeUrTfVGkfWMmxHcZg4bOlGDPhgrWKrSFnjM4Bi+MoAXoLVUtx+WPlYot?=
 =?us-ascii?Q?1zSjO9Gw1TEaPtKfqCq9stwWhBYNZwER1U29zbHijeHUhgC8tY/h6VtUepCv?=
 =?us-ascii?Q?GPgad6e0q46jBe+6SB8xfU68+QemhO48s8oc4xfzKAgRG2eVqVpPmxRS2CLL?=
 =?us-ascii?Q?SMCmRrjNLbB2StNKUbWrOFhx8TbxralK9WWIWj2Ly/MACv111OZ6ICHF+/b+?=
 =?us-ascii?Q?zjLoh2NBH/Lxwxg+9S3T3f0LDiRdRRMEbvb7oJxuCwkkyTdtAp7dYvGEr3vW?=
 =?us-ascii?Q?gqPWlvAQYmZFqzKG+iuTOWIonYa5tQVyalBdbx4kVIxZ1xoP5FFnelnJo8xr?=
 =?us-ascii?Q?qakTj/UR3Z0waQAi1UmlF7VieRGQurC6CGd/+peau4BpSZrsWmAMzwDwRLyc?=
 =?us-ascii?Q?YEzb+hidNcQNyllKotl4vV86rYsrEoAHS7GMp1SmIjZX+unXWtlvIy/wksZs?=
 =?us-ascii?Q?2cPSLgvUAr0gIc7V27WnUbZwLiUSRFVOltP5Rh2jHQsWgvsTkvxOYtOkR4YF?=
 =?us-ascii?Q?5OqIe+sJp21rcrOjHT20VMF7gAqrkGHp0P7Yk3C5DKGxNhtsoQkQXTGEUsNi?=
 =?us-ascii?Q?e9jU1/j/dbfpFoWATm+PA99uTZ6iJpxlQm+NuIQwKSeo30+c9kpveWYCbqKl?=
 =?us-ascii?Q?ID+kScdk/t19GGpO4mfLqwWGpmkaYBkSp54WCCVxqiLQJ4c2D5JRqqLbS9ua?=
 =?us-ascii?Q?xxDbantZD990BXrRKa+7WhRpcgZfdR5y+LmedEYf?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8633726c-c24d-4367-e571-08dc6b8e0761
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB3849.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 May 2024 16:28:13.4370 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JDVubbwRwoYnede2xQdRbu54jajV7CfSxlRr18PiDvnSJMgxcxhVFiKklONnVWnV
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB6782
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

On Fri, May 03, 2024 at 02:43:19PM +0000, Zeng, Oak wrote:
> > > 2.
> > > Then call hmm_range_fault a second time
> > > Setting the hmm_range start/end only to cover valid pfns
> > > With all valid pfns, set the REQ_FAULT flag
> > 
> > Why would you do this? The first already did the faults you needed and
> > returned all the easy pfns that don't require faulting.
> 
> But we have use case where we want to fault-in pages other than the
> page which contains the GPU fault address, e.g., user malloc'ed or
> mmap'ed 8MiB buffer, and no CPU touching of this buffer before GPU
> access it. Let's say GPU access caused a GPU page fault a 2MiB
> place. The first hmm-range-fault would only fault-in the page at
> 2MiB place, because in the first call we only set REQ_FAULT to the
> pfn at 2MiB place.

Honestly, that doesn't make alot of sense to me, but if you really
want that you should add some new flag and have hmm_range_fault do
this kind of speculative faulting. I think you will end up
significantly over faulting.

It also doesn't make sense to do faulting in hmm prefetch if you are
going to do migration to force the fault anyhow.


> > > Basically use hmm_range_fault to figure out the valid address range
> > > in the first round; then really fault (e.g., trigger cpu fault to
> > > allocate system pages) in the second call the hmm range fault.
> > 
> > You don't fault on prefetch. Prefetch is about mirroring already
> > populated pages, it should not be causing new faults.
> 
> Maybe there is different wording here. We have this scenario we call
> it prefetch, or whatever you call it:
>
> GPU page fault at an address A, we want to map an address range
> (e.g., 2MiB, or whatever size depending on setting) around address A
> to GPU page table. The range around A could have no backing pages
> when GPU page fault happens. We want to populate the 2MiB range. We
> can call it prefetch because most of pages in this range is not
> accessed by GPU yet, but we expect GPU to access it soon.

This isn't prefetch, that is prefaulting.
 
> You mentioned "already populated pages". Who populated those pages
> then? Is it a CPU access populated them? If CPU access those pages
> first, it is true pages can be already populated. 

Yes, I would think that is a pretty common case

> But it is also a valid use case where GPU access address before CPU
> so there is no "already populated pages" on GPU page fault. Please
> let us know what is the picture in your head. We seem picture it
> completely differently.

And sure, this could happen too, but I feel like it is an application
issue to be not prefaulting the buffers it knows the GPU is going to
touch.

Again, our experiments have shown that taking the fault path is so
slow that sane applications must explicitly prefault and prefetch as
much as possible to avoid the faults in the first place.

I'm not sure I full agree there is a real need to agressively optimize
the faulting path like you are describing when it shouldn't really be
used in a performant application :\

> 2) decide a migration window per migration granularity (e.g., 2MiB)
> settings, inside the CPU VMA. If CPU VMA is smaller than the
> migration granular, migration window is the whole CPU vma range;
> otherwise, partially of the VMA range is migrated.

Seems rather arbitary to me. You are quite likely to capture some
memory that is CPU memory and cause thrashing. As I said before in
common cases the heap will be large single VMAs, so this kind of
scheme is just going to fault a whole bunch of unrelated malloc
objects over to the GPU.

Not sure how it is really a good idea.

Adaptive locality of memory is still an unsolved problem in Linux,
sadly.

> > However, the migration stuff should really not be in the driver
> > either. That should be core DRM logic to manage that. It is so
> > convoluted and full of policy that all the drivers should be working
> > in the same way.
> 
> Completely agreed. Moving migration infrastructures to DRM is part
> of our plan. We want to first prove of concept with xekmd driver,
> then move helpers, infrastructures to DRM. Driver should be as easy
> as implementation a few callback functions for device specific page
> table programming and device migration, and calling some DRM common
> functions during gpu page fault.

You'd be better to start out this way so people can look at and
understand the core code on its own merits.

Jason
