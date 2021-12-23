Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A4CB947E084
	for <lists+dri-devel@lfdr.de>; Thu, 23 Dec 2021 09:39:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A72E10E259;
	Thu, 23 Dec 2021 08:39:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2076.outbound.protection.outlook.com [40.107.237.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4629410E259;
 Thu, 23 Dec 2021 08:39:53 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RrV4jpSHBvnIjl0KBoX19pFCG2CLdpYO8Uz/0BmQAr8ux6pZSZY2UujjbJNGi6olt909yMfE8OLBr7eCrVP/vTuVjXpqTIx/ERwMzf5Mk3yGVRWfW3alMklNesiqnHSGfWmZwySVD4hOl9ipj0gjAjHDlemkhodmsa0jFSaEU4La8tfLAqqStcrxf/QXi2S8VZ3Xyn8yOkexYCwAhecLUlDZH4xusRklKIkGCci30myzqvJ4SjWZfl+dJJQ6TO7DlDMQY60QpRGWVuvPF8FWnISvcdKFuBW54sYdqmLENWYrRXp6EL7njjclxy4nfkLM4KxvPcJYDgyAkyD4u1fu+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qEX3ji5H4SRrRHEjjeucuXnQ0Ek4r0qFE8tBn+1/9+I=;
 b=dLi+mJ/t4pul7jTbETaOsJO0fl+zgNqY7TLS+TLCJNM70e5y/65D0xd/HlIOVygt6ne3coO3tUs77wy9WRMpMZcbv5AaVzvcHHqZxsMqqmzclKyuuCJxtjRTCc1w3HCM8wFAMBK+sMzNKKSTa7Mbyc9Ju2s1McepAFBA9q2iYXnBzCxOn7gTNwJtskjxMklwmivw2XyQi7FbPFIbLWN8p68ZQ8K/6dIIbbIYHyovP+XDFRkfgE5+auHP9bTPd8G1JNQyxLBganoBe2Ffi3ctqWU6A/X6hcSy5/1+UOUd+LCojQRk39JPwTiZhjpJIZmNGgpaPlRadoYtHge2eYezmw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qEX3ji5H4SRrRHEjjeucuXnQ0Ek4r0qFE8tBn+1/9+I=;
 b=eNgwa6K0gyfz53lND68MS7hF9Y2vJBavR1cU1Ia0ObHYKa9AWuyt5/VbUpvGfxh2elhQ2/DaRj0QsxrGxqnp4ycAAq9LVqfQ7jZdUu2y0qAawZcTlWjLc2HBVmw/jCJwzTkT9zsg7Gvtp1JHFyezcdFb2BRLp4Mbgx2H835DQNk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MWHPR1201MB0192.namprd12.prod.outlook.com
 (2603:10b6:301:5a::14) by MW3PR12MB4458.namprd12.prod.outlook.com
 (2603:10b6:303:5d::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4823.19; Thu, 23 Dec
 2021 08:39:50 +0000
Received: from MWHPR1201MB0192.namprd12.prod.outlook.com
 ([fe80::d16c:a6d5:5d2e:f9d4]) by MWHPR1201MB0192.namprd12.prod.outlook.com
 ([fe80::d16c:a6d5:5d2e:f9d4%12]) with mapi id 15.20.4823.019; Thu, 23 Dec
 2021 08:39:50 +0000
Subject: Re: [RFC v2 2/8] drm/amdgpu: Move scheduler init to after XGMI is
 ready
To: Andrey Grodzovsky <andrey.grodzovsky@amd.com>,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org
References: <20211222220506.789133-1-andrey.grodzovsky@amd.com>
 <20211222220506.789133-3-andrey.grodzovsky@amd.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <4f8564b4-752c-5d0e-437e-6dcff8eb54fe@amd.com>
Date: Thu, 23 Dec 2021 09:39:43 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <20211222220506.789133-3-andrey.grodzovsky@amd.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-ClientProxiedBy: AM5PR04CA0022.eurprd04.prod.outlook.com
 (2603:10a6:206:1::35) To MWHPR1201MB0192.namprd12.prod.outlook.com
 (2603:10b6:301:5a::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2f1a8ae8-a3e2-4d33-2eaf-08d9c5efc882
X-MS-TrafficTypeDiagnostic: MW3PR12MB4458:EE_
X-Microsoft-Antispam-PRVS: <MW3PR12MB445852938E6D08E1FA0E27C2837E9@MW3PR12MB4458.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:510;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: crTJa43/gVXOPmzAdpmsywsOde5/4vCm4hocCT66qbRIDZmGZ043eJRaWfaantpmX9m5pGAkGBIPqmFvKU7h21Z1x+bg7Rk4upgSQUVrZ1D+ncDDn8gKfu+9e3f1lBcKXABCtqZFjgKGHFjTz5oUnK7KXd5N/0M7NxuLyzkMg9zxvWFYLwszixqtg9vqg/OtXG/SN4+UV+t9CnerUt6XvqW+0aY+A66ZFUPPVBh/ft+KGOrbAc2sQzM+MgFMz0tgJ96r/7HPXOO3PhSKEu0V3t1gPd4c0ttm9zJ9yuPrbTRINwb0z0KFoQhj3Hk6ScL2wEuLAmd9xGaz7cbJmR3oWry++UyxQthRfo9uKAzIRQ5bt31AjTo2oCbQb1GEOVLO9Thqjrc4KPd4AWJSonAHsYzbShHGH1WcBXw4OAgJdiS0uenLTgAMmb+3DLjiWJogJwHTpfzF0rj27hx4fmzCIPY0Vcpe0mZ12uV0H7dUMqTUfoMj/fwBuxaq7W0bLo/yu424JAFoEdMu1FtSy0E1bYVAos/Vz9faKkkrF4zaRvySITwV/Irou0J/XKPnsQXj0Md33eVdkZhiGarzBfMTN73y8kWv7GQl6JYynZQPzNtT4ChMC6KeffaqrH0DqnB61b+JGApD+OFfQPvdBih7W7gqqk9CaY/9x3zG+dW0/2awdxUTAWLwjMACMcQzW/ggf4VXMknZmDLs5nuHmelX+LcQdPF61srJ4sCggAl6bh3/ga3N0sLeWspyJXng5cwr
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR1201MB0192.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(186003)(6486002)(2616005)(4326008)(31686004)(5660300002)(66574015)(36756003)(8676002)(31696002)(8936002)(38100700002)(83380400001)(66476007)(6506007)(86362001)(508600001)(66556008)(26005)(66946007)(2906002)(6512007)(6666004)(316002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VXl6ZkRUUVFMa3NwQ2puYmVnVUdXKzhhODR6ZkpNSm10dzFvSjg4SnR6RDR2?=
 =?utf-8?B?T0hXb0Q1bTFjeDEwbXVVQmh2R1R3R1grWFVZalIvVllEdFVBZVBUYkowTEFB?=
 =?utf-8?B?Ri9GeEg5OUZaSWRiZFg1Wkd3SGxGSjJvZ3dCZkV3ellhOW1EdmZ1bVhqUnB6?=
 =?utf-8?B?bVRMb2tKd2YwVTd3MUMra1pSNWZvV2wwRTc3eUFXOW9yYWQ3NEFpeUpqQnQx?=
 =?utf-8?B?amQyWFVjbWdab2w5ampJT2p3aHU3UVoyNzJqWFpvMlgzWkhQY2VJT1Faemt5?=
 =?utf-8?B?L1hKdnFsMW1CZFVKSkJwL2J0MExUeEFkeDFzUnlKeWt6aURnZ0g2VksrQ0VE?=
 =?utf-8?B?UVdBblkxMTVpVmtlY1haNVdqZnE5SVdMMkJWa1crRWRjemZtKzhFM1V5c1VS?=
 =?utf-8?B?WEdUWDIzaHhkT04xNjMyTVpFcnRVanUwM2sxV2UyOHpXUTFUckhoM0xKUFl6?=
 =?utf-8?B?QjZqbExqS3BoMWJnd29BS2s4VnVZVk9Xb1BKNHN5MVBjUFc4V0Q5K1lVZ1RW?=
 =?utf-8?B?QWNuclFQZ0Z6bGZycFZCbllOSFZyeTdXeTNFM2F6elpYT0pKZjdRNVF4cUNw?=
 =?utf-8?B?bGhkQWszSVE0NjdZcVdPUGRvQ2JqYmo5QS9TVWlORFNKWkFVQmZheCt0K1g0?=
 =?utf-8?B?QTZ0bnREM2Q3RkhGTEFUeGJybUNpclpFZCthRU10VkN3bDRxdHZNcGIrYzRQ?=
 =?utf-8?B?eDUzcmJiZFBuRlJPK2FnSXRjeWhNWXdmSzNDQVJaTmdSVjRXaENndjNuVitr?=
 =?utf-8?B?NmF1MmliUWxQNUt3T0RPSktJQS9RWml6NUhOMDlBbWpPZ1VqWW1hdVR0eVZi?=
 =?utf-8?B?a0JFSHVDd1Z6MGIvVmJKMjM5M201RVEzNFV1U3B3RmFoWEZqL0lsaWNZNS9Q?=
 =?utf-8?B?eW85ZDRUR252L3E0T3dHZVZnbnBTRk8rQWxHaEd2c2pCNzlobUxRQVRJRFZ2?=
 =?utf-8?B?QWRBNmlIOEIzUnVKTzVKSG1FbFFycklSUmJ5QlRLZkN4WTBlbmo3NTZBenRx?=
 =?utf-8?B?UU5wN2hESzRFbEZxMHpzTXVkS25pRmYvTk03ZGFOSTd4QUoxcE0rUHhES0k0?=
 =?utf-8?B?aW0rY2tjclYzSGF0dzY1bjZvSWptbFVuMDdHK3Y2cUpBMVVMbDZranBMN2k1?=
 =?utf-8?B?Nnp4MmxVeFROeVpBKzJrNm9QMGJPNU1ZS056ZGtITmw0OEdySmVVMEtsNWhT?=
 =?utf-8?B?RG1Xd0tyVVNQRkhmM05yZzQ1d1YxekZvYnhtK1NVKzlXYTdiSnJYaWxCUXlw?=
 =?utf-8?B?dzZVdTZ2U2JmTTMzN283cHVZSHkxd2dzTk83bzQvbE93M3ptMkVFZFF5bW51?=
 =?utf-8?B?d3VvSjBza3FLT1F5blRMR1pDTHpJcWxHdnRYaW5LTVplTDdpRjZoRHBrYVZs?=
 =?utf-8?B?S2JlMFZjbmhVY0I1U0t0U2gvVkttZ0ozZ2FkU3lPSllMdVFHTXVZK1Yva1Z5?=
 =?utf-8?B?WjlMcmV1Y1VpTjkweFFHZFdITFZ1YnpwRmM1VS9pSE1BZ25XYUpzbC9wS1N1?=
 =?utf-8?B?bk5Dc2cvSkVqaVZXOTlYQ1htU0dZamdlK3hwVEl4cyt0c0FscGcyaUhjb1h5?=
 =?utf-8?B?OTNVbGRsbHlFcmNoalI0QW1seUUrVmpEa1lHKytCUXlZQTd6VDVxWUxHWmFG?=
 =?utf-8?B?LzE0b1Zyb3NNZFVSM2FhWVpjMnZ1a0MrSEo2NFNScGVOc3gyTThZaGFCblVo?=
 =?utf-8?B?RGJOSFlDaVdGQjM3YUNOZTV1cHNLSUxrR2RudVpZMFVjQnViVWVlZ09RdEtU?=
 =?utf-8?B?aHk2T1F5U0R6TkVJVzM4c2s5MjAxVUN4STVEYmpjMTMyZXZkTHdtVEFwQXBX?=
 =?utf-8?B?bkhDbjhUV0V6djhaaTVtaXlhQ1U4Ly83U2VyaWQzbnVOR1NZem5TNzdyYUdS?=
 =?utf-8?B?MUFwQ1NRTXdlZDVsU3Blc2NBbldsNWV1UGhaYjZGZ1NGWnZtYURuZUhKMjhE?=
 =?utf-8?B?Und1aGR1TFBwMkRhNjA0TkhMTkpMU3FVOTQrQ0ZJTWlCZkFDaU8zd2wrZ1VE?=
 =?utf-8?B?bkhpNkFhQy91Q0h2TzFvT1dxWG03SkJseWt5V0VKaXg3Y2taNlY5Z1llWVRS?=
 =?utf-8?B?WnFOaTJiQS9PUEs0L3p4cmk0YytMVzh0bzZpdU1waGt6NzBaZUJrdUxsQmkw?=
 =?utf-8?Q?/rOo=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2f1a8ae8-a3e2-4d33-2eaf-08d9c5efc882
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1201MB0192.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Dec 2021 08:39:50.3155 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mMtDw5pVA2jHYL1OmwJlu1seDdhFYFBi66qtNE+wGpXk1+vydjl7HfbCrY7Uv9Ra
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR12MB4458
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
Cc: horace.chen@amd.com, Monk.Liu@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 22.12.21 um 23:05 schrieb Andrey Grodzovsky:
> Before we initialize schedulers we must know which reset
> domain are we in - for single device there iis a single
> domain per device and so single wq per device. For XGMI
> the reset domain spans the entire XGMI hive and so the
> reset wq is per hive.
>
> Signed-off-by: Andrey Grodzovsky <andrey.grodzovsky@amd.com>

Reviewed-by: Christian König <christian.koenig@amd.com>

> ---
>   drivers/gpu/drm/amd/amdgpu/amdgpu_device.c | 45 ++++++++++++++++++++++
>   drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c  | 34 ++--------------
>   drivers/gpu/drm/amd/amdgpu/amdgpu_ring.h   |  2 +
>   3 files changed, 51 insertions(+), 30 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> index 0f3e6c078f88..7c063fd37389 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> @@ -2284,6 +2284,47 @@ static int amdgpu_device_fw_loading(struct amdgpu_device *adev)
>   	return r;
>   }
>   
> +static int amdgpu_device_init_schedulers(struct amdgpu_device *adev)
> +{
> +	long timeout;
> +	int r, i;
> +
> +	for (i = 0; i < AMDGPU_MAX_RINGS; ++i) {
> +		struct amdgpu_ring *ring = adev->rings[i];
> +
> +		/* No need to setup the GPU scheduler for rings that don't need it */
> +		if (!ring || ring->no_scheduler)
> +			continue;
> +
> +		switch (ring->funcs->type) {
> +		case AMDGPU_RING_TYPE_GFX:
> +			timeout = adev->gfx_timeout;
> +			break;
> +		case AMDGPU_RING_TYPE_COMPUTE:
> +			timeout = adev->compute_timeout;
> +			break;
> +		case AMDGPU_RING_TYPE_SDMA:
> +			timeout = adev->sdma_timeout;
> +			break;
> +		default:
> +			timeout = adev->video_timeout;
> +			break;
> +		}
> +
> +		r = drm_sched_init(&ring->sched, &amdgpu_sched_ops,
> +				   ring->num_hw_submission, amdgpu_job_hang_limit,
> +				   timeout, adev->reset_domain.wq, ring->sched_score, ring->name);
> +		if (r) {
> +			DRM_ERROR("Failed to create scheduler on ring %s.\n",
> +				  ring->name);
> +			return r;
> +		}
> +	}
> +
> +	return 0;
> +}
> +
> +
>   /**
>    * amdgpu_device_ip_init - run init for hardware IPs
>    *
> @@ -2412,6 +2453,10 @@ static int amdgpu_device_ip_init(struct amdgpu_device *adev)
>   		}
>   	}
>   
> +	r = amdgpu_device_init_schedulers(adev);
> +	if (r)
> +		goto init_failed;
> +
>   	/* Don't init kfd if whole hive need to be reset during init */
>   	if (!adev->gmc.xgmi.pending_reset)
>   		amdgpu_amdkfd_device_init(adev);
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c
> index 3b7e86ea7167..5527c68c51de 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c
> @@ -456,8 +456,6 @@ int amdgpu_fence_driver_init_ring(struct amdgpu_ring *ring,
>   				  atomic_t *sched_score)
>   {
>   	struct amdgpu_device *adev = ring->adev;
> -	long timeout;
> -	int r;
>   
>   	if (!adev)
>   		return -EINVAL;
> @@ -477,36 +475,12 @@ int amdgpu_fence_driver_init_ring(struct amdgpu_ring *ring,
>   	spin_lock_init(&ring->fence_drv.lock);
>   	ring->fence_drv.fences = kcalloc(num_hw_submission * 2, sizeof(void *),
>   					 GFP_KERNEL);
> -	if (!ring->fence_drv.fences)
> -		return -ENOMEM;
>   
> -	/* No need to setup the GPU scheduler for rings that don't need it */
> -	if (ring->no_scheduler)
> -		return 0;
> +	ring->num_hw_submission = num_hw_submission;
> +	ring->sched_score = sched_score;
>   
> -	switch (ring->funcs->type) {
> -	case AMDGPU_RING_TYPE_GFX:
> -		timeout = adev->gfx_timeout;
> -		break;
> -	case AMDGPU_RING_TYPE_COMPUTE:
> -		timeout = adev->compute_timeout;
> -		break;
> -	case AMDGPU_RING_TYPE_SDMA:
> -		timeout = adev->sdma_timeout;
> -		break;
> -	default:
> -		timeout = adev->video_timeout;
> -		break;
> -	}
> -
> -	r = drm_sched_init(&ring->sched, &amdgpu_sched_ops,
> -			   num_hw_submission, amdgpu_job_hang_limit,
> -			   timeout, NULL, sched_score, ring->name);
> -	if (r) {
> -		DRM_ERROR("Failed to create scheduler on ring %s.\n",
> -			  ring->name);
> -		return r;
> -	}
> +	if (!ring->fence_drv.fences)
> +		return -ENOMEM;
>   
>   	return 0;
>   }
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ring.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_ring.h
> index 4d380e79752c..a4b8279e3011 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ring.h
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ring.h
> @@ -253,6 +253,8 @@ struct amdgpu_ring {
>   	bool			has_compute_vm_bug;
>   	bool			no_scheduler;
>   	int			hw_prio;
> +	unsigned 		num_hw_submission;
> +	atomic_t		*sched_score;
>   };
>   
>   #define amdgpu_ring_parse_cs(r, p, ib) ((r)->funcs->parse_cs((p), (ib)))

