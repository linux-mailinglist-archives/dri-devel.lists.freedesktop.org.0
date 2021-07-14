Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A73D63C84E7
	for <lists+dri-devel@lfdr.de>; Wed, 14 Jul 2021 14:58:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 75F3A89C55;
	Wed, 14 Jul 2021 12:58:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2049.outbound.protection.outlook.com [40.107.236.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA9A089971;
 Wed, 14 Jul 2021 12:58:35 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=X8V0+DttWIkg28DB7WNWL1Oj5eCrciDg7fYG+zcn1mgTbDDR0jJgOGckALJZl3QiwbkemeYruo+DKFhyY+FPDWsQQGMBiY8ktZ0vlzlPupDYkrkIDFh5ne4wGbkC8GQc0+LHTlasdYLHRW7A6gIcriMkKr2EJqQoI5UdHYIlbNH1vjuOedglw9YWllNi3y2tYc89LONy2RxNEyQ2MhcqioL09Xo7T5GRikGN3rDTeOXdIfyzCxj+EzOGXfWIaxV+NmbWPn/FVppfRRLAo0AmFHQVCkVgclYzCnOE6HzTLkwy0fi/DhIHfU7DrD3aV8Ka334r0iliZenZ7oPtxvmemQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SYYQtKm5dkRRogF9ic3g/jzJ/wKczdydkIKSDBA8Kn0=;
 b=gqT/J4hR6M4+cO7KEhbpOTeLfCmPBQ1/0sSkE89Q94qTkpeE0gGWEXGvKkS0mANg1oea3u/Rn7DlzxRyH0Gb3Xi+ZX2DVnYtnz5bw/ijx6MifwmWitbQvrSmUYT/dMDpUl74dR0ALmmEOZAkRBA0wrDX2pKJ4HDYi5eVD8eFq3pxs3OB2Uy+Yr+DlyOh+OeuK5zRv+be52dOJeV7cJyIkurRFjUb5iPEZfmdNJXQLEXsqOSfvfr6UL7p0N2hh8RtIGAchQJywtBm3dgMM+ZhsoZjIOSSu2uRuj0yOMXmqbR3VcWnxMoDbyxJMV2lt93KYmK//TaQ5hgTi3T08cqBZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SYYQtKm5dkRRogF9ic3g/jzJ/wKczdydkIKSDBA8Kn0=;
 b=Q3zI/QulZ7MBhqGE7Ts8XUhgkN4kKBjU1M/z/lrUqA+TAaJ2YwsAvXzo3+Z083fnIRDP83DXb3K9U1mXPNBRdHl7rG+6RqzHV1aZvagFFznCfBb0vY7xvqYDVar1g3dl81quSuUSiNPkUy+mlLNXfCKbBu+xh+khQqtNiiD9rUM=
Authentication-Results: linux.ie; dkim=none (message not signed)
 header.d=none;linux.ie; dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by BL0PR12MB4755.namprd12.prod.outlook.com (2603:10b6:208:82::26)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4308.22; Wed, 14 Jul
 2021 12:58:33 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::6c9e:1e08:7617:f756]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::6c9e:1e08:7617:f756%5]) with mapi id 15.20.4308.027; Wed, 14 Jul 2021
 12:58:33 +0000
Subject: Re: [PATCH v4 3/4] drm/shmem-helpers: Allocate wc pages on x86
To: Daniel Vetter <daniel@ffwll.ch>
References: <20210713205153.1896059-1-daniel.vetter@ffwll.ch>
 <20210713205153.1896059-4-daniel.vetter@ffwll.ch>
 <4626a7d7-95ca-104c-753a-07a9d83b0b28@amd.com>
 <YO7dKP2l9n0rLjDV@phenom.ffwll.local>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <31608068-97ba-70e7-b496-650bac88e0db@amd.com>
Date: Wed, 14 Jul 2021 14:58:26 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <YO7dKP2l9n0rLjDV@phenom.ffwll.local>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-ClientProxiedBy: AM0PR04CA0052.eurprd04.prod.outlook.com
 (2603:10a6:208:1::29) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:fe2b:fec6:eeb5:c7dc]
 (2a02:908:1252:fb60:fe2b:fec6:eeb5:c7dc) by
 AM0PR04CA0052.eurprd04.prod.outlook.com (2603:10a6:208:1::29) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4331.21 via Frontend Transport; Wed, 14 Jul 2021 12:58:31 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f5f70d9b-267c-43c5-720d-08d946c715ee
X-MS-TrafficTypeDiagnostic: BL0PR12MB4755:
X-Microsoft-Antispam-PRVS: <BL0PR12MB4755B93891AB55BE5BCA337E83139@BL0PR12MB4755.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 2QIvF9vSM+fU88zvGSmYy8+a5ve9DiOX5K9p5V8nc/6s/D1oQUIChyIpdqwYvRL7z8lGqEicOTXZYvOMKKNwSE2u01uexIUnfDn/s64jPT1mNx1V9ji+115mR7lmVpwd7mofXxCyJwiruTrwBX0L9DcPKDqD6iJdr+TIKCLxwUbR/h0RW4RBH/rzPf9V30wj4NzJRTygSmTAIffn/jd43gQFqHSluY32ng9H5XX09UM7YslYjUZ3wBA1qd8g4bFwB8txkl4Hq58wo24Kk1J9Z9eY6k8U9PElFNDtTV0bjCJHZ0pcCB9R5DHy5d4Ce/xYO3hwc/m2AMsP9ajTctBM0PGiLTM2sHzBqrkV4UwS3MKYOAIWrDUXVXlzoYiVoodKHt4C1l72lq9gptyLyoNRSFJTZYaElSRyWo1jNt9RRBFLkWTTR7ieeV4Ilc7bsyCitfNPqsirYBRd6ALbx+w8wFQn7Nim65xaBeuqR5i8tik93lLl3Qx9RtBVRm0W2mDsAeUXu43v+YG05S8OmfHsDfslTB7m6UIWZyWuZR2OC7elMwPUclyfvN2B9gxqNM6GjRnmLLUxiDAZilMkVvckVgGKVYDAY7jvLc3gz8lQU80dK25SFQAQHLrDg8rk5BzdvlvnGhVrATZAeNl8LAdsVr/6VemqLHTXL89AheOx9M9+yTYg+Fu1XEuYTV4W8Mvx96dtn8H44JFUSQxyLc+bp4Ul8Q2KtEbY/P8Tbl4oj1k=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(376002)(39850400004)(396003)(346002)(136003)(4326008)(83380400001)(31686004)(186003)(6486002)(54906003)(2616005)(31696002)(6666004)(2906002)(66476007)(8936002)(8676002)(66946007)(7416002)(66574015)(478600001)(6916009)(316002)(66556008)(36756003)(38100700002)(5660300002)(86362001)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?K3JNQVZiS042MVdRYkZCb29lUjZQZUxVemV3dE85ZWhJR2FrNEtrWUM4Y0hr?=
 =?utf-8?B?dC9LaGNoSDdPTEhtQmNaLzZubmN0dzVmRlB4MStpeHhLZVhXZmVCRWV1SGR4?=
 =?utf-8?B?cHF2Y3pvQkhIdHdOWi9Td2laTER0NGFSNjlUZTg5ODNVZ09PMkUzUDFubTRP?=
 =?utf-8?B?Rzg1RE54M2pSdFFnNTdXU3ArYitDU25KOUw2a2ZvUFIyK0ZUd1ZYcVo3c1B6?=
 =?utf-8?B?VGFBQzcxM1BKbHNMT3VXcDF6S2l5ZDBYR3RWRzlIOXBnaC9oNHdmcFBKS0ly?=
 =?utf-8?B?bC9tWmFaSkRYbXhka09IMzlSckprb1laTlIzUjY1SFQzNjl3NzFURWFzbjd5?=
 =?utf-8?B?RVJ2MVNHV3BWa1VWQmNpREpKa21tVjNtZThFam4xN0ZZT0dxbDEvSHdWWHBn?=
 =?utf-8?B?Q1U0K0tvS1BYRmI5WHFNaVlWcVF4LzFrOEgyS2FBSkx2dzUxUFdEVmVSQ29D?=
 =?utf-8?B?ZjBiK2h2RHRPMzlYOUNMb1dqV1NhMEVZcFNMR3g3V2E5TnZnck9JSXZvUUFQ?=
 =?utf-8?B?d01jeGwzOUZPcm9Mc0MyY0tET0FhSmtESm1IQmVBeEZDd3NnZTY3U0Rub0k2?=
 =?utf-8?B?NVMwUXByM1lNb29mVTBQZmV6ODhnakVZQkdENC9WMWV4RTZFMDJuL3ZEamRW?=
 =?utf-8?B?NlJqeCtIbm1aVTRCMG8zbGJmYU5lSDlQcE1LM1JIQ2RpN0VEQ1JLTXlyNy9q?=
 =?utf-8?B?endIQ1dUVHFSVWVjUUx2RUhBYTJJN3hUUWRwK1NVVVhzR1Y4d2pxNW1kWWZN?=
 =?utf-8?B?RjBIOTU2a1ZQbmJrc1NtSHU1TXRnNDE1U1VlZWQ1OGNzMzd6cHdrSEhUN2oy?=
 =?utf-8?B?QmJmTThNQ1kvWENEUFh5TFU0VmZtSWd1OHp6QVU0b3gxOW94NjdYQVFlRk5R?=
 =?utf-8?B?UTg0RXlPNjBzSW52WVRQdC9qMzN1Q3JiMEJQNmlzTlpKMGErZHgxYms4ajZj?=
 =?utf-8?B?eXBPZTJzSU50eHlrdVJoeGNoMG5jdm4yTnVneXZlV004WjFMVjFlTFNsRjIw?=
 =?utf-8?B?UU5nNU1JSTcwaVljdmxuVVVSMlB4NlNNVyt5ZWVYNzlOQTZ6NE05cCsrWVZu?=
 =?utf-8?B?bnkwZk9CT0FTNUR3U3dsUmhTdGo0bE5PYzdJTkw2VGxQUVBJZ2U5V0F2TldP?=
 =?utf-8?B?YVBwbzZlY1pPTXlxWnl4cGltSk9hWlBUcS9NdGtqT2R6OUlEbStsWnpBbVZs?=
 =?utf-8?B?ZWpSR0pVZGVPVklNN1kyZGRETllDazZyU20yOFM1QU9ydVFsd1BieDhMUGlQ?=
 =?utf-8?B?MEFwOUlRSnNKR1pNV3V2YmhVb2txSlE4SFFNSzhrR0UvS2wydzdpNElwVThs?=
 =?utf-8?B?SXgzWW0wdDE1SFdMMncyWCswQUM1ZHk1cUdzUTZPbk84VzREckxleEhIWU5i?=
 =?utf-8?B?NFcyTkNsekY0Q0Z4RU1UWHZVQ1lkaHBhTUVDOHM5enBra0tia1R6N21SNUtF?=
 =?utf-8?B?RFVPc2haVmNiVm9DeklmazVVRkxXSzdZYkFMc1BkYjU5TUFacStPcmtKSWpZ?=
 =?utf-8?B?VkU4dnZXVG5ZT0xzRExSNjlLWkFtd1JmWk4xMThGUXExQ1BMRjNKYkJ6MGZF?=
 =?utf-8?B?TFpUWGlzaHE5QkNWYWlOUWllVE9CS3lzeHg1eTBTbGQrTWtPMERnY0ZQNXdX?=
 =?utf-8?B?ci8xVlZBc2c0UCs1d1ZlTWZPZmxLZ0xPYWRjS0k2dlFDLysvc1ZmR1RMUEJ3?=
 =?utf-8?B?WS9jOXpSUkEzcnpOVmo4NjJLWWwzRTRGY1k5QXEralJWUG1vVjArdmRTT0or?=
 =?utf-8?B?aHRxU0h1ampuNmUzbTRyNUQ0L3YxaWM3SEpkYVMvU3J4cW5WNEE5emtqTUt4?=
 =?utf-8?B?VDVXUFJmeDk1RVpnaGVUQVdrbk0wMnhWNTRjVVJoVU9HVjJrUDZaUUFWVUNk?=
 =?utf-8?Q?3Gg7s24J7ETVc?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f5f70d9b-267c-43c5-720d-08d946c715ee
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jul 2021 12:58:33.1719 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9jSdJaIV6NpnrTmFbR+PGYXgSH3aZ8P7A+ecb6noXiutwOmi2Bcz/nhvGMFRadgO
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB4755
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
Cc: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Daniel Vetter <daniel.vetter@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 14.07.21 um 14:48 schrieb Daniel Vetter:
> On Wed, Jul 14, 2021 at 01:54:50PM +0200, Christian König wrote:
>> Am 13.07.21 um 22:51 schrieb Daniel Vetter:
>>> intel-gfx-ci realized that something is not quite coherent anymore on
>>> some platforms for our i915+vgem tests, when I tried to switch vgem
>>> over to shmem helpers.
>>>
>>> After lots of head-scratching I realized that I've removed calls to
>>> drm_clflush. And we need those. To make this a bit cleaner use the
>>> same page allocation tooling as ttm, which does internally clflush
>>> (and more, as neeeded on any platform instead of just the intel x86
>>> cpus i915 can be combined with).
>>>
>>> Unfortunately this doesn't exist on arm, or as a generic feature. For
>>> that I think only the dma-api can get at wc memory reliably, so maybe
>>> we'd need some kind of GFP_WC flag to do this properly.
>> The problem is that this stuff is extremely architecture specific. So GFP_WC
>> and GFP_UNCACHED are really what we should aim for in the long term.
>>
>> And as far as I know we have at least the following possibilities how it is
>> implemented:
>>
>> * A fixed amount of registers which tells the CPU the caching behavior for a
>> memory region, e.g. MTRR.
>> * Some bits of the memory pointers used, e.g. you see the same memory at
>> different locations with different caching attributes.
>> * Some bits in the CPUs page table.
>> * Some bits in a separate page table.
>>
>> On top of that there is the PCIe specification which defines non-cache
>> snooping access as an extension.
> Yeah dma-buf is extremely ill-defined even on x86 if you combine these
> all. We just play a game of whack-a-mole with the cacheline dirt until
> it's gone.
>
> That's the other piece here, how do you even make sure that the page is
> properly flushed and ready for wc access:
> - easy case is x86 with clflush available pretty much everywhere (since
>    10+ years at least)
> - next are cpus which have some cache flush instructions, but it's highly
>    cpu model specific
> - next up is the same, but you absolutely have to make sure there's no
>    other mapping around anymore or the coherency fabric just dies
> - and I'm pretty sure there's worse stuff where you defacto can only
>    allocate wc memory that's set aside at boot-up and that's all you ever
>    get.

Well long story short you don't make sure that the page is flushed at all.

What you do is to allocate the page as WC in the first place, if you 
fail to do this you can't use it.

The whole idea TTM try to sell until a while ago that you can actually 
change that on the fly only works on x86 and even there only very very 
limited.

Cheers,
Christian.

>
> Cheers, Daniel
>
>> Mixing that with the CPU caching behavior gets you some really nice ways to
>> break a driver. In general x86 seems to be rather graceful, but arm and
>> PowerPC are easily pissed if you mess that up.
>>
>>> Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
>>> Cc: Christian König <christian.koenig@amd.com>
>>> Cc: "Thomas Hellström" <thomas.hellstrom@linux.intel.com>
>>> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
>>> Cc: Maxime Ripard <mripard@kernel.org>
>>> Cc: Thomas Zimmermann <tzimmermann@suse.de>
>>> Cc: David Airlie <airlied@linux.ie>
>>> Cc: Daniel Vetter <daniel@ffwll.ch>
>> Acked-by: Christian könig <christian.koenig@amd.com>
>>
>> Regards,
>> Christian.
>>
>>> ---
>>>    drivers/gpu/drm/drm_gem_shmem_helper.c | 14 ++++++++++++++
>>>    1 file changed, 14 insertions(+)
>>>
>>> diff --git a/drivers/gpu/drm/drm_gem_shmem_helper.c b/drivers/gpu/drm/drm_gem_shmem_helper.c
>>> index 296ab1b7c07f..657d2490aaa5 100644
>>> --- a/drivers/gpu/drm/drm_gem_shmem_helper.c
>>> +++ b/drivers/gpu/drm/drm_gem_shmem_helper.c
>>> @@ -10,6 +10,10 @@
>>>    #include <linux/slab.h>
>>>    #include <linux/vmalloc.h>
>>> +#ifdef CONFIG_X86
>>> +#include <asm/set_memory.h>
>>> +#endif
>>> +
>>>    #include <drm/drm.h>
>>>    #include <drm/drm_device.h>
>>>    #include <drm/drm_drv.h>
>>> @@ -162,6 +166,11 @@ static int drm_gem_shmem_get_pages_locked(struct drm_gem_shmem_object *shmem)
>>>    		return PTR_ERR(pages);
>>>    	}
>>> +#ifdef CONFIG_X86
>>> +	if (shmem->map_wc)
>>> +		set_pages_array_wc(pages, obj->size >> PAGE_SHIFT);
>>> +#endif
>>> +
>>>    	shmem->pages = pages;
>>>    	return 0;
>>> @@ -203,6 +212,11 @@ static void drm_gem_shmem_put_pages_locked(struct drm_gem_shmem_object *shmem)
>>>    	if (--shmem->pages_use_count > 0)
>>>    		return;
>>> +#ifdef CONFIG_X86
>>> +	if (shmem->map_wc)
>>> +		set_pages_array_wb(shmem->pages, obj->size >> PAGE_SHIFT);
>>> +#endif
>>> +
>>>    	drm_gem_put_pages(obj, shmem->pages,
>>>    			  shmem->pages_mark_dirty_on_put,
>>>    			  shmem->pages_mark_accessed_on_put);

