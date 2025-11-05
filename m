Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FBE7C35BDC
	for <lists+dri-devel@lfdr.de>; Wed, 05 Nov 2025 14:00:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5827210E0B7;
	Wed,  5 Nov 2025 13:00:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="eLl9PV9a";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from BL2PR02CU003.outbound.protection.outlook.com
 (mail-eastusazon11011023.outbound.protection.outlook.com [52.101.52.23])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 98B5D10E0B7;
 Wed,  5 Nov 2025 13:00:37 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EjxdKsKHMnuXF2x6Q6aOSd0W9rBt3+lEeirbx1I4y8xab90gUOSJ5+aIgDIezbVKHme8EGEl1Yt0v+vPJTcZQSAb0hiYW0UqFB+1oUaPBV508vXzEdmNmu8jRlz2ICJnClXxZmdFPgy1kvrfCqoTzgyxvFvMKSKOvuot+2p8baQrwTKZ8MIrzlZYd84PE6zG6065sP3pXQ1LbysoA0B3IcwnZ3FVScQB4OOuNy23zChMmyEODO/hyOQg6kOlZ9r4XxMlSGDYebf1IL3vBqjOoNdWhJ5iYYuEQ7HgkneYRvczn5TxpuipOSKRBfOWEvULFF30kg6yb7sYzVrM4uLBOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/OHOCQqh5sNGG+6ssd03z2xmGGDE1if/tr6YKyczS4M=;
 b=s7HCsgO0t8x3Mj1RuK6tRGSPAFFyAk/fPMedSfNZWUSht/Hs3iz/FWGSAU9Atnr5fbtKOqrbwtqN4My4JhzONglf18zLsG+IPiYWlUnWdPveCXCIQeyQo3b8MJfz6Ln3KcB0rSKxFjIRF6QaT5ltIU4hksPe42yWCqjTCE8k6YTiDLwGzlJczFXloTYBb5SLWk0+klKB9mR4Bxv6FOOFY4HnhU5jiE/zJbWEF3y3SMFkhjptu1rcVEmY+x9YsCDBDm/YLKVJNwibKhxFPLn8DKQR0kH5k7kku+HEguiRM/O9/Ev7hsVdbrAaJG4TDtdyymGfB2/amm3Yep1nkBEz6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/OHOCQqh5sNGG+6ssd03z2xmGGDE1if/tr6YKyczS4M=;
 b=eLl9PV9aM9a272h+mk4mP/YvClEzjS2FhXftZ9E6Uek9JLGWxvQtluIyLScPezBJCPp6b7FWJGyIXfFdYMyXh7Y+KCZpNkmrtNTHXe5wTiiTIAMEBYK1C3BY9G/1qSYetExVyKaW7Cd7GUptldlA+rpKmWCEagrBtepQVirmp+Q=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by CH3PR12MB7497.namprd12.prod.outlook.com (2603:10b6:610:153::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.10; Wed, 5 Nov
 2025 13:00:31 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%4]) with mapi id 15.20.9298.007; Wed, 5 Nov 2025
 13:00:30 +0000
Message-ID: <4c7011f0-5886-4e1e-a614-a6107d9b470c@amd.com>
Date: Wed, 5 Nov 2025 14:00:24 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 02/20] drm/ttm: rework pipelined eviction fence handling
To: Pierre-Eric Pelloux-Prayer <pierre-eric@damsy.net>,
 Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Huang Rui <ray.huang@amd.com>,
 Matthew Auld <matthew.auld@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Sumit Semwal <sumit.semwal@linaro.org>
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org
References: <20251104083605.13677-1-pierre-eric.pelloux-prayer@amd.com>
 <20251104083605.13677-3-pierre-eric.pelloux-prayer@amd.com>
 <13f0cda3-baae-42a4-a7c6-1fdd774bb5d2@amd.com>
 <5bf372ea-40ef-4b07-be13-53451828d3e1@damsy.net>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <5bf372ea-40ef-4b07-be13-53451828d3e1@damsy.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BN9PR03CA0616.namprd03.prod.outlook.com
 (2603:10b6:408:106::21) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|CH3PR12MB7497:EE_
X-MS-Office365-Filtering-Correlation-Id: e1c1a412-77b8-480e-4358-08de1c6b4cab
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|7416014|1800799024|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?WEVxZnNJT1pzZy9YaFJHbzQ0blVmYU9rQzZTV2lXUFVJdENpeC9pK09nZ1Uz?=
 =?utf-8?B?aTdhWnBFcit3MmNhanFqbEg4N05JWkhCUHQwTUZZV21MSXFtUUpEMlEvbFQ1?=
 =?utf-8?B?TGlWdStocWQ4emdTRVZVTjZ1SDZBNjhPVHFvZWM0RzNrRFRwY3ZSRS9mYWcr?=
 =?utf-8?B?WEdFOCtmZWZMd1FuRWFOM1N6bzVlVXhyeW1aVHh6K3ZzbjA5d01EeFZXUmxS?=
 =?utf-8?B?VHAyRGN1OHJYOHlVU1hTc0NBSmYyWW1FbUpwdjh5U1RocWVyOEU3MGxRVGt1?=
 =?utf-8?B?djFZVjhoYjRkTm5WSTZOWG4yUFVHcFd0ZnNpSENCYVk5cmh6eGI4RUZDdGZM?=
 =?utf-8?B?NnY0NzlFNU1FNmM0eUVQdmNxYWY4TmNqOTQ2NUVSU1pGazNTbGtBUmVVV3hM?=
 =?utf-8?B?UHRGYkpENHZHZjFWeHgrQnpHc0hqWi9oVzl2UFdQUUN3MWhlTWpuNlpzNEpH?=
 =?utf-8?B?OUMvWXloakYydy9HNWFneDRKbytQbnYzb0dvdDlGV2VwZGhTUW1zMXpiWU9T?=
 =?utf-8?B?YlB5aDFDcndUTjF6NVoycVRSZUc5a3hxd0w1eG9kZmJEcHJwTG9PZUszQ09C?=
 =?utf-8?B?MloyUUt0WVhXeHFQczc5YVBSbXo1Z1B3VzF2OVh3MGN0K1IvbENQWmJkZjZt?=
 =?utf-8?B?YkRvU3J4dWRKMStPK2JxU253c2VESGpFZFN5aExUMnRYYjhFeTc0cjdpb3JX?=
 =?utf-8?B?Tm5Ud0w5bjkwVXhaS3RlWTJsbWJMREFBcUx3S3V3YTRaeTFqZVl3SUhYYmZS?=
 =?utf-8?B?dUg3RkR1bEpqVmpWN1RzK2hUZzF5NmxhTFA5SjZvOHdNZUNmQjVORElhNkFq?=
 =?utf-8?B?YzluVWdOZjRJbkRmNk9jcVh0ZjA4Ujl0a3lFMnFxRGVNQnZWdFlBMWwyWktL?=
 =?utf-8?B?aHZlUDg5ZFUycEV2TlR5VUZZR2F2S2pGVGdQbEw5S1NQRmJBVlVDVWZhQTls?=
 =?utf-8?B?bkdEVUpYOTROZHd0a1k5SU1QRzZZRkdoV3VzTG1vcmdybkVURVIrNFlnaGtl?=
 =?utf-8?B?SWZ4M0Vaa1Z3Q3Q1K1BRZWpmUWdwSStzVk1tZkRLd0RTaVBndWVtNmdLdUtR?=
 =?utf-8?B?cWhSVGtEOG02NGY5bVB2ZUdWd1hLRFN3aHhuOTNCOUV2RUovbkl0SnVhUGYr?=
 =?utf-8?B?NzhHbnZSUUNLblpWeldoeXQ0NmNLVW50R3VJSVhvZjJEVm85d211QTFaOThl?=
 =?utf-8?B?aHhWMHh2UjhkQ2dOZzR1TytCWVYrMENETWpybUMxbWZpVG02UTd5anEzSzdq?=
 =?utf-8?B?NjJQVmlVL2t0QzB3R05aT1RBRCtJNjZvREMraWR3MkxtdEVvK1dzblZvWlh0?=
 =?utf-8?B?VEo1MTB2UW5BZVQ1VWJUeXY0M24vOWtvL2NwMk9zMGE5WUcwR1BwUW5id1V1?=
 =?utf-8?B?MVBVaFFSOEh4djUwVHF6Qzk2Y0tYUzBuaDZOUXUrVi96Zys0d2ZiRzIwVFRl?=
 =?utf-8?B?MEhGUDg5MjMzSUxPcGJWUkI3T1EvMkIzQ1FHZUtKbXJVZWNLNmUvekJLSDJJ?=
 =?utf-8?B?OWhZNngxY3pWZ1hVaUlJbkx3T1NkTWtHVXNLM0NWdW9la2NwVzVaS0p2enE2?=
 =?utf-8?B?NjRsT0hKNzVJYU94NjduaXhIL0gzZ2p6bEFET2lFaHg0ZUtYdTVlVmpIQWk0?=
 =?utf-8?B?QWxvTDNJRTFrbUlYYXE0M0s4TC9JbExWcGU3RHFvODdiQWdIbENjVnVRUm1n?=
 =?utf-8?B?Y2hDeXp0b0hHekhKcWFJNzN4SkU1ZlBpOVJMcGZoNjNDcUJuT1hKd2xPYk5l?=
 =?utf-8?B?allJMWJHT1pvWlJabmtZQzV5VTNXWXZqbEUxWFY4cExjVEJ5Q0pTS1pDTjRN?=
 =?utf-8?B?NGZWMGQyNFFCWDQzWkEwdEZpWXpxUFVlMklMUGgwRkJBSFMvV3hWNFBhRjRl?=
 =?utf-8?B?ZGdVM1pEU3l5MDVaS2MxRkZvRU5ZZUY0VHVsYUtHaTFQbTN5WWpQb0RDTHN1?=
 =?utf-8?B?bzZSaWVQRStFaW1Uc2ExcDFSUVpLYWpHZnZtVFhXSGw0VjVreHgzNzl3WGtT?=
 =?utf-8?Q?DDK8/EoMyNhihR12CC9VQBFnqs00WE=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(7416014)(1800799024)(921020); DIR:OUT; SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZTRiK0NmY3hEMHpWWEh5OFYvSU5ZcTk0MU0zdlJHTWJKZStSOGFsUkVWUW1M?=
 =?utf-8?B?S0hmRk0vNDQ5bWJVK1JuRlBFWEpOWmVUdFRkRzhEZ0V5cjJENld3UTFQdzd0?=
 =?utf-8?B?TzNrNkk0UWJFSk4xR1hLSlhNU3EvUHFEaGVHRGdyZlRGUXR2cU5tQUQ0Qmw3?=
 =?utf-8?B?emFseGhwNjZKWG9wM3o2Uk5DVmJPcXlTbi9pV3dCek0rVGx1YnZRMGw5c3dM?=
 =?utf-8?B?b08zZlBOQUsrZ0t4VWM1RTZ2anlHVDh1TEJnTUZ1V29zM0NBU3FDcmJTM0dJ?=
 =?utf-8?B?SHhhdEt2MzhoTmJYRzhGVTBTdlRydVpxay9MQlJ4WFBUZ05CdVM5c1hvOWZw?=
 =?utf-8?B?d0lGQUIrVDN1WE5ySkNNNFFpdVhMOFN0RjcyYVkwNGptazh5aDljVG5RTFVu?=
 =?utf-8?B?eVlkekRqc1NHTmhYRXRGTTBrZHhWUjE5RjhyRTZyRkVYM0xGV0RxSDArUXNI?=
 =?utf-8?B?OWlhMFNwbkl6MGdidE9xZWhwdGtLMnBad3FIMTgzd0Z1dHl2bVFSL1F4cHQw?=
 =?utf-8?B?aVgrVlBFK24xdWY1OVh2SUt0VFhXVExlRWNhdFBYQ2xQK2p5RlQyZ1hueU1E?=
 =?utf-8?B?TlMrN015TEljaE5uZjBIQmJTcUVtdUZqaTExMXZVcGY1YkVtWE1wMllRYm9O?=
 =?utf-8?B?d2daNHlQU3AwM0VJaExtcGpXV0dPVmowVFRZUVBiUkNjaWVoN1o0ZVQ4Uk9i?=
 =?utf-8?B?a0hrRUw2TVJkeFd5Rm50QXRYQ29oek9Lc09NTVNKZ3VmaUFQNmpjamYzeVNa?=
 =?utf-8?B?bGNmbU9PU1B2dDhpOWdnNDJDL1lwazVrSTEyNVArbFArbkgxQjgrMVozTDUw?=
 =?utf-8?B?TjJHbzlUaUZOVE5ZMVdsTTRsbU03amhsYjVqdkgxU0M0cTJTVjZLc0gxSVpX?=
 =?utf-8?B?Ri9DY0taa1YvQktERk1mZHJtQlcxMGxlSHlMeWpoMytOV2ZjTFVOUEJmdDVM?=
 =?utf-8?B?TkFUcDR3eEJ2Qi9yVElaL1JqNVVmeEVkSWtFVEo0V0xuUExiZ0NhTHd1TGhO?=
 =?utf-8?B?Q08wcTRxTkVtN0NHQ015NFZ0VEtMdkZEMENNWTBzellHdnJmVmhvU0F4RXlF?=
 =?utf-8?B?ZW8xbXFiakVaYlIvS1JJbFl5OWhQN3BGN0tzNEw3Y2JvQ29DNHZYVnpLQUlF?=
 =?utf-8?B?NTVzV2VDbnRuTTA1elYxSzdIeXllRUdnWm1tTTNqZDViK0ozNDY3eHE3aWw5?=
 =?utf-8?B?RFhEc3NCM1pub2Yvclp1UUxpZ3FaQmxHTEk0NVJoeXZSUGJkNmJGVHY1Nllr?=
 =?utf-8?B?VmV4T25pbVpVb1VtbjhZWHJwOGZpbytNd2grZXRJTGo4WDJHODFxaFMrZnFF?=
 =?utf-8?B?VEtyNU9KdzU1ZXRVcDFjUHd5SUc0cVZZQndnYm56dUJWR3c1ZlNwZ0JNSktB?=
 =?utf-8?B?U2tINzduRjJkTklwVnY4MzBRUE9sb1JXaGNrUW1YV3lqQWxaN055QWhobkZ3?=
 =?utf-8?B?b08yV3EyRjhScEJwcVBkMkRsMDFES0U0Mk1uQzZ5ZUo0ZmxuRlZqN09ucE1L?=
 =?utf-8?B?Z0U1aTMxUFAzbGpjVkZoSjU5RmZqMmpsZFFsTTZwVG02c1RhcEJJTGZaaTl6?=
 =?utf-8?B?OE5sTExxOFEzMTlMU3ljaDFZeHAyZ1BscFhnVXh6eGVRSnFGU2dzS3AxT1VH?=
 =?utf-8?B?MXFISytEendianJGK0FjNUF2TVN0WHF2aHA0RXdzT0x1V3BMVnNjeFRUOFNl?=
 =?utf-8?B?bS84dlQwd1R0bnNoQjI0S2pydmN3YUlFM05PcU5DWUxRVllpeFRFbVN6WWxv?=
 =?utf-8?B?VCtrYmprN0FXMUhacVNiZjdpTSs5T2tMWk9KOWt2WGNQZlJ4ZTRxSXBxcy93?=
 =?utf-8?B?bkx5bVU0YU0xTmNTYnlQK0duR2JZZWFFU0F6dmR4K283SG5waWNXcHlMWkR5?=
 =?utf-8?B?RHQxalBQc2tpUEppc1l6SXp2V1NwcURmamQySlhTQmdYbkZQckdNQkZGbldZ?=
 =?utf-8?B?Mi9iME1vVkhSZ1FGa0UweklwU0VxeThVYlVMaVNjd0dlbUxjYWU1SXdVdXMw?=
 =?utf-8?B?MENMcGdhT2R4Mm1rM2xYSS9zdWxjYXlJQWJwM1ZSb1duSERLNFVqVCttMGlq?=
 =?utf-8?B?NGhibWliM0E5d2ZCQWk3U08rdThpcU4xcWdndzVKcDYzMzRoSHZsazF6TlpD?=
 =?utf-8?Q?2GcpKgG8p7Iu6ogwaO6l5lphc?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e1c1a412-77b8-480e-4358-08de1c6b4cab
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2025 13:00:30.8611 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4u3aq2miD7S4JrAqIalWBGzWpEcHXVrBMX/WHwnskMUV3LjCJhH314HqQTV61wXq
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB7497
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

On 11/5/25 11:34, Pierre-Eric Pelloux-Prayer wrote:
>>
>>> +        } else {
>>> +            all_signaled = false;
>>> +            if (no_wait_gpu) {
>>> +                spin_unlock(&man->pipelined_eviction.lock);
>>> +                return -EBUSY;
>>> +            }
>>> +            fences_to_add[n++] = dma_fence_get(fence);
>>> +        }
>>> +    }
>>> +    spin_unlock(&man->pipelined_eviction.lock);
>>> +
>>> +    if (all_signaled)
>>>           return 0;
>>>   -    if (no_wait_gpu) {
>>> -        ret = dma_fence_is_signaled(fence) ? 0 : -EBUSY;
>>> -        dma_fence_put(fence);
>>> -        return ret;
>>> +    for (i = 0; i < n; i++) {
>>> +        dma_resv_add_fence(bo->base.resv, fences_to_add[i], DMA_RESV_USAGE_KERNEL);
>>> +        dma_fence_put(fences_to_add[i]);
>>>       }
>>>   -    dma_resv_add_fence(bo->base.resv, fence, DMA_RESV_USAGE_KERNEL);
>>> -
>>> -    ret = dma_resv_reserve_fences(bo->base.resv, 1);
>>> -    dma_fence_put(fence);
>>> -    return ret;
>>> +    return dma_resv_reserve_fences(bo->base.resv, TTM_FENCES_MAX_SLOT_COUNT);
>>
>> Please separate out a patch where the call to dma_resv_reserve_fences() is removed here.
> 
> Can you remind me why it's not needed?

Some years ago the dma_resv object had a fixed field for an exclusive fence.

When we removed that we sprinkled calls like "dma_resv_reserve_fences(bo->base.resv, 1)" all over the place where we previously used this exclusive fence slot to prevent things from going boom!

It could be that some old drivers like radeon or qxl still rely on that somewhere, but that would then clearly be a driver bug.

What we could do is to either leave it alone or remove it, but changing it to reserving TTM_FENCES_MAX_SLOT_COUNT is clearly not correct.

>>
>>>   }
>>>     /**
>>> @@ -718,7 +732,7 @@ static int ttm_bo_alloc_resource(struct ttm_buffer_object *bo,
>>>       int i, ret;
>>>         ticket = dma_resv_locking_ctx(bo->base.resv);
>>> -    ret = dma_resv_reserve_fences(bo->base.resv, 1);
>>> +    ret = dma_resv_reserve_fences(bo->base.resv, TTM_FENCES_MAX_SLOT_COUNT);
>>>       if (unlikely(ret))
>>>           return ret;
>>>   @@ -757,7 +771,7 @@ static int ttm_bo_alloc_resource(struct ttm_buffer_object *bo,
>>>                   return ret;
>>>           }
>>>   -        ret = ttm_bo_add_move_fence(bo, man, ctx->no_wait_gpu);
>>> +        ret = ttm_bo_add_pipelined_eviction_fences(bo, man, ctx->no_wait_gpu);
>>>           if (unlikely(ret)) {
>>>               ttm_resource_free(bo, res);
>>>               if (ret == -EBUSY)
>>> diff --git a/drivers/gpu/drm/ttm/ttm_bo_util.c b/drivers/gpu/drm/ttm/ttm_bo_util.c
>>> index acbbca9d5c92..ada8af965acf 100644
>>> --- a/drivers/gpu/drm/ttm/ttm_bo_util.c
>>> +++ b/drivers/gpu/drm/ttm/ttm_bo_util.c
>>> @@ -258,7 +258,7 @@ static int ttm_buffer_object_transfer(struct ttm_buffer_object *bo,
>>>       ret = dma_resv_trylock(&fbo->base.base._resv);
>>>       WARN_ON(!ret);
>>>   -    ret = dma_resv_reserve_fences(&fbo->base.base._resv, 1);
>>> +    ret = dma_resv_reserve_fences(&fbo->base.base._resv, TTM_FENCES_MAX_SLOT_COUNT);
>>>       if (ret) {
>>>           dma_resv_unlock(&fbo->base.base._resv);
>>>           kfree(fbo);
>>> @@ -646,6 +646,8 @@ static void ttm_bo_move_pipeline_evict(struct ttm_buffer_object *bo,
>>>   {
>>>       struct ttm_device *bdev = bo->bdev;
>>>       struct ttm_resource_manager *from;
>>> +    struct dma_fence *tmp;
>>> +    int i, free_slot = -1;
>>>         from = ttm_manager_type(bdev, bo->resource->mem_type);
>>>   @@ -653,13 +655,35 @@ static void ttm_bo_move_pipeline_evict(struct ttm_buffer_object *bo,
>>>        * BO doesn't have a TTM we need to bind/unbind. Just remember
>>>        * this eviction and free up the allocation
>>>        */
>>> -    spin_lock(&from->move_lock);
>>> -    if (!from->move || dma_fence_is_later(fence, from->move)) {
>>> -        dma_fence_put(from->move);
>>> -        from->move = dma_fence_get(fence);
>>> +    spin_lock(&from->pipelined_eviction.lock);
>>> +    for (i = 0; i < from->pipelined_eviction.n_fences; i++) {
>>> +        tmp = from->pipelined_eviction.fences[i];
>>> +        if (!tmp) {
>>> +            if (free_slot < 0)
>>> +                free_slot = i;
>>> +            continue;
>>
>> Just break here.
> 
> The logic here is to reuse context slots. Even if slot 0 is empty, I need to use slot 1 if slot 1's context is the same as fence->context.

Good point, but slot 0 should never be empty. See we fill the slots starting from 0 and then incrementing you either have NULL or a slot which doesn't match.

> This way, we're guaranteed to find a slot for all contexts used by the driver.
> 
>>
>>> +        }
>>> +        if (fence->context != tmp->context)
>>> +            continue;
>>> +        if (dma_fence_is_later(fence, tmp)) {
>>> +            dma_fence_put(tmp);
>>> +            free_slot = i;
>>> +            break;
>>> +        }
>>> +        goto unlock;
>>> +    }
>>> +    if (free_slot >= 0) {
>>
>> Drop free_slot and check i here.
>>
>>> +        from->pipelined_eviction.fences[free_slot] = dma_fence_get(fence);
>>> +    } else {
>>> +        WARN(1, "not enough fence slots for all fence contexts");
>>> +        spin_unlock(&from->pipelined_eviction.lock);
>>> +        dma_fence_wait(fence, false);
>>> +        goto end;
>>>       }
>>> -    spin_unlock(&from->move_lock);
>>>   +unlock:
>>> +    spin_unlock(&from->pipelined_eviction.lock);
>>> +end:
>>>       ttm_resource_free(bo, &bo->resource);
>>>   }
>>>   diff --git a/drivers/gpu/drm/ttm/ttm_resource.c b/drivers/gpu/drm/ttm/ttm_resource.c
>>> index e2c82ad07eb4..ae0d4621cc55 100644
>>> --- a/drivers/gpu/drm/ttm/ttm_resource.c
>>> +++ b/drivers/gpu/drm/ttm/ttm_resource.c
>>> @@ -523,14 +523,19 @@ void ttm_resource_manager_init(struct ttm_resource_manager *man,
>>>   {
>>>       unsigned i;
>>>   -    spin_lock_init(&man->move_lock);
>>>       man->bdev = bdev;
>>>       man->size = size;
>>>       man->usage = 0;
>>>         for (i = 0; i < TTM_MAX_BO_PRIORITY; ++i)
>>>           INIT_LIST_HEAD(&man->lru[i]);
>>> -    man->move = NULL;
>>> +    spin_lock_init(&man->pipelined_eviction.lock);
>>> +    for (i = 0; i < TTM_FENCES_MAX_SLOT_COUNT; i++)
>>> +        man->pipelined_eviction.fences[i] = NULL;
>>> +    /* Can be overridden by drivers that wants to use more than 1 entity
>>> +     * for moves and evictions (limited to TTM_FENCES_MAX_SLOT_COUNT).
>>> +     */
>>> +    man->pipelined_eviction.n_fences = 1;
>>>   }
>>>   EXPORT_SYMBOL(ttm_resource_manager_init);
>>>   @@ -551,7 +556,7 @@ int ttm_resource_manager_evict_all(struct ttm_device *bdev,
>>>           .no_wait_gpu = false,
>>>       };
>>>       struct dma_fence *fence;
>>> -    int ret;
>>> +    int ret, i;
>>>         do {
>>>           ret = ttm_bo_evict_first(bdev, man, &ctx);
>>> @@ -561,18 +566,32 @@ int ttm_resource_manager_evict_all(struct ttm_device *bdev,
>>>       if (ret && ret != -ENOENT)
>>>           return ret;
>>>   -    spin_lock(&man->move_lock);
>>> -    fence = dma_fence_get(man->move);
>>> -    spin_unlock(&man->move_lock);
>>> +    ret = 0;
>>>   -    if (fence) {
>>> -        ret = dma_fence_wait(fence, false);
>>> -        dma_fence_put(fence);
>>> -        if (ret)
>>> -            return ret;
>>> -    }
>>> +    do {
>>> +        fence = NULL;
>>>   -    return 0;
>>> +        spin_lock(&man->pipelined_eviction.lock);
>>> +        for (i = 0; i < man->pipelined_eviction.n_fences; i++) {
>>> +            fence = man->pipelined_eviction.fences[i];
>>
>>> +            man->pipelined_eviction.fences[i] = NULL;
>>
>> Drop that. We should never set man->pipelined_eviction.fences to NULL.
> 
> Why?

To simplify the logic while filling the slots.

dma_fences are made to be keept around for long.

>>
>>> +
>>>   /**
>>>    * enum ttm_lru_item_type - enumerate ttm_lru_item subclasses
>>>    */
>>> @@ -180,8 +189,10 @@ struct ttm_resource_manager_func {
>>>    * @size: Size of the managed region.
>>>    * @bdev: ttm device this manager belongs to
>>>    * @func: structure pointer implementing the range manager. See above
>>> - * @move_lock: lock for move fence
>>> - * @move: The fence of the last pipelined move operation.
>>> + * @pipelined_eviction.lock: lock for eviction fences
>>> + * @pipelined_eviction.n_fences: The number of fences allowed in the array. If
>>> + * 0, pipelined evictions aren't used.
>>> + * @pipelined_eviction.fences: The fences of the last pipelined move operation.
>>>    * @lru: The lru list for this memory type.
>>>    *
>>>    * This structure is used to identify and manage memory types for a device.
>>> @@ -195,12 +206,15 @@ struct ttm_resource_manager {
>>>       struct ttm_device *bdev;
>>>       uint64_t size;
>>>       const struct ttm_resource_manager_func *func;
>>> -    spinlock_t move_lock;
>>>   -    /*
>>> -     * Protected by @move_lock.
>>> +    /* This is very similar to a dma_resv object, but locking rules make
>>> +     * it difficult to use a it in this context.
>>>        */
>>> -    struct dma_fence *move;
>>> +    struct {
>>> +        spinlock_t lock;
>>> +        int n_fences;
>>> +        struct dma_fence *fences[TTM_FENCES_MAX_SLOT_COUNT];
>>> +    } pipelined_eviction;
>>
>> Drop the separate structure, just make move an array instead.
> 
> IMO pipelined_eviction.fences and pipelined_eviction.lock is clearer when reading the code than moves and move_lock but if you prefer I'll switch back to the old names.

The name "pipelined_eviction" is just a bit to long. Maybe just eviction_fences and eviction_fences_lock?

Regards,
Christian.
>>
>> And also drop n_fences. Just always take a look at all fences.
> 
> OK.
> 
> Thanks,
> Pierre-Eric
> 
>>
>> Regards,
>> Christian.
>>
>>>         /*
>>>        * Protected by the bdev->lru_lock.
>>> @@ -421,8 +435,12 @@ static inline bool ttm_resource_manager_used(struct ttm_resource_manager *man)
>>>   static inline void
>>>   ttm_resource_manager_cleanup(struct ttm_resource_manager *man)
>>>   {
>>> -    dma_fence_put(man->move);
>>> -    man->move = NULL;
>>> +    int i;
>>> +
>>> +    for (i = 0; i < TTM_FENCES_MAX_SLOT_COUNT; i++) {
>>> +        dma_fence_put(man->pipelined_eviction.fences[i]);
>>> +        man->pipelined_eviction.fences[i] = NULL;
>>> +    }
>>>   }
>>>     void ttm_lru_bulk_move_init(struct ttm_lru_bulk_move *bulk);

