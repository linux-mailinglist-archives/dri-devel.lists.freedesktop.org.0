Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B4C8B68C5AB
	for <lists+dri-devel@lfdr.de>; Mon,  6 Feb 2023 19:23:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ADB5910E9F5;
	Mon,  6 Feb 2023 18:23:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2040.outbound.protection.outlook.com [40.107.243.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9CD0310E9E8;
 Mon,  6 Feb 2023 18:23:17 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=S+cK384oZ3AFywRXRwbfWSKD6f2fOHCc8YdG6QzU0JbAOweOToJYGS1C8Esm7nqUdcVUT/jzRbDr+1gjQQNX/to9DgyUH89bKgXNEnW2UzZobF4DrnUpRrh/JVLsqw8qTjFn43za/fD2WXLWCfYO2nAWYN24EQv5aPVsyKwJLZ8e1GsvLBmr6zVfLOoqS5xG9JVj28vsGiHTzgg4TtW0fSRjRj54e6kGAwY4vBGKNTL2Kj51kw4aNQHwXLgLhYdQ/QxopyHvJ2gMgHRzmYMnJVhLnOcU0Y1aw0kwS3b4DnS662scgeagCxIhbnigugW15CJHTqGzS9iiTmhygYebLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ajE6ammT7G52hGjtaRniY1jqqMMdk1dmMFvGTN1E0+k=;
 b=j7HCwiVEO5/NXsRMtwoKURn/XbQEkm1RDJVbIBrMyMBYoP8l5AHWgPa9La5F8ZHJZOm4xJlZMGpNXqACcNUR72j697lCQntLkoXRQ+TE9EZdEFhkUc41dZPgcJkiCWWHUxx12P5KkXQAWK7MMiOSM4/VqiQEJVbBv7MrgciLqqBxE3oudooWBb/Umy7aqWFWpqUOG0r9MiTW2MBpeQ6bUG4fo3NkvpQFN3KOOndRNNebvR/5lPUKZGKS3NbVEwRrFXYqJbNGtWjVsJmkL5Au65ONPlokWF24rGXeqIq/cr4RJ7A3KjeIdfpz8MKp9+9zmKS62V93IIRkc4O42W80NQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ajE6ammT7G52hGjtaRniY1jqqMMdk1dmMFvGTN1E0+k=;
 b=zKFfDelA2OZk33sHR8/sqmcWPV/7TDjRJ/jKIgDhoUFTLc27bklL1K7kRxTAmAnRQ+bmJrPfVdw9nx0fIeepvz26IRyizCzbjrNaHdgSaMjqZtK4mctcSHOxfxU1qfi8Rbxei2UYCW8S4AD+vDssleZ9XYiVwe8o+TNKc6/sh2k=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by CH3PR12MB8460.namprd12.prod.outlook.com (2603:10b6:610:156::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6064.34; Mon, 6 Feb
 2023 18:23:13 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::2e4f:4041:28be:ba7a]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::2e4f:4041:28be:ba7a%6]) with mapi id 15.20.6064.032; Mon, 6 Feb 2023
 18:23:13 +0000
Message-ID: <37523b33-6ec1-0cec-ded6-0d4819e52453@amd.com>
Date: Mon, 6 Feb 2023 19:23:07 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH] drm/amdgpu: Fix potential race processing vm->freed
Content-Language: en-US
To: Rob Clark <robdclark@gmail.com>
References: <20230203181005.4129175-1-robdclark@gmail.com>
 <2d5fc6f8-2247-8a8b-1174-eccdc2b08064@amd.com>
 <CAF6AEGtAqE-h06zgCzjr+R-WWj0ELfyKkD8KHZUYeo6cjS1ceQ@mail.gmail.com>
 <c6c9b6af-f832-3cc3-2d03-29d5f7aaddef@amd.com>
 <CAF6AEGuxsYQo5yHhXkJHagM4Wiq0XCughPfSFxyTWZPorp5mgw@mail.gmail.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <CAF6AEGuxsYQo5yHhXkJHagM4Wiq0XCughPfSFxyTWZPorp5mgw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0071.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4b::7) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR12MB3587:EE_|CH3PR12MB8460:EE_
X-MS-Office365-Filtering-Correlation-Id: 0b0889f7-c7e7-4533-7770-08db086f3510
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: BdGtqO8+3XiopKtUwtbTB0GgDzMq8B0oqWxVL6qFfyUF7vHqrrIo38TqLMq+DnHvTYnRNT+j0XHieZ9bXPAxt3f1YQsb1MANMWyOIZUXPyqn6xiBhl76rAgjLmZ7hpaERFvnZHTmqYk25MMc2M34XGOIUPDZzjqz4nCp2rkgz1XnB5AlWBMkr44ZXf5cIz3F77ZJx3nK/GPxgwHeP9fx/U7p8uBeb2ceg+hjCRPGvRsce7FcU65b3Blaidn56vF+2eoXUebb8bSwP07E1okbHIvU3byf1mZxsJfPQasgLDAF68xmld1eaIhSkPTCBOjjVtWp2fxCTckoM54C2/Fd9mMvJ7ZH35NqxxjMWybmapJa+EuS+4lPtGGBuE6RqR+esTumZQTuHE7q9twT0QCGLPth0Uir03wYZeXkqTdoRex1HGkQZIgzps33Hhqv6LC6JqrWY5eCWSgOEP6F6TeU1Z6j9g54siBgHVK73mRpN/WjLAhp0tPNwbc59IrwGgKacfF5adEgiiEGNx6GpybCyU6XAkxNfYG0EBrgYwxLKajmMCeYgBcG9D+tfGhtcBDgNjfTDyCIIDY37n+4eA/0ceu1pQ2jP2e90ipRsXaa/3zrN5EOSlc+lDdUiiaYBXxuujVZhhuDhHmBXbmODciyGh5k2Vt8v+fjFqsh8PvWOE62T2zAifwSSzvZiL020YcQGCDOB3H5a7hFZH0LBI7m2LzjxMtqErLBLdmGgR+F0nI=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(346002)(396003)(136003)(376002)(366004)(39860400002)(451199018)(31686004)(83380400001)(66574015)(86362001)(2906002)(36756003)(31696002)(66556008)(8676002)(66946007)(6916009)(4326008)(66476007)(54906003)(316002)(478600001)(6666004)(186003)(2616005)(6506007)(6512007)(53546011)(41300700001)(38100700002)(8936002)(5660300002)(6486002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QjAvOEFuVzhvZmpMcVczSFpmWVQ4WlVDZWF4WFNiMDJySmVKU3RWOUJ0c1Qx?=
 =?utf-8?B?aTNsZjlvMGRXQkF4ZFpKTlowYkhobmNObW1WUTYxZ1I2Um8rZC8ydm5xR0hr?=
 =?utf-8?B?azJxVlZmWGtxUndlUlBsdW83S3RibktiZTdyVWJUZFgzdXJPeEdPd2RFUXdq?=
 =?utf-8?B?MmN0WHFwclZoMmdhSDNWenZBL2I0dlFvak10dllxMS84Ymt5RkpMRDNReXlL?=
 =?utf-8?B?Z2d0VHFWUE5aelFxZzI4amdRLzU3cjdNYXNpaWRqZ0hBRzdXdjF5RzRkNWNU?=
 =?utf-8?B?SlF5elJIaXJXQktPVC9ld3QyOTl5TEQyOEt3UHo0VURxL1BuSnN4b1ppeWdl?=
 =?utf-8?B?b1BiQWxndTNTclNJU1lCdHNYNlBYdnVJRDJ4elBieTNYTzNwM05PekVhc1NQ?=
 =?utf-8?B?eU5kR1NOZGtuRWJHSVNkbi96QXg3UFNoVlM2TzdLT0puV1A0SUV5MHl3MkNx?=
 =?utf-8?B?ZHd5cHZIamZwMWRYUjhwMmwxYWhKaGsrRFRqMmtQdXN1c2VuNGhsVUZjV1pa?=
 =?utf-8?B?bHVDak9tcFpLYmR3bnlmdFJ6WHNVRU1SU2Q0dFB3S0NWcjkrY3FCZ0xRNExW?=
 =?utf-8?B?dFlCbXQ0ZGpqbUtyNGw0RTAydG1aeVRjNTVrN1J5TWlQZUV2VlN5cnlIV3BC?=
 =?utf-8?B?SllIUEFyUTQzdTJuSUFSWVl2S2Nzc2Z4V093dU4ranAzdXlrbjRvTlFJVWpa?=
 =?utf-8?B?NThTTVNSM3BHMTJVT1dtU1pzZ0dSaFlUOHh3V0lGNVAzUVAzYldwR1RiWUQ2?=
 =?utf-8?B?VzNhYXJSYTAwaDA0U0pSdjlIRnVsWEcwVnF4ZkZLNTZSVDRyemZlL3ZCVW5z?=
 =?utf-8?B?TWZEME45Um1CMGVCT29xY3U4NGlnV0pRemF5akdBZkkvQVNjVkczaTFSR3E1?=
 =?utf-8?B?aTZnR05yNTNoVlBrR1o3alNOOGJNRjF2STIxdXNMcVl6OTZVMm5Ma0JUY01E?=
 =?utf-8?B?THVFUEh6VjVublVvVDc1K2lGZEt2OTREenErNWdYNHRWOFNjZnNtd3RHZUlF?=
 =?utf-8?B?UmVzZk1mRGNKWGQzM25PQnYzWUliQ0F6UzZvS3RhWDhsVkVUTEVxZzZFY09a?=
 =?utf-8?B?R0VkaDgvUnAxYlI2Y0dMdGhRckZja0pSV08zeEN2Vks3QjFqN082dE9BQmNt?=
 =?utf-8?B?M05DcEFFWkxGZzN3Q0hnaWU4eExDRG04eEN6bUN3dGxrTkpvSjRMSWVvY2hY?=
 =?utf-8?B?RXZSNlNBRHVXdnBJS3BWMXNocEVSVnJtaGN0cnA2eG9rZXM1UXU4QVg3UFNh?=
 =?utf-8?B?c0dXVGkyYkF3Ky9uaVFBL3VYWXByc1QrRjBlN09HV0MydzdRdFAyK2U1RW52?=
 =?utf-8?B?cDQrdDcyMEx1eTgrVGs0akIzdktvVWg0czROVENGaFNhRC9KRUpZRE4weFA1?=
 =?utf-8?B?THorajhGeTBvdGVhVnI4YUUzTWVPVWRoM2RFV0pxbVlMZXZwRUlseDZXQm10?=
 =?utf-8?B?djE5ZDdhSkw1Q2dQZFVQUnRGaTNvekREeXRnbUpXMktpTnN0SFJPRXdpQVVH?=
 =?utf-8?B?VmZSYzhjNVk4L3RrVjdGbzFyQy9rQjhaeWRaSGtqOTA5aFBtQUx4TjFhSSt5?=
 =?utf-8?B?c3RkZnR6SnEwdk54UndwbUMyUGk1TGhqMkMvSW1rVVpRUys3L3VvS3g5eXZQ?=
 =?utf-8?B?b0lGNVhMeDNNODlLMTZRMGo4SnRmMTBDSis3SG5qL3NMWEw5Y1NMZElKUDFU?=
 =?utf-8?B?NGFmeDVHVVFST3F1eWowZ3JZdjJjbjlUdlhZdlhmbFdNTXh1dXUrVEtxbmtX?=
 =?utf-8?B?UXBISVNLYTQ2OFlDWGVGOWg1ekRnU1IvbUlXKzZWWllQMCtLeU9sUGhid3pw?=
 =?utf-8?B?dWRzeFlnMElKZ0RheldWU0doNGF5dEN3cGdlMWhPNnBGd1BHTEVZanpvd2Ev?=
 =?utf-8?B?VXJHTDl0RmdMWUszRllYUEt5WWxLd0UzSVpseTFNNHg3QkU5aXJMV2JuOWZB?=
 =?utf-8?B?a01xemdWRXJsZEF3Yko1NzVNN1lBeXpTNUNXclIwQ3hoUkFrc1lIZEFTQUEx?=
 =?utf-8?B?TThteE5LM1hwbGlSN1QydHdwNEFxSlFzRlFGRStVb2J4NnE4eXQ2c3ZtSFo4?=
 =?utf-8?B?dXg5QmtEMFRWdUpPYnloNnY1UndOQys4RG9xREFoTTFFWDRtbTVTcFpzaWd5?=
 =?utf-8?B?VFdWaWRWdERiSDNFMTZLT1prVFJxbiszcHJLaTVmLy9xT3BNY011dXYrcnJP?=
 =?utf-8?Q?D36fUNiBSNFL+g4gzncZ41MsZYaiLSnTf+kmSwD99lds?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0b0889f7-c7e7-4533-7770-08db086f3510
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Feb 2023 18:23:13.0064 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FrP5ewDFNXMVm+XhIzpRqPRAfF/lc66YPeEhNiLMAGEcSwV/+/JjBRbo9eKGuW6x
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8460
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
Cc: Rob Clark <robdclark@chromium.org>, Philip Yang <Philip.Yang@amd.com>,
 Jammy Zhou <Jammy.Zhou@amd.com>, Felix Kuehling <Felix.Kuehling@amd.com>, "Pan,
 Xinhui" <Xinhui.Pan@amd.com>, open list <linux-kernel@vger.kernel.org>,
 dri-devel@lists.freedesktop.org, Qiang Yu <qiang.yu@amd.com>,
 "open list:RADEON and AMDGPU DRM DRIVERS" <amd-gfx@lists.freedesktop.org>,
 Alex Deucher <alexander.deucher@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 06.02.23 um 19:21 schrieb Rob Clark:
> On Mon, Feb 6, 2023 at 8:05 AM Christian König <christian.koenig@amd.com> wrote:
>> Am 06.02.23 um 16:52 schrieb Rob Clark:
>>> On Mon, Feb 6, 2023 at 2:15 AM Christian König <christian.koenig@amd.com> wrote:
>>>> Am 03.02.23 um 19:10 schrieb Rob Clark:
>>>>> From: Rob Clark <robdclark@chromium.org>
>>>>>
>>>>> If userspace calls the AMDGPU_CS ioctl from multiple threads, because
>>>>> the vm is global to the drm_file, you can end up with multiple threads
>>>>> racing in amdgpu_vm_clear_freed().  So the freed list should be
>>>>> protected with the status_lock, similar to other vm lists.
>>>> Well this is nonsense. To process the freed list the VM root PD lock
>>>> must be held anyway.
>>>>
>>>> If we have a call path where this isn't true then we have a major bug at
>>>> a different place here.
>>> I'm not super familiar w/ the amdgpu cs parser stuff, but the only
>>> thing that I'm seeing that protects things is the bo_list_mutex and it
>>> isn't clear to me that this is 1:1 with the vm (it looks like it is
>>> not).
>> Do you have a backtrace?
>>
>> Take a look at the reservation object of vm->root.bo. This should always
>> be locked first before doing *anything* in a CS.
>>
>> If that isn't the case we have a much worse problem.
> In this case, maybe an dma_resv_assert_held() would be a good idea?

We should already have that. Which makes me really wonder what the heck 
is going on here.

Christian.

>
> BR,
> -R
>
>>> (I cc'd you on the bug report, jfyi)
>> I unfortunately only get a permission denied when I try to access that one.
>>
>> Regards,
>> Christian.
>>
>>> BR,
>>> -R
>>>
>>>> Regards,
>>>> Christian.
>>>>
>>>>> Fixes: d38ceaf99ed0 ("drm/amdgpu: add core driver (v4)")
>>>>> Signed-off-by: Rob Clark <robdclark@chromium.org>
>>>>> ---
>>>>>     drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c | 33 ++++++++++++++++++++++----
>>>>>     1 file changed, 29 insertions(+), 4 deletions(-)
>>>>>
>>>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
>>>>> index b9441ab457ea..aeed7bc1512f 100644
>>>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
>>>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
>>>>> @@ -1240,10 +1240,19 @@ int amdgpu_vm_clear_freed(struct amdgpu_device *adev,
>>>>>         struct amdgpu_bo_va_mapping *mapping;
>>>>>         uint64_t init_pte_value = 0;
>>>>>         struct dma_fence *f = NULL;
>>>>> +     struct list_head freed;
>>>>>         int r;
>>>>>
>>>>> -     while (!list_empty(&vm->freed)) {
>>>>> -             mapping = list_first_entry(&vm->freed,
>>>>> +     /*
>>>>> +      * Move the contents of the VM's freed list to a local list
>>>>> +      * that we can iterate without racing against other threads:
>>>>> +      */
>>>>> +     spin_lock(&vm->status_lock);
>>>>> +     list_replace_init(&vm->freed, &freed);
>>>>> +     spin_unlock(&vm->status_lock);
>>>>> +
>>>>> +     while (!list_empty(&freed)) {
>>>>> +             mapping = list_first_entry(&freed,
>>>>>                         struct amdgpu_bo_va_mapping, list);
>>>>>                 list_del(&mapping->list);
>>>>>
>>>>> @@ -1258,6 +1267,15 @@ int amdgpu_vm_clear_freed(struct amdgpu_device *adev,
>>>>>                 amdgpu_vm_free_mapping(adev, vm, mapping, f);
>>>>>                 if (r) {
>>>>>                         dma_fence_put(f);
>>>>> +
>>>>> +                     /*
>>>>> +                      * Move any unprocessed mappings back to the freed
>>>>> +                      * list:
>>>>> +                      */
>>>>> +                     spin_lock(&vm->status_lock);
>>>>> +                     list_splice_tail(&freed, &vm->freed);
>>>>> +                     spin_unlock(&vm->status_lock);
>>>>> +
>>>>>                         return r;
>>>>>                 }
>>>>>         }
>>>>> @@ -1583,11 +1601,14 @@ int amdgpu_vm_bo_unmap(struct amdgpu_device *adev,
>>>>>         mapping->bo_va = NULL;
>>>>>         trace_amdgpu_vm_bo_unmap(bo_va, mapping);
>>>>>
>>>>> -     if (valid)
>>>>> +     if (valid) {
>>>>> +             spin_lock(&vm->status_lock);
>>>>>                 list_add(&mapping->list, &vm->freed);
>>>>> -     else
>>>>> +             spin_unlock(&vm->status_lock);
>>>>> +     } else {
>>>>>                 amdgpu_vm_free_mapping(adev, vm, mapping,
>>>>>                                        bo_va->last_pt_update);
>>>>> +     }
>>>>>
>>>>>         return 0;
>>>>>     }
>>>>> @@ -1671,7 +1692,9 @@ int amdgpu_vm_bo_clear_mappings(struct amdgpu_device *adev,
>>>>>                     tmp->last = eaddr;
>>>>>
>>>>>                 tmp->bo_va = NULL;
>>>>> +             spin_lock(&vm->status_lock);
>>>>>                 list_add(&tmp->list, &vm->freed);
>>>>> +             spin_unlock(&vm->status_lock);
>>>>>                 trace_amdgpu_vm_bo_unmap(NULL, tmp);
>>>>>         }
>>>>>
>>>>> @@ -1788,7 +1811,9 @@ void amdgpu_vm_bo_del(struct amdgpu_device *adev,
>>>>>                 amdgpu_vm_it_remove(mapping, &vm->va);
>>>>>                 mapping->bo_va = NULL;
>>>>>                 trace_amdgpu_vm_bo_unmap(bo_va, mapping);
>>>>> +             spin_lock(&vm->status_lock);
>>>>>                 list_add(&mapping->list, &vm->freed);
>>>>> +             spin_unlock(&vm->status_lock);
>>>>>         }
>>>>>         list_for_each_entry_safe(mapping, next, &bo_va->invalids, list) {
>>>>>                 list_del(&mapping->list);

