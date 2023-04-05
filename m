Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A06A6D8318
	for <lists+dri-devel@lfdr.de>; Wed,  5 Apr 2023 18:09:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 65CCA10EA12;
	Wed,  5 Apr 2023 16:09:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam02on2060a.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e83::60a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B58210EA08
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Apr 2023 16:09:50 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=j2QGe33KBYOiSi+E7lxa2sFSBZRqA5NHunEtgFqo5rYsDYh2DPr2Y6bPkElEvMZCQ9PalElGyFT8ya7kEoN/I4gapcLFQ0vZ6vn2qyhrcuCXWFbRAqZKVdkjFu6fL79GUVJfdYJQJyK66329JrMd4XpGndVSrE9Wxce3hf+C5KZqLhuKUi+E1mORJXENIyo+TugowfIf1lybm1/B1NV593laxeC238BHpOT53x+b0bZP1y/SR9YD1TB1ElLSBjrOTigO5BEXYxqvVCr6tbcYYAEJQgIf9d6nh0c1y0l8RJCei30zob2pwpVAb1ILRRKd9XpE5nMJv7m5OdiOfPudcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=T6CnbwXZTx8Ct5cl/ktkphTlCm7oYTH2Tj8MAX8TtBE=;
 b=RKgkBuWtUhkoPjJYOULOF6kTZriXdyOB2DV9GBg5Rvsj8+SDpgVJ0fIcyQT2nNGF2xAl1S4jhRgTOvJI2vTnmLExYdu9yj/5kpkV9lrjj1G6A+yxbV83+PFH4LeSISmVzptEElH12juQu4VkLRGjQOJA8lVAAif0urj/WwVkxDl2G+QmowFDbeYI8e5c7awMI3pAMqy5H65//KR3mpAurs+BwyLOnO+oDuhsLI1gnfPPblQuijKD6VIG2ow3U1XfoPvhgi37D12PkME6x34Iz2xMidwm6Iejnyf+7LEfiG8f4JIHPmlfmA+Bw2JHybYeQ7bMln15+SJbyjrhTT/TFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=T6CnbwXZTx8Ct5cl/ktkphTlCm7oYTH2Tj8MAX8TtBE=;
 b=UyUypjFBJ5U1VagtultHnRNrQuhyMifCfE53mWOoI8/TYTCh1ObcPvORTQx2GzQzx0U5NGxdpd5XMp+3RZLk8GtPaHlQXx+lN9H/4UKDD/Q4lFOue7t/r6PVBEDbn+Aua7S6M/Pz4BQvS9prYnHWjK+ILp7eycFrs/DOpy2hBas=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM6PR12MB3370.namprd12.prod.outlook.com (2603:10b6:5:38::25) by
 PH8PR12MB7303.namprd12.prod.outlook.com (2603:10b6:510:220::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6254.33; Wed, 5 Apr
 2023 16:09:46 +0000
Received: from DM6PR12MB3370.namprd12.prod.outlook.com
 ([fe80::8299:158a:c296:de80]) by DM6PR12MB3370.namprd12.prod.outlook.com
 ([fe80::8299:158a:c296:de80%6]) with mapi id 15.20.6254.033; Wed, 5 Apr 2023
 16:09:45 +0000
Message-ID: <013781a3-5abd-8c66-8a0a-dd36c9c487af@amd.com>
Date: Wed, 5 Apr 2023 12:09:43 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Content-Language: en-CA
To: Danilo Krummrich <dakr@redhat.com>, Lucas Stach <l.stach@pengutronix.de>, 
 daniel@ffwll.ch, Dave Airlie <airlied@gmail.com>,
 Bagas Sanjaya <bagasdotme@gmail.com>, andrey.grodzovsky@amd.com,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 tvrtko.ursulin@linux.intel.com, Matthew Brost <matthew.brost@intel.com>,
 yuq825@gmail.com, Boris Brezillon <boris.brezillon@collabora.com>,
 lina@asahilina.net
References: <3e00d8a9-b6c4-8202-4f2d-5a659c61d094@redhat.com>
 <2a84875dde6565842aa07ddb96245b7d939cb4fd.camel@pengutronix.de>
 <8b28151c-f2db-af3f-8dff-87dd5d57417b@amd.com>
 <3004a2bf-e725-643e-82af-8a217784e796@redhat.com>
From: Luben Tuikov <luben.tuikov@amd.com>
Subject: Re: [Regression] drm/scheduler: track GPU active time per entity
In-Reply-To: <3004a2bf-e725-643e-82af-8a217784e796@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YT3PR01CA0057.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:82::27) To DM6PR12MB3370.namprd12.prod.outlook.com
 (2603:10b6:5:38::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR12MB3370:EE_|PH8PR12MB7303:EE_
X-MS-Office365-Filtering-Correlation-Id: 7c627c45-1d5d-4103-9bc5-08db35f02c5e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: xf8n+RcPHu+SBfCPTBmC9xVbrA8YdF9kjysWH1nntm3PKHWDCQUJwAqg73JzYggIGXRoqp/IpnmhP6dCxSHNL9TLDHC2xgWCIEnbGSNdABA36Zy9kyHdMCIo97liSAjo40oku7TNReqz5YerotICMQKbBUZ20r3m+Kxxw9rSgPoZVDRxO5TIxlZvjqXPjZd/+xU55D+ydTMknFkK1thYm//LWlN+75yvdKu3fgaZNfkLvRRgyj9bkmk78B6UzEWVE79kEL/rBL8WP8A8u6m8V+EWhQAWDj20pJp7p6cK2G689nb4nXvN+S77LtCrv5qIGGfSxgOt8MoYry7sGsNC1ewVUtkCAuzqG97Lb5H8a7AnQIg6oeXad6janC11qK5flVu2nmofWuJsaPFLCGvpnqmzGAlz8ssu7N/7nFXt740dItpciyk1vLz+ykSxAWhIPYM/DJqSWw8x/AoNIAEbcuvaVs86k1UTuwnovAb7D8I733yT+My1kUkD7OPJUwJ8MvCVujiaGt7Z218ex1h+IyRN+zRMMvhBhJDj9rhTembEbqCh8MA42/25mtMr4WnbQF8uTJzamTsJOrYprP//FosnAWmkZTPAr/80Kb2l6v8NlALJfLLTBbK2S2dcpY4s4z9l+Ob1rgdzvVMip+8X7B+PXeHAuJe0jMPkpTmvWbk=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB3370.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(136003)(39860400002)(366004)(376002)(346002)(396003)(451199021)(31686004)(2906002)(44832011)(38100700002)(7416002)(5660300002)(921005)(66556008)(66476007)(8936002)(66946007)(4326008)(41300700001)(8676002)(110136005)(83380400001)(316002)(36756003)(2616005)(31696002)(26005)(55236004)(86362001)(6512007)(966005)(6506007)(186003)(53546011)(478600001)(6486002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aXhMTmZSTWJSdWo2cytZK0g4T0VmQ2p6WnJBR08zaGFsRE1QejlhZEs0TUw1?=
 =?utf-8?B?VCtVSWRTajU4TWY0NDI2Z1l3bS9adWFla09pdHpaazdCVG0zR01va1VUSG1y?=
 =?utf-8?B?VlFPVTQ0d3JxUlQ5aWNxb3VxbWxsUkpnbHZsRit1YXY1czRyRDlEbzd2Mitu?=
 =?utf-8?B?a0VMWGoyU1hCL2lPS3RYWHdwVXVDVG5sbTZJcHk3ZGJScGNsbTBtSXVDOXF2?=
 =?utf-8?B?bG5zc2w5dTNJejlIeFV5TTJpUkhFaXh2MHNxMWIrQ1g4VVpFNno3SStXVE8w?=
 =?utf-8?B?TVpuMERGKzk3TWZUajVyK2VaSXVOTkduYmhqd0lSbVYvQ2FWQ0ZESHgxMnUw?=
 =?utf-8?B?OVQ2L1dta25tTzZIYXNwQlI2VzI5NTlEdmVXRzdkbmMrdXp5ZWhPbUwrTWE0?=
 =?utf-8?B?NXVmL3EzWk9nSEFjVFg1TEh6RlgxUlQxUXZnVU9neklEQ0p0QWtIRVEySHUr?=
 =?utf-8?B?eTBhckJZU01OSnhsWERoZW1McmtSZURpSldGL3VSUW5hSjhQVnBFWEFRVUEx?=
 =?utf-8?B?MFR4cGFhTHNjVkc1MjZ6UUVJZjZuYkVWZXhwdFpnUmhlMkxZT0p3cE44SzU3?=
 =?utf-8?B?U0M0eDdOeWtmcFo3QWcxQVNSWGNzcHNNTEZ0U1NjT3VZNjNCUzJMeVZqdVY5?=
 =?utf-8?B?VFBGd3NOS3hSdjQxZFN4L0tkMHh1SVBPMFlvZno2Rk9iUlVhbEF6RnFxTGZR?=
 =?utf-8?B?V0lJV3c5MFZCc0E5UU54aURONnZqVDlLTHg5cHF2TFhPWTdYTnNEVHhZMnFW?=
 =?utf-8?B?RzltUlpOdTdYeHpsbTBMZVhjeEFiTHN0bTRESUhwYWUrZ2Z1dTBvME9jNi9r?=
 =?utf-8?B?ZWJDMWtmaVJLT3ZzK0NwSGt2T2taaVlqVHZHbmN1VUxFVkwyc1pld1kyWk5T?=
 =?utf-8?B?ZVpPYmZxREVFQWQ3YUk3YXJjVkJtQ1VUQURkQThQNXhIdXVGZmJMdy9XUWh6?=
 =?utf-8?B?cTNaWk1VR083OU9Zcy82SWs3YXdLR2hyTzRyd2haK1UxSHM5Y0kxL0lnVG80?=
 =?utf-8?B?U0dEdElqaUhVSTUyS0dvZDV2K0xlNzlPaGtIK3dydHMzNWQ0eWFpN01QV21X?=
 =?utf-8?B?RFV0V1d6MzQ3cTZGa3RFdHc3L1lJbHhDdTYzWk1WcGxocXRVdkUzMHV0bHFm?=
 =?utf-8?B?WW5QQW5qQ0QzZEloVUgvUFpncHRJVGgwVkZIdGFWcDNMNEVvOTRKTllrejhh?=
 =?utf-8?B?NU8zaEJsUDJkbi8zMzlQN2h0Y2tDR3pTK2N3V2RwVDhaRWJQemxiY0huRGJJ?=
 =?utf-8?B?bkFPSERkYUI3Mmg0TVVBWkNiUnhJUzNPWmJjY2htM1ZFVXZHeC9rd2ttVk55?=
 =?utf-8?B?WExKNEJhM3hZQmNhRUR3OWRqVjY1bERTTEFtQkRwZ0NQR0NLSDQyTWwwZWtq?=
 =?utf-8?B?YVpTZzUwQllKa3E3TFlsVFFRUnExSDBCNldRbFBzbm1GdlpQSzJIUlcvbUJ6?=
 =?utf-8?B?ZXRsQ1N6VTBCRjg1Z0JTa0Mza1RIdkY0T05OM3RJYVBpREp6L3JqWi9sM25i?=
 =?utf-8?B?c2tVRGhYM3c1WDhNQTIrak12UFF4SmVPaDA4ZVI3QWVTajlMVk93RlZmNEw5?=
 =?utf-8?B?YnJsc0xQeC8xeGN3M3M3c0xHcmpZa3VPSlNmdnFhNm1ZOWRsbFV6c1NLWER0?=
 =?utf-8?B?NkNudDQzMlBaczh3R3lyM3lRZ1lMYWZzc080MnZQaWZ1Q05VNFVBaWpqWTdS?=
 =?utf-8?B?amV5d2JQNm9KbGJMd0VLN2dDb0s3WGRlSjVjaFh5RXF1bmNIOU1OSlQzckZR?=
 =?utf-8?B?bXB0aTRtN3hnRXlMVW5UT1N6ZXJ5M3BBbHM3VVNsSURWSitMakJ2OGhMQnhq?=
 =?utf-8?B?MU1zOWdJQytLVDFoTE1ZcXdZNXRhT2NhbUpBM3hmS2Jwd3FuTWR3akpMOTA5?=
 =?utf-8?B?ZkZTN3VRTW83ckZaSW5MZGkrVWVQTTZtazdqV0lFSlkvTlhDL0F4WHkwSG1v?=
 =?utf-8?B?STZ1dnFyWG9uQWYyS2xrK1g0U3lhWTNpdW4xMjVUMlZXemZ2MEhWV05KMzZY?=
 =?utf-8?B?d3ROVzQzTGhoWVJIcFJYYXE4WGZnSXFRRGxFcCtMS2FSM3FTNTlnc0lmbWZ3?=
 =?utf-8?B?aDU2ZTIwazJzTjJsMTRhWExPTmRDQURod0IrUGhLNE4wMU1TdXZMN1RrTTlu?=
 =?utf-8?Q?SBsuXCx2bpjtThesvOUEvvwVB?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7c627c45-1d5d-4103-9bc5-08db35f02c5e
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB3370.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Apr 2023 16:09:45.7645 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: namfuQqdWmmpbyj9SWvR2wH3/CLxt8/eiEfUQiQSMfVQhEJhg0WV4I9/qbMIQTWT
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB7303
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

On 2023-04-05 10:05, Danilo Krummrich wrote:
> On 4/4/23 06:31, Luben Tuikov wrote:
>> On 2023-03-28 04:54, Lucas Stach wrote:
>>> Hi Danilo,
>>>
>>> Am Dienstag, dem 28.03.2023 um 02:57 +0200 schrieb Danilo Krummrich:
>>>> Hi all,
>>>>
>>>> Commit df622729ddbf ("drm/scheduler: track GPU active time per entity")
>>>> tries to track the accumulated time that a job was active on the GPU
>>>> writing it to the entity through which the job was deployed to the
>>>> scheduler originally. This is done within drm_sched_get_cleanup_job()
>>>> which fetches a job from the schedulers pending_list.
>>>>
>>>> Doing this can result in a race condition where the entity is already
>>>> freed, but the entity's newly added elapsed_ns field is still accessed
>>>> once the job is fetched from the pending_list.
>>>>
>>>> After drm_sched_entity_destroy() being called it should be safe to free
>>>> the structure that embeds the entity. However, a job originally handed
>>>> over to the scheduler by this entity might still reside in the
>>>> schedulers pending_list for cleanup after drm_sched_entity_destroy()
>>>> already being called and the entity being freed. Hence, we can run into
>>>> a UAF.
>>>>
>>> Sorry about that, I clearly didn't properly consider this case.
>>>
>>>> In my case it happened that a job, as explained above, was just picked
>>>> from the schedulers pending_list after the entity was freed due to the
>>>> client application exiting. Meanwhile this freed up memory was already
>>>> allocated for a subsequent client applications job structure again.
>>>> Hence, the new jobs memory got corrupted. Luckily, I was able to
>>>> reproduce the same corruption over and over again by just using
>>>> deqp-runner to run a specific set of VK test cases in parallel.
>>>>
>>>> Fixing this issue doesn't seem to be very straightforward though (unless
>>>> I miss something), which is why I'm writing this mail instead of sending
>>>> a fix directly.
>>>>
>>>> Spontaneously, I see three options to fix it:
>>>>
>>>> 1. Rather than embedding the entity into driver specific structures
>>>> (e.g. tied to file_priv) we could allocate the entity separately and
>>>> reference count it, such that it's only freed up once all jobs that were
>>>> deployed through this entity are fetched from the schedulers pending list.
>>>>
>>> My vote is on this or something in similar vain for the long term. I
>>> have some hope to be able to add a GPU scheduling algorithm with a bit
>>> more fairness than the current one sometime in the future, which
>>> requires execution time tracking on the entities.
>>
>> Danilo,
>>
>> Using kref is preferable, i.e. option 1 above.
> 
> I think the only real motivation for doing that would be for generically 
> tracking job statistics within the entity a job was deployed through. If 
> we all agree on tracking job statistics this way I am happy to prepare a 
> patch for this option and drop this one: 
> https://lore.kernel.org/all/20230331000622.4156-1-dakr@redhat.com/T/#u

Hmm, I never thought about "job statistics" when I preferred using kref above.
The reason kref is attractive is because one doesn't need to worry about
it--when the last user drops the kref, the release is called to do
housekeeping. If this never happens, we know that we have a bug to debug.

Regarding the patch above--I did look around the code, and it seems safe,
as per your analysis, I didn't see any reference to entity after job submission,
but I'll comment on that thread as well for the record.

Regards,
Luben

> 
> Christian mentioned amdgpu tried something similar to what Lucas tried 
> running into similar trouble, backed off and implemented it in another 
> way - a driver specific way I guess?
> 
>>
>> Lucas, can you shed some light on,
>>
>> 1. In what way the current FIFO scheduling is unfair, and
>> 2. shed some details on this "scheduling algorithm with a bit
>> more fairness than the current one"?
>>
>> Regards,
>> Luben
>>
>>>
>>>> 2. Somehow make sure drm_sched_entity_destroy() does block until all
>>>> jobs deployed through this entity were fetched from the schedulers
>>>> pending list. Though, I'm pretty sure that this is not really desirable.
>>>>
>>>> 3. Just revert the change and let drivers implement tracking of GPU
>>>> active times themselves.
>>>>
>>> Given that we are already pretty late in the release cycle and etnaviv
>>> being the only driver so far making use of the scheduler elapsed time
>>> tracking I think the right short term solution is to either move the
>>> tracking into etnaviv or just revert the change for now. I'll have a
>>> look at this.
>>>
>>> Regards,
>>> Lucas
>>>
>>>> In the case of just reverting the change I'd propose to also set a jobs
>>>> entity pointer to NULL  once the job was taken from the entity, such
>>>> that in case of a future issue we fail where the actual issue resides
>>>> and to make it more obvious that the field shouldn't be used anymore
>>>> after the job was taken from the entity.
>>>>
>>>> I'm happy to implement the solution we agree on. However, it might also
>>>> make sense to revert the change until we have a solution in place. I'm
>>>> also happy to send a revert with a proper description of the problem.
>>>> Please let me know what you think.
>>>>
>>>> - Danilo
>>>>
>>>
>>
> 

