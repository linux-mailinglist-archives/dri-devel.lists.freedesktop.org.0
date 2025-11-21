Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E6C73C79131
	for <lists+dri-devel@lfdr.de>; Fri, 21 Nov 2025 13:53:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C7BC10E2AD;
	Fri, 21 Nov 2025 12:53:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="WWOBCnie";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from BN1PR04CU002.outbound.protection.outlook.com
 (mail-eastus2azon11010063.outbound.protection.outlook.com [52.101.56.63])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 47B2010E2AD;
 Fri, 21 Nov 2025 12:53:01 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gQV5uKQpMsc++bU7UfXLt3HIQFWpkQ1pUoPt+sk3aZMVYEFitrBrtgs27iAirUrcwvPN/w0Vs7Srsadkc2oL7jO0x9Nb7zrGZuORozluJgLEXYhCii/w3K9JuW9cgEA7Xr6CI7OLSdJHN3+ohhf0S5+l2/gUpox4b0QNaBiGkeZYq2jkirt6n8oquLjH8yRes5hoTzwSm58ejjTTVfzYvklZpTUKAcxPfRgirWQio5I2xOcHcvp4oj0+z9fcwmmbXmKbbqCwrYxK48OiyycPirlu+nsC/PPbHtqQQY1gULg4wT3HvAGwi5puy9qv5sBTwfVmKbZb1YX1WYTiUJ2Oog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vvo6Sx0AwdxABl2XEEkVVtkZPgSodZC/zYcMcWa6TrQ=;
 b=GZZRZ2UY75rjhBCyZRq7EVPb2/gHMvj2uGXuqEmCySIO/qnAZ2nteyEh5bgIm/4npixR6ZELwtgwH/oHXaWJZYqBwBP06K0cNC4Y4K4mgMmQnrln6c0LL6mcmyFhfK7E5LY0xWCbZFyR9NMgSPwiZd1zYuNXRAAtr6yxLLs0ifhpwHtzs/expg9NisFd/dGubXC9DVRLDdURmKSbtZSXpsY1cwSKnLy4+ssBgR6iW4QiuJAVSNuyAUuWfMolf9VMo18BWQXvbmVBHQRQu23291TPR6ocGMTwlNxgltDgv7wDxhpAJdlM0423noitWl3uGB6NWgRgvAOcGgjqlrKtVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vvo6Sx0AwdxABl2XEEkVVtkZPgSodZC/zYcMcWa6TrQ=;
 b=WWOBCniew3r5U5iSxJHaBiaVYse89CXLCRKKs/PfAvNo1yjoEDo9Kmdne+r6dnFvtNwsKeGnrnMEeYrZVcUCRusgs2ZlvSGy0+2NhgRVt3eszQT6iJb2xiEpnahDrlv4hoeDR4Z7Q7YXqU39X9wjKYWSPp9tNiw/ZVO7TrpvO4c=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by PH8PR12MB8431.namprd12.prod.outlook.com (2603:10b6:510:25a::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.10; Fri, 21 Nov
 2025 12:52:57 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%4]) with mapi id 15.20.9320.021; Fri, 21 Nov 2025
 12:52:57 +0000
Message-ID: <e42062a3-c373-40b9-9b6c-c251d09abeb2@amd.com>
Date: Fri, 21 Nov 2025 13:52:50 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 02/28] drm/amdgpu: use ttm_resource_manager_cleanup
To: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20251121101315.3585-1-pierre-eric.pelloux-prayer@amd.com>
 <20251121101315.3585-3-pierre-eric.pelloux-prayer@amd.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20251121101315.3585-3-pierre-eric.pelloux-prayer@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SG2PR01CA0193.apcprd01.prod.exchangelabs.com
 (2603:1096:4:189::18) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|PH8PR12MB8431:EE_
X-MS-Office365-Filtering-Correlation-Id: 3d764d51-685d-48ad-eff5-08de28fce4f9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?am1zcHZLUG9hRlBWNElRYkVzSUczWUNjcTFZeU5vYUt3cFJyd0lLcElRQTBW?=
 =?utf-8?B?SEhvTXBoeWcwMG01ZHlySGoxK0lQN3dxZkNYUWJ2L1J6RllnSU5jdUZmL3Rh?=
 =?utf-8?B?V2tLelRVdmhDV25MbGJRam1OOUh6UzlQaDZKTDJoTUt1RFhnQ3NjSnN1TjVj?=
 =?utf-8?B?WW5tTGdwYUtRbzFhR0h5TU5oZmU2a01MQWJ1SHd6UHlBTm5YZFVGVTBQYXJl?=
 =?utf-8?B?YW52UXViU2lMd015NllQOGpwQklGVnpPRGpHeHIzQXlOUjJTRFlLMWZ4RmVU?=
 =?utf-8?B?QmR4c3ZmQXlZU1I2VUE3bWE4cUVZYVpmcElsRDVHNnd2T2QvaVIvRHNzMEdC?=
 =?utf-8?B?UWxrMFgzN0VERURscmFmOGQ5N1NCNHI4WnFKbHJJN2VRSUV2WHYyNTJwUmpH?=
 =?utf-8?B?OGZyajh3YjBNTFIzVEs1UzloNlpFMXJYY1BiU0F3aEFIbnBhSGdTSjQ0SmhB?=
 =?utf-8?B?RmV4Vm9lU2NZVFhVRXNaWGxSVFRwcWhLWk9ySXJkOUxCZ2plVVljSFJNN0lF?=
 =?utf-8?B?bTY4Rk1GWnZWZmNhRVJyamxXQmtpUm5DMFBlQ201QTd5L2hqM2ZaeHc1ZER6?=
 =?utf-8?B?dnZxTDhJVUY5azA5WTBXOVhyRzRxQXZwcVlBWE9HVHlxMUhlVVdCKzh0bVVz?=
 =?utf-8?B?dkNuUytDNnV3YkJweEhJNXpDL2pTNStreWlwdlc5WVpZbjlSMlpiVXg2cFEy?=
 =?utf-8?B?L3lzT0VtYVg3N1R4aWpaRzAzRUFWNGV3a0xpaHpPMU1zSDlycHZ2ZW9HbzFQ?=
 =?utf-8?B?Z0h0dEtSL2E4SGhtM1U1QUJoVFR6bkpiMFQyQ0tDMng4YW4zK3Vmb3J4QXBr?=
 =?utf-8?B?dHNYcGkxcmZZU3FwTzBNelJOWWd6bldaMC9HR2pGSzc4SkxmdFlHaEczSXlm?=
 =?utf-8?B?NFE1VnNpQ2gxRldZMEQzV2orMTB6cVpQVUtzU3lEZHJCQktHYnUvWDYyRHJa?=
 =?utf-8?B?bEdSZXhxb0hGV01FZ1hubzNKeklBNmx5K2gyN0VBWXhUQVYxcC9ER3VXNFF2?=
 =?utf-8?B?YzhJTlBmU0JGUjJ2QzMzdUZPaUhQY2tsZSt5TXNJaFZsMGJWc2I0SFErSldI?=
 =?utf-8?B?b3dScFZteUMwblp5WExweGFMWEwrZy9rRTN5UnltaWdrRTY5amFQWjdpOUNi?=
 =?utf-8?B?elRDZ2dEY3FvL3pDNHkza0dxVFc0S01Ed2FycXJlWXh4cDVGYjYzdWRhNkFn?=
 =?utf-8?B?azcyd0pKdDJxMHZiUkc5SjM1Z0I4Y05DaUlyZkpUNXQ4L0xQVm1UK2syejFk?=
 =?utf-8?B?OWRoUWR1NkVVNHpKL045eUJsRlI4VFdKUTZZblcxR1RXdHdBTm1NWElhZlp3?=
 =?utf-8?B?YnkyOW9tQUNDLzB3WURkRWVYUEx4a01vQzRKTThDWjh0a0JBSnR2b1QwV3Qz?=
 =?utf-8?B?RDkwMjdtcmJqakh6cWtVUnlMYUlXM0FtdWVRRis4OUZocVhVeDRHK0dOU2Fs?=
 =?utf-8?B?QkxHMG42Nmc5RTBDTGJtNHlPc1hLWTFUMzZ5Q2V1R0llbHBHeDcxZjZYdE1D?=
 =?utf-8?B?YmhUbmJrb3BoVTF6aWIyN2hWekJWeFFpQ1NJU05US2k0WTNOSVdvTWc2S3ds?=
 =?utf-8?B?OGdvWG5FTWMyZlV0Mkdnbk9Nb3poSTB4dG8yM2ZMdE9DZldlNzRMTVpLM2gz?=
 =?utf-8?B?aTVMWkdNb1o2V3pFWktMWFEvNDlPUVhSSFJZeVN2QWdSV21UN1RXTFZpU1lS?=
 =?utf-8?B?eGVFVHIvN3VITlBSa0lEajJMR0pBV3VZVkhsbEh0dUNxbkJ0VnNMSXA5OVdB?=
 =?utf-8?B?K2dERXBhcEs1aVcraXJVbm1PVUhiSGZmckdqOFplOUFESHAvdnVXK21Xa29G?=
 =?utf-8?B?cC9pM1JNRDd4elFxcXFqa3ljNk1LS3BvMHNhOWNMcFRuRXNjZG5vdk55U0N2?=
 =?utf-8?B?aGZoVm9IS0IvZmtMREdrUnNjVmFyRTROYkVjc29Qa3NOS1BkdVN6c1BnZTd6?=
 =?utf-8?Q?vCH4y01pj0m8M4drGP4vAIS9xKGobfUJ?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cnNnNkNMYjNtcy9iUHNYdjJ1TW5MNVNNZ2ZCeFduTmNxdkNCelJCSmx3TUJQ?=
 =?utf-8?B?c3MzZ2QyY1lmTVkvNkFrMnhuZ3lNZGozSEhwY1p5OU1VN3VsS21MWmtHanhv?=
 =?utf-8?B?dFRNaEI5MWU0eWZwZVlvZXRuSm1HdFNHNlhkSjQrNnNSMkFBTU5WZWZDT05P?=
 =?utf-8?B?cmIwSjBUL2tvcEcwSjBiRVpxREhSYTJNQ0RkZ3Ewam9SZW1iOE90aWpuUGIw?=
 =?utf-8?B?UWh3VkZPaUF3RE92b0QwM0pZOU1yKy9PUk81YUhXc2h3cGVXM3dnNTZPc2ly?=
 =?utf-8?B?b1l5VnQxdWRHeHQwWXZLQVFkNmtQMUFzSTA1bGkwK3NoUkhpL2I5MnNCT1ll?=
 =?utf-8?B?c0htWjFRUS93NmhIWitmczVtMitLODFtSHVuZlBBV0p5dnpWVDFpK0gydWQy?=
 =?utf-8?B?UlRMUVVnVlZXN0JDS21oSXdtdys0eEJLclhvRENWWE5GTCs5QUl3UzF5aFh0?=
 =?utf-8?B?THRJTUgwZkY1TzFXNnpRbUNzaG5ZNGxySGw1M1gveFFJTFl1RnNpcjNmbTha?=
 =?utf-8?B?V3RwdEVRTUxhMWFnL2RCMGpEYXhNcW1mNjBHMEU2YzlNYW83UWxiQjVxWUFr?=
 =?utf-8?B?V2FrZGxqRVpNSGpNSnRrWWVTNm1rQnZaOHZCdVE2OWlIYkFPL0FNaEx0c1RW?=
 =?utf-8?B?c3VwcmkxK2JaSTlDaC9NQ2Vrd2Z5TGRXTm1ROHFZZzh6aHJCOGFiV0M5S0xv?=
 =?utf-8?B?dTExS2FSMXVKMDlpbkhrdXVwaHRVL3ZKY0orT1VyUXNFNy9EaVRnN1U1cUVH?=
 =?utf-8?B?Mmd2V0JNUnJWOWVDc2haSytFQW9IU3M0L1c3VDNQRGprYU4wcVNIc3UyR0VW?=
 =?utf-8?B?NndjcDVsM3ZCSm5qbkllQWJST21XQ016UmtLODRWL05xN2R4RVYxYVNySUV5?=
 =?utf-8?B?cWpVZEpVMWx2SllrUHJzYmR0SENsRDN5UFNDNDNyelMzMkZTTllpYnE5Vnp3?=
 =?utf-8?B?bUVXQjYyNW1RcUprRmJ1WGl4WWRXeWhzQTFZeTNKZEZYR0R6VkRWbGFkNXBG?=
 =?utf-8?B?ZmVwSUJoeDZyK0x0V1pEc2JoZlJQOEQ1d3F1NEw0RzRZYXZ4M3V1SHJyLzFv?=
 =?utf-8?B?RzRHMFVwN3pJczdla2pXRG53K3FJKzk4NFdPZFEvUkFRM21uVmRXMzV4YXYz?=
 =?utf-8?B?b3gzTkwranV4QkhzNTBmMDJyZ1crMXJjUU9nN0htM2NBWHhDOTg0V2pRYUx1?=
 =?utf-8?B?RGtNclUwUktpRzErRjhFcTlZRDk1TW9qTk5yMmxGV0lZOEJoMzFZTHR1UWlM?=
 =?utf-8?B?VTU4YVRmeWFscXo5a3l0VXBRT2huVlFnQnI5dzFsdVc5bmRDb2ZVb1JVQUlV?=
 =?utf-8?B?dnF1TTRDSTZITmtoQlA5MndZV2JnRzZ4UFJOdVhtZWpWYkNyektnQlpnQmpP?=
 =?utf-8?B?UnY5OXFCaDg1MklyVzBJdS94bVV5K2QwZFhSaTB1aHFsZ0J5TVJWNjBIOU0w?=
 =?utf-8?B?SHZMaEJTVEV4Y2RDbUtCZHd6L29RQVFIWW1KaTZCUTR2SFBLU2dBbU5WTVVV?=
 =?utf-8?B?cTVuRlBVMm4zRlBScFRUNjhUVU94Z1VGU2pTcmVGcmMwSXRqOXZPcGVQOHdm?=
 =?utf-8?B?ZEhTNjdtUG93Y05iZDBnNWlPaEZETU4xd0dSTDBaYi83MHZFSWtldVFFbGRp?=
 =?utf-8?B?T0F0L3RyNUxLa250ZzJqSjZwM3BrOG9iZVN5eFdwcnJxYzFuNVJBTTczU242?=
 =?utf-8?B?cnQxS2x5bGJTT0RjQ2s5QWIrVVllbHNBOXh4QWxpLzVTQ093RWhUWlRYVHY3?=
 =?utf-8?B?TmU2Y25Fc0pGYVpWUTlmcTdwMFIramdST0JRT2NuWXFrR0dtYnVtQjUzaDRS?=
 =?utf-8?B?OHdPZ0xNbVFKME1ickJXN09Ia0FRMzd3SXFsZWc1aWMzaWFzdDdnTmN0dDVC?=
 =?utf-8?B?T2ZHTHNPd1Y0RWxadnJwM2o1R3ZPSDh0NzZKeWZubEFrQmVxN053ZkJUTTQw?=
 =?utf-8?B?Qm9mQnJZTGFWTTNDbHhxYVkvZTZsSWlxZFhwV3MxempnL3FGRXBzWWJSNnly?=
 =?utf-8?B?UFJvSkVwQmROQ3lNamIvNThuNHVtMVJneFQvcnFuQjg4ekpSOWF1MCtvV005?=
 =?utf-8?B?Y3k5S0Jkak5QNkVYYmRNQmdkcjRoNm4rZFV2OHpNUi9jdXpJaGhOWkhRU0hL?=
 =?utf-8?Q?UzA830nSbViImOziOo1XMp7Eb?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3d764d51-685d-48ad-eff5-08de28fce4f9
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Nov 2025 12:52:57.3763 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: maEehneeacKXfwDKB1qos6jtz+0sHHLzA/+/YeKnT2cxIgcj1+3UGtKPDvrFUFk5
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB8431
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
> Rather than open-coding it.
> 
> Signed-off-by: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>

Reviewed-by: Chrstian König <christian.koenig@amd.com>

> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
> index 6a1434391fb8..8d0043ad5336 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
> @@ -2182,8 +2182,10 @@ void amdgpu_ttm_set_buffer_funcs_status(struct amdgpu_device *adev, bool enable)
>  	} else {
>  		drm_sched_entity_destroy(&adev->mman.high_pr);
>  		drm_sched_entity_destroy(&adev->mman.low_pr);
> -		dma_fence_put(man->move);
> -		man->move = NULL;
> +		/* Drop all the old fences since re-creating the scheduler entities
> +		 * will allocate new contexts.
> +		 */
> +		ttm_resource_manager_cleanup(man);
>  	}
>  
>  	/* this just adjusts TTM size idea, which sets lpfn to the correct value */

