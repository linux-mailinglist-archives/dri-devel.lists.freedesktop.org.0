Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 01EE1AB31A0
	for <lists+dri-devel@lfdr.de>; Mon, 12 May 2025 10:28:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 594B110E327;
	Mon, 12 May 2025 08:28:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="pBe2PN+J";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2078.outbound.protection.outlook.com [40.107.237.78])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE74110E30D;
 Mon, 12 May 2025 08:28:37 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UULXBRvPEHANtaHbk8wlPHqNBzFndCLMh+omRACNLY1PhU3ieCGtxhjwPKseHmZQCQQ5oFHmgkcxdayl4Ouo5yJ79Cl0EJ9FVa7gENTKe1wU01NcJPWvE7R5OhaC8gILVmMzB0CNl/yWMEEv+6BVF2k7SvTQFQ6ObBy8y0+OZYz6QMPg7AO3ujk86u7t8JEyfDMq05q+mBVLxm5jo85x9wqHpgOdCbTasXQ/I3pPHze3xywARAIY9LL3D8aRNbyTikhGnMGzOalfuxrHoa+UVFjpL71YJuc/xykJfeNHyGtqb5Y68zJ5SagXlYwHwMVWVo/DWhR9+eFrfLflKt+mAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=M+a/DTvyxTr1sikYEEO+e+QwExvY4DHSpxYvzj1u51M=;
 b=w52oWLyfriynSPH3hmbycnMpCZffyqLOfCWRYfh7ctmmwD0cR+tOq9c1MnunRVl8wTlTpdHDRc2Y+lJuDkVmHNL9FR7KAf8y/my6oun8PjK+qfXDu6uyRvWvMI2tIuapcQmRXazG4WDLs+Rmk2im6nFvFtw5MR3bXqYXDwvFeUjXGtx4b210AQt1/zodzH0n4A306LtC4L7aInJ1c9oaWp83CMQjY/6PXdDR8eBzykMmggOtQzFWJTkAiZRvWXf6TnMtZmLNsoh3FJXzx8R/cMz1CY0NZLDtSab4OVQPUSQkssJI60BB4v4YNB+MyVhemtMtxCFBZEHo7OUoFMzgew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=M+a/DTvyxTr1sikYEEO+e+QwExvY4DHSpxYvzj1u51M=;
 b=pBe2PN+JRqmRBRNM1o83Ml37XiG8rGwnnK/TlRm6Dcd2+obYJ+m7myCn0OzSFmKAo1CSvxhqIurzgmLRP2rZGzvMRlrU4FU3Ep82fF8+zTKLdC+d3Rcu/+F/IwKgRXukarYIWK2SBgyVsg37NPcSQt9m78kMvUg0zVh9wrjBf7U=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by LV2PR12MB5751.namprd12.prod.outlook.com (2603:10b6:408:17d::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.29; Mon, 12 May
 2025 08:28:35 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%7]) with mapi id 15.20.8722.027; Mon, 12 May 2025
 08:28:35 +0000
Message-ID: <e8974651-2c40-42b6-b3e4-f2aafff33dfa@amd.com>
Date: Mon, 12 May 2025 10:28:30 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC v2 09/13] drm/i915: Use dma-fence driver and timeline name
 helpers
To: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>, dri-devel@lists.freedesktop.org
Cc: Sumit Semwal <sumit.semwal@linaro.org>,
 Gustavo Padovan <gustavo@padovan.org>,
 Matthew Brost <matthew.brost@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, amd-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
 kernel-dev@igalia.com
References: <20250509153352.7187-1-tvrtko.ursulin@igalia.com>
 <20250509153352.7187-10-tvrtko.ursulin@igalia.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20250509153352.7187-10-tvrtko.ursulin@igalia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0124.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9d::18) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|LV2PR12MB5751:EE_
X-MS-Office365-Filtering-Correlation-Id: 29d322e0-8067-44ec-1b47-08dd912efcf8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|7416014|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bE1VSEs5MDJIUUJlOEtCczVzYUs2VkNOV3J4VThMaS91SCtWNVZmU245dVN2?=
 =?utf-8?B?Z3hOSTRSazRWeXpra2RJdnFPQ1lpS3I4SHBwcnM5MVkxY0RvUVh2eVNUbXY3?=
 =?utf-8?B?MTRtUk5odGZ1R1gwQkxuaXYwN0c0OURHM3gxK0VFREZmVXgrbkszZU5RMWha?=
 =?utf-8?B?TnVxaFRqZGpNV3pxZ0E0aGd6SzErUVdjWFl2VTlFYlo5RGwyL0pjWk54cnE0?=
 =?utf-8?B?MnhJWVFuRC85emJSNFFCMnptNHNKVHZZWjdnOWdYaHQ0SlNzWFFERE5XY0xE?=
 =?utf-8?B?YmtaaWkyUmJibXAwSG9pSC9taXhMaXpmSW1WcEJydk1QeDYrckQyZXRhdmor?=
 =?utf-8?B?Z0pNaC9yR3NrVnhLb2IxUFg4bW56OGloRDducEVqVC80N3VSYitKQjZvZkVm?=
 =?utf-8?B?T1FaVmFlZzZOZnA4V2doOXhLZEFGeW0xUWx2bXpVdXpMVzFMVFJWQzU0ckxL?=
 =?utf-8?B?K2hQdGZnRnNkTkh3ekNkcGVwdGFoN2oxWmk1ZlpoalByZ1ZNSXRFMTYzV0l5?=
 =?utf-8?B?RDgwNG5jdnFhOTJaSGlqQlRHcVZ5UTdTVGRMOVFwYUNXYmxSOWhmMzh3K2pP?=
 =?utf-8?B?KzJ3ZFlNbGIzeDlQam1DREVvcEdTZG5jM3I1bXR2Rm1zUkZIWUdnZWtZMFZP?=
 =?utf-8?B?VE9WNDZheWFJcENUTTZ4aGhjdUpwc1RjdzJYR2J5NlE4MnVDVnNGS3JPVlh4?=
 =?utf-8?B?RXJmd045SFVKS2tMcEpkYW15U3R6b1N4bW9ibW1jRGRsc0NZRzB0TUNBeXpp?=
 =?utf-8?B?dWc2bEtYUE4zVEV4aUEyQzNUcGkycjhPNTVjNzFmUk0wOEMwQ2VGanllUnBw?=
 =?utf-8?B?MXU4a3dML0JyMzZsUzZZUzVXb3lwcVBZQk1UN3MxMnMrSFFsd0duQmpjTTUx?=
 =?utf-8?B?SFNPVWtOd3JCTEI4RXdULzIvNkpEbGhSWStQRnVYRHAwTEk0NW5aVHVhYUEx?=
 =?utf-8?B?Y0s3am96andLeWFXekl4ZEQ3NDhZRDZJdU9oWHZEekRKbVhtTFpqM3BGbGgw?=
 =?utf-8?B?UFhVNGdSTU9GVFVHVnVad3lXMjRqSEp4dkcyV2lWZXh6aTFmRWN4aWIxdzEx?=
 =?utf-8?B?T3JYblBmRGw1TGR1UFFkZDk1aGd6WDh0NTZ3QlZLZG9sY25NVmU2TTNXU1Vv?=
 =?utf-8?B?Wi9QeFg2YzFyN2tKcUNrUVg1MlZWdDc2eCtzMjZiV1pNUTY0SklwZkp5bUY3?=
 =?utf-8?B?V1lHZE95ZXRkM2VZcXREcGgvTC9zdDY3MWgzWXVIa09ZYXBrUnhhM3J0QUNq?=
 =?utf-8?B?ZS9HSnUrQm5JUXltZjUxQW51cEpWdEFvOVNwY2ptSnlXNFAzd1lycGdoKzlE?=
 =?utf-8?B?azZ0TFQyakdJWDJLNW85aFN5eFcydExXUkl1aXJxczFIMURyL25MSFd5bmVy?=
 =?utf-8?B?UUNqbVRLQmk3NmRrb3Q3cC9xaDA4V3Y0QXlWQlhSVy80Q0l4QkY0VTRCT25m?=
 =?utf-8?B?UjVsK0NHcDVFT0RBeWVjVzAvNGxnYUovK0laRmdNTHpHd20reTBKVHhhem55?=
 =?utf-8?B?ZXJ5VkJtV1R0U0VOYjRzbXhiMmlBcHFmWWpiMmZ5Rld5QnExdFVZcHdnQktX?=
 =?utf-8?B?YjJQSVA5TlBtQkNnKzA3NFVmTktnVHFQSTA2MXJ5eldmVHcrSXdsSDd2c0pP?=
 =?utf-8?B?dHV6RTFjQ0Qva3E0VHhuVUxBSkVEQXdPUG5OdUZlazVPZzYrQ3REUkdSQW5i?=
 =?utf-8?B?M0pCSHlKMDdEaDBteHJjeWJyOHZqbEo4Y2VUMVZwWFBpNENyaDN0WXRiZkQx?=
 =?utf-8?B?RTBQMWg2ZkpSNUtpT1hEbkhZMGxCQzlRMjFZUUdkRmlDcDVTQnhOcytMVTlG?=
 =?utf-8?B?YW55RVY3QW5zV3ZPWWVJanlPYWloUExBRCtnaFFsVHNPRXRuNlRnWVhsYjM0?=
 =?utf-8?B?M2x0VXdtT09GREJEMHpEWWUyQ0gvYmJlalduRmE2aW9FSXl6cTN0SjBrVEhN?=
 =?utf-8?Q?NhsZnBEb6k8=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7416014)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NmY1c1dzV2x2R3ZGOWcvYzNBQnIrZ2RRWnRodkdhNHYwTEVVZ3pIMmV0clpK?=
 =?utf-8?B?NDlaWlJ5RHFYNTBWeVY4aW9rZk9MVE9wVzJ5ZjFubzFpNWRwRlV1OUFDbURa?=
 =?utf-8?B?QjZTaXNiMUJISzBMeXZIaHB1M2ozdFFRUGV3OHdlMTZNM0lBMFFIWkQ4N1FV?=
 =?utf-8?B?aElKaTJ4UGFkUzBHL3ZyNmdoc3oxYjFOSVMySjNLTDU2NVA3VExlRW1nVDQw?=
 =?utf-8?B?dFNwaVcvcmUwb3NrSi9BTER3VEN5S2pUM1c0Y0JUN2JtS2FQS1BMYURmMmJx?=
 =?utf-8?B?N3o4cVB4Skc1OVdhc0poOXlOekRzY1RXMkdOYVVRdzErc1ZEYW9JTHFDcy9t?=
 =?utf-8?B?M2pBSUpqR1ZoTUdGdUhtRVNIQ0haRzBEY1pHRXdsRG9rS2NlSndrbG9sdHhP?=
 =?utf-8?B?WkFrSE56WXI0d044dDh6Y2ROVXNRTWRzUG9mL0t0MFBzdmhHQmdoMDM2bXd2?=
 =?utf-8?B?aWZWZHFNZGRBV1RObkFxdmFZQ2tIbksxTXpya1EyWlNJN2M1dDd4WjZ4cmI2?=
 =?utf-8?B?U0JVV2pQbk5pTXlzUlNrTW9ERDdEQUFiS01yeDdpK3VJdzR6anZ2UWRySW01?=
 =?utf-8?B?TW1nM3JXSkdDQnRpcXYzSWxWY0lMdGMzaEo0Nzd2cWVqL1BiWVFlUnVwNGMv?=
 =?utf-8?B?OEd0ZVRralR1N1NMejlIVlMvZm9yMHBYS0ZJVTBlM2RCemJSL0VZUzhXZUJa?=
 =?utf-8?B?a1MwV2QyOFRvZlBpUXYyUkZ6V2JYTGNNOTRqTk9SZUNvanFjV0F3RTQvbHlu?=
 =?utf-8?B?cW14eUhKcnltdEs3ekFCbVJIT2xsM3R5UW0xN2F6WlovS1RFSFU2bG5uZ2pN?=
 =?utf-8?B?WGpMQU5SbWNnaGxOZzlCWCtnemh3ZlFVWm9mSnRkVFVySmNWL3JBOU9rU2NN?=
 =?utf-8?B?YVhabWFxNGpwVUFLQ2dIaG5kVUtnZmthWVhUaW9FWWl2VnZMblFTNlFzdUYr?=
 =?utf-8?B?VFN1REs2aTlFV3FDdjNvSkdSLzc4NG1sSmdJSWVvVVVNd2tPdGpBTXNrdkUz?=
 =?utf-8?B?aTMvUXZ0emdvMkV2UjQvZ1pwdTBKRTBFcWFRZFlmNkhWNi9RWjg4UjhPem9J?=
 =?utf-8?B?MHJEeEVxY3BVWks0a05Eb25tbnk2a0pwdWE0WU5ybkNhQk05QVpucmxEWjNZ?=
 =?utf-8?B?KzI5MGVlOHVveHBOT2JIaXo1bTNzM2pXdmk3YnhmandxWUtJQXQ0ZVcvdFlE?=
 =?utf-8?B?ZWhHaWxaZm9GeHJKdGF1UVBPR1dTa1ZJbXZWZ0VmZlNTcWxsV09WUm1nZjR1?=
 =?utf-8?B?TEV3bnJNOTBNdW1GUUYrOXBPenQ2WTRBamVPK3JCYzZPWUFtaWxMS1BLclo5?=
 =?utf-8?B?VERSOXNpVGtsSVByTGZxU3ZGbGw2aHBwbnRKa0IwMEJENVFxd3FVQ3J5NzdZ?=
 =?utf-8?B?ZFlodFoxMFFWZDhySWtHc2Q5RWt0ZTRuRFhzZDZpVHJwRDRGU2JLYlkraVJU?=
 =?utf-8?B?OXUyWndJazlhL05CRWsvL0RCRWxMMGI2dkMvWWpIYzArMkJWaE9YWGZWZTFi?=
 =?utf-8?B?TktDRURGTndtQkpLMm5TbGI1eWhoaTV3NnprVHA4RUdheVg5L2hQbnlJNzQr?=
 =?utf-8?B?UytQOHZHeEFnNUJGb0NOY1NqV3BIdk4xbktMMzQ4NTdUcERlaTN0OEJTRCtU?=
 =?utf-8?B?R0tQNkV4MStTOVdUOTl0YmRLSUNUTENJcU01MzlRdXhwb3grbmJmVUNvSWNx?=
 =?utf-8?B?cUdyclJra24yeS81VFJuQnphdk5YTXRYTUJqb3NRcWVrdHRVTzI4aHlCdGVo?=
 =?utf-8?B?WGhMWWZqYzZoQ1RNYzhFbWxMVnhFSW4rNTNRVXFKU0o1TzMvSHgwOU1zR2JZ?=
 =?utf-8?B?dUJWejZSa1NFV2gvQ1FPZmVienAwMk9oUnBOKzliQnVWMjRkZC9SSGk1dHFv?=
 =?utf-8?B?aWtQQWRPQ21WTVI0SDNtMFBCRUxuY3cwTm1zeUluM0Z5QVBxQmgxMmNmSWJK?=
 =?utf-8?B?REExVEF4YThrVXNKYzFMQU1PTGdyS2M3VTNlNUFRQlpVV2w0MXBDUE54NWgv?=
 =?utf-8?B?QndXTHhLZ0VuWGhJekdiZ1RwRFhuNllRYnJUZERCd2hwWnRDZnFHQjYxaEl2?=
 =?utf-8?B?YWt5VUZ2ajNEMzNOZU4yODlaVXl4STZ4ZUtkWDlyV3NMcHcyR1RnNDBPVVdi?=
 =?utf-8?Q?mN5TW+wMWCTy0JfVIs9eYbHnR?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 29d322e0-8067-44ec-1b47-08dd912efcf8
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 May 2025 08:28:35.6544 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bWhBTMZeu6iDLsxSehJEFARcFbtapyThH0GH0Ilvw5TVvguuEOhm4L4bMBV7gUiN
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR12MB5751
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

On 5/9/25 17:33, Tvrtko Ursulin wrote:
> Access the dma-fence internals via the previously added helpers.
> 
> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>

Reviewed-by: Christian König <christian.koenig@amd.com>

> ---
>  drivers/gpu/drm/i915/gt/intel_gt_requests.c | 4 ++--
>  drivers/gpu/drm/i915/i915_request.c         | 2 +-
>  drivers/gpu/drm/i915/i915_sw_fence.c        | 4 ++--
>  3 files changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/gt/intel_gt_requests.c b/drivers/gpu/drm/i915/gt/intel_gt_requests.c
> index d1a382dfaa1d..ae3557ed6c1e 100644
> --- a/drivers/gpu/drm/i915/gt/intel_gt_requests.c
> +++ b/drivers/gpu/drm/i915/gt/intel_gt_requests.c
> @@ -252,8 +252,8 @@ void intel_gt_watchdog_work(struct work_struct *work)
>  			struct dma_fence *f = &rq->fence;
>  
>  			pr_notice("Fence expiration time out i915-%s:%s:%llx!\n",
> -				  f->ops->get_driver_name(f),
> -				  f->ops->get_timeline_name(f),
> +				  dma_fence_driver_name(f),
> +				  dma_fence_timeline_name(f),
>  				  f->seqno);
>  			i915_request_cancel(rq, -EINTR);
>  		}
> diff --git a/drivers/gpu/drm/i915/i915_request.c b/drivers/gpu/drm/i915/i915_request.c
> index c3d27eadc0a7..4874c4f1e4ab 100644
> --- a/drivers/gpu/drm/i915/i915_request.c
> +++ b/drivers/gpu/drm/i915/i915_request.c
> @@ -2184,7 +2184,7 @@ void i915_request_show(struct drm_printer *m,
>  		       const char *prefix,
>  		       int indent)
>  {
> -	const char *name = rq->fence.ops->get_timeline_name((struct dma_fence *)&rq->fence);
> +	const char *name = dma_fence_timeline_name((struct dma_fence *)&rq->fence);
>  	char buf[80] = "";
>  	int x = 0;
>  
> diff --git a/drivers/gpu/drm/i915/i915_sw_fence.c b/drivers/gpu/drm/i915/i915_sw_fence.c
> index 1d4cc91c0e40..e51ca7e50a4e 100644
> --- a/drivers/gpu/drm/i915/i915_sw_fence.c
> +++ b/drivers/gpu/drm/i915/i915_sw_fence.c
> @@ -435,8 +435,8 @@ static void timer_i915_sw_fence_wake(struct timer_list *t)
>  		return;
>  
>  	pr_notice("Asynchronous wait on fence %s:%s:%llx timed out (hint:%ps)\n",
> -		  cb->dma->ops->get_driver_name(cb->dma),
> -		  cb->dma->ops->get_timeline_name(cb->dma),
> +		  dma_fence_driver_name(cb->dma),
> +		  dma_fence_timeline_name(cb->dma),
>  		  cb->dma->seqno,
>  		  i915_sw_fence_debug_hint(fence));
>  

