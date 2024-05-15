Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CA7598C617C
	for <lists+dri-devel@lfdr.de>; Wed, 15 May 2024 09:20:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5032810E4C7;
	Wed, 15 May 2024 07:20:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="yYZG7nHE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2060.outbound.protection.outlook.com [40.107.92.60])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5CFCB10E49C;
 Wed, 15 May 2024 07:20:49 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EWf4Uj9zEW1A5QiXKeyh531mXd63qzNwVrO7RqKEDy2bxKvGx3uIPQRUiB7NB6vWtUWmrKYeU52edz9F30Rb9ItAkZgkfWgjy3JWEkiUtBGcf/iaSN5Zee6eQRlkWZgMr1wKSgEMOaHztj3xbSOYUiQgMzHGkHuM8iM2JIs/N7iJFx98hQSnFM70UZ8Ze2L39SmDPRac+1mZt5P/WBhyDEFy9efX7TBlzNiaYm7Lli64tqiJBui0tHgaEmrrtvZRNgR52wm84pLTXomTQEWuC+2HMfxeqDtNDhk+ciOzzsZhJ22593E+S735mdA4EFOHpkIZnk5rNlmHuXIY6FnXuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=o8JsuxeAy5vnVIU4V8BnK9fvo7/BQ0f4xXGJgiZd1xk=;
 b=YroRn6j6aWST3aVz1DWwYNu9LWQwy9SnAZ+tDWaEOoP1DFQkIsKiIrHudob/+9PyhczqO2fzcHWTgB3xF3ZgB+69peisjiBs5jCxBoanRT8z6eeXe0Y3vHLEaioo25oaJuBaEbqN6GtHBcECHxq/BMSOVs27wIReDq/yJ92GZDUo964BMEtrD9lhsMYPDGShQXjOlFnjnEhHCRCqHgBU13LYOvuRtSDweeE/4W114BZ5TOkrxjbxrvOTAopPZCfAW7YJ+WS/DvSGFyIjvbcUY/v7yt2E8SxAa2BPQnx2A5WM3zSYoqRB1SahWXUjVM50MKbW/0w8/9zNrRzNMaEHtg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=o8JsuxeAy5vnVIU4V8BnK9fvo7/BQ0f4xXGJgiZd1xk=;
 b=yYZG7nHEGSSy2o7mAq28azO3gNUGgZ0nY0UIV9kR+GqyYg7ph4ZN53aDTEMWDQVh5+zygzRWIM/5QG6QZrGILh1kb9j2nK8fMOJtAXXbbUPKz2PKA8UTeRKhndQPfY00ZsYeLJdB5teKMDiVanFY4JnlHFNDUAR4lPoyrRqTyg0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by MN2PR12MB4222.namprd12.prod.outlook.com (2603:10b6:208:19a::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.27; Wed, 15 May
 2024 07:20:44 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%2]) with mapi id 15.20.7587.025; Wed, 15 May 2024
 07:20:44 +0000
Message-ID: <8a689a5a-b408-41da-b7bd-8c7a3b2f2ac7@amd.com>
Date: Wed, 15 May 2024 09:20:37 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC 2/5] drm/amdgpu: Actually respect buffer migration budget
To: Tvrtko Ursulin <tursulin@igalia.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Cc: kernel-dev@igalia.com, Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 Friedrich Vock <friedrich.vock@gmx.de>
References: <20240508180946.96863-1-tursulin@igalia.com>
 <20240508180946.96863-3-tursulin@igalia.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20240508180946.96863-3-tursulin@igalia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FRYP281CA0009.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10::19)
 To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|MN2PR12MB4222:EE_
X-MS-Office365-Filtering-Correlation-Id: 312b9667-baec-49ea-a257-08dc74af88bd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|376005|1800799015|366007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?YUR6WGk0Ukw0bHFiSCtiM1BkY2JLTmRIbHBhczcyYTY5cjFGQ1RPU1REbVJO?=
 =?utf-8?B?Mkx5NUNUcjA3OVZjZjNmNlk4d0pMVnhzLzFBTmxnTlZ6RkhpdkJzQjh3T3du?=
 =?utf-8?B?RVlqakNtMENZM2VHWFoyKzBGcG5aN2lPWFIxOFVtRDhCU3BZemx5Y3pwRGFz?=
 =?utf-8?B?NWw1bWJhVGFCNGxtaGZWUm4zVURJdktVZmk3NW0vNmttREVjUk5Kd2J4Y1BL?=
 =?utf-8?B?aFdleFFZMzliTjZsaTEyYWZVekdUSlJKLzBJemxMWTFTck93bi9zQno3aDFO?=
 =?utf-8?B?bVhWSFJBaFUvTWpPWGc4NnJCNk1HdVo0U1JaQXpNSHJxQkRnNnN5VlIvVzNN?=
 =?utf-8?B?TVBCazk2KzduWTJpZXFWSEZTZkJqQTFVR1lpWWNaSENoVWhtODZZV1FQZ2dx?=
 =?utf-8?B?c3B3ci85WkJHWW1XY2grSW1lU1hzUnhrQTVjMHp2cm5WMllBK05aMzI3dndJ?=
 =?utf-8?B?enovTXkyY3d5QkgvSFpLNmZYenZ6clVMTHhacWhXSUQxZ2M5WVF4cXcxMkts?=
 =?utf-8?B?cWZQakRKUk9tN0lZeU03WEdPenZoV3pzYXp0VTVaYkxSTThoVlRxcTh1NUZV?=
 =?utf-8?B?NFNPOENOdWozTUdxcUdMbk9jVHRpSDBsSUhOd2FpNEMrUHBCaGM3U25MM0JF?=
 =?utf-8?B?dTA1NWxwNUNpNWN6RGZVSXZnc1RGcDZWRDdFbnNkRXJySElQckxobkpvbFF6?=
 =?utf-8?B?cGxUL05ZVmdLdTkvdnRxK0U4UGtmQ3VuRFVST3lEL1FPS0pTSzh1VTR0bndO?=
 =?utf-8?B?NzdlSDRQV2J1SUh5ckI4K29IMkJKZW5jRDRqcG5JbUg0YzhqZzdlWEZOdHZL?=
 =?utf-8?B?SDNNS1FaZU95K3BkNU94aktqd2lIc3BLT0dyTXNmV3pZaXF6VzNEaDdoMTkw?=
 =?utf-8?B?RTZjOWpzOTlHN1FQZHFyN1o0YmVta3hRN3ZNZkRNWlRtaEIxNnNmNkVNRVNL?=
 =?utf-8?B?all2ZE4ycExLMWl6WE40ZzBNQlI3czVRbTJaNWVvbmZ1Nm5HdFFmV1k0Tk1N?=
 =?utf-8?B?VUJVeDRrNGdRZU1SY1Q3WGw4ektSejFveEZmejNqbEZXOEhWaUg1TUJOeGNq?=
 =?utf-8?B?T2FDejBITUpBZEwwRkNFSzBtNEFScVNPR0k5a2lYN1VXSkRKcStOdTdXTFhm?=
 =?utf-8?B?WGJnNWxvcG9nK1VyNCtPSkpUVHQ0SmY4ck1yS2l3SXpTMWdaQXJVM3JYaFdh?=
 =?utf-8?B?ZnJyUUtMRmJXanRJaE1maEJjZlByTDQzZkFRREdiS0psc2RTemNaendCSy81?=
 =?utf-8?B?NXlENHBCRW4yRTlMZi9vWTJFSEtOdkYzYXc2amQ4cHdib0dHRGVNT1NPWUx3?=
 =?utf-8?B?cHVRcVpFZGxES0w3dkhQbVEyZWlULzE1cStvNGFqaUxkVkYzQ1U4TWd1NmNp?=
 =?utf-8?B?aC82R0t4c05oS3c1bFFMZDZXdWJtTlA2cGFjVUdTbFRRVW02WGczRWljdW0y?=
 =?utf-8?B?Z3NQWnorYjhRa21idTdjNElFM1lhVmVpTThiQTdYMVM4Nld5LzBhL2ZLckRO?=
 =?utf-8?B?ZmxiLzN5TXdVU3poeForNklDS3FSR01kK25nV1NoYmVxeVlkbC81ekp6dmFB?=
 =?utf-8?B?U3JVcUVGcTUwRExKTm4vNDB6UVBZT014OWVFSWFhMHgrNStyWGNZcFRFdVpt?=
 =?utf-8?B?ak9PMzBJZDhxQlhTbnZvYWIvVWVOSjQ4OWJUbWlJVGVLU3p6ZmlOMVJnVW1i?=
 =?utf-8?B?dDNTTHBlNXIxdHl3cVJBeXJXajVmVjBCK3ppVEdsRmhDVmdPc0dHc1h3PT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(1800799015)(366007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZitwWXIwcTJLUUEya1pRSnZUcXJ5T0txamNqa1liYzJSTE9zM1htRzB6eFZJ?=
 =?utf-8?B?WG0zRUNMLzV4S3NnYkV5QXp2cTVkZGRYb2U1YjhDVlp5THVCc3NTVHBIS2FH?=
 =?utf-8?B?aHQvMndUMXczbWtYOHBhOTMzZXUrTGVHQXdCSjVSOEJEdUp1YW56VC9IV1VF?=
 =?utf-8?B?T3BBdnVWQmRqRFlpNjRCQStsNzZPZThzcHM0azFEVDRMcnQwNzlXSUdBWVVj?=
 =?utf-8?B?eS9samh5dGRFSC8zRmRJdnAybGxLY0h4RGV2RHByVm9MRDlqQklLWkRnM052?=
 =?utf-8?B?YUZ3bThSYTA4bDZIQ0ZRYjd4UWxoQjRkaGVuQ2xGaXVvTS9lc0xZMlZocHpq?=
 =?utf-8?B?R2RUWUs1R2VyZ0R6K2hrWXJ6ckxZQzEwZzB1QXNxQ2J1aHliUmFCay9vTmYv?=
 =?utf-8?B?Y1ljUVRoK21lREMxNkM1dzNJeUlTQk8wNlRESC9xYnRMMWovTVFHQy8zWnJP?=
 =?utf-8?B?M1k2eGVZVC9kOWx0MVVMNUI0VEFtOThnSGo1dVl3QjhJREVGY0VlcHRqaEZV?=
 =?utf-8?B?b3JrZUpvRE15c3p1bXhCcTdlRWsyYnkvOXg3M2tkRlNoYUV4d2FJYk9VTzBG?=
 =?utf-8?B?TG9kWWZYOWpjODd1NzRVY3QyMzJXTndwK3FJdXphTlE2Q3hHTmRadkludGRn?=
 =?utf-8?B?VXlxbUN1WjdJU0lBQlJrYWVLVXF4MFlHMkNlb29pVCtNUFg1aFVqODlzbk1v?=
 =?utf-8?B?NlBHc2RJM2FRRHU5Wm1pOC9YckJHdFVIMGlIM3RLWEFSWFlrSTJWOS9ZZmFx?=
 =?utf-8?B?S0NiZklqbldFb2pDUHlZWWxsWWx2MkszSEpLM0ZIaHV4Q0p1Y1hBdzhZam9x?=
 =?utf-8?B?NGpwc0JGZW5RSU5WMUVxaUJYSlkrMVFhRkw2Q0s4V0FOcVlEaUt3blE4QllI?=
 =?utf-8?B?ckVxMmgrTVlaL1lFaDNNL0NlZ2tnM3Y0a1JOMUM2dlRvbVlIVytnMXhlU3Yx?=
 =?utf-8?B?SG1hbEhOemN3QlBoTnhLTUwrazZZRHJ0bDh3eWZkbG5NQm5ESVFqZDJMck1W?=
 =?utf-8?B?cGE4M05DUVpwYlZjMFVOeU5QU0tNY2lQTHhSY0JVcnhTTG0yN1VQU3FKRDBk?=
 =?utf-8?B?aU9HcC9BaGx5TFhCbUhYcmpwVWxFS1Z1bmhTdi9aQkhKS1lFR3loWDN5SHlL?=
 =?utf-8?B?RGVRZEdGelE2Tm14Qnh5aTlMSmFRa0J4cDFpOU5vSnJoRVFFNlhJZDFzeFhQ?=
 =?utf-8?B?dEpLcFRMTnlkTmRxRFYrcVlIajUwNjhZSFNHZDBMdDBic05tWnF0MXU3N1Ar?=
 =?utf-8?B?VDg3Qm5zdEtUVjZZbWtSYkFvTEoyU0M5QUZRY0cyeWwyVU1NYUlLMUgyZzdW?=
 =?utf-8?B?eGMvN29aZzdGdmhxQ2VXeEduNXVYZEtHaVJ1NGM1S1NWemRnc2Nyc1BVallj?=
 =?utf-8?B?NnhIdEVQckhWQmJLMnhRTGJ0TWNLOVY3WHJlVElnSE1JOFoyWWFPNElBdS9K?=
 =?utf-8?B?emFFSVJPaEZQUkVuZjNoM0pXUmhyRTRnL3lZT1d3MkpaK1dydEdidjN1eGx0?=
 =?utf-8?B?YmVKMGQwMmFFbm82Z3JnNVNtVE5CUHo4VzdKbmh0SThpWFFXbUYvaVdpVjZV?=
 =?utf-8?B?QjJrbE5XTFNObVRQZjRNSkpEUUxJQ0F4TzU4NFRyQ2pqZDFocVV4RkJmYmtW?=
 =?utf-8?B?WEpicXY4RjBuR0xIbWx2b3VWVmdUSWpHQVN1Z2tOaGtzQ3F4Um9VRlRkTklX?=
 =?utf-8?B?TkV2dThMdGJIRUZpWDJIcTFUM3pYdDJhaEtjYjlrSnk1cEQvOVFvZ25ZL0M5?=
 =?utf-8?B?MXpwUHZSS2E1UlByOGZpTkR1dEllY05ObGw1N1lhTERDNWtwTW80NS9uaEp5?=
 =?utf-8?B?Z0c3YlFqWWRIVUs0S1B4SUhwR0JWei9jQkhnRWthRDE5UW5DbXlOaStwZzli?=
 =?utf-8?B?dVBESE5UQVZ2ZXh6L0czMy9zK1dSeWE4OHVweElaYjJzLzRzc1pDWEUrT2hD?=
 =?utf-8?B?M3cyeGx4SUxneUNwd0kvdWYwdWNtSkJCaFNodDZnVGtpZUJBY1RTQU95bDF3?=
 =?utf-8?B?SXZPYnA4NENaREtxZC82ZE81SzJtbkJSSG43U2dTMHlpbUw5YjVxczNnYk1o?=
 =?utf-8?B?ejh0L1RzZit3MzJsSjQ0MW56MUJidjJkVjl3UE8xYzBRYUMrZUYrRjZ4VFQ5?=
 =?utf-8?Q?Py2o=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 312b9667-baec-49ea-a257-08dc74af88bd
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 May 2024 07:20:44.3457 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WuHUkfF2vZvLfNxAm/nMKCT+1FCIzmW1F5oJqteYUX+OX70Ic2LYx5BkLX0Qsa7O
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4222
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

Am 08.05.24 um 20:09 schrieb Tvrtko Ursulin:
> From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
>
> Current code appears to live in a misconception that playing with buffer
> allowed and preferred placements can control the decision on whether
> backing store migration will be attempted or not.
>
> Both from code inspection and from empirical experiments I see that not
> being true, and that both allowed and preferred placement are typically
> set to the same bitmask.

That's not correct for the use case handled here, but see below.

>
> As such, when the code decides to throttle the migration for a client, it
> is in fact not achieving anything. Buffers can still be either migrated or
> not migrated based on the external (to this function and facility) logic.
>
> Fix it by not changing the buffer object placements if the migration
> budget has been spent.
>
> FIXME:
> Is it still required to call validate is the question..
>
> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
> Cc: Christian König <christian.koenig@amd.com>
> Cc: Friedrich Vock <friedrich.vock@gmx.de>
> ---
>   drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c | 12 +++++++++---
>   1 file changed, 9 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
> index 22708954ae68..d07a1dd7c880 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
> @@ -784,6 +784,7 @@ static int amdgpu_cs_bo_validate(void *param, struct amdgpu_bo *bo)
>   		.no_wait_gpu = false,
>   		.resv = bo->tbo.base.resv
>   	};
> +	bool migration_allowed = true;
>   	struct ttm_resource *old_res;
>   	uint32_t domain;
>   	int r;
> @@ -805,19 +806,24 @@ static int amdgpu_cs_bo_validate(void *param, struct amdgpu_bo *bo)
>   			 * visible VRAM if we've depleted our allowance to do
>   			 * that.
>   			 */
> -			if (p->bytes_moved_vis < p->bytes_moved_vis_threshold)
> +			if (p->bytes_moved_vis < p->bytes_moved_vis_threshold) {
>   				domain = bo->preferred_domains;
> -			else
> +			} else {
>   				domain = bo->allowed_domains;
> +				migration_allowed = false;
> +			}
>   		} else {
>   			domain = bo->preferred_domains;
>   		}
>   	} else {
>   		domain = bo->allowed_domains;
> +		migration_allowed = false;
>   	}
>   
>   retry:
> -	amdgpu_bo_placement_from_domain(bo, domain);
> +	if (migration_allowed)
> +		amdgpu_bo_placement_from_domain(bo, domain);

That's completely invalid. Calling amdgpu_bo_placement_from_domain() is 
a mandatory prerequisite for calling ttm_bo_validate();

E.g. the usually code fow is:

/* This initializes bo->placement */
amdgpu_bo_placement_from_domain()

/* Eventually modify bo->placement to fit special requirements */
....

/* Apply the placement to the BO */
ttm_bo_validate(&bo->tbo, &bo->placement, &ctx)

To sum it up bo->placement should be a variable on the stack instead, 
but we never bothered to clean that up.

Regards,
Christian.

> +
>   	r = ttm_bo_validate(&bo->tbo, &bo->placement, &ctx);
>   
>   	if (unlikely(r == -ENOMEM) && domain != bo->allowed_domains) {

