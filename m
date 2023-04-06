Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 887B76DA5DE
	for <lists+dri-devel@lfdr.de>; Fri,  7 Apr 2023 00:36:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C92A10ED3E;
	Thu,  6 Apr 2023 22:36:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2060f.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7eab::60f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 599B010ED3E
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Apr 2023 22:36:23 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gok+FZb/8SZSdkXVZtTLVwHmzhq9HxWHLu5fEyWwvA8vrdJMpKm2ILr7L2e7fOC23RLyXW7mJ0tQcJPVv/g+xSLXg2UoLdnc+q9FG/3GB7RL/Xzva2W18wqLNVYDDOmimyLejJ70xryix/W6LOt3NAbtaky3oOC0JBcusko/bM9lOL2vmaqVA69s105bMjjEGJsEhwIISQucx+GeJIQ6KiZbtbHwBS3apQHHLSY9j4FVc0gItNygSCksZrvXvLakWD/1jUHW5Bt4yAwLoCYeaH+8rQBOXdn5qDNjm2SB66mu8GxYShIaJZwfPf3Hrk9ttfjLavMGbx6CAoCCH0MeRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vDEhuqHVMyT+O1SetLCi5bgGNITKGoIVClVStTNpt3Y=;
 b=RO0itScXVsnTvcwZ7puxoK+/ae38tGXAwS30X88eC+Qfi8i4vRkUTnR0j5fUwCEPqykT+njHCObpyZbev8q1f49uzZG+xt1gVDUCJObx/1mwabXN5R28sSorZHOJ8upoTfYlrTsbrT53r9UDeNAUoScwfoo8qYZMjIdihj3jfPfcTyYyLWiqtb+1NTmeFfM6Gqu5+ViP5itbGViJIsF212QVPks3zEtQ74VL4Scmij6sDzXoq+8gIXecdD6Ct8P2O64r3AL06hj2UqlxxGnwN/YQi0ZugJe40tuaiEkhVab23JhOPbfqrdJTSUjL4NJI2iiHNUb96cTADVNCtYk1Ug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vDEhuqHVMyT+O1SetLCi5bgGNITKGoIVClVStTNpt3Y=;
 b=tCu8mdCxtf4ZD0ZEhbeU9pdw/XTiBvzWmaDdmGw+0cbs6kBNovJD0CoowXcTwNjpIfK9dVf+Xx8yRDy+DU4VHEQGBrSxLFgRc5DHk/Fp4yLUuzChIVuPxOy+YjGpSaAbFDjY+nFxkAGxwHy+T+I+ZF1/8hDeSyYV8hD+JfHOD0A=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM6PR12MB3370.namprd12.prod.outlook.com (2603:10b6:5:38::25) by
 DM4PR12MB6111.namprd12.prod.outlook.com (2603:10b6:8:ac::21) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6254.35; Thu, 6 Apr 2023 22:36:17 +0000
Received: from DM6PR12MB3370.namprd12.prod.outlook.com
 ([fe80::8299:158a:c296:de80]) by DM6PR12MB3370.namprd12.prod.outlook.com
 ([fe80::8299:158a:c296:de80%6]) with mapi id 15.20.6277.031; Thu, 6 Apr 2023
 22:36:17 +0000
Message-ID: <41828d55-f4d5-a745-3d89-5179ce235944@amd.com>
Date: Thu, 6 Apr 2023 18:36:11 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Content-Language: en-CA
To: Lucas Stach <l.stach@pengutronix.de>, Daniel Vetter <daniel@ffwll.ch>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
References: <3e00d8a9-b6c4-8202-4f2d-5a659c61d094@redhat.com>
 <2a84875dde6565842aa07ddb96245b7d939cb4fd.camel@pengutronix.de>
 <8b28151c-f2db-af3f-8dff-87dd5d57417b@amd.com>
 <3004a2bf-e725-643e-82af-8a217784e796@redhat.com>
 <013781a3-5abd-8c66-8a0a-dd36c9c487af@amd.com>
 <28d10733-b217-7ccc-4b8c-54bdc8249234@amd.com>
 <CAKMK7uFeeAaG8+1EutgMtmVANTb-acL0faEkJfUp1_35rSjaEg@mail.gmail.com>
 <9c72c7162da56234addd7083ec774e525a13957c.camel@pengutronix.de>
From: Luben Tuikov <luben.tuikov@amd.com>
Subject: Re: [Regression] drm/scheduler: track GPU active time per entity
In-Reply-To: <9c72c7162da56234addd7083ec774e525a13957c.camel@pengutronix.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YT4PR01CA0117.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:d7::23) To DM6PR12MB3370.namprd12.prod.outlook.com
 (2603:10b6:5:38::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR12MB3370:EE_|DM4PR12MB6111:EE_
X-MS-Office365-Filtering-Correlation-Id: c07012de-dcf6-4871-d820-08db36ef5659
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: FVMFfAnXq2PhuFBkNz4zT3C8Q0Z9uek183+VMOaFY2uxWtIVMxPm/k/O8qBYMLAztMVonFIdJgYOVJGOjwM9F1bVzkQmqdtTkEpbZMJxaf1qoONUeowUc9p+aYnvAl29JOdOrBtlGvlrPM1kTjvTv5uP60KcnIcEhOEnRWQTTnuopxgEx6ewuL/Z9MbgzSP2VPva9J8g9iD4uo3ySntrZ3T/1LuQu+vwGrQBF1IkyKZ86P21OtuLldwLLqKUrw3+gzxP/gLFDsBCLicuwrVxN5kIGUkrIycRrd8PZqTyVTl2xaVtO/yXyNLiaglAuQg2/ezALoS6Wv1Ml4wfdUWwiIjkXBPXi6BknNudR35jlLRJtZ3h96hs/JYt6PozAUj1Vbnpz/acRPyEice24/F1YlNJzTaQqlyyFO3x/g2GRKxvrHzKk3PZ/z2kiuN2ztMcWVO8Vv7yCEQ1mfO8aNc3SFb19WbEdHXGRZekZBT02A9ub+0qZ+RsdDGOhrhEVJA9x10oWdmWYf4eY4y44vQ3Q3VvIXPK/cLzcBuZG38gPMU79XBOccmnA1YeVbwxX5xC6XART1q5qBos9sAT4io2ZVT5LGhiyUD0rcLFPCBxEU40ojJXho+bwINUUW1Cn9H8P3ewanKlBnOJx9QwTInGoQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB3370.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(346002)(376002)(366004)(39860400002)(136003)(396003)(451199021)(186003)(6506007)(53546011)(6512007)(26005)(38100700002)(8936002)(8676002)(478600001)(6636002)(54906003)(316002)(86362001)(966005)(6486002)(66476007)(66556008)(4326008)(6666004)(66946007)(36756003)(110136005)(31696002)(66574015)(41300700001)(7416002)(83380400001)(5660300002)(31686004)(44832011)(2906002)(2616005)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UUpxY0VobFNkRkFIMTk0UDlQK0l2Ni9QMWpBUGNGcWpNdzFQaEpOaHpLQkRr?=
 =?utf-8?B?ZGtyS3E4NmJJUjJpQ09IZis5eGVRWXl2NU5MR3lnaUtyQU5JRldFT3FqbC9E?=
 =?utf-8?B?NXRFSkdKMVkxditYdzlScm9raE1YVG5HNlg3UGh5dm9aaTF0dEh0MkRiTUY5?=
 =?utf-8?B?WlVyZW1rLzhCdzcrR24rcHJoVEptMXV3MERYN24zZXB4MWNVYWpUckpIdDdT?=
 =?utf-8?B?blBCODM2SGpsbzdMZ1Q5eXBvQkhVZXRSY3pwZHVPU2lVaDdqczBWdHVQdUVZ?=
 =?utf-8?B?K1gyTVVqOWtqVXNzS1NGYXdCQk5mMUV6bXVQTUV4eDdoZy95YkZYRlJTNFdH?=
 =?utf-8?B?ck4rUzhFa3dZSXVkdUJSaFlZMU5oaWNrTndNclhkUXE1VXBpaFNWakZNTXc4?=
 =?utf-8?B?czN4NU9nRnp0RHpCbUJkQ2dZSE1YYkFpRGlMZE0ySVJPNWNBS3NUVVZnVUhL?=
 =?utf-8?B?NXpES0FTM2ZBQTlDdVVHODhJOFZQMWNxVXdaekpVK3VoK1NQc3JXbVdBRDVH?=
 =?utf-8?B?N0lmeHdQS28vOUxvTDhJamhJTVdhTDZaU2V4V0dJRnMveVhRN1dva1ZGZ3dD?=
 =?utf-8?B?K0tVN0Y1V1RxYjRtdzVhWms3blNwbTltWXJvUnlWNk5MaVd2aVBVbjRNTHFo?=
 =?utf-8?B?UVVDRzlaSXhVcEtjK3E3b2MvSXBvdDNoN29SbTlVQmQvYm9qWGdFcUdkNmZQ?=
 =?utf-8?B?WUMwbU9nb0FudUQ1MmdycWVETnFRbDRMNmZzMzMwc24rUUd3TjJVMTdFQmg0?=
 =?utf-8?B?TURIaDJzbzFPZFQ4c0NPRjVwTlVIYjBiMERydFc2WEY0VTFQcGFMakNWOEM2?=
 =?utf-8?B?Mks3ZTNtM2plcHhodzN0Y0lyMUhiRDMwK29PbTZHOUFxT1RKWldHNG9vQTc4?=
 =?utf-8?B?TU0xV3BKYXBXUzIxbDhOVjE4bE90eHpvMGRlbEkzRWljbzFhTVd3ajBxSzhG?=
 =?utf-8?B?WDVJeU1mbFA1WDhCMm9xaU9QSWpYbTE5QUNqYlV2S1pXeXVDMFg5MmJHZWg4?=
 =?utf-8?B?RU13S3grQ3NiUXJ2Z0ZIREFCSlZ2UzRiQzZHcnpLRkhxYTIwTGRPQ2tRMmxl?=
 =?utf-8?B?MVordzhvREZ0bzRBNWRDVHo4QzlWcm5LTmNVZkNBbUYzQTVqTHFJOUJWTWIv?=
 =?utf-8?B?Sm40Q1ZhOXpKTVFNTlpSWE55cmJzUkltMU5mMGk1c3FuSnhnZVlWa3FtcEZJ?=
 =?utf-8?B?TkE3YWlxZFpHd25qWlJPWUEzcVppRWUyK1dYa2lQdTJEZVZXcThMME9xU3Zk?=
 =?utf-8?B?dUFnQnNVUmUrRXIzRC9UMjRDSEN1eStFTldkQWMxeDBEcmpDY0NtNmdzS1A0?=
 =?utf-8?B?N2h2WkJNekNlaFc5YkpWczRBU2cyZ3JZWTgraGpoUGJralhhTmJld25uUjA3?=
 =?utf-8?B?SGpmcCs4aUZZMFBJTGVYcDFRSWZLd05sc3BFZVllZXM1S3M3djNTRHBaV0xq?=
 =?utf-8?B?Qk0wakQxdlVFZU90aTZtTTJPdGRmdk1ROHhuTjhaOGdyelhVQVM2a3J5V0hl?=
 =?utf-8?B?OE0vVkMwajBmdE1MaDRuNy9aVEJHVjlCbEVxRWw1MzNldnZ2SkhwT1MvTnNE?=
 =?utf-8?B?UzJyU1VLemU4TGNNVXJLVnZkekNYRUZFQzBxb25KMVd6TFFidXN5NDZKL3Bk?=
 =?utf-8?B?RTVReWN3T2h1ZWtUT0tlTlE0MTkwL3VZOWs1NFQ2NWU1MlowVmNDSURENC9Y?=
 =?utf-8?B?b05nMExkclZ1bWZsOUZuTWRFQ2Y2K1E4ZU95YmltS1N0Q3NmcTIzSXBGUnFu?=
 =?utf-8?B?ZGVZQkpCbFlrTE1yemE1TUREUUhKOFFITUZ4OHhnU3NMMmxzYnIxQzJLRFZF?=
 =?utf-8?B?ZTZoS09aYUZDZDlmSXdBSDJRVVpOc081NjhsUm1sc0lseWJwejVWWjR3MkRK?=
 =?utf-8?B?MjF3cFR2QmxGanVPeGhVancyeXc2cTI5R0JSYjM4VHUxK0RDMXpsTHhhVWZ6?=
 =?utf-8?B?R29ZMGFJUEo1Vk01aDJEaXQ3YlVKTlpaTS9MNjIzbjFSRkZFckQ5VWpMWnIz?=
 =?utf-8?B?SG4vYndPZEV1cGdDOVZxRXdNZFRhUlhFZ29nZ1hFRHRDZnNiYUN6SDFSSy81?=
 =?utf-8?B?M2hGREFOMGNtMldQNEZ1TTI0Ylh1M0ZiWlU2eWNxUVVVdFVra01BM1RwNlVU?=
 =?utf-8?Q?lJ9yF7bYpGCtQ1EhGNfz55ycT?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c07012de-dcf6-4871-d820-08db36ef5659
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB3370.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Apr 2023 22:36:17.8350 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +eQDJJkSV/olP5KcVzLXCnqz1FXY/qn0thro5oce8Mbdrdhz/tNQmSDf4UQoy0YV
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6111
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
 dri-devel@lists.freedesktop.org,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Danilo Krummrich <dakr@redhat.com>, yuq825@gmail.com,
 Bagas Sanjaya <bagasdotme@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2023-04-06 06:45, Lucas Stach wrote:
> Am Donnerstag, dem 06.04.2023 um 10:27 +0200 schrieb Daniel Vetter:
>> On Thu, 6 Apr 2023 at 10:22, Christian König <christian.koenig@amd.com> wrote:
>>>
>>> Am 05.04.23 um 18:09 schrieb Luben Tuikov:
>>>> On 2023-04-05 10:05, Danilo Krummrich wrote:
>>>>> On 4/4/23 06:31, Luben Tuikov wrote:
>>>>>> On 2023-03-28 04:54, Lucas Stach wrote:
>>>>>>> Hi Danilo,
>>>>>>>
>>>>>>> Am Dienstag, dem 28.03.2023 um 02:57 +0200 schrieb Danilo Krummrich:
>>>>>>>> Hi all,
>>>>>>>>
>>>>>>>> Commit df622729ddbf ("drm/scheduler: track GPU active time per entity")
>>>>>>>> tries to track the accumulated time that a job was active on the GPU
>>>>>>>> writing it to the entity through which the job was deployed to the
>>>>>>>> scheduler originally. This is done within drm_sched_get_cleanup_job()
>>>>>>>> which fetches a job from the schedulers pending_list.
>>>>>>>>
>>>>>>>> Doing this can result in a race condition where the entity is already
>>>>>>>> freed, but the entity's newly added elapsed_ns field is still accessed
>>>>>>>> once the job is fetched from the pending_list.
>>>>>>>>
>>>>>>>> After drm_sched_entity_destroy() being called it should be safe to free
>>>>>>>> the structure that embeds the entity. However, a job originally handed
>>>>>>>> over to the scheduler by this entity might still reside in the
>>>>>>>> schedulers pending_list for cleanup after drm_sched_entity_destroy()
>>>>>>>> already being called and the entity being freed. Hence, we can run into
>>>>>>>> a UAF.
>>>>>>>>
>>>>>>> Sorry about that, I clearly didn't properly consider this case.
>>>>>>>
>>>>>>>> In my case it happened that a job, as explained above, was just picked
>>>>>>>> from the schedulers pending_list after the entity was freed due to the
>>>>>>>> client application exiting. Meanwhile this freed up memory was already
>>>>>>>> allocated for a subsequent client applications job structure again.
>>>>>>>> Hence, the new jobs memory got corrupted. Luckily, I was able to
>>>>>>>> reproduce the same corruption over and over again by just using
>>>>>>>> deqp-runner to run a specific set of VK test cases in parallel.
>>>>>>>>
>>>>>>>> Fixing this issue doesn't seem to be very straightforward though (unless
>>>>>>>> I miss something), which is why I'm writing this mail instead of sending
>>>>>>>> a fix directly.
>>>>>>>>
>>>>>>>> Spontaneously, I see three options to fix it:
>>>>>>>>
>>>>>>>> 1. Rather than embedding the entity into driver specific structures
>>>>>>>> (e.g. tied to file_priv) we could allocate the entity separately and
>>>>>>>> reference count it, such that it's only freed up once all jobs that were
>>>>>>>> deployed through this entity are fetched from the schedulers pending list.
>>>>>>>>
>>>>>>> My vote is on this or something in similar vain for the long term. I
>>>>>>> have some hope to be able to add a GPU scheduling algorithm with a bit
>>>>>>> more fairness than the current one sometime in the future, which
>>>>>>> requires execution time tracking on the entities.
>>>>>> Danilo,
>>>>>>
>>>>>> Using kref is preferable, i.e. option 1 above.
>>>>> I think the only real motivation for doing that would be for generically
>>>>> tracking job statistics within the entity a job was deployed through. If
>>>>> we all agree on tracking job statistics this way I am happy to prepare a
>>>>> patch for this option and drop this one:
>>>>> https://lore.kernel.org/all/20230331000622.4156-1-dakr@redhat.com/T/#u
>>>> Hmm, I never thought about "job statistics" when I preferred using kref above.
>>>> The reason kref is attractive is because one doesn't need to worry about
>>>> it--when the last user drops the kref, the release is called to do
>>>> housekeeping. If this never happens, we know that we have a bug to debug.
>>>
>>> Yeah, reference counting unfortunately have some traps as well. For
>>> example rarely dropping the last reference from interrupt context or
>>> with some unexpected locks help when the cleanup function doesn't expect
>>> that is a good recipe for problems as well.
>>>
> Fully agreed.
> 
>>>> Regarding the patch above--I did look around the code, and it seems safe,
>>>> as per your analysis, I didn't see any reference to entity after job submission,
>>>> but I'll comment on that thread as well for the record.
>>>
>>> Reference counting the entities was suggested before. The intentionally
>>> avoided that so far because the entity might be the tip of the iceberg
>>> of stuff you need to keep around.
>>>
>>> For example for command submission you also need the VM and when you
>>> keep the VM alive you also need to keep the file private alive....
>>
>> Yeah refcounting looks often like the easy way out to avoid
>> use-after-free issue, until you realize you've just made lifetimes
>> unbounded and have some enourmous leaks: entity keeps vm alive, vm
>> keeps all the bo alives, somehow every crash wastes more memory
>> because vk_device_lost means userspace allocates new stuff for
>> everything.
>>
>> If possible a lifetime design where lifetimes have hard bounds and you
>> just borrow a reference under a lock (or some other ownership rule) is
>> generally much more solid. But also much harder to design correctly
>> :-/
>>
> The use we are discussing here is to keep the entity alive as long as
> jobs from that entity are still active on the HW. While there are no
> hard bounds on when a job will get inactive, at least it's not
> unbounded. On a crash/fault the job will be removed from the hardware
> pretty soon.
> 
> Well behaved jobs after a application shutdown might take a little
> longer, but I don't really see the new problem with keeping the entity
> alive? As long as a job is active on the hardware, we can't throw out
> the VM or BOs, no difference whether the entity is kept alive or not.
> 
> Some hardware might have ways to expedite job inactivation by
> deactivating scheduling queues, or just taking a fault, but for some HW
> we'll just have to wait for the job to finish.

This is generally solved by,
1) resetting the hardware, asynchronously and then freeing resources
   it holds, which we represent in the kernel, OR
2) if such a reset is unavailable (i.e. the device is in another async
   domain (such as some kind of external network)), then we free all
   resources representing it, and keep going.*

* Now the trick here is that each task is represented by a tag (which forms
a strictly increasing sequence), and when we receive a tag from the hardware
which is old, i.e. unknown, we pretend that all is well and ignore it.
(For DMA-in we might set up a bit-bucket in the HW controller, which is again
nothing new.)

My point is that this is solvable and really not that hard to do
given the right design--it really solves itself when properly designed.
We should strive for that.

Regards,
Luben

> 
> Regards,
> Lucas
> 
>>> Additional to that we have some ugly inter dependencies between tearing
>>> down an application (potential with a KILL signal from the OOM killer)
>>> and backward compatibility for some applications which render something
>>> and quit before the rendering is completed in the hardware.
>>
>> Yeah I think that part would also be good to sort out once&for all in
>> drm/sched, because i915 has/had the same struggle.
>> -Daniel
>>
>>>
>>> Regards,
>>> Christian.
>>>
>>>>
>>>> Regards,
>>>> Luben
>>>>
>>>>> Christian mentioned amdgpu tried something similar to what Lucas tried
>>>>> running into similar trouble, backed off and implemented it in another
>>>>> way - a driver specific way I guess?
>>>>>
>>>>>> Lucas, can you shed some light on,
>>>>>>
>>>>>> 1. In what way the current FIFO scheduling is unfair, and
>>>>>> 2. shed some details on this "scheduling algorithm with a bit
>>>>>> more fairness than the current one"?
>>>>>>
>>>>>> Regards,
>>>>>> Luben
>>>>>>
>>>>>>>> 2. Somehow make sure drm_sched_entity_destroy() does block until all
>>>>>>>> jobs deployed through this entity were fetched from the schedulers
>>>>>>>> pending list. Though, I'm pretty sure that this is not really desirable.
>>>>>>>>
>>>>>>>> 3. Just revert the change and let drivers implement tracking of GPU
>>>>>>>> active times themselves.
>>>>>>>>
>>>>>>> Given that we are already pretty late in the release cycle and etnaviv
>>>>>>> being the only driver so far making use of the scheduler elapsed time
>>>>>>> tracking I think the right short term solution is to either move the
>>>>>>> tracking into etnaviv or just revert the change for now. I'll have a
>>>>>>> look at this.
>>>>>>>
>>>>>>> Regards,
>>>>>>> Lucas
>>>>>>>
>>>>>>>> In the case of just reverting the change I'd propose to also set a jobs
>>>>>>>> entity pointer to NULL  once the job was taken from the entity, such
>>>>>>>> that in case of a future issue we fail where the actual issue resides
>>>>>>>> and to make it more obvious that the field shouldn't be used anymore
>>>>>>>> after the job was taken from the entity.
>>>>>>>>
>>>>>>>> I'm happy to implement the solution we agree on. However, it might also
>>>>>>>> make sense to revert the change until we have a solution in place. I'm
>>>>>>>> also happy to send a revert with a proper description of the problem.
>>>>>>>> Please let me know what you think.
>>>>>>>>
>>>>>>>> - Danilo
>>>>>>>>
>>>
>>
>>
> 

