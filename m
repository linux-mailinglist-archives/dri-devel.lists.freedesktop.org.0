Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E89885802D
	for <lists+dri-devel@lfdr.de>; Fri, 16 Feb 2024 16:08:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B65310E3A6;
	Fri, 16 Feb 2024 15:08:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="zjhpQflv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2045.outbound.protection.outlook.com [40.107.220.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7293610E3A6;
 Fri, 16 Feb 2024 15:08:35 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LBP3M5w8Xi2DmE+zwsSduFxXzQA1+slYHA9KWr8YNg/nmtQpDvX3dD0t9ZboTeMsSn3ZGMxt3Xqs+ax3yEn18yC+cCAOetKftXndPmo7l75nceN3EYEIrGzMfW/STp77FOT9TmNIJuU4kj9RfsTG8Opd6V3xL/oXmkvSYD7JfDMvIbs3VBlXamPPIaT25kr42DSYTU4Woj0Oi2g9VJ175/giIzsDadTKpx01MR0Si2UEu7aYRWrTfmoJc7+mPN6Xerz3XGfsgNxjLoGHukMBjH6nSK1d4gqL2JkRMCI1Xg0r92IRfVVxrfuHtXkuWzCWeSYHBkbRme4U2e567X5bkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0es5ATqrVQETTXcQibyaq5bGkIm28TCUwGZza/ETTco=;
 b=Qwk8/80bWqLrCRcdFN7hjeiUsLCScCzKywHAi6fCbrWWI3mzqLILBTGTH5X3EXZ5GIits0RkMQg6SDPH+eNmAR1DPztdPpYTzhgvOi61t9txgUgATCQ8hdywnc2X5OFw3h10XjBBQsgKG8EL3yg0SkVNJytUO1d1sy4LR967A4eChdGJRSmCS9dOrO40/uxq2NkJFWxF+au2X/AsOWtaa8C97zjX2vj8hzr3csGBIhheWuAoZEiq1Vjf4fmiD1lOdJSgft5lqIzeQ+D19X+yGXpQOMpuUrHxEhzaxN32qiSz0VPnSBqeRNOampE/i+l9Pi7moo1/WLxe8BNtvAUfKw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0es5ATqrVQETTXcQibyaq5bGkIm28TCUwGZza/ETTco=;
 b=zjhpQflvgdRl2iul9E5YZmkZgX0z1eOSoOpyiAViRqJ7PsEJrXDaj5gx5uYYEsHN62MXmH607njrsHUchdWAWIUUOnmV4YOXVfsD+xGtJa2GbzlAGOjGkrAEzZBOsd/iJDT8l3/HJ3z0erv0e7XwHqLy6cT1J6jDvGb5kjgFY7o=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by DM4PR12MB7741.namprd12.prod.outlook.com (2603:10b6:8:103::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7316.12; Fri, 16 Feb
 2024 15:08:30 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::e1fb:4123:48b1:653]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::e1fb:4123:48b1:653%4]) with mapi id 15.20.7292.022; Fri, 16 Feb 2024
 15:08:30 +0000
Message-ID: <935d91d6-c5e2-48ea-854f-8041b0ca2adb@amd.com>
Date: Fri, 16 Feb 2024 16:08:23 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 3/3] drm/buddy: Add defragmentation support
Content-Language: en-US
To: Matthew Auld <matthew.auld@intel.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org
Cc: alexander.deucher@amd.com, felix.kuehling@amd.com,
 mario.limonciello@amd.com
References: <20240208155000.339325-1-Arunpravin.PaneerSelvam@amd.com>
 <20240208155000.339325-3-Arunpravin.PaneerSelvam@amd.com>
 <af43196c-d926-454b-8914-c5753f5d3799@intel.com>
 <8f218231-68ae-4a9f-880c-11a37fac91f2@amd.com>
 <292710a7-27be-497d-b6a7-67f964e41ed5@intel.com>
 <26d13e0c-c52a-4681-bea8-4a631b514edd@gmail.com>
 <8224c34a-aca5-415e-9d6f-c061471f0cff@intel.com>
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <8224c34a-aca5-415e-9d6f-c061471f0cff@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FRYP281CA0014.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10::24)
 To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|DM4PR12MB7741:EE_
X-MS-Office365-Filtering-Correlation-Id: a1ba747a-a45f-4b91-a305-08dc2f01225b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: fDdDHHgWkxHZAH1H55Rjk3CDk3SHo+DOKEaJsyETM03Zo6HLrF6zbrrm4t9YZ9jee4OP68vej0y8cA3HuTJG1Y4lgE1CrpXX7SV8W7uPBovibO5Edc73kCSR6XYMpfpQyx21Sh4ZFud/MjAvlHwSy6aF3Fidb68yc0xz7bu6EDcc7xYARJWxgMTOwSx9HcAYW5azTpPMOY/TuK0kQ/uJvO6izW0pwUgynLY8oSICnF2lswsXNLqln4ndaksRpNJREK+tEj6UshTUYk4SGEzWP30AgMu5+so/Ul5+OojHQzNeKihXTJXmni8AXPD3CFNawRPnpBeCHyS7AzuA171mK1AKyDmzt0w/bC9fjXjd2XwROAHuIXDb97JqBAIu5NS/utvM53/Zv9R4ChFLn0NVnaySVXYGYoTw2oT9R8SJR42jkpaxpy84J6ve5CbrzAmB/rHhmV+DjyAVnvNjQEJ8AdkIoHHoGYWlsMdGxmwNni3QvtHD4NsC+1Gnrsi5yH1gpzFWoOBigi+amiq7xdIZ6pOLorLsUNEhTXGT4RLaTisv/ZJqZXY42ffFKvyXbik1
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(136003)(346002)(396003)(39860400002)(376002)(366004)(230922051799003)(230273577357003)(64100799003)(451199024)(1800799012)(186009)(6666004)(6512007)(478600001)(6486002)(31686004)(41300700001)(5660300002)(2906002)(8936002)(4326008)(8676002)(6506007)(66476007)(53546011)(316002)(110136005)(66556008)(66946007)(66574015)(83380400001)(31696002)(86362001)(38100700002)(36756003)(26005)(2616005);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eTNpa08zcG1IVEZIL2p3WHlQMEFOdDJEOUJqMlFkcjZ0em4xa08xSWQ4MjM4?=
 =?utf-8?B?QkYvVjB3OFFYL2NWZ3pDZjArblJPQklsTUdERlR0aFU5NDFmR0RPM0VuQnlV?=
 =?utf-8?B?MExuTVo0MzQ4dzlFMUtYbmJzdlZ5dEVDRCtQQ1hrTng2SUR1NFZJdE9LcS9l?=
 =?utf-8?B?Um8xUU1LbG9BZU9vU3lOczY1M0dBam1zM2phcjEza2UwcUZGZ0txS2NqcCsr?=
 =?utf-8?B?aVB1QVNXbmFVWjh1VjhRY3VYU3NzTndVdktINkJPbmhaV3N5bjBKMGRwTU1S?=
 =?utf-8?B?dHAzZjdIZVVBUDlIamFsK2x0ZWpKMEJuRUVlcUppUnEySzVwdUFwMS82bEd0?=
 =?utf-8?B?dWg0L3ZkMzROTXhmcGtLbTlrb01WLzJ3dko2QVRFS2p6QmRVMlVaYkFDMTZF?=
 =?utf-8?B?OE1kMlI0bU52U2xLbHhqU0hvVzhmeGdWaytLR0RCSndPYXU5UzNxVGJ5enpM?=
 =?utf-8?B?RVlxVmJBcThPb3daSzNxckh0dVhFMEl0SW5zNTJGcEphUGxFT1dKc21rVUFO?=
 =?utf-8?B?MWxnSVY3THJaSE8vanZBTWVzb3FVSzJsaGhwQkx0VHdQaTBDK0plakNheE5n?=
 =?utf-8?B?dzZ5YVR6RXNFcFRjcHVpaldrbjU5bWdBR08rZDR6QlZpd1RtTzRGTjNubGFO?=
 =?utf-8?B?SFU0cmY2YjJqdkFzQmFpYk5oZnJlNGdjS3FqeVhTSmdDUzVLVU96K0VVWGYz?=
 =?utf-8?B?QVNSM1R4L0phZjAyNVB3TG1HSlBGZHhmZGttMVhQRGhXcDVkL1doR1VmYWdi?=
 =?utf-8?B?ZWlQZXAyODhQMUNGN29qV2gyK0JXUkxtZXdTbml4UkdRYzdMaUtCNVhIUmZ1?=
 =?utf-8?B?L0lhQjdmSVNoM21ydk1zMmNWVzVtSTVkemxnemJTM0hQc3FacXkySlNoV1Vo?=
 =?utf-8?B?ZHllWmI2bUU4SUJ4YUNsWFlLbFI1THVMR2paalh1d2JZbThDS2RUZWxkQUhD?=
 =?utf-8?B?ZlRlamFMdnlXb2RnNm82b1MvTUNXbEx3S2F6ZGxxdW1EdHlzditlZTJ0SHZo?=
 =?utf-8?B?T1JBaVJuSFlRNGxWZktkUzZZS3YzSXZsMy9mTDBOUVFJZDcyR2FhcXpOMjhE?=
 =?utf-8?B?MW9mMzRhRXJpb0hHZ0N3OVpPaHhEcThZemZkd2ZzeDhmbys0dDlYWDFVMGVn?=
 =?utf-8?B?OU1lUDdSbFFiSjIwVHJCbm1QdGxZY0NkUS81bDhNM1FTNWNTS0h3R3JGYThn?=
 =?utf-8?B?Z3JrNkFwVytFR1dsRXhlUFVFQ202NFp6RVdpdHlVVUJzYmhDYTEwMG5oNERu?=
 =?utf-8?B?M3NJUTJnR0YwdXV6RzBrRU10clVvQjhSeEFmOGJkZ1VPTzNPRVJSTmhJeng5?=
 =?utf-8?B?blZaeGRORG5WVW1YTnVUOGpQVC9GQVFLbkM4TEFsSzRwM2gzZEVaMm5KMVBT?=
 =?utf-8?B?RDFHSFJOUC80QkdtMEFyeDJMZi8rV0J2bTM4R3lLWnRpYmIvc1ZPaUhuSHc1?=
 =?utf-8?B?SVlMTThydnBpelJsRmYyUUhYS3h0aDJOd0hDditGcExhd2EyRlA5dEJxVjZS?=
 =?utf-8?B?T0ZiWGdvRHM0M20rT2xVU2RacHdVWE5mWkJJN0ljRDhVdkkyZXZpblRqV1Zj?=
 =?utf-8?B?OVA4V0V4RldFRUR5MnlqMmJ0cGJGZXRYK1V4TWpGWm1qMWR3WnRoazRUdFI3?=
 =?utf-8?B?bUg2WWpJV0h1WVlKcjhHd293ZGhDTFQ3SjhSOG9SVk05WEVVcHhIRFJ4SkVU?=
 =?utf-8?B?bEVkTks4eDlHRklTMWJtZU5MTXh2em1OaUhPeDVFUnFockw4WGpsQnJzbitp?=
 =?utf-8?B?NWFsSTI1UmhyaE5VeDNJU0F4N2tLTEFISEFBOGUzc3lrR0xoWmFRUzBTRkxP?=
 =?utf-8?B?RG5TVVJkMmNzVVg0ZTNUaXR4TWZBMDVVWTE3c2E4NWRqMi9teXhCcUQ2ZGVr?=
 =?utf-8?B?MENkNlNON1AxT21vbExSREdtYzBaK2c4YUl0S1I5ZVBYeGdhQUNONG5WeFZ4?=
 =?utf-8?B?YXdTMXlJcTBXNGMyZzVRNTJnWEthaW1KN0Yzd3RRTFhGeGNBU3dXZkZvVkJT?=
 =?utf-8?B?SGVSb2VuZEtJWjVOOUlqWWR4aG9obU40Zi9QdGlPQXNmVjdCMFBlRXYxNGRB?=
 =?utf-8?B?YjRCZk8zQ3Z5MktVZ3JkdGJpQkpPOTB2bFRIbkY1VUdJWGdhMlVrbUdCT1hO?=
 =?utf-8?Q?HeZknt5lhSjcNDSEa37oYreZw?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a1ba747a-a45f-4b91-a305-08dc2f01225b
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Feb 2024 15:08:29.9870 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hoDLbvVz24/FosHH7Rz4dTktayt9M2O1YnVMiwrcmkGNRY32tOB/LM5Aifmmi/fB
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB7741
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

Am 16.02.24 um 15:47 schrieb Matthew Auld:
> On 16/02/2024 14:02, Christian König wrote:
>> Am 16.02.24 um 14:21 schrieb Matthew Auld:
>>> On 16/02/2024 12:33, Christian König wrote:
>>>> Am 16.02.24 um 13:23 schrieb Matthew Auld:
>>>>> On 08/02/2024 15:50, Arunpravin Paneer Selvam wrote:
>>>>>> Add a function to support defragmentation.
>>>>>>
>>>>>> v1: Defragment the memory beginning from min_order
>>>>>>      till the required memory space is available.
>>>>>>
>>>>>> Signed-off-by: Arunpravin Paneer Selvam 
>>>>>> <Arunpravin.PaneerSelvam@amd.com>
>>>>>> Suggested-by: Matthew Auld <matthew.auld@intel.com>
>>>>>> ---
>>>>>>   drivers/gpu/drm/drm_buddy.c | 67 
>>>>>> +++++++++++++++++++++++++++++++------
>>>>>>   include/drm/drm_buddy.h     |  3 ++
>>>>>
>>>>> No users?
>>>>
>>>> Other question is how can a buddy allocator fragment in the first 
>>>> place?
>>>
>>> The fragmentation is due to pages now being tracked as dirty/clear. 
>>> Should the allocator merge together a page that is dirty with a page 
>>> that is cleared? When should it do that? User wants to be able to 
>>> keep the two separate if possible. For example, freeing one single 
>>> dirty page can dirty a huge swathe of your already cleared pages if 
>>> they are merged together. Or do you have some some other ideas here?
>>
>> Sorry, that was not what I meant. I should probably have been clearer.
>>
>> That dirty and clean pages are now kept separated is obvious, but why 
>> do you need to de-fragment them at some point?
>
> Ah, right. At the very least we need to do something similar to this 
> at fini(), just to ensure we properly merge everything back together 
> so we can correctly tear down the mm. Outside of that the thinking was 
> that it might be useful to call when allocating larger min page-sizes. 
> You might now be failing the allocation due to fragmentation, and so 
> in some cases might be better off running some kind of defrag step 
> first, instead of failing the allocation and trying to evict stuff. 
> Anyway, if that is not a concern for amdgpu, then we just need to 
> handle the fini() case and can keep this internal.

Ah, yes that makes more sense.

So you basically force merge the pages before fini to avoid warnings 
that the buddy isn't empty.

Thanks, that answers my curiosity. But I unfortunately still don't have 
time to dig deep enough into this for a review.

Thanks,
Christian.

>
>>
>> Christian.
>>
>>>
>>>>
>>>> Christian.
>>>>
>>>>>
>>>>>>   2 files changed, 59 insertions(+), 11 deletions(-)
>>>>>>
>>>>>> diff --git a/drivers/gpu/drm/drm_buddy.c 
>>>>>> b/drivers/gpu/drm/drm_buddy.c
>>>>>> index 33ad0cfbd54c..fac423d2cb73 100644
>>>>>> --- a/drivers/gpu/drm/drm_buddy.c
>>>>>> +++ b/drivers/gpu/drm/drm_buddy.c
>>>>>> @@ -276,10 +276,12 @@ drm_get_buddy(struct drm_buddy_block *block)
>>>>>>   }
>>>>>>   EXPORT_SYMBOL(drm_get_buddy);
>>>>>>   -static void __drm_buddy_free(struct drm_buddy *mm,
>>>>>> -                 struct drm_buddy_block *block)
>>>>>> +static unsigned int __drm_buddy_free(struct drm_buddy *mm,
>>>>>> +                     struct drm_buddy_block *block,
>>>>>> +                     bool defrag)
>>>>>>   {
>>>>>>       struct drm_buddy_block *parent;
>>>>>> +    unsigned int order;
>>>>>>         while ((parent = block->parent)) {
>>>>>>           struct drm_buddy_block *buddy;
>>>>>> @@ -289,12 +291,14 @@ static void __drm_buddy_free(struct 
>>>>>> drm_buddy *mm,
>>>>>>           if (!drm_buddy_block_is_free(buddy))
>>>>>>               break;
>>>>>>   -        if (drm_buddy_block_is_clear(block) !=
>>>>>> -            drm_buddy_block_is_clear(buddy))
>>>>>> -            break;
>>>>>> +        if (!defrag) {
>>>>>> +            if (drm_buddy_block_is_clear(block) !=
>>>>>> +                drm_buddy_block_is_clear(buddy))
>>>>>> +                break;
>>>>>>   -        if (drm_buddy_block_is_clear(block))
>>>>>> -            mark_cleared(parent);
>>>>>> +            if (drm_buddy_block_is_clear(block))
>>>>>> +                mark_cleared(parent);
>>>>>> +        }
>>>>>
>>>>> Maybe check if the two blocks are incompatible and chuck a warn if 
>>>>> they are not? Main thing is not to hide issues with split blocks 
>>>>> that should have been merged before.
>>>>>
>>>>>> list_del(&buddy->link);
>>>>>>   @@ -304,8 +308,49 @@ static void __drm_buddy_free(struct 
>>>>>> drm_buddy *mm,
>>>>>>           block = parent;
>>>>>>       }
>>>>>>   +    order = drm_buddy_block_order(block);
>>>>>>       mark_free(mm, block);
>>>>>> +
>>>>>> +    return order;
>>>>>> +}
>>>>>> +
>>>>>> +/**
>>>>>> + * drm_buddy_defrag - Defragmentation routine
>>>>>> + *
>>>>>> + * @mm: DRM buddy manager
>>>>>> + * @min_order: minimum order in the freelist to begin
>>>>>> + * the defragmentation process
>>>>>> + *
>>>>>> + * Driver calls the defragmentation function when the
>>>>>> + * requested memory allocation returns -ENOSPC.
>>>>>> + */
>>>>>> +void drm_buddy_defrag(struct drm_buddy *mm,
>>>>>> +              unsigned int min_order)
>>>>>
>>>>> Just wondering if we need "full defag" also? We would probably 
>>>>> need to call this at fini() anyway.
>>>>>
>>>>>> +{
>>>>>> +    struct drm_buddy_block *block;
>>>>>> +    struct list_head *list;
>>>>>> +    unsigned int order;
>>>>>> +    int i;
>>>>>> +
>>>>>> +    if (min_order > mm->max_order)
>>>>>> +        return;
>>>>>> +
>>>>>> +    for (i = min_order - 1; i >= 0; i--) {
>>>>>
>>>>> Need to be careful with min_order = 0 ?
>>>>>
>>>>>> +        list = &mm->free_list[i];
>>>>>> +        if (list_empty(list))
>>>>>> +            continue;
>>>>>> +
>>>>>> +        list_for_each_entry_reverse(block, list, link) {
>>>>>
>>>>> Don't we need the safe_reverse() variant here, since this is 
>>>>> removing from the list?
>>>>>
>>>>>> +            if (!block->parent)
>>>>>> +                continue;
>>>>>> +
>>>>>> +            order = __drm_buddy_free(mm, block, 1);
>>>>>> +            if (order >= min_order)
>>>>>> +                return;
>>>>>> +        }
>>>>>> +    }
>>>>>>   }
>>>>>> +EXPORT_SYMBOL(drm_buddy_defrag);
>>>>>>     /**
>>>>>>    * drm_buddy_free_block - free a block
>>>>>> @@ -321,7 +366,7 @@ void drm_buddy_free_block(struct drm_buddy *mm,
>>>>>>       if (drm_buddy_block_is_clear(block))
>>>>>>           mm->clear_avail += drm_buddy_block_size(mm, block);
>>>>>>   -    __drm_buddy_free(mm, block);
>>>>>> +    __drm_buddy_free(mm, block, 0);
>>>>>>   }
>>>>>>   EXPORT_SYMBOL(drm_buddy_free_block);
>>>>>>   @@ -470,7 +515,7 @@ __alloc_range_bias(struct drm_buddy *mm,
>>>>>>       if (buddy &&
>>>>>>           (drm_buddy_block_is_free(block) &&
>>>>>>            drm_buddy_block_is_free(buddy)))
>>>>>> -        __drm_buddy_free(mm, block);
>>>>>> +        __drm_buddy_free(mm, block, 0);
>>>>>>       return ERR_PTR(err);
>>>>>>   }
>>>>>>   @@ -588,7 +633,7 @@ alloc_from_freelist(struct drm_buddy *mm,
>>>>>>     err_undo:
>>>>>>       if (tmp != order)
>>>>>> -        __drm_buddy_free(mm, block);
>>>>>> +        __drm_buddy_free(mm, block, 0);
>>>>>>       return ERR_PTR(err);
>>>>>>   }
>>>>>>   @@ -668,7 +713,7 @@ static int __alloc_range(struct drm_buddy *mm,
>>>>>>       if (buddy &&
>>>>>>           (drm_buddy_block_is_free(block) &&
>>>>>>            drm_buddy_block_is_free(buddy)))
>>>>>> -        __drm_buddy_free(mm, block);
>>>>>> +        __drm_buddy_free(mm, block, 0);
>>>>>>     err_free:
>>>>>>       if (err == -ENOSPC && total_allocated_on_err) {
>>>>>> diff --git a/include/drm/drm_buddy.h b/include/drm/drm_buddy.h
>>>>>> index d81c596dfa38..d0f63e7b5915 100644
>>>>>> --- a/include/drm/drm_buddy.h
>>>>>> +++ b/include/drm/drm_buddy.h
>>>>>> @@ -166,6 +166,9 @@ void drm_buddy_free_list(struct drm_buddy *mm,
>>>>>>                struct list_head *objects,
>>>>>>                unsigned int flags);
>>>>>>   +void drm_buddy_defrag(struct drm_buddy *mm,
>>>>>> +              unsigned int min_order);
>>>>>> +
>>>>>>   void drm_buddy_print(struct drm_buddy *mm, struct drm_printer *p);
>>>>>>   void drm_buddy_block_print(struct drm_buddy *mm,
>>>>>>                  struct drm_buddy_block *block,
>>>>
>>

