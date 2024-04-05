Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C4DBE899D26
	for <lists+dri-devel@lfdr.de>; Fri,  5 Apr 2024 14:37:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BEAA5113BB7;
	Fri,  5 Apr 2024 12:37:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="fTNbZi+P";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam02on2101.outbound.protection.outlook.com [40.107.212.101])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F288E113BB3;
 Fri,  5 Apr 2024 12:37:35 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Y6sEAVVioaaVznHd590Qh05peCjUqdz8nsgG1VpSlEeMA88u48efuCkXRdvHLJrcwcjddq2BfnAfEifgMpdg68F/F9/LRmhDaTL7ZJp81G66Ef4aNo7012ia9ZwD4d+qZ2VOZBRKAwhpWJk6TfBSxnFtr07zEigMpgXAR7Tc3wwzGgWVOHPIHeybZoiVdvR75rBTUDevHswG6AeD4kVPRm7TjENCJi7uSpw9dgoOPxm2xCw67GaD4x16WTiKoxWXXmCMIAifOdjd45ln77PxEEslgufA00fp+kxBAcj6gB6X9wL/FABCENhVtkxJUZCvysMHyxCrmqqVTKAX5C4uAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oiAUSCgQNOHGNEiHKEs1Xp3XuZZ8hFRYFuzzgK1U9q8=;
 b=Uufzr+XaoMEguQXWdKM/VIHudIUYcc/B+TNUR/XkXcig+KhUeSIjFuZfPjCKA12Tghk7AI8Ea9eCzOgOwVQsKXTXij2/Gfy/iJgoJlj7F9D4wAf22XYLA+DLHAOujvuNKofV9NkgY6C36E76an1bCnAAQMOLoHePkQDlOENn3HnefWY+G+kebgd/CC0bzlCxpTRYHNPZMQnaqSiacHmYJ7Nirord+y8qP9Vh85iy5CUN7Ukg8CUtr3mimu0h0HbG6o4VIv32tI4IAN88bt4SRGo6vo5JcDSX1YuNZECUNZKFgDtrQ6y8fQmXZYqQx3NTRlg+NFNtdhhA0qQbSMwO3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oiAUSCgQNOHGNEiHKEs1Xp3XuZZ8hFRYFuzzgK1U9q8=;
 b=fTNbZi+PbSK7vn6pUWf9v1wWxjDKH2TqAR5AY8zFgaYLRwgiyWidiKkV+qrNH+gHKWrh1n3+OX5xNVPqxMMCnUo4evO0lyaaekctX1sBEeLvGigNOpgkDQnBbHulwuv9Uikr8NZJ4S6jMS/06Fnc3rH4xaGf+NnDmh61cSnwn3A3Xe5TveRHVFKF5Vnz8My70JsspbEJyJ/sPHAdbtUbBfDmRnXyu5EENsPffsXb6OSL8lSUbRbGAqanPw+jKYlt8OTaEIWeTwyOQfdPe4rVYzemDeY7JXwOViEO7QUJEjY6+IKygZC3+mRMuK8Uv844qUfGJHGuJHY3MM/+hAQ97A==
Received: from DM6PR12MB3849.namprd12.prod.outlook.com (2603:10b6:5:1c7::26)
 by SJ2PR12MB9087.namprd12.prod.outlook.com (2603:10b6:a03:562::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.46; Fri, 5 Apr
 2024 12:37:26 +0000
Received: from DM6PR12MB3849.namprd12.prod.outlook.com
 ([fe80::6aec:dbca:a593:a222]) by DM6PR12MB3849.namprd12.prod.outlook.com
 ([fe80::6aec:dbca:a593:a222%5]) with mapi id 15.20.7409.042; Fri, 5 Apr 2024
 12:37:26 +0000
Date: Fri, 5 Apr 2024 09:37:25 -0300
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
Message-ID: <20240405123725.GD5383@nvidia.com>
References: <20240117221223.18540-1-oak.zeng@intel.com>
 <20240117221223.18540-7-oak.zeng@intel.com>
 <20240405003927.GA11940@nvidia.com>
 <SA1PR11MB6991E4CDCD61A5D1909BB4EF92032@SA1PR11MB6991.namprd11.prod.outlook.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <SA1PR11MB6991E4CDCD61A5D1909BB4EF92032@SA1PR11MB6991.namprd11.prod.outlook.com>
X-ClientProxiedBy: BL1PR13CA0286.namprd13.prod.outlook.com
 (2603:10b6:208:2bc::21) To DM6PR12MB3849.namprd12.prod.outlook.com
 (2603:10b6:5:1c7::26)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR12MB3849:EE_|SJ2PR12MB9087:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: q6BLRkHSpryShCq6kpVPIRk8fPUFlpYiifIwdnBeua3LBpRbERfOnACOxqyxjwPzGq2Bw3FYitJY1oeHkUzL1MNAFACQF6jfiDlgGeYRO2CQckl+DK/vQaTPG+PP19JipudL1V4eQviMApK02aG9UJoU1NOYcVVLI5IMkVb1qUW2ZNxv6Ucsuss1IARK+lpNXDa6WPpwp2tVTGPGpuhPR2OA9QDhVVFIoLAcdp9OGbUGPkpfCPxtShphUtMNdImVnob67FK2N1CItn3bnD7yrOy/HzEok8nHAWR44Npp74zAYLxLsayA6XOP8VsAX2JQ9nPjMb/3eY5O7RSHKOugdDp0sxTo7ZxFPmgvoxhTS99soIf8nPzE7PkurNqSzz/pfINsiiHn1tRo8p1j/B9zH+Q3+6yJ7qSWXqofN9q7qj1faXbbJLQx336EOIUEckYCLWR75YsueQOf5b9AsQJZUyV9JfazJv8kaYeSoaawPAUdgJK+DDWPG+eJahkvSmbKcB65zqFWxB98uf2sX94iak3jAXtOgV0giziGNrtM/BZsq+uavClaGXVbs1tFXjbV1BtbHD7xO+ql2NLu1WGXu0Yu7P8cef1qm5bVug0Da5pjNi44bsP1bSn6bFZg/X0JZZPeo4l49BK0CvENhep8+VJ+ks9bUyy0jMkuDP6uIlk=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB3849.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7416005)(1800799015)(376005)(366007); DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?4Yz8CohObqcPKlfCThnkpPwGZd6TNQLKzqLA7uoy/9rfO6UNA1xGsdYHO9sb?=
 =?us-ascii?Q?8dWbZL4SmJIlZnD0hl4/FuYFNAn0/dkT4KmCxQe7Rod0a/G0GeSDBIzzJD5+?=
 =?us-ascii?Q?W5oC7Hgkf9RfDHNR0TfyGTrp8LmcYp+DhrDdF76BZJe3tFFDnguh/4EKuSvo?=
 =?us-ascii?Q?R3mqkkYUnbWXkGz42E9Tp3MkGXf4NIRklHZ8n9yKX4BZyzV8kzMUGoxMVsOE?=
 =?us-ascii?Q?PYBvINu7B919GvYEMzQK+tYECBbrBdMU/S2Pf/w01c5RbyxJYKHTl85UMHHV?=
 =?us-ascii?Q?9DolhGt1pWUCQBfdJzvuvDjDlBw61ui7hpINGGidbWDKdxGmGuO13Tnz3SX0?=
 =?us-ascii?Q?7CZsaJ7BJaBgS+RJ3uW1W8Y4V9MrA+aIoiar3T7dUUho9qpMLbaiGmhorHYD?=
 =?us-ascii?Q?q8i9I0ga+cFY/p7EKzBXNzYD+Kg6vQzPQy9PJyRscrMwg0zuWCaj622jifjc?=
 =?us-ascii?Q?1XL8koMRtgqupM/qmJk05Ye8tMNlDUTed5/QpBDpKclTRbBtuaCz6Fq/Mr2X?=
 =?us-ascii?Q?WxHe/dNQC6o0GKLxD2m69dgRadZhGB0nzAmJM9CuVo446WfJPpOpjHTgNq9v?=
 =?us-ascii?Q?8Lam1EsFk7m7H/FnYljyVkBoEETdDTRYJaw6EdasRhfaBcfYQ74WSIHuauCG?=
 =?us-ascii?Q?bxdyRQTKzqad8ch5WHoog5ZGsmEP+dypGEGRKU9pweY8netIYiwFc5g/yAa2?=
 =?us-ascii?Q?WkfEtwLT9wpABMqrg3II1P2rU/ZefABOKpyFLha+ZK4osybwSGZYgzxBrwh8?=
 =?us-ascii?Q?TpOKRk+2TSElhTzUq+55Dqi/HLBXLMusm3mWgJ6KttNUym/wzbra8Iy9xJP1?=
 =?us-ascii?Q?MQtuj2nngXMTTHiwX0xghjHMpwPfvfL4ZY2HTEeGMmV0e8ED65f6L29rf83R?=
 =?us-ascii?Q?/YRi3010tGdlTENramZNmEzrX6yF2OJHYi7hJunKVlxbTCOlfulMxtnG6acF?=
 =?us-ascii?Q?1FyRRYBBjnYyps/1cIxtwQ7+f9ztJLwzXWdGqyXJWQZspjj/k8z/WujgLDBf?=
 =?us-ascii?Q?1RrEzWXdYQZITTglBH1ifIsgGCpmXfeY99ST8QFGrf156uMpBhuelhI9bTdQ?=
 =?us-ascii?Q?ubYx2sEdg8fpRNePQomF4GQwf9q2Dyym1TzrqWg4oBd5ugutCMmj2uEG3KuX?=
 =?us-ascii?Q?p0z436fWqhWb08hO8YSG/8CPIUhd71M0shtNw+CGihaYJ9E2DbjgvNekPbMJ?=
 =?us-ascii?Q?S/USQIt0/zHviDrd0cyFwjllR4BxrE6lsB0oc/zp0Sd1IqtdjI5s3dfkDuc0?=
 =?us-ascii?Q?f9GGCiFeqjK5PGJ7mbiEQbHCY8bPnK6pNM7Ump8AqdXXviaAQChn8ABR6RCj?=
 =?us-ascii?Q?gDWZMFwgqQAE+WW7qb6z4ce+gG02ASlG8udU1Wr8RJ83MsKVGlSMCaoBncxV?=
 =?us-ascii?Q?Dh+7S1tFwy8xqXC5ez76R86dqPIGDMsGapyc7XFJoJ3tnxnGPvj895bHAeFT?=
 =?us-ascii?Q?+i6A4rXY3TPMVlB6hWN/hoyz6UwV0JD6n57mEzlBNEA/NSk601LUAozUkmvp?=
 =?us-ascii?Q?sa/0V3pSt2q8YeikbD1q8g9+WXGbLJLbtJfwO7k1R+m64DJJHYoJgdD0Kkuv?=
 =?us-ascii?Q?Qior9EE52N4q3b6S8FR1VFbwEi0eQzVHl45h0GpZ?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 97432e00-e012-4a67-b930-08dc556d265a
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB3849.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Apr 2024 12:37:26.4154 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: b1F6yUQEb5M+4Wg28B4u3almhd411/3Lbeo3EOuDCiHi6stJmztSGSrQulNOO/X0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB9087
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

On Fri, Apr 05, 2024 at 03:33:10AM +0000, Zeng, Oak wrote:
> > 
> > I didn't look at this series a lot but I wanted to make a few
> > remarks.. This I don't like quite a lot. Yes, the DMA API interaction
> > with hmm_range_fault is pretty bad, but it should not be hacked
> > around like this. Leon is working on a series to improve it:
> > 
> > https://lore.kernel.org/linux-rdma/cover.1709635535.git.leon@kernel.org/
> 
> 
> I completely agree above codes are really ugly. We definitely want
> to adapt to a better way. I will spend some time on above series.
> 
> > 
> > Please participate there too. In the mean time you should just call
> > dma_map_page for every single page like ODP does.
> 
> Above codes deal with a case where dma map is not needed. As I
> understand it, whether we need a dma map depends on the devices
> topology. For example, when device access host memory or another
> device's memory through pcie, we need dma mapping; if the connection
> b/t devices is xelink (similar to nvidia's nvlink), all device's
> memory can be in same address space, so no dma mapping is needed.

Then you call dma_map_page to do your DMA side and you avoid it for
the DEVICE_PRIVATE side. SG list doesn't help this anyhow.

> > Also, I tried to follow the large discussion in the end but it was
> > quite hard to read the text in Lore for some reason.
> 
> Did you mean this discussion: https://lore.kernel.org/dri-devel/?q=Making+drm_gpuvm+work+across+gpu+devices? This link works good for me with chrome browser.

That is the one I am referring to

> > I would just opine some general points on how I see hmm_range_fault
> > being used by drivers.
> > 
> > First of all, the device should have a private page table. At least
> > one, but ideally many. Obviously it should work, so I found it a bit
> > puzzling the talk about problems with virtualization. Either the
> > private page table works virtualized, including faults, or it should
> > not be available..
>
> To be very honest, I was also very confused. In this series, I had
> one very fundamental assumption that with hmm any valid cpu virtual
> address is also a valid gpu virtual address. But Christian had a
> very strong opinion that the gpu va can have an offset to cpu va. He
> mentioned a failed use case with amdkfd and claimed an offset can
> solve their problem.

Offset is something different, I said the VM's view of the page table
should fully work. You shouldn't get into a weird situation where the
VM is populating the page table and can't handle faults or something.

If the VMM has a weird design where there is only one page table and
it needs to partition space based on slicing it into regions then
fine, but the delegated region to the guest OS should still work
fully.

> > Or it is a selective mirror where it copies part of the mm page table
> > into a "vma" of a possibly shared device page table. The
> > hmm_range_fault bit would exclusively own it's bit of VMA.
> 
> Can you explain what is "hmm_range_fault bit"?

I mean if you setup a mirror VMA in a device private page table then that
range of VA will be owned by the hmm_range_fault code and will mirror
a subset of a mm into that VMA. This is the offset you mention
above. The MM's VA and the device private page table VA do not have to
be the same (eg we implement this option in RDMA's ODP)

A 1:1 SVA mapping is a special case of this where there is a single
GPU VMA that spans the entire process address space with a 1:1 VA (no
offset).

> Do you think register a huge mmu notifier to cover the whole address
> space would be good? I don't know here but there would be much more
> unnecessary callbacks from mmu to device driver.

Yes. IMHO you should try to optimize the invalidations away in driver
logic not through dynamic mmu notifiers. Installing and removing a
notifier is very expensive.

> Similarly, we create range only the fly for those range that is
> accessed by gpu. But we have some idea to keep one gigantic
> range/VMA representing the whole address space while creating only
> some "gpu page table state range" on the fly. This idea requires
> some refactor to our xe driver and we will evaluate it more to
> decide whether we want to go this way.

This is a better direction.
 
> > I also agree with the general spirit of the remarks that there should
> > not be a process binding or any kind of "global" character
> > device. 
> 
> Even though a global pseudo device looks bad, it does come with some
> benefit. For example, if you want to set a memory attributes to a
> shared virtual address range b/t all devices, you can set such
> attributes through a ioctl of the global device. We have agreed to
> remove our global character device and we will repeat the memory
> attributes setting on all devices one by one.

That implies you have a global shared device private page table which
is sort of impossible because of how the DMA API works.

Having the kernel iterate over all the private page tables vs having
the userspace iterate over all the private page tables doesn't seem
like a worthwile difference to justify a global cdev.

> Is /dev/nvidia-uvm a global character device for uvm purpose?

No idea, I wouldn't assume anything the nvidia drivers do is aligned
with what upstream expects.

Jason
