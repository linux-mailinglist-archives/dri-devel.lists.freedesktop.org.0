Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F2E6F4FE655
	for <lists+dri-devel@lfdr.de>; Tue, 12 Apr 2022 18:52:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F2E6B10E538;
	Tue, 12 Apr 2022 16:52:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam07on2088.outbound.protection.outlook.com [40.107.95.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B1D3510E538
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Apr 2022 16:52:00 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IplYyP5pgOnsEqj9CWureOr1m3sKbPGNhj0yelTI00qKL5uyL98jj1syf3+cLfj2/GC1iiUEhGBQ48eBde4r1PYlfc3cKPBqpl2HFUDq9nQ6QJ99Z0fdGpO2jvFB4WekX48SWvKaFJl+YjhwIGt6E4NBIjyZvSh/TSpZGbdPzDCrZz6xo4kW9dMI/py/EIxmYgidzQ4g63TzDj2Cst8U3UDwvCgQf+jIWtblqpSJoNPMkrCu723XXfzAHyYDdAMVbkZZf2u/D+pEHhDpzO9JOE20IffSfzID8+pn5/IidJ8nv5RIEfEC9FJAm5o+WFycJGp8YnBs6apK4jv5avuNcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=i9+VxQ0kdK53D7JJkJZSl6Tvgt8DhDj5tBw8ovM0yCs=;
 b=ejrdjT79wXuO1qVezBLnxLjEuHmQBd9kzbfP9kaI1bDCbNn04z1Oe/d3SZ1ukrCTfUIjztnpLrjtTIpm8ma5CqO2QFpmPV1sg3i0rNMFHKCmKgZXhh6khj2WttVqu+pSFQ5Ph/v9DBwXT0iCATOfiZ4CbvwCYtBXrZ7c9YoxZWyb9ULSy+GnpTagYeF1s7Mqy7paMV2UwEjKBufwDClsXK6AGG08A0X7cNSqpJe+JGm3VBsX2mtlYToH8X4G4Yz5Q1jv65KfcePmk5AH6gASipP2JwwzXj8ch/Qv37+CL7N5jy0AWOhK7qqqCZpg61qqx0cHklKHFO5jw2aitx2gig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=i9+VxQ0kdK53D7JJkJZSl6Tvgt8DhDj5tBw8ovM0yCs=;
 b=n4ucZ4dO3/7J85GFuS7KZqFtUWo0RlJxT1NhPLpRp+mcgxPzS54KQtsUXaeTjc+y6RCql2CSWa0ilx7TiO9naghHUaZVpFhl2dWU+IHbc+EsVIlaHpfOZa+YZRC1jvhuADawISPbsUNkViNK1qu/5HtJyQl1PEtfidM6t8woOHM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM5PR12MB1947.namprd12.prod.outlook.com (2603:10b6:3:111::23)
 by DM5PR12MB1867.namprd12.prod.outlook.com (2603:10b6:3:10d::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5144.29; Tue, 12 Apr
 2022 16:51:58 +0000
Received: from DM5PR12MB1947.namprd12.prod.outlook.com
 ([fe80::4967:ac3d:d5eb:ebb4]) by DM5PR12MB1947.namprd12.prod.outlook.com
 ([fe80::4967:ac3d:d5eb:ebb4%9]) with mapi id 15.20.5144.029; Tue, 12 Apr 2022
 16:51:58 +0000
Message-ID: <064d8958-a288-64e1-b2a4-c2302a456d5b@amd.com>
Date: Tue, 12 Apr 2022 12:51:56 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v1] drm/scheduler: Don't kill jobs in interrupt context
Content-Language: en-US
To: Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 Steven Price <steven.price@arm.com>, Rob Herring <robh@kernel.org>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Rob Clark <robdclark@gmail.com>
References: <20220411221536.283312-1-dmitry.osipenko@collabora.com>
From: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
In-Reply-To: <20220411221536.283312-1-dmitry.osipenko@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YT1PR01CA0113.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2c::22) To DM5PR12MB1947.namprd12.prod.outlook.com
 (2603:10b6:3:111::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e5d502b5-ec87-46dd-72f2-08da1ca4c242
X-MS-TrafficTypeDiagnostic: DM5PR12MB1867:EE_
X-Microsoft-Antispam-PRVS: <DM5PR12MB186750308282B26D13CD2F22EAED9@DM5PR12MB1867.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: YUW2hc+J1W9hrY/V+ZkZwEM4Nkm11vxvMoj+p923LEVUpBW1JJULzdwml4gwGdDWWNQaCUU4xwwhWtxtRHuPqSrEzYEp8rdr5oV74T13CQwUz6NGZkZUAhf/r6FmMkGvz6O6vKs81MVf/2mGeNBF0rNTLv42IUXzf0JmrGu4i01iXbQi5LEsZgF/56gxi0PaxSdh0XoRZhUrFNuvgr1aeKQPBQy4o6zWZmY07XnJIyI1KpLeINAIUawI9TIb/IZXaO8Nv+drGSr3yGkNWBXbBDEw8nrWimdGWftgVoJhZQo658cBxOrSd4TLPsHUwRos34SWcuWPqE+MoHQYedeBKosPFnirMWJfVhEDh5PAKhXSpXSCKa9ScQS3f8NgYH0tbWI/uy4V1ozvTICqdfxY33M+0ZtTRpYIKNdeRApiJCKng4B9JPZXpMLtqpalXl+pv0mdaz2kFkuooaPWCYPPYy4uCSzddXIC94Qvsvywg42YOS6iYThIiVJW0Qc1iqtu6Onzy95g25YYILZTpaEZcsoLbITkGGZHTIx8cCdoaWroLfXf2G2RthORr66F5GiZm56fGya1AbsiYrxGrzIwttW67zn5QwpJlqigQT212Tupmx5OuyyIpclPRzIZX0TRtUWnZIB3UxDaU0lXPwFCAV00gynyk6u64oKdLWi9j6m6erHWIuWW3mAEDdC0HoWzNWjR46jPMOzoIXDoiDav6KPURPw/uobxR9UkcyUvXKc=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM5PR12MB1947.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(31696002)(186003)(7416002)(5660300002)(31686004)(36756003)(8676002)(4326008)(66556008)(316002)(83380400001)(66946007)(110136005)(66476007)(8936002)(86362001)(6512007)(508600001)(2616005)(38100700002)(6486002)(6506007)(53546011)(2906002)(44832011)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UC9WYkd3dzl3K0huSlpvUDJwanJaOHpDaHZoYmpldTNMMmkxaU4rdkNyZDdt?=
 =?utf-8?B?eVhzbTNJZ0s0RGlncVJWTW9sZGxvWDRUZFVTUjAxMGdDaFVqTTM3TFR5eWdm?=
 =?utf-8?B?QTdCc1ZRaFk4VDZGekhzYWpyaFQ3aklzT0cvN2JNa2l3ZytSRHZRb21iaU1M?=
 =?utf-8?B?NlI3dHJtTThwdUgvU3IreHFJV09TNlFqUWZ3dG1ibS9naVQrK2trZldaczRz?=
 =?utf-8?B?NlZKUlFVdmRObzhiNEVnSWMyOFpnakdhQkg4WGwyR0lzSVRsb1dqbWF3RkN5?=
 =?utf-8?B?RVBkS2FFQ3JMRkYzcXZsdldCRGRLREE0WHZyOGE0TWF1OXNTME1NQmw4YXNF?=
 =?utf-8?B?dDJtVXQ3ZHRvRXZHOGk2OFc5cnQvWHI2cml0am5SWUdNRldCbFArU0M3a1Jz?=
 =?utf-8?B?Z2I0Tnd6OTh0V0t0bmJYL1VaQmxGT3VWRUhvUlgrTmtwWVBsaVZhUDhwbmxF?=
 =?utf-8?B?NjFva3lBWjNncTBTUFJGRmcyWCtyZG5XTi9WUUEyeFVkVlFwTVJrYkthK0NQ?=
 =?utf-8?B?b0R4TGE3S0IvSlhmaTBGNXM4RCtsL3RRKzE3bWtjUmVpL0Y1UkI3b3hpUExW?=
 =?utf-8?B?R2pTS1l5NUxXODhJdGpuUHR1UXhRaXNJRldFbWFEcS8yQU9xa0ZZbEtidHdM?=
 =?utf-8?B?MG5xbVBWeDc1R1B0eUYyMHZpalU1OXBkbVB2ZC8rMExGT3FmdDRFSUNaV1hM?=
 =?utf-8?B?c3dxUVV1eitDbDlzZ1JyYWVDK1drMVNwOXpxbGlHOUtJVzVkL0lpNlFvdGNi?=
 =?utf-8?B?WUpPaHdMc0lPb0RzTTcrZWJCdkc5VkREdkR2dGV2Vk44eVJNcWUxV3hWbDV2?=
 =?utf-8?B?WkEyU1lieEw1TkxQSEF3dVNoRHVkMC85Zm9tWkpZWkg3TTlKQnFCZmJPc3h0?=
 =?utf-8?B?NDlKUWZvRUxNM3dsUWMzNGVXalc1QTZNTVh1WGRZOGpUSHNjUW5RRmZ6LzlY?=
 =?utf-8?B?bEl1Nk9MWGZIZThJdXdkTkJubHJyYkRzOXc5VVBteG80cWUyMjkwbXZiVTNL?=
 =?utf-8?B?b1ZaeGRhRGZQWHRES2wzclZCRnZKSzljaFBHU1hKQ1pVRUlNZVRncTJUUzFr?=
 =?utf-8?B?RC9mdVhncmo0RDBqMkhJbjZrTmV4YVVITEd1aXhVbVdwMlB4RW1tT0xFeUtL?=
 =?utf-8?B?NFV6Ym8zZHdtS3QxN3lsQURaVHZzakNVS1FPeDlQNUw0dHhvcVdqWUl4UXNy?=
 =?utf-8?B?Qzg0ZDg4eXA4ZVNMQTd0Ky9UdE5ZalMzclFiS2dodGRMSXg3bHFBT3BRa0NW?=
 =?utf-8?B?Mi92dHNkaGJWYnpaQUlFTk5uN0hHanV3cFlXM3l1Ly9uQnpocXpEc0ZGWGNE?=
 =?utf-8?B?ZU1yL29FUDNlWE0wNk5YZnZDWWpQNEo2aXhib3BHNXVEOVFIaTh5RWJFcEMv?=
 =?utf-8?B?eEhocnV4WHdhbktCSy9KS0tIaGNJWEtzbmpPOUZBYkNhMmEyR045bThNWFcx?=
 =?utf-8?B?bjZKdEtJcmRYOWJLUEllcURiWHZ1clNlcGdVL3hnajdzcVhGSCtGUC9KYW5x?=
 =?utf-8?B?Q1hrRnFGRStxQzJteTZTb2V0bmJLWEV3WGlneHNRVTczM1BURU5GdDk1RUx5?=
 =?utf-8?B?d043aTJ5RXRVY2lsdHdIYUJXcExNWThydXBQdzZVRVB6N1FNU2hQNXlHSi8z?=
 =?utf-8?B?OTgxYXhkbmk0cXdKZVpBWjQwMGZPNm5sREY2SnM2WDBsbzN6d3VBNVBwU0tp?=
 =?utf-8?B?ZW5PN0EwdkYxcEhuNVhSQUxmcXR4dDFkZ1E1QmJmeFVEQnI5ZkswSzlveFI0?=
 =?utf-8?B?NGQwRGV2aWkvOERDaHNXRGFDV2lCWjVzZ1VaelFrTU9wMlVEMmxERWN1UlZ6?=
 =?utf-8?B?T09jZ3JNZkhVckFlb0JFUmNMdnM4emVwNVVUNytLaEJ3cjdlV01HYzJQZFRT?=
 =?utf-8?B?N1g0VWIwb0JtMVJpeERmbVpkTEZOSStLYXY5WlVNblhXZDFoV0hSeW82VzZv?=
 =?utf-8?B?eFVQVVVPbklTYXNsV1FsRFZXeEpoSzJzemt3SWhLSkE5WTNzaVVLWi9HYkM1?=
 =?utf-8?B?Tnk1RCtrT1h3aVo4c1MxLzRmc0lNLzQ2YmRGQWY2ZllabTJqTWk1cUR4Ynh3?=
 =?utf-8?B?NTdwV2h5YnZVNENrWTMwVlRpWHRzS3pRWUxKOG9FMFpFRXpncmhFTmJwSzZt?=
 =?utf-8?B?MFk0eHJlUHFFYTdWWFFLZlpOb05kKzFXRHRtZTRjTXNPd0VBMHJaQ3hma0lQ?=
 =?utf-8?B?bVVnQ2tXMWlPZEw2eWFIaEJNVDJJUnpPNDhyQXlPTitSTkRGOEpxMERjUHoz?=
 =?utf-8?B?SHh0dHJ5OTJJOXBzVXVEWFBhaDdrcnhoemNjMUtkQnd2VkNxL2Z5allMUzZJ?=
 =?utf-8?B?Q1puMlg4WEtzZVFKQW45dzhWdDRLM3RRK0NjY2hPTS95dEFYQnpKZlRpcmJk?=
 =?utf-8?Q?9gXyTbM562m2Q6+8COHdYd57xnjE4xAJETUiVQg8ZqQhi?=
X-MS-Exchange-AntiSpam-MessageData-1: pPzzlXIi0E3/cg==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e5d502b5-ec87-46dd-72f2-08da1ca4c242
X-MS-Exchange-CrossTenant-AuthSource: DM5PR12MB1947.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Apr 2022 16:51:58.8039 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TsUg8JufNfV45AVNHGMNP5hcTqbmxq62TUV0I8/OYaW/K0WzkLImU1dPns/PTnpTohQGaOyeYlI2JaGDPWdfeQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1867
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
Cc: Dmitry Osipenko <digetx@gmail.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 2022-04-11 18:15, Dmitry Osipenko wrote:
> Interrupt context can't sleep. Drivers like Panfrost and MSM are taking
> mutex when job is released, and thus, that code can sleep. This results
> into "BUG: scheduling while atomic" if locks are contented while job is
> freed. There is no good reason for releasing scheduler's jobs in IRQ
> context, hence use normal context to fix the trouble.


I am not sure this is the beast Idea to leave job's sw fence signalling 
to be
executed in system_wq context which is prone to delays of executing
various work items from around the system. Seems better to me to leave the
fence signaling within the IRQ context and offload only the job freeing or,
maybe handle rescheduling to thread context within drivers implemention
of .free_job cb. Not really sure which is the better.

Andrey


>
> Cc: stable@vger.kernel.org
> Fixes: 542cff7893a3 ("drm/sched: Avoid lockdep spalt on killing a processes")
> Signed-off-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>
> ---
>   drivers/gpu/drm/scheduler/sched_entity.c | 6 +++---
>   include/drm/gpu_scheduler.h              | 4 ++--
>   2 files changed, 5 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/gpu/drm/scheduler/sched_entity.c b/drivers/gpu/drm/scheduler/sched_entity.c
> index 191c56064f19..6b25b2f4f5a3 100644
> --- a/drivers/gpu/drm/scheduler/sched_entity.c
> +++ b/drivers/gpu/drm/scheduler/sched_entity.c
> @@ -190,7 +190,7 @@ long drm_sched_entity_flush(struct drm_sched_entity *entity, long timeout)
>   }
>   EXPORT_SYMBOL(drm_sched_entity_flush);
>   
> -static void drm_sched_entity_kill_jobs_irq_work(struct irq_work *wrk)
> +static void drm_sched_entity_kill_jobs_work(struct work_struct *wrk)
>   {
>   	struct drm_sched_job *job = container_of(wrk, typeof(*job), work);
>   
> @@ -207,8 +207,8 @@ static void drm_sched_entity_kill_jobs_cb(struct dma_fence *f,
>   	struct drm_sched_job *job = container_of(cb, struct drm_sched_job,
>   						 finish_cb);
>   
> -	init_irq_work(&job->work, drm_sched_entity_kill_jobs_irq_work);
> -	irq_work_queue(&job->work);
> +	INIT_WORK(&job->work, drm_sched_entity_kill_jobs_work);
> +	schedule_work(&job->work);
>   }
>   
>   static struct dma_fence *
> diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
> index 0fca8f38bee4..addb135eeea6 100644
> --- a/include/drm/gpu_scheduler.h
> +++ b/include/drm/gpu_scheduler.h
> @@ -28,7 +28,7 @@
>   #include <linux/dma-fence.h>
>   #include <linux/completion.h>
>   #include <linux/xarray.h>
> -#include <linux/irq_work.h>
> +#include <linux/workqueue.h>
>   
>   #define MAX_WAIT_SCHED_ENTITY_Q_EMPTY msecs_to_jiffies(1000)
>   
> @@ -295,7 +295,7 @@ struct drm_sched_job {
>   	 */
>   	union {
>   		struct dma_fence_cb		finish_cb;
> -		struct irq_work 		work;
> +		struct work_struct 		work;
>   	};
>   
>   	uint64_t			id;
