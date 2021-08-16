Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 315C83ECD81
	for <lists+dri-devel@lfdr.de>; Mon, 16 Aug 2021 06:14:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C6BC89B05;
	Mon, 16 Aug 2021 04:14:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2049.outbound.protection.outlook.com [40.107.93.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C3EE189B05;
 Mon, 16 Aug 2021 04:14:02 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BYgXJkDOafhw80zGaFAq0ROthBgKEgPeQwPLcz6zFUjqh/297JVnkvTADWAb3j7Y7+QnugCPei285X2bhKTubvD2xK8wvFslGZ5W+nBksvntDpogaObZZCmJxCZt2qo8WF2jHeAhETnKjbPuzqy1nNXng8MjoMqdb/1i/frO2msnKVvecLs/ynRM2Jn65SRAU5dc4WtZc3FqXlH49S/I+c8DEq2jV78z8WvylRIXIQ7ZQZ6ZfnGgEwxZGGMP8tfSGlIAhpMduhcmMcEHWWKxUHwhAToaLUNh3vMj009yATmgO8jiLCJqcM1/ZrZtZZtcfu5IMEQ7iqvkQbNzn3BcjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=L5jnhvngqmnfDua0rG+SptMhAKUwdQAzvgTVIaIUKiU=;
 b=fbL5t1S9+bRYJdKRCVc4tmzCiI9mKrh237C1gB2aguSXiJcFQLwBdC3IPtBAmsgKrjPaOm5Fg98P637NNys3rc3KmIq5yD11DJchbz9b9UkTBo4XqiUbsdbyy4skrIBshPCaAnE35cl3JfNM10RXGOnd/F5WMR4csOEH3TU8gGXtlbamHrI/dYebAeEGZzyWiBwTHNbOpdMRPrNn8p7XDSK2o7zDVyx3VoyIusEUY6PLgGR8Yo4lNCV4JwsEztQbky/JngOZTIz/7hL0EHKi3kQzLL5XOaWkeP9Zos6nNSfExCBGoyKD6+UTVm10GtBvttM69hSbA6qX8kG02Wwq1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=L5jnhvngqmnfDua0rG+SptMhAKUwdQAzvgTVIaIUKiU=;
 b=GdCSpLQrQkERTVGP/uMjywKg12TdsxodL0EiNJFR37UJJlPSPtOQxP6z22LQW3NNx+c6QArXIg4YwNUwOU1LNlPMen5+EoEuINJSHnOzDSMv206lEgod8ly2S396cd69vn3hRNHkNxdsHjDeSGKHhEx7gRwQOK2RRXthEIFuM0M=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from BL1PR12MB5349.namprd12.prod.outlook.com (2603:10b6:208:31f::7)
 by BL1PR12MB5078.namprd12.prod.outlook.com (2603:10b6:208:313::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4415.15; Mon, 16 Aug
 2021 04:14:00 +0000
Received: from BL1PR12MB5349.namprd12.prod.outlook.com
 ([fe80::152:9dd3:45a4:eeb6]) by BL1PR12MB5349.namprd12.prod.outlook.com
 ([fe80::152:9dd3:45a4:eeb6%4]) with mapi id 15.20.4415.022; Mon, 16 Aug 2021
 04:14:00 +0000
Subject: Re: [PATCH] drm/amdgpu: Cancel delayed work when GFXOFF is disabled
To: =?UTF-8?Q?Michel_D=c3=a4nzer?= <michel@daenzer.net>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Cc: Leo Liu <leo.liu@amd.com>, James Zhu <James.Zhu@amd.com>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
References: <20210811165211.6811-1-michel@daenzer.net>
 <20210813102920.3458-1-michel@daenzer.net>
 <f26f7350-79d6-e56f-bf69-fb1bf231208c@amd.com>
 <ff3c9ad3-ba7a-ef7b-d82e-27fa76c33979@daenzer.net>
 <9ec17598-0b51-014c-c633-2e4e74c863e9@amd.com>
 <31c9a190-8329-383e-bbea-3520add4d16a@daenzer.net>
 <3ab84437-d4f6-c979-ef7f-d29dcf35eedb@amd.com>
 <faf05193-c33a-167d-c727-280686dd7dae@daenzer.net>
From: "Lazar, Lijo" <lijo.lazar@amd.com>
Message-ID: <1074e0bc-7b7d-ffdc-749f-b650148f4614@amd.com>
Date: Mon, 16 Aug 2021 09:43:49 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <faf05193-c33a-167d-c727-280686dd7dae@daenzer.net>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN1PR0101CA0064.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c00:d::26) To BL1PR12MB5349.namprd12.prod.outlook.com
 (2603:10b6:208:31f::7)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.1.9] (103.165.167.91) by
 PN1PR0101CA0064.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c00:d::26) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4415.17 via Frontend
 Transport; Mon, 16 Aug 2021 04:13:58 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 74a98733-d2e1-43c0-d193-08d9606c464a
X-MS-TrafficTypeDiagnostic: BL1PR12MB5078:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BL1PR12MB50786D8B686A438E54E3425A97FD9@BL1PR12MB5078.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: PP3VLxdUyTDdsCvgvGLD14FU+reYKHOSq9UDhI4xuZlkvaFex6wmgfbnYUc+sCPIwRaVOJw3BrZ5LM/wsgxJbT47kvl2IghpvrwGhsGR3CJFABYfFTdmQxk6larPI3CGy4b7gN+BjrCtsRBQ1qbTqHZULvWJag0ACVeUc6/auOSZj8jctGSNWLIg7U7j2g49Gw+DbZgIETakn3s8e4YiFe18/9mMbkIPlOIx5jk8gpjhzDp06ghC/qn0YTmB8zjG1dEFG/uncp5ECBUHxfwUJDn8EJ9ulcscDPfqYoOHcTNx0dnIUHcqTgLZX1/cOj5aCrEt1ly28dNMfHHaOVvWvBiOckZB35G96jQf1FcPEONXAU1knbyGocBJz9lse53ehHkj/b1FVwDTUcVz4xKWt3XyxOw90ONO+63i6bZ32eIeWoFwvXT0/efesrtj6JACLlqxK1ecParWVRMRRlNHccJ6K/kLIbyWvA8Z4PQDdQ5VWnM4qYUAhBY0AQ1hgg4C6lHpLcfpo8uO86KFnh4zn7sO4iAZYgAh7BUHiUAlQKx1c9XIY0Ar1K/laMSB9qN1izs/YQBb7pKhCzDHmPS3CGS0+UBKCJPCYSDKTbI9lNJk7d394NR/i5xS6U09h7XxuiicNMz3gYwH0mKdIDdHGRUh0HNImUG0C18L+Ykkumc5fkRQcW0SRUzRqhNmaWdGQYcztxvCzG3+hnQoO1cbu7zk30ovpkLgRmUgl80nDE4=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR12MB5349.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(136003)(396003)(346002)(366004)(376002)(26005)(16576012)(2906002)(53546011)(31696002)(110136005)(66946007)(4326008)(478600001)(5660300002)(66556008)(316002)(86362001)(8936002)(66476007)(186003)(54906003)(8676002)(2616005)(6636002)(956004)(31686004)(83380400001)(38100700002)(66574015)(6666004)(6486002)(36756003)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NU9tclFBTG1Oa0ovVVZKSi9zYXFzZ1JGTjNDT1d1TkxNazNSWWZCTDBBS015?=
 =?utf-8?B?ZUxqYnVnZ3FReGNUbzJxT0ZxTTZYU3pHbHRzNmYyOU5JZDBhMmt0NDRNZ3Fa?=
 =?utf-8?B?eXBKK1VIOE4rWlNCSTZZejgvbi9wSlpTc1YvTGVYL0twMVl3V3BnWlF4b3dy?=
 =?utf-8?B?QUl6UG9aVlJ0ZG9RUFdTNTNkaThhYm9Ea1hTMFBCb1hSd0ZzbFUxOEZadGVs?=
 =?utf-8?B?d2x3and6Zk1uUjJhY2xEc1N6bVRhNXh4S3d2bXNaamdlZTNNcUJRVWFsZUtX?=
 =?utf-8?B?T0swdFY1NCt0MHQ2NVR3VFc0S1hPanQwWkFOMzk0R3ZDeUpCUXA3dUM4K0dy?=
 =?utf-8?B?Ymc5MVVjelEybXZOWis0V0ZQbVhwdWlwVTlGVW5Yb2FzZHhMekFjendoblRu?=
 =?utf-8?B?d0FQMGhQbEZBbDNJUlZmZjNPYmsvVko2NnV3RDMrWEE2RFVGMmdXdC8wcGcy?=
 =?utf-8?B?eW9oNjZoRWRYTU9FMzc0NVVVZjJkUnFjbGNLWlgvQmhRa3lXQUtvR3pLOVF2?=
 =?utf-8?B?UkRIN2R1a2pPc202TnRVQnNYMnN2dFBLTEZnaGc2YUx2cTNCZVAwdFdPa1B3?=
 =?utf-8?B?UjVYZ1FoVVQyZExHU0p6dTF6MWcyV1BVdmxBRHpqQlQwbjVMM1d3c3ZwZWo3?=
 =?utf-8?B?c0xjQSt3V3VPZ0s0QnBsUzNrKzlNV000RWtRUlpsdm5HQm1rVkJ1RmtEVjhR?=
 =?utf-8?B?TUJESllldFpmVVZtSlFCeGpCM0dLQVVaL3J6UnBsVEVXMGZtaUluYVJWcHg1?=
 =?utf-8?B?YUU3bm1qMzVYbStNZm1KUi91eXQva1pubGh5ejE2N0hsQ0hXaGRscTZ5WCt0?=
 =?utf-8?B?cCt5SVRsWXFCd2p6em4wbFljOU9BK0FoWW14SFA0R3lIeDNidGMyUVhiUmFI?=
 =?utf-8?B?bG9sSm54Q1M5endwZ2lLNWEwK2NwRGR3TzhtTitnZW1FMXBLUWRiZlRNUzFs?=
 =?utf-8?B?Z2hCeXROQUJ2a3FyL2cxeTY1NDY5amFXeE5LSUlwdnBPbWhsT3kvRWtJNHBQ?=
 =?utf-8?B?dUVGREtVdEd4cUVuSGVpeC9FL25yUjROMUo5QmNjQ1BvWnZMZnpHRDZRalBq?=
 =?utf-8?B?bWhIM2FNam53ZHVDMVVvYmdnNy9DbExqV1FHYk5hL2cvSjRoS21oZlRSby9i?=
 =?utf-8?B?dWF2eHhCMmZ6c3JMZHc5c3hnZUFmTFZOcjJmVlFubWcwUXdxRC9ETVpzZkFz?=
 =?utf-8?B?QWtLMDNqVGFSV0FLN1c5dVNwN3ZRRkFSS3ZWcnJzbnQyd3BEdmMvYVk3ZFNl?=
 =?utf-8?B?aVdMYXFTL0k1cmtTN0duSnFBcklpNk1KbFNSalVTb3R4UkNLZkdxcWZ3V05w?=
 =?utf-8?B?dURXd0RkRTZVeGNSRGdjYndoNERPdjJCdnE1K0c4WWxaNnY3K2UyeFVxaEFC?=
 =?utf-8?B?UWMxc05pWUdIWlE5MXd1YnNjVXI0b1VhdVcwRlRhWVVSM3R1WTdvdko1MVpW?=
 =?utf-8?B?UlJwMkdaZGE2VUNnOHd0eExtLy82Yk16Y3EwVEZtNE9pVzVzYmhibDVEMlFL?=
 =?utf-8?B?NWZSVXltVExkVEN4YXN3VDZzN1lCODJSTzIzSjRTMHBiTGtvWDNZUzgxUDFO?=
 =?utf-8?B?K2txK0V4NUFEQi9wWFFiRmZXSkhiVjliMzFTZ1orMWJpRjU1NmxuQklwNGps?=
 =?utf-8?B?RWMyTE84dzZhWFBzaEJ0ZXNEQkdMYytMSk5Sb0Ercmprcjk0ek93aE5iN0s5?=
 =?utf-8?B?UUovYUFISTJpcnhvbnVmd3hrYjVaTDZiSitsbGh6bTE2bXBKQkozTlgzV3Vl?=
 =?utf-8?Q?YpQpuK8Uj8B/CbStepEy30vop+3tOB/53QjQi0w?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 74a98733-d2e1-43c0-d193-08d9606c464a
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5349.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Aug 2021 04:14:00.6308 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dX3TViruZOyDT3U2hStuMaSfGPKSgq6Je8J7PuUAcBiJkH5JJlHcBh8t2QJ1RDzQ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5078
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



On 8/13/2021 9:30 PM, Michel Dänzer wrote:
> On 2021-08-13 5:07 p.m., Lazar, Lijo wrote:
>>
>>
>> On 8/13/2021 8:10 PM, Michel Dänzer wrote:
>>> On 2021-08-13 4:14 p.m., Lazar, Lijo wrote:
>>>> On 8/13/2021 7:04 PM, Michel Dänzer wrote:
>>>>> On 2021-08-13 1:50 p.m., Lazar, Lijo wrote:
>>>>>> On 8/13/2021 3:59 PM, Michel Dänzer wrote:
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
>>>>>>> To fix this, call cancel_delayed_work_sync when GFXOFF transitions from
>>>>>>> enabled to disabled. This makes sure the delayed work will be scheduled
>>>>>>> as intended in the reverse case.
>>>>>>>
>>>>>>> In order to avoid a deadlock, amdgpu_device_delay_enable_gfx_off needs
>>>>>>> to use mutex_trylock instead of mutex_lock.
>>>>>>>
>>>>>>> v2:
>>>>>>> * Use cancel_delayed_work_sync & mutex_trylock instead of
>>>>>>>       mod_delayed_work.
>>>>>>>
>>>>>>> Signed-off-by: Michel Dänzer <mdaenzer@redhat.com>
>>>>>>> ---
>>>>>>>      drivers/gpu/drm/amd/amdgpu/amdgpu_device.c | 11 ++++++++++-
>>>>>>>      drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c    | 13 +++++++------
>>>>>>>      drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.h    |  3 +++
>>>>>>>      3 files changed, 20 insertions(+), 7 deletions(-)
>>>>>>>
>>>>>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
>>>>>>> index f3fd5ec710b6..8b025f70706c 100644
>>>>>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
>>>>>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
>>>>>>> @@ -2777,7 +2777,16 @@ static void amdgpu_device_delay_enable_gfx_off(struct work_struct *work)
>>>>>>>          struct amdgpu_device *adev =
>>>>>>>              container_of(work, struct amdgpu_device, gfx.gfx_off_delay_work.work);
>>>>>>>      -    mutex_lock(&adev->gfx.gfx_off_mutex);
>>>>>>> +    /* mutex_lock could deadlock with cancel_delayed_work_sync in amdgpu_gfx_off_ctrl. */
>>>>>>> +    if (!mutex_trylock(&adev->gfx.gfx_off_mutex)) {
>>>>>>> +        /* If there's a bug which causes amdgpu_gfx_off_ctrl to be called with enable=true
>>>>>>> +         * when adev->gfx.gfx_off_req_count is already 0, we might race with that.
>>>>>>> +         * Re-schedule to make sure gfx off will be re-enabled in the HW eventually.
>>>>>>> +         */
>>>>>>> +        schedule_delayed_work(&adev->gfx.gfx_off_delay_work, AMDGPU_GFX_OFF_DELAY_ENABLE);
>>>>>>> +        return;
>>>>>>
>>>>>> This is not needed and is just creating another thread to contend for mutex.
>>>>>
>>>>> Still not sure what you mean by that. What other thread?
>>>>
>>>> Sorry, I meant it schedules another workitem and delays GFXOFF enablement further. For ex: if it was another function like gfx_off_status holding the lock at the time of check.
>>>>
>>>>>
>>>>>> The checks below take care of enabling gfxoff correctly. If it's already in gfx_off state, it doesn't do anything. So I don't see why this change is needed.
>>>>>
>>>>> mutex_trylock is needed to prevent the deadlock discussed before and below.
>>>>>
>>>>> schedule_delayed_work is needed due to this scenario hinted at by the comment:
>>>>>
>>>>> 1. amdgpu_gfx_off_ctrl locks mutex, calls schedule_delayed_work
>>>>> 2. amdgpu_device_delay_enable_gfx_off runs, calls mutex_trylock, which fails
>>>>>
>>>>> GFXOFF would never get re-enabled in HW in this case (until amdgpu_gfx_off_ctrl calls schedule_delayed_work again).
>>>>>
>>>>> (cancel_delayed_work_sync guarantees there's no pending delayed work when it returns, even if amdgpu_device_delay_enable_gfx_off calls schedule_delayed_work)
>>>>>
>>>>
>>>> I think we need to explain based on the original code before. There is an asssumption here that the only other contention of this mutex is with the gfx_off_ctrl function.
>>>
>>> Not really.
>>>
>>>
>>>> As far as I understand if the work has already started running when schedule_delayed_work is called, it will insert another in the work queue after delay. Based on that understanding I didn't find a problem with the original code.
>>>
>>> Original code as in without this patch or the mod_delayed_work patch? If so, the problem is not when the work has already started running. It's that when it hasn't started running yet, schedule_delayed_work doesn't change the timeout for the already scheduled work, so it ends up enabling GFXOFF earlier than intended (and thus at all in scenarios when it's not supposed to).
>>>
>>
>> I meant the original implementation of amdgpu_device_delay_enable_gfx_off().
>>
>>
>> If you indeed want to use _sync, there is a small problem with this implementation also which is roughly equivalent to the original problem you faced.
>>
>> amdgpu_gfx_off_ctrl(disable) locks mutex
>> calls cancel_delayed_work_sync
>> amdgpu_device_delay_enable_gfx_off already started running
>>      mutex_trylock fails and schedules another one
>> amdgpu_gfx_off_ctrl(enable)
>>      schedules_delayed_work() - Delay is not extended, it's the same as when it's rearmed from work item.
> 
> 
> This cannot happen. When cancel_delayed_work_sync returns, it guarantees that the delayed work is not scheduled
> , even if amdgpu_device_delay_enable_gfx_off called schedule_delayed_work. In other words, it cancels that as well.
> 

Ah, thanks! Didn't know that it will cancel out re-queued work also. In 
that case, may be reduce the delay for re-queuing it - say 50% or 25% of 
AMDGPU_GFX_OFF_DELAY_ENABLE. Instead of delaying GFXOFF further, it's 
better to enable it faster as it's losing out to another enable or some 
other function.

>> Probably, overthinking about the solution. Looking back, mod_ version is simpler :). May be just delay it further everytime there is a call with enable instead of doing it only for req_cnt==0?
> 
> That has some issues as well:
> 
> * Still prone to the "amdgpu_device_delay_enable_gfx_off re-enables GFXOFF immediately after amdgpu_gfx_off_ctrl dropped req_count to 0" race if the former starts running between when the latter locks the mutex and calls mod_delayed_work.
> * If the work is not scheduled yet, mod_delayed_work would schedule it, even if req_count > 0, in which case it couldn't actually enable GFXOFF.
> 
> Conceptually, making sure the work is never scheduled while req_count > 0 seems cleaner to me. It's the same principle as in the JPEG/UVD/VCE/VCN ring functions (which are presumably hotter paths than these amdgpu_gfx_off functions) I needlessly modified in patch 2.
> 
> (It also means amdgpu_device_delay_enable_gfx_off technically no longer needs to test req_count or gfx_off_state; I can spin a v3 for that if desired)
> 

Would still keep the "gfx_off_state check" to avoid executing the 
sequence due to buggy enable calls coming when it's already in gfxoff 
(if at all that happens).

Thanks,
Lijo
