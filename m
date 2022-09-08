Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6819E5B2184
	for <lists+dri-devel@lfdr.de>; Thu,  8 Sep 2022 17:06:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4617D10E4FA;
	Thu,  8 Sep 2022 15:06:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2061.outbound.protection.outlook.com [40.107.92.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 105D710E4CF;
 Thu,  8 Sep 2022 15:06:03 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MaMRzi6VQ8UfUG2mwaXh20u2mISN2cDUsdv8qTz+emZX/wZBibjzqB/xvnYbldSglsp509TwquROquiT30cpfv7j5VHqddaZzIcBRJyEzu3w6ATMlRGnq2KGY5kF2efc25yOsPAutDMtYzq4TE5VOiaxYdJcYGTE8dzOyycBiNBuEmnJyeEb3YMxqiiQW+vfcLWqgAi5yDSqgJ9VSY5mO67NTnyOfYrwhU40lrfP4d0vEQB4GRQNdBbk3wPsEaej3Vay8R4JTXhAGasrdRsfOEtLnpBeHmA+EmdeuvK7r/+Be5tjFvaJAAnXQo+AoXNXHPhCQ3qvzQlyKqT4iF98Ww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nVncUJJlqjJqZE52NAjxg9iiopz6+43QBBMzDyUdfX4=;
 b=Z2OruQmbgPJhUwJMy7w//rbwjv1NFrAlyCKoPtYOGtYrLqXTvjUU58T9YEKX18DuD7rjj4sCwQNTGW2Vi1y/XJ9niOVYII+7zzKF6fso4oAFFCYvgd2A9g0eFkQH3x5qqrHUfHo0L0w+kGrTVCEDM4p6NZrTMOhYF1vXxKw51zfk3bimC7MIliCj6rAQBCWJHAyvIfp2ImKsEyH83HflxSi8LHdeqgNdgWNDx8+9IcvJx9tDzgJg3vQonhc8ISt7JHKJ6bzZcPnfmEqUI9mHBb/ymRloN9o6PoX2u/ajgNYDyDaSoJ6Wdqm1dUycm1TucS4a2v9gS9PflyV1bmfk4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nVncUJJlqjJqZE52NAjxg9iiopz6+43QBBMzDyUdfX4=;
 b=Owp1hFrz1rbqOrJIynVsNq7eMdYyRqdK2ISUCHIa41Siq05OjV+cDWNm5ehCpfvzv0xj7Fpipb6pGDVPWKJlg17pX7dEjMCIc0KiMiM8NB6/Ur6q3cLE/FBkRxz0hN9iYxonO1RSt4uCEdoIoh1AnMJXQ0JGN5lb6SIQaFy8yAU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM5PR12MB1947.namprd12.prod.outlook.com (2603:10b6:3:111::23)
 by CH2PR12MB4085.namprd12.prod.outlook.com (2603:10b6:610:79::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5612.19; Thu, 8 Sep
 2022 15:06:00 +0000
Received: from DM5PR12MB1947.namprd12.prod.outlook.com
 ([fe80::80ca:c97:d395:1acf]) by DM5PR12MB1947.namprd12.prod.outlook.com
 ([fe80::80ca:c97:d395:1acf%6]) with mapi id 15.20.5612.016; Thu, 8 Sep 2022
 15:06:00 +0000
Message-ID: <d81273d8-0db6-881c-7d2d-dadf01e9cf9a@amd.com>
Date: Thu, 8 Sep 2022 11:05:58 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 1/4] drm/sched: returns struct drm_gpu_scheduler ** for
 drm_sched_pick_best
Content-Language: en-US
To: James Zhu <jamesz@amd.com>, James Zhu <James.Zhu@amd.com>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
References: <20220907205705.934688-1-James.Zhu@amd.com>
 <79af80cb-7438-1105-c24e-d3a874a0b4ca@amd.com>
 <f0f334ce-ca38-8a84-330e-c586fd813f58@amd.com>
 <afc9c570-b57b-87db-2d00-90376a030a66@amd.com>
 <5fda9947-953e-2cd7-ff39-314cbb4766a0@amd.com>
From: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
In-Reply-To: <5fda9947-953e-2cd7-ff39-314cbb4766a0@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MN2PR15CA0002.namprd15.prod.outlook.com
 (2603:10b6:208:1b4::15) To DM5PR12MB1947.namprd12.prod.outlook.com
 (2603:10b6:3:111::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM5PR12MB1947:EE_|CH2PR12MB4085:EE_
X-MS-Office365-Filtering-Correlation-Id: f7ca8f33-2a12-4ef2-cd4c-08da91aba3e3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ssoEDVaRzgsv1mgD/riEcWcmVDDSAFtNbE1niOdcW/v9k/lJmlUo8Drf4u66ZTbYBOtPQus1JrFCzLgyXlF7ndD2cMOwssPXVpF9u1/NRCJ2RObdmBYxjfhwCXutI6f4Nr0CVNXezyA/l0F5Fa/6/i3D5Fv0l6N51wJrG9Tz1vKM+A1LNaxvUDGUsZKThLsNV1Ha1L2DZI7vEz/C4eQlac08YzkCBuEwKGQnRaoYR/Q00hiPT4cV9s0HIOIuW2k7mxKvvYul8dtGZK32AoSGAmGiaEWzVSospLtcTOS4xaSSgb/FrHifsoYE+UVixENSr9WVh7+W0Jxh8yBEA3+aOJIhiGqo+hbXls+QUThEKPNonAy7Yz/mRVJLH0YXQHfTXNtPGGXd4q0ZqaxXOYwgowQul/61LtKkFxBYk1iD7NhqmmrekFBMYWubk2ojbXKl3kzrs7bX/ke9ilcMdxY/2BL4LihzO6ObCUnCJtYBIqPHO7XBhcig563p3WAdDrs//1qKUmg6PSNzvhVZoTn+cpaEeEsesC8AFzNjCrYBxCnLTde5NeH94ZRpJCpCc8zDLoTVpdHGCCpcTXP3ulg/dNPEtMXMofiDLrMhj3bDwhKcuidITK0tLxFmSd9EYkq7PeKIJYes7togIVnQkATNX1jTqrj3moDhShYFZtLUrPAtADiuVQO0iq1vb6cxzAusvxYnJhWeHXSdBFAKCkU3+EpSPoMJsRttR7tP5ThM+rprJL8oA8b6p05sPE6rla5YwWz+YN3uLAJE6ZKzucIemkWlzeNnHs/HbB4AsJTJDbQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM5PR12MB1947.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(346002)(376002)(136003)(366004)(39860400002)(396003)(6486002)(316002)(110136005)(31696002)(86362001)(2616005)(83380400001)(186003)(478600001)(41300700001)(6506007)(53546011)(6512007)(38100700002)(26005)(44832011)(2906002)(8936002)(5660300002)(31686004)(36756003)(450100002)(4326008)(66556008)(66476007)(66946007)(8676002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Q0hRSGw5VERqdmpTaHZDc2lKRTNEWldjTXRRV05RTlhQbGU3TU1xakRhck53?=
 =?utf-8?B?dUgrYnVnMGVkNlMzOEE4eVVpaUE4TzdsbVJtclgrblM3NHVlT1ZneEdKTEZQ?=
 =?utf-8?B?L201blhwaGFIcG1XWUxQTitPQ3JzOWdabitaemRDRVYvc3FIeDB2MWhMOXNh?=
 =?utf-8?B?OURwdk15aE1LalpQTUdXdmhHN0UwY2Z0Vkhub21FSXlVa3ZUS0xTbmRRaHph?=
 =?utf-8?B?MDB4bVlGc09iT0xsTHAxb0Jjbyt1Wk8yL0pkU0JoYnU0LzJrS1p0TmlGMDVS?=
 =?utf-8?B?VXJ2UTY1U1RnekNlZ0xLajFWSVRkOVc3NFYzekU5SVdOTEpqRHNQRjcrZ1M4?=
 =?utf-8?B?cWlyL2FoYlVCOSt2TUR5WWY2Q1NEQ2NGZ0Q2blJxUVJ3cXoxWFl6VjRRVnRX?=
 =?utf-8?B?VG54MkFtTk52VlloWUE1djRYVk8rSU5oVlQ4a2hNQWVoV2ZUNEtwaktBWnZn?=
 =?utf-8?B?QUZYNWpnNDhLdUY2MDh1ajZEWDBDZm5WUkQxWU5NblZXYnZ2UXl0Y25HRXQz?=
 =?utf-8?B?VHVzWTRENzUxS1BzTFY5ankvS0JJQUxhbGcwWm5PeGl4Tmo4blFVMUVKWkg0?=
 =?utf-8?B?N0NLaVVURWVYc3IrYzBKaTNyZGN2QkcxRFFhWk5rcGxxS3hzZE0xc1JNai9p?=
 =?utf-8?B?VU1FVWdqSGRCZ090eVFuMGp0NDdEdkRIVDFBWFNhbU1OSnhEOXgxcEJkUzlG?=
 =?utf-8?B?cyt6YkJvVGVjSFNON29DZDZHOTBiK2UzdkY2MUNQeXJzWU5ZK2dmNWFncWZi?=
 =?utf-8?B?TzgvWTd4eEFxTkUwQlNWWndTcFY4SGR1UE9RaU1KS1pQNUxWUTdSSVFldFRo?=
 =?utf-8?B?NzdPMUZEY2NQbC9ySXBJRjRDQlMwN01yekxhUFdRRjBVYnpVaUZkWWRhQkhU?=
 =?utf-8?B?YXVtKzNKdXc1VjBYN3FuZTkxOVdqRGsvTlpWOEJrcXpjZWYvWk5LR2VOZmhH?=
 =?utf-8?B?SEplRGFCV3lRWTgvTEFKREpQcVUyejFLYS9vdjdQRG5NUzV5MGRHSVdQYVhk?=
 =?utf-8?B?WmIvQXdFQkZRM0N6eW9qeTNwVUVHalZLMXYzZ2xhUldlR01tdUROdE1wWmFk?=
 =?utf-8?B?OWNNNzBwMGVlbk1LTnk2WnFJbnRxVVk3WTBSbDhQZVdRTmMzVmpBNFBQeHBw?=
 =?utf-8?B?S2JHV0UzTzh0RGFFU1BKOEVUUDZBdVJOblpTNzZDeDZ4TGQvUnFkQStqU3pB?=
 =?utf-8?B?QmhiZWMrZFU5a09RWGVpa25scU1oTTI5VGZsWkttV0VOVHNUR2gwWEY1N0JJ?=
 =?utf-8?B?QlloMUJyZmRIakVEOUlsYlhHQlMwcEZwTXZnejhiMDU4bUpxSGx0eGJ5T3lp?=
 =?utf-8?B?WU1iZ3RPVDV4T0wwTWk0UXM5VUtvSVZBbENFU1VSbHQvQmJmM3A4dTVZVE4r?=
 =?utf-8?B?RkE5aEVLYmF2QitCYW40S3pMSzA4d0puNjU1a21aSkZnYUw4NzMrMTVDVm1R?=
 =?utf-8?B?QkhCbVVnL3JFY1J1eVVWTkNnQUE3UjZubGRZWGtQUUxneURxU09rS0ZZUEly?=
 =?utf-8?B?OU95R3lrWS9pTjF1K3NCNHpmc0JDUHlHcjRJU2pJZWFuSWNsNTBBbkJlUzJz?=
 =?utf-8?B?UHVXMmVnSE0rWGg3bFRKR0g3eVVOd1lqczJLU3lvekNqZlZONGtiMHN6bHZz?=
 =?utf-8?B?VVg3UHFpay8rb1BKWkNmL1paSzNVWGFYc2NTNXNlUDc4cW5SeU9oOFhTMjFa?=
 =?utf-8?B?d0ZjQXJnRlZHOGFEWkZUMDhGajE3dEw0amlud0tkS3A4N1hNWXltRGd0M1BP?=
 =?utf-8?B?K01iSDNMUlpOQlJQRUZvWk5aSzg4SVJYSFVIS2NkQ0h1TXlKNGpXenYyVlBr?=
 =?utf-8?B?MFhjQ0dwSEVHNUVJZlRlekkyc0JsbEZNME5mN2VkeldjZllMMHllcVhTOFQx?=
 =?utf-8?B?ZUVzMU9EUXkvajBCYk42SmZzczVaZjNJTmZZd2h5dmJGa0ZHYmRFQlliaFVL?=
 =?utf-8?B?ZEd5aWhuREozQWtQRDZKQ3owcDAvcFVWQ1YrQWcxNndXRXZ6c04xRmUzb3A2?=
 =?utf-8?B?M2VNdThxcVovTWh4NWtscGxrUUsrMDROamM4YWxJT1F4MklkOUllN2R0WWxT?=
 =?utf-8?B?cml6cTg5NHB5T0FkTDc4R1pTVTBGT2sydDNBNmVrYzZXYTlITGxQY0s4bUc0?=
 =?utf-8?Q?5GPdnmNCWeVjMoFv897WWxEhQ?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f7ca8f33-2a12-4ef2-cd4c-08da91aba3e3
X-MS-Exchange-CrossTenant-AuthSource: DM5PR12MB1947.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Sep 2022 15:06:00.2959 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3ExUYZhdYrgjbphGaI/CkJGD150zZJt/vMgVJttyW6oiF0lO/v/psgkpePlwdLTjnokSmgf5q9a0F0INPnWANA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4085
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
Cc: alexander.deucher@amd.com, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

So this is the real need of this patch-set, but this explanation doesn't 
appear anywhere in the description.
It's always good to add a short 0 RFC patch which describes the 
intention of the patchset if the code is
not self explanatory.

And I still don't understand the need - i don't see anything in 
amdgpu_ctx_fini_entity regarding
rings tracking ? Is it a new code you plan to add and not included in 
this patcheset ? Did i miss an
earlier patch maybe ?

Andrey

On 2022-09-08 10:45, James Zhu wrote:
> To save lines is not the purpose.
>
> Also I want to use entity->sched_list to track ring which is used in 
> this ctx in amdgpu_ctx_fini_entity
>
> Best Regards!
>
> James
>
> On 2022-09-08 10:38 a.m., Andrey Grodzovsky wrote:
>> I guess it's an option but i don't really see what's the added value  
>> ? You saved a few lines in this patch
>> but added a few lines in another. In total seems to me no to much 
>> difference ?
>>
>> Andrey
>>
>> On 2022-09-08 10:17, James Zhu wrote:
>>> Hi Andrey
>>>
>>> Basically this entire patch set are derived from patch [3/4]: 
>>> entity->sched_list = num_sched_list > 1 ? sched_list : NULL;
>>>
>>> I think no special reason to treat single and multiple schedule list 
>>> here.
>>>
>>> Best Regards!
>>>
>>> James
>>>
>>> On 2022-09-08 10:08 a.m., Andrey Grodzovsky wrote:
>>>> What's the reason for this entire patch set ?
>>>>
>>>> Andrey
>>>>
>>>> On 2022-09-07 16:57, James Zhu wrote:
>>>>> drm_sched_pick_best returns struct drm_gpu_scheduler ** instead of
>>>>> struct drm_gpu_scheduler *
>>>>>
>>>>> Signed-off-by: James Zhu <James.Zhu@amd.com>
>>>>> ---
>>>>>   include/drm/gpu_scheduler.h | 2 +-
>>>>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>>>>
>>>>> diff --git a/include/drm/gpu_scheduler.h 
>>>>> b/include/drm/gpu_scheduler.h
>>>>> index 0fca8f38bee4..011f70a43397 100644
>>>>> --- a/include/drm/gpu_scheduler.h
>>>>> +++ b/include/drm/gpu_scheduler.h
>>>>> @@ -529,7 +529,7 @@ void drm_sched_fence_finished(struct 
>>>>> drm_sched_fence *fence);
>>>>>   unsigned long drm_sched_suspend_timeout(struct drm_gpu_scheduler 
>>>>> *sched);
>>>>>   void drm_sched_resume_timeout(struct drm_gpu_scheduler *sched,
>>>>>                           unsigned long remaining);
>>>>> -struct drm_gpu_scheduler *
>>>>> +struct drm_gpu_scheduler **
>>>>>   drm_sched_pick_best(struct drm_gpu_scheduler **sched_list,
>>>>>                unsigned int num_sched_list);
