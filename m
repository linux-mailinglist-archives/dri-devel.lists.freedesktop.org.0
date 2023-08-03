Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D5C976E3A8
	for <lists+dri-devel@lfdr.de>; Thu,  3 Aug 2023 10:53:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 751E510E5E0;
	Thu,  3 Aug 2023 08:53:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2042.outbound.protection.outlook.com [40.107.243.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9202510E5DE;
 Thu,  3 Aug 2023 08:53:22 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gMyhLAQRPw5e38WjrdTed/VXj9TF8W4QUi/HEvZTYUQQnr2IywQIE91jrs6DLvMfFUkih5VnxBw0qhm9cQgc2Bh90eHzWLy4CUsUyxxEnT646HAzjOOOhC6JMzbesKDnNdR8seXgdGMwv86tKYVYEFPz6CB/LCGI1uNCYbHaA4L5QzR2WhYgVFwux3m1C4MoiM9NEABM4KVQShSczOy2WvOCsiu3moP+Rw8gTlO6KZyNNmV5+x453Hf486H6jcBYFctZ9zqHrbvoFc6rFtNaYl4ste2HcAOuKr2DvWbxlqqCpYGwBugn9g9uUGRi0UpGU3pq/jX/5CgC8GYA2t7mCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HbuKBU0w80IrAQa8ZCKz76Ya+r391VohO4fvTU22z/k=;
 b=ky0Pr8I4lsWtZ3BhRUjBiDOPv4mAUBTRDWIfJWzKCcXGraXTqWM2X0vCjPoH+bZ0WtagxUODqcVjoAYycoZvMGG6+icEoVxFDcy46j/+SNf/W4X343A3CpVJT2j0sLbJeEVCtunWuo6vU6uCEf3RipdKVyppUAsQVsH3AWVIVhz9sN2BICl+f4BVOYAnmdJ6xZDdcwmjridpXvhDVaHqDlhn9b+m0jquge83ncw1OwIw3Ql49DJC4qWfrSfKOXFG5qBAg6pM+ajNFIcZq99SJMRnzITwwPqwBUyOvzAymEnTWAwFPUsulRd1+D5QjtPzlPtKC6+BgDGd2jDUqHBNZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HbuKBU0w80IrAQa8ZCKz76Ya+r391VohO4fvTU22z/k=;
 b=CQldReILNLSqcNy1aBk4moECmhKyLLckK0VNo8yigU7k4P8BjflfTiaXDv44WtnwaP+r19eXP++0AaqIHuXKv6NtJl5bsJMBngWqtN4CXEGyNUQ8Kn1OMV7GzRuJgSszOjh05pUt4g8VN195en45M4kEo3/Zgi8a0ldx03J3Oxw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by CH3PR12MB7644.namprd12.prod.outlook.com (2603:10b6:610:14f::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.47; Thu, 3 Aug
 2023 08:53:20 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::3d:c14:667a:1c81]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::3d:c14:667a:1c81%4]) with mapi id 15.20.6631.046; Thu, 3 Aug 2023
 08:53:20 +0000
Message-ID: <efabdbaf-4f38-ae62-3d4e-da5660558886@amd.com>
Date: Thu, 3 Aug 2023 10:53:15 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 4/8] drm/sched: Add generic scheduler message interface
Content-Language: en-US
To: Matthew Brost <matthew.brost@intel.com>, dri-devel@lists.freedesktop.org, 
 intel-xe@lists.freedesktop.org
References: <20230801205103.627779-1-matthew.brost@intel.com>
 <20230801205103.627779-5-matthew.brost@intel.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <20230801205103.627779-5-matthew.brost@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0001.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:15::6) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR12MB3587:EE_|CH3PR12MB7644:EE_
X-MS-Office365-Filtering-Correlation-Id: d7a4778c-d178-4426-36e1-08db93ff1652
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: PC/GBw8v1wZtd3CqS+qaNCE7LghGJSmY4USiKCPqUhj+YfNFgQacs6CAUXaKbAuBGBUD6Tz8D67kOs5uhhYmtuXy2zSt/Tt+GMSvVhWoOOE7y5jNdd4UGknRR4oPPUU4Ll9E1ya/krQvdrl5C2Vajbivu81n1Gf/45FzdDoUnbm+Bsqemp7LuAkcSNyIJKDyqPUTYW0Yan2cvI5KNGvAVRyp/OHD1GnYyz+iPyY4peA6eygIR43fmU5+D+M15j5u03iP4YUJTILLLI7ln0i+rwZCPH7t8ylWjZA1SQbseyEvwT/SAjdZZiccTA8MfwXpmlr9pWGoes0fk16OuPlE4sLEN64RMc9kyTz+tddhc+T/pXJtL5sSNhx8Ny5qog4g7lez9QWCaRgSgbFjW4HreKQC7koxoUZl/5AzN1ZKv9fq/4ypDx/jZmCQYr60sHPT3BUgOHBhDyeiTdWs7o8/hTzQW7l54jp/53XFrWJKu6FgbVSlaliTQGquD3BrFLaADvQcX2C1myTpdOB3g4ZgNglcuGb0faknKaLrPyJdJXF1SAITMJemX5SH206o3gOIGgcgZA8wS6MQPiHimOyIBTytTcVMf2K+kRn+37QV0xNxjberq3pDoCHDsWObH2fBMFk6m5pEOvg+6QNTTo3Rr/dGvKggarXdBDECgzLUjjo=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(366004)(376002)(136003)(39860400002)(396003)(346002)(451199021)(2616005)(83380400001)(6506007)(186003)(41300700001)(2906002)(66946007)(4326008)(66476007)(66556008)(5660300002)(316002)(7416002)(8676002)(8936002)(6666004)(6486002)(15650500001)(6512007)(478600001)(38100700002)(31696002)(86362001)(36756003)(31686004)(41533002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?M2FrSEJQYmtncE43Mkt1TzExWDliYk4wcVVBODR0Tm13UmorUUY3M1BOYmww?=
 =?utf-8?B?elJmK29XVmxWVFZKeHlnYkc0c3dBYzVWYk5hVWFIeFI3VjVVV2djNURDTnU3?=
 =?utf-8?B?N1hnWDFuY0NBOWM0VzVRcTdkRFFvT0Rvajc1S21UTWNNUVp1bUR2M2J2Mk44?=
 =?utf-8?B?bGFzeXprN1gycDdKZHh2SjRlN2lHWnhoRlpWVS9nc2tSVGVZVnA1VFJkd2p0?=
 =?utf-8?B?cGtUQm93dEpoMHpwNE8zbGJIcG5VaHhCMnZ2VTlZV0s3NHhLVnQ5ZVdJb3Z0?=
 =?utf-8?B?bTNraHk2OWdWSWFRY0t4K2dxWDdqQ05UcFk0RXRURzdGMURQSk9wK1FzZytx?=
 =?utf-8?B?aDJUTFp3Z0wzbU9GQ1NpVHB1OEZJdm5qSytqWklFSnZuUWFJWEFhTFdiKzg3?=
 =?utf-8?B?OGltY0xLNi96Y21NLzJWdWFJV0xtLysrVTRkRmZvRjhkZk1Kc1c0aEJiQUFM?=
 =?utf-8?B?S1dRcGpKUU56cmdwaEorWXZvdTJyVGo3UFpQMGVGaWVycDRrNTR2RzFKR1BY?=
 =?utf-8?B?TzFmVDFpNWNmY2dUY3VMNXVZZThzODBmc2xZZ3FET25QQzdweTgyUG9INU93?=
 =?utf-8?B?aDNaTGdhVzlVanN0MmRSNlZuVW9RamZ3RHVQYjQrMUN4QnFibDRMTGFFdXd3?=
 =?utf-8?B?c2RHWmpOQXZsSnltQmFRZFE1Y2JJaG5waEFjbGxXWUx2VXFSK29KZlY4czJU?=
 =?utf-8?B?MUF0ZmlmWVp0Qzl2ck1iRXpkUzhvLzJad0VGVllIYUxTSjJrMUFoUVJXbENr?=
 =?utf-8?B?Qm15QWdUTGJleWo1R0lkbE1YZGdTSzBYbjFjTko0d0N1alFYVG9QazlxcTFS?=
 =?utf-8?B?UTNMdnVyZkJKQVdOc0NXVmVrUTltWmZacWs1cEc5OU1sdGtmQVJVcTM2SEdX?=
 =?utf-8?B?MlBUSC9oalV3N3lBUEVNVmcvRGNibTZvMWJsS1E0enhrelkvSHhQSG5ka1NV?=
 =?utf-8?B?Q245UU5ZdzRuQy9nTXlyM0FCcnJ1L2oyN3djVEdRTDlSZzJNaFAxUXVZTHNQ?=
 =?utf-8?B?a1VKUnRrdEhSMmIvWDc0ajNpT015YnhVOG1VTFhNd0U0OU5IbTNQR2R5MUF3?=
 =?utf-8?B?YVdUQTh0VjR5clBKOEhLbTJPNFBKak5WeWdxVlBGakVwOVZFRzB3T0dMNmpE?=
 =?utf-8?B?cHRqUHR1aXk4NnJFL2VZNHFmcUxoQ1lnZ2kxVVcxNDNwRVZWbENPSW1kRmw1?=
 =?utf-8?B?RUxHZlRHTVd5OW1kcTJ3dlN1ekJ6VlFaajYvaWtiODFhMTVLVm1xZjR1NHFT?=
 =?utf-8?B?YXJyZXVIVFBrUHFsY2lSMkFNZ2MxSm9ReU9ZS0htY1hEQzhHMG5iU1ErcC91?=
 =?utf-8?B?TE1ZWlFRenBjQmpHNUlBRlJrczhKVmRqWXA3WFRWcUtlZ2lWaVcvcHNlNy9D?=
 =?utf-8?B?SDVFc0xkam5IUE9MZzhncStTcGhzYmZBUGJBaWVpTG45VzFsUmhtSVZUUWp2?=
 =?utf-8?B?b2xWeW9nZzhidlN4SWRxR2doZGV0ZDVLTUdKbTVuQTEwYURKWm9YRlhQMUZX?=
 =?utf-8?B?N0N0TnVPM1E3ZDJQeE9HL2lNaktxMTZ0NmVYQW9rSDRDVXBIYmhLTmdEMXVr?=
 =?utf-8?B?N2ErdHlSazRvcUpOWXFkSm1sdzZZRGRlcnRkdTFhV3k5T2RjUGNLWWIxN0d2?=
 =?utf-8?B?a2xkbVMzNEdOV3cxTHRtK0ZleE9hQlpRUFRVbkgzamNQQ3Q4QlcxS2xDQ2Fi?=
 =?utf-8?B?Slc3L2t1c3RqWVhsY21taXd5c2k3UWpjQ0ovUWxjY0dTQUFlMVZZQll3WGR5?=
 =?utf-8?B?WDU5c3JwaGNoc1JJejdFckhDWGI1Qk5penA1d1BoU2VMcHhkMUZFTHVHcVlw?=
 =?utf-8?B?Mms0a2JyQzd2ZGhsZFJEQ3grVE9reUh0ZEorMDg5enJhcFNYeVF0NmQxNHk2?=
 =?utf-8?B?QlhTZ1BoVTRSSHczU3FvQXZCbXZ0aWJRN202TERVcnB2cnR0QmdkZGgzWDFn?=
 =?utf-8?B?WW9pcDljMytocCs2NkVnaCtCTmV3SEJaUk1CL25ZWnh3bVV1Q28xeGNHODR4?=
 =?utf-8?B?VExubnZucDJSZFlYYU15YWNCQWRZclV6NW1KVGpyRWFTU2d2RmdUeU9xRys0?=
 =?utf-8?B?eGY0VnZSL1J4T2RiK3g4VTQrSGVOZTNJcFBLRVpvejhTb2Q0UDRkWVc3SlQx?=
 =?utf-8?B?TVJHT3FEOVg3VFZFWTU2RU9vQkFVT2s4ZnBscVRSZk9Zblh4MkR4K0M4L1ow?=
 =?utf-8?Q?MmwXS4+QUVVzuJDE50PvfhhTsULvkEJGos3+gPX0SIuq?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d7a4778c-d178-4426-36e1-08db93ff1652
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Aug 2023 08:53:20.5082 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xtJqkTB4P5GVY5mYiv0Wm7+hl6fTMVrZaPukVcaVOXxjfq16+v8p1rpGkNfjnDJd
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB7644
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
 sarah.walker@imgtec.com, ketil.johnsen@arm.com, Liviu.Dudau@arm.com,
 luben.tuikov@amd.com, lina@asahilina.net, donald.robson@imgtec.com,
 boris.brezillon@collabora.com, faith.ekstrand@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 01.08.23 um 22:50 schrieb Matthew Brost:
> Add generic schedule message interface which sends messages to backend
> from the drm_gpu_scheduler main submission thread. The idea is some of
> these messages modify some state in drm_sched_entity which is also
> modified during submission. By scheduling these messages and submission
> in the same thread their is not race changing states in
> drm_sched_entity.
>
> This interface will be used in XE, new Intel GPU driver, to cleanup,
> suspend, resume, and change scheduling properties of a drm_sched_entity.
>
> The interface is designed to be generic and extendable with only the
> backend understanding the messages.

I'm still extremely frowned on this.

If you need this functionality then let the drivers decide which 
runqueue the scheduler should use.

When you then create a single threaded runqueue you can just submit work 
to it and serialize this with the scheduler work.

This way we wouldn't duplicate this core kernel function inside the 
scheduler.

Regards,
Christian.

>
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> ---
>   drivers/gpu/drm/scheduler/sched_main.c | 52 +++++++++++++++++++++++++-
>   include/drm/gpu_scheduler.h            | 29 +++++++++++++-
>   2 files changed, 78 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
> index 2597fb298733..84821a124ca2 100644
> --- a/drivers/gpu/drm/scheduler/sched_main.c
> +++ b/drivers/gpu/drm/scheduler/sched_main.c
> @@ -1049,6 +1049,49 @@ drm_sched_pick_best(struct drm_gpu_scheduler **sched_list,
>   }
>   EXPORT_SYMBOL(drm_sched_pick_best);
>   
> +/**
> + * drm_sched_add_msg - add scheduler message
> + *
> + * @sched: scheduler instance
> + * @msg: message to be added
> + *
> + * Can and will pass an jobs waiting on dependencies or in a runnable queue.
> + * Messages processing will stop if schedule run wq is stopped and resume when
> + * run wq is started.
> + */
> +void drm_sched_add_msg(struct drm_gpu_scheduler *sched,
> +		       struct drm_sched_msg *msg)
> +{
> +	spin_lock(&sched->job_list_lock);
> +	list_add_tail(&msg->link, &sched->msgs);
> +	spin_unlock(&sched->job_list_lock);
> +
> +	drm_sched_run_wq_queue(sched);
> +}
> +EXPORT_SYMBOL(drm_sched_add_msg);
> +
> +/**
> + * drm_sched_get_msg - get scheduler message
> + *
> + * @sched: scheduler instance
> + *
> + * Returns NULL or message
> + */
> +static struct drm_sched_msg *
> +drm_sched_get_msg(struct drm_gpu_scheduler *sched)
> +{
> +	struct drm_sched_msg *msg;
> +
> +	spin_lock(&sched->job_list_lock);
> +	msg = list_first_entry_or_null(&sched->msgs,
> +				       struct drm_sched_msg, link);
> +	if (msg)
> +		list_del(&msg->link);
> +	spin_unlock(&sched->job_list_lock);
> +
> +	return msg;
> +}
> +
>   /**
>    * drm_sched_main - main scheduler thread
>    *
> @@ -1060,6 +1103,7 @@ static void drm_sched_main(struct work_struct *w)
>   		container_of(w, struct drm_gpu_scheduler, work_run);
>   	struct drm_sched_entity *entity;
>   	struct drm_sched_job *cleanup_job;
> +	struct drm_sched_msg *msg;
>   	int r;
>   
>   	if (READ_ONCE(sched->pause_run_wq))
> @@ -1067,12 +1111,15 @@ static void drm_sched_main(struct work_struct *w)
>   
>   	cleanup_job = drm_sched_get_cleanup_job(sched);
>   	entity = drm_sched_select_entity(sched);
> +	msg = drm_sched_get_msg(sched);
>   
> -	if (!entity && !cleanup_job)
> +	if (!entity && !cleanup_job && !msg)
>   		return;	/* No more work */
>   
>   	if (cleanup_job)
>   		sched->ops->free_job(cleanup_job);
> +	if (msg)
> +		sched->ops->process_msg(msg);
>   
>   	if (entity) {
>   		struct dma_fence *fence;
> @@ -1082,7 +1129,7 @@ static void drm_sched_main(struct work_struct *w)
>   		sched_job = drm_sched_entity_pop_job(entity);
>   		if (!sched_job) {
>   			complete_all(&entity->entity_idle);
> -			if (!cleanup_job)
> +			if (!cleanup_job && !msg)
>   				return;	/* No more work */
>   			goto again;
>   		}
> @@ -1177,6 +1224,7 @@ int drm_sched_init(struct drm_gpu_scheduler *sched,
>   
>   	init_waitqueue_head(&sched->job_scheduled);
>   	INIT_LIST_HEAD(&sched->pending_list);
> +	INIT_LIST_HEAD(&sched->msgs);
>   	spin_lock_init(&sched->job_list_lock);
>   	atomic_set(&sched->hw_rq_count, 0);
>   	INIT_DELAYED_WORK(&sched->work_tdr, drm_sched_job_timedout);
> diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
> index df1993dd44ae..267bd060d178 100644
> --- a/include/drm/gpu_scheduler.h
> +++ b/include/drm/gpu_scheduler.h
> @@ -394,6 +394,23 @@ enum drm_gpu_sched_stat {
>   	DRM_GPU_SCHED_STAT_ENODEV,
>   };
>   
> +/**
> + * struct drm_sched_msg - an in-band (relative to GPU scheduler run queue)
> + * message
> + *
> + * Generic enough for backend defined messages, backend can expand if needed.
> + */
> +struct drm_sched_msg {
> +	/** @link: list link into the gpu scheduler list of messages */
> +	struct list_head		link;
> +	/**
> +	 * @private_data: opaque pointer to message private data (backend defined)
> +	 */
> +	void				*private_data;
> +	/** @opcode: opcode of message (backend defined) */
> +	unsigned int			opcode;
> +};
> +
>   /**
>    * struct drm_sched_backend_ops - Define the backend operations
>    *	called by the scheduler
> @@ -471,6 +488,12 @@ struct drm_sched_backend_ops {
>            * and it's time to clean it up.
>   	 */
>   	void (*free_job)(struct drm_sched_job *sched_job);
> +
> +	/**
> +	 * @process_msg: Process a message. Allowed to block, it is this
> +	 * function's responsibility to free message if dynamically allocated.
> +	 */
> +	void (*process_msg)(struct drm_sched_msg *msg);
>   };
>   
>   /**
> @@ -482,6 +505,7 @@ struct drm_sched_backend_ops {
>    * @timeout: the time after which a job is removed from the scheduler.
>    * @name: name of the ring for which this scheduler is being used.
>    * @sched_rq: priority wise array of run queues.
> + * @msgs: list of messages to be processed in @work_run
>    * @job_scheduled: once @drm_sched_entity_do_release is called the scheduler
>    *                 waits on this wait queue until all the scheduled jobs are
>    *                 finished.
> @@ -489,7 +513,7 @@ struct drm_sched_backend_ops {
>    * @job_id_count: used to assign unique id to the each job.
>    * @run_wq: workqueue used to queue @work_run
>    * @timeout_wq: workqueue used to queue @work_tdr
> - * @work_run: schedules jobs and cleans up entities
> + * @work_run: schedules jobs, cleans up jobs, and processes messages
>    * @work_tdr: schedules a delayed call to @drm_sched_job_timedout after the
>    *            timeout interval is over.
>    * @pending_list: the list of jobs which are currently in the job queue.
> @@ -513,6 +537,7 @@ struct drm_gpu_scheduler {
>   	long				timeout;
>   	const char			*name;
>   	struct drm_sched_rq		sched_rq[DRM_SCHED_PRIORITY_COUNT];
> +	struct list_head		msgs;
>   	wait_queue_head_t		job_scheduled;
>   	atomic_t			hw_rq_count;
>   	atomic64_t			job_id_count;
> @@ -566,6 +591,8 @@ void drm_sched_entity_modify_sched(struct drm_sched_entity *entity,
>   
>   void drm_sched_job_cleanup(struct drm_sched_job *job);
>   void drm_sched_wakeup(struct drm_gpu_scheduler *sched);
> +void drm_sched_add_msg(struct drm_gpu_scheduler *sched,
> +		       struct drm_sched_msg *msg);
>   void drm_sched_run_wq_stop(struct drm_gpu_scheduler *sched);
>   void drm_sched_run_wq_start(struct drm_gpu_scheduler *sched);
>   void drm_sched_stop(struct drm_gpu_scheduler *sched, struct drm_sched_job *bad);

