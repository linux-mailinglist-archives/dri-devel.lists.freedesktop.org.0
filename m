Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aEDzHSSac2nNxQAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 23 Jan 2026 16:56:20 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2898B7814E
	for <lists+dri-devel@lfdr.de>; Fri, 23 Jan 2026 16:56:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 04FEF10EB1D;
	Fri, 23 Jan 2026 15:56:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="AdT86g10";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DM5PR21CU001.outbound.protection.outlook.com
 (mail-centralusazon11011007.outbound.protection.outlook.com [52.101.62.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B908F10EB1D;
 Fri, 23 Jan 2026 15:56:15 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WT7TRzRo/7yrgiEntk/bcV6y/LvU55YSHTFTAeMBm48ySpcExWSSj/jMOi6uso0RhEnAKpKjxuOv7zFgaIaCkGshSVXpZ+WBTAE93ThdaPuhThkuTlRKOzaLTAbonoqALwOAlTgmegdvAZNuw8Yk9OQfEYJqJ9wZkfX6RRbpjGzShSmFb9Azm/76KdRtDuLcsbhR4wDNHauI3nOCmEYURqOkShCUhIKPcXRyBNXrJr/X2DaB8Fhd9lhNJmQbGGozpalg7HYn8qF0DoYqeBlCd9qXVNBGGc31XorG8tm9Lae2I6Zz/Rekz+I5/1O+ESgtW+g0a9+cn3wUkqtwhRMGWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JT91FRePWksf09yppM6fxVMiQWdRycZwWyBniNXYoLc=;
 b=VoeKD51X3mkk43p2Cuhu/DXxncJasYjyr1oDoRc5kRxbe3uypC/47w1wa2dNxgIMzJIiEy8c9rs+j/IgpNRN6LLfgaCcH9CfH4LRXM3KSGJUMi0QCxtI9drQmo1lnJV0ijNbEs48BZw8BRPhQS0spaSUIw/ciQjXOr1XcXa3fCAJ3EykJOWeomC/WiZC/2dzbydzljW14MyA1vy6TzXSx2JIcYUK4dhY4TO4ZDNmUNUdhAzn3arL69LpvLV87qlirp8CJrkmaoZsKG8tDmB3wijJSr1e26Vpq6ECwLgk4m7oDSyQM0yTGbku2dNp0Kn11lfpfY0SXmsyKtamfFbltQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JT91FRePWksf09yppM6fxVMiQWdRycZwWyBniNXYoLc=;
 b=AdT86g106aOT//2wBZC5N4G+rNMn8j8dWMsr4qvdaQ9FWW/5YjtUn4AsXtMNcRC5Mqnq63u72JyQKjKKWSZpfNOL7uend2bAkk+Xv4j3qVnBBds8o+oumI9WQ3B3DGVtp0T1U/RTPurnDAI9UJBR7NghW0wi89eprxgnr5iB2oM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by CY8PR12MB8268.namprd12.prod.outlook.com (2603:10b6:930:6c::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.11; Fri, 23 Jan
 2026 15:56:10 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%4]) with mapi id 15.20.9542.009; Fri, 23 Jan 2026
 15:56:10 +0000
Message-ID: <6b66d788-951e-4de3-8153-b4949e04e9e0@amd.com>
Date: Fri, 23 Jan 2026 16:56:05 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 08/10] drm/amdgpu: use larger gart window when possible
To: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20260122170218.3077-1-pierre-eric.pelloux-prayer@amd.com>
 <20260122170218.3077-9-pierre-eric.pelloux-prayer@amd.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20260122170218.3077-9-pierre-eric.pelloux-prayer@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0134.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b9::8) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|CY8PR12MB8268:EE_
X-MS-Office365-Filtering-Correlation-Id: 9e3c45ed-1ac0-4d3c-f1ec-08de5a97ed2a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VGVSc1ZvZ1V3dm8wSFpySFJwOG0zcExrWFVzQVFBaGlycUtDeXJ6dlBHb2ho?=
 =?utf-8?B?YUg0L0RqekJLc0JVRjE0OUwyKytuMXNQOUxYTzRHWHk4Z0RZTHFtWE1FR1pB?=
 =?utf-8?B?a3k4VjczT0pSYXI3cWtDNm8xeFV5dGE0KytHTHJMR2JxOWZlcXYwMzlRck1x?=
 =?utf-8?B?K0IveWFJSjhJdEJYTHlLMGhuWkdGU2hYeTJwbjhUY0dKL0thQ3o0dXRNOFFH?=
 =?utf-8?B?YjBiMitOS3dzNjEzOUJmVklGOUZhU1FSMjZ2ZWtXaklsSldYSmJNTyswb0Zr?=
 =?utf-8?B?UGdaRW1pYTF0Zit2Vk9ZVWI4MGh1U0VNVzhibENSekcxcWFTTDFwZG1QRUpS?=
 =?utf-8?B?aWJqSnh4WWV0cERsd3hVRXhCckFLNzZMWTVTRENPTUUyNFFuWEFlOUZqUThC?=
 =?utf-8?B?eDJuVlk4a3FLK0doek5relVOb2J3eHhVZk4ra2o1cUVCZ0NNQlhMVzloKzNq?=
 =?utf-8?B?VW9uUFpxYVNDd01LUkNCelplOEExT2RZMEtqTFA0OXl4OW5HcmdOZTgvbDIz?=
 =?utf-8?B?ZjNlc0JkUzdDL0Q3c2oxbm50eEd0TGxQY002ZE85V2ZINTNBWmZLRjNvYTVk?=
 =?utf-8?B?Z29lZjF3OGYyVklmbHgzMTZuOXpUUDcyRU5HbkYxYXRDa1E4S0xJYWM3QmZm?=
 =?utf-8?B?UlU4S2U4UXBDMWVHclgyQU1DRG4xdE5INDAxMGlWd0F6SmxxTDZ5WmU3cElT?=
 =?utf-8?B?bEpEaTdNUTNycDBmV3YwOTdnTWtodTY2d1ZxdGhwMTF6SEQ2b0FBc3BtTDAx?=
 =?utf-8?B?a05OQ245MWJwSDg4NXRkZlhKcTlwOTMzVHNRNENva1JaUWZFejBSZXJyWVhY?=
 =?utf-8?B?UXAxaFp6MkFzVzU4bHpKNEI0RTI0bDNiOUpkVHZ4b0RPVTZCbFVFU1JoWHRt?=
 =?utf-8?B?WnBkd1R2aTVDM2V3enJMZVVrbmNjOXRIMlpaaGxpdVNQdkQ5NnVmSm5oZnNz?=
 =?utf-8?B?QWJUZVNkYlRiM3Btc0JJaVRYSnhTakRHeVBKS3A1UlF2bVIvbWludFZGcUlu?=
 =?utf-8?B?K3BVTVRXdHBsNUJPaFNXRWFWUU5odUh1dTZPdnZFazFnWlh6aFZuT2E4eTlO?=
 =?utf-8?B?NUkyT2VtSlpKcHZPdXp3VERZaklXWHVUdFZ1cm1YQW1sTG5VekQ1clY4eU0r?=
 =?utf-8?B?ZHBzL2hVOWxPT3d1bVp6QUdLNjQrQ045NzZwMGFIQVVGWlJvVXhDZzduRHVH?=
 =?utf-8?B?MXVNVmJkQTlEMXQ4WTVkZHRtZW44RkkxTGsxWkM2RC9sa1FmL2Y4L1owcFVq?=
 =?utf-8?B?ZXFtWFZ6Wk9mUElqcTdJQncrUjdGbGpzbkpNV2xHeERsS3pjcXRuNGRXK2lx?=
 =?utf-8?B?UWFwcENjcURGWnlnVEdKcTR0TTNGSEl1bE1VOFZlWUJmMEZnZDM4bk9KUWF2?=
 =?utf-8?B?eElIcG8vSkFibWR3ZitBWTF1cTZRcGJ6cFNLU095ZEJyUWVoY1pNWENWZ0d5?=
 =?utf-8?B?WFl3V3N5Q0pjdU9Cb0JWUjlVODVJQWRaUFdMSjFIZXVkWWhQaytsbFZnbkFr?=
 =?utf-8?B?c3BxR0drZ0l6MmdEaXdHalpRdS9BMkxxZGxJcHdNQXdOWXc3VVVVbHZmTkFl?=
 =?utf-8?B?aTRYREhtWFVIY2R0L3B6VldpYm04bzR5MTNGemwweHFWQlViWVNMaDcyakJ6?=
 =?utf-8?B?ZDBtenA5WWhjVWJjSzF3aUYxL3dOVnEyYTI5Y2pkSEFteG1KaHRZSEQ5Mis2?=
 =?utf-8?B?ZjRPbXQ5d3FESFdCbUZiK2ZDMW1iYmU1b1F1WmpOTVF2MUlDeFFRVlY1RGtV?=
 =?utf-8?B?NWREc09Md0xINHptczRkRGZ5L2wrNGFyR0tTYWVsQXBqMFV4WWNVaVZ6SEhm?=
 =?utf-8?B?K1VVdkREZmpEU1E3LzNjVEIrWXZxRnE3WmdKZzY5R1VwWFZ1Z095L21Qc00z?=
 =?utf-8?B?YW1hRlVpekl4aUNHeDFOUjRYbG92c1NuY09SZjVBVi9CN1hsbU9FTXF1UWh2?=
 =?utf-8?B?V1ArRjdQdGlSekJwc0xTbzBvWFlHOEpyb0NzUkZYVGpYYVNqNEtPK3I4MmF5?=
 =?utf-8?B?N01Ia3pvMzUxaEVMWEloK25vSkliWktXYUQ4YU1IMC9YR3FTQVZMUWhPYys2?=
 =?utf-8?B?TXQ1T3MrdUFLRmllN2J6SGx3bmVXMUY2TW90SStPcHZZTC9sYWwrbFJVOFht?=
 =?utf-8?Q?Nw+0=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?M2hOWTdqZXZ2T0NZQkdSaTBzRzh2cUZITjU0SWpycng0OUYzUXVJaGRsS2Nk?=
 =?utf-8?B?emNieWhrS2pWTStjU3hpeXhWSFhBaERnVkVBOEJzU1gySjFNREtyQlBXZk9L?=
 =?utf-8?B?em80cGN1cWJUU0hWRW1aTHJnNGFEbnFnZmwvVVVQYVlGZ2htUk9aSG5YN1dE?=
 =?utf-8?B?dU5MeGVIVUdpaTFCbDlDRWZXcy84enNpK0ZlTWZxQlBIMmYrNWNUWnVwSGFz?=
 =?utf-8?B?TWoxdWlIaktVN3BVbjR6dnlLd3JyemFvNkx0cU9ndXBhK1VaOHZVK0NIZjRM?=
 =?utf-8?B?Rm9uWW04MXVjZHg4TFQyelhiTHJEaElQTjIvMk1OWXFuM3B2dTlaZCs2U05C?=
 =?utf-8?B?SjJKNjdaY2tPUVZtU3puSlJJWTk4Z0Z5dHROVEltWXlvY3J4NEQzak9NVmpX?=
 =?utf-8?B?bmI1bTRiNVlkYnB4Y0ljMnN4N0p3ZDR4OXp0ZU1BMmp5MGNKTVllbHBSdzlG?=
 =?utf-8?B?TmxxdVY3eVd6RUI4ZTNzN2ZWNGxEMHkwQU94Yzl3UytnSDcyVWZYUWplQnlO?=
 =?utf-8?B?N3RTNWl6TXFURWFjRWlNeDh1R21ZejBxaHVPTmgxWGdxMC9YcVk1WGUzSXh4?=
 =?utf-8?B?S2Rydk55b3p6cUJvWUlLWmswalpxTkxJeERReEZsNDlwc0JCRmJIejJCSGNB?=
 =?utf-8?B?OW5Ycml1a0F6WXBDMk1yZTFOTU84NWRKNVphWk5NdENZZ0lDNC9zemYvMVNn?=
 =?utf-8?B?VHI1TDFTcFFFaWl6VGdpYjZDWmtnUDRPNG43QTZuVktsSExCNW5ZRFlhclpB?=
 =?utf-8?B?YVV3OWpsQndMekl4REJ1bFBrZ3Y2cmRpL2p4K0I4dGpxcGVZL3VoWDdvdWJN?=
 =?utf-8?B?dWt2blU5dlNacDVMUEVWemNTaFgzVjJ5MC9adDhlVU56UmMzbzFlTmZPeFdn?=
 =?utf-8?B?NUphYzh1QUNaUkw5elFzUUQ2c3VORGdmODNLTlhWdmRIVjRsUTAwMXZ0a0x4?=
 =?utf-8?B?cmJqajZiWm1tN3FlNjd3dFJ2L1JZVittVk8yYnZ0eTVkK3hyV2hVK2xSZkpv?=
 =?utf-8?B?NFZQaUhmSHdlci9DRWNjblZSNTRXWnhublVoa2hoZGxZck4ydDNBMHB1RkhI?=
 =?utf-8?B?TW5kbWJ3RCsvQWJad2hGeGxGamY1N1pQcDA3SFo0MGxBRUNkcVovbHc4ck1v?=
 =?utf-8?B?SW1lQmxFMG8raGhNUDZZWlhsdmI0SlIxWC8zT1poeEhPd0V6dHJoVGZoMkhw?=
 =?utf-8?B?RjA5VWFYMFRUUjU2RU1YSXBvUFBXRno5SEZvVEhDTzBPNFRQQUNvUlRkbFFx?=
 =?utf-8?B?ZW5xSWllbTExOTFzVUcyVWUwRi9MWFNwLy9aVWkyZVoxb2VTays0VjdJLzc4?=
 =?utf-8?B?SnlvZUZUaU9ZdlZyWGxaNDNLT3g2bnUybldmVkgvSFRxaGdTbTFwY1VEL0tF?=
 =?utf-8?B?YVpFbUVKNXRqaVFIZHhESHNtUk5xaFJsclN3alA5a1ozYkNPRkxPQ09Jcm16?=
 =?utf-8?B?aFFBaWkva3I5ZENxSWZmNmpFYloraEJCYUFBcWZUbXNWUHRkTDRXdXZ0RDAz?=
 =?utf-8?B?VHU3Q3VaNWR4SXVxMDA5YUFZaSsxdGZYczJ1MDZORHpoelFkbEVpSGR1Y2Zv?=
 =?utf-8?B?eFJ6NGM3cU5NOXkwMGx2NEdyeU5iY1RIekk0STVtQ3gra3N6ZE8rQmRSazB2?=
 =?utf-8?B?SEltckRwdlZDY2NPSUEvZnI3akszS0ZSa3ErUExnZ0tjaXVXaERORzB1UGhX?=
 =?utf-8?B?SDFpVnNKUEZmTmMxeGtudVptbmVKN1lvWEd4Y2pZdnpaQnNqQkhZbDBOZ21r?=
 =?utf-8?B?WWtsTkZHU1ZkUWdML3NiamZaUnlhd0F1SmV0ajVvdnNhSlhCbU1BYUdrNjV3?=
 =?utf-8?B?NkVLSkdVVXNmN2JoblJJNlFEWVZmV1hVMWRLN1FXWC9xZWZFdExQUVU0SWtN?=
 =?utf-8?B?dmhXdkU2Tk9wdzdEaFJCK3BoRENyWHVvemdaeXdaK0lXRWU2dFk1aEhQcGtH?=
 =?utf-8?B?L0VDUERKTXlPWEhwQjhneEN0cENkNGdmZWxBUXkrQXA2S090YnVOSXAxVnVw?=
 =?utf-8?B?ZkJrb2EwbUQ0MFNTeHJuS1czbWswNzdraUlpSnNNaDRIblFaSDhscUJvOVI4?=
 =?utf-8?B?V1F5Z0V4UjBwMmpaWWlvRWlEbEZUbEkwWkZPWTNBdTUzNWl2U1QrRUxLUE1D?=
 =?utf-8?B?NWVUVE9ZQzYySlNVUDFwOGg5c0JyQ3d2TWJ6a1h3SFpCNVRJMUdvN1I4N3gz?=
 =?utf-8?B?RjRyd0RXTFM1THpBd3JzNXdaaDlBZ2MvbjU3M3I0QUVnRzBJYnJvOVpzbEVw?=
 =?utf-8?B?Z0xtQW1kdlg1MDZoelVYVXloRldtbVQ3UG50K25MNERrZnhnaGNBUmdiSEpZ?=
 =?utf-8?Q?jNzjPYr7nqLpAwtWUJ?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9e3c45ed-1ac0-4d3c-f1ec-08de5a97ed2a
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jan 2026 15:56:10.1436 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /7Qdp0vhkOpq2adC4s6d5ahxfJYFWzd8xJ6K1hb6ovHQAY512lX8+pbuF0htTlN2
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB8268
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.31 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[amd.com,gmail.com,ffwll.ch];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.995];
	FROM_NEQ_ENVFROM(0.00)[christian.koenig@amd.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[amd.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	RCPT_COUNT_SEVEN(0.00)[7];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,amd.com:email,amd.com:dkim,amd.com:mid]
X-Rspamd-Queue-Id: 2898B7814E
X-Rspamd-Action: no action

On 1/22/26 18:02, Pierre-Eric Pelloux-Prayer wrote:
> Entities' gart windows are contiguous so when copying a buffer
> and src doesn't need a gart window, its window can be used to
> extend dst one (and vice versa).
> 
> This doubles the gart window size and reduces the number of jobs
> required.
> 
> ---
> v2: pass adev instead of ring to amdgpu_ttm_needs_gart_window
> v4:
> - merge if conditions
> - always call amdgpu_ttm_needs_gart_window before calling
>   amdgpu_ttm_map_buffer
> ---
> 
> Signed-off-by: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>

Well I'm still not very keen about all this here.

First of all it adds some complexity without much gain, e.g. the VRAM manager just falls back to 2MiB fragments to often. Arun is working on improving that, but doing that is basically just a hack.

Then I would really like to deprecate mem->start, it's basically just a leftover from when we still mapped everything into GART. We would need to clean that up first I think.

Can we postpone this change and land utilizing more SDMA engines first?

Regards,
Christian.

> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c | 83 +++++++++++++++++--------
>  1 file changed, 57 insertions(+), 26 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
> index e149092da8f1..7006c58a6992 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
> @@ -177,6 +177,21 @@ amdgpu_ttm_job_submit(struct amdgpu_device *adev, struct amdgpu_ttm_buffer_entit
>  	return amdgpu_job_submit(job);
>  }
>  
> +static bool amdgpu_ttm_needs_gart_window(struct amdgpu_device *adev,
> +					 struct ttm_resource *mem,
> +					 struct amdgpu_res_cursor *mm_cur,
> +					 bool tmz,
> +					 uint64_t *addr)
> +{
> +	/* Map only what can't be accessed directly */
> +	if (!tmz && mem->start != AMDGPU_BO_INVALID_OFFSET) {
> +		*addr = amdgpu_ttm_domain_start(adev, mem->mem_type) +
> +			mm_cur->start;
> +		return false;
> +	}
> +	return true;
> +}
> +
>  /**
>   * amdgpu_ttm_map_buffer - Map memory into the GART windows
>   * @entity: entity to run the window setup job
> @@ -184,18 +199,22 @@ amdgpu_ttm_job_submit(struct amdgpu_device *adev, struct amdgpu_ttm_buffer_entit
>   * @mem: memory object to map
>   * @mm_cur: range to map
>   * @window: which GART window to use
> + * @use_two_windows: if true, use a double window
>   * @tmz: if we should setup a TMZ enabled mapping
>   * @size: in number of bytes to map, out number of bytes mapped
>   * @addr: resulting address inside the MC address space
>   *
>   * Setup one of the GART windows to access a specific piece of memory or return
>   * the physical address for local memory.
> + * amdgpu_ttm_needs_gart_window() should be used to check if calling this
> + * function is required.
>   */
>  static int amdgpu_ttm_map_buffer(struct amdgpu_ttm_buffer_entity *entity,
>  				 struct ttm_buffer_object *bo,
>  				 struct ttm_resource *mem,
>  				 struct amdgpu_res_cursor *mm_cur,
>  				 unsigned int window,
> +				 bool use_two_windows,
>  				 bool tmz, uint64_t *size, uint64_t *addr)
>  {
>  	struct amdgpu_device *adev = amdgpu_ttm_adev(bo->bdev);
> @@ -212,14 +231,6 @@ static int amdgpu_ttm_map_buffer(struct amdgpu_ttm_buffer_entity *entity,
>  	if (WARN_ON(mem->mem_type == AMDGPU_PL_PREEMPT))
>  		return -EINVAL;
>  
> -	/* Map only what can't be accessed directly */
> -	if (!tmz && mem->start != AMDGPU_BO_INVALID_OFFSET) {
> -		*addr = amdgpu_ttm_domain_start(adev, mem->mem_type) +
> -			mm_cur->start;
> -		return 0;
> -	}
> -
> -
>  	/*
>  	 * If start begins at an offset inside the page, then adjust the size
>  	 * and addr accordingly
> @@ -227,7 +238,8 @@ static int amdgpu_ttm_map_buffer(struct amdgpu_ttm_buffer_entity *entity,
>  	offset = mm_cur->start & ~PAGE_MASK;
>  
>  	num_pages = PFN_UP(*size + offset);
> -	num_pages = min_t(uint32_t, num_pages, AMDGPU_GTT_MAX_TRANSFER_SIZE);
> +	num_pages = min_t(uint32_t,
> +		num_pages, AMDGPU_GTT_MAX_TRANSFER_SIZE * (use_two_windows ? 2 : 1));
>  
>  	*size = min(*size, (uint64_t)num_pages * PAGE_SIZE - offset);
>  
> @@ -299,6 +311,7 @@ static int amdgpu_ttm_copy_mem_to_mem(struct amdgpu_device *adev,
>  				      struct dma_resv *resv,
>  				      struct dma_fence **f)
>  {
> +	bool src_needs_gart_window, dst_needs_gart_window;
>  	struct amdgpu_res_cursor src_mm, dst_mm;
>  	struct dma_fence *fence = NULL;
>  	int r = 0;
> @@ -323,16 +336,29 @@ static int amdgpu_ttm_copy_mem_to_mem(struct amdgpu_device *adev,
>  		/* Never copy more than 256MiB at once to avoid a timeout */
>  		cur_size = min3(src_mm.size, dst_mm.size, 256ULL << 20);
>  
> -		/* Map src to window 0 and dst to window 1. */
> -		r = amdgpu_ttm_map_buffer(entity, src->bo, src->mem, &src_mm,
> -					  0, tmz, &cur_size, &from);
> -		if (r)
> -			goto error;
> +		/* If only one direction needs a gart window to access memory, use both
> +		 * windows for it.
> +		 */
> +		src_needs_gart_window =
> +			amdgpu_ttm_needs_gart_window(adev, src->mem, &src_mm, tmz, &from);
> +		dst_needs_gart_window =
> +			amdgpu_ttm_needs_gart_window(adev, dst->mem, &dst_mm, tmz, &to);
>  
> -		r = amdgpu_ttm_map_buffer(entity, dst->bo, dst->mem, &dst_mm,
> -					  1, tmz, &cur_size, &to);
> -		if (r)
> -			goto error;
> +		if (src_needs_gart_window) {
> +			r = amdgpu_ttm_map_buffer(entity, src->bo, src->mem, &src_mm,
> +						  0, !dst_needs_gart_window,
> +						  tmz, &cur_size, &from);
> +			if (r)
> +				goto error;
> +		}
> +		if (dst_needs_gart_window) {
> +			r = amdgpu_ttm_map_buffer(entity, dst->bo, dst->mem, &dst_mm,
> +						  src_needs_gart_window ? 1 : 0,
> +						  !src_needs_gart_window,
> +						  tmz, &cur_size, &to);
> +			if (r)
> +				goto error;
> +		}
>  
>  		abo_src = ttm_to_amdgpu_bo(src->bo);
>  		abo_dst = ttm_to_amdgpu_bo(dst->bo);
> @@ -2579,10 +2605,12 @@ int amdgpu_ttm_clear_buffer(struct amdgpu_bo *bo,
>  		/* Never clear more than 256MiB at once to avoid timeouts */
>  		size = min(cursor.size, 256ULL << 20);
>  
> -		r = amdgpu_ttm_map_buffer(entity, &bo->tbo, bo->tbo.resource, &cursor,
> -					  0, false, &size, &addr);
> -		if (r)
> -			goto err;
> +		if (amdgpu_ttm_needs_gart_window(adev, bo->tbo.resource, &cursor, false, &addr)) {
> +			r = amdgpu_ttm_map_buffer(entity, &bo->tbo, bo->tbo.resource, &cursor,
> +						  0, false, false, &size, &addr);
> +			if (r)
> +				goto err;
> +		}
>  
>  		r = amdgpu_ttm_fill_mem(adev, entity, 0, addr, size, resv,
>  					&next, true,
> @@ -2629,10 +2657,13 @@ int amdgpu_fill_buffer(struct amdgpu_ttm_buffer_entity *entity,
>  		/* Never fill more than 256MiB at once to avoid timeouts */
>  		cur_size = min(dst.size, 256ULL << 20);
>  
> -		r = amdgpu_ttm_map_buffer(entity, &bo->tbo, bo->tbo.resource, &dst,
> -					  0, false, &cur_size, &to);
> -		if (r)
> -			goto error;
> +		if (amdgpu_ttm_needs_gart_window(adev, bo->tbo.resource, &dst, false, &to)) {
> +			r = amdgpu_ttm_map_buffer(entity, &bo->tbo, bo->tbo.resource, &dst,
> +						  0, false, false,
> +						  &cur_size, &to);
> +			if (r)
> +				goto error;
> +		}
>  
>  		r = amdgpu_ttm_fill_mem(adev, entity,
>  					src_data, to, cur_size, resv,

