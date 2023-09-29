Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 284A77B2E02
	for <lists+dri-devel@lfdr.de>; Fri, 29 Sep 2023 10:39:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 858B310E6DB;
	Fri, 29 Sep 2023 08:39:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2060a.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7eab::60a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6055E10E6DB;
 Fri, 29 Sep 2023 08:39:39 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jrznnKPd0zIqke7i7rsmY03eVPwNO8gz7Ev0qYX2vSmvlpHVLRcF1zFm+odI59qZNiwQiDFkacTZ2RMLrPfsr11q2YOypHj69xP6WCwLdxOEIO94oVctRPh5+2JhTKT8u1Ap3l9+ZcYTTF85gc5Z6TggcUblw4y3AgUKLY+FQP4YWcIM9yGU5oiCt03GYr3yPa5GhUii4U6tiac+fK9aS7wcHPIEt5ogqyclR6BmnHS1rLq5hDWkh4WxCnhaBO4m0U2LvLyQp5aI2h84vXQkjDzAld2D14kOdfxTdEHF/lhsOb2kbkI6677sTSZ/SaseAGpfPUwmcFRqiyVdbYY2Lw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vFBiZ8scAfNR38wE/hCuxIx6kSdJUYPAO3HVU92MY6c=;
 b=SL4T+NLs2LcqsX/ZVrn4hf03aF6x/97RqMTnV63Zu21/ynkQYt1ysTqRsZPoYem8WzlrY3FO0TGY6lzClA1uQ39E+plPyHlH5b7gPthy/MdcCK1VRHxLn3x+4khDLQMqQhoDeLO4YXFxWfgE7zivH4nAHsI2pE09EbfgiAYkqwp69B559VOXyHEZepnql6P05eYEMcirVuyZmVxMasckSkxIEa2zG2LJU00UfTnnSY7WvmfHECdV0roEb91QqWUtBp6XFOGfiXulzkNSCFiCwwxOsVBIH6H8ie5a8Njsr/IeC4gOiBYfJZ1pTND6kdSF7CwFmUK4OOrfeT6jA9PsaQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vFBiZ8scAfNR38wE/hCuxIx6kSdJUYPAO3HVU92MY6c=;
 b=s69O1BrAyUDpOSgSDdyHSKR0MtO8QH4WMwowD3xEV9O+q21snCWGzeEprvK77Ji91f3bB4rVa0qy3C4HE7ANIA1k4j9PIgaGESpOZuCY53Z3zMJtNLi8lBhtObdTz/wpRFwwyERA5QBSbkUDrdSX4QalWHU0rwIT+I7ALFCZ7Qw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MW4PR12MB5667.namprd12.prod.outlook.com (2603:10b6:303:18a::10)
 by CH3PR12MB8306.namprd12.prod.outlook.com (2603:10b6:610:12c::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.25; Fri, 29 Sep
 2023 08:39:37 +0000
Received: from MW4PR12MB5667.namprd12.prod.outlook.com
 ([fe80::76fc:3d1c:27c6:61da]) by MW4PR12MB5667.namprd12.prod.outlook.com
 ([fe80::76fc:3d1c:27c6:61da%4]) with mapi id 15.20.6838.024; Fri, 29 Sep 2023
 08:39:37 +0000
Message-ID: <e33eb526-c0b7-c404-72d2-390ce7fb0108@amd.com>
Date: Fri, 29 Sep 2023 10:39:28 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v2 1/1] drm/amdkfd: Fix unaligned doorbell absolute offset
 for gfx8
Content-Language: en-US
To: Felix Kuehling <felix.kuehling@amd.com>,
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
 <2f56333d-4549-3118-5cd0-3ad2be025b66@amd.com>
From: Shashank Sharma <shashank.sharma@amd.com>
In-Reply-To: <2f56333d-4549-3118-5cd0-3ad2be025b66@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BE1P281CA0445.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:81::14) To MW4PR12MB5667.namprd12.prod.outlook.com
 (2603:10b6:303:18a::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR12MB5667:EE_|CH3PR12MB8306:EE_
X-MS-Office365-Filtering-Correlation-Id: ec6c4ddd-b5a6-4791-62aa-08dbc0c79d06
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: UqB77iaJn2PeSRj5d53wNrKeodsdMGePaUTTwv0MMHod1fHhDKO8sp1BmTIfkKIFdxrgRPuqDgbOJoML1ff3othtQsFt4dh4/gWrM/WE3nIMp8/+uuNoUJBvysI25dqJy5OZUwx5qdkgV8UQpR+HJqC5jBjczIzFrHzommpYNzgkOnnMRO1wDOgHdUqffYcS/oZfGoQjqUCZZIANWl06V36nL8EoEIUm7i/+NBr+RByNgWI+l7enoZVFHvwIcZ+3KF1KyBj/9UaV4doliOZaTI5HNqil5y+Y8NOjKsASL3lsUEnEKXijDwKdUQbTadjo5pPg3JwOGG8SJYTs6wa1Nyvcx0Y7TROvzn8zJb5Am5Lr/Q8fOIwmXvChEJXpPXW1Mcjm0Wxfoej1SHVa243CLyQmpIJMaHb+G0v1ZZukTJfbVTL3itL44n55LEMoM+AE5zTAD+CD91MzxLwCqS65LUfmj2XK+j7W71CY4qEMY+kbpKgQ+TC96TcVVwJFcNhM2gdsl7pzfHrgsu7UXZCB8DT5xkKUx1MzplPPtqRRHw7ajAcTZ6vyvif6e1KUTsCXQ4aVUQoUmpNaW6uthpj3oLn+Fpi5Yie94beNzElg3u05SWldvw1Tjyg2HsffYnU9Vkn8SytJw3QZepWk0svGCQk/b3NMKbEQG9n3o/jtny0=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR12MB5667.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(136003)(39860400002)(346002)(366004)(376002)(230922051799003)(186009)(451199024)(1800799009)(64100799003)(6666004)(2906002)(53546011)(6486002)(6506007)(478600001)(36756003)(83380400001)(2616005)(6512007)(26005)(41300700001)(66476007)(8676002)(66946007)(66556008)(4326008)(8936002)(54906003)(316002)(5660300002)(31686004)(44832011)(110136005)(38100700002)(921005)(86362001)(31696002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MkM4aFkya050UzkxQk1Xa2FMTXZVN0F5SHViZThEdm12L2RGTmNkNlVHcTgw?=
 =?utf-8?B?VUVEWDlzMkwxVmFoVzdhamtnVlZET0lNeWF3M2F4UDZZMG1wZDdHU2EweXh0?=
 =?utf-8?B?V243SUVqNGFMWk5Fb1IrSmtwQVpRSTVGbXd1UUxsUVZMS2EweGNBSTV5VU5a?=
 =?utf-8?B?TVh1RkVEdXVJUUQrR05LWE9id1dqaG5qY1pIRks5Nk1qTGM0TFdhcHorOEJW?=
 =?utf-8?B?Z1l6VjhldGlaYmtmUjJoTVVoNjh3VnlwNFlSb3hkNEZQV01ZY1pNWjBPRmpu?=
 =?utf-8?B?NXlCWUZ6aXlNS3lOUXY0VXVWZnMrR1prWjlWUHhxQy9MYzNpeHhiYTlWUjlO?=
 =?utf-8?B?clA1dnNGOGhyTFQxcnpXQzFMb0N1NEF1R2hGZCtzeWF2UGdtL2FlRisyQVMx?=
 =?utf-8?B?dGxXVDYwQmtPYUZoNU9hNE1KYUs2enFITzc4KzJYYVZwaDJwYXcvbnZUNU40?=
 =?utf-8?B?d1F5L0dsUGsybEhsMkxVQSt4QVAxVUp0MzNNZmRibXkwcVNkN09rd3JYeEtl?=
 =?utf-8?B?THQ5alJ3cGtaTkwxek5ZMzJrZ3d4UFhQWWFqZHVKbVRaaDE4cE83RHNyeXlv?=
 =?utf-8?B?Mjk1dEJOVDlHbldER3JmajBIU083YUpLNUFPaElhOUNEdWV6NFFtSmtjdjVI?=
 =?utf-8?B?WDBSV1FJQVZiNHhTeU8vZVU0alQ3N0FJMm0rTzVCbkgvZGJWckY0d216M256?=
 =?utf-8?B?dSsrOWxTd0VEa3JPZkhrdFNOSUEwQTJHWld1OFdzeU80Y2hXZlBUamhSYWRz?=
 =?utf-8?B?cDVhd1RGajVVOURCMmk1S3lVTlFVNUk0ckpibWtQeHI5VkJVbHFzVjBIUDBm?=
 =?utf-8?B?TUorc2w5N1FqZGdLdldSZE5pdGpyTGM1NDJITTBPVUdEc211S2pELzBaRjBx?=
 =?utf-8?B?YlVYejVCeW9qeERnS0hPNVJLNlhjeGJsZjdRYTdMNy9Cdkw1ZDdzSTZUb0VE?=
 =?utf-8?B?VHZQODNXdGF4bURqYjhxOUVMaW5YVkV2b3RVZ3E1YmRCWCtoQUJHc09pdjd1?=
 =?utf-8?B?M2F4SWVyLytDQWJvL2pXM2c0MU0vRFFSNWtvSnVqMlR3K0ZGSkN1V0svQmZI?=
 =?utf-8?B?cnVGZ2xqMEtDWlRKdlc3Nnl6NUJjRHpQRlhMeWhuK1prb1BqMnV4VTdPRGpL?=
 =?utf-8?B?TzlZTFlGKzg1TTJnMld3MDNwYkJGL0cwRXNrYUxDOVVQQkpjU1h1dXAzZ3hw?=
 =?utf-8?B?ZzJZdmVpaEFicitJWXBDMWtYY09XVG5CVkdyaUFwUi90RUs4bjk4MlByVkRO?=
 =?utf-8?B?K0VjYVh1eU50Q0wza3QrblMzTi9LMFIrS256L3pVS3J0WkRNNytoZ2Roclh5?=
 =?utf-8?B?ZlU5NTRwbFJlakFiZVdmS3NZNlFpUjlTbXF5RW5YUzlpTDh2QjNMVDg4SEJK?=
 =?utf-8?B?ejJRL0JBUWpXN0RGOHZuNHlVNEZyaU42ZEV3WitlQmpIMXZuT21nc1lqMThY?=
 =?utf-8?B?VkNHWUVHdVpDZEg4YVRCSWE0dlgwR2JpWEZGdkEwOVljdjAyWXZ0UTNwUlJ4?=
 =?utf-8?B?SUR3dEdNUWZ6dmFJY3c2ZDdoeWw4YTBqRENRMHNRN2hJbVdOaldDb0ZNM3Mz?=
 =?utf-8?B?ajJLZ1hqMVl2SVV1NldlWHEyWWZDaHNjQzJLRS9hOWtOTCtVUGRHSGRMR0Ns?=
 =?utf-8?B?eGkwY1RsVDRLQkR2YzBkU1dkTW1tQUlEQVJLQ2FRSFg2YndzYTVWOHlYMTIx?=
 =?utf-8?B?aHllM1IvNiszc2dRZ09kS3JVcVE4bDMrT1Z3ZHF0T3JucUVIaGt1OFNaWHdN?=
 =?utf-8?B?RlMvci9sVGtna09xOUVTZHRzTFhoUXhpNEZJeHgrQ0V3QXRQaHRVUldYMjk4?=
 =?utf-8?B?KzN4eU9mMGl5bVNaZ3BZMlZwWVJETGhHY0ZBajhTSHB2Qm5peGM4QkZvc0Jh?=
 =?utf-8?B?QWsrdEljWnc4dmhBazVjR3BVWUMwZUZqV0VTODRWQVB4N3I0Qkw5dmdqd3lz?=
 =?utf-8?B?czIyMFhQamNVQlNsV1RtMzlJTFc4T3YxRllGdlVsRDRuK0REZXBlc2c2WlM1?=
 =?utf-8?B?eE9DeHgrbWVuVmxlYUVudTBadjF4MnROMnQxNjlRSGU0enNLUWpOQ2Jlbm9a?=
 =?utf-8?B?K3dpakdvY0tzMFVvbmFNcyt4WmhJZ1RJdUYyblBsdU1tVU5GQnMrclNnTWRE?=
 =?utf-8?Q?WlZoJt4HXkcOnCiEVZFIgNHBm?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ec6c4ddd-b5a6-4791-62aa-08dbc0c79d06
X-MS-Exchange-CrossTenant-AuthSource: MW4PR12MB5667.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2023 08:39:37.2624 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zpI//NYFSx2C6k8aeH20V3IzpYeRNCK7KeXNwHLFlJgurpb/UbTcAj+LBytKX6zPMO3m6a4vtStIXVKr001udQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8306
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


On 28/09/2023 20:53, Felix Kuehling wrote:
> On 2023-09-28 11:38, Shashank Sharma wrote:
>> Hello Felix, Mukul,
>>
>> On 28/09/2023 17:30, Felix Kuehling wrote:
>>> On 2023-09-28 10:30, Joshi, Mukul wrote:
>>>> [AMD Official Use Only - General]
>>>>
>>>>> -----Original Message-----
>>>>> From: Yadav, Arvind <Arvind.Yadav@amd.com>
>>>>> Sent: Thursday, September 28, 2023 5:54 AM
>>>>> To: Koenig, Christian <Christian.Koenig@amd.com>; Deucher, Alexander
>>>>> <Alexander.Deucher@amd.com>; Sharma, Shashank
>>>>> <Shashank.Sharma@amd.com>; Kuehling, Felix <Felix.Kuehling@amd.com>;
>>>>> Joshi, Mukul <Mukul.Joshi@amd.com>; Pan, Xinhui <Xinhui.Pan@amd.com>;
>>>>> airlied@gmail.com; daniel@ffwll.ch
>>>>> Cc: amd-gfx@lists.freedesktop.org; 
>>>>> dri-devel@lists.freedesktop.org; linux-
>>>>> kernel@vger.kernel.org; Yadav, Arvind <Arvind.Yadav@amd.com>; Koenig,
>>>>> Christian <Christian.Koenig@amd.com>
>>>>> Subject: [PATCH v2 1/1] drm/amdkfd: Fix unaligned doorbell 
>>>>> absolute offset
>>>>> for gfx8
>>>>>
>>>>> This patch is to adjust the absolute doorbell offset against the 
>>>>> doorbell id
>>>>> considering the doorbell size of 32/64 bit.
>>>>>
>>>>> v2:
>>>>> - Addressed the review comment from Felix.
>>>>>
>>>>> Cc: Christian Koenig <christian.koenig@amd.com>
>>>>> Cc: Alex Deucher <alexander.deucher@amd.com>
>>>>> Signed-off-by: Shashank Sharma <shashank.sharma@amd.com>
>>>>> Signed-off-by: Arvind Yadav <Arvind.Yadav@amd.com>
>>>>> ---
>>>>>   drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.c | 9 ++++++++-
>>>>>   1 file changed, 8 insertions(+), 1 deletion(-)
>>>>>
>>>>> diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.c
>>>>> b/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.c
>>>>> index 0d3d538b64eb..c54c4392d26e 100644
>>>>> --- a/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.c
>>>>> +++ b/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.c
>>>>> @@ -407,7 +407,14 @@ static int allocate_doorbell(struct
>>>>> qcm_process_device *qpd,
>>>>>
>>>>>        q->properties.doorbell_off = amdgpu_doorbell_index_on_bar(dev-
>>>>>> adev,
>>>>>                                                                  qpd-
>>>>>> proc_doorbells,
>>>>> -                                                               q-
>>>>>> doorbell_id);
>>>>> +                                                               0);
>>>>> +
>>>> It looks like amdgpu_doorbell_index_on_bar() works only for 64-bit 
>>>> doorbells.
>>>> Shouldn't it work for both 32-bit and 64-bit doorbells considering 
>>>> this is common
>>>> doorbell manager code?
>>
>>
>> Yes, You are right that the calculations to find a particular 
>> doorbell in the doorbell page considers a doorbell width of 64-bit.
>>
>>>
>>> I could see this argument going either way. KFD is the only one that 
>>> cares about managing doorbells for user mode queues on GFXv8 GPUs. 
>>> This is not a use case that amdgpu cares about. So I'm OK with KFD 
>>> doing its own address calculations to make sure doorbells continue 
>>> to work on GFXv8.
>>>
>>> It may not be worth adding complexity to the common doorbell manager 
>>> code to support legacy GPUs with 32-bit doorbells.
>>
>>
>> I was thinking about adding an additional input parameter which will 
>> indicate if the doorbell width is 32-bit vs 64-bit (like 
>> is_doorbell_64_bit), and doorbell manager can alter the multiplier 
>> while calculating the final offset. Please let me know if that will 
>> work for both the cases.
>
> Yes, that would work for KFD because we already have the doorbell size 
> in our device-info structure. Instead of making it a boolean flag, you 
> could make it a doorbell_size parameter, in byte or dword units to 
> simplify the pointer math.


Sounds good, will do that and send an update.

- Shashank

>
> Regards,
>   Felix
>
>
>>
>> - Shashank
>>
>>>
>>>
>>> Regards,
>>>   Felix
>>>
>>>
>>>>
>>>> Thanks,
>>>> Mukul
>>>>
>>>>> +     /* Adjust the absolute doorbell offset against the doorbell id
>>>>> considering
>>>>> +      * the doorbell size of 32/64 bit.
>>>>> +      */
>>>>> +     q->properties.doorbell_off += q->doorbell_id *
>>>>> + dev->kfd->device_info.doorbell_size / 4;
>>>>> +
>>>>>        return 0;
>>>>>   }
>>>>>
>>>>> -- 
>>>>> 2.34.1
