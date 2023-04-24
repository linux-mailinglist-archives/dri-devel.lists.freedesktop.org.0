Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BBB26EC6B4
	for <lists+dri-devel@lfdr.de>; Mon, 24 Apr 2023 09:03:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C6E5A10E188;
	Mon, 24 Apr 2023 07:03:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1nam02on2046.outbound.protection.outlook.com [40.107.96.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 83F2D10E174;
 Mon, 24 Apr 2023 07:03:22 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hIAX8l2Q2PTZ6P53MMGLqj/0+eqK4HzLarui6CkKlz9iXEHzfHvdNW0tULJ//jV+qcmmPPNZ76hhkV1C9oUT/Th9pZe+tj+WEqNB+L1M0RbfqscS486HNudV4Rzqyr/Svjcc2ur3BQNaxmR1ZG6NNUmm2wPc5y2gWz2bs9GSMrKEYhOcbOFRHnsUQOrwjjFnpxfHPGsQDgck6NOtMdukulj8CUt2Ezld4c8Ktj0csHmu20PAazfm1mtJmyXGHggTUZjgMx2iiov0C1jEqDiV6zhUD/Qzfl9dWTtGcfQEZbeYIMO4JnebuzVwJ1GRtPJ08j2B67PPoO7BDtqxxSudBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=G2EEDh8yhPxXs9DL+6KJpnOAKUbyPBisw87/DBp3z88=;
 b=PFst22zV/tGp/m4/339g7cM6zd5h46NJqjsi7mcV8NaAtS2iLgnhev5VYf4rUrZ/q557Z+pXlzGIuWWsjIhYWgP3eu28XIvhniHN1uqTg2LMMML6f4WfJcJquX8G6RunhysZ+Sp0MoE1XOt5hZB2e/N0K91A+BIJngH9+kwjcjyC5F8hovI6C4VzfLrW495/ATk8Ko8jWJrRr0nMvOIqZhasZED21AROFmh/vDQ4kS4/L7jhCcexUWNyNsQ7p9Pzl+oBXPCD7A1xXBd/v5b/a6AerwsRxmu5WttQNQB/AKGoQg7E2/dwYG23eJ50jIaA/qrtVGI8CsU4yldGr5vLrw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=G2EEDh8yhPxXs9DL+6KJpnOAKUbyPBisw87/DBp3z88=;
 b=dOTOwxPfWU5QQeHYgMhC44TLuBXgen0MaLRlKfTBJ3TsiK4Pl7qcW8N+CEbhV3N+LQdc4zUzQzWW4FLWZVyxsGiiPhGByHcxB10koACt2fOgdRq5VDbic04bdNm7nZR4TJjzj+q0BrENcFgzNtZmvFPs+DBlaNufbzyr4fUUZI0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by SN7PR12MB6744.namprd12.prod.outlook.com (2603:10b6:806:26c::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6319.32; Mon, 24 Apr
 2023 07:03:20 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::d2f8:7388:39c1:bbed]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::d2f8:7388:39c1:bbed%3]) with mapi id 15.20.6319.033; Mon, 24 Apr 2023
 07:03:20 +0000
Message-ID: <d7264c5a-29b4-0fb3-153b-673a8a73d635@amd.com>
Date: Mon, 24 Apr 2023 09:03:13 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH] drm/amdgpu: Mark contexts guilty for any reset type
Content-Language: en-US
To: =?UTF-8?Q?Andr=c3=a9_Almeida?= <andrealmeid@igalia.com>,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20230424014324.218531-1-andrealmeid@igalia.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <20230424014324.218531-1-andrealmeid@igalia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AS4P190CA0034.EURP190.PROD.OUTLOOK.COM
 (2603:10a6:20b:5d1::10) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR12MB3587:EE_|SN7PR12MB6744:EE_
X-MS-Office365-Filtering-Correlation-Id: 5674ea33-98ba-4dca-7339-08db4491fc46
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 0itcVkxGfsoRSMl36yOhquqSZ7ucKY6hu50w8SJmd1r05cELECSgrkhnRbph+CEsvgCHdyeVC6rzxeCBjWpshArEuH2NP5LUcvluyUNzRMuHmyHxizUSvvAFfCjUbTCsuw8mRfcGt2njhzf3PIMhFRwCEIuld9XEmF0s60htmAUkpdSKV8bneg6j6bCdRxdyb2zkXl1wCJIjReGyen/grP0rP6FYlKlXevFhvIOkc02ASxeymgvUpbvZTWZe7CJaMc63f9cP8p9DYTOLAqXYsKm84J2aCLgzgSLLIdPvVVRN5zKC4e1DX9Dd3Ll8bz+pMq1gzr0tlKbqbsbcYlM1+WXydJfT+6hmQmsLBVinNleq+JtNYsnlq21q4NXpYxGOwLnQUUeXQIXSidehA0wSCv8ajIIERGMDx66E7saPZmRMn5eiyoXhtZzeS4K48yO5IeMOf/lowrXSVwI7nbHusYFfXyfNIrA4M91oem/0QcuLPBpxLBEQkkeU6zE7p1YmnZvgbmu7NtDtcbEL/0na/oIF5pfQCwXTNE+wOcbxR3SA2u94vMxX6cxJjkAXBUfdNDRw4Tur8IlIS6zjvEmlhNT1lPQ0+4ezCYiBx1Fwwvo0XPov3cmgXmFynBy8+NPO5baXtIHwdUwxFsN1vuWp4w==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(396003)(39860400002)(366004)(346002)(376002)(136003)(451199021)(36756003)(8676002)(8936002)(54906003)(66899021)(478600001)(66476007)(66556008)(4326008)(66946007)(316002)(41300700001)(2906002)(38100700002)(5660300002)(2616005)(86362001)(186003)(26005)(6506007)(6512007)(31686004)(31696002)(6486002)(6666004)(83380400001)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cGdkM3BxMm5wZkZISkdjVjdyK0JISmc5MlFCSGFCcWJKOHcwU3dYMnkvcm8z?=
 =?utf-8?B?eUhOS2o0czY5SEJaVTNSWkpCV0xWd0hkSXBCckxyUktHVEppUVF5S0tVWkRk?=
 =?utf-8?B?ZVJZSEc3V3NYWURlRnp4aUdISHM0TXN5UVNjTG9GL2EwUmVuWDhKMlBSSnJn?=
 =?utf-8?B?WVNQNDh4RitRN3RPL2tlNE1tdS9YdGhsK2NHNHBKT01FWW9udWhCWmEraG56?=
 =?utf-8?B?cmYzNTlCUHpXRHR6bmYzSklqcEhEYTlncHBpM3FEcjhMa2ZCWE5pd2NmQTJj?=
 =?utf-8?B?OFlOUGtpa2srTDRXVWR5UzhYamVjUGtBS3hJTTdIVlozUTZ3cDFhdDdWTjk2?=
 =?utf-8?B?dzE1VDYvbi9EczVzY1RKVy96Y0I3ZFlGUnV2Rzh2ZlNXdTM3TFZ1eHhxOWE4?=
 =?utf-8?B?WXo0RzN2UDExR0xISTlsWFB6TmJXVk54NTgzdDZpL3RTdWsvZURSTDdSUVVU?=
 =?utf-8?B?TGkvSVFTS2xRTVpZUWo5eTJzdDM5RzNJcW1IekdSWERwM3M3V1RSY3Fvd2FP?=
 =?utf-8?B?UFM4c053dVNJOHB1SEpsWmdyanNjY1dBazI5aVhLSXkwR09uRWJSMURsOUFP?=
 =?utf-8?B?Umw0dzlVaGZjL0kvUTA1OWxNQzVESTJGdDNFcmpONEk4QUxtNTFPUUZSYjNw?=
 =?utf-8?B?YTVybXJlMHYzdTFoZWc2R2lRbXRaWWlMTHp2NWJxU0lDMWNXN1pCSzZYbFJ0?=
 =?utf-8?B?V05mMkt6S3laM1dqQnR2d1I0ZG9BV2Z4RFkyWE45UXFYcGhiMmVpNlRpRXJG?=
 =?utf-8?B?dU05YktMbHFtQ1hlTFpqZEEwdHp6dXVuQ1NNais4ZXJpeWt2c1hVWlc4V1ph?=
 =?utf-8?B?SWZYdFFaNjhBS1pFNDFFSS9EbCswTXgzLy9ha01nRENXSklYQmNuQzk3UVhQ?=
 =?utf-8?B?Smo5TklCeEw0aXJtMVh0aHRFdWIxNFRRRjJjRnNwL242L1JMNWpjM1dyNlRt?=
 =?utf-8?B?STRvN25NbGF2R2l2SUJmTEloR3FhSktwcGxBWkJrWnNlTmJvTnovWVpCbTJ3?=
 =?utf-8?B?M3pYOXdNNnhMYURVSUl5VGpFakN5OWpqTHRYS0tOMTBscWs2ZXV0dXpLbVhh?=
 =?utf-8?B?UnlsOW5NK1VMbW1zcVRrNGg2MXNMbk9jYmtSRXIzTW1mc3BTOCtncjBreGJE?=
 =?utf-8?B?ditDWUVMbGhZb3F6K0ViTi9EeXM4OXYycGNCSG80b243bVVyR09nK1dldTJ4?=
 =?utf-8?B?L012NmN2ajkydDd4MXl1MGFCMVNYdzh3Z1B3OGZYdXcxN2NkWmtJYTJZUDg0?=
 =?utf-8?B?MkQ3VFBTT2VSRUMwSkZ1Y0tCeG9OVkRtN0FOREhUOURyQ0drMmEzbEhmYVh5?=
 =?utf-8?B?Vk4vcEZwYXkvb2wwTTcxajVjL0xwVkZxZENIWCtuVmFOSlJuV2JjTFJiNFZa?=
 =?utf-8?B?N0tJejY1cUdBYmJ4ZWRDOWt3MWMxR3NBWisyZE9pYjZBMldGUmZkK2pXSGlw?=
 =?utf-8?B?WTBYTm9IYStJQjNWcng0eFZ1Z3NiTTJnMFBMUXBPdEphQ2xvbm5rbyt3VjdT?=
 =?utf-8?B?ZXVXKy9xZFBJZ3QwZnVVMTlVS0dFRmR0MCtLc2xBQWNHVEl3RlA5S3pRR1l3?=
 =?utf-8?B?OUd3dFlZUytYaUJ4bGJQS3lSSGQxYzl5T1o5UnpUUDRMbVlNaThrTzNNcWEv?=
 =?utf-8?B?YWVVMURYOEtmZ1Y3V0w4b0wwVksvalFMbXFXSmxENkk3MVlvZHIvMDFmUEtX?=
 =?utf-8?B?WWl0ZXhSSHZEL21ydlQ2SnZDTU9zd2ZLbmhKN0hFNFRhdkMrU25NWEdQbFIx?=
 =?utf-8?B?WXlXcDYzMUJsODdmeEFTamlYOUhjU3p6TWZSZExzeW1ZNUpESkdlUjNLL1V5?=
 =?utf-8?B?S2JmNlB4RGNSR0N2S3c5NGFDZS9RZm1XcjR3K0hRMkhHTUpxNFNDalh2NUMx?=
 =?utf-8?B?SGpwbzc2OTVHMmhvcENYSXFsb2g2UEdlNkpDUURqaEZXaVlJMEJEdlJ1NWg0?=
 =?utf-8?B?VDlyNW1wUzFKVE11aWJNVlJIL1FVY3ZxdXdlNEpGN2RPOUdrc3F6TWR3cVZp?=
 =?utf-8?B?TGhsZlJpVzVyNXhsV1RWMHhmbm1NUFVGQzBMRk41bDF1c21XalBMaFZINWF1?=
 =?utf-8?B?ejJGbDRuL0JoUGlnb255a2FvSWNWcFFUOUpFVnF2Z3Q0ZU0zRU53akF6djlS?=
 =?utf-8?Q?Icis=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5674ea33-98ba-4dca-7339-08db4491fc46
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Apr 2023 07:03:20.0877 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: I4EaMrF5zVT9/jm/455hUAjl2N0ydtOhVM4ed48Pw+sNi5b2cfZHDGDJH7SR1hfz
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB6744
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
Cc: alexander.deucher@amd.com, pierre-eric.pelloux-prayer@amd.com, "Tuikov,
 Luben" <Luben.Tuikov@amd.com>,
 =?UTF-8?B?J01hcmVrIE9sxaHDoWsn?= <maraeo@gmail.com>, kernel-dev@igalia.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 24.04.23 um 03:43 schrieb André Almeida:
> When a DRM job timeout, the GPU is probably hang and amdgpu have some
> ways to deal with that, ranging from soft recoveries to full device
> reset. Anyway, when userspace ask the kernel the state of the context
> (via AMDGPU_CTX_OP_QUERY_STATE), the kernel reports that the device was
> reset, regardless if a full reset happened or not.
>
> However, amdgpu only marks a context guilty in the ASIC reset path. This
> makes the userspace report incomplete, given that on soft recovery path
> the guilty context is not told that it's the guilty one.
>
> Fix this by marking the context guilty for every type of reset when a
> job timeouts.

The guilty handling is pretty much broken by design and only works 
because we go through multiple hops of validating the entity after the 
job has already been pushed to the hw.

I think we should probably just remove that completely and use an 
approach where we check the in flight submissions in the query state 
IOCTL. See my other patch on the mailing list regarding that.

Additional to that I currently didn't considered soft-recovered 
submissions as fatal and continue accepting submissions from that 
context, but already wanted to talk with Marek about that behavior.

Regards,
Christian.

>
> Signed-off-by: André Almeida <andrealmeid@igalia.com>
> ---
>   drivers/gpu/drm/amd/amdgpu/amdgpu_device.c | 3 ---
>   drivers/gpu/drm/amd/amdgpu/amdgpu_job.c    | 8 +++++++-
>   2 files changed, 7 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> index ac78caa7cba8..ea169d1689e2 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> @@ -4771,9 +4771,6 @@ int amdgpu_device_pre_asic_reset(struct amdgpu_device *adev,
>   
>   	amdgpu_fence_driver_isr_toggle(adev, false);
>   
> -	if (job && job->vm)
> -		drm_sched_increase_karma(&job->base);
> -
>   	r = amdgpu_reset_prepare_hwcontext(adev, reset_context);
>   	/* If reset handler not implemented, continue; otherwise return */
>   	if (r == -ENOSYS)
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
> index c3d9d75143f4..097ed8f06865 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
> @@ -51,6 +51,13 @@ static enum drm_gpu_sched_stat amdgpu_job_timedout(struct drm_sched_job *s_job)
>   	memset(&ti, 0, sizeof(struct amdgpu_task_info));
>   	adev->job_hang = true;
>   
> +	amdgpu_vm_get_task_info(ring->adev, job->pasid, &ti);
> +
> +	if (job && job->vm) {
> +		DRM_INFO("marking %s context as guilty", ti.process_name);
> +		drm_sched_increase_karma(&job->base);
> +	}
> +
>   	if (amdgpu_gpu_recovery &&
>   	    amdgpu_ring_soft_recovery(ring, job->vmid, s_job->s_fence->parent)) {
>   		DRM_ERROR("ring %s timeout, but soft recovered\n",
> @@ -58,7 +65,6 @@ static enum drm_gpu_sched_stat amdgpu_job_timedout(struct drm_sched_job *s_job)
>   		goto exit;
>   	}
>   
> -	amdgpu_vm_get_task_info(ring->adev, job->pasid, &ti);
>   	DRM_ERROR("ring %s timeout, signaled seq=%u, emitted seq=%u\n",
>   		  job->base.sched->name, atomic_read(&ring->fence_drv.last_seq),
>   		  ring->fence_drv.sync_seq);

