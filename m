Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EF4AA788576
	for <lists+dri-devel@lfdr.de>; Fri, 25 Aug 2023 13:18:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 249E110E64C;
	Fri, 25 Aug 2023 11:18:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam02on2077.outbound.protection.outlook.com [40.107.212.77])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B9D3110E64C;
 Fri, 25 Aug 2023 11:18:29 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=m3nFA6wTy6Yiet01RVsbzXuK8n/388CY9WzxlLrXMI6gLkUfGTazzs2XpZ0NDN0SjMspzaNr1dktw0G14bg9p5HJdtwg9c3HRvi+H+mo2ZxzlKn7OimHbVriB++xpBGSzf5X2ZYu2U9eKORiYtgNpaFUaC3yAjfBdy6Nue58f5HHXev5T10tENZH7NvNwFgDgp28F3yV0sl3inPh8+Rrblv2Tf9116s5EzVijthm7I6b6HkqP5pfTgX/IA3qxEIIp8zhmIzd1sk5ZwR/3C0CcY0JhM3ltmII0DpEw0Ung/FoIghAoZJp1KFAHfwTOQ6G9CXBwI7HwL4VBAJSbAN1cw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NZVEssmEp4yw/5I2xDf28Og5gDb5AgG8QkL2R5IvMt0=;
 b=oFJ1R9bLH1xMJ7O3LUp/sxztXUShqzmcDz9LOPtnh7Yg1CtXSD3cMzUSJ3XzuUGSgcVxBlyrxFifRcPkTHTUXZhurOHhD3SIGN6ZltoJ47k2yZJ6D7yZKfYd4wNDz92fGD4LbHLZpHUk3EXzJTfxblmOOQETQO2lxyxjBSm10iQzpPEI/keCRCDz+ux5BWqVGsVfXPPnMxd/+YkO1WLAgslHxaV+Vc8WslkGSAaWdPxX94+4CoFL0q6R98OXC9TUvCoGLsOHwjY98BuUpdrtR2D0vN2pGjysxczoZ5Z4Zw01H9xv4LnylG9O3zNMKURBTWynPdUL59MYl/uK1W9Vvg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NZVEssmEp4yw/5I2xDf28Og5gDb5AgG8QkL2R5IvMt0=;
 b=M7XiM1R9Qc/3v5cDKJiKU6a+V0sQxy+0YuEAh/q4j9tlcApOuEZwWZ60JW6JDExO8Pr53Aj6r4hkcM8ymqIrgXGmL+h7aP7ZWSOykSsFS8Tq0R8G8N26cOOMKalMnt1BKeXMX5qT2VhNRSMNod2r0H8JJOCD8nAscUrrwMN6mE4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB6000.namprd12.prod.outlook.com (2603:10b6:510:1dc::15)
 by SN7PR12MB7834.namprd12.prod.outlook.com (2603:10b6:806:34d::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.27; Fri, 25 Aug
 2023 11:18:26 +0000
Received: from PH7PR12MB6000.namprd12.prod.outlook.com
 ([fe80::f78e:33f4:56d2:1ef4]) by PH7PR12MB6000.namprd12.prod.outlook.com
 ([fe80::f78e:33f4:56d2:1ef4%7]) with mapi id 15.20.6699.027; Fri, 25 Aug 2023
 11:18:26 +0000
Message-ID: <782b5c27-8a1c-06a3-9fc2-6c5f9aef4a13@amd.com>
Date: Fri, 25 Aug 2023 16:48:08 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v2 3/7] drm/amdgpu: Add new function to put GPU power
 profile
To: "Lazar, Lijo" <lijo.lazar@amd.com>, Arvind Yadav <Arvind.Yadav@amd.com>,
 Christian.Koenig@amd.com, alexander.deucher@amd.com,
 shashank.sharma@amd.com, Xinhui.Pan@amd.com, airlied@gmail.com,
 daniel@ffwll.ch, Felix.Kuehling@amd.com, amd-gfx@lists.freedesktop.org
References: <20230821064759.94223-1-Arvind.Yadav@amd.com>
 <20230821064759.94223-4-Arvind.Yadav@amd.com>
 <c72a7412-a95a-1a99-f337-f64a789e81bf@amd.com>
 <443129d5-4d40-c777-e488-78393bd35397@amd.com>
 <7a60130d-d398-862e-e9da-2685284eff95@amd.com>
Content-Language: en-US
From: "Yadav, Arvind" <arvyadav@amd.com>
In-Reply-To: <7a60130d-d398-862e-e9da-2685284eff95@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN3PR01CA0142.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:bf::20) To PH7PR12MB6000.namprd12.prod.outlook.com
 (2603:10b6:510:1dc::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB6000:EE_|SN7PR12MB7834:EE_
X-MS-Office365-Filtering-Correlation-Id: 81d4eae1-4af8-4c2c-b313-08dba55d0064
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: h8xOFZ8YzZ4vQPfXk7HZfHTYFbK8QrnIJVvmkWQFuYx1Pf0aCSypofkIcpEfNdSyvNSqEX4fzkQfhC5tDLYtIJeYcPpw2ZO8GH7jTqLxr23UkBn2hGLUKY40rocP7iGM954qPAzZwCDKRZC946Bmx0h1a71iX/XFkk40sK2crP2spBKssiZ7kXHVZQD0WYlvno7nQZSe6NCKl4yvhHx5TADgDnFovR6fxOv+AUboBIlwP2Y8YPtsKkuUF08/GvblGDHwlKFSkct1bGsdqFRF/+hOcaa7R85MxkCjwdWEdLIApApTErG2dfbKK51V8bzL7D+Z7BFJLYyoSOhQnXkrnoCkZn+0BmhLyMFHXY+6fs8ImWknsT9L7C94r9Rpt/O8zbYvnajQhku45+T90fIFM2HO7m/rzFrqQSPuiRAOONVx8T6SoBUnP+oip/sm01r4YejVw/LMsZdERoPjPuTxwxe6SRlLfWJx1mf8q5Pwne2I+FVAXKBnaSP3FE4raHaYmG1kX2ijCploL5fWHA1OMCPzJEeq08poSBaig5VfXYpiIqwQPSwsYzENN/jJAqidRPVg38Q4FoUUxEOuBLb0AhwqoDu0V4OW774kdzX/XuDINtUSJLY/UwbwheLml5eSPMpVqRDB03pttPqGa6Jv3kQ4yaJU9m7zHSAUAxsbvkI=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB6000.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(346002)(136003)(39860400002)(376002)(396003)(186009)(451199024)(1800799009)(66899024)(6506007)(2616005)(6512007)(83380400001)(26005)(53546011)(66946007)(30864003)(41300700001)(66476007)(66556008)(2906002)(316002)(5660300002)(4326008)(8936002)(110136005)(8676002)(6486002)(6666004)(478600001)(31696002)(38100700002)(921005)(36756003)(31686004)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dnp2NHFRSWNoazQySFVpN2Z4R2pQVnZKdzZxc2o2N3J2YVpkejRaSkZIcXRz?=
 =?utf-8?B?ZS9tQmlnMWxEOEZWR1I4aTNWMHpvcWxLRUJZWGlHbm1idm9sYW5SZWJzY3NM?=
 =?utf-8?B?TUJKSkVMaUVmdG9OVnZpNFZGaWE5R3lpb3laRmVBeFBsTU9TTVdvTkpkYm82?=
 =?utf-8?B?djZIOGRPUGUwa3o1bEZ6YlR4VHhqanArVU84YmhlZGhkZ0U4ekdlWllxT2pE?=
 =?utf-8?B?L3RYQklKekVjUm9VWWpVSGY2TjJyajVKcGk3U2tDcWRacHdTZGd4dUxYUVkv?=
 =?utf-8?B?YW51WTBraVE3Q240OW5jMU5ZRlR4SXZZejhZU0t5aTE3b0xkQXIxbzhJVzlQ?=
 =?utf-8?B?VUdyNXYyTHJFdG5HcXlTY3I1RmlydUJOd3lLVHdFeEdWYkdCa1BieFlDczlD?=
 =?utf-8?B?b1BHdUltWmxUbWU3anhCdTAxYk0wQTlJVGNFakVFWnpPWDNQQU1aekhLR3Ji?=
 =?utf-8?B?QnJXcy9tUGJzL2JRZ2VLLzh1QTNtTEpNdGFDWjFwem1ZN0VZV1lXS05BS2kw?=
 =?utf-8?B?Q0tPc1lCRkZuTmU3YzhGZGJuRlhGMHdCcytweCtOMnFUaUIvMHA0aTZpLy9L?=
 =?utf-8?B?eDNGK1NMVTFaK1p5dHRINFhnN2hwTHZUb1hNcTN0L1AyUVo5RnI0QmkzKzRO?=
 =?utf-8?B?eGtBVXRWMjRMczhEdS9PTUdTWFFTMytEaTkrMHV0Z2drWUQ4RGJaWU82RTF6?=
 =?utf-8?B?WUhQU2ZkL2lkUkxDSGZsdTRHWXgxVEVHRGQyL2FVM1pNemJPT0ZocVl1bHdy?=
 =?utf-8?B?a04wdEtMbU1XcmhwK2w4d1hyWkZhU2dBaGM3NjB2S2F0bW5COFErN3dXL2U1?=
 =?utf-8?B?M0puTnBZUjBwRDNXK0hXTUZrZXYydHpLM3ViQ1d3NzdGejU0aW5sL0JpNjFE?=
 =?utf-8?B?UE04cnh0M1ZlWmNVTDFwcE5Jc2F2dGMrOWJiK3VvU1E5VkFrQTluQjR6K0dV?=
 =?utf-8?B?MlhFOXhyVWkrQjYwN3YxM0xJazFCQXVlTXRUVm5UNjdCVENwY0V4ckQ5aWpI?=
 =?utf-8?B?Qjhkdmt4Yk9NYUJWVWlmRzYwaWFwditIaWgxMTJxdTUwUzB5dU5lK1ZxWUxn?=
 =?utf-8?B?SDhFZWZwZm42K1p3ZTlRazV6ZUNjSXdDS3F2UnlNNXJMSGROdXdEREZPMkFK?=
 =?utf-8?B?dTdEd1RoTUVwdHRwTnVEZFE0cjNRTzJQZzEzQUFiblErc0hXWlBRR1kyRDhp?=
 =?utf-8?B?dUlTbjgyN2IzaEFDSHlNdUNaekdVbU5ING9sQUpweFI4NFJ4OEdJMHpreHJW?=
 =?utf-8?B?Nmt2ZGdyait4Y0FwQXNEQThuVzQ2aDNZZHI2L2g5cnFOdEUwdTlOc1RkZGxj?=
 =?utf-8?B?eUNndUVJNmxCRlZEYVVDRWt4OFBjSTc2WDBZWGRULzVMbTR6emNJUjFReUhU?=
 =?utf-8?B?T2ljTEt4OU5VRXVYc2FQN3JaamlWb3RwNDVQNkoySFNvRjRrS0RiYzZidHZB?=
 =?utf-8?B?eTZ3SmVEU2JVR3hIcjhFQnllNlRBN0lYbWF5b0tucGcwZHlTVisvWkpZSTM2?=
 =?utf-8?B?dEU1SWhvTmR1ZjUwWmhldFZnOEc4ekRTRExXUGpTTktsc0xORFV2MzBabzh4?=
 =?utf-8?B?RjRuU2oxMUdrR25BRVlMMW1sYjJqWDQ4QUVmUnRXNGFGNnhyMFNkWTJDTVVl?=
 =?utf-8?B?S3JSRkthSnIveFowajNJMDBtYU9hUG9TRHhyOTdCOFU2dHNUL09HWTF1eDJI?=
 =?utf-8?B?Wml3bTRjMTMxR2JnWkYzOEdpYktLbk1hQnVGTVNlZUZFV2E2Q3B4TVFkeHZs?=
 =?utf-8?B?RlF3bDBoUlhDaEFOaUZxOEZLd0VnOXBmK0c0T3JRcFc3c2FxS3NvbEcyRmpr?=
 =?utf-8?B?RUJWMkMyemQ5OVBVRkU2K2pocG13MkFLc1dYV1NmZzN2MVVVckpXaFpBaTJs?=
 =?utf-8?B?L09Od04wamdyOGFSSEZ1SmNCaC9LWUxSbWREbHM4OHdMSTZnK0tCZkNCRTA1?=
 =?utf-8?B?alRnVHZXWU4yOGJvbVNKZm5TN1N6ZWRPbzhpZStIOGVkZyt6Q1ZnV1lvTXA2?=
 =?utf-8?B?K05mTGEreHNSMTRNYWIrUzhkT1NuU0E5cGE2QXo2SlhEUVFWVVJWZTB4S2lm?=
 =?utf-8?B?MkZrYW1EbE9MSTUvcWVGYnFvOXFEMW4rNGtJamdKL1dqdjZiVldteDZ3b0NI?=
 =?utf-8?Q?Vs1N4+4gOGhRRhASrL1tXNsW0?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 81d4eae1-4af8-4c2c-b313-08dba55d0064
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB6000.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Aug 2023 11:18:26.5006 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DB+7mhnbT3q2CX3+sfz6kEu+UwoE3RCkf7jn4azk+xL/akKyoX+M12kkCBnM9tviGp1Jhh/IGPjHqoKLsBwS3g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7834
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 8/22/2023 6:16 PM, Lazar, Lijo wrote:
>
>
> On 8/22/2023 5:41 PM, Yadav, Arvind wrote:
>> Hi Lijo,
>>
>> The *_set function will set the GPU power profile and the *_put 
>> function will  schedule the
>> smu_delayed_work task after 100ms delay. This smu_delayed_work task 
>> will clear a GPU
>> power profile if any new jobs are not scheduled within 100 ms. But if 
>> any new job  comes within 100ms
>> then the *_workload_profile_set function  will cancel this work and 
>> set the GPU power profile based on
>> preferences.
>>
>> Please see the below case.
>>
>> case 1 - only same profile jobs run. It will take 100ms to clear the 
>> profile once all jobs complete.
>>
>>                                             wl = VIDEO <100ms>
>> workload _________|`````````````````````````````````````|____
>>
>> Jobs (VIDEO) ________|```|__|```|___|````|___________
>>
>>
>> Case2 - two jobs of two different profile. job1 profile will be set 
>> but when job2 will arrive it will be moved
>>          to higher profile.
>>
>>                                   wl = VIDEO  ->    wl = COMPUTE   
>> <100ms>
>> workload 
>> ___|``````````````````````````````````````````````````````````````````|____
>>
>> Jobs (VIDEO) ___|```|__|```|___|````|___|````|_______
>>
>> Jobs (COMPUTE) ______________|```|___|````|___|````|_________
>>
>>
>>
>> Case3 - two jobs of two different profile. job1 profile will be set 
>> but when job2 will arrive it will not be moved
>> to lower profile. When compute job2 will complete then only it will 
>> move to lower profile.
>>
>>                                               wl = COMPUTE 
>> ->               wl = VIDEO  <100ms>
>> workload 
>> _________|``````````````````````````````````````````````````````````````````|____ 
>>
>>
>> Jobs (COMPUTE)    ____|```|__|```|___|````|___|````|_______
>>
>> Jobs (VIDEO) 
>> ___________________|```|___|````|___|````|___|````|___________
>>
>
> swsmu layer maintains a workload mask based on priority. So once you 
> have set the mask, until you unset it (i.e when refcount = 0), the 
> mask will be set in the lower layer. swsmu layer will take care of 
> requesting FW the highest priority. I don't think that needs to be 
> repeated at this level.
>
> At this layer, all you need is to refcount the requests and make the 
> request.
>
> When refcount of a profile becomes non-zero (only one-time), place one 
> request for that profile. As swsmu layer maintains the workload mask, 
> it will take the new profile also into consideration while requesting 
> for the one  with the highest priority.
>
> When refcount of a profile becomes zero, place a request to clear it. 
> This is controlled by your idle work. As I see, it keeps an additional 
> 100ms tolerance before placing a clear request. In that way, there is 
> no need to cancel that work.
>
> Inside idle work handler -
> Loop through the profiles that are set and clear those profiles whose 
> refcount is zero.
>
> Thus if a job starts during the 100ms delay, idle work won't see the 
> ref count as zero and then it won't place a request to clear out that 
> profile.
>
Hi Liji,

Thank you for your comment. We would be considering your comment but we 
would retain the same design.

~Arvind.

>> On 8/22/2023 10:21 AM, Lazar, Lijo wrote:
>>>
>>>
>>> On 8/21/2023 12:17 PM, Arvind Yadav wrote:
>>>> This patch adds a function which will clear the GPU
>>>> power profile after job finished.
>>>>
>>>> This is how it works:
>>>> - schedular will set the GPU power profile based on ring_type.
>>>> - Schedular will clear the GPU Power profile once job finished.
>>>> - Here, the *_workload_profile_set function will set the GPU
>>>>    power profile and the *_workload_profile_put function will
>>>>    schedule the smu_delayed_work task after 100ms delay. This
>>>>    smu_delayed_work task will clear a GPU power profile if any
>>>>    new jobs are not scheduled within 100 ms. But if any new job
>>>>    comes within 100ms then the *_workload_profile_set function
>>>>    will cancel this work and set the GPU power profile based on
>>>>    preferences.
>>>>
>>>> v2:
>>>> - Splitting workload_profile_set and workload_profile_put
>>>>    into two separate patches.
>>>> - Addressed review comment.
>>>>
>>>> Cc: Shashank Sharma <shashank.sharma@amd.com>
>>>> Cc: Christian Koenig <christian.koenig@amd.com>
>>>> Cc: Alex Deucher <alexander.deucher@amd.com>
>>>> Signed-off-by: Arvind Yadav <Arvind.Yadav@amd.com>
>>>> ---
>>>>   drivers/gpu/drm/amd/amdgpu/amdgpu_workload.c  | 97 
>>>> +++++++++++++++++++
>>>>   drivers/gpu/drm/amd/include/amdgpu_workload.h |  3 +
>>>>   2 files changed, 100 insertions(+)
>>>>
>>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_workload.c 
>>>> b/drivers/gpu/drm/amd/amdgpu/amdgpu_workload.c
>>>> index e661cc5b3d92..6367eb88a44d 100644
>>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_workload.c
>>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_workload.c
>>>> @@ -24,6 +24,9 @@
>>>>     #include "amdgpu.h"
>>>>   +/* 100 millsecond timeout */
>>>> +#define SMU_IDLE_TIMEOUT    msecs_to_jiffies(100)
>>>> +
>>>>   static enum PP_SMC_POWER_PROFILE
>>>>   ring_to_power_profile(uint32_t ring_type)
>>>>   {
>>>> @@ -59,6 +62,80 @@ amdgpu_power_profile_set(struct amdgpu_device 
>>>> *adev,
>>>>       return ret;
>>>>   }
>>>>   +static int
>>>> +amdgpu_power_profile_clear(struct amdgpu_device *adev,
>>>> +               enum PP_SMC_POWER_PROFILE profile)
>>>> +{
>>>> +    int ret = amdgpu_dpm_switch_power_profile(adev, profile, false);
>>>> +
>>>> +    if (!ret) {
>>>> +        /* Clear the bit for the submitted workload profile */
>>>> +        adev->smu_workload.submit_workload_status &= ~(1 << profile);
>>>> +    }
>>>> +
>>>> +    return ret;
>>>> +}
>>>> +
>>>> +static void
>>>> +amdgpu_power_profile_idle_work_handler(struct work_struct *work)
>>>> +{
>>>> +
>>>> +    struct amdgpu_smu_workload *workload = container_of(work,
>>>> +                              struct amdgpu_smu_workload,
>>>> +                              smu_delayed_work.work);
>>>> +    struct amdgpu_device *adev = workload->adev;
>>>> +    bool reschedule = false;
>>>> +    int index  = fls(workload->submit_workload_status);
>>>> +    int ret;
>>>> +
>>>> +    mutex_lock(&workload->workload_lock);
>>>> +    for (; index > 0; index--) {
>>>
>>> Why not use for_each_set_bit?
>>
>> We are clearing which we have only set it. We will clear first higher 
>> profile then lower.
>>
>
> You don't need to do take care of this. swsmu layer will take care of 
> the priority. It is not the job of this layer to take care of 
> priority. swsmu is the layer that could be altered specific to each 
> SOC, and that can take care of any priority changes accordingly. This 
> layer only needs to ref count the requests and place accordingly.
>
>>
>>>
>>>> +        int val = atomic_read(&workload->power_profile_ref[index]);
>>>> +
>>>> +        if (val) {
>>>> +            reschedule = true;
>>>
>>> Why do you need to do reschedule? For each put(), a schedule is 
>>> called. If refcount is not zero, that means some other job has 
>>> already set the profile. It is supposed to call put() and at that 
>>> time, this job will be run to clear it anyway, right?
>>>
>> Yes, I have got the comment for this I am going to remove this.
>> Noted.
>>
>>>> +        } else {
>>>> +            if (workload->submit_workload_status &
>>>> +                (1 << index)) {
>>>> +                ret = amdgpu_power_profile_clear(adev, index);
>>>> +                if (ret) {
>>>> +                    DRM_WARN("Failed to clear workload %s,error = 
>>>> %d\n",
>>>> +                         amdgpu_workload_mode_name[index], ret);
>>>> +                    goto exit;
>>>> +                }
>>>> +            }
>>>> +        }
>>>> +    }
>>>> +    if (reschedule)
>>>> + schedule_delayed_work(&workload->smu_delayed_work,
>>>> +                      SMU_IDLE_TIMEOUT);
>>>> +exit:
>>>> +    mutex_unlock(&workload->workload_lock);
>>>> +}
>>>> +
>>>> +void amdgpu_workload_profile_put(struct amdgpu_device *adev,
>>>> +                 uint32_t ring_type)
>>>> +{
>>>> +    struct amdgpu_smu_workload *workload = &adev->smu_workload;
>>>> +    enum PP_SMC_POWER_PROFILE profile = 
>>>> ring_to_power_profile(ring_type);
>>>> +
>>>> +    if (profile == PP_SMC_POWER_PROFILE_BOOTUP_DEFAULT)
>>>> +        return;
>>>> +
>>>> +    mutex_lock(&workload->workload_lock);
>>>> +
>>>> +    if (!atomic_read(&workload->power_profile_ref[profile])) {
>>>> +        DRM_WARN("Power profile %s ref. count error\n",
>>>> +             amdgpu_workload_mode_name[profile]);
>>>> +    } else {
>>>> + atomic_dec(&workload->power_profile_ref[profile]);
>>>> + schedule_delayed_work(&workload->smu_delayed_work,
>>>> +                      SMU_IDLE_TIMEOUT);
>>>> +    }
>>>> +
>>>> +    mutex_unlock(&workload->workload_lock);
>>>> +}
>>>> +
>>>>   void amdgpu_workload_profile_set(struct amdgpu_device *adev,
>>>>                    uint32_t ring_type)
>>>>   {
>>>> @@ -70,13 +147,30 @@ void amdgpu_workload_profile_set(struct 
>>>> amdgpu_device *adev,
>>>>           return;
>>>>         mutex_lock(&workload->workload_lock);
>>>> + cancel_delayed_work_sync(&workload->smu_delayed_work);
>>>
>>> This is a potential deadlock. You already hold the mutex and then 
>>> waiting for idle work to finish. Idle work could now be at the point 
>>> where it is waiting for the same mutex. Suggest not to call cancel 
>>> here and let the mutex take care of the sequence.
>> We cannot cancel if idle work is running. So we have to wait until 
>> ideal work is complete. If *put function arrived before ideal work is 
>> not stated then we can cancel it. but if it is running work thread we 
>> should wait.
>
> No need to wait, because you already have a mutex. So you will be 
> waiting naturally for the mutex lock to be released (if at all idle 
> work already grabbed it). If a request comes in at the time while idle 
> work is running it is only a timing issue.
>
> Also you have a deadlock here. Here you acquired the mutex first and 
> then waiting for the idle work to finish. The idle work function would 
> have just started at that point and reached to the place where it is 
> going to grab mutex. That is a deadlock. This function is waiting for 
> idle work to finish and idle work is waiting to get the mutex.
>
> Nevertheless, this function doesn't even need to take care of such 
> fancy things. It only grabs the mutex and increases the refcount, 
> places a request if refcount became non-zero.
>
> At whatever point, idle work runs, it will see that the refcount is 
> not zero and skips placing a request to clear that profile.
>
>>>
>>>>         ret = amdgpu_power_profile_set(adev, profile);
>>>>       if (ret) {
>>>>           DRM_WARN("Failed to set workload profile to %s, error = 
>>>> %d\n",
>>>>                amdgpu_workload_mode_name[profile], ret);
>>>> +        goto exit;
>>>> +    }
>>>> +
>>>> +    /* Clear the already finished jobs of higher power profile*/
>>>> +    for (int index = fls(workload->submit_workload_status);
>>>> +         index > profile; index--) {
>>>> +        if (!atomic_read(&workload->power_profile_ref[index]) &&
>>>> +            workload->submit_workload_status & (1 << index)) {
>>>> +            ret = amdgpu_power_profile_clear(adev, index);
>>>> +            if (ret) {
>>>> +                DRM_WARN("Failed to clear workload %s, err = %d\n",
>>>> +                     amdgpu_workload_mode_name[profile], ret);
>>>> +                goto exit;
>>>> +            }
>>>> +        }
>>>
>>> If you follow the earlier comment, that will keep this logic only at 
>>> one place - i.e, at idle work handler. Basically just let the idle 
>>> work handle its duty. If some job starts running during the clear 
>>> call, it's just unfortunate timing and let the next set() take the 
>>> lock and request profile again.
>>
>> So basically for every millisecond  new jobs are coming and 
>> completing it to the same or different profile . Suppose we are 
>> running higher profile jobs and  before it completes if a lower job 
>> arrives, this check will help to move the higher profile to lower 
>> profile once higher profile finishes it. If we are not checking here 
>> then it will stuck on higher profile until then other jobs will also 
>> not complete. Please refer case3 scenario.
>>
>
> As mentioned before, this is not the place to take care of SOC 
> specific power profile priorities. We already have swsmu layer doing 
> that job. This layer just needs to do a ref count and place requests 
> accordingly.
>
> Thanks,
> Lijo
>
>>
>>> Thanks,
>>> Lijo
>>>
>>>>       }
>>>>   +exit:
>>>>       mutex_unlock(&workload->workload_lock);
>>>>   }
>>>>   @@ -87,6 +181,8 @@ void amdgpu_workload_profile_init(struct 
>>>> amdgpu_device *adev)
>>>>       adev->smu_workload.initialized = true;
>>>> mutex_init(&adev->smu_workload.workload_lock);
>>>> + INIT_DELAYED_WORK(&adev->smu_workload.smu_delayed_work,
>>>> +              amdgpu_power_profile_idle_work_handler);
>>>>   }
>>>>     void amdgpu_workload_profile_fini(struct amdgpu_device *adev)
>>>> @@ -94,6 +190,7 @@ void amdgpu_workload_profile_fini(struct 
>>>> amdgpu_device *adev)
>>>>       if (!adev->smu_workload.initialized)
>>>>           return;
>>>>   + cancel_delayed_work_sync(&adev->smu_workload.smu_delayed_work);
>>>>       adev->smu_workload.submit_workload_status = 0;
>>>>       adev->smu_workload.initialized = false;
>>>> mutex_destroy(&adev->smu_workload.workload_lock);
>>>> diff --git a/drivers/gpu/drm/amd/include/amdgpu_workload.h 
>>>> b/drivers/gpu/drm/amd/include/amdgpu_workload.h
>>>> index 5022f28fc2f9..ee1f87257f2d 100644
>>>> --- a/drivers/gpu/drm/amd/include/amdgpu_workload.h
>>>> +++ b/drivers/gpu/drm/amd/include/amdgpu_workload.h
>>>> @@ -46,6 +46,9 @@ static const char * const 
>>>> amdgpu_workload_mode_name[] = {
>>>>       "Window3D"
>>>>   };
>>>>   +void amdgpu_workload_profile_put(struct amdgpu_device *adev,
>>>> +                 uint32_t ring_type);
>>>> +
>>>>   void amdgpu_workload_profile_set(struct amdgpu_device *adev,
>>>>                    uint32_t ring_type);
