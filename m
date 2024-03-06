Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C168B873B14
	for <lists+dri-devel@lfdr.de>; Wed,  6 Mar 2024 16:46:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE8181132CB;
	Wed,  6 Mar 2024 15:45:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="fIaVgdIA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2073.outbound.protection.outlook.com [40.107.223.73])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7434F10FE65;
 Wed,  6 Mar 2024 15:45:57 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=G2naY67q7dEzTPMYnI5st5s0bmjBgKR3/03EcncaPsKpxE9PXVaFh5xIUJ9Dky0C524C0JHg6O2V2O+nbkA0VOCbnlVfvFiaOrea8httfyLFo2QhlXFz5hKQsnHRmfNVarXBvY22upNAAAgLeihfnFn+oNHJ5M77BAQBeMgMHJqmjjvx7mP888G4pwZQUvMmNsH/Toew4iSguy9jvcBfeLIyyAinPJht+5bUi7+fu6oroYQxXU5npOGPPtuKC6Rz2An0qrbZkVdkELmBr4tv84x2flj7C0FfXXdaP3eTakrZf8beGE4x1ewL61eXMgfIh2xMhs1kW4LkeFp4rwrb0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8Jn9hjH7fSThWmmiCnsIgaPmPxA+/2AldDtUbL8kQ5k=;
 b=IWdLBJnr3fdETrXLexSl1S9hs2I5hrlZ1nQ24bcB1n6WU28bRzizZS2V2EVIYo+a3t0SdCRlO/NpYKHmyAzLqOyWLX2hi0W6WVLoOZDg1VpiJRbM9ZCIQSqEFyArHr87kxp14PX0fo35pgiP6DYyN4w7mV8tD0R2kmDX8ZgKCbAhiXUIL2jtJ9MYXDdU97li1ZcIbLoPN3FFU42B9R61be1FHvGthl2Rf6GHWl+8E4lnhtrgHKQdaiybZVWfHLo5W8/ReqSolU/FrdG0jkysaShWz1n5qu+2NaijDbVQzdJKxNVues2x0ouX+GaFKsoLfLqsKy4v+xITfkdP2LThMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8Jn9hjH7fSThWmmiCnsIgaPmPxA+/2AldDtUbL8kQ5k=;
 b=fIaVgdIAqo1whMvH+XLgX9Cawy7+JL9D3227ti3Rli+yVsLXZZsOphL3TdmddZT6+g23R7dUPCJuko2qNobX2T6M+AHHZUJpultoDwNU2KPWdY0KGJyYwINZlLlooYUa9jIJqyOmcYGbF9Yn/USCqnNXzH8Zc87ZsStXHafUUqc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB4342.namprd12.prod.outlook.com (2603:10b6:208:264::7)
 by SA1PR12MB8095.namprd12.prod.outlook.com (2603:10b6:806:33f::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7362.24; Wed, 6 Mar
 2024 15:45:52 +0000
Received: from MN2PR12MB4342.namprd12.prod.outlook.com
 ([fe80::6610:4b4b:1f3a:151b]) by MN2PR12MB4342.namprd12.prod.outlook.com
 ([fe80::6610:4b4b:1f3a:151b%6]) with mapi id 15.20.7362.019; Wed, 6 Mar 2024
 15:45:52 +0000
Message-ID: <e22182ac-485a-4f0c-b5bd-f8c89572fc72@amd.com>
Date: Wed, 6 Mar 2024 21:15:44 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 3/3] drm/buddy: Add user for defragmentation
Content-Language: en-US
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org
Cc: christian.koenig@amd.com, alexander.deucher@amd.com,
 matthew.auld@intel.com, felix.kuehling@amd.com, mario.limonciello@amd.com
References: <20240304163220.3093-1-Arunpravin.PaneerSelvam@amd.com>
 <20240304163220.3093-3-Arunpravin.PaneerSelvam@amd.com>
 <77148946-83ef-4576-a26b-ec84f9a4c63a@gmail.com>
 <aaf76e24-787d-4ca7-b3af-3636d065c1f6@amd.com>
 <f0fae5dd-533b-4649-b338-935f4518036c@amd.com>
 <db55d7ac-0811-496f-81e3-56c742a9ae56@gmail.com>
From: "Paneer Selvam, Arunpravin" <arunpravin.paneerselvam@amd.com>
In-Reply-To: <db55d7ac-0811-496f-81e3-56c742a9ae56@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN2PR01CA0187.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:e8::14) To MN2PR12MB4342.namprd12.prod.outlook.com
 (2603:10b6:208:264::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN2PR12MB4342:EE_|SA1PR12MB8095:EE_
X-MS-Office365-Filtering-Correlation-Id: 58ff5481-8f20-4b76-5c6c-08dc3df480e8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: RAOuYybfiHVRk3jFb3UbgHsiotKPd9HQhSEH0y5zqVwucfJWiZKle0SUZozDKS18o+Ggu/UJRJznsafoz9+3nuEf1wksZ/9a3bSbsoUAxtDaVH6QMfAynaM6r9OKcRem3g2yt15PWVCHgSdsvvrRKAyePpXt1qwCfDrGNHjcjcNtOtM851o0zA497wyCD3BUh9U8jPXY8Va3CR6N9ZSqaPFOeUd5p6JwaQJtNrIjb0Yi4Ip+H8Vt+HHoPPfQL1GG5vCQJBWxBcnVkwfK0BIqVLvZuIde3RYKuqPItW3Lzc+IZFGz+MRFTsSvXYjVjXU0zFX4sOXo+qS1vhveSuAszTyMFP6IB5RiQlIQhIVv+Ywf46BkmJT+7ZRbq7Ai6bGSY/xOmS91X2asUUh9zAorRy9Tcz6RYnyDkUvsnYwiZhg+rHWCDYe+fqWiwgWP3jWnl0LM6jkMwm3ddmPW8Weg1ZM03roZDo8kPS0VvqDXVip0IPYzOexhJC7DXDjuUcYKW/Q9FNcC4e6SKdgJwM31VpPusxqiqrtmlnnpL+A4Q+KvSirZCVttY9xIbt2e/oi+inIlM5N0JnXd/0u/rKpjfbodSY5RGd72VcobvollSRRPqdBaofvHMBda36qacEg2Lt/gV5BzMPvf1ukCBugyFibMq5JE0rymCjpZQ5nhL+Q=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB4342.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NXpQai9GUjVtYlJUYmNla3FNQUtVZHRUUkVpM21pRjZabGxyaldwMk5GWHhZ?=
 =?utf-8?B?SGd5NnYxQ3Jtd2Vnbi92NGlzOHJPTW5nVWNGN2N3bmtMeVVEVVFFVjMxdzE1?=
 =?utf-8?B?MjZzQ3RZTzNOMXdYZjlPcm1FblNQb0VNQXNrQWNKYUJyWjM5ZWc3NXVxSkxo?=
 =?utf-8?B?a2p0Vk1RajFORzdka3pKWW5KWU1UdFNJMGRmMEtwQ1BYd0pLWk5vaDJ2M2Mw?=
 =?utf-8?B?a05KQVd2SmhhVGRLaW50eUorNGdYOUg4WWxaTDlzalR0cXRJVlhsMGJIYWMz?=
 =?utf-8?B?SGR0OVpCTUN5ak1VZ1lnU01XSHpnWDJmcEloeXdBRE1wUzdUMXlieEZUeDBF?=
 =?utf-8?B?alRBdkFlYzFEVms1cHp1enJCenB6cUF3OWtqUlVBSmJVTjNjUnRUN1hVQUF4?=
 =?utf-8?B?QTJ6a2F1ODNBMXJoQUU0VFVUWk9jRHg4eE10dlBuUk1YRW93SFQvenpGYU1m?=
 =?utf-8?B?ZkJOUTZBbXRnMUtqR3pKbkwxdFVya0lxSEkwSCsrZGNvczJJSzVtajJuNEVn?=
 =?utf-8?B?UWorcFFSdkFGRndka3pzOXd3U05LOTlub1FnNjQxQjc0ejdWMmlWWnlraXZS?=
 =?utf-8?B?UGxlM2d1cmxNWWxZakh0OHRLN0ZUQ1UzRTlXUWM0MC9hSTFHUGRacjdCMXMr?=
 =?utf-8?B?YmwxL3diZ1ZmMFJjTTg2T0UyNmNKeU1XWjE5UERwcE1vOVdLaVBRbi8vaVBy?=
 =?utf-8?B?SkJKNWN3WmpCTUZmUVFLc0pkaWhwQlVmYU1tMVpWcG5WQU03YkxkYzNjc1Mz?=
 =?utf-8?B?dkw2dXdPMlNndkJ1MFA4WUxFTE1DUXJ4WFVSN0xUYVp3SUs2QmZzc0ZLRnYv?=
 =?utf-8?B?YnJXZWlIV1dDZytaOEJsMzg2VFc4R05CWldtMGlOWkVxSm4xQ0ltOHhqV25z?=
 =?utf-8?B?MUJNT010K2c0TS84QWNpdEs2VUpXNVIrN04rN2lUUTRGRlFnRFIyNHMyaWxh?=
 =?utf-8?B?UXVCN3N3dGJzbzVlNDVPcG9wakZHdStrRWk4Y24wUHZpaUZvaDlnYk9LZCtX?=
 =?utf-8?B?NUx3bXRadHpJeWhOL3NoV2h4S0docWV2WURzS2RHdEZhQnpTNUJUa2VTaVBh?=
 =?utf-8?B?ZGNCNDRDT25KR1NCUTd3bTJNeEVFcFVzM0cwa3d6RUdhVThnZG9EV05BSUd4?=
 =?utf-8?B?T0xhS282bHk1eGJhUm5YcXpWd1ozSlh2cUVJQUtnRlN0VWlKanV1WEZBZnNu?=
 =?utf-8?B?NFM1dFZLODRDVVF4MDBrTkVJVkNQNE5vbFFSUUIwQVBKclZ0a2ZPS2FXNEpv?=
 =?utf-8?B?RGNyVWlsQVdaVzR5T3h0dUs0cjJLOWJ2bDJFR3J5Q0NqL2NpcWVKakY0SjZE?=
 =?utf-8?B?R2M3OGoxRUdrYU1GcWtyZXp4aUp5S0E5cnUrMmIyeDhaNUdQOWVCcDduYzAz?=
 =?utf-8?B?Z3luZ2xnY3E4WWkzTlN2QlFMZ2t5RHdRNi9GVG9vQng3QWUxeGpZTFpMUGtv?=
 =?utf-8?B?MWVzZndOd0k3MC9qQUJIbENjUDllSkovVWFpM2cwVGJwbm1qS2NwdTlNTGZ4?=
 =?utf-8?B?dmhlWUp5djNNSWtXSTk5bjNMd3dDa0tlZFc0Y2hlOTVwK3VuSnhCMkZsVlFE?=
 =?utf-8?B?YURqRUdmc0E0QzJvdzJocnI4L1hsOHlFdzNlRTlKa1NscDlMRGMzN3lYOWNk?=
 =?utf-8?B?Tk8yTmNjbS9GanZSbXBLcStoTXA1dCs3Y1RNWjQzeTl0VWlIcUpxREQ3NEJQ?=
 =?utf-8?B?NUhldS9ScXVTMTJyN0lFaDdLU3AyNWVDbXF4M2c2eXNzNEJQV2lPbTdjOEhy?=
 =?utf-8?B?Y1N5K3MxVjUwZnRTY0IvZUNzSWpjUWZyeWg2NFRrNkg0NnR6SGhtN2lLZjAz?=
 =?utf-8?B?Rk1IY205VnpMc0xFTmJsNkUxczl5RXdjSGxSRUJUUTBlRHVJY0s4QzRhM2NK?=
 =?utf-8?B?UGk3NVZCcjcwU2lPVXN2M3A5Nm50NnhQaHA1NUw0cG9xVzIwZFpReEE4Nktx?=
 =?utf-8?B?R3RPVElZMEFUZ3Ywd2lBb2dEeGJYcDR4ZDlJcFFWWjlXbUxqU0gzRlZBbFZq?=
 =?utf-8?B?aDlDR2JxSmV4ZHN5VkJCV1ZuWEdsQjRmVC92bkVoTlhBTnk3VVhlVE1oZklO?=
 =?utf-8?B?V01HeG1kd0tPRWltSUtDOHFOMjd1aE1IRnhremplekFQMTVIWWk0ck12aEVG?=
 =?utf-8?Q?0tA4w0pE/IzstdIcdSRxFR0FV?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 58ff5481-8f20-4b76-5c6c-08dc3df480e8
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB4342.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Mar 2024 15:45:52.7127 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Q9gWnSqMNXvK/M0I9wggCya9jZQCkr9fzxm7694nFpbmAxUhsJ92W4ChPKpHImGsgexm7VMkHKsHxfEagbMpIg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB8095
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

Hi Christian,

On 3/5/2024 5:41 PM, Christian König wrote:
> Am 05.03.24 um 12:14 schrieb Paneer Selvam, Arunpravin:
>> On 3/5/2024 4:33 PM, Paneer Selvam, Arunpravin wrote:
>>> Hi Christian,
>>>
>>> On 3/4/2024 10:09 PM, Christian König wrote:
>>>> Am 04.03.24 um 17:32 schrieb Arunpravin Paneer Selvam:
>>>>> Add amdgpu driver as user for the drm buddy
>>>>> defragmentation.
>>>>>
>>>>> Signed-off-by: Arunpravin Paneer Selvam 
>>>>> <Arunpravin.PaneerSelvam@amd.com>
>>>>> ---
>>>>>   drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c | 17 +++++++++++++++--
>>>>>   drivers/gpu/drm/drm_buddy.c                  |  1 +
>>>>>   2 files changed, 16 insertions(+), 2 deletions(-)
>>>>>
>>>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c 
>>>>> b/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c
>>>>> index e494f5bf136a..cff8a526c622 100644
>>>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c
>>>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c
>>>>> @@ -533,8 +533,21 @@ static int amdgpu_vram_mgr_new(struct 
>>>>> ttm_resource_manager *man,
>>>>>                          min_block_size,
>>>>>                          &vres->blocks,
>>>>>                          vres->flags);
>>>>> -        if (unlikely(r))
>>>>> -            goto error_free_blocks;
>>>>> +        if (unlikely(r)) {
>>>>> +            if (r == -ENOSPC) {
>>>>> +                drm_buddy_defrag(mm, min_block_size);
>>>>> +                r = drm_buddy_alloc_blocks(mm, fpfn,
>>>>> +                               lpfn,
>>>>> +                               size,
>>>>> +                               min_block_size,
>>>>> +                               &vres->blocks,
>>>>> +                               vres->flags);
>>>>
>>>> That doesn't looks like something we should do.
>>>>
>>>> We might fallback when contiguous memory is requested, but 
>>>> certainly not on normal allocation failure.
>>> yes, defrag here not useful for normal allocations. But worried 
>>> about the bigger min_block_size normal allocations.
>>> In such cases, I think we should move this drm_buddy_defrag() call 
>>> into buddy allocator file. For example if the required
>>> size is 1024KiB and if min_block_size is 256KiB, the allocator first 
>>> tries to find the 1024KiB block, when there is no single 1024KiB block,
>>> the allocator goes one level below in freelist and tries to search 
>>> for two 512KiB blocks and goes on. At one point of time if we have 
>>> less space,
>>> we might go further levels below to search four 256KiB blocks to 
>>> satisfy the request.
>>>
>>> Assuming if the allocator cannot find the first 256KiB block, that 
>>> time I think we might need to merge the two 128KiB blocks
>>> through defragmentation function. And again for the second 256KiB 
>>> block, we might need to call the defragmentation again to
>>> merge two 128KiB blocks or four 64KiB blocks to form minimum 
>>> alignment size of 256KiB. This goes on for the third and fourth
>>> 256KiB blocks to complete the required size allocation of 1024KiB. 
>>> Please let me know if my understanding is not correct.
>
> I don't think we should do that. We essentially have to support two 
> different use cases:
>
> 1. Non contiguous allocation with 2MiB min_block_size for everything 
> larger than 2MiB. Using a block size as large as possible is 
> desirable, but not something we enforce.
>
> 2. Contiguous allocations for display, firmware etc.. Here we need to 
> enforce a large block size and can live with the additional overhead 
> caused by force merging.
Thanks. I will make the changes accordingly.
>
>>
>> As you have suggested we can also rename this as force merge or some 
>> other names.
>
> Yeah, but just an suggestion. You are way deeper in the code and 
> handling than I'm, so feel free to name it whatever you think fits best.
Sure :)

Thanks,
Arun.
>
> Regards,
> Christian.
>
>
>>
>> Thanks,
>> Arun.
>>>
>>> Thanks,
>>> Arun.
>>>>
>>>> Regards,
>>>> Christian.
>>>>
>>>>> +                if (unlikely(r))
>>>>> +                    goto error_free_blocks;
>>>>> +            } else {
>>>>> +                goto error_free_blocks;
>>>>> +            }
>>>>> +        }
>>>>>             if (size > remaining_size)
>>>>>               remaining_size = 0;
>>>>> diff --git a/drivers/gpu/drm/drm_buddy.c 
>>>>> b/drivers/gpu/drm/drm_buddy.c
>>>>> index 40131ed9b0cd..19440f8caec0 100644
>>>>> --- a/drivers/gpu/drm/drm_buddy.c
>>>>> +++ b/drivers/gpu/drm/drm_buddy.c
>>>>> @@ -396,6 +396,7 @@ void drm_buddy_defrag(struct drm_buddy *mm,
>>>>>           }
>>>>>       }
>>>>>   }
>>>>> +EXPORT_SYMBOL(drm_buddy_defrag);
>>>>>     /**
>>>>>    * drm_buddy_free_block - free a block
>>>>
>>>
>>
>

