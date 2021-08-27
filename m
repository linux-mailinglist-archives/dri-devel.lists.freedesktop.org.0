Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BC033F9EFB
	for <lists+dri-devel@lfdr.de>; Fri, 27 Aug 2021 20:39:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 307F26E9A9;
	Fri, 27 Aug 2021 18:39:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 90695 seconds by postgrey-1.36 at gabe;
 Fri, 27 Aug 2021 18:39:22 UTC
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (unknown
 [40.107.94.82])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 967216E9A9;
 Fri, 27 Aug 2021 18:39:22 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Bds6dZeLDbkRR5BkrfbHP1xelNtifJKgK7vfEE6QyFkaw85m/vZSbfktMgEaO1TSPPL4t/y7zc96loe8jS01u3J6ppo4OO+jtvqnED1sMPU5GesL2UgBMSwg/23qYhmQ6xf3Q9GmdbbhfEHhnpLDTSK38fi6klf1QJ18pkwFG6Ga+9RwVxVv9BU8JZLc8SeobzuxieaJI+LODUEdpmps8S+Ui3eyCgVjMfidt438w1e3AZVqKlImhOm2ckRdvctRfV3lGfPhG1TGg0Bl2bl70Ki1/VH1JNeswe0xHqXTb0T9dFRGrFNOA77AUe6xkV3tKzZhBNiqh4yu1vRtgsxx1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OjA8W/HwF3Bv2TTkBe2Dq7ObLYGedzenSXZd/FFZ6TU=;
 b=exQcl6VdpeWMPDZRgDkKzTHoZVffAm1rwBJFpRfaYCZbM5SzohNoftzYIaswoyAE1JDW25nxZz9FxlpJzE0dYHVccSS4KmiDFmzHeccZbnW95R89hv7KKf8Zp8CWzkX6MWw/q+hdRG+Vjk7Avypkr91p2NyCE3DadOG7eh7c/kMaTcNhxyF4t0EkfZHIWz7JMonjnnJeOGrn5cUqMabSF1lxmRA2NwcjpicHTZmH0SDj57w3A2d9yZC3XzKR6uo6t4RzNR3u0logQzU3Df9+D0PBucQz+tPH8yIS2SXj3WwYuUL7GWIpkqFaSGeE67YA1F8Cp66EQlUPuUXBjlJrEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OjA8W/HwF3Bv2TTkBe2Dq7ObLYGedzenSXZd/FFZ6TU=;
 b=rJ0WzP27pxS3iLDcqo/PO1tmNC4L6SMLhTNWXodswTtmDq5/jmklzV8B/9oqkG6HlM4FF2B/DxGTji0Lzo2PuExn/xzTFv7RDvP5xJHOagy4S+98CroiYFok7C5vapLH4KLzraCab6bpZTEpMFTUvVnkXib0Sb0qPZLkKWO3dM4=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from SN6PR12MB4623.namprd12.prod.outlook.com (2603:10b6:805:e9::17)
 by SN6PR12MB2752.namprd12.prod.outlook.com (2603:10b6:805:78::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.20; Fri, 27 Aug
 2021 18:39:21 +0000
Received: from SN6PR12MB4623.namprd12.prod.outlook.com
 ([fe80::17c:7262:446:f400]) by SN6PR12MB4623.namprd12.prod.outlook.com
 ([fe80::17c:7262:446:f400%5]) with mapi id 15.20.4436.024; Fri, 27 Aug 2021
 18:39:21 +0000
Subject: Re: [PATCH] drm/sched: fix the bug of time out calculation(v3)
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>,
 "Liu, Monk" <Monk.Liu@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
References: <1629953731-14629-1-git-send-email-Monk.Liu@amd.com>
 <20419179-ee90-45aa-f4b8-b6bcb20a9c52@amd.com>
 <cc01416c-c04e-a716-f617-71351c1ad06a@amd.com>
 <BL1PR12MB5269AAC2FA518CF85724C85D84C89@BL1PR12MB5269.namprd12.prod.outlook.com>
 <257202a9-a670-5b89-f98d-01855b6e41cf@amd.com>
 <da180d36-b5dd-733e-3721-3333b0cf405e@gmail.com>
 <9bb9b448-ea93-e8f9-818e-c6d27d4a8264@amd.com>
 <8171ae25-72b6-7400-6969-61885ca5094b@amd.com>
From: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
Message-ID: <3ee9bdd2-c4d3-780f-ebd8-9910101817d4@amd.com>
Date: Fri, 27 Aug 2021 14:39:18 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <8171ae25-72b6-7400-6969-61885ca5094b@amd.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-ClientProxiedBy: YTBPR01CA0032.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:14::45) To SN6PR12MB4623.namprd12.prod.outlook.com
 (2603:10b6:805:e9::17)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2607:fea8:3edf:49b0:1441:7037:5b2:9692]
 (2607:fea8:3edf:49b0:1441:7037:5b2:9692) by
 YTBPR01CA0032.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:14::45) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4457.20 via Frontend Transport; Fri, 27 Aug 2021 18:39:20 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8c049b4b-e192-45f9-a80c-08d96989fbe4
X-MS-TrafficTypeDiagnostic: SN6PR12MB2752:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SN6PR12MB27523C71E12130B46A34A7DFEAC89@SN6PR12MB2752.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:330;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: LxyEtZ4+VNE0g2doppIzEyMI7LRT6q6IvwRHKgTSq2k03rZjLR86IkeJaeR7P5oIfoBfB8I95xyy4edGgHh3NgYz9O9wybX1LOjkF9MKmoRm94icuaagqT78io+X9ym2OBY5emTkEWbwDblZmdReaC6nQH8zJR0/fkai+A7e7f8G98Wd7uBTDnXFUWhacYorzE+VRnVUzCVg4r44r9YgpchIo2H5hBARrIt+mRDZ29HuJE3Ii37gFxSFRWZDUumt8lndSCEGdhzqZhzoViz2hOQJ1sFxF6bEAIonbEPWJrFEUoCvz3PiJrURrkpfI5Pvzb2oBDPIyXYLvzFOpOlnJZDyax8gzetToj/Vqw72U5vMMKIZITIZ0De+PPOzass97a5E+LG4Qxyv7VaU7haf0+dyJ/SNt5kx+CC4o+iJ5QgqNSxpwsyL3+UJ8vZHHtZwbO1fR7D9LDGUzfrCh8wtzZZi+jBEkjvBSAOdjdpysXJ2hh9rRf1LReFiRAl+d6puSM8noNLg9HtJznEn2+4enGKrH3ghvEtKuy0C5iij7onYGpLzmmoRDknzTfiTMYFMYfrq2LPFCQRMLlE/xvTz3TFiNWXu7Dqs6lh5ST4p9yTUz/2auETCjHgY2aSC9mj6t+BA/Fru6+dQvWlmUgn91Sp+bozLF2tbj6s4vPuVnGfEOZZvcUC5UhR/LAASJRO3aKbRufrdvkNV+dcmhHA1YN+iZYshsdbY265JeV6stDU=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR12MB4623.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(396003)(39860400002)(366004)(136003)(376002)(110136005)(86362001)(36756003)(2616005)(66946007)(8936002)(2906002)(316002)(4326008)(5660300002)(44832011)(66476007)(31696002)(66556008)(8676002)(38100700002)(66574015)(6486002)(31686004)(478600001)(186003)(53546011)(83380400001)(966005)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eU9DQmNaYW5wZTFwUmxrbmpEV3NUYWlFUXZ1Z1gzU21RR0dhMUNRenJwbGxY?=
 =?utf-8?B?OStMaEhxNnZxcDVja2QranBtNVdaMHc2V3NJempReU50ck1DSVFrR3p6alk4?=
 =?utf-8?B?NGxzT1R1UnpveVZnZlAzanY5ZjBXR3haZFplYStWQWFxcUduYkZmZkdqL2l2?=
 =?utf-8?B?bm16S1ZQSkZ1SmNMaEpmZUJLUzZCVzJtM2ZBTnUzTzhuZzlucStWRmdTZ2dI?=
 =?utf-8?B?L1hYRnR0YTI5NnBybGc4TmVyajgrT0d1bEZ4VFlkaERvaXBVbVQwcjJBYk5s?=
 =?utf-8?B?Sit1alZuVmtNOVBzdGN2YzFhZmc3aGkvMGhmeWNDS2N6aktPSU9INlllSjM3?=
 =?utf-8?B?ZVMybTQvd3hydVJHcFJkZE9UQ2FEL2t4OUI3djNSQ3kza3VrL3RXU2hlQWJF?=
 =?utf-8?B?UHFaWWIrdFdKOXN6SVFwWmNnVGtYSFRlMGJYV0FEMlU0YzRzNXhvV2hOeGVn?=
 =?utf-8?B?U3NIRTN4T1VNUDFpamlHUHArclR1VnlaWVVhTE5ZY3B4RFB0K3ZzdVpnUjUr?=
 =?utf-8?B?cER0THNHNjkwTjNsbVZuNW1ZQmJ1R0FuMVJ2TzZFWjZ1RjF5Sm5EVmpiaEdP?=
 =?utf-8?B?VEh6cURkdmcrK1FTWHZROVJPcWVNQmt0ZmdiaDhOdlQxdkd0cVB4ZkJ5T0do?=
 =?utf-8?B?dUhJeU5KWGxVV0NGWWJCaSs4TVRTMjkwaXNqYlNmWngxSkQ2dHBoc29OeC9O?=
 =?utf-8?B?aE5xT0pVNEZ5cnJBTHhuQmVRSjZ6YlFyZUxCNThOU0dSc2doS25WcEQ2c1Ar?=
 =?utf-8?B?c0ttRkJaaERTTEZ5d1RwRGtrOUIrZVRwSElvem1uL2xzTU9FTWtXMHUvTkR2?=
 =?utf-8?B?a05BOExYSVRqZjRkRlhmUHhWNXhmWVlPbFI2TWdDamFWd3FDZCtjL2NIZm9T?=
 =?utf-8?B?MnJMSnVHK0t0czB2TW5zc0VNOU9ERndqN21zUENZMFVScE81VjR3N0ZhUXBh?=
 =?utf-8?B?YnRua2JVTXFwdis0ZnVOMXZxSWx4eXl1S2JsQXRab3VOZUJBdnpvajIwOTZo?=
 =?utf-8?B?V0JjRTJEaXFMMHZrS1lwVnNGYm55ZmcvS2xoMEQ5Z2ZaMmtSdkJkKzI5UWNm?=
 =?utf-8?B?M3FsdS9ZSmdWUVlxbVp3aGJyck5JK3RtYjFGbXFvSzk2NXlrbmpsZGNtVGxk?=
 =?utf-8?B?U0ZqZUZiOVZFL0JUYTJZRC9BcTdNTndPK2UzOGo2ZHhoRFF0MXQ0OUc1SlVo?=
 =?utf-8?B?Nk0zbUNseGw4S0xQQmtuRFQySzJtbXJCakVob1U4SGl3Vmp3cVBuZDY5dlNZ?=
 =?utf-8?B?SkN3aXBLcEhoZFA0NUJKY3Fld3hncWNaZ1pZaE84TUFHRGtoNjB2eTBzRGZK?=
 =?utf-8?B?TEQ5YW9RZ0xnRHRzbWZLclhzc3N6TDJIYzM4cWd5LzVhazVSSjQ1Rkh3ejNW?=
 =?utf-8?B?and0SHBTSVN5V0pwcitvcU5HWUFMQm9neHpDSVBpL2NMOTcwOFZIUEcvRkhS?=
 =?utf-8?B?eDN4OWNBQ3JKc0Rkb0NnUGduaU53MlFNQ2d2L2dTbU50endMWTFKN2V6NVd6?=
 =?utf-8?B?RjE1MWZNQjFZYjRzbjdXeUxZWmNmamNtNVZKTzRwNmk5b1VLRXBFdHJMUGly?=
 =?utf-8?B?Z281STdQRjM0TGs5ZTBEbThNTUVub2JhVEx0Z05KSFBUWUM0Ti9pdHZuOTR1?=
 =?utf-8?B?c2FJUjV4d0htcVJBQkVRZVRzL1p5NlRGQmdOTGtwdFY2ZWxmY2JKMU5BSDIx?=
 =?utf-8?B?TmtRUWVIVGxLWDhkeWVoOTRKL1ZFRzFHaFBoaHVpSEZudWI0Z1l6QU1DRCtT?=
 =?utf-8?B?T29VRHRsaXlLaHRFaDRIK1VkaWhmaVpPN2tPMVp5VXI2SkNOSG5RWU42TVFC?=
 =?utf-8?B?cmpUUlBOaE5zU3FzZWFWai8wcVFWY3VrN2NLS1F6QkpnMWhpMW55R3hpMTVl?=
 =?utf-8?Q?fb8OCkwKw8IKN?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8c049b4b-e192-45f9-a80c-08d96989fbe4
X-MS-Exchange-CrossTenant-AuthSource: SN6PR12MB4623.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Aug 2021 18:39:20.8867 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zmjVVUaordMs5c5qIDdVOIolttonEUmFBlahklFHf+EysDoGRP/4+LXPhcbYt/sl1irYKVGkPdMpIXyRPfxpaw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR12MB2752
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

Sure then.

Andrey

On 2021-08-27 2:30 p.m., Christian König wrote:
> Yeah, that's what I meant with that the start of processing a job is a 
> bit swampy defined.
>
> Jobs overload, but we simply don't have another good indicator that a 
> job started except that the previous one completed.
>
> It's still better than starting the timer when pushing the job to the 
> ring buffer, because that is completely off.
>
> Christian.
>
> Am 27.08.21 um 20:22 schrieb Andrey Grodzovsky:
>> As I mentioned to Monk before - what about cases such as in this test 
>> - 
>> https://gitlab.freedesktop.org/mesa/drm/-/commit/bc21168fa924d3fc4a000492e861f50a1a135b25 
>>
>> Here you don't have serialized sequence where when jobs finishes 
>> processing and second starts, they execute together concurrently - 
>> for those cases seems
>> to me restarting the timer for the second job from scratch will let 
>> it hang much longer then allowed by TO value.
>>
>> Andrey
>>
>> On 2021-08-27 10:29 a.m., Christian König wrote:
>>> I don't think that makes sense.
>>>
>>> See we don't want to start the time when the job is inserted into 
>>> the ring buffer, but rather when it starts processing.
>>>
>>> Starting processing is a bit swampy defined, but just starting the 
>>> timer when the previous job completes should be fine enough.
>>>
>>> Christian.
>>>
>>> Am 27.08.21 um 15:57 schrieb Andrey Grodzovsky:
>>>> The TS represents the point in time when the job was inserted into 
>>>> the pending list.
>>>> I don't think it matters when it actually starts to be processed, 
>>>> what matters is when this job was inserted into pending list 
>>>> because right at that point you arm the TO timer (when no other is 
>>>> running already)
>>>> and so when the previous job completes and you cancel and rearm 
>>>> again you can use that TS from the next job in pending list to 
>>>> calculate how much time has actually left for it to run before TDR 
>>>> must be initiated
>>>> and not just give it again full TO value to run even if it has 
>>>> already been running for a while.
>>>>
>>>> Also, i am not sure also about the assumption that what we measure 
>>>> is processing by HW, what we measure is from the moment it was 
>>>> scheduled to ring to the moment the job completed (EOP event). At 
>>>> least that what our TDR timer measures and so it makes sense to set 
>>>> the TS at this point.
>>>>
>>>> Andrey
>>>>
>>>> On 2021-08-27 3:20 a.m., Liu, Monk wrote:
>>>>> [AMD Official Use Only]
>>>>>
>>>>> what is that 'ts' representing for ? it looks to me the jiffies 
>>>>> that it get scheduled to the ring,  but a job scheduled to the 
>>>>> ring doesn't represent it's being processed by hw.
>>>>>
>>>>> Thanks
>>>>>
>>>>> ------------------------------------------
>>>>> Monk Liu | Cloud-GPU Core team
>>>>> ------------------------------------------
>>>>>
>>>>> -----Original Message-----
>>>>> From: Grodzovsky, Andrey <Andrey.Grodzovsky@amd.com>
>>>>> Sent: Friday, August 27, 2021 4:14 AM
>>>>> To: Liu, Monk <Monk.Liu@amd.com>; amd-gfx@lists.freedesktop.org; 
>>>>> Koenig, Christian <Christian.Koenig@amd.com>
>>>>> Cc: dri-devel@lists.freedesktop.org
>>>>> Subject: Re: [PATCH] drm/sched: fix the bug of time out 
>>>>> calculation(v3)
>>>>>
>>>>> Attached quick patch for per job TTL calculation to make more 
>>>>> precises next timer expiration. It's on top of the patch in this 
>>>>> thread. Let me know if this makes sense.
>>>>>
>>>>> Andrey
>>>>>
>>>>> On 2021-08-26 10:03 a.m., Andrey Grodzovsky wrote:
>>>>>> On 2021-08-26 12:55 a.m., Monk Liu wrote:
>>>>>>> issue:
>>>>>>> in cleanup_job the cancle_delayed_work will cancel a TO timer even
>>>>>>> the its corresponding job is still running.
>>>>>>>
>>>>>>> fix:
>>>>>>> do not cancel the timer in cleanup_job, instead do the cancelling
>>>>>>> only when the heading job is signaled, and if there is a "next" job
>>>>>>> we start_timeout again.
>>>>>>>
>>>>>>> v2:
>>>>>>> further cleanup the logic, and do the TDR timer cancelling if the
>>>>>>> signaled job is the last one in its scheduler.
>>>>>>>
>>>>>>> v3:
>>>>>>> change the issue description
>>>>>>> remove the cancel_delayed_work in the begining of the cleanup_job
>>>>>>> recover the implement of drm_sched_job_begin.
>>>>>>>
>>>>>>> TODO:
>>>>>>> 1)introduce pause/resume scheduler in job_timeout to serial the
>>>>>>> handling of scheduler and job_timeout.
>>>>>>> 2)drop the bad job's del and insert in scheduler due to above
>>>>>>> serialization (no race issue anymore with the serialization)
>>>>>>>
>>>>>>> Signed-off-by: Monk Liu <Monk.Liu@amd.com>
>>>>>>> ---
>>>>>>>    drivers/gpu/drm/scheduler/sched_main.c | 25
>>>>>>> ++++++++++---------------
>>>>>>>    1 file changed, 10 insertions(+), 15 deletions(-)
>>>>>>>
>>>>>>> diff --git a/drivers/gpu/drm/scheduler/sched_main.c
>>>>>>> b/drivers/gpu/drm/scheduler/sched_main.c
>>>>>>> index a2a9536..ecf8140 100644
>>>>>>> --- a/drivers/gpu/drm/scheduler/sched_main.c
>>>>>>> +++ b/drivers/gpu/drm/scheduler/sched_main.c
>>>>>>> @@ -676,13 +676,7 @@ drm_sched_get_cleanup_job(struct
>>>>>>> drm_gpu_scheduler *sched)
>>>>>>>    {
>>>>>>>        struct drm_sched_job *job, *next;
>>>>>>>    -    /*
>>>>>>> -     * Don't destroy jobs while the timeout worker is running OR
>>>>>>> thread
>>>>>>> -     * is being parked and hence assumed to not touch pending_list
>>>>>>> -     */
>>>>>>> -    if ((sched->timeout != MAX_SCHEDULE_TIMEOUT &&
>>>>>>> - !cancel_delayed_work(&sched->work_tdr)) ||
>>>>>>> -        kthread_should_park())
>>>>>>> +    if (kthread_should_park())
>>>>>>>            return NULL;
>>>>>>
>>>>>> I actually don't see why we need to keep the above, on the other 
>>>>>> side
>>>>>> (in drm_sched_stop) we won't touch the pending list anyway until 
>>>>>> sched
>>>>>> thread came to full stop (kthread_park). If you do see a reason why
>>>>>> this needed then a comment should be here i think.
>>>>>>
>>>>>> Andrey
>>>>>>
>>>>>>
>>>>>>> spin_lock(&sched->job_list_lock);
>>>>>>> @@ -693,17 +687,21 @@ drm_sched_get_cleanup_job(struct
>>>>>>> drm_gpu_scheduler *sched)
>>>>>>>        if (job && dma_fence_is_signaled(&job->s_fence->finished)) {
>>>>>>>            /* remove job from pending_list */
>>>>>>>            list_del_init(&job->list);
>>>>>>> +
>>>>>>> +        /* cancel this job's TO timer */
>>>>>>> +        cancel_delayed_work(&sched->work_tdr);
>>>>>>>            /* make the scheduled timestamp more accurate */
>>>>>>>            next = list_first_entry_or_null(&sched->pending_list,
>>>>>>>                            typeof(*next), list);
>>>>>>> -        if (next)
>>>>>>> +
>>>>>>> +        if (next) {
>>>>>>> next->s_fence->scheduled.timestamp =
>>>>>>> job->s_fence->finished.timestamp;
>>>>>>> -
>>>>>>> +            /* start TO timer for next job */
>>>>>>> +            drm_sched_start_timeout(sched);
>>>>>>> +        }
>>>>>>>        } else {
>>>>>>>            job = NULL;
>>>>>>> -        /* queue timeout for next job */
>>>>>>> -        drm_sched_start_timeout(sched);
>>>>>>>        }
>>>>>>>          spin_unlock(&sched->job_list_lock);
>>>>>>> @@ -791,11 +789,8 @@ static int drm_sched_main(void *param)
>>>>>>>                          (entity = 
>>>>>>> drm_sched_select_entity(sched))) ||
>>>>>>>                         kthread_should_stop());
>>>>>>>    -        if (cleanup_job) {
>>>>>>> +        if (cleanup_job)
>>>>>>> sched->ops->free_job(cleanup_job);
>>>>>>> -            /* queue timeout for next job */
>>>>>>> -            drm_sched_start_timeout(sched);
>>>>>>> -        }
>>>>>>>              if (!entity)
>>>>>>>                continue;
>>>
>
