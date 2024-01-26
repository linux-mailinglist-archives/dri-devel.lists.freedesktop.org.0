Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A6E2C83D846
	for <lists+dri-devel@lfdr.de>; Fri, 26 Jan 2024 11:33:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 28C2210EF6A;
	Fri, 26 Jan 2024 10:33:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2062.outbound.protection.outlook.com [40.107.94.62])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E1A410EF6A;
 Fri, 26 Jan 2024 10:33:08 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cIrMFsFBqLP58DgaSVePr1trfniiAwfNkQwB2D4j4CPtAIZL0qTDu7W0rVLsGrA7AJXW4chTpaayqUQc4WK0KVvzkTpGZvPUic6nxt5zpYg5ngRV3t71T9BnQ5kmy9GHJ76ERTrPAoa+KGwW4OZNkeLnyG68Qg3XuqTyZCu/WPwMi5w9KGfNLEKSePy20VeGKrcAOd/Itm9WDf1r7cAi6tv9Be2H5WnHU/lGB3k42xVYKdYRw+kU22FrQXCHVrgl4eQ3HUIZxzgQA8lZzqLUkkayVtJ/yuDyVdFbQmugXCwDGs5nEDY7XahAtVwlKsqomj99r7Vo60TmHuOXmHv/Mg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XhBevypunalUQ7tpQcDeRjExTUY2gLCQy2rlWwmaJOw=;
 b=FodCDSUTxBpexC/qvmaoXlDS+oc7HlP3Nv1YMbwm2/AgWNG//XFOo4qek0a3p7ps1Y387A6xH/ZOHVZIqUcp17D5oYyWeD79hJdSv78GCJnxvpqI6CzIaz/KfdbZATKvofHqJ9uPcRmReZjgtYhQ07kSUJ0RIo3NM9WZ1hBeiS+lHyqJDNTg5Pf1J9OqzD6kOcO7ELvKlhmeoLMoMJXFIqoKxj/Wbbc+Po0munSw2HUYwBZz6jD/MxWTZP4Owu/qF/Hsq7iBrSnRwg/4TpulqSZDqmiwb3qpGt/1pUwGwN9ht3UnLPPh1pAWo248f4OMK02e/i7ZNzIKSd45KmuZJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XhBevypunalUQ7tpQcDeRjExTUY2gLCQy2rlWwmaJOw=;
 b=08HbYbXEBRNvHWimz8XxnM2XOOapjxGPJSYT8QVIgbc+miKhkvzOtLXOTw310Ur+F88ygSgfBUILV5wQktn+gO4jmOSyT9WU7ph6VCbRGLHkZXFiJ03ZsLuO5gdpwI6EshZ7fLMaI3gr86gc6CXg8ZzL3T1aT+flsnSj5GH8BQk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by SJ2PR12MB9114.namprd12.prod.outlook.com (2603:10b6:a03:567::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7228.22; Fri, 26 Jan
 2024 10:33:04 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::e1fb:4123:48b1:653]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::e1fb:4123:48b1:653%4]) with mapi id 15.20.7228.026; Fri, 26 Jan 2024
 10:33:04 +0000
Message-ID: <0bef4c76-924f-442f-af9c-d701e640db41@amd.com>
Date: Fri, 26 Jan 2024 11:32:57 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/sched: Drain all entities in DRM sched run job worker
Content-Language: en-US
To: Matthew Brost <matthew.brost@intel.com>
References: <20240124210811.1639040-1-matthew.brost@intel.com>
 <b94aca06-858e-4575-a4c4-40be8d8d4d35@amd.com>
 <ZbKaqdu5Y/WNwWVX@DUT025-TGLU.fm.intel.com>
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <ZbKaqdu5Y/WNwWVX@DUT025-TGLU.fm.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0228.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:e9::9) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|SJ2PR12MB9114:EE_
X-MS-Office365-Filtering-Correlation-Id: e1a8b936-75f4-4d99-8bb2-08dc1e5a2da0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: wTbT4FOYVVGr1g++ArFzFRRjGDNK0aC08vSAo8l4rfzs2n5XxiUPBN9CEdyaIiB5nhEwh6uDr0ffey2ls9BZikyrNblowPU1Yd8cyojSAxwaq0IR842ZRP0c8+nyI/f5zaeh0x3WxnWBCA+GGTBZBZ6Et5aHebKETg6ZT26gnEjswh20XUVDmj2uiR1LBf9sGRBpo9skb7Hwk4xPOIoSfCoJ9qxXbPLY+yX9x3/mhH2js3wQXrxiUfBV4XwBHP58a0Ee0Bf33InBf0k0HUNHN2aLJYtX3vyYqF8QGpI8doDgMw6GahAcLdWLAi3+TKevnV3NTR4s2wv6XlIA5EWqAJyzKiXt/FFmRWvmNlP8vqMPkrLusCbukLtvn1LxCjY+bI56IAjASV14/6RWzgfY2JgQ+0dzygOt/9zqjMbFcA1mp72tpNmCZrkZhgSvkSyb6npHzn0v/XHSRpHJUoPRLTht3AH87hQebVfsuAaJtBSdznwTAcT0ckPHVKI3RH1S28BwFkLkcIA3kyTFcCgYUT/gAFY4ZcMKCDaLtiZRzq+PHL4XVWgjMEJQUyrHP7gElHTnA06rsW6TFwQLbZfVzBC6+fJaN8boxIHuvMqKgzhvoP08y+tEAuF7PAbEFAEF
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(366004)(396003)(346002)(376002)(136003)(230922051799003)(186009)(451199024)(64100799003)(1800799012)(2906002)(5660300002)(36756003)(31696002)(41300700001)(86362001)(38100700002)(6916009)(2616005)(66946007)(478600001)(54906003)(66556008)(66476007)(316002)(66574015)(8676002)(8936002)(6512007)(26005)(31686004)(6486002)(6506007)(966005)(6666004)(83380400001)(4326008)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NFJVcXgwc094VGFoeW9CeXBXQi9WUjBMNFBHcFdaNHJqUkJYVUhJMktTeGtE?=
 =?utf-8?B?ejJESVNveUt3N0lkN0drM05EZlBQa2ptNXh6WVhvbkhDdzlFQlExZ2xWQ3dn?=
 =?utf-8?B?NWZYa3Eyd1RlMWM1SnRaNFg0U0FoWWZEOUIwWWpJT3AzcFE1cFBuUmZSWUht?=
 =?utf-8?B?ZjhjM2c4VmNiTm9TOVFlRlArUDhadlljRVBKMG1xUTM2MkFFakFJOWxlVzdl?=
 =?utf-8?B?SmNHRjkrclBHKzRSUnRzS2dPMnJEUnZBc3Z3ZGNJUFVzYkxMZjZaUzRycWhC?=
 =?utf-8?B?RmJGeVZmTWFOc29lOFdzemhPcC9ESEJvQkJkaWs0MG1zYmwvZW1yRjgybVBH?=
 =?utf-8?B?VVl4UTE5TU5zRXgveVhUZ3lFTUg4SU8rZkpZSEpHaVkraDE1bHpXU0N6UlBT?=
 =?utf-8?B?L3NUdWV0b3BYeVVtakp6ZjVJR01HTUoxYnpkNXo4RTFETEVLa3IrNUNvNElM?=
 =?utf-8?B?QXlkVjNwRFA1NVJIZ2lTbHB2eEI1Y25kUFhiRUhONVBxUWp6eFRNeVE3NmxP?=
 =?utf-8?B?UlpEWURTVDNENnEvcVI2Q2dCVWFFcmx0Lzl1NVhaVzBoNzhzc0ZOaG1OTGJL?=
 =?utf-8?B?NFFiMXJFOU9RZUcwb3RPeFJERytBVUVIcVdHdlFIYkthUEFhVFZhdmFTOXpk?=
 =?utf-8?B?bW1OUU45aTFyUjJ5VGRVa09Yb0FBY0M2SWtIRndpV0E3b01Pa0MyRktLaC80?=
 =?utf-8?B?dy9EbzN5SmdmVnRWVzlpc3FjL2VEVG8xRHpiNnFMbUsxYmtFS0JmdFdlbjEx?=
 =?utf-8?B?dk5oR2lEWmhYL0dETDd1ZnQ5SXRQMUE0Ujd4emhjRkNYZ0xyOWd1dnRCaC9h?=
 =?utf-8?B?VGtmbFBHZlAvbWxxSFZSTkdvVnV0THBsZXJxRW14ODBpRjJNMExHSXY2SVBM?=
 =?utf-8?B?WGNUOE90Z0l6VTlqT0ljZ1kwTzFOay9KL3ZhWkxNeUNlWUI5TSsxVFJnelhO?=
 =?utf-8?B?ckk1b1NKbHd5N1h0VEFaOFl0WGtGZWlYU0dNOWRPdEZjSVhZQ2ttMjNFRjFC?=
 =?utf-8?B?QzJzdDBQUTB5cDFBeFFpZktIUzZMSVg5SENYNmp6OWl1bjlIWFJxYzNWa1pR?=
 =?utf-8?B?YytyMTE5cWdzMDQvTzhhZHZiTHlSUmdpTmVMQjBUamtMUEhtVW1PRTdBODhJ?=
 =?utf-8?B?WGU1MVlBbnozeTVXNnFqWmZIZ2hOOVY1MGo2UzdJOXFRckNvRnA0a1h4TFBk?=
 =?utf-8?B?cW5aVVNxRGVaWDd4UjlpdjNNRTNkamFoaForWlVlZlVTSmU5bUNoQXpaM1FR?=
 =?utf-8?B?SlE2R3V0RXB5MjMxbUdqb0NYeEZUc0p5aisyT0tmb3BVRDN3SUpzTFJuc25k?=
 =?utf-8?B?MVFvZkd1UDdYdHI5WEpEb1VzNTkwdVpPUmUvYXdxdDhzRXBadFhJWHVyL09T?=
 =?utf-8?B?T0ZPVVFXWGhrSjZYR1kyVmtpdEFTSGpwMm1CSjZpcEs1MHRIc3JVVDVYQzNE?=
 =?utf-8?B?VVh5Z0hpSmx5WUU4QlNIRTZQeThVanVON1BKYTNxdTRuQmRtRndhSEw2cU5q?=
 =?utf-8?B?b1J2alorWHVmbzRWeDhxdkVQaGU2ZWJ2ZVVsVVE4UnlTc2V1a2xhSm1KQ3Fr?=
 =?utf-8?B?T0Mxa2xhdU1GVmN3VXFjaFpkY0U5c3o3cE1WZU9KN3NFUkd0Nk00ZXdRd2xo?=
 =?utf-8?B?eVdwMzFFWXpEYXBkQVlFOVloSzh2VEpTeWVXYUwxcktzZEk5T21ieE1SQlpX?=
 =?utf-8?B?UHJOelVOTXUySk8xd0VnNWFvd0VmMk1xSU51d21iYkV4RW8zM0hvVURaSVZC?=
 =?utf-8?B?dEIyaUd5T0NkY1Z3VGZqT3BkYk9SNzF2eTY3bmpxTEc2dWx0dWp6bkx4ZEp6?=
 =?utf-8?B?NVNFV0hwRldYQVoxcXBqNkFVS0NFUDJVYWNmMUdadHVNOUFISDBHc3ZSUEcr?=
 =?utf-8?B?dkh2Y29SOS9pdEpKbFp5TEpnL3p4dEJ3NW05ZWhqUHA0K3FlOXd6WWFKdGwr?=
 =?utf-8?B?QW0ramhqdmxnWTBNcCtQb05lMklpeG1FcEtBcG54SERKNVdSY25KNFlFa3Zx?=
 =?utf-8?B?Qm9sVW9kaXhBQ1J3OUJCKzl3VkNUZlFtWnByZlhsZFVDaVdqS1pwaFp2QkdE?=
 =?utf-8?B?Z0Vid2lKU0RGaW5qY2t6Qmh1YkJ6b0YxK2x5U2ZEaHhYazFPMFdhYVByTXNT?=
 =?utf-8?Q?s2giduqWO6KBAhm+j4vjplCkh?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e1a8b936-75f4-4d99-8bb2-08dc1e5a2da0
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jan 2024 10:33:04.2254 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qlHPl74UdhRp92JAi8V0LNToW4n8vOGanqP2LhdxQ0zWEsP/hO8PbqbGABbZy8b0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB9114
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
Cc: ltuikov89@gmail.com, dri-devel@lists.freedesktop.org,
 Thorsten Leemhuis <regressions@leemhuis.info>,
 Mario Limonciello <mario.limonciello@amd.com>, daniel@ffwll.ch,
 Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>, airlied@gmail.com,
 intel-xe@lists.freedesktop.org, Vlastimil Babka <vbabka@suse.cz>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 25.01.24 um 18:30 schrieb Matthew Brost:
> On Thu, Jan 25, 2024 at 04:12:58PM +0100, Christian König wrote:
>>
>> Am 24.01.24 um 22:08 schrieb Matthew Brost:
>>> All entities must be drained in the DRM scheduler run job worker to
>>> avoid the following case. An entity found that is ready, no job found
>>> ready on entity, and run job worker goes idle with other entities + jobs
>>> ready. Draining all ready entities (i.e. loop over all ready entities)
>>> in the run job worker ensures all job that are ready will be scheduled.
>> That doesn't make sense. drm_sched_select_entity() only returns entities
>> which are "ready", e.g. have a job to run.
>>
> That is what I thought too, hence my original design but it is not
> exactly true. Let me explain.
>
> drm_sched_select_entity() returns an entity with a non-empty spsc queue
> (job in queue) and no *current* waiting dependecies [1]. Dependecies for
> an entity can be added when drm_sched_entity_pop_job() is called [2][3]
> returning a NULL job. Thus we can get into a scenario where 2 entities
> A and B both have jobs and no current dependecies. A's job is waiting
> B's job, entity A gets selected first, a dependecy gets installed in
> drm_sched_entity_pop_job(), run work goes idle, and now we deadlock.

And here is the real problem. run work doesn't goes idle in that moment.

drm_sched_run_job_work() should restarts itself until there is either no 
more space in the ring buffer or it can't find a ready entity any more.

At least that was the original design when that was all still driven by 
a kthread.

It can perfectly be that we messed this up when switching from kthread 
to a work item.

Regards,
Christian.

>
> The proper solution is to loop over all ready entities until one with a
> job is found via drm_sched_entity_pop_job() and then requeue the run
> job worker. Or loop over all entities until drm_sched_select_entity()
> returns NULL and then let the run job worker go idle. This is what the
> old threaded design did too [4]. Hope this clears everything up.
>
> Matt
>
> [1] https://elixir.bootlin.com/linux/latest/source/drivers/gpu/drm/scheduler/sched_entity.c#L144
> [2] https://elixir.bootlin.com/linux/latest/source/drivers/gpu/drm/scheduler/sched_entity.c#L464
> [3] https://elixir.bootlin.com/linux/latest/source/drivers/gpu/drm/scheduler/sched_entity.c#L397
> [4] https://elixir.bootlin.com/linux/latest/source/drivers/gpu/drm/scheduler/sched_main.c#L1011
>
>> If that's not the case any more then you have broken something else.
>>
>> Regards,
>> Christian.
>>
>>> Cc: Thorsten Leemhuis <regressions@leemhuis.info>
>>> Reported-by: Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>
>>> Closes: https://lore.kernel.org/all/CABXGCsM2VLs489CH-vF-1539-s3in37=bwuOWtoeeE+q26zE+Q@mail.gmail.com/
>>> Reported-and-tested-by: Mario Limonciello <mario.limonciello@amd.com>
>>> Closes: https://gitlab.freedesktop.org/drm/amd/-/issues/3124
>>> Link: https://lore.kernel.org/all/20240123021155.2775-1-mario.limonciello@amd.com/
>>> Reported-by: Vlastimil Babka <vbabka@suse.cz>
>>> Closes: https://lore.kernel.org/dri-devel/05ddb2da-b182-4791-8ef7-82179fd159a8@amd.com/T/#m0c31d4d1b9ae9995bb880974c4f1dbaddc33a48a
>>> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
>>> ---
>>>    drivers/gpu/drm/scheduler/sched_main.c | 15 +++++++--------
>>>    1 file changed, 7 insertions(+), 8 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
>>> index 550492a7a031..85f082396d42 100644
>>> --- a/drivers/gpu/drm/scheduler/sched_main.c
>>> +++ b/drivers/gpu/drm/scheduler/sched_main.c
>>> @@ -1178,21 +1178,20 @@ static void drm_sched_run_job_work(struct work_struct *w)
>>>    	struct drm_sched_entity *entity;
>>>    	struct dma_fence *fence;
>>>    	struct drm_sched_fence *s_fence;
>>> -	struct drm_sched_job *sched_job;
>>> +	struct drm_sched_job *sched_job = NULL;
>>>    	int r;
>>>    	if (READ_ONCE(sched->pause_submit))
>>>    		return;
>>> -	entity = drm_sched_select_entity(sched);
>>> +	/* Find entity with a ready job */
>>> +	while (!sched_job && (entity = drm_sched_select_entity(sched))) {
>>> +		sched_job = drm_sched_entity_pop_job(entity);
>>> +		if (!sched_job)
>>> +			complete_all(&entity->entity_idle);
>>> +	}
>>>    	if (!entity)
>>> -		return;
>>> -
>>> -	sched_job = drm_sched_entity_pop_job(entity);
>>> -	if (!sched_job) {
>>> -		complete_all(&entity->entity_idle);
>>>    		return;	/* No more work */
>>> -	}
>>>    	s_fence = sched_job->s_fence;

