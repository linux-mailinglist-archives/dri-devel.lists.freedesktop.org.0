Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D90036D9C75
	for <lists+dri-devel@lfdr.de>; Thu,  6 Apr 2023 17:33:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C128110E24B;
	Thu,  6 Apr 2023 15:33:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam02on2062c.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7eb2::62c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 11D4110E24B
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Apr 2023 15:33:27 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iuZTQUUmnO/b0CmCvPilX4BbypgzvkGQpsZEabNKaWKP/qbR8rl142JKdyASYccAcovq4evu1IloH1j02K0YO0xORyOViTeOCycTvlO6rBCSEk4c/4CavdOBWw8hH1N5ohMMVea24yQcJHT5Hi9NcY16eO6XcvD9tbQyNqjgMrPdzDQbPWi7WioMf1Ju+wtJ2pgnOWY5oMugXNtKJi4xW0JozrDeAJSuMJxaXFLdrWQvTlF0sSZ60HrwkhcZp7VmHRSg/y/bwmqmSS69Qmwlc6F+PpLzIqz+WJGYeXIbwPAiRtMiWiabYVwrNN7xsLJRlIcveWtTyux9CHCgIZ7pXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=D4+vmrABzVnRk8GbeJbUnA5weJECMQL/XKGEx3UZ5v4=;
 b=alG+I8ZWqailbU0JHGtNBfP6tvfd57igPO8og6zHNKRTxMraukb4rzs9Wo7j4FnBhjrd5PZ4is/AbceP64JGhAxdw+hN/72N6HRiaMegNStgbqMspy+/BenjlF4jH9yI8yEOiOo5o6dV5+JQIjGkbwLbYn2jhoOdf81mLFvEFgfiL6LCKRc5H2AukeLyp0noj1lTlQ6gI7nofuR2msz9vRRlPbj2lTFPoK5BAU9mYTnPpvs3slgP+T5o3gPBcX9Zh6wK/AdtjEpxHU71Q995vKoozjqpKziAphakzGGd+SoL2fLGZVyhKSGoQKTtpi3lzmjc4KMaAZ433QveGWdgjw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D4+vmrABzVnRk8GbeJbUnA5weJECMQL/XKGEx3UZ5v4=;
 b=XafVOuVcMLitVuxoWeFi+jPZV21X2v+XGMN+/ctGlrjBMMGojV0CPLRj6k9pAQT6wTr6JP7Iyi6lgcRMj3otrioUXE3MiD9QJlqXvg6QgSHbEiSpBK9itZbJh8KqYN/oLjaiwTmtIwtVhuKoczrwQmx3MloLOwb2f3KV0Zuc6S4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by IA0PR12MB7554.namprd12.prod.outlook.com (2603:10b6:208:43e::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6254.35; Thu, 6 Apr
 2023 15:33:24 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::4624:dc39:943e:6ae]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::4624:dc39:943e:6ae%5]) with mapi id 15.20.6254.035; Thu, 6 Apr 2023
 15:33:24 +0000
Message-ID: <cdc29af8-8c04-cf46-1872-3feab954bc55@amd.com>
Date: Thu, 6 Apr 2023 17:33:18 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [Regression] drm/scheduler: track GPU active time per entity
Content-Language: en-US
To: Lucas Stach <l.stach@pengutronix.de>, Daniel Vetter <daniel@ffwll.ch>
References: <3e00d8a9-b6c4-8202-4f2d-5a659c61d094@redhat.com>
 <2a84875dde6565842aa07ddb96245b7d939cb4fd.camel@pengutronix.de>
 <8b28151c-f2db-af3f-8dff-87dd5d57417b@amd.com>
 <3004a2bf-e725-643e-82af-8a217784e796@redhat.com>
 <013781a3-5abd-8c66-8a0a-dd36c9c487af@amd.com>
 <28d10733-b217-7ccc-4b8c-54bdc8249234@amd.com>
 <CAKMK7uFeeAaG8+1EutgMtmVANTb-acL0faEkJfUp1_35rSjaEg@mail.gmail.com>
 <9c72c7162da56234addd7083ec774e525a13957c.camel@pengutronix.de>
 <31f03135-40e4-a6ad-37e0-3b434a37922d@amd.com>
 <9ac69b11802331f9e024ab837b85214c4243e3fd.camel@pengutronix.de>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <9ac69b11802331f9e024ab837b85214c4243e3fd.camel@pengutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0264.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b5::19) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR12MB3587:EE_|IA0PR12MB7554:EE_
X-MS-Office365-Filtering-Correlation-Id: 47fcc4e7-166a-488d-6378-08db36b4429c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ojqN61Y67GIyObQXB8OLkKURaJ2tSKcj49aHeNKOM8k4sLGosYvfXNVPvfVNTBHi7wbXNCnyzT/lovAIjD0054jnxvMMgQF5qyD7pyX2W02VpcGkk6iIU4vw7YE7CZmII921wvnPBiHzYdA62svshTEryoesc2o6Vz5Bu5UVuHNqEyEyvnv8AR7bHMT89ny9o/1tDRvNnK2o8F1i5d9ODjKawnLufD1kGIovWaOl2bu3g2qI3sYZfQ5wrK1m60M9M/UEbcUCgtvZrSkVrbnHbuaEtDJodoMUqfeX+yp5Pu5fk/PKyjq9uTLtikQidCM6oUHNBzhMmXn+xhrTzJEmfzeZYa4mY/6bOd05R/bI0fljiIf5dNYs2Z/lGiwimvne4NxEIBBGCoVrbo9HQsVFnZlTG8pZX3zEt6ppjRPHQpXrTpn8B4gB51QdY/f7VAjeCmZox0lBeCpVIZYLEe2a+aiT0N4pxbHf2dE++KT/l/U5h1B93Sp1THGeGXXMoq0rUMlRNdtPeznhY8z7cDagb6NaIjQwpxa1N6qYlzQQVRkKXR0me3BFUqUyE60KkCcVcLTUo4vx5LlUQ+4W25Q9kLGWb4Jif7/e8p/DcwGpAOusAO/UMD5R54cR3BwPZtuLXcCWA6seyz2CVbDy2LWpVQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(376002)(346002)(366004)(39860400002)(396003)(136003)(451199021)(54906003)(478600001)(83380400001)(2616005)(66574015)(6666004)(31696002)(186003)(6506007)(53546011)(36756003)(38100700002)(86362001)(6512007)(6486002)(966005)(66556008)(66476007)(66946007)(31686004)(8936002)(41300700001)(8676002)(4326008)(2906002)(5660300002)(316002)(110136005)(7416002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ODVGRGN1MjNxS0gwOERjWFB6Vmg1cmZLcHVvSGlZa2N5ZG9DaHRNZkVwalhi?=
 =?utf-8?B?djdCM1BNQk42dDYwYWt2bEE2OEZGWVRWRXlRUVEzL29hRnhNYjNVakdWMkFP?=
 =?utf-8?B?TnNJczcrYW1XdTJRM00wcXJodGdWdmpjRWJBL0Y1MHp2MjF0KzZOSUZvNlNR?=
 =?utf-8?B?cmR5QzhLNGFEd3lOZWhrYmFxeWo1a1Y3Y05aNEpmVll1ZWcvUzVEQjFZRDJ5?=
 =?utf-8?B?bTIxTWNZSFZYWExuWnkwaE9DUVZvWkFZOG9YUFNDZ1RLckJhMThVWmh2dnlq?=
 =?utf-8?B?VURUUXJHa3UySGNXOThCRWZTUDBwckE4a0l3RDBpTnRQWlFNaGxibXhkbS9t?=
 =?utf-8?B?ZXdzZ2hFcThqRUlvemR5OTgrcU44azVmTXZZeVFxWm1sdEVseGpianJPMzJY?=
 =?utf-8?B?ME91NDlZOWJjMW5KK0NiRDFXT3ZwTHNvR0F0R3VVYkZETVJoVWc2blBRRlYw?=
 =?utf-8?B?MVpmVStFcG5XcGcwUExpRURpVjVoV2xYakpYbkFzY0JwOEhKUlFDUkh5enRN?=
 =?utf-8?B?d2pCdDVIVWZDajE0YjgxM2JoTzJ2bUlPNTFFcXpET295ZzM2d3BDdUdCeVhJ?=
 =?utf-8?B?OFlGamlyVDl0dUZFMlNHSXRDVGdDa3AvR3htTjBpZ1VMYXVyWjVBSXJES0xh?=
 =?utf-8?B?cDlEdHYwZ1FVYk1HWGpSOEtMV0V4dlF3aGtTNll4TUpETDNzMExFRjQ2bkwx?=
 =?utf-8?B?dnhRUkpRUnJ3LzQ2N2pOb21NclJpMjhUZnlGNC9NY2RHZXhoZUYzM1RsQzRK?=
 =?utf-8?B?NTNQK21SZjd5TkVxRGVRMW04VGFGQWNsUlhvMjdkSVpZQUp1dllZT0oramFp?=
 =?utf-8?B?bjU3VmtrUHRiTWQrZjRJbE92TVZZTEpvR1RUT3JjcTlMSVlkcnBwZVNzOC80?=
 =?utf-8?B?K0phMEtLUE9VbmVvcU1RbGRydnY1SHN4SktLQkRIUGh3Y0pralQxa2lOOUQz?=
 =?utf-8?B?UStYeHNjenZEbTFmZjFzMXNtZW9YUkVsdmdJcFh5cjE1MTZuajBZVmdXMXY5?=
 =?utf-8?B?bDVza3lnMlhJVW4wWEpxTis4bTMzSlJUWjZwemFUNitiUEdZSFpHd0xpdG5p?=
 =?utf-8?B?Nko4dFdGY1VxRWwxVGNyNkNoSHBEd1Z0NDk1bWVzTmovZVFhaGpIbHJ4WlJM?=
 =?utf-8?B?NFFIOWJ2Y3BYTUcyVlBLOGV5NDR3U1B1OEZVQVhaTk5idG5iV0tNZHp2eUxn?=
 =?utf-8?B?d2tMNktxSmtpcHdYKytHa0RnRGl0V0o4cEthVlRHS04xMkVReWlEUDZqY292?=
 =?utf-8?B?U1psQzRUWkt0REZOWkJady8zY3V2S3g0NzArS2g2ZFZySXBEck5abXlQeWM1?=
 =?utf-8?B?WE1xZlBYK0pRMG93R1FMbWl6TDk3MjdvSFRZdG5MaEZDdHdTdFAwcEIvUFVJ?=
 =?utf-8?B?K2h0dmJBclBRYkVjYmFxVFNUQkVJQ2E4a2dhVTdqdHlpR1dXNWEvc094YXBj?=
 =?utf-8?B?ZVd2bnFxMlVJenZ0WCttVkkvWlN0MEdmeXhkcG82cEtXYTVTQkpXQUlDazVK?=
 =?utf-8?B?YXpHSzJONDhBMSs2VmhERDJnZCtZRXlsWXRhRmZDRGVJc0h5d3FYTEtPS1Ry?=
 =?utf-8?B?eitTVjI1ZjZldTV2dWNQS3JETWU4UUFVa001VjFqLzArNm1rNjNJRy9RRGQw?=
 =?utf-8?B?ZHdkcnFDQTZWYmc2QVcrZmtraUltNSsyNCtaMnBhSU9MUDNYZWZEQjVzdys5?=
 =?utf-8?B?NkdSUDVNWmI3cmxwc0ZOR05qVDJ6TVV0bWRwcjdlNi9wbENFYlAwUnFOWURU?=
 =?utf-8?B?cnZNQXNES0xPRjhmRVlORUd4aG1pZVVEaEIzS25tNjZzeXJlYUp2Vlo5S2F5?=
 =?utf-8?B?bkc1blN1aDBrSFlaY3Z6TWFWZXRYdms3cFEyaFppZlQxdXpiTTg5anh4U3du?=
 =?utf-8?B?aHJLMm00b29MRk5wL1ZUOW4vL0J4enhNT3IzWEJ6WVJpV2ROYTQrZHFKUGJW?=
 =?utf-8?B?SFZmZHRmQlpJREVQR3hubjJYWkhCTjRwZTI0d1lCVjMweTdLdjYrWXhmMXpz?=
 =?utf-8?B?SXFHYnRzNTFjcExUc0pBWm5Ed3B2RFc5OEdvcDNMVHRrcGtEdERDb3hzVnhj?=
 =?utf-8?B?UnBWbFBiNzBCTDdqNmlCdDZqZ0pWZTAvaVpBSFZ2NW0vRXlPWUN6eTZJRStS?=
 =?utf-8?B?dzNkTmJobjF2T05vNmVsSi9xZWF5Tm5abUJHYzRqeTNKOFNNN3Bzb1hsV0Ft?=
 =?utf-8?Q?jz3WyG1mcrsPFf/8LkGYXfa0syMRG/b3xhNKpRxEU+AT?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 47fcc4e7-166a-488d-6378-08db36b4429c
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Apr 2023 15:33:24.3719 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5+eMrWvCqp+Hjy0rB+r3n8rm7iW0DQJduIUKYN8xuPACFQ9QkpnBAfEFFISyqwPf
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB7554
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
Cc: Matthew Brost <matthew.brost@intel.com>, tvrtko.ursulin@linux.intel.com,
 andrey.grodzovsky@amd.com, lina@asahilina.net, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Luben Tuikov <luben.tuikov@amd.com>,
 Danilo Krummrich <dakr@redhat.com>, yuq825@gmail.com,
 Bagas Sanjaya <bagasdotme@gmail.com>,
 Boris Brezillon <boris.brezillon@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 06.04.23 um 17:24 schrieb Lucas Stach:
> Am Donnerstag, dem 06.04.2023 um 16:21 +0200 schrieb Christian König:
>> Am 06.04.23 um 12:45 schrieb Lucas Stach:
>>> Am Donnerstag, dem 06.04.2023 um 10:27 +0200 schrieb Daniel Vetter:
>>>> On Thu, 6 Apr 2023 at 10:22, Christian König <christian.koenig@amd.com> wrote:
>>>>> Am 05.04.23 um 18:09 schrieb Luben Tuikov:
>>>>>> On 2023-04-05 10:05, Danilo Krummrich wrote:
>>>>>>> On 4/4/23 06:31, Luben Tuikov wrote:
>>>>>>>> On 2023-03-28 04:54, Lucas Stach wrote:
>>>>>>>>> Hi Danilo,
>>>>>>>>>
>>>>>>>>> Am Dienstag, dem 28.03.2023 um 02:57 +0200 schrieb Danilo Krummrich:
>>>>>>>>>> Hi all,
>>>>>>>>>>
>>>>>>>>>> Commit df622729ddbf ("drm/scheduler: track GPU active time per entity")
>>>>>>>>>> tries to track the accumulated time that a job was active on the GPU
>>>>>>>>>> writing it to the entity through which the job was deployed to the
>>>>>>>>>> scheduler originally. This is done within drm_sched_get_cleanup_job()
>>>>>>>>>> which fetches a job from the schedulers pending_list.
>>>>>>>>>>
>>>>>>>>>> Doing this can result in a race condition where the entity is already
>>>>>>>>>> freed, but the entity's newly added elapsed_ns field is still accessed
>>>>>>>>>> once the job is fetched from the pending_list.
>>>>>>>>>>
>>>>>>>>>> After drm_sched_entity_destroy() being called it should be safe to free
>>>>>>>>>> the structure that embeds the entity. However, a job originally handed
>>>>>>>>>> over to the scheduler by this entity might still reside in the
>>>>>>>>>> schedulers pending_list for cleanup after drm_sched_entity_destroy()
>>>>>>>>>> already being called and the entity being freed. Hence, we can run into
>>>>>>>>>> a UAF.
>>>>>>>>>>
>>>>>>>>> Sorry about that, I clearly didn't properly consider this case.
>>>>>>>>>
>>>>>>>>>> In my case it happened that a job, as explained above, was just picked
>>>>>>>>>> from the schedulers pending_list after the entity was freed due to the
>>>>>>>>>> client application exiting. Meanwhile this freed up memory was already
>>>>>>>>>> allocated for a subsequent client applications job structure again.
>>>>>>>>>> Hence, the new jobs memory got corrupted. Luckily, I was able to
>>>>>>>>>> reproduce the same corruption over and over again by just using
>>>>>>>>>> deqp-runner to run a specific set of VK test cases in parallel.
>>>>>>>>>>
>>>>>>>>>> Fixing this issue doesn't seem to be very straightforward though (unless
>>>>>>>>>> I miss something), which is why I'm writing this mail instead of sending
>>>>>>>>>> a fix directly.
>>>>>>>>>>
>>>>>>>>>> Spontaneously, I see three options to fix it:
>>>>>>>>>>
>>>>>>>>>> 1. Rather than embedding the entity into driver specific structures
>>>>>>>>>> (e.g. tied to file_priv) we could allocate the entity separately and
>>>>>>>>>> reference count it, such that it's only freed up once all jobs that were
>>>>>>>>>> deployed through this entity are fetched from the schedulers pending list.
>>>>>>>>>>
>>>>>>>>> My vote is on this or something in similar vain for the long term. I
>>>>>>>>> have some hope to be able to add a GPU scheduling algorithm with a bit
>>>>>>>>> more fairness than the current one sometime in the future, which
>>>>>>>>> requires execution time tracking on the entities.
>>>>>>>> Danilo,
>>>>>>>>
>>>>>>>> Using kref is preferable, i.e. option 1 above.
>>>>>>> I think the only real motivation for doing that would be for generically
>>>>>>> tracking job statistics within the entity a job was deployed through. If
>>>>>>> we all agree on tracking job statistics this way I am happy to prepare a
>>>>>>> patch for this option and drop this one:
>>>>>>> https://lore.kernel.org/all/20230331000622.4156-1-dakr@redhat.com/T/#u
>>>>>> Hmm, I never thought about "job statistics" when I preferred using kref above.
>>>>>> The reason kref is attractive is because one doesn't need to worry about
>>>>>> it--when the last user drops the kref, the release is called to do
>>>>>> housekeeping. If this never happens, we know that we have a bug to debug.
>>>>> Yeah, reference counting unfortunately have some traps as well. For
>>>>> example rarely dropping the last reference from interrupt context or
>>>>> with some unexpected locks help when the cleanup function doesn't expect
>>>>> that is a good recipe for problems as well.
>>>>>
>>> Fully agreed.
>>>
>>>>>> Regarding the patch above--I did look around the code, and it seems safe,
>>>>>> as per your analysis, I didn't see any reference to entity after job submission,
>>>>>> but I'll comment on that thread as well for the record.
>>>>> Reference counting the entities was suggested before. The intentionally
>>>>> avoided that so far because the entity might be the tip of the iceberg
>>>>> of stuff you need to keep around.
>>>>>
>>>>> For example for command submission you also need the VM and when you
>>>>> keep the VM alive you also need to keep the file private alive....
>>>> Yeah refcounting looks often like the easy way out to avoid
>>>> use-after-free issue, until you realize you've just made lifetimes
>>>> unbounded and have some enourmous leaks: entity keeps vm alive, vm
>>>> keeps all the bo alives, somehow every crash wastes more memory
>>>> because vk_device_lost means userspace allocates new stuff for
>>>> everything.
>>>>
>>>> If possible a lifetime design where lifetimes have hard bounds and you
>>>> just borrow a reference under a lock (or some other ownership rule) is
>>>> generally much more solid. But also much harder to design correctly
>>>> :-/
>>>>
>>> The use we are discussing here is to keep the entity alive as long as
>>> jobs from that entity are still active on the HW. While there are no
>>> hard bounds on when a job will get inactive, at least it's not
>>> unbounded. On a crash/fault the job will be removed from the hardware
>>> pretty soon.
>>>
>>> Well behaved jobs after a application shutdown might take a little
>>> longer, but I don't really see the new problem with keeping the entity
>>> alive? As long as a job is active on the hardware, we can't throw out
>>> the VM or BOs, no difference whether the entity is kept alive or not.
>> Exactly that's the problem. VM & BOs are dropped as soon as the process
>> is destroyed, we *don't* wait for the hw to finish before doing so.
>>
>> Just the backing store managed by all the house keeping objects isn't
>> freed until the hw is idle preventing a crash or accessing freed memory.
>>
>> This behavior is rather important for the OOM killer since we need to be
>> able to tear down the process as fast as possible in that case.
>>
> Are you talking about the dropping of pending jobs in
> drm_sched_entity_kill? I'm certainly not trying to change that in any
> way. Those aren't put onto the hardware yet, so we can always safely
> drop them and do so as fast as possible.
>
> What I'm concerned about are the jobs that are already scheduled on the
> HW. At least with Vivante hardware there is no race free way to get rid
> of jobs once they are put on the ring. So whatever the scheduler or DRM
> core is doing, we have to hold on to the BOs and GPU memory management
> structures to keep the hardware from operating on freed memory.
>
> That's already a lot of memory, so I don't really see the issue with
> keeping the entity around in a quiescent state until all the currently
> queued jobs have left the HW.
>
>> Changing that is possible, but that's quite a huge change I'm not really
>> willing to do just for tracking the time spend.
>>
> Yea, it's a big change and whether it's a good idea really depends on
> what we a gaining from it. You seem to see quite low value in "just
> tracking the time spent" and that might be true, but it also forces all
> drivers that want to implement fdinfo to roll their own time tracking.
> I would rather see more of this moved to the scheduler and thus shared
> between drivers.

That's generally a good idea, but if that means that we need to 
restructure the whole entity handling then I would object. That's simply 
not worth it when we can implement it differently.

What we could do is to keep the submitted fences around in the entity. 
Similar to the tracking amdgpu does, see struct amdgpu_ctx_entity.

This way the entity doesn't needs to stay around after it delivered the 
job to the hw.

Regards,
Christian.

> Regards,
> Lucas
>
>> What we could do is to track the unsignaled fences in each entity
>> similar to what amdgpu is doing.
>>
>> Regards,
>> Christian.
>>
>>> Some hardware might have ways to expedite job inactivation by
>>> deactivating scheduling queues, or just taking a fault, but for some HW
>>> we'll just have to wait for the job to finish.
>>>
>>> Regards,
>>> Lucas
>>>

