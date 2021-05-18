Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0930D387F56
	for <lists+dri-devel@lfdr.de>; Tue, 18 May 2021 20:13:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 823986EC65;
	Tue, 18 May 2021 18:13:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam08on2061.outbound.protection.outlook.com [40.107.102.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B255C6EC65;
 Tue, 18 May 2021 18:13:51 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=H9RvvZj5kXnEis37JAsyYhnXO3f6DeWRu2mAsHPtojFlrl52xubKyO2w6YmYjz1PmqAxBBdvFKlDK1oqZ6mLPskfZQJ2nWyziOdECFBTpw12JWLU0jjKDo6vXsIk36WI6AR9upLaE327H7RrieOuc63VVrsRn8hGXZxXvpvFQdQThb1fcV28oY7OBVlTSo0sj0/2vWeR5Bj3SFw8+bbTzFg44roIZ/cZu/kHlZRW0BOT3dt03BGDj3j4eQqAc0U+4X9aVMidsr32+3MAucVgtsWK8ZOUXGobDyNi8nHy/lLnw2QUUHEMdWnRhLp3mLtWPpqLgZuyMnjHZ4eCPmZb0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JFlrJ7AZKW+/px8ID9mqaFFw7cIfXeN4e7GWwWCjGTo=;
 b=YBBII7hhW81H2EAxkwLV/G42k4zkvsYmuVqUHeawaHDAjogpJrY1KcQxQEH1X8RDHaTwlOsTBR2gNHoxToCtxy269PmtStYtKl0pvxsYviAwo3tZVARKwresfYjlNKFlLk3Gx5su4q4p8CQ0XgibDxAhnBlNj3Jtb8xzUHyfQUcF41EdivJGkBXebZ13ewgcKBfqAULb6qtih0ivqBriw+QJ+Zz67UyyZBT7jVHfcZH72Q6uhv8CNo4V9IFrLfUcocwYeH8DshAzAh3w7uzKuEXG++1Fkn+rIhkS9tYUQkN3owyEaaenVFSn/H8r1es27KEHwWPaX5imgrVOtY1zBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JFlrJ7AZKW+/px8ID9mqaFFw7cIfXeN4e7GWwWCjGTo=;
 b=lrr/CTOSEhXpK4sS2DyMDL1cHjyFuwmnKB/OIr+ebWGzEUQu4vEsRFmngofWghswj1Abo6E5QDGlzoxj3isbLePLWsxAZsfDuBK1lWZ4fGLgadPwIP+G6kwUkTzK6H9WA8yG7eDlzg1nv3DlNCoQq/wOLNRWiy5aIGgoS4tGvD4=
Authentication-Results: amd.com; dkim=none (message not signed)
 header.d=none;amd.com; dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by BL0PR12MB2450.namprd12.prod.outlook.com (2603:10b6:207:4d::32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4129.25; Tue, 18 May
 2021 18:13:48 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::6d4d:4674:1cf6:8d34]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::6d4d:4674:1cf6:8d34%6]) with mapi id 15.20.4129.032; Tue, 18 May 2021
 18:13:48 +0000
Subject: Re: [PATCH v7 13/16] drm/scheduler: Fix hang when sched_entity
 released
To: Andrey Grodzovsky <andrey.grodzovsky@amd.com>,
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
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <31febf08-e9c9-77fa-932d-a50505866ec4@amd.com>
Date: Tue, 18 May 2021 20:13:43 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
In-Reply-To: <0b49fc7b-ca0b-58c4-3f76-c4a5fab97bdc@amd.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Originating-IP: [2a02:908:1252:fb60:88c7:d7d9:22ef:f850]
X-ClientProxiedBy: PR0P264CA0232.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:100:1e::28) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:88c7:d7d9:22ef:f850]
 (2a02:908:1252:fb60:88c7:d7d9:22ef:f850) by
 PR0P264CA0232.FRAP264.PROD.OUTLOOK.COM (2603:10a6:100:1e::28) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4108.25 via Frontend Transport; Tue, 18 May 2021 18:13:46 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 324f9861-13db-4bc6-fcef-08d91a28ae93
X-MS-TrafficTypeDiagnostic: BL0PR12MB2450:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BL0PR12MB2450210727C0FA2AF3DEC94E832C9@BL0PR12MB2450.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: PBg7p48ZCcyz3k5jpgN2aaeXoZOj9UA5oDBw/Q4uaNrijEaON4xYd9MqXSlY7g8z8vfUZLlpBw7xy0jXwGDZ6nx+T2fDHGXSBMHwTSWBJFur3PaFeNYAKZ0HQ1DHd9BzvLU4Cprd+SJnb7RhtEpiEDMKP3X1TgM+/EP9iDa+ffNHNSATE68XfEfPo+05pLrn4OXKytd8bI3AZuNOeWNuZbG5xOBrueS6plMPRZBqc2gfvIcAIwNMiQU5kAdeAEIHHdlkPTlVrhYSbH2XckpZwCnWy315dgSDQ3kZPKxo6IR1x3VE9mMvJNfj3RsAGMbLUs2TlFkcsbeGkzK0JPojfQpw9gD3lrkbu5zZakcYX4ViM5Ya1/kZyJQQc3n7gt0rXbocjUAGKmCr4KdQrsN4QsOPG/W4bkPrZlZH9UQcS03maEK+jkPCTgrbetaMzxPCCzhopjL0y4SAPkTt/7wH0rCe0fOeqtM3d8T4BsL2ZwA8JGqydYZyvmhOylOE2qfmfEEgN34663jWg+YReDjaU638oedILyW7v/PUeCoie29r864/lL6/qUMKqlhc5tgY3YoK5s/YlaFThu9VOFIA5obj8qOUdiwak786iMlM332Grb79zD7P505K4qB3r2zIvAWiIKi1ahMUB3KzQYlIWHiHz9q58F30QMNnhSKRY9ggu2LNlny4ZvZiNNVvl0qH
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(366004)(376002)(346002)(136003)(396003)(38100700002)(66574015)(31696002)(6636002)(83380400001)(53546011)(186003)(4326008)(8676002)(6666004)(86362001)(66946007)(31686004)(316002)(52116002)(2616005)(6486002)(8936002)(16526019)(5660300002)(66556008)(36756003)(66476007)(478600001)(2906002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?UkR2T3FDYzZMVkV0SWpyU21oOEZOYVQ2cDZMd2xKbHB1RVpNY3d6aERlYnEz?=
 =?utf-8?B?Y2VnaXFxTjJZY1Y3NzZlcGlmS2p0ak9pK2MxTk9IK0lXNzRUcTVxc2l5d2FE?=
 =?utf-8?B?c3NtaVd6empkYXMxWnFvNWJuQTVwTEtPak9DR1dZT2hUMTZ3dHowZjlNejNr?=
 =?utf-8?B?czlVdVZpcERzT3V6bUxObE1DTUQwdEN0UGlnbk90ZUQvT1BGOUxEQ1Y4Q2xG?=
 =?utf-8?B?MDV6V052UDllQVpmZi8wZWlHTG5pMUw4eTQyRGFCNkFIcEZuNUNzczN6cEs0?=
 =?utf-8?B?VVdBeGphOG5NSjdlRis0dVFsUE92OFVycUFGNU9tY0ZsY2Q3VmhWUXhkNmx1?=
 =?utf-8?B?cjFSb2ViN0w4RWo5M0xpbWR6SmduVGJZbmdGNjlUN0NDb2k5TmNQNXRFM1FV?=
 =?utf-8?B?Q3R5SVpsMWV2NEd1bVM5REdVUDJjQi9XbkZCS0JFam04WmQrRjJGLzc5RUNU?=
 =?utf-8?B?VnhCVVoybldsMDJ4aktXeTczc1VTeFdUTXN3Tm52RlFRenZ1cWxSN3NiS2RG?=
 =?utf-8?B?MzV2bWNjR1Q3UlI5VlhGRW9tK1hzNUkxZEJBNUF1bUJHT2U5T0pMZCtURGQv?=
 =?utf-8?B?QWVWUHZWb2YxSGRlT3dOeUR6MmxyVks0ZXZZMUc4anMzNHkzdlVKZDJOUnkv?=
 =?utf-8?B?YytFTDBWNTZWRk5jZ1NDM3B3RDFrWjYrYnFhbWwxell2MGV1bmZ6ckF1blhu?=
 =?utf-8?B?SUwrVy9FOThzQUlKWFJ5QkFOMVdBbVhIY3BVMnJzL21HVUUvQ2hNdWRMQ2to?=
 =?utf-8?B?aS8zTU5yczRJZFpoaUY1ZlduZlVGSFB2Y2xucWpJYVNvUDNMeFlvc1ZYZnB1?=
 =?utf-8?B?TDFCUHJ5RWh4M29Od1VqVFdsZUVnOGEzalVaK01oRis5WTY3NkU3aWFKbCtp?=
 =?utf-8?B?UUxzYmM3OVBHM3hydTNER1JBSmoyc080TEdJNlU1SkhDTGRPVWdCekdHazFV?=
 =?utf-8?B?enZHTkZra293dEJrVDlwdXZkLzVvM25neGlEWW1nUlJDTmNrdWo2VU9QaE13?=
 =?utf-8?B?bnVZbllqS1pqK204UlJSL0xHMnRSbW4vNHNkNVBWdDFkTDdiS2Q3a1Z5RS9y?=
 =?utf-8?B?Tnk4NndsMFBHYlFDek9HZkF3UFJTQzFkN0FBTitNU1IzY1VreHltc2RaanJt?=
 =?utf-8?B?R0IyNWx2QndPUFh3UitlaTlpZDVnRXdQMU1Oc2tTeHc3YVBrQTNaQ0krU1ly?=
 =?utf-8?B?THZXaXpMUHdDMnFhS1M3T2k5N3dCM0E4SGhYQ1cybUJXcytWa2NVMVlHZzd2?=
 =?utf-8?B?M1k4UGZQV1pHdzBjYTMvVDdiSXNOSVUwaVJ4Zi9vS21nWlBlSHFSelJ1Qzhu?=
 =?utf-8?B?NkxqNUlIcVRTclhhcmhsUjg4QTJBVWtEVXFkY2lhb3dFbE10akMrQjhRS3hV?=
 =?utf-8?B?NEZFenlZZ3dIZGZQb0tiazdZbUZvMUxBTThpV3lieUhTamZvaURKSHNFakZM?=
 =?utf-8?B?TkZ3aGZKeEFCTEZWSVRaMERydDhqNm5YZm5TQy9EMVUyZVA0ekJCMFl1amdu?=
 =?utf-8?B?Rko4UUxvK0hMM205RG5CUUNqWHdRK05aRjJGYzBhYmVMNzQ5TjFrbEtaaWZY?=
 =?utf-8?B?U3JRVTFpNmlmeXVqY0FNaE95YVNHUElBNVExYVlDbnNUWFIzdDV6dmJMVWht?=
 =?utf-8?B?S1lYMzRjVVpTcUF3MHZ1OXpUY2huUkZ6SExnZGJlTmxhMmtNekh3MytTYXpk?=
 =?utf-8?B?U2FhN1R6RlFTRklsNW8ySnBSQW9YM0J6YmJER0NpRUQvaURBcjEwZkt2SEpt?=
 =?utf-8?B?TjNDd3BwL1VNamxQQWx5ZXZaczN0dzBmL1JvcC8zUzdETEF3YitqVVVpc2Na?=
 =?utf-8?B?OHV1UXg4WVFJbHlMRFBnYU8zNWxHK0w3cXcxU05ycmRoVE9SbVFvVkk1Q2pi?=
 =?utf-8?Q?PT95X84u2dezz?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 324f9861-13db-4bc6-fcef-08d91a28ae93
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 May 2021 18:13:48.1352 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WAdEpfKFksvnvkaszIG4Qkqq+DyN0wug3wpAVUAI/eaydf/mDFIpH7Gvlp0+WgpP
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB2450
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
Cc: Alexander.Deucher@amd.com, gregkh@linuxfoundation.org, helgaas@kernel.org,
 Felix.Kuehling@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


Am 18.05.21 um 20:09 schrieb Andrey Grodzovsky:
> On 2021-05-18 2:02 p.m., Christian König wrote:
>> Am 18.05.21 um 19:43 schrieb Andrey Grodzovsky:
>>> On 2021-05-18 12:33 p.m., Christian König wrote:
>>>> Am 18.05.21 um 18:17 schrieb Andrey Grodzovsky:
>>>>>
>>>>>
>>>>> On 2021-05-18 11:15 a.m., Christian König wrote:
>>>>>> Am 18.05.21 um 17:03 schrieb Andrey Grodzovsky:
>>>>>>>
>>>>>>> On 2021-05-18 10:07 a.m., Christian König wrote:
>>>>>>>> In a separate discussion with Daniel we once more iterated over 
>>>>>>>> the dma_resv requirements and I came to the conclusion that 
>>>>>>>> this approach here won't work reliable.
>>>>>>>>
>>>>>>>> The problem is as following:
>>>>>>>> 1. device A schedules some rendering with into a buffer and 
>>>>>>>> exports it as DMA-buf.
>>>>>>>> 2. device B imports the DMA-buf and wants to consume the 
>>>>>>>> rendering, for the the fence of device A is replaced with a new 
>>>>>>>> operation.
>>>>>>>> 3. device B is hot plugged and the new operation canceled/newer 
>>>>>>>> scheduled.
>>>>>>>>
>>>>>>>> The problem is now that we can't do this since the operation of 
>>>>>>>> device A is still running and by signaling our fences we run 
>>>>>>>> into the problem of potential memory corruption.
>>>>>
>>>>> By signaling s_fence->finished of the canceled operation from the
>>>>> removed device B we in fact cause memory corruption for the 
>>>>> uncompleted
>>>>> job still running on device A ? Because there is someone waiting to
>>>>> read write from the imported buffer on device B and he only waits for
>>>>> the s_fence->finished of device B we signaled
>>>>> in drm_sched_entity_kill_jobs ?
>>>>
>>>> Exactly that, yes.
>>>>
>>>> In other words when you have a dependency chain like A->B->C then 
>>>> memory management only waits for C before freeing up the memory for 
>>>> example.
>>>>
>>>> When C now signaled because the device is hot-plugged before A or B 
>>>> are finished they are essentially accessing freed up memory.
>>>
>>> But didn't C imported the BO form B or A in this case ? Why would he be
>>> the one releasing that memory ? He would be just dropping his reference
>>> to the BO, no ?
>>
>> Well freeing the memory was just an example. The BO could also move 
>> back to VRAM because of the dropped reference.
>>
>>> Also in the general case,
>>> drm_sched_entity_fini->drm_sched_entity_kill_jobs which is
>>> the one who signals the 'C' fence with error code are as far
>>> as I looked called from when the user of that BO is stopping
>>> the usage anyway (e.g. drm_driver.postclose callback for when use
>>> process closes his device file) who would then access and corrupt
>>> the exported memory on device A where the job hasn't completed yet ?
>>
>> Key point is that memory management only waits for the last added 
>> fence, that is the design of the dma_resv object. How that happens is 
>> irrelevant.
>>
>> Because of this we at least need to wait for all dependencies of the 
>> job before signaling the fence, even if we cancel the job for some 
>> reason.
>>
>> Christian.
>
> Would this be the right way to do it ?

Yes, it is at least a start. Question is if we can wait blocking here or 
not.

We install a callback a bit lower to avoid blocking, so I'm pretty sure 
that won't work as expected.

Christian.

>
> diff --git a/drivers/gpu/drm/scheduler/sched_entity.c 
> b/drivers/gpu/drm/scheduler/sched_entity.c
> index 2e93e881b65f..10f784874b63 100644
> --- a/drivers/gpu/drm/scheduler/sched_entity.c
> +++ b/drivers/gpu/drm/scheduler/sched_entity.c
> @@ -223,10 +223,14 @@ static void drm_sched_entity_kill_jobs(struct 
> drm_sched_entity *entity)
>  {
>         struct drm_sched_job *job;
>         int r;
> +       struct dma_fence *f;
>
>         while ((job = 
> to_drm_sched_job(spsc_queue_pop(&entity->job_queue)))) {
>                 struct drm_sched_fence *s_fence = job->s_fence;
>
> +               while (f = sched->ops->dependency(sched_job, entity))
> +                       dma_fence_wait(f);
> +
>                 drm_sched_fence_scheduled(s_fence);
>                 dma_fence_set_error(&s_fence->finished, -ESRCH);
>
> Andrey
>
>
>
>>
>>>
>>> Andrey
>>>
>>>>
>>>> Christian.
>>>>
>>>>>
>>>>> Andrey
>>>>>
>>>>>>>
>>>>>>>
>>>>>>> I am not sure this problem you describe above is related to this 
>>>>>>> patch.
>>>>>>
>>>>>> Well it is kind of related.
>>>>>>
>>>>>>> Here we purely expand the criteria for when sched_entity is
>>>>>>> considered idle in order to prevent a hang on device remove.
>>>>>>
>>>>>> And exactly that is problematic. See the jobs on the entity need 
>>>>>> to cleanly wait for their dependencies before they can be completed.
>>>>>>
>>>>>> drm_sched_entity_kill_jobs() is also not handling that correctly 
>>>>>> at the moment, we only wait for the last scheduled fence but not 
>>>>>> for the dependencies of the job.
>>>>>>
>>>>>>> Were you addressing the patch from yesterday in which you commented
>>>>>>> that you found a problem with how we finish fences ? It was
>>>>>>> '[PATCH v7 12/16] drm/amdgpu: Fix hang on device removal.'
>>>>>>>
>>>>>>> Also, in the patch series as it is now we only signal HW fences 
>>>>>>> for the
>>>>>>> extracted device B, we are not touching any other fences. In 
>>>>>>> fact as you
>>>>>>> may remember, I dropped all new logic to forcing fence 
>>>>>>> completion in
>>>>>>> this patch series and only call 
>>>>>>> amdgpu_fence_driver_force_completion
>>>>>>> for the HW fences of the extracted device as it's done today 
>>>>>>> anyway.
>>>>>>
>>>>>> Signaling hardware fences is unproblematic since they are emitted 
>>>>>> when the software scheduling is already completed.
>>>>>>
>>>>>> Christian.
>>>>>>
>>>>>>>
>>>>>>> Andrey
>>>>>>>
>>>>>>>>
>>>>>>>> Not sure how to handle that case. One possibility would be to 
>>>>>>>> wait for all dependencies of unscheduled jobs before signaling 
>>>>>>>> their fences as canceled.
>>>>>>>>
>>>>>>>> Christian.
>>>>>>>>
>>>>>>>> Am 12.05.21 um 16:26 schrieb Andrey Grodzovsky:
>>>>>>>>> Problem: If scheduler is already stopped by the time sched_entity
>>>>>>>>> is released and entity's job_queue not empty I encountred
>>>>>>>>> a hang in drm_sched_entity_flush. This is because 
>>>>>>>>> drm_sched_entity_is_idle
>>>>>>>>> never becomes false.
>>>>>>>>>
>>>>>>>>> Fix: In drm_sched_fini detach all sched_entities from the
>>>>>>>>> scheduler's run queues. This will satisfy 
>>>>>>>>> drm_sched_entity_is_idle.
>>>>>>>>> Also wakeup all those processes stuck in sched_entity flushing
>>>>>>>>> as the scheduler main thread which wakes them up is stopped by 
>>>>>>>>> now.
>>>>>>>>>
>>>>>>>>> v2:
>>>>>>>>> Reverse order of drm_sched_rq_remove_entity and marking
>>>>>>>>> s_entity as stopped to prevent reinserion back to rq due
>>>>>>>>> to race.
>>>>>>>>>
>>>>>>>>> v3:
>>>>>>>>> Drop drm_sched_rq_remove_entity, only modify entity->stopped
>>>>>>>>> and check for it in drm_sched_entity_is_idle
>>>>>>>>>
>>>>>>>>> Signed-off-by: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
>>>>>>>>> Reviewed-by: Christian König <christian.koenig@amd.com>
>>>>>>>>> ---
>>>>>>>>>   drivers/gpu/drm/scheduler/sched_entity.c |  3 ++-
>>>>>>>>>   drivers/gpu/drm/scheduler/sched_main.c   | 24 
>>>>>>>>> ++++++++++++++++++++++++
>>>>>>>>>   2 files changed, 26 insertions(+), 1 deletion(-)
>>>>>>>>>
>>>>>>>>> diff --git a/drivers/gpu/drm/scheduler/sched_entity.c 
>>>>>>>>> b/drivers/gpu/drm/scheduler/sched_entity.c
>>>>>>>>> index 0249c7450188..2e93e881b65f 100644
>>>>>>>>> --- a/drivers/gpu/drm/scheduler/sched_entity.c
>>>>>>>>> +++ b/drivers/gpu/drm/scheduler/sched_entity.c
>>>>>>>>> @@ -116,7 +116,8 @@ static bool 
>>>>>>>>> drm_sched_entity_is_idle(struct drm_sched_entity *entity)
>>>>>>>>>       rmb(); /* for list_empty to work without lock */
>>>>>>>>>       if (list_empty(&entity->list) ||
>>>>>>>>> - spsc_queue_count(&entity->job_queue) == 0)
>>>>>>>>> + spsc_queue_count(&entity->job_queue) == 0 ||
>>>>>>>>> +        entity->stopped)
>>>>>>>>>           return true;
>>>>>>>>>       return false;
>>>>>>>>> diff --git a/drivers/gpu/drm/scheduler/sched_main.c 
>>>>>>>>> b/drivers/gpu/drm/scheduler/sched_main.c
>>>>>>>>> index 8d1211e87101..a2a953693b45 100644
>>>>>>>>> --- a/drivers/gpu/drm/scheduler/sched_main.c
>>>>>>>>> +++ b/drivers/gpu/drm/scheduler/sched_main.c
>>>>>>>>> @@ -898,9 +898,33 @@ EXPORT_SYMBOL(drm_sched_init);
>>>>>>>>>    */
>>>>>>>>>   void drm_sched_fini(struct drm_gpu_scheduler *sched)
>>>>>>>>>   {
>>>>>>>>> +    struct drm_sched_entity *s_entity;
>>>>>>>>> +    int i;
>>>>>>>>> +
>>>>>>>>>       if (sched->thread)
>>>>>>>>>           kthread_stop(sched->thread);
>>>>>>>>> +    for (i = DRM_SCHED_PRIORITY_COUNT - 1; i >= 
>>>>>>>>> DRM_SCHED_PRIORITY_MIN; i--) {
>>>>>>>>> +        struct drm_sched_rq *rq = &sched->sched_rq[i];
>>>>>>>>> +
>>>>>>>>> +        if (!rq)
>>>>>>>>> +            continue;
>>>>>>>>> +
>>>>>>>>> +        spin_lock(&rq->lock);
>>>>>>>>> +        list_for_each_entry(s_entity, &rq->entities, list)
>>>>>>>>> +            /*
>>>>>>>>> +             * Prevents reinsertion and marks job_queue as idle,
>>>>>>>>> +             * it will removed from rq in drm_sched_entity_fini
>>>>>>>>> +             * eventually
>>>>>>>>> +             */
>>>>>>>>> +            s_entity->stopped = true;
>>>>>>>>> +        spin_unlock(&rq->lock);
>>>>>>>>> +
>>>>>>>>> +    }
>>>>>>>>> +
>>>>>>>>> +    /* Wakeup everyone stuck in drm_sched_entity_flush for 
>>>>>>>>> this scheduler */
>>>>>>>>> +    wake_up_all(&sched->job_scheduled);
>>>>>>>>> +
>>>>>>>>>       /* Confirm no work left behind accessing device 
>>>>>>>>> structures */
>>>>>>>>> cancel_delayed_work_sync(&sched->work_tdr);
>>>>>>>>
>>>>>>
>>>>
>>

