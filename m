Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A30C68F86A
	for <lists+dri-devel@lfdr.de>; Wed,  8 Feb 2023 20:54:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9181810E859;
	Wed,  8 Feb 2023 19:54:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam02on2072.outbound.protection.outlook.com [40.107.95.72])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B73D10E852
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Feb 2023 19:54:17 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Hsc/jx06A2DHYm6prVEtZ829fmbGEVEe+Kxmjj/3bi6zauJAO0uEJmVW0d1UW40yyuk4rSCmmV+TXa2UKL6a0wceksAA1Kq2A3H5R8gRlrGiHwK9cf2AEgFhy0XibYIgY3qiTf497BN36sHoVULsGUdHmAvrKWLDb8NyPEGidM2nQ3wIoE47jYsCjXlmo+QwfndPvWRrE1bj9PC9zJbM2zF1lqZNLtq1/fgaPAUabH2YAUWLJX100a9v27RWNyBXK48vQd2rH+UHX7yxdy7HWULJKjO3yq3ejMF9Km0ZV754Ah7t5KLR8f6lYC4CcThZetmVlaeWNswLujh1EnZZvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EUIEww/q+C6eO2OMqQY8zfXixuI+ql5p9p3fyrAnv94=;
 b=O0RedON1oIN2L6E+yqtHXyARUVARyuqgJSYHqZ2HkSfwnpguc21f/UA9LS2wUxbykAXrHcW0idVJWi+o1R7d1vlcDPGrfQGA8TmDy+h+PwOVJnhMUiQ6k6wqFEAXEF3lDWpRslDYUCRdUCV6XCr9ejXNrXSGY0ABJSlOcTR3VT4n9rUqmQ5vJPvFRWaUSR3xIt0tUhs904TkbzoGMHplHey0OHFWsacsXcNXzQGSdr8dZFd8qsMqxK/oR3e/tAhUxJl/j1dFSqaVtcn3ooy5oa3jjRv4ZX8yiCKR/GmWz3pR7Ac7yhfjzejINx80/ccZJ6T3AQBT18tlKtNSoxygkA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EUIEww/q+C6eO2OMqQY8zfXixuI+ql5p9p3fyrAnv94=;
 b=t0Z1ififszU/Xhmhr/kFn/YPS8imwq7mbtC0Ouaif1aLjQf2h9mWLth0BXmK1rt8fMdZK7qw9V+WYeT+1PCIoVhl3vOaMPI4Cnpi9baHrNFnCu8ZL0+NiZBvsZ9+ei7sHtZDxqp6ftAdXo0mYnB7hnVJeCmR47vZatVG4YRYQyw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by SA3PR12MB7998.namprd12.prod.outlook.com (2603:10b6:806:320::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6086.17; Wed, 8 Feb
 2023 19:54:14 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::2e4f:4041:28be:ba7a]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::2e4f:4041:28be:ba7a%6]) with mapi id 15.20.6064.032; Wed, 8 Feb 2023
 19:54:14 +0000
Message-ID: <49d580fa-60db-5d55-00de-20dd3eefe737@amd.com>
Date: Wed, 8 Feb 2023 20:54:08 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 1/5] drm/sched: Create wrapper to add a syncobj dependency
 to job
Content-Language: en-US
To: =?UTF-8?Q?Ma=c3=adra_Canal?= <mcanal@igalia.com>,
 Luben Tuikov <luben.tuikov@amd.com>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Sumit Semwal <sumit.semwal@linaro.org>,
 Qiang Yu <yuq825@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>,
 Rob Clark <robdclark@gmail.com>, Rob Herring <robh@kernel.org>,
 Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 Steven Price <steven.price@arm.com>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Melissa Wen <mwen@igalia.com>
References: <20230208194817.199932-1-mcanal@igalia.com>
 <20230208194817.199932-2-mcanal@igalia.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <20230208194817.199932-2-mcanal@igalia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0160.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:99::9) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR12MB3587:EE_|SA3PR12MB7998:EE_
X-MS-Office365-Filtering-Correlation-Id: deed049e-9a03-4804-1c23-08db0a0e4122
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: GrkVEhjMlCnol2iy57TKNIRJgWkeTTWnaYFboQ6DeQwKCtlktunU9CGdCyLYZHnjj+AtIttJiWgKVi4RlCMl+nM4eiUaiWS5gG5QcA7IPTPnwUEznqG2FWK6ba6fKE5h/WN8ekDIcVtm3yV5UIHgRKrOWB52lH4Wg93SsWZ0eb6TMTBiaoe8cVm+L7+uyUINzUo1sDzfCPBAUtuwpuFyGXQTK+QNQR3fj0KkERz75NvnFEUSUgsaQzeRjZFo2rSL2ufpcLiu4XUUauQ2Zg6j+mgdAFaa9JoLf1qGYRoq7paWC+e74CFL3/IxMcWKo4By6cs/P1rbQg5w+9B/F9a+IuL715o0thvZnqCXPHpT2vm0Q3GUP9o81EhXB3CnTZgcrFn4TeO1+PSY9S8iHkoN/hDvwYxN3bi3rSnnnSZ9vNYCJKBodUlHfqJDqlr/9ffCO9Pb56DHJD/TFbGrWd+qHnPsU/+NEnrmSPfPvHjFVie68cro/L6IG0txyvJ//y+PJ0wXB+EfDZ/arUenB/BPJdw4Qz8QvGm0xfkNCB9GbSDsYf0BOCDguF3Xxf6z4ees015tfBhQqbIbEj5MjhegScXqz1eHsi1YrecBbGxqgEQO7EjuL7s4xIIitXeT1qabYJttPAlmtJ33tLLKmonfc0xVvjVeyli72/fNKq5svTQISNh0QhS5e/FsuyCNm9B/SNY6Wa/a66Qv7OZVPGCg0HtJtCjIrGCtmzJbFCrLFileIIBHG0YMc53sxaiSyjoV
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(376002)(39860400002)(366004)(346002)(396003)(136003)(451199018)(31696002)(86362001)(36756003)(38100700002)(921005)(186003)(66946007)(41300700001)(8936002)(66556008)(5660300002)(8676002)(4326008)(110136005)(316002)(66476007)(66574015)(2906002)(7416002)(2616005)(83380400001)(478600001)(6486002)(6666004)(6512007)(6506007)(31686004)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bEZsbnVVK1dSemVDK3NITko5OGtOM05VbHJxZFlHdFVOVjdyUU9oR1JvMmtl?=
 =?utf-8?B?REdRRDNXbmROR1psYWxoMzhvZlc2Y1p0b2x3V1pGNXQ0YzdFb05KckNaM2FU?=
 =?utf-8?B?Y1Q0UFBXQ0hZWXFnUWdPeDlTWENMaG1ldnNOdjhHU3dLdGlHcm1NaFVyMmUz?=
 =?utf-8?B?TzMzS3p0aDI1U1RmZkZzYjlKeDd0THo3aVI1V3p3VzRVTjBjU2l6VURuWU5y?=
 =?utf-8?B?cHpSdzJjTjlNLzc4N09tbkFlWW45WlpJdkVLQW44WS9XTTZhTng3S1c3VG9F?=
 =?utf-8?B?Q0pKNTVYUy9obnhFNWExVVpEbkptck1PSDhyK0dXeXRZSGRCVWdGTzlTbCtZ?=
 =?utf-8?B?d1lEUG1mdUo5R2lyd2tkUXI5VWZDcmNmMkdXYzlBRnVUNmR3RUVPaUtxbFd1?=
 =?utf-8?B?SzNCTzd5TEFtUWNYVkFsUUkrS0J0RVhpT080UzRNZk9jQlVqYXdYbkJVeldQ?=
 =?utf-8?B?a0J5MTVyL29WN1lCTGNHRE5oZjVnYm5TMVhZMURKS1NmcmpoRlcvQU1kS0Qv?=
 =?utf-8?B?c0tQdHJMUTlZY1RVMFlsb29RUXRoSVRiZEkxT0xDZGhvVWtaZG84ZXJneEsr?=
 =?utf-8?B?Q2xhZnd4V1k2andBSDZuaTgzT2NWSkhBWnZCVXBYNDJqSXhTZS95MlhGam5V?=
 =?utf-8?B?UjJtZmgxRkFJZ3Y2Q3hqeVVMeG1mTjBVNnFtczFzTkgvZEJ6dnhlUGRpUURz?=
 =?utf-8?B?cm10Z0xBWTZpa1JlMGdQRUFNdC9tSWlzVklLUVZmTkIzWms2QklkTmdrWWdO?=
 =?utf-8?B?c24zUkp1Q2VwdWJuOHBZaHFnZ3crN1dnSDJPRHc4UERWbmFtOTJaYzFBQzlq?=
 =?utf-8?B?clB0Z0NMTENmWm44RUNvK0tOdDMvMWo4Ulc0RzlEVWdFOThhUytaNVp0QzIv?=
 =?utf-8?B?TFl1RXlvblJldTNzU0I3Mk5nWmhVWU4wcXVKUDEwVzFxZTFjYjVJd2pTYktK?=
 =?utf-8?B?T24zN3hFMmNvSUtBKzVXcnhxR21jZDdvMU1ZV2o4blpOTzZPYmlCWGt1ZkJu?=
 =?utf-8?B?cy9LNldsQjd0T1dhUUZOT2kzcWpMdDZEbDFYaG9EZVJwcDhESkVFRGF5azc3?=
 =?utf-8?B?V1l0WDh5SllLR1gyQ3UwTXlGeURycnJqNmJDOWVNdjlvWUx1aGhOS2g0ZjZY?=
 =?utf-8?B?QUpqQjVKZzM0Zk9zbzZVeUh3RTBoYWRTQStua3pBVm5sVkNjVktmclc1WnM5?=
 =?utf-8?B?WW9SYXdSQ2hHcVFPTFJsNkJpeHhDQ1dERXh6bkhXd3dkdzlaTzR5TmJMOS9Y?=
 =?utf-8?B?eXpzVjNrOEw4S2tpZTJqcDk5bm51c0NEWU1TRENnTXM0TVZtdEE3UjFvTjBX?=
 =?utf-8?B?Wk0zRlg5cnA1WW4vVS9MRUk3TERJRENTTWo0b0ExU01xWTZZY1c5VXhWN3Fv?=
 =?utf-8?B?Yy95ZnRnYklkTkY4MW9PK0IwMzI0cUwvOXFhTlhyRndLODZCZzVyN3VRaStE?=
 =?utf-8?B?ODNPQ29GaENVaHhTMk0rZW9uVWNmR1ZHMjZpNktlM2YxL1dEMzVnNTIyZlVK?=
 =?utf-8?B?VG1Udmo5SEhuZWh2aGFZL2ZZY3hSaDdpYVN3REo4bk14bkEra1E3VzJQdFkz?=
 =?utf-8?B?RFJyTDM0MEdUTzJWZnl2VEhmTzF5U3cyT1lxdE12UEUrY01iM3ZYVTdxMThZ?=
 =?utf-8?B?RzdqYlp2bUlJVDc1cGtoSkJMT21jMEYyTW9uanQ1RDRDUWh1aTZnV21zM0Fy?=
 =?utf-8?B?bTkrS2hLQVdIVVNtbnZqNGVyYmN0Y3dqY2UwU2RyT0FYR2ptb2pRV1hMcmdM?=
 =?utf-8?B?aGtPU0ZwRkhGaHVxQTBRZ05USS93Z2VnK2FRTDZ1QXhLVUJ5OTNraUIyeDFO?=
 =?utf-8?B?TW4yTWlha0dUVDJlVTZzcVh6OHhQY0E1b3Y2bkJxVWxNVi9Yc0p3Z0xvYnla?=
 =?utf-8?B?RFltWVMxNytxWmRsOGlZRFFXcXhnZ0h0SjljdFAzd3MvT00wbExrVkE2V2Zp?=
 =?utf-8?B?UjhVNXVxMUdjbFZuNnhFdEk0S3BmNlZ3R21uL2dtU3JEZzBXQk5MSXBQd0lz?=
 =?utf-8?B?b2paRUw3cnJKcDhnY2RBVEhKNUVPVzZwV0hxNDNmVVF2Z3NCcEhWV3ZOekJS?=
 =?utf-8?B?VlQ3WTNHUGIwUXV3dWRRaXBmcTRwTlE5VzhySUVnWGYrSUNXTllPWW9ERUkw?=
 =?utf-8?B?WncvTjJ0RU1saCszeU9QV1dNM3VaTUNMeGg3OXdXWkJFVCtnRkxRZWt5KzJk?=
 =?utf-8?Q?nd3GWAAYtLibZNu7EHocaUrIoG90VOQzPIkdbTLCXlOy?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: deed049e-9a03-4804-1c23-08db0a0e4122
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Feb 2023 19:54:14.3506 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WjwXodqfVOy5t4Ur9miaXpG9tPRIoCpxWYd9fbUS7kLufZM7k0XUHwSVfHrIct7E
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB7998
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 08.02.23 um 20:48 schrieb Maíra Canal:
> In order to add a syncobj's fence as a dependency to a job, it is
> necessary to call drm_syncobj_find_fence() to find the fence and then
> add the dependency with drm_sched_job_add_dependency(). So, wrap these
> steps in one single function, drm_sched_job_add_syncobj_dependency().
>
> Signed-off-by: Maíra Canal <mcanal@igalia.com>

Just one nit pick below, with that fixed Reviewed-by: Christian König 
<christian.koenig@amd.com>

I'm pretty sure we have the exact same function now in amdgpu cause I 
cleaned that up just a few weeks ago to look the same as the other drivers.

Would be nice to have that new function applied there as well.

Thanks,
Christian.

> ---
>   drivers/gpu/drm/scheduler/sched_main.c | 29 ++++++++++++++++++++++++++
>   include/drm/gpu_scheduler.h            |  6 ++++++
>   2 files changed, 35 insertions(+)
>
> diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
> index 0e4378420271..d5331b1877a3 100644
> --- a/drivers/gpu/drm/scheduler/sched_main.c
> +++ b/drivers/gpu/drm/scheduler/sched_main.c
> @@ -53,6 +53,7 @@
>   
>   #include <drm/drm_print.h>
>   #include <drm/drm_gem.h>
> +#include <drm/drm_syncobj.h>
>   #include <drm/gpu_scheduler.h>
>   #include <drm/spsc_queue.h>
>   
> @@ -718,6 +719,34 @@ int drm_sched_job_add_dependency(struct drm_sched_job *job,
>   }
>   EXPORT_SYMBOL(drm_sched_job_add_dependency);
>   
> +/**
> + * drm_sched_job_add_syncobj_dependency - adds a syncobj's fence as a job dependency
> + * @job: scheduler job to add the dependencies to
> + * @file_private: drm file private pointer
> + * @handle: syncobj handle to lookup
> + * @point: timeline point
> + *
> + * This adds the fence matching the given syncobj to @job.
> + *
> + * Returns:
> + * 0 on success, or an error on failing to expand the array.
> + */
> +int drm_sched_job_add_syncobj_dependency(struct drm_sched_job *job,
> +					 struct drm_file *file,
> +					 u32 handle,
> +					 u32 point)
> +{
> +	struct dma_fence *fence;
> +	int ret = 0;

Please don't initialize any local return variables if it isn't necessary.

This just suppresses uninitialized variables from the compiler which 
quite often have helped finding more wider bugs.

Regards,
Christian.

> +
> +	ret = drm_syncobj_find_fence(file, handle, point, 0, &fence);
> +	if (ret)
> +		return ret;
> +
> +	return drm_sched_job_add_dependency(job, fence);
> +}
> +EXPORT_SYMBOL(drm_sched_job_add_syncobj_dependency);
> +
>   /**
>    * drm_sched_job_add_resv_dependencies - add all fences from the resv to the job
>    * @job: scheduler job to add the dependencies to
> diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
> index 9935d1e2ff69..4cc54f8b57b4 100644
> --- a/include/drm/gpu_scheduler.h
> +++ b/include/drm/gpu_scheduler.h
> @@ -48,6 +48,8 @@ struct drm_gem_object;
>   struct drm_gpu_scheduler;
>   struct drm_sched_rq;
>   
> +struct drm_file;
> +
>   /* These are often used as an (initial) index
>    * to an array, and as such should start at 0.
>    */
> @@ -515,6 +517,10 @@ int drm_sched_job_init(struct drm_sched_job *job,
>   void drm_sched_job_arm(struct drm_sched_job *job);
>   int drm_sched_job_add_dependency(struct drm_sched_job *job,
>   				 struct dma_fence *fence);
> +int drm_sched_job_add_syncobj_dependency(struct drm_sched_job *job,
> +					 struct drm_file *file,
> +					 u32 handle,
> +					 u32 point);
>   int drm_sched_job_add_resv_dependencies(struct drm_sched_job *job,
>   					struct dma_resv *resv,
>   					enum dma_resv_usage usage);

