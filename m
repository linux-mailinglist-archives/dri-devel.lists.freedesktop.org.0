Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B92DBC7A966
	for <lists+dri-devel@lfdr.de>; Fri, 21 Nov 2025 16:42:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9960C10E8B5;
	Fri, 21 Nov 2025 15:41:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="a+PQHNDv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from BN1PR04CU002.outbound.protection.outlook.com
 (mail-eastus2azon11010011.outbound.protection.outlook.com [52.101.56.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B859310E8B5;
 Fri, 21 Nov 2025 15:41:56 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WEMtanCxQJ6WGDUPgnRv45Nt9HL0aoES51yToqbS7BtF1IdsNmYgCQOA/eLzH66V0udYGL6dmLQgxDc095oNRA1HB5a2zRlKJmFiStxNMBhQQGovyI05qoMb6+qd0L5dgnxla+xYAv9BpQzxhWmTUipHkPq4qkSx0JNMMq6X6zawHEUfode+U3tnAX7sDdJ6sX08u4ftuqAZw63DGZDHOhg0VS0p/UEQPpVnVYC2sJX1ReB1U1c9U2kzVSHNEow0uknQdVbW49RDTIEvj3viEDXE0xELRwpj+sgaQg0722gkMFAyKJZ/hEeWmwnz2tpsLf7velkwfiXKeY/LlAe6BQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DbbL/+iBkOa4/SwaxQSDUSie7gZi9xPkr8LeJgJGXWs=;
 b=lll2IFGy6sd8yKyd6sgv1xYEWv4Gm+Tfa8rOGmZlqMdkUhTekFegvRmFjA16oY22xLf0b9F9PeCWTuTiQP3s2yJQQ3wc5F3CkI9p3nadZ4fFVDvmvyAY+mbnj3GyHxxI1fr45WyylCfMEbibq+KYZkXUiLDKxB75GmsS9EN6HdRw2RpKdQKgQch1jtueENOrCd7NneCKQLBShY/I0Ucec/q2jaL7dcou8bX5t4PmZSefOmUz6F5x7kn32RQ8H5f8S9R9FnjLJq0X1F+GXaHdwttVBmEzo5rS+WcMoWd2/bDh3MZf1SMZNbKfGUpTYIKgmAAnTVcS7SZkuyr07PwMSw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DbbL/+iBkOa4/SwaxQSDUSie7gZi9xPkr8LeJgJGXWs=;
 b=a+PQHNDvGq1+1k3u64Y2a/mEYG6ik2zdzjoDMSlEbswpM+JXAqgayc36LRh/hMZ4Tui7Bo7yrsle1R5OWVIlfhmwWKJWi6sSr+lDT2h+NfnHvEreJZmzMs4m4vy5o/+05coLmz+2vNwzTZpiJeX4DlwPoaeL94VjMsAj3m+08ZQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by SA5PPF9BB0D8619.namprd12.prod.outlook.com
 (2603:10b6:80f:fc04::8d8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.10; Fri, 21 Nov
 2025 15:41:52 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%4]) with mapi id 15.20.9320.021; Fri, 21 Nov 2025
 15:41:52 +0000
Message-ID: <12dbb538-c430-4848-94cd-51329e4e04b0@amd.com>
Date: Fri, 21 Nov 2025 16:41:42 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 23/28] drm/amdgpu: use TTM_NUM_MOVE_FENCES when
 reserving fences
To: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Felix Kuehling <Felix.Kuehling@amd.com>,
 Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Rodrigo Siqueira <siqueira@igalia.com>
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20251121101315.3585-1-pierre-eric.pelloux-prayer@amd.com>
 <20251121101315.3585-24-pierre-eric.pelloux-prayer@amd.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20251121101315.3585-24-pierre-eric.pelloux-prayer@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SG2PR02CA0020.apcprd02.prod.outlook.com
 (2603:1096:3:17::32) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|SA5PPF9BB0D8619:EE_
X-MS-Office365-Filtering-Correlation-Id: c6a5e0f8-9c9f-44de-fba4-08de29147dcf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?QVNZSHBENk4vZXMzUndqSkc5M0FCMUx6V2ZkM21PZnZUR05TTUp4UFJiR2dF?=
 =?utf-8?B?TFYrQVpsemFOVU1RNDRyeVhiT1llTGVYS2NTa1ZkS3MxUExCVzlzSjBhSEJo?=
 =?utf-8?B?dDFvOEg5L1c0VlFsdHFGNTltM2NjalhVTEpSVFpUV1I1cUZCR3ZSWGE1dmts?=
 =?utf-8?B?M3BsVys2Z1Y5aVM0UktMYmJyOW9RSG5leUtFNGFYWWJwaEtQekU2SUJucCt4?=
 =?utf-8?B?WUV1MkRBLzRNTitLVVhYS3JRWVFMZGJiUUdwZHhrT1BpemhrcUVCVGM3clVP?=
 =?utf-8?B?NUxSL2R0bHV1dWFpRks4T01TUWdXdit5U1VnWDk5RzRCMUhzQUZCdkhhcXdz?=
 =?utf-8?B?U3o2MDVXVXVscVQ4N1FpcC85U1h3UUx5Nkh6WDVkQ2lrTHF0TU1qWGhqUkpt?=
 =?utf-8?B?TGgzSGE3ZE9KMDhuTVN5Y1AvSFJmQmNEUUxJRGVRRkg4aURidUxzcmxkc0F0?=
 =?utf-8?B?L3FGcC91amt1QUVDL0toOWk3Szl0eXNoTUM1cU4vV2Y5WHdHTUVINzFxcnQz?=
 =?utf-8?B?ZGJkUDVRYi91ZHhjb1pScUcveW04M1JLSGMwVnpOVTVTRVlJYjE0NTBGd0lr?=
 =?utf-8?B?UU1BMW1BU1BNM1N4NVM5bncrS1drZXFoOFVlclFBVlNSNTIvV0Q5RTQrWFdn?=
 =?utf-8?B?Rk0rYTlIaUhBeitYRys4ZDc4clM0dmRZWUtwK1U4dEFZdTlVS3I1bXROU1Fy?=
 =?utf-8?B?a2lUTnc4dCs1eU9CNkxqSWlGOHpBL1J4SWw2c1VhYmtRR0g4OWc5MDFURjBo?=
 =?utf-8?B?QnZFK251cFAwb09uKzhGZisyaHE4YmdXUHFtL1RPZmNtSzMrZStZamtLRG56?=
 =?utf-8?B?NDY5Y29MK1VMWjNkRFdlM1A4anNsRlR6OTJEUTVFWGg5aHdTb2dZVmQ4Mm9E?=
 =?utf-8?B?WkhoYSs2dDk2dklUd05zRUlGelBOS05uSFE4SGFVYW5MWkRVOExTcFVFWVVo?=
 =?utf-8?B?NWVSL0NhRTRMcnVBZ1hkblRSSXpCb0tuSWRpc0loVVFaVDhmYUFjMWovaUpP?=
 =?utf-8?B?cmZYTVlJeEt1UmRxSDZ4WDIrejhOd0t1MjF5UDRZNUwwWFlaQVdCTThZeHBi?=
 =?utf-8?B?b3ZPSTQvTGRGOHVZaFpOWUhHcnFhOW92eFRNdlRsRmY1UGdUdFk2dUV4N2VL?=
 =?utf-8?B?WHFNbXZhdHdPU1hySHR1OXNmUjhsMDRUdk5YK2NBZzJTaFBrbHN1THFuUnJX?=
 =?utf-8?B?UzJITTJ2cUNsZ2o1c0tpL0RUUVFZdGM3YnNvWDdWUCsrc0orR2pnY1dVcFgv?=
 =?utf-8?B?NFEzeEpEd0ZzL2NmQ3ltcHlYRVY2NVFEb1FJTjd5d0xMOHVEQ0VTT0JCNEk4?=
 =?utf-8?B?TjY5c3dZRFl1QkxNZVFPTzFPQXNUTEJGSlVPYTBCSG1vWGFVenZTN0NkZDBk?=
 =?utf-8?B?ZHQrRWtjTDhQaEZDem5idUpobDgwd0ovbmpQZTRrZjU1UmhSQWwzZXlYUzlN?=
 =?utf-8?B?RlNWcWFkWlozbHllaEF5MDNzdHZwVlh6TE9uZDdZRTNJK3pLSDZhM2plSmxP?=
 =?utf-8?B?RmlENE1sYUdRYlZ1Y2NuaHZCRjBOdk0wNk1ITUZ2NEZoKzdtRm1Bd2c4ZktV?=
 =?utf-8?B?Zk9XNW5pRTVIVUNXbWFVT0dKVUxUZ2VzNXBwM045Zml6cGgzTVp1TnpQOUdP?=
 =?utf-8?B?cXVrSnRQR0ZGbU9yOHp0SUZ0d2lUOE00aFFzMmVnNkV3cFlKN1hTcXRUQ2NS?=
 =?utf-8?B?VWVwL3dSMzhpNGdQa20yL2toZGY5eG04MXNieCttTmh4NXB0cUFhTkQ5Rzlz?=
 =?utf-8?B?T0JCeWVQcFNvc2FjTFdqUExWalJxVVdWOTh4MENBcTZRNUF5OTZFREZ6anVC?=
 =?utf-8?B?L3BIbUZEbWVWQ3NkUkZpbXhwM1o4cW9QekkrTG53bTUzb2ZEYnVyRFlhM0xs?=
 =?utf-8?B?bmNCenlRZzEvNEdaaGpEMkJWaXNySVdmMmJWbTJPcVVRTlNTNDJFcG91WVN3?=
 =?utf-8?Q?WRq7yL9vb9bWNeY71d1aGj/kN3sz/X6j?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WkQxbVdGZzk3YmV4Um5IWldZWDdzNTROZi9oOHF4ZkkvMFFodUFlQVJOaVRG?=
 =?utf-8?B?c1hOcUdZSHZIOHpNU0orWU9wQ2ZzcHd6YWNiTE9VSWlJQ1ExbzF2bk1neHF4?=
 =?utf-8?B?a20yRXVmc0tLZnU5M3FQMHJsUituSU41V3QvWVhaOUMxMVg4WStGSGh0YW9s?=
 =?utf-8?B?WWVsclV1ZGRGOVhVYWlZU2I0UFJ3NkJidUI3SHJoN3RrdHRlczFXanFRMzJH?=
 =?utf-8?B?T0tvZ0Rwa1lZaDVjYWw0TXI2a2h4QjhYZzJzRFBhbjNMWHltRjgrV3lORlVV?=
 =?utf-8?B?Q0pnQjVSL1JaSTRuSHlKcU9TVmlJQ1NOWWtzMERxaGN1OXhKS0xkcXNhK0Ir?=
 =?utf-8?B?Wi9xdEhnZTdSeHFXcEVFK2JNQXp1ZE12dkZuNUo5WC9NWU9mUkZXamNLb05V?=
 =?utf-8?B?RWNQcEVaZGhJeEVyUm94NGxQVFVVbU11aDdoQ2orK3BaMkIyREFhVk40bC84?=
 =?utf-8?B?SnhTeTZsRVk3MjhMUkREZmNmZHp1dU5VL1A3WFpDZXRDMmhDM25tZFA0Zklj?=
 =?utf-8?B?b2lGVWt2MlJBSzdpL0RqRWZSc3VaRXljejI0T1RjaSt3cmdUbkhicCtoWHcr?=
 =?utf-8?B?cmsvL1dsMFhQMVlaNFJXUzQwSmRrQ1kyQ21FTDZkTlpDc0EydllpZHh3MThl?=
 =?utf-8?B?RGFScklnYXRDaE9GSGJnNmJkZFhtRHZKVnFSeDBZL0pvM3R3N1cvTk9KQ2pL?=
 =?utf-8?B?em12QWtHa3Y5ZytNdmdmQ1FUcloycEdxR3F5ZEdUNWt6THZWRVl3Q01kVHEv?=
 =?utf-8?B?dU5NTjlIaG8yOHJGSWNBeHlBYnFybTlpeXlPamdQZGw4MDgwUTRCWkFFSUk2?=
 =?utf-8?B?R1dUQU1jNTA5V2Y2eU1yS3ozMktFMFdpMWRPR3ZvRWJGOGxkVmVjdzRlYWpU?=
 =?utf-8?B?R01QVTErN3E0RUNVQTkxbHFlMVgzcWdtaXpxTm1CYTkvU2MyeWVxTC9rV091?=
 =?utf-8?B?Q1hNKzB5UjBseDc5V1pJU3I0V2JyaDE4REJDVitpQmR6QWhjSDlnRjR6TFJJ?=
 =?utf-8?B?WFZsK1pJRGdXeWV0WVl3UjUvYUx1NE9PVm9ydklqL2ZWdFMvUVdUNHdJdVRk?=
 =?utf-8?B?cnFmVEI2akZRQTY1MkZJL25UVUpnQlFLdlRRMUNSSGlNcnc0b0lwaVd5SHJE?=
 =?utf-8?B?VzlCTzlsU3lZTEdoeERSRW1SRzcyYkVMdTQ2R3MwRVdERWE2djBxWEhwaStX?=
 =?utf-8?B?dElXVEtSN1ByL2N1Q0sreXJmUi9zamY4dzl5dHUxNTlwenB5SXZRNEkyYzNr?=
 =?utf-8?B?cVA2Y0xwcGZDWDBIK0dKNVY5ejhWQkRIbS8wV0lyRWZGMlRNN1doNmhDTzI1?=
 =?utf-8?B?clJCeVRLWTl4WTZkVjkyek53ZW9rZHl5Rm40WURzUE9VQzROSGt6eU1zRS9z?=
 =?utf-8?B?U0xxMC8rU3Q4L1JrT3A1N0xFcHZISWQvMmM2N2R4SVRYNld2R251N3RuV1Jh?=
 =?utf-8?B?dmpsOE12OGVwT2N1bkdrTFIyK293QVp0WURSTDNnMW9FaW9SMG01eHR5WHcx?=
 =?utf-8?B?My9Wd2FBVkhDU1VjTFpoMlVZdUtZWXpiUEF4L3RNRU1pazI5eHdZMm1Yaldk?=
 =?utf-8?B?b2diSnlncjgzUlhsWHhaZmd4NlNQWG1NWUltTVMxU1BYdWMxTENBK2dYVkoy?=
 =?utf-8?B?MjVNSEpDVWl2TGQrS3dxT29QR2RNK0V2bTNld3FURFRPanE0SU9Ga2srZUVE?=
 =?utf-8?B?alNXZ25jam9hWjJ6WEl4ZktBbEJrK1NnR2JNSU5iVFVucFpuLzZkVmx0NVZU?=
 =?utf-8?B?OS9LLzFxTC9HY1JaS3JtWnVRQ20xWm83TENScXA2d2V2bGxhNngyVDFxR3Ny?=
 =?utf-8?B?c1VHeHcrTjlmQmVkTURBSElNL01jazRnRWtwVVBmUEJjMGtoQ05ENC9Ia01L?=
 =?utf-8?B?N3pHVmpHeVdsZldKTnBKSnpEaXpTZ2lXRFpLT3hJQVRkbkpZRFVYS2lDcFNM?=
 =?utf-8?B?MkJ3SnZxQ2lnbkxiUlhHeHpNYmg5ODhjWURIODVQOFRzaFErbDZmWldtV005?=
 =?utf-8?B?ZUlqOE1nUlArNXhPb2tQTGR0NTdhQkFMbHBpN0hUNkYwSkpJSFdaNldtWDB2?=
 =?utf-8?B?d0d5RE12L284ZjQvRkpFbmVzSFZXdlZuNWl0UWQwY1VFQnRpbTk4U1JvUzlh?=
 =?utf-8?Q?qcDbg4QCJ9BLWkAAy0rlusoZt?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c6a5e0f8-9c9f-44de-fba4-08de29147dcf
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Nov 2025 15:41:52.3606 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: v/yPlgrXH60X2rFCcNVTZmZ3X7kA/UhJSH9yN46P8r+4tYVxZAVa9zop8Zq2dZic
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA5PPF9BB0D8619
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



On 11/21/25 11:12, Pierre-Eric Pelloux-Prayer wrote:
> Use TTM_NUM_MOVE_FENCES as an upperbound of how many fences
> ttm might need to deal with moves/evictions.
> 
> ---
> v2: removed drm_err calls
> ---
> 
> Signed-off-by: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
> Acked-by: Felix Kuehling <felix.kuehling@amd.com>
> Reviewed-by: Christian König <christian.koenig@amd.com>
> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c                  | 5 ++---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c                 | 2 +-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_vkms.c                | 6 ++----
>  drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c                  | 3 ++-
>  drivers/gpu/drm/amd/amdkfd/kfd_svm.c                    | 3 +--
>  drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c | 6 ++----
>  drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_wb.c    | 6 ++----
>  7 files changed, 12 insertions(+), 19 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
> index d591dce0f3b3..5215238f8fc9 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
> @@ -916,9 +916,8 @@ static int amdgpu_cs_parser_bos(struct amdgpu_cs_parser *p,
>  			goto out_free_user_pages;
>  
>  		amdgpu_bo_list_for_each_entry(e, p->bo_list) {
> -			/* One fence for TTM and one for each CS job */
>  			r = drm_exec_prepare_obj(&p->exec, &e->bo->tbo.base,
> -						 1 + p->gang_size);
> +						 TTM_NUM_MOVE_FENCES + p->gang_size);
>  			drm_exec_retry_on_contention(&p->exec);
>  			if (unlikely(r))
>  				goto out_free_user_pages;
> @@ -928,7 +927,7 @@ static int amdgpu_cs_parser_bos(struct amdgpu_cs_parser *p,
>  
>  		if (p->uf_bo) {
>  			r = drm_exec_prepare_obj(&p->exec, &p->uf_bo->tbo.base,
> -						 1 + p->gang_size);
> +						 TTM_NUM_MOVE_FENCES + p->gang_size);
>  			drm_exec_retry_on_contention(&p->exec);
>  			if (unlikely(r))
>  				goto out_free_user_pages;
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
> index f2505ae5fd65..41fd84a19d66 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
> @@ -354,7 +354,7 @@ static void amdgpu_gem_object_close(struct drm_gem_object *obj,
>  
>  	drm_exec_init(&exec, DRM_EXEC_IGNORE_DUPLICATES, 0);
>  	drm_exec_until_all_locked(&exec) {
> -		r = drm_exec_prepare_obj(&exec, &bo->tbo.base, 1);
> +		r = drm_exec_prepare_obj(&exec, &bo->tbo.base, TTM_NUM_MOVE_FENCES);

This here can stay 1, we just need a single slot for the VM update fence.

>  		drm_exec_retry_on_contention(&exec);
>  		if (unlikely(r))
>  			goto out_unlock;
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vkms.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vkms.c
> index 79bad9cbe2ab..b92561eea3da 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vkms.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vkms.c
> @@ -326,11 +326,9 @@ static int amdgpu_vkms_prepare_fb(struct drm_plane *plane,
>  		return r;
>  	}
>  
> -	r = dma_resv_reserve_fences(rbo->tbo.base.resv, 1);
> -	if (r) {
> -		dev_err(adev->dev, "allocating fence slot failed (%d)\n", r);
> +	r = dma_resv_reserve_fences(rbo->tbo.base.resv, TTM_NUM_MOVE_FENCES);
> +	if (r)
>  		goto error_unlock;
> -	}
>  
>  	if (plane->type != DRM_PLANE_TYPE_CURSOR)
>  		domain = amdgpu_display_supported_domains(adev, rbo->flags);
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
> index 5061d5b0f875..62f37a9ca966 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
> @@ -2656,7 +2656,8 @@ int amdgpu_vm_init(struct amdgpu_device *adev, struct amdgpu_vm *vm,
>  	}
>  
>  	amdgpu_vm_bo_base_init(&vm->root, vm, root_bo);
> -	r = dma_resv_reserve_fences(root_bo->tbo.base.resv, 1);
> +	r = dma_resv_reserve_fences(root_bo->tbo.base.resv,
> +				    TTM_NUM_MOVE_FENCES);

Here we only need a single slot to clear the root PD during init.

With those two removed the patch is Reviewed-by: Christian König <christian.koenig@amd.com>.

Fingers crossed that we haven't missed any.

Regards,
Christian.

>  	if (r)
>  		goto error_free_root;
>  
> diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_svm.c b/drivers/gpu/drm/amd/amdkfd/kfd_svm.c
> index 97c2270f278f..0f8d85ee97fc 100644
> --- a/drivers/gpu/drm/amd/amdkfd/kfd_svm.c
> +++ b/drivers/gpu/drm/amd/amdkfd/kfd_svm.c
> @@ -627,9 +627,8 @@ svm_range_vram_node_new(struct kfd_node *node, struct svm_range *prange,
>  		}
>  	}
>  
> -	r = dma_resv_reserve_fences(bo->tbo.base.resv, 1);
> +	r = dma_resv_reserve_fences(bo->tbo.base.resv, TTM_NUM_MOVE_FENCES);
>  	if (r) {
> -		pr_debug("failed %d to reserve bo\n", r);
>  		amdgpu_bo_unreserve(bo);
>  		goto reserve_bo_failed;
>  	}
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c
> index 56cb866ac6f8..ceb55dd183ed 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c
> @@ -952,11 +952,9 @@ static int amdgpu_dm_plane_helper_prepare_fb(struct drm_plane *plane,
>  		return r;
>  	}
>  
> -	r = dma_resv_reserve_fences(rbo->tbo.base.resv, 1);
> -	if (r) {
> -		drm_err(adev_to_drm(adev), "reserving fence slot failed (%d)\n", r);
> +	r = dma_resv_reserve_fences(rbo->tbo.base.resv, TTM_NUM_MOVE_FENCES);
> +	if (r)
>  		goto error_unlock;
> -	}
>  
>  	if (plane->type != DRM_PLANE_TYPE_CURSOR)
>  		domain = amdgpu_display_supported_domains(adev, rbo->flags);
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_wb.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_wb.c
> index d9527c05fc87..110f0173eee6 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_wb.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_wb.c
> @@ -106,11 +106,9 @@ static int amdgpu_dm_wb_prepare_job(struct drm_writeback_connector *wb_connector
>  		return r;
>  	}
>  
> -	r = dma_resv_reserve_fences(rbo->tbo.base.resv, 1);
> -	if (r) {
> -		drm_err(adev_to_drm(adev), "reserving fence slot failed (%d)\n", r);
> +	r = dma_resv_reserve_fences(rbo->tbo.base.resv, TTM_NUM_MOVE_FENCES);
> +	if (r)
>  		goto error_unlock;
> -	}
>  
>  	domain = amdgpu_display_supported_domains(adev, rbo->flags);
>  

