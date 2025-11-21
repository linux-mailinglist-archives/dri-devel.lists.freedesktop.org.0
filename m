Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 45677C79C0F
	for <lists+dri-devel@lfdr.de>; Fri, 21 Nov 2025 14:54:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A4EE10E8BB;
	Fri, 21 Nov 2025 13:53:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="lMyrRovY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from MW6PR02CU001.outbound.protection.outlook.com
 (mail-westus2azon11012032.outbound.protection.outlook.com [52.101.48.32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4868010E8BA;
 Fri, 21 Nov 2025 13:53:58 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wGwdfZj1cF7K2Md77XidsrEby7jpoTU73lQ/nhvckQWERMAypGgLecoLmvxouh4f6glDhoqqUEf66/e2gooebW4NpwQctHUMyKgCcdmxnMLn81HrJUlQh/PAiEz+jkof6ra+ttDbV3iQcVFcCXhev/A7MJr9sxmVTxcd9zqGehppLvl7Fop5yJBOCSnCFAxu+1hFALzHufh/l0x/68XDFb0goGz+ZrVwTLOXEXgGbhjqQnaaJuaC3ALJNxuFinHWNDxBEWqUBkOKJOQf5tEPVhSzDP7oHNOLVMWYt+h1B0nCrXUgvw6aFbRb7qa6/fXcDa3bgzknrzdJeC2n/Ccavw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iHv05DZkv8pF9rXsaKm3Pn+cy9Wq3yGIB+jHKtQCEBQ=;
 b=yWZV2JqR1ENXvA2AHP2QBMpC1I535X4MoO1zEC+IMeu/EOYp6ONC332h6EWMSPdtwEg8oQScrqaK2mzWY1AhVuvcNhoWvEaKwwryJTOaZ7D4o7LMfqs4B5LJkUrerKjprb0d72BVEU/B4ErffU5qi4ESH/Ng0R5P6lEVdWatEoi7oXmtjwHP8eblcPudfHTP3tAjUJQtgRx/Dl9o9dR91empfiOay8skcoIxrP7eRW1BOC33+1AiM7/39GzAnhXAymhYzYrRenrwvYQHDOv5s8/bWTyz90gi0GkQAxUzjvs0b/fMJBsVmijr0w05XgQk/alpon1wyesLGbQAOD7L3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iHv05DZkv8pF9rXsaKm3Pn+cy9Wq3yGIB+jHKtQCEBQ=;
 b=lMyrRovY4m5um/1lYOYI3/dA4R4XPYbv1qDap4dEX4uuqN0I+VM32zWhrJOsV2c9QTHrcP6+3JuVzVyuGf1GE5tLMtm9bTIAHZNZ3oJakp2NSFRCQJp9qtueYCAouhg0YcogcNzwBflFbHuGMv+mSmaNcsGk51IdI8lNLSuQ2aE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by CY5PR12MB6276.namprd12.prod.outlook.com (2603:10b6:930:f::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.12; Fri, 21 Nov
 2025 13:53:51 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%4]) with mapi id 15.20.9320.021; Fri, 21 Nov 2025
 13:53:51 +0000
Message-ID: <53a97fb8-e73f-40de-9d4f-c3d3bafda66f@amd.com>
Date: Fri, 21 Nov 2025 14:53:42 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 13/28] drm/amdgpu: add missing lock when using ttm
 entities
To: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20251121101315.3585-1-pierre-eric.pelloux-prayer@amd.com>
 <20251121101315.3585-14-pierre-eric.pelloux-prayer@amd.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20251121101315.3585-14-pierre-eric.pelloux-prayer@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SG2PR02CA0075.apcprd02.prod.outlook.com
 (2603:1096:4:90::15) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|CY5PR12MB6276:EE_
X-MS-Office365-Filtering-Correlation-Id: fd341d2b-c4d4-40be-bede-08de290566e7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RWZwa3FaN2VxT0Z4QlJ5aThnaHU0MDB5TXVCb0NIbGp4RER6bWVhMmI0bStU?=
 =?utf-8?B?OGlla3BWbCs5TUJGcjRzUHUzUHFSTE8wd2FLaG1OUktqclBERld5V1R0bE4r?=
 =?utf-8?B?RllEZ201RGRIbUdIZGhsUmVuWGwvb292YUQ0OHRTeUpydDEwbFNSWXd5ZHlt?=
 =?utf-8?B?bGZoRVN2Ymlvb3oyY3crbk5YbVlhNXo3WG5wd0hEdUFzMmVRQ3lFa2Z4VXFE?=
 =?utf-8?B?djRuVUZLTHRIcWMwc0hVclJPSGUzWG9oQTRTOVNkUWZRZ3BnRGk1eFZsdlh2?=
 =?utf-8?B?eEwzOGMyTzJETlV4clVsK2hmS05rRmU2NUhKcFRWcitqSGF1Ylc0ekdGdmFh?=
 =?utf-8?B?Q0JDOVcvUUVrUXNsN240dVpvNzlhVGp1b01YOHdVSlBHUUxXNmsyVDY2YXdE?=
 =?utf-8?B?Y3RRZU1nOGFRZFBLU1JkbmhOQWZpUXJvK2dIL09DNmt4RkFIUWtVaWMraW41?=
 =?utf-8?B?NnAwUlNod2E0dFc4Um9mRFJHRkxlZUROa1lVbDhXeGlyTE1sRHVuR2wxTXlO?=
 =?utf-8?B?UkFSMXI5c00rM0cxcWppenZraTdKVmJCY1ZTSy9FRkwzTEYvbEo2QnJuRWxH?=
 =?utf-8?B?aTg4VENkeTJ3NDlNNW1jejl6SGRvV3VEaU5lSGpqMzdaN1RUaG5KdHZpL2E1?=
 =?utf-8?B?Y1RrelZRQVFFd2VGcjFseE0wczVZM2pxY2ttNUJrMGFad1o1emVSRitZTDZB?=
 =?utf-8?B?bUlwWlFubmlBY045RjgzSm1lcURGQWhPVHkzZ3QyV2FmcERGWjJObDZrZlhu?=
 =?utf-8?B?Sm8wdGhiWFJsVTYzSTlQZW5Qa0ZzYlVaRkJDbWxKY2c2YWVqam5IZWs3a1N0?=
 =?utf-8?B?aWdwUW0wVHNDeGt5VDByMDM1aUI4elhOeEt3UFBvcFdlb0NjSUpvUmNMSmNk?=
 =?utf-8?B?Y1BiUHgyMnZPMk91Smd2TTN1T1RISCtCQ3RKenl3YXR3dTdQVEpEbG5HU2lz?=
 =?utf-8?B?Uk9RSTdTaUpyZHBnL2l3bEtkd1krK25RRnUyU2dtdnZyb2szd1Z2MnVRMFkx?=
 =?utf-8?B?UGFDOUNlamI4cUliYjAwRW9Db0I1RXJyK1RBZTRtM05scjh4MnV4WXkwRnF2?=
 =?utf-8?B?UzVqeGhiRjFsVDdCVDVXT3gzZnFidjhzL0MvQ2s3ZFhxTnc3QnU4Q1hMYm5P?=
 =?utf-8?B?WDU2S3AyMnpUYmZPTUZZMmxGNEk2aDdqS25pcjhnYW1aTEZ5U2llTFNaaENv?=
 =?utf-8?B?aTh0bHhQbFd3RjhFT1JBbkgvUXFvYTY2WmNRb1oxdmpnbnFUbjdRZWJBb1hl?=
 =?utf-8?B?Vk1aTUtEVDZrVXF0T091MFR3cFdGWkVkMXVWeUtsVW1PNHlXK0hZQmhaM29t?=
 =?utf-8?B?SmpIbURBK2hCNW1GQ1BTZGh6NHdINExoRTliOWE3VW9tejZwM0ZzZ2xJNnV3?=
 =?utf-8?B?V1RxVW5jckkzd3FrUkF0OG9FaWJNTXVMTzNBdHYwazN3OHhESzFWcDFzRDRv?=
 =?utf-8?B?bndlWE1uSzFCL3FNaWJCczJHZVJhdjJEMXpPN25LZ2NjSFVhemppUlBQVmk4?=
 =?utf-8?B?VmtzM0xpS2wvY0pGUTJsVFdlL29VMHBxemRMVm1TWFV6TTMvR2JNS0g2VU1n?=
 =?utf-8?B?RnVIV2NTdjNpYUJ5TER3L0xMQ2hFcThIZytzaWw3Mm5idHNSVmd1Zm54eWkr?=
 =?utf-8?B?Sml3UVFMbVY2UVlicXZXSThnM3UrQys4K1VwN0RjS09rVFhmWFJtdHQ2THpK?=
 =?utf-8?B?cWR0L1k4NkFjZkluOFNxOHh0Z0NXMVZmQXNESTN0T2NxbE1EaG9HSGMxSTdz?=
 =?utf-8?B?VnpLbGdjdlBxWE0ydEFhT2VkRTdSaENXS3hZTyszRzlSUS9qMUtzQzVwZUhi?=
 =?utf-8?B?R2Y0eGlScFllaGpZWXlUUGRsOWhDSTkrSDZFTTRhRFZTUDJxdW5nNlo3WXJZ?=
 =?utf-8?B?Q1ZPMm9VR3BXV1F0clNsYU5GVmFwR3JrOU5jbmhzL2gyVkZDOUxIOTlJY21j?=
 =?utf-8?Q?Z2/p3e9Ry+XUqNgGl9YSATxB1gZySJgK?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?N1lBN2lLV1daM2tUejVVelI5ejlRK0hkUTU1VkNmSjdQd1lJSHFGakhnbG9C?=
 =?utf-8?B?VXNPV29qMEg4QlpoeDZkSnA0d0QweTBXWTFsZ05jdVo4VG4wZ3RUK1JzZ0tZ?=
 =?utf-8?B?ZUlFVEpDaW56ci9JckZXbEQwRDFZK2hzcmxMUHBGSXVDL3VUWXpQY3B6dXJs?=
 =?utf-8?B?WUZpaXZpRmZTZ2VEYnVjelBRWVg5N245RWlVQ3BIU1creW5aUEVmYUd3RDRQ?=
 =?utf-8?B?YXlmczB4SFJBT0NlTVYzV0liVGMvVkNNbWM1ZFo4cU5qLzlQTmJHRWhISVMr?=
 =?utf-8?B?UmhOa3RweTVreG1hWWRycElrT0M5WUQ5R2Y0cGpsd2oydUkzdmgvT0R4cVpV?=
 =?utf-8?B?T1RPN2N6aUhmMHZ0WmJPZGlJVjREM2FJQ0I4M0cxdUFXZWI5d0dQRjU4MmRh?=
 =?utf-8?B?Tml6a3BWZUhMTzI1MnRzLytrenJzSVY2Q0ZBVTJkMllMTk5KbGxvSXgxbTZR?=
 =?utf-8?B?RU50ZTFocTZFZm5qenpHcHlTMDFYdmQzS0gvNk1OVWlpTDl6Qll5bTFnVDRZ?=
 =?utf-8?B?N1ZXTHZOKytOUlFicE45cUVTQ3dFd0kzVEcram90dmxLdlhDMTI4SWdsaFJN?=
 =?utf-8?B?bXF3VnhJU3k4UnMxaTdUWVA3OTl1ZlpHbHg5cXVBY2ZsR2sxcS9VZUJLajVH?=
 =?utf-8?B?QlNjSTBOVWJsV3JLd0FWRnNSQm0rOUJlMU83N1J0Rm1BWUlnT2NFQTUrTVZG?=
 =?utf-8?B?ZVdlWElyTjR5ZGdVOG5yeVc1OWFkN2xHbjRSN295ZlZLU3RMbFZYc0ZFT2wv?=
 =?utf-8?B?TW9tME11QVJyVEdrakV6a1pjZWIxU2NZMXlBckZiTEdsbVVka0ZNYzduOEsw?=
 =?utf-8?B?TWtwV3FGSE1yZlc1LzNEenV5dWwvWnVmK0k5ZGVNUkp2OFE0c1hkTktCWkFl?=
 =?utf-8?B?VE5Vb0ZlZWlESC90RVYrK0xoMk5HaUpGdXpOcVYrZHkraEJtaFdycXp0V2Ru?=
 =?utf-8?B?cUNGMEVLYjJ4ZXZ0UEgvU0VrdVJsY2wvSEwwZ2xWbkRoUndES1dwV1owcmJs?=
 =?utf-8?B?eHpZTXdtblJYMkx0eDBLR2tqZHI2MmJNZE5xQ3pITXZRNmpMMjRvSEVvSll5?=
 =?utf-8?B?Q3ZVL2pOWXYzN2JRNVJkUSs5S0hIUCtrYWxPbmtSblh3emxyZUxKUDIvMUha?=
 =?utf-8?B?TUFlWURsS1NmZ2M3eE1DQXYybC9rTzdnbVV2QkVJcERGUGEza0EvSmlDTlFq?=
 =?utf-8?B?bHNBbTgvTnhOSkNVbTVIVVdKL0FvME9Zck1IeDNmZi90U0REcjVPeEJzM0Zl?=
 =?utf-8?B?RXIrQzNUN0dXc2t2aWJtQSszazdabWdCaEhzSEZ1RlN0bVRqV1NNTUkzRHlu?=
 =?utf-8?B?WG1YVXRRbzVSa2xFbjlONkRqUmkvUWpyUXV5OXNQZEZFZWhVN1FyUFQ5UFVH?=
 =?utf-8?B?N1JaMlRoSW5HbndqcDloalJkaEFGTDBOQzZsUXVVS3ZUNDRTdEUyWXJFbzl5?=
 =?utf-8?B?SVpVRkJpNTl5S3NvdUxJVFVBcEl5aCtDVU1YWXVFNW9xR1VxbFBwS1k3UW50?=
 =?utf-8?B?dmZYNGxSUm1LZlpQa2JXVmdFM0ZONXlaeURaZE9COHpIQUJ6VVBNTzJ4VVRB?=
 =?utf-8?B?NFVWNk93cUFZVThLWHBjM3lldEJxZVRvTUQ5RHduclVBMWJnQk1JSjh6L2tv?=
 =?utf-8?B?UEFFeHRmNDk5YnVMSk1uZkpjYWRoLzVXcm83cUNUVE11L0tBVnhwYkFCeU4w?=
 =?utf-8?B?dFFuYkRhdnhlSGZGRHVTRDhveEJOeGRLSEk2M1dRY3NBOUdkb3FxdkNYTUFn?=
 =?utf-8?B?NEJvRkpGUjFXS1JndU9rVDFoeXVibDhFaGZmaTdJNW9nZHd2U3lXRkIyZmJT?=
 =?utf-8?B?SWF3U2Rzb2I1YUd1MW1WN05nb1NzUXo2S1d0dkJsOXVWV0RIazJ3MVZXU1hT?=
 =?utf-8?B?T05CT2JnZlo5T3NaNm9OVlpoS3M2eERWcHltcXcyMldSMHF1SlMrL2I3Q1pX?=
 =?utf-8?B?SXFrSERzdFlrVHI4cEhyV2dBbU5iSjRmQzR0NnpydTdPT00weDFGYlhMUFVl?=
 =?utf-8?B?c1F6Ym5MMDJSSDMwOXZDeURiejNlTWZDb1JtU0dIVjdYYmU1bnFySUVNMzRt?=
 =?utf-8?B?NW03M3hMdjE3K1hVZ2RBOHN1ZkRJcDF2M0lNMWhsR2VzSVNxamFHNDBKOThJ?=
 =?utf-8?Q?YE1GQHXkZL8CggLdcBmp1M6Nt?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fd341d2b-c4d4-40be-bede-08de290566e7
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Nov 2025 13:53:51.3194 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8HWrN+L/A6JSKhlxY2hPFuY8ixHwxg8717wC3uUyJ/pVwiUgdRs+5kZYM89L6dDB
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6276
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
> Taking the entity lock is required to guarantee the ordering of
> execution. The next commit will add a check that the lock is
> held.
> 
> Signed-off-by: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>

The benchmarking is kind of irrelevant, but adding the other lock should actually be the first patch in the series since it is a bug fix (it needs to grab the gart window lock at this place of course).

Then the patch needs a CC stable and a Fixes tag to the patch who introduced amdgpu_ttm_access_memory_sdma().

With that done: Reviewed-by: Christian König <christian.koenig@amd.com>

Regards,
Christian.

> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_benchmark.c | 2 ++
>  drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c       | 2 ++
>  2 files changed, 4 insertions(+)
> 
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_benchmark.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_benchmark.c
> index a050167e76a4..832d9ae101f0 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_benchmark.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_benchmark.c
> @@ -35,6 +35,7 @@ static int amdgpu_benchmark_do_move(struct amdgpu_device *adev, unsigned size,
>  	struct dma_fence *fence;
>  	int i, r;
>  
> +	mutex_lock(&adev->mman.default_entity.lock);
>  	stime = ktime_get();
>  	for (i = 0; i < n; i++) {
>  		r = amdgpu_copy_buffer(adev, &adev->mman.default_entity,
> @@ -47,6 +48,7 @@ static int amdgpu_benchmark_do_move(struct amdgpu_device *adev, unsigned size,
>  		if (r)
>  			goto exit_do_move;
>  	}
> +	mutex_unlock(&adev->mman.default_entity.lock);
>  
>  exit_do_move:
>  	etime = ktime_get();
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
> index 3a0511d1739f..a803af015d05 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
> @@ -1501,6 +1501,7 @@ static int amdgpu_ttm_access_memory_sdma(struct ttm_buffer_object *bo,
>  	if (r)
>  		goto out;
>  
> +	mutex_lock(&adev->mman.default_entity.lock);
>  	amdgpu_res_first(abo->tbo.resource, offset, len, &src_mm);
>  	src_addr = amdgpu_ttm_domain_start(adev, bo->resource->mem_type) +
>  		src_mm.start;
> @@ -1512,6 +1513,7 @@ static int amdgpu_ttm_access_memory_sdma(struct ttm_buffer_object *bo,
>  				PAGE_SIZE, 0);
>  
>  	fence = amdgpu_ttm_job_submit(adev, job, num_dw);
> +	mutex_unlock(&adev->mman.default_entity.lock);
>  
>  	if (!dma_fence_wait_timeout(fence, false, adev->sdma_timeout))
>  		r = -ETIMEDOUT;

