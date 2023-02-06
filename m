Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EF20E68B8EF
	for <lists+dri-devel@lfdr.de>; Mon,  6 Feb 2023 10:48:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9641810E35B;
	Mon,  6 Feb 2023 09:48:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2040.outbound.protection.outlook.com [40.107.236.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 240A910E356;
 Mon,  6 Feb 2023 09:48:45 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Snkhzt+scSlG3ULS3foaXYnrbiqeTXgM3P9+OHfHSh/5vFsO02vsieG+3amc9bdHxGaBiX7grBlx8rl2WWoZngMh0e+SM7TSgSeDh+Rzi5jdlSTMU9FhDbiL8EvAsvu+d8RHx+vBDoKuGDbgKQocxHVAn7UJwnQl9XknWafo6hmUlZEzNyFO2rC8X0GzDzoeYONPhGj7fl8FfxNIqDA9ggf4xL75avLeSMhSxgvJup7Zy2B4VGJwwKPYdYO59OssJyTf6LT+lJjcTuPolS08+oFK3eMtHF9xRbdy8cWd8A1y6ClqCh7dbGyG7Swc8oWyJrmjsoTOzZUZ7H4b0qYK4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=icWFZnMBpygapNmtY0Zsxc6fw8HIuOrnxc/c4NDZVwE=;
 b=cP0lwz5napWmJ/onFNnKwYJHHZNdVx9mjeVpPsb+Vtfkn4+SiFHMobF/EhbtzeVGgO4mH3v7Nu0uy67xnCQ89RWv0dKthShPKabtgGRFC0SiBD3be5ji1e5Xq7EEy7SaMTAqYt/AYmEdUVqYpXIJMjQtI5ADrf0tl9l8Nrve+b0n4kHbXvX8pejbmExHaNiGahvbiqmQZAwvlu4M0D0sL9a2EmwjQZCt888Gty6MBkY+zGAKrXQj07Ac/0FQ8GqbFdiznwp0wWDCGbJ4AIg3prCDLSjvY7WJkeFlqMLuhSnl85/wzVx1J6w2TmVuyw6KvmThr0/cl3ZV/9E0BXR18A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=icWFZnMBpygapNmtY0Zsxc6fw8HIuOrnxc/c4NDZVwE=;
 b=lWNOodO1SW2iycCiDTBN5nu1sZhHY9PPq2neTng9mkuyk4N5RPSBRWndK1dC43bWoU1PBzu1nThNSG069BV8Ar3S9Wkqs+XosaCfDUBpFlsbBoLVIdcEfK/xovRbV7GpIGm4g6TGGrbOS9r17BvfUNH+3q14Z8D8KNLyqaUOvtw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by DM4PR12MB8557.namprd12.prod.outlook.com (2603:10b6:8:18b::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6064.32; Mon, 6 Feb
 2023 09:48:42 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::2e4f:4041:28be:ba7a]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::2e4f:4041:28be:ba7a%6]) with mapi id 15.20.6064.032; Mon, 6 Feb 2023
 09:48:41 +0000
Message-ID: <95d0631b-545c-ea4d-7439-75422e9a9120@amd.com>
Date: Mon, 6 Feb 2023 10:48:34 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [Nouveau] [PATCH drm-next 05/14] drm/nouveau: new VM_BIND uapi
 interfaces
Content-Language: en-US
To: Danilo Krummrich <dakr@redhat.com>, Dave Airlie <airlied@gmail.com>
References: <20230118061256.2689-1-dakr@redhat.com>
 <20230118061256.2689-6-dakr@redhat.com>
 <Y9MjSeMcsd18r9vM@DUT025-TGLU.fm.intel.com>
 <7c046ff9-728d-7634-9d77-8536308c7481@redhat.com>
 <c2256c7d-e768-ae3f-d465-b9f8080d111b@amd.com>
 <2427a918-5348-d1ef-ccae-a29c1ff33c83@redhat.com>
 <a214b28b-043c-a8bb-69da-b4d8216fce56@amd.com>
 <3a76bfa9-8ee5-a7d9-b9fb-a98181baec0b@redhat.com>
 <49ac3f95-6eda-9009-4b28-0167213301b2@amd.com>
 <bc523c5c-efe6-1a7f-b49a-e0867dc1413d@redhat.com>
 <15fb0179-c7c5-8a64-ed08-841189919f5e@redhat.com>
 <1840e9fb-fd1b-79b7-4238-54ae97333d0b@amd.com>
 <CAPM=9txON8VCb3H7vDY_DOgtUg2Ad3mBvYVxgSMyZ1noOu-rBQ@mail.gmail.com>
 <a1c526e0-0df7-12cb-c5a1-06e9cd0d876b@amd.com>
 <3f935a7e-fede-2bad-c029-4a3af850c9b5@redhat.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <3f935a7e-fede-2bad-c029-4a3af850c9b5@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0061.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4b::9) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR12MB3587:EE_|DM4PR12MB8557:EE_
X-MS-Office365-Filtering-Correlation-Id: e6d2761a-c186-41c6-295d-08db0827546a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: va1kP3lyztJoD+s5xuksXiClP7IktML1xBouYGzAHeS9IrwmTDUUXd21Lw5nKRfYK1tzz/MUP1us5lfEObCM/cJdgVaV0bCAzN+Zn0QFlEtdRF2Jln9yzJGRhczOV/hbGLmTMO0yKM7uq82L9gCvy/arVu959vQcK3mp45V785RSWOWeJRM7IBHCzbSIwwh+ed4NcRlsjyoRMCny8NhJ46um2Bcy6ao3ZsCQwqv0gvuhjPEMOufqQcEsarOqqeknqsTKGfDkeLaeoO+dcjbSiTqwQrOyoDn5DUMIpS+lPCNLOnQZGjP/geJlvOyJuCRgqFqG/MyxDLcGdNkhb0aLmYkIfkfbsJ52JhlDO2XfldbVSMGhFcQMxidQsB1w5ntkDWDDr+p5WfqssTAFrjw/aF7ch3jJyZ7MO89m3XgxdOzumImNhFAa+ZcMAJSY0SYTl9alnLJKQofyDH2f6jNQr/cUlyoAHYc+twq/g2BfabZG/MKWD957UHo4ahvBT3EagpePDm71ddcevtubZr306lc6+37Qx4Dt9/3CRpW6X5PEnqEYL/S2QJLJv2ERsGIffldAoiewvkcFVCLFJ+/fqk7vAgxH9hd2LYUgE1LrGCjz4AE1a6xVMue22+i1WLXFMjcgE/GIGuLqorqx2ubAprNOkTuXMuk+j196VcqdEKVk2IRm9YTp2jyMfsfZU2731bH3kKDDHI1DYbcCHUdjmlXUuWC7n3n+kvq/iwBLMjg=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(136003)(376002)(396003)(366004)(346002)(39860400002)(451199018)(110136005)(316002)(6666004)(6486002)(31696002)(38100700002)(478600001)(186003)(6506007)(53546011)(6512007)(2616005)(26005)(86362001)(7416002)(5660300002)(66574015)(2906002)(83380400001)(36756003)(66946007)(8936002)(4326008)(41300700001)(66476007)(66899018)(8676002)(66556008)(31686004)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?clowRlVWYlJ6dkJTY2RZNTF4QndzSnU2alhSWmx1THdERGpDYnZXdncxTlpJ?=
 =?utf-8?B?TDNsR2NKa1VSUDFON1p2ajF4SEVLYlI2TEJyWU1ucFU5V1lQalc3U3hHR2pz?=
 =?utf-8?B?UW92Sk1hNXc1NEtJcW5DQWduTUNnYStScmRPZWVwTWlvcXNIQVJoSThzVmRy?=
 =?utf-8?B?cFZhSkFiZ3dwb1NLL2ZreHRJZFJxbEV5bFJoYzg4aFVKK0hGRnYvZFBVbFpK?=
 =?utf-8?B?YlFLM0ttZHBPNlZzT2xWT3dCb0NQMnh3blk0cEN1SXhGQVBMbXdYYXVXVGVr?=
 =?utf-8?B?V2FSaVdSVnZ2Nk94OXJpckNxcVlyM0k5Qmp1b1ErWW1CdlJSaTBKOWFYUGxT?=
 =?utf-8?B?Zllod0E2Nm1rRHY5dGR0UTA0RmxtbHFpOXdJTmNvQUhRWXk1eUNrSEl1R2pP?=
 =?utf-8?B?MStQZUN4aUFFelVEc3cwWHJxVXdYNEh0eVFvVG1icDlkTGVPczRDdjNEMDJH?=
 =?utf-8?B?QWhJS2NlRUdsclFBd0FDbXM0ZXd6SmdkR0tnbXRvY3J2N2hhdys2YUxEbXdq?=
 =?utf-8?B?dDg3dm1wbFV3ZTBPU21kNEFPbmNpREtYRHJXLzFBbm1DSHhxTTJ5SzZoaXhN?=
 =?utf-8?B?WFMyMTZzL0pjN1VXbTJ2ZVpJaUFwb3kwZWtEeWJFdStSQlFjaU9GNzU4WSsx?=
 =?utf-8?B?NHVONjNsTG4yanEyUjZheHJ2L2NLeklCdlo5VFNZWURiQ05LTWxJT3JnRG5E?=
 =?utf-8?B?bFFpMWc0OU1TTzRRMi9ReHlvcDkwNUVORi8rT1hWYmhJZEY3U0NlYjhjNURk?=
 =?utf-8?B?VzlnbmtIbERkNmdadGJwamtUN3RHMHNncHRWbGl5V2xDcTBsdXQyUGpXL2xl?=
 =?utf-8?B?bkZnZk1hU3JpQ3N3b2ZyK3FBSVpRSHc2NDJLTUN6ZmtlK2hKcWdEK0FqZGtm?=
 =?utf-8?B?NWZoRGRnb1l4OVhoYXVEL0RldHIxUlJLZXovV1krSmxBLzA2c1NQSDVOSktC?=
 =?utf-8?B?cXRkdlkzUXpIeTFZbjg1R0dYOGtmODhCL2NiNnQrUEdaVWY5RHV4TjJkSmFt?=
 =?utf-8?B?YXlzRFVqVWJFcEZ4YzJEK1lQTnovTENrMWo1eVl2Q29pc1J4SXpVZFNKUEJx?=
 =?utf-8?B?aGUzUnRta3NFM2lTeDcwT1UxcG1EMTdUU3c1bXVPSm1KL3JHbVAxM3ZteXow?=
 =?utf-8?B?bW9vZmtTY1ZBcXlpUWZXYUU1dGhPSzVLSEtycXFYcWtEN01mN3FBRWV1azN3?=
 =?utf-8?B?SUhZSUN5MDloR2ppZGRBLzB4SlJYWjJnZVhtT1ZjN21TbEFrSStWYjBlVUZu?=
 =?utf-8?B?VTNjbGZIZnR4dEErR1BHcFZHeUU3S0VENVpKMjVUQklWVnlHdWJIOTJQK0xz?=
 =?utf-8?B?REcvcm83dDJRbXZmOUgvR3BXRnUxcEN0d2ZFNy90clBDNzFhV2MzZng1REVW?=
 =?utf-8?B?cERTMjVxWE1qVllZTDQxQkVwdnlTNmJWUThRSHpKVmlxZThBYjEyT2Y4K1V2?=
 =?utf-8?B?MFkwdnFJZ0l1STVaazRHMG5ickEzVWtFd2lqb3hHRDZCMEFTR3VBT1gwcElT?=
 =?utf-8?B?ajdIM3pMYVdyZGRoSTBIMnRDQUwvWmdsUmNGcW1BYlJlWU81TGl3djhxMXZ1?=
 =?utf-8?B?R1JNQ0tGcituNjZnSnd6WXE3UHQ2VytzT1ZFTTQ4K3NiV1NiWXJBb1B5RGps?=
 =?utf-8?B?QU1lVFNPd2dWNVlGY3dYWjJvVHRuN091T1hISW41QXBhZG1ldGZNQlFEY01O?=
 =?utf-8?B?YzJMOC9RQnRmb3ZrQnZaUTZmN203WkV6NFFwck9xaDFxKzQ0eFcvQUtmSUxz?=
 =?utf-8?B?SDdSaXdvYUpwdHpkb2dqTHBGWjRDV3NyZEMvMmV1eXlkZFRqSHBNZXBzNlZo?=
 =?utf-8?B?cmNXTGJ1OWc4bWdjWVA0dERYSFU0Y3Z2dWhUYXlTL0JNSlY5bC9zVStDREVW?=
 =?utf-8?B?R1BxVm9UMWdCSWRudlY0QWlqMHJLVmFKTEZ6VUk3T2h5Uld6cUdhd1Z5cVlp?=
 =?utf-8?B?WFY4YnVnTVNBb0hoWjZ6bXZyNEhhRnc1QVhsWTlucmZwYm4zb1NkYzQyMm1m?=
 =?utf-8?B?eXJiV3NwQVU5K3I1dGZmU2xvQmRZMVZDa2dlT0dKVXlacXowaUxnQWZwbkV3?=
 =?utf-8?B?alFORUREcjFrKzFuQlh1dFJxcVRhVkhQVlZ6cUliUWo4K1NxWlJSRVI2U0lt?=
 =?utf-8?Q?v2gBNwsNN6dCSAbpQHAjCaISJ?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e6d2761a-c186-41c6-295d-08db0827546a
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Feb 2023 09:48:41.7141 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TjNb2pt3BradGkZ2+DYAvUU1vrFkQ31Ly78ZrAUe2lJdu6ieI+s05U3TsPjGA3Li
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB8557
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
Cc: Matthew Brost <matthew.brost@intel.com>, jason@jlekstrand.net,
 linux-doc@vger.kernel.org, nouveau@lists.freedesktop.org, corbet@lwn.net,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 airlied@redhat.com, bskeggs@redhat.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 02.02.23 um 19:31 schrieb Danilo Krummrich:
> On 2/2/23 12:53, Christian König wrote:
>> Am 01.02.23 um 09:10 schrieb Dave Airlie:
>>> [SNIP]
>>>>> For drivers that don't intend to merge at all and (somehow) are
>>>>> capable of dealing with sparse regions without knowing the sparse
>>>>> region's boundaries, it'd be easy to make those gpuva_regions 
>>>>> optional.
>>>> Yeah, but this then defeats the approach of having the same hw
>>>> independent interface/implementation for all drivers.
>>> I think you are running a few steps ahead here. The plan isn't to have
>>> an independent interface, it's to provide a set of routines and
>>> tracking that will be consistent across drivers, so that all drivers
>>> once using them will operate in mostly the same fashion with respect
>>> to GPU VA tracking and VA/BO lifetimes. Already in the tree we have
>>> amdgpu and freedreno which I think end up operating slightly different
>>> around lifetimes. I'd like to save future driver writers the effort of
>>> dealing with those decisions and this should drive their user api
>>> design so to enable vulkan sparse bindings.
>>
>> Ok in this case I'm pretty sure this is *NOT* a good idea.
>>
>> See this means that we define the UAPI implicitly by saying to 
>> drivers to use a common framework for their VM implementation which 
>> then results in behavior A,B,C,D....
>>
>> If a driver strides away from this common framework because it has 
>> different requirements based on how his hw work you certainly get 
>> different behavior again (and you have tons of hw specific 
>> requirements in here).
>>
>> What we should do instead if we want to have some common handling 
>> among drivers (which I totally agree on makes sense) then we should 
>> define the UAPI explicitly.
>
> By asking that I don't want to say I'm against this idea, I'm just 
> wondering how it becomes easier to deal with "tons of hw specific 
> requirements" by generalizing things even more?

I'm already maintaining two different GPU VM solutions in the GPU 
drivers in the kernel, radeon and amdgpu. The hw they driver is 
identical, just the UAPI is different. And only because of the different 
UAPI they can't have the same VM backend implementation.

The hw stuff is completely abstract able. That's just stuff you need to 
consider when defining the structures you pass around.

But a messed up UAPI is sometimes impossible to fix because of backward 
compatibility.

We learned that the hard way with radeon and mostly fixed it by coming 
up with a completely new implementation for amdgpu.

> What makes us think that we do a better job in considering all hw 
> specific requirements with a unified UAPI than with a more lightweight 
> generic component for tracking VA mappings?

Because this defines the UAPI implicitly and that's seldom a good idea.

As I said before tracking is the easy part of the job. Defining this 
generic component helps a little bit writing new drivers, but it leaves 
way to much room for speculations on the UAPI.

> Also, wouldn't we need something like the GPUVA manager as part of a 
> unified UAPI?

Not necessarily. We can write components to help drivers implement the 
UAPI, but this isn't mandatory.

>
>>
>> For example we could have a DRM_IOCTL_GPU_VM which takes both driver 
>> independent as well as driver dependent information and then has the 
>> documented behavior:
>> a) VAs do (or don't) vanish automatically when the GEM handle is closed.
>> b) GEM BOs do (or don't) get an additional reference for each VM they 
>> are used in.
>> c) Can handle some common use cases driver independent (BO mappings, 
>> readonly, writeonly, sparse etc...).
>> d) Has a well defined behavior when the operation is executed async. 
>> E.g. in/out fences.
>> e) Can still handle hw specific stuff like (for example) trap on 
>> access etc....
>> ...
>>
>> Especially d is what Bas and I have pretty much already created a 
>> prototype for the amdgpu specific IOCTL for, but essentially this is 
>> completely driver independent and actually the more complex stuff. 
>> Compared to that common lifetime of BOs is just nice to have.
>>
>> I strongly think we should concentrate on getting this right as well.
>>
>>> Now if merging is a feature that makes sense to one driver maybe it
>>> makes sense to all, however there may be reasons amdgpu gets away
>>> without merging that other drivers might not benefit from, there might
>>> also be a benefit to amdgpu from merging that you haven't looked at
>>> yet, so I think we could leave merging as an optional extra driver
>>> knob here. The userspace API should operate the same, it would just be
>>> the gpu pagetables that would end up different sizes.
>>
>> Yeah, agree completely. The point is that we should not have 
>> complexity inside the kernel which is not necessarily needed in the 
>> kernel.
>>
>> So merging or not is something we have gone back and forth for 
>> amdgpu, one the one hand it reduces the memory footprint of the 
>> housekeeping overhead on the other hand it makes the handling more 
>> complex, error prone and use a few more CPU cycles.
>>
>> For amdgpu merging is mostly beneficial when you can get rid of a 
>> whole page tables layer in the hierarchy, but for this you need to 
>> merge at least 2MiB or 1GiB together. And since that case doesn't 
>> happen that often we stopped doing it.
>>
>> But for my understanding why you need the ranges for the merging? 
>> Isn't it sufficient to check that the mappings have the same type, 
>> flags, BO, whatever backing them?
>
> Not entirely. Let's assume userspace creates two virtually contiguous 
> buffers (VKBuffer) A and B. Userspace could bind a BO with BO offset 0 
> to A (binding 1) and afterwards bind the same BO with BO offset 
> length(A) to B (binding 2), maybe unlikely but AFAIK not illegal.
>
> If we don't know about the bounds of A and B in the kernel, we detect 
> that both bindings are virtually and physically contiguous and we 
> merge them.

Well as far as I can see this is actually legal and desirable.

>
> In the best case this was simply useless, because we'll need to split 
> them anyway later on when A or B is destroyed, but in the worst case 
> we could fault the GPU, e.g. if merging leads to a change of the page 
> tables that are backing binding 1, but buffer A is already in use by 
> userspace.

WOW wait a second, regions absolutely don't help you with that anyway.

You need to keep track which mappings are used or otherwise any 
modification could lead to problems.

In other words when the GPU already uses A you *must* have a fence on 
the page tables backing A to prevent their destruction.

>
> In Nouveau, I think we could also get rid of regions and do something 
> driver specific for the handling of the dual page tables, which I want 
> to use for sparse regions *and* just don't merge (at least for now). 
> But exactly for the sake of not limiting drivers in their HW specifics 
> I thought it'd be great if merging is supported in case it makes sense 
> for a specific HW, especially given the fact that memory sizes are 
> increasing.

What do you mean with that?

If you want your page tables to be modifiable while the GPU is using 
them (which is basically a standard requirement from sparse bindings in 
Vulkan) you need double housekeeping anyway.

Those regions strongly sound like you are pushing stuff which should be 
handled in userspace inside the kernel.

Regards,
Christian.

>
>
>>
>> Regards,
>> Christian.
>>
>>
>>>
>>> Dave.
>>
>

