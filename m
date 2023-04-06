Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CA6856D9164
	for <lists+dri-devel@lfdr.de>; Thu,  6 Apr 2023 10:22:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F36E110E0EE;
	Thu,  6 Apr 2023 08:22:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2078.outbound.protection.outlook.com [40.107.220.78])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B971D10E0EE
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Apr 2023 08:22:30 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VB7a2FvzXljm+U2/iG15GeFHC0E81fsNi0j3FRYBRLBWL8d+OdNmbYMjUvu3iT+H0Ia9KFCbCR7z+FaHP4BIw8QxwVj485ygdGY8Dfmfla6cUFdTtxy+baW5tvPd8g3ZpSv9mEhb0OtPNPOHMF8+1xho1StL2Ui04KJbDlXVF75Va2DUjN/cWef+o40QPbylv2iyKxoopXoVjcNXDaMYLxcqTaVY/Z2aP0HMYermDBBlhCDKVZnuYAMBuj8BHv2GlNFm9sY0J40h68ll4Hg9aidpIo6hn6LuozHC+wp7hiUtAx3VmtTYnin1lyGsWTS07xHOXQKXjOz7OOgKYxZg3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lQUPRbst5eTIAXVr9fXpxkx7ebHW2pJMRa/k67OK0+k=;
 b=CrgFquyj6yy49os1qT/2/8l/xKoQLR+Dq1C2wNHh5al03z5Wices+BGvZdZLt5u4mT9vmfeSU87/s3oaH0qc6pc/PE+4aExQcgdwxkICbXRaksbO3Cef+m9PQwIqeiP3QPK58ipHl6ytjoYcBgcP0EciYgBmXoiXgRdOpj1rJqLdjdFwLo1vieCe7LyqMyNH23H6hS1HgqbBjp2Cmw7wYZ8nUn+yO0Ia5eRvr1/VSn96A4AMQEqfUEv3l1rhM9wHSRuVVa/wckZyi+C3Hb7hK+OqAoiZyUGkZF1Ec5ZyZeLPSabhgdSASrla/c7dlb4pSJLhD5B0SezmOu2VUY0Mwg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lQUPRbst5eTIAXVr9fXpxkx7ebHW2pJMRa/k67OK0+k=;
 b=lfgihwintg+o4vkSmcYfr/hc4CpMfF0T5PL09u2Yv/HIZFN7HC8obpjhVmuF3t7+dPC8ZX2ewIhh1ndw6YA3Ro8t8iIOVI1oIgWmXkMcuDgR4IiFzaIBmKvVefBdPDFpW5s0swiIecUGoWUdM48p7OqsWCGD9lsSCG/TNW4+qoQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by BY5PR12MB4081.namprd12.prod.outlook.com (2603:10b6:a03:20e::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6254.38; Thu, 6 Apr
 2023 08:22:26 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::4624:dc39:943e:6ae]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::4624:dc39:943e:6ae%5]) with mapi id 15.20.6254.035; Thu, 6 Apr 2023
 08:22:26 +0000
Message-ID: <28d10733-b217-7ccc-4b8c-54bdc8249234@amd.com>
Date: Thu, 6 Apr 2023 10:22:20 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [Regression] drm/scheduler: track GPU active time per entity
Content-Language: en-US
To: Luben Tuikov <luben.tuikov@amd.com>, Danilo Krummrich <dakr@redhat.com>,
 Lucas Stach <l.stach@pengutronix.de>, daniel@ffwll.ch,
 Dave Airlie <airlied@gmail.com>, Bagas Sanjaya <bagasdotme@gmail.com>,
 andrey.grodzovsky@amd.com, tvrtko.ursulin@linux.intel.com,
 Matthew Brost <matthew.brost@intel.com>, yuq825@gmail.com,
 Boris Brezillon <boris.brezillon@collabora.com>, lina@asahilina.net
References: <3e00d8a9-b6c4-8202-4f2d-5a659c61d094@redhat.com>
 <2a84875dde6565842aa07ddb96245b7d939cb4fd.camel@pengutronix.de>
 <8b28151c-f2db-af3f-8dff-87dd5d57417b@amd.com>
 <3004a2bf-e725-643e-82af-8a217784e796@redhat.com>
 <013781a3-5abd-8c66-8a0a-dd36c9c487af@amd.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <013781a3-5abd-8c66-8a0a-dd36c9c487af@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM9P195CA0013.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:20b:21f::18) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR12MB3587:EE_|BY5PR12MB4081:EE_
X-MS-Office365-Filtering-Correlation-Id: 3bf2f3ce-ec9b-4f8c-3703-08db36780e14
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: XTlMTXhzw3Q1ddHD2xe5d8dhPB6IlOrORuO6OzVZol6sFGd6avp1kznFurpF7vXeUc8zvdLFzbfwaNJqxaRHINS63RocHTzmUsNnEjmBNsw+aGWxfE8OH+egXV4w3JBLPAp+FgyepclSzK58DraVZnoej/QZTzppTT+W+UEuyJguAj113ii6wmJ8a57539g/ZC0HzfQFbVe3B54crFkNGJvsHsh0YiMjG9lFIanuASOCVLyCH5DjwoOtL/iZ3KM4ATJx6+7MTieVIrasDBc/TFoZpfzVgF3rvYZ1txcwU73ECqJ9CnUHhIcvQuQ3Ggb6jF32t5QhLC7epmw3RqLYC9UV90Aw7br3vi0drloRYeXWQ6JDIMjsCduekdBbcx3Cb6FWITRaUfdYfRKo9lU8w8/+9gdO4S9ebd0IyF7vXQP2buTgJIRm8fsD2W/6QS2LlE0LFfm4cJoQKcBIjIZ/wzbk9XQGAniBGTw3Fe/dkAsE99BKUdUVlI4GNKz/Y/DJAZMbvW3ffwUUO0lgb2aP6Blbu3MHb1sGNDgfIIVzxzGFDlO/S67/kHf9va16SqaaJt9x9HoU4ZdCbqQYmtF97WIUVjRmnC4kENpom4b7YQ8OV94Pv8L+7NrvSsEQpDdnm04sBpKfXbdhmkP6wp7og4TKlbNUF/P9cSDTZKbWsJs=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(366004)(136003)(346002)(396003)(376002)(39860400002)(451199021)(2616005)(83380400001)(966005)(6486002)(316002)(478600001)(110136005)(6506007)(26005)(6666004)(186003)(53546011)(6512007)(7416002)(2906002)(4326008)(5660300002)(36756003)(38100700002)(66476007)(921005)(8676002)(41300700001)(66556008)(86362001)(66946007)(31696002)(8936002)(31686004)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cUZENEtJdG1lTDBoRWJuZ1ZEeEJMWThFQW5yTnpoakZSOG9xUGNrYmlLdEJ1?=
 =?utf-8?B?SE5hUXVzdkFPUnZkVVNHU0N5Ukd2eTFPMVVnc2N2M1pmY25wVGtiSDhzb29Z?=
 =?utf-8?B?cjlDVkNBQWZHbHdQT0Z2eExJNWZ0SC9tTTdEUUwzU0JjQUFsNDZLOVZ5UGIy?=
 =?utf-8?B?WElpWU1MR1RFSGJDMVdaQjVjVGxMNEJhVEVBREZWQitPc0VmT2VJekN5TWNL?=
 =?utf-8?B?enBkY21KZEZ1UGs3R1J2ZnM1aDgrZ2cxYTQwZnNEM2oxVmZ0WktTbGpwUEJQ?=
 =?utf-8?B?cjV5VHlMRlJQRnpjZFAyam52TDl1eW1GMnpFVjNXRVh6WkxXbEpMYUNFL3RW?=
 =?utf-8?B?RjZaL01ITzR6eHg2NUoyQWNsRmZtbHVnbUY4MkpMMGI5Qk9rR0hMbnZrRDE2?=
 =?utf-8?B?Z1NmaUh6Y2paVnZtUEdUSm5Jc1VvUThTTlluVkEvck9EV200S2laVUVrWFVY?=
 =?utf-8?B?ODNWOTdaSEh6MkdicEplTmlBdllDdi8zNmllUWRPOHN3eVRUamxXelhXQ0Jo?=
 =?utf-8?B?V3NnZ09rb2FxMGkvLzBwN1doZnNtalIxdjVYYkcyRE1xNk9OdkpCQ3diM1BD?=
 =?utf-8?B?cXBTVmZ5cVh4SVB5WnBrSXBQYzF2TkgvQkluT3ZHV1BkcU1ocG5idmVsbWpU?=
 =?utf-8?B?WEw5dFJJaCs0QTdCUVRCdjU4emJ1ODlhR0VGN1Q0VUlyZHBvM0ZvQWlIYTc4?=
 =?utf-8?B?eFR4Q0lOelBtcWN1NzVkbWdGRTMrYmh1blMrZ1dSTlc1cnN4NUpNWU4zbHNK?=
 =?utf-8?B?aHQvdkVEL3kyY25SWTVXRkVtend2dmxZb1RPa3JweVZiN29UTFJGTHRYY0RE?=
 =?utf-8?B?SW9TM1JvRFZIYmJsQ3hCN0ZoazVIQmdEMnpZNmlTVXkyQzMweGJadDdOSjVt?=
 =?utf-8?B?OWdjcE9qVG8rRVV5ZlhJM25aVDdvNHBySWZNRUtHd3lCS0JpUGdKeitVajky?=
 =?utf-8?B?L2pZT1dyUnpJSlB4QmNFQWM2TUVLSUh5b3U1K3FOazZNL1hJUkFvd29kK1p2?=
 =?utf-8?B?SWdxeXFQRXZNcnZncGkveFJNMWxONHlpekJpcklURUl3MzNkd21YUVVwMjZY?=
 =?utf-8?B?U1dEQjZNTS9NYXBjZnFZTnkrWkNCYURWUERqSWsyRWZhaHQrZExnRWpNQmtL?=
 =?utf-8?B?TC91Yys4UmQ0dVBQOGVRVGhxajk3TkhwMWJxMjBOK1NMN3ZieHluUXlQK3Zr?=
 =?utf-8?B?eHJjMDEvT2hyejRLTkxzLzJJMXBuZ1dTREFqdmYySGUzNXpscWhIUE1qOE00?=
 =?utf-8?B?ZzlEckpGUzFnT1ZvTkFPTWY0azRpR0VzYzJNYXh0MWdNblkxejU0Vm5VUU1k?=
 =?utf-8?B?YTFITllZY1QyUnVwbUpVYmZncGx2Z2NJS3pEQk8xa0VpdGJhQWhqd3RNbkxN?=
 =?utf-8?B?QzliU21zSmtNcVVLU0k1eWQwblFNWEJYWmtnMk1GNjhmOWtMSjJIUFB4RjRX?=
 =?utf-8?B?R3Vhb3liaVVla1pMYzUvR1Jlc1FQUW9jZnBUMEVaYUZNUmtlUC9xMnU3aGt3?=
 =?utf-8?B?dHJTTVJldTI5cEdTVmNUc0FRQ1pjVFA5RmxPckwvbFBXU2RoaWVOK3ZOSmRQ?=
 =?utf-8?B?KzdmNWtwRFNxUll6RFdnMkdGYUNoZ2VwQklFRE1taEtXbklReFR1S1lEeUNt?=
 =?utf-8?B?N0dtQnI3UzZ5c2hXNDVNNS9YQWZFTjczTnA2L2RFRG9BY2xSK0NoMk9EMnpu?=
 =?utf-8?B?anJxMEhLdnhXWUU0NlZrbXhuNnRDMTZrY2dzV2JwNWhtZC93MFJmNk1TcU1J?=
 =?utf-8?B?YjBtcUpEelhQMndseTd6eGx2WllmdjJIeWM3VFE5eVdYMzF0ZlVRVUFkV1Nj?=
 =?utf-8?B?V1hncTVxR3ZBTHkzSWs3cm4ycW84TW9aVEZ0bHliR0wwMFp4ZzY0ZGNYcEwx?=
 =?utf-8?B?TGpkSzYvSzdRZXNpU2ZKcXdCdktBYjh4SlpTRFhPTEZMUWJEamViM3NjZVdt?=
 =?utf-8?B?emxLbmNaTWl5ZW10SFQ5RWVkSi9yTUVxcVFoTHBmdzlMVEp6UVkrYVROckJL?=
 =?utf-8?B?TzRJNlAvbHJqSUkvWUZIeTRiZHdERG45MCs5bHBnN2MwQW9UdnBYWS9RRnZr?=
 =?utf-8?B?YUg0c2IrM2pyTkdMYWhKcnpEdFkvQUdKSGw5ZWFFTXJ3aFd6VzJ5MHRyQWNE?=
 =?utf-8?Q?ufzEiSUZufRy/93zkdD5yCscC?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3bf2f3ce-ec9b-4f8c-3703-08db36780e14
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Apr 2023 08:22:26.4781 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AqqPlI25AzpdG9C7m3dbmXsQW3OEl1gcjJlhPbm9gZsPwjYpdJuH0ZLGpTCb0B+e
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4081
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

Am 05.04.23 um 18:09 schrieb Luben Tuikov:
> On 2023-04-05 10:05, Danilo Krummrich wrote:
>> On 4/4/23 06:31, Luben Tuikov wrote:
>>> On 2023-03-28 04:54, Lucas Stach wrote:
>>>> Hi Danilo,
>>>>
>>>> Am Dienstag, dem 28.03.2023 um 02:57 +0200 schrieb Danilo Krummrich:
>>>>> Hi all,
>>>>>
>>>>> Commit df622729ddbf ("drm/scheduler: track GPU active time per entity")
>>>>> tries to track the accumulated time that a job was active on the GPU
>>>>> writing it to the entity through which the job was deployed to the
>>>>> scheduler originally. This is done within drm_sched_get_cleanup_job()
>>>>> which fetches a job from the schedulers pending_list.
>>>>>
>>>>> Doing this can result in a race condition where the entity is already
>>>>> freed, but the entity's newly added elapsed_ns field is still accessed
>>>>> once the job is fetched from the pending_list.
>>>>>
>>>>> After drm_sched_entity_destroy() being called it should be safe to free
>>>>> the structure that embeds the entity. However, a job originally handed
>>>>> over to the scheduler by this entity might still reside in the
>>>>> schedulers pending_list for cleanup after drm_sched_entity_destroy()
>>>>> already being called and the entity being freed. Hence, we can run into
>>>>> a UAF.
>>>>>
>>>> Sorry about that, I clearly didn't properly consider this case.
>>>>
>>>>> In my case it happened that a job, as explained above, was just picked
>>>>> from the schedulers pending_list after the entity was freed due to the
>>>>> client application exiting. Meanwhile this freed up memory was already
>>>>> allocated for a subsequent client applications job structure again.
>>>>> Hence, the new jobs memory got corrupted. Luckily, I was able to
>>>>> reproduce the same corruption over and over again by just using
>>>>> deqp-runner to run a specific set of VK test cases in parallel.
>>>>>
>>>>> Fixing this issue doesn't seem to be very straightforward though (unless
>>>>> I miss something), which is why I'm writing this mail instead of sending
>>>>> a fix directly.
>>>>>
>>>>> Spontaneously, I see three options to fix it:
>>>>>
>>>>> 1. Rather than embedding the entity into driver specific structures
>>>>> (e.g. tied to file_priv) we could allocate the entity separately and
>>>>> reference count it, such that it's only freed up once all jobs that were
>>>>> deployed through this entity are fetched from the schedulers pending list.
>>>>>
>>>> My vote is on this or something in similar vain for the long term. I
>>>> have some hope to be able to add a GPU scheduling algorithm with a bit
>>>> more fairness than the current one sometime in the future, which
>>>> requires execution time tracking on the entities.
>>> Danilo,
>>>
>>> Using kref is preferable, i.e. option 1 above.
>> I think the only real motivation for doing that would be for generically
>> tracking job statistics within the entity a job was deployed through. If
>> we all agree on tracking job statistics this way I am happy to prepare a
>> patch for this option and drop this one:
>> https://lore.kernel.org/all/20230331000622.4156-1-dakr@redhat.com/T/#u
> Hmm, I never thought about "job statistics" when I preferred using kref above.
> The reason kref is attractive is because one doesn't need to worry about
> it--when the last user drops the kref, the release is called to do
> housekeeping. If this never happens, we know that we have a bug to debug.

Yeah, reference counting unfortunately have some traps as well. For 
example rarely dropping the last reference from interrupt context or 
with some unexpected locks help when the cleanup function doesn't expect 
that is a good recipe for problems as well.

> Regarding the patch above--I did look around the code, and it seems safe,
> as per your analysis, I didn't see any reference to entity after job submission,
> but I'll comment on that thread as well for the record.

Reference counting the entities was suggested before. The intentionally 
avoided that so far because the entity might be the tip of the iceberg 
of stuff you need to keep around.

For example for command submission you also need the VM and when you 
keep the VM alive you also need to keep the file private alive....

Additional to that we have some ugly inter dependencies between tearing 
down an application (potential with a KILL signal from the OOM killer) 
and backward compatibility for some applications which render something 
and quit before the rendering is completed in the hardware.

Regards,
Christian.

>
> Regards,
> Luben
>
>> Christian mentioned amdgpu tried something similar to what Lucas tried
>> running into similar trouble, backed off and implemented it in another
>> way - a driver specific way I guess?
>>
>>> Lucas, can you shed some light on,
>>>
>>> 1. In what way the current FIFO scheduling is unfair, and
>>> 2. shed some details on this "scheduling algorithm with a bit
>>> more fairness than the current one"?
>>>
>>> Regards,
>>> Luben
>>>
>>>>> 2. Somehow make sure drm_sched_entity_destroy() does block until all
>>>>> jobs deployed through this entity were fetched from the schedulers
>>>>> pending list. Though, I'm pretty sure that this is not really desirable.
>>>>>
>>>>> 3. Just revert the change and let drivers implement tracking of GPU
>>>>> active times themselves.
>>>>>
>>>> Given that we are already pretty late in the release cycle and etnaviv
>>>> being the only driver so far making use of the scheduler elapsed time
>>>> tracking I think the right short term solution is to either move the
>>>> tracking into etnaviv or just revert the change for now. I'll have a
>>>> look at this.
>>>>
>>>> Regards,
>>>> Lucas
>>>>
>>>>> In the case of just reverting the change I'd propose to also set a jobs
>>>>> entity pointer to NULL  once the job was taken from the entity, such
>>>>> that in case of a future issue we fail where the actual issue resides
>>>>> and to make it more obvious that the field shouldn't be used anymore
>>>>> after the job was taken from the entity.
>>>>>
>>>>> I'm happy to implement the solution we agree on. However, it might also
>>>>> make sense to revert the change until we have a solution in place. I'm
>>>>> also happy to send a revert with a proper description of the problem.
>>>>> Please let me know what you think.
>>>>>
>>>>> - Danilo
>>>>>

