Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F0A2579F8F4
	for <lists+dri-devel@lfdr.de>; Thu, 14 Sep 2023 05:36:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1301110E24A;
	Thu, 14 Sep 2023 03:36:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2060.outbound.protection.outlook.com [40.107.244.60])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 944F910E153;
 Thu, 14 Sep 2023 03:36:01 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=m39t1ht/C50DU++16TATqbjw9n5RMLQO3BEkpuDeVkJqQNjsUOsmzRGqhQjdACLb5WhLOePf6VMav95MA2C9WdjSI0XZtXfpucXIibJ4uDSw0PBG4fdXF1GZTzKSXv74ourFHfw9+rXHUqGDlktFriOw7LXF/1h4kAV34Va1spzaiCb/aYHlrNwyv05/hUVdK0IGpD3W4363eJRCeqMQz2E/UBICYWU1MC9F7ZNJUgn1UwbHYw8ybCoveCVZqq5AkWpj/GYW7uvnabRwy6IIOlRMjViOorASMGO5UYigIZSVgCOzvU6UTdwpqKw69JhLXr6aSxFNYC6f6WKibFVdsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OH/VFmY2CdwsK+RHWgY/wFd88MASSfGEjMWUVx8ZwiQ=;
 b=BoLwGmIRF7frBcievE8cAkzF7zAIFJb1HlUhDC+At3fZF2bI2zPR078Vjd7v8u+rHcS5BOgGDdjMI+45YLIBsThTzuemFBIUpoNnQVEGTWkAAILjAp1/AeqrLT9Ni8BcxiEsJsTglaLBzBkEw5syal/f8pSrUWZb766RoB1jSvFlHwr0LK6mVvj3CviHbw1XW2FI2p2/cxdp5NiDgq9qJqyrUH0q2MkHSk5ImIbM71b8pEixdwB+wd0c/tAVodJCpa0XmCr8cn58lL2XkXcMHLAXwB1iQdUn74qF1K4s5R4iWSReD1FINE+6sluOOmzGXVrf1lpholZ2o8f+EMjE4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OH/VFmY2CdwsK+RHWgY/wFd88MASSfGEjMWUVx8ZwiQ=;
 b=l79W0y2F2s799gi3cemLMrZQpeKR/paSeAFkpv5IfY3O0NyiggEQMFEzV32KlAk5Mgra5fxSVSkPcxOKR8Dq4fPUbxs3WonyK8UL0Jsx6meH2Jc2+3w9u3PUloAvVi+T2UR9S+WU8fYXiycDy049wOp7iLIpLodcQqzDN8DSwbM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM6PR12MB3370.namprd12.prod.outlook.com (2603:10b6:5:38::25) by
 BL1PR12MB5239.namprd12.prod.outlook.com (2603:10b6:208:315::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.20; Thu, 14 Sep
 2023 03:35:57 +0000
Received: from DM6PR12MB3370.namprd12.prod.outlook.com
 ([fe80::8a67:3bbe:8309:4f87]) by DM6PR12MB3370.namprd12.prod.outlook.com
 ([fe80::8a67:3bbe:8309:4f87%3]) with mapi id 15.20.6768.029; Thu, 14 Sep 2023
 03:35:57 +0000
Message-ID: <2c92acd4-fc56-4c95-96ff-eb4386efcae6@amd.com>
Date: Wed, 13 Sep 2023 23:35:53 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:115.0) Gecko/20100101
 Thunderbird/115.2.2
Subject: Re: [PATCH v3 02/13] drm/sched: Convert drm scheduler to use a work
 queue rather than kthread
Content-Language: en-CA, en-US
To: Matthew Brost <matthew.brost@intel.com>, dri-devel@lists.freedesktop.org, 
 intel-xe@lists.freedesktop.org
References: <20230912021615.2086698-1-matthew.brost@intel.com>
 <20230912021615.2086698-3-matthew.brost@intel.com>
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
In-Reply-To: <20230912021615.2086698-3-matthew.brost@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YT1PR01CA0119.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2c::28) To DM6PR12MB3370.namprd12.prod.outlook.com
 (2603:10b6:5:38::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR12MB3370:EE_|BL1PR12MB5239:EE_
X-MS-Office365-Filtering-Correlation-Id: 42f9151c-9fd1-4a45-e86f-08dbb4d3b4f3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 28Z/G7UAsaARSIeu4F/RZHjejVSxzr4BHncWB1fHefHDVKFFbGKWbrjFJp3qzOxgWjWQHw11cZcyN39bv1zAQ6AyFuqOqHUROLwcgsa7/qyJVhlLxVmzOX9uo5MGwv6TZLvrDh/DsDoIUZCKhg6mJACKXiJLyVZCoi46BDH8N27Dl+sVTTcw/54yegT8PeOFmTkM2fPMKRYyaHQG4g5cAB3c8l0oATzMOxALsMrL2uYlJr2dJIAdoVeCe9bUYtHZmrIQFBBCaA8/AIuqbMp1eost1DYNzXDV9GwcdaCOfKcpAFsdCPwgKL4f8dCuCftjbm2WrWUCmIuiQC3ezGlWTTGkjlFiL5Hmjc9P1zvHkLc/17syJbGJfWb2Tt7/f2uCRot0FarqlCBoMagstApw4E8kdEkNT6wekhXHA1TyQIMTJHxNhIT20KB25fnyosemmLO3RlsuDdHj3TCf+5xnsmSfPcdfCuf6b8l6cysqAKI+LDcK2LMJZ/j378X48LEznqnDTuZ7Cc7jMmtzF01B2bxGhK2uLNQ8aI1G7tcrZZYXX1M8scc9SEtTOstQ5H2GH4BWwYa0jSWCVQWJGtKmj7G+eadcE5WRWI8HyTWpHOCeEEUp6BBydqDjcSFzUcflhJ4Siu/AfbQyxNsMZVwPfFOAa73t4QCvfcXzaLu5IM0=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB3370.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(39860400002)(346002)(366004)(136003)(396003)(186009)(1800799009)(451199024)(86362001)(31696002)(5660300002)(44832011)(4326008)(8676002)(8936002)(30864003)(2906002)(7416002)(36756003)(478600001)(6666004)(53546011)(6512007)(6486002)(6506007)(38100700002)(31686004)(26005)(2616005)(83380400001)(66946007)(66556008)(66476007)(316002)(41300700001)(45980500001)(43740500002)(309714004);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QlE3Uzl5RlZvTTZOK3BHTXN6UjBDVWg4NnNqcmZsTUFWa3QxWnQyQ0ViTjhD?=
 =?utf-8?B?UW1pM0Zpamp0aXMwQ1huWVk2WENEOEhhTFc4cDdWd09uS2V6NmxkSWxEVjJr?=
 =?utf-8?B?WlNvdGYrYzV6RTBiZ1ZCL214MllsRzliM3pFSjBCQ2Z5b2o1dy9PNitpQmhi?=
 =?utf-8?B?dEZya1dCYm1tU3owa1lTYnhvUEc3dUx0bCtPVkpjamRvemFMUk5TQzF3ZUVF?=
 =?utf-8?B?aHN0YXFMZnB5b2p5UzBnQ2JwaEtJaUZ1dXdJdllyT1B4Q0xlektLL3V4cjg2?=
 =?utf-8?B?anlzTmdJSXF0TEZXd3ZlU2QybzFIekFvU3ZYK1hodlN3emNPMlRIcU1ESUVI?=
 =?utf-8?B?NWFDTHF0eDM1a21uQ3JsNXpTUnNYLzkrMEU4TktCLzhwc1UzTStLY1ZZNXVP?=
 =?utf-8?B?Q200YzZVVVNWdmxpZnJwZklaS0VRMkxhSkQxM0hINVF5LytRd3FaTWpuaFdD?=
 =?utf-8?B?VGZWTU10cVU5ZjRxSXV6MW0wcEczYldLRjF4SFdEY1ZXSmFJWXlFMXFYczBN?=
 =?utf-8?B?MDl3Q0RwZ1RYdHRLMzk1aGhIOHFqQUlBK2tsVmZjL3FCM2ZVM1JHZmsvQzEy?=
 =?utf-8?B?UzlOckNta2hCN0pYQ0NIc29PZTB1MXJWY0JhZ0I4Nml5Vm5BUGNFSzZCV0E2?=
 =?utf-8?B?WDFPUDFzNURmang4SGZOenFuUm1DZmtmN2FmMUFydjcrU2NQcEZSUXVjWlZ4?=
 =?utf-8?B?MmNQVHdreDFXMnltWWwyT1FhSUd3QThPejRuWi9iWUlURVFISjdBblBKSzZl?=
 =?utf-8?B?K2xyS0J3c2RMZ1NxMTN5Qzhsc3J5ZU9vbzBIMmlJQU1DVytmaC8zc0ZXaGpk?=
 =?utf-8?B?R21xV3ZWKzZ1Nm9TdFBZWWRrZGl3UWxNdU4zelA0NUROakFHaVdhN0ZlVHV5?=
 =?utf-8?B?NE1pQUNlZm5xQUdKQzhYZWt3dEY5a3R1SmJkS2xsWkFLeFFmYmRuNko3c3Nj?=
 =?utf-8?B?WlVwOXM2MHZxRzR5WUdJZWN6bWcvbEE1bHF1dkNTaHA4UUZaVk45c0xueHpq?=
 =?utf-8?B?d3NrbWE4ZGFkS0RHTENSNVF3TWY4L2lhUjBkNEVjTVRhRWtqSEo2WTVaNGlW?=
 =?utf-8?B?cGNETkRmaklkMEZzMGVaSU1WeUpnTlllUlFWUWtncHkrdDdLb1NjRGhnaXJo?=
 =?utf-8?B?RWJ2b1QramZkdkFlNFNHaTR0NGZhWDRTOE5EL0tRWmVnMWo5NTgwRjlGZFJW?=
 =?utf-8?B?SURUQTRZT1ZQbnJ1b2dGYVQvWWRTQUlva21PUVVpRnR6VFQ0YXI5dmcvZTBY?=
 =?utf-8?B?eFd2OTBBRWFMRkp0bk9KdC9yOHZHMmhudmEyclRTdDdKcytWYml4T1d6bWpF?=
 =?utf-8?B?SU9EMlhXOHVwUnV6ejZuY0xCNDRHUUxRSXZmem1SSy9sSDFVUzNFWWlVMGcv?=
 =?utf-8?B?M3cvYzJ6WGRuSDVUYUtCTmVIbWJXa1F3dmt6ZHl5ZnZJeCsvRU9rckdMQ1RI?=
 =?utf-8?B?VmVDOHRvMDlraXUvdzJKRnFDZHQzQWJ5RmN4amZwQWVDYmp0WHRObC9FQ1ps?=
 =?utf-8?B?alpmaWdLY1phZnVHYU1XN3FmbHdvaEV3WGRzTjY0WFRoenNGWEJwTVBLUms0?=
 =?utf-8?B?VXY5Rk9ka2d5UWZWUEI2Z3dPc0JLWkpRTVJwZ29EdFEwVEZlbzZ6M3RhdlM1?=
 =?utf-8?B?c0tHMmRxU0VFQUgzeGRiUThGUjN0S1NwSWNhQ0NQVlFXNHVCQWpGVFNaUUtn?=
 =?utf-8?B?M25Ub0dvNHVVVWxWZi9sSlMzMDB1QVc3Y0JyV2FrK1VzRC93endpK2Jjenpi?=
 =?utf-8?B?ODduMnFlNnNPRlZ4T05oeW1weG9rVGx0UE1aL1ppOGY0K3ZEb2p3VnBrdGc3?=
 =?utf-8?B?RURQYWF3N2E5endRRGZjSVJkVXZ6Vk5xcXN0bVFxNGtyblh4KzBtejhxT1FH?=
 =?utf-8?B?UmhjUVdaUFdVdzdmeWd0UVJmYTJrTHMyQVNQMkhCSnR2SjlyQlhSZUxKWmh1?=
 =?utf-8?B?QURsT2J6NjF1eVhIWG5mbklDM0UyYi9SLzQrZ2hTNUxSNHBoZkdmWkNUNHVG?=
 =?utf-8?B?U2ZXeXJDY01YNUJYTkNCMmw0KzF3anBUeW1vcWRKZVVZTVArRG0xTE5waFRj?=
 =?utf-8?B?dzlUeG1kK0JucHJ3eldYcUtlazBrVVBxbnhVTG1sT0hlWFZDUjhZNWxZck4v?=
 =?utf-8?Q?LvBOXS/0WzmU0uWeA/DP9E1j0?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 42f9151c-9fd1-4a45-e86f-08dbb4d3b4f3
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB3370.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Sep 2023 03:35:57.1361 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NzoyDkrX0anNoB/2DadRcmLnNEzXw0n8aWA5yvmE6NXlXie06VpXFRUhdaj8D7PJ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5239
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
 sarah.walker@imgtec.com, ketil.johnsen@arm.com, mcanal@igalia.com,
 Liviu.Dudau@arm.com, boris.brezillon@collabora.com, donald.robson@imgtec.com,
 lina@asahilina.net, christian.koenig@amd.com, faith.ekstrand@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2023-09-11 22:16, Matthew Brost wrote:
> In XE, the new Intel GPU driver, a choice has made to have a 1 to 1

has --> was


> mapping between a drm_gpu_scheduler and drm_sched_entity. At first this
> seems a bit odd but let us explain the reasoning below.

It's totally fine! :-)

> 
> 1. In XE the submission order from multiple drm_sched_entity is not
> guaranteed to be the same completion even if targeting the same hardware
> engine. This is because in XE we have a firmware scheduler, the GuC,
> which allowed to reorder, timeslice, and preempt submissions. If a using
> shared drm_gpu_scheduler across multiple drm_sched_entity, the TDR falls
> apart as the TDR expects submission order == completion order. Using a
> dedicated drm_gpu_scheduler per drm_sched_entity solve this problem.
> 
> 2. In XE submissions are done via programming a ring buffer (circular
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
> 
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_device.c |   2 +-
>  drivers/gpu/drm/etnaviv/etnaviv_sched.c    |   2 +-
>  drivers/gpu/drm/lima/lima_sched.c          |   2 +-
>  drivers/gpu/drm/msm/msm_ringbuffer.c       |   2 +-
>  drivers/gpu/drm/nouveau/nouveau_sched.c    |   2 +-
>  drivers/gpu/drm/panfrost/panfrost_job.c    |   2 +-
>  drivers/gpu/drm/scheduler/sched_main.c     | 106 +++++++++------------
>  drivers/gpu/drm/v3d/v3d_sched.c            |  10 +-
>  include/drm/gpu_scheduler.h                |  12 ++-
>  9 files changed, 65 insertions(+), 75 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> index 1f8a794704d0..c83a76bccc1d 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> @@ -2305,7 +2305,7 @@ static int amdgpu_device_init_schedulers(struct amdgpu_device *adev)
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
> index 40c0bc35a44c..b8865e61b40f 100644
> --- a/drivers/gpu/drm/msm/msm_ringbuffer.c
> +++ b/drivers/gpu/drm/msm/msm_ringbuffer.c
> @@ -94,7 +94,7 @@ struct msm_ringbuffer *msm_ringbuffer_new(struct msm_gpu *gpu, int id,
>  	 /* currently managing hangcheck ourselves: */
>  	sched_timeout = MAX_SCHEDULE_TIMEOUT;
>  
> -	ret = drm_sched_init(&ring->sched, &msm_sched_ops,
> +	ret = drm_sched_init(&ring->sched, &msm_sched_ops, NULL,
>  			num_hw_submissions, 0, sched_timeout,
>  			NULL, NULL, to_msm_bo(ring->bo)->name, gpu->dev->dev);
>  	if (ret) {
> diff --git a/drivers/gpu/drm/nouveau/nouveau_sched.c b/drivers/gpu/drm/nouveau/nouveau_sched.c
> index 88217185e0f3..d458c2227d4f 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_sched.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_sched.c
> @@ -429,7 +429,7 @@ int nouveau_sched_init(struct nouveau_drm *drm)
>  	if (!drm->sched_wq)
>  		return -ENOMEM;
>  
> -	return drm_sched_init(sched, &nouveau_sched_ops,
> +	return drm_sched_init(sched, &nouveau_sched_ops, NULL,
>  			      NOUVEAU_SCHED_HW_SUBMISSIONS, 0, job_hang_limit,
>  			      NULL, NULL, "nouveau_sched", drm->dev->dev);
>  }
> diff --git a/drivers/gpu/drm/panfrost/panfrost_job.c b/drivers/gpu/drm/panfrost/panfrost_job.c
> index 033f5e684707..326ca1ddf1d7 100644
> --- a/drivers/gpu/drm/panfrost/panfrost_job.c
> +++ b/drivers/gpu/drm/panfrost/panfrost_job.c
> @@ -831,7 +831,7 @@ int panfrost_job_init(struct panfrost_device *pfdev)
>  		js->queue[j].fence_context = dma_fence_context_alloc(1);
>  
>  		ret = drm_sched_init(&js->queue[j].sched,
> -				     &panfrost_sched_ops,
> +				     &panfrost_sched_ops, NULL,
>  				     nentries, 0,
>  				     msecs_to_jiffies(JOB_TIMEOUT_MS),
>  				     pfdev->reset.wq,
> diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
> index e4fa62abca41..614e8c97a622 100644
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
> + * drm_sched_submit_queue - scheduler queue submission
> + * @sched: scheduler instance
> + */

I'd probably use a much, much higher comment description here,
and use verbs as opposed to nouns. Something like "start/run the scheduler",
"let the scheduler submit", etc., etc.

> +static void drm_sched_submit_queue(struct drm_gpu_scheduler *sched)
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
> +	drm_sched_submit_queue(sched);
>  }
>  
>  /**
> @@ -868,7 +877,7 @@ static bool drm_sched_can_queue(struct drm_gpu_scheduler *sched)
>  void drm_sched_wakeup_if_can_queue(struct drm_gpu_scheduler *sched)
>  {
>  	if (drm_sched_can_queue(sched))
> -		wake_up_interruptible(&sched->wake_up_worker);
> +		drm_sched_submit_queue(sched);
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

I'd have to apply this to see the big picture, but this
is good work! Thanks! :-)
-- 
Regards,
Luben

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
> +	drm_sched_submit_queue(sched);
>  }
>  
>  /**
> @@ -1071,6 +1063,7 @@ static int drm_sched_main(void *param)
>   *
>   * @sched: scheduler instance
>   * @ops: backend operations for this scheduler
> + * @submit_wq: workqueue to use for submission. If NULL, the system_wq is used
>   * @hw_submission: number of hw submissions that can be in flight
>   * @hang_limit: number of times to allow a job to hang before dropping it
>   * @timeout: timeout value in jiffies for the scheduler
> @@ -1084,14 +1077,16 @@ static int drm_sched_main(void *param)
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
> +	sched->submit_wq = submit_wq ? : system_wq;
>  	sched->timeout = timeout;
>  	sched->timeout_wq = timeout_wq ? : system_wq;
>  	sched->hang_limit = hang_limit;
> @@ -1100,23 +1095,15 @@ int drm_sched_init(struct drm_gpu_scheduler *sched,
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
> @@ -1135,8 +1122,7 @@ void drm_sched_fini(struct drm_gpu_scheduler *sched)
>  	struct drm_sched_entity *s_entity;
>  	int i;
>  
> -	if (sched->thread)
> -		kthread_stop(sched->thread);
> +	drm_sched_submit_stop(sched);
>  
>  	for (i = DRM_SCHED_PRIORITY_COUNT - 1; i >= DRM_SCHED_PRIORITY_MIN; i--) {
>  		struct drm_sched_rq *rq = &sched->sched_rq[i];
> @@ -1216,7 +1202,7 @@ EXPORT_SYMBOL(drm_sched_increase_karma);
>   */
>  bool drm_sched_submit_ready(struct drm_gpu_scheduler *sched)
>  {
> -	return !!sched->thread;
> +	return sched->ready;
>  
>  }
>  EXPORT_SYMBOL(drm_sched_submit_ready);
> @@ -1228,7 +1214,8 @@ EXPORT_SYMBOL(drm_sched_submit_ready);
>   */
>  void drm_sched_submit_stop(struct drm_gpu_scheduler *sched)
>  {
> -	kthread_park(sched->thread);
> +	WRITE_ONCE(sched->pause_submit, true);
> +	cancel_work_sync(&sched->work_submit);
>  }
>  EXPORT_SYMBOL(drm_sched_submit_stop);
>  
> @@ -1239,6 +1226,7 @@ EXPORT_SYMBOL(drm_sched_submit_stop);
>   */
>  void drm_sched_submit_start(struct drm_gpu_scheduler *sched)
>  {
> -	kthread_unpark(sched->thread);
> +	WRITE_ONCE(sched->pause_submit, false);
> +	queue_work(sched->submit_wq, &sched->work_submit);
>  }
>  EXPORT_SYMBOL(drm_sched_submit_start);
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
> index f12c5aea5294..278106e358a8 100644
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
> @@ -492,6 +491,7 @@ struct drm_sched_backend_ops {
>   * @_score: score used when the driver doesn't provide one
>   * @ready: marks if the underlying HW is ready to work
>   * @free_guilty: A hit to time out handler to free the guilty job.
> + * @pause_submit: pause queuing of @work_submit on @submit_wq
>   * @dev: system &struct device
>   *
>   * One scheduler is implemented for each hardware ring.
> @@ -502,13 +502,13 @@ struct drm_gpu_scheduler {
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
> @@ -516,11 +516,13 @@ struct drm_gpu_scheduler {
>  	atomic_t                        _score;
>  	bool				ready;
>  	bool				free_guilty;
> +	bool				pause_submit;
>  	struct device			*dev;
>  };
>  
>  int drm_sched_init(struct drm_gpu_scheduler *sched,
>  		   const struct drm_sched_backend_ops *ops,
> +		   struct workqueue_struct *submit_wq,
>  		   uint32_t hw_submission, unsigned hang_limit,
>  		   long timeout, struct workqueue_struct *timeout_wq,
>  		   atomic_t *score, const char *name, struct device *dev);

