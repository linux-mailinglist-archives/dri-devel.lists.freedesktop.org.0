Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 81EAD7B2596
	for <lists+dri-devel@lfdr.de>; Thu, 28 Sep 2023 20:53:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 79BB110E34D;
	Thu, 28 Sep 2023 18:53:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam04on2066.outbound.protection.outlook.com [40.107.101.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A54C10E071;
 Thu, 28 Sep 2023 18:53:34 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oR1R2DAR/QqaTvpid49tZewWfNOh1ccPI101JPgb6KxK96OKAjXheo9vTFW8aNYNb8/5tYSjTSiTQAdWR3UKAe6OTrScNhv8Q9EI/0Y7PAqu5dX6+I8riHfcahroxm9XwhxLzYwIwHTxibNBD5hXuIg/n5FqcwHxrFIgRQeCdLUFncqN9U5Ao4y/PwC7mRviNZZmoIS9lE/G2wjxBqMe5CbF8MRaawY89fla8N3SFTeMF0gVgv/M8lUbEiKpgHJ1+NGSrpC6lbCngtGcHEVZafwWjOyLqltWeKUYikZrQbyLLaODKzMmWod1mgz4N1DzOJflMW1RVAr+eDFnd1l1Lg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CNll4Let09F7CJcRI9yjdJ5Bbn0Vx18tRKrxMbx7kzs=;
 b=euxVuDCJnHBxFO3j04r82ewfpMxBRifoychze019951M4O2SuKeUqBIxM7VHC3Q9E2t0uNBiC7hV/bqVUOYlAjt1q2HloiTdcJKlR/0Q8uHV+/mR5bkoNEFJfN4fK/34JLnznqR0AGnITicJUrTvq4WWGxXymzE7NUs1l4Aya1qUNPBgMBO4HdAwHqbJF9WUnr3xDsr9MMOQ1SDzG7Kj2wYMpme/3WDZ0cfpDSwhsft95RpUQyBiy7oSmTF6tSgc7iNXQj24KPIaT9bLKzU8zov6JvqejRdxAsLCN9hcm+Yb8aLqP/W35PiPhHWxvNNzL+g9NYc9IWIrghAUA0eJJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CNll4Let09F7CJcRI9yjdJ5Bbn0Vx18tRKrxMbx7kzs=;
 b=SZrajnv8yStKk8lgqasdaJ1uyMd66W0u8cMzrDw4XER2UzBoNNpjK6qBxR04fNdfdsPeVwewSjOo4cZ41xcWGoi2Rr8+9wtf50cg967bXPDgxm3mXgADktJ7DvYdK608vaE/xG3LXnmsnU3bR7DHhtEGfpYeeI5t6PFuiU3Nb3Y=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN9PR12MB5115.namprd12.prod.outlook.com (2603:10b6:408:118::14)
 by BY5PR12MB4100.namprd12.prod.outlook.com (2603:10b6:a03:200::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.25; Thu, 28 Sep
 2023 18:53:32 +0000
Received: from BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::2e40:ffd7:e752:644f]) by BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::2e40:ffd7:e752:644f%6]) with mapi id 15.20.6838.024; Thu, 28 Sep 2023
 18:53:32 +0000
Message-ID: <2f56333d-4549-3118-5cd0-3ad2be025b66@amd.com>
Date: Thu, 28 Sep 2023 14:53:29 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v2 1/1] drm/amdkfd: Fix unaligned doorbell absolute offset
 for gfx8
Content-Language: en-US
To: Shashank Sharma <shashank.sharma@amd.com>,
 "Joshi, Mukul" <Mukul.Joshi@amd.com>, "Yadav, Arvind"
 <Arvind.Yadav@amd.com>, "Koenig, Christian" <Christian.Koenig@amd.com>,
 "Deucher, Alexander" <Alexander.Deucher@amd.com>,
 "Pan, Xinhui" <Xinhui.Pan@amd.com>, "airlied@gmail.com" <airlied@gmail.com>,
 "daniel@ffwll.ch" <daniel@ffwll.ch>
References: <20230928095427.4337-1-Arvind.Yadav@amd.com>
 <20230928095427.4337-2-Arvind.Yadav@amd.com>
 <DM4PR12MB6445548E05C8E3B29AAEAFCAEEC1A@DM4PR12MB6445.namprd12.prod.outlook.com>
 <8cd0539d-5d5e-e670-9577-7db72393b784@amd.com>
 <8c9c3b5b-ba1e-ba07-3001-242eab9ca1a6@amd.com>
From: Felix Kuehling <felix.kuehling@amd.com>
Organization: AMD Inc.
In-Reply-To: <8c9c3b5b-ba1e-ba07-3001-242eab9ca1a6@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YQZPR01CA0032.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:86::12) To BN9PR12MB5115.namprd12.prod.outlook.com
 (2603:10b6:408:118::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR12MB5115:EE_|BY5PR12MB4100:EE_
X-MS-Office365-Filtering-Correlation-Id: e5168708-810b-4812-e102-08dbc05435ef
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 3f1cm9pyrUD3VbgurN9e+eqW3E2GkCLBKtUBfhQOi4kyL6xxMwvEvBBu6Orlv32m1x/74h6kDW55PGEkFvvfORyIWAaQ57L5Or1q6Ol1ik4s8ZLgkfUcIFScSIIUpJB1dc3hQ7BpVmb/Mlk/xb1p9Uo5ECF4twsLFhKykNKfVQ7/3YzzQqa7W4vt4HFYyl74ribKX16Y4jQivUcyUuMhAwxbADKIM9TgEaosMuepqz7nzjtF8tUqKDzhzNlkeIXgSBQXjSYQpafiiY7XkwCPSFez8J3PqBjY3DksE2nz6pctf6PwgsaI18fieSn57WRdqgreIxSlV9aIU6oeskJRWsISOYGIRYf03Wox+zrOVv7gWxJX7RssJR01NNXpJkh6TNvCivWT0ye31q3jdpJiDr7rPOLnDD+Rm9vElF9r1r0xmSjPfizoSGb1OC57jELYP/z67P4rOUMkp/ctt9Uvh1GOZLOu6CxnaKF0dLBXzKwq4cG3exyslRPywLgk4sr2okXeQVI9K0RFZyqjdWkxpmFUlaypp5Hbfww9ZrVpRsLdw+DVXmp+k8L7fRAXjXHPQJyrUZUj4DIfNlvQNwVedK0ElQkjvcRWFhPkTLfQ2ELx6Axxs6izNn2Q8tGOKRyzIIwj3k31cK7wjIhenXayEBclkTKr93ctHhx3TGpYcRs=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR12MB5115.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(396003)(136003)(376002)(366004)(39860400002)(230922051799003)(64100799003)(451199024)(186009)(1800799009)(31686004)(36916002)(6486002)(6506007)(6666004)(478600001)(53546011)(2616005)(38100700002)(31696002)(86362001)(921005)(41300700001)(83380400001)(2906002)(26005)(6512007)(66946007)(110136005)(66556008)(36756003)(66476007)(5660300002)(316002)(44832011)(54906003)(8676002)(8936002)(4326008)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dzBiMitsMlhpK2p6bE8zalg0enV6Q2h4UHZWUndUa0lYeHhxWmhrZmU0dEla?=
 =?utf-8?B?M01KWThWUjdlY0lSOXdUeTN0eGd4cUVKZlBLR3JGK0wwYm9kbmJqVkRjZUxQ?=
 =?utf-8?B?N3hQL3VKQlZudjRZMWord3JwNDI3WTgyZHBIcjRsUVRkQlBtZ1QxWlpZdDZY?=
 =?utf-8?B?eWRPS2JQamtwc2N5NllFTHFUMGV5MjZsWkRGQ09hbjZrSVpGMDlDOUZOSlN6?=
 =?utf-8?B?OUd0SnE5SXo5bDQ3U2xiWlVoWFlDY3gxMWZueUhEMWQwcjlJOXplNnZTYlM3?=
 =?utf-8?B?TmtNVm9RYXR0UGdKOXl6SHhGU1k1N0VCTTlYeXFucjFPTUdJMS9VTUpUcXQ3?=
 =?utf-8?B?NEE3YkxjSytkU254czNvOThFa1VVeCtGeUhxbDNNRUlYc2lqd0dlODUyUUpP?=
 =?utf-8?B?N2ZwVXlYZVllVm1vRWZwNER0cFBudmdqMnRwOVErNDFrdDlCK2FwK1hhd21S?=
 =?utf-8?B?RElPUlcrSXJPa2ZuVE1RZ3FpdGtXelIvV0s0MUE5MDMzRzNZZGU1TURoS1A3?=
 =?utf-8?B?U3BuTldXeVRXdFJmVG1hNlVVUllMM1BHSlpKRjFpRXZxMjBidHF1d25ISDlp?=
 =?utf-8?B?Ti9FVjVYOTltZHUzdWo2Q1pLVm9LMnNkVWd4OFpmeTlod0FhUW5HRHp0b1dl?=
 =?utf-8?B?c2g3bUorNDk4TkVXMlorNUtMaFp1UzcrR2JOMGVpcnpidDcvbmpRNzQ2c3Vk?=
 =?utf-8?B?VStBRFFEYlE1RzBFYkdFUWcxNWRMRlhyeERiRktpSGE0S2tobXcyTzJjUzg3?=
 =?utf-8?B?MnUzeG1GZHliM3E5SjlOQVVhWGxYYTIzaWRtcGJLRmlRUkNTd3QxSitPbmN0?=
 =?utf-8?B?UmdJM0dERzJDYUlVUm5HNnlhUnpJZ1RDMFE2SnNIVmRWM0t1YkFEVjVXTG5I?=
 =?utf-8?B?UE1NNXNGTWZEaVkyRlkwT3d1Q21ZT0V2VktoM3BuRCtMazhzdnRwUHdVZ2NY?=
 =?utf-8?B?Q0o2S01wM1FQd3dOdlFiVUVpRTI2NENlT2FCa2w0LzliYkxqL1phUE1oTC93?=
 =?utf-8?B?K1VnT0E0bmtuVFMvRW5rS1lyYnZMU3drcEplczVTclliTktlNzhud0FJTTZw?=
 =?utf-8?B?MFdzTmh1K1dJK3Y3VnlqME8yRk5qM0w2WFZCUkRTRlorWXZTM1lBUXJ5Tnly?=
 =?utf-8?B?bnNZMWtrLzUwRG5neTdPOXkvVVAvSFB4TmVXc010cGliYjllWUdjYkVDL3o5?=
 =?utf-8?B?SUh3cUZpMzN2eWNxMnhjNDVWdlltcHQ2YXp2L0lsTlRxQjdaekxwK0FWVVhU?=
 =?utf-8?B?c3dJUGJaWHRQcUJrRUpyajkycXZKSGVQcldld3lwZlRHZkRyaURDUzh0K2VF?=
 =?utf-8?B?bXVBMU9kM1RKWHorOVFYUjQ5QThkVVhjYVlNTG90ZVkvSTd6QzloYW1Xays1?=
 =?utf-8?B?SVFkNytkK2NzN2JaY0NmaGUvdUo2QWxoRGhPZEJPUjg3OTNuQVdQYlZvckQ2?=
 =?utf-8?B?ajlTamVIZENzMjJoelhyeHNiempqMEZOdHoyVmZFS0lLVmc1V3J4QUdGN0pk?=
 =?utf-8?B?NFRtSElxZG95UmcxSDJmRXBzeGlpVzh0OVdQZnFBSXl3VVlhRnUzclhhQVhL?=
 =?utf-8?B?U2ZYdTdMN0RnU1IwbEhlM0FrOUtpcFNNejZEUExNRmwxZ280bUFCaDFGTit0?=
 =?utf-8?B?WGgvSi9PVWxXVG9vMDVIdHUrcExNRW5yRlp6Q014cnM0RXdUaWJqaDZrQ1JQ?=
 =?utf-8?B?d0U0amREbUJYZ014UmM5NXBTRVIrblhOelV1MmdEemxUMUQxZmMrVmVIV3lj?=
 =?utf-8?B?YVpXLytCMVZ2VnhuQ1pKZFBNWVVaV1FmTHcvSHJrVGpkZGNuUFdpaFhSL2ty?=
 =?utf-8?B?YS9ZVmZybXhGSmJna210TjlSd3k3a2RZTk5vdFVtdWgzTW9aR3YvM0hEZVF1?=
 =?utf-8?B?WlJ1YmFTY0VGZmd1WmZDZWxCcTAvQUNDU2dWekw5ZmxYVDVMWjk4Sjh1ODhr?=
 =?utf-8?B?RUI1MkVSR1lreTZsNHRqWDN6UUcwMGtRdzlMRGJyRG5OQVp5Y3k1SWJ0WDVM?=
 =?utf-8?B?bzRmOTRZSm1jMDc0ZFZIUVFpZmxHWFlpcXpwVkg0L1pYTnk5eHh2ejIvMUdU?=
 =?utf-8?B?dGJNeS96YVVxazJtbFpSZG5NUmt4d0lxMzBQREVSMVJRb2ZSV29LcHFqeFcv?=
 =?utf-8?Q?COT/jhLE6/W6qPuyWv2CmOba4?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e5168708-810b-4812-e102-08dbc05435ef
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5115.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Sep 2023 18:53:31.9895 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FSgoMJdDAbtBof+PnkvKFfOX1Tx0oPjuHyMars1bsGziwFrsLb3WXGhUOVPRDTcbAmGZqHh/DwNil0zOwD88JA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4100
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
Cc: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2023-09-28 11:38, Shashank Sharma wrote:
> Hello Felix, Mukul,
>
> On 28/09/2023 17:30, Felix Kuehling wrote:
>> On 2023-09-28 10:30, Joshi, Mukul wrote:
>>> [AMD Official Use Only - General]
>>>
>>>> -----Original Message-----
>>>> From: Yadav, Arvind <Arvind.Yadav@amd.com>
>>>> Sent: Thursday, September 28, 2023 5:54 AM
>>>> To: Koenig, Christian <Christian.Koenig@amd.com>; Deucher, Alexander
>>>> <Alexander.Deucher@amd.com>; Sharma, Shashank
>>>> <Shashank.Sharma@amd.com>; Kuehling, Felix <Felix.Kuehling@amd.com>;
>>>> Joshi, Mukul <Mukul.Joshi@amd.com>; Pan, Xinhui <Xinhui.Pan@amd.com>;
>>>> airlied@gmail.com; daniel@ffwll.ch
>>>> Cc: amd-gfx@lists.freedesktop.org; dri-devel@lists.freedesktop.org; 
>>>> linux-
>>>> kernel@vger.kernel.org; Yadav, Arvind <Arvind.Yadav@amd.com>; Koenig,
>>>> Christian <Christian.Koenig@amd.com>
>>>> Subject: [PATCH v2 1/1] drm/amdkfd: Fix unaligned doorbell absolute 
>>>> offset
>>>> for gfx8
>>>>
>>>> This patch is to adjust the absolute doorbell offset against the 
>>>> doorbell id
>>>> considering the doorbell size of 32/64 bit.
>>>>
>>>> v2:
>>>> - Addressed the review comment from Felix.
>>>>
>>>> Cc: Christian Koenig <christian.koenig@amd.com>
>>>> Cc: Alex Deucher <alexander.deucher@amd.com>
>>>> Signed-off-by: Shashank Sharma <shashank.sharma@amd.com>
>>>> Signed-off-by: Arvind Yadav <Arvind.Yadav@amd.com>
>>>> ---
>>>>   drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.c | 9 ++++++++-
>>>>   1 file changed, 8 insertions(+), 1 deletion(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.c
>>>> b/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.c
>>>> index 0d3d538b64eb..c54c4392d26e 100644
>>>> --- a/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.c
>>>> +++ b/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.c
>>>> @@ -407,7 +407,14 @@ static int allocate_doorbell(struct
>>>> qcm_process_device *qpd,
>>>>
>>>>        q->properties.doorbell_off = amdgpu_doorbell_index_on_bar(dev-
>>>>> adev,
>>>>                                                                  qpd-
>>>>> proc_doorbells,
>>>> -                                                               q-
>>>>> doorbell_id);
>>>> +                                                               0);
>>>> +
>>> It looks like amdgpu_doorbell_index_on_bar() works only for 64-bit 
>>> doorbells.
>>> Shouldn't it work for both 32-bit and 64-bit doorbells considering 
>>> this is common
>>> doorbell manager code?
>
>
> Yes, You are right that the calculations to find a particular doorbell 
> in the doorbell page considers a doorbell width of 64-bit.
>
>>
>> I could see this argument going either way. KFD is the only one that 
>> cares about managing doorbells for user mode queues on GFXv8 GPUs. 
>> This is not a use case that amdgpu cares about. So I'm OK with KFD 
>> doing its own address calculations to make sure doorbells continue to 
>> work on GFXv8.
>>
>> It may not be worth adding complexity to the common doorbell manager 
>> code to support legacy GPUs with 32-bit doorbells.
>
>
> I was thinking about adding an additional input parameter which will 
> indicate if the doorbell width is 32-bit vs 64-bit (like 
> is_doorbell_64_bit), and doorbell manager can alter the multiplier 
> while calculating the final offset. Please let me know if that will 
> work for both the cases.

Yes, that would work for KFD because we already have the doorbell size 
in our device-info structure. Instead of making it a boolean flag, you 
could make it a doorbell_size parameter, in byte or dword units to 
simplify the pointer math.

Regards,
   Felix


>
> - Shashank
>
>>
>>
>> Regards,
>>   Felix
>>
>>
>>>
>>> Thanks,
>>> Mukul
>>>
>>>> +     /* Adjust the absolute doorbell offset against the doorbell id
>>>> considering
>>>> +      * the doorbell size of 32/64 bit.
>>>> +      */
>>>> +     q->properties.doorbell_off += q->doorbell_id *
>>>> + dev->kfd->device_info.doorbell_size / 4;
>>>> +
>>>>        return 0;
>>>>   }
>>>>
>>>> -- 
>>>> 2.34.1
