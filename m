Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E8B1AB9B67
	for <lists+dri-devel@lfdr.de>; Fri, 16 May 2025 13:46:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0961E10EA58;
	Fri, 16 May 2025 11:46:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="L6wSV/MW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam04on2075.outbound.protection.outlook.com [40.107.100.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E068E10EA58
 for <dri-devel@lists.freedesktop.org>; Fri, 16 May 2025 11:46:46 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yrF5m2m+EKwZW/FbqMgPaV+ociWzit0jbDRocPEY51a1x/d4gjVQfNbOkOOKUSvdPKW0IFRFGC2ntnhQ+hDgGpINuJLwCmfZpt8jJRd+DmCwNuJe5Ia3Xaak/5op2tfMueVnsB6BtKFjrqQ95w78lzOL9ED5HTl335XH8U1LqLHNqEwTZ/Y9Z8+kxLFIk6r79jp916HSfG69ng49B7S/gbv5YIMpQJkQB//j1Anb21zSrDFTuZF1cOpY0sVt03mK19hciNEf4t2DUi/E5tBxufoe4vJV1IUlEx1+zt1UgwOifhh/uVlO/tc1Q9mcxCwYEHfG6Rr7UDpKbaAd9cPFbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=g9WLOALLUSEXd+rmTHMWacGDNqG5rIP/r1MLXI3mKoM=;
 b=aZZ11KXEJkYcOK0a/PfQHARqrp6/ko3PMOLRh4rCPbhQWO0BRLOjX7lh0Uj2+HmHu9FTWDR4xLPFCAWacaININ4olFwVpnb5MxKScs367598Q/yZu/9OzL0a/WYsOpwazdUOJtmTfk+wdmJsBUhmFsXI5w37K/FBdNgyadA4IKmwjsyq8vISphzUCMBt0ohK0f4Jgpoeaqbm4+E5H9IpubVsl9zFzwLyNw8zyUX3cZeq75d7ZJv+dDzyvfXh11sbxlueW5nd7IgdDRUNilFFIIM7jU3VSfqpN6oufxoS28EP3WfdBJJGMU4oLvyi2lIQ89Ka+ZfzEaExV84OYFQ2rw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=g9WLOALLUSEXd+rmTHMWacGDNqG5rIP/r1MLXI3mKoM=;
 b=L6wSV/MWsPTnEDfFVF7QgWTFoA/LfNV7fSBsZnR3WExk7cbaFMayS84koF3aBXup5d14uGSY7Snmc+IWhTnVosZDLzHYCmGVP+qXI+arceHTWjx+VT2YRBUUna0ImYG8yXXYrKClmGvXuGSGurth0S0oAPDLOFmkk+6aHNCt2oQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by DM4PR12MB5889.namprd12.prod.outlook.com (2603:10b6:8:65::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.30; Fri, 16 May
 2025 11:46:38 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%7]) with mapi id 15.20.8722.027; Fri, 16 May 2025
 11:46:38 +0000
Message-ID: <d3afe944-9a5d-4cf2-83ab-f32da4d59464@amd.com>
Date: Fri, 16 May 2025 13:46:33 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/ttm: Make pool shrinker more responsive
To: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>, dri-devel@lists.freedesktop.org
Cc: kernel-dev@igalia.com, =?UTF-8?Q?Thomas_Hellstr=C3=B6m?=
 <thomas.hellstrom@linux.intel.com>
References: <20250515205751.37268-1-tvrtko.ursulin@igalia.com>
 <d4892d91-7562-4391-93fe-4b2ec159bb69@amd.com>
 <b453ccd4-b783-4314-8cc0-ed372d833ff1@igalia.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <b453ccd4-b783-4314-8cc0-ed372d833ff1@igalia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0068.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ce::14) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|DM4PR12MB5889:EE_
X-MS-Office365-Filtering-Correlation-Id: 11580ae4-1425-4401-ded5-08dd946f5101
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bjNtU1o1dkdrekZlOEFNUmdxUTU1VER2a1VVYnZaRi9UVkNjQTR4dWxDNU1F?=
 =?utf-8?B?VHZuS3JUaGRXdXNFamJDbDIrRE9WdjVTWlVUbDZLL0V4T2Y2Y2RBTHlJUnV5?=
 =?utf-8?B?Ti9MendQZkREeEc5aUhJVkxTMXFXWVpWWnZ4ajIzNkVxc3ZnRS9rMEswcUtS?=
 =?utf-8?B?bjdKNUVGV0ZjcCt5b2RQQ1R3dzV5cUo2Vm1RakFJUnhtaTFUV3BpQjhVWjdv?=
 =?utf-8?B?MzFlZ1NaeklRbTczMTZTMWNIbkZicTNzM2Y4aXRkaDkyLy9kL1g0QzNxY0px?=
 =?utf-8?B?V2hsYVB4c2RyYnFCL2dPeDJxdWVWQVdlbnVZbXJnbTFKdWVGZEQ3MlY3bjBn?=
 =?utf-8?B?cE92VU5saHB4UHZwZ3JHaVJlVVVUTVdsWEQ4eGsrVnZGRk04QytmL0N1dkxI?=
 =?utf-8?B?M3RSdUUwekFvdjhtZVBid1Q1ajdnNVdMUHBDQzFPOWwyWFlMeVhqOXRpQkJR?=
 =?utf-8?B?NzR1UVZhOU5oU0dVU08vL1d3a1hFRzJ1LzNuaGVhVitvelVhcFJkM0ZYblNi?=
 =?utf-8?B?ay9MbWdCNFNZT3duTEtrOUMvakpFbzQ4QzdCcVF6Sk1rUVFlaGxtZFFoYkNZ?=
 =?utf-8?B?Lzh4YlR0T281SHRwRm5uVFNDRDVmNWdpUDRlOFNHMEtNVGNTeTkrOE1LbFFo?=
 =?utf-8?B?THBVekxsREtUeThTUS91QW5ZQjF4SGowU3V1M0Y0ZnR1SVByZEZIVXowNTFp?=
 =?utf-8?B?a08yMjkzNDF3SnBMMXNSZ1piTEtwb1NpNWF4d2ZUdFk2ditOZUQ2dng3RWha?=
 =?utf-8?B?NGRkV0g3bnRpUVZua0Ruc3hjazE2YmVIclQ0OUY2b0pHcFhjNEtxbGJzMXdy?=
 =?utf-8?B?WENlY2VQcGtWWDBmYmVhYi83WjVFamRsU0lSY0VoSTdBelZRZHpNUXJwSnVX?=
 =?utf-8?B?eEw5K0FJNlJFYWFWQmZWUER3K2tpK2tYbW5QK2xhTEtQMU5FcnFmOFJyc3R1?=
 =?utf-8?B?QS8vdE9ZY0k3dFcvU1JEL3RncDNlVFJIcEVIZUNKekxScVRPVlUrdHV5MTJD?=
 =?utf-8?B?cGF4ejhVYysrQ0tmN1lxcEVhNTJ5REJyeWsvYWd0c1ZZd3VabjZMUmRZbzAv?=
 =?utf-8?B?a29LTG1pcG1JSi9vcmROV2JXY2pkaVd1L21EVTFHUmgzNVBZb1luTHVLYUN5?=
 =?utf-8?B?eG1Ba1hYdjVZeEdlaWY4aldOdXJvU2RqL2VIOGFFMDFKOHhQT1V0VlpMMWxN?=
 =?utf-8?B?cmlPYTBVek5VNWFpb1FuRnNlclBJNHVSelNjMmhUOTZnZE1YUy9PMVh0Q21Z?=
 =?utf-8?B?RGZuRHU3VjBlSTlrNUVsczFwZnRhOW5FNnltSDc4Y3EzdnRCVkcxdEZpYVgw?=
 =?utf-8?B?K2J6WU1PeHJndmZxMk45VTNEc0RaSmptK0V3aG1lSWlnQ1pVQ3d4QUtOQU04?=
 =?utf-8?B?TjNFbmlOQWdDc0lCYThXM2ovbE96V0VUSGZWM1FYNU9ibGhOa3plUGJCY1Jk?=
 =?utf-8?B?WGJHdVJSUUlHL1VlQTNidUdVMWVoeGo4WWxOaE9UOTNIcGZlaE9hSTBpTVhn?=
 =?utf-8?B?eEVpMHVUTU5rR1pqOElpSWc5UkZSM3BaTEl3Z1VHZXJpQWtCbUNBUm5LTVE4?=
 =?utf-8?B?OW5sYThBbkJJbmw2R3A1UU9JMlhwZDc5L3JvZUJuSXpoVmswTXBiaWZZa1Ra?=
 =?utf-8?B?Y3JWL25Ka2RXNmg4QTBSZENWZGNiaTVIRC80MG1XdkhjcjBnTWxqWlNXRTZi?=
 =?utf-8?B?N29iQjhkbFVTeVo4dTVnbEJmN3YzSVh3TXQ5ZzFlOVIxVksvMVBRa3RQY3Js?=
 =?utf-8?B?SjlpVk4yZVR2VW40Y1I5Z3ZwSy9FM0kyeTQwZWNoK0ZHZFJ1d2JJUm5tNmU4?=
 =?utf-8?B?U0FWOFg2cHBSQ0pXdkhOSXV3M25sTFRLODV0WHUvQjZkUDRzWWNYY0czRlVz?=
 =?utf-8?B?UGZJME5jWGhBc3pKb0Z3UHcwbjhiZHNuQmtkMkNtSURjQTlzS2V4cjNueWtq?=
 =?utf-8?Q?UXz4ZvTqjdQ=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VFoyM2gvMWhxZkt2NHZIOFhxTks5c3lWTmZSNGl5V3BtLzZVa1Zjd3NuY2Nj?=
 =?utf-8?B?bFI5N3hNZENqVFI3MzA0OTJvc2tLditMYWozTVZzUXI3Lzd3WFV4M2t3aEtJ?=
 =?utf-8?B?RlgrMXNlMU5GVmh5TEZwM2RCUXRKQWh0ME4yaVltdDB0cmNHQUM0bSsyeGdJ?=
 =?utf-8?B?M25pVXBWVnRWU1YzMmdBb1BBNWNPMVljWjJIWTVsSU1LNit6Ny85Rzc4K1B2?=
 =?utf-8?B?dGRFU09JRTc5TldyVXdWM3IyWGhZQXZLbFdlZHM5T3N3a3pXRGhZQll1ZUM4?=
 =?utf-8?B?VHhkY3F1L1RqNUIvNFYzNy81S0p4UkN2V1VjWEt1R2liTEplOEM2N0pWL0wr?=
 =?utf-8?B?YTFNYjA2aklzb25tbS82dC8yV1dRbysxMElIUitCVmpDQldHTjB0L1paRHli?=
 =?utf-8?B?NHl2OHdqbGI1eEg4Qy9uVGZyamk0U21sdU9hcVcrVTBuMmpXTGlOdm5WbWJm?=
 =?utf-8?B?M0t0K1djOGtkTmVOWFFoYnRSZFhUSERNRlZ6YytGNm9HbXZNcVRVZitmMDYx?=
 =?utf-8?B?MnBJM3MwbjlWZlBLSGhiQlY4N3cvM1dOZWFtZEpseGtsenUyTjVDVFdWRHdy?=
 =?utf-8?B?aElySHhHMmJxZjFuanNEek81bU1MWERaZnY3dWE0dGFYYnBoa2w5cTYrNXpu?=
 =?utf-8?B?U00xbGJEYWRyMkx1QlpqNE9YRnN5TDk0Q2FNN2RFKzZwdSs4UzBWL1p0Mkhz?=
 =?utf-8?B?NkZCQ1JBSzRJN1pITkg1RitpL21FQ2UxU3o1d2JXbTdzYWFtZ3pVUHFVZndB?=
 =?utf-8?B?RFVoSVZlTnBLWmhFUVdpVkd3OUVzUkRXWmVkVDZUa2hQL09CcGI3VzBQNmFL?=
 =?utf-8?B?akZZQ3ZpdVVBQWNiQTJxY1pjWlQxTVFaNVVHZVd0dnFzTWRoRGZJcXcyN1Y5?=
 =?utf-8?B?MGFGWHhRQXlYNUFrWkYvZjVoRVdMd0JRVkl3R3BxR3F2VVhNN0tFbzNrRHJj?=
 =?utf-8?B?V1RWRmF5QzFzTVAyZlRxeUdYRm9iRzdMV2srU0p6ZDRQcWh6dFNOd0hidCtY?=
 =?utf-8?B?RUVyRzFoYWNJSHkxQTFmMWFPV3M1MHQyZmI2N1VFMXFQZklFWDFXQStxcW45?=
 =?utf-8?B?N0xGekJJc3Vsbzh5NjB4STE5RFhZRnV3VlJLdW0rc3o0UkFMY3BnSXh2MkZv?=
 =?utf-8?B?am5rWWNkMktKVWN6RlVSb0pJajRyM1dzSGRSTEk1VkFCRUtlSis3QkpuaXhC?=
 =?utf-8?B?V1QveENybWxYcXhzRDRDZWtDbEhSSUFuMGg3NVZhTXdBSWp5dDhGa0hMZnAx?=
 =?utf-8?B?eW53VW9nRFMzK3BWQytqemFmaU1iODk4Q0NZQ1hVNzhHYU9oc3k4M013UC9v?=
 =?utf-8?B?QjRTL1ZFMm1DVzBUZDE5aGZscTU2MHF1QmtLd2tPR0RTaHUzdldXK3FVUUpD?=
 =?utf-8?B?TmptUnZuWW9wam1qODdJMGNGQUxramxVWlpGUDcrblhuRGhKWG9xVlhTam1v?=
 =?utf-8?B?STlJYjE1aDR6alpHZjFzVXRxdk91Q2NLbXl5d3JueVQzMTZudmpYUFRoRUR5?=
 =?utf-8?B?SEhRNHBONUZ3eHJEZ1kyakFLSWI2U09KNytIcElJVGxnQzNLY1FDVzFxWWVo?=
 =?utf-8?B?QjRHdlNZR0JRbWxEWWx6blAzdmRrRDhDQmN5VUxCbHh1bjB0ZnNlbWhTSHZk?=
 =?utf-8?B?RExBbEpSSmw3cVV5SzBzajMreTVOQWNDbGxORlVYYTcwcjRZMDk2ZHlDcTRu?=
 =?utf-8?B?aUJEaGx4Szloa0lXaHR3dmdyRG92VEpJejJnZ2hBdnV0NC9NSmozbm50UUsw?=
 =?utf-8?B?OGc5d1FlWWRRYm9VMlR4MHM3NmI4WFJCZTZCUzRSWDJUUVprSEFHbktPQU5T?=
 =?utf-8?B?eWFpZVVjL0JCenB3WXBqZllvdHRSaHZQM3hEM3BNUDFVdWN0L0FwWmNRd29J?=
 =?utf-8?B?NFJnd3UxWmZlcXNxL2FrbkhNelYxT0E3RldrQTk0dFBieW5uUktXV0U0Tlgy?=
 =?utf-8?B?di9mTFo3Vzd2SDcyTDlrTWJiYWZ3bkZBRG0reGxscmRwOU41KzlxMWFTNDVr?=
 =?utf-8?B?U21BYjJsaVF1OUN2NHZ0MUlrN21yY1p0UU5qM3BmbEFxQjRtZTFOV1RHRWFD?=
 =?utf-8?B?WUdxcnNteDZ6MXpKc3Jhc2ZDck14SzRPWVI2UDFEeVN4MHFlZ0VPd1VKUFQw?=
 =?utf-8?Q?QYXrl87/yJ82aUKanmuTss2DF?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 11580ae4-1425-4401-ded5-08dd946f5101
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 May 2025 11:46:38.0281 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Kdh/rAGjiYjvjfj0k2EzCAC0vB2n7NomLxqzH1UwMGt0HgrQ5Te6okApphHg8RYb
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5889
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

On 5/16/25 13:21, Tvrtko Ursulin wrote:
> 
> On 16/05/2025 09:23, Christian König wrote:
>> On 5/15/25 22:57, Tvrtko Ursulin wrote:
>>> Currently the TTM pool shrinker ensures it frees at least something every
>>> time it is invoked, but it also lies to the core a bit on how hard it
>>> tried.
>>>
>>> For example core will ask it to free SHRINK_BATCH pages but the shrinker
>>> can, due how it walks the LRU list of pools, free just a single page and
>>> still leave the core thinking it expended the full SHRINK_BATCH effort.
>>>
>>> Apart from being inefficient in terms of number of calls to the TTM pool
>>> shrinker required, another consquence of this is that the core can abandon
>>> the shrinking attempt too early due thinking that the whole set of
>>> freeable pages has been scanned.
>>>
>>> We fix this last part by correctly reporting how many out of potentially
>>> freeable pages have been scanned.
>>>
>>> We also do the freeing in an aggressive manner, considering the scan
>>> target as a free target, to ensure walks over pools with unfreeable pages
>>> do not cause no-op calls into our callback.
>>>
>>> And finally we customise the shrinker batch size based on the median pool
>>> order and the total number of pools, with the aim of searching more
>>> possible pools on an average invocation.
>>>
>>> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
>>> Cc: Christian König <christian.koenig@amd.com>
>>> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
>>> ---
>>>   drivers/gpu/drm/ttm/ttm_pool.c | 39 +++++++++++++++++++++-------------
>>>   1 file changed, 24 insertions(+), 15 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/ttm/ttm_pool.c b/drivers/gpu/drm/ttm/ttm_pool.c
>>> index c2ea865be657..a76fe5f95781 100644
>>> --- a/drivers/gpu/drm/ttm/ttm_pool.c
>>> +++ b/drivers/gpu/drm/ttm/ttm_pool.c
>>> @@ -368,7 +368,7 @@ static struct ttm_pool_type *ttm_pool_select_type(struct ttm_pool *pool,
>>>   }
>>>     /* Free pages using the global shrinker list */
>>> -static unsigned int ttm_pool_shrink(void)
>>> +static unsigned int ttm_pool_shrink(unsigned long *nr_scanned)
>>>   {
>>>       struct ttm_pool_type *pt;
>>>       unsigned int num_pages;
>>> @@ -380,16 +380,15 @@ static unsigned int ttm_pool_shrink(void)
>>>       list_move_tail(&pt->shrinker_list, &shrinker_list);
>>>       spin_unlock(&shrinker_lock);
>>>   +    num_pages = 1 << pt->order;
>>> +    (*nr_scanned) += num_pages;
>>> +
>>>       p = ttm_pool_type_take(pt);
>>> -    if (p) {
>>> +    if (p)
>>>           ttm_pool_free_page(pt->pool, pt->caching, pt->order, p);
>>> -        num_pages = 1 << pt->order;
>>> -    } else {
>>> -        num_pages = 0;
>>> -    }
>>>       up_read(&pool_shrink_rwsem);
>>>   -    return num_pages;
>>> +    return p ? num_pages : 0;
>>>   }
>>
>> That change here doesn't make any sense.
>>
>> Scanning a pool type for pages and not finding anything doesn't mean we have scanned for freeable pages and then not freed them.
> 
> I couldn't quite understand this sentence but let me try and explain.
> 
> I have empirically observed when looking at a different bug that the TTM shrinking does not work as efficiently as it could, and as efficiently as the shrinker core expects it to work.

Yeah, that could be quite likely.

> Currently shrinker asks TTM to shrink SHRINK_BATCH pages.
> 
> Lets say ttm_pool_shrinks happens to try order 0 pool first so frees one page. It returns 1 to the shrinker core.

That's intentional. We have gone back and forth over if we should just scan one pool or multiple.

> But because TTM shrinker does not currently update shrinkerctl->nr_scanned, shrinker core assumes TTM looked at full SHRINK_BATCH pages with every call, and adds and decrements that value to the counters it uses to determine when to stop trying the TTM shrinker and move to the next one.

Yeah that was intentional as well.

> Therefore the exit condition can trigger too early in relation to the number of shrinkable pages in TTM pools. Or it can require too many calls to ttm_pool_shrinker_scan.

Oh, that is indeed problematic.

> Depending on the distribution of freeable pages per pools.

No, that should be completely unrelated.

> This patch:
> 
> 1. Fixes the TTM shrinker to correctly report shrinkctl->nr_scanned.

No it doesn't. The nr_scanned for the TTM pool is not related to the number of pool types scanned.

> This way the break condition in shrinker core works correctly.
> 
> 2. Makes TTM shrinker actually scan as much as the core requested from it (respecting shrinkerctl->nr_to_scan).
> 
> This avoids only scanning say one page when shrinker core asked to scan 128. This reduces the number of calls into the TTM shrinker from the core to free same amount of pages.

That should be easy, you just need to adjust the while loop in ttm_pool_shrinker_scan().

> 
> 3. Tunes the batch size away from the default 128 (SHRINK_BATCH) into a value based on the median size of the TTM pools.
> 
> This ensures that on average TTM shrinker tries to actually free _something_ more often than it does now. Otherwise it can happen to try a few pools (depending LRU order) and give up, while the freeable pages are actually in the pools not yet looked at. By tuning the batch size it ensures that on average more pools are looked at.

That doesn't make sense. The number of pools looked at is completely irrelevant for the shrinker.

We should just look at all pools round robin until the number of objects/pages the shrinker wants to free has been freed.

> 
> Now mind you I looked at this two months ago, which is when I first sent this patch out, but haven't went through this today again, it still makes sense to me. So I am curious why you think it totally does not. It looks obvious to me it is not respecting the contract with the core so I would be surprised if I was missing some obvious gotcha.

It sounds like you are assuming that the pool type structure are the objects to scan and we abort when we have scanned a certain amount. But that isn't true, we abort when we can't find any page to free any more.

Regards,
Christian.

> 
> Regards,
> 
> Tvrtko
> 
>>
>>>     /* Return the allocation order based for a page */
>>> @@ -881,10 +880,12 @@ int ttm_pool_restore_and_alloc(struct ttm_pool *pool, struct ttm_tt *tt,
>>>    */
>>>   void ttm_pool_free(struct ttm_pool *pool, struct ttm_tt *tt)
>>>   {
>>> +    unsigned long nr_scanned = 0;
>>> +
>>>       ttm_pool_free_range(pool, tt, tt->caching, 0, tt->num_pages);
>>>         while (atomic_long_read(&allocated_pages) > page_pool_size)
>>> -        ttm_pool_shrink();
>>> +        ttm_pool_shrink(&nr_scanned);
>>>   }
>>>   EXPORT_SYMBOL(ttm_pool_free);
>>>   @@ -1132,17 +1133,21 @@ void ttm_pool_fini(struct ttm_pool *pool)
>>>   }
>>>   EXPORT_SYMBOL(ttm_pool_fini);
>>>   -/* As long as pages are available make sure to release at least one */
>>>   static unsigned long ttm_pool_shrinker_scan(struct shrinker *shrink,
>>>                           struct shrink_control *sc)
>>>   {
>>> -    unsigned long num_freed = 0;
>>> +    unsigned long to_scan, freed = 0;
>>>   -    do
>>> -        num_freed += ttm_pool_shrink();
>>> -    while (!num_freed && atomic_long_read(&allocated_pages));
>>> +    sc->nr_scanned = 0;
>>> +    to_scan = min_t(unsigned long,
>>> +            sc->nr_to_scan, atomic_long_read(&allocated_pages));
>>> +    while (freed < to_scan) {
>>> +        freed += ttm_pool_shrink(&sc->nr_scanned);
>>> +        to_scan = min_t(unsigned long,
>>> +                to_scan, atomic_long_read(&allocated_pages));
>>> +    }
>>>   -    return num_freed;
>>> +    return sc->nr_scanned ? freed : SHRINK_STOP;
>>
>> That again doesn't make sense. That we only find pool types which don't have pages doesn't mean we have scanned them.
>>
>> As far as I can see the existing code was correct after all.
>>
>>>   }
>>>     /* Return the number of pages available or SHRINK_EMPTY if we have none */
>>> @@ -1266,7 +1271,10 @@ EXPORT_SYMBOL(ttm_pool_debugfs);
>>>   /* Test the shrinker functions and dump the result */
>>>   static int ttm_pool_debugfs_shrink_show(struct seq_file *m, void *data)
>>>   {
>>> -    struct shrink_control sc = { .gfp_mask = GFP_NOFS };
>>> +    struct shrink_control sc = {
>>> +        .gfp_mask = GFP_NOFS,
>>> +        .nr_to_scan = 1,
>>> +    };
>>>         fs_reclaim_acquire(GFP_KERNEL);
>>>       seq_printf(m, "%lu/%lu\n", ttm_pool_shrinker_count(mm_shrinker, &sc),
>>> @@ -1324,6 +1332,7 @@ int ttm_pool_mgr_init(unsigned long num_pages)
>>>         mm_shrinker->count_objects = ttm_pool_shrinker_count;
>>>       mm_shrinker->scan_objects = ttm_pool_shrinker_scan;
>>> +    mm_shrinker->batch = (1 << (MAX_PAGE_ORDER / 2)) * NR_PAGE_ORDERS;
>>
>> Since we install only one global shrinker for all pool types, which might contain everything from 1 page till 512 pages, this seems to not make sense at all either.
>>
>> What exactly are you trying to do here?
>>
>> Regards,
>> Christian.
>>
>>>       mm_shrinker->seeks = 1;
>>>         shrinker_register(mm_shrinker);
>>
> 

