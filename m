Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 82D3B3768DA
	for <lists+dri-devel@lfdr.de>; Fri,  7 May 2021 18:32:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 55C336EE72;
	Fri,  7 May 2021 16:32:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2086.outbound.protection.outlook.com [40.107.223.86])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 33F846E05F;
 Fri,  7 May 2021 16:32:27 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=h8swBTOZkOgs4pdAnv/J7YJ+KYypzxe1JaCop4VThfyQMGj++suBau95DPj5TgE1dnasAVr9CUFhtQIVcSMbYwNz5pAhZ0+TjAk5WPLjKjkZ97NlQCXtBg//ZvNp7cpxOGKpIafQfFPQoa6XBN2Iqqjdvy+4CL0EeVtY3Z0ZZyTfKa2fUJbdry8SME3BDT2EhLBDIQEWW4G8V8m3q4Pc7rllsBkPpus1AcgZv3AgIun7Y0/f1H1lTzVrKhxKzFiYVzQqtlAZzaFSuU8m7lCPbB2e1Wg+oeDkI7TYR3hnkQP5NHNMheHlq9Bai3VYxVNA2ywkpxXzIpFSG13t15wpCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Lhd9+YVt3lHzeYkr8J8DUKMZBzOG98ntShXTc4HZS28=;
 b=P3XvNy+BTXU3nsYav1UD8IAoZFa60KJAmLp806smaD8HfowIeH9il7pby8VbAiv+XLLLVVinIHPJLCbwz/XmEgP0t4nwWf4cKsh5eh5vDz4Aq4c5YDjd+AsU//aokGx78OayVfZ5jfT8pmA2qpw1Vx9OP7dO7CF1XA6zjdqYgIkrTWCg2LXWkUrWUVzvnWz6ZXfx8JnES1ClP+ZNKLvZt2rPDN760XYfO0a9YoCMQ70x78CdecKSXdvKMXy3cwAfn5YvSFeVrmeR4UG6ejYLTIm1ysrRzCjot6F2JwnYQI3cxlRwCeP2Cz1bFA9eEDkmoQKagBBj3Mz8am+b3OrbRQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Lhd9+YVt3lHzeYkr8J8DUKMZBzOG98ntShXTc4HZS28=;
 b=aqIICd218fkpiCVRjOnp1sCm9NW+vAERyd83lgpCk3UcmwB54d/hDGZv+lnov1JKrODRlJGr8pfHjgIqEd5k78dQKS3fLNTAzYZCkBG5uM69yLTbAHR7kZ3Qy2DjZt5KKd/Ue5xcwgQC7uW2uDymvDVO2XATPwTc1+UMN+/vxL0=
Authentication-Results: amd.com; dkim=none (message not signed)
 header.d=none;amd.com; dmarc=none action=none header.from=amd.com;
Received: from SN6PR12MB4623.namprd12.prod.outlook.com (2603:10b6:805:e9::17)
 by SA0PR12MB4576.namprd12.prod.outlook.com (2603:10b6:806:93::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4108.27; Fri, 7 May
 2021 16:32:24 +0000
Received: from SN6PR12MB4623.namprd12.prod.outlook.com
 ([fe80::ad51:8c49:b171:856c]) by SN6PR12MB4623.namprd12.prod.outlook.com
 ([fe80::ad51:8c49:b171:856c%7]) with mapi id 15.20.4108.030; Fri, 7 May 2021
 16:32:24 +0000
Subject: Re: [PATCH v5 15/27] drm/scheduler: Fix hang when sched_entity
 released
To: Daniel Vetter <daniel@ffwll.ch>
References: <20210428151207.1212258-1-andrey.grodzovsky@amd.com>
 <20210428151207.1212258-16-andrey.grodzovsky@amd.com>
 <a8314d77-578f-e0df-5c49-77d5f10c76c7@amd.com>
 <9cb771f2-d52f-f14e-f3d4-b9488b353ae3@amd.com>
 <0c598888-d7d4-451a-3d4a-01c46ddda397@gmail.com>
 <a704880d-8e27-3cca-f42b-1320d39ac503@amd.com>
 <YJVq4x4d81rY2GHB@phenom.ffwll.local>
From: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
Message-ID: <e2bd01fc-1d1e-bc76-2187-72bb602fbac7@amd.com>
Date: Fri, 7 May 2021 12:32:22 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
In-Reply-To: <YJVq4x4d81rY2GHB@phenom.ffwll.local>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [2607:fea8:3edf:49b0:3bd1:bdb6:f650:9629]
X-ClientProxiedBy: YT2PR01CA0018.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:38::23) To SN6PR12MB4623.namprd12.prod.outlook.com
 (2603:10b6:805:e9::17)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2607:fea8:3edf:49b0:3bd1:bdb6:f650:9629]
 (2607:fea8:3edf:49b0:3bd1:bdb6:f650:9629) by
 YT2PR01CA0018.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:38::23) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4087.39 via Frontend Transport; Fri, 7 May 2021 16:32:23 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 899cc3ef-c219-41f0-2bde-08d91175b208
X-MS-TrafficTypeDiagnostic: SA0PR12MB4576:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SA0PR12MB4576F6518DADD4CF2CDDF1C9EA579@SA0PR12MB4576.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4125;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: sX4nxPTXPUeL1ETG6vi87JvkRLpqSU7slmQhtl4GXgzbS0b1OMfIC3+rnVR2yjQucHEjlyQrswqsYnWyYOdjUXFrhUtAD+AwbIQ2wyYvTAWgkL4svcT3LGxh0JFACgp72q1VK20Sox9XxjJH5Fe/I77UzuH4yve8WtpubKmFmCcVuYD3xTkCM66FNTEzhEJNPqU/NN3uxEiXWbKF2ljpBxXDzjttS+FQuAwCRuJEjKnW8VrgD834iU6cVafy1RKwMkJJQmb6ZiaH/KL+uSocgEKK3IzAZ+vTZIfxkj/GD3+D4bbh+y5MnueWyJqkzDycff9l2IoxR03YRUXo9UUVtKNaxgGxv414wT1FJ/S04nZbear3sZciE3MzqJ7qIMEgL4bh+rh+SeXcHrB241oKCo+SIWB51+9bD/c/0AgiyRDWY/vGTa1BnE9vLLe4/c8mvrJE0aFEdc/kfDeF61WZtGMUbdD/XV9RkGxNC7YjyCqwtefA48sCBPM2UPsWAOIMfEJ0ysP7/bO88UJYtjl8wSxt5X5Eatcuy4Tf79JnhPcbkdymqSOexHcaK1ArHot1aRtybVPM1hINg5+Ss84jh4rTStZ4DyLV2LJM4NM7WndXbHJwyGAxxn4A3G4ASbmLkHQxB0mI7oq6EPMaw/lj6SqOalWkPzqLNNPFm24wQK5rRLF6RT3kNhrHBqjWgTGr
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR12MB4623.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(376002)(39860400002)(346002)(366004)(136003)(36756003)(54906003)(2616005)(66556008)(66476007)(2906002)(66946007)(44832011)(52116002)(6486002)(6916009)(4326008)(53546011)(31696002)(478600001)(8676002)(86362001)(66574015)(5660300002)(31686004)(83380400001)(16526019)(316002)(8936002)(38100700002)(186003)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?VWNXZGo1UTFsL1o4ZXlkdzloL05pVUlZc3dLOXhaUWE5Z0J4Vk1BSExldGR0?=
 =?utf-8?B?c3hLK28zQTJXTGVPS3dCTW8xN2xZV3lZTVA4Tm10RkIvdUZmT2U5eS94eGR6?=
 =?utf-8?B?bThIcHBFb0ZiK1hFU1hiajVyWUJXR1Z2QVQ4RklHektyMm03Qlgya2Vacjlm?=
 =?utf-8?B?U29JcWFnZDhBL0VFYUxpYWNxYkIrSEFhQ0NUb1lwbVlWNURhTG1kNzJwWjdm?=
 =?utf-8?B?OWJwT2hkSmVxVDJiRnVGbHNremRrN21ZUjBEcnVKMVVCampkdE45ZExTVHRl?=
 =?utf-8?B?VkxYVGN5WlY2Qk1BYmNnRWVRREpjMyt6NUdlWDFoMkdFbzc5RlZxTW0zREpM?=
 =?utf-8?B?a0FQekVmNmp6M0NmRlJtZnJpMi84Z011eFBmTTN3SVVMYnI4U0tiaUlxQ0t3?=
 =?utf-8?B?Yng4L2ZvTVdBWGxNVmZ1RnI1ZTBKQmQ1SUo2ZEthTUZDeEwyaFcrMGk0NUwv?=
 =?utf-8?B?R0JVdzNNcFc2bW4wM3ZlS1c3YlVPYlY4S3JFYnhUWmtlQy9POFZ4eWw3bVc2?=
 =?utf-8?B?RTl0OTJHTzAwUUpiR01QaU5VaWd1RkFwczZ6VGphSC9xdlMyQjZmYnVvdWx1?=
 =?utf-8?B?elVENkQxLyt4WEVjbi9iNFdrUlkxL0JtT0pFcFNPWktiTlM4Q0l6Y3pBVy8x?=
 =?utf-8?B?dEZPM0lwMnA1UmhXVEtFNlY2N1NBaC9xYUszTCtSNCtVNXJjL0U1bjh5Skgv?=
 =?utf-8?B?Y3p0YUNIc2JTMCtXWGE5S1BYT2I0STFMRGRHM1dVaXF2dHFYSDQ0V05aMVBE?=
 =?utf-8?B?VGZPWFg3RzRNL3lHZW03KzQ2OVNINzNxUjdsOW1QM0g5WVJNaU9IQ3FHM0JL?=
 =?utf-8?B?c0ZBNnJiNjY4bXRoZm5LUjZGSC9HVmg2RFNoRkZOdVVONzJtekpNUFhxeWtw?=
 =?utf-8?B?WFg0M3NYSHFnbTlHZUZwNFFsTFdFdS94QkpCY3QzUDJNOHl6djg5TkFqWjdT?=
 =?utf-8?B?QnB0aGRwWEFKTitPL0x0TDQzU0ZvdFBkbm9KZEx2S0cxZWdTbXQ0aUd5RURi?=
 =?utf-8?B?VXlxMnMwcFpPVkdnWlZlR3ZLMXRTeGdqeHlDaU9yWHArUzlxM1I0TU1ET0hh?=
 =?utf-8?B?ZXlTOUdya01uM2U5emcrbzNBcVZqbTl2NUJ2bktPV05PaVJqS3VmTmhqSUZv?=
 =?utf-8?B?Z0ZRa0tQT3k5a1J3YnRHOXN0d0dmT1NGV2xLblpyZWp1eXd1N2t0VW5aUTNv?=
 =?utf-8?B?Y0RHUHMycWh5dHZCYnNWcENKRGR5cklnc3JlelBTeUR1RlFGMzdCS0VtMytQ?=
 =?utf-8?B?RGJjV3NSYWN0S2NRcVdGZUZ1dTdvR21GS3VtbHdNTEZFWStleURhejJMMUxF?=
 =?utf-8?B?MG1mT3RGcVVsSFJ4ZXFBNHRMMmwxWXhJWklOeEFhVjdWQUFqSXJNODExMGpr?=
 =?utf-8?B?ZTRDZjYwRVVRcnc4bmxETnk3aCtPZWVNN29Bc0xZK0o5TFoxMG00dmFYSEs4?=
 =?utf-8?B?SEZVYmQyVm1panlLSmR6WGh1bUpPLzYxRVF4N0RoVTlrZFNKRUpldWNLZlJW?=
 =?utf-8?B?eWtHUGZYVkVkOTVRVDQ0OFhTUTg5eUh1L2F4NGZINldxaDFyUEY1MDA4bUxs?=
 =?utf-8?B?NFkwdFlJdDFRaFVDT3dnMlo1dms4blJISWgxLythaUQ2VzRISkR3V1VpVWVu?=
 =?utf-8?B?eDhYUmVZRTJVTC9wbVVWbUV0ZHVrdEcrMmZJM1h6OVh2Q1dZQnd0V2VMYTJT?=
 =?utf-8?B?VVNlRUVTeCt5dmIwZjRSWkVvSk5rQ3dyRm15N2hEdWtUUHNNT0RuOWxiOWpF?=
 =?utf-8?B?dGxXNURGNmt2bFU0SGI2b3hoUTQ2bmtsREpIZmRWT1VLQTlNRHQ0OVVpWVY0?=
 =?utf-8?B?V2pkajBjQk5OditlaGM2RzJrNTNkRmxsWXViaXZBMmxEVUFKS3U2aHFLay9y?=
 =?utf-8?Q?VUdfV6pffYi1C?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 899cc3ef-c219-41f0-2bde-08d91175b208
X-MS-Exchange-CrossTenant-AuthSource: SN6PR12MB4623.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 May 2021 16:32:24.7280 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yh/476s+avwmswW8Ols239rkQR6V7d1swrTeyz4FB8g/ROYGxAv0/+Tf5K5UjI6uAtp+LOg66+KhrU4v0yM+tg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4576
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
Cc: gregkh@linuxfoundation.org, daniel.vetter@ffwll.ch, Felix.Kuehling@amd.com,
 linux-pci@vger.kernel.org, amd-gfx@lists.freedesktop.org, helgaas@kernel.org,
 dri-devel@lists.freedesktop.org,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>,
 Alexander.Deucher@amd.com,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 2021-05-07 12:29 p.m., Daniel Vetter wrote:
> On Fri, Apr 30, 2021 at 12:10:57PM -0400, Andrey Grodzovsky wrote:
>>
>>
>> On 2021-04-30 2:47 a.m., Christian König wrote:
>>>
>>>
>>> Am 29.04.21 um 19:06 schrieb Andrey Grodzovsky:
>>>>
>>>>
>>>> On 2021-04-29 3:18 a.m., Christian König wrote:
>>>>> I need to take another look at this part when I don't have a
>>>>> massive headache any more.
>>>>>
>>>>> Maybe split the patch set up into different parts, something like:
>>>>> 1. Adding general infrastructure.
>>>>> 2. Making sure all memory is unpolated.
>>>>> 3. Job and fence handling
>>>>
>>>> I am not sure you mean this patch here, maybe another one ?
>>>> Also note you already RBed it.
>>>
>>> No what I meant was to send out the patches before this one as #1 and #2.
>>>
>>> That is the easier stuff which can easily go into the drm-misc-next or
>>> amd-staging-drm-next branch.
>>>
>>> The scheduler stuff certainly need to go into drm-misc-next.
>>>
>>> Christian.
>>
>> Got you. I am fine with it. What we have here is a working hot-unplug
>> code but, one with potential use after free MMIO ranges frpom the zombie
>> device. The followup patches after this patch are all about preventing
>> this and so the patch-set up until this patch including, is functional
>> on it's own. While it's necessary to solve the above issue, it's has
>> complications as can be seen from the discussion with Daniel on later
>> patch in this series. Still, in my opinion it's better to rollout some
>> initial support to hot-unplug without use after free protection then
>> having no support for hot-unplug at all. It will also make the merge
>> work easier as I need to constantly rebase the patches on top latest
>> kernel and solve new regressions.
>>
>> Daniel - given the arguments above can you sound your opinion on this
>> approach ?
> 
> I'm all for incrementally landing this, because it's really hard and
> tricky. We might need to go back to some of the decisions, or clarify
> things more, or more headaches and pondering how to fix all the parts
> that works best to make sure there's no nasty races right across hotunplug
> if you're unlucky enough.
> 
> But yeah better aim for something and then readjust than bikeshed forever
> out of tree.
> 
> Cheers, Daniel

Thanks, I will send out V6 limited in scope up to here and fixing
any relevant comments.

Andrey

> 
>>
>> Andrey
>>>
>>>>
>>>> Andrey
>>>>
>>>>>
>>>>> Christian.
>>>>>
>>>>> Am 28.04.21 um 17:11 schrieb Andrey Grodzovsky:
>>>>>> Problem: If scheduler is already stopped by the time sched_entity
>>>>>> is released and entity's job_queue not empty I encountred
>>>>>> a hang in drm_sched_entity_flush. This is because
>>>>>> drm_sched_entity_is_idle
>>>>>> never becomes false.
>>>>>>
>>>>>> Fix: In drm_sched_fini detach all sched_entities from the
>>>>>> scheduler's run queues. This will satisfy drm_sched_entity_is_idle.
>>>>>> Also wakeup all those processes stuck in sched_entity flushing
>>>>>> as the scheduler main thread which wakes them up is stopped by now.
>>>>>>
>>>>>> v2:
>>>>>> Reverse order of drm_sched_rq_remove_entity and marking
>>>>>> s_entity as stopped to prevent reinserion back to rq due
>>>>>> to race.
>>>>>>
>>>>>> v3:
>>>>>> Drop drm_sched_rq_remove_entity, only modify entity->stopped
>>>>>> and check for it in drm_sched_entity_is_idle
>>>>>>
>>>>>> Signed-off-by: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
>>>>>> Reviewed-by: Christian König <christian.koenig@amd.com>
>>>>>> ---
>>>>>>    drivers/gpu/drm/scheduler/sched_entity.c |  3 ++-
>>>>>>    drivers/gpu/drm/scheduler/sched_main.c   | 24
>>>>>> ++++++++++++++++++++++++
>>>>>>    2 files changed, 26 insertions(+), 1 deletion(-)
>>>>>>
>>>>>> diff --git a/drivers/gpu/drm/scheduler/sched_entity.c
>>>>>> b/drivers/gpu/drm/scheduler/sched_entity.c
>>>>>> index f0790e9471d1..cb58f692dad9 100644
>>>>>> --- a/drivers/gpu/drm/scheduler/sched_entity.c
>>>>>> +++ b/drivers/gpu/drm/scheduler/sched_entity.c
>>>>>> @@ -116,7 +116,8 @@ static bool
>>>>>> drm_sched_entity_is_idle(struct drm_sched_entity *entity)
>>>>>>        rmb(); /* for list_empty to work without lock */
>>>>>>        if (list_empty(&entity->list) ||
>>>>>> -        spsc_queue_count(&entity->job_queue) == 0)
>>>>>> +        spsc_queue_count(&entity->job_queue) == 0 ||
>>>>>> +        entity->stopped)
>>>>>>            return true;
>>>>>>        return false;
>>>>>> diff --git a/drivers/gpu/drm/scheduler/sched_main.c
>>>>>> b/drivers/gpu/drm/scheduler/sched_main.c
>>>>>> index 908b0b56032d..ba087354d0a8 100644
>>>>>> --- a/drivers/gpu/drm/scheduler/sched_main.c
>>>>>> +++ b/drivers/gpu/drm/scheduler/sched_main.c
>>>>>> @@ -897,9 +897,33 @@ EXPORT_SYMBOL(drm_sched_init);
>>>>>>     */
>>>>>>    void drm_sched_fini(struct drm_gpu_scheduler *sched)
>>>>>>    {
>>>>>> +    struct drm_sched_entity *s_entity;
>>>>>> +    int i;
>>>>>> +
>>>>>>        if (sched->thread)
>>>>>>            kthread_stop(sched->thread);
>>>>>> +    for (i = DRM_SCHED_PRIORITY_COUNT - 1; i >=
>>>>>> DRM_SCHED_PRIORITY_MIN; i--) {
>>>>>> +        struct drm_sched_rq *rq = &sched->sched_rq[i];
>>>>>> +
>>>>>> +        if (!rq)
>>>>>> +            continue;
>>>>>> +
>>>>>> +        spin_lock(&rq->lock);
>>>>>> +        list_for_each_entry(s_entity, &rq->entities, list)
>>>>>> +            /*
>>>>>> +             * Prevents reinsertion and marks job_queue as idle,
>>>>>> +             * it will removed from rq in drm_sched_entity_fini
>>>>>> +             * eventually
>>>>>> +             */
>>>>>> +            s_entity->stopped = true;
>>>>>> +        spin_unlock(&rq->lock);
>>>>>> +
>>>>>> +    }
>>>>>> +
>>>>>> +    /* Wakeup everyone stuck in drm_sched_entity_flush for
>>>>>> this scheduler */
>>>>>> +    wake_up_all(&sched->job_scheduled);
>>>>>> +
>>>>>>        /* Confirm no work left behind accessing device structures */
>>>>>>        cancel_delayed_work_sync(&sched->work_tdr);
>>>>>
>>>
> 
