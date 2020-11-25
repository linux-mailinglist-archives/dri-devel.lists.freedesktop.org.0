Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A0E852C3CD7
	for <lists+dri-devel@lfdr.de>; Wed, 25 Nov 2020 10:50:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 586866E8CF;
	Wed, 25 Nov 2020 09:50:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2053.outbound.protection.outlook.com [40.107.236.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 56CC06E8D6;
 Wed, 25 Nov 2020 09:50:51 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RjQon28TCcwChN6EJDAROxjsXyfnTNqPXIfnyF+/3bMxvWVatds1EiL4QDHlLLbYinT8lXGrCrxYzqSIb/PE9VRsIsJlhLHIl5jpWmmoSaZHomdb0t9wmOdtVOPdA8/i67jYuxbiuQo7ivwPEUyKM+2iwPYf3/OxwQ/U/C0uEMAvnP6ePtQMGC+hydYCibnNQnxg4HMOlHkTOQyBSW9V+xm7cZS+dSPW+ZKepomsb8Ig1yrbx2lGyVfkzKGh0wER47OgiapNdq/dJnc/ychqyf2c2j2jahJ6kxyqPFh1Pd1NgxqUQzMhEHK6Wcl5Hy3ymCsZ9Rfsru5M0o4Svx9HkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xnd+2gO90keMLrrqhQm0GtRrgNVNGwd7b10DshfSnBk=;
 b=hI2dlh70/CZFoNadru/iIoUAvatqxObUsqHzcU3faOe21xMB4V3JjdNiVD6r1q3Zr/j1tJ9grzltbfN46lWm6ZTPXnWoSCoYhPF4NupBlsKS0DDXXmi+l62f4nT+ERDrmyu6mKZ0VZ2xYx+NcfmX4g4g0EWseEjmO/1EcqhP2SkNVHiHceJNvBZEK751jlbxuNyKh5fZCC3CD6i/tFTe+UbBCkjAjOpJoUl8JzuQ329RD/VB0a0tLB/fRUnMtU7osEnyFp3on3XxwwisOkTTdysACEdTPNW2y63umHZOcxx/BCip/dJTuU6ZfjGVCQ1A1ejiTXBaSCBkVmTuylmZ9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xnd+2gO90keMLrrqhQm0GtRrgNVNGwd7b10DshfSnBk=;
 b=iEafNM5j00i5nt2zOTPIZVZhPbE2hraSlbTkkW8zykO2J3a7DzhfgWrjD5/aznTzZykaM6vl4NoNKeU+RytZVvgHALhnaHUu3rSVUYUAJPx8zumShhwzuf/xZpvlGnYXld0rhZdq0burnf3Trvq2CimhQjqZKCiG7H8qOJ6xqvg=
Authentication-Results: arm.com; dkim=none (message not signed)
 header.d=none;arm.com; dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by BL0PR12MB2386.namprd12.prod.outlook.com (2603:10b6:207:47::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3564.25; Wed, 25 Nov
 2020 09:50:49 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::1ccc:8a9a:45d3:dd31]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::1ccc:8a9a:45d3:dd31%7]) with mapi id 15.20.3589.022; Wed, 25 Nov 2020
 09:50:49 +0000
Subject: Re: [PATCH 3/6] drm/scheduler: Job timeout handler returns status
To: Luben Tuikov <luben.tuikov@amd.com>,
 Andrey Grodzovsky <Andrey.Grodzovsky@amd.com>,
 Lucas Stach <l.stach@pengutronix.de>,
 Alexander Deucher <Alexander.Deucher@amd.com>
References: <769e72ee-b2d0-d75f-cc83-a85be08e231b@amd.com>
 <20201125031708.6433-1-luben.tuikov@amd.com>
 <20201125031708.6433-4-luben.tuikov@amd.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <ee1e75b4-a028-5eba-6d7e-9d6cee8bd3a0@amd.com>
Date: Wed, 25 Nov 2020 10:50:43 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <20201125031708.6433-4-luben.tuikov@amd.com>
Content-Language: en-US
X-Originating-IP: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
X-ClientProxiedBy: AM0PR02CA0079.eurprd02.prod.outlook.com
 (2603:10a6:208:154::20) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
 (2a02:908:1252:fb60:be8a:bd56:1f94:86e7) by
 AM0PR02CA0079.eurprd02.prod.outlook.com (2603:10a6:208:154::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3611.20 via Frontend
 Transport; Wed, 25 Nov 2020 09:50:47 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 22ca64a3-d3fb-4252-ad48-08d89127969e
X-MS-TrafficTypeDiagnostic: BL0PR12MB2386:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BL0PR12MB23864C536B2F464E2B880B4A83FA0@BL0PR12MB2386.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4714;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: h4pLdugZ7/8Ato7rtKMRViOz3E3ln4Al4oZKhRwONae8/pN852Fqpv3zwkB3KLkN6qy4tJD135yszZTeBJRL2nxi3+qCMjJS3rtDOTbg98M3nwUM3Q7EdBOb2FeXLLJE/iwWbKdNIIAHjB4HoPlBjVbsDT470pk0z6IbK43D6keSD0Xx7lKIaVf1elxUW2QJV5KtUXCQ5i0bUj1BTkol6yXZj5KGWPsAdzBcoaoV3tmstNKXLRjGhJ3QajRExAstQQFN7WbMmgswMTZNTTYRlDhZYzJX15Fmwhoudqi++WLBfWPkbM3ahAuR2MBmTY+C07qeWFs9mAJsyn17NX28hkqyOJyEVYkne7Qlj5yvBYtCyZLMPfD2znL8QUCHevm9
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(346002)(39850400004)(136003)(366004)(376002)(83380400001)(4326008)(186003)(110136005)(2616005)(66556008)(31696002)(8936002)(2906002)(66946007)(66476007)(6636002)(6666004)(8676002)(316002)(5660300002)(31686004)(86362001)(52116002)(478600001)(16526019)(6486002)(36756003)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?b1dzaUlQL2JxTmlSemoycXk0Z3JSdXJyV0VRTTJuQlVxQi8xa2Vyb1FwYlNG?=
 =?utf-8?B?RFdMMTVvSlFvZGJNc1k2UldXRkxLRHJwR2lydGJFcE9CY0srZmZZdXZLVVJo?=
 =?utf-8?B?S2lJUCtFaGVmSFVOQ3NnbUExQytoY2toVm1lRy9MNldHS1RtaG1HU0NLVnh6?=
 =?utf-8?B?cjQrUC8xdEYreVRGaWR1Vm9XZ1R6TkFJWk5jOUFuNXpDRFkrTVVRdDAreVIz?=
 =?utf-8?B?N3kyOEhxMWRCL0daWFRXZTVybW5UaThWNG1hMVQzemU5YXlBUUNVL05jaEVK?=
 =?utf-8?B?Wk1XVUh5WitUZjI4OFFPSDdJcVdQZnAwRnNLdVBlYnJQbGVEQ0JTb3VRL09z?=
 =?utf-8?B?QlFad05qanF4MGZBYVljNkZXWXU4QUxiUnFCYXV0WjBHS1BhQUZsZDNhTlFC?=
 =?utf-8?B?Uk5VbGljQVFyMXlpamV6dElBQkNoV2N2VHVMUUVCQTNuWSs0UFJjT2g0d0VP?=
 =?utf-8?B?ZTRteVBwcURVQ0RpYUhqM0lDNnlOL1l5dm9idytlaHBHaldzUUlPV0dQWHp2?=
 =?utf-8?B?cWhWcG9zYTd1N0RDTncxcEl4TGhhZzhRWGNSSWtqeGVXYm8ycEdhVTZOdnRw?=
 =?utf-8?B?L2FoVjYrbnZFNG93ZEdFVjBxc2Ywd2QzRnJlVGk2K1pNRklsNVdqNkJXSk1u?=
 =?utf-8?B?ZWVST3FsbHNHNHVldFBOZnNiMi9XTUNRYUoydW1TYU1qN0laa21hdk9LZlFp?=
 =?utf-8?B?dE5ERDk1SzJEaHVCVXlkdUpHdVB2WS83TkN4RVZCczNFaXZUejFXcTNyNFNI?=
 =?utf-8?B?dC93YnpIZ0FCZEwxVDV1UmQzc3BHSlJRU2hONlBBMVRQMDhnWk4zdFBicHFO?=
 =?utf-8?B?eVU1UVZOVCszRTZjd3pMdFMxVG1nZFNyRFFuUlF0b3lOU2UyaTRSRzgyK3VP?=
 =?utf-8?B?ampTcXo2NjBwWmhWMXVWNDEzWldGSnd2N1ppQmVPZ01EYXh5SW1jZHQrZm81?=
 =?utf-8?B?dVAyUmxaV1ZITmc0cnk1bExuc0wwdTIveFhkMHFiUk51UXRHOTVuQ2poNFVy?=
 =?utf-8?B?RG44Zi9pb1VMMDRMcERwL3BKTitTZ3pJclZTd01Denp2T2R3MVE4aDhvSldP?=
 =?utf-8?B?QW5SZVl0VDN3M1hQS1JCT1k3WkRBVUdhWlhLcEhjM2hMSStRcVRJTUZPSE1W?=
 =?utf-8?B?RWR1UkE5UVlUYitDZDhVeFI3ZTQvSCtYNE5wWWg4cDlLMVBSek1iODE1bUJN?=
 =?utf-8?B?Ui9ZalZXNXo4enJ0U1VjdDM0dlA5OEFnWVI1dzZJWlByMlo4Q1FnQitHTmpm?=
 =?utf-8?B?M05XdE9uUXRncUNyMDIxZk1rcGpEcEFJMysxUkxzYkdPMEdUVUoyekdrMmo3?=
 =?utf-8?B?aUI3bEFGeE0zWjdscGxjbGVqNkVkRkNHWURiTnZtNXpaYVp3bHJVWlFLckVh?=
 =?utf-8?B?a210TEVHSHN6V1htRFVDa253QTZ5U1ZTc3RFS3YrT1JoV0RZZFVDU095ZVFD?=
 =?utf-8?Q?FgsYJX/u?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 22ca64a3-d3fb-4252-ad48-08d89127969e
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Nov 2020 09:50:49.7524 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0KLOKv2f2xlYvPuS8UTKQxnK9kCq6PsGItASd05nyP9DtgO3wg0e1VRwo8xGG+xA
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB2386
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
Cc: Emily Deng <Emily.Deng@amd.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, steven.price@arm.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 25.11.20 um 04:17 schrieb Luben Tuikov:
> The job timeout handler now returns status
> indicating back to the DRM layer whether the job
> was successfully cancelled or whether more time
> should be given to the job to complete.
>
> Signed-off-by: Luben Tuikov <luben.tuikov@amd.com>
> ---
>   drivers/gpu/drm/amd/amdgpu/amdgpu_job.c |  6 ++++--
>   include/drm/gpu_scheduler.h             | 13 ++++++++++---
>   2 files changed, 14 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
> index ff48101bab55..81b73790ecc6 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
> @@ -28,7 +28,7 @@
>   #include "amdgpu.h"
>   #include "amdgpu_trace.h"
>   
> -static void amdgpu_job_timedout(struct drm_sched_job *s_job)
> +static int amdgpu_job_timedout(struct drm_sched_job *s_job)
>   {
>   	struct amdgpu_ring *ring = to_amdgpu_ring(s_job->sched);
>   	struct amdgpu_job *job = to_amdgpu_job(s_job);
> @@ -41,7 +41,7 @@ static void amdgpu_job_timedout(struct drm_sched_job *s_job)
>   	    amdgpu_ring_soft_recovery(ring, job->vmid, s_job->s_fence->parent)) {
>   		DRM_ERROR("ring %s timeout, but soft recovered\n",
>   			  s_job->sched->name);
> -		return;
> +		return 0;
>   	}
>   
>   	amdgpu_vm_get_task_info(ring->adev, job->pasid, &ti);
> @@ -53,10 +53,12 @@ static void amdgpu_job_timedout(struct drm_sched_job *s_job)
>   
>   	if (amdgpu_device_should_recover_gpu(ring->adev)) {
>   		amdgpu_device_gpu_recover(ring->adev, job);
> +		return 0;
>   	} else {
>   		drm_sched_suspend_timeout(&ring->sched);
>   		if (amdgpu_sriov_vf(adev))
>   			adev->virt.tdr_debug = true;
> +		return 1;
>   	}
>   }
>   
> diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
> index 2e0c368e19f6..61f7121e1c19 100644
> --- a/include/drm/gpu_scheduler.h
> +++ b/include/drm/gpu_scheduler.h
> @@ -230,10 +230,17 @@ struct drm_sched_backend_ops {
>   	struct dma_fence *(*run_job)(struct drm_sched_job *sched_job);
>   
>   	/**
> -         * @timedout_job: Called when a job has taken too long to execute,
> -         * to trigger GPU recovery.
> +	 * @timedout_job: Called when a job has taken too long to execute,
> +	 * to trigger GPU recovery.
> +	 *
> +	 * Return 0, if the job has been aborted successfully and will
> +	 * never be heard of from the device. Return non-zero if the
> +	 * job wasn't able to be aborted, i.e. if more time should be
> +	 * given to this job. The result is not "bool" as this
> +	 * function is not a predicate, although its result may seem
> +	 * as one.

I think the whole approach of timing out a job needs to be rethinked. 
What's timing out here is the hardware engine, not the job.

So we should also not have the job as parameter here. Maybe we should 
make that the fence we are waiting for instead.

>   	 */
> -	void (*timedout_job)(struct drm_sched_job *sched_job);
> +	int (*timedout_job)(struct drm_sched_job *sched_job);

I would either return an error code, boolean or enum here. But not use a 
number without a define.

Regards,
Christian.

>   
>   	/**
>            * @free_job: Called once the job's finished fence has been signaled

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
