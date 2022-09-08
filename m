Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EFEB5B21A6
	for <lists+dri-devel@lfdr.de>; Thu,  8 Sep 2022 17:09:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A4A210E513;
	Thu,  8 Sep 2022 15:09:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2084.outbound.protection.outlook.com [40.107.92.84])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CCD6610E502;
 Thu,  8 Sep 2022 15:09:12 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KI6lovE2MPc22WcaXuPIk52o8/5xholTxOBlsVhXc5xIsqkfdl49nuZR9tKHpUjlQxpmpOkHB1E9Jtyl2Go/PU2QWkAfWKAsVUgNDmsda4a/6iHa4xHnnlmOEueqVCTLHiiGf8ImoaJQESN4EAl2nR3CMs5thkATsyfAqOpmxAgdGcguK4QalhB0s6fVk1v+zaJt/KLoFBe9ilOP4ruW6DJUe4I8vd14gAuif3uq62ewSP9Rh5Zws8PD837ZvgrbkLaI+XTlBQ3g4QFBjK4u4pSeRBoKjUyYAsEfXML0WPp5Ae05an9LCyodXH0CroY9bibvt4aAE4IkoWT6dqJrWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SuQ/OddvZlT0HFLnBA0pCEP9k7yO13IQq8WulZN3as4=;
 b=Ao9YDchK+oVRrNgNx4PMZzIGtRpyAkBmNP/qqL1jOSLJVNYEE96VQJPvqtM7WaiQQn3Av+D/GW3JhgR8ipcpuHKu6zjd13J5+LLyJW4UGtdCCy9G6fcwjke6oYr1mAwW1GovZZc4LpD0F4rSbKOk9jJNXipyS7tooCTUfmeB5Zk58Xv3FhuIhfF3y0ue0S5Rzc2rg/DHFclyzo81fr3lLT0f2709/U7TcA3oNnxe03m8CGrEzDdGStxtNXlJfMxsWRa7nQyMEBGzt2KrNXRyXjOxZAlzsolWDyNtV7mJJiiEDmZChqGC9Y5/6dtluHu/AKH2t65GvMZZBHfJtmn8ug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SuQ/OddvZlT0HFLnBA0pCEP9k7yO13IQq8WulZN3as4=;
 b=z+487cCyPq9qukrIZOj93CBDSlzqBSi6zqLa0w/5j77PQQ6X1gxMcPZYgravgNoQzF5ItQ6TdBpXuxrAWaDHqDQ2QrdFuQaAbUAKYTZeb/S3X8g4AhE9rkv36hrdA8cA7U/cW3S1jcmGHhIDNUQbUaibzMVvev71/6qmUg7Ug0g=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM5PR12MB1753.namprd12.prod.outlook.com (2603:10b6:3:10d::16)
 by DM6PR12MB4404.namprd12.prod.outlook.com (2603:10b6:5:2a7::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5612.19; Thu, 8 Sep
 2022 15:09:10 +0000
Received: from DM5PR12MB1753.namprd12.prod.outlook.com
 ([fe80::d503:c616:dcf8:2ae8]) by DM5PR12MB1753.namprd12.prod.outlook.com
 ([fe80::d503:c616:dcf8:2ae8%8]) with mapi id 15.20.5588.018; Thu, 8 Sep 2022
 15:09:10 +0000
Message-ID: <f6206527-7054-d97b-57ac-dd7b7fe35912@amd.com>
Date: Thu, 8 Sep 2022 11:09:08 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH 1/4] drm/sched: returns struct drm_gpu_scheduler ** for
 drm_sched_pick_best
Content-Language: en-CA
To: Andrey Grodzovsky <andrey.grodzovsky@amd.com>,
 James Zhu <James.Zhu@amd.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
References: <20220907205705.934688-1-James.Zhu@amd.com>
 <79af80cb-7438-1105-c24e-d3a874a0b4ca@amd.com>
 <f0f334ce-ca38-8a84-330e-c586fd813f58@amd.com>
 <afc9c570-b57b-87db-2d00-90376a030a66@amd.com>
 <5fda9947-953e-2cd7-ff39-314cbb4766a0@amd.com>
 <d81273d8-0db6-881c-7d2d-dadf01e9cf9a@amd.com>
From: James Zhu <jamesz@amd.com>
In-Reply-To: <d81273d8-0db6-881c-7d2d-dadf01e9cf9a@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BL1PR13CA0227.namprd13.prod.outlook.com
 (2603:10b6:208:2bf::22) To DM5PR12MB1753.namprd12.prod.outlook.com
 (2603:10b6:3:10d::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 07428033-46fa-4ea6-45de-08da91ac1513
X-MS-TrafficTypeDiagnostic: DM6PR12MB4404:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: vVfuqGr9MEfHhAJJCW3Y8+JM6WOR5X1K/0DCBWiAqpvsIthfuRm+V+WZ5VotC6VcPg+cS2Ja/dBKvLZQ1h35QOKuHQUNgk0/CmCNrEjnerkfO0VFTHfcXWFB6pn/ew+4PfgOhrHMd42ztdMr6n0p6IJJZBkHHDmCwzGkq1W1qe8QQbWO64ORg0HuUZ/P7W5k2N7wA7Q6KK1DfHUagLY8mWODp3rSlR8Prome7mccrQ5WS69EgSux4hElAAD3vCLLehXrqFj91SrgpJTrrb+jZVDL6dFEQt2ci6ro12Q5fs2Zrp5gbILJekDqIwUeY+BVqtOxZaFLxQW4viAgWIeETqw3E/+xv5uuUSLQeBoLdjnfDMGlzXv7AN7Nhu4klRBMDaT1hJjqM27xBx6de/fPWsaWpXl/XukP0ruX9LpkSmgN1rko8MHd37ZjiN5aXmaAyOmi/JX5gTY4FujYcVo6iklpdHXexZnZrwHgOUljV1l4M+JFwNi4ze4X63/5l8VTymB8zJuwV8o9gLBBe1DMX/Md7gYqwKD+l4ll6I89kBRUldbtG0WqpTa7CD1DozMDGWaUtebgNQDVjWptYW8KJmgZWTn0xA3UPcPlsJ7UKhw/07QY6pW813cPxePu+gz3ElaOKulxqxPeq2hw33fhBCqnX0ESkE2delCI68BYr0eyaAj0WoTzM0RFLRKb4IwAb2NdUVxG9qB+bi0U9PYhdvuIpSOl1Ndzsmtn0tj0wovmA0VUCHkjwvZIBPXP6Kiuzai7OYWt6wrqSrwAdOiHU3YPtWMwGLjpEl6WFxdTjn0=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM5PR12MB1753.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(376002)(396003)(136003)(39860400002)(366004)(346002)(316002)(110136005)(31696002)(2906002)(66476007)(66556008)(8936002)(5660300002)(66946007)(450100002)(38100700002)(8676002)(4326008)(36756003)(2616005)(478600001)(6486002)(83380400001)(186003)(41300700001)(6512007)(26005)(31686004)(53546011)(6506007)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Ti9jSnpubUFTV2hFS0xlbEt2WmlFTUR5N1A5U3JlQU5qOVZ2ZzBwYWthMDhq?=
 =?utf-8?B?QnBOelh3MTV5UlFQNjZiaHFhRFZDREd1WDhVbjFjWmgwUGcwQXlTZTJ4K2tQ?=
 =?utf-8?B?VGNpa3A1em4wRmFrdVkzbVREYW0yUElLLzVwc01JNndJaDBWN2MwWmNQL2Ry?=
 =?utf-8?B?WG5HdEtrUEZDVThXQnhGMm8vSlBudkpRTGtXRzVjYlhkV2xVOXZuMHY4d1lZ?=
 =?utf-8?B?cWgvT1U5aTNMbVlLZGR5MENUKy9MQ01ybTJvQUxRa1U2emhuT1VYbVZFSldE?=
 =?utf-8?B?eEdrMDZsN29OTldVdzVPY2w3bEZPbXZ2MGlqNks0ZFFhamd1ODBHWDBHTjdp?=
 =?utf-8?B?WEhocXovUDRlWEx4NUFsdFlNYmlJT3NsNkpGQ2loUU1FTC9qUUtoQnNhUnhG?=
 =?utf-8?B?eVhrRWd5V05kRDdyaFJrZHFIajlvK3RBbDNvTlJCWEo2dGpndktxRTJEL0w2?=
 =?utf-8?B?Mi9BUEFUdGRHckxLeFFqYy9KdmJrU0VZQUlJKzZiMlY5QVpTS1gxVEZVV0pS?=
 =?utf-8?B?NW1QZkhDRFNzVVR6bklCZHBBV3h1OURuSUVkbW5LazUyUjdHQWNjdktNZ2JC?=
 =?utf-8?B?c0hpc2JVK2pQdkx3TG1ES2xiaTUvS0NSdEM1TVJMYVBRY24xM3pWQWZZeHIr?=
 =?utf-8?B?SWRHZU5tdUFsVStSd09JbkdhNTROR2ZCQ0NJcjFsZjNkdnBhYlR3STl3dE1G?=
 =?utf-8?B?ckNjZ2QvMGhaV1NFNHpVdmovRGVLMHRUQ2NtRTArWUN1WVB0OFdyOFd0aUFz?=
 =?utf-8?B?MTd6bEpaQ0lMWThhRGJqODQ0VUozOVRZNU5JcHg3NktkUFYyekIyNVU3NHha?=
 =?utf-8?B?SU5Za3dOa1NIcStMOEYyMnEzMzZxakNDVU8xcjZ4UmRMNVkzWlZpZWZOUTc3?=
 =?utf-8?B?a2ZqOG1GVTdJYUkxQ1ZTT2VsTWdseUtUb1gwQXc1cGZXL2MyaWVZdE1EYWo3?=
 =?utf-8?B?WG9GcDNJQjZaYys3d0lZbUVTcDNWb3VBNzZmWHl3V1VrSTl3ZVJkYzBKWVNM?=
 =?utf-8?B?N0g1NDVxdHVHZEJMOEFIV2JjUHV0Qkp1V3J6T3dSSlE3REsyWTZJOWwvcXE0?=
 =?utf-8?B?bXpwTmdYMXJ0Zjl5SHlYRnhrbUxCVEhTQTZXNEhNS3B3SDE2dWlscEpDMHpu?=
 =?utf-8?B?UGhZc0VaTEYwcGpTUHNiNExhcEZRTFNhK01aRzVvY3NQTmtzNG9Xd0ZzRkh4?=
 =?utf-8?B?UnYxUm9EWlN6dFlRQk1CWE44NkJaRHhrdWQzY1hYS2phWElVcC9KTkxsN1Jp?=
 =?utf-8?B?WHhlYlZ3N2lEM0lEL3RGTXJ0QWk5M0tpUWVGQzNieXFnVHY2Q21aWUE4Uk9P?=
 =?utf-8?B?M255QlZwNSs1b0h4VE14NHZIaVpJMUlzSzNzRVJlMkw1N1NDMWpuZ2J3K2ZM?=
 =?utf-8?B?ajlmRmI4SXM5VnlqbkFtcVFseVl0aWNhVzU4RTF1MGZRajN2ZVJhdnZtVXNX?=
 =?utf-8?B?MXZRQ2g3Y3pyQUlWb3BiejFiR0k2Qy9Tc0ZBUWlqM254L1ZGMXVkVmlqc0dZ?=
 =?utf-8?B?TkxpQXVPN2NvRWN3RGFZRkFRSHQ5U29qTTgrbmVyVlhyMytqck1mSFV0YmJN?=
 =?utf-8?B?MVh0N1ZkbmxyL25Ma3BUd0pEb1BUd04xQlUwNUhQV3NxWS91cEZBdWE3VVNC?=
 =?utf-8?B?SmdMYlFzdzljRTZaOVNvMEFBODd2cndSTlRxSWRBckx4ZTdSbW1rYjlseU82?=
 =?utf-8?B?VVVaR2JkaSs3SytpOHROWDlxT1pDMlE3THlvbDd6bk1zMWZjMkZLZUxZbzJM?=
 =?utf-8?B?Rk9SYkw1ZWdEMEZ1YnFWYXY5TDJyckpGUVFYSUgzRnUxVnZ3Y3pFOHpxWmtT?=
 =?utf-8?B?NXZOTlNERXhHZnZtN3Jzd1hvN1dQaE8zK2c5UWU4cjNNSDZRZ3JmcmhqbWtq?=
 =?utf-8?B?N2IxVHVVYlRMYkR5cmxGUHI3WldYUTIwdTdmS3ROVlV3dnlITzJJT0R5bUZu?=
 =?utf-8?B?MkZ4L1NiTHErTGpsTkgrVmd5SEFpa3FGZ3FUa0UwUE5rN2JNOC9lRUNuN244?=
 =?utf-8?B?ZzRPMURUd2xSV1BPZm1mMTdOUk9iemdJTTJ2Uk5Wbko3SWhlNlYxSHpBQ01D?=
 =?utf-8?B?QmdjaDdaTGFMbjUzSXpWNC94SUs0VXpHMUEzOVlnbWZZckVuQUFKOFRzODEz?=
 =?utf-8?Q?MYG3ciQ3BJceoWJJAy+K3UnHG?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 07428033-46fa-4ea6-45de-08da91ac1513
X-MS-Exchange-CrossTenant-AuthSource: DM5PR12MB1753.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Sep 2022 15:09:10.1895 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZnvCiXgPxxIU++XyuEnvy9hvUKrEESWpXn3n5DMDibLsBOGrdvTNEZIKHwDdhMVw
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4404
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

Yes, it  is for NPI design. I will send out patches for review soon.

Thanks!

James

On 2022-09-08 11:05 a.m., Andrey Grodzovsky wrote:
> So this is the real need of this patch-set, but this explanation 
> doesn't appear anywhere in the description.
> It's always good to add a short 0 RFC patch which describes the 
> intention of the patchset if the code is
> not self explanatory.
>
> And I still don't understand the need - i don't see anything in 
> amdgpu_ctx_fini_entity regarding
> rings tracking ? Is it a new code you plan to add and not included in 
> this patcheset ? Did i miss an
> earlier patch maybe ?
>
> Andrey
>
> On 2022-09-08 10:45, James Zhu wrote:
>> To save lines is not the purpose.
>>
>> Also I want to use entity->sched_list to track ring which is used in 
>> this ctx in amdgpu_ctx_fini_entity
>>
>> Best Regards!
>>
>> James
>>
>> On 2022-09-08 10:38 a.m., Andrey Grodzovsky wrote:
>>> I guess it's an option but i don't really see what's the added 
>>> value  ? You saved a few lines in this patch
>>> but added a few lines in another. In total seems to me no to much 
>>> difference ?
>>>
>>> Andrey
>>>
>>> On 2022-09-08 10:17, James Zhu wrote:
>>>> Hi Andrey
>>>>
>>>> Basically this entire patch set are derived from patch [3/4]: 
>>>> entity->sched_list = num_sched_list > 1 ? sched_list : NULL;
>>>>
>>>> I think no special reason to treat single and multiple schedule 
>>>> list here.
>>>>
>>>> Best Regards!
>>>>
>>>> James
>>>>
>>>> On 2022-09-08 10:08 a.m., Andrey Grodzovsky wrote:
>>>>> What's the reason for this entire patch set ?
>>>>>
>>>>> Andrey
>>>>>
>>>>> On 2022-09-07 16:57, James Zhu wrote:
>>>>>> drm_sched_pick_best returns struct drm_gpu_scheduler ** instead of
>>>>>> struct drm_gpu_scheduler *
>>>>>>
>>>>>> Signed-off-by: James Zhu <James.Zhu@amd.com>
>>>>>> ---
>>>>>>   include/drm/gpu_scheduler.h | 2 +-
>>>>>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>>>>>
>>>>>> diff --git a/include/drm/gpu_scheduler.h 
>>>>>> b/include/drm/gpu_scheduler.h
>>>>>> index 0fca8f38bee4..011f70a43397 100644
>>>>>> --- a/include/drm/gpu_scheduler.h
>>>>>> +++ b/include/drm/gpu_scheduler.h
>>>>>> @@ -529,7 +529,7 @@ void drm_sched_fence_finished(struct 
>>>>>> drm_sched_fence *fence);
>>>>>>   unsigned long drm_sched_suspend_timeout(struct 
>>>>>> drm_gpu_scheduler *sched);
>>>>>>   void drm_sched_resume_timeout(struct drm_gpu_scheduler *sched,
>>>>>>                           unsigned long remaining);
>>>>>> -struct drm_gpu_scheduler *
>>>>>> +struct drm_gpu_scheduler **
>>>>>>   drm_sched_pick_best(struct drm_gpu_scheduler **sched_list,
>>>>>>                unsigned int num_sched_list);
