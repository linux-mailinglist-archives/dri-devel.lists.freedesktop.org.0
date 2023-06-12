Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5945C72C596
	for <lists+dri-devel@lfdr.de>; Mon, 12 Jun 2023 15:16:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C60D910E04E;
	Mon, 12 Jun 2023 13:16:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on20620.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe59::620])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DED9710E04E
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Jun 2023 13:16:15 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bPaTQOmv0Pb+AhG0Z45rnaS0Z5HrIV6utQtCuxuOCh8ZNrO+WB6+U0mqT1wPMqWFKm66JhMQ3jvlfB/oV2Ft6EJgmpRsfzNnq1LJYFeI/wa0oLPfj5FVtvIubXMAZFIgXJaEBOL7j9auDHQbitIQL9/yegqjt5Wdm9YOPpJxDfx3MKZsCOz74BTL5nko12MdUaHqMsj6hYPfbB2Z/YLuN8npt5lSyrSiJZ1zYHXyZP+1CPyWoWlknbaT/i5P4pCGlCYdgFIs/FG7gzM3YV0xV87vT2/VgI+T1qePSoW2fkuszvrXBId6iRWdKHbQhNZ7S6Xh8huBT2EvyDyMGk8ChQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eKsy9+t9OwldhOJWD230N3o4SoPPtZbKsgPHhN3BwFc=;
 b=DUjm+jpQ6Tc6FmMg8roiqtDjMiLLkZinWWMK79X/gBToRBa12Qnk3R6zLP2ZusN+tAvK+k9GAZ6G7goyZAHWu8bxhihDT2DZJ6ByNOUzsZand48+fBDMe2ns1vV1mt15x8+vTKKXBkAKuzSjCyItUVNlPs7l8G94JlvdODZyi4txKJOgHyOq4op1I2Y1jYD90oJSYHmZB6KPqmFVSjfq3YG89lRXwxuua6/+C19EKyBr+Esr+PrcCPICO2jf+yKsB+6D3WR+0dzzArrPJkoa6f3tB1e1BsKMqv3j5c2ZJFqoRJhXQYqBethpvr2d8sK7hjI0KJkzctyVMqa7q83nRg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eKsy9+t9OwldhOJWD230N3o4SoPPtZbKsgPHhN3BwFc=;
 b=MmQyuR4vLQpuncB+MT2lDaYN+GCZdQRm9/0jDaCg8c71QFMp1qr9zy/8wZjwiEnWNBiDPESXW0OogzkPLiexhtDX6DTMmFDvVtIidpyfQDLBnmAMbtOEITCsgU1EeUArkAsF1VRRG6OOCnIvpbrEBhPoarrmZjh2ETWdofCB6MY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BYAPR12MB3589.namprd12.prod.outlook.com (2603:10b6:a03:df::29)
 by MN2PR12MB4224.namprd12.prod.outlook.com (2603:10b6:208:1dd::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6477.29; Mon, 12 Jun
 2023 13:16:10 +0000
Received: from BYAPR12MB3589.namprd12.prod.outlook.com
 ([fe80::401e:2e7f:7c2b:6bff]) by BYAPR12MB3589.namprd12.prod.outlook.com
 ([fe80::401e:2e7f:7c2b:6bff%4]) with mapi id 15.20.6455.024; Mon, 12 Jun 2023
 13:16:09 +0000
Message-ID: <5fcf04fa-1f45-30dd-1a37-cb0eba6d5f4a@amd.com>
Date: Mon, 12 Jun 2023 15:16:03 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH] drm/sched: Add native dependency support to drm_sched
Content-Language: en-US
To: Donald Robson <Donald.Robson@imgtec.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
References: <7ced7c0a101cb2467c34b69d2b686c429f64d8c2.camel@imgtec.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <7ced7c0a101cb2467c34b69d2b686c429f64d8c2.camel@imgtec.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0140.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:95::12) To BYAPR12MB3589.namprd12.prod.outlook.com
 (2603:10b6:a03:df::29)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR12MB3589:EE_|MN2PR12MB4224:EE_
X-MS-Office365-Filtering-Correlation-Id: 09259e86-7fd1-4b53-42f6-08db6b47300e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Vchf1iV4BumRUZevXMSQ/05EX4RIcwx26wMdTS8nTG0uig/DneIhsPc8AkUQL1oFs1PXf1CiEmAiUb6JK0TyxvXoroOCEhRCJn3CfUCmnKjru5g9iMZnf261T06QQrvM9zy4uy9O9sr5lT9cZ3a51CiJunxwOgJaLLQ4A0c/6dS4t62lnktZni+gAWQL5bnqy7aOpBxSOUzLUxNvQW9DhM6pyekwAb+nj6CiNvKuIvYw8ucZvom/Ru+UBPJANIXlCA3BvuO4SIfG/we60rLiAR47WA6RdzJo9pEfKmpnDlpZdtm7En4EBH8XKpIZdFtOxc3Xiv+Zzgt8cH57QDQVhQSfgyl3kvt3DZE+/iUp2WiQ2P/dZrJoddF0V6gpf3/PgZTRPIXfYaTr+k6ZmewIkyib/whnN6keRE9ruGWkqAaQyPlfhMDl8z5gSTbZQa6JMVqrqkBlmQhc63OuHaobI9Rt/Rxmahh6tBgHAf6ALXc6TnvXIdKO82WbM/56LoGUlies+C+bvnng1hIofJUsUXhftalDojVsN9kyKeLj9ET77t82aIbeHInDE8EnSbgO5pEl8qJtspTZLWeOVsNgpOfvAC065vWAQ4sH59pAp+OLjcGud+fCTC0NUWNwwScMCafqLQ8FWePPSIIvh3GNjA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR12MB3589.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(366004)(346002)(39860400002)(136003)(376002)(396003)(451199021)(2616005)(83380400001)(66574015)(31696002)(86362001)(36756003)(38100700002)(478600001)(4326008)(110136005)(54906003)(6486002)(6666004)(8936002)(8676002)(30864003)(2906002)(5660300002)(66556008)(66946007)(66476007)(31686004)(41300700001)(316002)(186003)(66899021)(6506007)(6512007)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?STBsdjV3SnV0SGNKdkR1clkyUVNYM2lOVVppdFYzUVNwQVZtOW9lT0VYcEZ3?=
 =?utf-8?B?Qm8vb1Q0NHRjSkZnUThzY01SQUZtTDFnalFSYkQ0dVBhTU9ySXRrbC9MMTM2?=
 =?utf-8?B?Q0FuNEczdjUwbktTTHIvMyttZTgxbnhkR2psTFRnS2VvUkhaTC91WEpINUlW?=
 =?utf-8?B?TDltdmQxcjVEUkdaNHNwb25NMkd5cVNhNnZ2dkZld3h0cHhvWk1MUGRnYWly?=
 =?utf-8?B?QjloR0YxaU5rUnhEblZBeTZuQktmd3FDNGpCZEZEZkFLdVhTSW15Y0l1cDB2?=
 =?utf-8?B?eHlkL0p4dElubFRBOHJMUjNOcWdyRXdWRFJBT3R3N0RndnRjTjVOL0ZiZU9k?=
 =?utf-8?B?VFlxcTVlTVZiS2dXUWFMb25oc0N6MGRyb2FjYnEySjd5c0hGcTNDV2RUZFQr?=
 =?utf-8?B?cExIREhMcWtreSttRVMwTDlNVjZFOFo3YTFtNVJORWdSa0IzVEhSaGJtVkdX?=
 =?utf-8?B?OFcwdnJpYjRrNkVvcUgvNGZCcjdLVGNaYmcxeWRaaHlCY2hYZzUzYStiQUhC?=
 =?utf-8?B?RVZmbWJkUlpVSitKME5HbFkxMGdpVzA2U1dtcmVyRzRrSzRPT1oybnpwYUNY?=
 =?utf-8?B?UE9iS3RSWkRRekl5bkZNTDBGMXc1d3V5M3dja3N2UUxaYVZ2WGloUEZkdmUy?=
 =?utf-8?B?RDNwSGZwRzZ3V0swc2JhL3dUeDlJUlBoNGordGh1UlY2ZHZ0bVVYMkE3VWcv?=
 =?utf-8?B?VnNkaytSdHByZVFOMEJMcGFqd0hob09QNGw0c25kR0VIWEU3emRJMUx0alNl?=
 =?utf-8?B?bnFaMnYxczZNSVgwVm82RGVwaUpabUtQRjBaUjh3QVNaeTVlRE1ieEJLcnpl?=
 =?utf-8?B?R3pYZWViZWQrVVNCUit4Z1A3ZC9MMTNadmxhN3RqeWhZRWZJK1RlM0U2anhI?=
 =?utf-8?B?UzZieFFNK3QyK3ZzOWwwKy9IS0N6Wndhb1I3N3FteDNXbm9keXFKMGljdHo5?=
 =?utf-8?B?UGRhTVZXUFh5ZzkxbGptSjlZYkJMelREV3g2NGl6OGxnWmNnVjhHMWdDWW5J?=
 =?utf-8?B?M2tyd3dhTkpTOVQ2RDJ2VmdFZmtzSkJyYkdPa3E1MnR2V1dBbm5EU2lZVHl4?=
 =?utf-8?B?ci9PN3YxejA2QVgwZXp0NmtWUFRSeFcxcERraUVsZStLbUk4bUkxUUdBVS8z?=
 =?utf-8?B?U0c2aHpmd0EyeUp1ZnovUktpbDJzMnJMQ2Z1VDY3SW9uS0FJRy9mL2p4WFJE?=
 =?utf-8?B?bEN1NDRSMkFiQjUraG5sMGE0SEVoSStLY1JoUmJBQXh2eXZHOXNVTlNPZHJm?=
 =?utf-8?B?Z1Jlbll3OHBNeGtiTDFVTFJydzNhaGxVREZ6cU1PR21MTHdnYkxYMU9OcUpq?=
 =?utf-8?B?TmJNSGNGWHM0bmMrZnRHY0lFZkE0dXFCRDEzclEwSEh5QlB6dmpkK2lMc1dW?=
 =?utf-8?B?d2ZGTXBibWxQY2JOQ0xrYkJrSTBQWWNzNk1IbDRNVE9QNk1FYjRwMG1UcXZK?=
 =?utf-8?B?K1diTDQvV1phaHZoMnFnTUhFRmpIRTdqQVp1bWhYN2k0dkRUYjI2Qi9VQzl3?=
 =?utf-8?B?eGFDSmlXODFVZFZIZzdKbUhocGgxVFlmRHB3MjhUaGpqQjlmeVNLN0xQcmo5?=
 =?utf-8?B?RXpLM004QmZJMXNyd20yY0c3YUN2bHBBL0cycUJDL0Z2NnR4K2lhQUZnbXdi?=
 =?utf-8?B?YjlOODJKY3FuOUpHYlNaV2hwbzlXU2c3Qms2SG81SnlRNDRYaHd4RDgxNjBF?=
 =?utf-8?B?a0JZWG1PTGdjNHFOUWZNK3p3OHZ6ZXlnM0RFYlhZOHpnTjRpYm5BNFZPQ0Ri?=
 =?utf-8?B?V0VYYys5S2JZOXBpZlJscEhmdFBNWkRFVnhzbHVxZVY0aW84VWwwanNNNXRp?=
 =?utf-8?B?MkxVUmxscS95Mml3UGFlUGg2YU1uMjZhdU1sUTBiYUhLenVzMlN5MkIwb0xr?=
 =?utf-8?B?U25TUW0rTkRiMVh4NVkrUjNPK0tqbmFoNFIvcUJQWDNYNTlzUk9uY2ZkbXlI?=
 =?utf-8?B?dDNEem01QUoxWnJuOTdBdlVMYXVUUDhuenVZb1h0TnlrNGZXTGNYdGRPY1Vn?=
 =?utf-8?B?bUptMTcxL2dFelZIUnpJV21neXlDRGZ5YzQ2UFNuQ0FBSTJPSjJ0OTFuVGNz?=
 =?utf-8?B?MGVpYTE1OXBtdkVWU2QzSUdOcDVMdmFBWjJkVWY2K0UvWU91d05GQ1A4ZHJN?=
 =?utf-8?B?b00wYmI5SnlwUE54UlZhc2xTaUpSYlRLR0ZEbzhKR0tsS1VCR0tiKzc4Y25O?=
 =?utf-8?Q?Fo3TBfxNyxw3wXBWe+wnySauoGCxig1mDdigCL8xReMu?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 09259e86-7fd1-4b53-42f6-08db6b47300e
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB3589.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jun 2023 13:16:09.8212 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tziaFYYMSIsD9ZVdTaz1+ztWIDgq3S9st8GGUjZYxwa6ZJegr/1YrKd6R5mkg3eV
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4224
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
Cc: Sarah Walker <Sarah.Walker@imgtec.com>,
 "luben.tuikov@amd.com" <luben.tuikov@amd.com>,
 "boris.brezillon@collabora.com" <boris.brezillon@collabora.com>,
 "sumit.semwal@linaro.org" <sumit.semwal@linaro.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 08.06.23 um 15:23 schrieb Donald Robson:
> This patch adds support for 'native' dependencies to DRM scheduler.  In
> drivers that use a firmware based scheduler there are performance gains
> to be had by allowing waits to happen in the firmware, as this reduces
> the latency between signalling and job submission.

Well, if I'm not completely mistaken this patch here is superfluous 
since we already use that functionality.

This strongly sounds like the HW dependencies we have in amdgpu. See 
AMDGPU_CHUNK_ID_SCHEDULED_DEPENDENCIES.

Basically userspace can instead of giving a hard dependency to finish 
something before the current submission starts also give a soft 
dependency and only let the other submission be scheduled.

This way you can then wait for the firmware for certain operations of 
the previous submission to complete by comparing memory or registers.

You don't necessarily need to give control over this to userspace, if 
your kernel driver can determine a fw assisted wait by itself that 
should also work fine.

Regards,
Christian.

>    Dependencies that
> can be awaited by the firmware scheduler are termed 'native
> dependencies'.  In the new PowerVR driver we delegate the waits to the
> firmware, but it is still necessary to expose these fences within DRM
> scheduler.  This is because when a job is cancelled
> drm_sched_entity_kill() registers callback to all the dependencies in
> order to ensure the job finished fence is not signalled before all the
> job dependencies are met, and if they were not exposed the core wouldn't
> be able to guarantee that anymore, and it might signal the fence too
> early leading to potential invalid accesses if other things depend on
> the job finished fence.
>
> All dependencies are handled in the same way up to the point that
> dependencies for a job are being checked.  At this stage, DRM scheduler
> will now allow  job submission to proceed once it encounters the first
> native dependency in the list - dependencies having been sorted
> beforehand in drm_sched_job_arm() so that native ones appear last.  The
> list is sorted during drm_sched_job_arm() because the scheduler isn't
> known until this point, and determining whether a dependency is native
> is via a new drm_gpu_scheduler backend operation.
>
> Native fences are just simple counters that get incremented every time
> some specific execution point is reached, like when a GPU job is done.
> The firmware is in charge of waiting but also updating fences, so it can
> easily unblock any waiters it has internally. The CPU also has access to
> these counters, so it can also check for progress.
>
> TODO:
>
> When operating normally the CPU is not supposed to update the counters
> itself, but there is one specific situation where this is needed - when
> a GPU hang happened and some context were declared faulty because they
> had unfinished or blocked jobs pending. In that situation, when we reset
> the GPU we will evict faulty contexts so they can't submit jobs anymore
> and we will cancel the jobs that were in-flight at the time of reset,
> but that's not enough because some jobs on other non-faulty contexts
> might have native dependencies on jobs that never completed on this
> faulty context.
>
> If we were to ask the firmware to wait on those native fences, it would
> block indefinitely, because no one would ever update the counter. So, in
> that case, and that case only, we want the CPU to force-update the
> counter and set it to the last issued sequence number.  We do not
> currently have a helper for this and we welcome any suggestions for how
> best to implement it.
>
> Signed-off-by: Donald Robson <donald.robson@imgtec.com>
> Cc: Luben Tuikov <luben.tuikov@amd.com>
> Cc: David Airlie <airlied@gmail.com>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: Sumit Semwal <sumit.semwal@linaro.org>
> Cc: "Christian König" <christian.koenig@amd.com>
> Cc: Boris Brezillon <boris.brezillon@collabora.com>
> Cc: Frank Binns <frank.binns@imgtec.com>
> Cc: Sarah Walker <sarah.walker@imgtec.com>
> ---
>   drivers/gpu/drm/scheduler/sched_entity.c | 60 +++++++++++++--
>   drivers/gpu/drm/scheduler/sched_main.c   | 96 ++++++++++++++++++++++++
>   include/drm/gpu_scheduler.h              | 11 +++
>   3 files changed, 161 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/gpu/drm/scheduler/sched_entity.c b/drivers/gpu/drm/scheduler/sched_entity.c
> index 15d04a0ec623..2685805a5e05 100644
> --- a/drivers/gpu/drm/scheduler/sched_entity.c
> +++ b/drivers/gpu/drm/scheduler/sched_entity.c
> @@ -155,13 +155,14 @@ static void drm_sched_entity_kill_jobs_cb(struct dma_fence *f,
>   {
>   	struct drm_sched_job *job = container_of(cb, struct drm_sched_job,
>   						 finish_cb);
> +	unsigned long idx;
>   	int r;
>   
>   	dma_fence_put(f);
>   
>   	/* Wait for all dependencies to avoid data corruptions */
> -	while (!xa_empty(&job->dependencies)) {
> -		f = xa_erase(&job->dependencies, job->last_dependency++);
> +	xa_for_each(&job->dependencies, idx, f) {
> +		xa_erase(&job->dependencies, idx);
>   		r = dma_fence_add_callback(f, &job->finish_cb,
>   					   drm_sched_entity_kill_jobs_cb);
>   		if (!r)
> @@ -390,12 +391,59 @@ static bool drm_sched_entity_add_dependency_cb(struct drm_sched_entity *entity)
>   	return false;
>   }
>   
> +/**
> + * dep_is_native - indicates that native dependencies are supported and that the
> + * dependency at @index is marked.
> + * @job: Scheduler job.
> + * @index: Index into the @job->dependencies xarray.
> + *
> + * Must only be used after calling drm_sched_job_arm().
> + *
> + * Returns true if both these conditions are met.
> + */
> +static bool dep_is_native(struct drm_sched_job *job, unsigned long index)
> +{
> +	return job->sched->ops->dependency_is_native &&
> +	       xa_get_mark(&job->dependencies, job->last_dependency, XA_MARK_0);
> +}
> +
>   static struct dma_fence *
> -drm_sched_job_dependency(struct drm_sched_job *job,
> -			 struct drm_sched_entity *entity)
> +drm_sched_job_dependency(struct drm_sched_job *job, struct drm_sched_entity *entity)
>   {
> -	if (!xa_empty(&job->dependencies))
> -		return xa_erase(&job->dependencies, job->last_dependency++);
> +	struct dma_fence *fence;
> +	unsigned long dep_index;
> +
> +	if (!dep_is_native(job, job->last_dependency)) {
> +		fence = xa_erase(&job->dependencies, job->last_dependency++);
> +		if (fence)
> +			return fence;
> +	}
> +
> +	xa_for_each_start(&job->dependencies, dep_index, fence,
> +			  job->last_dependency) {
> +		/*
> +		 * Encountered first native dependency. Since these were
> +		 * previously sorted to the end of the array in
> +		 * drm_sched_sort_native_deps(), all remaining entries
> +		 * will be native too, so we can just iterate through
> +		 * them.
> +		 *
> +		 * Native entries cannot be erased, as they need to be
> +		 * accessed by the driver's native scheduler.
> +		 *
> +		 * If the native fence is a drm_sched_fence object, we
> +		 * ensure the job has been submitted so drm_sched_fence
> +		 * ::parent points to a valid dma_fence object.
> +		 */
> +		struct drm_sched_fence *s_fence = to_drm_sched_fence(fence);
> +		struct dma_fence *scheduled_fence =
> +			s_fence ? dma_fence_get_rcu(&s_fence->scheduled) : NULL;
> +
> +		job->last_dependency = dep_index + 1;
> +
> +		if (scheduled_fence)
> +			return scheduled_fence;
> +	}
>   
>   	if (job->sched->ops->prepare_job)
>   		return job->sched->ops->prepare_job(job, entity);
> diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
> index 214364fccb71..08dcc33ec690 100644
> --- a/drivers/gpu/drm/scheduler/sched_main.c
> +++ b/drivers/gpu/drm/scheduler/sched_main.c
> @@ -643,6 +643,92 @@ int drm_sched_job_init(struct drm_sched_job *job,
>   }
>   EXPORT_SYMBOL(drm_sched_job_init);
>   
> +/**
> + * drm_sched_sort_native_deps - relocates all native dependencies to the
> + * tail end of @job->dependencies.
> + * @job: target scheduler job.
> + *
> + * Starts by marking all of the native dependencies, then, in a quick-sort
> + * like manner it swaps entries using a head and tail index counter. Only
> + * a single partition is required, as there are only two values.
> + */
> +static void drm_sched_sort_native_deps(struct drm_sched_job *job)
> +{
> +	struct dma_fence *entry, *head = NULL, *tail = NULL;
> +	unsigned long h = 0, t = 0, native_dep_count = 0;
> +	XA_STATE(xas_head, &job->dependencies, 0);
> +	XA_STATE(xas_tail, &job->dependencies, 0);
> +	bool already_sorted = true;
> +
> +	if (!job->sched->ops->dependency_is_native)
> +		/* Driver doesn't support native deps. */
> +		return;
> +
> +	/* Mark all the native dependencies as we walk xas_tail to the end. */
> +	xa_lock(&job->dependencies);
> +	xas_for_each(&xas_tail, entry, ULONG_MAX) {
> +		/* Keep track of the index. */
> +		t++;
> +
> +		if (job->sched->ops->dependency_is_native(entry)) {
> +			xas_set_mark(&xas_tail, XA_MARK_0);
> +			native_dep_count++;
> +		} else if (native_dep_count) {
> +			/*
> +			 * As a native dep has been encountered before, we can
> +			 * infer the array is not already sorted.
> +			 */
> +			already_sorted = false;
> +		}
> +	}
> +	xa_unlock(&job->dependencies);
> +
> +	if (already_sorted)
> +		return;
> +
> +	/* xas_tail and t are now at the end of the array. */
> +	xa_lock(&job->dependencies);
> +	while (h < t) {
> +		if (!head) {
> +			/* Find a marked entry. */
> +			if (xas_get_mark(&xas_head, XA_MARK_0)) {
> +				head = xas_load(&xas_head);
> +			} else {
> +				xas_next(&xas_head);
> +				h++;
> +			}
> +		}
> +		if (!tail) {
> +			/* Find an unmarked entry. */
> +			if (xas_get_mark(&xas_tail, XA_MARK_0)) {
> +				xas_prev(&xas_tail);
> +				t--;
> +			} else {
> +				tail = xas_load(&xas_tail);
> +			}
> +		}
> +		if (head && tail) {
> +			/*
> +			 * Swap!
> +			 * These stores should never allocate, since they both
> +			 * already exist, hence they never fail.
> +			 */
> +			xas_store(&xas_head, tail);
> +			xas_store(&xas_tail, head);
> +
> +			/* Also swap the mark. */
> +			xas_clear_mark(&xas_head, XA_MARK_0);
> +			xas_set_mark(&xas_tail, XA_MARK_0);
> +
> +			head = NULL;
> +			tail = NULL;
> +			h++;
> +			t--;
> +		}
> +	}
> +	xa_unlock(&job->dependencies);
> +}
> +
>   /**
>    * drm_sched_job_arm - arm a scheduler job for execution
>    * @job: scheduler job to arm
> @@ -669,6 +755,7 @@ void drm_sched_job_arm(struct drm_sched_job *job)
>   	job->s_priority = entity->rq - sched->sched_rq;
>   	job->id = atomic64_inc_return(&sched->job_id_count);
>   
> +	drm_sched_sort_native_deps(job);
>   	drm_sched_fence_init(job->s_fence, job->entity);
>   }
>   EXPORT_SYMBOL(drm_sched_job_arm);
> @@ -1045,6 +1132,15 @@ static int drm_sched_main(void *param)
>   		trace_drm_run_job(sched_job, entity);
>   		fence = sched->ops->run_job(sched_job);
>   		complete_all(&entity->entity_idle);
> +
> +		/* We need to set the parent before signaling the scheduled
> +		 * fence if we want native dependency to work properly. If we
> +		 * don't, the driver might try to access the parent before
> +		 * it's set.
> +		 */
> +		if (!IS_ERR_OR_NULL(fence))
> +			drm_sched_fence_set_parent(s_fence, fence);
> +
>   		drm_sched_fence_scheduled(s_fence);
>   
>   		if (!IS_ERR_OR_NULL(fence)) {
> diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
> index 898608f87b96..dca6be35e517 100644
> --- a/include/drm/gpu_scheduler.h
> +++ b/include/drm/gpu_scheduler.h
> @@ -455,6 +455,17 @@ struct drm_sched_backend_ops {
>            * and it's time to clean it up.
>   	 */
>   	void (*free_job)(struct drm_sched_job *sched_job);
> +
> +	/**
> +	 * @dependency_is_native: When arming a job for this scheduler, this
> +	 * function will be called to determine whether to treat it as a
> +	 * native dependency. A native dependency is awaited and cleaned up
> +	 * when the job is cancelled, but responsibility is otherwise delegated
> +	 * to a native scheduler in the calling driver code.
> +	 *
> +	 * Optional - implies support for native dependencies.
> +	 */
> +	bool (*dependency_is_native)(struct dma_fence *fence);
>   };
>   
>   /**

