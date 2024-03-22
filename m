Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ACD84886CA2
	for <lists+dri-devel@lfdr.de>; Fri, 22 Mar 2024 14:15:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 86EF711245C;
	Fri, 22 Mar 2024 13:15:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="IT7QqZwy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2076.outbound.protection.outlook.com [40.107.243.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B8D0211245C;
 Fri, 22 Mar 2024 13:15:12 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lMb3zR/E5qyKACelIY3TLe7/t5facCdfz6dHYf80r7LyoKfgTVAqeeAmXDq9KDD+V/8lR3C/PZbQssFJ0yP6rGYqD7oi4tVG4PZCBDMFvYSErUJn5Vdyo9GnB131Wbn0itTQXbgvxLHCdwdBjRK8gJgYviIU32QVYR+WVGqd1x6/wd2eY/BnFpzxsV+TH01JotkKTruqo4xZKOEp8pwXznNCBRTryOF6+gogFeNCmQVOWWDheOockSzDcp6WO0i5qHQktQFIPsDrTrFFZD9luIqj/dIwnkBM3y4FoDgY5TSYTslX5BYxeSvYcCVx4lay7OjhjfAHh4EI3mi/a6m2Pg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OeBUSu+hs/Dg0OYDlOVp+PO4lhpQFS5lbFhx5xW+6Hs=;
 b=kN97gm5+vvGci+XlkmzwTopYfhquINvlmzr2WYgiSboKLwcikHRuhsMP9V2qkyIH1XQEiCZ7qyoD7JCcERoPtDGy+xx2/cfqREFlfZziV5x3yiXFBr3qpcq7+V7yA6tPPyDllQzshj0qJRoVhpFL0/C9ppd8DHUOMOCcyFfmiai9nKCno7PCCqBOV9ldkKihbYDUt1fouwZesvdMVDgsTEe9xno8lcM6k226LkNqLyHReTyd4YUtwgpqALWzPiC1izVm90pKVVP2eUwlFjSaGuZ9HIOcWYml4OJJMftUguzWAUAMfn/oZZsxaEeJn80okrRglWweA3U9ODSLcIKYuQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OeBUSu+hs/Dg0OYDlOVp+PO4lhpQFS5lbFhx5xW+6Hs=;
 b=IT7QqZwyID3+4qQKmpaxFNf6Vz2Vl/J/CVjMi0OQXzj446P7Ea6QCukx1R3HZqKvP5e3kl6F3aD9D4Du/PpZf83vyFoMnVrIr3BbS9UDO3QNeJmjkXeWxRGB4vpqBgqQIYFJI1b2UAoLAK3Iv8hdfzn0BctBJIaPtZt5nq8Q8qE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by CYXPR12MB9442.namprd12.prod.outlook.com (2603:10b6:930:e3::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7386.34; Fri, 22 Mar
 2024 13:15:10 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::f2b6:1034:76e8:f15a]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::f2b6:1034:76e8:f15a%6]) with mapi id 15.20.7386.025; Fri, 22 Mar 2024
 13:15:10 +0000
Message-ID: <f3cd8e6e-20ae-4093-b77a-2474b3a2f5dc@amd.com>
Date: Fri, 22 Mar 2024 14:15:04 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/ttm: Implement strict NUMA pool allocations
Content-Language: en-US
To: Rajneesh Bhardwaj <rajneesh.bhardwaj@amd.com>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Cc: felix.kuehling@amd.com, alexander.deucher@amd.com,
 christian.koenig@amd.com, Joe Greathouse <joseph.greathouse@amd.com>
References: <20240322070753.69324-1-rajneesh.bhardwaj@amd.com>
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20240322070753.69324-1-rajneesh.bhardwaj@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1PR02CA0073.eurprd02.prod.outlook.com
 (2603:10a6:802:14::44) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|CYXPR12MB9442:EE_
X-MS-Office365-Filtering-Correlation-Id: 68b993a0-4a1c-4a08-a6a2-08dc4a721a06
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 7vj0QxrS/TQJzf/VLcOcTnI6Kxy2vTjvZ0yJ5LQ/aa1Ws2sdHQEUdtnjR/e/72E47Qt3U31aHZdRPVtDlgTFvzqUwqVyDVGs7CxCLoCJfMrx5KKeCfr5CzZam6dzKPnNnjRD+AZs6IxFz1c8AFukxvfNZqnKo2sV5xES7rWZJ2MEob7f4oDUBrHzg55o4G/JoQeXf+iIRGVmPzIi37MRl8PH/nmhjJ8YgSXEaRMLYnHqcPfgqwd53Y03Iny2BDx3DZHd1uW7YBeJnjyg7Mmdux9obA+WjsxvAxNxFnegkulBXIkQNTRP6Zt4N4AFV/rOWcjo5YkSGOZzmjBt8HlYbAML6QkkNEbQd9qzuKFf8rxduz9u2WTP78DQuMO3n5N7oG0jX5S3ZpWeYy4SoHyl0WCadmfLoHZBsaHYY6es9RNrp+WWtHoMR9ESmN9RXeK2iOjrezvrg3ax1tTfEHgYhQcgDkPi2y4/J5+mA1Q25ajgeiCSq6AyOQuobTdnyfb397IGl9klkyLXV9/Rzh2TyQZwWcC5U0ojDKhKdjbQC7APwnlqMk+vErXrk4+YClmOYCaE88GRYLddeGHUfv3hnBFsICrEvZMG005qN61M3OyXilDNdRtD5AlBrMllcdLHEJXM5r4o+NJmkQ4I8kI+MrrZoytuHSkZLxQFchdqh78=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(1800799015)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OExhUEVXdGVQUjU0TXpJd21UMEhxYjdwdWpxaXVheFA1ay9ZRmlMMkYzRXZP?=
 =?utf-8?B?TVI5dmxsQ2pGMUF3V1UxcDhMdlBZeXpEU0NrSjVVb1ZGQktibTNMeTBRUXJC?=
 =?utf-8?B?aXE2emUrMFFHdHBUNGUxMmVBVzBOWENmcmNIeVIvRXhaQ2lnTlQ0S3hTd0Fs?=
 =?utf-8?B?enpwVTVLeTcxM2EwbW1SL2lTSlNuV0MzQVpxUE1iY3Y5WmhSQUhjd1VWbkVr?=
 =?utf-8?B?TnV3ZjRFczhIVmlTdWR2c0FRdEZEMzFYVjRxN3Z5VllZNU03S001OERRSHFT?=
 =?utf-8?B?NFd6VE5oY1RWaEpZYUFvc0djaXdaR0VodTg3YlRqNUVZVWtCYVVqS3BIanlC?=
 =?utf-8?B?SDZQUk02aE5pNXh4dVM1SFNrSlZBemtiMnVFTkpPRGZtRnZueXAzU1Q1aUhj?=
 =?utf-8?B?b0ZDR2QwWWdjUzZkTGNMSEUwa0RxSGtSUkY3U2tyUFpQdUt6OExYeDY3WHZN?=
 =?utf-8?B?NXZvOGU3NDN0RWx4MXEveUpJckFnNGJrTGErRUxXY2ZIbmxWYjNnNEhwdVJW?=
 =?utf-8?B?NkRoZlVuV1lRSCsyK3RoeTJ0NXpUbTl1UXA0Mm92Q29FbG1WRjJTWVQ5WnQy?=
 =?utf-8?B?ZDYrbEQ4R0pxeDlzUGlNaGtoT0lmeTA5MWh4OE5tNjVnbldhNFZUWTZ5QlM3?=
 =?utf-8?B?czhkS0tGTk52NStHcmVHWmFVRDlBaWx1TXIxUk5SRVpKVm1IcGJtZURrN3BR?=
 =?utf-8?B?Ky9LWHNYcW54UGZxNVI5bis3VXBVcGNtMUJOY3RTWldvdEpBV2s3SEtLZnky?=
 =?utf-8?B?SjhXZHRKSk5nYkZxdWFGNmdpQkpKeG40RzFPTHhBVGF3cmZLUkxUNzdOQmVL?=
 =?utf-8?B?MklHQVVJd2EzOHB5Q1BxS2p6Z3VKak5IRkhjVldZUCtDTU4xWDNrZVJRUHgv?=
 =?utf-8?B?WTVLNmpucFNyeE4xenJEUTRoRDF3UnBrZ3c3cW1hTVF1RnpWb1pZTFFPMXQ0?=
 =?utf-8?B?Q0RDSFRBNEdRQmVqSENYS1A4RHZKQ2h4RS9Jd3gvVk9sZGwzYlZDa0FQRTN0?=
 =?utf-8?B?cUxMSWk5T0VBdXZuYXZJYUF1NlRqQW1hd2xSTHZDNGdMZ29RWnVDcC9SeG5a?=
 =?utf-8?B?U2wvSXlCY0lkRE1wS2E4Q0JsQVo0RkhmYWgrcUJSQjA1SEVKNjRjRmdLUGw3?=
 =?utf-8?B?VDRHUnZmd0hMMDVRVUZGamNlelVKay8zZFZMUElrYytsZ09hRFE3bmZjaVAw?=
 =?utf-8?B?TExiOGxIU1RpVDV6dDRlWGVzM3VrS0I2QWtJaUZrVlMxdFFOWjlFSDFMZGFX?=
 =?utf-8?B?bHhDbkZnSGdZRXpLNjIvQms2cmpXSHRzZzRuUDB4bGtUbUFmN0pDdllMdWFN?=
 =?utf-8?B?ZUNjOUFqU1E5S0E1SmMxdmZUalhmVGdpUitEMnVsTkdoTTlhb2ttNTBzMUhq?=
 =?utf-8?B?bkF0RERhVXkycmx1SzhEcmp2UEhwVmRmSy80S0dvSVFyemhxMlZqZWFPaWkv?=
 =?utf-8?B?UTVpeHpYamw2MnF1MDl2STJoUmRsVlRmTXBac1krQUk1U2sxRUxaYjErVlBs?=
 =?utf-8?B?a2F1Y3owYXZ5WDNvRTViYWpMb0h0UGVUMWxOeklBRVpvSmQycjlHUWw5azND?=
 =?utf-8?B?UWNDSWx0cE1UTmRRMTJnODNiNnd6OGVkTzg4TnYzK21xWEs0S3VqMjU4NHI4?=
 =?utf-8?B?Q0I4Q3BqSmlXOXhvUjNKK2REQXdlNnpCTlRNOTJ0elVrNzVkSVd2OE4yZVZY?=
 =?utf-8?B?UWhRcXgxd3VyZnFqU2lJeHA1NEFDUk4rZXVobCtKQVQwM3RXTDJJdERWeml1?=
 =?utf-8?B?TEV0ZEdDOURuL2ZubUo5Z2xSQWJvOEpVbVd4dDdJMm9XZXlBakk3TVpGSUxx?=
 =?utf-8?B?OGtFcHVEb3lGSGdGNkdVbEtJZk9IS3diYnJtWlZHQWlVdnMyeEJMalFTcERP?=
 =?utf-8?B?L3JGc0RRMElSUE5HL2dhWDJLdW9YTVk5dEg4emFaVndEdGluRTk5SHFkRFlx?=
 =?utf-8?B?VGtNZndQY1lKSTlXZG0yVVlheUhiUmhnTy9yVGpnL1N5TzdiSGh3Wmlhckk1?=
 =?utf-8?B?dy9FbmRON1UwajVCMjJyd2FwaDV6RnZwRlVsUnZKbjZ0bFhibHV0VjVMWUFC?=
 =?utf-8?B?WS9xQ1dVQVg2SlM5ZGkvYWdKT2FKMUlwdHJjdVB2TDhuQ0h6UzN6V2ZWcndm?=
 =?utf-8?Q?bCcon+eKwVleJmpqtQeHZJGBy?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 68b993a0-4a1c-4a08-a6a2-08dc4a721a06
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Mar 2024 13:15:10.4849 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PVgy/EO/T0icv1kUA+DhjJ4ZkQaW9y67TLffhNF+cFzg1jGK9nfTVvD/NfACVrBf
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYXPR12MB9442
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 22.03.24 um 08:07 schrieb Rajneesh Bhardwaj:
> This change allows TTM to be flexible to honor NUMA localized
> allocations which can result in significant performance improvement on a
> multi socket NUMA system. On GFXIP 9.4.3 based AMD APUs, we see
> manyfold benefits of this change resulting not only in ~10% performance
> improvement in certain benchmarks but also generating more consistent
> and less sporadic results specially when the NUMA balancing is not
> explecitely disabled. In certain scenarios, workloads show a run-to-run
> variability e.g. HPL would show a ~10x performance drop after running
> back to back 4-5 times and would recover later on a subsequent run. This
> is seen with memory intensive other workloads too. It was seen that when
> CPU caches were dropped e.g. sudo sysctl -w vm.drop_caches=1, the
> variability reduced but the performance was still well below a good run.
>
> Use of __GFP_THISNODE flag ensures that during memory allocation, kernel
> prioritizes memory allocations from the local or closest NUMA node
> thereby reducing memory access latency.

Exactly that's what it doesn't do.

__GFP_THISNODE just means it enforces allocation from the specified node.

Additional to that there is a mandatory requirement that this flag is 
only used if it has to be used for correctness. And that is simply not 
the case here.

So as long as nobody can explain why that should help this is an 
absolutely no-go.

Regards,
Christian.

>   When memory is allocated using
> __GFP_THISNODE flag, memory allocations will predominantly be done on
> the local node, consequency, the shrinkers may priotitize reclaiming
> memory from caches assocoated with local node to maintain memory
> locality and minimize latency, thereby provide better shinker targeting.
>
> Reduced memory pressure on remote nodes, can also indirectly influence
> shrinker behavior by potentially reducing the frequency and intensity of
> memory reclamation operation on remote nodes and could provide improved
> overall system performance.
>
> While this change could be more beneficial in general, i.e., without the
> use of a module parameter, but in absence of widespread testing, limit
> it to the AMD GFXIP 9.4.3 based ttm pool initializations only.
>
>
> Cc: Joe Greathouse <joseph.greathouse@amd.com>
> Signed-off-by: Rajneesh Bhardwaj <rajneesh.bhardwaj@amd.com>
> ---
>   drivers/gpu/drm/amd/amdgpu/amdgpu.h       |  1 +
>   drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c   |  8 ++++++++
>   drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c   |  7 ++++++-
>   drivers/gpu/drm/ttm/tests/ttm_pool_test.c | 10 +++++-----
>   drivers/gpu/drm/ttm/ttm_device.c          |  2 +-
>   drivers/gpu/drm/ttm/ttm_pool.c            |  7 ++++++-
>   include/drm/ttm/ttm_pool.h                |  4 +++-
>   7 files changed, 30 insertions(+), 9 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu.h b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
> index 9c62552bec34..96532cfc6230 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu.h
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
> @@ -253,6 +253,7 @@ extern int amdgpu_user_partt_mode;
>   extern int amdgpu_agp;
>   
>   extern int amdgpu_wbrf;
> +extern bool strict_numa_alloc;
>   
>   #define AMDGPU_VM_MAX_NUM_CTX			4096
>   #define AMDGPU_SG_THRESHOLD			(256*1024*1024)
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
> index 80b9642f2bc4..a183a6b4493d 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
> @@ -781,6 +781,14 @@ int queue_preemption_timeout_ms = 9000;
>   module_param(queue_preemption_timeout_ms, int, 0644);
>   MODULE_PARM_DESC(queue_preemption_timeout_ms, "queue preemption timeout in ms (1 = Minimum, 9000 = default)");
>   
> +/**
> + * DOC: strict_numa_alloc(bool)
> + * Policy to force NUMA allocation requests from the proximity NUMA domain only.
> + */
> +bool strict_numa_alloc;
> +module_param(strict_numa_alloc, bool, 0444);
> +MODULE_PARM_DESC(strict_numa_alloc, "Force NUMA allocation requests to be satisfied from the closest node only (false = default)");
> +
>   /**
>    * DOC: debug_evictions(bool)
>    * Enable extra debug messages to help determine the cause of evictions
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
> index b0ed10f4de60..a9f78f85e28c 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
> @@ -1768,6 +1768,7 @@ static int amdgpu_ttm_reserve_tmr(struct amdgpu_device *adev)
>   
>   static int amdgpu_ttm_pools_init(struct amdgpu_device *adev)
>   {
> +	bool policy = true;
>   	int i;
>   
>   	if (!adev->gmc.is_app_apu || !adev->gmc.num_mem_partitions)
> @@ -1779,11 +1780,15 @@ static int amdgpu_ttm_pools_init(struct amdgpu_device *adev)
>   	if (!adev->mman.ttm_pools)
>   		return -ENOMEM;
>   
> +	/* Policy not only depends on the module param but also on the ASIC
> +	 * setting use_strict_numa_alloc as well.
> +	 */
>   	for (i = 0; i < adev->gmc.num_mem_partitions; i++) {
>   		ttm_pool_init(&adev->mman.ttm_pools[i], adev->dev,
>   			      adev->gmc.mem_partitions[i].numa.node,
> -			      false, false);
> +			      false, false, policy && strict_numa_alloc);
>   	}
> +
>   	return 0;
>   }
>   
> diff --git a/drivers/gpu/drm/ttm/tests/ttm_pool_test.c b/drivers/gpu/drm/ttm/tests/ttm_pool_test.c
> index 2d9cae8cd984..6ff47aac570a 100644
> --- a/drivers/gpu/drm/ttm/tests/ttm_pool_test.c
> +++ b/drivers/gpu/drm/ttm/tests/ttm_pool_test.c
> @@ -87,7 +87,7 @@ static struct ttm_pool *ttm_pool_pre_populated(struct kunit *test,
>   	pool = kunit_kzalloc(test, sizeof(*pool), GFP_KERNEL);
>   	KUNIT_ASSERT_NOT_NULL(test, pool);
>   
> -	ttm_pool_init(pool, devs->dev, NUMA_NO_NODE, true, false);
> +	ttm_pool_init(pool, devs->dev, NUMA_NO_NODE, true, false, false);
>   
>   	err = ttm_pool_alloc(pool, tt, &simple_ctx);
>   	KUNIT_ASSERT_EQ(test, err, 0);
> @@ -152,7 +152,7 @@ static void ttm_pool_alloc_basic(struct kunit *test)
>   	KUNIT_ASSERT_NOT_NULL(test, pool);
>   
>   	ttm_pool_init(pool, devs->dev, NUMA_NO_NODE, params->use_dma_alloc,
> -		      false);
> +		      false, false);
>   
>   	KUNIT_ASSERT_PTR_EQ(test, pool->dev, devs->dev);
>   	KUNIT_ASSERT_EQ(test, pool->nid, NUMA_NO_NODE);
> @@ -219,7 +219,7 @@ static void ttm_pool_alloc_basic_dma_addr(struct kunit *test)
>   	pool = kunit_kzalloc(test, sizeof(*pool), GFP_KERNEL);
>   	KUNIT_ASSERT_NOT_NULL(test, pool);
>   
> -	ttm_pool_init(pool, devs->dev, NUMA_NO_NODE, true, false);
> +	ttm_pool_init(pool, devs->dev, NUMA_NO_NODE, true, false, false);
>   
>   	err = ttm_pool_alloc(pool, tt, &simple_ctx);
>   	KUNIT_ASSERT_EQ(test, err, 0);
> @@ -349,7 +349,7 @@ static void ttm_pool_free_dma_alloc(struct kunit *test)
>   	pool = kunit_kzalloc(test, sizeof(*pool), GFP_KERNEL);
>   	KUNIT_ASSERT_NOT_NULL(test, pool);
>   
> -	ttm_pool_init(pool, devs->dev, NUMA_NO_NODE, true, false);
> +	ttm_pool_init(pool, devs->dev, NUMA_NO_NODE, true, false, false);
>   	ttm_pool_alloc(pool, tt, &simple_ctx);
>   
>   	pt = &pool->caching[caching].orders[order];
> @@ -380,7 +380,7 @@ static void ttm_pool_free_no_dma_alloc(struct kunit *test)
>   	pool = kunit_kzalloc(test, sizeof(*pool), GFP_KERNEL);
>   	KUNIT_ASSERT_NOT_NULL(test, pool);
>   
> -	ttm_pool_init(pool, devs->dev, NUMA_NO_NODE, false, false);
> +	ttm_pool_init(pool, devs->dev, NUMA_NO_NODE, false, false, false);
>   	ttm_pool_alloc(pool, tt, &simple_ctx);
>   
>   	pt = &pool->caching[caching].orders[order];
> diff --git a/drivers/gpu/drm/ttm/ttm_device.c b/drivers/gpu/drm/ttm/ttm_device.c
> index f5187b384ae9..540e8a44f015 100644
> --- a/drivers/gpu/drm/ttm/ttm_device.c
> +++ b/drivers/gpu/drm/ttm/ttm_device.c
> @@ -215,7 +215,7 @@ int ttm_device_init(struct ttm_device *bdev, const struct ttm_device_funcs *func
>   
>   	ttm_sys_man_init(bdev);
>   
> -	ttm_pool_init(&bdev->pool, dev, dev_to_node(dev), use_dma_alloc, use_dma32);
> +	ttm_pool_init(&bdev->pool, dev, dev_to_node(dev), use_dma_alloc, use_dma32, false);
>   
>   	bdev->vma_manager = vma_manager;
>   	spin_lock_init(&bdev->lru_lock);
> diff --git a/drivers/gpu/drm/ttm/ttm_pool.c b/drivers/gpu/drm/ttm/ttm_pool.c
> index dbc96984d331..73aafd06c361 100644
> --- a/drivers/gpu/drm/ttm/ttm_pool.c
> +++ b/drivers/gpu/drm/ttm/ttm_pool.c
> @@ -447,6 +447,9 @@ int ttm_pool_alloc(struct ttm_pool *pool, struct ttm_tt *tt,
>   	else
>   		gfp_flags |= GFP_HIGHUSER;
>   
> +	if (pool->use_strict_numa_alloc)
> +		gfp_flags |= __GFP_THISNODE;
> +
>   	for (order = min_t(unsigned int, MAX_ORDER, __fls(num_pages));
>   	     num_pages;
>   	     order = min_t(unsigned int, order, __fls(num_pages))) {
> @@ -555,7 +558,8 @@ EXPORT_SYMBOL(ttm_pool_free);
>    * Initialize the pool and its pool types.
>    */
>   void ttm_pool_init(struct ttm_pool *pool, struct device *dev,
> -		   int nid, bool use_dma_alloc, bool use_dma32)
> +		   int nid, bool use_dma_alloc, bool use_dma32,
> +		   bool use_strict_numa_alloc)
>   {
>   	unsigned int i, j;
>   
> @@ -565,6 +569,7 @@ void ttm_pool_init(struct ttm_pool *pool, struct device *dev,
>   	pool->nid = nid;
>   	pool->use_dma_alloc = use_dma_alloc;
>   	pool->use_dma32 = use_dma32;
> +	pool->use_strict_numa_alloc = use_strict_numa_alloc;
>   
>   	if (use_dma_alloc || nid != NUMA_NO_NODE) {
>   		for (i = 0; i < TTM_NUM_CACHING_TYPES; ++i)
> diff --git a/include/drm/ttm/ttm_pool.h b/include/drm/ttm/ttm_pool.h
> index 30a347e5aa11..6b7bdc952466 100644
> --- a/include/drm/ttm/ttm_pool.h
> +++ b/include/drm/ttm/ttm_pool.h
> @@ -72,6 +72,7 @@ struct ttm_pool {
>   
>   	bool use_dma_alloc;
>   	bool use_dma32;
> +	bool use_strict_numa_alloc;
>   
>   	struct {
>   		struct ttm_pool_type orders[MAX_ORDER + 1];
> @@ -83,7 +84,8 @@ int ttm_pool_alloc(struct ttm_pool *pool, struct ttm_tt *tt,
>   void ttm_pool_free(struct ttm_pool *pool, struct ttm_tt *tt);
>   
>   void ttm_pool_init(struct ttm_pool *pool, struct device *dev,
> -		   int nid, bool use_dma_alloc, bool use_dma32);
> +		   int nid, bool use_dma_alloc, bool use_dma32,
> +		   bool use_strict_numa_alloc);
>   void ttm_pool_fini(struct ttm_pool *pool);
>   
>   int ttm_pool_debugfs(struct ttm_pool *pool, struct seq_file *m);

