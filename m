Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 30B308BCEF9
	for <lists+dri-devel@lfdr.de>; Mon,  6 May 2024 15:33:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 30F2610E478;
	Mon,  6 May 2024 13:33:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="UtK1BLeL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2043.outbound.protection.outlook.com [40.107.220.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7364510E053;
 Mon,  6 May 2024 13:33:36 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=P4uFIOBXM9gaep0R0PSxAZQqZDXXAkVUlgzAp929mrj1wxb/Yud/nya/POzS0Wy4jUkRQcqDjxabkeqoCmCzvDqqxcr0jmjzYOguaqwi5puymtDnWJ0Xc4UPLevpBriiFdP2/ZSRK4v6AQ8QN9DK1Z9FbVi3t3CNzmWbp6e3i/xVV6R0bqkcviDHStHKzDTc0L81Ysvg+h6Gweubn9sSpn6JhsZ/bzbCJj7nfdthQqhkyaCXiOUcbY0OMib3RE3PHwuuUSbKOwZe4A7MD329raeFz9FGlNlcg1ooLYOteQQSP6+AhbGYLZJqXaNPakQn6bR47W/DZ3oW+PT7Y+cecg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TJugSrh3YC1K1ErIhRjkMLt1WXHM+gXUV11sz7ngkBM=;
 b=QNlrrpKTKAHy/MympHfv7s7Cu91mUHXMTOZXDwsxMu6oEED17pq6/SfB7hN9SpaizRFlmU0ovmLcWbXzAPGtDWxtjABU5CEU5cISgXxP7ICztmSqWOewCqfil+pKE/apMKWoHSzcjEkj2sSn7S4SZ5sayh6pCQlCB7VW6c455KvZshaNWr3WUTsx1UHjz0tYvMgUgdj73T4361fxPo8fmdfADZQnxj4oIzIuZPq63NN3wdBmRNuuQ4KRFEmfpRcMNZM3imQwp6x6hZN8P5F1pzt73Uv7eFpQIw4yFU3h/Nt2Pqg7JNLGjwlqXrER7RMi+bGhI0MKRYP7AqOSFZZtHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TJugSrh3YC1K1ErIhRjkMLt1WXHM+gXUV11sz7ngkBM=;
 b=UtK1BLeLxeZTbBo56x3Y3HnkdXb3z1r8GlYiuB9vF3nlRhsCuK9gzJDKbuEw3NCNyrmT2R49C8JWkOt98tgzwYMIHp6Bs2KPi8Zs1Cb+lnTRKdSke25OYiIfuTYfLUNv79JCq4zLa2HYWZbFTrjqj1QgBM44eDpvnUWLY8Y9EIwgMq1fgJTHqgG0vJMoQ7E07YEv1EYh6ZnovXsc2JISN6VkGhTEHzCwOXO17L573UfieJ/jI+skQT9lyVN+iBZin3RARWDH0qBw+qItEd0VG6jkh7pOzffWlge5m9SRLFlsaQH4ghhQdfCPc7Qw5mYaSeCFxrGwpslvCxFFvMVAIw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM6PR12MB3849.namprd12.prod.outlook.com (2603:10b6:5:1c7::26)
 by CH3PR12MB9343.namprd12.prod.outlook.com (2603:10b6:610:1c0::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.41; Mon, 6 May
 2024 13:33:24 +0000
Received: from DM6PR12MB3849.namprd12.prod.outlook.com
 ([fe80::c296:774b:a5fc:965e]) by DM6PR12MB3849.namprd12.prod.outlook.com
 ([fe80::c296:774b:a5fc:965e%3]) with mapi id 15.20.7544.041; Mon, 6 May 2024
 13:33:24 +0000
Date: Mon, 6 May 2024 10:33:23 -0300
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
Message-ID: <20240506133323.GI3341011@nvidia.com>
References: <20240501000915.GY941030@nvidia.com>
 <ZjNJASw0JdXS6dTa@phenom.ffwll.local>
 <93fca752517f0120baa770992fd0f9160b0c14d1.camel@linux.intel.com>
 <20240502124632.GB3341011@nvidia.com>
 <0b700baf6fc3d41b4adf6301b1b4dbc4ff7078fa.camel@linux.intel.com>
 <SA1PR11MB6991945628597BCD9D111ECD92182@SA1PR11MB6991.namprd11.prod.outlook.com>
 <20240503133732.GD3341011@nvidia.com>
 <SA1PR11MB699156AB3B2603DF1762BEA7921F2@SA1PR11MB6991.namprd11.prod.outlook.com>
 <20240503162812.GF3341011@nvidia.com>
 <SA1PR11MB69911B3E675B1072A17A3E49921F2@SA1PR11MB6991.namprd11.prod.outlook.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <SA1PR11MB69911B3E675B1072A17A3E49921F2@SA1PR11MB6991.namprd11.prod.outlook.com>
X-ClientProxiedBy: SA0PR12CA0019.namprd12.prod.outlook.com
 (2603:10b6:806:6f::24) To DM6PR12MB3849.namprd12.prod.outlook.com
 (2603:10b6:5:1c7::26)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR12MB3849:EE_|CH3PR12MB9343:EE_
X-MS-Office365-Filtering-Correlation-Id: 4b92c285-7655-47c7-6a56-08dc6dd11ac5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|366007|7416005|376005|1800799015;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?2j7EgwkhVWRQyzH2fFPkG26hoFYcdec8FsFxVJDvfrkhpIWiVVQLNGODtEYz?=
 =?us-ascii?Q?7K57N4c8jtGiGWFhvkcbCeU3dm28jA7wawDJnjWyIpRL9+iCqXtCMOAugZh+?=
 =?us-ascii?Q?ggFJuA6PBlXPvvhBuvFF3sjRcRNGZzki+lET6RHBw4ijLlxC0aW6dn4CcjSq?=
 =?us-ascii?Q?skZ93PWKzgx31AgGuKaiL4Bvbejk5WsjXGmoDha3ggE5O+lCexsDxRppXMfu?=
 =?us-ascii?Q?URzfsTp+XjdhkyvJanCz/84+IPvDrOvya30NwLso448irwrHK0g6ikUTIyhg?=
 =?us-ascii?Q?956mLgve/yC4Bgau6PMeVewmbcmk5/XmbwhwMmedYiJA4lMp/FK6+M+hpIix?=
 =?us-ascii?Q?fwZZbgsCk5gEGWOv1TO4QB0CK9jVVH6LPMSlIepyYlJqOi32ZZmU+ROVyZBf?=
 =?us-ascii?Q?ChqtW68EvpaNaId4ZiPobDzKybjUjC473UP+oKSgWW2a+gvDKNaG8tOyttof?=
 =?us-ascii?Q?sNDLOY72Ah/Wgus5l1JTYN+Asr/gDLIKec3jmmtM0zOtqxu8MK8siwGJw5T7?=
 =?us-ascii?Q?02WntEUOHHu4zP2YJ4n7U2WfyB1dbd0rUsnDYDCJsJzlHvvvMP3YJVyCVWcm?=
 =?us-ascii?Q?rjh3fLvdnv4S/H0XLUw3sFLucdJNO5dxaLBu2ZGGIJ94EGDiHmHcvxLmhHBO?=
 =?us-ascii?Q?16enFIzmnUdp5Xs/qoqJ/7bCGHtM413he4rWnSt+W5tni6vvZ3rUYvPA8YZe?=
 =?us-ascii?Q?O6Dienbql7TGWjbb9keIGBiP3atJ1EeKSN0pLT7xLrQoQfdsE4LTHWEGw7o8?=
 =?us-ascii?Q?f1YCx+QdZtZlG5l2+QseehSkWUWGigiPeRqjpadtUQ+pEQmIKVNDy3NpfCUC?=
 =?us-ascii?Q?EIAjc7ddSVToggsc+5Zn27hhZSHwOdmCv4FqVqroifI/TwLWunwAyFFyX1XG?=
 =?us-ascii?Q?VGsODza8+zfg69BeVx1BjTNKKel9uyaSZgbw/mIKzGko7E/whQaVhHQjKGus?=
 =?us-ascii?Q?PyN6J3s9/P+ld5Gz8+zFelJcyZ+no33jiHEfCP1QZawBRS81Cq7EIsCqus8A?=
 =?us-ascii?Q?m1cmN56Xs7UIUynbj4VWkrO4TeDV3hVzFPIBjEBERNXc6d6R/31VCQLeiY6E?=
 =?us-ascii?Q?gHyzwy8ibK+sPoJC+himGSRrwzLt7VKQsvjSqDaVPqFy2O4vWVG0xoCOkqxX?=
 =?us-ascii?Q?9S7/Yr0UcUoD/o1AEcb7RaB3JD0Ycr7k0GOUKlQn4zwxb1Vm2k2lvFf2hUYS?=
 =?us-ascii?Q?ocWtgdBazeyXOc3CFaoRkuGFgw3HVo+jFol0vpRYm265RvrttEwkD69agRqu?=
 =?us-ascii?Q?C45zSs8y/wRkCX8y8CaW0G9MJN8uNkILjn2HiUFjCQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB3849.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(7416005)(376005)(1800799015); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?5q1v715RlxyC1Ye73EagHNTqWvSBYY/kKFyJXrmsPnfilwxw5S0xOxew4iG6?=
 =?us-ascii?Q?ui6a2tD4jj04PHoG30+G8II7u0PTLhg924L6iivlynL3GeF3f5RfgrAX5ld/?=
 =?us-ascii?Q?IJGw7cXXZ2lv1yLEL6ty4yJxf9YjRGv3OKby84zJe2xsWx82iyjcJJp1gJMS?=
 =?us-ascii?Q?BWtrj/4MUY7CbRfNBxCdmxtRvIVgqhzP5fHSg8icjMEZRXk454xqE+0qmL0Z?=
 =?us-ascii?Q?UkbHbGNId9ih9serazR1N/SPj+IRuekRzU3tY2Vb+Jh2VwqoHy754/1nuqOr?=
 =?us-ascii?Q?F2XRbjNx2L4wuRVuPhl/kvFmJiyifE+39ylmfbWGAkSouN35sDh6r1ghIpNa?=
 =?us-ascii?Q?GXOCi7xdOAnKyk3TASs19Nko2k2OIHV8EpN+ny7caMkafnkk2asb9Kc0zW+L?=
 =?us-ascii?Q?KB87fwc47R8SzaDvezyTFq2Hm0QGmyFbeN/eiurXAR0ydeh9VorK8iCE9Evr?=
 =?us-ascii?Q?bVdKeYSIabwtv0J2GHOSAhqCXkRyfVzC0SUQgQuqNi4lvytgxQHPbIyVLgH4?=
 =?us-ascii?Q?r49bAe+b7rKl6ECDCG4FVE99wc0NJdPIRzx5YWDHMzakBzEoNI9W1ASNnP36?=
 =?us-ascii?Q?VIbe6vi7Z2UaCSj3T85pWtKibxH62W0Ybv7O1pOBlDXv8zVFHawkdlJezxaT?=
 =?us-ascii?Q?mkjAQdkHyfEgscG+2dwHQ3rqHWSF5do2amNZR/wQrmuNC8i+0r+4GceaYjjm?=
 =?us-ascii?Q?9iavKm+ZHZIjlmvmKYr8EMNSB+pVrQObUcgTfhwnJoEcDKHBAk51lveGp9sr?=
 =?us-ascii?Q?gLb6kiJ/3TWq03+I3ykTAPIzcMT5V605ntl0a/QSs1so5aDCvm61++3TIIXU?=
 =?us-ascii?Q?HfypRQOx5gFqB6lEm+JGWi2J7VUs6O8skLBVgyArHvrHnpPskAk6kvNDIVnO?=
 =?us-ascii?Q?qHDmy+n9HzUglkEIAO7mkEJee6oOPIHA7MDhPYztfXLOIEnldVFgjs0h7h+8?=
 =?us-ascii?Q?pamQqMyBVAEl4A2I41K5wMbV2C2GuQqityfKVUBqk78nJzcZYxPMt51yDqq1?=
 =?us-ascii?Q?UWpXCYIinEf26nTXTcLNK/W2JRQwRpN1Oe8vAd/svHP+EdrLYonRdPjYZ8YS?=
 =?us-ascii?Q?O9/ICDfs9LhnoLOSlQyOJpmcrFH6KBUfZdEmdTaPWuB51bLmKqndjmMBBgyv?=
 =?us-ascii?Q?4Zx6Seyu1p08C7MaWQ/soS5twC15YTulXmnVJmf3mJkxhC/6zdn86cCiwM/j?=
 =?us-ascii?Q?Yr5+vjdodPDGy+HS/AfP5zp+KnRmi7VgCBHZKk2domvtH8j3Nz79y8bQ+MwT?=
 =?us-ascii?Q?7fXW6btmcQnlYYD0vxdRzokcy6a0RkwmaZvbgH5Et3peJRpLkunjmh6W4muj?=
 =?us-ascii?Q?+ZatGQ1kwNvx19OwRP5eAYUh5UYnNUjvS1Nq6gyhmB6vka4PHe8W9+KNfz5K?=
 =?us-ascii?Q?WCGHo0eUC1tmfSdSH+nFvCMUZfMdQaiEbc81UNof02yEjsxCiVO0wddMfVNF?=
 =?us-ascii?Q?42/ViHuhJtvarkjEWGbdjwhN/NvrDUyncRIGhD966Q29LOFflZ+9qUF6avcX?=
 =?us-ascii?Q?IwPOckBxADEiyHdd4zO8gWadWfV8yH9ONIbcPs4NSmNM9pGWgGojHQc1zHfh?=
 =?us-ascii?Q?/xDK4RwerH3TlYEV5uUJf+wCiophUWjLBbbQnQPl?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4b92c285-7655-47c7-6a56-08dc6dd11ac5
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB3849.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 May 2024 13:33:24.7534 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2s9fNCSxAUQ7lEYHfh5GiQEOiJT8vemZqZHp4ZlZr+on0i1gHeORKbfKJ7Qj3QRR
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB9343
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

On Fri, May 03, 2024 at 08:29:39PM +0000, Zeng, Oak wrote:

> > > But we have use case where we want to fault-in pages other than the
> > > page which contains the GPU fault address, e.g., user malloc'ed or
> > > mmap'ed 8MiB buffer, and no CPU touching of this buffer before GPU
> > > access it. Let's say GPU access caused a GPU page fault a 2MiB
> > > place. The first hmm-range-fault would only fault-in the page at
> > > 2MiB place, because in the first call we only set REQ_FAULT to the
> > > pfn at 2MiB place.
> > 
> > Honestly, that doesn't make alot of sense to me, but if you really
> > want that you should add some new flag and have hmm_range_fault do
> > this kind of speculative faulting. I think you will end up
> > significantly over faulting.
> 
> Above 2 steps hmm-range-fault approach is just my guess of what you
> were suggesting. Since you don't like the CPU vma look up, so we
> come out this 2 steps hmm-range-fault thing. The first step has the
> same functionality of a CPU vma lookup.

If you want to retain the GPU fault flag as a signal for changing
locality then you have to correct the locality and resolve all faults
before calling hmm_range_fault(). hmm_range_fault() will never do
faulting. It will always just read in the already resolved pages.

> > It also doesn't make sense to do faulting in hmm prefetch if you are
> > going to do migration to force the fault anyhow.
> 
> What do you mean by hmm prefetch?

I mean the pages that are not part of the critical fault
resultion. The pages you are preloading into the GPU page table
without an immediate need.
 
> As explained, we call hmm-range-fault in two scenarios:
> 
> 1) call hmm-range-fault to get the current status of cpu page table
> without causing CPU fault. When address range is already accessed by
> CPU before GPU, or when we migrate for such range, we run into this
> scenario

This is because you are trying to keep locality management outside of
the code code - it is creating this problem. As I said below locality
management should be core code, not in drivers. It may be hmm core
code, not drm, but regardless.
 
> We do have another prefetch API which can be called from user space
> to prefetch before GPU job submission.

This API seems like it would break the use of faulting as a mechanism
to manage locality...

> > I'm not sure I full agree there is a real need to agressively optimize
> > the faulting path like you are describing when it shouldn't really be
> > used in a performant application :\
> 
> As a driver, we need to support all possible scenarios. 

Functionally support is different from micro optimizing it.

> > > 2) decide a migration window per migration granularity (e.g., 2MiB)
> > > settings, inside the CPU VMA. If CPU VMA is smaller than the
> > > migration granular, migration window is the whole CPU vma range;
> > > otherwise, partially of the VMA range is migrated.
> > 
> > Seems rather arbitary to me. You are quite likely to capture some
> > memory that is CPU memory and cause thrashing. As I said before in
> > common cases the heap will be large single VMAs, so this kind of
> > scheme is just going to fault a whole bunch of unrelated malloc
> > objects over to the GPU.
> 
> I want to listen more here.
> 
> Here is my understanding. Malloc of small size such as less than one
> page, or a few pages, memory is allocated from heap.
> 
> When malloc is much more than one pages, the GlibC's behavior is
> mmap it directly from OS, vs from heap

Yes "much more", there is some cross over where very large allocations
may get there own arena.
 
> In glibC the threshold is defined by MMAP_THRESHOLD. The default
> value is 128K:
> https://www.gnu.org/software/libc/manual/html_node/Memory-Allocation-Tunables.html

Sure
 
> So on the heap, it is some small VMAs each contains a few pages,
> normally one page per VMA. In the worst case, VMA on pages shouldn't
> be bigger than MMAP_THRESHOLD.

Huh? That isn't quite how it works. The glibc arenas for < 128K
allocation can be quite big, they often will come from the brk heap
which is a single large VMA. The above only says that allocations over
128K will get their own VMAs. It doesn't say small allocations get
small VMAs.

Of course there are many allocator libraries with different schemes
and tunables.

> In a reasonable GPU application, people use GPU for compute which
> usually involves large amount of data which can be many MiB,
> sometimes it can even be many GiB of data

Then the application can also prefault the whole thing.

> Now going back our scheme. I picture in most application, the CPU
> vma search end up big vma, MiB, GiB etc

I'm not sure. Some may, but not all, and not all memory touched by the
GPU will necessarily come from the giant allocation even in the apps
that do work that way.

> If we end up with a vma that is only a few pages, we fault in the
> whole vma. It is true that for this case we fault in unrelated
> malloc objects. Maybe we can fine tune here to only fault in one
> page (which is minimum fault size) for such case. Admittedly one
> page can also have bunch of unrelated objects. But overall we think
> this should not be common case.

This is the obvious solution, without some kind of special knowledge
the kernel possibly shouldn't attempt the optimize by speculating how
to resolve the fault - or minimally the speculation needs to be a
tunable (ugh)

Broadly, I think using fault indication to indicate locality of pages
that haven't been faulted is pretty bad. Locality indications need to
come from some way that reliably indicates if the device is touching
the pages at all.

Arguably this can never be performant, so I'd argue you should focus
on making things simply work (ie single fault, no prefault, basic
prefetch) and do not expect to achieve a high quality dynamic
locality. Application must specify, application must prefault &
prefetch.

Jason
