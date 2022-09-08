Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C06BB5B25C5
	for <lists+dri-devel@lfdr.de>; Thu,  8 Sep 2022 20:30:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 322BC10EBB0;
	Thu,  8 Sep 2022 18:30:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2041.outbound.protection.outlook.com [40.107.236.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EDCFB10EBAE;
 Thu,  8 Sep 2022 18:30:13 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DiXCmZToqnk4wFkY/ihxfjd40f7Bvk9iO4tnSGYhg1QqPWEZDxEqYgRfN9n5GtAgFmJlhPePbatK9NN6PusJDHmylBBY2ZSLZqEZs6DUlvd0x4zCvnC51VCYrsR3ezqgw0WbskfBJNOpXH7WHOt05vc2zsKXpS6ExXEZ6nt3bC+kwhfy1KbN35ctlv0uXyO/K4WblgT/wlDczS+QEqQywm5weQx9sZ6I3VSKeQ2qDoxHc0RG02en5FoXURAUF0xO53MQq5M3DvDlHzsRHTc1eT0XHdKlbEn3KLSwfAw2PuTfOMl2otlVWeETY7w0wMerOgpKY5DiaKVcaz2eO5vozg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HPIuQtwr6n3tDb69ZV2xiRMTg4vAT1THOFGFFd+BC80=;
 b=lC/SFD2hvyAJkQVGeo0wb3wMx6z6AbW+mc4wTG3Zn2YIyEA/vynX33RaOgF1WMScbsNWxg4+XLwxALI46YqqyDsuJMzhoZnVOdR2KGulhLl8YxvrLw7rJXIsR4zrD3zc8jKGqx4kFKIpJFAlk5ypOUQULkMcDSwTQHqdkWzKv6+INeKWSynCrTtWIdwPN4wvgg1lo7RuhriDEBw9Y1bxUAMiAoaHDd+Ikvw8FuKLiXaAefbEd+Gb7kTDYrJOwW+bkFkSP7JUBvAZ0vlCSvGe7qNy9QxtTPDNgkYb2hmLmxA6mAWlzUkN8tFuff9kJ+Mi0Bp/R12uSncTyrKV3eGcUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HPIuQtwr6n3tDb69ZV2xiRMTg4vAT1THOFGFFd+BC80=;
 b=HqjSGn1vHLq3g1u7zBn7rL94KUd6WCcu04BGOxwoHxHrReUwEtBFqBF800IXXF1sziQReScMS3XQ651U2X8e8h4Ka7TumwjN8BJny5GmaymR9pHDEoXzvyza/+K5o8b6w9c1cN2nNqvuK5YJjIb5cCvxU606bH7BKj8vEbWYwdg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM5PR12MB1947.namprd12.prod.outlook.com (2603:10b6:3:111::23)
 by BY5PR12MB5014.namprd12.prod.outlook.com (2603:10b6:a03:1c4::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5612.19; Thu, 8 Sep
 2022 18:30:10 +0000
Received: from DM5PR12MB1947.namprd12.prod.outlook.com
 ([fe80::80ca:c97:d395:1acf]) by DM5PR12MB1947.namprd12.prod.outlook.com
 ([fe80::80ca:c97:d395:1acf%6]) with mapi id 15.20.5612.016; Thu, 8 Sep 2022
 18:30:10 +0000
Message-ID: <a32c83dd-fab7-6275-fbb0-34524fd0af02@amd.com>
Date: Thu, 8 Sep 2022 14:30:01 -0400
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
 <d81273d8-0db6-881c-7d2d-dadf01e9cf9a@amd.com>
 <f6206527-7054-d97b-57ac-dd7b7fe35912@amd.com>
From: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
In-Reply-To: <f6206527-7054-d97b-57ac-dd7b7fe35912@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MN2PR22CA0009.namprd22.prod.outlook.com
 (2603:10b6:208:238::14) To DM5PR12MB1947.namprd12.prod.outlook.com
 (2603:10b6:3:111::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM5PR12MB1947:EE_|BY5PR12MB5014:EE_
X-MS-Office365-Filtering-Correlation-Id: 7cef1ea7-34eb-42a0-a4cc-08da91c8299c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 8vT8tJK2oH5DwgEOxpzPrH3BA5J7VcrPdhzvB801mhf51fIKglyZQets4EuFTVO7X/8XKGce5erqGaGOVClMlInlw88if97I9oBIy6n1tEYfsCBcdlCw82tTCbTqOp38nw66sQoAZ4vMnZmdm5uGKyogSbRhb+aDxXAwXm1zjafdk1/AiwPG+V2bvtfb0tQswkzozT9wa8OraX+we8qPqHmj8AzFiEuSPAwfDVEttmsInBxHQrQDRFUS63/Twfynmj8X/lujU7ET1JXP9/bKw6M9bSi6prjNLZx5IS3wiBAIrm8K8kVbJRAq0Y3RzDBbGRkZNDT/IbRq5fpuykj/PJ+/P3gMkAmwjORaHSadm+/Wuswe+fht9apWQ0ZWZhBFeNXfwlNg+W9PZYEWirpxJSlowx40TBktzowHcYhW8GIL40opvA7vUvFmUr2i243x4qhVVNipUFVo7UUzbmQFPQJEhsPejeqbUmvSBKbj3oFVqIk7ioMC2JDQ4935bE9SyhPYNSCzE2E9MGgAnjRNcGd25TUqTfJitxPAZLC0Wnrhhk7J9RA1YGCBBo8bkrbSxVIvfTbrxQqoam/n5nuuA8WK61m99WVrquwVHi6t7tyQ9aMs6KOxKF0sqH2h977v+hP0czJciuhjtDxMn+Z8NhiqGTPe5mQIDKvxS9tt5/BySSpu76N+f2bBfb2M1ljfal4556uBcei7OmhMCOzedNRBg1U/mnDpZSfldhmX1as2sdCR1tP/iNyzVfv2tlgGTiCl6a00BCFbN894Z9Ugo0sDnX9bWk1FPUGArZ3SE3k=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM5PR12MB1947.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(39860400002)(366004)(346002)(376002)(136003)(396003)(478600001)(6486002)(186003)(83380400001)(6666004)(4326008)(38100700002)(450100002)(8676002)(36756003)(2616005)(41300700001)(6506007)(31686004)(53546011)(26005)(6512007)(86362001)(2906002)(316002)(110136005)(31696002)(44832011)(66946007)(5660300002)(8936002)(66556008)(66476007)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?N0V2SkZwUC9HSjJwd2UzaEViL1J2aHhXd01kVERweC9DK0tsTm9wWjBTNDZy?=
 =?utf-8?B?d1pTZlRQSFR2cllhR1h2cUZRS2YxdVpZMTNYTXZWcWR2Y0hESzl6U1VFeHpu?=
 =?utf-8?B?VmM2K24wZzFqdUVNV3B5dTAvTTNDaE9zeVFsbktkVm4wSko1MDJpRjY1NkxM?=
 =?utf-8?B?RHFnenpFKzdCN3VHMXpnNTk2T2VwZXNKZ0kxR2kxRnlyd0VoZXdBTG1HN29y?=
 =?utf-8?B?TmdScVgrbkl6V01CU1cycVV1azhobUtwanNVTTlwcmI2ckZZcVlTOUJ4SVZh?=
 =?utf-8?B?azNkMDNxWjIzZk1uemI4MC9YRjJTU1U1bnZ4VDNiWlk0bDZQNGRJM3o1Nmll?=
 =?utf-8?B?M3BTR1BPeGh4bm50MmVTam44bnc4QjJISWNTZ3JzcFk4d0U5UURObU54Uld4?=
 =?utf-8?B?SzJNUGgra054UVVlYSsxNjRqTmpBM2V6VVowVWd5Mk9KbUlFTW11M0xJM3Fq?=
 =?utf-8?B?a3ZJc2JhMUt6a3BrUnhqUDZ0akNETXBBNW1vSW9wblBhWVhJRU8zQ3VDekRG?=
 =?utf-8?B?U3pxNTF2Y2YrVFVTQlh3MXpyN3hWMm9kdE5UZmhQeEZnaDJqazVJRU5UZ3No?=
 =?utf-8?B?cE9GUDFXaHNTeU5yNlBDcmFwUGhVMXNBcTV3aWhHWVZySnJvTFVVWjlrTlhJ?=
 =?utf-8?B?VHJXdXYrTnlxL255RitHdzROaVVoaW5vVm9hTCtzMXhOQzl5alBXK1FtMFJy?=
 =?utf-8?B?Q1p6ME9YVFNVTWNxY1FGZElDaUtEa3NXTVNNclJBSisraDY1QThvMFZ5ODA5?=
 =?utf-8?B?QzFleFJLRGp3S0NFaWlqSU5JV2lNL0U1K1ZFTUVCTmpDY3VRbDkvYzR6R2Fo?=
 =?utf-8?B?Z1ZtUHprdzAyeGZTTms5UjBGUFVTbXlUSVdPUEhna2dPRlQ5N3VkYmxHTGtj?=
 =?utf-8?B?WWQ2ZUlqNHhGdzRnUk1CR2VBVzFkdGkxa0w5VFhFZlNrQUFNOW5mY2IvbGl2?=
 =?utf-8?B?YmtGZHZKMDllb1FwUlNudDdGeXlmT0F6NzFpNUpXQTNuRFNvclh2Q01TOTdl?=
 =?utf-8?B?dU1WWnROVXd1SjBiYi9DVkFHdnpNYkN0aTZwYUNCa2dOT0JBMzB1aWVUNHZG?=
 =?utf-8?B?QlhMeUIxOXlOT2VaRGhvbzU3RGJjMkRRdXAveEJiTkRvbEVsdlU2WkNJZ0lw?=
 =?utf-8?B?QkhZM3ZTeHI2dWxMUnY2K3UwRGV2d3BDUDZBZ0Z1TEcrK0hjT3YrVHZmb0tC?=
 =?utf-8?B?M09ZcDNmOVBUS2hXTWZYNTNxM2NPVHVJcUtXMDBrQ3drVmhXKzJrT1MwNm0r?=
 =?utf-8?B?ZndycDNpQk5FcHdUSkJnOVNaYTh5SWlIVHk5RFdrNTlZWlpadkZTVjNmL3pY?=
 =?utf-8?B?WWYydXR3VHlvY1U1OXV4SndQRVR4aFMyRkZDSklpVmxNNi9UeEJUODVmWUtU?=
 =?utf-8?B?NEpBVThNSm1jckp2Lzl0UjRPclhHbUR2aERzWlJUbnV1U09VUC8xV1dwQ0FN?=
 =?utf-8?B?cVptdEFxOTd6cHFnTlNWaGtQV0JPdUxIc3p2c3J2VDBzSEFJeTMwRnorb2V6?=
 =?utf-8?B?NmZ3NVl6RGwwREY3eFZpR0lxdklIZWQ3UHZGSVNjaGc0dTZTbmlaZm1MUjJB?=
 =?utf-8?B?V3RGNE5lVTZsWXR0MXJId3d2b3ZhT1VJYVE2M0N5eldUaXBGWWJKclFSV3pQ?=
 =?utf-8?B?Y0w2WEFZSWJNbHNDenM3bUoxNFArWVJwUlNRZXBlMjVTY1YzTlFvd3BvNUJY?=
 =?utf-8?B?cHJsR3Q5RG5hRVBHSE9XdkhIVFlRRk53QzRFTUl0Z21kYjhVcUYrOGZSbWlo?=
 =?utf-8?B?OHlQL0h6eGdFeWFUeUR3RzdpeStnQmcyY2NMMmFZODVUdW1RaUxzVFBDZVp4?=
 =?utf-8?B?a3RBSmFRdTNFYmc3RjhBN2ViVlRDTEVDQXAzcUdNV1dVMXRhQ1hzUklBaWNy?=
 =?utf-8?B?M0Vnb1cwU2tlVlI4QUhNTWtSOHhlcGFWQTNZdndFNHMxZDhmTkdyS042OHJZ?=
 =?utf-8?B?d091RlQyYXFvTkRGRTVmbmUxKzlCWDVOMUZLcWF2UDFGN0I4MkI0dEVBK3BI?=
 =?utf-8?B?aEh1ZVdrQzlmbEZDazlaWXQzaWlNcVdnT3V1OTR0Q0cwd1cvT3JGTkN0Z0ZB?=
 =?utf-8?B?T0tVUG9hVGt2V2NuYm9sRFNQV0U2VldZdUJtTWZPNkxFVklxZmJOTjBLUHUr?=
 =?utf-8?Q?Zt2y1LggXPc24OMOU9DKqg4L+?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7cef1ea7-34eb-42a0-a4cc-08da91c8299c
X-MS-Exchange-CrossTenant-AuthSource: DM5PR12MB1947.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Sep 2022 18:30:10.5683 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mevv/NRztciwwwK+2u8JgyTBeJn/5ROtmVAjNvPwaYK/ITMuVuJL2NoD/Pn+csLZEmJNqn38AVLGyQFajc9Ykg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB5014
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

Please send everything together because otherwise it's not clear why we 
need this.

Andrey

On 2022-09-08 11:09, James Zhu wrote:
> Yes, it is for NPI design. I will send out patches for review soon.
>
> Thanks!
>
> James
>
> On 2022-09-08 11:05 a.m., Andrey Grodzovsky wrote:
>> So this is the real need of this patch-set, but this explanation 
>> doesn't appear anywhere in the description.
>> It's always good to add a short 0 RFC patch which describes the 
>> intention of the patchset if the code is
>> not self explanatory.
>>
>> And I still don't understand the need - i don't see anything in 
>> amdgpu_ctx_fini_entity regarding
>> rings tracking ? Is it a new code you plan to add and not included in 
>> this patcheset ? Did i miss an
>> earlier patch maybe ?
>>
>> Andrey
>>
>> On 2022-09-08 10:45, James Zhu wrote:
>>> To save lines is not the purpose.
>>>
>>> Also I want to use entity->sched_list to track ring which is used in 
>>> this ctx in amdgpu_ctx_fini_entity
>>>
>>> Best Regards!
>>>
>>> James
>>>
>>> On 2022-09-08 10:38 a.m., Andrey Grodzovsky wrote:
>>>> I guess it's an option but i don't really see what's the added 
>>>> value  ? You saved a few lines in this patch
>>>> but added a few lines in another. In total seems to me no to much 
>>>> difference ?
>>>>
>>>> Andrey
>>>>
>>>> On 2022-09-08 10:17, James Zhu wrote:
>>>>> Hi Andrey
>>>>>
>>>>> Basically this entire patch set are derived from patch [3/4]: 
>>>>> entity->sched_list = num_sched_list > 1 ? sched_list : NULL;
>>>>>
>>>>> I think no special reason to treat single and multiple schedule 
>>>>> list here.
>>>>>
>>>>> Best Regards!
>>>>>
>>>>> James
>>>>>
>>>>> On 2022-09-08 10:08 a.m., Andrey Grodzovsky wrote:
>>>>>> What's the reason for this entire patch set ?
>>>>>>
>>>>>> Andrey
>>>>>>
>>>>>> On 2022-09-07 16:57, James Zhu wrote:
>>>>>>> drm_sched_pick_best returns struct drm_gpu_scheduler ** instead of
>>>>>>> struct drm_gpu_scheduler *
>>>>>>>
>>>>>>> Signed-off-by: James Zhu <James.Zhu@amd.com>
>>>>>>> ---
>>>>>>>   include/drm/gpu_scheduler.h | 2 +-
>>>>>>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>>>>>>
>>>>>>> diff --git a/include/drm/gpu_scheduler.h 
>>>>>>> b/include/drm/gpu_scheduler.h
>>>>>>> index 0fca8f38bee4..011f70a43397 100644
>>>>>>> --- a/include/drm/gpu_scheduler.h
>>>>>>> +++ b/include/drm/gpu_scheduler.h
>>>>>>> @@ -529,7 +529,7 @@ void drm_sched_fence_finished(struct 
>>>>>>> drm_sched_fence *fence);
>>>>>>>   unsigned long drm_sched_suspend_timeout(struct 
>>>>>>> drm_gpu_scheduler *sched);
>>>>>>>   void drm_sched_resume_timeout(struct drm_gpu_scheduler *sched,
>>>>>>>                           unsigned long remaining);
>>>>>>> -struct drm_gpu_scheduler *
>>>>>>> +struct drm_gpu_scheduler **
>>>>>>>   drm_sched_pick_best(struct drm_gpu_scheduler **sched_list,
>>>>>>>                unsigned int num_sched_list);
