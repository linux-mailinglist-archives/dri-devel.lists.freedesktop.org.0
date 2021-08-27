Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 33B263F9F71
	for <lists+dri-devel@lfdr.de>; Fri, 27 Aug 2021 21:05:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC83E6E9B1;
	Fri, 27 Aug 2021 19:05:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2046.outbound.protection.outlook.com [40.107.236.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8734D6E9B1
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Aug 2021 19:05:21 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cCsCjJm2hQFwRx4MFRi+JNPalyWdY4lRctl0rRXSa8B7PwZwj7OD0Z7hrxW4zhuN82YctJK9b6vNmfbtPCRmN/1bb5BubIbmVdxr+wg1p6QThtENdiPdeoAz4rA4OOg/4btn/WPTq3Wrp7sKidv/jWD4i/z1lR98Py4l6DfgLQVgLT1mtaq9/QmMv1QYTlwMar63j1z4/9asiNxjzVjpp7lQhrP66L/DHI1Woyb8j5AUYH8PEBcoFOw9Fz+gaRwJ4wCnSHOaQ5y+2hg6DWfp1twqgo7BUqJNIGq4mNQl0TpRaOCYo9SKioKkcGL9yH6YoGiE7hl3S7rP2JDVHeK6VA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=t7J5C+mk11Pz0rqmxQkHYvJ9vzNo+y10gtKlw8rvfO0=;
 b=d5XOqvZARbSIIrNCetfXxw0VcMQpZKrvbFZOemiZ30Y7BJxi7T03uhg8POCpyiFrJN1ue0YyUAMmIrrYuC660yvk1oTTWBTk9wJIoqhekEqgw1PaYRfD5dGNf1qJb3UqZgZsHnb4VKJZdf9zmPSc7bF3fU73sXtNUazoJCeISBVxek8on0/GxPKwAoWvksX7unD7NJd17MyFS4nTfooUr1zHlSA2G4/cLwkMvZJDnXOGd/0QWyvT5AjJZtYgb/YchYYHppF7ZsZuGMvFUEDbpX8buV/LayAb78mRP90URdjvMYWNHgHJuX1yjRXTFsu9mrqwrHr69rP9FlEsX9YH8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=t7J5C+mk11Pz0rqmxQkHYvJ9vzNo+y10gtKlw8rvfO0=;
 b=w3hXhCSChAjsQjZSV4ZozK36Ul+5IOfmaQHPaXYmHg+6+69o4YRYjFnLKbc4G6lHV1RvZu23+zmnSzaS1b9rfwVr/u/m66OsfCCKImKtiD4l/MR3ECV4OIMXD7hf1kIRRNi+0igjgn+0X5SeJMetPTkkzb4grsmyCOYZBnKhQAM=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by MN2PR12MB4222.namprd12.prod.outlook.com (2603:10b6:208:19a::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.20; Fri, 27 Aug
 2021 18:30:37 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::dce2:96e5:aba2:66fe]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::dce2:96e5:aba2:66fe%6]) with mapi id 15.20.4457.023; Fri, 27 Aug 2021
 18:30:37 +0000
Subject: Re: [PATCH] drm/sched: fix the bug of time out calculation(v3)
To: Andrey Grodzovsky <andrey.grodzovsky@amd.com>,
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
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <8171ae25-72b6-7400-6969-61885ca5094b@amd.com>
Date: Fri, 27 Aug 2021 20:30:32 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <9bb9b448-ea93-e8f9-818e-c6d27d4a8264@amd.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-ClientProxiedBy: FR0P281CA0010.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:15::15) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:96c2:e7c8:bf07:141b]
 (2a02:908:1252:fb60:96c2:e7c8:bf07:141b) by
 FR0P281CA0010.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:15::15) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4478.10 via Frontend Transport; Fri, 27 Aug 2021 18:30:36 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1ed30de1-5dea-404d-fed9-08d96988c3eb
X-MS-TrafficTypeDiagnostic: MN2PR12MB4222:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MN2PR12MB4222DA1D28B3B233A6D32D9A83C89@MN2PR12MB4222.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:330;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: kNgYABCKTi+q5WbnAR1kBSLwgNY1FKQMVgEs5De5Bojv77OWJoqE/yL1NXvcJHPLxLmHyK8zRkrtQc2VuUcsnBNxI4D5oh0Rj66/lgLiFzQRIw4t7habI5runaMwbs9u35rJkYm7vmD2oulwJyevpZYK/RuzDC4Sju/ZtqBxq5sXeqwD+Ht0JtqBv2aPEoDy78usvulnU1d3G0Fnu92ZUnFqj7bdFRV+7IoAuDisIRLk8G//lL6Esd8Rch4up0KyohQAH4lgXFSoYP6u577qIZN7Mis8frF2EQEfuPCHzJzLZsYskvmyDVyvgpxoJrHbBKWG/w4lvjBJ0k9pwMT6ucuXY3v56mSOy3tAswoGz1Mo2EvTRmqBs/wgq6Dc4ezlwCIaaQ5sUVay2vnmrsGjzYu1UmmEYvVCQzHOrvMj7ad6XAjx4YaIXkSx2Ckf61aW5l2po5IVeCBee4cRHCn1dV+hZYzEEwdecWeViLJ+pN88ZaPeV51C5bouWE/FDkhHssN4dZoq+TkSJydkBEtdxtH1vuPHmUXQnemcwJrdrKkyW1RlTTsN/GFwm4HpOgY77lqiPhyz2Gyzq1b4H6xhmNJxMb7k5709L8wFipSiZraPx8NiJxiAjCtFm5cqidhkIL1dXNODI75SZL1DXuZ8mcAqlyAqLghD+fvYbkj8t4D/WBv05j6ef90AnwVbiTGBDC3C13b/eCkuKPj6+V0P/RoHfuzArunFPACyosxt7/0=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(136003)(376002)(39860400002)(346002)(366004)(6486002)(2906002)(6666004)(31696002)(8676002)(36756003)(110136005)(86362001)(66946007)(66476007)(5660300002)(186003)(83380400001)(31686004)(38100700002)(4326008)(8936002)(66574015)(53546011)(478600001)(2616005)(316002)(66556008)(966005)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YmVaUXFsWW54QlE5NHNNeGMyUFRMNUZ1elY3TzBKTnF6VlcwenpHdlhKMzJR?=
 =?utf-8?B?SDJxTEk4Q0ZXcUVWRURFeVJrU29nTXpGdlhRWWlzRzBzSW9Femd4azhIYTZ6?=
 =?utf-8?B?M1V2Y05RUm5DR3VpSmVHOXY3QmlhWmRYV3RMVGtCVENMdFhEdEI0VlZKbHFo?=
 =?utf-8?B?ek1tcXBYTWxZNVgrZlhRVTZ5OXQyY3ZVRDZPeDJ6QXVlcUk3SkJneDY4Tk5x?=
 =?utf-8?B?QXo0QnRDUy9EUkpSMm5HbWZOMjJ3Q0t6ckw2aERQTE1Ed0RqTmVPSGVIRW81?=
 =?utf-8?B?Lzl4Um5wd3JCYXRsNDAvalNCbVdrL09Ra3R3M1JBanB1cEd0VTlDUkIwNFlL?=
 =?utf-8?B?STlWZWo2K2x5aC82N3dkVTcwV0I1Mm9RNGh6d1ljYS9vSGhIZVlRWW1Kdm9B?=
 =?utf-8?B?dU9OT1NHRUxUcUlodkxTaWc2M3ZSWkU3NjhDV2VkdTFmeTRpM29SSWxBanp6?=
 =?utf-8?B?K3VnaFRFNENiSGRLZHQ4Rm5CYU4xaXo2RmxYdDVpOUlqeHRMZlo4VFI3UVpy?=
 =?utf-8?B?RytJSmo4WVJyaWx6UUY2U3F6OHBFN0lOZ1dlNlQ1UC96eGFTZ29MQ1FKM1M5?=
 =?utf-8?B?N2d5bmJxenc4TU55Y2svUnlKbjhtNlJMNHBlMzBYMTU2TktOa0x3UHhBWHFx?=
 =?utf-8?B?VHhJMXhoNkJUYjRXbGtXVkV1SmhMYWpENFMvUkk2SjBPRm1BbEJrT1EwUnh0?=
 =?utf-8?B?L2ZxaHRSaFZEVE1RcTBXaVRKbTl1akJ2RTAyNEYvNlFFS01HYkVINDhPR1ZN?=
 =?utf-8?B?WmpRd2oreUlyU3JwYm9pMERiRFdVTE5FYnEyR2l3QXdRdFhkWGZYZXU4RWll?=
 =?utf-8?B?QS9qVTl6UmQ3cmxMMGMyRFVSNTk4am9Ja0VSUlhIeUU5RkhVTi90MnZ2RCt2?=
 =?utf-8?B?d3QxU3RuK2VCOWJ0VFR0YXFXM2F1VHA4Rkh4c1ZJNmF5ei9MYkY3d0g4R3pY?=
 =?utf-8?B?TU93VGZSUDk4Qnhkam0wTjVRaVVjbElTSytodi9RcVE2Y1FBallxODZ2QSs4?=
 =?utf-8?B?a1JINk1oVDMrVEpnaGlQYi9mTXZzUHk1c3EzV0MvREg0UmpMT3Z3L2ZMNEly?=
 =?utf-8?B?cnNPc2YySEhhTU16RnUycUFlbjFva1pVZEh2SDFDSk84ejZlU29rTytUNEd2?=
 =?utf-8?B?YW1lRkFpYW9heklENmdSa0FibUIybk5SQW40QnVWcnplOXRUM0ttWGRSSDZu?=
 =?utf-8?B?bWVDNVlRMUxzVFJCMkdNMlNYRFlBRGVhc2xCVUVRU2pLTVo3UHlNSUg5NkNl?=
 =?utf-8?B?SUFOWFd3c2VxM0k5amtoT0Vjcjh4QndreWttVzZDM1dOczA4V0RoeDZVUENq?=
 =?utf-8?B?NlN4WWl0SW5NOWZ4UHhhWXIrVDJvT0VxbzhDOVhsUDNDVGpRWlByS2FpeTNq?=
 =?utf-8?B?VGFHMmtGWENmL2V5bkdzWi8rdE1oZTYxZVhlYmx1Sm5nZWJBOGd1UUd1bUxI?=
 =?utf-8?B?UDBxQXduVlpZK3dvWVVVUVF3QkIwT2dGY3YrQVB4ekhIQVdIbmhobVhNbW84?=
 =?utf-8?B?aFdMamlUQWx0WWpld3VSd01mRzhGS010bjZxeEJoWEJsT1pGaXlVRlZYQU8x?=
 =?utf-8?B?N1J5Ymh5TFJQWlpRaTVNR2xIKzc1UEc0NXVnbStXUnRwTnNmNlM0RVhCREhV?=
 =?utf-8?B?blZTenREV3lDL3hPMmtXMjJiRWJsMlpPL3dsakhIR0kwelNGWk9qMlZjVlNp?=
 =?utf-8?B?Z2hqaEovZTdzdWVJUmRSdlJqRFNFdDc0anM5SnhlMCtrbDYzNFpmZFdwSW4r?=
 =?utf-8?B?S2lqaGtPQ0dRejFZazN0L0thYVVSS1FEZ3M0b1BnRkxUZm9tdDY1a1RjYm93?=
 =?utf-8?B?RWZmUUh2b0hONS9VTE5TSVJBK1JvSXVFaG9UZDlrelp5Y0srcjhia3g1b1JH?=
 =?utf-8?Q?D0af56H8bPJar?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1ed30de1-5dea-404d-fed9-08d96988c3eb
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Aug 2021 18:30:37.4347 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: A7V5vozO0svMkIQxANn4tfeC+U5PNUR/AWugjOU27VUOp79yI9hz9534QervJhKh
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4222
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

Yeah, that's what I meant with that the start of processing a job is a 
bit swampy defined.

Jobs overload, but we simply don't have another good indicator that a 
job started except that the previous one completed.

It's still better than starting the timer when pushing the job to the 
ring buffer, because that is completely off.

Christian.

Am 27.08.21 um 20:22 schrieb Andrey Grodzovsky:
> As I mentioned to Monk before - what about cases such as in this test 
> - 
> https://gitlab.freedesktop.org/mesa/drm/-/commit/bc21168fa924d3fc4a000492e861f50a1a135b25 
>
> Here you don't have serialized sequence where when jobs finishes 
> processing and second starts, they execute together  concurrently - 
> for those cases seems
> to me restarting the timer for the second job from scratch will let it 
> hang much longer then allowed by TO value.
>
> Andrey
>
> On 2021-08-27 10:29 a.m., Christian König wrote:
>> I don't think that makes sense.
>>
>> See we don't want to start the time when the job is inserted into the 
>> ring buffer, but rather when it starts processing.
>>
>> Starting processing is a bit swampy defined, but just starting the 
>> timer when the previous job completes should be fine enough.
>>
>> Christian.
>>
>> Am 27.08.21 um 15:57 schrieb Andrey Grodzovsky:
>>> The TS represents the point in time when the job was inserted into 
>>> the pending list.
>>> I don't think it matters when it actually starts to be processed, 
>>> what matters is when this job was inserted into pending list because 
>>> right at that point you arm the TO timer (when no other is running 
>>> already)
>>> and so when the previous job completes and you cancel and rearm 
>>> again you can use that TS from the next job in pending list to 
>>> calculate how much time has actually left for it to run before TDR 
>>> must be initiated
>>> and not just give it again full TO value to run even if it has 
>>> already been running for a while.
>>>
>>> Also, i am not sure also about the assumption that what we measure 
>>> is processing by HW, what we measure is from the moment it was 
>>> scheduled to ring to the moment the job completed (EOP event). At 
>>> least that what our TDR timer measures and so it makes sense to set 
>>> the TS at this point.
>>>
>>> Andrey
>>>
>>> On 2021-08-27 3:20 a.m., Liu, Monk wrote:
>>>> [AMD Official Use Only]
>>>>
>>>> what is that 'ts' representing for ? it looks to me the jiffies 
>>>> that it get scheduled to the ring,  but a job scheduled to the ring 
>>>> doesn't represent it's being processed by hw.
>>>>
>>>> Thanks
>>>>
>>>> ------------------------------------------
>>>> Monk Liu | Cloud-GPU Core team
>>>> ------------------------------------------
>>>>
>>>> -----Original Message-----
>>>> From: Grodzovsky, Andrey <Andrey.Grodzovsky@amd.com>
>>>> Sent: Friday, August 27, 2021 4:14 AM
>>>> To: Liu, Monk <Monk.Liu@amd.com>; amd-gfx@lists.freedesktop.org; 
>>>> Koenig, Christian <Christian.Koenig@amd.com>
>>>> Cc: dri-devel@lists.freedesktop.org
>>>> Subject: Re: [PATCH] drm/sched: fix the bug of time out 
>>>> calculation(v3)
>>>>
>>>> Attached quick patch for per job TTL calculation to make more 
>>>> precises next timer expiration. It's on top of the patch in this 
>>>> thread. Let me know if this makes sense.
>>>>
>>>> Andrey
>>>>
>>>> On 2021-08-26 10:03 a.m., Andrey Grodzovsky wrote:
>>>>> On 2021-08-26 12:55 a.m., Monk Liu wrote:
>>>>>> issue:
>>>>>> in cleanup_job the cancle_delayed_work will cancel a TO timer even
>>>>>> the its corresponding job is still running.
>>>>>>
>>>>>> fix:
>>>>>> do not cancel the timer in cleanup_job, instead do the cancelling
>>>>>> only when the heading job is signaled, and if there is a "next" job
>>>>>> we start_timeout again.
>>>>>>
>>>>>> v2:
>>>>>> further cleanup the logic, and do the TDR timer cancelling if the
>>>>>> signaled job is the last one in its scheduler.
>>>>>>
>>>>>> v3:
>>>>>> change the issue description
>>>>>> remove the cancel_delayed_work in the begining of the cleanup_job
>>>>>> recover the implement of drm_sched_job_begin.
>>>>>>
>>>>>> TODO:
>>>>>> 1)introduce pause/resume scheduler in job_timeout to serial the
>>>>>> handling of scheduler and job_timeout.
>>>>>> 2)drop the bad job's del and insert in scheduler due to above
>>>>>> serialization (no race issue anymore with the serialization)
>>>>>>
>>>>>> Signed-off-by: Monk Liu <Monk.Liu@amd.com>
>>>>>> ---
>>>>>>    drivers/gpu/drm/scheduler/sched_main.c | 25
>>>>>> ++++++++++---------------
>>>>>>    1 file changed, 10 insertions(+), 15 deletions(-)
>>>>>>
>>>>>> diff --git a/drivers/gpu/drm/scheduler/sched_main.c
>>>>>> b/drivers/gpu/drm/scheduler/sched_main.c
>>>>>> index a2a9536..ecf8140 100644
>>>>>> --- a/drivers/gpu/drm/scheduler/sched_main.c
>>>>>> +++ b/drivers/gpu/drm/scheduler/sched_main.c
>>>>>> @@ -676,13 +676,7 @@ drm_sched_get_cleanup_job(struct
>>>>>> drm_gpu_scheduler *sched)
>>>>>>    {
>>>>>>        struct drm_sched_job *job, *next;
>>>>>>    -    /*
>>>>>> -     * Don't destroy jobs while the timeout worker is running OR
>>>>>> thread
>>>>>> -     * is being parked and hence assumed to not touch pending_list
>>>>>> -     */
>>>>>> -    if ((sched->timeout != MAX_SCHEDULE_TIMEOUT &&
>>>>>> -        !cancel_delayed_work(&sched->work_tdr)) ||
>>>>>> -        kthread_should_park())
>>>>>> +    if (kthread_should_park())
>>>>>>            return NULL;
>>>>>
>>>>> I actually don't see why we need to keep the above, on the other side
>>>>> (in drm_sched_stop) we won't touch the pending list anyway until 
>>>>> sched
>>>>> thread came to full stop (kthread_park). If you do see a reason why
>>>>> this needed then a comment should be here i think.
>>>>>
>>>>> Andrey
>>>>>
>>>>>
>>>>>> spin_lock(&sched->job_list_lock);
>>>>>> @@ -693,17 +687,21 @@ drm_sched_get_cleanup_job(struct
>>>>>> drm_gpu_scheduler *sched)
>>>>>>        if (job && dma_fence_is_signaled(&job->s_fence->finished)) {
>>>>>>            /* remove job from pending_list */
>>>>>>            list_del_init(&job->list);
>>>>>> +
>>>>>> +        /* cancel this job's TO timer */
>>>>>> +        cancel_delayed_work(&sched->work_tdr);
>>>>>>            /* make the scheduled timestamp more accurate */
>>>>>>            next = list_first_entry_or_null(&sched->pending_list,
>>>>>>                            typeof(*next), list);
>>>>>> -        if (next)
>>>>>> +
>>>>>> +        if (next) {
>>>>>>                next->s_fence->scheduled.timestamp =
>>>>>> job->s_fence->finished.timestamp;
>>>>>> -
>>>>>> +            /* start TO timer for next job */
>>>>>> +            drm_sched_start_timeout(sched);
>>>>>> +        }
>>>>>>        } else {
>>>>>>            job = NULL;
>>>>>> -        /* queue timeout for next job */
>>>>>> -        drm_sched_start_timeout(sched);
>>>>>>        }
>>>>>>          spin_unlock(&sched->job_list_lock);
>>>>>> @@ -791,11 +789,8 @@ static int drm_sched_main(void *param)
>>>>>>                          (entity = 
>>>>>> drm_sched_select_entity(sched))) ||
>>>>>>                         kthread_should_stop());
>>>>>>    -        if (cleanup_job) {
>>>>>> +        if (cleanup_job)
>>>>>>                sched->ops->free_job(cleanup_job);
>>>>>> -            /* queue timeout for next job */
>>>>>> -            drm_sched_start_timeout(sched);
>>>>>> -        }
>>>>>>              if (!entity)
>>>>>>                continue;
>>

