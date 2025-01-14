Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A7CAA10DCB
	for <lists+dri-devel@lfdr.de>; Tue, 14 Jan 2025 18:31:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA56D10E408;
	Tue, 14 Jan 2025 17:31:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="rdLuGh0Q";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam02on2046.outbound.protection.outlook.com [40.107.212.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A31A310E408
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Jan 2025 17:31:07 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HQcVfjDiauhuDDCxXCsk2lpGIK4n8/QASQHVKjdfE5VgMC8sjsKAg3EGlmGDjLeBip2Lsc06hkcG2U8iS7sh0BTUcvxYXIJwBhmT9lTnSRNi0c7PA+ZhPad6ieRBYYFt3YHzENqDlWVcv6w03KbZGe8WcY4GBm4P/+UQg6Dfubg+YXYoOQtJ3r3CXt7Gozp3A14rB8IQeErGX/DRGDEUu9jWyt15qFq4eAUkCrUcZynRkGorBGwJ6ihj381XqFb7Nm3BEwhAcgtcugp8sW1bZrTsYm2Y9zSGCTA1tFwDJknzJxGs2KIMzUrwiOjRjW0uoHzExjpyiGO60XVnyCiO6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wwPXVop7yZOoYa/6nTb1Si4es1VE81yC65xUpTFdGqw=;
 b=OzMt36SqMqtZ56mPzWYOIXrKBeBICCl+EE9dkx+780jDlmQ9GyRNivargJUzUXOL71G0bGbCL5pcC8VioCShgg2fp64lIdhD6+IYhDlju6ChBD8TIuaFXBk3DU9BVLUxterPlkx6Y/SuRg2KINDFOursVKWiLMninGFDSay3aK6F+PyIACksx7k333ErtfN8RYWfSUAMYqnLnZJcgdO/Qbl6poUEWh4l0D7oBfcEOb9Vspl5OTrwDViXnO8JvJosq5jBEJtCleGzrEhq1Unsd92TrZgKqEm25wFw+/2fdwMORTn/lb3hYPwhwCZu+o47ZsoaxLU5YQwok1sV+cnZyw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wwPXVop7yZOoYa/6nTb1Si4es1VE81yC65xUpTFdGqw=;
 b=rdLuGh0QwUKNs/U391sKewNYTrHAoczH9ns3FKazfXUxze6aY6MteHhYMsPwmEI8NCfqqWhByYvaG3qSqF4H/JxbiQapjDd32w8Pe9tSDveavQQCc9ZRu7HUvM3G0k2BdeB3eNecTsfIoqbS70zpbS4iDVTB23utoWqqQ1WM79NTK0dgqXQUkgAsf6AAhZElLLvlvth5KdDjf2Jwo2edDdiDzrEIuzOtLIotBe3iIUJr6QM0ZkW/nq76XWAHeG4AezLoy9FjzrbM4nqYZai50b9peZRGJOoV+IzBe51V98eOqAoyfSzuUtNAiKuOoPbeu9HzPxalLbeN5zhga2pyrQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH3PR12MB8659.namprd12.prod.outlook.com (2603:10b6:610:17c::13)
 by BL3PR12MB6595.namprd12.prod.outlook.com (2603:10b6:208:38e::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.18; Tue, 14 Jan
 2025 17:31:04 +0000
Received: from CH3PR12MB8659.namprd12.prod.outlook.com
 ([fe80::6eb6:7d37:7b4b:1732]) by CH3PR12MB8659.namprd12.prod.outlook.com
 ([fe80::6eb6:7d37:7b4b:1732%5]) with mapi id 15.20.8335.017; Tue, 14 Jan 2025
 17:31:04 +0000
Date: Tue, 14 Jan 2025 13:31:03 -0400
From: Jason Gunthorpe <jgg@nvidia.com>
To: Xu Yilun <yilun.xu@linux.intel.com>,
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
 Christoph Hellwig <hch@lst.de>, Leon Romanovsky <leonro@nvidia.com>,
 kvm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
 sumit.semwal@linaro.org, pbonzini@redhat.com, seanjc@google.com,
 alex.williamson@redhat.com, vivek.kasireddy@intel.com,
 dan.j.williams@intel.com, aik@amd.com, yilun.xu@intel.com,
 linux-coco@lists.linux.dev, linux-kernel@vger.kernel.org,
 lukas@wunner.de, yan.y.zhao@intel.com, leon@kernel.org,
 baolu.lu@linux.intel.com, zhenzhong.duan@intel.com, tao1.su@intel.com
Subject: Re: [RFC PATCH 01/12] dma-buf: Introduce dma_buf_get_pfn_unlocked()
 kAPI
Message-ID: <20250114173103.GE5556@nvidia.com>
References: <20250108145843.GR5556@nvidia.com>
 <5a858e00-6fea-4a7a-93be-f23b66e00835@amd.com>
 <20250108162227.GT5556@nvidia.com>
 <Z37HpvHAfB0g9OQ-@phenom.ffwll.local>
 <Z37QaIDUgiygLh74@yilunxu-OptiPlex-7050>
 <58e97916-e6fd-41ef-84b4-bbf53ed0e8e4@amd.com>
 <Z38FCOPE7WPprYhx@yilunxu-OptiPlex-7050>
 <Z4F2X7Fu-5lprLrk@phenom.ffwll.local>
 <20250110203838.GL5556@nvidia.com>
 <Z4Z4NKqVG2Vbv98Q@phenom.ffwll.local>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z4Z4NKqVG2Vbv98Q@phenom.ffwll.local>
X-ClientProxiedBy: MN0PR02CA0016.namprd02.prod.outlook.com
 (2603:10b6:208:530::14) To CH3PR12MB8659.namprd12.prod.outlook.com
 (2603:10b6:610:17c::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR12MB8659:EE_|BL3PR12MB6595:EE_
X-MS-Office365-Filtering-Correlation-Id: e9c4e0af-fe6a-405b-9044-08dd34c138d8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|7416014|921020; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?XNt4fLehHId82BQXADJXY5MO7x5KJx2kFPGK2TRPewYznR9+z1WdloyFufSw?=
 =?us-ascii?Q?2OwB2+t2ZLeOa5WrEEq++uPG8/ZjZvt0ieHp6gnxmkAa1FA7q1zxPg1QE1d8?=
 =?us-ascii?Q?cBQHVosv1fmmY9U0P6R/vVSl5sRkQOfDFBAOgbRUmBcv/oBfB2Z2SF+b8FQG?=
 =?us-ascii?Q?RqdIhKl+LPfDuU9aefWGYoH8pw+VqwdCynYnCN5dhRn/HluqcpHKbH8+ZVa+?=
 =?us-ascii?Q?M5ITPVe6BcfGqggFTEH4yfDoaAywkH9+0+2rzxgmzNdk18lequwApPxqiOy9?=
 =?us-ascii?Q?J+tCtdaiGggqLiJ+yDhbnMf95yl7XcaWVve8xXq9/mHixcPV6HMB4Tz7dB+p?=
 =?us-ascii?Q?WlRHKdtvLSvTrgVtBmvNaxIL5sKxp2TfaXYGQjWk6gWmNAsE92VAifpO5dwi?=
 =?us-ascii?Q?8sZM5dCsAsNUXqsA8ulEPRw0uzCkiJRg7nPNL2mWB7bw6XHpo754yWcB4JJZ?=
 =?us-ascii?Q?eYPtCmE+MBLJrbNezkUrMYzrZ8MK3kxiGqQ7+dFvhukH7wSwADBVqde2RSbr?=
 =?us-ascii?Q?JgF2lyo3Dbtl/bYz5eHP52thQHszjJ627zRd7dFdPrsauUj8Hbaydz/L/dq3?=
 =?us-ascii?Q?fXBFJgj7LMbpTbCbBj7x+xlz0uuJSXywFpMEes3E02x3H3SrrFJl1q0CKlP5?=
 =?us-ascii?Q?GSId/j1hRdZ30q2sM+GOTuGdlDPV+9SJdeuapDpyqq9Pe/wJ/nruUprayZFI?=
 =?us-ascii?Q?UaV2Gv8fkNA2SM9IPRdjv3pxPSiieRPpgIyPjfYvkjI35xOTgkHDCDgYPLIz?=
 =?us-ascii?Q?Y2DDOlaZNtFylVDzZ+YB15V1AuLOoi4lmzQ7mUHAjZ2l0DF0oake7+GrcmMs?=
 =?us-ascii?Q?pvDhFxdgEMOx/Td66yRNTyxLvgV8q+w2usGciMKaF2YGqzRqN10tldvZBi/K?=
 =?us-ascii?Q?kE7zuD35dbQt5qO/Ol2sQX6KrPT6itcO/ig8CWOFUY0OhAbEknOvMPQoWy2+?=
 =?us-ascii?Q?cZDn+2LB/rC2bgcAddUZ7RLDkWCVeSfe6OUU383THQPuF8KyRZCIlA3IMSEm?=
 =?us-ascii?Q?aJ3v2FHkASnoAOw4reXga5j/9COQSXRlEaKna+KagpqIwdQcDbrkR8/ujlVi?=
 =?us-ascii?Q?zOTclYdA3PK9z+jl30ExFKwLvH3YWrEFZZSmJklibocM18oprwIpx9JsVVq3?=
 =?us-ascii?Q?NfcuCsWhgys/4DHopb77Cn6ARt3z0LklhIYDfO2t+XRSAiPP1k1JXmul9bAF?=
 =?us-ascii?Q?xJC7sPXoAYZP3OQWOrLgIpngW61ru3U70CUe4bc/DKHDA8Bz6rhaPfI0YxEw?=
 =?us-ascii?Q?eaZEpRt19hyJlEehhoayGS1F7iy7UBKiFOi4ZiM92Pks2J+q4om8IbCY5emx?=
 =?us-ascii?Q?+lnP7WOt2sMfv2XOqKllf6v4NmcU63YDrJ8UtPrOAcKm4NTu2YeRL/6O7QL4?=
 =?us-ascii?Q?U6Iq9bH97zukRMfXWQX+go0/2/yc1ILGouxn05TIP7ZN5lOS7t7od/6skbx3?=
 =?us-ascii?Q?1HLTHRD8RjI=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR12MB8659.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7416014)(921020); DIR:OUT; SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?4Gw9k2OyGF3acFkHI3B8Cq6AFJHBd8k9DOVB/9ixUvvzO2pirryZRl7T2dit?=
 =?us-ascii?Q?mroI1bS9IFR8LFuWP11q4UTKchTHBOL/rMc6z1VK7/C/LSyS595lljuG1M0X?=
 =?us-ascii?Q?rcYVusFLqhz68DUltin/u9HJGuzhmsoq3HKTyuDFdgMqc1pRKEIKgbA1zCYl?=
 =?us-ascii?Q?8ydU+ePyjP95J5VxAQyUZCpk8iuvV6WA+CwPaI/L4jZi6/SnQYE1oFKc6+S4?=
 =?us-ascii?Q?dFabyzKXytjgWxsARWPiaZ+x0LAt0TIcWlspIGHnEra+GCrePYV73sLUILFu?=
 =?us-ascii?Q?e2O1zr5FX9V4HL7MwNfBmNdIllySpQGRsPjKMkNlEk/8mEx+7+rxCbHZ5TLb?=
 =?us-ascii?Q?tQiZrdoTQebQ7bVh1wxoKcgThdX+kpsBa5yyJrioXXiCVpd69VqigBsNHkxh?=
 =?us-ascii?Q?s9ZDgUkiTqpHE1w7eeoFtNOPG42Rr5OGFEZWJZGSZaCa44GB8DHCeFVqzunP?=
 =?us-ascii?Q?8DZKrAITduMWt6z1i4xqUg7DBmKeYPPoUqNFs3cS9iZ6JtqtMVQeiFQoN36O?=
 =?us-ascii?Q?u6rm2wI9240vEp8tlzWens5XAGjE7ygqhygcO/CIeZl5ZoZMEgMWu72JLk+/?=
 =?us-ascii?Q?H0eHplHOP8vdPUd9pBmgFe1sATKo+Nt/yc1uMHCbZ5QIfLR9f9DlRjx28AYH?=
 =?us-ascii?Q?kBzTpLbPeG2ySSPJCOFb3d/Rgg5CkHjUCwvEMXjVzeXzx3/gkKFGt7YbSaND?=
 =?us-ascii?Q?LPwsSc2NXQv/KQgGNJOuZDFwXLXZr933EqctveL3ZuYKAqtKMWm3sqSrNQIe?=
 =?us-ascii?Q?mQmb7sHCIqafabcD4lZwWVE1HevDR3jxmrumPE61tq0LLbmFRd8LAEJ2RgpU?=
 =?us-ascii?Q?PgyOGRrruoYRjWOrxIflrUPoPicahjgZ8viDJ0c1cWl5tDuAed/4iiPiQsEq?=
 =?us-ascii?Q?GoTdr/Ln/UD49KWT+H5sX/ioF6OqxqGh2+GrsMfZxs8BPpDzlObolvwv6nyc?=
 =?us-ascii?Q?3VNR/bv3xiPZ1IOOtpOlhOIErgJ0faMx62f4Uf002mrYB5c7V4TRY6johvoV?=
 =?us-ascii?Q?bVwH57/2xRlSeC7U0owXOnEHy47Dpl+Y7p2nbWcWzFlPTa2E9Qv1iacBpJyK?=
 =?us-ascii?Q?xlJYpXV7NjzKaMmbQy/AxW293F9gJCKagU17CV8JfIM7moN9NAc1Q3t9c5oq?=
 =?us-ascii?Q?SrfOaXrOsAYSdp7RCbk2WhGlXsCtoDKRGuydfYxreCiukLDP5GJA9ZwBTOBt?=
 =?us-ascii?Q?TFpTQFwlX9hhc8vmqRkMlQMPoWjtVj5SZVe8FywJqgLc2CLKMByEVDBh+9VU?=
 =?us-ascii?Q?9CizvHyo1aimHOG/WU41iBl6Bnt5wyB4SRPljOVZMns6Hy2K+zHlEcD4/Jn8?=
 =?us-ascii?Q?FOB3UJH8gNunjG5+oq1vWunIGs7MKK2Ni5cPxH3sA1iO4LYjGfPQmr9bxhfn?=
 =?us-ascii?Q?eqiuIHyt//ZumCSGeKQ/GPZsTlPXGhj1ePFgWgyFd0pp/i/IIRKkSzDhvDG1?=
 =?us-ascii?Q?R3oAArLS3ztkl5vx9ieE84lVqWB9NqTnTsBriLrLx4GVO0GIy42/0/qFqhe2?=
 =?us-ascii?Q?TmU0rt2xeK53WBmLCJabBnWNRbqWhz1W2Wvw0EGxnLHZkz8wL/gPXxseLohl?=
 =?us-ascii?Q?JF9odQZjv9/SFekbTlba32Q3oAwEe/7YU1jJxXVk?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e9c4e0af-fe6a-405b-9044-08dd34c138d8
X-MS-Exchange-CrossTenant-AuthSource: CH3PR12MB8659.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jan 2025 17:31:04.5955 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: j9CFajaXP4oh2gxVEtjK8vdlsZ+CCARgwVUclBHdwKwr2sUJlOQTQOWp1v96qqYP
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR12MB6595
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

On Tue, Jan 14, 2025 at 03:44:04PM +0100, Simona Vetter wrote:

> E.g. if a compositor gets a dma-buf it assumes that by just binding that
> it will not risk gpu context destruction (unless you're out of memory and
> everything is on fire anyway, and it's ok to die). But if a nasty client
> app supplies a revocable dma-buf, then it can shot down the higher
> priviledged compositor gpu workload with precision. Which is not great, so
> maybe existing dynamic gpu importers should reject revocable dma-buf.
> That's at least what I had in mind as a potential issue.

I see, so it is not that they can't handle a non-present fault it is
just that the non-present effectively turns into a crash of the
context and you want to avoid the crash. It makes sense to me to
negotiate this as part of the API.

> > This is similar to the structure BIO has, and it composes nicely with
> > a future pin_user_pages() and memfd_pin_folios().
> 
> Since you mention pin here, I think that's another aspect of the revocable
> vs dynamic question. Dynamic buffers are expected to sometimes just move
> around for no reason, and importers must be able to cope.

Yes, and we have importers that can tolerate dynamic and those that
can't. Though those that can't tolerate it can often implement revoke.

I view your list as a cascade:
 1) Fully pinned can never be changed so long as the attach is present
 2) Fully pinned, but can be revoked. Revoked is a fatal condition and
    the importer is allowed to experience an error
 3) Fully dynamic and always present. Support for move, and
    restartable fault, is required

Today in RDMA we ask the exporter if it is 1 or 3 and allow different
things. I've seen the GPU side start to offer 1 more often as it has
significant performance wins.

> For recovable exporters/importers I'd expect that movement is not
> happening, meaning it's pinned until the single terminal revocation. And
> maybe I read the kvm stuff wrong, but it reads more like the latter to me
> when crawling through the pfn code.

kvm should be fully faultable and it should be able handle move. It
handles move today using the mmu notifiers after all.

kvm would need to interact with the dmabuf reservations on its page
fault path.

iommufd cannot be faultable and it would only support revoke. For VFIO
revoke would not be fully terminal as VFIO can unrevoke too
(sigh).  If we make revoke special I'd like to eventually include
unrevoke for this reason.

> Once we have the lifetime rules nailed then there's the other issue of how
> to describe the memory, and my take for that is that once the dma-api has
> a clear answer we'll just blindly adopt that one and done.

This is what I hope, we are not there yet, first Leon's series needs
to get merged then we can start on making the DMA API P2P safe without
any struct page. From there it should be clear what direction things
go in.

DMABUF would return pfns annotated with whatever matches the DMA API,
and the importer would be able to inspect the PFNs to learn
information like their P2Pness, CPU mappability or whatever.

I'm pushing for the extra struct, and Christoph has been thinking
about searching a maple tree on the PFN. We need to see what works best.

> And currently with either dynamic attachments and dma_addr_t or through
> fishing the pfn from the cpu pagetables there's some very clearly defined
> lifetime and locking rules (which kvm might get wrong, I've seen some
> discussions fly by where it wasn't doing a perfect job with reflecting pte
> changes, but that was about access attributes iirc). 

Wouldn't surprise me, mmu notifiers are very complex all around. We've
had bugs already where the mm doesn't signal the notifiers at the
right points.

> If we add something
> new, we need clear rules and not just "here's the kvm code that uses it".
> That's how we've done dma-buf at first, and it was a terrible mess of
> mismatched expecations.

Yes, that would be wrong. It should be self defined within dmabuf and
kvm should adopt to it, move semantics and all.

My general desire is to move all of RDMA's MR process away from
scatterlist and work using only the new DMA API. This will save *huge*
amounts of memory in common workloads and be the basis for non-struct
page DMA support, including P2P.

Jason
