Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A7186E7F9F
	for <lists+dri-devel@lfdr.de>; Wed, 19 Apr 2023 18:29:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A844310E119;
	Wed, 19 Apr 2023 16:29:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2075.outbound.protection.outlook.com [40.107.244.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E5CD310E119
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Apr 2023 16:29:02 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=B08DA5pH3v8rGExBnA3G6sltK9zXHdLX7UBbiCktBFinukTfWGBqobIiPAJmhrWmdaTiVwo0yT+ajIu71stymBIbJVL9af3Yt4Q9nwyQM7AMCqEYthCg5IxG4aTk7utLKb9QnfRcg/oO5aN/RHZiRr0WAY220nhD36j0DF/TTcsSc7WNU/xdPxs3goGCzmU8PGvOlfbIVpCuUxtiqgu6LLgI+hfI6OyO8LyyYaF5Kz7oqzo884AHOcvxmxyDfGaU3SwIujmyCQOEMVjSRrEw83+OgzUurToQSaCL8IEaAq5gbwwAotVBJBGbaefuGpeQssDaIWNgk7lLlkdEauNkrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CRm4OFZfghIv3SGsibpEFynFyF6CqWBVgaJuiUdR27Q=;
 b=ZzZODBpRreuFMp4ptz43WqO2ivst7frinVqwN7CB+oCQVKx246dZGfmSTjDC5VQ6IddOEESiajm1aMxQDqwtrLqZ1Wxf9TjY4GuLPiGGiWjGgPni8NmwPzl1GrXgUXu8mzT30KSqjyLuplvxfcq0fs3jpIgFeDgAsAbXlJZY67hdErn1BEu9huqqRfSezd+L6Bf3pYwNnQ8pYumtW0gTt7ws8F3Zk6X/4LrhIQ2stq3dValpdCAi99LZBlCRwXb1v3i9cdBFezu9YC8y7cZXNV+HrixljSatYJjRfs2le8nalgoc4Ny2Jqa29o13cII3/U0+p8xYYE6g47q9by6lmw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CRm4OFZfghIv3SGsibpEFynFyF6CqWBVgaJuiUdR27Q=;
 b=pDQzxbdqDEz/AU8Sjg+7NekiuQDWnCXg2SUQVqtYHMTwMMyPu7QIAzZWtTnO7LBw2/J0BUcmIEC6WVWCKIhG5DpCYZiYwT21W4leClhu6dNLEIjJGIZK/FxW4oe2j1198u0t9yu4xXA+ZWZj+zzX0qfX9bSso0cljuXl04gNugI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM6PR12MB3370.namprd12.prod.outlook.com (2603:10b6:5:38::25) by
 BL1PR12MB5849.namprd12.prod.outlook.com (2603:10b6:208:384::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.45; Wed, 19 Apr
 2023 16:28:59 +0000
Received: from DM6PR12MB3370.namprd12.prod.outlook.com
 ([fe80::8299:158a:c296:de80]) by DM6PR12MB3370.namprd12.prod.outlook.com
 ([fe80::8299:158a:c296:de80%6]) with mapi id 15.20.6319.022; Wed, 19 Apr 2023
 16:28:59 +0000
Message-ID: <1f4d0dc3-de8d-aa46-b28b-1b9a0359a54f@amd.com>
Date: Wed, 19 Apr 2023 12:28:57 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Content-Language: en-CA
To: Lucas Stach <l.stach@pengutronix.de>, Steven Price
 <steven.price@arm.com>, Danilo Krummrich <dakr@redhat.com>,
 airlied@gmail.com, daniel@ffwll.ch, christian.koenig@amd.com
References: <20230418100453.4433-1-dakr@redhat.com>
 <ddaf4984-6f5a-404c-df9d-537245e99420@arm.com>
 <04f039ac71f3c0685a849b492478d18ec6ea4d11.camel@pengutronix.de>
 <dcd957cf-8e26-11f1-2ac1-0fdd8541eed3@arm.com>
 <87ed5324a69b5f1cc1ab5be2483f224afacf5824.camel@pengutronix.de>
From: Luben Tuikov <luben.tuikov@amd.com>
Subject: Re: [PATCH v2] drm/scheduler: set entity to NULL in
 drm_sched_entity_pop_job()
In-Reply-To: <87ed5324a69b5f1cc1ab5be2483f224afacf5824.camel@pengutronix.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YQBPR01CA0156.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:7e::20) To DM6PR12MB3370.namprd12.prod.outlook.com
 (2603:10b6:5:38::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR12MB3370:EE_|BL1PR12MB5849:EE_
X-MS-Office365-Filtering-Correlation-Id: 6685c2d0-3280-4ede-7331-08db40f32e03
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: /Vvp2uNZU3XAn2Z6FaF9uYh5LTNAYKAr4wg/wlpnXTDll32xTI2Fph/KtcnDO0JeiZiG8UyvS9AOzXvI4uI0meuwFjTzvvcIZMz8Um49SBIDow9OT4lfbtk0jaCSqjaScVI/ymT4u8AbRIqzxHhz2P9QZb7OLWWZ6+RpDFTssLezAbtilwxlwqxeIkl4NUm8i85nIwOK4FpacPRWc+uxTHsK2W6nl6/fp7HtaTN4yeZ/h2ze3a4jj7iBRQkUG//nU/3VpV9qPj2XgiZO2JqdaOcNDunfnE3Rxi/LIAAH3NvqM9gxpKCMJJEPXnxitJwXB0+f1yZevfcgm8MNH2/VQEf+YutDAUl64GYUEjTaaUx1eOK/jbbXeiPFRbexFw8dO+ix6samacLLoOucrABL8KMmkop2MV4n4l4u5FXSs11dPSaj/0Zauxfs5K6vTPBs02ehEBG41m3ZqPMrPm8yCYfFHM7db5+xTnnO9i/QF3epyfz/Usiy5taU900BuQYwaozJlou/0uzrPOYUvy9IXEy9tz9mg4hCvJkZz+a0X0SsACQwzqNzenCyWZHNB3vhMsXZIKHswpbUbCe6EQcaCGtv+h5e2eK+vc34Be2Km2t3Cyq5XInLp7paVnbJZMHo3lVIuecXWQ9IMYQ1BRzplQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB3370.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(376002)(39860400002)(396003)(136003)(346002)(366004)(451199021)(66476007)(478600001)(38100700002)(8936002)(8676002)(316002)(41300700001)(6636002)(4326008)(66946007)(66556008)(110136005)(186003)(2906002)(53546011)(6512007)(36756003)(26005)(83380400001)(6506007)(86362001)(31696002)(2616005)(31686004)(5660300002)(6486002)(44832011)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UkczbGZaMVJYa0YrVVEvQmhqZzBZZ0xWNzAzVjFBUW5mUURxeGlmK3NIWFdR?=
 =?utf-8?B?Y2hqSlc3REg0SzM0bUFLTlFVZXF0MWJ5L1g3MUlTMHlTTDVVSzNLQStScklC?=
 =?utf-8?B?amlMUFMwZ3g3MExtNkZwamF2c0YvVkZIWkFZbUxoS1ZtTGJsZ1pwMWZxYTZ6?=
 =?utf-8?B?ZXFvck01dk1xblNIZkt3cnJJK2VWaGl3L3dXYzJyakwxSlJ0VkV6OHIrcFJQ?=
 =?utf-8?B?TXh6VU0wT0ppL0pnZVFWaU5nQVM0bHFXU1ZRWk9FRTljRzI1Yi9ZNVR4d3B6?=
 =?utf-8?B?Y0VBU1o2RUZHd2ZZeTMyZ285UFZ0MmYwdCtmSHJ5dURyWmpUS295YklSdFll?=
 =?utf-8?B?VU40bm1NSDhBbTN0QmlyNzF2RkNlbFVPbG5WbFNVb09VdmdPcGRmRkhIaXh5?=
 =?utf-8?B?OHp3Ynh3NnIzYmhRK3hTaXlGS3dWVWp5bjZ3UWV3bHhkWnBua3ZieXVZOXlW?=
 =?utf-8?B?OGFvNlpNbC9lWmNIMnJRMEpWbjJwbkN6SWc1cEx4WEpaUUU0S1M5SzVJbHpw?=
 =?utf-8?B?TmRjSW9RQ0JhMGFoU0ZGVUpMVHJrKzh4S2tGSGhLcXR1bFowdm1GQ2Q3K2sz?=
 =?utf-8?B?ZjBwYldiWWRjQk9KZnMzb2lhcmc0c3ZnbnVIY3EyeW56eEFTMzc0UnpYdkdz?=
 =?utf-8?B?a1RtUVJuOTAyc1RMV01oa0xMcUNEcU1rYjZvZjRibjRsVzRwa3QxbVpMdHMr?=
 =?utf-8?B?dGp1K3lmdkNsRkF5MWRiRTBUSzg5cFBIR3ZCTmtlY1RWckZUakZMd0xoRlhP?=
 =?utf-8?B?NkpuZmR0MUtGY1M3bDN4WTBsc1hWcG9SL3NiVENGckdTUzcyMXJsZHhuZnZq?=
 =?utf-8?B?dVBPaGthKzMvOHpETWpWaG1VRmhmSHhiTXYvY2FrL2hUaFBra2VHT1dVOXFE?=
 =?utf-8?B?MnlFQWIyNzB1SUF3T2V6amEwTDUzOG5ncWJsWENCZDBZalUzby91MjdYSG8w?=
 =?utf-8?B?NUdkb0tkZ0prZ01Ibkw3YzJoNFdVbVgvWmMwZXR6bFIvRWpLOEp6NjVRL2VT?=
 =?utf-8?B?bTBsbDl4ZlJ6TytrWHdKK1NGQkRLeUlrRjFXdmt1R0o3NW0vVUR2Q1d5cEZ2?=
 =?utf-8?B?UnFLc094d29BNHk2OVcvY3Z2cFowT1N0MnUyU1dlSEw5TDE5MjhKVGlESEV5?=
 =?utf-8?B?WjZMcnRZYVZPcVZsWWc0eFl1MkVQOFhPd0VVOFFxbXNVTlVoOWozaDJ6QmNo?=
 =?utf-8?B?b3dVRldFNE5MSXJiSzRXcElXRXFucGMxM0pyOTdNQXhPMjFzMEdZbTRacEgz?=
 =?utf-8?B?ejdReDdUQWlEYTMzcHV6UUlFLzR0TXhadjlMeXZzVkcyT1FyOFJnMVZoRVZr?=
 =?utf-8?B?NVdoamlLVzZWQzVDaEhyRGxMdDNiWi91OGlzVlVBcUJCYWhoVGcydnVuMnlF?=
 =?utf-8?B?MkZCVjluazBLL2tKYlFzWGZqNHpTekZnMGxKeiswNnE3d3hXR3hOMk1zajlC?=
 =?utf-8?B?Z1RDUWxVa1VpRzUxZ2NXakFDMnNSZTc4b3pVV2lRcmh4bFgybzMvQ3paakx4?=
 =?utf-8?B?Q2tORlI0QzlKN3phM1J3aXZYckswQ1NvSFVGN2x1OVlDRWdkWjJodCsycnRj?=
 =?utf-8?B?cDFBdVByRmJldjdOMlY4Ym4yZkxTb0lodWtZZVQ3ckZuMkRNeWQyQit2TEEr?=
 =?utf-8?B?OGNmR2I5dDVPbnJOaVRzYXFzQjhoR2NvS3dJZnFkVSswSDNTV3NyQkFDM1dK?=
 =?utf-8?B?by9DMk01R21HY0tIRnM4TkF3ZDFiRnp2d1dLUSswc2tDM3JyOWs0RWZGN2dv?=
 =?utf-8?B?M3RWVjVNUHMrT2FsSHFldXN1c09nOGV2bTdNZmp5TWFKcFlCdmJvdmd5MXpq?=
 =?utf-8?B?aU9IUlZyUmtiYy9GcWpqNXp6T2kwekVJV2xqQlRXYTRvY2FJVWFVQWE4dFph?=
 =?utf-8?B?b2FUSGpMT1Y1dXBwSnhQWXp3SlhwcGU0WUdnUlovRGFsK1BXVHRCcWJHbVBy?=
 =?utf-8?B?SGRkZEZ1cmxIVk5VK2UrOG5mUjBNZjhLR1NseVhFQVJvZ2xWRjQxSjU3RWRo?=
 =?utf-8?B?ZmFITVBaMk96UWVHU1FYVWMvMllYeHZ4cFZqWHZYQXBtWkFiQmZjUU5oSlB3?=
 =?utf-8?B?a2RSbXJwa3ZjNGMzSmZzbGhyL2FwYmRyMXZKYmQzc3ZUKzF4aUQ3NU9DdU5n?=
 =?utf-8?Q?i0O3Dk0h14UDIRXjsuxi6X0cu?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6685c2d0-3280-4ede-7331-08db40f32e03
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB3370.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Apr 2023 16:28:59.8090 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oqbXSQRrMWC2RiKHFqDkJOBaIx1Vt5I1KEzwCbqDh5kjeA40gc+57ycz7TVJjsav
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5849
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2023-04-19 06:07, Lucas Stach wrote:
> Am Mittwoch, dem 19.04.2023 um 10:53 +0100 schrieb Steven Price:
>> On 19/04/2023 10:44, Lucas Stach wrote:
>>> Hi Steven,
>>>
>>> Am Mittwoch, dem 19.04.2023 um 10:39 +0100 schrieb Steven Price:
>>>> On 18/04/2023 11:04, Danilo Krummrich wrote:
>>>>> It already happend a few times that patches slipped through which
>>>>> implemented access to an entity through a job that was already removed
>>>>> from the entities queue. Since jobs and entities might have different
>>>>> lifecycles, this can potentially cause UAF bugs.
>>>>>
>>>>> In order to make it obvious that a jobs entity pointer shouldn't be
>>>>> accessed after drm_sched_entity_pop_job() was called successfully, set
>>>>> the jobs entity pointer to NULL once the job is removed from the entity
>>>>> queue.
>>>>>
>>>>> Moreover, debugging a potential NULL pointer dereference is way easier
>>>>> than potentially corrupted memory through a UAF.
>>>>>
>>>>> Signed-off-by: Danilo Krummrich <dakr@redhat.com>
>>>>
>>>> This triggers a splat for me (with Panfrost driver), the cause of which
>>>> is the following code in drm_sched_get_cleanup_job():
>>>>
>>>> 	if (job) {
>>>> 		job->entity->elapsed_ns += ktime_to_ns(
>>>> 			ktime_sub(job->s_fence->finished.timestamp,
>>>> 				  job->s_fence->scheduled.timestamp));
>>>> 	}
>>>>
>>>> which indeed is accessing entity after the job has been returned from
>>>> drm_sched_entity_pop_job(). And obviously job->entity is a NULL pointer
>>>> with this patch.
>>>>
>>>> I'm afraid I don't fully understand the lifecycle so I'm not sure if
>>>> this is simply exposing an existing bug in drm_sched_get_cleanup_job()
>>>> or if this commit needs to be reverted.
>>>>
>>> Not sure which tree you are on. The offending commit has been reverted
>>> in 6.3-rc5.
>>
>> This is in drm-misc-next - I'm not sure which "offending commit" you are
>> referring to. I'm referring to:
>>
>> 96c7c2f4d5bd ("drm/scheduler: set entity to NULL in
>> drm_sched_entity_pop_job()")
>>
>> which was merged yesterday to drm-misc-next (and is currently the top
>> commit).
>>
>> Is there another commit which has been reverted elsewhere which is
>> conflicting?
>>
> The commit which introduces the use-after-free, which is now upgraded
> to the above NULL ptr dereference is df622729ddbf ("drm/scheduler:
> track GPU active time per entity") and has been reverted in
> baad10973fdb ("Revert "drm/scheduler: track GPU active time per
> entity"). The revert is upstream in 6.3-rc5.

We may actually need to track the effective average time a job
from a context has spent on the GPU, for scheduling purposes.
Just like df622729ddbf ("drm/scheduler: track GPU active time
per entity") does it, but also counting the number of samples
taken, so that we can compare to other entities (contexts),
and pick an appropriate context from which to take out jobs.

When we used Round Robin scheduling, there was a complaint that
some contexts were starved, namely ones with many number of jobs
submitted early, to that of contexts which had just one
or two jobs. This is described in 977d97f18b5b8e
("drm/scheduler: Set the FIFO scheduling policy as the default").

Now there's a complaint that because some contexts submit
many long-lived jobs, possibly back-to-back, while other
contexts submit few short-lived jobs, then because of
the FIFO scheduling, i.e. "oldest ready job executes next",
we get to starve contexts which submit a sparse load of short-lived
jobs.

There are a few scheduling options to make scheduling fairer,
i.e. selecting the next entity from which to get a job to run on
the GPU, and it would seem we might not be able to get away with
"oldest job waiting" or "last time a job was scheduled from
this entity", exactly because of the reasons described
in the previous paragraph. Other scheduling algorithms
are unavailable since we don't know a priori how long a job
would take, and the next best thing is to approximate it
from past jobs--for which we need a measure of the average
job execution time per entity.

In principle, decoupling at the entity <--> job level,
might be too low level to do it at, and perhaps this decoupling
should be done at a higher level, but we might get away
with something as simple as
	if (job->entity) {
		track time...
	}
-- 
Regards,
Luben

> 
> Regards,
> Lucas
> 
> 
>> Steve
>>
>>> Regards,
>>> Lucas
>>>
>>>> Thanks,
>>>>
>>>> Steve
>>>>
>>>>> ---
>>>>>  drivers/gpu/drm/scheduler/sched_entity.c | 6 ++++++
>>>>>  drivers/gpu/drm/scheduler/sched_main.c   | 4 ++++
>>>>>  2 files changed, 10 insertions(+)
>>>>>
>>>>> diff --git a/drivers/gpu/drm/scheduler/sched_entity.c b/drivers/gpu/drm/scheduler/sched_entity.c
>>>>> index 15d04a0ec623..a9c6118e534b 100644
>>>>> --- a/drivers/gpu/drm/scheduler/sched_entity.c
>>>>> +++ b/drivers/gpu/drm/scheduler/sched_entity.c
>>>>> @@ -448,6 +448,12 @@ struct drm_sched_job *drm_sched_entity_pop_job(struct drm_sched_entity *entity)
>>>>>  			drm_sched_rq_update_fifo(entity, next->submit_ts);
>>>>>  	}
>>>>>  
>>>>> +	/* Jobs and entities might have different lifecycles. Since we're
>>>>> +	 * removing the job from the entities queue, set the jobs entity pointer
>>>>> +	 * to NULL to prevent any future access of the entity through this job.
>>>>> +	 */
>>>>> +	sched_job->entity = NULL;
>>>>> +
>>>>>  	return sched_job;
>>>>>  }
>>>>>  
>>>>> diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
>>>>> index 9b16480686f6..e89a3e469cd5 100644
>>>>> --- a/drivers/gpu/drm/scheduler/sched_main.c
>>>>> +++ b/drivers/gpu/drm/scheduler/sched_main.c
>>>>> @@ -42,6 +42,10 @@
>>>>>   *    the hardware.
>>>>>   *
>>>>>   * The jobs in a entity are always scheduled in the order that they were pushed.
>>>>> + *
>>>>> + * Note that once a job was taken from the entities queue and pushed to the
>>>>> + * hardware, i.e. the pending queue, the entity must not be referenced anymore
>>>>> + * through the jobs entity pointer.
>>>>>   */
>>>>>  
>>>>>  #include <linux/kthread.h>
>>>>
>>>
>>
> 

