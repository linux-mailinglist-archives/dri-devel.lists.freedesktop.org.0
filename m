Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D796F83A776
	for <lists+dri-devel@lfdr.de>; Wed, 24 Jan 2024 12:06:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 05B8F88EFF;
	Wed, 24 Jan 2024 11:06:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2072.outbound.protection.outlook.com [40.107.237.72])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C428210E9D9;
 Wed, 24 Jan 2024 11:06:04 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BzQLPTIQOEhn91NTBnPSYs0V52D0pMl7jH5tICAWsNlWRIj6U6tYOo3DBHl4Gx5Z2MEZjkmkrxHDImoSCfm+yjABPguaX30iSgItEF2zm4PoU/OEO19RAEVvPU5HoBAWNQhc6EILhMFrG/Xk30pS5iAfeNGLg5aqmtIkHXrZn1o1v3d30TmUjFzQPsm7I6wpWItGOCMxanEz5FCz33l7FbsMrmkzrWMXHfBb2JIRxnYYuQNl5L9RZaN03uafyqMDc3XJFGPlMki58qlUqLT/I/+cvXIHNxLAzlgh2wEnRZ136RSVEgbGwCqdT7aMLUJZW5mUqTeE6euN6AVieFzxIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ddN4aZJc0Y58BMURnEgIywo1qwJiduYQA4DoXW4U4Ok=;
 b=YqHqGoTDbnd9n7Fc/bQNxaC61aWqEp5ls/BhYd1wDmJGxrE7gB4UO8liUZzQitjv6cAKAcRSMKMmbfYD+xGyk4gLlNnSK5c2Cq+pQITu0K2ZgdtuaUH60JletjWKPuVFN4k7+a0dHVSIBPp1RhnnjcudKvL/6Xv9Jc981OgyJcrUOXDAkpH+praz4SYqTmuw4Pa9NYK+UMQoirQYZP3ykn8bRZdOACfogUmjnpAIfabLzqX8Vusc9tWrCCavzmH6+LRByv9CwMj7wcydxtiuD0kU3azQG9DokxFETIU3DFPTQW6rgijd6c2GIy1M8zsBUf8NR9vPM1SjVI9Agrbazw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ddN4aZJc0Y58BMURnEgIywo1qwJiduYQA4DoXW4U4Ok=;
 b=jO2uzqVelqR04nj6jxY7xM0iVkpAXEfJ5WEAd1lhSfDpLsOsCrYX3El612PpeFHZSv/W2WgajTmytaZxJ2B+Wdavm7oGMqE0hb43VXum6KTQqhBIzctwX6lsOm8Ilh72irYqFldI4E174IhHJ4BJecWAPUYzmdwqyFrQSKQahWvr59wh+b7auCJrKrbHAtKzBuAdNOsnH5ZiyEZf8AMvLLtgzX2ND3dLTDQdTjCWOvuY8GTosEpMcIpKJOwkx7xk5taNhQ0dPf4TLoS89EXHrrE97OYndwLgtA/Iu3479iGLFWZ7ElXzuROiwT8381GjvuJTj4w7DwsuBD1qDwGFRQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS0PR12MB7726.namprd12.prod.outlook.com (2603:10b6:8:130::6) by
 DS0PR12MB7607.namprd12.prod.outlook.com (2603:10b6:8:13f::13) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7202.37; Wed, 24 Jan 2024 11:05:41 +0000
Received: from DS0PR12MB7726.namprd12.prod.outlook.com
 ([fe80::8cbd:dda3:38cd:1dc9]) by DS0PR12MB7726.namprd12.prod.outlook.com
 ([fe80::8cbd:dda3:38cd:1dc9%5]) with mapi id 15.20.7228.023; Wed, 24 Jan 2024
 11:05:41 +0000
References: <20240122033210.713530-1-Xianrong.Zhou@amd.com>
 <5ed7d46b-ae26-43f2-81e0-91e3cfc0218a@amd.com>
 <MN2PR12MB4302C529B9F231F85539628EF1742@MN2PR12MB4302.namprd12.prod.outlook.com>
 <76c3658d-2256-49c6-8e4c-49555c0a350a@amd.com>
 <MN2PR12MB4302BBF634B2E3872904872BF17B2@MN2PR12MB4302.namprd12.prod.outlook.com>
 <a307539f-8894-4d5f-a32d-3936e6fba65f@gmail.com>
 <MN2PR12MB43026CF629232E7F018FBEC3F17B2@MN2PR12MB4302.namprd12.prod.outlook.com>
User-agent: mu4e 1.10.8; emacs 29.1
From: Alistair Popple <apopple@nvidia.com>
To: "Zhou, Xianrong" <Xianrong.Zhou@amd.com>
Subject: Re: [PATCH] mm: Remove double faults once write a device pfn
Date: Wed, 24 Jan 2024 22:04:06 +1100
In-reply-to: <MN2PR12MB43026CF629232E7F018FBEC3F17B2@MN2PR12MB4302.namprd12.prod.outlook.com>
Message-ID: <87fryngfen.fsf@nvdebian.thelocal>
Content-Type: text/plain
X-ClientProxiedBy: SYAPR01CA0042.ausprd01.prod.outlook.com (2603:10c6:1:1::30)
 To DS0PR12MB7726.namprd12.prod.outlook.com
 (2603:10b6:8:130::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR12MB7726:EE_|DS0PR12MB7607:EE_
X-MS-Office365-Filtering-Correlation-Id: d47b5ac7-4242-4759-ef3e-08dc1ccc6753
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: CWnQX3tNYLAJOvfQjqpSy2H2tBRyjuk0H56qxcwwmdOS7kk9oyRKMdrMNxIYc6mQlQMUOnK576wIurwVHcLwThM9L/JJHH2WsROnmbDoW5TALWLqjv76KPD2Avhl36kwNyCiNlvSjHJiDLJ99/JaiAgM9l1s4n2ENiC3MzY3t24fY27eTt0qPv+yd7xaIZ3J8iEPn10fq06DaE/WIyZaEbzRt2X9xUc0Q3E+WG8wb4yry0K82ayoi307Cq81HAIrIh0uGfTkNDamyX8rwwYq6yMzq1M/DpZ//4tDwYHBL5lG0B3VFYjr1l6llSuah1E9TsPr8RAaQXrj8RjdyHlktQJkhSRGQSJFJV0kX4h9O2/7MEVLuK79nIaEZmhV3FdREIGxHJ7Gbo4ebs8tragXRuc7bXgeC6eGD7Hq4E2Lv2Pj+5zawGCECvA5OatqtoX69LfooSDcJwkLzscGL8Vd6NsC6ZC8Do+g1X3qfFKSZP0eLcOhg1OdgZM65QGUwdLV+RNv3FoKPAdqDErOhlBge2O614cM0QjnK/rIcwzpXbLEJe+lIJp/OoGWb21r0MFD
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR12MB7726.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(366004)(396003)(39860400002)(376002)(136003)(230922051799003)(1800799012)(186009)(64100799003)(451199024)(7416002)(4326008)(83380400001)(9686003)(8676002)(8936002)(5660300002)(7406005)(6666004)(6512007)(66556008)(6506007)(66476007)(478600001)(54906003)(66946007)(316002)(26005)(38100700002)(2906002)(6486002)(6916009)(30864003)(86362001)(41300700001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?VAFybQo/su+G+ROWKyKOAr1OOUL+zclCzOA/MHRtrNs+n2+HOY6n+b3nPUVo?=
 =?us-ascii?Q?eEuJKdQWifjINJ9l02lJfH3Om7ZtAJgnCsieyLaQZV6P38e6+vfFSPzsaE8j?=
 =?us-ascii?Q?vEi01LUzwqnnRH3oqKNTZXoyYEnaKz9+q61gEYpMgB34judeG7TOHlfwwnlp?=
 =?us-ascii?Q?MYfFV27xVN6UWEjkvRcpFswKyM9UN1DZRfkyZhxYCwXA7weGRTDO6g7gTlFM?=
 =?us-ascii?Q?kvQ/JclJKnJHAMv24jX7PX0QSrAHyDiWclAHb7uTQQXqBBlycuGffecjEG5R?=
 =?us-ascii?Q?9t5PwKtWSo2hDoJuqkHWiZo5oQZ5gnyYdmQiBa8C5X/dyTGk4FVslsdryRUk?=
 =?us-ascii?Q?wp+/QeLakXg3IDcP0JJzDnHqzd/EECKu4+6VQiXXpkUe8tUeBc1pZ77ULPWj?=
 =?us-ascii?Q?H35NdoOHAS0tQA6TeRi6zg6z2MiEJAcTAK6Iyy0aeIjSD5bwrEnMRU4wxNmn?=
 =?us-ascii?Q?1WGV7WI8rym+CT5OE+DIAGilds80Ar7OuhBt2cEqe1FxRjfJHLgTLjRAsm02?=
 =?us-ascii?Q?zI1t8Uw1SnoWPZJqaUtonmf3iTzIvG3zuPEi4MQHbxaDucdXIyb0MP7I4PTQ?=
 =?us-ascii?Q?y1cdl+YEQQh1efE8mOeVTMiVm3p+dQJi1mjNHudXKRp0qbTAku1h/lIkXLYV?=
 =?us-ascii?Q?Gb9QN8xrvXiHYlAyNHYh6hTjv7HIerlXFOel12NWTdl4I3WBTtjJ8EwIXqva?=
 =?us-ascii?Q?Y5zZMGzPuMpYWVNIwubFg2C9CJMMkQdgNAMmBrF+0xxMIXxY6EbkuD8eXcqZ?=
 =?us-ascii?Q?b+4uYQivnyLSznF/8XFowj5G/tZiPOc4/VUiUEMJjo6q9A+CX38wy8n+bRUR?=
 =?us-ascii?Q?qgsW73kZ1YkmopX32xI1Rzah/1bHzLqh4EBbhXEMDGX9OrqPz1Xl4DIcdHca?=
 =?us-ascii?Q?UycrdBJV9l5iiFzaS7PYCwSCzKbSnd0cUYVz3QDmIDpHSOGIGxnkDcJRPPFH?=
 =?us-ascii?Q?VqL0wweS0B612Gy3Fuf/LJjl7krJE9feC3QpOPIZjVS01uAaCzLmgbr0OVKl?=
 =?us-ascii?Q?4m9BF0KNTALrUNQeHnyFDHZBYkoEazJ52OifqiYT4sKEqPoViGBb4zRUO91I?=
 =?us-ascii?Q?FSwrW4SKC393RvQ8O5Qj+iyZAGgELv2YpR0wGq8EIB9B1JG0bcxZ2IOdiSMW?=
 =?us-ascii?Q?EZ/UMJKyTxEE/XL6JKQdVtXtoxw2VeTqgMl0rv0m+ZhezGNbuFBlgDjWYw5Z?=
 =?us-ascii?Q?uiKikPlkoOWMuvcX86WYRf7gkHk+GJfFJps20vtnhMBK4sXSwgNFp5VHdGLe?=
 =?us-ascii?Q?Sv4LP7RCbhFV9avAeCWM04dQ6tfIedzYDSHga+GrOLme34sDBK1oLIVWT4br?=
 =?us-ascii?Q?W4uASiPum2wVlloR0rCqQWcJU1ZFlym3HuLNskr2fPlPrSIqah7gkfJSGLge?=
 =?us-ascii?Q?Ky9LIQ8w9xEsN4p6j5SpD0PYYIW2GtaUNe+BuiVIvE+mq0/GmQmQKw0Vd2Vr?=
 =?us-ascii?Q?XOaZYWeMydiBEm7tZss3foGzGQ844Nvw0WHt/BMnbYBB3jDYeFsjEh+YNnGZ?=
 =?us-ascii?Q?hGsxKxE2adAsq1sUJkEvBY7SeqbldddgUhtdpA4Qn9SkBaBnVXWHADwX4OB6?=
 =?us-ascii?Q?oB/0Nv74/yQVbCFSQKhNcIlxisKC/ri+aX5OPIXA?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d47b5ac7-4242-4759-ef3e-08dc1ccc6753
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB7726.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jan 2024 11:05:41.4460 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: K0hTNBYJSJEt8DeiF9fhJYT9AL7rQProyrTCd66WCzGX8zZyKmJpNqfT2PmJ5a3ZXEuiXCzm2MExR/9QiuaMlQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7607
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
Cc: "mripard@kernel.org" <mripard@kernel.org>,
 "lee@kernel.org" <lee@kernel.org>, "kherbst@redhat.com" <kherbst@redhat.com>,
 "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>,
 "dave.hansen@linux.intel.com" <dave.hansen@linux.intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>, "Huang, Ray" <Ray.Huang@amd.com>,
 "hpa@zytor.com" <hpa@zytor.com>, "airlied@gmail.com" <airlied@gmail.com>, "Xu,
 Colin" <Colin.Xu@amd.com>, "x86@kernel.org" <x86@kernel.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "mingo@redhat.com" <mingo@redhat.com>,
 "bcm-kernel-feedback-list@broadcom.com"
 <bcm-kernel-feedback-list@broadcom.com>,
 "matthew.auld@intel.com" <matthew.auld@intel.com>,
 "dakr@redhat.com" <dakr@redhat.com>, "Yang, Philip" <Philip.Yang@amd.com>,
 "SHANMUGAM, SRINIVASAN" <SRINIVASAN.SHANMUGAM@amd.com>,
 "daniel@ffwll.ch" <daniel@ffwll.ch>,
 Christian =?utf-8?Q?K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>, "Li,
 Huazeng" <Huazeng.Li@amd.com>, "bp@alien8.de" <bp@alien8.de>,
 "luto@kernel.org" <luto@kernel.org>,
 "rodrigo.vivi@intel.com" <rodrigo.vivi@intel.com>, "Zhang,
 GuoQing \(Sam\)" <GuoQing.Zhang@amd.com>, "Zhu, James" <James.Zhu@amd.com>,
 "surenb@google.com" <surenb@google.com>, "Liu, Monk" <Monk.Liu@amd.com>,
 "tvrtko.ursulin@linux.intel.com" <tvrtko.ursulin@linux.intel.com>, "Kuehling,
 Felix" <Felix.Kuehling@amd.com>, "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "tglx@linutronix.de" <tglx@linutronix.de>,
 "tzimmermann@suse.de" <tzimmermann@suse.de>, "Deucher,
 Alexander" <Alexander.Deucher@amd.com>,
 "akpm@linux-foundation.org" <akpm@linux-foundation.org>, "Koenig,
 Christian" <Christian.Koenig@amd.com>,
 "nirmoy.das@intel.com" <nirmoy.das@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


"Zhou, Xianrong" <Xianrong.Zhou@amd.com> writes:

> [AMD Official Use Only - General]
>
>> >>>>> The vmf_insert_pfn_prot could cause unnecessary double faults on a
>> >>>>> device pfn. Because currently the vmf_insert_pfn_prot does not
>> >>>>> make the pfn writable so the pte entry is normally read-only or
>> >>>>> dirty catching.
>> >>>> What? How do you got to this conclusion?
>> >>> Sorry. I did not mention that this problem only exists on arm64 platform.
>> >> Ok, that makes at least a little bit more sense.
>> >>
>> >>> Because on arm64 platform the PTE_RDONLY is automatically attached
>> >>> to the userspace pte entries even through VM_WRITE + VM_SHARE.
>> >>> The  PTE_RDONLY needs to be cleared in vmf_insert_pfn_prot. However
>> >>> vmf_insert_pfn_prot do not make the pte writable passing false
>> >>> @mkwrite to insert_pfn.
>> >> Question is why is arm64 doing this? As far as I can see they must
>> >> have some hardware reason for that.
>> >>
>> >> The mkwrite parameter to insert_pfn() was added by commit
>> >> b2770da642540 to make insert_pfn() look more like insert_pfn_pmd() so
>> >> that the DAX code can insert PTEs which are writable and dirty at the same
>> time.
>> >>
>> > This is one scenario to do so. In fact on arm64 there are many
>> > scenarios could be to do so. So we can let vmf_insert_pfn_prot
>> > supporting @mkwrite for drivers at core layer and let drivers to
>> > decide whether or not to make writable and dirty at one time. The
>> > patch did this. Otherwise double faults on arm64 when call
>> vmf_insert_pfn_prot.
>>
>> Well, that doesn't answer my question why arm64 is double faulting in the
>> first place,.
>>
>
>
> Eh.
>
> On arm64 When userspace mmap() with PROT_WRITE and MAP_SHARED the
> vma->vm_page_prot has the PTE_RDONLY and PTE_WRITE within
> PAGE_SHARED_EXEC. (seeing arm64 protection_map)
>
> When write the userspace virtual address the first fault happen and call
> into driver's .fault->ttm_bo_vm_fault_reserved->vmf_insert_pfn_prot->insert_pfn.
> The insert_pfn will establish the pte entry. However the vmf_insert_pfn_prot
> pass false @mkwrite to insert_pfn by default and so insert_pfn could not make
> the pfn writable and it do not call maybe_mkwrite(pte_mkdirty(entry), vma)
> to clear the PTE_RDONLY bit. So the pte entry is actually write protection for mmu.
> So when the first fault return and re-execute the store instruction the second
> fault happen again. And in second fault it just only do pte_mkdirty(entry) which
> clear the PTE_RDONLY.

It depends if the ARM64 CPU in question supports hardware dirty bit
management (DBM). If that is the case and PTE_DBM (ie. PTE_WRITE) is set
HW will automatically clear PTE_RDONLY bit to mark the entry dirty
instead of raising a write fault. So you shouldn't see a double fault if
PTE_DBM/WRITE is set.

On ARM64 you can kind of think of PTE_RDONLY as the HW dirty bit and
PTE_DBM as the read/write permission bit with SW being responsible for
updating PTE_RDONLY via the fault handler if DBM is not supported by HW.

At least that's my understanding from having hacked on this in the
past. You can see all this weirdness happening in the definitions of
pte_dirty() and pte_write() for ARM64.

> I think so and hope no wrong.
>
>> So as long as this isn't sorted out I'm going to reject this patch.
>>
>> Regards,
>> Christian.
>>
>> >
>> >> This is a completely different use case to what you try to use it
>> >> here for and that looks extremely fishy to me.
>> >>
>> >> Regards,
>> >> Christian.
>> >>
>> >>>>> The first fault only sets up the pte entry which actually is dirty
>> >>>>> catching. And the second immediate fault to the pfn due to first
>> >>>>> dirty catching when the cpu re-execute the store instruction.
>> >>>> It could be that this is done to work around some hw behavior, but
>> >>>> not because of dirty catching.
>> >>>>
>> >>>>> Normally if the drivers call vmf_insert_pfn_prot and also supply
>> >>>>> 'pfn_mkwrite' callback within vm_operations_struct which requires
>> >>>>> the pte to be dirty catching then the vmf_insert_pfn_prot and the
>> >>>>> double fault are reasonable. It is not a problem.
>> >>>> Well, as far as I can see that behavior absolutely doesn't make sense.
>> >>>>
>> >>>> When pfn_mkwrite is requested then the driver should use PAGE_COPY,
>> >>>> which is exactly what VMWGFX (the only driver using dirty tracking)
>> >>>> is
>> >> doing.
>> >>>> Everybody else uses PAGE_SHARED which should make the pte writeable
>> >>>> immediately.
>> >>>>
>> >>>> Regards,
>> >>>> Christian.
>> >>>>
>> >>>>> However the most of drivers calling vmf_insert_pfn_prot do not
>> >>>>> supply the 'pfn_mkwrite' callback so that the second fault is
>> unnecessary.
>> >>>>>
>> >>>>> So just like vmf_insert_mixed and vmf_insert_mixed_mkwrite pair,
>> >>>>> we should also supply vmf_insert_pfn_mkwrite for drivers as well.
>> >>>>>
>> >>>>> Signed-off-by: Xianrong Zhou <Xianrong.Zhou@amd.com>
>> >>>>> ---
>> >>>>>     arch/x86/entry/vdso/vma.c                  |  3 ++-
>> >>>>>     drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c    |  2 +-
>> >>>>>     drivers/gpu/drm/i915/gem/i915_gem_ttm.c    |  2 +-
>> >>>>>     drivers/gpu/drm/nouveau/nouveau_gem.c      |  2 +-
>> >>>>>     drivers/gpu/drm/radeon/radeon_gem.c        |  2 +-
>> >>>>>     drivers/gpu/drm/ttm/ttm_bo_vm.c            |  8 +++++---
>> >>>>>     drivers/gpu/drm/vmwgfx/vmwgfx_page_dirty.c |  8 +++++---
>> >>>>>     include/drm/ttm/ttm_bo.h                   |  3 ++-
>> >>>>>     include/linux/mm.h                         |  2 +-
>> >>>>>     mm/memory.c                                | 14 +++++++++++---
>> >>>>>     10 files changed, 30 insertions(+), 16 deletions(-)
>> >>>>>
>> >>>>> diff --git a/arch/x86/entry/vdso/vma.c b/arch/x86/entry/vdso/vma.c
>> >>>>> index 7645730dc228..dd2431c2975f 100644
>> >>>>> --- a/arch/x86/entry/vdso/vma.c
>> >>>>> +++ b/arch/x86/entry/vdso/vma.c
>> >>>>> @@ -185,7 +185,8 @@ static vm_fault_t vvar_fault(const struct
>> >>>> vm_special_mapping *sm,
>> >>>>>               if (pvti && vclock_was_used(VDSO_CLOCKMODE_PVCLOCK))
>> >>>> {
>> >>>>>                       return vmf_insert_pfn_prot(vma, vmf->address,
>> >>>>>                                       __pa(pvti) >> PAGE_SHIFT,
>> >>>>> -                                   pgprot_decrypted(vma-
>> >>>>> vm_page_prot));
>> >>>>> +                                   pgprot_decrypted(vma-
>> >>>>> vm_page_prot),
>> >>>>> +                                   true);
>> >>>>>               }
>> >>>>>       } else if (sym_offset == image->sym_hvclock_page) {
>> >>>>>               pfn = hv_get_tsc_pfn(); diff --git
>> >>>>> a/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
>> >>>>> b/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
>> >>>>> index 49a5f1c73b3e..adcb20d9e624 100644
>> >>>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
>> >>>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
>> >>>>> @@ -64,7 +64,7 @@ static vm_fault_t amdgpu_gem_fault(struct
>> >> vm_fault
>> >>>> *vmf)
>> >>>>>               }
>> >>>>>
>> >>>>>               ret = ttm_bo_vm_fault_reserved(vmf, vmf->vma-
>> >>>>> vm_page_prot,
>> >>>>> -                                          TTM_BO_VM_NUM_PREFAULT);
>> >>>>> +                                          TTM_BO_VM_NUM_PREFAULT,
>> >>>> true);
>> >>>>>               drm_dev_exit(idx);
>> >>>>>       } else {
>> >>>>> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
>> >>>>> b/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
>> >>>>> index 9227f8146a58..c6f13ae6c308 100644
>> >>>>> --- a/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
>> >>>>> +++ b/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
>> >>>>> @@ -1114,7 +1114,7 @@ static vm_fault_t vm_fault_ttm(struct
>> >>>>> vm_fault
>> >>>>> *vmf)
>> >>>>>
>> >>>>>       if (drm_dev_enter(dev, &idx)) {
>> >>>>>               ret = ttm_bo_vm_fault_reserved(vmf, vmf->vma-
>> >>>>> vm_page_prot,
>> >>>>> -                                          TTM_BO_VM_NUM_PREFAULT);
>> >>>>> +                                          TTM_BO_VM_NUM_PREFAULT,
>> >>>> true);
>> >>>>>               drm_dev_exit(idx);
>> >>>>>       } else {
>> >>>>>               ret = ttm_bo_vm_dummy_page(vmf, vmf->vma-
>> >>>>> vm_page_prot); diff --git a/drivers/gpu/drm/nouveau/nouveau_gem.c
>> >>>>> b/drivers/gpu/drm/nouveau/nouveau_gem.c
>> >>>>> index 49c2bcbef129..7e1453762ec9 100644
>> >>>>> --- a/drivers/gpu/drm/nouveau/nouveau_gem.c
>> >>>>> +++ b/drivers/gpu/drm/nouveau/nouveau_gem.c
>> >>>>> @@ -56,7 +56,7 @@ static vm_fault_t nouveau_ttm_fault(struct
>> >>>>> vm_fault
>> >>>>> *vmf)
>> >>>>>
>> >>>>>       nouveau_bo_del_io_reserve_lru(bo);
>> >>>>>       prot = vm_get_page_prot(vma->vm_flags);
>> >>>>> -   ret = ttm_bo_vm_fault_reserved(vmf, prot,
>> >>>> TTM_BO_VM_NUM_PREFAULT);
>> >>>>> +   ret = ttm_bo_vm_fault_reserved(vmf, prot,
>> >>>> TTM_BO_VM_NUM_PREFAULT,
>> >>>>> +true);
>> >>>>>       nouveau_bo_add_io_reserve_lru(bo);
>> >>>>>       if (ret == VM_FAULT_RETRY && !(vmf->flags &
>> >>>> FAULT_FLAG_RETRY_NOWAIT))
>> >>>>>               return ret;
>> >>>>> diff --git a/drivers/gpu/drm/radeon/radeon_gem.c
>> >>>>> b/drivers/gpu/drm/radeon/radeon_gem.c
>> >>>>> index 3fec3acdaf28..b21cf00ae162 100644
>> >>>>> --- a/drivers/gpu/drm/radeon/radeon_gem.c
>> >>>>> +++ b/drivers/gpu/drm/radeon/radeon_gem.c
>> >>>>> @@ -62,7 +62,7 @@ static vm_fault_t radeon_gem_fault(struct
>> >>>>> vm_fault
>> >>>> *vmf)
>> >>>>>               goto unlock_resv;
>> >>>>>
>> >>>>>       ret = ttm_bo_vm_fault_reserved(vmf, vmf->vma->vm_page_prot,
>> >>>>> -                                  TTM_BO_VM_NUM_PREFAULT);
>> >>>>> +                                  TTM_BO_VM_NUM_PREFAULT, true);
>> >>>>>       if (ret == VM_FAULT_RETRY && !(vmf->flags &
>> >>>> FAULT_FLAG_RETRY_NOWAIT))
>> >>>>>               goto unlock_mclk;
>> >>>>>
>> >>>>> diff --git a/drivers/gpu/drm/ttm/ttm_bo_vm.c
>> >>>>> b/drivers/gpu/drm/ttm/ttm_bo_vm.c index
>> >>>> 4212b8c91dd4..7d14a7d267aa
>> >>>>> 100644
>> >>>>> --- a/drivers/gpu/drm/ttm/ttm_bo_vm.c
>> >>>>> +++ b/drivers/gpu/drm/ttm/ttm_bo_vm.c
>> >>>>> @@ -167,6 +167,7 @@ EXPORT_SYMBOL(ttm_bo_vm_reserve);
>> >>>>>      * @num_prefault: Maximum number of prefault pages. The caller
>> >>>>> may
>> >>>> want to
>> >>>>>      * specify this based on madvice settings and the size of the GPU
>> object
>> >>>>>      * backed by the memory.
>> >>>>> + * @mkwrite: make the pfn or page writable
>> >>>>>      *
>> >>>>>      * This function inserts one or more page table entries pointing to the
>> >>>>>      * memory backing the buffer object, and then returns a return
>> >>>>> code @@ -180,7 +181,8 @@ EXPORT_SYMBOL(ttm_bo_vm_reserve);
>> >>>>>      */
>> >>>>>     vm_fault_t ttm_bo_vm_fault_reserved(struct vm_fault *vmf,
>> >>>>>                                   pgprot_t prot,
>> >>>>> -                               pgoff_t num_prefault)
>> >>>>> +                               pgoff_t num_prefault,
>> >>>>> +                               bool mkwrite)
>> >>>>>     {
>> >>>>>       struct vm_area_struct *vma = vmf->vma;
>> >>>>>       struct ttm_buffer_object *bo = vma->vm_private_data; @@
>> >>>>> -263,7
>> >>>>> +265,7 @@ vm_fault_t ttm_bo_vm_fault_reserved(struct vm_fault
>> >>>>> +*vmf,
>> >>>>>                * at arbitrary times while the data is mmap'ed.
>> >>>>>                * See vmf_insert_pfn_prot() for a discussion.
>> >>>>>                */
>> >>>>> -           ret = vmf_insert_pfn_prot(vma, address, pfn, prot);
>> >>>>> +           ret = vmf_insert_pfn_prot(vma, address, pfn, prot,
>> >>>>> + mkwrite);
>> >>>>>
>> >>>>>               /* Never error on prefaulted PTEs */
>> >>>>>               if (unlikely((ret & VM_FAULT_ERROR))) { @@ -312,7
>> >>>>> +314,7
>> >>>> @@
>> >>>>> vm_fault_t ttm_bo_vm_dummy_page(struct vm_fault *vmf, pgprot_t
>> >> prot)
>> >>>>>       /* Prefault the entire VMA range right away to avoid further faults */
>> >>>>>       for (address = vma->vm_start; address < vma->vm_end;
>> >>>>>            address += PAGE_SIZE)
>> >>>>> -           ret = vmf_insert_pfn_prot(vma, address, pfn, prot);
>> >>>>> +           ret = vmf_insert_pfn_prot(vma, address, pfn, prot,
>> >>>>> + true);
>> >>>>>
>> >>>>>       return ret;
>> >>>>>     }
>> >>>>> diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_page_dirty.c
>> >>>>> b/drivers/gpu/drm/vmwgfx/vmwgfx_page_dirty.c
>> >>>>> index 74ff2812d66a..bb8e4b641681 100644
>> >>>>> --- a/drivers/gpu/drm/vmwgfx/vmwgfx_page_dirty.c
>> >>>>> +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_page_dirty.c
>> >>>>> @@ -452,12 +452,14 @@ vm_fault_t vmw_bo_vm_fault(struct
>> vm_fault
>> >>>> *vmf)
>> >>>>>        * sure the page protection is write-enabled so we don't get
>> >>>>>        * a lot of unnecessary write faults.
>> >>>>>        */
>> >>>>> -   if (vbo->dirty && vbo->dirty->method ==
>> VMW_BO_DIRTY_MKWRITE)
>> >>>>> +   if (vbo->dirty && vbo->dirty->method ==
>> VMW_BO_DIRTY_MKWRITE)
>> >>>> {
>> >>>>>               prot = vm_get_page_prot(vma->vm_flags & ~VM_SHARED);
>> >>>>> -   else
>> >>>>> +           ret = ttm_bo_vm_fault_reserved(vmf, prot,
>> >>>>> + num_prefault,
>> >>>> false);
>> >>>>> +   } else {
>> >>>>>               prot = vm_get_page_prot(vma->vm_flags);
>> >>>>> +           ret = ttm_bo_vm_fault_reserved(vmf, prot,
>> >>>>> + num_prefault,
>> >>>> true);
>> >>>>> +   }
>> >>>>>
>> >>>>> -   ret = ttm_bo_vm_fault_reserved(vmf, prot, num_prefault);
>> >>>>>       if (ret == VM_FAULT_RETRY && !(vmf->flags &
>> >>>> FAULT_FLAG_RETRY_NOWAIT))
>> >>>>>               return ret;
>> >>>>>
>> >>>>> diff --git a/include/drm/ttm/ttm_bo.h b/include/drm/ttm/ttm_bo.h
>> >>>>> index 0223a41a64b2..66e293db69ee 100644
>> >>>>> --- a/include/drm/ttm/ttm_bo.h
>> >>>>> +++ b/include/drm/ttm/ttm_bo.h
>> >>>>> @@ -386,7 +386,8 @@ vm_fault_t ttm_bo_vm_reserve(struct
>> >>>> ttm_buffer_object *bo,
>> >>>>>                            struct vm_fault *vmf);
>> >>>>>     vm_fault_t ttm_bo_vm_fault_reserved(struct vm_fault *vmf,
>> >>>>>                                   pgprot_t prot,
>> >>>>> -                               pgoff_t num_prefault);
>> >>>>> +                               pgoff_t num_prefault,
>> >>>>> +                               bool mkwrite);
>> >>>>>     vm_fault_t ttm_bo_vm_fault(struct vm_fault *vmf);
>> >>>>>     void ttm_bo_vm_open(struct vm_area_struct *vma);
>> >>>>>     void ttm_bo_vm_close(struct vm_area_struct *vma); diff --git
>> >>>>> a/include/linux/mm.h b/include/linux/mm.h index
>> >>>>> f5a97dec5169..f8868e28ea04 100644
>> >>>>> --- a/include/linux/mm.h
>> >>>>> +++ b/include/linux/mm.h
>> >>>>> @@ -3553,7 +3553,7 @@ int vm_map_pages_zero(struct
>> >> vm_area_struct
>> >>>> *vma, struct page **pages,
>> >>>>>     vm_fault_t vmf_insert_pfn(struct vm_area_struct *vma, unsigned
>> >>>>> long
>> >>>> addr,
>> >>>>>                       unsigned long pfn);
>> >>>>>     vm_fault_t vmf_insert_pfn_prot(struct vm_area_struct *vma,
>> >>>>> unsigned
>> >>>> long addr,
>> >>>>> -                   unsigned long pfn, pgprot_t pgprot);
>> >>>>> +                   unsigned long pfn, pgprot_t pgprot, bool
>> >>>>> + mkwrite);
>> >>>>>     vm_fault_t vmf_insert_mixed(struct vm_area_struct *vma,
>> >>>>> unsigned long
>> >>>> addr,
>> >>>>>                       pfn_t pfn);
>> >>>>>     vm_fault_t vmf_insert_mixed_mkwrite(struct vm_area_struct
>> >>>>> *vma, diff --git a/mm/memory.c b/mm/memory.c index
>> >>>>> 7e1f4849463a..2c28f1a349ff
>> >>>>> 100644
>> >>>>> --- a/mm/memory.c
>> >>>>> +++ b/mm/memory.c
>> >>>>> @@ -2195,6 +2195,7 @@ static vm_fault_t insert_pfn(struct
>> >>>> vm_area_struct *vma, unsigned long addr,
>> >>>>>      * @addr: target user address of this page
>> >>>>>      * @pfn: source kernel pfn
>> >>>>>      * @pgprot: pgprot flags for the inserted page
>> >>>>> + * @mkwrite: make the pfn writable
>> >>>>>      *
>> >>>>>      * This is exactly like vmf_insert_pfn(), except that it allows drivers
>> >>>>>      * to override pgprot on a per-page basis.
>> >>>>> @@ -2223,7 +2224,7 @@ static vm_fault_t insert_pfn(struct
>> >>>> vm_area_struct *vma, unsigned long addr,
>> >>>>>      * Return: vm_fault_t value.
>> >>>>>      */
>> >>>>>     vm_fault_t vmf_insert_pfn_prot(struct vm_area_struct *vma,
>> >>>>> unsigned
>> >>>> long addr,
>> >>>>> -                   unsigned long pfn, pgprot_t pgprot)
>> >>>>> +                   unsigned long pfn, pgprot_t pgprot, bool
>> >>>>> + mkwrite)
>> >>>>>     {
>> >>>>>       /*
>> >>>>>        * Technically, architectures with pte_special can avoid all
>> >>>>> these @@ -2246,7 +2247,7 @@ vm_fault_t
>> vmf_insert_pfn_prot(struct
>> >>>> vm_area_struct *vma, unsigned long addr,
>> >>>>>       track_pfn_insert(vma, &pgprot, __pfn_to_pfn_t(pfn,
>> >>>>> PFN_DEV));
>> >>>>>
>> >>>>>       return insert_pfn(vma, addr, __pfn_to_pfn_t(pfn, PFN_DEV),
>> pgprot,
>> >>>>> -                   false);
>> >>>>> +                   mkwrite);
>> >>>>>     }
>> >>>>>     EXPORT_SYMBOL(vmf_insert_pfn_prot);
>> >>>>>
>> >>>>> @@ -2273,10 +2274,17 @@ EXPORT_SYMBOL(vmf_insert_pfn_prot);
>> >>>>>     vm_fault_t vmf_insert_pfn(struct vm_area_struct *vma, unsigned
>> >>>>> long
>> >>>> addr,
>> >>>>>                       unsigned long pfn)
>> >>>>>     {
>> >>>>> -   return vmf_insert_pfn_prot(vma, addr, pfn, vma->vm_page_prot);
>> >>>>> +   return vmf_insert_pfn_prot(vma, addr, pfn, vma->vm_page_prot,
>> >>>>> +false);
>> >>>>>     }
>> >>>>>     EXPORT_SYMBOL(vmf_insert_pfn);
>> >>>>>
>> >>>>> +vm_fault_t vmf_insert_pfn_mkwrite(struct vm_area_struct *vma,
>> >>>>> +unsigned
>> >>>> long addr,
>> >>>>> +                   unsigned long pfn) {
>> >>>>> +   return vmf_insert_pfn_prot(vma, addr, pfn, vma->vm_page_prot,
>> >>>> true);
>> >>>>> +} EXPORT_SYMBOL(vmf_insert_pfn_mkwrite);
>> >>>>> +
>> >>>>>     static bool vm_mixed_ok(struct vm_area_struct *vma, pfn_t pfn)
>> >>>>>     {
>> >>>>>       /* these checks mirror the abort conditions in
>> >>>>> vm_normal_page */

