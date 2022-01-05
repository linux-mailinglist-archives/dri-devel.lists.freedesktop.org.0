Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B9467485346
	for <lists+dri-devel@lfdr.de>; Wed,  5 Jan 2022 14:11:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD45610EB40;
	Wed,  5 Jan 2022 13:11:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2068.outbound.protection.outlook.com [40.107.244.68])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A8EEC10EB40;
 Wed,  5 Jan 2022 13:11:41 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=J1Wz55EgodO7OFE4KN43Rp9Dy6pqFxAiI2DuJ20vncPe/VAQw5LVHpG85mog3WUmUWmaAgCp1mXKgZdGOdWV0zqTJiHt00A8eyojwqk1RZc0HxLF1TXK/yE6VB7BPMQxPo871TfRXedHiMRfyj0OVI0wYyl5IdPhtMTk85gFjndZ3YBUNGuHDbdL48wSrGWCLdDnbg828bknrT4SnVmLQy1P3jgXtlXUgpzV35e711XMIUJLFtIHmRM1igEeLHmFicrSAuLCovhgPZwghezrohnqEMhHcaXwNH6uT5ky6weOpDIFgLNmNZnZ4QxawItR4ZmaoxZ4DTl/B1MxeRCSCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xEWymt4hVzqL1gO6pMmhmZtofVWdik5vNNhvKGTW0pY=;
 b=JxeR8XPFhyWMul/gVGe9xHSS7SPYsmUJqlznnMd5AUULI/rXaASmtbM1nqFYDRQN8XSNz48tqrX754h1akbSoADi6qIgnfLij2XVENHDUBDzSKf9KWQ3mMFjwAfP+lWNRiKwjr7KChesUQlpPf2MfOWYABPc9MDXn3AC11o+rUmFTdvyV9NuThuiJI+cfcudx3bOLDxEq8fdQ7w+3YmchN90SzgrrMeyrgFyTYZFqSEg9Nr/AofUI6D0BgZlH6Lzu11fONcHTJ5ll6lv0WJpdzNsyPN++aVuIuywny6Kf8rQEiAsvNzYecBL1ICsiQNS5mQwu7uXLndyH6mE3D27Yg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xEWymt4hVzqL1gO6pMmhmZtofVWdik5vNNhvKGTW0pY=;
 b=Dtctd7Jf12dzko3AILHy5vnpDF+CUixE+6acAKJAm5RBs0Cm0hjborxpSTzXtPWVZCBkYvFi3ZpGIQvwaRJBFx5kLtsDsoagqqAMoEG6luG42MqGJZ9HywcCeSpNU3qJmXAUjFwps9hbnDHpIPbAv/fg2y10oihbYsZeyiS+XAc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BYAPR12MB4614.namprd12.prod.outlook.com (2603:10b6:a03:a6::22)
 by BYAPR12MB2613.namprd12.prod.outlook.com (2603:10b6:a03:69::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4844.14; Wed, 5 Jan
 2022 13:11:37 +0000
Received: from BYAPR12MB4614.namprd12.prod.outlook.com
 ([fe80::f58c:40b7:85a:45c2]) by BYAPR12MB4614.namprd12.prod.outlook.com
 ([fe80::f58c:40b7:85a:45c2%5]) with mapi id 15.20.4844.017; Wed, 5 Jan 2022
 13:11:37 +0000
Message-ID: <55065993-0e8d-30a5-b08f-733e5ba360b1@amd.com>
Date: Wed, 5 Jan 2022 18:41:22 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Subject: Re: [RFC v2 4/8] drm/amdgpu: Serialize non TDR gpu recovery with TDRs
Content-Language: en-US
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 Andrey Grodzovsky <andrey.grodzovsky@amd.com>,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org
References: <20211222220506.789133-1-andrey.grodzovsky@amd.com>
 <20211222220506.789133-5-andrey.grodzovsky@amd.com>
 <639bd7c3-e946-65eb-afae-dd619f6429d6@amd.com>
 <9dc55576-19b1-d5e3-f4da-eede4db8b289@amd.com>
From: "Lazar, Lijo" <lijo.lazar@amd.com>
In-Reply-To: <9dc55576-19b1-d5e3-f4da-eede4db8b289@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BM1PR01CA0118.INDPRD01.PROD.OUTLOOK.COM (2603:1096:b00::34)
 To BYAPR12MB4614.namprd12.prod.outlook.com
 (2603:10b6:a03:a6::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a5a5f1d2-4cb4-486e-c45b-08d9d04ce755
X-MS-TrafficTypeDiagnostic: BYAPR12MB2613:EE_
X-Microsoft-Antispam-PRVS: <BYAPR12MB26133E7BCB80D34A24855307974B9@BYAPR12MB2613.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: fcRJqZfsmiiZJKWEmgUwlOM7cITErjGSZS0U1oPWD+95wzirnFLfDfNKL00+8rCrIMSm77PxJ9nHOa50Fdso8wRLgNELdFvkbHwIMrpMRKMyBbpi7rAVPZQOimU6Yl0jmcGyIw0hEbuGF20dc+ri9XEr42BYRXNQFdgf1DpU3gRq4KMZb2/odmFibXQeD8p86w/m0/+JF7kexCL7SDaO60a/FfrssImNyInrLLfq46wUyXz6XOiGnfKYwaKvhSooqMO+6PPwtzTvG6Vz1Qh9dcQySzmxJm6DuPDZAZVrCmYig3ET/vMvV10PoskU0x/7nCWz599KebsWLP6qJ2Nf8875tbAzjzffW7gm2xQIfTExFAIeWFX6nPdndogpwd6L2OXTji2fx2q6DBkO+h7Jjoxu18C1SYKNpUdA4Uqau+5UvpyDFMZRepnyVzl6X6qdgAZWFZXieKDNnqxbYBHfbHhPlq62hZgvmsuG4tHXSfn83ejGES3YlSzi6FrnvTnkEKCAaDzqwAL80Zf2/79sPOxqt5PL2BYRK0/ZEv9d7fK60LV3yvnECOlcaON7GYVvXremFoGDkdJb+BKrUDAFZfd9ilKdylzI7GmIhuAjFG/vYqf4/5UxZ81Soc6e6yjoCT7gNYb2wsAclVnEOPTVbQUbpprAR4Xq1B671+QDVbfexGiS/9iIePhHjOTtWh/I0p+JA+GSZv2HoEP0oR325tLZdS1ZvAbz/+xwNglEIuc+GEcUzb6DoZS0R4tM+M75
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR12MB4614.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(66556008)(6486002)(26005)(36756003)(6512007)(316002)(186003)(66946007)(2616005)(110136005)(4326008)(66476007)(8936002)(53546011)(8676002)(86362001)(6506007)(2906002)(508600001)(31686004)(66574015)(5660300002)(6666004)(83380400001)(31696002)(38100700002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RVZpMFV1cHhHRlBPNm8yYkVOSEQyRGYvbHViZDUycUswb0QyWmVkVDI3RXpr?=
 =?utf-8?B?VWJ5ZW40ZjlZSTAyR0M1TEJjOWkyYkN6aDB5eGZ4MnlNTVh3RHNCRDNSTXAx?=
 =?utf-8?B?TEl3S2h5a0MrSnVsWXllQmMwSlJ0aUp2QmJ3T29IcE9pLy9TRmhBZFhHbFFt?=
 =?utf-8?B?NkxyMk1uR1FGaFlEZGhMMXJrT0t4SDJjalRzNUE3a0ZjejdmWHNzOVZlZ2xY?=
 =?utf-8?B?cFNCM0hZaVNuV2tFKzY5V1c3aTR5bmUyWk8xcjNsUktSaXRVam5BWCs0OStp?=
 =?utf-8?B?c2hGUVd2bnVJRlNHVGdwakUwdytkdzVicDI3WFc3WlNXelNrS2RZSVp3ckhk?=
 =?utf-8?B?TzlXN2h2Y3l5TEsyMkl4clZOb1BFQnlBVG0wb29DQWxSeVp4eUtLcmk5ZXpJ?=
 =?utf-8?B?eWJVR2FJNmpVWWVEdERPUzd3M1U1L0NHRUlIb2xQR2lQUkV1c3ExRXh5MVRV?=
 =?utf-8?B?dDBwWno1MGtnVnZuOWt1dDZFMUhXTEhKaGxpZ1BRMFRoZ2JIM2wvVlF3akR1?=
 =?utf-8?B?M2ZDVVR5aVRZR0pWem5SaVdTcndnOWxXdmxaZEtkK0FjYmZMRVVEczV1NzJr?=
 =?utf-8?B?cmhMcSsyenJxb3gvU25pVlhrNkI2UFFYZ1MvWlQrTE9HbGF6d09QWGlPY3J2?=
 =?utf-8?B?OTZxazVyMW5yVjBpRUZraXRJZDQ5ditvRWhRdmhveDVwdTZXU1Z1ckFIT0lG?=
 =?utf-8?B?Z2F3U2VTUm5IWVZUU2lKZElEWTdaOVpPK1VCQnE5dmtOOGNTQUVaYzVYSEhn?=
 =?utf-8?B?ZlBkbzc3UjFsMkNCK2duZWxKL0oza3dsUW15d2huc3Zsc1JuT0M1MFhJYXFC?=
 =?utf-8?B?S1B3MGErZWFtSFIzcGtNelV6dU9yUkp5ajM5c2pQdmZOYU9KTUthY3lialVs?=
 =?utf-8?B?NEd3a2tNY0lBNGI4UGl1WEttRk1TbE4yMW05eUEwa011QWEwcTlmVHJtbDNo?=
 =?utf-8?B?NHYwelVjeFVGRHZ0M2VlbXY5WmY0dndZUGFId09MYnRTQi9ldFR2RFVsa2s4?=
 =?utf-8?B?U0lROHhaWHkxc3BnN3VzaS9aYlF2T0orQVNIUHoxcndzdlY1bmJiaEFLT3Zq?=
 =?utf-8?B?WmJveFFESVFBbTR4dlRUL01JMUpjSy9qaWJKNWg2amxwdEUzRmhpa3lNME9S?=
 =?utf-8?B?c0hqN0NCa3VvbzhUVC8waDdrVFlIbGxDZ3dUSmVYWjkwTnlOZ2xqZm81Q3Nh?=
 =?utf-8?B?SzBxM3FyVHN1ZHVtSDEwMk14Y3lQdGFIWDB5Y1hTUE5JdzZPR0VBTWxER25t?=
 =?utf-8?B?Z3hkc01Td3k1MnNTSFpBU3p5MXgwdlB6ckN4YjROMWpBUlBqU3RiaHZ3K0Fj?=
 =?utf-8?B?dnZUVFJTWFNsUWZqUk9BUlVabHEvV3JlSjRrOXRVRXBPSEdQTEViSEg1ZjFK?=
 =?utf-8?B?YjNDWEY4UlpEVE9vUnNyUStLdk9MS0o5ekd0RVpVazlQVE9ZQ3BrMkZIVnZz?=
 =?utf-8?B?VHJMYzR5aER3dlJURDFKZ2xvY3pxMVZxWU8yUXU0Wnc3azdQQ1NlQ3VlMlox?=
 =?utf-8?B?WlRJa0JQcXVOSmNmWTcyb0k5NlVZTlNrVG13YzhzZVkwR1Q5aUl2anU5bjVl?=
 =?utf-8?B?R3A5NVAzdXI4cGhyZ3R3dGtDLzMyd0grZW02KzZJQzRncW01NEFtaEVha20r?=
 =?utf-8?B?VWZwNWF5TWVPbVhWS0tYM1FPd0NReVBZVVNkbURWOHhRazRPL1RXQU0vVDdT?=
 =?utf-8?B?VXI4NE1FWXRXanB0WFYxd3V5NWROcUY0UERxaG9lbTM1RzVOQ0hTRFNDYno1?=
 =?utf-8?B?dGNmUnEzcU1qQXc2VHh1TmRZS21iU3poNzV2ZkJSR21uc2UrVjVvTnVZSDhO?=
 =?utf-8?B?V2ttV2lYSEdHQklscTdKaTNFcFUxUWI4bVZhYms0MHpBbkVxVmg0dkcrUEFm?=
 =?utf-8?B?Q1hicC9HYUpRQ1ZURDRsMWxWc0NJSitNcXZJblAvTVRwemJ4UWM3WStJQmN2?=
 =?utf-8?B?SkFXM2Z6b3VvaTREZjNVYTBXSHFDUmJwcGJnZ0ovODhSSjdqMmxocTI1c1NK?=
 =?utf-8?B?ODR0c2Q5NGwzWS9kdkFKNnpmM0hjek0yb1dETExsTlRrUjh3OUdoTUM4U3c1?=
 =?utf-8?B?ZEJaY2kxVHM4T3V4RTM5d29vWFNrV3F4VU5oR1FOK0tVQWh5N3BrdEQxUExi?=
 =?utf-8?Q?1z3w=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a5a5f1d2-4cb4-486e-c45b-08d9d04ce755
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB4614.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jan 2022 13:11:37.0791 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: C4BYqxXBV1kVQMZ1BvK5v/aodAmPakOZ8sUWD2rfsSxmM/VYjtAePts05Yqxeo5Q
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB2613
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
Cc: horace.chen@amd.com, Monk.Liu@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 1/5/2022 6:01 PM, Christian König wrote:
> Am 05.01.22 um 10:54 schrieb Lazar, Lijo:
>> On 12/23/2021 3:35 AM, Andrey Grodzovsky wrote:
>>> Use reset domain wq also for non TDR gpu recovery trigers
>>> such as sysfs and RAS. We must serialize all possible
>>> GPU recoveries to gurantee no concurrency there.
>>> For TDR call the original recovery function directly since
>>> it's already executed from within the wq. For others just
>>> use a wrapper to qeueue work and wait on it to finish.
>>>
>>> v2: Rename to amdgpu_recover_work_struct
>>>
>>> Signed-off-by: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
>>> ---
>>>   drivers/gpu/drm/amd/amdgpu/amdgpu.h        |  2 ++
>>>   drivers/gpu/drm/amd/amdgpu/amdgpu_device.c | 33 +++++++++++++++++++++-
>>>   drivers/gpu/drm/amd/amdgpu/amdgpu_job.c    |  2 +-
>>>   3 files changed, 35 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu.h 
>>> b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
>>> index b5ff76aae7e0..8e96b9a14452 100644
>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu.h
>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
>>> @@ -1296,6 +1296,8 @@ bool amdgpu_device_has_job_running(struct 
>>> amdgpu_device *adev);
>>>   bool amdgpu_device_should_recover_gpu(struct amdgpu_device *adev);
>>>   int amdgpu_device_gpu_recover(struct amdgpu_device *adev,
>>>                     struct amdgpu_job* job);
>>> +int amdgpu_device_gpu_recover_imp(struct amdgpu_device *adev,
>>> +                  struct amdgpu_job *job);
>>>   void amdgpu_device_pci_config_reset(struct amdgpu_device *adev);
>>>   int amdgpu_device_pci_reset(struct amdgpu_device *adev);
>>>   bool amdgpu_device_need_post(struct amdgpu_device *adev);
>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c 
>>> b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
>>> index 7c063fd37389..258ec3c0b2af 100644
>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
>>> @@ -4979,7 +4979,7 @@ static void amdgpu_device_recheck_guilty_jobs(
>>>    * Returns 0 for success or an error on failure.
>>>    */
>>>   -int amdgpu_device_gpu_recover(struct amdgpu_device *adev,
>>> +int amdgpu_device_gpu_recover_imp(struct amdgpu_device *adev,
>>>                     struct amdgpu_job *job)
>>>   {
>>>       struct list_head device_list, *device_list_handle =  NULL;
>>> @@ -5237,6 +5237,37 @@ int amdgpu_device_gpu_recover(struct 
>>> amdgpu_device *adev,
>>>       return r;
>>>   }
>>>   +struct amdgpu_recover_work_struct {
>>> +    struct work_struct base;
>>> +    struct amdgpu_device *adev;
>>> +    struct amdgpu_job *job;
>>> +    int ret;
>>> +};
>>> +
>>> +static void amdgpu_device_queue_gpu_recover_work(struct work_struct 
>>> *work)
>>> +{
>>> +    struct amdgpu_recover_work_struct *recover_work = 
>>> container_of(work, struct amdgpu_recover_work_struct, base);
>>> +
>>> +    recover_work->ret = 
>>> amdgpu_device_gpu_recover_imp(recover_work->adev, recover_work->job);
>>> +}
>>> +/*
>>> + * Serialize gpu recover into reset domain single threaded wq
>>> + */
>>> +int amdgpu_device_gpu_recover(struct amdgpu_device *adev,
>>> +                    struct amdgpu_job *job)
>>> +{
>>> +    struct amdgpu_recover_work_struct work = {.adev = adev, .job = 
>>> job};
>>> +
>>> +    INIT_WORK(&work.base, amdgpu_device_queue_gpu_recover_work);
>>> +
>>> +    if (!queue_work(adev->reset_domain.wq, &work.base))
>>> +        return -EAGAIN;
>>> +
>>
>> The decision to schedule a reset is made at this point. Subsequent 
>> accesses to hardware may not be reliable. So should the flag in_reset 
>> be set here itself rather than waiting for the work to start execution?
> 
> No, when we race and lose the VM is completely lost and probably 
> restarted by the hypervisor.
> 
> And when we race and win we properly set the flag before signaling the 
> hypervisor that it can continue with the reset.
> 

I was talking about baremetal case. When this was synchronous, in_reset 
flag is set as one of the first things and amdgpu_in_reset is checked to 
prevent further hardware accesses. This design only changes the recover 
part and doesn't change the hardware perspective. Potential accesses 
from other processes need to be blocked as soon as we determine a reset 
is required. Are we expecting the work to be immediately executed and 
set the flags?

Thanks,
Lijo

>> Also, what about having the reset_active or in_reset flag in the 
>> reset_domain itself?
> 
> Of hand that sounds like a good idea.
> 
> Regards,
> Christian.
> 
>>
>> Thanks,
>> Lijo
>>
>>> +    flush_work(&work.base);
>>> +
>>> +    return work.ret;
>>> +}
>>> +
>>>   /**
>>>    * amdgpu_device_get_pcie_info - fence pcie info about the PCIE slot
>>>    *
>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c 
>>> b/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
>>> index bfc47bea23db..38c9fd7b7ad4 100644
>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
>>> @@ -63,7 +63,7 @@ static enum drm_gpu_sched_stat 
>>> amdgpu_job_timedout(struct drm_sched_job *s_job)
>>>             ti.process_name, ti.tgid, ti.task_name, ti.pid);
>>>         if (amdgpu_device_should_recover_gpu(ring->adev)) {
>>> -        amdgpu_device_gpu_recover(ring->adev, job);
>>> +        amdgpu_device_gpu_recover_imp(ring->adev, job);
>>>       } else {
>>>           drm_sched_suspend_timeout(&ring->sched);
>>>           if (amdgpu_sriov_vf(adev))
>>>
> 
