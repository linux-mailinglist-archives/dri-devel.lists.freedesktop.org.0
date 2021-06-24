Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EE933B3512
	for <lists+dri-devel@lfdr.de>; Thu, 24 Jun 2021 19:56:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 39F196EC7D;
	Thu, 24 Jun 2021 17:56:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam07on2051.outbound.protection.outlook.com [40.107.212.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B9B66EC7D
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Jun 2021 17:56:17 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=R0VrO2bx3EEkdiJcYrrVzgDyV1tODirJkYJ9PLF69KUQrnbJ//H0ERdtrH4eXja0rGsk4/4wimlmseshhNwQp38RS2f1dRIitCalFj48UFnZk7JEf/KufMimI6y5kVsrJSO1HDGrXW3O+ipfUeIPynH8SqTj+cjb+4o2PUQlhkeWIaKabxWcmAxuWWTSiA3WaTmPUe1LLRhWTYNjQwLjCn1aDapSkeYyinDR4Ix8U7a0V0NsKL1YNJIrpIDDa2ghoKiDQjwYqRs8CMs9iMxfjVKjlbAQH18hCLAJqBs4i90hdDnFO9WatG59PxA2ljSY5hkwxSsBX/Wob77zEEeVPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zZHZh1mVJL/vQ/EakCkF2KBT+Pm0xCXMqG9F4hFy6Wc=;
 b=BXYBpjyRYKZvJvBlbEAze/wpdncGuY73a/fFQrzhc9bl3li6x71G0hdqFWksatS6jp6fzakaIC1d3ITMCQ4cjZYRLqYrOmwv+ocSnjZhR+yrl8v/OgqaD80awJiVzvw6rNcrijLDfD/Pf2NRLWA5IZ6pc3/gWrVkSs/VgVgvj0Itx1wjiQygWuZZf1blTB9yLSIuOxMzr4EA797kDzuGVfAJAiTydCyPAReYpngPH38vGg1CI2DB8yQwrQOFUrweQGZXxYSljvJSnQCIl7q1G0m1BD1EVxhz4WXZ33GJla6rhnMQMtef3wOVxuxJ+XmGy2xFNzB50PmqGgsvgyjlIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zZHZh1mVJL/vQ/EakCkF2KBT+Pm0xCXMqG9F4hFy6Wc=;
 b=VfZHjbOUe73TSWBwazo44BY2dB9pW6WmgAeUOeLB7z1eTDOtYb/iDc+/QV1WjPzBA2AS6YD4ZcAO2gPJn199zvh1DhwVY/ShLGOxn6mxuCk1/BiImQHBe1M+DLPjCysYIwf426HGE5jWsPhjy50yG+6yzskkKh1Z9TQCmJGHqvo=
Authentication-Results: amd.com; dkim=none (message not signed)
 header.d=none;amd.com; dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by BL0PR12MB4754.namprd12.prod.outlook.com (2603:10b6:208:8e::26)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4264.18; Thu, 24 Jun
 2021 17:56:14 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::6c9e:1e08:7617:f756]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::6c9e:1e08:7617:f756%5]) with mapi id 15.20.4264.020; Thu, 24 Jun 2021
 17:56:14 +0000
Subject: Re: [PATCH 10/11] drm/scheduler: Don't store self-dependencies
To: Daniel Vetter <daniel@ffwll.ch>
References: <20210624140025.438303-1-daniel.vetter@ffwll.ch>
 <20210624140025.438303-11-daniel.vetter@ffwll.ch>
 <fa721d0e-46d7-b5f3-f846-560b8dad4e58@amd.com>
 <YNTBC04wfQ7ItRq7@phenom.ffwll.local>
 <811e5816-c9d7-72b8-2836-a3d1891bb762@amd.com>
 <CAKMK7uGmXiPUJEyC87bS5vTCtHTG7HFP=C-DQA0pQHB6mpB66A@mail.gmail.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <fe537d78-0737-f1b1-a740-66efa93e94a9@amd.com>
Date: Thu, 24 Jun 2021 19:56:10 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <CAKMK7uGmXiPUJEyC87bS5vTCtHTG7HFP=C-DQA0pQHB6mpB66A@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Originating-IP: [2a02:908:1252:fb60:c089:94ee:b4ef:e121]
X-ClientProxiedBy: AM0PR03CA0014.eurprd03.prod.outlook.com
 (2603:10a6:208:14::27) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:c089:94ee:b4ef:e121]
 (2a02:908:1252:fb60:c089:94ee:b4ef:e121) by
 AM0PR03CA0014.eurprd03.prod.outlook.com (2603:10a6:208:14::27) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4264.19 via Frontend Transport; Thu, 24 Jun 2021 17:56:13 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 78a207e4-04dd-4b7d-76c0-08d937395bfd
X-MS-TrafficTypeDiagnostic: BL0PR12MB4754:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BL0PR12MB4754B831E3A2525ACCCFA61B83079@BL0PR12MB4754.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: cPeM9ylf4zrisrBTW6Oum7k1YCFyy+pM18VD8PFaaTXjQ8Gi7nV6W7gkx1OA26taWgIG5RUteTv/7i+pQ4lZaxjnOF9D5vjvva/NqxOsswn0N5vsEmGxkISBRKBvEXHpIOXONQlQIoGsrs5fgodUK/qV5rxboVNO51Nfw9jHA5TRNtBSeC8pW2rjWL158DsUDluz69y7rwlTF5IRiO3sLppIKZS3qfIMJ4++nP/OXMBzk+rHfI18ixd9xpGmjxE8FA0ethj4SQMtQNesx8x17OORqFqiqlnEKRLB2nltchUvReKGzP38VzMtp39Dn43YC4zzMStRoXtXvoPPZXVlzvxsX16w+iNYgwDPSm1rUYdxgt+9stuHjEURqUSXRNSHukTMkQu/zn8O9TnWvr1KCnJpJ1Hw1xjLsV04LnWQeaylGR0+1m4gNU/0I75zs6ScHYrMu5OKPoKD6kvCwYQEH01/QjjZp9dY1MWAGq9hG2Cr2dDLyo7j5Qf9BHo3gzL7xiX65pf8Qf89UWl+ptifeSRuCmwJSxSKKlYVQo565cXiG5adyk5FL7AHt61eVHiXNK2UbGtrP5/4utLrMMlJ+cA5T1ao6RR89YWKQtYESPVRV1F4yJawI3ArDeoNY4tiIQwpf8bDFBrzHLsK4smq1pP7R/YSuHpJ2Az7x/VSQL34WL7u8A/nqquimLaRYItp
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(39860400002)(376002)(366004)(136003)(396003)(316002)(6916009)(38100700002)(54906003)(8676002)(31686004)(36756003)(8936002)(5660300002)(478600001)(66574015)(83380400001)(31696002)(16526019)(53546011)(66476007)(66946007)(2616005)(86362001)(66556008)(186003)(4326008)(2906002)(6486002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VjdIZ25YU2tnUThGRDR1VlhkeDZNL2tSN0JQMU0wYTEvN3Rub1JUeWtoQTJG?=
 =?utf-8?B?dUU2L0Jxb1F0cDVlNHZUSG1VQWNPUk1yOXNWU1BVSGQ5bkVNaWpNaG1HeUlW?=
 =?utf-8?B?bVJXNHRoUTJqbnNkSFBnODR1cTFLajJNY1hjT1AzM0RXcGlXTjF5OGdUSmNu?=
 =?utf-8?B?OWdTVXFVS0w2Mklnd2lKcUZPOXZ2b3M2NU50azlEUnBYcDFLdkd3Y2o0SjFq?=
 =?utf-8?B?a3VEd21WMytDbFdxZTdMQkJnN3ZGbWIybVZzRU81ODNZRDRtMzk3Zy9xMTE0?=
 =?utf-8?B?N0R2YTRyeGJFMmlVWG8rUnZHZy9IV0VUVFVoZVJXb3NpYVJLYXMzY0dLTURh?=
 =?utf-8?B?ZTd0eXRBZTdwUHFCMzgxdTlHL3c2cDdzZFovSWFjRStOMi93OTJYcEpua0Z5?=
 =?utf-8?B?ZndpZWVzM2N1Z1FqZ3JiTFJOMjl0RGVyc1BFZGhtbFhrNkJxYUNMQWswa3Aw?=
 =?utf-8?B?RlFqc1REU2dXN2VQQzhPdlNqTkc0RWY5SUcwSlRIajFubGc3N0ZEbHA4OWxr?=
 =?utf-8?B?QWRmMWlYMEJOU25ndDcvanV5K2JHUFFOd3FscEUzeFprZW5ONkVwRzUwMFBQ?=
 =?utf-8?B?Qm9GWEl2endhYm5jMUtpRFE5TUg0YnZoV29GYlpqaFFUVWxXTXNBWXJqTDQy?=
 =?utf-8?B?SmhvRE9Pcittb0k4ejFsWU1lVnZDZWpKNndsWERvZkllakdLbUxQMkFWLzUr?=
 =?utf-8?B?dFRMQkVudkpkTWZPNExGdWp3UUV3RklMcFBjZFZNRHNYeWh4M1RKdE9yeW9Q?=
 =?utf-8?B?dFJ5TkNvL0tONkFxMExzNVB0Q2EwNFB6OU1HQ1BwQkRMNXZWQWxaL210aGhL?=
 =?utf-8?B?TU5oK3graVdJOW1xSUwzenhUKzh6ZnJkLzJQaVJvN1VhNGhoREUzcXh3R0xO?=
 =?utf-8?B?QWpLcWFiVkJWQURSZUwwK3p5dFM0bjNxTlREWFVQYmFsTno1ekhER09nWWor?=
 =?utf-8?B?aWx6eGxoY0FwODBwRWZySU5jczZ4UmdaaStTdkV4eWIvcnZaNjNLdlNMOFBT?=
 =?utf-8?B?dDNFQUxiQUdkUzdSR09YbHpCRVJYM3g5cFRDZmlnazlqcXlNQndKMkoxMitM?=
 =?utf-8?B?dXJDQnovSHNHMmVhMVdxT28ydHkwVVNTVFZSWnE4S0dRYWoraExDeE1EaG01?=
 =?utf-8?B?Wk9mZmZKOHhxZ0g5U1pCdkQrTE5BcGFGYk9KbGpTc3J3N3VVRnIxQ0V5Wi95?=
 =?utf-8?B?ZXRrbVk1MmpGMnBRVUptdHF5dDY1ejV2Z01VT2NuUmJESitqWFdPd29CbGxt?=
 =?utf-8?B?RjI0Uy9DYzFTVkFOZXIrMHNoNWFWU25RUU5yNEU2d3cxMm1RUlFnUkxLcWx4?=
 =?utf-8?B?ZnAvZFhGSEVuUFBFY2IyUEtMa3RpaGJORGh6NlkvcU02cUxYbVZubDhMTUtw?=
 =?utf-8?B?bWVjVWdwVzFDV3NKOWZLOUE3L1Z2bTNqbDFQUjhNRVpWOWU2U3l3SFFBSC9w?=
 =?utf-8?B?cHFQZWlFRkR5dkZ5VDQ5Q2x5ekk5S3pJWjV4bGZ2eWFJck1jVFpwTFMvZTNS?=
 =?utf-8?B?U0FNbHZ6bnVISFo5R2J0WmxMb3RIUlFoVTl1Ky9Qb1JyL3daaVBlekRsYlFi?=
 =?utf-8?B?Z3hxR0ZQbnNoOFdhV2xoR3hScS95MWhOWkVtSlJ4cXgxZFFSdmFnSzNsR1JV?=
 =?utf-8?B?aENpZ09tTEYxOXVKS1YxL0NpclhhbU0rRmNyUHA2S3o0SDNqR3RpTThZdzNX?=
 =?utf-8?B?TThYUzJUTFcwYzRPQmJEazYzSXFnWUsrb3dyV0JLb0RTRm9ZSitCTkVoMzZy?=
 =?utf-8?B?em1sYk1FUkRYV3ZGZ25HWmI3MTkrYU1Fb3lRMzE1VFdCYmxmWnB2dU5xOVJQ?=
 =?utf-8?B?MzU1RDdFY1VyS0NZcmFYYVhKS21XWmQ2eGZrNkVlcWlvbkRkMkFCNjJETnp1?=
 =?utf-8?Q?iMuFI3Vpw8xVn?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 78a207e4-04dd-4b7d-76c0-08d937395bfd
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jun 2021 17:56:14.7296 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Qc0EAFBGTUlLlGXLa4E+jyVDyP9f2+qgivrb2sBKw6cDJTWD0UvL+M1iHmh07bQE
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB4754
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
Cc: Jack Zhang <Jack.Zhang1@amd.com>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Luben Tuikov <luben.tuikov@amd.com>, Alex Deucher <alexander.deucher@amd.com>,
 Daniel Vetter <daniel.vetter@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 24.06.21 um 19:43 schrieb Daniel Vetter:
> On Thu, Jun 24, 2021 at 7:38 PM Christian König
> <christian.koenig@amd.com> wrote:
>> Am 24.06.21 um 19:29 schrieb Daniel Vetter:
>>> On Thu, Jun 24, 2021 at 07:03:10PM +0200, Christian König wrote:
>>>> Am 24.06.21 um 16:00 schrieb Daniel Vetter:
>>>>> This is essentially part of drm_sched_dependency_optimized(), which
>>>>> only amdgpu seems to make use of. Use it a bit more.
>>>>>
>>>>> Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
>>>>> Cc: "Christian König" <christian.koenig@amd.com>
>>>>> Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
>>>>> Cc: Luben Tuikov <luben.tuikov@amd.com>
>>>>> Cc: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
>>>>> Cc: Alex Deucher <alexander.deucher@amd.com>
>>>>> Cc: Jack Zhang <Jack.Zhang1@amd.com>
>>>>> ---
>>>>>     drivers/gpu/drm/scheduler/sched_main.c | 7 +++++++
>>>>>     1 file changed, 7 insertions(+)
>>>>>
>>>>> diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
>>>>> index 370c336d383f..c31d7cf7df74 100644
>>>>> --- a/drivers/gpu/drm/scheduler/sched_main.c
>>>>> +++ b/drivers/gpu/drm/scheduler/sched_main.c
>>>>> @@ -649,6 +649,13 @@ int drm_sched_job_await_fence(struct drm_sched_job *job,
>>>>>      if (!fence)
>>>>>              return 0;
>>>>> +   /* if it's a fence from us it's guaranteed to be earlier */
>>>>> +   if (fence->context == job->entity->fence_context ||
>>>>> +       fence->context == job->entity->fence_context + 1) {
>>>>> +           dma_fence_put(fence);
>>>>> +           return 0;
>>>>> +   }
>>>>> +
>>>> Well NAK. That would break Vulkan.
> I'm assuming your reply means the NAK is retracted and was just the
> usual "this doesn't perfectly fit for amdgpu" reflex?

Well rather "NAK, you haven't considered that special handling in amdgpu 
and if you really want to unify this you need that as well."

>
>>>> The problem is that Vulkan can insert dependencies between jobs which run on
>>>> the same queue.
>>>>
>>>> So we need to track those as well and if the previous job for the same
>>>> queue/scheduler is not yet finished a pipeline synchronization needs to be
>>>> inserted.
>>>>
>>>> That's one of the reasons we wasn't able to unify the dependency handling
>>>> yet.
>>> That sounds like an extremely amdgpu specific constraint?
>> Yeah, that's totally hardware specific.
>>
>> It's just that I don't know how else we could track that without having
>> the same separation as in amdgpu between implicit and explicit fences.
>> And as far as I understand it that's exactly what you want to avoid.
>>
>> As I said this turned out to be really awkward.
>>
>>> You're also the
>>> only one who keeps track of whether the previous job we've scheduled has
>>> finished already (I guess they can get pipelined and you don't flush by
>>> default), so you insert fences.
>> Yes, exactly that.
>>
>>> I guess we can add a await_fence_no_dedup or so for amdgpu, but I'm not
>>> sure why we have to inflict this design constraint on all other drivers?
>>> At least I'm not seeing anything in lima, panfrost, v3d or entaviv that
>>> would break with this, and i915 will also be perfectly fine.
>>>
>>> Also note: I'm not using this for amdgpu, exactly because there's a few
>>> funny things going on.
>> Yeah, exactly the reason why we never unified this.
> Yeah there's clear limits to this, because you also can't use the
> await_implicit helper, because you have to keep filtering for owner or
> the current amdgpu uapi goes horribly slow. I think the benefit would
> be just that we could share the datastructure and the book-keeping,
> but aside from that you'd need your own integration in amdgpu.

Yeah, but that is trivial. The _add_dependency() function (or however we 
want to call it) needs to be exported anyway for adding fences from 
syncfile and syncobj.

Or do you also want to unify the handling for those?

> One idea I just had was whether we could use the tag bits xarray has
> for the amdgpu purposed. Like we could do a
> drm_sched_job_await_fence_tagged, where you supply additional
> information (like the "this might be relevant for the vm_flush" and
> things like that). Afaiui xarray tags are very fast to enumerate on if
> you're looking for specific tags, but I might be wrong. Ideally this
> would avoid the need for the duplicated amdgpu_job->sched.

That could work.

Essentially we just need the information from the scheduler which is the 
last fence which was dependency optimized.

In other words when you push jobs like those to the same scheduler

J1
J2 -> depends on J1.
J3 -> depends on whatever, but not j2

The hardware needs to insert a flush between J2 and J1, but not between 
j3 and j2.

This makes roughly 19% performance difference for some OpenGL games and 
incorrect rendering for Vulkan if you mess it up either way or the other.

Regards,
Christian.


>
> Cheers, Daniel
>
>
>> Regards,
>> Christian.
>>
>>> Finally: You _really_ need explicit dependency handling for vulkan in your
>>> uapi, instead of the kernel second-guessing what userspace might be doing.
>>> That's really not how vulkan is designed to work :-)
>>> Cheers, Daniel
>>>
>>>
>>>> Christian.
>>>>
>>>>>      /* Deduplicate if we already depend on a fence from the same context.
>>>>>       * This lets the size of the array of deps scale with the number of
>>>>>       * engines involved, rather than the number of BOs.
>

