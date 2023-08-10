Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A1378777075
	for <lists+dri-devel@lfdr.de>; Thu, 10 Aug 2023 08:34:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 620B510E4BC;
	Thu, 10 Aug 2023 06:34:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2075.outbound.protection.outlook.com [40.107.92.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A283B10E4B9;
 Thu, 10 Aug 2023 06:34:12 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UlTM8jvp0iPJwLGvmNH8GIa2DLgyQb7yNka/+M5h6YBQ/KhVS9F0YTj4BTY1UJF9tLF3ESmVqybDp7fJIW82FWayten3zcxe0IPlYwcqVp+/ihLz6m7e7ljcsJKTTKErMX5hNMXC6oAce84/5RMjayE3+mULuG47lCIWqsRxt48HymWLtQc2Dp9w/Cz0NEDMRAl8jO1LnI5FxYPCXliVu3T50hxqV9nT9JFzjUFOf9BVI5EFUGzURmlzRcaWwAuh7r77YI8tqjK/W6KUzuRot7uW27mOUj7Y2yCYVJp7K8SptQcU1Sryo1RT8tqTgI5is4Q4eLQ3C6HV1y8W77arVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ttRN3M2f07ymSUrVHZsbcFHrLQ0d/J3joWdusQPH6Uk=;
 b=H/SlFh4oqV4F4X3rHqeEbKi56vkPfKm1RiQV95Hh0PmmQC7/ZfGcT0ZKuBxbdjmJBw6cXwZzCCyUjEbTq+FrUMZZROXdOJS9gACVikIC1dPYDjMgXbVEpP9rVvF9mFjV702hUSjk5hXOfKKbhc6tgBasgF5Ftg8HI46+BRB1WBDY6faAHXFoFty8EFmaqiFuwDsavOZRiLpkv03+9ks++zmmnHsYc/0iOKQNW+Vy2jmJC2EyKDqfpWViDYhYa2gmiz2JrJTeeHoI1bWwEgRewNV2QeofbEXSbvcuvnChRfr8E1J09nDPAF5FAXBiJuA/qUFZbZki2oet886fWHj4xw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ttRN3M2f07ymSUrVHZsbcFHrLQ0d/J3joWdusQPH6Uk=;
 b=f8e/A1oXBdati9KfvkQ6x3XxsvbfGcOpjXtesjaIumYSvYJ6h1NEKIkSreHg2GXWUia4859V3fMdCNPr+MFjB7FMMu2BxiY6PEPrz9buKMIHVVDK5sm8BWREpvHJuXd7Dn6RNF7KKq9g1mUQDsBpe30S/iy8+FgbMGgpOg5qke0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by CH3PR12MB7738.namprd12.prod.outlook.com (2603:10b6:610:14e::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.30; Thu, 10 Aug
 2023 06:34:09 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::3d:c14:667a:1c81]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::3d:c14:667a:1c81%4]) with mapi id 15.20.6652.028; Thu, 10 Aug 2023
 06:34:09 +0000
Message-ID: <2bd0714d-ecc0-8ebd-3300-ff66fdfecac0@amd.com>
Date: Thu, 10 Aug 2023 08:34:03 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH drm-misc-next] drm/sched: support multiple rings per
 gpu_scheduler
Content-Language: en-US
To: Danilo Krummrich <dakr@redhat.com>, airlied@gmail.com, daniel@ffwll.ch,
 luben.tuikov@amd.com, matthew.brost@intel.com,
 thomas.hellstrom@linux.intel.com, robdclark@chromium.org,
 sarah.walker@imgtec.com, ketil.johnsen@arm.com, Liviu.Dudau@arm.com,
 lina@asahilina.net, donald.robson@imgtec.com, boris.brezillon@collabora.com,
 faith.ekstrand@collabora.com, bskeggs@redhat.com
References: <20230809221729.3657-1-dakr@redhat.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <20230809221729.3657-1-dakr@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0184.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ab::7) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR12MB3587:EE_|CH3PR12MB7738:EE_
X-MS-Office365-Filtering-Correlation-Id: 2ee9f3ad-8127-4b38-499f-08db996bcdab
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 5CgiMrAbWnlpD3Mt+suRoDZkW0IK/oUpCLQUe9Ro6zAIbzIRwieQKjpnOcRhy29/WWk80GWyEoXjJEwyCRwIqJl1uPS+twU20pNrQvtvbP1iTlNWfrJ+yi5rVk6E3TEWjNqzjCFtThszuZIlU9/mK9Ib+/EunCDYDYsWZ+Lwlvd+l4553lArWq4uKItu1tfmi34J3FQPdESCgNCrP8SY21b5QCzh29Hw9yIYFJJC1oXbJHhDOa79mXTtE4LzKOaLb94DOBYaBPeBacHtpNrp6bP4PYor2eZpM7DFbKxJ8mFFMqEObBJR1gwQNndPHubGm28DQ8ykPdqK1c/f4ULdaaveQ44W8JaVnHL3n2kEr8uUZTObHjU9ot6QrpVllrb6z6OT+L9FebgVLmOxmCrYPHTq8YzOiwQUQgtfyeUkLPMrjGkjPH3ifHr/1TKxohv0Ybh5jVaefX4dNJo/Xb/j8AOs5C0oXnQdglMbq/73NS+23RMTfgtW81aSk5nuJJeQRyJdabH+E3//Q2xK7jqRh9pcDVu/uR9fFhfsL/wWAqWqDAJIMnOQz/TBFXqQjbK+3r6aZJgfu9Ppq7V+yfP+X+1J/yZg7BdhgiQGCxQ3kcQvVPMn+/meujsCCYAARJocJqVrd8spO/Ul70AXDa90QdMF8Sx/TWPAQHqfWP8WshQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(366004)(136003)(376002)(39860400002)(346002)(396003)(1800799006)(186006)(451199021)(5660300002)(30864003)(83380400001)(66556008)(41300700001)(66476007)(66946007)(6512007)(966005)(6506007)(4326008)(8676002)(31686004)(7416002)(8936002)(2906002)(2616005)(478600001)(86362001)(921005)(31696002)(36756003)(6666004)(6486002)(316002)(38100700002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?M0c4T1hsZUIzcmoxTG1TNHREdlVzMWZvREtYRDFGSEoyb3o2Qy93bUZKV3JZ?=
 =?utf-8?B?cWgyS1VyRVR2bXZjbjUvMHVKSnNsa3phaDFUcWcxS0U2M1p3YmtpNW9xc0RF?=
 =?utf-8?B?RXQ4VmRWTWRYam1GNWNVUXR0cG5QVzlsUEl4dk0zN2JNdTlTWDN2dW13T3ZL?=
 =?utf-8?B?VklKZ0s3L2tGS042OFVZaldYbHRDRUxSQ0VacVVvSG5jS3l3M29QT3ZKMDZJ?=
 =?utf-8?B?SGgvTzFzMGZ1VGZLeHN5QUtpRGovOXZvOFpINHVySU9qcDVHMG9zMWJSRmtv?=
 =?utf-8?B?VW9jcTVSK012OE10a3lxekdhTzU4OU1ZRnZDUXVKNjhBbVVIRnM2WU5FcmlJ?=
 =?utf-8?B?ck1UTWNQck4wSVZ1R3hHdHl2ck94c09naUNyOE9ZQjhMUHYwNUlnQ0ZvakxV?=
 =?utf-8?B?WXF0MVd5bDhmSTZ2MXg2c1lpQ2dmUnZJbkM2VmZCOFY2YmNoVXlMdzkrdVV3?=
 =?utf-8?B?dEVBcXdFSU96WFFadm9jTHFaV0M1bURRZkR4SVZXR2FwYnQ1R3l0YU1aUGpD?=
 =?utf-8?B?Mk1jWU1uT1pUd1c2ZW81MDVEWlUzN0VvTDYxSzZJdGlkeWFjVW9QcDhQNTd4?=
 =?utf-8?B?SGZnWDdWNGIzbTJMRm9MMWJDVFRrZHdqSGhkT1lIbEprbmxKU1U4RWZ6MVdj?=
 =?utf-8?B?MkdQWnA3dEVCSDRwVXZnbTkxNXJKNzIwWHJKdVo4Um5ndWJsK3NtSDBDZXBu?=
 =?utf-8?B?eWRoQXBiRnptaUUzanhzbW8xcEZrcWY5a3NXeWdCbkZScmFJbXZKN3JScFUy?=
 =?utf-8?B?RU80M1R0d09XSUtTRHVrZDN3QWFFeTk4M0VnZmZTWnBvTmI4RHFjQW01OXYz?=
 =?utf-8?B?bmY3SDVXVklmeVkzTyszOStFT3ZNZ1BxUkJPc2JoZ1lvNFF2Q1V5c25USi9k?=
 =?utf-8?B?cTFwYUtoV0ViQUE0MjNIMmlkOVFWM1FHNTVmbUZ2RVRVZTBHV2JKNk5Gcm5L?=
 =?utf-8?B?RWp6anJvZHkwODV0amVHdGM2UUpjc0cvK01SbWZJVGNRYkcyZ2lKcnFaYmZ2?=
 =?utf-8?B?TFJpZjh0VzJkbDdzSXhxRTBqM3AwYVRHVEZKNzVJVzRxTzBaS2x5S1M0bCtC?=
 =?utf-8?B?cEFpYk53NGhndVd2clI4ZkhtOExyeGQ4Z3QycmtBZFU0bTlKZC9ZY2dCb25D?=
 =?utf-8?B?MTdGZVhiYmlFa1MraHZlVFZFb3FRVDZFaVUxeC9ram5TYmhoWVlIdDhRZkMx?=
 =?utf-8?B?T2ZPclpqVlRWLzZMcCtlb0hwK1ZQbnRlZ3g0UHgvclNQc2dMUEV5d3FQWStW?=
 =?utf-8?B?VWN1UUxzQjJtT2g2MndWUERWeTVXRTdvbmk5bVdqSTJlWnZBZVZYeE5RMlE4?=
 =?utf-8?B?OE1CbXJtc2czRG1SQTVLTWZkTzhkdjlPNTB5WVlKcFFaTllKc01TdHVvU2NI?=
 =?utf-8?B?ZmZsblpVVzQ4L0NxNzRlYnpIZXhrQWtxM3FuYmdHRDZDTnpEY1pocGdaM1E5?=
 =?utf-8?B?eFdsQWVyeWxIMUZQM0hORHoydUY4T05UMThDSVpWMkJaN09VcDlnQkhHVVM3?=
 =?utf-8?B?aEpEY1UrbUt3cFhkdjNEdXovRVU1VVVGSmRVNlZVUzVEWGpqeUZCaElRdmU2?=
 =?utf-8?B?L0padUM4a01WR3AwU2JZWDV3dlo3MzY1NFJSZ254STJmVE85SDhQeXFCelo1?=
 =?utf-8?B?TjI0d0I0L2hpZm85blVFc3hVYStTNys2dGJYRkw1d3NCZGhLcVB1REtBRHpv?=
 =?utf-8?B?dWZyWU9uSGJPcHBZcXRERXk3cVJRNFNZZngzb1o3MTcyYnRrN3pQSXNlbEJx?=
 =?utf-8?B?YTlvWDJpWXlxb1FwQUVLZFZTL1lMdW1SbWk5dVN6RER3M2tpNWtSSVM1VWpR?=
 =?utf-8?B?NEpETFdJV0NqNWc2UzQyK2pGTUplM0JZQWVoazZhaEl4d2xtYk9mVmpPTjZ3?=
 =?utf-8?B?dGdQT0pjaStSeU1PZTVYb0VROU15VkZTM2JTdHRxWTVYUHhGellRaUtmS3FH?=
 =?utf-8?B?cVNNMThITkM5Wk1jYjV5UEJIVHZlVU9hWk5YZmJBeUkvaHNYa3loWnp6V3Jw?=
 =?utf-8?B?M3dNZ05TRnF3VnREeDIvUU1lQWpzZEV4Q0NrVWpzNjNKYjNzcjdSZVJiNVhi?=
 =?utf-8?B?ZU5yZE1XYVVkSHc3eXVIZTlFQzlsd3JNVXkwYkdPeHJQanlHMWVjcU1XQVlF?=
 =?utf-8?B?RGRjdGkxa25LaVArWGhTN3Zmc0t1bmRCMVR5d3hleGNZVCtlZ2NibjlPZGdL?=
 =?utf-8?Q?0ajdPMvwptlfRMRKSIPEJe5gkxB6I7l313/k4tfEAUEj?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2ee9f3ad-8127-4b38-499f-08db996bcdab
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Aug 2023 06:34:09.5548 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4h+PFogLUpQDmF/MIwhzyCrWifV9lmgwRHzoGVjF2H/KnU7+sNUfpI5G0lrlar51
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB7738
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
Cc: nouveau@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 10.08.23 um 00:17 schrieb Danilo Krummrich:
> With the current mental model every GPU scheduler instance represents
> a single HW ring, while every entity represents a software queue feeding
> into one or multiple GPU scheduler instances and hence into one or
> multiple HW rings.
>
> This does not really scale with firmware schedulers feeding the actual
> HW rings, while the driver feeds the firmware scheduler through an
> arbitrary amount of dynamically created rings, since for each of those
> rings a GPU scheduler instance would be required and a separate kthread
> would be created.
>
> To overcome this we can think of the scheduler having two modes of
> operation, single ring mode and multi ring mode. Depending on the mode
> of operation, the mental model differs.
>
> Single ring mode (which is the default) keeps the original behaviour of
> the scheduler and its entities.
>
> In multi ring mode (enabled by passing the GPU scheduler the
> DRM_GPU_SCHEDULER_MODE_MULTI_RING flag) each entity represents a ring,
> while the GPU scheduler itself only exists to sort out job dependencies
> and actually process the jobs of each entity.
>
> By just applying this different mental model, the required code change
> is pretty minimalistic: While in single ring mode, if a job depends on a
> dma-fence from the same scheduler instance we only wait for the
> dependency to be scheduled (sched_fence->scheduled), in multi ring mode
> we fall through and just wait for the dependency to fully complete
> (sched_fence->finished) in order to avoid races between separate rings.
> Or in other words, to pick up the schedulers existing terminology,
> prevent dependency pipelining.
>
> Signed-off-by: Danilo Krummrich <dakr@redhat.com>
> ---
> Just before sending out this patch I was made aware of the "DRM Scheduler
> changes for XE" [1] patch series.
>
> However, I think bringing this alternative approach into discussion could
> be useful.
>
>  From a first glance it looks like that both approaches semantically aim for
> the same goal, namely addressing firmware schedulers with arbitrary amounts
> of software rings to feed from the driver side.
>
> The "XE approach" for that seems to be to make GPU scheduler instances
> scalable by submitting jobs to a workqueue rather than creating a kthread
> per scheduler instance, such that per software ring a scheduler instance can
> be created. Hence the definition of a 1:1 relationship between scheduler and
> entity.
>
> In Nouveau we approached it differently, such that we have just one GPU
> scheduler per driver instance, while software rings are represented as
> entities. As explained in the commit message, this seems to work fine, as
> long as we can teach the scheduler to prevent dependency pipelining.
>
> As a hack this basically already works without this patch by just setting the
> DRM_SCHED_FENCE_DONT_PIPELINE flag for all out-fences.

I discussed that with other AMD folks on some internal meeting when the 
first Xe changes came up, but quickly abandoned it.

The scheduler depends on the sequential execution of submissions, 
otherwise we can't guarantee the sequential signaling of scheduler 
fences and this in turn is a really big NO-GO for dma_fences.

You avoid most of the problems by setting the 
DRM_SCHED_FENCE_DONT_PIPELINE flag, but this is still something very flaky.

Additional to that essentially the scheduler would still only push a 
limited number of submissions to the hw rings which makes the hardware 
scheduler pretty much useless.

Christian.

>
> [1] https://lore.kernel.org/intel-xe/20230801205103.627779-1-matthew.brost@intel.com/T/#t
> ---
>   drivers/gpu/drm/amd/amdgpu/amdgpu_device.c |  2 +-
>   drivers/gpu/drm/etnaviv/etnaviv_sched.c    |  2 +-
>   drivers/gpu/drm/lima/lima_sched.c          |  2 +-
>   drivers/gpu/drm/msm/msm_ringbuffer.c       |  2 +-
>   drivers/gpu/drm/nouveau/nouveau_sched.c    |  7 +--
>   drivers/gpu/drm/panfrost/panfrost_job.c    |  2 +-
>   drivers/gpu/drm/scheduler/sched_entity.c   |  3 +-
>   drivers/gpu/drm/scheduler/sched_main.c     | 55 +++++++++++++++-------
>   drivers/gpu/drm/v3d/v3d_sched.c            | 10 ++--
>   include/drm/gpu_scheduler.h                | 18 ++++++-
>   10 files changed, 72 insertions(+), 31 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> index a2cdde0ca0a7..eed6f56e3957 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> @@ -2491,7 +2491,7 @@ static int amdgpu_device_init_schedulers(struct amdgpu_device *adev)
>   			break;
>   		}
>   
> -		r = drm_sched_init(&ring->sched, &amdgpu_sched_ops,
> +		r = drm_sched_init(&ring->sched, 0, &amdgpu_sched_ops,
>   				   ring->num_hw_submission, 0,
>   				   timeout, adev->reset_domain->wq,
>   				   ring->sched_score, ring->name,
> diff --git a/drivers/gpu/drm/etnaviv/etnaviv_sched.c b/drivers/gpu/drm/etnaviv/etnaviv_sched.c
> index 1ae87dfd19c4..bfe761316ba9 100644
> --- a/drivers/gpu/drm/etnaviv/etnaviv_sched.c
> +++ b/drivers/gpu/drm/etnaviv/etnaviv_sched.c
> @@ -133,7 +133,7 @@ int etnaviv_sched_init(struct etnaviv_gpu *gpu)
>   {
>   	int ret;
>   
> -	ret = drm_sched_init(&gpu->sched, &etnaviv_sched_ops,
> +	ret = drm_sched_init(&gpu->sched, 0, &etnaviv_sched_ops,
>   			     etnaviv_hw_jobs_limit, etnaviv_job_hang_limit,
>   			     msecs_to_jiffies(500), NULL, NULL,
>   			     dev_name(gpu->dev), gpu->dev);
> diff --git a/drivers/gpu/drm/lima/lima_sched.c b/drivers/gpu/drm/lima/lima_sched.c
> index ffd91a5ee299..f559d7de5658 100644
> --- a/drivers/gpu/drm/lima/lima_sched.c
> +++ b/drivers/gpu/drm/lima/lima_sched.c
> @@ -488,7 +488,7 @@ int lima_sched_pipe_init(struct lima_sched_pipe *pipe, const char *name)
>   
>   	INIT_WORK(&pipe->recover_work, lima_sched_recover_work);
>   
> -	return drm_sched_init(&pipe->base, &lima_sched_ops, 1,
> +	return drm_sched_init(&pipe->base, 0, &lima_sched_ops, 1,
>   			      lima_job_hang_limit,
>   			      msecs_to_jiffies(timeout), NULL,
>   			      NULL, name, pipe->ldev->dev);
> diff --git a/drivers/gpu/drm/msm/msm_ringbuffer.c b/drivers/gpu/drm/msm/msm_ringbuffer.c
> index b60199184409..79fb8c96465d 100644
> --- a/drivers/gpu/drm/msm/msm_ringbuffer.c
> +++ b/drivers/gpu/drm/msm/msm_ringbuffer.c
> @@ -93,7 +93,7 @@ struct msm_ringbuffer *msm_ringbuffer_new(struct msm_gpu *gpu, int id,
>   	 /* currently managing hangcheck ourselves: */
>   	sched_timeout = MAX_SCHEDULE_TIMEOUT;
>   
> -	ret = drm_sched_init(&ring->sched, &msm_sched_ops,
> +	ret = drm_sched_init(&ring->sched, 0, &msm_sched_ops,
>   			num_hw_submissions, 0, sched_timeout,
>   			NULL, NULL, to_msm_bo(ring->bo)->name, gpu->dev->dev);
>   	if (ret) {
> diff --git a/drivers/gpu/drm/nouveau/nouveau_sched.c b/drivers/gpu/drm/nouveau/nouveau_sched.c
> index 3424a1bf6af3..6528c09fffc9 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_sched.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_sched.c
> @@ -407,9 +407,10 @@ int nouveau_sched_init(struct nouveau_drm *drm)
>   	if (!drm->sched_wq)
>   		return -ENOMEM;
>   
> -	return drm_sched_init(sched, &nouveau_sched_ops,
> -			      NOUVEAU_SCHED_HW_SUBMISSIONS, 0, job_hang_limit,
> -			      NULL, NULL, "nouveau_sched", drm->dev->dev);
> +	return drm_sched_init(sched, DRM_GPU_SCHEDULER_MODE_MULTI_RING,
> +			      &nouveau_sched_ops, NOUVEAU_SCHED_HW_SUBMISSIONS,
> +			      0, job_hang_limit, NULL, NULL, "nouveau_sched",
> +			      drm->dev->dev);
>   }
>   
>   void nouveau_sched_fini(struct nouveau_drm *drm)
> diff --git a/drivers/gpu/drm/panfrost/panfrost_job.c b/drivers/gpu/drm/panfrost/panfrost_job.c
> index dbc597ab46fb..dbbabf63f08f 100644
> --- a/drivers/gpu/drm/panfrost/panfrost_job.c
> +++ b/drivers/gpu/drm/panfrost/panfrost_job.c
> @@ -814,7 +814,7 @@ int panfrost_job_init(struct panfrost_device *pfdev)
>   	for (j = 0; j < NUM_JOB_SLOTS; j++) {
>   		js->queue[j].fence_context = dma_fence_context_alloc(1);
>   
> -		ret = drm_sched_init(&js->queue[j].sched,
> +		ret = drm_sched_init(&js->queue[j].sched, 0,
>   				     &panfrost_sched_ops,
>   				     nentries, 0,
>   				     msecs_to_jiffies(JOB_TIMEOUT_MS),
> diff --git a/drivers/gpu/drm/scheduler/sched_entity.c b/drivers/gpu/drm/scheduler/sched_entity.c
> index a42763e1429d..6d1e11e6bdcd 100644
> --- a/drivers/gpu/drm/scheduler/sched_entity.c
> +++ b/drivers/gpu/drm/scheduler/sched_entity.c
> @@ -401,7 +401,8 @@ static bool drm_sched_entity_add_dependency_cb(struct drm_sched_entity *entity)
>   
>   	s_fence = to_drm_sched_fence(fence);
>   	if (!fence->error && s_fence && s_fence->sched == sched &&
> -	    !test_bit(DRM_SCHED_FENCE_DONT_PIPELINE, &fence->flags)) {
> +	    !test_bit(DRM_SCHED_FENCE_DONT_PIPELINE, &fence->flags) &&
> +	    !(sched->flags & DRM_GPU_SCHEDULER_MODE_MULTI_RING)) {
>   
>   		/*
>   		 * Fence is from the same scheduler, only need to wait for
> diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
> index 506371c42745..0c432c1dafdf 100644
> --- a/drivers/gpu/drm/scheduler/sched_main.c
> +++ b/drivers/gpu/drm/scheduler/sched_main.c
> @@ -24,28 +24,50 @@
>   /**
>    * DOC: Overview
>    *
> - * The GPU scheduler provides entities which allow userspace to push jobs
> - * into software queues which are then scheduled on a hardware run queue.
> - * The software queues have a priority among them. The scheduler selects the entities
> - * from the run queue using a FIFO. The scheduler provides dependency handling
> - * features among jobs. The driver is supposed to provide callback functions for
> - * backend operations to the scheduler like submitting a job to hardware run queue,
> - * returning the dependencies of a job etc.
> + * The GPU scheduler is mainly structured into the scheduler itself
> + * (&drm_gpu_scheduler), scheduler entities (&drm_sched_entity) and scheduler
> + * jobs (&drm_sched_job).
>    *
> - * The organisation of the scheduler is the following:
> + * Each &drm_gpu_scheduler has different priority run queues (e.g. HIGH_HW,
> + * HIGH_SW, KERNEL, NORMAL), which themselfs contain a list of &drm_sched_entity
> + * objects, while each &drm_sched_entity maintains a queue of &drm_sched_jobs.
>    *
> - * 1. Each hw run queue has one scheduler
> - * 2. Each scheduler has multiple run queues with different priorities
> - *    (e.g., HIGH_HW,HIGH_SW, KERNEL, NORMAL)
> - * 3. Each scheduler run queue has a queue of entities to schedule
> - * 4. Entities themselves maintain a queue of jobs that will be scheduled on
> - *    the hardware.
> + * There are two modes of operation, single ring mode and multi ring mode.
> + * Depending on the mode of operation, the mental model of what the named
> + * structures represent differs.
>    *
> - * The jobs in a entity are always scheduled in the order that they were pushed.
> + * In single ring mode (which is the default) every &drm_gpu_scheduler
> + * instance represents a single HW ring, while every &drm_sched_entity
> + * represents a software queue feeding into one or multiple &drm_gpu_scheduler
> + * instances and hence into one or multiple HW rings.
> + *
> + * Single ring mode may be used when the GPU has a fixed amount of HW rings
> + * which can be directly fed by the driver.
> + *
> + * In multi ring mode (enabled by passing the &drm_gpu_scheduler the
> + * &DRM_GPU_SCHEDULER_MODE_MULTI_RING flag) each &drm_sched_entity represents a
> + * HW ring, while the &drm_gpu_scheduler itself only exists to sort out job
> + * dependencies and actually process the jobs of each &drm_sched_entity.
> + *
> + * Multi ring mode may be used when the GPU has a firmware scheduler feeding the
> + * actual HW rings, while the driver feeds the firmware scheduler through an
> + * arbitrary amount of dynamically created rings.
> + *
> + * While one or the other mental model could be applied without setting the ring
> + * mode through a flag, the scheduler needs to know the mode of operation in
> + * order to be able to make correct decitions when it comes to handling job
> + * dependencies.
> + *
> + * Independent of the mode of operation jobs within an entity are always
> + * scheduled in the order in which they were submitted.
>    *
>    * Note that once a job was taken from the entities queue and pushed to the
>    * hardware, i.e. the pending queue, the entity must not be referenced anymore
>    * through the jobs entity pointer.
> + *
> + * In order for the scheduler to actually prepare, process or free a job once it
> + * is completed, the driver is supposed to provide the corresponding callback
> + * functions (&drm_sched_backend_ops) to the scheduler.
>    */
>   
>   #include <linux/kthread.h>
> @@ -1082,7 +1104,7 @@ static int drm_sched_main(void *param)
>    *
>    * Return 0 on success, otherwise error code.
>    */
> -int drm_sched_init(struct drm_gpu_scheduler *sched,
> +int drm_sched_init(struct drm_gpu_scheduler *sched, unsigned int flags,
>   		   const struct drm_sched_backend_ops *ops,
>   		   unsigned hw_submission, unsigned hang_limit,
>   		   long timeout, struct workqueue_struct *timeout_wq,
> @@ -1097,6 +1119,7 @@ int drm_sched_init(struct drm_gpu_scheduler *sched,
>   	sched->hang_limit = hang_limit;
>   	sched->score = score ? score : &sched->_score;
>   	sched->dev = dev;
> +	sched->flags = flags;
>   	for (i = DRM_SCHED_PRIORITY_MIN; i < DRM_SCHED_PRIORITY_COUNT; i++)
>   		drm_sched_rq_init(sched, &sched->sched_rq[i]);
>   
> diff --git a/drivers/gpu/drm/v3d/v3d_sched.c b/drivers/gpu/drm/v3d/v3d_sched.c
> index 06238e6d7f5c..4ba561014a5d 100644
> --- a/drivers/gpu/drm/v3d/v3d_sched.c
> +++ b/drivers/gpu/drm/v3d/v3d_sched.c
> @@ -387,7 +387,7 @@ v3d_sched_init(struct v3d_dev *v3d)
>   	int hang_limit_ms = 500;
>   	int ret;
>   
> -	ret = drm_sched_init(&v3d->queue[V3D_BIN].sched,
> +	ret = drm_sched_init(&v3d->queue[V3D_BIN].sched, 0,
>   			     &v3d_bin_sched_ops,
>   			     hw_jobs_limit, job_hang_limit,
>   			     msecs_to_jiffies(hang_limit_ms), NULL,
> @@ -395,7 +395,7 @@ v3d_sched_init(struct v3d_dev *v3d)
>   	if (ret)
>   		return ret;
>   
> -	ret = drm_sched_init(&v3d->queue[V3D_RENDER].sched,
> +	ret = drm_sched_init(&v3d->queue[V3D_RENDER].sched, 0,
>   			     &v3d_render_sched_ops,
>   			     hw_jobs_limit, job_hang_limit,
>   			     msecs_to_jiffies(hang_limit_ms), NULL,
> @@ -403,7 +403,7 @@ v3d_sched_init(struct v3d_dev *v3d)
>   	if (ret)
>   		goto fail;
>   
> -	ret = drm_sched_init(&v3d->queue[V3D_TFU].sched,
> +	ret = drm_sched_init(&v3d->queue[V3D_TFU].sched, 0,
>   			     &v3d_tfu_sched_ops,
>   			     hw_jobs_limit, job_hang_limit,
>   			     msecs_to_jiffies(hang_limit_ms), NULL,
> @@ -412,7 +412,7 @@ v3d_sched_init(struct v3d_dev *v3d)
>   		goto fail;
>   
>   	if (v3d_has_csd(v3d)) {
> -		ret = drm_sched_init(&v3d->queue[V3D_CSD].sched,
> +		ret = drm_sched_init(&v3d->queue[V3D_CSD].sched, 0,
>   				     &v3d_csd_sched_ops,
>   				     hw_jobs_limit, job_hang_limit,
>   				     msecs_to_jiffies(hang_limit_ms), NULL,
> @@ -420,7 +420,7 @@ v3d_sched_init(struct v3d_dev *v3d)
>   		if (ret)
>   			goto fail;
>   
> -		ret = drm_sched_init(&v3d->queue[V3D_CACHE_CLEAN].sched,
> +		ret = drm_sched_init(&v3d->queue[V3D_CACHE_CLEAN].sched, 0,
>   				     &v3d_cache_clean_sched_ops,
>   				     hw_jobs_limit, job_hang_limit,
>   				     msecs_to_jiffies(hang_limit_ms), NULL,
> diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
> index f9544d9b670d..afe29196cc7e 100644
> --- a/include/drm/gpu_scheduler.h
> +++ b/include/drm/gpu_scheduler.h
> @@ -465,6 +465,20 @@ struct drm_sched_backend_ops {
>   	void (*free_job)(struct drm_sched_job *sched_job);
>   };
>   
> +/**
> + * DRM_GPU_SCHEDULER_MODE_MULTI_RING - Run the scheduler in multi ring mode
> + *
> + * The &drm_gpu_scheduler typically represents one HW ring with
> + * &drm_sched_entities feeding into one or multiple scheduler instances.
> + *
> + * In multi ring mode it is assumed there is a single &drm_gpu_scheduler
> + * instance only, where &drm_sched_entities represent rings instead.
> + *
> + * This is useful for GPUs where the &drm_gpu_scheduler should feed a firmware
> + * scheduler with an arbitrary amount of rings.
> + */
> +#define DRM_GPU_SCHEDULER_MODE_MULTI_RING	(1 << 0)
> +
>   /**
>    * struct drm_gpu_scheduler - scheduler instance-specific data
>    *
> @@ -493,6 +507,7 @@ struct drm_sched_backend_ops {
>    * @ready: marks if the underlying HW is ready to work
>    * @free_guilty: A hit to time out handler to free the guilty job.
>    * @dev: system &struct device
> + * @flags: the flags for the &drm_gpu_scheduler
>    *
>    * One scheduler is implemented for each hardware ring.
>    */
> @@ -517,9 +532,10 @@ struct drm_gpu_scheduler {
>   	bool				ready;
>   	bool				free_guilty;
>   	struct device			*dev;
> +	unsigned long			flags;
>   };
>   
> -int drm_sched_init(struct drm_gpu_scheduler *sched,
> +int drm_sched_init(struct drm_gpu_scheduler *sched, unsigned int flags,
>   		   const struct drm_sched_backend_ops *ops,
>   		   uint32_t hw_submission, unsigned hang_limit,
>   		   long timeout, struct workqueue_struct *timeout_wq,
>
> base-commit: e05f3938c5a7896d09736e3381675a57ffee7a0a

