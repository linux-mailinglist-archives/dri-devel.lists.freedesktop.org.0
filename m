Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EACE3AC732
	for <lists+dri-devel@lfdr.de>; Fri, 18 Jun 2021 11:16:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 734496E9C1;
	Fri, 18 Jun 2021 09:16:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2081.outbound.protection.outlook.com [40.107.236.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 590B26E9C1;
 Fri, 18 Jun 2021 09:15:59 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SDasSYzwzfTTOcLAYmmEKIOkg4w4Hxy+feuiphFXnXXwRHELtwqef4BM5cwuO6KrMLt8oZyI0fkIXzXtofqeWHD0RzPn3tkFIMxdNwLxvSUZNqtPYGCFpTy1eVOaiCgsnQwKEuZzyWYmRrNh1hWFSFfKOROF+nMrZrTEnBRs4QtRkT2G1e3QVhCE0voU4MaPEYSdnxHnbIfEIAU5qfahorD+udGpIFHRYHyu5rdhNnhPD5kp/SyDhQGMHWcD2UnrkYI68FDBsPdrvNXqjSWfd2TXofyDIpRdKaBZdX0xqwrOUDbxsCPwfC5MrnmGgI9Hx5tL+P9a8eQN3MJKVkS+dw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Qs2qmohDccxlnkn9YjYFrtxK1jrZSjsHLhAAyAOL+1c=;
 b=c4360Jc8jyYocA25RzEsxVAu3O7KOY3lV2vOM6hkK6EKdV/hcGYcn8ZbDH+xgZ7Awe+mOR7n8i1I7Ty1+dBfsQzhSXOyEdKSJM43q5CUBMOTbOHraSzy2RF2qAlX2dw5Bp3htEMDZYX9DlD2niqeuyTTh2uRR5w2XYDw/xTsQ99v/6TPNBLTofY/tqLp//TCKcQUny89C0OjfoQkB5ws1ZusSGu/RCEGPkyW1IRvxLXddQG95ocd6A4oC7g2UjT8P7t3uyZ8Ir7l2STNYTbpgVuHC34RuHQJuFfsvuSmi1C6UKGx1CY07XbuVFGLmT7uGDGTYo0F7QqQU1mOXhcvwg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Qs2qmohDccxlnkn9YjYFrtxK1jrZSjsHLhAAyAOL+1c=;
 b=HoZIfrh2d+TStPNALPSKYJlm2fUl9jSSGOhXSiCv277IQqJE2AmLNd5xabuXRGYDNiRDYk+Q8zhAlLNHTkLeA1EyAGh+32o+1KAvjt5VwXfQilbSSXQ+w5kl+Ny7IQW6PLMvsRP8E8brk3SU7CRxmzNz9wU4KiZaPpUQVYY+WrU=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by MN2PR12MB4520.namprd12.prod.outlook.com (2603:10b6:208:26f::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4242.18; Fri, 18 Jun
 2021 09:15:56 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::6c9e:1e08:7617:f756]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::6c9e:1e08:7617:f756%5]) with mapi id 15.20.4242.021; Fri, 18 Jun 2021
 09:15:56 +0000
Subject: Re: [Mesa-dev] [PATCH 0/6] dma-buf: Add an API for exporting sync
 files (v12)
To: Daniel Vetter <daniel@ffwll.ch>
References: <20210610210925.642582-1-jason@jlekstrand.net>
 <29e9795e-8ec7-282c-c8ec-413eaed2e4d4@gmail.com>
 <CAOFGe94oFA9=vy56--hm=9=232+Npnxrpn+6gGFpRM2dmJZh3w@mail.gmail.com>
 <84135114-71d4-77f0-7a6b-69bb81b7f73c@amd.com>
 <YMupgTffAfw8xw51@phenom.ffwll.local>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <e8fc12a3-42eb-30f9-c6ac-772fbc675678@amd.com>
Date: Fri, 18 Jun 2021 11:15:50 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
In-Reply-To: <YMupgTffAfw8xw51@phenom.ffwll.local>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Originating-IP: [2a02:908:1252:fb60:c4f2:8f8f:141a:c5fd]
X-ClientProxiedBy: PR0P264CA0080.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:100:18::20) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:c4f2:8f8f:141a:c5fd]
 (2a02:908:1252:fb60:c4f2:8f8f:141a:c5fd) by
 PR0P264CA0080.FRAP264.PROD.OUTLOOK.COM (2603:10a6:100:18::20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4242.18 via Frontend Transport; Fri, 18 Jun 2021 09:15:54 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 73cb9fda-e9ff-4367-c3ee-08d93239adb0
X-MS-TrafficTypeDiagnostic: MN2PR12MB4520:
X-Microsoft-Antispam-PRVS: <MN2PR12MB45206748FBC9531DDEC19C13830D9@MN2PR12MB4520.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: zhj+MGVgklCmpn50nDhI/hc59kRr0kV6rMRIK358/k4LvC8Zj1RLEGSEPUTcu5kfeu8R+4bktuutv8YSETKjks59toIaVms+WCaNlp5veEpVwSaGLtnqY6Cq8fjhr/F/zBY/0MnF1jYA1ktsXQLjJaaYZXs44Rysh9G0dFB5Nuxw8L7O5LUpHWtOeUTNjQ7X6g8KYHelkxHzUHEjpStmkm7lQS3VkVccohL2oHhh622/qVixS2tyYMAAdWYnOAqoR0BtdNCk+aQ23jumAgz0SsqVGE3ax7Vr583gZePKnoVbx09LHH+apep19f4JAHs/1yC5cS645asyVE0S2EpXIZBQTKzg7eKX2irAtL9RYPgthA61zX4lBg9BDEqVPJkpSdrYoUE9LOPGjrVzYcEaoxMww5386/de5pUFqjm/Aa8mGh+xXHvxP/Cl2XEroOQ0haxKndQh7rU+mfH4+f53km3cMnN6XnX71OrBpIKJqZ1kRvW9ZICKIUqrUhOBKAv8lDXZNnFr7dep/Cxqm/JXlhfWADzYOroBi2FbP3HY1UB1fGHk0t7bhwI6JUlbLm6lZyrIHVQh88BjO5M8rjY46pxeJjUoxA6CJGKmuPV9eHDOCe/bwyEMnbdqOhsuVGy7LCLQYz1Klcv9H+03B8H36YpBqpJrl5Aq/wnN/dLXlv/P2NlITj1xKdvNLFqP1OXuBjcPd07R0xubhELfN0LZVNUyVJe/W2P5UIQ7Kg606DU=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(39860400002)(396003)(346002)(376002)(366004)(966005)(478600001)(54906003)(31686004)(2906002)(31696002)(66476007)(2616005)(38100700002)(45080400002)(66946007)(316002)(66574015)(16526019)(8676002)(4326008)(83380400001)(186003)(6666004)(86362001)(5660300002)(6486002)(30864003)(6916009)(36756003)(66556008)(8936002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bUZ2N25mcGwrdVpNRmJvK0N2UmpOa3V3YUJkTUxTT0VKbWljR0FhS09oTXpk?=
 =?utf-8?B?cVNSWkpXeEpMc0lXTnA3SndWMGkvZVA0cklXRTdCWjZlUWp4OG4wK3VQZVQw?=
 =?utf-8?B?UjdFZnhhcE0wUkRYeXRXRTd5aE5ld0kyaDUreVBORy9SK2w0VGQvWk4zNG1I?=
 =?utf-8?B?cDJOdzhkci9tRHBhSVFseVcrVWgwYVlyWU82aDM4c0xza0dCYkNRV29rZ280?=
 =?utf-8?B?RTEvazE2QUZpRmlBb25DRkJvUlNpRU93MXlJby9XazVXUjBNOGxBVDR5eGtU?=
 =?utf-8?B?V29yaVJWQTF0QnhJK0d0ekp2NkVRM0VacWVDQWVodzI2RTRKSGVxT0MwdjAx?=
 =?utf-8?B?ckpzM2ZST3JuaDVSRmlDTlhFVzd5SnBudGJtK05iWklQV1BiaithMXFkTS9X?=
 =?utf-8?B?SVUrMENyTVJKYzlKWnMwWWdrc0ROc2xoazA0aFhxRWJZRW16RE9hWEF3djVS?=
 =?utf-8?B?YlQwdnUwUGxhZGlIaDVqTnQ5UWZEWFRCZjVqTEMrY2dWL3puRW9PclVsNERz?=
 =?utf-8?B?SnlnWk45QXZFNzN4cHI2M1F0OVFEVEZ3V04zSjlOUU9ZN21mTDJ3ZWNDcGsx?=
 =?utf-8?B?U1dRRVp3R0JmMDc3OUZwZW52ZWljT2o2SmlzU29ESVUwNmJ2M2NlL0czd2M2?=
 =?utf-8?B?MEFTWk9EdGJzUFlyOVRIdU03RVdFbGliNEdrQnllT1o3MUpvV2c5cHhUcUw2?=
 =?utf-8?B?Q3lqNHkwSVVMZmMvK09JR1JycVAxM0tlYVFoUFFKT0xCT2JMMzRhTk1vOVcw?=
 =?utf-8?B?Zy9EOHFTcEFldVo0OXRFV1Z1emNqeUdGQis5L1pWY2ZaMzBuMjJOMVBSQ1N0?=
 =?utf-8?B?c242czltVHVWQ3dtOWJ5N3E4K2VaZ1ZpTU4rZjJkYVpVWFZudUxDQ212VEQz?=
 =?utf-8?B?dmliTDhPenZ6RTV3eTRsWVkrelVzQk4rNWY3TGY4VGw3eTNveHEwOGFINFh5?=
 =?utf-8?B?VSs2MWtpQTNjdnc2WVYxUXA0OHkyWHFHMjRuazFvN00vZkRPNHRKNmk3ZEl0?=
 =?utf-8?B?Wk15VG1aa1VtaERJamVGZk0zd2E1dm9CMW5BVGdQVktaSGVwTjhCYUlVdSsx?=
 =?utf-8?B?MEtvS2s5YzFBNXZZR2VudzNYNHlIbktwUVZzSHZaWWpUL2o1VThxeWhiUE80?=
 =?utf-8?B?N1RxYzRXNVpWa2dVdUlCc0ZuMHN2SDhaOE45SU5xN2JrditXeWpwc052Zlpr?=
 =?utf-8?B?Z0JHUjJCUDRRMWlQcjY0NzFtcmlMUmJtVFUrRHBSRFRPMzJRcjNTM2dWa1pE?=
 =?utf-8?B?dy9jaUFxSS9BeDA5a1N3YUp3a0RSQ2lEYnlTWHJETHgrRHZjOUQydWxXcUJp?=
 =?utf-8?B?Y2pBUkNDelByenBiUEw3YlQyeUhrcnRoamh2ZTlYQ3ljUVRWUGJaTHRkUTha?=
 =?utf-8?B?ZnU0K1JDSTZoNVo1VTFrSEphV2dqTGVHaFpCYVlCVVdrUVZ6cGdncmtvc1Jn?=
 =?utf-8?B?YU5sM01KRHoxeUZlN3VaZDJDTEF1TytyN1JreWlhVDB1Ymoxb2pHdTgweEZp?=
 =?utf-8?B?cnhMWlI2YnpRWTFRbFBJMVI1aEVIVDQ3VWlTbHBFV2ladnVaRkdJZmo4dFM2?=
 =?utf-8?B?VUthSkR4RmkvcDVXKzRtTWcra2NEeHFIS0YyaVBSWE5HZ1JUU3dnWDl5Tk9K?=
 =?utf-8?B?dzBaTGU1akIvYXRiTHIvbTBTNjJhN3FObXBDYmtpUEJzY1dEWGFuZUd0RGY4?=
 =?utf-8?B?UlQzTUZYbnJ6VEFuT2ZhZ3NHWE9mUnE1VmVrSk1mUTV0RDQ3YysxUUwvK0s1?=
 =?utf-8?B?QVdzQmh0VzBMZVErZ0hqcGY4cU9RbEZURkhCZmZBMzMvWElxakZyeXExVE1o?=
 =?utf-8?B?ZURwMTJpdTNpVHRaU3FWMU9jdmRxL0p0cTVES0c4Nm9vbEIwd2pObWQ4aHVu?=
 =?utf-8?Q?yYqfuScOo0aR/?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 73cb9fda-e9ff-4367-c3ee-08d93239adb0
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jun 2021 09:15:55.9912 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gy57siDDI0DWcTFqEfTgpskm9+IhONgnsPXLHvg+EMmY5HqfbsH0nFFpRJZcz4Rt
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4520
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

Am 17.06.21 um 21:58 schrieb Daniel Vetter:
> On Thu, Jun 17, 2021 at 09:37:36AM +0200, Christian König wrote:
>> [SNIP]
>>> But, to the broader point, maybe?  I'm a little fuzzy on exactly where
>>> i915 inserts and/or depends on fences.
>>>
>>>> When you combine that with complex drivers which use TTM and buffer
>>>> moves underneath you can construct an information leak using this and
>>>> give userspace access to memory which is allocated to the driver, but
>>>> not yet initialized.
>>>>
>>>> This way you can leak things like page tables, passwords, kernel data
>>>> etc... in large amounts to userspace and is an absolutely no-go for
>>>> security.
>>> Ugh...  Unfortunately, I'm really out of my depth on the implications
>>> going on here but I think I see your point.
>>>
>>>> That's why I'm said we need to get this fixed before we upstream this
>>>> patch set here and especially the driver change which is using that.
>>> Well, i915 has had uAPI for a while to ignore fences.
>> Yeah, exactly that's illegal.
> You're a few years too late with closing that barn door. The following
> drives have this concept
> - i915
> - msm
> - etnaviv
>
> Because you can't write a competent vulkan driver without this.

WHAT? ^^

> This was discussed at absolute epic length in various xdcs iirc. We did ignore a
> bit the vram/ttm/bo-moving problem because all the people present were
> hacking on integrated gpu (see list above), but that just means we need to
> treat the ttm_bo->moving fence properly.

I should have visited more XDCs in the past, the problem is much larger 
than this.

But I now start to understand what you are doing with that design and 
why it looks so messy to me, amdgpu is just currently the only driver 
which does Vulkan and complex memory management at the same time.

>> At least the kernel internal fences like moving or clearing a buffer object
>> needs to be taken into account before a driver is allowed to access a
>> buffer.
> Yes i915 needs to make sure it never ignores ttm_bo->moving.

No, that is only the tip of the iceberg. See TTM for example also puts 
fences which drivers needs to wait for into the shared slots. Same thing 
for use cases like clear on release etc....

 From my point of view the main purpose of the dma_resv object is to 
serve memory management, synchronization for command submission is just 
a secondary use case.

And that drivers choose to ignore the exclusive fence is an absolutely 
no-go from a memory management and security point of view. Exclusive 
access means exclusive access. Ignoring that won't work.

The only thing which saved us so far is the fact that drivers doing this 
are not that complex.

BTW: How does it even work? I mean then you would run into the same 
problem as amdgpu with its page table update fences, e.g. that your 
shared fences might signal before the exclusive one.

> For dma-buf this isn't actually a problem, because dma-buf are pinned. You
> can't move them while other drivers are using them, hence there's not
> actually a ttm_bo->moving fence we can ignore.
>
> p2p dma-buf aka dynamic dma-buf is a different beast, and i915 (and fwiw
> these other drivers) need to change before they can do dynamic dma-buf.
>
>> Otherwise we have an information leak worth a CVE and that is certainly not
>> something we want.
> Because yes otherwise we get a CVE. But right now I don't think we have
> one.

Yeah, agree. But this is just because of coincident and not because of 
good engineering :)

> We do have a quite big confusion on what exactly the signaling ordering is
> supposed to be between exclusive and the collective set of shared fences,
> and there's some unifying that needs to happen here. But I think what
> Jason implements here in the import ioctl is the most defensive version
> possible, so really can't break any driver. It really works like you have
> an ad-hoc gpu engine that does nothing itself, but waits for the current
> exclusive fence and then sets the exclusive fence with its "CS" completion
> fence.
>
> That's imo perfectly legit use-case.

The use case is certainly legit, but I'm not sure if merging this at the 
moment is a good idea.

Your note that drivers are already ignoring the exclusive fence in the 
dma_resv object was eye opening to me. And I now have the very strong 
feeling that the synchronization and the design of the dma_resv object 
is even more messy then I thought it is.

To summarize we can be really lucky that it didn't blow up into our 
faces already.

> Same for the export one. Waiting for a previous snapshot of implicit
> fences is imo perfectly ok use-case and useful for compositors - client
> might soon start more rendering, and on some drivers that always results
> in the exclusive slot being set, so if you dont take a snapshot you
> oversync real bad for your atomic flip.

The export use case is unproblematic as far as I can see.

>>> Those changes are years in the past.  If we have a real problem here (not sure on
>>> that yet), then we'll have to figure out how to fix it without nuking
>>> uAPI.
>> Well, that was the basic idea of attaching flags to the fences in the
>> dma_resv object.
>>
>> In other words you clearly denote when you have to wait for a fence before
>> accessing a buffer or you cause a security issue.
> Replied somewhere else, and I do kinda like the flag idea. But the problem
> is we first need a ton more encapsulation and review of drivers before we
> can change the internals. One thing at a time.

Ok how should we then proceed?

The large patch set I've send out to convert all users of the shared 
fence list to a for_each API is a step into the right direction I think, 
but there is still a bit more todo.

> And yes for amdgpu this gets triple-hard because you both have the
> ttm_bo->moving fence _and_ the current uapi of using fence ownership _and_
> you need to figure out how to support vulkan properly with true opt-in
> fencing.

Well I have been pondering on that for a bit and I came to the 
conclusion that it is actually not a problem at all.

See radeon, nouveau, msm etc... all implement functions that they don't 
wait for fences from the same timeline, context, engine. That amdgpu 
doesn't wait for fences from the same process can be seen as just a 
special case of this.

>   I'm pretty sure it's doable, I'm just not finding any time
> anywhere to hack on these patches - too many other fires :-(

Well I'm here. Let's just agree on the direction and I can do the coding.

What I need help with is all the auditing. For example I still haven't 
wrapped my head around how i915 does the synchronization.

Best regards,
Christian.

>
> Cheers, Daniel
>
>> Christian.
>>
>>> --Jason
>>>
>>>
>>>> Regards,
>>>> Christian.
>>>>
>>>> Am 10.06.21 um 23:09 schrieb Jason Ekstrand:
>>>>> Modern userspace APIs like Vulkan are built on an explicit
>>>>> synchronization model.  This doesn't always play nicely with the
>>>>> implicit synchronization used in the kernel and assumed by X11 and
>>>>> Wayland.  The client -> compositor half of the synchronization isn't too
>>>>> bad, at least on intel, because we can control whether or not i915
>>>>> synchronizes on the buffer and whether or not it's considered written.
>>>>>
>>>>> The harder part is the compositor -> client synchronization when we get
>>>>> the buffer back from the compositor.  We're required to be able to
>>>>> provide the client with a VkSemaphore and VkFence representing the point
>>>>> in time where the window system (compositor and/or display) finished
>>>>> using the buffer.  With current APIs, it's very hard to do this in such
>>>>> a way that we don't get confused by the Vulkan driver's access of the
>>>>> buffer.  In particular, once we tell the kernel that we're rendering to
>>>>> the buffer again, any CPU waits on the buffer or GPU dependencies will
>>>>> wait on some of the client rendering and not just the compositor.
>>>>>
>>>>> This new IOCTL solves this problem by allowing us to get a snapshot of
>>>>> the implicit synchronization state of a given dma-buf in the form of a
>>>>> sync file.  It's effectively the same as a poll() or I915_GEM_WAIT only,
>>>>> instead of CPU waiting directly, it encapsulates the wait operation, at
>>>>> the current moment in time, in a sync_file so we can check/wait on it
>>>>> later.  As long as the Vulkan driver does the sync_file export from the
>>>>> dma-buf before we re-introduce it for rendering, it will only contain
>>>>> fences from the compositor or display.  This allows to accurately turn
>>>>> it into a VkFence or VkSemaphore without any over- synchronization.
>>>>>
>>>>> This patch series actually contains two new ioctls.  There is the export
>>>>> one mentioned above as well as an RFC for an import ioctl which provides
>>>>> the other half.  The intention is to land the export ioctl since it seems
>>>>> like there's no real disagreement on that one.  The import ioctl, however,
>>>>> has a lot of debate around it so it's intended to be RFC-only for now.
>>>>>
>>>>> Mesa MR: https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Fgitlab.freedesktop.org%2Fmesa%2Fmesa%2F-%2Fmerge_requests%2F4037&amp;data=04%7C01%7Cchristian.koenig%40amd.com%7Cf8e28d7c4683432bf24008d931ca5a63%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637595567453821101%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=TAFUHFCSFcfrP7bjkBtVin4VX2vC6OakwbrqwlZOW8c%3D&amp;reserved=0
>>>>> IGT tests: https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Fpatchwork.freedesktop.org%2Fseries%2F90490%2F&amp;data=04%7C01%7Cchristian.koenig%40amd.com%7Cf8e28d7c4683432bf24008d931ca5a63%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637595567453821101%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=lbn%2B81KXds9pYnFUYWi9hzLNP3PLKij4RVjV97UyZ3s%3D&amp;reserved=0
>>>>>
>>>>> v10 (Jason Ekstrand, Daniel Vetter):
>>>>>     - Add reviews/acks
>>>>>     - Add a patch to rename _rcu to _unlocked
>>>>>     - Split things better so import is clearly RFC status
>>>>>
>>>>> v11 (Daniel Vetter):
>>>>>     - Add more CCs to try and get maintainers
>>>>>     - Add a patch to document DMA_BUF_IOCTL_SYNC
>>>>>     - Generally better docs
>>>>>     - Use separate structs for import/export (easier to document)
>>>>>     - Fix an issue in the import patch
>>>>>
>>>>> v12 (Daniel Vetter):
>>>>>     - Better docs for DMA_BUF_IOCTL_SYNC
>>>>>
>>>>> v12 (Christian König):
>>>>>     - Drop the rename patch in favor of Christian's series
>>>>>     - Add a comment to the commit message for the dma-buf sync_file export
>>>>>       ioctl saying why we made it an ioctl on dma-buf
>>>>>
>>>>> Cc: Christian König <christian.koenig@amd.com>
>>>>> Cc: Michel Dänzer <michel@daenzer.net>
>>>>> Cc: Dave Airlie <airlied@redhat.com>
>>>>> Cc: Bas Nieuwenhuizen <bas@basnieuwenhuizen.nl>
>>>>> Cc: Daniel Stone <daniels@collabora.com>
>>>>> Cc: mesa-dev@lists.freedesktop.org
>>>>> Cc: wayland-devel@lists.freedesktop.org
>>>>> Test-with: 20210524205225.872316-1-jason@jlekstrand.net
>>>>>
>>>>> Christian König (1):
>>>>>      dma-buf: Add dma_fence_array_for_each (v2)
>>>>>
>>>>> Jason Ekstrand (5):
>>>>>      dma-buf: Add dma_resv_get_singleton (v6)
>>>>>      dma-buf: Document DMA_BUF_IOCTL_SYNC (v2)
>>>>>      dma-buf: Add an API for exporting sync files (v12)
>>>>>      RFC: dma-buf: Add an extra fence to dma_resv_get_singleton_unlocked
>>>>>      RFC: dma-buf: Add an API for importing sync files (v7)
>>>>>
>>>>>     Documentation/driver-api/dma-buf.rst |   8 ++
>>>>>     drivers/dma-buf/dma-buf.c            | 103 +++++++++++++++++++++++++
>>>>>     drivers/dma-buf/dma-fence-array.c    |  27 +++++++
>>>>>     drivers/dma-buf/dma-resv.c           | 110 +++++++++++++++++++++++++++
>>>>>     include/linux/dma-fence-array.h      |  17 +++++
>>>>>     include/linux/dma-resv.h             |   2 +
>>>>>     include/uapi/linux/dma-buf.h         | 103 ++++++++++++++++++++++++-
>>>>>     7 files changed, 369 insertions(+), 1 deletion(-)
>>>>>
>> _______________________________________________
>> mesa-dev mailing list
>> mesa-dev@lists.freedesktop.org
>> https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Flists.freedesktop.org%2Fmailman%2Flistinfo%2Fmesa-dev&amp;data=04%7C01%7Cchristian.koenig%40amd.com%7Cf8e28d7c4683432bf24008d931ca5a63%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637595567453821101%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=QxQDoUKzo57tmQxD0aEjPs8ATpCOBQiQ5W%2FDh8dbEqU%3D&amp;reserved=0

