Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C924F83FF35
	for <lists+dri-devel@lfdr.de>; Mon, 29 Jan 2024 08:45:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7EE5A10F62F;
	Mon, 29 Jan 2024 07:45:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2062.outbound.protection.outlook.com [40.107.223.62])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8327810F5D6;
 Mon, 29 Jan 2024 07:45:11 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fUiRqLawyEdW9Q+qQhcZSHV3hJtD//CwvH/67jGkRNWQfAFENtiOYmnStuj0JkxyEPpUYiVrlDisBNmHkF1jFyhh6HAMCt8xFLOi6MBkSrUZKT5q/vu9HGEgry0ohxLaEE7IeR1oZ4QMcj1FUMeEdISBGSYt4kDfiL90G/GL+w/d+RSQVUVXBZ2AvGMMVv/NUeNaTHjHjC3OKvpBITntkZo1zjHkSpjyWDB/5m1mUr7TdMyh05uk4/ZsrSybLAPHr5GCppXAuRMLP5ZryCMMsNQZ9kZ/qVPBo7g4urE3cKYM78Y+65lMHvrhuITQSZ2ImYQhWaX97ZA1lqdPD59Oag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2hMVrfvJlVW3h9hflw35gJW3XlEJO1BOyVOnqcDrRl8=;
 b=jxu3ChxkvPSvTmI2uHrolhflCtZogPkZIyjnMfqPIM9B5xzQq5Kh+/1+UsXS0oPNm/UK1/pyK3VOzh1Qh2cX/1zq7qArX37dsDhwrUFWLU4QZ8Oa6uJ83jIUIhy3xe7n8d/dJJsxIKDY3rBUgMH7ImPmPXmi0NpUMB8Nr6N2aorenbhy/FP1BAOssDu6ppyudlW3iTl19JVCi7hHSSsZxPf3mBSdfpaPv6y+wgkP5qCy8rf4G6Ku8yGUcNQvnmRTBSR5onhH0M3o9HtlyMrretKKznYl8KInPYP0ZYUjOtwEUORV7fpekc0oVtVoWJzHc7Rs03xGGaS9lj9ugF6vxA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2hMVrfvJlVW3h9hflw35gJW3XlEJO1BOyVOnqcDrRl8=;
 b=Sbbbc/n48KO7oskIX4UtuQg4aVy7cYZ/x+ZKPnBYyd/8Z8kNHExeVxWtz4dCuSVVMinj2zd6USAuX5rFg8hJsd1O+5RDb8iOMvTcZ6aF44CWpGY/Q/vVliMEk3UGX4FWhvuN0pz4NLGiDY2BH/rVmQcGA9Bo5VmiMafc1TDCOUA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by DS0PR12MB8414.namprd12.prod.outlook.com (2603:10b6:8:fb::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7228.31; Mon, 29 Jan 2024 07:45:04 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::e1fb:4123:48b1:653]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::e1fb:4123:48b1:653%4]) with mapi id 15.20.7228.029; Mon, 29 Jan 2024
 07:45:04 +0000
Message-ID: <79a8fe04-66a3-406d-981a-06e40b386d99@amd.com>
Date: Mon, 29 Jan 2024 08:44:59 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/sched: Drain all entities in DRM sched run job worker
Content-Language: en-US
To: Matthew Brost <matthew.brost@intel.com>
References: <20240124210811.1639040-1-matthew.brost@intel.com>
 <b94aca06-858e-4575-a4c4-40be8d8d4d35@amd.com>
 <ZbKaqdu5Y/WNwWVX@DUT025-TGLU.fm.intel.com>
 <0bef4c76-924f-442f-af9c-d701e640db41@amd.com>
 <ZbPd590k4s5z1/a9@DUT025-TGLU.fm.intel.com>
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <ZbPd590k4s5z1/a9@DUT025-TGLU.fm.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0153.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a2::11) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|DS0PR12MB8414:EE_
X-MS-Office365-Filtering-Correlation-Id: 9c804436-7072-4f36-c8db-08dc209e34d9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: r6Nc6IFf1n1VZPIwcdyDzhxADE32XAWUIwlhOLpAwkRmWSCI1wPqwWVLSAFVn+XQ7lTzgHUHeHVjbKd7VM45usZA0AwOX7d457nCaWcp/p/1vL5qFA+BS8ZJbMhEDyVJv+ddVnpcWX52AjoWlj16Y+AHI5gbJfEeaMrMuNIec+iTJ1L0LnAQh2Jrxvp+qjTnaeQ7ys3vgZ3r9i9QLJNK1qQCn7/YWbLmm12DKTWsjAxIcArPjnePV312IoINfcmNdXXUTx4+nKVKTP9w++EugXUAuclmSyNE8POh5PRn6IxiA4r2eYIclpBUIunG7nb0jUbLuq42QDZLFERuemDOLOvzlUjLnFdxtOT8hQ3xp7b93vaOZZkrKnNS00e9BbB5AoTtIjlYdJEi5yZNHR0APVOgm+CYHu56bcfySNq9vqBuaXLQyrQHaYrBFs07TFddGiQ/pUUj9r+nZMu2TDSJfg0E/iqWMb2KTx5Zrv8DhDnj/KmH7vmfetMVOilZt84F/qNuKTOSiiaC0g8cbyChBqvAQdFurHj7lrrz14fySLLp64kDrNOSWL81vXvl5UYLeK/49eh7vuyRbEw/A4TDKRBrr4YyJz2r7EdspzhD/cT2tD5tK6TlFuXxxwb2YGI8
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(346002)(396003)(136003)(376002)(39860400002)(230922051799003)(186009)(64100799003)(451199024)(1800799012)(31686004)(26005)(83380400001)(66574015)(6666004)(6512007)(6506007)(36756003)(86362001)(31696002)(5660300002)(41300700001)(4326008)(8676002)(8936002)(2616005)(38100700002)(66946007)(66556008)(66476007)(54906003)(6916009)(6486002)(966005)(2906002)(316002)(478600001)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QTVuYWRiazgrb0E2TVluL1R3VUR3WFNMR25vTHNyZjJnS1VFSkdWMUwzT1lK?=
 =?utf-8?B?VzNaVHljc1FqY01kN051QytBT1VEcDI5MGVqSjhRMEIrQmtNSlNRc0ZSNCtn?=
 =?utf-8?B?eFY3ZjQ4cythdkU1dEpmSXVNQm5COEtFaUNVY1c4UGc1Nis1THdFMkd4RGF3?=
 =?utf-8?B?WE1xYkRHV1lvTDk1NStWMFptMFFMQjNwdnBUY0pSOEcvQUhKNEdIckQ5MTc2?=
 =?utf-8?B?RmlkRHdzWWNMRzR4anAxc2x2ajN2NmNiQjgrZmkwQ1VoUzgraE5RYm52T3JV?=
 =?utf-8?B?RG16U1Y3SHJ4alQyYVh0Nit6YUNVYngzc0dheDRzOGp3Slc4aEtJSXZQRmFR?=
 =?utf-8?B?YXZEUFB3Vm5LSkNIWkNXQnlaQzNnOVhKeXV6R3FiRFRsWVFLNlJyZDFYNjZU?=
 =?utf-8?B?SHlVV1Y1V0xCbC9UV01FNmZuWGJIeE8vazc1L0FRQnQ1NUwyUlRNTk5NRzhP?=
 =?utf-8?B?WEZCKzNEZmJsYjhrbWNwNkJKZm82enpCMlRQS1VjUVRCVmhhUGZKZ1NWTDBw?=
 =?utf-8?B?dVYySENSVElvTE1XZkUwdE5yV1JaOEdoaTRLQ3pldUd2QVh6WG90RXkrNjNE?=
 =?utf-8?B?YlJkZEdrWloybU52dFFGR0w3Z0xWUHluQWNEb1VFNDlBQ3EvT20zY3lORGZZ?=
 =?utf-8?B?dHRvTjhiQmhoaGJLb3NZS0pwSm1XV1o2b1JFWUxvVUZBOHptazExeFArWE9t?=
 =?utf-8?B?YkFqcHBPNE9hR3VTSUZhVy9zeXZVVk5zTzFwMkZMbnJoZzVGQ0FpdmFmUUtV?=
 =?utf-8?B?Mkh3WFltOGFtck5IWnFCdzJBZzZSbGpaTnk1MXNLd1ZoM0ttbmNBTjI2azlh?=
 =?utf-8?B?ZEluTk4xbFZtV2NJRnVuU3NyUXp3QlBmMU40aUtKbDM3NGpzNlV0ZDJJd3BQ?=
 =?utf-8?B?eVJrdkg2dFdVNTg4aVZubm00OXpLaDJuY1JnV3lqNjFYeGF4VVJqWERlblpw?=
 =?utf-8?B?OStCUGtDQUdlZkE5OHI5aGxlMHVXb0J3NmNORU05RlRKMm43dDk2WEhYNXVG?=
 =?utf-8?B?d3ZOa3dvUlhJc25mampkUzJPbWpRZ1cvdEZ6YjIyZk1qZVF3bWNIWFNTMkI0?=
 =?utf-8?B?S0E4TUF0MnJEZnF4YkQ0bDhqL3d1TTVRcHo2S01xU0JmWGlQWDJ4cGpzQVEr?=
 =?utf-8?B?bDBkd0VtMXlXOXcyV0Zab2xIRVpCQ21JbDNyTG50bUdMUUdwemFCZjV2UVJE?=
 =?utf-8?B?QXF1blltaHVmQUZRaEJOeUplTWh2SDBOeVl1aW9XMTJMNGNHZ0JLVC9wN0ZC?=
 =?utf-8?B?eU9FRFdFWTVXakhZZ3RldElrbXc3QmJLRGkvdU95L29Falp6VWUzY1FvY25P?=
 =?utf-8?B?WmdRYzV5SlQzZEQrOEs1Q3h3eXJXQldJN0pyL05tdXFycnFkN3Y1Si9QUFd5?=
 =?utf-8?B?RFNFWnlydUNBa3NxVjNWcGVobURvd29aNjdGRUlNamZqZ0tmVjJ6K0Nib3ZY?=
 =?utf-8?B?NHFMR3M3WDFhOGJvRVQ0TzcrR3BxKytjcFhoaEtYVklUbldSQ3dTWFE1WXYr?=
 =?utf-8?B?RlVXejY1SFBPMzdzM3ZvSFAzMWUxVGFWOWZJVnVOWC9HakdQWFRwNVk4TDJl?=
 =?utf-8?B?TWlWL2xlcmQ2NUEzUGJud25qMkJKSDY3amk0QjlLazNYbWZYUHh5UXB1Q1ow?=
 =?utf-8?B?SS9icURvMG92Q0tPTnZhb3dNUWJVK3F0cnIvTUl0NWh6VU1JdjdBekxQSTcr?=
 =?utf-8?B?MHBGY3ZTN1RvQmc2MGtpSU1CRHRGanBJZU9yOW96cTM3TzkvZSt3Q1BJUjIy?=
 =?utf-8?B?QWNac2Z2aFg0Y2Uxd0R3b3hoc1hBclBuTDk5RGV4SnUrN0pPbU12QXdVai9J?=
 =?utf-8?B?TTJzWEdJdXpXZytPNFNyQ0V3STZZSk03VGhVMEcxc0tXOHAyRUIvdHhTZ3lk?=
 =?utf-8?B?c0VPYmZPQTYxVmIyWGlhR1o3VHVQNUFRZGh1YjZ3NVpSVHcyOWZ2eFhrQUxQ?=
 =?utf-8?B?OGJhKzEwMnFIR3kwM0huYVhhS2RYaWNYQjZyMmZ6VjdRckc2U0hCVEtJSFpJ?=
 =?utf-8?B?enRCV2JpKzlVbncwYUprdmk2VG9Kc3VrVGtsS0ZrR3lsZ1p0dVo1YThPOWJh?=
 =?utf-8?B?YnNmckR0ZHpja1NVekpwZXBvOE9WcWdRZENNRmlndHBoVm9oRU9IU1NKSXht?=
 =?utf-8?Q?6zKU=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9c804436-7072-4f36-c8db-08dc209e34d9
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jan 2024 07:45:04.8004 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nqPRNmPhTQ99OLmsJhWLGM78Ew7k3VrO3rYAf7tSAK2e7zBJDvTOJHw9JhhpHwnP
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8414
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

Am 26.01.24 um 17:29 schrieb Matthew Brost:
> On Fri, Jan 26, 2024 at 11:32:57AM +0100, Christian König wrote:
>> Am 25.01.24 um 18:30 schrieb Matthew Brost:
>>> On Thu, Jan 25, 2024 at 04:12:58PM +0100, Christian König wrote:
>>>> Am 24.01.24 um 22:08 schrieb Matthew Brost:
>>>>> All entities must be drained in the DRM scheduler run job worker to
>>>>> avoid the following case. An entity found that is ready, no job found
>>>>> ready on entity, and run job worker goes idle with other entities + jobs
>>>>> ready. Draining all ready entities (i.e. loop over all ready entities)
>>>>> in the run job worker ensures all job that are ready will be scheduled.
>>>> That doesn't make sense. drm_sched_select_entity() only returns entities
>>>> which are "ready", e.g. have a job to run.
>>>>
>>> That is what I thought too, hence my original design but it is not
>>> exactly true. Let me explain.
>>>
>>> drm_sched_select_entity() returns an entity with a non-empty spsc queue
>>> (job in queue) and no *current* waiting dependecies [1]. Dependecies for
>>> an entity can be added when drm_sched_entity_pop_job() is called [2][3]
>>> returning a NULL job. Thus we can get into a scenario where 2 entities
>>> A and B both have jobs and no current dependecies. A's job is waiting
>>> B's job, entity A gets selected first, a dependecy gets installed in
>>> drm_sched_entity_pop_job(), run work goes idle, and now we deadlock.
>> And here is the real problem. run work doesn't goes idle in that moment.
>>
>> drm_sched_run_job_work() should restarts itself until there is either no
>> more space in the ring buffer or it can't find a ready entity any more.
>>
>> At least that was the original design when that was all still driven by a
>> kthread.
>>
>> It can perfectly be that we messed this up when switching from kthread to a
>> work item.
>>
> Right, that what this patch does - the run worker does not go idle until
> no ready entities are found. That was incorrect in the original patch
> and fixed here. Do you have any issues with this fix? It has been tested
> 3x times and clearly fixes the issue.

Ah! Yes in this case that patch here is a little bit ugly as well.

The original idea was that run_job restarts so that we are able to pause 
the submission thread without searching for an entity to submit more.

I strongly suggest to replace the while loop with a call to 
drm_sched_run_job_queue() so that when the entity can't provide a job we 
just restart the queuing work.

Regards,
Christian.

>   
>
> Matt
>
>> Regards,
>> Christian.
>>
>>> The proper solution is to loop over all ready entities until one with a
>>> job is found via drm_sched_entity_pop_job() and then requeue the run
>>> job worker. Or loop over all entities until drm_sched_select_entity()
>>> returns NULL and then let the run job worker go idle. This is what the
>>> old threaded design did too [4]. Hope this clears everything up.
>>>
>>> Matt
>>>
>>> [1] https://elixir.bootlin.com/linux/latest/source/drivers/gpu/drm/scheduler/sched_entity.c#L144
>>> [2] https://elixir.bootlin.com/linux/latest/source/drivers/gpu/drm/scheduler/sched_entity.c#L464
>>> [3] https://elixir.bootlin.com/linux/latest/source/drivers/gpu/drm/scheduler/sched_entity.c#L397
>>> [4] https://elixir.bootlin.com/linux/latest/source/drivers/gpu/drm/scheduler/sched_main.c#L1011
>>>
>>>> If that's not the case any more then you have broken something else.
>>>>
>>>> Regards,
>>>> Christian.
>>>>
>>>>> Cc: Thorsten Leemhuis <regressions@leemhuis.info>
>>>>> Reported-by: Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>
>>>>> Closes: https://lore.kernel.org/all/CABXGCsM2VLs489CH-vF-1539-s3in37=bwuOWtoeeE+q26zE+Q@mail.gmail.com/
>>>>> Reported-and-tested-by: Mario Limonciello <mario.limonciello@amd.com>
>>>>> Closes: https://gitlab.freedesktop.org/drm/amd/-/issues/3124
>>>>> Link: https://lore.kernel.org/all/20240123021155.2775-1-mario.limonciello@amd.com/
>>>>> Reported-by: Vlastimil Babka <vbabka@suse.cz>
>>>>> Closes: https://lore.kernel.org/dri-devel/05ddb2da-b182-4791-8ef7-82179fd159a8@amd.com/T/#m0c31d4d1b9ae9995bb880974c4f1dbaddc33a48a
>>>>> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
>>>>> ---
>>>>>     drivers/gpu/drm/scheduler/sched_main.c | 15 +++++++--------
>>>>>     1 file changed, 7 insertions(+), 8 deletions(-)
>>>>>
>>>>> diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
>>>>> index 550492a7a031..85f082396d42 100644
>>>>> --- a/drivers/gpu/drm/scheduler/sched_main.c
>>>>> +++ b/drivers/gpu/drm/scheduler/sched_main.c
>>>>> @@ -1178,21 +1178,20 @@ static void drm_sched_run_job_work(struct work_struct *w)
>>>>>     	struct drm_sched_entity *entity;
>>>>>     	struct dma_fence *fence;
>>>>>     	struct drm_sched_fence *s_fence;
>>>>> -	struct drm_sched_job *sched_job;
>>>>> +	struct drm_sched_job *sched_job = NULL;
>>>>>     	int r;
>>>>>     	if (READ_ONCE(sched->pause_submit))
>>>>>     		return;
>>>>> -	entity = drm_sched_select_entity(sched);
>>>>> +	/* Find entity with a ready job */
>>>>> +	while (!sched_job && (entity = drm_sched_select_entity(sched))) {
>>>>> +		sched_job = drm_sched_entity_pop_job(entity);
>>>>> +		if (!sched_job)
>>>>> +			complete_all(&entity->entity_idle);
>>>>> +	}
>>>>>     	if (!entity)
>>>>> -		return;
>>>>> -
>>>>> -	sched_job = drm_sched_entity_pop_job(entity);
>>>>> -	if (!sched_job) {
>>>>> -		complete_all(&entity->entity_idle);
>>>>>     		return;	/* No more work */
>>>>> -	}
>>>>>     	s_fence = sched_job->s_fence;

