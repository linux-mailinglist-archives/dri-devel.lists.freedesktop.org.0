Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AC57A22249
	for <lists+dri-devel@lfdr.de>; Wed, 29 Jan 2025 17:55:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DFC1F10E124;
	Wed, 29 Jan 2025 16:54:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="i2+onNCQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam04on2047.outbound.protection.outlook.com [40.107.102.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2782C10E124;
 Wed, 29 Jan 2025 16:54:56 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EXuzGlyw4f1gNNP+jcZrVHXBRSmy8iEIVmR8YED3fcyZ1h1PRD+/E2LSMHQ7Uf5VPrM3sgTJPEVDd+oGp6IfSPZ0V5JEx2nISfnoBKdvJn30BYGMFCUzwNYoCmnv19cR8pTN6NQW3Ph58/SW5+5iiVjuaXf9cMh6Ggj5Yq6QSiuvw8Jt4ut2kb5IrMM1xcgMrm5nmV0kw2tVMqQaf2mEtt1ULCYoc8d8VYB8/d41gdJ426y9dK2RS3gonTqrdTZJK40vU+D/XfHt/P6ao+mkVpNh62MXHkStVm+EPpw0dXZw2avMDRiveHyhcqTNqiL/kQN2D3nmrTDST2Q4ouDFng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=q1TqZi6IS5naQ1BJVOcmYC2aACfi1m+rxrcXS/kPpss=;
 b=lWmevx6PMFnFE55DNet9njAlXxeQFh2QrRVP97UvkQSHwVYYdzJojuOcDb7OdERNNCaVUpEnKflrG6allWCM/+RTbS8GaFc1+TV4yjpNnlubcaWeHKqf3G9O0MVIggp2pI8WF99yLBm9YFbDjV/ww/pelhg/bsgfpfcITdJpICiWXppLBESEOwGMlF62HxK7hmaJ6ostyKuqO3Uj8qcwi7AFeSNsjYOm9ZcQKAcJCjA6TQslU5Z5CqDExaxGWAf921sPXkkuahQtRfEfHWZD5kKSOo9ygOC0iy3zfs5pEdXgZhzaSzJw/ZdXXoXt8bgRZM3kYdZobugE+bYntzK1mQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=q1TqZi6IS5naQ1BJVOcmYC2aACfi1m+rxrcXS/kPpss=;
 b=i2+onNCQhIW6ipDK8uvYa+ge3NvCdSWOwxNnvXLt5D5dhr40J135mCYRZkMFTtZVzQDFox+gE9H6DpKNksFeyDapk+wyJYx4UHzd70TdfzIIrflRIBgEruW6N7IXZW9bzfbkgiekijCxq9Kl3wtWISc1tp9mQAxlDGMrR1UUs/I=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN9PR12MB5115.namprd12.prod.outlook.com (2603:10b6:408:118::14)
 by CH3PR12MB7692.namprd12.prod.outlook.com (2603:10b6:610:145::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.18; Wed, 29 Jan
 2025 16:54:53 +0000
Received: from BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::9269:317f:e85:cf81]) by BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::9269:317f:e85:cf81%5]) with mapi id 15.20.8398.017; Wed, 29 Jan 2025
 16:54:52 +0000
Message-ID: <c27b93ab-59fd-440b-85ac-c2ea9cd3dbd1@amd.com>
Date: Wed, 29 Jan 2025 11:54:50 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] drm/amdgpu: remove all KFD fences from the BO on
 release
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 James.Zhu@amd.com, Philip.Yang@amd.com, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
References: <20250129152849.15777-1-christian.koenig@amd.com>
 <20250129152849.15777-2-christian.koenig@amd.com>
Content-Language: en-US
From: Felix Kuehling <felix.kuehling@amd.com>
In-Reply-To: <20250129152849.15777-2-christian.koenig@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YQBPR01CA0097.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:3::33) To BN9PR12MB5115.namprd12.prod.outlook.com
 (2603:10b6:408:118::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR12MB5115:EE_|CH3PR12MB7692:EE_
X-MS-Office365-Filtering-Correlation-Id: bc6e28cf-8332-4b03-fd77-08dd4085a6a4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?UWtKMHpNd3FaaHpkQjNnSlp4S2RpakNrblc1ZXBtSDd5a0lRSG5aRFFJcjlq?=
 =?utf-8?B?Vkh3aTVUNlV4ZkxQS2kxZlVLQ3g5WHNEZmlScmZsaDBOS09ILzRuczJzNXpG?=
 =?utf-8?B?S1FwUHQ1WVFreW0wOWkzakxoblBmKzJkZ2dENDJQREl0T01EcG1qRUNoSUR3?=
 =?utf-8?B?WUt3SFpCeGlmTXlJdEM3eEtDdmIwQW5nL3lpU0JtM0VyL2toOVZCVW5LY25a?=
 =?utf-8?B?RDlzdi9waFhpcDhDakJEZDlRUklYWVg0S1JQNWlGc1pwYWI5dWI4aDFkdk9p?=
 =?utf-8?B?Z1VmYkFzbWxJZVFGK2d5bHluR3hTNEVSdmczaExnZmlKTkIxdjRLdjVLUkcx?=
 =?utf-8?B?akVuODRhdSsrU2ZiSUpaSk1yZnNvN2s3Rk5BMVA0NW5QZE41SUh3QisvNFBY?=
 =?utf-8?B?bHRpZ042NnJ6WU5ETGJBRGs2Mmk4aFRRWEJRejl2d080N1Y4b3VwTGZYaWJl?=
 =?utf-8?B?RVlYMGk1OXZPek5ONW9WN041aVpBUURSaWVxZ1JYWGFkQnBYVUxVSHJMQ1Zv?=
 =?utf-8?B?TmlwZm92Q2U5ejRhb1AvcVQ2Qzkxa1g3b2ZCZ0FyZVZPcENRYWpIbTBsS1M2?=
 =?utf-8?B?T1ZJWW5na0lDb2FiSVVpRnEyY3dra1owRS9iVmt4NHpSN0pmVy9iRFN6ZGdz?=
 =?utf-8?B?ck04dS93Z1V4c0c3dVJsb3NEelpiamNFWmVlVmdURmFDczV2QTVwZ0Y3bDMr?=
 =?utf-8?B?R3ZRTEJ6UVhENDdmNXI4WFFDUDdnSU91ZnZGN2ZxV0piL0VmUHpzUE56ZDFO?=
 =?utf-8?B?Z1VYaGEzdmZPT1hsOFdPZXhuaFY5ZG5kdXBTMTNsMVc4VytEUjZ4V3BDdVdC?=
 =?utf-8?B?bUVaejVUTDN6VmczOHdYVVN1cG9tUkI3emZrYm1tN2xROE9McFU3T0E4QWZh?=
 =?utf-8?B?SngzSDZZU21Od2VuT1c1eUpSOGZocU5xdGt5eDU2eW9IbGRRaExiNEZJa3NV?=
 =?utf-8?B?UFJvZDNUVEg4YXlicmJDRkN1SlRFVE5RRHc2a0hrd25qZ2lMNzhYRmxIbVVq?=
 =?utf-8?B?N2FxcTNERHpPbkI4S1FxNk1WWStIMFRnRUcrbWN6L2wyMmhaOGQwRW9pTnNL?=
 =?utf-8?B?KzRVWGEvdnNNZDBUWTMxaHFmbnQ2eDJyUGV3MHJ0dzBCc2pvcURnMGlzaEdi?=
 =?utf-8?B?My9TeHcvRmtBQzB0YmtYYlVCK3BML2l2aWNyelBxUm9OZFJ1MHZSdHdlK241?=
 =?utf-8?B?SG5waVRsY3pTTk9SSjI3elZsaUZVOTJTZmxaQ2NZTzR4LzV4QjFjT2FjNUlh?=
 =?utf-8?B?Ym51ZWZ1VmFGTVZYQ3BnN2xYVVFjUkVwTzhmRnI0UHFmcEorWEZZZWR1aDRB?=
 =?utf-8?B?d0VoVG9XcldCTGp0MlA4TExpbHB0ZkEzaG5oeGRVWC92OENEREpEY1BRUEQ1?=
 =?utf-8?B?OWU5bGFYZnBzS3l6VVZxRU5RZkJxa2E0MU5tZ1NNaXhlR0ZnUWU5Tk94bGw4?=
 =?utf-8?B?RStLMUt4cllWS1AyNWlMZis5VENDbEdmR2o0dWYrMDV0dEthZ2NqdnNrOWtB?=
 =?utf-8?B?eFZQdGZjakJCbkg0Tk1QZGVHT21KVTlUbGVQclJNNDh0MXgySnF0MU5CL1o3?=
 =?utf-8?B?U0lOUDZMUkx0aWtGM25DV2VyUndsWk5EZkhTNHQwVE5WbUJ5Y2o4cHlwbGg1?=
 =?utf-8?B?OWtGakI0bjd6L1czeXE4WnJOZVR1SkMvYlBqVmpxUE52MEFtcmsxbDdwclEw?=
 =?utf-8?B?cXRBRHpzZ29uYUp1cVBpcHZlMS9LVkQwWXk1M3JVRmVFT3dJT0tIZzhIbWJP?=
 =?utf-8?B?M1B3ODJ2RWwwYmR0aHRxWjFhWnFQWTVjRHJvSjd5azNFaWRXL1R1YXNqd3E1?=
 =?utf-8?B?allzeXBCUlFZUTRPOXpZQ0o2Z1dJUUJ0QXQ2dXFlZ3lxNUdMa3BsWFhlMjJ6?=
 =?utf-8?Q?oQHRIiofskchl?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR12MB5115.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bWk4M0Q0NnEwNGdWdWhlV0NvSUxNNC9Kbjh1Y2xwSWVsUjlVY3E1MFdGTzBN?=
 =?utf-8?B?MU9iTFdzanM3ZUU1eEVPTW1xRk5VdU5pZkZ0b3NJZHpkbElLd21DVnlsL2xW?=
 =?utf-8?B?MEtJZEhuaGZOM1BXUnpxMHFDRmllRzlGNnF3Q3J0SHhSdUJ5bHQ1R3UzQXJZ?=
 =?utf-8?B?L0hsWis2ZnVTd1lpTXphUFhEMHlrbFNMcms3S2RBcXRIM0d1SnpOVFhrQUdh?=
 =?utf-8?B?R3RTM0JqcWtUWXl1U1pvTFJLRW55RVhwWGdQckZQRUpKU2FzUUdDRExjY203?=
 =?utf-8?B?T3VzWlZqY1BjaG9nYnBnN2JRcWxTbWpWSHkrTDdLS0hsWk91ZmhmTHFYc1pa?=
 =?utf-8?B?MStuVFVJdSt5K0d1eUJQMEJ2NTNZY0xkcUpZNEZwbE1LaFEwS3liZEV1UFpv?=
 =?utf-8?B?R3pNQ1R3NW5sbmZaMnhqSWRjZ1BNdmRUSVIzdTZmVWNPWHVITjVXbjIzVmFS?=
 =?utf-8?B?OFJhalgxcG1ncnl1Y3BJNUlvWXJlR3F1T2ViMmQrRVJHdnNBTSszRXVIR3FH?=
 =?utf-8?B?cy9XMUVEYmhPRXZzOHIrWk55MzA5Y1BJRHhuV2c3RHdxVFhHbHhFeDNTVW1x?=
 =?utf-8?B?L0V6cGRNSGQ0aFRHUFJPVlVQc1YzTm44ZVUwSE1CT01iTzdlblV1cW5JK2ZU?=
 =?utf-8?B?M3REd2pxTjE0Z3FneG1XZHNON3BLaWc5eVJINEFiVENYM1l1TWgzRjB0blNr?=
 =?utf-8?B?YmJiZ1liaVo3cTJCeFN0ZjAzdEtuaFJUV2w4UXZoYWZYeDFybnp0L1FRU2dI?=
 =?utf-8?B?MnJEa3FJOVp5WVNaUFBUOCtJSE1Kc2t6aHRVTTBMb0tQVVBJRjNRbXlQbmhu?=
 =?utf-8?B?U0hWMDJSSG5qVVJXYzNheFNOaW9aRnpQbEZuNWZKNitmSlVla25QRzlnSnk1?=
 =?utf-8?B?K2gzM3lBbHZTZkpQZVJ1dTZ1SHZ3Ulh1ZExJVWZLME5OeC9LUUVORGNWaGdy?=
 =?utf-8?B?L25qVU5yd0JTclFtZGFKN3QvSURZT3ZGZUt1TmU4SHNzK2Jidk1KVkorN3di?=
 =?utf-8?B?OXMrMVJ1WWFhd0JEOFloUmhqK05wS3hDV25JcWlUbHJ6WjArTjVDb2pOelBt?=
 =?utf-8?B?d3FhbVJDUnEyR2ZFM1oxdU45Yi9lR0kwclBzcURqWDY2dmJmbnpzZllaOFc4?=
 =?utf-8?B?eTRxVmJ2anBrVWxVUkt3VEUyWmwrbmRVMFA1aFpuUDVQSEIyQVhHYXNtV2No?=
 =?utf-8?B?Q1JmVStyVWVPUmVTU1hFVkVKZGQwRTE2T1RxbTJPVUxldk5WNXN3TWFXWHI5?=
 =?utf-8?B?VzhMYkx2Q09xQTVkNGNwTjJNZGVOS1JyY0JHWU9hR3ZCODRNYWhLcUQ5Z2wy?=
 =?utf-8?B?OVo4d1Iwcy9PbnJFcEMzOG51bU03RkRDdFFDMCt0VFlZcnhDMGUwZ08yVEJy?=
 =?utf-8?B?RTU2RUhIcnUxeWh0L2FHcUI3ank4QStCM25MWnZEYUY3MzhnOXo4YmpsWUtW?=
 =?utf-8?B?am5iR01Od3lMM2VYRFhyamkwcnpFV09IcVdRMXJkZ0VVUjRYenVHam5Xa2VB?=
 =?utf-8?B?TjNnZktpWVI2eTc4NVozTkJiMjIwcWdNek51dkhXd0hoV2RvWGhwelA4Vm0x?=
 =?utf-8?B?czdzY2dqMGNOM2dNczhXOVpJa0pRTVk2ajgxZDdhaXlOQ2hMcG4zQ1R3ZUl1?=
 =?utf-8?B?d3owQ2taSDZVcVdxbFZ0ZGF5MGNobFFYY1FwQmRyN3YvVmdqMFZ4QjZTN1pM?=
 =?utf-8?B?SVU4Ym5pMXNZSmFqMy9RQXZQaUNoZmpOSjdrUmd1WWgxTXNJUjhoV2hPbE5N?=
 =?utf-8?B?QVNzWnFsV1JEMy9YbjhoMmR2NHVmamQ3eTUyL3h4RVF1b1R1eHZFd1VCME1T?=
 =?utf-8?B?L1BXNkVwWkZFS0N2ZUd0WUdJb3MwRkliV042akUwcERjNnBCV2tzZjA1eEdY?=
 =?utf-8?B?WThNZkxxbEN6dDFnOEkwRm9pbjJxOWs3U1RVZDFYMEozaC9IWDV3bWc2am9r?=
 =?utf-8?B?ZDdsUzA5YlZXNFJnUURSb2UrOENteTc5Rk42MGpkQjdHTjdvRldmeGZNM0pv?=
 =?utf-8?B?dEk2VDVmbVRjZWw1K3d0c3Rad1pNZ21Pa2tBS2d4a0dmZGRwY0xObDh6clNP?=
 =?utf-8?B?akJ5L0E3SE1rVWNLckZqcTNNM0xTYWlLaFE3VkJJM2xtMDgvNm5Zd1ZiWXk1?=
 =?utf-8?Q?DhF9RRl74FzB1nUPyt3bewng2?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bc6e28cf-8332-4b03-fd77-08dd4085a6a4
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5115.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jan 2025 16:54:52.9018 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nmHyCbP4ohZkndRrtRlwFRE6G5eAtM6/ZxDOK5FydWknjSsacVd1Hw5CTpaI8xbSQBkV9+qoeuXlLnyX5Hr56g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB7692
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



On 2025-01-29 10:28, Christian König wrote:
> Remove all KFD BOs from the private dma_resv object.
> 
> This prevents the KFD from being evitec unecessarily when an exported BO
> is released.
> 
> Signed-off-by: Christian König <christian.koenig@amd.com>

Looks good to me. Assuming James doesn't find any issues in testing, the series is

Reviewed-by: Felix Kuehling <felix.kuehling@amd.com>


> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.h    |  5 +-
>  .../gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c  | 52 ++++++++-----------
>  drivers/gpu/drm/amd/amdgpu/amdgpu_object.c    | 38 ++++++++------
>  3 files changed, 47 insertions(+), 48 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.h
> index 4b80ad860639..62917f76da33 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.h
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.h
> @@ -192,7 +192,7 @@ int kfd_debugfs_kfd_mem_limits(struct seq_file *m, void *data);
>  #if IS_ENABLED(CONFIG_HSA_AMD)
>  bool amdkfd_fence_check_mm(struct dma_fence *f, struct mm_struct *mm);
>  struct amdgpu_amdkfd_fence *to_amdgpu_amdkfd_fence(struct dma_fence *f);
> -int amdgpu_amdkfd_remove_fence_on_pt_pd_bos(struct amdgpu_bo *bo);
> +void amdgpu_amdkfd_remove_all_eviction_fences(struct amdgpu_bo *bo);
>  int amdgpu_amdkfd_evict_userptr(struct mmu_interval_notifier *mni,
>  				unsigned long cur_seq, struct kgd_mem *mem);
>  int amdgpu_amdkfd_bo_validate_and_fence(struct amdgpu_bo *bo,
> @@ -212,9 +212,8 @@ struct amdgpu_amdkfd_fence *to_amdgpu_amdkfd_fence(struct dma_fence *f)
>  }
>  
>  static inline
> -int amdgpu_amdkfd_remove_fence_on_pt_pd_bos(struct amdgpu_bo *bo)
> +void amdgpu_amdkfd_remove_all_eviction_fences(struct amdgpu_bo *bo)
>  {
> -	return 0;
>  }
>  
>  static inline
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
> index f30548f4c3b3..609b27fe1cda 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
> @@ -370,40 +370,32 @@ static int amdgpu_amdkfd_remove_eviction_fence(struct amdgpu_bo *bo,
>  	return 0;
>  }
>  
> -int amdgpu_amdkfd_remove_fence_on_pt_pd_bos(struct amdgpu_bo *bo)
> +/**
> + * amdgpu_amdkfd_remove_all_eviction_fences - Remove all eviction fences
> + * @bo: the BO where to remove the evictions fences from.
> + *
> + * This functions should only be used on release when all references to the BO
> + * are already dropped. We remove the eviction fence from the private copy of
> + * the dma_resv object here since that is what is used during release to
> + * determine of the BO is idle or not.
> + */
> +void amdgpu_amdkfd_remove_all_eviction_fences(struct amdgpu_bo *bo)
>  {
> -	struct amdgpu_bo *root = bo;
> -	struct amdgpu_vm_bo_base *vm_bo;
> -	struct amdgpu_vm *vm;
> -	struct amdkfd_process_info *info;
> -	struct amdgpu_amdkfd_fence *ef;
> -	int ret;
> -
> -	/* we can always get vm_bo from root PD bo.*/
> -	while (root->parent)
> -		root = root->parent;
> +	struct dma_resv *resv = &bo->tbo.base._resv;
> +	struct dma_fence *fence, *stub;
> +	struct dma_resv_iter cursor;
>  
> -	vm_bo = root->vm_bo;
> -	if (!vm_bo)
> -		return 0;
> +	dma_resv_assert_held(resv);
>  
> -	vm = vm_bo->vm;
> -	if (!vm)
> -		return 0;
> -
> -	info = vm->process_info;
> -	if (!info || !info->eviction_fence)
> -		return 0;
> -
> -	ef = container_of(dma_fence_get(&info->eviction_fence->base),
> -			struct amdgpu_amdkfd_fence, base);
> -
> -	BUG_ON(!dma_resv_trylock(bo->tbo.base.resv));
> -	ret = amdgpu_amdkfd_remove_eviction_fence(bo, ef);
> -	dma_resv_unlock(bo->tbo.base.resv);
> +	stub = dma_fence_get_stub();
> +	dma_resv_for_each_fence(&cursor, resv, DMA_RESV_USAGE_BOOKKEEP, fence) {
> +		if (!to_amdgpu_amdkfd_fence(fence))
> +			continue;
>  
> -	dma_fence_put(&ef->base);
> -	return ret;
> +		dma_resv_replace_fences(resv, fence->context, stub,
> +					DMA_RESV_USAGE_BOOKKEEP);
> +	}
> +	dma_fence_put(stub);
>  }
>  
>  static int amdgpu_amdkfd_bo_validate(struct amdgpu_bo *bo, uint32_t domain,
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
> index fc94b8b9b86d..d12be7a1eb6e 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
> @@ -1194,28 +1194,36 @@ void amdgpu_bo_release_notify(struct ttm_buffer_object *bo)
>  	if (abo->kfd_bo)
>  		amdgpu_amdkfd_release_notify(abo);
>  
> -	/* We only remove the fence if the resv has individualized. */
> -	WARN_ON_ONCE(bo->type == ttm_bo_type_kernel
> -			&& bo->base.resv != &bo->base._resv);
> -	if (bo->base.resv == &bo->base._resv)
> -		amdgpu_amdkfd_remove_fence_on_pt_pd_bos(abo);
> +	/*
> +	 * We lock the private dma_resv object here and since the BO is about to
> +	 * be released nobody else should have a pointer to it.
> +	 * So when this locking here fails something is wrong with the reference
> +	 * counting.
> +	 */
> +	if (WARN_ON_ONCE(!dma_resv_trylock(&bo->base._resv)))
> +		return;
> +
> +	amdgpu_amdkfd_remove_all_eviction_fences(abo);
>  
>  	if (!bo->resource || bo->resource->mem_type != TTM_PL_VRAM ||
>  	    !(abo->flags & AMDGPU_GEM_CREATE_VRAM_WIPE_ON_RELEASE) ||
>  	    adev->in_suspend || drm_dev_is_unplugged(adev_to_drm(adev)))
> -		return;
> +		goto out;
>  
> -	if (WARN_ON_ONCE(!dma_resv_trylock(bo->base.resv)))
> -		return;
> +	r = dma_resv_reserve_fences(&bo->base._resv, 1);
> +	if (r)
> +		goto out;
>  
> -	r = amdgpu_fill_buffer(abo, 0, bo->base.resv, &fence, true);
> -	if (!WARN_ON(r)) {
> -		amdgpu_vram_mgr_set_cleared(bo->resource);
> -		amdgpu_bo_fence(abo, fence, false);
> -		dma_fence_put(fence);
> -	}
> +	r = amdgpu_fill_buffer(abo, 0, &bo->base._resv, &fence, true);
> +	if (WARN_ON(r))
> +		goto out;
> +
> +	amdgpu_vram_mgr_set_cleared(bo->resource);
> +	dma_resv_add_fence(&bo->base._resv, fence, DMA_RESV_USAGE_KERNEL);
> +	dma_fence_put(fence);
>  
> -	dma_resv_unlock(bo->base.resv);
> +out:
> +	dma_resv_unlock(&bo->base._resv);
>  }
>  
>  /**

