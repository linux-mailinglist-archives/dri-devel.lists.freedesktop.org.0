Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 61498C31544
	for <lists+dri-devel@lfdr.de>; Tue, 04 Nov 2025 14:57:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1FCFA10E5DE;
	Tue,  4 Nov 2025 13:57:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="g5ZwJalV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CY7PR03CU001.outbound.protection.outlook.com
 (mail-westcentralusazon11010051.outbound.protection.outlook.com
 [40.93.198.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9977410E263;
 Tue,  4 Nov 2025 13:57:05 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tvJoVBX8wMw528nSJCZyggEOrvweOrwofvAIYktW0fU5BPS5emNkJUAbH4b1fjVcMKltePItD+UrygufgtI8NMr0HoLL27jF1l9qjy6xubbvWYA6b1q9dRBZ/3/lwyPeiWkd60nHA7LX9v3YHFKA3JmYIW+AkNOfppA5C+kk7mpqV0e8CCN0KTVQjSNPso+Ayx1bt36sqlT9w4SN3bWuiYCiIVKtBnrouZEAz8LBr6uFRGdFv6OfvRzSNu26GiY3VOVHF6u8DshZiHPmmg153DlWAOzxmbHy5baTzEppHD2zTOhbwr4IGSwqWHcdEPd0YOvXq2j1weSXiYb8qqukTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3a5F5e3UdLy2TVkL80tQoUFnO3O+8Rf4+sMQf/S/PVQ=;
 b=f5WeRrjyWds3HKWBM+AtSdsbYC5/Jx0KfhIEG7QfWFs0eEeO8PYow6RgssqnhSs114ZAD3s2i+IXbue7UaoU+125y08LapvNq0WLesj32H2WfYdi9ecTv7UH36ogvWE6mSDmZqR6KOmlfvUNT2IVNZfQSLlwC+fO0GfNAtJwtJdMZLHcUnm9/SSHE8t3G205ZGiDTux3OxXcqegXJSeELZDD0CtLxT594oo59fE9iu7az89vZ8n2XzNvdRSrhPYqdFovqNn84kGp9FMNbyzMMJbmnyPnC3Fko7lbwDRmK/aTOf3KT1p+NxDcIPj4w7Mq9tHqH/sKtw5Kw/GIr1yUNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3a5F5e3UdLy2TVkL80tQoUFnO3O+8Rf4+sMQf/S/PVQ=;
 b=g5ZwJalVm3lck0QAwaqYk8lw4KRiPBeZ8agWP9EvaQaGEpz3diV3bzoIJSwkB3dpOsBz7TuSxljWMA68hjUU+M6TKTdZv6SdXWEanqsIGOa9API7LLs28g+rcwVcrRGMieptwNFzIhrv5+8UYXu4C8Iud+klTKzOmO4A2sd0iH4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by DS0PR12MB8454.namprd12.prod.outlook.com (2603:10b6:8:15e::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.7; Tue, 4 Nov
 2025 13:57:01 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%4]) with mapi id 15.20.9275.015; Tue, 4 Nov 2025
 13:57:01 +0000
Message-ID: <a3afbacd-78e6-4fe2-9d52-5b05b4220133@amd.com>
Date: Tue, 4 Nov 2025 14:56:57 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 20/20] drm/amdgpu: double AMDGPU_GTT_MAX_TRANSFER_SIZE
To: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20251104083605.13677-1-pierre-eric.pelloux-prayer@amd.com>
 <20251104083605.13677-21-pierre-eric.pelloux-prayer@amd.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20251104083605.13677-21-pierre-eric.pelloux-prayer@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0055.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:93::14) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|DS0PR12MB8454:EE_
X-MS-Office365-Filtering-Correlation-Id: 74a1d2cf-0e3a-42c5-02d3-08de1baa073f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Qlo2T01idnJURlVSRkdsaFc4OUZGd011RWNLbzRCcnFIWlVlaUo4aFd4RS9Z?=
 =?utf-8?B?YlVMUU5yZjJzNnp6alR0bkE3NnZaZ2RhUXBUalhuWVdlc2VBOFlzSzdaUVNn?=
 =?utf-8?B?MkVSUVFmKzdtZ2dRVExvRHY4bitZWi9ZUkFJT2s0cThJellPcXF2RVFKckxE?=
 =?utf-8?B?MmNUbGdjMURCempiQzZOQk1odXNQVWcrUEFOMFdxOE5md1B3UkRuMWhCWUxB?=
 =?utf-8?B?VVo3aldUODI0ZEZGR2xEdlpqc3ZHWGJMeTdqb201dlhLSzB0cW1mS1NCejJR?=
 =?utf-8?B?a1BKNTZiWURzVEt1aGdKdE5GTXBLMWV1UWJ2dGwrMjFJWXJLemdYNXdmZng5?=
 =?utf-8?B?bUFGcUVPR2Z6MUhOakQ2Q0ZJUzRNanVpb09wVCtOODFWRlpPd3lyaFFEeGM2?=
 =?utf-8?B?K0dtdW4yYTRQdHVLWWRRbVpwcnZwam5iVFYyVlJRVEIreFpYaWVuM3AxTHlO?=
 =?utf-8?B?clE1OG02SkpMdThFNktLc2xhMzkzUmNkeFRRR3JHRmFHcmMrS1VBZWZzTFRh?=
 =?utf-8?B?a3kwM3lRYU14QXhQbVlKM0FNTTExN1RLSEdlQlpBbU93L0IxVVllMGVXck5J?=
 =?utf-8?B?SkphY0U3d294NnhicFRuMGY5RFNFY0gzTWg4dzNNT3ZzbmJ0N0RsRXBmdzl6?=
 =?utf-8?B?WHc0ejBWTkdLdDFJQXVpTFVubUVOOCtqK0gwVUdNV3h4N1BocCtGK3k4VURL?=
 =?utf-8?B?eWJ4YkNDMkJDdTRiNi9xNHBWUW1lVlk3dFdwSUVyekN2bG5RdGNoN08zeFhz?=
 =?utf-8?B?K1YzZmUyZU12b05Kd1lkQTVRSmE2WnNMU0ZlNjk4ZnhpNXBSSEFUb1FYWWNL?=
 =?utf-8?B?WXlPcmN0cVpLNk9ReGErVll6TDdkYlVJb1FVM2k5bEp2Ujd4SCtHNUdVcDdW?=
 =?utf-8?B?Qk53SFJVaEx1U08vUWd5MGhLRURYYmd2Nkh4dGk1RTdVby91Q3daRXdMbU9h?=
 =?utf-8?B?VXRWcnl2ZGc5Q0tFYzBDdndlUHJwV2V4dnJySTk4VGdZVTc2Q2NlU2FrK0Mx?=
 =?utf-8?B?Z00ydHpvRWRlQ0pXei9FamhtSHc1WFdJa3h3VmlWL0lKbnVjT3NBNkNxaERw?=
 =?utf-8?B?aE9LM0dQSDQySnN0OWRoK3FGTXozWllNVWwrLzgzb3ZkeTJLZm1iQUxhZkJ3?=
 =?utf-8?B?Um1jWDJJa252SmI5UTMrelJVVTVyZmpKbm1KRGhYN3dQTjV0ZzZadGtiVUpB?=
 =?utf-8?B?NGZkZkxvUTFiN3FzZG9vb3NwY3ljV2ZvMFVWVFBpd0pMNEwyMmlocklSaG9X?=
 =?utf-8?B?UGNrd2h3clJSb0xOcEs0U0Z3bWMxU2NaWmg1NlJBVWtMOHlvUkplZllkWXRW?=
 =?utf-8?B?U2g2SWdxTjZJcW5tUEFSa3N6R25zS1RDamtNYTJGaERvRVBaOUx0U1JGNXpU?=
 =?utf-8?B?cHdjS1VzbTZrb3lqMG5UYnd0a1NwOE1od3BPbXpFSFhJMTA0UEtnYXh3RjJZ?=
 =?utf-8?B?dHZHQUx1OStPNVpFMGY4ZGpHUE1xTVNJdjcxRGZnVTl3clVEUC9qWkU1bCtX?=
 =?utf-8?B?KzJ3T1dFMDNOZVBzVW5EMlZhQkg2MlJBd1R5WWRjN2llWk5MSnp0Z0srbzVr?=
 =?utf-8?B?NHNCajVPSGZyLzNBRHRRNk15b0orcTlzcEVpdmk5aGxvVU1PWE9tNUNUSkpa?=
 =?utf-8?B?MkRCY1VqVjBiVzhFWS8yRXJ1TXF5QmdJZm50TGZ6ekswdFptamZIVzErTEI0?=
 =?utf-8?B?N0t3TXRUbE50VnFwSVIzMHp5d3ZKVW0xekZURGNzUzNHcXRJK2FQYmZIQmQ5?=
 =?utf-8?B?RlF3QkJRSlNSdnp0M3dldWFBejN5a1haa2JUdSswN3NCbkFZbkh2Y0c0VE1H?=
 =?utf-8?B?YUk1TEM1ejVqN3NWOUlEZmdOZUlYWnJPU2hMdVk0RDB5WFpRL1VPcDlPcUpC?=
 =?utf-8?B?YStZMlNjMFMzc1NPanNyaHhYSHlBNzdvRm9RY01YT2ZaR0JQdFozbUVtRW5r?=
 =?utf-8?Q?GLi4ToYmoQEe6lgZ2zWVlErvf8rtuLVF?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?R09ERGl2RVZDcU84VCs1ZEpXdDRvVVdqYVN3UTFQSVBQd3VrRlBQcm1sWkdp?=
 =?utf-8?B?eTN2bmg3Z2ZjUVRIUWZvOE5DYU8ydVNQMTkreWptY1hNYmM2Z1l3YlJxTFVr?=
 =?utf-8?B?am56Ri9aeGhVSkd1aks2MDF2c3U3NVhJTEVlaWNqM0lmRlZPNXczYWt3cVRp?=
 =?utf-8?B?UGE0bUpVcVIyZ2hpc3M3TlBEMWlod1p2NElsQnR1NmtiTHQ2QzJEbVhEcjg5?=
 =?utf-8?B?SXA3alR0aXphOW1uMGoyZ0F5WkdBamU4cmlGOE9FTU00d3kwYlQwRm45TUtD?=
 =?utf-8?B?VjFUQldEMm1uZHJQWnEyZ1BQK0RFd01rMXV4TDNJNnRrN0pKdW1yaEliQzJn?=
 =?utf-8?B?d3RmRmMwYloxQVBNOE0wYTYxL3BTOUNJVzRuVDhqN01Xa2c4NWwxNENKMWJl?=
 =?utf-8?B?MTdycHlrSWZaVml4Y3cxUHNuRDZwZ25CbkNLdEl0MjNTeDZMbmtySEhDcEM1?=
 =?utf-8?B?a1RLZGJ5dGNaQ3BIUTBLWlo4bld3cGI5ZGpWOFFIUzVFdFIyVXpqdE9SVzRS?=
 =?utf-8?B?bG8wSUpLakdYM0dzUnczbTVlZVpMSzdVR3lPWHFWaW9LZ0doa3lZUnArZk9m?=
 =?utf-8?B?OWY0bkZyeWQ0UU92NktUVmhaZ090d0preGJPaEtTaWRNMVBSRHFxbmJLMmZv?=
 =?utf-8?B?S1JiQkNTRkt4NXAyQVpSNTRoVnNwakZXdTBrVVpxdG1YSFJMMzdqZDIwcklL?=
 =?utf-8?B?dE5uR2hKSTkwY2JWVFAvQ3RkVVNtMVl4S1AzQXBwSWkyNk9acWJOUUUwdGtu?=
 =?utf-8?B?VG9uY040YXZJcHBVOFdLcmw1dlpnU0YzV3BVOTZMVG5RV2d0dk9iTlgwUlVL?=
 =?utf-8?B?STYrVkkwSmJhdFNETDV3ak9wdGlhbUFTb0ozOHArTS9VNEJCdHJVRUVzc3pI?=
 =?utf-8?B?L1dBYWNBVzQ4ZnJ1THdSR0RJSVBuOExMemc0aDRHbnNnQjdTa3hpZnA1ZXVp?=
 =?utf-8?B?UFR5SENPdlZuQm1sVUtQRFJrVWpJditxcVZFY1ZNV21GcDVGZXJURDhydkRh?=
 =?utf-8?B?ZUdIUGJFcXR3YzladC84aFJ0SG9YS2lhSzAwekZ5RHZneGVRbmYyTzF0VXFO?=
 =?utf-8?B?QVdsMkhEOS9pZUMyTHNFQ1lDcWp5cXBsWjl3Rnp5MExVZkwxMTNrYU9uNkkx?=
 =?utf-8?B?Qk9zMFo0Rk5taXVhVXZnMjVaalZQVVN4TUNsaXJBUmVwL3QzSWN0MW5RbkZi?=
 =?utf-8?B?WGtnNVBrNVRqQlc2ZExSNFRnVVFUWTNuR3lKNFQzdWVLbW53Y3FGaDhDcTBP?=
 =?utf-8?B?VWRORUZWY0NtNHMvNUJlVXlKZi9adlIwdm9hZTZOaU9uc2JJa2JKcDEwS2RZ?=
 =?utf-8?B?dytXejJqVGxPWG5FSHEreUt5c1BWb2x6ZFExcG9YVWhBSDArK2ZJOGZpNnIr?=
 =?utf-8?B?Nko0Y1F5Q01jWFNhZG5NZUZYbnc3ZTdkN21ZR1J2UlZuZ096a2FMMG13WmJS?=
 =?utf-8?B?V2s5TVdZYURDS1NoR0twRjEwMFM2V0N0S0YxRkp6c3ltSjVKZG11SXdESlQ3?=
 =?utf-8?B?Mm1iOU5wS1RzWExpMFdIdTh4Wmo4WlplTEVaOXg1WE52ZXgwRUZuYlI0Ym9l?=
 =?utf-8?B?eWczYjQ2WDNWMVUzRm9BdWdOOFR1UHFmZldDdlc1UHFyVTVTaVBDTzNGeVpI?=
 =?utf-8?B?RlUwbWtqeVEraVorYTVLMCszOFVCZ1d4TEFmZmlTYUVja2wrMmZTd3V3WG11?=
 =?utf-8?B?RWlBYXFrd21UT29TZnFVR3FrQUEvNEhJclR0NWxwSVlNcmZnMkJlNmNwdElw?=
 =?utf-8?B?WFNFb3ZpY1lNMW03SUZ4MG9OSGcrY0FzL2grYnExTko0Nk9NM2NjU042TTNN?=
 =?utf-8?B?VFF1WlZsUTNLNlJIcUxocU1HR3c2VnJ3QnNiY0U4Q3BSc09kNmRXcjNhcm1R?=
 =?utf-8?B?TGc5blE1NEZ1b2h0THc4M1htTjNMQ2R1L2MxSXc5aktZQnovMmlyTjRFaXZE?=
 =?utf-8?B?RFFYMHI5ZkJ0MkZXaktQRTdpK0dxOEQ4THZxd0NWTUVHN01xdzYrcHZSaHRR?=
 =?utf-8?B?Y2Q4WVdkT1NPRVFnUlBFNytRSTJIT0JiUTVjbWp1cFlFZTMyMDBmUlpPVWFU?=
 =?utf-8?B?S0FvS05LNGZCN2JNMjBTNUNjR0RQaHBlOCtMd3A2ZUx5eHRvWGU5Z0hvby9D?=
 =?utf-8?Q?6WH5eU+Fq3KWDP0Lmio52KS/j?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 74a1d2cf-0e3a-42c5-02d3-08de1baa073f
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2025 13:57:01.7525 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: isCC8wahofgnpPku6KMvUzU6FS14rnPmxTlu2IjvpPVHt0eL18/30w6aKXMM3IaU
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8454
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

On 11/4/25 09:35, Pierre-Eric Pelloux-Prayer wrote:
> Makes copies/evictions faster when gart windows are required.
> 
> Signed-off-by: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>

Reviewed-by: Christian König <christian.koenig@amd.com>

> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h
> index b685bf207e43..82276eff511d 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h
> @@ -38,7 +38,7 @@
>  #define AMDGPU_PL_MMIO_REMAP	(TTM_PL_PRIV + 5)
>  #define __AMDGPU_PL_NUM	(TTM_PL_PRIV + 6)
>  
> -#define AMDGPU_GTT_MAX_TRANSFER_SIZE	512
> +#define AMDGPU_GTT_MAX_TRANSFER_SIZE	1024
>  
>  extern const struct attribute_group amdgpu_vram_mgr_attr_group;
>  extern const struct attribute_group amdgpu_gtt_mgr_attr_group;

