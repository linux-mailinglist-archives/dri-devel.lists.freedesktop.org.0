Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 04B648B1849
	for <lists+dri-devel@lfdr.de>; Thu, 25 Apr 2024 03:05:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8744B113F3B;
	Thu, 25 Apr 2024 01:05:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="cqmcYS2C";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam04on2069.outbound.protection.outlook.com [40.107.102.69])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A3DBC113F36;
 Thu, 25 Apr 2024 01:05:27 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kFalHlL+qoZ17OroWYrRlYp3iIczti7g+1jDZAvDGZ1UOf4hpjhCE+/0qiCpMMo1ZZtLY/hCIwTDm3GPPLvSU6h6cLhz1jQsZ7Kisuk+DSXZ6OovMWOgjRQUeUWGmrZHq/B22jluxnlc7LWCuBnA7egJW/5bUwykqF4HgLHGRXHj0UUpIawn89wl+mHWE2bX3r3g6LLEy9h+4nVP5oEpzACGk1xuPIsc2fOnAXHBBM6XxPO7qhty62WWHrBmd25PClgs1vS1q/NkPzSsvrk+DPGVy33/dTvjYKOjJlvEVHipd/qX+OCXGjKWdctXD9yFn5LJHsrNugx2Wi5a51V8qA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=adOAg+3pNJSAGNsD5k54+aZwBYdBySMCc3Qb9vRMJd4=;
 b=SszSgZpWkHqw6jwFraDkrNNdRYokR/JmPpKKownpV5yJfaGheeKkWkHWoAQ6m6p6Xz2h9m9BQzY8UNNL5Ed4Hg4jYpM+hYLsH7fPjEN3egfN3J/dODb6LpzYsEe1uQU0DSqeLNjPpW0tcdQXVKAcCRHgDO5aU2tGpOpVuqMcWpxNxq6UT6ouGHeUzO1iyZIDh7Vl/9425GNoYM2cPdlQ1iusvK0yiUxZfjDxd36uC4jrx+7ntbU2C/bqycLKxYG2ZjOTvlxizG6yeCce9fAtCegQcFs8LLDCpuPGqH4YrqBUmL1C88UPTXj7axz82WNhAtK/qHiZyNpf8WI2IMjgug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=adOAg+3pNJSAGNsD5k54+aZwBYdBySMCc3Qb9vRMJd4=;
 b=cqmcYS2Cw/LEgnaFU2XTrfNOzOfiGFSYKkfMdawBWdlN6qG5O6Gn5r7SKtwc3rQmvi1xd2vWyQ/JkgH/halgHqf63xKMmKhjQ9PpC8O0FkYadaUgxqdaUr7r42jkNEfW9zY1iaY3MIUroQ5h5TnaJGNNi5muqpCvyYujTKzqDk6TgYbialWYep/eQBUY4X4P+LtzzJIl9qkTSW+f6iKTn9iIu0pYvk3v15Er8YJQ1ilbIZu3moqjtsQdDHZ2HAdDleAyiW6KPgDH8x16hN3p+vKkyZ6TKiqs5JkznJNhl4XwIHVUWUR3lijuXrQ+SH4ybSm3G0d5K6bdFiUSk+Wxxg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM6PR12MB3849.namprd12.prod.outlook.com (2603:10b6:5:1c7::26)
 by LV8PR12MB9405.namprd12.prod.outlook.com (2603:10b6:408:1fa::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7519.24; Thu, 25 Apr
 2024 01:05:22 +0000
Received: from DM6PR12MB3849.namprd12.prod.outlook.com
 ([fe80::c296:774b:a5fc:965e]) by DM6PR12MB3849.namprd12.prod.outlook.com
 ([fe80::c296:774b:a5fc:965e%3]) with mapi id 15.20.7519.021; Thu, 25 Apr 2024
 01:05:22 +0000
Date: Wed, 24 Apr 2024 22:05:20 -0300
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
Message-ID: <20240425010520.GW941030@nvidia.com>
References: <20240405003927.GA11940@nvidia.com>
 <SA1PR11MB6991E4CDCD61A5D1909BB4EF92032@SA1PR11MB6991.namprd11.prod.outlook.com>
 <20240405123725.GD5383@nvidia.com>
 <SA1PR11MB699170C0F6FFFA231985718092032@SA1PR11MB6991.namprd11.prod.outlook.com>
 <20240405180212.GG5383@nvidia.com>
 <SA1PR11MB6991A4BD0EDDDF051A9A2C5C92072@SA1PR11MB6991.namprd11.prod.outlook.com>
 <20240409172418.GA5383@nvidia.com>
 <SA1PR11MB6991EDB4351D99B4E76EBC2992112@SA1PR11MB6991.namprd11.prod.outlook.com>
 <20240424134840.GJ941030@nvidia.com>
 <SA1PR11MB699102978E72F21E6C803D6392102@SA1PR11MB6991.namprd11.prod.outlook.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <SA1PR11MB699102978E72F21E6C803D6392102@SA1PR11MB6991.namprd11.prod.outlook.com>
X-ClientProxiedBy: SN6PR05CA0026.namprd05.prod.outlook.com
 (2603:10b6:805:de::39) To DM6PR12MB3849.namprd12.prod.outlook.com
 (2603:10b6:5:1c7::26)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR12MB3849:EE_|LV8PR12MB9405:EE_
X-MS-Office365-Filtering-Correlation-Id: 2248ef76-7ed0-47ff-04e5-08dc64c3c838
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|366007|7416005|376005|1800799015;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?CSVm7NPE9mEikNh1gdbckCmWN31zzT3OZ+rGvo7+bIT8qg5Pv94ErywDgmMW?=
 =?us-ascii?Q?3ZPNcS7tgtTtsOkT6jwDQRT32IN1S5Nj+WhgxiB9dtKzfkr5vBRPZB7LfPJY?=
 =?us-ascii?Q?7v03sZqSL0KdcAM0xm1vtx1Is0yxZIm9NL1Fu2LYh9QR+19rd15k/t7xfETs?=
 =?us-ascii?Q?43IR338YwDrPUvnWwbpsIGJGkbp5qHNvXChOKKqO1gwXY0Ne1/hiXBESgJTm?=
 =?us-ascii?Q?mZRpvJWWtZbWLRikM7FV+boF/2bhWOwpED2RRndArLsYqgiLuzXloUGVpyH5?=
 =?us-ascii?Q?ijh65ypCMcSPjm6ZgPUwNgECxWwdvfsb9ppkQvrivvo59eU3EEyw7gROvW/x?=
 =?us-ascii?Q?duVYESdPu2BFrK+EcP1VxCDF8MIQWCxF0+1xkk/VGCYfJDeCi7Qiw1moZ4mr?=
 =?us-ascii?Q?BS0TldVbqj3mb/69sm98ajl4e042cwwLWdFYlw0gOgEwZpJ8VlUrXIj8yzd9?=
 =?us-ascii?Q?HtWTw8sCRmnFEfRCni4blSLjGy6tOb0N6MAuf4TGlNcoxLZborYsmVtvi5kf?=
 =?us-ascii?Q?W5kF4eoAhdkRlFDfxBN65xl1li32kRm6c91IRunHmObJZvSGjCkJD5QDoqAT?=
 =?us-ascii?Q?8tv3PqpGrxCxB2xVpnHboTdeJEgdpbG1rRjJLXzfrEyJB9DhanjN9EX09hPf?=
 =?us-ascii?Q?5+1z3PPsMuxZNd4nYMnTsm8txEIgd5XFNmcYBWFEHNDOeSFIN/ntHg1Gw/i1?=
 =?us-ascii?Q?9YeqBHcHYXUxNQ0/rw1H6/64bnH/ASmmEOyyRicn+0t3wnbwCG1HHVYEOYvc?=
 =?us-ascii?Q?RwlFZfMLjyTUOrCaECixEVFSSvjZMM/v/4by9u18DIykUITWUCUWFgT6G3eL?=
 =?us-ascii?Q?MifiHgyqx7EoNVy0f8h5Zbw2fgn/bxpozjixSgHmPdELu+YYYWMrpMKzIg7W?=
 =?us-ascii?Q?542rnDJ5dIsVvUzqppi7upJCulJNmyBxdznOKAA5KcRZcDZkC2DNH32ce2bg?=
 =?us-ascii?Q?WBmdgbMtu5yTT248vOj2L02D8bbYASi2zhbUmhNcLI0NeEvMi5CBTl5mpj7f?=
 =?us-ascii?Q?K0BvjQYc6nNPdizi+vIsKz/IkbSlXznMCb2+CQPer4OCmBJ2+hXr7jGVnUuf?=
 =?us-ascii?Q?CCb60G1y5iHDDvUYZFBR5qZVdQoFwnv5CvsS1PQGpPbRvrBZ6Y2JP6tNjfOl?=
 =?us-ascii?Q?un6MsNwfQWr9Nojl9vNueiafGrH0VPzpC8d5+Kp9Bpz2QSh+aLM+J+xE19mY?=
 =?us-ascii?Q?twvydRLCpG+QEHOkVh4pyIAjTh3YXyQ7pcA0hd7Gid/KqlcmW7LVgN/F2PTd?=
 =?us-ascii?Q?IsU6j9LwmwpemLRFWKgtBmLcvshaZR03kaXOVXUkDg=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB3849.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(7416005)(376005)(1800799015); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?BFasBPKXzR1hMTnvbPvvul4tuLwMAsJ2Ez7ifPAWs5JHmosfxKbKvtqxJNuD?=
 =?us-ascii?Q?F7B0uV8nNvKVzIkgINL8mS9nkF9IPUrytfbYSh1zD1fifhCUpB82KsdcvPZ3?=
 =?us-ascii?Q?lp8AYtHSqw3/y9y1jrb1aPmc/LykQnTCx/3gW5T2b56nSCdfwRig1id8HkOH?=
 =?us-ascii?Q?r67sJN/2ar88b4josEx0v6knkHFlb3Ccu2Hw45AwRkZHJnOi4McZasb9gMsi?=
 =?us-ascii?Q?xByc7UMX+BAivU4ON1qA9LNF2BMOmJe6SDr3v3Si3WepAUUIWQ/zOOm2/wDn?=
 =?us-ascii?Q?C9zpyAUT6ys8wdM8g4GoArlDl0S75zRcZVRwb2d6BfWq9nKpGBoENgHT+I42?=
 =?us-ascii?Q?TV8+PggE3+y1bt1/g/xsxHVbyXUgqtYnZFD+HzhVP2tSc5Ehh92p0uRbw6hg?=
 =?us-ascii?Q?GLuR2lNG5TCv5s+N9re2o77Y1e6SN13VuAzKly9i4nEdS3aJ7YjHqlL8/OKP?=
 =?us-ascii?Q?qfAVxyGGE/IXWhUc2oadyj9aUFtdYZjSFTtofPy4RqyATwCsfbobldXdli5h?=
 =?us-ascii?Q?ZttozsE8Vx91lCb+Dw6gz1gNqe8MYor44XohfzqAxcKZ47bu4reiT0tyIQcm?=
 =?us-ascii?Q?INF4jdqNDihyEcYxO1cZmp0pAjGhgPRfVyHsn4O68ZXTekUUtIP6x93U6d7N?=
 =?us-ascii?Q?nrstvOdCh99bd5Y1Zdjmh7dGO3/CwWWnOAqMeo9FnIEmGt4+gclIc2hCIHi5?=
 =?us-ascii?Q?2gU+5hQD6ZRn5XfByRnHaBClNw4DmHQbwXsPNUHlpOPsuvv5pjRhbEwdd5E7?=
 =?us-ascii?Q?SV4SNMKmV103QJLZIZWCsHY22uoOew+mMtG5/zLqbhcTYSj51nK+ZFWHnurn?=
 =?us-ascii?Q?D1k+4DroxyrjtaG70QCksYU70ZjiBIYwtcoKLquDZwtoGz0RSHhvuiyvEEAB?=
 =?us-ascii?Q?3UONrrF/50pEQqNazai3zFUM+R7Zh5gEdWTG/z/5X0QWryuyQ14SNK3717Dg?=
 =?us-ascii?Q?bAmy30w/HMp/87KFzod0mPr0fnHy/qzHBcmrf3XeGLPBk5MEAO3wWpJ2kiQI?=
 =?us-ascii?Q?Oo1csm5IpxvVpQGQUjRu8NCUSTbSXGL96EodMI5tM0RYiTZ5hM4s1bzB23J0?=
 =?us-ascii?Q?iOCCUYb72rNIZvFPsKULzVMEFOYkw/FclYAkk8e/GSkDmwbr7qQD94ZFzYy6?=
 =?us-ascii?Q?m8b94YwAY/pdDA+AIeHIlRZhfrQwHtPe3/07jz4/PxIcLVczXml3I2/5jHmf?=
 =?us-ascii?Q?tJsx+PiWBAh3XvVpBDekyN19fClcA7Vf09Xp2UPbFetKjSERfB+Mup5IyKVX?=
 =?us-ascii?Q?KvmsgHKd+DPqrZ1IvjEfLm5zAcDLdRTEfyaj+sOcA89r92NISVQog0+eBFbF?=
 =?us-ascii?Q?TRimikDIb9zqUsEv2zf99LpxVK4jr4xW+Du468GdjGIr1/Zzvg8vat3Mzc7o?=
 =?us-ascii?Q?Sv48daU9ko4syvQvSBEom9MrvoXpbiCcNibpg7tfqyaf9ZpjTkVKAns++xye?=
 =?us-ascii?Q?XM8300003/ATT5Uez/Bp5gOQD+4bg+ZFTvYqTvPD/qGk6Edn0xo63gBPW35s?=
 =?us-ascii?Q?YCpTLRqXZ/06jug9Vaia+X/ros3gj5QjFT7tTSA8Ginj0eGvJDFCZABMHqOg?=
 =?us-ascii?Q?5tM6EeI2Q9eoWgV8p/I=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2248ef76-7ed0-47ff-04e5-08dc64c3c838
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB3849.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Apr 2024 01:05:22.2747 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QoIaEEBRXGvvj+DjDYQVIfatM95IeIXmC329AdxyWBzhwSYfIQivTOxvFcRcLFdG
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR12MB9405
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

On Wed, Apr 24, 2024 at 11:59:18PM +0000, Zeng, Oak wrote:
> Hi Jason,
> 
> I went through the conversation b/t you and Matt. I think we are pretty much aligned. Here is what I get from this threads:
> 
> 1) hmm range fault size, gpu page table map size : you prefer bigger
> gpu vma size and vma can be sparsely mapped to gpu. Our vma size is
> configurable through a user madvise api. 

That is even worse! It is not a user tunable in any way shape or form!

> 2) invalidation: you prefer giant notifier. We can consider this if
> it turns out our implementation is not performant. Currently we
> don't know.

It is the wrong way to use the API to have many small notifiers,
please don't use it wrong.
 
> 3) whether driver can look up cpu vma. I think we need this for data migration purpose.

The migration code may but not the SVA/hmm_range_fault code. 

> > > What do you mean by "page by page"/" no API surface available to
> > > safely try to construct covering ranges"? As I understand it,
> > > hmm_range_fault take a virtual address range (defined in hmm_range
> > > struct), and walk cpu page table in this range. It is a range based
> > > API.
> > 
> > Yes, but invalidation is not linked to range_fault so you can get
> > invalidations of single pages. You are binding range_fault to
> > dma_map_sg but then you can't handle invalidation at all sanely.
> 
> Ok, I understand your point now.
> 
> Yes strictly speaking we can get invalidation of a single page. This
> can be triggered by core mm numa balance or ksm (kernel samepage
> merging). At present, my understanding is, single page (or a few
> pages) invalidation is not a very common case. The more common cases
> are invalidation triggered by user munmap, or invalidation triggered
> by hmm migration itself (triggered in migrate_vma_setup). I will
> experiment this.

Regardless it must be handled and unmapping an entire 'gpu vma' is a
horrible implementation of HMM.

> I agree in case of single page invalidation, the current codes is
> not performant because we invalidate the whole vma. What I can do
> is, look at the mmu_notifier_range parameter of the invalidation
> callback, and only invalidate the range. The requires our driver to
> split the vma state and page table state. It is a big change. We
> plan to do it in stage 2

Which is, again, continuing to explain why why this VMA based approach
is a completely wrong way to use hmm.

> > I understand, but SVA/hmm_range_fault/invalidation are *NOT* VMA based
> > and you do need to ensure the page table manipulation has an API that
> > is usable. "populate an entire VMA" / "invalidate an entire VMA" is
> > not a sufficient primitive.
> 
> I understand invalidate entire VMA might be not performant. I will
> improve as explained above.

Please stop saying performant. There are correct ways to use hmm and
bad ways. What you are doing is a bad way. Even if the performance is
only a little different it is still the kind of horrible code
structure I don't want to see in new hmm users.

> I think whether we want to populate entire VMA or only one page is
> still driver's selection. 

hmm_range_fault() should be driven with a prefetch fault/around
scheme. This has nothing to do with a durable VMA record and addresses
these concerns.

> Do you suggest per page based population? Or do you suggest to
> populate the entire address space or the entire memory region? I did
> look at RDMA odp codes. In function ib_umem_odp_map_dma_and_lock, it
> is also a range based population. It seems it populate the whole
> memory region each time, not very sure.

Performance here is veyr complicated. You often want to allow the
userspace to prefetch data into the GPU page table to warm it up to
avoid page faults, as faults are generally super slow and hard to
manage performantly. ODP has many options to control this in a fine
granularity.

> > You can create VMAs, but they can't be fully populated and they should
> > be alot bigger than 2M. ODP uses a similar 2 level scheme for it's
> > SVA, the "vma" granual is 512M.
> 
> Oh, I see. So you are suggesting a much bigger granularity. That
> make sense to me. Our design actually support a much bigger
> granularity. The migration/population granularity is configurable in
> our design. It is a memory advise API and one of the advise is
> called "MIGRATION_GRANULARITY".

I don't think the notifier granual should be user tunable, you are
actually doing something different - it sounds like it mostly acts as
prefetch tunable.

> > The key thing is the VMA is just a container for the notifier and
> > other data structures, it doesn't insist the range be fully populated
> > and it must support page-by-page unmap/remap/invalidateion.
> 
> Agree and I don't see a hard conflict of our implementation to this
> concept. So the linux core mm vma (struct vm_area_struct) represent
> an address range in the process's address space. Xe driver would
> create some xe_vma to cover a sub-region of a core mm vma. 

No again and again NO. hmm_range_fault users are not, and must not be
linked to CPU VMAs ever.

> > mapping is driven by the range passed to hmm_range_fault() during
> > fault handling, which is entirely based on your drivers prefetch
> > logic.
> 
> In our driver, mapping can be triggered by either prefetch or fault. 
> 
> Prefetch is a user API so user can decide the range.

> The range used in fault is decided by MIGRATION_GRANULARITY user
> setting. The default value is 2MiB as said.

Which is basically turning it into a fault prefetch tunable.
 
> In our implementation, our page table is not organized as a radix
> tree. 

Huh? What does the HW in the GPU do to figure out how issue DMAs? Your
GPU HW doesn't have a radix tree walker you are configuring?

> Maybe this an area we can improve. For validation, we don't
> need to walk page table to figure out which range is present in page
> table. Since we only register a mmu notifier when a range is
> actually mapped to gpu page table. So all the notifier callback is
> with a valid range in gpu page table.

But this is not page by page.

> I agree many 2M small notifiers can slow down the red/black tree
> walk from core mm side. But with giant notifier, core mm callback
> driver much more times than small notifier - driver would be called
> back even if a range is not mapped to gpu page table.

The driver should do a cheaper check than a red/black check if it
needs to do any work, eg with a typical radix page table, or some kind
of fast sparse bitmap. At a 2M granual and 100GB workloads these days
this is an obviously loosing idea.

> > I want to be very clear, there should be no interaction of your
> > hmm_range_fault based code with MM centric VMAs. You MUST NOT look
> > up
> > the CPU vma_area_struct in your driver.
> 
> Without look up cpu vma, we even can't decide whether our gpu
> accessed an valid address or not.

hmm_range_fault provides this for you.
 
> Further more, we call hmm helpers migrate_vma_setup for migration
> which take a struct migrate_vma parameter. Migrate_vma has a vma
> field. If we don't look up cpu vma, how do we get this field?

Migration is a different topic. The vma lookup for a migration has
nothing to do with hmm_range_fault and SVA.

(and perhaps arguably this is structured wrong as you probably want
hmm_range_fault to do the migrations for you as it walks the range to
avoid double walks and things)

Jason
