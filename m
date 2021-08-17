Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AE5473EEBE6
	for <lists+dri-devel@lfdr.de>; Tue, 17 Aug 2021 13:50:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AAB2C6E08A;
	Tue, 17 Aug 2021 11:50:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2053.outbound.protection.outlook.com [40.107.244.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D37036E08A;
 Tue, 17 Aug 2021 11:50:08 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MJ25ITcopOV6jf8+MvWHk+AmozhFDiCkKpucZHNITN1L736+ie6Taq59ezPvH76JivhV0IAvpStXwQLG8kg7dl7wiEsr7sILbkzRv4i16ATE4LLOHcd5SswH7dNWeWt4Kc4gvFEIVbN+wsIXMzyiQGQO9y1rYXdW7GKJmTnBQq4VwF+IlvYGs6DJQKK1t5IdMQ8Rh71MUEbXx40ZXq4ygn94RmZ+mDoy0FkmdxH+h2BkAhK8REx0XrWXO1zIkH8BcpKaxLK3qLJu+5vhcGaGr4akQk03vUtZPmIIDsVBsm4Z67ZyCJLI4txTwQjeTlMTwG00D0h598BdU4qedZjaWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=B23qDlfXcX9sVZjZjbBV+mO+MECA+Q/n4nT5PSpu0bQ=;
 b=e51kkMkf3+6dNWH664FHpD2Eq62w/pky93rygq32TGSlKt65OwU9muQw9Qjgzwy+X2JdUtbccP1bdy2II9c3fwAGCnP5Q5l7ohfJLQrfiQnLhtoR8u1upFwFuUy/ucz0K0y9R/3C+C76f9NvZ+ZC/nV2S/hf20GCpN8QX/7hqkB61TTRKZxtRo34T13ES0pYTvGBtzb0xJNPEPFcEL7rSGvu5tJIy4e7Re92LXMJQPtCRc/moNu7MfPB9WA0Qo5oFZzpQB/1b7CELTpYNbl6Ox/LW2shi9kEF2O3AYNIjgJ4UEwMxD8aiT7jEiHGtMd0kw71tvO0tnWSu2lkEx/GiQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=B23qDlfXcX9sVZjZjbBV+mO+MECA+Q/n4nT5PSpu0bQ=;
 b=nM9to/yLQWOBEnVWfH6e3mu0GUIcU1Iweg9EqeuxfVHJuB7xmezj36ojPf1cTbmOB9zDeiNQUk/21zNkIFMMxFREVJFgjEWRFQMHK0kiZItc8dqPXexJ9wXD/ZWJywejlrXHogCbaumJ5nnGryZANbHyKcbyOzfoGN7IhYfEn+E=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from BL1PR12MB5349.namprd12.prod.outlook.com (2603:10b6:208:31f::7)
 by BL1PR12MB5093.namprd12.prod.outlook.com (2603:10b6:208:309::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4415.17; Tue, 17 Aug
 2021 11:50:06 +0000
Received: from BL1PR12MB5349.namprd12.prod.outlook.com
 ([fe80::152:9dd3:45a4:eeb6]) by BL1PR12MB5349.namprd12.prod.outlook.com
 ([fe80::152:9dd3:45a4:eeb6%4]) with mapi id 15.20.4415.024; Tue, 17 Aug 2021
 11:50:06 +0000
Subject: Re: [PATCH] drm/amdgpu: Cancel delayed work when GFXOFF is disabled
To: =?UTF-8?Q?Michel_D=c3=a4nzer?= <michel@daenzer.net>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Cc: Leo Liu <leo.liu@amd.com>, James Zhu <James.Zhu@amd.com>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
References: <20210816103506.2671-1-michel@daenzer.net>
 <20210817082325.2579-1-michel@daenzer.net>
 <ceaa02c9-26ef-e1e5-3f35-3cc202961670@amd.com>
 <8461fba5-662e-85f7-b712-472232ed12ba@daenzer.net>
 <c294f4c7-7919-7b7f-4de7-ab4def8c90a3@amd.com>
 <e9aa759e-1692-b8c5-3f23-2c55af0151bc@daenzer.net>
 <c8b52f3a-f431-3dc5-b08c-b6af5f8d1d7a@amd.com>
 <a4d876a1-2e61-22bb-828f-dad5798181f7@daenzer.net>
From: "Lazar, Lijo" <lijo.lazar@amd.com>
Message-ID: <d957015b-f8c5-b2ae-70e2-17bbfa5d9d22@amd.com>
Date: Tue, 17 Aug 2021 17:19:54 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <a4d876a1-2e61-22bb-828f-dad5798181f7@daenzer.net>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BMXPR01CA0064.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:b00:2c::28) To BL1PR12MB5349.namprd12.prod.outlook.com
 (2603:10b6:208:31f::7)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [172.31.157.114] (165.204.158.249) by
 BMXPR01CA0064.INDPRD01.PROD.OUTLOOK.COM (2603:1096:b00:2c::28) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4415.14 via Frontend Transport; Tue, 17 Aug 2021 11:50:03 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 54b08c1c-9528-4584-0e27-08d961752839
X-MS-TrafficTypeDiagnostic: BL1PR12MB5093:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BL1PR12MB509333DD6CD1D8F1289C329897FE9@BL1PR12MB5093.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 1ltvWSPcp7DmXMIY5aJUkdWD88+imBjcQWlEyzMPBTBmFAHdnGQ0k2jifTUWVzuacRPJU5CFzcbJOr+glZSEqDAswjjxWJPhntA9IxmjFG/NdlgwFzlwvr0oDx/tqyXRboc0lubgypxUW5MF9+HK3HgIq4qoIbQ2mafKANcpb5/tYO8bYZ+K1dOnUPIpvOtykEGytzndS3vFKEGqokiHQ0bjNuWdh1n19Qy705jURxjIRnFmPGN1Kz2aTuM3AX1VRRXqgyQKcyFkFprtu0bdkwkWi1I/5lWbVSU+pUU69e9K5ScdzpevZNsY/42dE0v9OyBsdlp8eHp9DW8vvA7PZMAgwnPyrg3rfEpj5+BE5EpuXJK2EqSuVTRv9udVhZsnaFkvONn2cX3T9sHkJzxAJqQDOOtQdEYTNp7+EaHJHNesV4hC957gOgFaZJeBDfCrdtWRTnyyEYcWNU4pnR2apd4DDef+avwuyinnozJz/QXuAlmTyfcEnSqppTlv6wPGBQexfnybe20/HfdCBJ/Ys2N655mbAUXYQ5p/q9rD3K1bwTPTGyr+oh/wNyy6cfMSkwbiAK7fs6wsIBR92Wu9/8XpMM0BGEB3Ihd28volU0CVwYWhdpJ0ebTJ09meun4ZNwly86vWDZfUFyFBKGMJAH1lu2VQ6StF2QRDIH5TjNFgI1WkdPprFK6LzPEzzHRS72Uk9JjgUa+Ec8FrV+LB7lTkqxkRe202qO1uegOx6Vo=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR12MB5349.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(136003)(346002)(366004)(396003)(376002)(83380400001)(66574015)(66476007)(66556008)(956004)(2616005)(66946007)(5660300002)(2906002)(8936002)(31696002)(6666004)(8676002)(86362001)(31686004)(53546011)(478600001)(38100700002)(6486002)(4326008)(316002)(26005)(36756003)(186003)(16576012)(54906003)(6636002)(110136005)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bitzVzZDeDM2bXRFL21MZFM1ekwxaXdXaXp5clVCeklvS1dOcmc3dlVTTnhh?=
 =?utf-8?B?ejFjVFVjK2l1bmEzak9mVlYxbVYvUjFtcElGMUNUZllSaDhReTFGS21EMzhv?=
 =?utf-8?B?MEpJSWY5YXAxUHd5b2JTdFpGQVRSYXdzSXRwSmsvb2NUMXlxcDNWK2lQTVJJ?=
 =?utf-8?B?aUo4T01FWHRrcmo2dTM4bWIwSjBoaG5CQnlzbHVXV2duVzNRbTdMV0pqRHJC?=
 =?utf-8?B?ZnMxbnVuckZjdjVSbUdaQ1duZWljR2tOaFFtT2owQ0pBYUVSQ2RQakJyYWxZ?=
 =?utf-8?B?clgvMXgrSHM2WmpiNmZNTDhYbnFPdXBpRkR0c0NubVVuVnNLdlBwOHBLNVFw?=
 =?utf-8?B?bUFucHQwU0hVT0xBNzFtR0lTaHkvWVl1Slh5ZnhtWTUrdFJxdjkxVDFMUUd0?=
 =?utf-8?B?OURueTZ0aldsVDVhaEZ5LzMwVm1iL29vWDFqZ3Rsc2cyUmVZZUFFaFVHTEph?=
 =?utf-8?B?dHlyK0RUUUpydjRjamtZTDhYbEs4MllYUU9xQktJb0l0bmRFNExON0Z6MWNp?=
 =?utf-8?B?Zzc1MVhNSDB6ck53c2VJTnhpSzhNeFQ5cHpWOFp2RkJrRHpuRGNSM004WitQ?=
 =?utf-8?B?UG1pN0JFeUttMU56aFNFc3p4bnc1U2pnK2JubkFFdHI0VEVOeHIrbkZoeFVN?=
 =?utf-8?B?QTQzS2pLUU95OGp5UjFQUCtBYjY1d0Z6Vll0a1cvdXd1ZEltbzBmaWpOV05H?=
 =?utf-8?B?anE4RUVUZUdUSzNHU2hYcFpIL2RzWHlSUVRLUks2dTNaUDNRSml4aWZnMUxW?=
 =?utf-8?B?RGhsRThHaTBMS1RCMWJyWTlsZHZXQzdQVGpST0w5NWVUcGhVcEw2U3JLTWFo?=
 =?utf-8?B?NFdtS3FYZzlSUmRiR1pPQktHaEVXT2l2eUt1MW1hNjVWTjRqazJFd1ZQalJl?=
 =?utf-8?B?SHdmdDE3Q3ZFQjlRTnZPSzlEY2NjY3V2UExUVmIzbFFrMDZWZDBXbVNJUXQv?=
 =?utf-8?B?K3l6eUhIblpQT1VmaC8vOXQwc2ZDaDZGSTVwMXk3OFEwbjN3MEcwK29XeHZI?=
 =?utf-8?B?OEhvc3lFZWVHRGI3MnA2UXlwRHpGZUVqQjhnaTd3ekZXanhYdmNKNmRUeWth?=
 =?utf-8?B?cXpwcSsyYkVCbldlQmoxVHZHRGlEUVZpT0FvNEhla0MvYmkxb1RQd1hWMUtu?=
 =?utf-8?B?Ny9nQk5LcDg5MzJQNDYwRkxuUisyanlxZExqaUlTcXkvNkFMTEtVMXhzL05E?=
 =?utf-8?B?ci9Mb241akh6ZjlsZ0FIY2hZZTNJZGsrUEJaamNYZXFhcm5KNVZjeWNzeDhY?=
 =?utf-8?B?RkhTVGM3ZUxNUXU1RmVBb1ZSbmdwQ1hHK1ZhSGpZS1lvK0JxTXF4ejFNakZv?=
 =?utf-8?B?ZUlENVNDQUp0My90V2FPUlNXbThWN3pwc3FlRnpVUE9VaTdYWDhxU1F1YlRw?=
 =?utf-8?B?ZFdGdFFhYmlWUzVGWWhlaUlzaUU4azJiNDcwR00xQ0tFV0QyOGE5YzJDejk3?=
 =?utf-8?B?Q2IxQXY3UFI1YWI1NUtkSU1CcXFWZ3JkWi9pSDVxVER0L2dJUURFckdOelpP?=
 =?utf-8?B?TTcxZTZVSG1vZ09IN0Ivb0NWWHFIYXB2WnFxN0laaE9IMHh5S2dGU2M3RjFu?=
 =?utf-8?B?L2gwaTlSUHkzREZWVTU4dEcwWTE0RUhKWGFCWjE5VFlXUXRCS1NWanBtUWRn?=
 =?utf-8?B?SXpTRUxDWjFtZWRpT1lrYUdvdXZPc2d2S01DbnVXa3RBdFUwNGRRUUwxZGVh?=
 =?utf-8?B?TEJxNms3elQ1Z2gvZGJjZERBeDdGSGhvSmJhYXp2cVNIR0tJekFjWHJuZlZw?=
 =?utf-8?Q?uk/wbrTBEURSg/bWjQ06iYMspu+8uY8C3OXPxWk?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 54b08c1c-9528-4584-0e27-08d961752839
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5349.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Aug 2021 11:50:06.6299 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1ds1AnRFlpGHxec42aWpYruq6PeO4UT25Kb1h9rxrgMdkz8FYuSDDEyEcXVFtY2S
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5093
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



On 8/17/2021 4:36 PM, Michel Dänzer wrote:
> On 2021-08-17 12:37 p.m., Lazar, Lijo wrote:
>>
>>
>> On 8/17/2021 3:29 PM, Michel Dänzer wrote:
>>> On 2021-08-17 11:37 a.m., Lazar, Lijo wrote:
>>>>
>>>>
>>>> On 8/17/2021 2:56 PM, Michel Dänzer wrote:
>>>>> On 2021-08-17 11:12 a.m., Lazar, Lijo wrote:
>>>>>>
>>>>>>
>>>>>> On 8/17/2021 1:53 PM, Michel Dänzer wrote:
>>>>>>> From: Michel Dänzer <mdaenzer@redhat.com>
>>>>>>>
>>>>>>> schedule_delayed_work does not push back the work if it was already
>>>>>>> scheduled before, so amdgpu_device_delay_enable_gfx_off ran ~100 ms
>>>>>>> after the first time GFXOFF was disabled and re-enabled, even if GFXOFF
>>>>>>> was disabled and re-enabled again during those 100 ms.
>>>>>>>
>>>>>>> This resulted in frame drops / stutter with the upcoming mutter 41
>>>>>>> release on Navi 14, due to constantly enabling GFXOFF in the HW and
>>>>>>> disabling it again (for getting the GPU clock counter).
>>>>>>>
>>>>>>> To fix this, call cancel_delayed_work_sync when the disable count
>>>>>>> transitions from 0 to 1, and only schedule the delayed work on the
>>>>>>> reverse transition, not if the disable count was already 0. This makes
>>>>>>> sure the delayed work doesn't run at unexpected times, and allows it to
>>>>>>> be lock-free.
>>>>>>>
>>>>>>> v2:
>>>>>>> * Use cancel_delayed_work_sync & mutex_trylock instead of
>>>>>>>       mod_delayed_work.
>>>>>>> v3:
>>>>>>> * Make amdgpu_device_delay_enable_gfx_off lock-free (Christian König)
>>>>>>> v4:
>>>>>>> * Fix race condition between amdgpu_gfx_off_ctrl incrementing
>>>>>>>       adev->gfx.gfx_off_req_count and amdgpu_device_delay_enable_gfx_off
>>>>>>>       checking for it to be 0 (Evan Quan)
>>>>>>>
>>>>>>> Cc: stable@vger.kernel.org
>>>>>>> Reviewed-by: Lijo Lazar <lijo.lazar@amd.com> # v3
>>>>>>> Acked-by: Christian König <christian.koenig@amd.com> # v3
>>>>>>> Signed-off-by: Michel Dänzer <mdaenzer@redhat.com>
>>>>>>> ---
>>>>>>>
>>>>>>> Alex, probably best to wait a bit longer before picking this up. :)
>>>>>>>
>>>>>>>      drivers/gpu/drm/amd/amdgpu/amdgpu_device.c | 11 +++----
>>>>>>>      drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c    | 36 +++++++++++++++-------
>>>>>>>      2 files changed, 30 insertions(+), 17 deletions(-)
>>>>>>>
>>>>>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
>>>>>>> index f3fd5ec710b6..f944ed858f3e 100644
>>>>>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
>>>>>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
>>>>>>> @@ -2777,12 +2777,11 @@ static void amdgpu_device_delay_enable_gfx_off(struct work_struct *work)
>>>>>>>          struct amdgpu_device *adev =
>>>>>>>              container_of(work, struct amdgpu_device, gfx.gfx_off_delay_work.work);
>>>>>>>      -    mutex_lock(&adev->gfx.gfx_off_mutex);
>>>>>>> -    if (!adev->gfx.gfx_off_state && !adev->gfx.gfx_off_req_count) {
>>>>>>> -        if (!amdgpu_dpm_set_powergating_by_smu(adev, AMD_IP_BLOCK_TYPE_GFX, true))
>>>>>>> -            adev->gfx.gfx_off_state = true;
>>>>>>> -    }
>>>>>>> -    mutex_unlock(&adev->gfx.gfx_off_mutex);
>>>>>>> +    WARN_ON_ONCE(adev->gfx.gfx_off_state);
>>>>>>> +    WARN_ON_ONCE(adev->gfx.gfx_off_req_count);
>>>>>>> +
>>>>>>> +    if (!amdgpu_dpm_set_powergating_by_smu(adev, AMD_IP_BLOCK_TYPE_GFX, true))
>>>>>>> +        adev->gfx.gfx_off_state = true;
>>>>>>>      }
>>>>>>>        /**
>>>>>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c
>>>>>>> index a0be0772c8b3..b4ced45301be 100644
>>>>>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c
>>>>>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c
>>>>>>> @@ -563,24 +563,38 @@ void amdgpu_gfx_off_ctrl(struct amdgpu_device *adev, bool enable)
>>>>>>>            mutex_lock(&adev->gfx.gfx_off_mutex);
>>>>>>>      -    if (!enable)
>>>>>>> -        adev->gfx.gfx_off_req_count++;
>>>>>>> -    else if (adev->gfx.gfx_off_req_count > 0)
>>>>>>> +    if (enable) {
>>>>>>> +        /* If the count is already 0, it means there's an imbalance bug somewhere.
>>>>>>> +         * Note that the bug may be in a different caller than the one which triggers the
>>>>>>> +         * WARN_ON_ONCE.
>>>>>>> +         */
>>>>>>> +        if (WARN_ON_ONCE(adev->gfx.gfx_off_req_count == 0))
>>>>>>> +            goto unlock;
>>>>>>> +
>>>>>>>              adev->gfx.gfx_off_req_count--;
>>>>>>>      -    if (enable && !adev->gfx.gfx_off_state && !adev->gfx.gfx_off_req_count) {
>>>>>>> -        schedule_delayed_work(&adev->gfx.gfx_off_delay_work, GFX_OFF_DELAY_ENABLE);
>>>>>>> -    } else if (!enable && adev->gfx.gfx_off_state) {
>>>>>>> -        if (!amdgpu_dpm_set_powergating_by_smu(adev, AMD_IP_BLOCK_TYPE_GFX, false)) {
>>>>>>> -            adev->gfx.gfx_off_state = false;
>>>>>>> +        if (adev->gfx.gfx_off_req_count == 0 && !adev->gfx.gfx_off_state)
>>>>>>> +            schedule_delayed_work(&adev->gfx.gfx_off_delay_work, GFX_OFF_DELAY_ENABLE);
>>>>>>> +    } else {
>>>>>>> +        if (adev->gfx.gfx_off_req_count == 0) {
>>>>>>> +            cancel_delayed_work_sync(&adev->gfx.gfx_off_delay_work);
>>>>>>> +
>>>>>>> +            if (adev->gfx.gfx_off_state &&
>>>>>>
>>>>>> More of a question which I didn't check last time - Is this expected to be true when the disable call comes in first?
>>>>>
>>>>> My assumption is that cancel_delayed_work_sync guarantees amdgpu_device_delay_enable_gfx_off's assignment is visible here.
>>>>>
>>>>
>>>> To clarify - when nothing is scheduled. If enable() is called when the count is 0, it goes to unlock. Now the expectation is someone to call Disable first.
>>>
>>> Yes, the very first amdgpu_gfx_off_ctrl call must pass enable=false, or it's a bug, which
>>>
>>>           if (WARN_ON_ONCE(adev->gfx.gfx_off_req_count == 0))
>>>
>>> will catch.
>>>
>>>
>>>> Let's say  Disable() is called first, then the variable will be false, right?
>>>
>>> Ohh, I see what you mean. The first time amdgpu_gfx_off_ctrl is called with enable=false, adev->gfx.gfx_off_state == false (what it was initialized to), so it doesn't actually disable GFXOFF in HW.
>>
>> Exactly.
> 
> Turns out that's not the end of that rabbit (side-)hole yet. :)
> 
> amdgpu_device_init initializes adev->gfx.gfx_off_req_count = 1. amdgpu_gfx_off_ctrl is then called with enable=true from amdgpu_device_init → amdgpu_device_ip_late_init → amdgpu_device_set_pg_state. This schedules amdgpu_device_delay_enable_gfx_off, which runs ~100ms later, enables GFXOFF in the HW and sets adev->gfx.gfx_off_state = true.
> 

What if a disable comes at < 100ms? Quite unlikely, neverthless in that 
case pending work will get cancelled and the variable won't be set until 
the work gets a chance to fully run. The assumption that GFXOFF disable 
succeeded in a subsequent amdgpu_gfx_off_ctrl  enable = false won't be 
correct as PMFW will by default enable GFXOFF when there is no activity.

Otherwise, keep an assumption that amdgpu_device_delay_enable_gfx_off 
gets a chance to run before any disable call comes - maybe that's the 
case in most cases.

> So it looks fine as is actually, if a bit convoluted. 

> (I wonder if GFXOFF shouldn't rather be enabled synchronously during initialization though)

Yes, that is logical. But amdgpu_device_ip_late_init is called also 
during amdgpu_device_resume. amdgpu_device_resume is used in pm_ops or 
runtime pm. In those cases it makes sense to delay it as there could be 
an immediate usage of GFX.

Thanks,
Lijo

> 
> 
