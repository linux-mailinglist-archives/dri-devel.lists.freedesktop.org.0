Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E458F7C6276
	for <lists+dri-devel@lfdr.de>; Thu, 12 Oct 2023 03:52:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A917D10E0C2;
	Thu, 12 Oct 2023 01:52:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2074.outbound.protection.outlook.com [40.107.92.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B132A10E0C2
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Oct 2023 01:52:46 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kBUEjs9WkcHE8bYBr+OAMNqxVcvzlJeAAMv1udFU6gYy7ybNyEKHEIRKqxon40pLpkfM5GOu2M2xPJtlGgZmTD5pgb86EYuJJnVru8oKeJQRl98OKvL13XwJctUf/MYVzLG2ovdxGGGk7yMoEso/lnXiPAzvl9KBIEyiWBMcljyJBKggZasShNOoWfzgswuZKehLFFwMrhJ8Smye3YQnIGW1UOzP5DseaS3Mwr1Pbb+3LKIj29yLlIXRaoKgk1xIyX2u0PrW4ZryVIRx95e2+5G/kVC043j86mTHrRzdbw4rMYDHX0zsNNZd4ilNTKdvcO0/T7LXYv5hf8RTYSlnBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sig7tv/kN1MEzvTPb+NsIOASiK6+9Mx6KPBQOlJoHVU=;
 b=i5OJyuxh35bXzoiciT1s9q1cXO7Ekju+f93Kx7fZ7htKhI4J2F7RkXCotp3faYyo0KQPno9Gh7JyHqPJrVlDfpJOppj7XLyEnTauCZjFTdEvHt6VwTCdbxzNa7WuAMcbrnZkRIxpgOE/wKSLObiY4PV9c3FOeUhdK+qkOqWwFJc1ff8el5aQmVG36HuxU3iTvJriNeqFQGO6f2j2fxSfyDbobxZKBfdVF5qaPThPQJ4gQXxRVbRhdX6aRS1RvHf1KOHhCRH5F1u/viShhu/byRBytQDaJjMIPiH+79X5D8NIkd3CGBneJOTdVrTe3/Q7D/uauN1gR8IsrgkLd10Mdg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sig7tv/kN1MEzvTPb+NsIOASiK6+9Mx6KPBQOlJoHVU=;
 b=0WQyFCMfSOW/R5pbQvJ+BJhctBRfLBp49JF4JfYQHAZ+5+0hGVQTRzxb5OqMztVBbyIRhYwnOW/tmZCQb22lFDu+zKRxaGPKalcw+LLZqflWRnHYBSS5G7UWwMnKaC4M3z8p9r7VpfKZt6FIirlmCVCQpsLAPrrVQZKCtTirpZc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM6PR12MB3370.namprd12.prod.outlook.com (2603:10b6:5:38::25) by
 BY5PR12MB4259.namprd12.prod.outlook.com (2603:10b6:a03:202::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.41; Thu, 12 Oct
 2023 01:52:38 +0000
Received: from DM6PR12MB3370.namprd12.prod.outlook.com
 ([fe80::b80b:7138:6ceb:9aef]) by DM6PR12MB3370.namprd12.prod.outlook.com
 ([fe80::b80b:7138:6ceb:9aef%5]) with mapi id 15.20.6863.043; Thu, 12 Oct 2023
 01:52:38 +0000
Message-ID: <b52c58e4-8ae6-4272-a67e-d811c6359127@amd.com>
Date: Wed, 11 Oct 2023 21:52:36 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:115.0) Gecko/20100101
 Thunderbird/115.3.2
Subject: Re: [PATCH drm-misc-next v2] drm/sched: implement dynamic job-flow
 control
Content-Language: en-CA, en-US
To: Danilo Krummrich <dakr@redhat.com>, airlied@gmail.com, daniel@ffwll.ch,
 matthew.brost@intel.com, boris.brezillon@collabora.com,
 christian.koenig@amd.com, faith.ekstrand@collabora.com
References: <20231009223554.11846-1-dakr@redhat.com>
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
In-Reply-To: <20231009223554.11846-1-dakr@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YT4PR01CA0002.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:d1::15) To DM6PR12MB3370.namprd12.prod.outlook.com
 (2603:10b6:5:38::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR12MB3370:EE_|BY5PR12MB4259:EE_
X-MS-Office365-Filtering-Correlation-Id: 3a24b120-7062-4fe9-13ac-08dbcac5e9b8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Ge88RSnl2NUBcxuv2AYNc5FNBIBIAUQyJn767QIHau1GABn0uWR4ERxkuL8Z5J/6OhQcXl6BMPDtSYXE1idvq9UiFvmL2ZWTda1nHDyWzLxPdIPThGlaT6HLkSCRssyYHUVMhK2BtM+B6nmUT8KKh7iZTYWaHDFIuA+yXOb6aL5j25m8oEafGjYIOiZJTsHSSHtMbBeMfEVG66+fSXfRTjVgerA3oPUFiEvzY42BXtE0X0eGrh/KDNDtynjPGYkNroJ5NWT5wkkuIVyk183eUTmYojLNn3XtwZjvwYklflKSfpVSYJ7y5AZizfpHnkOyumsUI+wjAseaxJb4g5hRgW+0ZBcw/Nv4Zevuo7xowD6WvaEKfFlz+6mV6cKNmZIqBX1ljFZq8coeWyLRGw/i2hwFUtx9q6cyTdl2eR1fv8r6zNQAJw2gBi0B6z9kQm5otzSbjOTh7/+IdAeLg9hCPqCrY8jp1r44/SAz7rn56pM221Xg686eHTb1uDwjtGMBKaN1+zGYPCkb1RmuHB4ASoiBCmwiEpNnjNV/IS2P3QkXXMmkJ6sRQH8OhRuPxwoBXxWotcinI6USu2V9BYe8aEmNdJwdNHyxrwVs2oDvtDZNH3GW9UmeRry2+ALbqxTYzhBjUWH8PiPGuGVS0dr3TA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB3370.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(396003)(39860400002)(346002)(376002)(136003)(230922051799003)(451199024)(1800799009)(186009)(64100799003)(2616005)(2906002)(6506007)(6512007)(53546011)(31696002)(38100700002)(86362001)(26005)(83380400001)(5660300002)(44832011)(8936002)(4326008)(8676002)(6486002)(478600001)(36756003)(316002)(41300700001)(31686004)(66476007)(66556008)(30864003)(66946007)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?biszdlpiR0ZCUnpEbXdKM2lvdjZuKzZjUWIxZmZHWGdqMWNHb29DNWMwbTh5?=
 =?utf-8?B?R1k5YUtETHVsV3pSdVNZUHMrRjY4YnFXMTRvREJITEpUOWpkYTNUWXR2UUp6?=
 =?utf-8?B?eG1qZHM5ZEtRVG9BRUVUTnNHclRSVVlVVHFXK0d5Z3MzaysyQ3BxN0RKdVVH?=
 =?utf-8?B?bE1lK1BUYnhGT0RyVkhnZWcrSVhha29reXdCdzJIbk8wQWlTVzRha2FGRzJO?=
 =?utf-8?B?aE5WNmhZYmZPSE5SWWYzVy8yQVp5Y05ZenlMMkMvVStuS1RUbnRzeEpPNG56?=
 =?utf-8?B?ZzBnb0liUVd5TVVaQjAvUmlqUTRVRUlsZ0dHL0k3UmRRbW5wSzZhUk1NcVFm?=
 =?utf-8?B?Sy9OeHFCc3RFR1hrTCs5Zi9jL3pmMXorYi9xMFpjUVY0eTJFSkc4UGYyMlVF?=
 =?utf-8?B?WlNMTXlOdVdzck0zbXN3UHp4NlJhZEw2QmY4WWJjeWx2TW5xOTF1ZzAvUW9Y?=
 =?utf-8?B?bUNzd3JqQVBmR2tDNXF4WUpVcFV0b1dQVmpPSFEwOERTeWYwRnF6VzJQeUdj?=
 =?utf-8?B?YmhZb2JCbzVLdk50VlZkaC81aENORnlFMmhleWcwRzZVaWJtbDhoZnZVSGF2?=
 =?utf-8?B?VnpUMHU2L3ZUM1h4KzJWVXdrYmVwMklVTXpPbU52R3lGR1UxSTE1Y2RLVEI4?=
 =?utf-8?B?TWlYMVJmSnF5M25YMmNJZ0hTL003bWxqN2Z1MjJxWVlKb0JCRmlKanRPdzdm?=
 =?utf-8?B?UldscHBPbTMrYW9JdFBuRW4vTGhFdDBCeDNRSHFKUzMzemQrZXJYbXN4d1Bk?=
 =?utf-8?B?TjVQVHdxWHNid3pFdUdCelY4bTdRTEhKdmdUN0xkWmlDM2ZTS1VTK3lTYTAr?=
 =?utf-8?B?L2lpWUh1QkdMWXl1aUluNXo3NWw4bkhadWdJcmdwTms3NEs3MVFiODI4WWxT?=
 =?utf-8?B?K3pPdG8zV1E0UUtuQ2FFZWM2Z2svZlZLc1dWbkx0aEc2dXU0Vy9tZ01VZTZM?=
 =?utf-8?B?Zk5oMS82RUJiWDRYakY0WXZ0V1V4RlY0T2VoTk1KNnRjS3pHK1AvK0drTE9i?=
 =?utf-8?B?dUNBYmFBYllFaEVLYytwMmhSa3ZiTHpneUlKRERuOFUzR2UxZkRNWjF2d1BC?=
 =?utf-8?B?SDVuckVwU09ldHMzL3U0VXVxajlrb1F2bTgvbFEyM2dlcFA1WFZ4UFlEdDdK?=
 =?utf-8?B?YmY5VG9lS0IvSWZxV1daSVRueFNXMEZkUTAvTWM2bVR6NktzM0FVbzliZWM2?=
 =?utf-8?B?SDZWdmcyL2F2aE5maG1DUHpOWmdvTnZLV3h6VzdSQUdVZHlIcjVSaCsrbUtj?=
 =?utf-8?B?MXlRanpqaENRYWwrekpaQTZ2eUMrdnNaNVNrNHRPcWtWOThFbTRLWlBsa2xK?=
 =?utf-8?B?WlJUTUIwd1dJMFZ3UzRmT09Qa3dTTzlaaVNsUXFzRGVhMEhPSit5ZkVDNEs1?=
 =?utf-8?B?TStSbTNsc0FWU3pNak5YMVFKc1hCTWs2Nks3NENBcEpvYjFwaEx6YXdmMXEr?=
 =?utf-8?B?R0F0MnZIcHdQS2gxUURoRENrdVNhbFJ4L2RZU3U2c2kyYXNQWG9SdGRaMnFs?=
 =?utf-8?B?ZnZpSHVqbVgzUEdaUFFDWXh5SXJQWWQxRUlPSXFVdlFhQTRjWUQxQjdRNE9Q?=
 =?utf-8?B?L2JzT1VhMHNVQ1JFV1VXa3BSS0JZNlRNTmIxSEJNRnhmQmZueCtIVmN2TTJk?=
 =?utf-8?B?NzRwRHk5MFB0Zm9UekJHanJMd3Z6eWljVmlwbzVjRnpPYlFTWkcraUxSYlg3?=
 =?utf-8?B?R2Z2bEF1RUJyRkN0aTJ0TGYzR3h2UUFlQzd6MEUzbWZsTHVJaDE4eVU4b0FE?=
 =?utf-8?B?dUMyRmdzVGppMEc1SlplaXorSzRBMndMNmtySUFwUXFKbk5rYUlneFJoZDYz?=
 =?utf-8?B?aENObGh5M3VEWDJUWkpaSHp3Q2VEajRzVkRZOE5OUEtiNDhZNWo4MjF3WDdN?=
 =?utf-8?B?R3FtNUo2YkI4RkI3MTEzdmM3NHlXWjhWUFZuS0xrOUNiR2dkS01Mdm9Fang3?=
 =?utf-8?B?Y1JYbThpTlFFZ1hlR2QwZWpMbEgxOWNtU2JtVmZCOExvajNoTlRDd0xKVWJU?=
 =?utf-8?B?ckZOQXlGUXFkOWpyNnNFSXBSLzdraWQwR1FuV09NOHQwOHJHTDBZWXpBbXJj?=
 =?utf-8?B?MUxMZ3JhNkg0czBhbi9MQndLVnJCMHVkd0N4QkR2aDljelUrcFBvOVpaNVZF?=
 =?utf-8?Q?Kxif0gr8SGAzwexW1b1WbnCot?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3a24b120-7062-4fe9-13ac-08dbcac5e9b8
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB3370.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Oct 2023 01:52:38.2977 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vrPwml+Wm5z/jfVQMFF+lqybC9qgnY0BUeodJ97dXZi4blsgn4DZMqe9y0hq7HWK
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4259
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

Hi,

Thanks for fixing the title and submitting a v2 of this patch. Comments inlined below.

On 2023-10-09 18:35, Danilo Krummrich wrote:
> Currently, job flow control is implemented simply by limiting the number
> of jobs in flight. Therefore, a scheduler is initialized with a
> submission limit that corresponds to the number of jobs which can be
> sent to the hardware.
> 
> This implies that for each job, drivers need to account for the maximum
> job size possible in order to not overflow the ring buffer.
> 
> However, there are drivers, such as Nouveau, where the job size has a
> rather large range. For such drivers it can easily happen that job
> submissions not even filling the ring by 1% can block subsequent
> submissions, which, in the worst case, can lead to the ring run dry.
> 
> In order to overcome this issue, allow for tracking the actual job size
> instead of the number of jobs. Therefore, add a field to track a job's
> submission credits, which represents the number of credits a job
> contributes to the scheduler's submission limit.
> 
> Signed-off-by: Danilo Krummrich <dakr@redhat.com>
> ---
> Changes in V2:
> ==============
>   - fixed up influence on scheduling fairness due to consideration of a job's
>     size
>     - If we reach a ready entity in drm_sched_select_entity() but can't actually
>       queue a job from it due to size limitations, just give up and go to sleep
>       until woken up due to a pending job finishing, rather than continue to try
>       other entities.
>   - added a callback to dynamically update a job's credits (Boris)
>   - renamed 'units' to 'credits'
>   - fixed commit message and comments as requested by Luben
> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_job.c       |   2 +-
>  drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c  |   2 +-
>  drivers/gpu/drm/lima/lima_sched.c             |   2 +-
>  drivers/gpu/drm/msm/msm_gem_submit.c          |   2 +-
>  drivers/gpu/drm/nouveau/nouveau_sched.c       |   2 +-
>  drivers/gpu/drm/panfrost/panfrost_drv.c       |   2 +-
>  .../gpu/drm/scheduler/gpu_scheduler_trace.h   |   2 +-
>  drivers/gpu/drm/scheduler/sched_entity.c      |   5 +-
>  drivers/gpu/drm/scheduler/sched_main.c        | 101 +++++++++++++-----
>  drivers/gpu/drm/v3d/v3d_gem.c                 |   2 +-
>  include/drm/gpu_scheduler.h                   |  33 ++++--
>  11 files changed, 115 insertions(+), 40 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
> index 78476bc75b4e..d54daaf64bf1 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
> @@ -115,7 +115,7 @@ int amdgpu_job_alloc(struct amdgpu_device *adev, struct amdgpu_vm *vm,
>  	if (!entity)
>  		return 0;
>  
> -	return drm_sched_job_init(&(*job)->base, entity, owner);
> +	return drm_sched_job_init(&(*job)->base, entity, 1, owner);
>  }
>  
>  int amdgpu_job_alloc_with_ib(struct amdgpu_device *adev,
> diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c b/drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c
> index 45403ea38906..74a446711207 100644
> --- a/drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c
> +++ b/drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c
> @@ -538,7 +538,7 @@ int etnaviv_ioctl_gem_submit(struct drm_device *dev, void *data,
>  
>  	ret = drm_sched_job_init(&submit->sched_job,
>  				 &ctx->sched_entity[args->pipe],
> -				 submit->ctx);
> +				 1, submit->ctx);
>  	if (ret)
>  		goto err_submit_put;
>  
> diff --git a/drivers/gpu/drm/lima/lima_sched.c b/drivers/gpu/drm/lima/lima_sched.c
> index 50c2075228aa..5dc6678e1eb9 100644
> --- a/drivers/gpu/drm/lima/lima_sched.c
> +++ b/drivers/gpu/drm/lima/lima_sched.c
> @@ -123,7 +123,7 @@ int lima_sched_task_init(struct lima_sched_task *task,
>  	for (i = 0; i < num_bos; i++)
>  		drm_gem_object_get(&bos[i]->base.base);
>  
> -	err = drm_sched_job_init(&task->base, &context->base, vm);
> +	err = drm_sched_job_init(&task->base, &context->base, 1, vm);
>  	if (err) {
>  		kfree(task->bos);
>  		return err;
> diff --git a/drivers/gpu/drm/msm/msm_gem_submit.c b/drivers/gpu/drm/msm/msm_gem_submit.c
> index 3f1aa4de3b87..6d230c38e4f5 100644
> --- a/drivers/gpu/drm/msm/msm_gem_submit.c
> +++ b/drivers/gpu/drm/msm/msm_gem_submit.c
> @@ -48,7 +48,7 @@ static struct msm_gem_submit *submit_create(struct drm_device *dev,
>  		return ERR_PTR(ret);
>  	}
>  
> -	ret = drm_sched_job_init(&submit->base, queue->entity, queue);
> +	ret = drm_sched_job_init(&submit->base, queue->entity, 1, queue);
>  	if (ret) {
>  		kfree(submit->hw_fence);
>  		kfree(submit);
> diff --git a/drivers/gpu/drm/nouveau/nouveau_sched.c b/drivers/gpu/drm/nouveau/nouveau_sched.c
> index f26a814a9920..e991426d86e4 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_sched.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_sched.c
> @@ -89,7 +89,7 @@ nouveau_job_init(struct nouveau_job *job,
>  
>  	}
>  
> -	ret = drm_sched_job_init(&job->base, &entity->base, NULL);
> +	ret = drm_sched_job_init(&job->base, &entity->base, 1, NULL);
>  	if (ret)
>  		goto err_free_chains;
>  
> diff --git a/drivers/gpu/drm/panfrost/panfrost_drv.c b/drivers/gpu/drm/panfrost/panfrost_drv.c
> index b834777b409b..54d1c19bea84 100644
> --- a/drivers/gpu/drm/panfrost/panfrost_drv.c
> +++ b/drivers/gpu/drm/panfrost/panfrost_drv.c
> @@ -274,7 +274,7 @@ static int panfrost_ioctl_submit(struct drm_device *dev, void *data,
>  
>  	ret = drm_sched_job_init(&job->base,
>  				 &file_priv->sched_entity[slot],
> -				 NULL);
> +				 1, NULL);
>  	if (ret)
>  		goto out_put_job;
>  
> diff --git a/drivers/gpu/drm/scheduler/gpu_scheduler_trace.h b/drivers/gpu/drm/scheduler/gpu_scheduler_trace.h
> index 3143ecaaff86..2e4ffdecc5dc 100644
> --- a/drivers/gpu/drm/scheduler/gpu_scheduler_trace.h
> +++ b/drivers/gpu/drm/scheduler/gpu_scheduler_trace.h
> @@ -51,7 +51,7 @@ DECLARE_EVENT_CLASS(drm_sched_job,
>  			   __assign_str(name, sched_job->sched->name);
>  			   __entry->job_count = spsc_queue_count(&entity->job_queue);
>  			   __entry->hw_job_count = atomic_read(
> -				   &sched_job->sched->hw_rq_count);
> +				   &sched_job->sched->submission_count);
>  			   ),
>  	    TP_printk("entity=%p, id=%llu, fence=%p, ring=%s, job count:%u, hw job count:%d",
>  		      __entry->entity, __entry->id,
> diff --git a/drivers/gpu/drm/scheduler/sched_entity.c b/drivers/gpu/drm/scheduler/sched_entity.c
> index 437c50867c99..6395090d5784 100644
> --- a/drivers/gpu/drm/scheduler/sched_entity.c
> +++ b/drivers/gpu/drm/scheduler/sched_entity.c
> @@ -401,7 +401,8 @@ static void drm_sched_entity_wakeup(struct dma_fence *f,
>  		container_of(cb, struct drm_sched_entity, cb);
>  
>  	drm_sched_entity_clear_dep(f, cb);
> -	drm_sched_wakeup_if_can_queue(drm_sched_entity_to_scheduler(entity));
> +	drm_sched_wakeup_if_can_queue(drm_sched_entity_to_scheduler(entity),
> +				      entity);
>  }
>  
>  /**
> @@ -645,7 +646,7 @@ void drm_sched_entity_push_job(struct drm_sched_job *sched_job)
>  		if (fifo)
>  			drm_sched_rq_update_fifo(entity, submit_ts);
>  
> -		drm_sched_wakeup_if_can_queue(sched);
> +		drm_sched_wakeup_if_can_queue(sched, entity);
>  	}
>  }
>  EXPORT_SYMBOL(drm_sched_entity_push_job);
> diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
> index 88ef8be2d3c7..da86dd0782d6 100644
> --- a/drivers/gpu/drm/scheduler/sched_main.c
> +++ b/drivers/gpu/drm/scheduler/sched_main.c
> @@ -93,6 +93,9 @@ int drm_sched_policy_default = DRM_SCHED_POLICY_FIFO;
>  MODULE_PARM_DESC(sched_policy, "Specify the scheduling policy for entities on a run-queue, " __stringify(DRM_SCHED_POLICY_RR) " = Round Robin, " __stringify(DRM_SCHED_POLICY_FIFO) " = FIFO (default).");
>  module_param_named(sched_policy, drm_sched_policy_default, int, 0444);
>  
> +static bool drm_sched_can_queue(struct drm_gpu_scheduler *sched,
> +				struct drm_sched_entity *entity);
> +
>  static __always_inline bool drm_sched_entity_compare_before(struct rb_node *a,
>  							    const struct rb_node *b)
>  {
> @@ -212,13 +215,15 @@ void drm_sched_rq_remove_entity(struct drm_sched_rq *rq,
>  /**
>   * drm_sched_rq_select_entity_rr - Select an entity which could provide a job to run
>   *
> + * @sched: the gpu scheduler
>   * @rq: scheduler run queue to check.
>   * @dequeue: dequeue selected entity
>   *
>   * Try to find a ready entity, returns NULL if none found.
>   */
>  static struct drm_sched_entity *
> -drm_sched_rq_select_entity_rr(struct drm_sched_rq *rq, bool dequeue)
> +drm_sched_rq_select_entity_rr(struct drm_gpu_scheduler *sched,
> +			      struct drm_sched_rq *rq, bool dequeue)
>  {
>  	struct drm_sched_entity *entity;
>  
> @@ -228,6 +233,12 @@ drm_sched_rq_select_entity_rr(struct drm_sched_rq *rq, bool dequeue)
>  	if (entity) {
>  		list_for_each_entry_continue(entity, &rq->entities, list) {
>  			if (drm_sched_entity_is_ready(entity)) {
> +				/* If we can't queue yet, preserve the current
> +				 * entity in terms of fairness.
> +				 */
> +				if (!drm_sched_can_queue(sched, entity))
> +					goto out;
> +
>  				if (dequeue) {
>  					rq->current_entity = entity;
>  					reinit_completion(&entity->entity_idle);
> @@ -239,8 +250,13 @@ drm_sched_rq_select_entity_rr(struct drm_sched_rq *rq, bool dequeue)
>  	}
>  
>  	list_for_each_entry(entity, &rq->entities, list) {
> -
>  		if (drm_sched_entity_is_ready(entity)) {
> +			/* If we can't queue yet, preserve the current entity in
> +			 * terms of fairness.
> +			 */
> +			if (!drm_sched_can_queue(sched, entity))
> +				goto out;
> +
>  			if (dequeue) {
>  				rq->current_entity = entity;
>  				reinit_completion(&entity->entity_idle);
> @@ -253,21 +269,23 @@ drm_sched_rq_select_entity_rr(struct drm_sched_rq *rq, bool dequeue)
>  			break;
>  	}
>  
> +out:
>  	spin_unlock(&rq->lock);
> -
>  	return NULL;
>  }
>  
>  /**
>   * drm_sched_rq_select_entity_fifo - Select an entity which provides a job to run
>   *
> + * @sched: the gpu scheduler
>   * @rq: scheduler run queue to check.
>   * @dequeue: dequeue selected entity
>   *
>   * Find oldest waiting ready entity, returns NULL if none found.
>   */
>  static struct drm_sched_entity *
> -drm_sched_rq_select_entity_fifo(struct drm_sched_rq *rq, bool dequeue)
> +drm_sched_rq_select_entity_fifo(struct drm_gpu_scheduler *sched,
> +				struct drm_sched_rq *rq, bool dequeue)
>  {
>  	struct rb_node *rb;
>  
> @@ -277,6 +295,15 @@ drm_sched_rq_select_entity_fifo(struct drm_sched_rq *rq, bool dequeue)
>  
>  		entity = rb_entry(rb, struct drm_sched_entity, rb_tree_node);
>  		if (drm_sched_entity_is_ready(entity)) {
> +			/* If we can't queue yet, don't pick another entity
> +			 * which's job might fit and wait until we got space for
> +			 * this one in terms of fairness.
> +			 */
> +			if (!drm_sched_can_queue(sched, entity)) {
> +				spin_unlock(&rq->lock);
> +				return NULL;
> +			}
> +

I wonder if here it would've been cleaner to just do,

			if (!drm_sched_can_queue(sched, entity)) {
				rb = NULL;
				break;
			}

in order to follow the natural flow of the R-B tree search?
In other words, the loop invariant becomes false, we exit the loop,
unlock and return NULL.

Yeah, let's do that.

>  			if (dequeue) {
>  				rq->current_entity = entity;
>  				reinit_completion(&entity->entity_idle);
> @@ -302,13 +329,32 @@ static void drm_sched_run_job_queue(struct drm_gpu_scheduler *sched)
>  /**
>   * drm_sched_can_queue -- Can we queue more to the hardware?
>   * @sched: scheduler instance
> + * @entity: the scheduler entity
>   *
> - * Return true if we can push more jobs to the hw, otherwise false.
> + * Return true if we can push at least one more job from @entity, false
> + * otherwise.
>   */
> -static bool drm_sched_can_queue(struct drm_gpu_scheduler *sched)
> +static bool drm_sched_can_queue(struct drm_gpu_scheduler *sched,
> +				struct drm_sched_entity *entity)
>  {
> -	return atomic_read(&sched->hw_rq_count) <
> -		sched->hw_submission_limit;
> +	struct drm_sched_job *s_job;
> +
> +	s_job = to_drm_sched_job(spsc_queue_peek(&entity->job_queue));
> +	if (!s_job)
> +		return false;
> +
> +	if (sched->ops->update_job_credits) {
> +		u32 credits = sched->ops->update_job_credits(s_job);
> +
> +		if (credits)
> +			s_job->submission_credits = credits;
> +	}
> +
> +	WARN_ON(s_job->submission_credits > sched->submission_limit);
> +
> +	return (sched->submission_limit -
> +		atomic_read(&sched->submission_count)) >=
> +		s_job->submission_credits;
>  }
>  
>  /**
> @@ -325,12 +371,10 @@ drm_sched_select_entity(struct drm_gpu_scheduler *sched, bool dequeue)
>  	struct drm_sched_entity *entity;
>  	int i;
>  
> -	if (!drm_sched_can_queue(sched))
> -		return NULL;
> -
>  	if (sched->single_entity) {
>  		if (!READ_ONCE(sched->single_entity->stopped) &&
> -		    drm_sched_entity_is_ready(sched->single_entity))
> +		    drm_sched_entity_is_ready(sched->single_entity) &&
> +		    drm_sched_can_queue(sched, sched->single_entity))
>  			return sched->single_entity;

This mixing of the Xe patches and this patch is very, very annoying.
Here and in RR picking the entity mix-up with "dequeue" which is
now "peek"...

I'd like to have applied this patch to drm-misc-next and inspect it further,
but cannot chase around which version of the Xe patches this patch applies
to, cleanly, so I'd really rather have had this patch on a clean drm-misc-next
tree.

>  
>  		return NULL;
> @@ -339,9 +383,11 @@ drm_sched_select_entity(struct drm_gpu_scheduler *sched, bool dequeue)
>  	/* Kernel run queue has higher priority than normal run queue*/
>  	for (i = DRM_SCHED_PRIORITY_COUNT - 1; i >= DRM_SCHED_PRIORITY_MIN; i--) {
>  		entity = sched->sched_policy == DRM_SCHED_POLICY_FIFO ?
> -			drm_sched_rq_select_entity_fifo(&sched->sched_rq[i],
> +			drm_sched_rq_select_entity_fifo(sched,
> +							&sched->sched_rq[i],
>  							dequeue) :
> -			drm_sched_rq_select_entity_rr(&sched->sched_rq[i],
> +			drm_sched_rq_select_entity_rr(sched,
> +						      &sched->sched_rq[i],
>  						      dequeue);
>  		if (entity)
>  			break;
> @@ -399,7 +445,7 @@ static void drm_sched_job_done(struct drm_sched_job *s_job, int result)
>  	struct drm_sched_fence *s_fence = s_job->s_fence;
>  	struct drm_gpu_scheduler *sched = s_fence->sched;
>  
> -	atomic_dec(&sched->hw_rq_count);
> +	atomic_sub(s_job->submission_credits, &sched->submission_count);
>  	atomic_dec(sched->score);
>  
>  	trace_drm_sched_process_job(s_fence);
> @@ -622,7 +668,8 @@ void drm_sched_stop(struct drm_gpu_scheduler *sched, struct drm_sched_job *bad)
>  					      &s_job->cb)) {
>  			dma_fence_put(s_job->s_fence->parent);
>  			s_job->s_fence->parent = NULL;
> -			atomic_dec(&sched->hw_rq_count);
> +			atomic_sub(s_job->submission_credits,
> +				   &sched->submission_count);
>  		} else {
>  			/*
>  			 * remove job from pending_list.
> @@ -683,7 +730,7 @@ void drm_sched_start(struct drm_gpu_scheduler *sched, bool full_recovery)
>  	list_for_each_entry_safe(s_job, tmp, &sched->pending_list, list) {
>  		struct dma_fence *fence = s_job->s_fence->parent;
>  
> -		atomic_inc(&sched->hw_rq_count);
> +		atomic_add(s_job->submission_credits, &sched->submission_count);
>  
>  		if (!full_recovery)
>  			continue;
> @@ -764,6 +811,8 @@ EXPORT_SYMBOL(drm_sched_resubmit_jobs);
>   * drm_sched_job_init - init a scheduler job
>   * @job: scheduler job to init
>   * @entity: scheduler entity to use
> + * @submission_credits: the number of credits this job contributes to the
> + * schdulers submission limit

Spelling: "schedulers"!

Please run your patch through scripts/checkpatch.pl --strict and inspect what it says.

>   * @owner: job owner for debugging
>   *
>   * Refer to drm_sched_entity_push_job() documentation
> @@ -781,6 +830,7 @@ EXPORT_SYMBOL(drm_sched_resubmit_jobs);
>   */
>  int drm_sched_job_init(struct drm_sched_job *job,
>  		       struct drm_sched_entity *entity,
> +		       u32 submission_credits,
>  		       void *owner)
>  {
>  	if (!entity->rq && !entity->single_sched)
> @@ -792,6 +842,7 @@ int drm_sched_job_init(struct drm_sched_job *job,
>  		return -ENOMEM;
>  
>  	INIT_LIST_HEAD(&job->list);
> +	job->submission_credits = submission_credits ? submission_credits : 1;
>  
>  	xa_init_flags(&job->dependencies, XA_FLAGS_ALLOC);
>  
> @@ -1004,12 +1055,14 @@ EXPORT_SYMBOL(drm_sched_job_cleanup);
>  /**
>   * drm_sched_wakeup_if_can_queue - Wake up the scheduler
>   * @sched: scheduler instance
> + * @entity: the scheduler entity
>   *
>   * Wake up the scheduler if we can queue jobs.
>   */
> -void drm_sched_wakeup_if_can_queue(struct drm_gpu_scheduler *sched)
> +void drm_sched_wakeup_if_can_queue(struct drm_gpu_scheduler *sched,
> +				   struct drm_sched_entity *entity)
>  {
> -	if (drm_sched_can_queue(sched))
> +	if (drm_sched_can_queue(sched, entity))
>  		drm_sched_run_job_queue(sched);
>  }
>  
> @@ -1147,7 +1200,7 @@ static void drm_sched_run_job_work(struct work_struct *w)
>  
>  	s_fence = sched_job->s_fence;
>  
> -	atomic_inc(&sched->hw_rq_count);
> +	atomic_add(sched_job->submission_credits, &sched->submission_count);
>  	drm_sched_job_begin(sched_job);
>  
>  	trace_drm_run_job(sched_job, entity);
> @@ -1183,7 +1236,7 @@ static void drm_sched_run_job_work(struct work_struct *w)
>   * @ops: backend operations for this scheduler
>   * @submit_wq: workqueue to use for submission. If NULL, an ordered wq is
>   *	       allocated and used
> - * @hw_submission: number of hw submissions that can be in flight
> + * @max_submission_credits: number of submission credits that can be in flight

Let's not use "in flight". Perhaps it is better to say,

 * @max_submission_credits: number of submission credits this scheduler can hold
 *                          from all jobs,

>   * @hang_limit: number of times to allow a job to hang before dropping it
>   * @timeout: timeout value in jiffies for the scheduler
>   * @timeout_wq: workqueue to use for timeout work. If NULL, the system_wq is
> @@ -1198,7 +1251,7 @@ static void drm_sched_run_job_work(struct work_struct *w)
>  int drm_sched_init(struct drm_gpu_scheduler *sched,
>  		   const struct drm_sched_backend_ops *ops,
>  		   struct workqueue_struct *submit_wq,
> -		   unsigned hw_submission, unsigned hang_limit,
> +		   unsigned max_submission_credits, unsigned hang_limit,
>  		   long timeout, struct workqueue_struct *timeout_wq,
>  		   atomic_t *score, const char *name,
>  		   enum drm_sched_policy sched_policy,
> @@ -1211,7 +1264,7 @@ int drm_sched_init(struct drm_gpu_scheduler *sched,
>  
>  	sched->ops = ops;
>  	sched->single_entity = NULL;
> -	sched->hw_submission_limit = hw_submission;
> +	sched->submission_limit = max_submission_credits;
>  	sched->name = name;
>  	if (!submit_wq) {
>  		sched->submit_wq = alloc_ordered_workqueue(name, 0);
> @@ -1238,7 +1291,7 @@ int drm_sched_init(struct drm_gpu_scheduler *sched,
>  	init_waitqueue_head(&sched->job_scheduled);
>  	INIT_LIST_HEAD(&sched->pending_list);
>  	spin_lock_init(&sched->job_list_lock);
> -	atomic_set(&sched->hw_rq_count, 0);
> +	atomic_set(&sched->submission_count, 0);
>  	INIT_DELAYED_WORK(&sched->work_tdr, drm_sched_job_timedout);
>  	INIT_WORK(&sched->work_run_job, drm_sched_run_job_work);
>  	INIT_WORK(&sched->work_free_job, drm_sched_free_job_work);
> diff --git a/drivers/gpu/drm/v3d/v3d_gem.c b/drivers/gpu/drm/v3d/v3d_gem.c
> index 2e94ce788c71..8479e5302f7b 100644
> --- a/drivers/gpu/drm/v3d/v3d_gem.c
> +++ b/drivers/gpu/drm/v3d/v3d_gem.c
> @@ -417,7 +417,7 @@ v3d_job_init(struct v3d_dev *v3d, struct drm_file *file_priv,
>  	job->free = free;
>  
>  	ret = drm_sched_job_init(&job->base, &v3d_priv->sched_entity[queue],
> -				 v3d_priv);
> +				 1, v3d_priv);
>  	if (ret)
>  		goto fail;
>  
> diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
> index 27f5778bbd6d..c4a53b259585 100644
> --- a/include/drm/gpu_scheduler.h
> +++ b/include/drm/gpu_scheduler.h
> @@ -329,6 +329,8 @@ struct drm_sched_fence *to_drm_sched_fence(struct dma_fence *f);
>   * @sched: the scheduler instance on which this job is scheduled.
>   * @s_fence: contains the fences for the scheduling of job.
>   * @finish_cb: the callback for the finished fence.
> + * @submission_credits: the number of submission credits this job contributes to
> + *                      the scheduler
>   * @work: Helper to reschdeule job kill to different context.
>   * @id: a unique id assigned to each job scheduled on the scheduler.
>   * @karma: increment on every hang caused by this job. If this exceeds the hang
> @@ -348,6 +350,8 @@ struct drm_sched_job {
>  	struct drm_gpu_scheduler	*sched;
>  	struct drm_sched_fence		*s_fence;
>  
> +	u32				submission_credits;
> +
>  	/*
>  	 * work is used only after finish_cb has been used and will not be
>  	 * accessed anymore.
> @@ -471,6 +475,21 @@ struct drm_sched_backend_ops {
>           * and it's time to clean it up.
>  	 */
>  	void (*free_job)(struct drm_sched_job *sched_job);
> +
> +	/**
> +	 * @update_job_credits: Called once the scheduler is considering this
> +	 * job for execution.
> +	 *
> +	 * Drivers may use this to update the job's submission credits, which is
> +	 * useful to e.g. deduct the number of native fences which have been
> +	 * signaled meanwhile.
> +	 *
> +	 * The callback must either return the new number of submission credits
> +	 * for the given job, or zero if no update is required.
> +	 *
> +	 * This callback is optional.
> +	 */
> +	u32 (*update_job_credits)(struct drm_sched_job *sched_job);
>  };

That's good.

>  
>  /**
> @@ -478,14 +497,14 @@ struct drm_sched_backend_ops {
>   *
>   * @ops: backend operations provided by the driver.
>   * @single_entity: Single entity for the scheduler
> - * @hw_submission_limit: the max size of the hardware queue.
> + * @submission_limit: the maximim number of submission credits
> + * @submission_count: the number of submission credits in flight

Is this clear enough?

I mean, what really is a "submission_limit"? What is it limiting really?
Number of what? "Submissions"? No. It's credits.

("Submission" seems to have become very popular, see
 Message-ID: <a39eb381-4f2b-439b-b223-c5148167b225@amd.com>, maybe through Lore.)

So if "submission_credit_limit" and "submission_credit_count"
seem too wordy, (and they kind of are), then perhaps use,

	@credit_limit: the credit limit of this scheduler
	@credit_count: the current credit count of this scheduler

Also note the slight comment update for those two quantities.

>   * @timeout: the time after which a job is removed from the scheduler.
>   * @name: name of the ring for which this scheduler is being used.
>   * @sched_rq: priority wise array of run queues.
>   * @job_scheduled: once @drm_sched_entity_do_release is called the scheduler
>   *                 waits on this wait queue until all the scheduled jobs are
>   *                 finished.
> - * @hw_rq_count: the number of jobs currently in the hardware queue.
>   * @job_id_count: used to assign unique id to the each job.
>   * @submit_wq: workqueue used to queue @work_run_job and @work_free_job
>   * @timeout_wq: workqueue used to queue @work_tdr
> @@ -511,12 +530,12 @@ struct drm_sched_backend_ops {
>  struct drm_gpu_scheduler {
>  	const struct drm_sched_backend_ops	*ops;
>  	struct drm_sched_entity		*single_entity;
> -	uint32_t			hw_submission_limit;
> +	u32				submission_limit;
> +	atomic_t			submission_count;

See above. Perhaps "credit_limit" and "credit_count".

>  	long				timeout;
>  	const char			*name;
>  	struct drm_sched_rq		sched_rq[DRM_SCHED_PRIORITY_COUNT];
>  	wait_queue_head_t		job_scheduled;
> -	atomic_t			hw_rq_count;
>  	atomic64_t			job_id_count;
>  	struct workqueue_struct		*submit_wq;
>  	struct workqueue_struct		*timeout_wq;
> @@ -539,7 +558,7 @@ struct drm_gpu_scheduler {
>  int drm_sched_init(struct drm_gpu_scheduler *sched,
>  		   const struct drm_sched_backend_ops *ops,
>  		   struct workqueue_struct *submit_wq,
> -		   uint32_t hw_submission, unsigned hang_limit,
> +		   uint32_t max_submission_credits, unsigned hang_limit,
>  		   long timeout, struct workqueue_struct *timeout_wq,
>  		   atomic_t *score, const char *name,
>  		   enum drm_sched_policy sched_policy,
> @@ -548,6 +567,7 @@ int drm_sched_init(struct drm_gpu_scheduler *sched,
>  void drm_sched_fini(struct drm_gpu_scheduler *sched);
>  int drm_sched_job_init(struct drm_sched_job *job,
>  		       struct drm_sched_entity *entity,
> +		       u32 submission_credits,
>  		       void *owner);
>  void drm_sched_job_arm(struct drm_sched_job *job);
>  int drm_sched_job_add_dependency(struct drm_sched_job *job,
> @@ -570,7 +590,8 @@ void drm_sched_entity_modify_sched(struct drm_sched_entity *entity,
>  
>  void drm_sched_tdr_queue_imm(struct drm_gpu_scheduler *sched);
>  void drm_sched_job_cleanup(struct drm_sched_job *job);
> -void drm_sched_wakeup_if_can_queue(struct drm_gpu_scheduler *sched);
> +void drm_sched_wakeup_if_can_queue(struct drm_gpu_scheduler *sched,
> +				   struct drm_sched_entity *entity);
>  bool drm_sched_submit_ready(struct drm_gpu_scheduler *sched);
>  void drm_sched_submit_stop(struct drm_gpu_scheduler *sched);
>  void drm_sched_submit_start(struct drm_gpu_scheduler *sched);

-- 
Regards,
Luben

