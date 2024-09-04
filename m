Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 74E8E96B577
	for <lists+dri-devel@lfdr.de>; Wed,  4 Sep 2024 10:51:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 77EFF10E6FF;
	Wed,  4 Sep 2024 08:51:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="IpLB7brH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2056.outbound.protection.outlook.com [40.107.243.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 76B4910E704;
 Wed,  4 Sep 2024 08:51:04 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=w73VzSdmyskqtUBhinvKxc17L4U8bFEnB/yGAOPfwWN5q9glAIUOQ9vC1dgmlGMolnCGI5e/8cMvwX5N2WYbPkXMXdnYbXFu2P+j8UZdHMu29b/WXhcHipGfPKgpV4ww9G63U/wjO2RXQWjWPTKhe4T/FWe1kQECxQc9H5e+CIZlwwlEVArBAOzGqh3qyMwX0FFlENLoOVLZo/DEz84Rdstl4QHpXlmuVzd4fehRhEBzIeS6IWLs8aCJMlVnxDDQnDSzOZcu6peg7ujx3eJIZESc4iPaWTqQyNjTOaI0wVSMdtAWwba4EHvnxmguskKPvRj+SQ4pqc1AH51VGadrqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KWR1WfvziYlEztcVdG9DP6jnVIE+p6MMyZETs/zLuPg=;
 b=fEnNjzAxZcyofDp3EazvUZbjkkEWhtFLT9b5ynpFsOnGxsFZ5pG6j4UQsbp9u+sg5TFvomW49I8KEErUy31N/JAUw0RTrySyze8TMQ62nH5v5qORDU8moPOPyi6ybwGprJUyJMWrK1vyrN3YHfn+GDbL/sEp6NOnN7DN22PsFcn1N5dMCW+VCy579oaWasOoQQjAFXGlj4xGqsMNETcAc7uN7qpZcIi1DhtPuqwg8ESCxtOe6zywG6f4dWOCz6z9s95rw3/5z5cSl5rHtBpiEFQ/sQSGbllKqDOQglZ1TJR057K8qRWIjl3/J9nP6E4/6k1ICAa8o4Ej5u24+o+KIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KWR1WfvziYlEztcVdG9DP6jnVIE+p6MMyZETs/zLuPg=;
 b=IpLB7brHHj6+AQQN7lYWKVo1yCwLiTzVkPvS6hNcd4w5IWOkRg+Q4IT3bMiJWzOd3xPv73x5/ZPxghUISpB1vDF5/qxlkQK9eG2yIr8YggfpvJbH7zN1d8oaSDgVn2L7n7ZdFvHlwTqy0gp5MdXs5jdm+gpOs28TpvAK/898WQg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by PH8PR12MB8430.namprd12.prod.outlook.com (2603:10b6:510:259::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.25; Wed, 4 Sep
 2024 08:51:00 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%4]) with mapi id 15.20.7918.024; Wed, 4 Sep 2024
 08:50:59 +0000
Message-ID: <91936a3d-b8c1-41f6-95e0-870fc1c2d007@amd.com>
Date: Wed, 4 Sep 2024 10:50:54 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/2] drm/ttm: Move swapped objects off the manager's
 LRU list
To: =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 intel-xe@lists.freedesktop.org
Cc: Matthew Brost <matthew.brost@intel.com>, dri-devel@lists.freedesktop.org
References: <20240904070808.95126-1-thomas.hellstrom@linux.intel.com>
 <20240904070808.95126-2-thomas.hellstrom@linux.intel.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20240904070808.95126-2-thomas.hellstrom@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0231.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b2::11) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|PH8PR12MB8430:EE_
X-MS-Office365-Filtering-Correlation-Id: 3e31ef1b-8eb7-44ea-a726-08dcccbeb29f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZFY2Y1pUTzdwTGpqSGoxNDFQRFJSWVBFeVRQQW43TytUOUxoUHFqRDZUZHlY?=
 =?utf-8?B?M0ZWSitnVTk0ay9STkRoZ0hmTG5ydzlnaStBNGtOWEtWOVNOWC85Q2pUaWJF?=
 =?utf-8?B?SGc5aE1XTENDTEh1Y1o1Z3Q1em9BWmhJdVNXRTNYdDRja253WGs5MkdhWGdQ?=
 =?utf-8?B?Z1RNeldrQ0Q0blpyV0g3a0ZVNVFMVk9VTW1YZTN5YUVaakIxOUxKcGNuQ0ln?=
 =?utf-8?B?anNNUk5BS3BISW5oZ2x0VnZ4aUNZK0NlaGE3VGk0T2ppa1NHMmVybDNENkJq?=
 =?utf-8?B?ZEYyb2NnQXdQS1ZoSnMvdVdHSXg0a2g4ZHhZc0cwU3JNQksvZmlYSVJwRHl4?=
 =?utf-8?B?Y05oVitFRDYvL2ZYL0duOG1HWjNWOEZ5cUo3RzdyWEdISDBXZTRUOWtDNDZF?=
 =?utf-8?B?T2RTNEdKTHZONHdqSW5GNjF4YUpUcHZ0Z0J0dDZ3SUtrVVArN21lYndJaFgx?=
 =?utf-8?B?Yjdnd2UyVDJoS3dkWE1kYWw5NTdXcEVNN01hZEZqdUF1ay9GcWlhNzJEU1dp?=
 =?utf-8?B?VDdraTZpR2FYakFxa3YwL2FsZktJMENSeGFOSEs1SVBhQnQ1bUxFZ1owYnp0?=
 =?utf-8?B?UzUzV1JaTDBNbXF1bC90UXRpM0pDY3RaQ25Bc29vOGJoeDNCd0ZBTk52ODB3?=
 =?utf-8?B?amx4b3FhVi9mYVJPanp3ZnVNSE5MOWUvbU53T2dXaFV2cDllQVBud0tDbERw?=
 =?utf-8?B?RExJcXZldzVTSUh2aExjQkpJR08zUEgvWTRpNUJzSTViN2poNXBWQzVWbjQx?=
 =?utf-8?B?cnJxOWN1VS9sdU91TlBoUzd6TDJnamxWQklpZ0s1RWEwZG9ZbEh4SWNpUTJ2?=
 =?utf-8?B?UTlsWFNsMnVIM0c4T3QwRElRUFVqVjhxWWdGaFd6UzlhVUZLeEJKdGJvZDky?=
 =?utf-8?B?RGRMeENTcmh6R0pqYkdTTmlQNGFmYy9sRTgvV3ZDUGFVdFJObzlDOEtvZy9W?=
 =?utf-8?B?bm91bm1rTGxWWk4wa0NhWHZFU0grSnFEOXJXYkpsTkYxd21Ba2k1eFpEZHVa?=
 =?utf-8?B?Wlh4UW90Ui9zeDNIdnFFemxjZDltNTZ5bnNITU13K2poWnpvUWFQakNYS2JW?=
 =?utf-8?B?Z2pHc3IwYnFwTU9aeEJaMG02MEsyUXpXWjdIRjVPUE54UWREUFdJSGlSZDZl?=
 =?utf-8?B?Y1B0aEtDZytSSEcvRzhJb1hwWXNEMVhGOVJhUFN6NHZXWU5SWVlBVVU3TzdC?=
 =?utf-8?B?aG8renJ5ZCsraFBrWG54S3lqb2JoZk1Qeit1eXU4QzhrRkl0K3dCQ3FuZUg1?=
 =?utf-8?B?WnBGUDA1bDNJdWt0aTVTNnFJYzZyNnBMRUdTTDFLQmd6OG40WkduTW5vMnlJ?=
 =?utf-8?B?SDg4WXZ4Z1h4emhxQ3U2RnBWbjdrL3NjWi9veXltZVJnbnlIZGpuUGMxWG96?=
 =?utf-8?B?a0UzTklnemZ1UXpHb25vZ0I0KzMzRytFRUhERTVyVnl5T3kyV3ZVRzlzRjFH?=
 =?utf-8?B?c09qdTJ4VThkR3FPSE16RXBoTlZlL2IyR3hIMVJHR3hoSXdNcEZzazBLbElm?=
 =?utf-8?B?dG9PRXA4U3F0Z0NYRUl6bEtkRXh1RWgycmNOdTJvQ1pjYmF2MVRxcFVIUGQv?=
 =?utf-8?B?ZjlQS2VtMnJ1L3I2Y2IyNmNaY2w3OW5ZaW9RK1JtcWlTNkpMTG1jVkFmVGJW?=
 =?utf-8?B?WEdhMWhtZ0VqSnVXNlczcDRiaklxbGNPaXg5cEpGMHpkVm1vajZBYkc4cmxn?=
 =?utf-8?B?S2dvS3NBelIrUm5xM0ZtVHlua2Zrb3kvcEc1b0IzRFdUYWUrMXNoSTNFTG44?=
 =?utf-8?B?Ny9UU3MrL0M1bUY5elhUUkhVd3JGTG85NC82N2VFMWprUHhUOE9MQjFZYk1N?=
 =?utf-8?B?L2JkclMvMTFFQzlJQkhmdz09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Ky82Um9OaGs4T09Tc29FVlprSUZSOTZyajF3Z2MwZTIrL1dGMmtaNVdUZHVQ?=
 =?utf-8?B?N1VMUFpDY2d1cllkUW1lcytPZGlGQmx3eHRSMmZlUVY1dHdDVzQ4cEVNc2d2?=
 =?utf-8?B?bmExNFhTYnNiOUhVczJYeGtrUThPWWE4Q0x0b2lDTWpCcURwdTE3TVF4N29Q?=
 =?utf-8?B?VDdFbXNZbW9iZHE2VUtxYXI5V1hSWGtWWGhKNndOWW5KQS90STV3WHhjVlBm?=
 =?utf-8?B?M1FrZVIweHVTTUY3RFg0NDlZWUl1REtSK0JDRHdWaFNTZm5qREdRcHkxL3BM?=
 =?utf-8?B?Z1J5T21qb0pxTFlsM3dQbEZkK25weXQ2U0dyQ0U2a1dBYkU2VWxsZzJOUjlx?=
 =?utf-8?B?V3BucGpBbURzUjg0MlA3TzVReTJ6WEtLRGRkZithVElMdHBYdjBxbTl3NkRu?=
 =?utf-8?B?RkE2dklPdE5uR0R6RmJIaWpwT3hJajNzSGFJNG5MWDVGaDNWLzVXY2NoenJC?=
 =?utf-8?B?a3M5ZEZjbm40d1drRmZUZHREMEl5bzY3U05RYTZJeXBJaXpDSlZuanNjME5Y?=
 =?utf-8?B?Rmd2OGJTODNQbWhuZHo0RW9pUTBOakgyZVdGeXk3SkVIRVFMVmxOdmtEWklV?=
 =?utf-8?B?anh4alpPZkdiS2htbEhSN2UrQnVQWFhQSE9ZQ2hzSEJCMXFuVE83cnlneGo1?=
 =?utf-8?B?bWJPVFJCRHkwM2xEam5ic3RPaDREcFNXWDVQbm9IeFJKNTlVajQwK3RIaUVz?=
 =?utf-8?B?eEhseGcwODExd0ZkK2NaRUFlSXVXQjZxWnNKVkhwRitDWUp3bi9OMFhjZ1V4?=
 =?utf-8?B?VHlGdEtiZkJtQno2MER4ak4rTGRuL3ZoNnRBV1BBWCtvU1l1aTZSb1c1K2Z2?=
 =?utf-8?B?N2I5QmxGNkpTb3lmUkZmbU1uaUwrdlZCdU9iTWZnU3FVek8vRTVkcmNhdUFJ?=
 =?utf-8?B?K3ZtbmhEYW95Z3VsMHBVSHF0Z2l6eE9RcUY4UUxRcm52ZXFxMm43ZTBmN0Uw?=
 =?utf-8?B?YWtCNUpQNG9LUlBTdUdFcVFCMHF5SnNFY1FteVdSVm41TjJQem4rSlRMZUV1?=
 =?utf-8?B?MU5HTmZ2RStSN2VXZmxjSWNMbkJzd3Z4V3FuazV4SXBjK1lUZCtRMDBkZGIv?=
 =?utf-8?B?bDF3c0lDMTdwVSs5U0ZYR2QrMTdWQmdsWDEzZlV3Q1l1bVhNYmNYVXQ1bHhY?=
 =?utf-8?B?TzN4NE1XNEhueVYwYjVlMW1OcXRTVklhQ0RYUXpZTHZQaHVHUzlya0Vqb0hl?=
 =?utf-8?B?VDRBbmR4UzBKcW12cUJaWTNWOUhTczNxMzZseWdHUm5RRUV5d0JaRlcwU0xI?=
 =?utf-8?B?K1RENFBQaVFuTE00TUZrMmlHOTNITHhrUklvS2F1R3FqeTBXR2c1V3VCY0lr?=
 =?utf-8?B?NGhnZnNaNDJWYSt0MXAyWWRpOU16cTYyZU0yUHZ1ZlBVL3BHb2hRUXdEOVZv?=
 =?utf-8?B?MFBUY013OUFmTnZ4R1Zod3ZHSFdTTTNXUTBRYlJYZzUyaTVvS0hxVFpBdUNI?=
 =?utf-8?B?NlpxYlJNcHpWZ2RmSWF6ZHUxOEJmS2E2SWUzcWFLZjllK3BPaFB3RDdvbG1l?=
 =?utf-8?B?TXJiYnlYRHQzRTV1TWhMMWk2Y200V3QrVlM0aTBveGxvcEVZVTl0TnhIQjM1?=
 =?utf-8?B?VnVaOHdoc01EREFwNitERklIMnltVUNGQXhhdFpVMVNvL3dQbERkUDNrRDdL?=
 =?utf-8?B?VFdPV0NhYjU1MUtuU0phUkFIdnpBRGlLTk5mNm5pbUlrT1p3c3VXRFVoMXRr?=
 =?utf-8?B?L2doUHFhSEQ4ZFBSK284dzNld0tNczJDV2Z3ZVBBR0FkVTYzbGIwamdNZkZm?=
 =?utf-8?B?ZXdVcElSMFRPbjNnZzlBRXpaaWlHYTRMTmhWZDVTMWVBbmVLSXI4UFk1SmRt?=
 =?utf-8?B?aDRqMlZTTmo4RldEWW1qL3lEWVNHbU1ZaHpKZ2dsMU1rTmkzVU9WZFdOY2Fi?=
 =?utf-8?B?RE0xTXRSSXJjMXRPeTkyRkJXVUtIaHYxK3lhMS9kWXVrcFJ3OEE5YVEwc3VV?=
 =?utf-8?B?Qm1uQWZhem1XWnJQRVI2b0hCaTB6eU1ZSXFlQXNjUkMyT0lJdUNzUy9QZkRH?=
 =?utf-8?B?MG9jTzFOZEhoU24vTUxNb3pHZXcraEtYaUtaNkkwdHgvZWNDVW8veXl0NU5H?=
 =?utf-8?B?RXFYcG9EZWtURXpobkxTbFMrd2ptL0JESnBra2M4czlKaDZKYmF5OXRJOHhV?=
 =?utf-8?Q?FUpKv2dlZIrYnGWmEaahTjc/s?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3e31ef1b-8eb7-44ea-a726-08dcccbeb29f
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Sep 2024 08:50:59.4879 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ASzxN2Q/i8Voj45qndbkN3omSP97n9pwJnqBZp7FO+HwrESVtCPngIVY2t+26NEA
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB8430
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

Am 04.09.24 um 09:08 schrieb Thomas Hellström:
> Resources of swapped objects remains on the TTM_PL_SYSTEM manager's
> LRU list, which is bad for the LRU walk efficiency.
>
> Rename the device-wide "pinned" list to "unevictable" and move
> also resources of swapped-out objects to that list.
>
> An alternative would be to create an "UNEVICTABLE" priority to
> be able to keep the pinned- and swapped objects on their
> respective manager's LRU without affecting the LRU walk efficiency.
>
> v2:
> - Remove a bogus WARN_ON (Christian König)
> - Update ttm_resource_[add|del] bulk move (Christian König)
> - Fix TTM KUNIT tests (Intel CI)
> v3:
> - Check for non-NULL bo->resource in ttm_bo_populate().
> v4:
> - Don't move to LRU tail during swapout until the resource
>    is properly swapped or there was a swapout failure.
>    (Intel Ci)
> - Add a newline after checkpatch check.
>
> Cc: Christian König <christian.koenig@amd.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: <dri-devel@lists.freedesktop.org>
> Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>

I really wonder if having a SWAPPED wouldn't be cleaner in the long run.

Anyway, that seems to work for now. So patch is Reviewed-by: Christian 
König <christian.koenig@amd.com>.

Regards,
Christian.

> ---
>   drivers/gpu/drm/i915/gem/i915_gem_ttm.c       |  2 +-
>   drivers/gpu/drm/i915/gem/i915_gem_ttm_move.c  |  2 +-
>   drivers/gpu/drm/i915/gem/i915_gem_ttm_pm.c    |  4 +-
>   drivers/gpu/drm/ttm/tests/ttm_bo_test.c       |  4 +-
>   drivers/gpu/drm/ttm/tests/ttm_resource_test.c |  6 +-
>   drivers/gpu/drm/ttm/ttm_bo.c                  | 59 ++++++++++++++++++-
>   drivers/gpu/drm/ttm/ttm_bo_util.c             |  6 +-
>   drivers/gpu/drm/ttm/ttm_bo_vm.c               |  2 +-
>   drivers/gpu/drm/ttm/ttm_device.c              |  4 +-
>   drivers/gpu/drm/ttm/ttm_resource.c            | 15 +++--
>   drivers/gpu/drm/ttm/ttm_tt.c                  |  3 +
>   drivers/gpu/drm/xe/xe_bo.c                    |  4 +-
>   include/drm/ttm/ttm_bo.h                      |  2 +
>   include/drm/ttm/ttm_device.h                  |  5 +-
>   include/drm/ttm/ttm_tt.h                      |  5 ++
>   15 files changed, 96 insertions(+), 27 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_ttm.c b/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
> index 5c72462d1f57..7de284766f82 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
> @@ -808,7 +808,7 @@ static int __i915_ttm_get_pages(struct drm_i915_gem_object *obj,
>   	}
>   
>   	if (bo->ttm && !ttm_tt_is_populated(bo->ttm)) {
> -		ret = ttm_tt_populate(bo->bdev, bo->ttm, &ctx);
> +		ret = ttm_bo_populate(bo, &ctx);
>   		if (ret)
>   			return ret;
>   
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_ttm_move.c b/drivers/gpu/drm/i915/gem/i915_gem_ttm_move.c
> index 03b00a03a634..041dab543b78 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_ttm_move.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_ttm_move.c
> @@ -624,7 +624,7 @@ int i915_ttm_move(struct ttm_buffer_object *bo, bool evict,
>   
>   	/* Populate ttm with pages if needed. Typically system memory. */
>   	if (ttm && (dst_man->use_tt || (ttm->page_flags & TTM_TT_FLAG_SWAPPED))) {
> -		ret = ttm_tt_populate(bo->bdev, ttm, ctx);
> +		ret = ttm_bo_populate(bo, ctx);
>   		if (ret)
>   			return ret;
>   	}
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_ttm_pm.c b/drivers/gpu/drm/i915/gem/i915_gem_ttm_pm.c
> index ad649523d5e0..61596cecce4d 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_ttm_pm.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_ttm_pm.c
> @@ -90,7 +90,7 @@ static int i915_ttm_backup(struct i915_gem_apply_to_region *apply,
>   		goto out_no_lock;
>   
>   	backup_bo = i915_gem_to_ttm(backup);
> -	err = ttm_tt_populate(backup_bo->bdev, backup_bo->ttm, &ctx);
> +	err = ttm_bo_populate(backup_bo, &ctx);
>   	if (err)
>   		goto out_no_populate;
>   
> @@ -189,7 +189,7 @@ static int i915_ttm_restore(struct i915_gem_apply_to_region *apply,
>   	if (!backup_bo->resource)
>   		err = ttm_bo_validate(backup_bo, i915_ttm_sys_placement(), &ctx);
>   	if (!err)
> -		err = ttm_tt_populate(backup_bo->bdev, backup_bo->ttm, &ctx);
> +		err = ttm_bo_populate(backup_bo, &ctx);
>   	if (!err) {
>   		err = i915_gem_obj_copy_ttm(obj, backup, pm_apply->allow_gpu,
>   					    false);
> diff --git a/drivers/gpu/drm/ttm/tests/ttm_bo_test.c b/drivers/gpu/drm/ttm/tests/ttm_bo_test.c
> index f0a7eb62116c..3139fd9128d8 100644
> --- a/drivers/gpu/drm/ttm/tests/ttm_bo_test.c
> +++ b/drivers/gpu/drm/ttm/tests/ttm_bo_test.c
> @@ -308,11 +308,11 @@ static void ttm_bo_unreserve_pinned(struct kunit *test)
>   	err = ttm_resource_alloc(bo, place, &res2);
>   	KUNIT_ASSERT_EQ(test, err, 0);
>   	KUNIT_ASSERT_EQ(test,
> -			list_is_last(&res2->lru.link, &priv->ttm_dev->pinned), 1);
> +			list_is_last(&res2->lru.link, &priv->ttm_dev->unevictable), 1);
>   
>   	ttm_bo_unreserve(bo);
>   	KUNIT_ASSERT_EQ(test,
> -			list_is_last(&res1->lru.link, &priv->ttm_dev->pinned), 1);
> +			list_is_last(&res1->lru.link, &priv->ttm_dev->unevictable), 1);
>   
>   	ttm_resource_free(bo, &res1);
>   	ttm_resource_free(bo, &res2);
> diff --git a/drivers/gpu/drm/ttm/tests/ttm_resource_test.c b/drivers/gpu/drm/ttm/tests/ttm_resource_test.c
> index 22260e7aea58..a9f4b81921c3 100644
> --- a/drivers/gpu/drm/ttm/tests/ttm_resource_test.c
> +++ b/drivers/gpu/drm/ttm/tests/ttm_resource_test.c
> @@ -164,18 +164,18 @@ static void ttm_resource_init_pinned(struct kunit *test)
>   
>   	res = kunit_kzalloc(test, sizeof(*res), GFP_KERNEL);
>   	KUNIT_ASSERT_NOT_NULL(test, res);
> -	KUNIT_ASSERT_TRUE(test, list_empty(&bo->bdev->pinned));
> +	KUNIT_ASSERT_TRUE(test, list_empty(&bo->bdev->unevictable));
>   
>   	dma_resv_lock(bo->base.resv, NULL);
>   	ttm_bo_pin(bo);
>   	ttm_resource_init(bo, place, res);
> -	KUNIT_ASSERT_TRUE(test, list_is_singular(&bo->bdev->pinned));
> +	KUNIT_ASSERT_TRUE(test, list_is_singular(&bo->bdev->unevictable));
>   
>   	ttm_bo_unpin(bo);
>   	ttm_resource_fini(man, res);
>   	dma_resv_unlock(bo->base.resv);
>   
> -	KUNIT_ASSERT_TRUE(test, list_empty(&bo->bdev->pinned));
> +	KUNIT_ASSERT_TRUE(test, list_empty(&bo->bdev->unevictable));
>   }
>   
>   static void ttm_resource_fini_basic(struct kunit *test)
> diff --git a/drivers/gpu/drm/ttm/ttm_bo.c b/drivers/gpu/drm/ttm/ttm_bo.c
> index 320592435252..875b024913a0 100644
> --- a/drivers/gpu/drm/ttm/ttm_bo.c
> +++ b/drivers/gpu/drm/ttm/ttm_bo.c
> @@ -139,7 +139,7 @@ static int ttm_bo_handle_move_mem(struct ttm_buffer_object *bo,
>   			goto out_err;
>   
>   		if (mem->mem_type != TTM_PL_SYSTEM) {
> -			ret = ttm_tt_populate(bo->bdev, bo->ttm, ctx);
> +			ret = ttm_bo_populate(bo, ctx);
>   			if (ret)
>   				goto out_err;
>   		}
> @@ -1128,9 +1128,20 @@ ttm_bo_swapout_cb(struct ttm_lru_walk *walk, struct ttm_buffer_object *bo)
>   	if (bo->bdev->funcs->swap_notify)
>   		bo->bdev->funcs->swap_notify(bo);
>   
> -	if (ttm_tt_is_populated(bo->ttm))
> +	if (ttm_tt_is_populated(bo->ttm)) {
> +		spin_lock(&bo->bdev->lru_lock);
> +		ttm_resource_del_bulk_move(bo->resource, bo);
> +		spin_unlock(&bo->bdev->lru_lock);
> +
>   		ret = ttm_tt_swapout(bo->bdev, bo->ttm, swapout_walk->gfp_flags);
>   
> +		spin_lock(&bo->bdev->lru_lock);
> +		if (ret)
> +			ttm_resource_add_bulk_move(bo->resource, bo);
> +		ttm_resource_move_to_lru_tail(bo->resource);
> +		spin_unlock(&bo->bdev->lru_lock);
> +	}
> +
>   out:
>   	/* Consider -ENOMEM and -ENOSPC non-fatal. */
>   	if (ret == -ENOMEM || ret == -ENOSPC)
> @@ -1180,3 +1191,47 @@ void ttm_bo_tt_destroy(struct ttm_buffer_object *bo)
>   	ttm_tt_destroy(bo->bdev, bo->ttm);
>   	bo->ttm = NULL;
>   }
> +
> +/**
> + * ttm_bo_populate() - Ensure that a buffer object has backing pages
> + * @bo: The buffer object
> + * @ctx: The ttm_operation_ctx governing the operation.
> + *
> + * For buffer objects in a memory type whose manager uses
> + * struct ttm_tt for backing pages, ensure those backing pages
> + * are present and with valid content. The bo's resource is also
> + * placed on the correct LRU list if it was previously swapped
> + * out.
> + *
> + * Return: 0 if successful, negative error code on failure.
> + * Note: May return -EINTR or -ERESTARTSYS if @ctx::interruptible
> + * is set to true.
> + */
> +int ttm_bo_populate(struct ttm_buffer_object *bo,
> +		    struct ttm_operation_ctx *ctx)
> +{
> +	struct ttm_tt *tt = bo->ttm;
> +	bool swapped;
> +	int ret;
> +
> +	dma_resv_assert_held(bo->base.resv);
> +
> +	if (!tt)
> +		return 0;
> +
> +	swapped = ttm_tt_is_swapped(tt);
> +	ret = ttm_tt_populate(bo->bdev, tt, ctx);
> +	if (ret)
> +		return ret;
> +
> +	if (swapped && !ttm_tt_is_swapped(tt) && !bo->pin_count &&
> +	    bo->resource) {
> +		spin_lock(&bo->bdev->lru_lock);
> +		ttm_resource_add_bulk_move(bo->resource, bo);
> +		ttm_resource_move_to_lru_tail(bo->resource);
> +		spin_unlock(&bo->bdev->lru_lock);
> +	}
> +
> +	return 0;
> +}
> +EXPORT_SYMBOL(ttm_bo_populate);
> diff --git a/drivers/gpu/drm/ttm/ttm_bo_util.c b/drivers/gpu/drm/ttm/ttm_bo_util.c
> index 3c07f4712d5c..d939925efa81 100644
> --- a/drivers/gpu/drm/ttm/ttm_bo_util.c
> +++ b/drivers/gpu/drm/ttm/ttm_bo_util.c
> @@ -163,7 +163,7 @@ int ttm_bo_move_memcpy(struct ttm_buffer_object *bo,
>   	src_man = ttm_manager_type(bdev, src_mem->mem_type);
>   	if (ttm && ((ttm->page_flags & TTM_TT_FLAG_SWAPPED) ||
>   		    dst_man->use_tt)) {
> -		ret = ttm_tt_populate(bdev, ttm, ctx);
> +		ret = ttm_bo_populate(bo, ctx);
>   		if (ret)
>   			return ret;
>   	}
> @@ -350,7 +350,7 @@ static int ttm_bo_kmap_ttm(struct ttm_buffer_object *bo,
>   
>   	BUG_ON(!ttm);
>   
> -	ret = ttm_tt_populate(bo->bdev, ttm, &ctx);
> +	ret = ttm_bo_populate(bo, &ctx);
>   	if (ret)
>   		return ret;
>   
> @@ -507,7 +507,7 @@ int ttm_bo_vmap(struct ttm_buffer_object *bo, struct iosys_map *map)
>   		pgprot_t prot;
>   		void *vaddr;
>   
> -		ret = ttm_tt_populate(bo->bdev, ttm, &ctx);
> +		ret = ttm_bo_populate(bo, &ctx);
>   		if (ret)
>   			return ret;
>   
> diff --git a/drivers/gpu/drm/ttm/ttm_bo_vm.c b/drivers/gpu/drm/ttm/ttm_bo_vm.c
> index 4212b8c91dd4..2c699ed1963a 100644
> --- a/drivers/gpu/drm/ttm/ttm_bo_vm.c
> +++ b/drivers/gpu/drm/ttm/ttm_bo_vm.c
> @@ -224,7 +224,7 @@ vm_fault_t ttm_bo_vm_fault_reserved(struct vm_fault *vmf,
>   		};
>   
>   		ttm = bo->ttm;
> -		err = ttm_tt_populate(bdev, bo->ttm, &ctx);
> +		err = ttm_bo_populate(bo, &ctx);
>   		if (err) {
>   			if (err == -EINTR || err == -ERESTARTSYS ||
>   			    err == -EAGAIN)
> diff --git a/drivers/gpu/drm/ttm/ttm_device.c b/drivers/gpu/drm/ttm/ttm_device.c
> index e7cc4954c1bc..02e797fd1891 100644
> --- a/drivers/gpu/drm/ttm/ttm_device.c
> +++ b/drivers/gpu/drm/ttm/ttm_device.c
> @@ -216,7 +216,7 @@ int ttm_device_init(struct ttm_device *bdev, const struct ttm_device_funcs *func
>   
>   	bdev->vma_manager = vma_manager;
>   	spin_lock_init(&bdev->lru_lock);
> -	INIT_LIST_HEAD(&bdev->pinned);
> +	INIT_LIST_HEAD(&bdev->unevictable);
>   	bdev->dev_mapping = mapping;
>   	mutex_lock(&ttm_global_mutex);
>   	list_add_tail(&bdev->device_list, &glob->device_list);
> @@ -283,7 +283,7 @@ void ttm_device_clear_dma_mappings(struct ttm_device *bdev)
>   	struct ttm_resource_manager *man;
>   	unsigned int i, j;
>   
> -	ttm_device_clear_lru_dma_mappings(bdev, &bdev->pinned);
> +	ttm_device_clear_lru_dma_mappings(bdev, &bdev->unevictable);
>   
>   	for (i = TTM_PL_SYSTEM; i < TTM_NUM_MEM_TYPES; ++i) {
>   		man = ttm_manager_type(bdev, i);
> diff --git a/drivers/gpu/drm/ttm/ttm_resource.c b/drivers/gpu/drm/ttm/ttm_resource.c
> index 6d764ba88aab..93b44043b428 100644
> --- a/drivers/gpu/drm/ttm/ttm_resource.c
> +++ b/drivers/gpu/drm/ttm/ttm_resource.c
> @@ -30,6 +30,7 @@
>   #include <drm/ttm/ttm_bo.h>
>   #include <drm/ttm/ttm_placement.h>
>   #include <drm/ttm/ttm_resource.h>
> +#include <drm/ttm/ttm_tt.h>
>   
>   #include <drm/drm_util.h>
>   
> @@ -239,7 +240,8 @@ static void ttm_lru_bulk_move_del(struct ttm_lru_bulk_move *bulk,
>   void ttm_resource_add_bulk_move(struct ttm_resource *res,
>   				struct ttm_buffer_object *bo)
>   {
> -	if (bo->bulk_move && !bo->pin_count)
> +	if (bo->bulk_move && !bo->pin_count &&
> +	    (!bo->ttm || !ttm_tt_is_swapped(bo->ttm)))
>   		ttm_lru_bulk_move_add(bo->bulk_move, res);
>   }
>   
> @@ -247,7 +249,8 @@ void ttm_resource_add_bulk_move(struct ttm_resource *res,
>   void ttm_resource_del_bulk_move(struct ttm_resource *res,
>   				struct ttm_buffer_object *bo)
>   {
> -	if (bo->bulk_move && !bo->pin_count)
> +	if (bo->bulk_move && !bo->pin_count &&
> +	    (!bo->ttm || !ttm_tt_is_swapped(bo->ttm)))
>   		ttm_lru_bulk_move_del(bo->bulk_move, res);
>   }
>   
> @@ -259,8 +262,8 @@ void ttm_resource_move_to_lru_tail(struct ttm_resource *res)
>   
>   	lockdep_assert_held(&bo->bdev->lru_lock);
>   
> -	if (bo->pin_count) {
> -		list_move_tail(&res->lru.link, &bdev->pinned);
> +	if (bo->pin_count || (bo->ttm && ttm_tt_is_swapped(bo->ttm))) {
> +		list_move_tail(&res->lru.link, &bdev->unevictable);
>   
>   	} else	if (bo->bulk_move) {
>   		struct ttm_lru_bulk_move_pos *pos =
> @@ -301,8 +304,8 @@ void ttm_resource_init(struct ttm_buffer_object *bo,
>   
>   	man = ttm_manager_type(bo->bdev, place->mem_type);
>   	spin_lock(&bo->bdev->lru_lock);
> -	if (bo->pin_count)
> -		list_add_tail(&res->lru.link, &bo->bdev->pinned);
> +	if (bo->pin_count || (bo->ttm && ttm_tt_is_swapped(bo->ttm)))
> +		list_add_tail(&res->lru.link, &bo->bdev->unevictable);
>   	else
>   		list_add_tail(&res->lru.link, &man->lru[bo->priority]);
>   	man->usage += res->size;
> diff --git a/drivers/gpu/drm/ttm/ttm_tt.c b/drivers/gpu/drm/ttm/ttm_tt.c
> index 4b51b9023126..3baf215eca23 100644
> --- a/drivers/gpu/drm/ttm/ttm_tt.c
> +++ b/drivers/gpu/drm/ttm/ttm_tt.c
> @@ -367,7 +367,10 @@ int ttm_tt_populate(struct ttm_device *bdev,
>   	}
>   	return ret;
>   }
> +
> +#if IS_ENABLED(CONFIG_DRM_TTM_KUNIT_TEST)
>   EXPORT_SYMBOL(ttm_tt_populate);
> +#endif
>   
>   void ttm_tt_unpopulate(struct ttm_device *bdev, struct ttm_tt *ttm)
>   {
> diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
> index a8e4d46d9123..f34daae2cf2b 100644
> --- a/drivers/gpu/drm/xe/xe_bo.c
> +++ b/drivers/gpu/drm/xe/xe_bo.c
> @@ -892,7 +892,7 @@ int xe_bo_evict_pinned(struct xe_bo *bo)
>   		}
>   	}
>   
> -	ret = ttm_tt_populate(bo->ttm.bdev, bo->ttm.ttm, &ctx);
> +	ret = ttm_bo_populate(&bo->ttm, &ctx);
>   	if (ret)
>   		goto err_res_free;
>   
> @@ -945,7 +945,7 @@ int xe_bo_restore_pinned(struct xe_bo *bo)
>   	if (ret)
>   		return ret;
>   
> -	ret = ttm_tt_populate(bo->ttm.bdev, bo->ttm.ttm, &ctx);
> +	ret = ttm_bo_populate(&bo->ttm, &ctx);
>   	if (ret)
>   		goto err_res_free;
>   
> diff --git a/include/drm/ttm/ttm_bo.h b/include/drm/ttm/ttm_bo.h
> index 7b56d1ca36d7..5804408815be 100644
> --- a/include/drm/ttm/ttm_bo.h
> +++ b/include/drm/ttm/ttm_bo.h
> @@ -462,5 +462,7 @@ int ttm_bo_pipeline_gutting(struct ttm_buffer_object *bo);
>   pgprot_t ttm_io_prot(struct ttm_buffer_object *bo, struct ttm_resource *res,
>   		     pgprot_t tmp);
>   void ttm_bo_tt_destroy(struct ttm_buffer_object *bo);
> +int ttm_bo_populate(struct ttm_buffer_object *bo,
> +		    struct ttm_operation_ctx *ctx);
>   
>   #endif
> diff --git a/include/drm/ttm/ttm_device.h b/include/drm/ttm/ttm_device.h
> index c22f30535c84..438358f72716 100644
> --- a/include/drm/ttm/ttm_device.h
> +++ b/include/drm/ttm/ttm_device.h
> @@ -252,9 +252,10 @@ struct ttm_device {
>   	spinlock_t lru_lock;
>   
>   	/**
> -	 * @pinned: Buffer objects which are pinned and so not on any LRU list.
> +	 * @unevictable Buffer objects which are pinned or swapped and as such
> +	 * not on an LRU list.
>   	 */
> -	struct list_head pinned;
> +	struct list_head unevictable;
>   
>   	/**
>   	 * @dev_mapping: A pointer to the struct address_space for invalidating
> diff --git a/include/drm/ttm/ttm_tt.h b/include/drm/ttm/ttm_tt.h
> index 2b9d856ff388..991edafdb2dd 100644
> --- a/include/drm/ttm/ttm_tt.h
> +++ b/include/drm/ttm/ttm_tt.h
> @@ -129,6 +129,11 @@ static inline bool ttm_tt_is_populated(struct ttm_tt *tt)
>   	return tt->page_flags & TTM_TT_FLAG_PRIV_POPULATED;
>   }
>   
> +static inline bool ttm_tt_is_swapped(const struct ttm_tt *tt)
> +{
> +	return tt->page_flags & TTM_TT_FLAG_SWAPPED;
> +}
> +
>   /**
>    * ttm_tt_create
>    *

