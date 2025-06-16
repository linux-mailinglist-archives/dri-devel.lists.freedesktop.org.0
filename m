Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 13C01ADB16D
	for <lists+dri-devel@lfdr.de>; Mon, 16 Jun 2025 15:15:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 54FCA10E37A;
	Mon, 16 Jun 2025 13:15:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="BYI/tut3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam04on2068.outbound.protection.outlook.com [40.107.101.68])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C974010E306;
 Mon, 16 Jun 2025 13:15:21 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cZcgPKP7tnSnD2nrCs6tBFTSGycJmEczw7dkBrrvFNAE/ZQQ7PaEol6Xmc80/BsXxEcufdfZnGbN9Yn1sHNsalX8RCPiwdz3mANE4vw1oBOrwqAxK5g77qu8/P4M6f/wK3SnTw79X5O0368ni2wlFwS2iY5ESGJQGja7uzYRdAD83X/+B0FwSS8CAVqCocjoPOFc57huvgXdC75AMzfJf4IeVRauTu9qzglOMF47rRRnk98h6d5hmN/wuKz5cxUbziJxajIgn5VctPkAJyKJkvUg1eQTpv+/QHoLwzUxuNBjgcx0j3q9Tk2L87sdSGPlRNrksnz5I9qRzNlE3peZOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=r6/ARpgtn3TyGt7G+wrKOrQP6POfbgOm+3x0jE2BXqI=;
 b=OxazJIaAGumXPlKCKYCG8mE6JcJdlb1ofUK4fA2nQbjzak/bSbMS4hwaHgFVddlFtJbdmHOvLnRyDeguxwqkAyvMz+bfPV8JzNQR8gFd3tWcOWVcZOxQffN60qd0f8TRQuSBMbBJ38WwQm41M5hxMQVxx96NKDbxy2s7+RC38PSP99hC4hMmGAXGL1ExoYmBP0Vr0X3ijwd0iHtq6lIi6khIBF5/xDtNE/JoM5yEQavDc7jCT/t2uBsR94ipnLhzJOs7PrhnR2eqsIl6gylSgChRRQ/jMigAknAjpvIeuMzAoGvdg5/gvyleDUsgwQoXdVfkDsFkqHT5INmsr5yopQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=r6/ARpgtn3TyGt7G+wrKOrQP6POfbgOm+3x0jE2BXqI=;
 b=BYI/tut3fUmH/M1VcaVbiQFYNEmJy6qbexaQFoQZfHHnrwS0inhxjFp1plM7JagKPBv1HvQgg+6l7a1BPFM5whIw1Sd0dYuM7z5dZ9xKaEYJhY8X1mBDBwTD/Qwcucqfp+O//KFGazamGfodWgZ6Hs8BdYRTYP+BepFhPy3j49M=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by SA1PR12MB6845.namprd12.prod.outlook.com (2603:10b6:806:25c::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.29; Mon, 16 Jun
 2025 13:15:19 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%7]) with mapi id 15.20.8722.031; Mon, 16 Jun 2025
 13:15:19 +0000
Message-ID: <b40bb76e-0643-4376-b9a1-978830747668@amd.com>
Date: Mon, 16 Jun 2025 15:15:14 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] drm/ttm, drm/xe: Modify the struct
 ttm_bo_lru_walk_cursor initialization
To: =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 intel-xe@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org, airlied@gmail.com,
 Matthew Brost <matthew.brost@intel.com>,
 Matthew Auld <matthew.auld@intel.com>
References: <20250613151824.178650-1-thomas.hellstrom@linux.intel.com>
 <20250613151824.178650-3-thomas.hellstrom@linux.intel.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20250613151824.178650-3-thomas.hellstrom@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0015.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a::25) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|SA1PR12MB6845:EE_
X-MS-Office365-Filtering-Correlation-Id: f3f9c696-24f1-448d-8aca-08ddacd7d783
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?SVBTd25PeGZvaUVXQUhHZCs3dC9kcVlhU0NyeSt3T3pzenZEZ2I2Y0Nvallm?=
 =?utf-8?B?KzhXQnFINU1OTERacnJFL1A2SDhQRVpOWm5LUURJL1JFTWgxZWhZRGcyeklz?=
 =?utf-8?B?OUlxYS9XY0c2S1FwKzlPd1VYYjVPTWRYWjhNR3Y5VVRyUldOVDArNjhjRm1a?=
 =?utf-8?B?M3FuU0NUb3FtRERhN21xOVQzQmgvZXgxMks3dmRabmFRN1o5ZXNsZUh0Witv?=
 =?utf-8?B?RDlXMFlzQU50THdLNUg3dSs1SEx2a3VadTVCTFVwc091QjJ4THVqSDd3cE1k?=
 =?utf-8?B?cUhPUmlqSHZJMGZDb2NsaG1JT2xsSitwUUdBdkVUWkRpK1FpdXBUZS95a3BF?=
 =?utf-8?B?R0h0ZW94QW9jRGl6cDJNMUxqUk9aUXZtUlNiTjVKR2dndkVIcmMxN2ZyL2Jp?=
 =?utf-8?B?K25oR3VtMzJWbXBUTGFsSmtLNjNBUklManVoZlFEbURlSzZzdzNaQ3E3eFpR?=
 =?utf-8?B?TjUrcmc2MVlYdUJyUllDQ2hmdVJGMzVmQTFsNXBPSXlBLzdOSzF3ZGR0WktJ?=
 =?utf-8?B?aWtEU1pBaVRQak1kRk1URU43YjYzcm1raTROc1ZRbHFYOW80YU9saFViM1U1?=
 =?utf-8?B?Q0N2TU5ycGZIaUtVWk1SZUJ3YUJuZk9pYjlCSHFYbkZiUExlQnNDVTN5RVEy?=
 =?utf-8?B?a1dXZEJyR3I3bXB2UUtuaDhhM3o0RGY3SXUva05lT2lWWTNMZytUR0JHSHh6?=
 =?utf-8?B?Y0pyMmppUXFUNU1wUlBxQXA5cjA5Qmd1U0dLa09VbmcvVGZkR3o1d2RPVVQ5?=
 =?utf-8?B?YnJZL0l3RUFGQXBPVU80SXZMbzduY1kyRThWZkFKUlh1UXV2Qk5mdmdLNXNN?=
 =?utf-8?B?cjY3VmZnTUNENllJRmxLRTlsSWprZ2pNUGI0eGZEaXRTSldlVjNJSVJHczVF?=
 =?utf-8?B?a3Bvdm9yNUlsZ05GZnRKelFFVmw2SFlqZHd4OTlYZnVYdEE4Z0VFUnB5dDdW?=
 =?utf-8?B?VitXRThZSWxVU1g0S0FpUXczN0t1emNlRksrNy9OVEpQSDJDZDd6bG1WNnA2?=
 =?utf-8?B?cVM5MWhrY0g0ZzJKM0Z0ckMzUU5qY2thd25ZY1RzajFzdHgyMXlwSkNEK1ZX?=
 =?utf-8?B?TDNSd1NsQ3dMdGV2dkRYL040MElQQ29BeGJ2SHRlOHI0M1BLNkU0dFc1SFVn?=
 =?utf-8?B?ektGeEJuaVZKV3lRcUtjZllzaHdLSW5DelM3Z05BZlVLUE1JdlZ4dkI1OFVH?=
 =?utf-8?B?djh5Y1RXaHIrZDFkNWtmZkpTMWo1VWg3RkdiQWEyZzVzdEcvK1pPRDZPUjRJ?=
 =?utf-8?B?ZTVaMVpXR3YrMldSVk83c1U0TWQxRXovL2FoWWMvZCtrSDI3MTVCWHIrYTg2?=
 =?utf-8?B?K2lyNFBCU3JmdFE2anJmVm1ZcGtNVyt1ZUZYdldxS3ZCUnNkK1dnWXp6YVdB?=
 =?utf-8?B?UjJ3SGlHaDl1a094NTY1d3VoWFpzZzFEenIrYUNSbllqVXpyMUowSkZ3YWVu?=
 =?utf-8?B?UzdkSHE1VE5POXpGRURZcmtYZ0FMQWxCemZKQytFa0tjcm9DRUFiNXk1a2Fw?=
 =?utf-8?B?bk5scFhFYng3VUxVUVhkOG5aZEMzOUlpRWNrdW9VOTl5bURUUTBVNzlxWmNU?=
 =?utf-8?B?MmZXMlZlSkc2ZlVPbXJrT3NkTEJmZWVqY0NTU01OcVBzN1BianJGZ0JiWkdo?=
 =?utf-8?B?bFRxbzNybzNGbTRFUFVWcE1sL3FlSTNXNzZXbEkwZlpNMmpJRktuUnZKaDY4?=
 =?utf-8?B?WXBwNDVPdGxGVmE2MmVSUE9hazhZYXpLb0EvK3pOYWRiRXpVcSs1TEtPL2Zv?=
 =?utf-8?B?ZGRhWGhIVVpwRC94VUFzTzM4TzBaakc1RVZjaWhBKzh1MkV1QkNINTZFQ21m?=
 =?utf-8?B?QXpSa0tSUUpUM2ZKajFnQTArWjRrVG5kR3ZXTmU4S3lzSmdRSnJrNk84R0Zx?=
 =?utf-8?B?WEhieldxYTBnTTJZeS80YkRMT2IxbnZOeVRwSS90Q0ViOFE9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dStVK1NaWmpERkhTb0xHb2lrSUYzb0xtY1pyVnIvbUMvZDFDVCtoL3JCclJa?=
 =?utf-8?B?ZERyTEUvNUhxL2wreVdPa0gvQU16Mno4RnhubWtJdVJwK1pJMFdqQy9FbDdN?=
 =?utf-8?B?OVhNamJ6ZkhTcUlwRTNkYkFVQ01TUHphSTMzWWM3MWY1c0FJR1hQd2F1M00x?=
 =?utf-8?B?bVVqS01IZCt4dFRDOW9IMGdkb3RWVjJuWUQ3YlVwdEpTMDlQZzQvbXpzbkQx?=
 =?utf-8?B?WTQyMEQxY3A0c2xxVjUzMHI5V1BhUmRzZG14c2FwZXlMeHVaVXVIYmZ0eXpk?=
 =?utf-8?B?S3ZxTW9palRiWkxzbkJWQmhGaVI1UytPeG5uOElBMnZNR2huZXp6ek5ENEh0?=
 =?utf-8?B?Y0plVmpKT005RTdqL3d4Z1VnckRhYm5sZDFpZ01GZ3BRQmVyMEFSQWFrZFhK?=
 =?utf-8?B?Y090RmlkcUZKbUZZd1pLbXJrODN2bm5NRFBzd2Z0RGJHWXBVZVhTMzVDdGRR?=
 =?utf-8?B?L0VqaUN6b3drZkp6TnJscGZlSEdaV3JrVG92OUc0ZGNvSXlpcjNNLy9JWXJ2?=
 =?utf-8?B?SVBzOHlDemluTXQyRHBoUWlYaHdXWlBEc1dpa1lSR0RaV0FHdnpSM0JNQVNM?=
 =?utf-8?B?a2w4WEtSdW5YRmNkaGFZc1JmRkY2anljOEtja3ByRFdzYUNrcWM3NDJkbVBZ?=
 =?utf-8?B?SEY5Vit2VGhNWWlNdEJqYklKZHBzalFRdWxQRm9TZjNUK05TdE9hYUQ0Uk53?=
 =?utf-8?B?Y1RwY2FJbHJyZ1BucDBmbDZKQUd0YUdJV3VCVGMxOFVJbWZvVEVLWmQ2bUxv?=
 =?utf-8?B?VnhRYlNpWHA2ZXFuRFhrMFBqMkNrc01POXh5UE5lYVJld1hVaW56KzZjMjRW?=
 =?utf-8?B?K1NYTVlyRmp5Z1RUL2NBWUp4SUROQmt1UzFPbXNOS29DNzU4a1BKQjRsM1lK?=
 =?utf-8?B?cEFnV292ZWw3S09vNENlUzVvYklONjBIelJ0bWFJdnA1V0YzZzF0cFdGTC9J?=
 =?utf-8?B?THZyc1AxOTlIZkpkN1l6SWp3bkxsR1FWRHl6Wno4a2VwanRTWU16TjJVMnZS?=
 =?utf-8?B?bFFZdVVaRHdiaWhNV3MvOG5waURsWjJiOSt5RnhNY00xUVV3UlJSaUVISWx1?=
 =?utf-8?B?V2ZwZzFTd2ZENXJ3SjBFYXBFQ0E5a0phSG82Y2RCeGU4QWozSVdIaXRwTFgy?=
 =?utf-8?B?dmxRWHVpR3IrU1Y3TDVqb1EvRGx3bjVQTzdVeEZSZXFBa3Q1dDh4OU1aajR2?=
 =?utf-8?B?TDQ2VUxqQVNiUXY1UkZxQWhnOTJQNzI0UjhlT3pZWEpML0loNWV3TWw2T1Q0?=
 =?utf-8?B?QlBsVHdxTjJncS8wcWFXN05qT1ErZkQxS3hTOURiU1E3dWJ1TWtad2wzUTcx?=
 =?utf-8?B?L1FuN3B5K0tuM3BLQm5PY2VEbEsrelNva0V5MDdKdHlCZCtFeGtucHIxSEtT?=
 =?utf-8?B?M2ZVR1ZoZHdGYnQ1bXBFZHZ2cUJHSkJXd2EwSXJYV0NlUE5NTXg5R1NVYUhi?=
 =?utf-8?B?czdNLzgyYnpuYUNkZU9IQThpMDI0dWFlVzQ5WlBWc0IyRXNXZUJ4TTV2TGND?=
 =?utf-8?B?RkJ1YmNjS2lqMlBpUFpVd2NJTnhFaDJaTjlpMmJqcng0UDFhSlFYREV0cW40?=
 =?utf-8?B?WG14c29PaTA1VlRRN3UxVi9uUEF1UkIwaEtIaEFpVlN5dXk2ZUhpczZlQWYr?=
 =?utf-8?B?aCtCY2NGR0gzKzJhZnh3QkZPS25zOThDT3R6OHZITGlqZmJuL2p3MitPZll5?=
 =?utf-8?B?ald2Y1B1N01EV04zUGF2YVovRHUyRy9BRWtUNm83QzJJbDZ0MzI2VDhOMnJR?=
 =?utf-8?B?ZDJxU1FzcXZ5RXJtMGh6RzgvbUQ4RmNxNkZjMEtCd3c4emhDVE05bWxYSDMv?=
 =?utf-8?B?enNVQmlqS0UybE90NUkwcjZsNlJxMzE1b2RZOWFUUW9kbkx6eFpQbjYyYjNG?=
 =?utf-8?B?T2JMMlVqUnRjTEdFYllRK3JUZC92RC9oZlFzdFY5M1NaSW1YUjd6c1FyeDV0?=
 =?utf-8?B?S3BaS016c3lEMGpmVXpwbkUyUTFjQitQZXVWYmxvSFRneitOam5KQkNSZkxB?=
 =?utf-8?B?eWM1NlpuZThXaHh5aFZuT25aNklUcGtBMmovUmdGVmlBcm5mK2lGc0tCa1FZ?=
 =?utf-8?B?ajlYYjVDWEFFS055ZjdYTU5BMkF3Smlmc1ZQaWNOcjlpeDFRRDVhU1Y1TkRF?=
 =?utf-8?Q?mw2/ycKgcpKlLt+SAWAIvfpwJ?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f3f9c696-24f1-448d-8aca-08ddacd7d783
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jun 2025 13:15:19.1926 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Bwk1xP8+TjGVsZn9+rfexkWgnt/yJOsaePaDQgerJHVm3bdNb3yjfCp8mQ1eECUG
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB6845
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

On 6/13/25 17:18, Thomas Hellström wrote:
> Instead of the struct ttm_operation_ctx, Pass a struct ttm_lru_walk_arg
> to enable us to easily extend the walk functionality, and to
> implement ttm_lru_walk_for_evict() using the guarded LRU iteration.
> 
> Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>

Reviewed-by: Christian König <christian.koenig@amd.com>

> ---
>  drivers/gpu/drm/ttm/ttm_bo_util.c | 10 +++++-----
>  drivers/gpu/drm/xe/xe_shrinker.c  |  3 ++-
>  include/drm/ttm/ttm_bo.h          | 16 ++++++++--------
>  3 files changed, 15 insertions(+), 14 deletions(-)
> 
> diff --git a/drivers/gpu/drm/ttm/ttm_bo_util.c b/drivers/gpu/drm/ttm/ttm_bo_util.c
> index 600145cdeb9c..62b76abac578 100644
> --- a/drivers/gpu/drm/ttm/ttm_bo_util.c
> +++ b/drivers/gpu/drm/ttm/ttm_bo_util.c
> @@ -956,11 +956,11 @@ EXPORT_SYMBOL(ttm_bo_lru_cursor_fini);
>   * ttm_bo_lru_cursor_init() - Initialize a struct ttm_bo_lru_cursor
>   * @curs: The ttm_bo_lru_cursor to initialize.
>   * @man: The ttm resource_manager whose LRU lists to iterate over.
> - * @ctx: The ttm_operation_ctx to govern the locking.
> + * @arg: The ttm_lru_walk_arg to govern the walk.
>   *
>   * Initialize a struct ttm_bo_lru_cursor. Currently only trylocking
>   * or prelocked buffer objects are available as detailed by
> - * @ctx::resv and @ctx::allow_res_evict. Ticketlocking is not
> + * @arg->ctx.resv and @arg->ctx.allow_res_evict. Ticketlocking is not
>   * supported.
>   *
>   * Return: Pointer to @curs. The function does not fail.
> @@ -968,11 +968,11 @@ EXPORT_SYMBOL(ttm_bo_lru_cursor_fini);
>  struct ttm_bo_lru_cursor *
>  ttm_bo_lru_cursor_init(struct ttm_bo_lru_cursor *curs,
>  		       struct ttm_resource_manager *man,
> -		       struct ttm_operation_ctx *ctx)
> +		       struct ttm_lru_walk_arg *arg)
>  {
>  	memset(curs, 0, sizeof(*curs));
>  	ttm_resource_cursor_init(&curs->res_curs, man);
> -	curs->arg.ctx = ctx;
> +	curs->arg = arg;
>  
>  	return curs;
>  }
> @@ -983,7 +983,7 @@ ttm_bo_from_res_reserved(struct ttm_resource *res, struct ttm_bo_lru_cursor *cur
>  {
>  	struct ttm_buffer_object *bo = res->bo;
>  
> -	if (!ttm_lru_walk_trylock(&curs->arg, bo, &curs->needs_unlock))
> +	if (!ttm_lru_walk_trylock(curs->arg, bo, &curs->needs_unlock))
>  		return NULL;
>  
>  	if (!ttm_bo_get_unless_zero(bo)) {
> diff --git a/drivers/gpu/drm/xe/xe_shrinker.c b/drivers/gpu/drm/xe/xe_shrinker.c
> index 125c836e0ee4..f8a1129da2c3 100644
> --- a/drivers/gpu/drm/xe/xe_shrinker.c
> +++ b/drivers/gpu/drm/xe/xe_shrinker.c
> @@ -66,11 +66,12 @@ static s64 xe_shrinker_walk(struct xe_device *xe,
>  		struct ttm_resource_manager *man = ttm_manager_type(&xe->ttm, mem_type);
>  		struct ttm_bo_lru_cursor curs;
>  		struct ttm_buffer_object *ttm_bo;
> +		struct ttm_lru_walk_arg arg = {.ctx = ctx};
>  
>  		if (!man || !man->use_tt)
>  			continue;
>  
> -		ttm_bo_lru_for_each_reserved_guarded(&curs, man, ctx, ttm_bo) {
> +		ttm_bo_lru_for_each_reserved_guarded(&curs, man, &arg, ttm_bo) {
>  			if (!ttm_bo_shrink_suitable(ttm_bo, ctx))
>  				continue;
>  
> diff --git a/include/drm/ttm/ttm_bo.h b/include/drm/ttm/ttm_bo.h
> index 4e52283e5db1..8f04fa48b332 100644
> --- a/include/drm/ttm/ttm_bo.h
> +++ b/include/drm/ttm/ttm_bo.h
> @@ -484,8 +484,8 @@ struct ttm_bo_lru_cursor {
>  	 * unlock before the next iteration or after loop exit.
>  	 */
>  	bool needs_unlock;
> -	/** @arg: Common BO LRU walk arguments. */
> -	struct ttm_lru_walk_arg arg;
> +	/** @arg: Pointer to common BO LRU walk arguments. */
> +	struct ttm_lru_walk_arg *arg;
>  };
>  
>  void ttm_bo_lru_cursor_fini(struct ttm_bo_lru_cursor *curs);
> @@ -493,7 +493,7 @@ void ttm_bo_lru_cursor_fini(struct ttm_bo_lru_cursor *curs);
>  struct ttm_bo_lru_cursor *
>  ttm_bo_lru_cursor_init(struct ttm_bo_lru_cursor *curs,
>  		       struct ttm_resource_manager *man,
> -		       struct ttm_operation_ctx *ctx);
> +		       struct ttm_lru_walk_arg *arg);
>  
>  struct ttm_buffer_object *ttm_bo_lru_cursor_first(struct ttm_bo_lru_cursor *curs);
>  
> @@ -504,9 +504,9 @@ struct ttm_buffer_object *ttm_bo_lru_cursor_next(struct ttm_bo_lru_cursor *curs)
>   */
>  DEFINE_CLASS(ttm_bo_lru_cursor, struct ttm_bo_lru_cursor *,
>  	     if (_T) {ttm_bo_lru_cursor_fini(_T); },
> -	     ttm_bo_lru_cursor_init(curs, man, ctx),
> +	     ttm_bo_lru_cursor_init(curs, man, arg),
>  	     struct ttm_bo_lru_cursor *curs, struct ttm_resource_manager *man,
> -	     struct ttm_operation_ctx *ctx);
> +	     struct ttm_lru_walk_arg *arg);
>  static inline void *
>  class_ttm_bo_lru_cursor_lock_ptr(class_ttm_bo_lru_cursor_t *_T)
>  { return *_T; }
> @@ -517,7 +517,7 @@ class_ttm_bo_lru_cursor_lock_ptr(class_ttm_bo_lru_cursor_t *_T)
>   * resources on LRU lists.
>   * @_cursor: struct ttm_bo_lru_cursor to use for the iteration.
>   * @_man: The resource manager whose LRU lists to iterate over.
> - * @_ctx: The struct ttm_operation_context to govern the @_bo locking.
> + * @_arg: The struct ttm_lru_walk_arg to govern the LRU walk.
>   * @_bo: The struct ttm_buffer_object pointer pointing to the buffer object
>   * for the current iteration.
>   *
> @@ -530,8 +530,8 @@ class_ttm_bo_lru_cursor_lock_ptr(class_ttm_bo_lru_cursor_t *_T)
>   * example a return or break statement. Exiting the loop will also unlock
>   * (if needed) and unreference @_bo.
>   */
> -#define ttm_bo_lru_for_each_reserved_guarded(_cursor, _man, _ctx, _bo)	\
> -	scoped_guard(ttm_bo_lru_cursor, _cursor, _man, _ctx)		\
> +#define ttm_bo_lru_for_each_reserved_guarded(_cursor, _man, _arg, _bo)	\
> +	scoped_guard(ttm_bo_lru_cursor, _cursor, _man, _arg)		\
>  		for ((_bo) = ttm_bo_lru_cursor_first(_cursor); (_bo);	\
>  		     (_bo) = ttm_bo_lru_cursor_next(_cursor))
>  

