Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 77B3B3881BE
	for <lists+dri-devel@lfdr.de>; Tue, 18 May 2021 22:57:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 812506ECA6;
	Tue, 18 May 2021 20:57:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2055.outbound.protection.outlook.com [40.107.92.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 81AEC6ECA4;
 Tue, 18 May 2021 20:57:04 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nmOOaVyStRjgsbWAEP4OLurfFfi1RqbXqSSTI+qarBCgfUl+Qoxq5xGc0wBtTLEbK4ZhUlIX2ItT1c+7GjNVFOZtUD5DQP/OGNmCyrElN7CMTMGL+YvCDR8CCk8wkwsdiW+Dgzme7W1kvWZo0GGmcRXsGamt7uAChPMaedozo0x6G7HelzizpmIPXcVldWZOcICcDZjsiRfFvFF/J8n+kD0hh/1Zfl+Qnqd5A1TnN8ZTWJCXfcBA6mD9etHBPONiveSHXc8dqkI+74lcAqQgKRQ9bO1KDJZt7c/DKpZiOOR+vil+fzxT2IMlaaV6OywlPpRy7qKXlcRI0R3X6rG2Yg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D0YCUEf/hTVguz0P47XqN+jGJ1xn+YWNRwzKzpsFk4A=;
 b=MBDadl04QWACE+S2zufzolmFT1lpB1H+Rd8MZXuipZPrAjeS7HEvqdQUlELGAABm8rLzfeNYdFgzx5qpqoqxWPCRC6ZbOpbG5ygENDq30BoMUk7YXA24UPxaG5tGWgwUpHTNVI6saMOw3hzMxuu9n9aco/QuXmEoboYqBVE6TyWRElkN8iVA9qlU/8MlIQ6f+F+oZo5NJfVB/VaiBKfWc9EroG4O2vyHaKoGm2/1NvbcS5zW6A2x74mZGZWmUQ28VooSqzUb6E54JpwMwKeygqUuEXK+rNEg7CpwIcOh5aikHAozziQksr7tyl0uDcamomWRuuBgIHh+INlHa6XeBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D0YCUEf/hTVguz0P47XqN+jGJ1xn+YWNRwzKzpsFk4A=;
 b=VfR8z/stRlF1r+MzFFlakrTEDPiw3tP6dKq4QhddAHqObfgWrd5XcDUOxvwkosLY084daXgg7y3XbwfPbH6BoOJiLFF7ieSsY6r4NBuTlsb5AdQFYbctfxQH5ES53cn1zileBFNGRCqASBYpto5oRBRIjpyYNaQJ9WHgXnG2gzs=
Authentication-Results: amd.com; dkim=none (message not signed)
 header.d=none;amd.com; dmarc=none action=none header.from=amd.com;
Received: from SN6PR12MB4623.namprd12.prod.outlook.com (2603:10b6:805:e9::17)
 by SA0PR12MB4447.namprd12.prod.outlook.com (2603:10b6:806:9b::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4129.26; Tue, 18 May
 2021 20:57:00 +0000
Received: from SN6PR12MB4623.namprd12.prod.outlook.com
 ([fe80::ad51:8c49:b171:856c]) by SN6PR12MB4623.namprd12.prod.outlook.com
 ([fe80::ad51:8c49:b171:856c%7]) with mapi id 15.20.4129.031; Tue, 18 May 2021
 20:56:59 +0000
Subject: Re: [PATCH v7 13/16] drm/scheduler: Fix hang when sched_entity
 released
From: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 linux-pci@vger.kernel.org, ckoenig.leichtzumerken@gmail.com,
 daniel.vetter@ffwll.ch, Harry.Wentland@amd.com
References: <20210512142648.666476-1-andrey.grodzovsky@amd.com>
 <20210512142648.666476-14-andrey.grodzovsky@amd.com>
 <9e1270bf-ab62-5d76-b1de-e6cd49dc4841@amd.com>
 <f0c5dea7-af35-9ea5-028e-6286e57a469a@amd.com>
 <34d4e4a8-c577-dfe6-3190-28a5c63a2d23@amd.com>
 <da1f9706-d918-cff8-2807-25da0c01fcde@amd.com>
 <8228ea6b-4faf-bb7e-aaf4-8949932e869a@amd.com>
 <ec157a35-85fb-11e5-226a-c25d699102c6@amd.com>
 <53f281cc-e4c0-ea5d-9415-4413c85a6a16@amd.com>
 <0b49fc7b-ca0b-58c4-3f76-c4a5fab97bdc@amd.com>
 <31febf08-e9c9-77fa-932d-a50505866ec4@amd.com>
 <cd6bbe33-cbc5-43cb-80f7-1cb82a81e65d@amd.com>
Message-ID: <df863907-f731-19a6-f5f3-29fa5d9bd084@amd.com>
Date: Tue, 18 May 2021 16:56:56 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
In-Reply-To: <cd6bbe33-cbc5-43cb-80f7-1cb82a81e65d@amd.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [2607:fea8:3edf:49b0:1069:60ba:d67c:3ab3]
X-ClientProxiedBy: YT1PR01CA0107.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2c::16) To SN6PR12MB4623.namprd12.prod.outlook.com
 (2603:10b6:805:e9::17)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2607:fea8:3edf:49b0:1069:60ba:d67c:3ab3]
 (2607:fea8:3edf:49b0:1069:60ba:d67c:3ab3) by
 YT1PR01CA0107.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2c::16) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4108.31 via Frontend Transport; Tue, 18 May 2021 20:56:58 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b513b5e5-51e7-48e3-4970-08d91a3f7a90
X-MS-TrafficTypeDiagnostic: SA0PR12MB4447:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SA0PR12MB4447F1733F7C4960158E576EEA2C9@SA0PR12MB4447.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: CkFFBG5X54l/S8iCa1s1JfAgynJXaljN2RxJMhAbKyLM/mZyE2BoRLq89nKe9GwSG1UVVypycu4wWw/a7ton89IKl/xO+mqsKqQu/ud6FyjOrotmzx4Dd2zCuR5FDgqiHDReyJGfGT1kGuORlnIP7MMYzmIjyYkqNn9LF4axjDl4JejcHpM469Y0QqjB1bifRobhfHy/m/ElbAURgdw3uR3EJvpp53gK7UsOy4NWp7ugnVs2CxvUzttXsj2964rrWMQWODEPR6Cx9PWQat/u1bB28ONWaO3KrxCtujp4gWNQMO5L05Dxoq98snM598bM5EV8QBC+HPTxhMZPtOmrIz+uxy7/DCaZ0d5bhS1ycfr/yGg/y+dbQc4ROjQPa4uYow2xVCHEVUPApOrdqeExKPNdGqnfSexEKYPNmNkicYPNxNOXIDYPPeu9SUJMAL3syJmpqBEZJRwix0JASy4L3AAp9f4z6n2Ct3y5dsoB9ZY/9DQ2C3/rKyCH8euUopDdD9Uoqj4swxY1ri7vIa3EbqGfuhJuMnMGx9uA01KZULNMY8U+mvxREPExD0kbAgTwko/ugQOA/aVID3WMYhr3W1EFVkj75H2qIBqkjG/0KMfpg438Uq5Mle+PZLaDvOiV1pY/7nm1nzMP91QvNX2z/njO5kERbnyK3xeAVQ/5QF6/db8KhLben85apmZk88ps
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR12MB4623.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(376002)(366004)(346002)(396003)(39860400002)(66556008)(66476007)(4326008)(31686004)(83380400001)(44832011)(30864003)(52116002)(38100700002)(66574015)(6486002)(5660300002)(53546011)(8936002)(86362001)(316002)(2616005)(2906002)(186003)(8676002)(16526019)(66946007)(6636002)(478600001)(31696002)(36756003)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?S0Z0MHRuVk04UzUycUFKcEhXM04wby9tYUhKRzJWSXFSckVyVjI3ZGREamtz?=
 =?utf-8?B?SkFpWWJLeGZDNXR4M0tScXNTYjd4aXVqanFVWUd5MDZ4bmNnN3FqS0JZcFVM?=
 =?utf-8?B?Y3lTUHBaMkZMdklPQmJTNm1lQkNvTVljZ3kzckw4alUrYjBCbmVMZXcyUFVS?=
 =?utf-8?B?aEhseUR5WGk3NTYza1Vsei96SWRxQURwTWQzSTR3c1F1eWZjbldXUlhUZENo?=
 =?utf-8?B?Y0hvNFNKSzhrQzdVR1NOREh4K0gvd1l4NnpobG5ueTltaUM1YkRmVVF4YVh6?=
 =?utf-8?B?S0wxMGxYZDlUSXVwOWFhV1FOZnJlbENRUmROa1BFM05vcmFwMnAwWmx5UFk2?=
 =?utf-8?B?d0dOMUlyWUx0SnNudERUVlRybkZQKzBrVzB4TEtFOWFHVmFOZzJYRGltUHQ1?=
 =?utf-8?B?TnRRWmNra1NCWlJOaEZTTnFDT0V2cW1BMmRwWFEzd2cvYktzdkxEZmJ6NnVz?=
 =?utf-8?B?NCtoMWRITW1vSjVGREd5dUJVcWZBK3lib2FhUDliSHM0UmFVNU1QYW5uOEp2?=
 =?utf-8?B?L1NIb211dEx5eENVcnU0cmo1UVE1VTQ5UHBVNzVNelFKZkdBL2xvcnVyaUx2?=
 =?utf-8?B?L0thU2VoQWdvSG9DcEx6UzE5dGxUWFJSYkVOS2psSmdCVktPRzlTZFZXNEJi?=
 =?utf-8?B?bjRmTG85cTZvejFHTGRyMHl4VjZrdE1WKyt3dnZSVXBSalVuV2liTmNETnhY?=
 =?utf-8?B?Z3lXK2NPckF5d294RDVKb1BnbXlJeVdJdlI1UlExcnZwQWo4c1k3dS96YzEr?=
 =?utf-8?B?bHhzeGw5bXRGM3BsbFNITEhKdnBjb0VJcTZkZFUwYnQzbTF2OWQreE15SDJT?=
 =?utf-8?B?WENsOXBEWHhFeWt0NDYwUEI4NlFDL1dmZ3JNc0RNOXpJM3gveFUvTHpZMkM0?=
 =?utf-8?B?SDFoRGY5T2gzWkJDNk1JZHVqUHV6MFZLaUNITnM5RHk1dG5jdDd5K1EvTEhl?=
 =?utf-8?B?aEkwdUxkVGVlREsxVGw3RWdQczBCSzFGTUNXZE5EcFEwa2VnQWttN2UySEFB?=
 =?utf-8?B?OTk1R2VUa0I5RHQzdXpVdUZrNjVIRUh3VGpzeXlKVXlOR3NDRkFEK1VnWjM0?=
 =?utf-8?B?Y25iL3Qxc3ZvZWpWa0oxSzB0Mkx0WG1KNkErQzZrUU1BMjRLOGNQSjhKZGd3?=
 =?utf-8?B?bkJlRUVma1Z2N1BReGZIdXAyenJ0ekpRcmtHV0t6dXg4UzhLSFNETDZBNFBW?=
 =?utf-8?B?bGsyT1BNUHEwRXFPeWx0YXNXa0oyWkFXYm5WZ0xteVp3bHpaYWgvdWJKSkN6?=
 =?utf-8?B?RTdscFc3RTd1Z0tWcEthV3FRb3orSFcwdFBPcU9BQmVXUEU5VUx4bTZrdzh6?=
 =?utf-8?B?TS84YkZlUmZ5RXNlSTBoNFBLOGtpUVN4UkFENGp0Yks4NTBsUHlucjR6eGNt?=
 =?utf-8?B?M0ZZdDlUQWNrTnJrZW5WeEZNYU1JeGZRUHlsSmtZQ3dZT3g5SU4yUXMrTkdS?=
 =?utf-8?B?RDNTRkpKSXQvckUwV2JFWWpXaU9icW1Bci8renVJaHFnM1lRZmFmaC9pSTBF?=
 =?utf-8?B?Y0FRZmhiVkNPRFdxSlhsbnFvVlk0Z0pCSHUxN2puL3VvTlZpNkwyR0NFVTQw?=
 =?utf-8?B?dGpuZHFKTU5oT2twUjFtV3ZpaFJ1RkIxUGdoSzBPVDZ3RnZEd3ZRaGViNUVn?=
 =?utf-8?B?aFQveS9ucUJ5bFRETkZjWEJpWUdMcEw5ZWx1YmhteFRJaFQ2UVJMb2pZb09P?=
 =?utf-8?B?eUQ2c2RnNmd1RjVNaXpKUXNzTThhdkEwOExlalgwRDZROU9jQndVV1ZjRXhr?=
 =?utf-8?B?dW1CM24wTFIvbStVNWpkN3EwRU9jbEY5UjNWVkpoZ2hockZHTjhCdGZtRHp0?=
 =?utf-8?B?bG9oNURMRkVyMDkxQkQvcVRMUXdSY1E0QzIrV2RvY2VEREh5Q0kwSERpamRQ?=
 =?utf-8?Q?is0pYU+YggZ36?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b513b5e5-51e7-48e3-4970-08d91a3f7a90
X-MS-Exchange-CrossTenant-AuthSource: SN6PR12MB4623.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 May 2021 20:56:59.7050 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: B6tz2HWXj5K+0ty65EKM1/wrAOXjwmMuoISD3FUqlV1Yy7t+6bXIqET70mNIG/5sh02lw5uo0y1/4FhUr9HVBQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4447
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
Cc: Alexander.Deucher@amd.com, gregkh@linuxfoundation.org,
 Felix.Kuehling@amd.com, helgaas@kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 2021-05-18 2:48 p.m., Andrey Grodzovsky wrote:
> 
> 
> On 2021-05-18 2:13 p.m., Christian König wrote:
>>
>> Am 18.05.21 um 20:09 schrieb Andrey Grodzovsky:
>>> On 2021-05-18 2:02 p.m., Christian König wrote:
>>>> Am 18.05.21 um 19:43 schrieb Andrey Grodzovsky:
>>>>> On 2021-05-18 12:33 p.m., Christian König wrote:
>>>>>> Am 18.05.21 um 18:17 schrieb Andrey Grodzovsky:
>>>>>>>
>>>>>>>
>>>>>>> On 2021-05-18 11:15 a.m., Christian König wrote:
>>>>>>>> Am 18.05.21 um 17:03 schrieb Andrey Grodzovsky:
>>>>>>>>>
>>>>>>>>> On 2021-05-18 10:07 a.m., Christian König wrote:
>>>>>>>>>> In a separate discussion with Daniel we once more iterated 
>>>>>>>>>> over the dma_resv requirements and I came to the conclusion 
>>>>>>>>>> that this approach here won't work reliable.
>>>>>>>>>>
>>>>>>>>>> The problem is as following:
>>>>>>>>>> 1. device A schedules some rendering with into a buffer and 
>>>>>>>>>> exports it as DMA-buf.
>>>>>>>>>> 2. device B imports the DMA-buf and wants to consume the 
>>>>>>>>>> rendering, for the the fence of device A is replaced with a 
>>>>>>>>>> new operation.
>>>>>>>>>> 3. device B is hot plugged and the new operation 
>>>>>>>>>> canceled/newer scheduled.
>>>>>>>>>>
>>>>>>>>>> The problem is now that we can't do this since the operation 
>>>>>>>>>> of device A is still running and by signaling our fences we 
>>>>>>>>>> run into the problem of potential memory corruption.
>>>>>>>
>>>>>>> By signaling s_fence->finished of the canceled operation from the
>>>>>>> removed device B we in fact cause memory corruption for the 
>>>>>>> uncompleted
>>>>>>> job still running on device A ? Because there is someone waiting to
>>>>>>> read write from the imported buffer on device B and he only waits 
>>>>>>> for
>>>>>>> the s_fence->finished of device B we signaled
>>>>>>> in drm_sched_entity_kill_jobs ?
>>>>>>
>>>>>> Exactly that, yes.
>>>>>>
>>>>>> In other words when you have a dependency chain like A->B->C then 
>>>>>> memory management only waits for C before freeing up the memory 
>>>>>> for example.
>>>>>>
>>>>>> When C now signaled because the device is hot-plugged before A or 
>>>>>> B are finished they are essentially accessing freed up memory.
>>>>>
>>>>> But didn't C imported the BO form B or A in this case ? Why would 
>>>>> he be
>>>>> the one releasing that memory ? He would be just dropping his 
>>>>> reference
>>>>> to the BO, no ?
>>>>
>>>> Well freeing the memory was just an example. The BO could also move 
>>>> back to VRAM because of the dropped reference.
>>>>
>>>>> Also in the general case,
>>>>> drm_sched_entity_fini->drm_sched_entity_kill_jobs which is
>>>>> the one who signals the 'C' fence with error code are as far
>>>>> as I looked called from when the user of that BO is stopping
>>>>> the usage anyway (e.g. drm_driver.postclose callback for when use
>>>>> process closes his device file) who would then access and corrupt
>>>>> the exported memory on device A where the job hasn't completed yet ?
>>>>
>>>> Key point is that memory management only waits for the last added 
>>>> fence, that is the design of the dma_resv object. How that happens 
>>>> is irrelevant.
>>>>
>>>> Because of this we at least need to wait for all dependencies of the 
>>>> job before signaling the fence, even if we cancel the job for some 
>>>> reason.
>>>>
>>>> Christian.
>>>
>>> Would this be the right way to do it ?
>>
>> Yes, it is at least a start. Question is if we can wait blocking here 
>> or not.
>>
>> We install a callback a bit lower to avoid blocking, so I'm pretty 
>> sure that won't work as expected.
>>
>> Christian.
> 
> I can't see why this would create problems, as long as the dependencies
> complete or force competed if they are from same device (extracted) but
> on a different ring then looks to me it should work. I will give it
> a try.
> 
> Andrey

Well, i gave it a try with my usual tests like IGT hot unplug while
rapid command submissions and unplug the card while glxgears runs
with DRI_PRIME=1 and haven't seen issues.

Andrey

> 
>>
>>>
>>> diff --git a/drivers/gpu/drm/scheduler/sched_entity.c 
>>> b/drivers/gpu/drm/scheduler/sched_entity.c
>>> index 2e93e881b65f..10f784874b63 100644
>>> --- a/drivers/gpu/drm/scheduler/sched_entity.c
>>> +++ b/drivers/gpu/drm/scheduler/sched_entity.c
>>> @@ -223,10 +223,14 @@ static void drm_sched_entity_kill_jobs(struct 
>>> drm_sched_entity *entity)
>>>  {
>>>         struct drm_sched_job *job;
>>>         int r;
>>> +       struct dma_fence *f;
>>>
>>>         while ((job = 
>>> to_drm_sched_job(spsc_queue_pop(&entity->job_queue)))) {
>>>                 struct drm_sched_fence *s_fence = job->s_fence;
>>>
>>> +               while (f = sched->ops->dependency(sched_job, entity))
>>> +                       dma_fence_wait(f);
>>> +
>>>                 drm_sched_fence_scheduled(s_fence);
>>>                 dma_fence_set_error(&s_fence->finished, -ESRCH);
>>>
>>> Andrey
>>>
>>>
>>>
>>>>
>>>>>
>>>>> Andrey
>>>>>
>>>>>>
>>>>>> Christian.
>>>>>>
>>>>>>>
>>>>>>> Andrey
>>>>>>>
>>>>>>>>>
>>>>>>>>>
>>>>>>>>> I am not sure this problem you describe above is related to 
>>>>>>>>> this patch.
>>>>>>>>
>>>>>>>> Well it is kind of related.
>>>>>>>>
>>>>>>>>> Here we purely expand the criteria for when sched_entity is
>>>>>>>>> considered idle in order to prevent a hang on device remove.
>>>>>>>>
>>>>>>>> And exactly that is problematic. See the jobs on the entity need 
>>>>>>>> to cleanly wait for their dependencies before they can be 
>>>>>>>> completed.
>>>>>>>>
>>>>>>>> drm_sched_entity_kill_jobs() is also not handling that correctly 
>>>>>>>> at the moment, we only wait for the last scheduled fence but not 
>>>>>>>> for the dependencies of the job.
>>>>>>>>
>>>>>>>>> Were you addressing the patch from yesterday in which you 
>>>>>>>>> commented
>>>>>>>>> that you found a problem with how we finish fences ? It was
>>>>>>>>> '[PATCH v7 12/16] drm/amdgpu: Fix hang on device removal.'
>>>>>>>>>
>>>>>>>>> Also, in the patch series as it is now we only signal HW fences 
>>>>>>>>> for the
>>>>>>>>> extracted device B, we are not touching any other fences. In 
>>>>>>>>> fact as you
>>>>>>>>> may remember, I dropped all new logic to forcing fence 
>>>>>>>>> completion in
>>>>>>>>> this patch series and only call 
>>>>>>>>> amdgpu_fence_driver_force_completion
>>>>>>>>> for the HW fences of the extracted device as it's done today 
>>>>>>>>> anyway.
>>>>>>>>
>>>>>>>> Signaling hardware fences is unproblematic since they are 
>>>>>>>> emitted when the software scheduling is already completed.
>>>>>>>>
>>>>>>>> Christian.
>>>>>>>>
>>>>>>>>>
>>>>>>>>> Andrey
>>>>>>>>>
>>>>>>>>>>
>>>>>>>>>> Not sure how to handle that case. One possibility would be to 
>>>>>>>>>> wait for all dependencies of unscheduled jobs before signaling 
>>>>>>>>>> their fences as canceled.
>>>>>>>>>>
>>>>>>>>>> Christian.
>>>>>>>>>>
>>>>>>>>>> Am 12.05.21 um 16:26 schrieb Andrey Grodzovsky:
>>>>>>>>>>> Problem: If scheduler is already stopped by the time 
>>>>>>>>>>> sched_entity
>>>>>>>>>>> is released and entity's job_queue not empty I encountred
>>>>>>>>>>> a hang in drm_sched_entity_flush. This is because 
>>>>>>>>>>> drm_sched_entity_is_idle
>>>>>>>>>>> never becomes false.
>>>>>>>>>>>
>>>>>>>>>>> Fix: In drm_sched_fini detach all sched_entities from the
>>>>>>>>>>> scheduler's run queues. This will satisfy 
>>>>>>>>>>> drm_sched_entity_is_idle.
>>>>>>>>>>> Also wakeup all those processes stuck in sched_entity flushing
>>>>>>>>>>> as the scheduler main thread which wakes them up is stopped 
>>>>>>>>>>> by now.
>>>>>>>>>>>
>>>>>>>>>>> v2:
>>>>>>>>>>> Reverse order of drm_sched_rq_remove_entity and marking
>>>>>>>>>>> s_entity as stopped to prevent reinserion back to rq due
>>>>>>>>>>> to race.
>>>>>>>>>>>
>>>>>>>>>>> v3:
>>>>>>>>>>> Drop drm_sched_rq_remove_entity, only modify entity->stopped
>>>>>>>>>>> and check for it in drm_sched_entity_is_idle
>>>>>>>>>>>
>>>>>>>>>>> Signed-off-by: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
>>>>>>>>>>> Reviewed-by: Christian König <christian.koenig@amd.com>
>>>>>>>>>>> ---
>>>>>>>>>>>   drivers/gpu/drm/scheduler/sched_entity.c |  3 ++-
>>>>>>>>>>>   drivers/gpu/drm/scheduler/sched_main.c   | 24 
>>>>>>>>>>> ++++++++++++++++++++++++
>>>>>>>>>>>   2 files changed, 26 insertions(+), 1 deletion(-)
>>>>>>>>>>>
>>>>>>>>>>> diff --git a/drivers/gpu/drm/scheduler/sched_entity.c 
>>>>>>>>>>> b/drivers/gpu/drm/scheduler/sched_entity.c
>>>>>>>>>>> index 0249c7450188..2e93e881b65f 100644
>>>>>>>>>>> --- a/drivers/gpu/drm/scheduler/sched_entity.c
>>>>>>>>>>> +++ b/drivers/gpu/drm/scheduler/sched_entity.c
>>>>>>>>>>> @@ -116,7 +116,8 @@ static bool 
>>>>>>>>>>> drm_sched_entity_is_idle(struct drm_sched_entity *entity)
>>>>>>>>>>>       rmb(); /* for list_empty to work without lock */
>>>>>>>>>>>       if (list_empty(&entity->list) ||
>>>>>>>>>>> - spsc_queue_count(&entity->job_queue) == 0)
>>>>>>>>>>> + spsc_queue_count(&entity->job_queue) == 0 ||
>>>>>>>>>>> +        entity->stopped)
>>>>>>>>>>>           return true;
>>>>>>>>>>>       return false;
>>>>>>>>>>> diff --git a/drivers/gpu/drm/scheduler/sched_main.c 
>>>>>>>>>>> b/drivers/gpu/drm/scheduler/sched_main.c
>>>>>>>>>>> index 8d1211e87101..a2a953693b45 100644
>>>>>>>>>>> --- a/drivers/gpu/drm/scheduler/sched_main.c
>>>>>>>>>>> +++ b/drivers/gpu/drm/scheduler/sched_main.c
>>>>>>>>>>> @@ -898,9 +898,33 @@ EXPORT_SYMBOL(drm_sched_init);
>>>>>>>>>>>    */
>>>>>>>>>>>   void drm_sched_fini(struct drm_gpu_scheduler *sched)
>>>>>>>>>>>   {
>>>>>>>>>>> +    struct drm_sched_entity *s_entity;
>>>>>>>>>>> +    int i;
>>>>>>>>>>> +
>>>>>>>>>>>       if (sched->thread)
>>>>>>>>>>>           kthread_stop(sched->thread);
>>>>>>>>>>> +    for (i = DRM_SCHED_PRIORITY_COUNT - 1; i >= 
>>>>>>>>>>> DRM_SCHED_PRIORITY_MIN; i--) {
>>>>>>>>>>> +        struct drm_sched_rq *rq = &sched->sched_rq[i];
>>>>>>>>>>> +
>>>>>>>>>>> +        if (!rq)
>>>>>>>>>>> +            continue;
>>>>>>>>>>> +
>>>>>>>>>>> +        spin_lock(&rq->lock);
>>>>>>>>>>> +        list_for_each_entry(s_entity, &rq->entities, list)
>>>>>>>>>>> +            /*
>>>>>>>>>>> +             * Prevents reinsertion and marks job_queue as 
>>>>>>>>>>> idle,
>>>>>>>>>>> +             * it will removed from rq in drm_sched_entity_fini
>>>>>>>>>>> +             * eventually
>>>>>>>>>>> +             */
>>>>>>>>>>> +            s_entity->stopped = true;
>>>>>>>>>>> +        spin_unlock(&rq->lock);
>>>>>>>>>>> +
>>>>>>>>>>> +    }
>>>>>>>>>>> +
>>>>>>>>>>> +    /* Wakeup everyone stuck in drm_sched_entity_flush for 
>>>>>>>>>>> this scheduler */
>>>>>>>>>>> +    wake_up_all(&sched->job_scheduled);
>>>>>>>>>>> +
>>>>>>>>>>>       /* Confirm no work left behind accessing device 
>>>>>>>>>>> structures */
>>>>>>>>>>> cancel_delayed_work_sync(&sched->work_tdr);
>>>>>>>>>>
>>>>>>>>
>>>>>>
>>>>
>>
