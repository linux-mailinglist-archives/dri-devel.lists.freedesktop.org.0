Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EDFB0B19A03
	for <lists+dri-devel@lfdr.de>; Mon,  4 Aug 2025 03:51:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B68610E052;
	Mon,  4 Aug 2025 01:51:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="GBmFQazK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2064.outbound.protection.outlook.com [40.107.237.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E6EF10E052;
 Mon,  4 Aug 2025 01:51:50 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Gi5D36e9bc/sSemWsgtaMm8llIwp9LxsNcVP/i5uYJryiS4sbodjiYOMou4yB1g1/pTPDZ8lN3HLrgl52H8pv5IEdSiH/FpRpVdaPnayXLycyv0nO3WFGKSMMjvcGwvTTHBmzy/Jq3QNSdMoJ26Vv99xY6wHI5aAfLNi4ClCyPtjgror0x/ThapEF65MK8H1r4PDwrIsRyz9Bcv1UPxqIXx1Jnx88UT9N8IWiRLp4V/9pNdR+F1bi3OuCt7+pfde7JAwRfBgkVbxF6CyVpBt02vgQjn5ms5i7jKF6mJg9sa9y9TLwNiWwBdPabX75PlT7a89SWrfYtgwZAdj6uxCxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3KYhpMlLb0h/2YuWAF6FA0/YgHm1E4ARtFeZRoVI9D4=;
 b=QqhOM1waxUq45FoHLAF6wcDswVPt2+3dkDrcmtCVJ29XdYHk6wXd9Py8vPrIUBQaVlyBTK1a92Gx7ijYtjwavcNgW/W0P5w9OhN+k2xPoilLgWCY3LT5SqylFDag0JAcxzOYVGor0GUqiF3DDkouP4TxvbxjA8UjK/vD04FaqKHGAFU3vVt68976w0LCep8/1bhnytyChvBFGalwP9b2URPXGGEQDwgGVq8pQazgdZwE3OzrwpV1v2z8gUawcJ4UGphFc2jBtM40OYY3tCzhqMYv57gCOTN/OIE9BesZXss/l/wQn8aVTVdyjvkDVDAgoCUf4ZaehaYyPu76qQqFvg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3KYhpMlLb0h/2YuWAF6FA0/YgHm1E4ARtFeZRoVI9D4=;
 b=GBmFQazKLkavYQ8SHpyY+ZA5KxFgtH+IEjUBr5t+1XL3Q0QGbnGhhAkLCXgrkLUyNrZNSPFgq1ZNP9MAXhmIwuewgMi8Gd8+PZwrbJ6b+UoEY1Ov9VNWIMKh1KxtgCzNB09BgD8aw68Fb4Xr/nR1yBBd6kCAaK7fVtC++OyTSmA+vrfTMCTbWFXqGg9GpSgupZbRCYyfvnEn6LRbl6kdCNLhluN+s6QWmwwk/JZADDVFI3PECYT23NGiHV4DVHFxdhQjOSvjhqqKXUlxeLKTY0wnOeXoJOxsI+p11M4jHJo/K6YQBo3y54AAVeg++tnhiwXaauWULu8T7kqxx58iaw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS0PR12MB7726.namprd12.prod.outlook.com (2603:10b6:8:130::6) by
 CH3PR12MB8234.namprd12.prod.outlook.com (2603:10b6:610:125::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8989.19; Mon, 4 Aug
 2025 01:51:44 +0000
Received: from DS0PR12MB7726.namprd12.prod.outlook.com
 ([fe80::953f:2f80:90c5:67fe]) by DS0PR12MB7726.namprd12.prod.outlook.com
 ([fe80::953f:2f80:90c5:67fe%5]) with mapi id 15.20.8989.017; Mon, 4 Aug 2025
 01:51:43 +0000
Date: Mon, 4 Aug 2025 11:51:38 +1000
From: Alistair Popple <apopple@nvidia.com>
To: Jason Gunthorpe <jgg@ziepe.ca>
Cc: David Hildenbrand <david@redhat.com>, 
 Matthew Wilcox <willy@infradead.org>, Yonatan Maman <ymaman@nvidia.com>, 
 =?utf-8?B?SsOpcsO0bWU=?= Glisse <jglisse@redhat.com>,
 Andrew Morton <akpm@linux-foundation.org>, 
 Leon Romanovsky <leon@kernel.org>, Lyude Paul <lyude@redhat.com>, 
 Danilo Krummrich <dakr@kernel.org>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Ben Skeggs <bskeggs@nvidia.com>, 
 Michael Guralnik <michaelgur@nvidia.com>, Or Har-Toov <ohartoov@nvidia.com>, 
 Daisuke Matsuda <dskmtsd@gmail.com>, Shay Drory <shayd@nvidia.com>,
 linux-mm@kvack.org, 
 linux-rdma@vger.kernel.org, dri-devel@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, Gal Shalom <GalShalom@nvidia.com>
Subject: Re: [PATCH v2 1/5] mm/hmm: HMM API to enable P2P DMA for device
 private pages
Message-ID: <vscps6igy42u5limiigiok6y35mjx6acawi3qmvzbrpvltp4qp@mkydml7lz6fu>
References: <20250718144442.GG2206214@ziepe.ca>
 <aH4_QaNtIJMrPqOw@casper.infradead.org>
 <7lvduvov3rvfsgixbkyyinnzz3plpp3szxam46ccgjmh6v5d7q@zoz4k723vs3d>
 <aIBcTpC9Te7YIe4J@ziepe.ca>
 <cn7hcxskr5prkc3jnd4vzzeau5weevzumcspzfayeiwdexkkfe@ovvgraqo7svh>
 <a3f1af02-ef3f-40f8-be79-4c3929a59bb7@redhat.com>
 <i5ya3n7bhhufpczprtp2ndg7bxtykoyjtsfae6dfdqk2rfz6ix@nzwnhqfwh6rq>
 <20250801164058.GD26511@ziepe.ca>
 <b8009500-8b0b-4bb9-ae5e-6d2135adbfdd@redhat.com>
 <20250801165749.GF26511@ziepe.ca>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250801165749.GF26511@ziepe.ca>
X-ClientProxiedBy: SYBPR01CA0005.ausprd01.prod.outlook.com (2603:10c6:10::17)
 To DS0PR12MB7726.namprd12.prod.outlook.com
 (2603:10b6:8:130::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR12MB7726:EE_|CH3PR12MB8234:EE_
X-MS-Office365-Filtering-Correlation-Id: 097eb281-f606-4868-cceb-08ddd2f9767f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7416014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?73ZbGI627yz6x1t9nPnXSWNanmH4Y4CYGreJ34PrOY7ySn5vgBy76H5qFg9e?=
 =?us-ascii?Q?w5zaVUzQx0KAAi84nnIwWNpErwzVk+8m2I5mCDbaZrKZ5hO3xW+/HmMzWj/J?=
 =?us-ascii?Q?gbfaqpVOSYIMGR/hS1WHWaDnbDDvfcpHD6H3yyWYtkfCu/sGtKAMecekWomY?=
 =?us-ascii?Q?Z1zrks1yWEAUSW2PhuM3hQAqrPmWY06mIv9mIqHsOCnWcjdKhWUnYGkEaLf8?=
 =?us-ascii?Q?LSRjvdEJt8uiXiCnyCKn7j1AYP2ycmTftUbvv8+dHUrpgzR8OF//lTry98EH?=
 =?us-ascii?Q?8Whp1FowszXxGatQVsFZ4QyS656zcBtXe/9k6Ubo8KoM0Yh6jAQZyX/q3GnU?=
 =?us-ascii?Q?rouC8LbOKDMWDYMt2Cn8EPKLSDy+cITnasy70mT2gckJkpGMU14pXqWIlcJ3?=
 =?us-ascii?Q?MejljYCC1eLdpTA9GBJpSMUMxYSDGyRwgb/Jnx1mCEu2OfhFDgPXk4wdydrw?=
 =?us-ascii?Q?Mu0ciTULcCkPvuf6pt+5h638ZSM4ZteTUuGc9/xv9B0bumsLT2N1YqHUgPGC?=
 =?us-ascii?Q?28xC0kv0ovaIiM/nDWrcmlqA0+SgcLjhxE/Nx1ZIICcUsSG5lVQCvdF8drEn?=
 =?us-ascii?Q?0PMNKfpmReSOxW0LhkHXZ7iBWN7GRz+hyupUAT5x405xD2KBgIMryNDAq6oq?=
 =?us-ascii?Q?744aDxuT0EUlLBMwJcuaq8Wr7r/VMSb7ou7bCZO91Nmc9Z8tmqd+KnLBS3bL?=
 =?us-ascii?Q?l8x0PnoGOtD8akDdPIHSiRqheuA2HSanbF1fJNtMR/hvQ5zVm1pRK+EvBpo8?=
 =?us-ascii?Q?K4coNhLX6A0kkc5+hkxn/U9GcjPNY82oyNx4/iHp5tdvC0TrkB5LoUiNL/NK?=
 =?us-ascii?Q?MxRlFzSSeo196piVqSTfpTR6XU6HTgfxE6jI+YEN3ugGNHsrh7C6vGCzDb0Q?=
 =?us-ascii?Q?Ry2khrLW9JDnRLFeEyijvcYfeuipwFk5qmaEjbRAtLAzwFZkFYFHd6oaRV8R?=
 =?us-ascii?Q?oFR+wS1og/LARlV7AyH/25a9dGSZ/zEFuSqq/AqXSXizwJHA90rVFtsCYln+?=
 =?us-ascii?Q?ebMmQRyALrpXxiHsx57OVvHTbCpd/T/0dOHIkag6kMBi0pUl/ryfb+rHSRAX?=
 =?us-ascii?Q?IJro9Fj1sytNBWWS8xNlBvgiFYoKeRnv62QHN3NRMiynHwRX+YqYrmCXtJ1V?=
 =?us-ascii?Q?fj5SS7IhqrGyqPxQO0Kww5EV0h1PrEnOnqpyyOSbHUl4iM4pFWj9YZ/qi7Sf?=
 =?us-ascii?Q?CUlVZkORfdTrXZ15SKoec/+P3nlmXS7DREo+vgyf9kTq5FD0jzImFL7XE/dk?=
 =?us-ascii?Q?UY65gEsDVpWnirPPdHyDJ8kQNqzrEA6e7tof9zyy9kn34CUz4ef9/kqnuKRa?=
 =?us-ascii?Q?oJouYNOhtyyOXszkzDepp3s4x/RSfnwJgmeTVY/c18ainPE3s0zkVO/A/nFF?=
 =?us-ascii?Q?1wkmgw10T+PLHvyA2o1KPZLhV5OYmZsJUitTxHxZM6G/xLhm2a00TvLf+LAA?=
 =?us-ascii?Q?yivbYUO42e8=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR12MB7726.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7416014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?CdxFTtVdzZBlDoaEvbLlxzpibTFMmmSCG6u0JHcuzt9BJ0/vp1uvENmswMmR?=
 =?us-ascii?Q?vC0Qmw8k8RPlMicrHvjAzmSGNLI3eWHRjjWzDK9/2ByDio0UqPbn/MFO/SkF?=
 =?us-ascii?Q?7KJj4APPuMBxBSuu7aucQleLOHBpGMEJ+Hqg7cRSKoPCNiMcLxwqgQhIP8BZ?=
 =?us-ascii?Q?37m3Fql4sbE75dgZCj3HiTxPnsEjbBIZ2cnUzR7aBSpF5LOPXbaGsVjgPJhb?=
 =?us-ascii?Q?4mwjxxaVCFBvQtZ3X8EoDrZmnyLT9JFxnorwNo43wTd5XjdVQSKI1y0+LhxP?=
 =?us-ascii?Q?imgneLsNyo9ReaAgVOxltesnUBVQqN45cznigs9RjNaB++EhaTZ40AVWx10/?=
 =?us-ascii?Q?SGh8ZTFRplNRqlZGdHWkYylZJ6XSS7aMyCj9WV4kNnNv9HDQxmmoQ0BB53Fb?=
 =?us-ascii?Q?rmXMyg634vk+wXywltzv7jiZojm3rTyoRyJ6BlL8zTlS9Xqhn8aT6+6f5sYz?=
 =?us-ascii?Q?MGzIo3joA2qTvZK3Hfx5RT/hIVCd7XDTyTyrFSc8uldW3chmA8XyggpwYVHW?=
 =?us-ascii?Q?2o7jGuX0I36RcB4RqsuN6LaV6Bm/aN+UgwGLMjK4mkqreho0A0goGZwHxHlE?=
 =?us-ascii?Q?BJPIyx4Da3SeVW1Sx9lzkcG1jFATMV8KYFSLbv27iFnfsZyFs4o5tXdr/4cV?=
 =?us-ascii?Q?311LMt8NKpWtuhqK1ob6U1TuarDbcGS7omTOI1eifDtWrIvnor6bUO2SWZvk?=
 =?us-ascii?Q?xBS6e0lI2DQdHQJiFY6bL69wkHK64wVoWdzMSzxch3gJ/QXMHx4t7cirmsgO?=
 =?us-ascii?Q?458saRoXS0m0xll+kr8thpoiXQqQKiNH8H/3QDerRw++tN0YznCuAK0+nB5p?=
 =?us-ascii?Q?sqtkkQ4ugvRiGLaYUnIckpP+5rbO/b5KjUAVLK1aNgLXj8ndCluTL7N1h5v3?=
 =?us-ascii?Q?Ar2ura0CH7Ex6ym84BpbZgYz/Fstw4wVfluAB+MYgQPuJA3rfy1oSSc4cyXx?=
 =?us-ascii?Q?gL78MT8bUI8tjQD7D9BWeAi8EqObMihHthlnl9SKW/a3CNgWYqwuEKhGyW/a?=
 =?us-ascii?Q?RpkdocR1ysFJkNDzQkZLlzMMGKU5//qsoetUB685CPPQXAICohf57c7U1Sye?=
 =?us-ascii?Q?DkKTSOHneiUW9etbanpsJRh78ZSkvjdrCtaPB5g1Vt0Xv/snFgjdKxpTFN2X?=
 =?us-ascii?Q?rH7BNSkZKgd6poiT6Abr8gXZ9n9bhT+/h+mTs0+A4Gu0v2NZSlmyl+ckBKlP?=
 =?us-ascii?Q?TkSWgENJf5AX5xP+aETLK7RL+4WHLWWQkLbp41V0TbIzHOFNAc1BN0f9rAas?=
 =?us-ascii?Q?GrhY3rdVLtl55T16es4WGzhOtmmkmOSz6be60Wp2clbgd0KSrtYyI1RXZEWf?=
 =?us-ascii?Q?vablGbbcoPjU9x7uxGgT/lxcnc3inPcxUyfRstdcxBHu+cI6E7ciaIi8puEO?=
 =?us-ascii?Q?GC5fmfT2Hjfh8DjTc/i7cs9CNNBa8tOBtfP5ZYdtLgvx5Lg+i9aapXyz//aE?=
 =?us-ascii?Q?//LqSD5k1BiXiYagNRRA6S97UaWZBHFrtiHiZpRRFH+5lWuuG9IMTMeBD+mw?=
 =?us-ascii?Q?zjwUtbGFA2RDTYhfX9knNkEuTq9NcUw4t/SLM1xRGs/Ym35KEAp14mnVyC5P?=
 =?us-ascii?Q?8YyRYcqaqCbx+qFwcDAR4yEuP2dfeJKcWX4LDX+x?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 097eb281-f606-4868-cceb-08ddd2f9767f
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB7726.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Aug 2025 01:51:43.6858 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oPDlRvcomtvf/c+nZ6tH4gv6DpwOdeayGpauqzsFfeH1oQfMy0b4uDFgnyjSh1XneAavjj1d+dA+Dol5H4Lqww==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8234
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

On Fri, Aug 01, 2025 at 01:57:49PM -0300, Jason Gunthorpe wrote:
> On Fri, Aug 01, 2025 at 06:50:18PM +0200, David Hildenbrand wrote:
> > On 01.08.25 18:40, Jason Gunthorpe wrote:
> > > On Fri, Jul 25, 2025 at 10:31:25AM +1000, Alistair Popple wrote:
> > > 
> > > > The only issue would be if there were generic code paths that somehow have a
> > > > raw pfn obtained from neither a page-table walk or struct page. My assumption
> > > > (yet to be proven/tested) is that these paths don't exist.
> > > 
> > > hmm does it, it encodes the device private into a pfn and expects the
> > > caller to do pfn to page.

What callers need to do pfn to page when finding a device private pfn via
hmm_range_fault()? GPU drivers don't, they tend just to use the pfn as an offset
from the start of the pgmap to find whatever data structure they are using to
track device memory allocations.

The migrate_vma_*() calls do, but they could easily be changed to whatever
index scheme we use so long as we can encode that this is a device entry in the
MIGRATE_PFN flags.

So other than adding a HMM_PFN flag to say this is really a device index I don't
see too many issues here.

> > > This isn't set in stone and could be changed..
> > > 
> > > But broadly, you'd want to entirely eliminate the ability to go from
> > > pfn to device private or from device private to pfn.
> > > 
> > > Instead you'd want to work on some (space #, space index) tuple, maybe
> > > encoded in a pfn_t, but absolutely and typesafely distinct. Each
> > > driver gets its own 0 based space for device private information, the
> > > space is effectively the pgmap.
> > > 
> > > And if you do this, maybe we don't need struct page (I mean the type!)
> > > backing device memory at all.... Which would be a very worthwhile
> > > project.

Exactly! Although we still need enough of a struct page or something else to
still be able to map them in normal anonymous VMAs. Short term the motivation
for this project is that the current scheme of "stealing" pfns for the device
doesn't actually work in a lot of cases.

> > > Do we ever even use anything in the device private struct page? Do we
> > > refcount it?
> > 
> > ref-counted and map-counted ...
> 
> Hm, so it would turn into another struct page split up where we get
> ourselves a struct device_private and change all the places touching
> its refcount and mapcount to use the new type.
> 
> If we could use some index scheme we could then divorce from struct
> page and strink the struct size sooner.

Right, that is roughly along the lines of what I was thinking.

> Jason
