Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 13CFD6DA5D4
	for <lists+dri-devel@lfdr.de>; Fri,  7 Apr 2023 00:30:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A878010ED3B;
	Thu,  6 Apr 2023 22:30:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2061d.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe59::61d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA11510ED3B
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Apr 2023 22:30:40 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=E5CbT4LsrhQzK3rny59KhUA+nC3MkSvH/fljA2/TduNcwFG6RUFogQfehHywjxB4RPJ8ZZrx4n60IpvQ7lVhG4AJE3lhQYr228iiONf/WE0eA/keRADjLHBETOels0t2ndVLrMoQ2jlz/Ldn7SNboZr8rc1NQx4pZZFNlJAVXdAdv15K2O4n3iJZwi52cP9pRbQkTGUwtGIziwPgh/7JAYXtamAtpIlO54kSoPZ/p5oUa9NU3zooDn9Yfj7yhVkmJPHMA00Kg6QtmnvXmsGDKuf0cvh4Meny/ZsZINlhYwykr9wyJc9A2j7wRqO9VsMsGhSzmdkTuJdG/UIghS4Waw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=i1KC2aV2AJ7QEqpkucoji2V2migBk14nOdI6aC3XKUo=;
 b=SCsp5YycDxFCuZhF3XXvtROJAqXvva61vauMieMHrSgHZRbzczj1Xi8FcVSbIx5D+jXlzzNJCzl+Qh35uDYsZBLsvp5l/4FfDd3PQLKtIpDHUmJOu1RP+s6MVqZE3WJvffEvNbOCUISaa1LGw2db0+XRYUlVgoKeLJ5daAyFU7E//Dw+FTiyrtbHK1FXjuETnnA65LUUEWjnelEALkZSwRPEI+S16UiPDxkpqm+T1wVqlfl2BFOZcJauQH25uHq6tH/CMyQGLsfBhCCPX1zIPZT4uKUDMBxcadoxv5VPMAdWH6hf2PKc6jKo12FyTPzCrVkkWvgRn4b0c/3z514FdQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=i1KC2aV2AJ7QEqpkucoji2V2migBk14nOdI6aC3XKUo=;
 b=qoZFOFPLy/NwBjSIUraMaitVvdO8UiEqD/3UhH795p7een8p9KCRWnt3BsHYkgbFDhpw+agTuPAj4FLjYBWf2NtuBKCU/iC1BZvbxXa7uylXzweIczYdYt+xRD+Pd9B/8lbmrwTUnAFLqSynNzosTSf79d5a8RRuGc7w9NyEiHA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM6PR12MB3370.namprd12.prod.outlook.com (2603:10b6:5:38::25) by
 MN0PR12MB6222.namprd12.prod.outlook.com (2603:10b6:208:3c2::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6254.35; Thu, 6 Apr
 2023 22:30:37 +0000
Received: from DM6PR12MB3370.namprd12.prod.outlook.com
 ([fe80::8299:158a:c296:de80]) by DM6PR12MB3370.namprd12.prod.outlook.com
 ([fe80::8299:158a:c296:de80%6]) with mapi id 15.20.6277.031; Thu, 6 Apr 2023
 22:30:37 +0000
Message-ID: <d8589d26-e237-6ad2-0c0d-565e573b8b69@amd.com>
Date: Thu, 6 Apr 2023 18:30:32 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Content-Language: en-CA
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 Danilo Krummrich <dakr@redhat.com>, Lucas Stach <l.stach@pengutronix.de>,
 daniel@ffwll.ch, Dave Airlie <airlied@gmail.com>,
 Bagas Sanjaya <bagasdotme@gmail.com>, andrey.grodzovsky@amd.com,
 tvrtko.ursulin@linux.intel.com, Matthew Brost <matthew.brost@intel.com>,
 yuq825@gmail.com, Boris Brezillon <boris.brezillon@collabora.com>,
 lina@asahilina.net
References: <3e00d8a9-b6c4-8202-4f2d-5a659c61d094@redhat.com>
 <2a84875dde6565842aa07ddb96245b7d939cb4fd.camel@pengutronix.de>
 <8b28151c-f2db-af3f-8dff-87dd5d57417b@amd.com>
 <3004a2bf-e725-643e-82af-8a217784e796@redhat.com>
 <013781a3-5abd-8c66-8a0a-dd36c9c487af@amd.com>
 <28d10733-b217-7ccc-4b8c-54bdc8249234@amd.com>
From: Luben Tuikov <luben.tuikov@amd.com>
Subject: Re: [Regression] drm/scheduler: track GPU active time per entity
In-Reply-To: <28d10733-b217-7ccc-4b8c-54bdc8249234@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YT3PR01CA0080.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:84::23) To DM6PR12MB3370.namprd12.prod.outlook.com
 (2603:10b6:5:38::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR12MB3370:EE_|MN0PR12MB6222:EE_
X-MS-Office365-Filtering-Correlation-Id: dbf79ea5-509e-4a2a-b2ea-08db36ee8b1f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: pc1I0L3lZFtFxZ/kKUoOEp9nz2UaFpBYSGgDec/SaF+k2ARub84oDbn3GLHRK+9iLJkgkdRsM6K8/XMUEMq/JVw1hOtPTzy16Wl1hjSIrEYqKzCKkoNlmVPx9goCJMbMFSVlcpS2hsM1NX8erIUDnZ+cRq1gY3H0NaAfozqEsyMPQqo/t0BIPVVu1CMNv3v89OSePJs937JgejRb4oYmG7pL9X1uwkB6VlUKR/6bbtdFu/atLMJ7uRiibRSK4g9blvrs4N6JbZqMiYKo53RvS3YS+yRtDmE2BE0/m5JRZkQlgRPAvCliSR2XSQGV6oOV0AyPJRmFr4GrscomeS9ioObYWWH0YzVWlgOGwCXlGkY2FxOfOV2RG845+o88ac87V0DFqI7IQQEgjNg+n7J7YGPkyxa+MhqmHD9GaarHUavLOmIqhDU/syfQoHW+jPwyWozX7dPGCQkT974oK1MJXgMtF8J5s9f52n2I/RW0x65QpkSK6bBQ98x/afVwPK/x+h+BOYni7g2fvwiY1d+PsH0bhLWExOndHIF1MxB2HjNDNsdhjtGSPJF7x+5SbsAD2zcgieRf8s1EeUFj/DSAE+Id0bcF99GLm9BmeKHxaJusxY0mc4rPjFOwddPsR/6INjhOt0JmdWrwdrduz7x/Ub8D9tDU7qJpoc0NTcn2+To=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB3370.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(39860400002)(346002)(396003)(376002)(366004)(136003)(451199021)(31686004)(6486002)(66574015)(966005)(4326008)(66556008)(41300700001)(110136005)(66476007)(8676002)(66946007)(316002)(36756003)(31696002)(86362001)(83380400001)(6506007)(6512007)(6666004)(8936002)(53546011)(38100700002)(921005)(44832011)(478600001)(5660300002)(7416002)(26005)(186003)(2616005)(2906002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MnFMdlFxVHFaUnRTUG4zbnFtOWhjZUhrSjVIZ2s5TDd0eVl3K2FWOHdKOTJN?=
 =?utf-8?B?Z005ZTVqUWovUVNWamJacVJjYU16N1ZBWFZqQ3JWclUxbDI1L0VRRGduZ3ZV?=
 =?utf-8?B?ZDNlb3ZLeEFXNjROQ0tVNGtZZDFjRkVza0szM0xNUlR1dWRRT2liT3dJTjBm?=
 =?utf-8?B?TWlSY2k5L3NnZEtZWkNsWmpCWDNCT1RHQWlJL210YTJnbjVWUVFMZDFUYVFG?=
 =?utf-8?B?S29BSVJRc25iOVBVKzFoS2ZaL0htK3paZGgrbkJWZ2hseVFnU2ZqeUFtVDlx?=
 =?utf-8?B?dnkvNDNvVTRkOEFZVE9QQ2ZoTXNTd29MSlB0aEh6d0QwTm92dSs2dXRnRW11?=
 =?utf-8?B?aTFjc0luckV4ZGlyYTQxYkF2R1hVRUpsYkVOOWYyZWY4Vkdya0FVdFFpdklh?=
 =?utf-8?B?dVZVTFJPL1h3SWEyempIOUlRaFFBUkloWTRCMm5vdC85TkRWZnc0NzE5VldL?=
 =?utf-8?B?WTFCSWRsV0UrZGlVdFNGWDk2ZUFuVWhoRWN0aXNZOU5sZ2RndmlRWWdJdU5B?=
 =?utf-8?B?TWY5WTNUS0V0YUtIZmozV3JzMTVHUnNIWEc3RFR5cUdXTmhxWEttTzFGZjBy?=
 =?utf-8?B?NWg3Y3JWUlpiYjBvZlFLdVFXZ2hKRzFaMVowU2lqbGRwOFozYW9KcElqRkUw?=
 =?utf-8?B?QnRUNENITHgza21YMnMxd2h0QXpBbHBBdFp5cUhjVWg0L3hqT052QVRBeGVK?=
 =?utf-8?B?L1lQSUVRMUNra0pZMnowNHpZWUMrNUptK2dtem9SRkV6YWswa3hjd1g3aWsv?=
 =?utf-8?B?S2VKaTd4a2pkdFMrSDB2aXdRSlAxYnlUYUswd20wTUZ4bUw5OGFiaWNrZHdG?=
 =?utf-8?B?UldON1pYRCsxalRQU25xNGNxTjZVSEtLOE9NYnY2NW9EZFBEODBBQmxSMGFy?=
 =?utf-8?B?MnFpcWljdGk1djdMVE55NWxFZzJFUWhzWHpKZzFTSVRJVnpENUNObXpLa2RZ?=
 =?utf-8?B?VlVhUUFsRkxuWHRxbnU1bzFMT1NhbWFVOWE0d2s3SjR1NFFwSFNQRTg1QWpR?=
 =?utf-8?B?S2U1aWcya3pTUWlTLzhlSzU2LysxeXloOWxibWdlMDRFdUlaaU5GWWFDQmZP?=
 =?utf-8?B?aEhhYldYT21CcFRBSGI4dmZBa0I0ZmZWTDhJOFhSNDJlQjlhajRwdzl3Q2FL?=
 =?utf-8?B?NklGZkNhZmZrK0lIMHE0NUZua0Y2NjNuNmZHcStYN2NzQTh0QkpaNzI4MG9L?=
 =?utf-8?B?Um45S3RGVGMybzBxdFJzR25UU1BubGRJL2NoSDdhZ3JzVDVRZGNOWk54aUY4?=
 =?utf-8?B?RzNMMjRYS2ptek16eUNNdjJ5ZGpYcTVMaFdWeXJFZWk3anpRanMvdFkyNllK?=
 =?utf-8?B?TCtlUlhLeVBIUzh5bFYvYTAvc1dhZkxtZGdybHNSQ2N6TmVtSkJGakQ1TDlJ?=
 =?utf-8?B?WXZPQXhtdy9rMlVzV3lMVkFJV0xEb0M5VzVmdjZHMlNTVzNoNjNzaGEycnNI?=
 =?utf-8?B?emlIN3EvdmhJRXJHSkJBYkRvL0VNTFBPMkorRVQ5TUJSUUprejFVQ2dDSWIy?=
 =?utf-8?B?VmZWbHFQOGE4UHNaKzJiQWtNV1VrTnZTcndnUFZkU3JtV1VITXNQOEJicWJN?=
 =?utf-8?B?SzFVUnB6RTBmaUlHNWlINExFcTBoUk5DOVZXWmJkcldKbzdnNGViY003YVJt?=
 =?utf-8?B?MVdCdWFSTkRSMTlOM1FIYmgxOXg5aTZ1Z1pyTXgyRXNuOGpMZXpRV2R4UHZ4?=
 =?utf-8?B?RGlUbHJPdXRjR1FBK0NJbC9KSC9RQTF2UHBKd1R4eERuTE5VMXlMU3lWSGlt?=
 =?utf-8?B?WXY3NVluRjNXcWRsTmtJWUk0WjJsSDNWd2RCLzVwUm5ySHR0dm0yVjNEWXhI?=
 =?utf-8?B?czhkaVNHSmpMTG1YU0JwU1g4Z1RIQnpKeHExREpvU3IveG5ISDh2VXZ2bG1h?=
 =?utf-8?B?S3ZTN3pWUnBzMU9vbkxkbC9nMzJhL2pIVmZ0U1g4bmZNRmVBYk4yUVBMZnN2?=
 =?utf-8?B?ZEZtN2Mzc3NBck9KYXM0VTRUT280YkEyTWNWcEhhQUxkK054akVwZG45Z1FH?=
 =?utf-8?B?dWZCRDluc05NSFJtT3pPRlVaTWtLc1FtV01FdmJKYnBwVGhZRzNjQVVqdjY0?=
 =?utf-8?B?ZUNKRXpxcmhsL2ExRUQwYXRJU3pzNDRaNUd5bEY5ekZQbE84bmdoYnNGZzlv?=
 =?utf-8?Q?TaaVQk4EB6sH8YQNR+Bs17asM?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dbf79ea5-509e-4a2a-b2ea-08db36ee8b1f
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB3370.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Apr 2023 22:30:36.9037 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: slyNSbO1CFvSIkCjLekAHm9DtYo56iEDkSGc6wGFxqcN6D4pIi6A7jSVPQ0dpb9I
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB6222
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

On 2023-04-06 04:22, Christian König wrote:
> Am 05.04.23 um 18:09 schrieb Luben Tuikov:
>> On 2023-04-05 10:05, Danilo Krummrich wrote:
>>> On 4/4/23 06:31, Luben Tuikov wrote:
>>>> On 2023-03-28 04:54, Lucas Stach wrote:
>>>>> Hi Danilo,
>>>>>
>>>>> Am Dienstag, dem 28.03.2023 um 02:57 +0200 schrieb Danilo Krummrich:
>>>>>> Hi all,
>>>>>>
>>>>>> Commit df622729ddbf ("drm/scheduler: track GPU active time per entity")
>>>>>> tries to track the accumulated time that a job was active on the GPU
>>>>>> writing it to the entity through which the job was deployed to the
>>>>>> scheduler originally. This is done within drm_sched_get_cleanup_job()
>>>>>> which fetches a job from the schedulers pending_list.
>>>>>>
>>>>>> Doing this can result in a race condition where the entity is already
>>>>>> freed, but the entity's newly added elapsed_ns field is still accessed
>>>>>> once the job is fetched from the pending_list.
>>>>>>
>>>>>> After drm_sched_entity_destroy() being called it should be safe to free
>>>>>> the structure that embeds the entity. However, a job originally handed
>>>>>> over to the scheduler by this entity might still reside in the
>>>>>> schedulers pending_list for cleanup after drm_sched_entity_destroy()
>>>>>> already being called and the entity being freed. Hence, we can run into
>>>>>> a UAF.
>>>>>>
>>>>> Sorry about that, I clearly didn't properly consider this case.
>>>>>
>>>>>> In my case it happened that a job, as explained above, was just picked
>>>>>> from the schedulers pending_list after the entity was freed due to the
>>>>>> client application exiting. Meanwhile this freed up memory was already
>>>>>> allocated for a subsequent client applications job structure again.
>>>>>> Hence, the new jobs memory got corrupted. Luckily, I was able to
>>>>>> reproduce the same corruption over and over again by just using
>>>>>> deqp-runner to run a specific set of VK test cases in parallel.
>>>>>>
>>>>>> Fixing this issue doesn't seem to be very straightforward though (unless
>>>>>> I miss something), which is why I'm writing this mail instead of sending
>>>>>> a fix directly.
>>>>>>
>>>>>> Spontaneously, I see three options to fix it:
>>>>>>
>>>>>> 1. Rather than embedding the entity into driver specific structures
>>>>>> (e.g. tied to file_priv) we could allocate the entity separately and
>>>>>> reference count it, such that it's only freed up once all jobs that were
>>>>>> deployed through this entity are fetched from the schedulers pending list.
>>>>>>
>>>>> My vote is on this or something in similar vain for the long term. I
>>>>> have some hope to be able to add a GPU scheduling algorithm with a bit
>>>>> more fairness than the current one sometime in the future, which
>>>>> requires execution time tracking on the entities.
>>>> Danilo,
>>>>
>>>> Using kref is preferable, i.e. option 1 above.
>>> I think the only real motivation for doing that would be for generically
>>> tracking job statistics within the entity a job was deployed through. If
>>> we all agree on tracking job statistics this way I am happy to prepare a
>>> patch for this option and drop this one:
>>> https://lore.kernel.org/all/20230331000622.4156-1-dakr@redhat.com/T/#u
>> Hmm, I never thought about "job statistics" when I preferred using kref above.
>> The reason kref is attractive is because one doesn't need to worry about
>> it--when the last user drops the kref, the release is called to do
>> housekeeping. If this never happens, we know that we have a bug to debug.
> 
> Yeah, reference counting unfortunately have some traps as well. For 
> example rarely dropping the last reference from interrupt context or 
> with some unexpected locks help when the cleanup function doesn't expect 
> that is a good recipe for problems as well.
> 
>> Regarding the patch above--I did look around the code, and it seems safe,
>> as per your analysis, I didn't see any reference to entity after job submission,
>> but I'll comment on that thread as well for the record.
> 
> Reference counting the entities was suggested before. The intentionally 
> avoided that so far because the entity might be the tip of the iceberg 
> of stuff you need to keep around.
> 
> For example for command submission you also need the VM and when you 
> keep the VM alive you also need to keep the file private alive....
> 
> Additional to that we have some ugly inter dependencies between tearing 
> down an application (potential with a KILL signal from the OOM killer) 
> and backward compatibility for some applications which render something 
> and quit before the rendering is completed in the hardware.

In my experience, ref counting has worked--just worked, even in
completely untested and unimagined circumstances. You pull
a cable (back end), or kill an app (front end) and everything
gracefully shuts down and gets freed.

(Behind that cable, you can have thousands of hardware entities,
(represented in the kernel), each processing thousands of work requests
(each represented in the kernel), but kref worked fine, very gracefully.)

Of course, what the dependency graph should be (what structs depends on
what structs), and what each struct should contain--that's what was spent
the most time, not coding, but really, it all worked like magic.

So, maybe, we should start anew...
-- 
Regards,
Luben

> 
> Regards,
> Christian.
> 
>>
>> Regards,
>> Luben
>>
>>> Christian mentioned amdgpu tried something similar to what Lucas tried
>>> running into similar trouble, backed off and implemented it in another
>>> way - a driver specific way I guess?
>>>
>>>> Lucas, can you shed some light on,
>>>>
>>>> 1. In what way the current FIFO scheduling is unfair, and
>>>> 2. shed some details on this "scheduling algorithm with a bit
>>>> more fairness than the current one"?
>>>>
>>>> Regards,
>>>> Luben
>>>>
>>>>>> 2. Somehow make sure drm_sched_entity_destroy() does block until all
>>>>>> jobs deployed through this entity were fetched from the schedulers
>>>>>> pending list. Though, I'm pretty sure that this is not really desirable.
>>>>>>
>>>>>> 3. Just revert the change and let drivers implement tracking of GPU
>>>>>> active times themselves.
>>>>>>
>>>>> Given that we are already pretty late in the release cycle and etnaviv
>>>>> being the only driver so far making use of the scheduler elapsed time
>>>>> tracking I think the right short term solution is to either move the
>>>>> tracking into etnaviv or just revert the change for now. I'll have a
>>>>> look at this.
>>>>>
>>>>> Regards,
>>>>> Lucas
>>>>>
>>>>>> In the case of just reverting the change I'd propose to also set a jobs
>>>>>> entity pointer to NULL  once the job was taken from the entity, such
>>>>>> that in case of a future issue we fail where the actual issue resides
>>>>>> and to make it more obvious that the field shouldn't be used anymore
>>>>>> after the job was taken from the entity.
>>>>>>
>>>>>> I'm happy to implement the solution we agree on. However, it might also
>>>>>> make sense to revert the change until we have a solution in place. I'm
>>>>>> also happy to send a revert with a proper description of the problem.
>>>>>> Please let me know what you think.
>>>>>>
>>>>>> - Danilo
>>>>>>
> 

