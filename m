Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B69605F0C79
	for <lists+dri-devel@lfdr.de>; Fri, 30 Sep 2022 15:31:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C2E9B10ECFF;
	Fri, 30 Sep 2022 13:31:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2064.outbound.protection.outlook.com [40.107.92.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4DEB810ECFD;
 Fri, 30 Sep 2022 13:31:38 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FB+UX4wJdtO+TQ3DvFEuMBzkdhFh8n7Qd5ZA81Rgm4SwGT/0oQ/TrMIgf5sAPQFt9l5QGr/YJ/p9LF0ZgSTKkWD8+To70IHmMPHnDhU1s2gvGTANysRi9dHtiqIqhpg5eoBG5NfVI6v6BCoI8rdJELmFP78BdkC4dYJw2whtD//3ho9A6P8CFJqFMbE889OeDbVhGAxG5JUQOE0gCBXeDEuQP+PQeI3eW0IfkKT5X8cLjdrpm0CJq8V27gIUdYn/6M+xtynQPhz4ZPHNEfOeyP9gyOQefoA3/Ee032ia3fQEQEhfJk5YVg6WjDtkyJTvnDGHH3OAGMlIsH9IZyAVpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pqOr0zXxHyVkBaDSc//pXQSjUfXfSUJ9vamXF9h/GSU=;
 b=UScx3J132Snxckx4L+rP+kxYu6tGvK9Z5K1jTo3iREqHxS9B+/kQLc6n7EFxOoJMkIb4K4UwoQGss9ygK7+aQPdLhFOt4z+wTdbjdxzbfp2D9/CBkvTU0GrJhHA37R5lg7e9jvDLKuFWm/06ime9Xv7WKptn4PaSHS/BWMQeu3A2l3J/awnyRsSZ8zMA3A0ZLagLNHCcZEbXQqEwETpfnDnmZUUhyOHR4zKiuyvAtk0qQfLlxS8qv4kkhKRfAstMhelAcHdYHnoWBzxyFiNFZi8g7wi+18KFUhXQZwvTPDUVeZz+feOW8MLTa5jXh1/AfR5HNi9gtP9lmpcbxCVsEA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pqOr0zXxHyVkBaDSc//pXQSjUfXfSUJ9vamXF9h/GSU=;
 b=1XzqxWYOqd1TOIivER6ede+2N1UezFSQDwAHd2Wfp/+GXoyRKle7aw6HxasNGxbpJ1LUCQNwpcItRPi6IoQpcVxgyyNGGsSH6LJaX1+pBC2rAzzEtj+9h5oIatSbhF63/hw7lJl4ceXRL9nrG/jsY02socZbVIZ6+Dm7Pocfd10=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM5PR12MB1947.namprd12.prod.outlook.com (2603:10b6:3:111::23)
 by PH7PR12MB6934.namprd12.prod.outlook.com (2603:10b6:510:1b8::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5654.25; Fri, 30 Sep
 2022 13:31:34 +0000
Received: from DM5PR12MB1947.namprd12.prod.outlook.com
 ([fe80::5c7:e934:c098:f2ac]) by DM5PR12MB1947.namprd12.prod.outlook.com
 ([fe80::5c7:e934:c098:f2ac%8]) with mapi id 15.20.5676.023; Fri, 30 Sep 2022
 13:31:32 +0000
Message-ID: <5f66f608-61f3-1e31-c713-2fa63b1e37e7@amd.com>
Date: Fri, 30 Sep 2022 09:31:30 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v8] drm/sched: Add FIFO sched policy to run queue
Content-Language: en-US
To: Luben Tuikov <luben.tuikov@amd.com>,
 Direct Rendering Infrastructure - Development
 <dri-devel@lists.freedesktop.org>
References: <20220930041258.1050247-1-luben.tuikov@amd.com>
From: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
In-Reply-To: <20220930041258.1050247-1-luben.tuikov@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YT1PR01CA0075.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2d::14) To DM5PR12MB1947.namprd12.prod.outlook.com
 (2603:10b6:3:111::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM5PR12MB1947:EE_|PH7PR12MB6934:EE_
X-MS-Office365-Filtering-Correlation-Id: 884999b6-1e36-4713-f203-08daa2e816ae
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: OSRjUqY50oZxj1KgDiJyDUNXggd8NgpIuTNWnPaIupZ6gsuHLAHdMknvHxBcZI3vbjXO1WFnBMBsu6+kWDExA41/ZXFBsDoxLCIc8Tn2gGFfWvYDey2UVFzaxNS2/SBJbUW+fAsFUAirUuJE9PKQ2UyRgSTwAq0OnSRSYmIiKGpBOYXMeyN+6iUswwfGTqc1kfbFLZOJplizke6US/PGJkKeuxp5jwx1UaA5wSJhodAPeRMyl5SML3GkbTT6CBbdv6v6LZgekWrU37eLQu9MM6d58SSIHcQhHpJLM7TIQvvMrAlVH72PAk2tBZ1FvVpz1iQQe3kdmSnATxtkHbpA5V0gSMctTLJyN9w4So4BfYDscHOdsNeSfFYYVNZQf2EYYtRgSa2LPNg2L7LuZJsQgKxkESZ0Jjv5+Hw7IebI0GKYOqY6nF85PMOHMRkwesPN7szIFn293j2KsLif9RlpQrKpjTCo+NdA7YNQ7UCD91kDmCnqu1hsNJEiAi5uFY0bG5Ix2TGH8MAXvVZothGQCDrhgASNCESNbQBaxh9ftifZ1aHEcRoH6Z4HetWQxUNst8tBbsN3KPb4sFONOOSXSwpm39G27dAAVnwJS1sFrLcYwdWvSQx+p254e1/PXCN8XyuZPPI934PGygTK7gHOpESGzV/8I97MhVJzRPJ2kcT4yC77rfbAsbmHN6ZsjAoo1/aWBKhDw+v+ElTAia8nJlUNxu9YeLumnOrvDAAuTN9MVwtfdL7LOUvFhzpyOdNcpvSy7SlGNl2thr6YTnJPGkvcmkg8Bg+TtrSPKW3Xdvo=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM5PR12MB1947.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(346002)(376002)(136003)(366004)(39860400002)(396003)(451199015)(110136005)(450100002)(4326008)(66556008)(66946007)(44832011)(66476007)(316002)(83380400001)(86362001)(30864003)(2906002)(8676002)(31696002)(36756003)(41300700001)(5660300002)(8936002)(6486002)(6506007)(38100700002)(6512007)(53546011)(54906003)(2616005)(186003)(66574015)(478600001)(31686004)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Qk5rMUsxMVoxOEt6bkNjaWJEYitzQS8rQm5QMElib1JidFJhK05UR2llNlox?=
 =?utf-8?B?QmtxcnR4YzB6TDJjUmxJSVhEa0NuQ2hNa1IzcmcwYnhPNy9ZTjJmZE5ZUmJu?=
 =?utf-8?B?cUFJYnl3SSt4MHduRmxOdjZvNkR0dVhXR0c0bHZHcVBpQytOU1l5bWYyR2tD?=
 =?utf-8?B?RUh0bzNIR1NSSFpiSDcwOTB6UnJnNEFmRG5jaTFNVEpTNUJ6QjR3c3p4U29v?=
 =?utf-8?B?RE5kQ3NvSW85K244djAxbERJYWp6akM1WVYrVXk2akF6OTBMM1VzckJEWFZ4?=
 =?utf-8?B?RDA0d08wVDZsNE5tTDN5YjBZOXFPYUtYazIyY25PaXBPZ2xxS0wzNDhqSXps?=
 =?utf-8?B?TXhNMGdDUWwzSVZ0enVuSEIrUzRCYWtKdFFoWGE4VnhtOXkvQ0tLUm9UNmdI?=
 =?utf-8?B?UnRFc3BOU3gzTFZuMjFEZzBKUGIrUDRER2ZURm9lRXhGYTVoVnRuOU1yYzky?=
 =?utf-8?B?TXRBd1E5QVJZa3hReUtrTGRMUnVHTk10Wlp3MUdlaUNsWkRidUQ1aTJ6WGlp?=
 =?utf-8?B?ZHh6dGtQN0RYY3BnQUx4S1VONFBqcXhYWGl5RWVBNWp1V2NUem5TQWg3WWo2?=
 =?utf-8?B?dTlaUmd4cTR2RkRLWWFpY0RRNzR3amVHdFJHNTlLc05OOUk5ZWtqQk05MGsr?=
 =?utf-8?B?MEdwZm1adnY2UEowbUpNTmlqTEFxZStWbExzaTVPUkFoTWFCaEFPR0grYmw4?=
 =?utf-8?B?Y3dPR1dJUFo2OU12QlZaa1dKMDFuZ0pYYnJLMDF1bnYrTjc5VDUyL0FXSG5i?=
 =?utf-8?B?S1MwVXc5VDRvdU5jdW93eGphSW12Z0ZFUm5WRGJQTmh0T3pLSEJHRDBFbzRJ?=
 =?utf-8?B?Ykd6RUttd1Y5ZG94bis3VEdmMjUwUHhKdmNSM2R2ZzNTYVp3QWpDejZUNWdI?=
 =?utf-8?B?aS9jSWxBRHRja012RVI5SFczSXRwZHhkNHVJaFZTRmNmQVlCclZhczJmMElK?=
 =?utf-8?B?NUM5ek5Ca3luelViTTMydldNQnVkbHBaT0dVVi9QTFBQQnZJM2F2VzRDR1F1?=
 =?utf-8?B?OWFBWkl3Sk5QdElJSGlrclNaZnpTN3dRSXU0RmVsMlVjSytnb3phQ3ZkY1dh?=
 =?utf-8?B?amdBbWtmWDVycTNGZThTM2YwNmxnOGtvWkw4bUg1SGFlOFFCdG1VVWZxZ3J2?=
 =?utf-8?B?L3c5allMZnpXZDJ5QWUxU2ZMOWU1YlFBMXpKR1JhVXpEZzZTNkVaZ3AxSjZR?=
 =?utf-8?B?UzNiQmNTV1lwcmk2V3Zxd2g1K0lrcnZmeHVTQ0xtRDVCK2pYOFNYRHA2UG9v?=
 =?utf-8?B?Wm1jK1M4eDA2OEZVR3hmRXJXS3RLVVFUUVJIcE5IUFJzaVcxSy85V2NUTm82?=
 =?utf-8?B?aGlVNHM2c0EzSmlJNWJzWVhBTHl6aTM4bmprRU1BVHU2OHlic1VkNmtXQVZR?=
 =?utf-8?B?MGttd01OaFhsSmxGMlgwUXBSU1Q4RTJjTVRGdGorVHBOVXQrL0w1dTN5M0Yx?=
 =?utf-8?B?YU4xUTA0dExRS0RuOExjZGNJZ2h6SS82WEpVWE1zaHkvTjhoTEZSVUdZdlVk?=
 =?utf-8?B?SjFGVGZRV3lReUtxRjA4ME1nS0QxeHVnZEI3NTZFMm93MVl6SlJXcmw4TGpK?=
 =?utf-8?B?VkZDc3BJTjJqYkdhMThiNldWaDdvaWw4bTFwQ1hDSXE1amJFenhESnRtVkV4?=
 =?utf-8?B?TVkwQmJ2KyttdmtvVzJOaEVhRHVpVngvMDFaUmR6a3pET2d5elRWYVFHMUdJ?=
 =?utf-8?B?RmZuWUNaMm0xc0pRZ1FWRWRQMng2aWxvQk4wQmZqbW1ueG95aERkaUl6VG1N?=
 =?utf-8?B?ZjFIamxyN25mRlVhM1creGxTRlhYRTZlRE00eVp6b2gwWWQ3UE5aNTdXM2NZ?=
 =?utf-8?B?NlIrZDB0aHVjcVlrWFNFSVJBQlgyQnV6SmxOd09EYWRZdlRCWGJmNHVNdHhM?=
 =?utf-8?B?ZTdKbzB4NGd1MVFoQmRRVWlNUHJTUVUrd2FQRjFPZ3JKMXZhRGNDU2RFK1V6?=
 =?utf-8?B?Skl2Ulh2SGdSQXMwaEdPei9ub3J1YldzUjY3b3JKbUgzTWNabWlNczZ3SVVX?=
 =?utf-8?B?bk02L1QvT3JLL2V4YW9zeVNTYTFpbXhucUpROTBPVDhZWTNTM2NFVEI1T0dD?=
 =?utf-8?B?TXBNRWFaT3RoTHV3R3VXaUh3VEkzNlV6RFRKNXpjS0ZCeHZYM0hoeUVaZ1ZW?=
 =?utf-8?B?ekFJNVBseWtXbmRDMjVLNU1CNWtML3R2UWZYRDErMm5CaUdOREwvRkFuUlN2?=
 =?utf-8?Q?k/dSkgQNRE81+7z566DrpQOO1uSBt4KCLrPgKHGM6VlW?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 884999b6-1e36-4713-f203-08daa2e816ae
X-MS-Exchange-CrossTenant-AuthSource: DM5PR12MB1947.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2022 13:31:32.5053 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RI8I3uH2yAygwUPBaCBkNij7HlsQ2JNhV/b+i/juF1GBQbkNzOjsPvDgyPCiQROnRkeXBELEiiDNiDJsvekkfg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6934
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
Cc: Yunxiang Li <Yunxiang.Li@amd.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 AMD Graphics <amd-gfx@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Thanks for helping with review and good improvement ideas.

Pushed to drm-misc-next.

Andrey

On 2022-09-30 00:12, Luben Tuikov wrote:
> From: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
>
> When many entities are competing for the same run queue
> on the same scheduler, we observe an unusually long wait
> times and some jobs get starved. This has been observed on GPUVis.
>
> The issue is due to the Round Robin policy used by schedulers
> to pick up the next entity's job queue for execution. Under stress
> of many entities and long job queues within entity some
> jobs could be stuck for very long time in it's entity's
> queue before being popped from the queue and executed
> while for other entities with smaller job queues a job
> might execute earlier even though that job arrived later
> then the job in the long queue.
>
> Fix:
> Add FIFO selection policy to entities in run queue, chose next entity
> on run queue in such order that if job on one entity arrived
> earlier then job on another entity the first job will start
> executing earlier regardless of the length of the entity's job
> queue.
>
> v2:
> Switch to rb tree structure for entities based on TS of
> oldest job waiting in the job queue of an entity. Improves next
> entity extraction to O(1). Entity TS update
> O(log N) where N is the number of entities in the run-queue
>
> Drop default option in module control parameter.
>
> v3:
> Various cosmetical fixes and minor refactoring of fifo update function. (Luben)
>
> v4:
> Switch drm_sched_rq_select_entity_fifo to in order search (Luben)
>
> v5: Fix up drm_sched_rq_select_entity_fifo loop (Luben)
>
> v6: Add missing drm_sched_rq_remove_fifo_locked
>
> v7: Fix ts sampling bug and more cosmetic stuff (Luben)
>
> v8: Fix module parameter string (Luben)
>
> Cc: Luben Tuikov <luben.tuikov@amd.com>
> Cc: Christian König <christian.koenig@amd.com>
> Cc: Direct Rendering Infrastructure - Development <dri-devel@lists.freedesktop.org>
> Cc: AMD Graphics <amd-gfx@lists.freedesktop.org>
> Signed-off-by: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
> Tested-by: Yunxiang Li (Teddy) <Yunxiang.Li@amd.com>
> Signed-off-by: Luben Tuikov <luben.tuikov@amd.com>
> Reviewed-by: Luben Tuikov <luben.tuikov@amd.com>
> ---
>   drivers/gpu/drm/scheduler/sched_entity.c | 20 +++++
>   drivers/gpu/drm/scheduler/sched_main.c   | 96 +++++++++++++++++++++++-
>   include/drm/gpu_scheduler.h              | 32 ++++++++
>   3 files changed, 145 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/scheduler/sched_entity.c b/drivers/gpu/drm/scheduler/sched_entity.c
> index 6b25b2f4f5a308..7060e4ed5a3148 100644
> --- a/drivers/gpu/drm/scheduler/sched_entity.c
> +++ b/drivers/gpu/drm/scheduler/sched_entity.c
> @@ -73,6 +73,7 @@ int drm_sched_entity_init(struct drm_sched_entity *entity,
>   	entity->priority = priority;
>   	entity->sched_list = num_sched_list > 1 ? sched_list : NULL;
>   	entity->last_scheduled = NULL;
> +	RB_CLEAR_NODE(&entity->rb_tree_node);
>   
>   	if(num_sched_list)
>   		entity->rq = &sched_list[0]->sched_rq[entity->priority];
> @@ -443,6 +444,19 @@ struct drm_sched_job *drm_sched_entity_pop_job(struct drm_sched_entity *entity)
>   	smp_wmb();
>   
>   	spsc_queue_pop(&entity->job_queue);
> +
> +	/*
> +	 * Update the entity's location in the min heap according to
> +	 * the timestamp of the next job, if any.
> +	 */
> +	if (drm_sched_policy == DRM_SCHED_POLICY_FIFO) {
> +		struct drm_sched_job *next;
> +
> +		next = to_drm_sched_job(spsc_queue_peek(&entity->job_queue));
> +		if (next)
> +			drm_sched_rq_update_fifo(entity, next->submit_ts);
> +	}
> +
>   	return sched_job;
>   }
>   
> @@ -507,6 +521,7 @@ void drm_sched_entity_push_job(struct drm_sched_job *sched_job)
>   	atomic_inc(entity->rq->sched->score);
>   	WRITE_ONCE(entity->last_user, current->group_leader);
>   	first = spsc_queue_push(&entity->job_queue, &sched_job->queue_node);
> +	sched_job->submit_ts = ktime_get();
>   
>   	/* first job wakes up scheduler */
>   	if (first) {
> @@ -518,8 +533,13 @@ void drm_sched_entity_push_job(struct drm_sched_job *sched_job)
>   			DRM_ERROR("Trying to push to a killed entity\n");
>   			return;
>   		}
> +
>   		drm_sched_rq_add_entity(entity->rq, entity);
>   		spin_unlock(&entity->rq_lock);
> +
> +		if (drm_sched_policy == DRM_SCHED_POLICY_FIFO)
> +			drm_sched_rq_update_fifo(entity, sched_job->submit_ts);
> +
>   		drm_sched_wakeup(entity->rq->sched);
>   	}
>   }
> diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
> index 4f2395d1a79182..ce86b03e838699 100644
> --- a/drivers/gpu/drm/scheduler/sched_main.c
> +++ b/drivers/gpu/drm/scheduler/sched_main.c
> @@ -62,6 +62,55 @@
>   #define to_drm_sched_job(sched_job)		\
>   		container_of((sched_job), struct drm_sched_job, queue_node)
>   
> +int drm_sched_policy = DRM_SCHED_POLICY_RR;
> +
> +/**
> + * DOC: sched_policy (int)
> + * Used to override default entities scheduling policy in a run queue.
> + */
> +MODULE_PARM_DESC(sched_policy, "Specify schedule policy for entities on a runqueue, " __stringify(DRM_SCHED_POLICY_RR) " = Round Robin (default), " __stringify(DRM_SCHED_POLICY_FIFO) " = use FIFO.");
> +module_param_named(sched_policy, drm_sched_policy, int, 0444);
> +
> +static __always_inline bool drm_sched_entity_compare_before(struct rb_node *a,
> +							    const struct rb_node *b)
> +{
> +	struct drm_sched_entity *ent_a =  rb_entry((a), struct drm_sched_entity, rb_tree_node);
> +	struct drm_sched_entity *ent_b =  rb_entry((b), struct drm_sched_entity, rb_tree_node);
> +
> +	return ktime_before(ent_a->oldest_job_waiting, ent_b->oldest_job_waiting);
> +}
> +
> +static inline void drm_sched_rq_remove_fifo_locked(struct drm_sched_entity *entity)
> +{
> +	struct drm_sched_rq *rq = entity->rq;
> +
> +	if (!RB_EMPTY_NODE(&entity->rb_tree_node)) {
> +		rb_erase_cached(&entity->rb_tree_node, &rq->rb_tree_root);
> +		RB_CLEAR_NODE(&entity->rb_tree_node);
> +	}
> +}
> +
> +void drm_sched_rq_update_fifo(struct drm_sched_entity *entity, ktime_t ts)
> +{
> +	/*
> +	 * Both locks need to be grabbed, one to protect from entity->rq change
> +	 * for entity from within concurrent drm_sched_entity_select_rq and the
> +	 * other to update the rb tree structure.
> +	 */
> +	spin_lock(&entity->rq_lock);
> +	spin_lock(&entity->rq->lock);
> +
> +	drm_sched_rq_remove_fifo_locked(entity);
> +
> +	entity->oldest_job_waiting = ts;
> +
> +	rb_add_cached(&entity->rb_tree_node, &entity->rq->rb_tree_root,
> +		      drm_sched_entity_compare_before);
> +
> +	spin_unlock(&entity->rq->lock);
> +	spin_unlock(&entity->rq_lock);
> +}
> +
>   /**
>    * drm_sched_rq_init - initialize a given run queue struct
>    *
> @@ -75,6 +124,7 @@ static void drm_sched_rq_init(struct drm_gpu_scheduler *sched,
>   {
>   	spin_lock_init(&rq->lock);
>   	INIT_LIST_HEAD(&rq->entities);
> +	rq->rb_tree_root = RB_ROOT_CACHED;
>   	rq->current_entity = NULL;
>   	rq->sched = sched;
>   }
> @@ -92,9 +142,12 @@ void drm_sched_rq_add_entity(struct drm_sched_rq *rq,
>   {
>   	if (!list_empty(&entity->list))
>   		return;
> +
>   	spin_lock(&rq->lock);
> +
>   	atomic_inc(rq->sched->score);
>   	list_add_tail(&entity->list, &rq->entities);
> +
>   	spin_unlock(&rq->lock);
>   }
>   
> @@ -111,23 +164,30 @@ void drm_sched_rq_remove_entity(struct drm_sched_rq *rq,
>   {
>   	if (list_empty(&entity->list))
>   		return;
> +
>   	spin_lock(&rq->lock);
> +
>   	atomic_dec(rq->sched->score);
>   	list_del_init(&entity->list);
> +
>   	if (rq->current_entity == entity)
>   		rq->current_entity = NULL;
> +
> +	if (drm_sched_policy == DRM_SCHED_POLICY_FIFO)
> +		drm_sched_rq_remove_fifo_locked(entity);
> +
>   	spin_unlock(&rq->lock);
>   }
>   
>   /**
> - * drm_sched_rq_select_entity - Select an entity which could provide a job to run
> + * drm_sched_rq_select_entity_rr - Select an entity which could provide a job to run
>    *
>    * @rq: scheduler run queue to check.
>    *
>    * Try to find a ready entity, returns NULL if none found.
>    */
>   static struct drm_sched_entity *
> -drm_sched_rq_select_entity(struct drm_sched_rq *rq)
> +drm_sched_rq_select_entity_rr(struct drm_sched_rq *rq)
>   {
>   	struct drm_sched_entity *entity;
>   
> @@ -163,6 +223,34 @@ drm_sched_rq_select_entity(struct drm_sched_rq *rq)
>   	return NULL;
>   }
>   
> +/**
> + * drm_sched_rq_select_entity_fifo - Select an entity which provides a job to run
> + *
> + * @rq: scheduler run queue to check.
> + *
> + * Find oldest waiting ready entity, returns NULL if none found.
> + */
> +static struct drm_sched_entity *
> +drm_sched_rq_select_entity_fifo(struct drm_sched_rq *rq)
> +{
> +	struct rb_node *rb;
> +
> +	spin_lock(&rq->lock);
> +	for (rb = rb_first_cached(&rq->rb_tree_root); rb; rb = rb_next(rb)) {
> +		struct drm_sched_entity *entity;
> +
> +		entity = rb_entry(rb, struct drm_sched_entity, rb_tree_node);
> +		if (drm_sched_entity_is_ready(entity)) {
> +			rq->current_entity = entity;
> +			reinit_completion(&entity->entity_idle);
> +			break;
> +		}
> +	}
> +	spin_unlock(&rq->lock);
> +
> +	return rb ? rb_entry(rb, struct drm_sched_entity, rb_tree_node) : NULL;
> +}
> +
>   /**
>    * drm_sched_job_done - complete a job
>    * @s_job: pointer to the job which is done
> @@ -803,7 +891,9 @@ drm_sched_select_entity(struct drm_gpu_scheduler *sched)
>   
>   	/* Kernel run queue has higher priority than normal run queue*/
>   	for (i = DRM_SCHED_PRIORITY_COUNT - 1; i >= DRM_SCHED_PRIORITY_MIN; i--) {
> -		entity = drm_sched_rq_select_entity(&sched->sched_rq[i]);
> +		entity = drm_sched_policy == DRM_SCHED_POLICY_FIFO ?
> +			drm_sched_rq_select_entity_fifo(&sched->sched_rq[i]) :
> +			drm_sched_rq_select_entity_rr(&sched->sched_rq[i]);
>   		if (entity)
>   			break;
>   	}
> diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
> index 599855c6a6727b..1f7d9dd1a44484 100644
> --- a/include/drm/gpu_scheduler.h
> +++ b/include/drm/gpu_scheduler.h
> @@ -50,6 +50,12 @@ enum drm_sched_priority {
>   	DRM_SCHED_PRIORITY_UNSET = -2
>   };
>   
> +/* Used to chose between FIFO and RR jobs scheduling */
> +extern int drm_sched_policy;
> +
> +#define DRM_SCHED_POLICY_RR    0
> +#define DRM_SCHED_POLICY_FIFO  1
> +
>   /**
>    * struct drm_sched_entity - A wrapper around a job queue (typically
>    * attached to the DRM file_priv).
> @@ -196,6 +202,21 @@ struct drm_sched_entity {
>   	 * drm_sched_entity_fini().
>   	 */
>   	struct completion		entity_idle;
> +
> +	/**
> +	 * @oldest_job_waiting:
> +	 *
> +	 * Marks earliest job waiting in SW queue
> +	 */
> +	ktime_t				oldest_job_waiting;
> +
> +	/**
> +	 * @rb_tree_node:
> +	 *
> +	 * The node used to insert this entity into time based priority queue
> +	 */
> +	struct rb_node			rb_tree_node;
> +
>   };
>   
>   /**
> @@ -205,6 +226,7 @@ struct drm_sched_entity {
>    * @sched: the scheduler to which this rq belongs to.
>    * @entities: list of the entities to be scheduled.
>    * @current_entity: the entity which is to be scheduled.
> + * @rb_tree_root: root of time based priory queue of entities for FIFO scheduling
>    *
>    * Run queue is a set of entities scheduling command submissions for
>    * one specific ring. It implements the scheduling policy that selects
> @@ -215,6 +237,7 @@ struct drm_sched_rq {
>   	struct drm_gpu_scheduler	*sched;
>   	struct list_head		entities;
>   	struct drm_sched_entity		*current_entity;
> +	struct rb_root_cached		rb_tree_root;
>   };
>   
>   /**
> @@ -314,6 +337,13 @@ struct drm_sched_job {
>   
>   	/** @last_dependency: tracks @dependencies as they signal */
>   	unsigned long			last_dependency;
> +
> +	/**
> +	 * @submit_ts:
> +	 *
> +	 * When the job was pushed into the entity queue.
> +	 */
> +	ktime_t                         submit_ts;
>   };
>   
>   static inline bool drm_sched_invalidate_job(struct drm_sched_job *s_job,
> @@ -503,6 +533,8 @@ void drm_sched_rq_add_entity(struct drm_sched_rq *rq,
>   void drm_sched_rq_remove_entity(struct drm_sched_rq *rq,
>   				struct drm_sched_entity *entity);
>   
> +void drm_sched_rq_update_fifo(struct drm_sched_entity *entity, ktime_t ts);
> +
>   int drm_sched_entity_init(struct drm_sched_entity *entity,
>   			  enum drm_sched_priority priority,
>   			  struct drm_gpu_scheduler **sched_list,
>
> base-commit: 2ab69739209c843a47af82c0620036b233c83688
