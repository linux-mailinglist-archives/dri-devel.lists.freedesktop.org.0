Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A4EBF3ACDBE
	for <lists+dri-devel@lfdr.de>; Fri, 18 Jun 2021 16:42:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 97A306EA28;
	Fri, 18 Jun 2021 14:42:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam08on2070.outbound.protection.outlook.com [40.107.102.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D8836E0A5;
 Fri, 18 Jun 2021 14:42:44 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gvuF4HE2u32ztV5F3bqAPoqDxtcLBgEKC7uZwIrl1aV9/X0dAHTzeiPMQufvTZKoorc6/F2Rk6GL0VPxNUf00/L12+lOoD0BGQ6nhg7BgBSczjcgm6MtW5Y7BQ0RoSkwOrtR3pV+wTUWs9MDYFBfG1o4vyfb0D0PJtHcpiW5Fcoo3W5nN6xPAOzam/VUnlxnT1E1fkBsSrC7q7p4Fw8n8OkwLTKgwbq1RZIwhBbcs59gW4cRBHqIyLJPz79jpMk390P0xo7z3XqPnUj5XJAsbqFEbkoQSLSMGHOOz7Pbrry2a+Bt92XYHzdSNDH9gM3ZcrM2w5/LFDt/ABvvDmuRBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=d5NxQil4tL4mHEzjaZyll7jwiW/BBwRsx/pw8YxneLY=;
 b=DOnKdDmutOsysUoMJ9n9pUBj9RU2euoQzsDdIpmbcNjLUlsiyr9A/TLoxS+xlrI+JLZRTsTnclt8fCw7TtjhoY6HpD+QGCU+kg37mvFouDe5vPBQqpvPTJT5eTBoa5mpCPByXlUeuqz3wbkDvZecRZpUvdkB1K4f92T3sJIuQVjSkEz+VuUrv6iszoLgI5JbVY3+HKPIZUCJMir7ZCuIMtnOowIWrSRHpHXEa5+LxRTNMSMfKGnEje6erofBo7DARXVPbJZT3hentISNDg6Z6eOD5K/S0jgy5Nwd5f/WCOLoWoGOOujOZCKS1pjQi0mrrpMmeTpnkO9o3yCrcOKtaQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=d5NxQil4tL4mHEzjaZyll7jwiW/BBwRsx/pw8YxneLY=;
 b=h2yozHl0ZUe8JX2Carg4/36eaWFb0AZFSksjmUYAnlELPV9VjRtRtbCcULz8T0Id2p70diJVlG1I06GF4MV+xV1lGX42ZcbeZvZqXeg5xWRnsWa0Iz+5kbNOfOjM5of1MgmMA6HqLLu8Vr+m7HErmUuISqkqLCCxJ00l0an45p8=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by BL0PR12MB2450.namprd12.prod.outlook.com (2603:10b6:207:4d::32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4242.19; Fri, 18 Jun
 2021 14:42:41 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::6c9e:1e08:7617:f756]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::6c9e:1e08:7617:f756%5]) with mapi id 15.20.4242.021; Fri, 18 Jun 2021
 14:42:41 +0000
Subject: Re: [Mesa-dev] [PATCH 0/6] dma-buf: Add an API for exporting sync
 files (v12)
To: Daniel Vetter <daniel@ffwll.ch>
References: <20210610210925.642582-1-jason@jlekstrand.net>
 <29e9795e-8ec7-282c-c8ec-413eaed2e4d4@gmail.com>
 <CAOFGe94oFA9=vy56--hm=9=232+Npnxrpn+6gGFpRM2dmJZh3w@mail.gmail.com>
 <84135114-71d4-77f0-7a6b-69bb81b7f73c@amd.com>
 <YMupgTffAfw8xw51@phenom.ffwll.local>
 <e8fc12a3-42eb-30f9-c6ac-772fbc675678@amd.com>
 <CAKMK7uH5oW3icBPOPsumRv+LJ-5qCVKgfniXd-J8mnA+JuRq+Q@mail.gmail.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <53c1c0c2-5e17-a54f-155b-66f3cd4b48a3@amd.com>
Date: Fri, 18 Jun 2021 16:42:34 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
In-Reply-To: <CAKMK7uH5oW3icBPOPsumRv+LJ-5qCVKgfniXd-J8mnA+JuRq+Q@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Originating-IP: [2a02:908:1252:fb60:b0f0:9fd4:3f12:5517]
X-ClientProxiedBy: PR0P264CA0075.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:100:18::15) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:b0f0:9fd4:3f12:5517]
 (2a02:908:1252:fb60:b0f0:9fd4:3f12:5517) by
 PR0P264CA0075.FRAP264.PROD.OUTLOOK.COM (2603:10a6:100:18::15) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4242.18 via Frontend Transport; Fri, 18 Jun 2021 14:42:39 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c132e2dc-a51c-45bb-acf6-08d932675345
X-MS-TrafficTypeDiagnostic: BL0PR12MB2450:
X-Microsoft-Antispam-PRVS: <BL0PR12MB2450DEAED807409501EF72DB830D9@BL0PR12MB2450.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: uNJbcdp9cRn0wyFTno1Ak4Vj250+R+wNPbYa8jnn8TnCFSRV//wpEsw+uHijLADYJtslppVD0jumj5V+7mbFhAH2+0/sRQGBCw5wV9g25ySL9xAFiT88ARxTHzQ5M66Cgads1N+gdn17AEymNAQc9ISloyfkbH4Yq2VwVy367/BdejTaYHgUSUCM72yH7yCBBDK8hYTeqoksziMXeYybIiqQh8vY9Za9rw9uym8dzwZ1KJXWkwB49PtKatRCc6LKxNm3SvJspaGmvm7HjiQjjHY4ZrfKHzGFdJY24ns5gkWyBSOy4l/eRygxE2tz8O+jLPSs/juZHAvEqeM0MvMprVTs5k8qozMfGQWIQJFM4uBcXXBQJZDCfdb8YprtV9ridNtnUleK5d6Ku8bsXIsGPbz5OU00DZAgjcHTKy6KXyoJ/EA2FD8u6AkNEaV3Je/p8rFYFx7MABckLu/mD0I5dzX70NhD6fxX09qzmla9LbzZw5lXEWKGFKcjrNZL+/ZbOvncguHhy0gBwyBuJ/9UdGURrjwTOBRrIhtWPRE9OgSBah9uS/iIlV67BC+wwTtyFenWIXey6VuxB3SQ4vYu+xOwsxek6qTO4KfftF3X4F9H4D6c6OLCfDhtJQwGhyydiZXtAD/TcKLgOxDONcRbZM9IJALZrsQhfrn5IjX+IT1c+uqObbQ1jLYwKO7JuzIegaBbbLts8W38H9i/qzUeFWMFPRdTtip85IV2/WagqW0=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(366004)(396003)(136003)(39860400002)(346002)(966005)(6486002)(478600001)(316002)(8936002)(31696002)(8676002)(54906003)(66574015)(38100700002)(36756003)(2616005)(30864003)(186003)(4326008)(6666004)(45080400002)(5660300002)(16526019)(66946007)(66476007)(86362001)(66556008)(31686004)(2906002)(6916009)(83380400001)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dWRwcXFWUUdHUzBHV2ZDQytudVEzNjltczMvRVR2S0xkMEFSbTQrQkdNd3h0?=
 =?utf-8?B?eWFXOTNETCtFNjBkQnhtQlp2eFh6YjdTVjN3ZVBkZ09Qb1JlY2hENXRZZm0w?=
 =?utf-8?B?Vmg2M2VlTG1rOWx0Wk00bzJoMnZQem02TlRXTVZlRFZCOXZiOUcycUFoblla?=
 =?utf-8?B?RDZnSlBBQUNmV2U4R3lmQmFsYkt4bkw3UkdmWnlGVzgvUEJ3T3hpZWFXd0tD?=
 =?utf-8?B?MjhDN0MyYzFDQzBhUlMyK2k0ZVEra1VEdEtaWnJjN3J0dXVaeS83Z0s4b3Ry?=
 =?utf-8?B?b0xLQkF5MFJTU092UWN2QWY2bEVLR2pWa2pHVDhJVjBNc1hwZ3M3bC9HU2h4?=
 =?utf-8?B?Y1pqQjdpdU4yNHkrMlNxVWFEWmNjODd0L0t1cVdBZ3JYalZXVnRlNGdYNUgy?=
 =?utf-8?B?cW53TVFEZXd6V3pOL1A2d3hmdzMrNDJqTXZZWWFscHZES1dOc1dZaEN1MlQz?=
 =?utf-8?B?OXRMejBoRFVCaHROSXozYmQ0UWNZVStwaER3NHRLK2lxaUNBT0FqSVA3Z3Vi?=
 =?utf-8?B?OGo2YjNhM3BKc3cyelo2K3MrOHlRbVZRbzNsTWVLUVdYMmZqd0ZWNThURWl3?=
 =?utf-8?B?dFJJTTNUc3BULzV3cC96aGZ0RnRwbm5DL2ZpWndzQ09RbE9vS3gyZ0MvT2tT?=
 =?utf-8?B?VHhKVjc4WTdMcC9MMUVXM0V4bTh4RmJ1SjlCKzYxZHhuUmF3RTloTzA1WEdk?=
 =?utf-8?B?NkF6c2l1VzdrQWlBYmRXYStKUjFXVDdsUUJTM29FdXV5eVB4dTNtNmhhbXJX?=
 =?utf-8?B?K244VVkxaXRqcnUvTG9nZWgwaHMvbDFaYUFNUGM3eFhvaU4vQVhjc1IwNnpm?=
 =?utf-8?B?cUtUNzZHR2xOZ3V3bmd3NjZsai9JZCs5d0E2dnZmaHppeHdVRHdHcmVDUGtt?=
 =?utf-8?B?cHZCTzdId3J5M1ZwYnVmWDVidllkR1NldUh5ZlhtQjZKbVlESVlwN3JMS3RC?=
 =?utf-8?B?bXNzU1Nja2RnY1lrRUdIb2h5dWFRMnRxdG40NGt0Zi9nRzlMWHlCZkxqeVJU?=
 =?utf-8?B?M0ZXUk1qMDdUS2RxVDhuZGZWVUJJZHhWZmQyZ3JzRVhEeDFNUS9qMG9UVWFx?=
 =?utf-8?B?ck1LTmFSM1RzeE1zU2lNcS9HRGthckpDVXpDam9VN2tmRm8rZ2NROXZuNXQ1?=
 =?utf-8?B?ejF2NGN4bVVLb2FjUzFJc052aVVhUGNmczJHR3FzdjhlaFpXclcyS1IxN1FM?=
 =?utf-8?B?aDBIK1FVQlpIaVV3YjJLMUQ2RkRjYmRlV3NDSmhuVzZnY0pVa0pWV2QwSkdO?=
 =?utf-8?B?VzdoU0VUQ1VKbWNUSWorb09Uak1pUXZwUGs2MlNsKzBDbjFIRENQS1A5ZGpy?=
 =?utf-8?B?aTNUZk9GdXBQYlFXVUhQZk9TK2xvajBXajJsa2NZODdFQWQ5aDRScFVuZzdN?=
 =?utf-8?B?bjFDQlJyRDJId1IyUXRJV0E3cFRaMzVEang3WmNBSUwwWm9TQk1VRktJSUtk?=
 =?utf-8?B?OWVBL0N0VEltbjdZUEI4S0hjdFdSL3ZrQVJTemVCbWtBRFI2SDBrQ3E3amxM?=
 =?utf-8?B?RGVTcUNSRUlpSXNpQVF2cm9DSkpEMUtCUXJJMUZaODdGT1labXc4b3NQVXJX?=
 =?utf-8?B?bGZsVlhqTG9tRitnQmtaODFyZWpmcldOVUxBZ2FiMWRocW1zQjBzL3VvekFV?=
 =?utf-8?B?OWUxNlQ5U1dHdW9ZOEVrUGdxNmdOUW5Vcm03WkVrNm54OGhrOXN5Z2dVNnRa?=
 =?utf-8?B?Z25ZbFozVktOLzNRQ0c1RHVoVzZoUHluT2hiUXhwWUdpZGFtRGc4MkxpSlB5?=
 =?utf-8?B?WmZ6Y3UzOXhWdXpxNGFPQzlnNEM0Y0lucVJiaXowa2F0L0lJbm83VTF2UUg5?=
 =?utf-8?B?ekhVSUJxZndsblVIcVRRNjdGcEpTU3VkZUNTMk5zSDgxUFU0dUkrK0JXT2ZJ?=
 =?utf-8?Q?I81ZslyxignaG?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c132e2dc-a51c-45bb-acf6-08d932675345
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jun 2021 14:42:41.1960 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kA64gkLm7flEx4M6IKZc7UGe6LBKSwu2X+IPcutoW73wOznMJp96NNLeNOsIivyi
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB2450
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
Cc: Daniel Stone <daniels@collabora.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>,
 =?UTF-8?Q?Michel_D=c3=a4nzer?= <michel@daenzer.net>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 "wayland-devel @ lists . freedesktop . org"
 <wayland-devel@lists.freedesktop.org>, Jason Ekstrand <jason@jlekstrand.net>,
 Dave Airlie <airlied@redhat.com>, ML mesa-dev <mesa-dev@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 18.06.21 um 16:31 schrieb Daniel Vetter:
> [SNIP]
>> And that drivers choose to ignore the exclusive fence is an absolutely
>> no-go from a memory management and security point of view. Exclusive
>> access means exclusive access. Ignoring that won't work.
> Yeah, this is why I've been going all over the place about lifting
> ttm_bo->moving to dma_resv. And also that I flat out don't trust your
> audit, if you havent found these drivers then very clearly you didn't
> audit much at all :-)

I just didn't though that anybody could be so stupid to allow such a 
thing in.

>> The only thing which saved us so far is the fact that drivers doing this
>> are not that complex.
>>
>> BTW: How does it even work? I mean then you would run into the same
>> problem as amdgpu with its page table update fences, e.g. that your
>> shared fences might signal before the exclusive one.
> So we don't ignore any fences when we rip out the backing storage.
>
> And yes there's currently a bug in all these drivers that if you set
> both the "ignore implicit fences" and the "set the exclusive fence"
> flag, then we just break this. Which is why I think we want to have a
> dma_fence_add_shared_exclusive() helper extracted from your amdgpu
> code, which we can then use everywhere to plug this.

Daniel are you realizing what you are talking about here? Does that also 
apply for imported DMA-bufs?

If yes than that is a security hole you can push an elephant through.

Can you point me to the code using that?

>>> For dma-buf this isn't actually a problem, because dma-buf are pinned. You
>>> can't move them while other drivers are using them, hence there's not
>>> actually a ttm_bo->moving fence we can ignore.
>>>
>>> p2p dma-buf aka dynamic dma-buf is a different beast, and i915 (and fwiw
>>> these other drivers) need to change before they can do dynamic dma-buf.
>>>
>>>> Otherwise we have an information leak worth a CVE and that is certainly not
>>>> something we want.
>>> Because yes otherwise we get a CVE. But right now I don't think we have
>>> one.
>> Yeah, agree. But this is just because of coincident and not because of
>> good engineering :)
> Well the good news is that I think we're now talking slightly less
> past each another than the past few weeks :-)
>
>>> We do have a quite big confusion on what exactly the signaling ordering is
>>> supposed to be between exclusive and the collective set of shared fences,
>>> and there's some unifying that needs to happen here. But I think what
>>> Jason implements here in the import ioctl is the most defensive version
>>> possible, so really can't break any driver. It really works like you have
>>> an ad-hoc gpu engine that does nothing itself, but waits for the current
>>> exclusive fence and then sets the exclusive fence with its "CS" completion
>>> fence.
>>>
>>> That's imo perfectly legit use-case.
>> The use case is certainly legit, but I'm not sure if merging this at the
>> moment is a good idea.
>>
>> Your note that drivers are already ignoring the exclusive fence in the
>> dma_resv object was eye opening to me. And I now have the very strong
>> feeling that the synchronization and the design of the dma_resv object
>> is even more messy then I thought it is.
>>
>> To summarize we can be really lucky that it didn't blow up into our
>> faces already.
> I don't think there was that much luck involved (ok I did find a
> possible bug in i915 already around cpu cache flushing) - for SoC the
> exclusive slot in dma_resv really is only used for implicit sync and
> nothing else. The fun only starts when you throw in pipelined backing
> storage movement.
>
> I guess this also explains why you just seemed to ignore me when I was
> asking for a memory management exclusive fence for the p2p stuff, or
> some other way to specifically handling movements (like ttm_bo->moving
> or whatever it is). From my pov we clearly needed that to make p2p
> dma-buf work well enough, mixing up the memory management exclusive
> slot with the implicit sync exclusive slot never looked like a bright
> idea to me.
>
> I think at least we now have some understanding here.

Well to be honest what you have just told me means that i915 is 
seriously broken.

Ignoring the exclusive fence on an imported DMA-buf is an absolutely 
*NO-GO* even without P2P.

What you have stitched together here allows anybody to basically read 
any memory on the system with both i915 and nouveau, radeon or amdgpu.

We need to fix that ASAP!

Regards,
Christian.

>>> Same for the export one. Waiting for a previous snapshot of implicit
>>> fences is imo perfectly ok use-case and useful for compositors - client
>>> might soon start more rendering, and on some drivers that always results
>>> in the exclusive slot being set, so if you dont take a snapshot you
>>> oversync real bad for your atomic flip.
>> The export use case is unproblematic as far as I can see.
>>
>>>>> Those changes are years in the past.  If we have a real problem here (not sure on
>>>>> that yet), then we'll have to figure out how to fix it without nuking
>>>>> uAPI.
>>>> Well, that was the basic idea of attaching flags to the fences in the
>>>> dma_resv object.
>>>>
>>>> In other words you clearly denote when you have to wait for a fence before
>>>> accessing a buffer or you cause a security issue.
>>> Replied somewhere else, and I do kinda like the flag idea. But the problem
>>> is we first need a ton more encapsulation and review of drivers before we
>>> can change the internals. One thing at a time.
>> Ok how should we then proceed?
>>
>> The large patch set I've send out to convert all users of the shared
>> fence list to a for_each API is a step into the right direction I think,
>> but there is still a bit more todo.
> Yeah I had noted that as "need to review". But I think we should be
> even more aggressive with encapsulation (at least where it doesn't
> matter that much from a perf pov). Like my suggestion for dma_buf_poll
> to not open-code the entire dance, but just use a snapshot thing. But
> I'll check out next week what you cooked up with the iterator.
>
>>> And yes for amdgpu this gets triple-hard because you both have the
>>> ttm_bo->moving fence _and_ the current uapi of using fence ownership _and_
>>> you need to figure out how to support vulkan properly with true opt-in
>>> fencing.
>> Well I have been pondering on that for a bit and I came to the
>> conclusion that it is actually not a problem at all.
>>
>> See radeon, nouveau, msm etc... all implement functions that they don't
>> wait for fences from the same timeline, context, engine. That amdgpu
>> doesn't wait for fences from the same process can be seen as just a
>> special case of this.
> Oh that part isn't a fundamental design issue, internally you can do
> whatever uapi you want. All I meant to say is because you currently
> have this uapi, but not yet flags to control things more explicitly,
> it's going to be more tricky code for amdgpu than for other drivers to
> keep it all working. But not impossible, just more code.
>
>>>    I'm pretty sure it's doable, I'm just not finding any time
>>> anywhere to hack on these patches - too many other fires :-(
>> Well I'm here. Let's just agree on the direction and I can do the coding.
>>
>> What I need help with is all the auditing. For example I still haven't
>> wrapped my head around how i915 does the synchronization.
> Yeah the auditing is annoying, and i915 is definitely butchered in
> some ways. I'm currently screaming at silly bugs in the i915
> relocation code (it was tuned a bit more than makes sense, and
> acquired a pile of bugs due to that), but after that I should have
> time to refresh the old series. That one audits the setting of
> dma_resv fences fully, and I half-started with the
> dependency/scheduler side too. There's going to be a few fixed needed
> there.
> -Daniel
>
>> Best regards,
>> Christian.
>>
>>> Cheers, Daniel
>>>
>>>> Christian.
>>>>
>>>>> --Jason
>>>>>
>>>>>
>>>>>> Regards,
>>>>>> Christian.
>>>>>>
>>>>>> Am 10.06.21 um 23:09 schrieb Jason Ekstrand:
>>>>>>> Modern userspace APIs like Vulkan are built on an explicit
>>>>>>> synchronization model.  This doesn't always play nicely with the
>>>>>>> implicit synchronization used in the kernel and assumed by X11 and
>>>>>>> Wayland.  The client -> compositor half of the synchronization isn't too
>>>>>>> bad, at least on intel, because we can control whether or not i915
>>>>>>> synchronizes on the buffer and whether or not it's considered written.
>>>>>>>
>>>>>>> The harder part is the compositor -> client synchronization when we get
>>>>>>> the buffer back from the compositor.  We're required to be able to
>>>>>>> provide the client with a VkSemaphore and VkFence representing the point
>>>>>>> in time where the window system (compositor and/or display) finished
>>>>>>> using the buffer.  With current APIs, it's very hard to do this in such
>>>>>>> a way that we don't get confused by the Vulkan driver's access of the
>>>>>>> buffer.  In particular, once we tell the kernel that we're rendering to
>>>>>>> the buffer again, any CPU waits on the buffer or GPU dependencies will
>>>>>>> wait on some of the client rendering and not just the compositor.
>>>>>>>
>>>>>>> This new IOCTL solves this problem by allowing us to get a snapshot of
>>>>>>> the implicit synchronization state of a given dma-buf in the form of a
>>>>>>> sync file.  It's effectively the same as a poll() or I915_GEM_WAIT only,
>>>>>>> instead of CPU waiting directly, it encapsulates the wait operation, at
>>>>>>> the current moment in time, in a sync_file so we can check/wait on it
>>>>>>> later.  As long as the Vulkan driver does the sync_file export from the
>>>>>>> dma-buf before we re-introduce it for rendering, it will only contain
>>>>>>> fences from the compositor or display.  This allows to accurately turn
>>>>>>> it into a VkFence or VkSemaphore without any over- synchronization.
>>>>>>>
>>>>>>> This patch series actually contains two new ioctls.  There is the export
>>>>>>> one mentioned above as well as an RFC for an import ioctl which provides
>>>>>>> the other half.  The intention is to land the export ioctl since it seems
>>>>>>> like there's no real disagreement on that one.  The import ioctl, however,
>>>>>>> has a lot of debate around it so it's intended to be RFC-only for now.
>>>>>>>
>>>>>>> Mesa MR: https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Fgitlab.freedesktop.org%2Fmesa%2Fmesa%2F-%2Fmerge_requests%2F4037&amp;data=04%7C01%7Cchristian.koenig%40amd.com%7C841231ea3c6e43f2141208d93265bfe7%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637596234879170817%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=kDEQr7d7fbba6938tZoERXN6hlOyKMdVjgY5U4ux4iI%3D&amp;reserved=0
>>>>>>> IGT tests: https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Fpatchwork.freedesktop.org%2Fseries%2F90490%2F&amp;data=04%7C01%7Cchristian.koenig%40amd.com%7C841231ea3c6e43f2141208d93265bfe7%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637596234879170817%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=MM5c55nspWbUxzajqBv1iNHdz2TYAImG2XPOSnDE6qQ%3D&amp;reserved=0
>>>>>>>
>>>>>>> v10 (Jason Ekstrand, Daniel Vetter):
>>>>>>>      - Add reviews/acks
>>>>>>>      - Add a patch to rename _rcu to _unlocked
>>>>>>>      - Split things better so import is clearly RFC status
>>>>>>>
>>>>>>> v11 (Daniel Vetter):
>>>>>>>      - Add more CCs to try and get maintainers
>>>>>>>      - Add a patch to document DMA_BUF_IOCTL_SYNC
>>>>>>>      - Generally better docs
>>>>>>>      - Use separate structs for import/export (easier to document)
>>>>>>>      - Fix an issue in the import patch
>>>>>>>
>>>>>>> v12 (Daniel Vetter):
>>>>>>>      - Better docs for DMA_BUF_IOCTL_SYNC
>>>>>>>
>>>>>>> v12 (Christian König):
>>>>>>>      - Drop the rename patch in favor of Christian's series
>>>>>>>      - Add a comment to the commit message for the dma-buf sync_file export
>>>>>>>        ioctl saying why we made it an ioctl on dma-buf
>>>>>>>
>>>>>>> Cc: Christian König <christian.koenig@amd.com>
>>>>>>> Cc: Michel Dänzer <michel@daenzer.net>
>>>>>>> Cc: Dave Airlie <airlied@redhat.com>
>>>>>>> Cc: Bas Nieuwenhuizen <bas@basnieuwenhuizen.nl>
>>>>>>> Cc: Daniel Stone <daniels@collabora.com>
>>>>>>> Cc: mesa-dev@lists.freedesktop.org
>>>>>>> Cc: wayland-devel@lists.freedesktop.org
>>>>>>> Test-with: 20210524205225.872316-1-jason@jlekstrand.net
>>>>>>>
>>>>>>> Christian König (1):
>>>>>>>       dma-buf: Add dma_fence_array_for_each (v2)
>>>>>>>
>>>>>>> Jason Ekstrand (5):
>>>>>>>       dma-buf: Add dma_resv_get_singleton (v6)
>>>>>>>       dma-buf: Document DMA_BUF_IOCTL_SYNC (v2)
>>>>>>>       dma-buf: Add an API for exporting sync files (v12)
>>>>>>>       RFC: dma-buf: Add an extra fence to dma_resv_get_singleton_unlocked
>>>>>>>       RFC: dma-buf: Add an API for importing sync files (v7)
>>>>>>>
>>>>>>>      Documentation/driver-api/dma-buf.rst |   8 ++
>>>>>>>      drivers/dma-buf/dma-buf.c            | 103 +++++++++++++++++++++++++
>>>>>>>      drivers/dma-buf/dma-fence-array.c    |  27 +++++++
>>>>>>>      drivers/dma-buf/dma-resv.c           | 110 +++++++++++++++++++++++++++
>>>>>>>      include/linux/dma-fence-array.h      |  17 +++++
>>>>>>>      include/linux/dma-resv.h             |   2 +
>>>>>>>      include/uapi/linux/dma-buf.h         | 103 ++++++++++++++++++++++++-
>>>>>>>      7 files changed, 369 insertions(+), 1 deletion(-)
>>>>>>>
>>>> _______________________________________________
>>>> mesa-dev mailing list
>>>> mesa-dev@lists.freedesktop.org
>>>> https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Flists.freedesktop.org%2Fmailman%2Flistinfo%2Fmesa-dev&amp;data=04%7C01%7Cchristian.koenig%40amd.com%7C841231ea3c6e43f2141208d93265bfe7%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637596234879170817%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=iA%2B3ZezHwlfjMMpkf3bVX8M0HUk3lVDm%2F476G1S8yZI%3D&amp;reserved=0
>

