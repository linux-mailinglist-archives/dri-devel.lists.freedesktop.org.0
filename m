Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 672D395F899
	for <lists+dri-devel@lfdr.de>; Mon, 26 Aug 2024 19:57:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE28C10E256;
	Mon, 26 Aug 2024 17:57:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="RMiyrHRJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2063.outbound.protection.outlook.com [40.107.220.63])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B95D810E235;
 Mon, 26 Aug 2024 17:57:41 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MxfN21uRKop+t7i1GdmC52kxryapKHKe52B1oAOqBndx6nu2cEOhNrNTJFHjVDUFr2lgim177G/DhMOU86lsRWK29QZgEavg8KOtvUQ/jzfnPG5LMduudINw1AsV86lJKmE4HZPaQL9AXOYuHDHBqtzXa+yIltTMxgs7c7B+KZnJqXAix3qbDIraSJZqqoNxhuQ3HlDeBIxAcywqAwE1yJDIWgXtNsHLdWPwMEMHLZcbaCi7e/BpxNntuRVlsBWBLWG2jnathKAgsBa22YUFKf0pZU2HJeZr2/7X63b0ruBlpel1fFYkK53gjZo9D6aVU5SMmhm75JWaGRSspvZ7sw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ypo7sm3XorfHlJSLZslOJO7wWEy+uJOIqEVSBCdVFHo=;
 b=sy6Ye5BacAzbDJQCN5yyFFPbv6tMgjH74xZzEuyyg2+S4hJZFCskryBoC1a4PMRRGmDYhBTTA4bYy+GOncz10YvbGkCLe8V6jfhwcKADTB4pWjve00SIq00pLctGfkSjFxDCWeL420Tvr7AwI4bQwgv/nSoSrK3gSX2CPD+IeVazTzEL2pKVdsfscRtB30AoagArY79GNCsCVd1aZjYE1ZhR72iqEh3Wvn0OdVDIV8n3B8v+78DHoBPERXgSPn4GwIakIF4oc0dv5QzcyhndC3qRq6NBW+OTW56C3KmbEDeeVzkSBKk21Zfn9/5VjYThDoxGp9/gr3CoIisS5P9ccg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ypo7sm3XorfHlJSLZslOJO7wWEy+uJOIqEVSBCdVFHo=;
 b=RMiyrHRJ8rr3+3wK0wUBmKYVWfdVOsygctsRYJuRI9PP1s1s34JyxqLnAedvjGppuhB1pilyPeJog/Ec4pYtVDXvn7sCLyIYuwzr/9dEe0qs1eMdUBK1yYt45I8z47OJvAmYxCbBEMPoA31yfoCQVYN66kUvPE22V8/IOugRiTA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by PH0PR12MB8174.namprd12.prod.outlook.com (2603:10b6:510:298::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.25; Mon, 26 Aug
 2024 17:57:39 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%4]) with mapi id 15.20.7897.021; Mon, 26 Aug 2024
 17:57:39 +0000
Message-ID: <16fb99f8-2f7c-4abe-9ef5-23ea51e69d87@amd.com>
Date: Mon, 26 Aug 2024 19:57:34 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] drm/xe: Invalidate media_gt TLBs in PT code
To: Matthew Brost <matthew.brost@intel.com>, intel-xe@lists.freedesktop.org,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org
Cc: thomas.hellstrom@linux.intel.com, sumit.semwal@linaro.org
References: <20240826170144.2492062-1-matthew.brost@intel.com>
 <20240826170144.2492062-3-matthew.brost@intel.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20240826170144.2492062-3-matthew.brost@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR5P281CA0050.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:f0::6) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|PH0PR12MB8174:EE_
X-MS-Office365-Filtering-Correlation-Id: 2000b2ad-c215-4f7e-2a56-08dcc5f89305
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?L25hSFlpcmlaT2dwSFI1N3NyaUhBQnFNenQwR3ZVTWtvRmhua1FaaUhZUjBj?=
 =?utf-8?B?K05LMGcxdnhTTUlvUU9jN0ExQzZCVktKRTVEL0NDQlVHQ1h2Mm14Uy9nTlVC?=
 =?utf-8?B?MHFjWGxabThTTG5CQzcxQVdadlhhNENKV0w1RWJJemlGTDhoNGsrWXJid21B?=
 =?utf-8?B?Z1FzWWVRMHAzZTFrM0EzMm9jbHdRYStNcmxuc0Q3Zndmd0RUV2NMRzNoSHJY?=
 =?utf-8?B?NWRoMzJKZkFrdTA3VmNJVStEUEpEcHlZaURRQ1NZTmV3Zko5dTZYaCtFVDBU?=
 =?utf-8?B?em9IdjcxZlZGMlViQS9iV2xYZnFXeGIrczZQeGMxaWRDeldjWDNobkNwZW5C?=
 =?utf-8?B?K1JLcnJXR3ZCQU05dks4L3piaUtWUUFTbVl4cDBrUUVsZUNTS2xlK1ZnckNE?=
 =?utf-8?B?NnJFODFOWDd6ajc5Qk1JSEJaUkZLMXhyTmZGVXNvdllmbkRqZDhGcGRLU1NJ?=
 =?utf-8?B?QlJaemNvRmY1eVNPdEg4SXJtdmtsY1hmRTliL1I5SzczM08xN3ZBV1AyaEYy?=
 =?utf-8?B?TWZaL2dGQkVMVnJSWU0yV25vQlFuUEwraFl6SnpLNUZySThhWk9SV2swOW05?=
 =?utf-8?B?eVJWM0ZHdmp5UjQybE1TTmlEbDZQMWMyQUd2Sk9qNU1aeHRXeG9nT3hLQXkr?=
 =?utf-8?B?KzJvS3BMclhucGowVHhnNmppcGF2YWpFbWZMQU5aYmpUVXRmd3I0Z3RaWS9t?=
 =?utf-8?B?eUJMdWVycS9TTklYUWhud2h0c2cwWFIxdyt3NkloSXdIVG84TUZ4Q1ZwUHI3?=
 =?utf-8?B?V0RWam0vWjZCbU9WZVh3TS9EY3dPRzBaSEtyT3BPWEtjSVpFeHArL1FwNXRV?=
 =?utf-8?B?bDdELzgzYmFwZWZpb216dFl6TXZIZlhSWG9QYll3ZGEwSEZ2VlcxdS9UODRD?=
 =?utf-8?B?Ylh1Tks4MlJrMllDNGZXU1JERTZYcDBYeFRjd1NnUktDVUpmQzF6VkxtWTNx?=
 =?utf-8?B?V1FYOVFHSDVVSk8xT0NLNzJJN0pYeS9LUnJHWmNDZUdoenZTMEJOKzUvTWl2?=
 =?utf-8?B?eWVlYWc5ZGkxNzlXWVBjdXlIYitFZmJheTFmU29uRC9mNTFUTUFXNEFLczNk?=
 =?utf-8?B?K2lWMEc1RGZVeG9lYlpySDM5b2tESVBtR05OaDRheUUrb29oZFJCQ1RlaU14?=
 =?utf-8?B?cUVIdW1VK0FoSFkxbU8vRXJGOFpnMWkxd1RySWQxUGRjb01JemJJVTZMVk5O?=
 =?utf-8?B?aFpoVldMKzAvU0lIWm5UZFpUc2x4RmtsTUxadm90ckJteXk3SkNzemdKcW0r?=
 =?utf-8?B?SEJBMTBRNytSWm9uSDdXTVNVOXgxZG1zTnhLSXFlcW9rU3JieVhaeXYxaFdl?=
 =?utf-8?B?MCtsM3JJU2hDOHVIVzYxZjZRcnk2S3FlKzNIelhmY0NPUmJHM3BoaHdqc3Zq?=
 =?utf-8?B?NkhjUnE0S3hqWncyRTdHc0g0WVFBY3JpUXRaQ1Nwb09CbnM4eG9PN0lZbjhK?=
 =?utf-8?B?SUp4czFVMnZDZHZLUW10aXl2Q1V4eFhyT05wblB5OXU3MlFsZkdNYUFybzda?=
 =?utf-8?B?TEtyb1l0c1FFWllVOGtsQWp1S2IvYnpPL3JtVFFKb0lVVG9DVnRZR1VacVVs?=
 =?utf-8?B?QkkxdGpia3g3b25RS1FRQ3JZVVQ1eXlsQnRET05IUWhEM2MrTjBJcmNWcTBj?=
 =?utf-8?B?cFF4Z1BzWGs0MmtCQVZoaXF1UDNKZ29uYmUxRzlKWGZ4RTFDS2hRUTZMdmc4?=
 =?utf-8?B?czBBM3VwSnllNStGS3dKalNRMFh2Mk1aWWIzVTVUbnJsbEIzQlVPenZDSGNt?=
 =?utf-8?B?VFN3aFIrbWxqMWZmK0QzMVlvYlBXODhKZkRMaTAxRWlvbHdnU0E1WlZGVlc5?=
 =?utf-8?B?UjUycEprSWFnRVpodGo0QT09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?R1dlTXhQMTExN1BaTE9LU005bnU5TTgzaGxzMVplempKeHEyWGpUMnFJWkdR?=
 =?utf-8?B?L1Z6QnFQTVhWM2ZBUXVYaG04WUIyazltRWg0V2YxS1BmR3A0WjBsRXZGdlc0?=
 =?utf-8?B?SnpJMkFRV2JlWUU1RVoreUQxcHk3NmlBRjBXeVBIWFdveHF2YjJtS1UwaCtM?=
 =?utf-8?B?VDJKeHpLUG9EYzVEeWtCSmExZUhkRHJMUmxMeUgrMmhqU2ZEQVJuVTkvT1Jw?=
 =?utf-8?B?TUVDL1d5OGNBSTJWTmhqK2V4OU5LYkovRFFRc2pmWm8raEo2QnExSk5ZQ2VX?=
 =?utf-8?B?SHBGdXNyNjJaNk1yYXJha3VwRkR1RC9tVlN5L2dJVVRSdGRCaTJwU3hKYWZW?=
 =?utf-8?B?bStPb2VzRTJ4aCtKMWc4MWI0VW03T2E5YzgwbGpQWklCd2w2eWpydXRGVkQx?=
 =?utf-8?B?aXNZU1ZoOFE5ZzI2bEo4a3phVVBZWXdqMDVEZUlTaHkyWGNOU1hGUFY3SXZV?=
 =?utf-8?B?WFpqUlNET3M5WGh0UUZyTE5SS1hWRjF3VStnUDZ2Y2R6czI2eXE2VFoxeFdB?=
 =?utf-8?B?WTZlT21jaTdhZVBBM0NSczRTM3FKWVJxMDRjaTQzS3R6aVFWQ0w3WkJkOHcy?=
 =?utf-8?B?WHdkaDdkYjNOdVBRc01MbGlvTVRKMDU3RTI2aHpGQmVua3YyK01uMlErL2lU?=
 =?utf-8?B?c2MvUExQSCtlc3NTQU51Tkd3MnJFMEdQZ0FWM2daNjRpc015c29qcm5xYlhP?=
 =?utf-8?B?ZTRPODNrYnU4dk1RNEVUcm1tZGtWQzBXd2l1WVVBSmlIU05scURaWktjU3BS?=
 =?utf-8?B?RmtrbkcrS1JpaWpWNGxFbENVaG1JK25ZUVluZzdhVlFqejVhOE9zKytwM253?=
 =?utf-8?B?RUJIOU9NaDhVQ1JielltZ1BIVU9uYVZkQmlEVlMxN28zaS9TZHZrbm1vNUx5?=
 =?utf-8?B?Q1dQTFlHNm1ORVhTZitrL3ZsQjliSzBZVzVMUWJwbVhJSkxjMGZ4Q0E1OVZs?=
 =?utf-8?B?VlVrWUFzUlJvaG9udUdwZ1ZQRElFUEYzWUV1NytWTGx3eVNWTURTcUp5Z1Mz?=
 =?utf-8?B?V1o5Y2l5UlRwZVl2MXU3K1U2OTU4RkRDL25RL1hEeEovdFBwQTRTNTgydEJ6?=
 =?utf-8?B?a2lhUDJzMjZBVVpDZlYvOFoyNWtIWXZPdlcreDN3eUlUanh2dkZtdE10eU5F?=
 =?utf-8?B?eFF6Q3F1Z2pucE5RTnpoZmFNWDMvMnBndUIvOWJaMXFYS1ROWHlYUFpBRDlZ?=
 =?utf-8?B?UHcvb2Z3K3FyWjVScnFXMnlMZ2xmdEJjZjRjSTBBbXIwcEVFYy9ZZmtUMmdH?=
 =?utf-8?B?NHc2cE82UjJwZ2diSmNqbFN5K1pIQW9tbnNxUXovYUhRVUZRdzFWZmQ4elMz?=
 =?utf-8?B?MVlrOFdGUERRRjNHQlF6ZzRlakdkaW52M0J1cElZNlhZdkM1L3VCQWdNd2Ev?=
 =?utf-8?B?YlAwc1p3b2ZkSDZWTWV6TmpsaktRdks2UWQxZnl6WUVpL1BrcmRTK3ZOSVZu?=
 =?utf-8?B?MDN4K0p1RC9QSUlHTnlGRFcvY3J1QlF1b2xKT0NjNksrbDVITkJhUk9RcFBk?=
 =?utf-8?B?bytlRldFTkpyUmJZbDVCTjdMR3JETllLbnptQjQyemdMeUdPNEZqUklQRnFT?=
 =?utf-8?B?a3dRRTYwTUtkbzNkTHZXdTIwYS9rZ21oeVYvekRFQzZzSjVBNW5JZXpPVHRK?=
 =?utf-8?B?eHlBY1RTa1VsYWFVMjdHM1VVT1NVSGoycjNqUjVRVFREVW5GWGRVNUoxY3Bz?=
 =?utf-8?B?bDlJdXlFbWhGNVBjRFREY3dvaEx6ektwYVcxRnlZcTl1WHF1dWoveWk2NHlK?=
 =?utf-8?B?bkVhVkNaMGRhWGtoc0k4UDFCQmI1Z0dQRzJpcWRGTkJsOFR5RDdpS1J3R1gv?=
 =?utf-8?B?TWVLVmdxWUxmRDhMYklERTFtTDBaOXJSVmRJOTBySDlwRHZ0NE5ka0IvMmFI?=
 =?utf-8?B?RnNiT2ZtaWt2TkVQQ0FGOExQbzlMOFFFaElHSjJ6bGxITDFBbWRZb0xFZGZG?=
 =?utf-8?B?M2dQLzQrNjd3TzMwTTlzbm1OaVkwOE1GVzI0NFdaZWJQb21xSWh6elFrNjJz?=
 =?utf-8?B?TXY3U0VEaXpiL2NQZHpoVno2bXBpemt4RnI1d0ZDQWpRY3hGbnRzc0tZT0l0?=
 =?utf-8?B?RmFpc3Y0TGtIdTZIam5seVJTSy96MEFwSUY3OVVkUTh0UURBZG54bDU4Rkxj?=
 =?utf-8?Q?p/FCHZq/jQR9UF45A5V21GXI8?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2000b2ad-c215-4f7e-2a56-08dcc5f89305
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Aug 2024 17:57:39.1292 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pQBXvLn21ol0EXbFK1h2A5Vi4i9chXvDDtXgvGavgoio0iFhCCip3Czlg/93DQOr
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB8174
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

Am 26.08.24 um 19:01 schrieb Matthew Brost:
> Testing on LNL has shown media GT's TLBs need to be invalidated via the
> GuC, update PT code appropriately.
>
> v2:
>   - Do dma_fence_get before first call of invalidation_fence_init (Himal)
>   - No need to check for valid chain fence (Himal)
> v3:
>   - Use dma-fence-array
>
> Fixes: 3330361543fc ("drm/xe/lnl: Add LNL platform definition")
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>

Acked-by: Christian König <christian.koenig@amd.com>

> ---
>   drivers/gpu/drm/xe/xe_pt.c | 117 ++++++++++++++++++++++++++++++-------
>   1 file changed, 96 insertions(+), 21 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
> index 579ed31b46db..d6353e8969f0 100644
> --- a/drivers/gpu/drm/xe/xe_pt.c
> +++ b/drivers/gpu/drm/xe/xe_pt.c
> @@ -3,6 +3,8 @@
>    * Copyright © 2022 Intel Corporation
>    */
>   
> +#include <linux/dma-fence-array.h>
> +
>   #include "xe_pt.h"
>   
>   #include "regs/xe_gtt_defs.h"
> @@ -1627,9 +1629,11 @@ xe_pt_update_ops_rfence_interval(struct xe_vm_pgtable_update_ops *pt_update_ops,
>   
>   static int vma_reserve_fences(struct xe_device *xe, struct xe_vma *vma)
>   {
> +	int shift = xe_device_get_root_tile(xe)->media_gt ? 1 : 0;
> +
>   	if (!xe_vma_has_no_bo(vma) && !xe_vma_bo(vma)->vm)
>   		return dma_resv_reserve_fences(xe_vma_bo(vma)->ttm.base.resv,
> -					       xe->info.tile_count);
> +					       xe->info.tile_count << shift);
>   
>   	return 0;
>   }
> @@ -1816,6 +1820,7 @@ int xe_pt_update_ops_prepare(struct xe_tile *tile, struct xe_vma_ops *vops)
>   	struct xe_vm_pgtable_update_ops *pt_update_ops =
>   		&vops->pt_update_ops[tile->id];
>   	struct xe_vma_op *op;
> +	int shift = tile->media_gt ? 1 : 0;
>   	int err;
>   
>   	lockdep_assert_held(&vops->vm->lock);
> @@ -1824,7 +1829,7 @@ int xe_pt_update_ops_prepare(struct xe_tile *tile, struct xe_vma_ops *vops)
>   	xe_pt_update_ops_init(pt_update_ops);
>   
>   	err = dma_resv_reserve_fences(xe_vm_resv(vops->vm),
> -				      tile_to_xe(tile)->info.tile_count);
> +				      tile_to_xe(tile)->info.tile_count << shift);
>   	if (err)
>   		return err;
>   
> @@ -1849,13 +1854,20 @@ int xe_pt_update_ops_prepare(struct xe_tile *tile, struct xe_vma_ops *vops)
>   
>   static void bind_op_commit(struct xe_vm *vm, struct xe_tile *tile,
>   			   struct xe_vm_pgtable_update_ops *pt_update_ops,
> -			   struct xe_vma *vma, struct dma_fence *fence)
> +			   struct xe_vma *vma, struct dma_fence *fence,
> +			   struct dma_fence *fence2)
>   {
> -	if (!xe_vma_has_no_bo(vma) && !xe_vma_bo(vma)->vm)
> +	if (!xe_vma_has_no_bo(vma) && !xe_vma_bo(vma)->vm) {
>   		dma_resv_add_fence(xe_vma_bo(vma)->ttm.base.resv, fence,
>   				   pt_update_ops->wait_vm_bookkeep ?
>   				   DMA_RESV_USAGE_KERNEL :
>   				   DMA_RESV_USAGE_BOOKKEEP);
> +		if (fence2)
> +			dma_resv_add_fence(xe_vma_bo(vma)->ttm.base.resv, fence2,
> +					   pt_update_ops->wait_vm_bookkeep ?
> +					   DMA_RESV_USAGE_KERNEL :
> +					   DMA_RESV_USAGE_BOOKKEEP);
> +	}
>   	vma->tile_present |= BIT(tile->id);
>   	vma->tile_staged &= ~BIT(tile->id);
>   	if (xe_vma_is_userptr(vma)) {
> @@ -1875,13 +1887,20 @@ static void bind_op_commit(struct xe_vm *vm, struct xe_tile *tile,
>   
>   static void unbind_op_commit(struct xe_vm *vm, struct xe_tile *tile,
>   			     struct xe_vm_pgtable_update_ops *pt_update_ops,
> -			     struct xe_vma *vma, struct dma_fence *fence)
> +			     struct xe_vma *vma, struct dma_fence *fence,
> +			     struct dma_fence *fence2)
>   {
> -	if (!xe_vma_has_no_bo(vma) && !xe_vma_bo(vma)->vm)
> +	if (!xe_vma_has_no_bo(vma) && !xe_vma_bo(vma)->vm) {
>   		dma_resv_add_fence(xe_vma_bo(vma)->ttm.base.resv, fence,
>   				   pt_update_ops->wait_vm_bookkeep ?
>   				   DMA_RESV_USAGE_KERNEL :
>   				   DMA_RESV_USAGE_BOOKKEEP);
> +		if (fence2)
> +			dma_resv_add_fence(xe_vma_bo(vma)->ttm.base.resv, fence2,
> +					   pt_update_ops->wait_vm_bookkeep ?
> +					   DMA_RESV_USAGE_KERNEL :
> +					   DMA_RESV_USAGE_BOOKKEEP);
> +	}
>   	vma->tile_present &= ~BIT(tile->id);
>   	if (!vma->tile_present) {
>   		list_del_init(&vma->combined_links.rebind);
> @@ -1898,7 +1917,8 @@ static void unbind_op_commit(struct xe_vm *vm, struct xe_tile *tile,
>   static void op_commit(struct xe_vm *vm,
>   		      struct xe_tile *tile,
>   		      struct xe_vm_pgtable_update_ops *pt_update_ops,
> -		      struct xe_vma_op *op, struct dma_fence *fence)
> +		      struct xe_vma_op *op, struct dma_fence *fence,
> +		      struct dma_fence *fence2)
>   {
>   	xe_vm_assert_held(vm);
>   
> @@ -1907,26 +1927,28 @@ static void op_commit(struct xe_vm *vm,
>   		if (!op->map.immediate && xe_vm_in_fault_mode(vm))
>   			break;
>   
> -		bind_op_commit(vm, tile, pt_update_ops, op->map.vma, fence);
> +		bind_op_commit(vm, tile, pt_update_ops, op->map.vma, fence,
> +			       fence2);
>   		break;
>   	case DRM_GPUVA_OP_REMAP:
>   		unbind_op_commit(vm, tile, pt_update_ops,
> -				 gpuva_to_vma(op->base.remap.unmap->va), fence);
> +				 gpuva_to_vma(op->base.remap.unmap->va), fence,
> +				 fence2);
>   
>   		if (op->remap.prev)
>   			bind_op_commit(vm, tile, pt_update_ops, op->remap.prev,
> -				       fence);
> +				       fence, fence2);
>   		if (op->remap.next)
>   			bind_op_commit(vm, tile, pt_update_ops, op->remap.next,
> -				       fence);
> +				       fence, fence2);
>   		break;
>   	case DRM_GPUVA_OP_UNMAP:
>   		unbind_op_commit(vm, tile, pt_update_ops,
> -				 gpuva_to_vma(op->base.unmap.va), fence);
> +				 gpuva_to_vma(op->base.unmap.va), fence, fence2);
>   		break;
>   	case DRM_GPUVA_OP_PREFETCH:
>   		bind_op_commit(vm, tile, pt_update_ops,
> -			       gpuva_to_vma(op->base.prefetch.va), fence);
> +			       gpuva_to_vma(op->base.prefetch.va), fence, fence2);
>   		break;
>   	default:
>   		drm_warn(&vm->xe->drm, "NOT POSSIBLE");
> @@ -1963,7 +1985,9 @@ xe_pt_update_ops_run(struct xe_tile *tile, struct xe_vma_ops *vops)
>   	struct xe_vm_pgtable_update_ops *pt_update_ops =
>   		&vops->pt_update_ops[tile->id];
>   	struct dma_fence *fence;
> -	struct invalidation_fence *ifence = NULL;
> +	struct invalidation_fence *ifence = NULL, *mfence = NULL;
> +	struct dma_fence **fences = NULL;
> +	struct dma_fence_array *cf = NULL;
>   	struct xe_range_fence *rfence;
>   	struct xe_vma_op *op;
>   	int err = 0, i;
> @@ -1996,6 +2020,23 @@ xe_pt_update_ops_run(struct xe_tile *tile, struct xe_vma_ops *vops)
>   			err = -ENOMEM;
>   			goto kill_vm_tile1;
>   		}
> +		if (tile->media_gt) {
> +			mfence = kzalloc(sizeof(*ifence), GFP_KERNEL);
> +			if (!mfence) {
> +				err = -ENOMEM;
> +				goto free_ifence;
> +			}
> +			fences = kmalloc_array(2, sizeof(*fences), GFP_KERNEL);
> +			if (!fences) {
> +				err = -ENOMEM;
> +				goto free_ifence;
> +			}
> +			cf = dma_fence_array_alloc(2);
> +			if (!cf) {
> +				err = -ENOMEM;
> +				goto free_ifence;
> +			}
> +		}
>   	}
>   
>   	rfence = kzalloc(sizeof(*rfence), GFP_KERNEL);
> @@ -2027,19 +2068,50 @@ xe_pt_update_ops_run(struct xe_tile *tile, struct xe_vma_ops *vops)
>   
>   	/* tlb invalidation must be done before signaling rebind */
>   	if (ifence) {
> +		if (mfence)
> +			dma_fence_get(fence);
>   		invalidation_fence_init(tile->primary_gt, ifence, fence,
>   					pt_update_ops->start,
>   					pt_update_ops->last, vm->usm.asid);
> -		fence = &ifence->base.base;
> +		if (mfence) {
> +			invalidation_fence_init(tile->media_gt, mfence, fence,
> +						pt_update_ops->start,
> +						pt_update_ops->last, vm->usm.asid);
> +			fences[0] = &ifence->base.base;
> +			fences[1] = &mfence->base.base;
> +			dma_fence_array_init(cf, 2, fences,
> +					     vm->composite_fence_ctx,
> +					     vm->composite_fence_seqno++,
> +					     false);
> +			fence = &cf->base;
> +		} else {
> +			fence = &ifence->base.base;
> +		}
>   	}
>   
> -	dma_resv_add_fence(xe_vm_resv(vm), fence,
> -			   pt_update_ops->wait_vm_bookkeep ?
> -			   DMA_RESV_USAGE_KERNEL :
> -			   DMA_RESV_USAGE_BOOKKEEP);
> +	if (!mfence) {
> +		dma_resv_add_fence(xe_vm_resv(vm), fence,
> +				   pt_update_ops->wait_vm_bookkeep ?
> +				   DMA_RESV_USAGE_KERNEL :
> +				   DMA_RESV_USAGE_BOOKKEEP);
>   
> -	list_for_each_entry(op, &vops->list, link)
> -		op_commit(vops->vm, tile, pt_update_ops, op, fence);
> +		list_for_each_entry(op, &vops->list, link)
> +			op_commit(vops->vm, tile, pt_update_ops, op, fence, NULL);
> +	} else {
> +		dma_resv_add_fence(xe_vm_resv(vm), &ifence->base.base,
> +				   pt_update_ops->wait_vm_bookkeep ?
> +				   DMA_RESV_USAGE_KERNEL :
> +				   DMA_RESV_USAGE_BOOKKEEP);
> +
> +		dma_resv_add_fence(xe_vm_resv(vm), &mfence->base.base,
> +				   pt_update_ops->wait_vm_bookkeep ?
> +				   DMA_RESV_USAGE_KERNEL :
> +				   DMA_RESV_USAGE_BOOKKEEP);
> +
> +		list_for_each_entry(op, &vops->list, link)
> +			op_commit(vops->vm, tile, pt_update_ops, op,
> +				  &ifence->base.base, &mfence->base.base);
> +	}
>   
>   	if (pt_update_ops->needs_userptr_lock)
>   		up_read(&vm->userptr.notifier_lock);
> @@ -2049,6 +2121,9 @@ xe_pt_update_ops_run(struct xe_tile *tile, struct xe_vma_ops *vops)
>   free_rfence:
>   	kfree(rfence);
>   free_ifence:
> +	kfree(cf);
> +	kfree(fences);
> +	kfree(mfence);
>   	kfree(ifence);
>   kill_vm_tile1:
>   	if (err != -EAGAIN && tile->id)

