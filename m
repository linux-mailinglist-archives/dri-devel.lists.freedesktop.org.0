Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 744B17C9214
	for <lists+dri-devel@lfdr.de>; Sat, 14 Oct 2023 03:30:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 235B810E095;
	Sat, 14 Oct 2023 01:30:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on20617.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e89::617])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 93F6210E092;
 Sat, 14 Oct 2023 01:30:35 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BAy5C0Y8OdeOgGSAi6SIwiOgbIAxT5MqhRiMzhWEv1ImfFZ7zqSggQd9rqvi5v7MT+FLmuI9FYEKsE2e0OEc75TGXddCB1htw+Gl8VG0YN71Xuf5bz8yCz0FlpTLvVKDluW1hmurc4kSnfkAl66a7jnFaI5eaAEwQhL6wDEH2OKsGrsZJ9fkf1CaXqjXRow2NDZzzQ5pUeE/+kO3vKGQbdJCkTXVRzxTcd+bkiyk6VblrMhqIjOQI5vwD78aEIA/73pN3y5ssNviUawa483SkEDi3LbWOp+yn+SvCWVb3kj2qQOYGqW0rO/FwHNIJnuD17dwfyI2kG/tr/h436ulHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lCDj51ZIW71JjCVdQOyFHJcDfFQRh8dmY3gZ4d6xrfA=;
 b=nUhfKdgMhxHYnoYQcBsoUVlX/WFCsxc0Ck15Hj0pBhI4e7tnzKvh3oiznhw/xHcw9PMetmL7xCw+FiWLrJDQEu9aqRw/SWdYPA8WfMnPkHHb7mKzug7sD8w+/YfxYEZkg0bYn1LzmwQY8wyYaqUopWmEl1Bm22qLG4LO7jLnXa71imgQK6pDyaE5bDkS45ASh+xHIFECP34SsOf1YOmyx/cbp43srwni1DseYcvdBxIEHWJauloTYhAgkbcI1t7D37u23pTzPtqPNxng6WCKB5WVFrAhcLUtGbSRMXWgi6/NMGnbSVYdTwsAa7BTtoR8P9HpEECtJCQ9JlSuGU5acg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lCDj51ZIW71JjCVdQOyFHJcDfFQRh8dmY3gZ4d6xrfA=;
 b=r4p7oBnX4np0D5wtG4RJopa5N/Eci8BKeTpEJqij8kk6hSyyusfFAL9+L5uRCoioAeQwKVHV4H8zDSjJmByWF9QHFrPgmYihOnsbZIE8w8AwTzJ/C1TeDbqeLJ7H3W20Lz2+j/NC7S4zpLHmJ1Bz/wA3lZ+Y2+qisjKDXek/e2w=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM6PR12MB3370.namprd12.prod.outlook.com (2603:10b6:5:38::25) by
 PH0PR12MB7932.namprd12.prod.outlook.com (2603:10b6:510:280::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6863.45; Sat, 14 Oct 2023 01:30:30 +0000
Received: from DM6PR12MB3370.namprd12.prod.outlook.com
 ([fe80::b80b:7138:6ceb:9aef]) by DM6PR12MB3370.namprd12.prod.outlook.com
 ([fe80::b80b:7138:6ceb:9aef%5]) with mapi id 15.20.6863.047; Sat, 14 Oct 2023
 01:30:30 +0000
Message-ID: <3840e781-6da2-48f7-82d3-2b769476a949@amd.com>
Date: Fri, 13 Oct 2023 21:30:27 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:115.0) Gecko/20100101
 Thunderbird/115.3.2
Subject: Re: [PATCH v5 2/7] drm/sched: Convert drm scheduler to use a work
 queue rather than kthread
Content-Language: en-CA, en-US
To: Matthew Brost <matthew.brost@intel.com>, dri-devel@lists.freedesktop.org, 
 intel-xe@lists.freedesktop.org
References: <20231011235826.585624-1-matthew.brost@intel.com>
 <20231011235826.585624-3-matthew.brost@intel.com>
From: Luben Tuikov <luben.tuikov@amd.com>
Autocrypt: addr=luben.tuikov@amd.com; keydata=
 xjMEY1i6jxYJKwYBBAHaRw8BAQdAhfD+Cc+P5t/fiF08Vw25EMLiwUuxULYRiDQAP6H50MTN
 I0x1YmVuIFR1aWtvdiA8bHViZW4udHVpa292QGFtZC5jb20+wpkEExYKAEEWIQQyyR05VSHw
 x45E/SoppxulNG8HhgUCY1i6jwIbAwUJCWYBgAULCQgHAgIiAgYVCgkICwIEFgIDAQIeBwIX
 gAAKCRAppxulNG8Hhk53AP4k4UY5xfcje0c5OF1k22pNv8tErxtVpgKKZgvfetA4xwD+OoAh
 vesLIYumBDxP0BoLiLN84udxdT15HwPFUGiDmwDOOARjWLqPEgorBgEEAZdVAQUBAQdAzSxY
 a2EtvvIwd09NckBLSTarSLNDkUthmqPnwolwiDYDAQgHwn4EGBYKACYWIQQyyR05VSHwx45E
 /SoppxulNG8HhgUCY1i6jwIbDAUJCWYBgAAKCRAppxulNG8HhnBLAP4yjSGpK6PE1mapKhrq
 8bSl9reo+F6EqdhE8X2TTHPycAEAt8EkTEstSiaOpM66gneU7r+xxzOYULo1b1XjXayGvwM=
In-Reply-To: <20231011235826.585624-3-matthew.brost@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YQBPR01CA0153.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:7e::15) To DM6PR12MB3370.namprd12.prod.outlook.com
 (2603:10b6:5:38::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR12MB3370:EE_|PH0PR12MB7932:EE_
X-MS-Office365-Filtering-Correlation-Id: 03bfd2af-d924-460a-c191-08dbcc5526f2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 2/fGXlJ32o+MV+dj0LssNBuAxqk2UgvqceYyyemWFt4c/21QMIkB1iUOtsUv1FYkQ9l8KYZGqif8DiIBFaTWo6nWIHgDdFMt7aw8ZNtBo7wIJBR+jJ8b0XCgzeIZ80oRyfNlg9xGGbegqhW6zWxISFU5VgnS+UFhZMUkY8KuUMxMncRxMbxYwTmOFcnnuwig/6Akmrm5vnZj8rYRdegRYF76NMzTEoE7qRQfdX0ZtMDUqt4LhMyR8hrq9lLRMfVrc322exvDZ6N1LLR1NpenyK8g+ElXhOI7Hw0lYyh8W+alh405h5yOtsFNnKGDdfKA/ud6CvTgN1AV9rgP8q3S0S1QEuW8iXnK+h5U6vrB9lqzIyocBvnJsl56Ee6gHBKemoIOWu12N28/jzcKGYCI38n45yrL5XjkashB+ms7Oj7q8erP+w1EXCPsNNZYm9r1Mg7X2Fc0GS7TFby+4qZr3X/atYdQii+bUHu6tUyDYwxXV/ZKhQo84Whc7+6yyri+t0AUok4nXi2iFUq2QYb7bQvY+cPpytPW9rNXi4vY00t/M4aJwVZSO/yLAN2clqiOpbUEeHSFc96xmS0NecN/lHHP2FNyGPYF7C58KTdU1oiRqYnLsarC1SnXwwCfUFwv31bBLNTKyNTGg2xaab8ZNxfmCOnuC9eDDU+Ov4XJBOU=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB3370.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(376002)(136003)(346002)(366004)(396003)(230922051799003)(64100799003)(186009)(1800799009)(451199024)(36756003)(31686004)(26005)(6666004)(30864003)(53546011)(2616005)(83380400001)(8936002)(4326008)(478600001)(6512007)(8676002)(6486002)(6506007)(41300700001)(31696002)(316002)(4001150100001)(86362001)(2906002)(5660300002)(44832011)(66946007)(66476007)(66556008)(38100700002)(7416002)(43740500002)(45980500001)(309714004);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RVc1cDZUdUdCZzQ0VjdrZXNmWWRtREw1OTM1dkNzRER4dnF6bkU5T0tiNUxF?=
 =?utf-8?B?N2RCd3U4cDZGRnViMjBGa3VqQ2NFZEllUHBUbG9GQlNsTE1HMzV3YkRMSnNk?=
 =?utf-8?B?LzNTakpDNlg1VmtNQkhUVTJ2MWsvenZmL09ydWdrSTVpdmdiV0FLaWRQOHJF?=
 =?utf-8?B?UlloTjFzWTdSLzFkTmIyUGU3N2U3akpIV0ZEbWdMT3B1Vm03bjYrSkpFWkdF?=
 =?utf-8?B?dlNGQmV5RVZwcUJSMTYrdXZRK2kwTUQva0FNUlBWV0NkRmNhUnY0NXN1YllO?=
 =?utf-8?B?eGtleVlwendFa3V4cTc4NHpHcXp4bEFjQ253NlczcXdaK1MzRi9aOVZrWTht?=
 =?utf-8?B?ME8wb3JJcHJzVTJkTS84Q1VGRGQ0eHQ2aTJaVmJsU016ZHNoZ3hrM3BKM0NK?=
 =?utf-8?B?cGE4d3FYbGRqbWVjQWRqOWt5MjFEOW4vdGdSaXFodmc1UHBrdGJFcmdCbGcy?=
 =?utf-8?B?d2FURmJ0K3k2WGtuTEpUSlZ1RllKdkRLdmVxMk1aWUFDQTVoR0gySUl3RGZT?=
 =?utf-8?B?RHdORDRycGdTMnpMU0hWOEwzTUFNL0xoZXlmT0txRnhhdVlKSmxhcTNQSDhQ?=
 =?utf-8?B?dTZzYnR0Snd1UWVBZkVWeHh5dSt4aHRaVDRPdEdWUUp5SE5CbkNBem8xdDdo?=
 =?utf-8?B?YlNmZHBjNkwzZS8yWmpSaHdoQUU5Y28xYUkxd1pNSDJkdUtBQVg3M3Jrdmww?=
 =?utf-8?B?bHZ0QUdRbkU3bElNT0MwNHhwNE0zaDBwWG1LeWpUNkh4U01iWGpXT2VMbFp3?=
 =?utf-8?B?RTNtbkxpVjhOYkc4cFdYcko5RE1vY04vd3RVTzVOeHBaQURwZnpBUFBHL0wz?=
 =?utf-8?B?SkRCaTFZWmxIOE9MOE5KMzJ0NlkzckZMK0kvT2ZXL2JsbnJkelY5L09NVFFu?=
 =?utf-8?B?amtSOEY5WXJaV2xBd2syUnkxOGVzOVFjTFB5NjdyVElBVXpFbXBZN2VjMW04?=
 =?utf-8?B?aWRkWTVtYzZncnJTYjFWL25ZdE1tTW85U0RBdGUwZ2l0U1NnNGVOaGZqUGRt?=
 =?utf-8?B?Q25qY2FmNFZYRWFqTm1UWFY4NHR5Zm1lZ2ZqTC9LZ0cvZ2ZvR3pjc080ZVhi?=
 =?utf-8?B?NzU5T2ZTOTNFVmdjeitSb2pQOFY4WFJvSmFXbFhTdW5MUXdJTUVvZmhNaFla?=
 =?utf-8?B?UFp0a1Fja1g5bnVpME00UWE5SGJLVEpvbTAwNGh3ck5KWHhoTW5uUTFvNEFG?=
 =?utf-8?B?amFZWGlpdjMvY1NsVUlxTmRzdkc0aXA5R1BuVVJZK0N6Y2NUN2NTRHphY0tU?=
 =?utf-8?B?Njh4bk1ETFkxL0xyZ09nVGFHdHg1T1ZmMjBJUXBJTDZBNVBMWVc0MlVDYmhJ?=
 =?utf-8?B?WjFIUW8zM3RiTDFBdVNIVTN0TE1aS3NpdjNaSjRGUkVSV3A4SHNHYjVIWHhv?=
 =?utf-8?B?V1Yvc21MMzNLSlFYeFlOaWFpWlZuTGVRR0hOVUVsUEhsU2VMTXUvQ2llcVRa?=
 =?utf-8?B?SytrUWdpNzJhRDIvRTV2Rmg3L1NFeXYxd1Z3RzJVMjZ6eWNLT0FJNlpxblo0?=
 =?utf-8?B?NTFoZVNDM3I2c0hPZ2dqbXBoT0ZEVlVHRktZUFVGQ2hGVU02bm5MY0V2S3VY?=
 =?utf-8?B?cU03a1dud05JODFtcjhsVGs3TkxNVmZNNnl0b2RGMG9ZWXZvc0xRMlRDUElY?=
 =?utf-8?B?UnNZdGoyRVJjb1EyTnpyajBvczE2eXlOSlN0NGVWWEdwVnpBcjRZRHIwNEdH?=
 =?utf-8?B?MEpEa3JPSFJRN1BGT2RXTVBtcUg1U2g3MjhtOTU5M2Jaa29YZTljS1YwdFdk?=
 =?utf-8?B?ZG5PK3V0Q2FSeTN0eUh2amlSLzQySnRPK3pCeUdnaVIwdlkwUUJjeE9OT0RF?=
 =?utf-8?B?KzhUcDVCS25kdm8rbStGTzRLQnFOd2Z2bFEvMGhRNThiZW02L1ZQOTVPbEpa?=
 =?utf-8?B?alVqUk5adWYxcFpVSVhueVIreWJuV2t4Ky9lQ2Y3Y1NHS2Q1YVgyZm00eCtx?=
 =?utf-8?B?QkVvVmxYLzdXWStMVCtBMFBCWkZtWnkvbFpZRUxubW5tRzBNdjhUdHd3RkpO?=
 =?utf-8?B?N3ZtWVpFT3BrSnc1anNyUGE3WUpHUEh5dC85bXJZUDEwOHkxWEEwQzZabFFW?=
 =?utf-8?B?cFBCT2RMVGIwUTRrc1FsYldEaTFBNFJkVlFFdjdEV1hWV2g3ZlB0aGJsSUp6?=
 =?utf-8?Q?zPzlYVmSV9RMFS2ASCOzFqvlz?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 03bfd2af-d924-460a-c191-08dbcc5526f2
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB3370.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2023 01:30:30.2055 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Yhnv9NAbuqj/qZLPjgL2fb0MVsiCyeMpaEmoneiBUPWGkM8E7LiVKsqtBge5CkBB
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB7932
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
 mcanal@igalia.com, boris.brezillon@collabora.com, dakr@redhat.com,
 donald.robson@imgtec.com, lina@asahilina.net, christian.koenig@amd.com,
 faith.ekstrand@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2023-10-11 19:58, Matthew Brost wrote:
> In Xe, the new Intel GPU driver, a choice has made to have a 1 to 1
> mapping between a drm_gpu_scheduler and drm_sched_entity. At first this
> seems a bit odd but let us explain the reasoning below.
> 
> 1. In Xe the submission order from multiple drm_sched_entity is not
> guaranteed to be the same completion even if targeting the same hardware
> engine. This is because in Xe we have a firmware scheduler, the GuC,
> which allowed to reorder, timeslice, and preempt submissions. If a using
> shared drm_gpu_scheduler across multiple drm_sched_entity, the TDR falls
> apart as the TDR expects submission order == completion order. Using a
> dedicated drm_gpu_scheduler per drm_sched_entity solve this problem.
> 
> 2. In Xe submissions are done via programming a ring buffer (circular
> buffer), a drm_gpu_scheduler provides a limit on number of jobs, if the
> limit of number jobs is set to RING_SIZE / MAX_SIZE_PER_JOB we get flow
> control on the ring for free.
> 
> A problem with this design is currently a drm_gpu_scheduler uses a
> kthread for submission / job cleanup. This doesn't scale if a large
> number of drm_gpu_scheduler are used. To work around the scaling issue,
> use a worker rather than kthread for submission / job cleanup.
> 
> v2:
>   - (Rob Clark) Fix msm build
>   - Pass in run work queue
> v3:
>   - (Boris) don't have loop in worker
> v4:
>   - (Tvrtko) break out submit ready, stop, start helpers into own patch
> v5:
>   - (Boris) default to ordered work queue
> v6:
>   - (Luben / checkpatch) fix alignment in msm_ringbuffer.c
>   - (Luben) s/drm_sched_submit_queue/drm_sched_wqueue_enqueue
>   - (Luben) Update comment for drm_sched_wqueue_enqueue
>   - (Luben) Positive check for submit_wq in drm_sched_init
>   - (Luben) s/alloc_submit_wq/own_submit_wq
> 
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>

Reviewed-by: Luben Tuikov <luben.tuikov@amd.com>

> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_device.c |   2 +-
>  drivers/gpu/drm/etnaviv/etnaviv_sched.c    |   2 +-
>  drivers/gpu/drm/lima/lima_sched.c          |   2 +-
>  drivers/gpu/drm/msm/msm_ringbuffer.c       |   7 +-
>  drivers/gpu/drm/nouveau/nouveau_sched.c    |   2 +-
>  drivers/gpu/drm/panfrost/panfrost_job.c    |   2 +-
>  drivers/gpu/drm/scheduler/sched_main.c     | 118 ++++++++++-----------
>  drivers/gpu/drm/v3d/v3d_sched.c            |  10 +-
>  include/drm/gpu_scheduler.h                |  14 ++-
>  9 files changed, 82 insertions(+), 77 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> index b1aafe815f28..b54c4d771104 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> @@ -2279,7 +2279,7 @@ static int amdgpu_device_init_schedulers(struct amdgpu_device *adev)
>  			break;
>  		}
>  
> -		r = drm_sched_init(&ring->sched, &amdgpu_sched_ops,
> +		r = drm_sched_init(&ring->sched, &amdgpu_sched_ops, NULL,
>  				   ring->num_hw_submission, 0,
>  				   timeout, adev->reset_domain->wq,
>  				   ring->sched_score, ring->name,
> diff --git a/drivers/gpu/drm/etnaviv/etnaviv_sched.c b/drivers/gpu/drm/etnaviv/etnaviv_sched.c
> index 345fec6cb1a4..618a804ddc34 100644
> --- a/drivers/gpu/drm/etnaviv/etnaviv_sched.c
> +++ b/drivers/gpu/drm/etnaviv/etnaviv_sched.c
> @@ -134,7 +134,7 @@ int etnaviv_sched_init(struct etnaviv_gpu *gpu)
>  {
>  	int ret;
>  
> -	ret = drm_sched_init(&gpu->sched, &etnaviv_sched_ops,
> +	ret = drm_sched_init(&gpu->sched, &etnaviv_sched_ops, NULL,
>  			     etnaviv_hw_jobs_limit, etnaviv_job_hang_limit,
>  			     msecs_to_jiffies(500), NULL, NULL,
>  			     dev_name(gpu->dev), gpu->dev);
> diff --git a/drivers/gpu/drm/lima/lima_sched.c b/drivers/gpu/drm/lima/lima_sched.c
> index ffd91a5ee299..8d858aed0e56 100644
> --- a/drivers/gpu/drm/lima/lima_sched.c
> +++ b/drivers/gpu/drm/lima/lima_sched.c
> @@ -488,7 +488,7 @@ int lima_sched_pipe_init(struct lima_sched_pipe *pipe, const char *name)
>  
>  	INIT_WORK(&pipe->recover_work, lima_sched_recover_work);
>  
> -	return drm_sched_init(&pipe->base, &lima_sched_ops, 1,
> +	return drm_sched_init(&pipe->base, &lima_sched_ops, NULL, 1,
>  			      lima_job_hang_limit,
>  			      msecs_to_jiffies(timeout), NULL,
>  			      NULL, name, pipe->ldev->dev);
> diff --git a/drivers/gpu/drm/msm/msm_ringbuffer.c b/drivers/gpu/drm/msm/msm_ringbuffer.c
> index 40c0bc35a44c..1097f8e93d6b 100644
> --- a/drivers/gpu/drm/msm/msm_ringbuffer.c
> +++ b/drivers/gpu/drm/msm/msm_ringbuffer.c
> @@ -94,9 +94,10 @@ struct msm_ringbuffer *msm_ringbuffer_new(struct msm_gpu *gpu, int id,
>  	 /* currently managing hangcheck ourselves: */
>  	sched_timeout = MAX_SCHEDULE_TIMEOUT;
>  
> -	ret = drm_sched_init(&ring->sched, &msm_sched_ops,
> -			num_hw_submissions, 0, sched_timeout,
> -			NULL, NULL, to_msm_bo(ring->bo)->name, gpu->dev->dev);
> +	ret = drm_sched_init(&ring->sched, &msm_sched_ops, NULL,
> +			     num_hw_submissions, 0, sched_timeout,
> +			     NULL, NULL, to_msm_bo(ring->bo)->name,
> +			     gpu->dev->dev);
>  	if (ret) {
>  		goto fail;
>  	}
> diff --git a/drivers/gpu/drm/nouveau/nouveau_sched.c b/drivers/gpu/drm/nouveau/nouveau_sched.c
> index 3b7ea5221226..4c959dec42b3 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_sched.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_sched.c
> @@ -435,7 +435,7 @@ int nouveau_sched_init(struct nouveau_drm *drm)
>  	if (!drm->sched_wq)
>  		return -ENOMEM;
>  
> -	return drm_sched_init(sched, &nouveau_sched_ops,
> +	return drm_sched_init(sched, &nouveau_sched_ops, NULL,
>  			      NOUVEAU_SCHED_HW_SUBMISSIONS, 0, job_hang_limit,
>  			      NULL, NULL, "nouveau_sched", drm->dev->dev);
>  }
> diff --git a/drivers/gpu/drm/panfrost/panfrost_job.c b/drivers/gpu/drm/panfrost/panfrost_job.c
> index fb16de2d0420..934b7b930c76 100644
> --- a/drivers/gpu/drm/panfrost/panfrost_job.c
> +++ b/drivers/gpu/drm/panfrost/panfrost_job.c
> @@ -852,7 +852,7 @@ int panfrost_job_init(struct panfrost_device *pfdev)
>  		js->queue[j].fence_context = dma_fence_context_alloc(1);
>  
>  		ret = drm_sched_init(&js->queue[j].sched,
> -				     &panfrost_sched_ops,
> +				     &panfrost_sched_ops, NULL,
>  				     nentries, 0,
>  				     msecs_to_jiffies(JOB_TIMEOUT_MS),
>  				     pfdev->reset.wq,
> diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
> index 6f2f7dd4ba0a..8b1d52cff1e9 100644
> --- a/drivers/gpu/drm/scheduler/sched_main.c
> +++ b/drivers/gpu/drm/scheduler/sched_main.c
> @@ -48,7 +48,6 @@
>   * through the jobs entity pointer.
>   */
>  
> -#include <linux/kthread.h>
>  #include <linux/wait.h>
>  #include <linux/sched.h>
>  #include <linux/completion.h>
> @@ -256,6 +255,16 @@ drm_sched_rq_select_entity_fifo(struct drm_sched_rq *rq)
>  	return rb ? rb_entry(rb, struct drm_sched_entity, rb_tree_node) : NULL;
>  }
>  
> +/**
> + * drm_sched_wqueue_enqueue - enqueue scheduler submission
> + * @sched: scheduler instance
> + */
> +static void drm_sched_wqueue_enqueue(struct drm_gpu_scheduler *sched)
> +{
> +	if (!READ_ONCE(sched->pause_submit))
> +		queue_work(sched->submit_wq, &sched->work_submit);
> +}
> +
>  /**
>   * drm_sched_job_done - complete a job
>   * @s_job: pointer to the job which is done
> @@ -275,7 +284,7 @@ static void drm_sched_job_done(struct drm_sched_job *s_job, int result)
>  	dma_fence_get(&s_fence->finished);
>  	drm_sched_fence_finished(s_fence, result);
>  	dma_fence_put(&s_fence->finished);
> -	wake_up_interruptible(&sched->wake_up_worker);
> +	drm_sched_wqueue_enqueue(sched);
>  }
>  
>  /**
> @@ -868,7 +877,7 @@ static bool drm_sched_can_queue(struct drm_gpu_scheduler *sched)
>  void drm_sched_wakeup_if_can_queue(struct drm_gpu_scheduler *sched)
>  {
>  	if (drm_sched_can_queue(sched))
> -		wake_up_interruptible(&sched->wake_up_worker);
> +		drm_sched_wqueue_enqueue(sched);
>  }
>  
>  /**
> @@ -978,61 +987,42 @@ drm_sched_pick_best(struct drm_gpu_scheduler **sched_list,
>  }
>  EXPORT_SYMBOL(drm_sched_pick_best);
>  
> -/**
> - * drm_sched_blocked - check if the scheduler is blocked
> - *
> - * @sched: scheduler instance
> - *
> - * Returns true if blocked, otherwise false.
> - */
> -static bool drm_sched_blocked(struct drm_gpu_scheduler *sched)
> -{
> -	if (kthread_should_park()) {
> -		kthread_parkme();
> -		return true;
> -	}
> -
> -	return false;
> -}
> -
>  /**
>   * drm_sched_main - main scheduler thread
>   *
>   * @param: scheduler instance
> - *
> - * Returns 0.
>   */
> -static int drm_sched_main(void *param)
> +static void drm_sched_main(struct work_struct *w)
>  {
> -	struct drm_gpu_scheduler *sched = (struct drm_gpu_scheduler *)param;
> +	struct drm_gpu_scheduler *sched =
> +		container_of(w, struct drm_gpu_scheduler, work_submit);
> +	struct drm_sched_entity *entity;
> +	struct drm_sched_job *cleanup_job;
>  	int r;
>  
> -	sched_set_fifo_low(current);
> +	if (READ_ONCE(sched->pause_submit))
> +		return;
>  
> -	while (!kthread_should_stop()) {
> -		struct drm_sched_entity *entity = NULL;
> -		struct drm_sched_fence *s_fence;
> -		struct drm_sched_job *sched_job;
> -		struct dma_fence *fence;
> -		struct drm_sched_job *cleanup_job = NULL;
> +	cleanup_job = drm_sched_get_cleanup_job(sched);
> +	entity = drm_sched_select_entity(sched);
>  
> -		wait_event_interruptible(sched->wake_up_worker,
> -					 (cleanup_job = drm_sched_get_cleanup_job(sched)) ||
> -					 (!drm_sched_blocked(sched) &&
> -					  (entity = drm_sched_select_entity(sched))) ||
> -					 kthread_should_stop());
> +	if (!entity && !cleanup_job)
> +		return;	/* No more work */
>  
> -		if (cleanup_job)
> -			sched->ops->free_job(cleanup_job);
> +	if (cleanup_job)
> +		sched->ops->free_job(cleanup_job);
>  
> -		if (!entity)
> -			continue;
> +	if (entity) {
> +		struct dma_fence *fence;
> +		struct drm_sched_fence *s_fence;
> +		struct drm_sched_job *sched_job;
>  
>  		sched_job = drm_sched_entity_pop_job(entity);
> -
>  		if (!sched_job) {
>  			complete_all(&entity->entity_idle);
> -			continue;
> +			if (!cleanup_job)
> +				return;	/* No more work */
> +			goto again;
>  		}
>  
>  		s_fence = sched_job->s_fence;
> @@ -1063,7 +1053,9 @@ static int drm_sched_main(void *param)
>  
>  		wake_up(&sched->job_scheduled);
>  	}
> -	return 0;
> +
> +again:
> +	drm_sched_wqueue_enqueue(sched);
>  }
>  
>  /**
> @@ -1071,6 +1063,8 @@ static int drm_sched_main(void *param)
>   *
>   * @sched: scheduler instance
>   * @ops: backend operations for this scheduler
> + * @submit_wq: workqueue to use for submission. If NULL, an ordered wq is
> + *	       allocated and used
>   * @hw_submission: number of hw submissions that can be in flight
>   * @hang_limit: number of times to allow a job to hang before dropping it
>   * @timeout: timeout value in jiffies for the scheduler
> @@ -1084,14 +1078,25 @@ static int drm_sched_main(void *param)
>   */
>  int drm_sched_init(struct drm_gpu_scheduler *sched,
>  		   const struct drm_sched_backend_ops *ops,
> +		   struct workqueue_struct *submit_wq,
>  		   unsigned hw_submission, unsigned hang_limit,
>  		   long timeout, struct workqueue_struct *timeout_wq,
>  		   atomic_t *score, const char *name, struct device *dev)
>  {
> -	int i, ret;
> +	int i;
>  	sched->ops = ops;
>  	sched->hw_submission_limit = hw_submission;
>  	sched->name = name;
> +	if (submit_wq) {
> +		sched->submit_wq = submit_wq;
> +		sched->own_submit_wq = false;
> +	} else {
> +		sched->submit_wq = alloc_ordered_workqueue(name, 0);
> +		if (!sched->submit_wq)
> +			return -ENOMEM;
> +
> +		sched->own_submit_wq = true;
> +	}
>  	sched->timeout = timeout;
>  	sched->timeout_wq = timeout_wq ? : system_wq;
>  	sched->hang_limit = hang_limit;
> @@ -1100,23 +1105,15 @@ int drm_sched_init(struct drm_gpu_scheduler *sched,
>  	for (i = DRM_SCHED_PRIORITY_MIN; i < DRM_SCHED_PRIORITY_COUNT; i++)
>  		drm_sched_rq_init(sched, &sched->sched_rq[i]);
>  
> -	init_waitqueue_head(&sched->wake_up_worker);
>  	init_waitqueue_head(&sched->job_scheduled);
>  	INIT_LIST_HEAD(&sched->pending_list);
>  	spin_lock_init(&sched->job_list_lock);
>  	atomic_set(&sched->hw_rq_count, 0);
>  	INIT_DELAYED_WORK(&sched->work_tdr, drm_sched_job_timedout);
> +	INIT_WORK(&sched->work_submit, drm_sched_main);
>  	atomic_set(&sched->_score, 0);
>  	atomic64_set(&sched->job_id_count, 0);
> -
> -	/* Each scheduler will run on a seperate kernel thread */
> -	sched->thread = kthread_run(drm_sched_main, sched, sched->name);
> -	if (IS_ERR(sched->thread)) {
> -		ret = PTR_ERR(sched->thread);
> -		sched->thread = NULL;
> -		DRM_DEV_ERROR(sched->dev, "Failed to create scheduler for %s.\n", name);
> -		return ret;
> -	}
> +	sched->pause_submit = false;
>  
>  	sched->ready = true;
>  	return 0;
> @@ -1135,8 +1132,7 @@ void drm_sched_fini(struct drm_gpu_scheduler *sched)
>  	struct drm_sched_entity *s_entity;
>  	int i;
>  
> -	if (sched->thread)
> -		kthread_stop(sched->thread);
> +	drm_sched_wqueue_stop(sched);
>  
>  	for (i = DRM_SCHED_PRIORITY_COUNT - 1; i >= DRM_SCHED_PRIORITY_MIN; i--) {
>  		struct drm_sched_rq *rq = &sched->sched_rq[i];
> @@ -1159,6 +1155,8 @@ void drm_sched_fini(struct drm_gpu_scheduler *sched)
>  	/* Confirm no work left behind accessing device structures */
>  	cancel_delayed_work_sync(&sched->work_tdr);
>  
> +	if (sched->own_submit_wq)
> +		destroy_workqueue(sched->submit_wq);
>  	sched->ready = false;
>  }
>  EXPORT_SYMBOL(drm_sched_fini);
> @@ -1216,7 +1214,7 @@ EXPORT_SYMBOL(drm_sched_increase_karma);
>   */
>  bool drm_sched_wqueue_ready(struct drm_gpu_scheduler *sched)
>  {
> -	return !!sched->thread;
> +	return sched->ready;
>  }
>  EXPORT_SYMBOL(drm_sched_wqueue_ready);
>  
> @@ -1227,7 +1225,8 @@ EXPORT_SYMBOL(drm_sched_wqueue_ready);
>   */
>  void drm_sched_wqueue_stop(struct drm_gpu_scheduler *sched)
>  {
> -	kthread_park(sched->thread);
> +	WRITE_ONCE(sched->pause_submit, true);
> +	cancel_work_sync(&sched->work_submit);
>  }
>  EXPORT_SYMBOL(drm_sched_wqueue_stop);
>  
> @@ -1238,6 +1237,7 @@ EXPORT_SYMBOL(drm_sched_wqueue_stop);
>   */
>  void drm_sched_wqueue_start(struct drm_gpu_scheduler *sched)
>  {
> -	kthread_unpark(sched->thread);
> +	WRITE_ONCE(sched->pause_submit, false);
> +	queue_work(sched->submit_wq, &sched->work_submit);
>  }
>  EXPORT_SYMBOL(drm_sched_wqueue_start);
> diff --git a/drivers/gpu/drm/v3d/v3d_sched.c b/drivers/gpu/drm/v3d/v3d_sched.c
> index 06238e6d7f5c..38e092ea41e6 100644
> --- a/drivers/gpu/drm/v3d/v3d_sched.c
> +++ b/drivers/gpu/drm/v3d/v3d_sched.c
> @@ -388,7 +388,7 @@ v3d_sched_init(struct v3d_dev *v3d)
>  	int ret;
>  
>  	ret = drm_sched_init(&v3d->queue[V3D_BIN].sched,
> -			     &v3d_bin_sched_ops,
> +			     &v3d_bin_sched_ops, NULL,
>  			     hw_jobs_limit, job_hang_limit,
>  			     msecs_to_jiffies(hang_limit_ms), NULL,
>  			     NULL, "v3d_bin", v3d->drm.dev);
> @@ -396,7 +396,7 @@ v3d_sched_init(struct v3d_dev *v3d)
>  		return ret;
>  
>  	ret = drm_sched_init(&v3d->queue[V3D_RENDER].sched,
> -			     &v3d_render_sched_ops,
> +			     &v3d_render_sched_ops, NULL,
>  			     hw_jobs_limit, job_hang_limit,
>  			     msecs_to_jiffies(hang_limit_ms), NULL,
>  			     NULL, "v3d_render", v3d->drm.dev);
> @@ -404,7 +404,7 @@ v3d_sched_init(struct v3d_dev *v3d)
>  		goto fail;
>  
>  	ret = drm_sched_init(&v3d->queue[V3D_TFU].sched,
> -			     &v3d_tfu_sched_ops,
> +			     &v3d_tfu_sched_ops, NULL,
>  			     hw_jobs_limit, job_hang_limit,
>  			     msecs_to_jiffies(hang_limit_ms), NULL,
>  			     NULL, "v3d_tfu", v3d->drm.dev);
> @@ -413,7 +413,7 @@ v3d_sched_init(struct v3d_dev *v3d)
>  
>  	if (v3d_has_csd(v3d)) {
>  		ret = drm_sched_init(&v3d->queue[V3D_CSD].sched,
> -				     &v3d_csd_sched_ops,
> +				     &v3d_csd_sched_ops, NULL,
>  				     hw_jobs_limit, job_hang_limit,
>  				     msecs_to_jiffies(hang_limit_ms), NULL,
>  				     NULL, "v3d_csd", v3d->drm.dev);
> @@ -421,7 +421,7 @@ v3d_sched_init(struct v3d_dev *v3d)
>  			goto fail;
>  
>  		ret = drm_sched_init(&v3d->queue[V3D_CACHE_CLEAN].sched,
> -				     &v3d_cache_clean_sched_ops,
> +				     &v3d_cache_clean_sched_ops, NULL,
>  				     hw_jobs_limit, job_hang_limit,
>  				     msecs_to_jiffies(hang_limit_ms), NULL,
>  				     NULL, "v3d_cache_clean", v3d->drm.dev);
> diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
> index 38578fe74573..211bd3cdabdc 100644
> --- a/include/drm/gpu_scheduler.h
> +++ b/include/drm/gpu_scheduler.h
> @@ -473,17 +473,16 @@ struct drm_sched_backend_ops {
>   * @timeout: the time after which a job is removed from the scheduler.
>   * @name: name of the ring for which this scheduler is being used.
>   * @sched_rq: priority wise array of run queues.
> - * @wake_up_worker: the wait queue on which the scheduler sleeps until a job
> - *                  is ready to be scheduled.
>   * @job_scheduled: once @drm_sched_entity_do_release is called the scheduler
>   *                 waits on this wait queue until all the scheduled jobs are
>   *                 finished.
>   * @hw_rq_count: the number of jobs currently in the hardware queue.
>   * @job_id_count: used to assign unique id to the each job.
> + * @submit_wq: workqueue used to queue @work_submit
>   * @timeout_wq: workqueue used to queue @work_tdr
> + * @work_submit: schedules jobs and cleans up entities
>   * @work_tdr: schedules a delayed call to @drm_sched_job_timedout after the
>   *            timeout interval is over.
> - * @thread: the kthread on which the scheduler which run.
>   * @pending_list: the list of jobs which are currently in the job queue.
>   * @job_list_lock: lock to protect the pending_list.
>   * @hang_limit: once the hangs by a job crosses this limit then it is marked
> @@ -492,6 +491,8 @@ struct drm_sched_backend_ops {
>   * @_score: score used when the driver doesn't provide one
>   * @ready: marks if the underlying HW is ready to work
>   * @free_guilty: A hit to time out handler to free the guilty job.
> + * @pause_submit: pause queuing of @work_submit on @submit_wq
> + * @own_submit_wq: scheduler owns allocation of @submit_wq
>   * @dev: system &struct device
>   *
>   * One scheduler is implemented for each hardware ring.
> @@ -502,13 +503,13 @@ struct drm_gpu_scheduler {
>  	long				timeout;
>  	const char			*name;
>  	struct drm_sched_rq		sched_rq[DRM_SCHED_PRIORITY_COUNT];
> -	wait_queue_head_t		wake_up_worker;
>  	wait_queue_head_t		job_scheduled;
>  	atomic_t			hw_rq_count;
>  	atomic64_t			job_id_count;
> +	struct workqueue_struct		*submit_wq;
>  	struct workqueue_struct		*timeout_wq;
> +	struct work_struct		work_submit;
>  	struct delayed_work		work_tdr;
> -	struct task_struct		*thread;
>  	struct list_head		pending_list;
>  	spinlock_t			job_list_lock;
>  	int				hang_limit;
> @@ -516,11 +517,14 @@ struct drm_gpu_scheduler {
>  	atomic_t                        _score;
>  	bool				ready;
>  	bool				free_guilty;
> +	bool				pause_submit;
> +	bool				own_submit_wq;
>  	struct device			*dev;
>  };
>  
>  int drm_sched_init(struct drm_gpu_scheduler *sched,
>  		   const struct drm_sched_backend_ops *ops,
> +		   struct workqueue_struct *submit_wq,
>  		   uint32_t hw_submission, unsigned hang_limit,
>  		   long timeout, struct workqueue_struct *timeout_wq,
>  		   atomic_t *score, const char *name, struct device *dev);

-- 
Regards,
Luben

