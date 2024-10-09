Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CDC92996A0D
	for <lists+dri-devel@lfdr.de>; Wed,  9 Oct 2024 14:31:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 55F6010E6E5;
	Wed,  9 Oct 2024 12:31:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="gVXQV7iW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam04on2049.outbound.protection.outlook.com [40.107.100.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0744110E6DE;
 Wed,  9 Oct 2024 12:31:56 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mcT1j96/2zLcBGXHp5VhR15lJGY3uLdZ6zhHLhL3KZMrPOsJ9JR40paPWjlaScTugHL1CKKzwF/H2F0GE4WL2xDD6PJuKySFpVqyMo/k/dlGAexCx8Bwdy9lHLnv3exhn6AmQ2IUqwdJ6RIpurnjFNhZnnqps/r2TpsxBeZyrsqIub5gBbFXPQznGLf21nkJoN6TP+91EuEAHkJvFXvNLN5vNSZSdRfqGKBnf9lTvtJ2+EGdw0/K8GWtaSLzzXqizHAi90vEexS0v7lAymoQn+/Ys53eEUznw9Ld3w4LmOQs+Azdg0gnZ0Y712Qaie8ALeHCyR1+HvrMm/k95NB2Dw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KvFpFF/CoAkMPH3WvTVwhdczLDcIyraHxwEbWVC/3Fk=;
 b=ieau+wNqQIvCgksO5YDDZcHFqgkt4UcZisyIvJMbM375pphnUehbd8YQ70N5t/idigCSKv2/OgYOVMMc5Tpk2/ABUB2b3TOvb5Rsn51rf473X2mRPNCkUR5l7tPoYKEJQH9sSx/+1U/6cJSZ2GGMl9yicIuXJk81WRoM6WOb4eHK036jMX3tW8AcaFLiazusu/y8HfteQMbznkWUYgDQXxTMGbJSIjcA2acWAyd/bx1ftdsT4jP4TE/ko3BQpZG85zV5ve62lpHhHS4RJX1weeqkh5VpfjzP2SJPpbyvjClz4EOZShQzDyyxsZp2O8LHQrfd5hS7voZKS32Wod7X4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KvFpFF/CoAkMPH3WvTVwhdczLDcIyraHxwEbWVC/3Fk=;
 b=gVXQV7iWBcNRWlrgBCUTV4vfkCZ7QXCblNAoYJXXGaWkscbq0BquVlNE+pFxXpspOxQN534JXsMZnfDUJzKHSWpNKSY1VaKs7kdFtCU3p/abxVRefMlsCIjR/GTYV7kHzzIQ9vj6UfCJ0CikvP0OZrnlTXW0sEMCAeb/2wj2S88=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by SJ1PR12MB6124.namprd12.prod.outlook.com (2603:10b6:a03:459::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.23; Wed, 9 Oct
 2024 12:31:53 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%2]) with mapi id 15.20.8026.020; Wed, 9 Oct 2024
 12:31:53 +0000
Message-ID: <6426b779-bd4d-4c85-b99d-4ddedf75d837@amd.com>
Date: Wed, 9 Oct 2024 14:31:45 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/amdgpu: prevent BO_HANDLES error from being
 overwritten
To: Mohammed Anees <pvmohammedanees2003@gmail.com>,
 alexander.deucher@amd.com, Xinhui.Pan@amd.com, airlied@gmail.com,
 simona@ffwll.ch, srinivasan.shanmugam@amd.com, David.Wu3@amd.com,
 felix.kuehling@amd.com, YuanShang.Mao@amd.com,
 pierre-eric.pelloux-prayer@amd.com
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org
References: <20241009122831.109809-1-pvmohammedanees2003@gmail.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20241009122831.109809-1-pvmohammedanees2003@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0382.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:f7::20) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|SJ1PR12MB6124:EE_
X-MS-Office365-Filtering-Correlation-Id: 0ee07cbc-7574-4448-0446-08dce85e5abd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|921020;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?OTNXRjR3cHA4TWlqUHI5cUxqR0ZCOTlTSittYXRGaEJ3M2xrbzRvVGJaSE5S?=
 =?utf-8?B?WCtVSDZsUEU3VU9oejR3TVhZY0I1Rkh2MFR6cGNUd3VKcG1ybStSbEE0LzZL?=
 =?utf-8?B?M0lqYUthVXFSTTM4UlVBamtDSlIrNmFVRWwzQzJra21PM0ZtMjE2ZVBBQm0r?=
 =?utf-8?B?aVdFeVN0b0puY0c0RGpqU1lWaFBIdGRVdmh5MGRNL1g5MlFJQUZBODc3UVBM?=
 =?utf-8?B?RnJGczV3c2lBdmEra1JRTHVCdzJQVnZhLzZnNVBWbUViQi9uWE1LdHkzOGtE?=
 =?utf-8?B?ZGRTQ2c3bkdjSnBuaXFlRWRFY3NNc3pxUnp0VGZ2SEx1Yy9lWU9vdE8yS2pD?=
 =?utf-8?B?Q3FVeXYra2ZPTlJ4WHVncmFHWGErWXAwYzRoV1oxL0VXaVJvTEhpeGZSVW9M?=
 =?utf-8?B?OWV2MEFsZkQvd2I0bVFEMm9qb2lmclNEZnU3TjhGM3BOdU5qRFZOcHpUcHlO?=
 =?utf-8?B?K0RYaENzcW5LQUVFNU13UGM0YzFhc1R5d2ZSSnVVT3FuVkpLQWZYRER0YXZB?=
 =?utf-8?B?Zml3ZHQ1L3FhMm9wdVp3RkNNVnJkQkxqRWlYV1ozalpVaVFRSlBQazNyL1NX?=
 =?utf-8?B?dW1jRCtzd1hpQWhyTWlndWFaWFVGSFFzaHE3VzBBSytEUnRsZjdPa1RqR0h4?=
 =?utf-8?B?TnhrUW5SUmhiWVc1cFAxVm5kYzBHRzBGVTZTdXlaalgxS0tGYmtSNXUybDUx?=
 =?utf-8?B?WEhtY09jWTJzTUgzVEV0WHZzdy8yaVRibEdNN0FyL042TmxuZTNYR3hpTHFu?=
 =?utf-8?B?MGROblI2YmxpYmlqSE16VS9NWkRDV0NPeTlsUDZ2MlhlOGk4clpPbXVkSGc4?=
 =?utf-8?B?bEtiams3a1ZUZXdXYXZWMWd1ek9kaC9DVkdVd0l5ZDZ1MVFxUzE2aE4zVFBh?=
 =?utf-8?B?VmNEdUNGa1g1dHk4VzUweDlEUVBraXNadXFDMEVVeStybmJ0enVzUldIdzJP?=
 =?utf-8?B?dHFnelZ6VXg4RXpxZkw0aG54UjRRbWsyT21RZkxDT2VNRTB4engrNzV5MVY4?=
 =?utf-8?B?dVdTd2xwU2RmQ0VzRERDc1RuYlhOTUExOVJRMU01TVQ2eFpZSEZva1lGRWV2?=
 =?utf-8?B?RFpJMmFVbi9EY3hUREhVS1B1L2hSTDJYWllxdGFkV25LcVlTR0RGaFFDTHFM?=
 =?utf-8?B?Y2tpRVBZV05SSm5xV1k3bnB4Qm0vazFoV20rdkxLcUR5OS9iYmlQSkU3SHlS?=
 =?utf-8?B?cnROYmJrYzRjdm1NSU9TWTJyWGFreEI4d2dqd0JZeUhXRGNYSjcrZzNxTXNt?=
 =?utf-8?B?eDNLSlBzSW1HUzBjMkJTaUF4YkVHMlpGVVppSDBWS3VyRzEyditFd3RXQWUx?=
 =?utf-8?B?QkJqUjRrMktuYXJOZ0ZvMWNHbTlNOFRjT1lQZW1QcTBVTy9oMkJGQ2wxWGJk?=
 =?utf-8?B?QzdlMVJHNmluY1JGWFBwajdWaVRGSTJDOW81cGd6L1lzZzFra2FQQ3BBblFl?=
 =?utf-8?B?TnZjN2hzZ2Y2MGNMa2Qyc2dtS3VzdUtNM0I3Wi9Qa0gwYjh5alQvdUFUbXpG?=
 =?utf-8?B?M2tvZEZ1Wk5MVTYremdlRmpZRjlQTVI2cEg5bGFid2tRdDdOTXQ0NXk5dmFZ?=
 =?utf-8?B?SEM3UGYrYldaOW9ibUNQTkI3Q0FDekRIbHJzR0dNVEs1TUx4SWR6RzlCU1hx?=
 =?utf-8?B?cEFpdW9yd3dMY21RNnpTMGN6MDNSaFVOUldSK0VBNWdZTEF2RnFhbnhleEE5?=
 =?utf-8?B?WE9mSmZodWJvV2kvajAxZlBBMXN4UlBHNzdLdkhkdWNYRGJuM0VlR1RTOVJV?=
 =?utf-8?Q?4SLB/NyNXfDuuc9wRVU5NDb6jXiPCUiji5hMEGa?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(921020); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MDlEMEVWZk5sVzQ1ZFRrZ3MrT2Y5ZXdENVJUd2M3czc4S2I0VHlQNm5mOVlw?=
 =?utf-8?B?cVhDaCtYZ09vbktSWnNTUkpPTi8zLzUrVm4vQjB5VXA0S0JkT1RsUlRLclBY?=
 =?utf-8?B?VmpBbmo4MlE5THhiczZCeVV0SHAyTFcydDdkZ0hSVkZLSjRyTVkxeS9yLzhL?=
 =?utf-8?B?OWtHdUppREFpbklBY1dNdmw2bnp3eGR5TVljdUxVK0hTTm1rTi9remVmbkQ5?=
 =?utf-8?B?d2ZZVWs5UEJqZjlzMkdFZ0thQlYxRmJDMFFMUG5RVnR4U1JQQVZFTW1vWkNQ?=
 =?utf-8?B?UGpLWksvMDdsY0JIUWV0ZDZRRlNIUDNpSUxTUTZ0c0Zoc1dqT1dSdjBwdUFT?=
 =?utf-8?B?Vm95SmUyUS95WkZYd1BvdzZvWHJUWG5haVFsL0FXc3RRMkY5WVJmaXFmQk9P?=
 =?utf-8?B?WnRib1ExeUEySDlLdHRobE50TEZVdnA2NWFWeGlDc2hCMDZGamZWYUloaEk3?=
 =?utf-8?B?eVM1cWV1ZE9iSjFqbXdYWGt0VHRKNG53NTBpSE9KbFdEMkRBUGVRZXQvQnAy?=
 =?utf-8?B?enBsTXkzOVIvNzM2aGJCclNWeW8vTXlKTjRZdktxbk9VSkVLNFA2UEtWUEts?=
 =?utf-8?B?YkFWTFA4aGYza2EvMGNUNWpPZ04zaS82N1ZFMGxQcTJnem5mem0rNFVBZ2FO?=
 =?utf-8?B?VEN1UUlPUzUrZi9XLy9lL1RWb2dYcXh3TmNlaVp3cWd1eDdqQ0NwdnNQMlZs?=
 =?utf-8?B?aWxTenFaci9FTjNpWHIrZDFFL0p5T1JxQzA5WmFpYnI5THliOW8wcmkxdEVz?=
 =?utf-8?B?U0lkZkZpU1o4L3A1NDBQdGNMSDJaTVhJdnBZS3pHWHFWcll5ajVEaVlHTEJl?=
 =?utf-8?B?YW56MFd6dDM3QW9mL0t6blF2NWFmdERiTVllL0J5M1BlbVJMb3VmSCtZaWxj?=
 =?utf-8?B?NlRIejNZNDNPMDR2K21qUXl0QjRZcm1kUlo2dkYzRTl6aFowQU5hSEJXbzZw?=
 =?utf-8?B?YyswQlFuR1BzVURzVzRZSFBZaDZxZktyY3BUcEFKaW9OUTFOeitsU1JDU1NM?=
 =?utf-8?B?djkzYkQwYTVFaEUwZVBVbjdGZzBiVm9JT2JhWnFuSVplL0VCeTdQUzU0TVZJ?=
 =?utf-8?B?UEloLytEZXRhbm9uRTVOTkF2SVJtZVR4bXprVFpVWFBlR2hRZDJTZXdZMmNC?=
 =?utf-8?B?TlNJOWFudlFzYjBLbDM0WFZwRlRQZ2NGUFFnZEdGUzlia1BFVUVvbnF5VjRK?=
 =?utf-8?B?R0dZQzBqUmxUbXNMK2tmeUQvNTFqQmF2emwyVFZpVzEyazJVTTQ3clJCdFd5?=
 =?utf-8?B?bTQ3cW1XbUZGQ2hzYm1WaGlPT0JVbFJ3b3ptTVNhbnJ6TytOQ09oSVZwL2NO?=
 =?utf-8?B?dWgzSFh3WnY2WkMycGh6d2l0QnZiSnh6by9FMmVreEJSYVJTbHZ2M3hRMFdp?=
 =?utf-8?B?cTIzTURYUFY0dzR3WHc5VWxjL3pQVS9NbUppK0ZWamY5OHM2YXlRQXlsRk9y?=
 =?utf-8?B?SEovSWtlTWt1L0lldVZJOXZWTVFpTEFremc3T1J5dFhWQWdrZkxwdXZRYzBn?=
 =?utf-8?B?M3NOd1psakU1NFpsNjlwOSs5c1JQUUlab2ZJNFBWQ1FzamhKN1dYNE1OT05I?=
 =?utf-8?B?bVl6aGdmWkpwQW9wY2VGNTM3MHNGdmRZdEx2Wkxvd1ZSOEsrZGlHeDVtb1VW?=
 =?utf-8?B?VkE4OXdnN2ExWThZZWtDS2Nib3lnY3loa1ZzRXVtbktrQ1U1ck11MGhaQ1lO?=
 =?utf-8?B?aXFtM3p6c0RqR21LZkNJNU5TZE5LM05zMnYzcGFpM042YnQ1WlFuT01UY0Mw?=
 =?utf-8?B?ZGFzbklOU000RDUzUXNMb1JvK21qVDBINnNrQ0xwT0hXQ1Zod0Q3Y1kzNGw0?=
 =?utf-8?B?NVFCdjJzTE5KdFlyWS95MjFTUzlBaFJMTC9FNEdCWWtJd2VXKzR5QkJ5K01a?=
 =?utf-8?B?eUxFMXRsTmt6dmZ4OXhQOGhqN051U2Z3cVZFVmQzbnY2WjZyZ253L3IzSmwy?=
 =?utf-8?B?Q0V2ckY2TUROQ0NEaHJQNjU4enNjY3V5dkxNUlp4bUovZVN6Zjk1M2R2Uitq?=
 =?utf-8?B?clVERDZjQnl2aTlxVS94WFFHdER4QWUvak44UG84aTZhYk42T2ppdjhuSm0w?=
 =?utf-8?B?RVVwdk1weDNQMG93WjB1eTkraGd6SlAySzdXcGxPYTVWRVovbVlZTDhYVWk2?=
 =?utf-8?Q?Bc2Y=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0ee07cbc-7574-4448-0446-08dce85e5abd
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Oct 2024 12:31:52.9709 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9tjSMCzzHRao5LyF81vF7JKjTBq8zL4/aok+yJGydc722OAecrzKd9rHLmr9GDyf
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR12MB6124
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

Am 09.10.24 um 14:28 schrieb Mohammed Anees:
> Before this patch, if multiple BO_HANDLES chunks were submitted,
> the error -EINVAL would be correctly set but could be overwritten
> by the return value from amdgpu_cs_p1_bo_handles(). This patch
> ensures that if there are multiple BO_HANDLES, we stop.
>
> Cc: stable@vger.kernel.org
> Fixes: fec5f8e8c6bc ("drm/amdgpu: disallow multiple BO_HANDLES chunks in one submit")
> Signed-off-by: Mohammed Anees <pvmohammedanees2003@gmail.com>

Reviewed-by: Christian König <christian.koenig@amd.com>

@Pierre-Eric can you pick that one up and push to amd-staging-drm-next?

Alex is currently on XDC and I'm a bit busy as well.

Thanks,
Christian.

> ---
> v2:
> - Switched to goto free_partial_kdata for error handling, following the existing pattern.
> ---
>   drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
> index 1e475eb01417..d891ab779ca7 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
> @@ -265,7 +265,7 @@ static int amdgpu_cs_pass1(struct amdgpu_cs_parser *p,
>   
>   			/* Only a single BO list is allowed to simplify handling. */
>   			if (p->bo_list)
> -				ret = -EINVAL;
> +				goto free_partial_kdata;
>   
>   			ret = amdgpu_cs_p1_bo_handles(p, p->chunks[i].kdata);
>   			if (ret)

