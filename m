Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D79D7A599E
	for <lists+dri-devel@lfdr.de>; Tue, 19 Sep 2023 07:56:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D844010E3D2;
	Tue, 19 Sep 2023 05:56:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2044.outbound.protection.outlook.com [40.107.94.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6330210E3C8;
 Tue, 19 Sep 2023 05:56:14 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aNj4El4J4lubXawItpt6wOldM1B+HkXquNQbPXWxyQMj++VAqqV38g1m2VG8O60LbRgGy9YzLZLKtyeOjJByuNlHUrAnzGllOB5tWKqv5o527S50kSDab1TdUCM6jYAQBhBQH47UpW7awzllYsz4yDeNhd6UUg8lM3u2fKGFVOVvUgIoGVfNzdSh06AKtJdefFs7rGNali+F95kSf+GOtDKnt9APoHz9XOIsWuf81kIjKy+fj7XYeWdvyYv4qio7MAdrePAX4c59enbI7oFiyP18aymNUxVnXQMJjKMiC3DRrEIiYPuVTsoTwzmuzsMeSgUsEK3CYn8dVbRBa/06iA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IFmWr7ppuDGicz15iojHBPBkzevlDD0461ON+R8MdZI=;
 b=eMhXssnJ42UVL+b0wLSa+JxmrJqczperZhF6qO0y4a91pxWT2/5PbJZEfHyvyYQ87P793XMhOWUa28Sn2D89Yik6A/IYW1WZa+HZuhG+2X2NP7ZXx4L+MQ1jLW9b689EJgPjI2PbghNxnVNSU/G+2laaKjNfdGKRVUdKPKl/ENuwCKPmFR9dg/O1vC+c6ALCmuZEr+vhlZskFpCnVj4gxooFoKXIB3GWpaTs9anEMmXvXFToqhIJnQN/Sz9At75Fn+2lryu7niTmf1YyKNXrnB8ExdPlelbX98EYUFxxLU7q+xpIuQGAYeY41Rg4V6SBYw6h0ireSXMKiReSZ47Kzg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IFmWr7ppuDGicz15iojHBPBkzevlDD0461ON+R8MdZI=;
 b=IB3gh+UFpUXFJ5TyifBKGlWgnULYkFnOnWMZBngy6np4HP1xCmVZ/aRYHPnpaTTazdJct40pVK1om90cJtLE/bLKhqf3UeRHjW45pmsb8GqMvNFby0QvbkNUYofoYQXE0es5vE/uQ3nVchXxhBlfEF1zC4QC5oTvtisVJ77ndJQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by BY5PR12MB4322.namprd12.prod.outlook.com (2603:10b6:a03:20a::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.27; Tue, 19 Sep
 2023 05:56:04 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::55cb:215b:389e:eced]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::55cb:215b:389e:eced%5]) with mapi id 15.20.6792.026; Tue, 19 Sep 2023
 05:56:03 +0000
Message-ID: <2ec93a2a-0d4a-be90-3420-61c1782b9a72@amd.com>
Date: Tue, 19 Sep 2023 07:55:57 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v3 11/13] drm/sched: Waiting for pending jobs to complete
 in scheduler kill
Content-Language: en-US
To: Danilo Krummrich <dakr@redhat.com>, Matthew Brost <matthew.brost@intel.com>
References: <20230912021615.2086698-1-matthew.brost@intel.com>
 <20230912021615.2086698-12-matthew.brost@intel.com>
 <2b5c148c-51e6-c9f4-b950-fe16db5bad17@amd.com>
 <ZQB57X3TI2m2cECE@DUT025-TGLU.fm.intel.com>
 <be7fe6bd-0744-b33e-71b0-2c66eaa39382@redhat.com>
 <9bbaa40e-d839-10c6-5a5e-c9cfb36c578f@amd.com>
 <7aced2f9-1db1-8e22-f635-842e300d420c@redhat.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <7aced2f9-1db1-8e22-f635-842e300d420c@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0035.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1c::8) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR12MB3587:EE_|BY5PR12MB4322:EE_
X-MS-Office365-Filtering-Correlation-Id: 2f9c1455-4ae0-4103-488d-08dbb8d51b90
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: JkDlkdshnTC2AmNv5KRV5WsZp9+ptKPzQTTD965oI6Hbk9J+9zaHGgeqsGLUIONAB1L+ZIAVu/nZ/HdsvB1DkmuVNrqtBGQBWLakuybkW4/pLI0KaHq++pPMlMA+I5J7uEvAAmifRt9DeT0exXePAVcZ4FyF31QcN4wtoC17Rq0GjrIlSGgCUkAXwH6VfIn/ESWy6vCL+IlQGv0Oaq3M7F3eWjyNz4Jc4hjruf5Tho772q85Euq2AXYxlKbo6hm7+BgWwvDGAoA8MTmrMWAp70iG23Ph96uHg8FLHH2a6j5BQRDPFox1MOgNuZ7oT6RxxFokVqmqwcyObQfXNRbLV3JslyvLdizWSqyI+w5uxVRWXplZ9c70os2RkiycYCfW7iMgHlCv1kAukOHcOaeV4WOvxs91l+vYBxGzpgBGScmhW5/Mzru8+PL8id9ZXbjEgDLyYcVIGM2bklGYEt45oZBpX+2Pt1r3bGFCQ7XturFwdkQKXN24s3QDOy1DQot1M5nMZ+1U/18qDftwKG0KVBDxyujK50WehUKrAbGgzkFTwb46iQSNo5XZK3RFr9sLIf1Uryqnhotw91Hl38rzip1IscrDp+yGbLxwv5NP4b4NIOZFSpIkWBKbDtGRRnHvollUtdDLuyRVFGcQ97l3iw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(396003)(346002)(376002)(39860400002)(136003)(1800799009)(186009)(451199024)(6486002)(83380400001)(6512007)(316002)(2616005)(26005)(41300700001)(7416002)(110136005)(66556008)(66476007)(8936002)(5660300002)(8676002)(4326008)(6666004)(66946007)(6506007)(2906002)(478600001)(31696002)(86362001)(36756003)(38100700002)(31686004)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NkdDdS9Bdk9OMHNVSnBOMXdxblhOdmdBWTJac2piYnc4cm0xcXRQMi9TeDN3?=
 =?utf-8?B?WXM3aWNyN2xWdm1XbStJMGlXWXp0MTlrTncxcXk5ZWV4amF2dWFlTENWZVc2?=
 =?utf-8?B?d1YrTDdXZ3RVcWR3c2VQU0Z5N3BCVWN6MFp5VktoaDFncTduZng2cWMrVDdD?=
 =?utf-8?B?RWRlWGhtZE93dDRtdzIxVHNIRmtKRTZ5ckVFVmdSQ2IyNzJLWFN6N2pJM1NG?=
 =?utf-8?B?YjAxQTFTaVNWck9FT0xEN0lBckFnakFwVlpXK0FDQWNueksxSjQ1MDR3RXNo?=
 =?utf-8?B?bzBJNVJlckx6cEw3d1ZybitpQUp3czI5ZTljbUxVUzBRanovVFFrSTlGMnZk?=
 =?utf-8?B?VHNDZlVmVXlYVjNvUGtaaFpvNTZDK1g4YmVqYU9IbzRVaTUyMXVlQld4OGpv?=
 =?utf-8?B?UGRqYkZ1Zk5sZ3BjbDRMcVJrd0Z4RjAvZjNnZGZzNHVJVExjNXgyWVdwdmZy?=
 =?utf-8?B?dXRVd0gvZXVKTXlKUU44SWpyNnFDekpZVzZlMG1MZGxXRU9yb0pvUzRLWFQr?=
 =?utf-8?B?T0NSWTROQzJmMGwzOTIxVWlLYVFoVkE0S1RpVXpaWG83Z2FDNmFiMVg5QzAx?=
 =?utf-8?B?V2ZqK2RyOHQzZmxROUFGSFVieWc4anpGVDVDSk5FZVUvZHFPSUVFbVZlTENi?=
 =?utf-8?B?ajArQUc4TDFvZzN1YmxxRmtieXljZHphaTZ1VTZobEE4dXpJWEFrUmUvVlFI?=
 =?utf-8?B?ZUJrVmtpK01NTkdtc2R1N0hzdUwydWhkajlSam9FVkRuY01yS2IrUVZWOEdQ?=
 =?utf-8?B?UEtBOU0rUTBya24vc3gzVFRPRE81aExxb2VjQnNPMzhmZVk3QnkyVktkRlF1?=
 =?utf-8?B?cThxMjNCME1JRCtlVHdRUWtxeGM4WEFEeEFVWEZBZjM2SktZVVhTK3BtNGFP?=
 =?utf-8?B?SUNNajJEU1JKQ0VlRVV0Y3Y3SXhnUktHY0Jwa3FsUS95K0hUZUpYTWUzN3F6?=
 =?utf-8?B?NVRvQ3JZbHI5aTFQMERtSGdYUVF0ajBKSUVvWVk0bXRtMFp1YkcrQVBPeUIw?=
 =?utf-8?B?UnhnVW1SN3haa1VYVE93TnFsbnp4Y0cwTk1oaTNqeC9YQmxFNGZyNVE0dmNO?=
 =?utf-8?B?M055ajNLN1M4WU9ubWZ2aEtUbVZnaWJpdjZtMFl0amRSNk9EVWNRYjQydjVD?=
 =?utf-8?B?T0VxR2lXdC82bFdzVmlobGVSbUJNWVc1L3lveXd5RUIxYk1KNTJFaUZlQXNy?=
 =?utf-8?B?SXpaZkJrTU1zdXh5eEJjdjU3Yk1PeEZ0ZFVwNlNrcUNHdnQwTWkxdkIvSWlI?=
 =?utf-8?B?cE9aS3RuYXVnbWNrRmlsUE13OXREY2JXbzRoRjg5cEhkSXBKZ0VrNW8wMUlP?=
 =?utf-8?B?MFQvRzdGMGdEb1ZkNlZYY2VybmdESlhhTkVUMFBiOVNLbTJrQWdwK2lLbE8y?=
 =?utf-8?B?aHZ4bmJXQndMYjFNY3dPb1UwMEJXcWRDZ1crR3gwY1lkc2l4Uzg2R2wvSGdi?=
 =?utf-8?B?QS93bUtyeVBJMHk1NEFENnB6ZGdRWVV2QlgxTHdaaStGanpsRVRaVS9neXBF?=
 =?utf-8?B?Ykxva05NSlN5QkxTN2xDSnVuWkFsTkNENHQwM0x2d1pZV2dVcFB6UGN2c3NP?=
 =?utf-8?B?Y0YrZGtaV216TURjV1dxRk5GYzdpc3kwWUllNnl2V0VrNWVjNVV3Ynl0YTVL?=
 =?utf-8?B?dERRSkU3eGhOTGtUdFJubktndHpXb05nMG1DNDVMaWl2dVNRVFliclVELzhL?=
 =?utf-8?B?ZGJXQXN3V2pyL3AzZVRsUmlnOGc4U1VlZ3NtWndXWGkvZlM4Y1BGanFIUXN5?=
 =?utf-8?B?WWVXUGxhd3JRQzFHT0tIVFpvYnU1U0oxMDUvYko1RkJTYWVIaGd6MCs0aHJ5?=
 =?utf-8?B?eEFNWkgwREsxTmw1dXY0OE5KN2ZQSVVrd3pqazR1UHk4eHFNSE5KM1Q2b29C?=
 =?utf-8?B?NjllSFJqNG9Jd0hLcGhJRUZVWlovVTZsWlNmb0pTNDRRdTRhVWZtVHJlYnhQ?=
 =?utf-8?B?dFY4UVFpQ25TNmJYSmNHeStHa0Rvbk13SERnRzJUMjAyM2d5WnZIWWp6NkFq?=
 =?utf-8?B?NjJRRnFnWjgxWm84akxmZlFIeDRKT1VHNzRTUlk5eE4rcUkxRE9xSkp4SXFB?=
 =?utf-8?B?S0V6UTBsVnFLZVM4MWRQbm9uOVNlUmthN2FRaG9ZMUxoWjdJK2s3VWRYZXJl?=
 =?utf-8?Q?HdgGJRcUM4Q2rYsDrN4uoUkV4?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2f9c1455-4ae0-4103-488d-08dbb8d51b90
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Sep 2023 05:56:03.5477 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bfTIfUQ+lTdmubIyFIZZAnrxW7w3haozupd9wejnHChyeBG5fL+kINnC71vB1laP
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4322
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
Cc: robdclark@chromium.org, thomas.hellstrom@linux.intel.com,
 sarah.walker@imgtec.com, ketil.johnsen@arm.com, lina@asahilina.net,
 mcanal@igalia.com, Liviu.Dudau@arm.com, dri-devel@lists.freedesktop.org,
 luben.tuikov@amd.com, donald.robson@imgtec.com, boris.brezillon@collabora.com,
 intel-xe@lists.freedesktop.org, faith.ekstrand@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 18.09.23 um 16:57 schrieb Danilo Krummrich:
> [SNIP]
>> What this component should do is to push jobs to the hardware and not 
>> overview their execution, that's the job of the driver.
>
> While, generally, I'd agree, I think we can't really get around having 
> something that
> frees the job once it's fence got signaled. This "something" could be 
> the driver, but
> once it ends up being the same code over and over again for every 
> driver, we're probably
> back letting the scheduler do it instead in a common way.

We already have a driver private void* in the scheduler fence. What we 
could .do is to let the scheduler provide a functionality to call a 
function when it signals.

>
>>
>> In other words drivers should be able to call drm_sched_fini() while 
>> there are jobs still pending on the hardware.
>
> Unless we have a better idea on how to do this, I'd, as mentioned, 
> suggest to have something
> like drm_sched_teardown() and/or drm_sched_teardown_timeout() waiting 
> for pending jobs.

Yeah, something like that. But I think the better functionality would be 
provide an interator to go over the pending fences in the scheduler.

This could then be used for quite a bunch of use cases, e.g. even for 
signaling the hardware fences etc...

Waiting for the last one is then just a "drm_sched_for_each_pending(...) 
dma_fence_wait_timeout(pending->finished....);".

>
>>
>> Also keep in mind that you *can't* wait for all hw operations to 
>> finish in your flush or file descriptor close callback or you create 
>> un-killable processes.
>
> Right, that's why in Nouveau I try to wait for the channel (ring) 
> being idle and if this didn't
> work in a "reasonable" amount of time, I kill the fence context, 
> signalling all fences with an
> error code, and wait for the scheduler being idle, which comes down to 
> only wait for all free_job()
> callbacks to finish, since all jobs are signaled already.

Exactly that's the right thing to do. Can we please document that somewhere?

Regards,
Christian.

>
>>
>> Regards,
>> Christian.
>>
>>>
>>>>
>>>> Matt
>>>>
>>>>> Regards,
>>>>> Christian.
>>>>>
>>>>>>
>>>>>> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
>>>>>> ---
>>>>>>    drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c |  2 +-
>>>>>>    drivers/gpu/drm/scheduler/sched_entity.c    |  7 ++-
>>>>>>    drivers/gpu/drm/scheduler/sched_main.c      | 50 
>>>>>> ++++++++++++++++++---
>>>>>>    include/drm/gpu_scheduler.h                 | 18 ++++++++
>>>>>>    4 files changed, 70 insertions(+), 7 deletions(-)
>>>>>>
>>>>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c 
>>>>>> b/drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c
>>>>>> index fb5dad687168..7835c0da65c5 100644
>>>>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c
>>>>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c
>>>>>> @@ -1873,7 +1873,7 @@ static void 
>>>>>> amdgpu_ib_preempt_mark_partial_job(struct amdgpu_ring *ring)
>>>>>>        list_for_each_entry_safe(s_job, tmp, &sched->pending_list, 
>>>>>> list) {
>>>>>>            if (dma_fence_is_signaled(&s_job->s_fence->finished)) {
>>>>>>                /* remove job from ring_mirror_list */
>>>>>> -            list_del_init(&s_job->list);
>>>>>> +            drm_sched_remove_pending_job(s_job);
>>>>>>                sched->ops->free_job(s_job);
>>>>>>                continue;
>>>>>>            }
>>>>>> diff --git a/drivers/gpu/drm/scheduler/sched_entity.c 
>>>>>> b/drivers/gpu/drm/scheduler/sched_entity.c
>>>>>> index 1dec97caaba3..37557fbb96d0 100644
>>>>>> --- a/drivers/gpu/drm/scheduler/sched_entity.c
>>>>>> +++ b/drivers/gpu/drm/scheduler/sched_entity.c
>>>>>> @@ -104,9 +104,11 @@ int drm_sched_entity_init(struct 
>>>>>> drm_sched_entity *entity,
>>>>>>        }
>>>>>>        init_completion(&entity->entity_idle);
>>>>>> +    init_completion(&entity->jobs_done);
>>>>>> -    /* We start in an idle state. */
>>>>>> +    /* We start in an idle and jobs done state. */
>>>>>>        complete_all(&entity->entity_idle);
>>>>>> +    complete_all(&entity->jobs_done);
>>>>>>        spin_lock_init(&entity->rq_lock);
>>>>>>        spsc_queue_init(&entity->job_queue);
>>>>>> @@ -256,6 +258,9 @@ static void drm_sched_entity_kill(struct 
>>>>>> drm_sched_entity *entity)
>>>>>>        /* Make sure this entity is not used by the scheduler at 
>>>>>> the moment */
>>>>>>        wait_for_completion(&entity->entity_idle);
>>>>>> +    /* Make sure all pending jobs are done */
>>>>>> +    wait_for_completion(&entity->jobs_done);
>>>>>> +
>>>>>>        /* The entity is guaranteed to not be used by the 
>>>>>> scheduler */
>>>>>>        prev = rcu_dereference_check(entity->last_scheduled, true);
>>>>>>        dma_fence_get(prev);
>>>>>> diff --git a/drivers/gpu/drm/scheduler/sched_main.c 
>>>>>> b/drivers/gpu/drm/scheduler/sched_main.c
>>>>>> index 689fb6686e01..ed6f5680793a 100644
>>>>>> --- a/drivers/gpu/drm/scheduler/sched_main.c
>>>>>> +++ b/drivers/gpu/drm/scheduler/sched_main.c
>>>>>> @@ -510,12 +510,52 @@ void drm_sched_resume_timeout(struct 
>>>>>> drm_gpu_scheduler *sched,
>>>>>>    }
>>>>>>    EXPORT_SYMBOL(drm_sched_resume_timeout);
>>>>>> +/**
>>>>>> + * drm_sched_add_pending_job - Add pending job to scheduler
>>>>>> + *
>>>>>> + * @job: scheduler job to add
>>>>>> + * @tail: add to tail of pending list
>>>>>> + */
>>>>>> +void drm_sched_add_pending_job(struct drm_sched_job *job, bool 
>>>>>> tail)
>>>>>> +{
>>>>>> +    struct drm_gpu_scheduler *sched = job->sched;
>>>>>> +    struct drm_sched_entity *entity = job->entity;
>>>>>> +
>>>>>> +    lockdep_assert_held(&sched->job_list_lock);
>>>>>> +
>>>>>> +    if (tail)
>>>>>> +        list_add_tail(&job->list, &sched->pending_list);
>>>>>> +    else
>>>>>> +        list_add(&job->list, &sched->pending_list);
>>>>>> +    if (!entity->pending_job_count++)
>>>>>> +        reinit_completion(&entity->jobs_done);
>>>>>> +}
>>>>>> +EXPORT_SYMBOL(drm_sched_add_pending_job);
>>>>>> +
>>>>>> +/**
>>>>>> + * drm_sched_remove_pending_job - Remove pending job from` 
>>>>>> scheduler
>>>>>> + *
>>>>>> + * @job: scheduler job to remove
>>>>>> + */
>>>>>> +void drm_sched_remove_pending_job(struct drm_sched_job *job)
>>>>>> +{
>>>>>> +    struct drm_gpu_scheduler *sched = job->sched;
>>>>>> +    struct drm_sched_entity *entity = job->entity;
>>>>>> +
>>>>>> +    lockdep_assert_held(&sched->job_list_lock);
>>>>>> +
>>>>>> +    list_del_init(&job->list);
>>>>>> +    if (!--entity->pending_job_count)
>>>>>> +        complete_all(&entity->jobs_done);
>>>>>> +}
>>>>>> +EXPORT_SYMBOL(drm_sched_remove_pending_job);
>>>>>> +
>>>>>>    static void drm_sched_job_begin(struct drm_sched_job *s_job)
>>>>>>    {
>>>>>>        struct drm_gpu_scheduler *sched = s_job->sched;
>>>>>>        spin_lock(&sched->job_list_lock);
>>>>>> -    list_add_tail(&s_job->list, &sched->pending_list);
>>>>>> +    drm_sched_add_pending_job(s_job, true);
>>>>>>        spin_unlock(&sched->job_list_lock);
>>>>>>    }
>>>>>> @@ -538,7 +578,7 @@ static void drm_sched_job_timedout(struct 
>>>>>> work_struct *work)
>>>>>>             * drm_sched_cleanup_jobs. It will be reinserted back 
>>>>>> after sched->thread
>>>>>>             * is parked at which point it's safe.
>>>>>>             */
>>>>>> -        list_del_init(&job->list);
>>>>>> +        drm_sched_remove_pending_job(job);
>>>>>>            spin_unlock(&sched->job_list_lock);
>>>>>>            status = job->sched->ops->timedout_job(job);
>>>>>> @@ -589,7 +629,7 @@ void drm_sched_stop(struct drm_gpu_scheduler 
>>>>>> *sched, struct drm_sched_job *bad)
>>>>>>             * Add at the head of the queue to reflect it was the 
>>>>>> earliest
>>>>>>             * job extracted.
>>>>>>             */
>>>>>> -        list_add(&bad->list, &sched->pending_list);
>>>>>> +        drm_sched_add_pending_job(bad, false);
>>>>>>        /*
>>>>>>         * Iterate the job list from later to  earlier one and 
>>>>>> either deactive
>>>>>> @@ -611,7 +651,7 @@ void drm_sched_stop(struct drm_gpu_scheduler 
>>>>>> *sched, struct drm_sched_job *bad)
>>>>>>                 * Locking here is for concurrent resume timeout
>>>>>>                 */
>>>>>>                spin_lock(&sched->job_list_lock);
>>>>>> -            list_del_init(&s_job->list);
>>>>>> +            drm_sched_remove_pending_job(s_job);
>>>>>> spin_unlock(&sched->job_list_lock);
>>>>>>                /*
>>>>>> @@ -1066,7 +1106,7 @@ drm_sched_get_cleanup_job(struct 
>>>>>> drm_gpu_scheduler *sched)
>>>>>>        if (job && dma_fence_is_signaled(&job->s_fence->finished)) {
>>>>>>            /* remove job from pending_list */
>>>>>> -        list_del_init(&job->list);
>>>>>> +        drm_sched_remove_pending_job(job);
>>>>>>            /* cancel this job's TO timer */
>>>>>>            cancel_delayed_work(&sched->work_tdr);
>>>>>> diff --git a/include/drm/gpu_scheduler.h 
>>>>>> b/include/drm/gpu_scheduler.h
>>>>>> index b7b818cd81b6..7c628f36fe78 100644
>>>>>> --- a/include/drm/gpu_scheduler.h
>>>>>> +++ b/include/drm/gpu_scheduler.h
>>>>>> @@ -233,6 +233,21 @@ struct drm_sched_entity {
>>>>>>         */
>>>>>>        struct completion        entity_idle;
>>>>>> +    /**
>>>>>> +     * @pending_job_count:
>>>>>> +     *
>>>>>> +     * Number of pending jobs.
>>>>>> +     */
>>>>>> +    unsigned int                    pending_job_count;
>>>>>> +
>>>>>> +    /**
>>>>>> +     * @jobs_done:
>>>>>> +     *
>>>>>> +     * Signals when entity has no pending jobs, used to sequence 
>>>>>> entity
>>>>>> +     * cleanup in drm_sched_entity_fini().
>>>>>> +     */
>>>>>> +    struct completion        jobs_done;
>>>>>> +
>>>>>>        /**
>>>>>>         * @oldest_job_waiting:
>>>>>>         *
>>>>>> @@ -656,4 +671,7 @@ struct drm_gpu_scheduler *
>>>>>>    drm_sched_pick_best(struct drm_gpu_scheduler **sched_list,
>>>>>>                 unsigned int num_sched_list);
>>>>>> +void drm_sched_add_pending_job(struct drm_sched_job *job, bool 
>>>>>> tail);
>>>>>> +void drm_sched_remove_pending_job(struct drm_sched_job *job);
>>>>>> +
>>>>>>    #endif
>>>>>
>>>
>>
>

