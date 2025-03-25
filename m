Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D3E5A702DC
	for <lists+dri-devel@lfdr.de>; Tue, 25 Mar 2025 14:54:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6071810E39F;
	Tue, 25 Mar 2025 13:54:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="vIhd1CAy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2051.outbound.protection.outlook.com [40.107.93.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4BD1B10E39F
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Mar 2025 13:54:03 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tS/915zoOB4EhbVUAbA6zHgmDNYLwyqy59kNdq+a+c58xi9FuZPQHjVhBGOVu3NwSqAqJdsYOdX8tI9m5f4L/Lf+4pYI17RS5ouLxBNtAUB1078e4Mq7CWB46moaBPTlZlhw9QjFQPkL0rw/fDgL0tzmRDZ/tTWTG5PNvth3RU/owGuc3sKAPmy/4bfZm7777mYBhAePwXHJO5azeVKYfugqyliQP4PwtV94PLplY0lAaWaFHzMW3hxpUiJOYgLQsEQUOxcx1KUKZKMzx6dQ0NWyiDXdX+tAg+GeEFBJ6VdKRkE4/BH4izVEQ1liLsMunsaOBZoP35HuWyAS18aJEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jabTK0vn13yTPseleUMUYPwKe5P1Km3uzVHaTACFNuY=;
 b=pMIk32k8OWPjZYnVoslFBH5M44VSSQTf5pWia8APtsW3GbycPg+uYMOZNAfLpJ5avqV9mxHGFmGHL/cMtP2VhMd2tnB1yulxDVhv93R951XFWh/USqL6QNRGHVEY8LCm3Xd2lGG1XEYOIDist1z1+j3kz5p3IvfdhI6MU3FD0vKhcEhXJCTq3TPmb+8w6bZYnwP2o4MMmuXEgkaAg/mUpSWF+fQUeagNC0v39Psj4HJm3JoVPnUm2g3HiWWgtD6H3GkUQA1YLlLlc/BUkenzLXKgkC0vRZoAqUeJMHOpM5Ogy6ydkSWdgYqB0BQDwTX72Eg+Iqz+FuWoBHj6c+Nbgw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jabTK0vn13yTPseleUMUYPwKe5P1Km3uzVHaTACFNuY=;
 b=vIhd1CAytX8ojbI8sI/AEf3ZXjHJBP3Txn4HPIcvxgJYbpg26fxSAtiNVaknBltMMr2vaoH56ho/GMW+5lfRpoKwoyk5KcEaIY+U5jFXLLNZ2Hn18AQ6v6IeHIXeuMjLQ+yWv9di72KPI/kAb/mBNFo6u+0+gYZoO+zWR6ZMia4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by DS7PR12MB6335.namprd12.prod.outlook.com (2603:10b6:8:94::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.42; Tue, 25 Mar
 2025 13:54:00 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%5]) with mapi id 15.20.8511.026; Tue, 25 Mar 2025
 13:54:00 +0000
Message-ID: <92f87a44-931a-44af-9acc-65f0d062b611@amd.com>
Date: Tue, 25 Mar 2025 14:53:52 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/gem-shmem: Optimize DMA mapping for exported buffers
To: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>,
 dri-devel@lists.freedesktop.org
Cc: sumit.semwal@linaro.org, simona@ffwll.ch, airlied@gmail.com,
 tzimmermann@suse.de
References: <20250325133744.23805-1-jacek.lawrynowicz@linux.intel.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20250325133744.23805-1-jacek.lawrynowicz@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR5P281CA0002.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:f2::20) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|DS7PR12MB6335:EE_
X-MS-Office365-Filtering-Correlation-Id: d54416d8-a7fb-4f5c-9e71-08dd6ba47eeb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dHgrVHIvbDVuR3JtSmxHRUQwaDZBOU42OW9MdS9tQzBJR0VhaUZkSWRNNnNK?=
 =?utf-8?B?a1pCU3EyTlJuWWUrWk1heXg3S3pqRkJHRm80MDljUklDemt4ZStvMjhaL3Bk?=
 =?utf-8?B?OXFVN2ZNeUk5bEMrNGo1dkdxcU5LN2FscVNvRGFHcHQ3cm1uWlQ5NHpQcVpD?=
 =?utf-8?B?Q3RxNldrRjF6eDlaSGgzdEdiSTZQSUY0OWxMcHc5UEllUEh4QmUzMEpEaE1j?=
 =?utf-8?B?M2Jva01JK2RtMitTMkx0NGdZeFBRY2xrcCtSTGVZaE9XVWt2MlRzUC9iZ3Br?=
 =?utf-8?B?MEUzU1Q5eHRuRHo0aVE3RFd6ZTZTL0szWFZBbzk0ZUV1N3cya0JBWjFXNXNJ?=
 =?utf-8?B?MGdLVEFDYjlJWFpZb2xQbml6UFFHU00rK0JyUUJGRGR5ZmF2WERmMVVpN3oz?=
 =?utf-8?B?TUorYTZ6a2wvWG8rNzI2SDNCRDR3dGFPWDA0eUFIbndiSDhMTTRGbExuY3lJ?=
 =?utf-8?B?aFZNekZFbXZFQXZlVEI2UTVydHFHUTVBU2kxK0lnWC9US3A3SFIyN3JSTU1x?=
 =?utf-8?B?RmQzbTc4QnowYkhYSkd0eHpLdHg4cENzTklacXRVRkZrRGgyWmNuTUVrU0pJ?=
 =?utf-8?B?bzgxa2w4b1FrUlR3aXV4VGJ2dFlwWUIzMFRTSFZLdGV2czUvTkIrL1puTVhJ?=
 =?utf-8?B?bDlnVjZ2ZHdPUEFrY212V2RnczJYbW9MRmZ5V3hVZGxIcVZ4V0pwNkVMWGxZ?=
 =?utf-8?B?S2tFOEoxSUFMbEpqMng4NkQyaUtwNDJVTnF0cUpJSzE0eHdyUmNBV0ZOMGxa?=
 =?utf-8?B?VmJ2TmZUYnI2QS9kNGRyOXhKckMxVkZ2eVk0L1p5bVFURE5ERlJYdXdBcm9u?=
 =?utf-8?B?WWZheVJPNjkwamU3VUZnYm1wVytmM2FWb2QyYVdseWZiWDdBY0cvanlTVzhP?=
 =?utf-8?B?aUcwU1oyZmN6bWJrM1MyY09IODZONm9PN1NhSDZGNW1WeWducnQvaWI0UGRi?=
 =?utf-8?B?eE9HRXhHTzBOL2NXTk1XTzlGVExwL0V3RXAxbW1MTGlzcnVkaVN4QjE0U2ZN?=
 =?utf-8?B?aVFXd0FzVHFTdTY1Y3ErdjNWT1Y4NGFKcFFGSWViS09NR3ZaWEw1WENEUGtN?=
 =?utf-8?B?WjNsNjhXQ21vaU92aFR5NERaQWp6aGw5amI3Wjg2bHg1OWFSRFVKc2taRFpR?=
 =?utf-8?B?dS9lTDdCbiswMUN6UlZ3Mkdad09VRy9FbW9PemNiRXlmYU14djlCaVZ6cHU1?=
 =?utf-8?B?Z05BaStqa1R2aWkzSVY4STNYbGZnQlVERXdWcXpaRXN2L0gvZGZGWU1UUkZi?=
 =?utf-8?B?Y1g3UGoxTDRndjUvQmV1ak1ubjhWMXQzRVZla1QxOEM1blMvM01kamNydmlq?=
 =?utf-8?B?dXhZeHB4TG83LzZmZWp6eE1hZXVNUWhUNGh1RHNJOHcvOTc5bEdtT3R6d1d3?=
 =?utf-8?B?UHMvSHRJd3NZZGtHS1dmNHdlSVpuV2tvYnJYZWN3a0YwdVhBazRZeHlmY3dW?=
 =?utf-8?B?SkowTTBibDM0cjhkWHFHSGY4RHRCdTROZUdVWkZwUi9OYTBmOW00TG5YZnNx?=
 =?utf-8?B?WG9Fa3dROFNBQXF2a09RalhnRW5vUjhGWjB2a2tlNzdUc3gvNC8ySGtTNy9q?=
 =?utf-8?B?WHJ1NVhtelBucGxOT0Uybk02TEpWYnZLYnhralVBd3llNUhHRFFzNEdLZHBl?=
 =?utf-8?B?WUk5V090R295elNVZ3g0UktLZzAxb1dHZDBDRzF0S0ZOVlpFQWI0eUVmN3Zh?=
 =?utf-8?B?Rk4zRFRVUS9MdDU1bFYvSkNwMUczSUxadzRPcmRBV3hHcEZiNmZsUHU2MGRU?=
 =?utf-8?B?QUJRSjhBR2J0ZFp3NittTjJZQ20wUkQrR3lpSnRMa0NlMmd4OXJpMUVEL2JG?=
 =?utf-8?B?OTRXU3ZyTWtKRnlrSjdReXVUUkk5TW1PNWVlRnZlMklnc0xtSTBaaDRaN3Ba?=
 =?utf-8?Q?coPmBeLk0LPOf?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bXV2cWtBemNOS3gvWmdRbmovMkx2ZnY3RmxrSnVXekJHZFIvZ1o1OWxhUlQ5?=
 =?utf-8?B?ZXY1Q2l3aHZwUkMrODU1TndUSVFGN3prWktPY3dGRjA0SmhBVkkvWFU3YlpU?=
 =?utf-8?B?YlhBa0J0SUc3RzJWQWNaWnJVb2pMektPSWw3L0VqaDROYTc4SlozSE11QnIz?=
 =?utf-8?B?a2VlY0R1a2puV1FPMkdFblZkc0ZhMWlGMitUK21oQkdLVDBXUEZtdXd3NkhD?=
 =?utf-8?B?U25PY0orcUVXTlFVRFFRUXZzSFFBUzR5WTB5Qk5qRnRwbVplYTVPc1BGTGVU?=
 =?utf-8?B?dXY0ejJzcmI1OURtUjA3RVdaVGppNHUrN1BQMW4rcDIvdmU1UlErUXZhVU02?=
 =?utf-8?B?SXpZSDRrMndBMW9QcmUxQ0ZINlFNanNPdFJhdytVbXZXcnNPdzNkbzd5MWlk?=
 =?utf-8?B?Slh4VEtYNjNWMVNleVp1RFJteXVZc0lLTWNpb0RzUXZJYjlmSGxRVk5QWmhR?=
 =?utf-8?B?YzZWWmczTzNFVDBmbVplemxqWGczZ0VnNjJuZjVyWVJNbEZ5dW13VXNXWUZk?=
 =?utf-8?B?Z0FXTDNlRHBKM0VIemN1RW1teUk4RkpBOXh2WFNmdDBoTEltNjhPUzZHQ2Zt?=
 =?utf-8?B?ZEorNGExdjdkeXBIZy8xWmVHK3R6MkhhaVhFREJ0eUM5YTgyU0FoOVVTZTI4?=
 =?utf-8?B?WkgzUjNqU2UweE0yYVBSK0dlaFc5N1hsSjF2dElYRUo0ZjNXK3BNMHdyK0tn?=
 =?utf-8?B?R2hUemZKRXNuR0lkV25jQWc5RmZJWWVYUEpqbGQ1TVJpRTJNdEh5UjhZOC9J?=
 =?utf-8?B?ZHVkQ2RDWFR6SUpEa09BLzBuTmZxOE1PT1dPZ3VnTS9jRHU5TnB2L1RZckFG?=
 =?utf-8?B?WlJpNTZCMWdZVjFxZVIvNFc1NldJQjZ5dTlrTk1RUTV2eEtIRTZpQTlia0p3?=
 =?utf-8?B?QjVFZHFYeEpOTkJ1SXk1enZIYmJETnBrVmhZTWNvZEUxamVwZXZhcUYyUEJM?=
 =?utf-8?B?SlQ1eVZvYmkxeWdqOVhFM2RyR2tIRno0NnF6ZjRjRHE2M3VvK0xWZE9HM0Fk?=
 =?utf-8?B?WU9XalRKWEFPSlM1a0YrYjFKOFFvYm9PbENscnVIL05xMEJIYnBLSnB4N0p0?=
 =?utf-8?B?aWR5MmNiaXI5anRZSERQVFNuYkxMbWhrQmZVZkZsaUUzVVRaQzQ1OG96Tmpj?=
 =?utf-8?B?d3luTnpNdDRpa3BGcktXQjBPdnd3RHowU21nM3V1QS91N3ExRHRINlowSWZn?=
 =?utf-8?B?cEU5MVAzVEtsMnJlRlc3Tm1iajNkVHFSaytScCtVT1BRWmliNU96SCtSRG1y?=
 =?utf-8?B?TkdkdFgxU2U5eE0xNzZONy85RXR3OFNZSjZyN3Q4cHFDZmVqUVhYd2NpTUFx?=
 =?utf-8?B?YnJ3T3R3M1N5SU1rd1ZkOGJUVU5MNEtPU2ZTcmFORkJWNmtEWDhDY0pWcU1I?=
 =?utf-8?B?QmlKQmFxdVhWVHZLUTRxTnpsY05ZYlhxVzlIYnJ2Z0x4NXozeDNqMit5VEN6?=
 =?utf-8?B?dFNZNFUyQUdvRUUxaFFCTVpROU13bk9jZXNKMkNSRHh1NVZLVldvTWp6WUpr?=
 =?utf-8?B?MEV4enZxajVFUTU2d3RmTFVZVmh6aFZsYmZ2bWhtbEFtbGtpaGZCYitwcTkx?=
 =?utf-8?B?d3lES2RLczhkaFg1N0lzZzl4ci83U2xkUWorYWVlTDNMQUlQQUxXNWd4b0lO?=
 =?utf-8?B?bXFtZHZsR1dTa09ndTYvWVdNSEE3azFqTll3dmQzUTZkSDdVcTJqdWpudTkx?=
 =?utf-8?B?aDlyajVFdEIvTEQrVGJaTGFCUjg0RkZodGQxS3AwR2ZhUG9aa0luQStZWkhj?=
 =?utf-8?B?Mi9kZzgyNWFYcUhWa1VGcDlOc25JNVlOdW9MUTNuaDB5NFJGUGluQVpYaTRB?=
 =?utf-8?B?S0pRNU9CYTVCQTVCb1F4Z3JYV2owYVcxOUhneWhnQkEwdFprT3c0WTRYZzJZ?=
 =?utf-8?B?RHpuNWNXNkphRUs3Nkl3SkM0MlBvTFU5TWtSVU43NExtaUhzcW93bWwvZjFn?=
 =?utf-8?B?cDNGa1FmMi9hNjZpZ1p5dGhHNG1sbm80RTZKRVpEWU9ja2ZINU04MVdVSkk1?=
 =?utf-8?B?cmZabDBaVy9lR0RqL2lJVUEycllFV0VqRU1KVXE2RVhJM2pBbm13c29lTENJ?=
 =?utf-8?B?ZmpHaHMveXZ5bEp0SUNsVTVnK3BMYUtoNlZLb3hINGM3NVRIbSsvU0JYbk9E?=
 =?utf-8?Q?6DLwg9JzOoUn9899Bhcg0Vtxg?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d54416d8-a7fb-4f5c-9e71-08dd6ba47eeb
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Mar 2025 13:54:00.7205 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BFGRSrHRywrJ8LVuQYQZJqwh9kXHhliQS4zz8vO7Q3MdZQtITcB8rb/eowG1X4fU
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB6335
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

Am 25.03.25 um 14:37 schrieb Jacek Lawrynowicz:
> Use DMA_ATTR_SKIP_CPU_SYNC flag for exported buffers during DMA mapping.
> The same flag is already used by drm_gem_map_dma_buf() for imported
> buffers.
>
> Signed-off-by: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
> ---
>  drivers/gpu/drm/drm_gem_shmem_helper.c |  8 ++++++--
>  include/drm/drm_gem.h                  | 12 ++++++++++++
>  2 files changed, 18 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/drm_gem_shmem_helper.c b/drivers/gpu/drm/drm_gem_shmem_helper.c
> index d99dee67353a1..8938d8e3de52f 100644
> --- a/drivers/gpu/drm/drm_gem_shmem_helper.c
> +++ b/drivers/gpu/drm/drm_gem_shmem_helper.c
> @@ -699,7 +699,7 @@ EXPORT_SYMBOL_GPL(drm_gem_shmem_get_sg_table);
>  static struct sg_table *drm_gem_shmem_get_pages_sgt_locked(struct drm_gem_shmem_object *shmem)
>  {
>  	struct drm_gem_object *obj = &shmem->base;
> -	int ret;
> +	int ret, flags = 0;
>  	struct sg_table *sgt;
>  
>  	if (shmem->sgt)
> @@ -716,8 +716,12 @@ static struct sg_table *drm_gem_shmem_get_pages_sgt_locked(struct drm_gem_shmem_
>  		ret = PTR_ERR(sgt);
>  		goto err_put_pages;
>  	}
> +
> +	if (drm_gem_is_exported())
> +		flags |= DMA_ATTR_SKIP_CPU_SYNC;

We should probably just unconditionally set this flag or not at all.

Otherwise we could run into quite some surprises.

Regards,
Christian.

> +
>  	/* Map the pages for use by the h/w. */
> -	ret = dma_map_sgtable(obj->dev->dev, sgt, DMA_BIDIRECTIONAL, 0);
> +	ret = dma_map_sgtable(obj->dev->dev, sgt, DMA_BIDIRECTIONAL, flags);
>  	if (ret)
>  		goto err_free_sgt;
>  
> diff --git a/include/drm/drm_gem.h b/include/drm/drm_gem.h
> index 2bf893eabb4b2..7c355a44d0a49 100644
> --- a/include/drm/drm_gem.h
> +++ b/include/drm/drm_gem.h
> @@ -589,6 +589,18 @@ static inline bool drm_gem_is_imported(const struct drm_gem_object *obj)
>  	return obj->dma_buf && (obj->dma_buf->priv != obj);
>  }
>  
> +/**
> + * drm_gem_is_exported() - Tests if GEM object's buffer has been exported
> + * @obj: the GEM object
> + *
> + * Returns:
> + * True if the GEM object's buffer has been exported, false otherwise
> + */
> +static inline bool drm_gem_is_exported(const struct drm_gem_object *obj)
> +{
> +	return obj->dma_buf && (obj->dma_buf->priv == obj);
> +}
> +
>  #ifdef CONFIG_LOCKDEP
>  /**
>   * drm_gem_gpuva_set_lock() - Set the lock protecting accesses to the gpuva list.

