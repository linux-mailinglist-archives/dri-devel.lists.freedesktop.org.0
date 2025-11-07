Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A4E01C3F6B0
	for <lists+dri-devel@lfdr.de>; Fri, 07 Nov 2025 11:26:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A70910E09E;
	Fri,  7 Nov 2025 10:26:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="WizSi6Sz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from BL0PR03CU003.outbound.protection.outlook.com
 (mail-eastusazon11012046.outbound.protection.outlook.com [52.101.53.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A11C010E09E;
 Fri,  7 Nov 2025 10:26:37 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Cj60ivzI3053mHY5xZJ8cAZ0OhaFc7vjFwGFmY60ngSXz8u3i4hOzv+gdsRVr0WuaZVjnUBctKTp/y30tgoeOpIt4RoSvWyDd25t1w2IFPxoaQ+V5iAUz8qaqcxR/EpfVqL95coFGCyjkKDWGGFmWJU7qEwIN50Nm7SBCtpoQmApxeC6UMvuKwTE/SNyNB2pX/otkd01VE9nqUTLAtWyOdmbhjWTYQXDRXuT9xV8EU+hcS0/UkeVpRdp1775sphwWrYx+ty8GiiOK82RXvcNFf8Q5DfA4E+aJsWeYW7RP09LPkpFuMdiRakO+Rmj6Dh6S7gYlXXxMsYtcZwNs+uO8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jnDUEuQHoaaFG0ux4+HJTJCc8Ic0r8RHkiI/yNHJ5MU=;
 b=vixCI4nzVvRcb6v6T2xSKWnrIWGp5U4IN0XtSw412l0SUvRzK1umDAp2VyooPuWuA2DsZWT9CPBnUNpNlhH1akEIpQMLKShqzzFfhKteJObd47O13DOPi7ekiResO6Z8cdM0M8dqPwskVw7cbKs4J1YJby50K57M044DTSAMfMXVkH5IfzTqjPIPrcqdZh+9L3d340tUjgePAqQk+XTFNctMQy+s76EJUAb23MLP0kgs5Anwq9HiZXTvVl1L7vmLRL0hmR2E9LwrecbEQFuXt93PxMykwZJY0P5AMPklzLsR02lt4XIdSs82u9WMYmcwWcdDhCEdPf2kvoVxOmhjfg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jnDUEuQHoaaFG0ux4+HJTJCc8Ic0r8RHkiI/yNHJ5MU=;
 b=WizSi6SzwzehplotcEpQx0H/o1JRBXQsFaCCD/5Zs15RDsVBxgwuqQBNTkBTsOvZjuV0+IU4fB3yJOt5BCVZ/DJiuStIDQuzoJ9/+09UmeItfLk3rxx7ZCnQ6R79iNh50d81htLGypPA63KW/fgZ0sufxehXX/bipvweQGRA670=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by LV8PR12MB9617.namprd12.prod.outlook.com (2603:10b6:408:2a0::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.12; Fri, 7 Nov
 2025 10:26:33 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%4]) with mapi id 15.20.9298.010; Fri, 7 Nov 2025
 10:26:33 +0000
Message-ID: <5717c024-0200-4b23-a25b-681ef0937d6f@amd.com>
Date: Fri, 7 Nov 2025 11:26:29 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/3] drm/amdgpu: increment sched score on entity
 selection
To: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>
Cc: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20251107090425.23199-1-pierre-eric.pelloux-prayer@amd.com>
 <20251107090425.23199-2-pierre-eric.pelloux-prayer@amd.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20251107090425.23199-2-pierre-eric.pelloux-prayer@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0091.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9b::10) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|LV8PR12MB9617:EE_
X-MS-Office365-Filtering-Correlation-Id: 3939b41c-071d-4cb4-3aa5-08de1de81f74
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?WVhUN0hNanVqajNaWWpFRDNNb0hmazdIZ2hLL1dudkhqSDdhemxoeHpKQnNz?=
 =?utf-8?B?aVVWbjFWemNWeWljdUVYQ2dWQlk1SUdPRWVHUzJRR3dDYTNuajk3WGo4V1Vy?=
 =?utf-8?B?eDZKRHE0UklnbWRvVllCMHFQckxBajdldG5IaUJZZUttNXdsYk0wYW9pUDg5?=
 =?utf-8?B?ekhVMUxPMEV1ZGlWbW83SXBNSXhIbFRzRC9SenZSRVlGSGV3RUNGcVB2S2tG?=
 =?utf-8?B?M1NPcjk4N0RGYzJBMDc1d1BtS0M3ZllBRHJ0ZTNIN1ZBNWJUU3FaU0VrTDBw?=
 =?utf-8?B?Q2JnWWxRLys4ZnZ2dHBMa2Z3bWxPaFN1OElac3F5N0VGbDk1QUl3MmFzcU56?=
 =?utf-8?B?SDdsMEw0N0hhUVl2ckdrdkdiRFVkUnV4ZWhNMm5adG81TU1hNGRGYVN3bUxJ?=
 =?utf-8?B?WVhTSE9XUE43dHdhWngyTVdrTG5YcFNoUUhPbSt2TUNkdVJQNE1OckZ3SDVt?=
 =?utf-8?B?dkpiVHFKMXhRVGc3Y2RXbUtUOXN2MFpsaCtJVjhsNGxONUN3UVE4TFdoRUxh?=
 =?utf-8?B?ZkdTUkxoMWsva2tyRzdLWHNldndvM3FISDB5bkF5QUMyakhXTllIdG56TGFt?=
 =?utf-8?B?Z1BKVzZOSWhqckNIVGFRVU9VRWMyYlZlVUJYRWVDcGxGWno5QnZqMU02WFM4?=
 =?utf-8?B?bEpkQkZEcEI5MVhJUWY3Q2V5QjJLZjA4aXUxUXVuMnVDNzkrUjlKSkFEVlhC?=
 =?utf-8?B?M2ZMTUJETzFWM1ZIbXBEdFE3YjE3bTVka3ZCeFVqcGN5c1hWSVJJZkI5WXY1?=
 =?utf-8?B?Z1pPQWxVblJFWWF3K2ZqRHhpbDBvNUwwZEQwYmNiQStNZGRRejNPT3ZkK2RX?=
 =?utf-8?B?R1ovK1lZcEdyenVWR2NQL2M2eUpkQVhCaitsUzRCQVVPMTgrZW5ZUGNWNzNM?=
 =?utf-8?B?UWEySmY2cVQzVEVQVm8vOGhIR00rdTRsbzdCb1JkQkZOZjdBZXJLTkZkWjdI?=
 =?utf-8?B?ZzVPeE1KcWZXdFE2UGljNlNiR3dYNndKckdMaUdTUWNvMWxLQW1wWHdraGNP?=
 =?utf-8?B?Y2QwamlPam44TXFMWHZiYnpSckpGSGZQVnlONURFR3ZUMmh4bVN3Qmowbm9l?=
 =?utf-8?B?QzVBSnl4TGVFUzd3QWNhWnE1RCtiWkRuaUNSVnRaak82RkpZK1pZTHkwRFh4?=
 =?utf-8?B?aGJzbVdPSFVtSnVQbVNPMUF3Umtha0pwdzVQUmZ5aEpkeWZ0a1IySkU5OGh6?=
 =?utf-8?B?M3NhaThCcHR1WjRtaVpRT1VjZjRaZXdlSC80QlJQVzhyajFaZlN4RHExM0xW?=
 =?utf-8?B?L1NXUS9WNm8rNW4yS295YlVsNTBqWEFuYzk0M2FnT0dxQkYvWnZodEFBQWtO?=
 =?utf-8?B?ZTRQN3QvN0RaSjhoN1dGcVFNTGlONmRqUzhieGliREZSeFUrVTE1b2lXNVBI?=
 =?utf-8?B?cEhvd1Ivb3o5dy9Ga2V0Z1E5dVFuN0lsVkJnVUYwb3o4R2lMcHZmSytKWC9K?=
 =?utf-8?B?ZXk2ZmtWNkdEZlVSajhwTHhXL05ZUER6YWI1OXIrdGhsZjFZc1lFengyRzE3?=
 =?utf-8?B?RVZuK1lRWnRkWS8vMGJYbmd1dzU5MllkcTJMNnRFQUFwMmZTS1h5S2tLMExu?=
 =?utf-8?B?SlIxWHpOUzREc2NiQ3JYdndHYWg3cjIyQjJqTmRCSXVZK2RnOHBLY3JoNVRh?=
 =?utf-8?B?bG54SUZubjJYWjJnenZOeE5lMWRsUkFjMVE2eVEzZ1ZOMHVxNVptdjdLM1Bi?=
 =?utf-8?B?WVVmSUVEOWNlR29aVFphNXBxQmo4YWZTWnNNNFUrcTlISHhETTFQbzlqNUJO?=
 =?utf-8?B?YS83M0l0ck0vUmJJYlZLS1FPakFzU2dacXFiaStmbXJvRDVCcWFZaExaMW5n?=
 =?utf-8?B?YVU5MFQ0UEhQMldjU0hwa2Myb29JK1l2ay92UWxQZm5oVVZOQi85ZGtQNEJO?=
 =?utf-8?B?RGRkWVJTU0FFb1YwSW5kV3h1TnRlV0NvcUhnaWoxcW9lc1JZU1BFRG05ZFp1?=
 =?utf-8?Q?Yzi25bxK7sMz7YKzlqMi6PLqbqytLmzJ?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QTN4V3BMNWtuSTZyMXpMWlJySEpxcnNGclVLV21GckMyaEhYc0ZwRXAxMjd5?=
 =?utf-8?B?cFYwalQyZjErZklTK3pQMWszcGtGQzI2N3c0N0RkM0RwMllpanQybzh5M0k2?=
 =?utf-8?B?eTVxY3ZaYkkxcTFDM00zZ0g3THBtTHFXcHlGelFxM1Rld3BkUUcwWUVNUFBS?=
 =?utf-8?B?bWk0ZmZZVkZRbWF6Tmc1ZHIzeWxUMWJybU42dGUyenQzVU9tK2VkUGEvZjFj?=
 =?utf-8?B?UUFkbWJBdHNFMGxUTkNXR0FBZkhaa2llL2p0VlBPYmJVeEpWVkdSTlQvYmdx?=
 =?utf-8?B?bWNQMkc4cE1BK0t4a0JLM25tWXZPd01EcFpjRk9KRzVWSTNYRHg5YkpvKzF5?=
 =?utf-8?B?VVEwT0xyWW1EcmtHcVF5UVM2czNVL3ZPWXRtYjd4WDNFYTFTV3lqLzNKTkll?=
 =?utf-8?B?MSsxY1NCTjhyUnFsaDBLdDZXMFYvQkVlc2ttSURlOW5aZldLbHA2V2U5OEFr?=
 =?utf-8?B?YjZBQTFCK0VEWVVEeU1Ba0xkenNKcGFkSDE4ZFdUWjd3QkpXcWhiLzZqVkhu?=
 =?utf-8?B?WTJPZnkxcTJaaEJZeEVKV3Q0UVhaY1V3ZW03bStJTG53RnVxWUZqZTh3WjZV?=
 =?utf-8?B?RW9qa2k0ckNwa0ZnOTE2VDlIQ2lIcDQzalNKaTI1Ykw4UndpdGg3ektSSGZy?=
 =?utf-8?B?djlMOEhrUGNJMkczMjdWdlFyOTZVa3NZMTBFOEQ4b0JGK0pHTU5iVTJ1d1M1?=
 =?utf-8?B?MXh3RDdObnpHTlNsSjg0SVNrVkp6WTBid1BwclNndHB2Ykk3QWJYYWN6RTRr?=
 =?utf-8?B?VUhMeXNRS0xDdUtsN21PVFBkRmFvaFNRSkJxMGZySzdYMDI0YXVua3VsQlZo?=
 =?utf-8?B?cjdDVkdlVVM3NWlzdG9iTmk3VlVzN3YydXM3TlZaSlloK2tmcVpaRUZ5aWRO?=
 =?utf-8?B?RDZwVm5wM2xJV1lWeGxIOUMyZ3RmU3BDcHZxNTdxS3kyUVE1eENQa3RuQll5?=
 =?utf-8?B?U0xmaEc4ZGVYV2V4bGFGQ3lRRGFQNTFXYmVBZWlnaE9uWThZUUhWOCtOVTNV?=
 =?utf-8?B?bllLamdqZ3BNS0xCQ2orazYyNlBmUGFBZmtBK2dBVTZ6R1JqMWxMREhOSHdR?=
 =?utf-8?B?UGs1SWwrSWE2QXEwcjZ1bVpLcGlHaCtkeDhKUTQ1Ni85SDM1WndvZllxaW9a?=
 =?utf-8?B?RVV2USs4SG8wbXlQRko1Vlc4WDJ5KzhNbEFOVitiZ0pwc3AwVWVrcmV4Y0or?=
 =?utf-8?B?SzczV01NbjZFLzRFMjlUdEhySldteHlaMmpTQ1ZiNHA2UFZyZWU5N2RhYXhB?=
 =?utf-8?B?V1pQd3gwN0syNTh4d05MNjNPUFBaNE9NejQzbkpqbGJudytrWkN4RnV0ZlR2?=
 =?utf-8?B?VHRLL0EvcmJpclF3USthd2U5S0d1VzFIMzVCeUlhTDJadVNZQ2xJS1ROWlB5?=
 =?utf-8?B?RDVyY2YxZlZpWU9QMzdldjlDMjZMK2MyU3hrUVZ4eVU1NHVJMjF4UDJtR2Fn?=
 =?utf-8?B?UndyenJzZGd0UkJiQlEwTUR1UHNmQVZ2WGFESFNoWi9ORndoVXhUVzVYbitj?=
 =?utf-8?B?SUhXdDAyNVVzOTBENm5iSit6cGJySzl3M1FEOHNVN1FhTUdhQWdjZXFmZjVn?=
 =?utf-8?B?Q2tCMWxxTExUdThnbno5RU1BOVFQaDRLWHY3ZU8wRGxmeWZqOGtiVFNJUkhj?=
 =?utf-8?B?dE5RR2tzNUlBSmZ0bzRKaUxySkRjS1ZvWHdUbEdQUnhQWis5Ly9yR3UzV0h6?=
 =?utf-8?B?SHB0dEQ0TXNkOHJHK0NWZmJwQWh1U21ZbFQzeFZ3MGpQNTlpWndGcEVDTFk1?=
 =?utf-8?B?NTFYUjN4VWFUU1FnN2pTN1pWRGJodlh5ekNCZXI1WXdrdFVNUFRVVjk3TmhP?=
 =?utf-8?B?cUgxc2VMNVFLNXFXaFVTek90bmdoTlRrMURPaFlWeG9DZklRZCtvM1pRNXEv?=
 =?utf-8?B?QUgvS3ZyV0YzOVhoUFltK25PSFErZ3ZhZkZ1VHJzSHVrTW9tbTFiOHBlL3RZ?=
 =?utf-8?B?Mkl6SEtkYzJ5Qk5hNzgxUzlDMWorYVl6NkZ6STVFVW9HWkczWGFSOHVaVGJs?=
 =?utf-8?B?RE01ckc3K0JwZWVhYzhVTE5HZEFtazdTR2tod1pDN25STHJ4NmhDM2JHVnRs?=
 =?utf-8?B?ZkM2ZmVyK3lXQytmcWRJeUFsQmpwcFJOVm5qMkRlTVpwTUFWV3hGM1pmdzc3?=
 =?utf-8?Q?EYYJGTELM/jmO2qJfNW4PWk8Y?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3939b41c-071d-4cb4-3aa5-08de1de81f74
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Nov 2025 10:26:33.3014 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XypN1w5cGJniar1wYZQwsSQLHeo4FNN1XfPrcQLiAvcF7xUNT1QNAiM0jTCllpZN
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR12MB9617
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



On 11/7/25 10:04, Pierre-Eric Pelloux-Prayer wrote:
> For hw engines that can't load balance jobs, entities are
> "statically" load balanced: on their first submit, they select
> the best scheduler based on its score.
> The score is made up of 2 parts:
> * the job queue depth (how much jobs are executing/waiting)
> * the number of entities assigned
> 
> The second part is only relevant for the static load balance:
> it's a way to consider how many entities are attached to this
> scheduler, knowing that if they ever submit jobs they will go
> to this one.
> 
> For rings that can load balance jobs freely, idle entities
> aren't a concern and shouldn't impact the scheduler's decisions.
> 
> Signed-off-by: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
> Reviewed-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.c | 22 +++++++++++++++++-----
>  drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.h |  1 +
>  2 files changed, 18 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.c
> index afedea02188d..4d91cbcbcf25 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.c
> @@ -209,6 +209,7 @@ static int amdgpu_ctx_init_entity(struct amdgpu_ctx *ctx, u32 hw_ip,
>  	struct amdgpu_ctx_entity *entity;
>  	enum drm_sched_priority drm_prio;
>  	unsigned int hw_prio, num_scheds;
> +	struct amdgpu_ring *aring;
>  	int32_t ctx_prio;
>  	int r;
>  
> @@ -239,11 +240,13 @@ static int amdgpu_ctx_init_entity(struct amdgpu_ctx *ctx, u32 hw_ip,
>  			goto error_free_entity;
>  	}
>  
> -	/* disable load balance if the hw engine retains context among dependent jobs */
> -	if (hw_ip == AMDGPU_HW_IP_VCN_ENC ||
> -	    hw_ip == AMDGPU_HW_IP_VCN_DEC ||
> -	    hw_ip == AMDGPU_HW_IP_UVD_ENC ||
> -	    hw_ip == AMDGPU_HW_IP_UVD) {
> +	sched = scheds[0];
> +	aring = container_of(sched, struct amdgpu_ring, sched);
> +
> +	if (aring->funcs->engine_retains_context) {
> +		/* Disable load balancing between multiple schedulers if the hw
> +		 * engine retains context among dependent jobs.
> +		 */
>  		sched = drm_sched_pick_best(scheds, num_scheds);
>  		scheds = &sched;
>  		num_scheds = 1;
> @@ -258,6 +261,12 @@ static int amdgpu_ctx_init_entity(struct amdgpu_ctx *ctx, u32 hw_ip,
>  	if (cmpxchg(&ctx->entities[hw_ip][ring], NULL, entity))
>  		goto cleanup_entity;
>  
> +	if (aring->funcs->engine_retains_context) {
> +		aring = container_of(sched, struct amdgpu_ring, sched);
> +		entity->sched_score = aring->sched_score;
> +		atomic_inc(entity->sched_score);
> +	}
> +
>  	return 0;
>  
>  cleanup_entity:
> @@ -514,6 +523,9 @@ static void amdgpu_ctx_do_release(struct kref *ref)
>  			if (!ctx->entities[i][j])
>  				continue;
>  
> +			if (ctx->entities[i][j]->sched_score)
> +				atomic_dec(ctx->entities[i][j]->sched_score);
> +
>  			drm_sched_entity_destroy(&ctx->entities[i][j]->entity);
>  		}
>  	}
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.h
> index 090dfe86f75b..f7b44f96f374 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.h
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.h
> @@ -39,6 +39,7 @@ struct amdgpu_ctx_entity {
>  	uint32_t		hw_ip;
>  	uint64_t		sequence;
>  	struct drm_sched_entity	entity;
> +	atomic_t		*sched_score;

I would rather prefer to not have that additional member here.

Additional to that we are messing with the internals of the scheduler here and should probably have two clean functions to increase/decrease the score.

Regards,
Christian.

>  	struct dma_fence	*fences[];
>  };
>  

