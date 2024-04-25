Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 27A938B1B0E
	for <lists+dri-devel@lfdr.de>; Thu, 25 Apr 2024 08:29:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0886711A1AC;
	Thu, 25 Apr 2024 06:29:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="A4qehnBs";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2065.outbound.protection.outlook.com [40.107.223.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B25C11A1AC;
 Thu, 25 Apr 2024 06:29:21 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oEdxtSqySg58rjzgCVbxPfxX+LDegTQA+Eome3D0J1U7CvCMwvBu6WRqxmiPXw7jZyI0VQQBH9iNs3WGjHp+ormf87avj5iLMPNvvcnI8JdImOoTk5MGvO63lkhB3b20L6EJChWt5f2OQtKU0TTfC7YBER0QgIuZfl/ab1E7S1P2Uax4U/nD7yl6QW/bjcTCt1GwD4ugA/FlbJ5Ok0dG6NtgJtk/gh2b5HOv2sXO2IuN1ccIz9UcS/zExSeAO5mZQdTIoonxvNK5LlhL98A79WyrU5R5c52Yt780G6hGE9VwJZWRoBIUxtpx6CCzVgaoRhuh2tF46s9N3A3HoiTZsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sMQvVkUinSHsfO8sET2Iun2r9+AZOEA+vunAt4fkDYk=;
 b=PdXRjzn/c7JBLMu8GdI6dAYz8gAspotIyhHl4syShBU1/SRFSuncMTLJ935DRzU6rgNsZiSo0dJhVv1BP86PrcceiWjyzsHHyOCYQWdsDwX91B7gkUT0THwhTSrxoXtHksiTMi9ZK8mkIRzEGNZdyvIrAlb2rlsTZIpOm6mKZ5404o5Vz61FISaN1uRbFdnrBWLLwz3K1dviWFDVKXHUVLoDzQevdbUGH78bf/3UzpxJrGQWE7PieD6iWas1HH0lRBOZYnezAfUmzXwo47aJlp54d4olEPZdRsTZrshTj267vwdGGswMn63BYQyqfV1FdrslFcJj7Ob6KUsrl+hFmA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sMQvVkUinSHsfO8sET2Iun2r9+AZOEA+vunAt4fkDYk=;
 b=A4qehnBs0xhi0d1vxstWbpxd+kaQhN+muYgymVgjUErk/Qdihs/2x5Tlj0Kp4Ii4NNyoxcZ06y0IyKTXAH3bvhVWyfmI0g3RsnceeZ0tuVT1zmQNRL8Gh1Qb86kryF112YA53q2zYfW/iaFlyFJ0ffg+Mjp7CwCFqTyP0b/PSQU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by PH7PR12MB7915.namprd12.prod.outlook.com (2603:10b6:510:27c::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7519.22; Thu, 25 Apr
 2024 06:29:17 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::f2b6:1034:76e8:f15a]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::f2b6:1034:76e8:f15a%6]) with mapi id 15.20.7519.021; Thu, 25 Apr 2024
 06:29:17 +0000
Message-ID: <fc706211-0c85-42b6-93bd-66bf20fdef8c@amd.com>
Date: Thu, 25 Apr 2024 08:29:11 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 13/18] drm/ttm: Implement ttm_bo_update_priority
To: Friedrich Vock <friedrich.vock@gmx.de>, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org
Cc: Pierre-Loup Griffais <pgriffais@valvesoftware.com>,
 Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 Bas Nieuwenhuizen <bas@basnieuwenhuizen.nl>, Joshua Ashton
 <joshua@froggi.es>, Alex Deucher <alexander.deucher@amd.com>
References: <20240424165937.54759-1-friedrich.vock@gmx.de>
 <20240424165937.54759-14-friedrich.vock@gmx.de>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20240424165937.54759-14-friedrich.vock@gmx.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0133.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:97::11) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|PH7PR12MB7915:EE_
X-MS-Office365-Filtering-Correlation-Id: aee73155-c090-4d36-dd8b-08dc64f10888
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|376005|1800799015|366007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?UVJubUc4Q21SOFFQWmFJKytHRFhlK1I5czdwbzJ5Tkp3K1luOVc3NHVqbmwz?=
 =?utf-8?B?eXFoekYrZXdBZHJURDFiMTNBbXBrOVozbCtkQ0RjcU1wWXJWM01wZ1dXUW9l?=
 =?utf-8?B?RzlDV25ZbGhuMG1oRTJhT3pRcTVNOWx5UzRGMWMzd0RVTDZORzZ3Z0RHTHQr?=
 =?utf-8?B?YUQwcFRPYTVLeDVSM3NrNjJwODdzRVpZQTl3Y0I3SmNtZVpSdC9oaEFrblFF?=
 =?utf-8?B?c0ZzUDJycHdTYWFDakNiTkZmZUF0T1VkSml3djZsc3pFb1FWVmRkNnhwdjl6?=
 =?utf-8?B?T2ZoWFdHYkhPOFJFczBxWDh3b0tzbHE2M0xIUU45cFQxVTdtcnVaSzZMWkZX?=
 =?utf-8?B?ZXZXVm1pQm9vZUxXclRuOTRERjB6b2ZDbUtOOVhmWGJCZk5IMnhoa2NrMDVX?=
 =?utf-8?B?azhHZWYwL0dLeFJEcFpFVERtTWZIRnU0NzZlYmlnUjFqazcyNTlJd0VOb296?=
 =?utf-8?B?cU5iMFlVeUxmZnBjSTNVQUxqQVJqU1pWWmhPb1J4RjErTjE2M2xPeVM5dUY0?=
 =?utf-8?B?K01BWTZ1Y0FsSkU1VStIU0pnell6WUhKa0Fva0RrV28vS3FTbm5Jdjg3VjE2?=
 =?utf-8?B?TEN2bzNXYmtmdnNkSW4zU2xLY2o1Qy9EV2pvcTljTHRNWjRoSWNQQUtEWjky?=
 =?utf-8?B?VVlLUit5R2Z2d0tidisyQXloak91Q0FiTlVLWTU1aXdGdHVwY1F1bStGTEV2?=
 =?utf-8?B?MTlBR0gwTDR5cmhnVnZKeTRtZzBvRExWUWkzcWxkTC9ONGJNTkszTGpJQ09V?=
 =?utf-8?B?Q2ptWG1LUlJ0MTRGN3EzNzArZmpQVXptRWRoaGtaeW54SWx6NHZURHBoR0Uz?=
 =?utf-8?B?NC9xQkRxYUhUQ2lCSHFpb1dDM3BnT2FsdmJ2RzVQd3ppNGVwMVoxQ3k3ZVRZ?=
 =?utf-8?B?bVdGNWtvVFMrV3NUdEVnSFpZZ1JDVHA5bFN2MFEzd1V4MklOOVVmSzQ4bkZQ?=
 =?utf-8?B?R05OR005YWFKWUVlenFwUldKYTU2dnJLS29IOXBBZ1lZcW9BNjBiVzZGKzFz?=
 =?utf-8?B?WHlDcDl3MTVCSHcvQnVRSGlORTRDM0U1TVhUaDJ0b2dsTGdRcCsrRVhXNkx4?=
 =?utf-8?B?em5wRDdLR3Q0YStkZnlkWFBLK01XRHg1K1U0SkxoczRpSDBxZmxEZUJYYmdJ?=
 =?utf-8?B?Q1hTbHNHc21heGhuQWVlSzY5ektCUUZydjFUaWJvVzhxQnNFaXFpSU5lNXVj?=
 =?utf-8?B?bUpycmpCRHZvK3dJSmxEbFBjU0RCWnROZ3UrSDVPRUFOaGlYcVRMZXd6c2xY?=
 =?utf-8?B?Yk5oS3pTOGVhOEZjZFp5SFd3Z292djBiQ0hDZlhMTElrZlZud2hod09PZE1X?=
 =?utf-8?B?OWN6ZEV5RGJvOHdtRHg4WU5nSThuSlI1dFcvOHFwWFc0bXd4UHNGQjQ0VVYv?=
 =?utf-8?B?QmZNZEhpeFNtVHp0ZURxR25zbktjVDVoVVR5MFNlMzBuVFR0YThXOWFKMHlS?=
 =?utf-8?B?czA3WEZLb2QwQzRBWEhXRlMwaGxkM09KWjFqVVNiU09MTTI2RjcvQm80UE54?=
 =?utf-8?B?c2J0cWo3cHUxU3BWVkhFMlNsMVgxZXpvQXM2dHZFTXNuTGRkQzEwZDQrbE1Y?=
 =?utf-8?B?KzRIY0I1d1hkLzArZ2h1ZFhIY1R5VU41TXNRcEduZmNwRS81Z1ROeS85UUta?=
 =?utf-8?B?ZEZZbzY1R1NwWE9mZ1NpcmwwelozV3MrQ1BDdlJqaWcrSHRLaXBUMklVOUND?=
 =?utf-8?B?VHNvMnU0eDZqWFIwdytoMEhES1IvbkJLNWlCdkd1MTBmRW5NY29SOHBBPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(1800799015)(366007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TXFFM1lGWUZKRDk0NUFKQVRxSTdiYitMbVIyZFlHZDNsZVBnVVAzZTdkbEFn?=
 =?utf-8?B?VzhRdkxqaTU1bHlZYU56V3h5endUbUpEZlIzNXlwekJkd2FHNWpGNjlKV3BJ?=
 =?utf-8?B?Q3VCSnNCdnVOUm0zWDJnRHlxM2FCVzRPVmlmdC9hcXBGL0hCN25TK0VJcGd6?=
 =?utf-8?B?MnQ2bnVOdFU4OWt1Wldpd1VaRkxXQjlEVk9vSzNpOXpBcUlDVWtRa1dBWU9s?=
 =?utf-8?B?MkVyeENzMGJGY3IrbmJuMlowMUJBMTRkdGx5cTZTWkFlMmQ5bSs3eTY4RnZl?=
 =?utf-8?B?TGRkYXdKM0JLMEdZSlg4Sjd0NTRGSXRqdGlvODRUUHFWKzNFcWNQN3BMaUly?=
 =?utf-8?B?UFhWbEUzNVd6UDdXNGJ0MlkxRkFUSnV5Y2UwMExvdGVrWm1VUDM2K0tIcjY3?=
 =?utf-8?B?Z2ZPOHhQcmtxTXdVS3phazhkT1ZXOTYyYllUMWc3TnNxZG1JUEJqZ2VoeWtB?=
 =?utf-8?B?SHlIVDR1ZHI2MjJtVmRjOGpGUFo0NlBOcnVITjl5TE9uWE1ocDBMVFJ0dkhr?=
 =?utf-8?B?TGg0R21PQjRyd2xrWGpCRExXSTVxRXdybnllbFN6T2RYV0RsSEtaMFBUSldr?=
 =?utf-8?B?OHVTNkZ1RGtNOTRHQXpDUEZtYlI5bjd0NHExSmJwQ1JqejlzNGxqNk5IMDY3?=
 =?utf-8?B?Qy9jaEkxRk1xOG81WHhETHdiMmFuT3RXZGdheSt5SEl5V21pNXErZDdzSlUr?=
 =?utf-8?B?RVZHMmlPN0NVLzNuNWxSc0gyWWtWUlBQQVdpUDU1OFkveUdFc2w5aXl4bWxv?=
 =?utf-8?B?dGlPYUM5cXBsQytoNVhjcXpqQm53aE0xYTVMcWR5TGVEMUJxNlFYelZRYWFB?=
 =?utf-8?B?WjM0WUZBNjNoREhaWXVQNXZSZGNNL2VacVZJKzRaSVN6TERGNFhDa25nS2x4?=
 =?utf-8?B?b0tCdmo4bXdsbitnNWhDTzRxZHZvQXNKSVpJZmNTT0JaZHUyQVBYOXNoQlEz?=
 =?utf-8?B?MnBoNVBtck1GUHFTQjMvZ1RqNmZTRGJRY2lYcXRrUiswRXU1Vzg0VS9JODJP?=
 =?utf-8?B?ZzBhRUU2MjJQMld2aUVNQnk1dEhLOXZMUzJqdjFGL2pkMjU5a3pvQStsc3RY?=
 =?utf-8?B?WHNzbE1weTEzd3B2UGhkdlBaV3dyWXFjNldGanFWSTRLTTlocUdUTnBubE5S?=
 =?utf-8?B?aHA4bHgxdmphVDZpN1YyNmYwYU1jWDExb2h3THZWZWlzWmF4L2JqbjhoRUNt?=
 =?utf-8?B?NkYwZHR3WFpkQ1k0TUtGWXJuNnIwV1lkdEpmODhZbFYvNXJQeGFQTkIxREtP?=
 =?utf-8?B?QTJBVGV2UWJEam1yeTlvMUhQdDB5VmRSU2t6a05YT1RhaHIrVnh4Z2JlM0sy?=
 =?utf-8?B?Q00wVk5Wd29YNzFSdHU4eEthMytiRExoemFWRFZ6NE9aZlhOSTR3RG9SV3FS?=
 =?utf-8?B?T0tjRHo5V0FNMnp0TWE4VWZiTkxnQ09hNVlmTEhYeGdMaVdtZVJPSEJCVDV4?=
 =?utf-8?B?UUc3T1JZUkNMeVlnaHR1K2NpaS9DNlZlVlc0aVFIS0VEbkRXQ2ZjZlF3b003?=
 =?utf-8?B?SmlCWkIzUjRYT0dpcXlkK2dKaHNDNi9UR2owdEpaREtOSUlZZmhoalBsaEp1?=
 =?utf-8?B?blBUSHRrYWdlRzIwd0FDZklhQ2l3OEZ3Y0o5UVFaeFRCOTlHTjRTL01uSnNM?=
 =?utf-8?B?bmRFdkczbWlFY2pBS1hLYlNkNW5SSENhY0JnUG56SFJvWFgyUHBSMzcyK2Fp?=
 =?utf-8?B?aXFiUW90UUl3THRQTzRReDFWV3czYzF1OGVLbE9VYllhK25YYlRxc3VCekkw?=
 =?utf-8?B?bkkvZGR6TGVsa3FxTnhTNWNpS2daRE5oamxSQkYxcXV1OWZlaU1jRmg0VlBX?=
 =?utf-8?B?LzVtZW5EZ1NwajlFSjA4RUtnSE9rYThPQWpvVnV5RHBMMjV1OGdHOGlydXRj?=
 =?utf-8?B?SlpiMXp6bTdpbXNzMjB0MEtwK1JwVFgzd0Qva3JVTVdIcUQyZiswc214cjE0?=
 =?utf-8?B?UVNFdjdSQThCbVJ1ZzRvdWFOMmlXeHFnaTNUZ2FVdHBQb0xvNXFicGhRbmlR?=
 =?utf-8?B?R2p6a1d0M1g3T0RqSHE5aWtsRURBUEJ0NkpYRVZIcU1DV0ZVNURDbXVvZndn?=
 =?utf-8?B?ZUc3VDhGdEwrbTlXZDEvc0ozMWx2ZXY1a1o1Q0x5Rm0xdVdEbWNLWXlmQTVI?=
 =?utf-8?Q?Ux+qSEIAq6kddPLNxRLOg9SrB?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aee73155-c090-4d36-dd8b-08dc64f10888
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Apr 2024 06:29:17.5074 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nzeCMVJn9fFraklui7A+2waZIz4BnzR97kuPp+ZHBRfBNgJUWEca+d/0SZC6YoL5
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7915
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

Am 24.04.24 um 18:57 schrieb Friedrich Vock:
> Used to dynamically adjust priorities of buffers at runtime, to react to
> changes in memory pressure/usage patterns.

And another big NAK. TTM priorities are meant to be static based on in 
kernel decisions which are not exposed to userspace.

In other words we can group BOs based on kernel, user, SVM etc... but 
never on something userspace can influence.

Regards,
Christian.

>
> Signed-off-by: Friedrich Vock <friedrich.vock@gmx.de>
> ---
>   drivers/gpu/drm/ttm/ttm_bo.c | 17 +++++++++++++++++
>   include/drm/ttm/ttm_bo.h     |  2 ++
>   2 files changed, 19 insertions(+)
>
> diff --git a/drivers/gpu/drm/ttm/ttm_bo.c b/drivers/gpu/drm/ttm/ttm_bo.c
> index eae54cd4a7ce9..6ac939c58a6b8 100644
> --- a/drivers/gpu/drm/ttm/ttm_bo.c
> +++ b/drivers/gpu/drm/ttm/ttm_bo.c
> @@ -112,6 +112,23 @@ void ttm_bo_set_bulk_move(struct ttm_buffer_object *bo,
>   }
>   EXPORT_SYMBOL(ttm_bo_set_bulk_move);
>
> +void ttm_bo_update_priority(struct ttm_buffer_object *bo, unsigned int new_prio)
> +{
> +	struct ttm_resource_manager *man;
> +
> +	if (!bo->resource)
> +		return;
> +
> +	man = ttm_manager_type(bo->bdev, bo->resource->mem_type);
> +
> +	spin_lock(&bo->bdev->lru_lock);
> +	ttm_resource_del_bulk_move(bo->resource, bo);
> +	bo->priority = new_prio;
> +	ttm_resource_add_bulk_move(bo->resource, bo);
> +	spin_unlock(&bo->bdev->lru_lock);
> +}
> +EXPORT_SYMBOL(ttm_bo_update_priority);
> +
>   static int ttm_bo_handle_move_mem(struct ttm_buffer_object *bo,
>   				  struct ttm_resource *mem, bool evict,
>   				  struct ttm_operation_ctx *ctx,
> diff --git a/include/drm/ttm/ttm_bo.h b/include/drm/ttm/ttm_bo.h
> index 91299a3b6fcfa..51040bc443ea0 100644
> --- a/include/drm/ttm/ttm_bo.h
> +++ b/include/drm/ttm/ttm_bo.h
> @@ -359,6 +359,8 @@ static inline void *ttm_kmap_obj_virtual(struct ttm_bo_kmap_obj *map,
>   	return map->virtual;
>   }
>
> +void ttm_bo_update_priority(struct ttm_buffer_object *bo,
> +			    unsigned int new_prio);
>
>   int ttm_bo_wait_ctx(struct ttm_buffer_object *bo,
>   		    struct ttm_operation_ctx *ctx);
> --
> 2.44.0
>

