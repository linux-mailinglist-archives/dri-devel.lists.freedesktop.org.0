Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 251BFC316F4
	for <lists+dri-devel@lfdr.de>; Tue, 04 Nov 2025 15:12:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 711FA10E0A1;
	Tue,  4 Nov 2025 14:12:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="2rHC/b8+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CO1PR03CU002.outbound.protection.outlook.com
 (mail-westus2azon11010008.outbound.protection.outlook.com [52.101.46.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE45210E0A1;
 Tue,  4 Nov 2025 14:12:34 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gueh5nZtBUk27Y+NO1wRbvOh9gAP8/ctONi41AuBuimpkUk+NSZhiH9GpmOTYrKB8shFlonzHf+KfWzyPsxCpe9m1stk2mkYBHox9jhS6yH70e3rDmc/5ivF0CZuprfUkwRcuVOEGTs6BKt3woxvAYCncGGJ9voI6QNkpkWVKLbY8FTPz90pcdsjCyLjXm1sFV6VjauVdGOQtJCwZ88YaSZ7OJtd1AQUqLufTimxfNid4kCIEqG/JoMb3UuADH/pvuIlrIOKGaZZuq2OSrpYQ/ccOdJSrC05YLekTud7+3ZU1TTqkckzKPuzsjx/P6MHspA4JTsXaDveFWm4mXgqqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DBcn//9vDiruTJJUMnuwI3LuYikiKCcdlJqE5eonM7k=;
 b=l4OI1m12ff4LvqkOsgv89Rwk+K0WmVg9jqUfB3+dEPPxlmjWMb4Q/L7hYngyKuGF4P/YPJTrBcrnz/vP4hgcFuRXHfCm5HXMw8+W+idl7YGJPsWug/ipUr+/KT7Gn+hkXQG418fSqOkKzE+vfKiAwweDN0iWwltAvA/YULmJZtr/DijKydwRHsJQOVIM/5Ea2OYxa/l72NHiB0/VqNvenVfVJrgvWlwwtgDogZ2bm09dBcd9si0QEolYTRykhekRiRdr1YgLZHRhm4FHrv0dprMJrQZHMLse+E7XQ341uD56FQWLmUVswbhKkhc++8L9JnwojPnwWvzlAOY33zlCeQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DBcn//9vDiruTJJUMnuwI3LuYikiKCcdlJqE5eonM7k=;
 b=2rHC/b8+LlirJDhrRkhgOr0Fj2VuPSb9e0yTrVxfqqoCxkuzk5y1xzo3mkkdpzmtRqDELu7CgIt0NLc1fG2Pq/Di+SBD5PRqLMkXasJzdauVZMtqhkQ4oeclfGqXzV5weg4lB9bnjvJKVdjGGsp1EkL1x6HXIHTwZA3ZqTiJCHU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by CY1PR12MB9700.namprd12.prod.outlook.com (2603:10b6:930:108::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.7; Tue, 4 Nov
 2025 14:12:32 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%4]) with mapi id 15.20.9275.015; Tue, 4 Nov 2025
 14:12:29 +0000
Message-ID: <13f0cda3-baae-42a4-a7c6-1fdd774bb5d2@amd.com>
Date: Tue, 4 Nov 2025 15:12:22 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 02/20] drm/ttm: rework pipelined eviction fence handling
To: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>,
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
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20251104083605.13677-3-pierre-eric.pelloux-prayer@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LV3P220CA0014.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:408:234::14) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|CY1PR12MB9700:EE_
X-MS-Office365-Filtering-Correlation-Id: 47efb1ef-546d-44f5-f33f-08de1bac3014
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|7416014|376014|366016|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?S0FnSnBzZnEzL3d3RituLzRxb1JDR2YrZXRYd3NoQk5CZTRLR3M0YlZwZ1Uz?=
 =?utf-8?B?bzdzRmdLcVNLUG9aNDBGdXJHZCtnNm0rR1lqN3NqVFMwWEVuNWpIZnpmeEI1?=
 =?utf-8?B?cTRnekRqR1F2aGhTMnJlbWdQZCtFMUVVc292TjNOM0ZscVk0ZituNiszS1Yv?=
 =?utf-8?B?VGNLY2I4M290b3dJNkF4TmN0eFVIMGdTTGgvT1BmUmZtWklPYmtjNjloZWZJ?=
 =?utf-8?B?b1plNkErOS9OZ2h0VGgzclJtdWlIYzVZWkR0QXdlT3NIOWw0bkl6LzJQUFI3?=
 =?utf-8?B?dDRCNjNkT2VBbFBPbGVxN2hIVjJwL1E3eDRWVDZXRlE4SWplUnpJRWE3OWNi?=
 =?utf-8?B?bFBuT0MvUDN6MXV3T1duUG9LcnBjdnBaS2x1R01ObEpuc0VRVkhmRFk1NjRh?=
 =?utf-8?B?TlpjeU5XRy83dHBiZWZJa3YrcHVXWW1TR25XU0plQUtYVXdiNEdQRk4rT2pO?=
 =?utf-8?B?NmRDcy83bmh6ckM4eWtWK21kOU81YzhSUGdLb01qYVlONCtwRG1FZTNrUmRo?=
 =?utf-8?B?aVNoUXQybzFZdkh2Y3ZVRitPOC9aVlhVSzg1TnRvNklxWGhza2tvNWgyWVNL?=
 =?utf-8?B?bmhzWlFnZ0loMVVRMW54aUFvQi9ud3ZpaW5EVEF4MldNd3o0R1dBai9VYjF1?=
 =?utf-8?B?NFE2bFRBbUNYdHBpVkx0MjdLakF0QmIxZG56VHVWNUdlTVRXUGtjSExSaFRK?=
 =?utf-8?B?eFhLZU9GUHNuY3ZweVIrOFI2dko0S016Q1BoYUMwSkE4ZG8zUTY5UWFQVjhW?=
 =?utf-8?B?bGpVbHZVTWNjWXVraVlkNlJIcGpMaVV1ZzBkRHhVQzBRTDVxUjdPSGd5Tk8z?=
 =?utf-8?B?T1BydmZJUWVlZ0tWUDlWdVR0MkF4YVUwQmhkTjIzdmlvakx1Nk9jUXowRG9J?=
 =?utf-8?B?T0RsdVdqNG9BdWpYc2JNVFlqd05ZdzJYSUlVa3RDajJzOU1nY0cyczluR2l1?=
 =?utf-8?B?ZTVMVi9yMkUyQ21tTEQxVldHZEd0YnA3Tjhnc0hwVFNaM3d1bEMvSDhrYWEw?=
 =?utf-8?B?bXlNbFhmY2cvSmRZZ3d0SkUxTlZPckZBOFVRTW1keDRQUlc2NnlSaStVaXJY?=
 =?utf-8?B?L1V2WDNvMzdUQk83NjVCdndQSUlLaVhhbzdCekdoRExHUktDR1JwTUZoNGFy?=
 =?utf-8?B?N1ltUHBDVFJXS2xzNU54NmZhWWdXZ0xvZkliZHdBVjVMNjB1WFdJV1pwTTBN?=
 =?utf-8?B?ck5zZWo3M0FPWnh1MU9zT3h5UDhtc1dhZW5MbkxzNUNieVRhb015a3pITWNP?=
 =?utf-8?B?cHpUYlFsSUxtTHJUYmpGY1Y2L2RPOGE5V2ZMMHRFdXNnSCtHYVV6SDFhanRJ?=
 =?utf-8?B?czk4RXFUMWtmYnJVVFpUSSt0RHJVZnJOLzdDMlpCY0ZyK2VINXQ4WkdidGgr?=
 =?utf-8?B?cW0zMU9XL0p5MFJlVHUxOSs0UTVQWjh1a3BHN1hBd1R2S1oyL1RDSXM0Mmdl?=
 =?utf-8?B?Q0grNWdwRTkwRUoxdEpOUTZLZ2pEQ3JxMUlnS01pY2M0OFFTdlZLNHpFQkVw?=
 =?utf-8?B?RUVwU2gvTGFkWmpSV0F0TG5oYWlPT2ZtZzhuM1ZsQUJ0dThMK0R4Z054bHFT?=
 =?utf-8?B?M0NwNFE0OVNMMllpYW9nUGxERnI1MUpBOWFwK1dtM3VhREx1VExIcHl6NVhj?=
 =?utf-8?B?ZWtDNUl1MkNRRkUvenkvNmRIaGgzTm1MaUF4MDk4YndVVDQ1TXNuU0dFa2JV?=
 =?utf-8?B?NC9ORUF6cTY0cmlsOGFyaEFQTDJxR09VS3JTdG5hYitWdWRNb283WTU0QXBv?=
 =?utf-8?B?SHhUSnd2V1JrUXJrMTBxYmdsU1VyaXZUR015VlRUb1ZaVmp5VWU3SGl4Zjg0?=
 =?utf-8?B?TDY3dHhoOC9VQmc2S0kxaDRFcVpLM1ZKZDBjRS9NZ0pqc1BTbHpwTmRUSTRB?=
 =?utf-8?B?aVVjZkFKRGRmQkdmcXA5ZzBxWHk5RlVQSVVWZFZNS2pPdEoyN3llRnh0WEd2?=
 =?utf-8?B?RTFHZ2NMcloyM3RSV1E1YUpwVU5RblcyR05RVXBKdkpkWmxQUUhESHhyUll4?=
 =?utf-8?Q?YQwLKw9Oulbpu+BOVmPXlvard9X5GE=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(7416014)(376014)(366016)(921020); DIR:OUT; SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UmNGbDU5ZUhrMXV4UndIVE1ad0xCUDdhWU1HbGJ4Ny9OS0dHU1pIQ20ySWlp?=
 =?utf-8?B?WklXZk1EQ1ZqZXc2TGw3OFg2QW1HVzZTUU15ODdWWjlGa0RtVC9YallDTURU?=
 =?utf-8?B?Yk5idTlVS3RJSVBHUXEwREgzQ3FEVVpud0VYNGMvbm0vOHZKcWFaNHl2NW1Y?=
 =?utf-8?B?QjRhR1pkcTdLUFRteUhWc2pkRVd3SE9NZWJBVkUxbXVxcG9xSGRqbUFQYVJI?=
 =?utf-8?B?NUhXaSt5b2VEMi96SXEwdmFmZ3FRVlZEaVVGaXp3RnA0TTdGOFNGcmptZENW?=
 =?utf-8?B?Qyt4UE5uOVZncTAyN3U4NHp3am11YU5jK0VpSjA5MDF1cTNNdDJoR3BtbWV3?=
 =?utf-8?B?R1ZtcnYwYTBFQWRiWFB5SUg1aFQrV24xczVvSW9rNk9pN1ZDNW5BYWRaTXM4?=
 =?utf-8?B?RmVlc3ZpVUVEajB4cWV2bktKV0tqZVdKRjAzcURRcVU5WS9aNU1aN2dkUW1r?=
 =?utf-8?B?c0hZUStjODlXZ3JHTDRtZ2hweXU2OXF2blhjMWRNcnVNTWVOa0l5SU90OUhC?=
 =?utf-8?B?TDd6VFJ1dGVKOXR4THdPbmtaY2hrNDdDYjhFa25Ob0dpbFh5TmJRWDVvaXRQ?=
 =?utf-8?B?cHpRaU5SeUhGY0puV1E1UTN0OTAxUkw3OUNQbjl0SzEwTC9BTUVMdW5TNGpX?=
 =?utf-8?B?Y3NvUm81NFNQTHB6dUFRQzdPdHNiVjRtQ2xrVkpMWkRpaUN4K3E5YlJRcGZo?=
 =?utf-8?B?VUJ6N2lxaXhFbXgzZjBTZldlblplc2NqbFFzZlpkbWExMG9SQStiMGhIdFNO?=
 =?utf-8?B?OHg0UE9YeVhDK3ZkcDNEd0x2dXRtTXprRGo5QXVGem9nOHBFWExRc0YrQytB?=
 =?utf-8?B?Z3FhR2ROekM3NzdoamkrQjVwRjVNaDJhV2tERHZCMUhiSTk2VkZMazdGK0h2?=
 =?utf-8?B?bzRUaWdNOS81NHBRbkpEMXVPazdmZ3hBa2IralBOblYvUzdFb3dESUpqWThN?=
 =?utf-8?B?Wk55UWVEeHNtcjkyVUdmamdESGdnUHhua2JPRjgyWmJhZWRVbS9HbFh5OTFD?=
 =?utf-8?B?UDIyL09xa1BJM3dMeGVSeW9ERHNjTUwxbUFCWFozSFJTZDhGbW4rclg1UU9Q?=
 =?utf-8?B?Yi9KY0hUZnZHZWU3M3JiOHdqY2dqQUN1Y3RCK21tYmJWRElab0NUQVo3a3o3?=
 =?utf-8?B?OW1ldytyT2JsQXo2dnhRLzhBd1h6MUVseHl0N0JsRG11cVhtUFZQN1gvOU53?=
 =?utf-8?B?NjJLSUowbU52R1dxSThNOWFERkcwVEQzK2xObm1PUHFRVjhlbERGSVg4cDlV?=
 =?utf-8?B?cXh1N01sUXVaeDRvTlk5VVlCSlp4YXk5UFdyQ1lyT21RTm1hRVBWdmNWTHc5?=
 =?utf-8?B?UzZicUlnUHdxRXdMbzFoTHBhV244V0tSQmNSVGlrVzY5UTZaN0NnZElOUmUy?=
 =?utf-8?B?RTdUK3N4bmVQZjZHMnovWWx5My8vVmVxU2VrbDFDSTVoMXhLUjQ0UzRxREZr?=
 =?utf-8?B?OHZXZFZ1NHZHeFg5RlVPTHpTeFNyQUV2eWE0UFh5QlJyRnZqOGhiZUtuemV0?=
 =?utf-8?B?YlVVb0dqT05sZjRsa3BxY1VnUG1laldzdFlMOFN1dFBWbEd3K2R2V3Yrd3Nu?=
 =?utf-8?B?dFhpQzB5TFYyZkFJbWJsR0w0R3ZwcVVEYjlmR2NveFNwVDF1UXZIblNodWdL?=
 =?utf-8?B?Wm90dHhTSnNNMGJybEtSbmF6TmVQdHh3Vi9hc2k0b3g1ZDFwM1ZKajB0dUVt?=
 =?utf-8?B?bDdrS0E1NzJwTmE3aHZ2bnNydU5XT0NhNFhleGRPV1czSkxkSFEzNENOTXV3?=
 =?utf-8?B?RUY0MDJ3Y3htM3AzV3F5c3E1ZUtyckRrNDJhMVd3V2Mzc2VqVXo5akFubEw3?=
 =?utf-8?B?N0lqNWp1cWQrT1dBYnhqcEtrWTRtMWRFRWlkYWVMdW1QaHZGemR6bjRWN0ZS?=
 =?utf-8?B?ZDVtQmg2OGpXNW4vdzY2ZU11c3gzYkhSdk1UY1E1NW9Hc0ptc2ZIR0x3aFFK?=
 =?utf-8?B?ckJVOWtVemRmMHk1ZWFwbWtNRlppczdMMi9Nb05pK3BXcGp2WWJoUUtPMEcx?=
 =?utf-8?B?bXA5Qi9NUncxZXd3NlFzRDhRK05xOWdvNmZqTEZ6Zk5MT0lEcHRZcndUaEor?=
 =?utf-8?B?MWdUdEF4UVVNQW5ScUllOXdVb0RBOTFVUHptL05Qa01ES1BoVzN2Q093RFRv?=
 =?utf-8?Q?8cUHqkaWGpDLcKsD/2ZJ/yFVm?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 47efb1ef-546d-44f5-f33f-08de1bac3014
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2025 14:12:29.0693 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NZ5BHTtcYuwa2OeaV5FGNwAwyMeG0x7uuhu1X4pZ83Kh8sjlKT98yVc/ONYz6x4k
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY1PR12MB9700
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
> Until now ttm stored a single pipelined eviction fence which means
> drivers had to use a single entity for these evictions.
> 
> To lift this requirement, this commit allows up to 8 entities to
> be used.
> 
> Ideally a dma_resv object would have been used as a container of
> the eviction fences, but the locking rules makes it complex.
> dma_resv all have the same ww_class, which means "Attempting to
> lock more mutexes after ww_acquire_done." is an error.
> 
> One alternative considered was to introduced a 2nd ww_class for
> specific resv to hold a single "transient" lock (= the resv lock
> would only be held for a short period, without taking any other
> locks).
> 
> The other option, is to statically reserve a fence array, and
> extend the existing code to deal with N fences, instead of 1.
> 
> The driver is still responsible to reserve the correct number
> of fence slots.
> 
> Lastly ttm_resource_manager.pipelined_eviction.n_fences is
> initialized to 1, so the new behavior is opt-in.
> 
> Signed-off-by: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c       |  8 ++-
>  .../gpu/drm/ttm/tests/ttm_bo_validate_test.c  | 13 +++--
>  drivers/gpu/drm/ttm/tests/ttm_resource_test.c |  5 +-
>  drivers/gpu/drm/ttm/ttm_bo.c                  | 56 ++++++++++++-------
>  drivers/gpu/drm/ttm/ttm_bo_util.c             | 36 ++++++++++--
>  drivers/gpu/drm/ttm/ttm_resource.c            | 45 ++++++++++-----
>  include/drm/ttm/ttm_resource.h                | 34 ++++++++---
>  7 files changed, 139 insertions(+), 58 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
> index 326476089db3..c66f00434991 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
> @@ -2156,7 +2156,7 @@ void amdgpu_ttm_set_buffer_funcs_status(struct amdgpu_device *adev, bool enable)
>  {
>  	struct ttm_resource_manager *man = ttm_manager_type(&adev->mman.bdev, TTM_PL_VRAM);
>  	uint64_t size;
> -	int r;
> +	int r, i;
>  
>  	if (!adev->mman.initialized || amdgpu_in_reset(adev) ||
>  	    adev->mman.buffer_funcs_enabled == enable || adev->gmc.is_app_apu)
> @@ -2190,8 +2190,10 @@ void amdgpu_ttm_set_buffer_funcs_status(struct amdgpu_device *adev, bool enable)
>  	} else {
>  		drm_sched_entity_destroy(&adev->mman.high_pr);
>  		drm_sched_entity_destroy(&adev->mman.low_pr);
> -		dma_fence_put(man->move);
> -		man->move = NULL;
> +		for (i = 0; i < TTM_FENCES_MAX_SLOT_COUNT; i++) {
> +			dma_fence_put(man->pipelined_eviction.fences[i]);
> +			man->pipelined_eviction.fences[i] = NULL;
> +		}
>  	}
>  
>  	/* this just adjusts TTM size idea, which sets lpfn to the correct value */
> diff --git a/drivers/gpu/drm/ttm/tests/ttm_bo_validate_test.c b/drivers/gpu/drm/ttm/tests/ttm_bo_validate_test.c
> index 3148f5d3dbd6..1396674e1923 100644
> --- a/drivers/gpu/drm/ttm/tests/ttm_bo_validate_test.c
> +++ b/drivers/gpu/drm/ttm/tests/ttm_bo_validate_test.c
> @@ -651,7 +651,8 @@ static void ttm_bo_validate_move_fence_signaled(struct kunit *test)
>  	int err;
>  
>  	man = ttm_manager_type(priv->ttm_dev, mem_type);
> -	man->move = dma_fence_get_stub();
> +	man->pipelined_eviction.n_fences = 1;
> +	man->pipelined_eviction.fences[0] = dma_fence_get_stub();
>  
>  	bo = ttm_bo_kunit_init(test, test->priv, size, NULL);
>  	bo->type = bo_type;
> @@ -668,7 +669,7 @@ static void ttm_bo_validate_move_fence_signaled(struct kunit *test)
>  	KUNIT_EXPECT_EQ(test, ctx.bytes_moved, size);
>  
>  	ttm_bo_put(bo);
> -	dma_fence_put(man->move);
> +	dma_fence_put(man->pipelined_eviction.fences[0]);
>  }
>  
>  static const struct ttm_bo_validate_test_case ttm_bo_validate_wait_cases[] = {
> @@ -732,9 +733,10 @@ static void ttm_bo_validate_move_fence_not_signaled(struct kunit *test)
>  
>  	spin_lock_init(&fence_lock);
>  	man = ttm_manager_type(priv->ttm_dev, fst_mem);
> -	man->move = alloc_mock_fence(test);
> +	man->pipelined_eviction.n_fences = 1;
> +	man->pipelined_eviction.fences[0] = alloc_mock_fence(test);
>  
> -	task = kthread_create(threaded_fence_signal, man->move, "move-fence-signal");
> +	task = kthread_create(threaded_fence_signal, man->pipelined_eviction.fences[0], "move-fence-signal");
>  	if (IS_ERR(task))
>  		KUNIT_FAIL(test, "Couldn't create move fence signal task\n");
>  
> @@ -742,7 +744,8 @@ static void ttm_bo_validate_move_fence_not_signaled(struct kunit *test)
>  	err = ttm_bo_validate(bo, placement_val, &ctx_val);
>  	dma_resv_unlock(bo->base.resv);
>  
> -	dma_fence_wait_timeout(man->move, false, MAX_SCHEDULE_TIMEOUT);
> +	dma_fence_wait_timeout(man->pipelined_eviction.fences[0], false, MAX_SCHEDULE_TIMEOUT);
> +	man->pipelined_eviction.fences[0] = NULL;
>  
>  	KUNIT_EXPECT_EQ(test, err, 0);
>  	KUNIT_EXPECT_EQ(test, ctx_val.bytes_moved, size);
> diff --git a/drivers/gpu/drm/ttm/tests/ttm_resource_test.c b/drivers/gpu/drm/ttm/tests/ttm_resource_test.c
> index e6ea2bd01f07..6dfdf759a491 100644
> --- a/drivers/gpu/drm/ttm/tests/ttm_resource_test.c
> +++ b/drivers/gpu/drm/ttm/tests/ttm_resource_test.c
> @@ -207,6 +207,7 @@ static void ttm_resource_manager_init_basic(struct kunit *test)
>  	struct ttm_resource_test_priv *priv = test->priv;
>  	struct ttm_resource_manager *man;
>  	size_t size = SZ_16K;
> +	int i;
>  
>  	man = kunit_kzalloc(test, sizeof(*man), GFP_KERNEL);
>  	KUNIT_ASSERT_NOT_NULL(test, man);
> @@ -216,8 +217,8 @@ static void ttm_resource_manager_init_basic(struct kunit *test)
>  	KUNIT_ASSERT_PTR_EQ(test, man->bdev, priv->devs->ttm_dev);
>  	KUNIT_ASSERT_EQ(test, man->size, size);
>  	KUNIT_ASSERT_EQ(test, man->usage, 0);
> -	KUNIT_ASSERT_NULL(test, man->move);
> -	KUNIT_ASSERT_NOT_NULL(test, &man->move_lock);
> +	for (i = 0; i < TTM_FENCES_MAX_SLOT_COUNT; i++)
> +		KUNIT_ASSERT_NULL(test, man->pipelined_eviction.fences[i]);
>  
>  	for (int i = 0; i < TTM_MAX_BO_PRIORITY; ++i)
>  		KUNIT_ASSERT_TRUE(test, list_empty(&man->lru[i]));
> diff --git a/drivers/gpu/drm/ttm/ttm_bo.c b/drivers/gpu/drm/ttm/ttm_bo.c
> index f4d9e68b21e7..bc6d4a6c6d70 100644
> --- a/drivers/gpu/drm/ttm/ttm_bo.c
> +++ b/drivers/gpu/drm/ttm/ttm_bo.c
> @@ -658,34 +658,48 @@ void ttm_bo_unpin(struct ttm_buffer_object *bo)
>  EXPORT_SYMBOL(ttm_bo_unpin);
>  
>  /*
> - * Add the last move fence to the BO as kernel dependency and reserve a new
> - * fence slot.
> + * Add the pipelined eviction fencesto the BO as kernel dependency and reserve new
> + * fence slots.
>   */
> -static int ttm_bo_add_move_fence(struct ttm_buffer_object *bo,
> -				 struct ttm_resource_manager *man,
> -				 bool no_wait_gpu)
> +static int ttm_bo_add_pipelined_eviction_fences(struct ttm_buffer_object *bo,
> +						struct ttm_resource_manager *man,
> +						bool no_wait_gpu)
>  {
> +	struct dma_fence *fences_to_add[TTM_FENCES_MAX_SLOT_COUNT] = {};
>  	struct dma_fence *fence;
> -	int ret;
> +	bool all_signaled = true, signaled;
> +	int i, n = 0;
>  
> -	spin_lock(&man->move_lock);
> -	fence = dma_fence_get(man->move);
> -	spin_unlock(&man->move_lock);
> +	spin_lock(&man->pipelined_eviction.lock);
> +	for (i = 0; i < man->pipelined_eviction.n_fences; i++) {
> +		fence = man->pipelined_eviction.fences[i];

> +		if (!fence)
> +			continue;
> +		signaled = dma_fence_is_signaled(fence);
>  
> -	if (!fence)
> +		if (signaled) {
> +			dma_fence_put(man->pipelined_eviction.fences[i]);
> +			man->pipelined_eviction.fences[i] = NULL;

Please completely drop that, only check if the fences are signaled when the no_wait_gpu flag is set.

> +		} else {
> +			all_signaled = false;
> +			if (no_wait_gpu) {
> +				spin_unlock(&man->pipelined_eviction.lock);
> +				return -EBUSY;
> +			}
> +			fences_to_add[n++] = dma_fence_get(fence);
> +		}
> +	}
> +	spin_unlock(&man->pipelined_eviction.lock);
> +
> +	if (all_signaled)
>  		return 0;
>  
> -	if (no_wait_gpu) {
> -		ret = dma_fence_is_signaled(fence) ? 0 : -EBUSY;
> -		dma_fence_put(fence);
> -		return ret;
> +	for (i = 0; i < n; i++) {
> +		dma_resv_add_fence(bo->base.resv, fences_to_add[i], DMA_RESV_USAGE_KERNEL);
> +		dma_fence_put(fences_to_add[i]);
>  	}
>  
> -	dma_resv_add_fence(bo->base.resv, fence, DMA_RESV_USAGE_KERNEL);
> -
> -	ret = dma_resv_reserve_fences(bo->base.resv, 1);
> -	dma_fence_put(fence);
> -	return ret;
> +	return dma_resv_reserve_fences(bo->base.resv, TTM_FENCES_MAX_SLOT_COUNT);

Please separate out a patch where the call to dma_resv_reserve_fences() is removed here.

>  }
>  
>  /**
> @@ -718,7 +732,7 @@ static int ttm_bo_alloc_resource(struct ttm_buffer_object *bo,
>  	int i, ret;
>  
>  	ticket = dma_resv_locking_ctx(bo->base.resv);
> -	ret = dma_resv_reserve_fences(bo->base.resv, 1);
> +	ret = dma_resv_reserve_fences(bo->base.resv, TTM_FENCES_MAX_SLOT_COUNT);
>  	if (unlikely(ret))
>  		return ret;
>  
> @@ -757,7 +771,7 @@ static int ttm_bo_alloc_resource(struct ttm_buffer_object *bo,
>  				return ret;
>  		}
>  
> -		ret = ttm_bo_add_move_fence(bo, man, ctx->no_wait_gpu);
> +		ret = ttm_bo_add_pipelined_eviction_fences(bo, man, ctx->no_wait_gpu);
>  		if (unlikely(ret)) {
>  			ttm_resource_free(bo, res);
>  			if (ret == -EBUSY)
> diff --git a/drivers/gpu/drm/ttm/ttm_bo_util.c b/drivers/gpu/drm/ttm/ttm_bo_util.c
> index acbbca9d5c92..ada8af965acf 100644
> --- a/drivers/gpu/drm/ttm/ttm_bo_util.c
> +++ b/drivers/gpu/drm/ttm/ttm_bo_util.c
> @@ -258,7 +258,7 @@ static int ttm_buffer_object_transfer(struct ttm_buffer_object *bo,
>  	ret = dma_resv_trylock(&fbo->base.base._resv);
>  	WARN_ON(!ret);
>  
> -	ret = dma_resv_reserve_fences(&fbo->base.base._resv, 1);
> +	ret = dma_resv_reserve_fences(&fbo->base.base._resv, TTM_FENCES_MAX_SLOT_COUNT);
>  	if (ret) {
>  		dma_resv_unlock(&fbo->base.base._resv);
>  		kfree(fbo);
> @@ -646,6 +646,8 @@ static void ttm_bo_move_pipeline_evict(struct ttm_buffer_object *bo,
>  {
>  	struct ttm_device *bdev = bo->bdev;
>  	struct ttm_resource_manager *from;
> +	struct dma_fence *tmp;
> +	int i, free_slot = -1;
>  
>  	from = ttm_manager_type(bdev, bo->resource->mem_type);
>  
> @@ -653,13 +655,35 @@ static void ttm_bo_move_pipeline_evict(struct ttm_buffer_object *bo,
>  	 * BO doesn't have a TTM we need to bind/unbind. Just remember
>  	 * this eviction and free up the allocation
>  	 */
> -	spin_lock(&from->move_lock);
> -	if (!from->move || dma_fence_is_later(fence, from->move)) {
> -		dma_fence_put(from->move);
> -		from->move = dma_fence_get(fence);
> +	spin_lock(&from->pipelined_eviction.lock);
> +	for (i = 0; i < from->pipelined_eviction.n_fences; i++) {
> +		tmp = from->pipelined_eviction.fences[i];
> +		if (!tmp) {
> +			if (free_slot < 0)
> +				free_slot = i;
> +			continue;

Just break here.

> +		}
> +		if (fence->context != tmp->context)
> +			continue;
> +		if (dma_fence_is_later(fence, tmp)) {
> +			dma_fence_put(tmp);
> +			free_slot = i;
> +			break;
> +		}
> +		goto unlock;
> +	}
> +	if (free_slot >= 0) {

Drop free_slot and check i here.

> +		from->pipelined_eviction.fences[free_slot] = dma_fence_get(fence);
> +	} else {
> +		WARN(1, "not enough fence slots for all fence contexts");
> +		spin_unlock(&from->pipelined_eviction.lock);
> +		dma_fence_wait(fence, false);
> +		goto end;
>  	}
> -	spin_unlock(&from->move_lock);
>  
> +unlock:
> +	spin_unlock(&from->pipelined_eviction.lock);
> +end:
>  	ttm_resource_free(bo, &bo->resource);
>  }
>  
> diff --git a/drivers/gpu/drm/ttm/ttm_resource.c b/drivers/gpu/drm/ttm/ttm_resource.c
> index e2c82ad07eb4..ae0d4621cc55 100644
> --- a/drivers/gpu/drm/ttm/ttm_resource.c
> +++ b/drivers/gpu/drm/ttm/ttm_resource.c
> @@ -523,14 +523,19 @@ void ttm_resource_manager_init(struct ttm_resource_manager *man,
>  {
>  	unsigned i;
>  
> -	spin_lock_init(&man->move_lock);
>  	man->bdev = bdev;
>  	man->size = size;
>  	man->usage = 0;
>  
>  	for (i = 0; i < TTM_MAX_BO_PRIORITY; ++i)
>  		INIT_LIST_HEAD(&man->lru[i]);
> -	man->move = NULL;
> +	spin_lock_init(&man->pipelined_eviction.lock);
> +	for (i = 0; i < TTM_FENCES_MAX_SLOT_COUNT; i++)
> +		man->pipelined_eviction.fences[i] = NULL;
> +	/* Can be overridden by drivers that wants to use more than 1 entity
> +	 * for moves and evictions (limited to TTM_FENCES_MAX_SLOT_COUNT).
> +	 */
> +	man->pipelined_eviction.n_fences = 1;
>  }
>  EXPORT_SYMBOL(ttm_resource_manager_init);
>  
> @@ -551,7 +556,7 @@ int ttm_resource_manager_evict_all(struct ttm_device *bdev,
>  		.no_wait_gpu = false,
>  	};
>  	struct dma_fence *fence;
> -	int ret;
> +	int ret, i;
>  
>  	do {
>  		ret = ttm_bo_evict_first(bdev, man, &ctx);
> @@ -561,18 +566,32 @@ int ttm_resource_manager_evict_all(struct ttm_device *bdev,
>  	if (ret && ret != -ENOENT)
>  		return ret;
>  
> -	spin_lock(&man->move_lock);
> -	fence = dma_fence_get(man->move);
> -	spin_unlock(&man->move_lock);
> +	ret = 0;
>  
> -	if (fence) {
> -		ret = dma_fence_wait(fence, false);
> -		dma_fence_put(fence);
> -		if (ret)
> -			return ret;
> -	}
> +	do {
> +		fence = NULL;
>  
> -	return 0;
> +		spin_lock(&man->pipelined_eviction.lock);
> +		for (i = 0; i < man->pipelined_eviction.n_fences; i++) {
> +			fence = man->pipelined_eviction.fences[i];

> +			man->pipelined_eviction.fences[i] = NULL;

Drop that. We should never set man->pipelined_eviction.fences to NULL.

Potentially even initialize all move fences with a stub fence.

> +			if (fence)
> +				break;
> +		}
> +		spin_unlock(&man->pipelined_eviction.lock);
> +
> +		if (fence) {
> +			ret = dma_fence_wait(fence, false);
> +			dma_fence_put(fence);
> +
> +			if (ret)
> +				break;
> +		} else {
> +			break;
> +		}
> +	} while (1);
> +
> +	return ret;
>  }
>  EXPORT_SYMBOL(ttm_resource_manager_evict_all);
>  
> diff --git a/include/drm/ttm/ttm_resource.h b/include/drm/ttm/ttm_resource.h
> index f49daa504c36..898c429b37ad 100644
> --- a/include/drm/ttm/ttm_resource.h
> +++ b/include/drm/ttm/ttm_resource.h
> @@ -50,6 +50,15 @@ struct io_mapping;
>  struct sg_table;
>  struct scatterlist;
>  
> +/**
> + * define TTM_FENCES_MAX_SLOT_COUNT - How many entities can be used for evictions
> + *
> + * Pipelined evictions can be spread on multiple entities. This
> + * is the max number of entities that can be used by the driver
> + * for that purpose.
> + */
> +#define TTM_FENCES_MAX_SLOT_COUNT 8

Make that TTM_NUM_MOVE_FENCES.

> +
>  /**
>   * enum ttm_lru_item_type - enumerate ttm_lru_item subclasses
>   */
> @@ -180,8 +189,10 @@ struct ttm_resource_manager_func {
>   * @size: Size of the managed region.
>   * @bdev: ttm device this manager belongs to
>   * @func: structure pointer implementing the range manager. See above
> - * @move_lock: lock for move fence
> - * @move: The fence of the last pipelined move operation.
> + * @pipelined_eviction.lock: lock for eviction fences
> + * @pipelined_eviction.n_fences: The number of fences allowed in the array. If
> + * 0, pipelined evictions aren't used.
> + * @pipelined_eviction.fences: The fences of the last pipelined move operation.
>   * @lru: The lru list for this memory type.
>   *
>   * This structure is used to identify and manage memory types for a device.
> @@ -195,12 +206,15 @@ struct ttm_resource_manager {
>  	struct ttm_device *bdev;
>  	uint64_t size;
>  	const struct ttm_resource_manager_func *func;
> -	spinlock_t move_lock;
>  
> -	/*
> -	 * Protected by @move_lock.
> +	/* This is very similar to a dma_resv object, but locking rules make
> +	 * it difficult to use a it in this context.
>  	 */
> -	struct dma_fence *move;
> +	struct {
> +		spinlock_t lock;
> +		int n_fences;
> +		struct dma_fence *fences[TTM_FENCES_MAX_SLOT_COUNT];
> +	} pipelined_eviction;

Drop the separate structure, just make move an array instead.

And also drop n_fences. Just always take a look at all fences.

Regards,
Christian.

>  
>  	/*
>  	 * Protected by the bdev->lru_lock.
> @@ -421,8 +435,12 @@ static inline bool ttm_resource_manager_used(struct ttm_resource_manager *man)
>  static inline void
>  ttm_resource_manager_cleanup(struct ttm_resource_manager *man)
>  {
> -	dma_fence_put(man->move);
> -	man->move = NULL;
> +	int i;
> +
> +	for (i = 0; i < TTM_FENCES_MAX_SLOT_COUNT; i++) {
> +		dma_fence_put(man->pipelined_eviction.fences[i]);
> +		man->pipelined_eviction.fences[i] = NULL;
> +	}
>  }
>  
>  void ttm_lru_bulk_move_init(struct ttm_lru_bulk_move *bulk);

