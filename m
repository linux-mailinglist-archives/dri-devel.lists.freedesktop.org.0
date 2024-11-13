Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A23489C7975
	for <lists+dri-devel@lfdr.de>; Wed, 13 Nov 2024 17:59:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B515D10E73F;
	Wed, 13 Nov 2024 16:59:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="v0xqeYr+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2082.outbound.protection.outlook.com [40.107.220.82])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 988AD10E73A;
 Wed, 13 Nov 2024 16:58:59 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=shrPH0dNWOFmIlV9Ld2KyOmjD6WebpOGEXRKDyFCHQGbiInpTLt2Nm3rR6X2bc5QXtNI1VTCjpGTYTrKUmoMlbIJKJ8mmtjUKxVg3tOdMhpb9eZR1ivi2K6LMrLh5K2KQYzVBu0/1qOn31cuAhuRufA+HyhACMaogKUd8K2TImN/jcuw3ITKf7HNLCkRiuynpnC6txvBMhWuduO3QISo8JIrTQY1I+2j4jT88n91S7uexJ6R+CRUJlWlWZV/KToHxwoJWrDMvbIQJd2OHUAtKAdqSIbaU9aYY4+7dlIp4BZ+TeEU7MxDK1tdZW0tAsLz4UvNDZPBYNU2CDXOip40bg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nClYAEzXBLQcXxybOufC4ift11pZGWOP4MQOTOrFcSQ=;
 b=j/0TLIAPuHET7ER/ARVl6kSKzbIJlT4DWm/jbtR88IcwKAr6H9OQDFERFNYNaqtvMD40OjtAvvPPgbM/sNK6X6fh+89RIOD3GBrXAkHYkWCJE+KFL/iKQEQuu5fGVxzcApRLxul9hpqZAFOapCn+/aa5AOQgA7qqfLWnJXd0LvtShm1VTuEWX/8V8rhmYneqlaDQVvxtz4GrsNJm3MButcxw/kGBxNkLm6oLtVbGX5dzGvOXigzncTYnmto6ChiekGPW+RRDBkD35OMFOqd3xKt0OlEdPBonoFJZP34G91o03ty7Hja0K+lMWPsLREKG79MBJ2M95xOi8SB06sfjQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nClYAEzXBLQcXxybOufC4ift11pZGWOP4MQOTOrFcSQ=;
 b=v0xqeYr+NuGp7Jd7H/6F+fsb33//xjxGjQpeWodSse3aODv/iUNuwAXwbbw4mOMbw8GR3AueJ7z/Y41Kr+n8Zv27WKY2bA7mX+RKyxxDHtZfiNo1wb0VPu6ko6N79+tJdZeTHRM3mbMyjat55AZfwMICI6ht6g2oww5Lg4mapuE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB8476.namprd12.prod.outlook.com (2603:10b6:8:17e::15)
 by IA1PR12MB9030.namprd12.prod.outlook.com (2603:10b6:208:3f2::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.17; Wed, 13 Nov
 2024 16:58:51 +0000
Received: from DM4PR12MB8476.namprd12.prod.outlook.com
 ([fe80::2ed6:28e6:241e:7fc1]) by DM4PR12MB8476.namprd12.prod.outlook.com
 ([fe80::2ed6:28e6:241e:7fc1%3]) with mapi id 15.20.8158.013; Wed, 13 Nov 2024
 16:58:51 +0000
Message-ID: <578485e4-8983-412a-a214-921c450a225a@amd.com>
Date: Wed, 13 Nov 2024 09:58:46 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] drm/amd/display: Remove redundant check
To: Bhavin Sharma <bhavin.sharma@siliconsignals.io>, alexander.deucher@amd.com
Cc: tarang.raval@siliconsignals.io, Chaitanya Dhere
 <chaitanya.dhere@amd.com>, Jun Lei <jun.lei@amd.com>,
 Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Xinhui Pan <Xinhui.Pan@amd.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Kenneth Feng <kenneth.feng@amd.com>,
 Wenjing Liu <wenjing.liu@amd.com>, Roman Li <roman.li@amd.com>,
 Leo Ma <hanghong.ma@amd.com>, Jose Fernandez <josef@netflix.com>,
 Aurabindo Pillai <aurabindo.pillai@amd.com>,
 Ilya Bakoulin <ilya.bakoulin@amd.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20241111120900.63869-1-bhavin.sharma@siliconsignals.io>
 <20241111120900.63869-2-bhavin.sharma@siliconsignals.io>
Content-Language: en-US
From: Alex Hung <alex.hung@amd.com>
In-Reply-To: <20241111120900.63869-2-bhavin.sharma@siliconsignals.io>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YQZPR01CA0043.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:86::21) To DM4PR12MB8476.namprd12.prod.outlook.com
 (2603:10b6:8:17e::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB8476:EE_|IA1PR12MB9030:EE_
X-MS-Office365-Filtering-Correlation-Id: 6358e146-05be-4b00-ee1b-08dd04047313
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Y2hXVTh1LzB5RkR5VklQU3dVRm84SlF6UFAzdzNPcTJoWlpORkQwVk5EbGtJ?=
 =?utf-8?B?b2FhUDdxRjNiV1I5dThyMHlwMGxUanp4dEVyV0JrUDkyc0VRVG1PcnYvMGVr?=
 =?utf-8?B?VkEybnlTNEpzOEpJS0tiL2NEK3dJSS9Xa3JURGVZWThUWG1VamlRMmpYVlc4?=
 =?utf-8?B?bjdxR1pvdTBjVFdkdGtJMElwaldXcitrTk54WVFnbXhWQ01IY3prUHNIbVRN?=
 =?utf-8?B?UU5QVVhQR3BVWUFUYzZIaGZSTE1tajdVTks1TjY1a0lIOEd1MDg0SGk3Ym11?=
 =?utf-8?B?N2NLUk5xRFd6cTZGWUlNZUlkVHlDVGc3cnBGWk5GL0I0WmNWeGZiR3hENjRh?=
 =?utf-8?B?NFE3WTUySjZZZUJmWExkZVFnUnYvY2FxS1h3VzBVQ2o5bCtaOGR6VTVnMkl4?=
 =?utf-8?B?L0YyTkd3WWxjZ0l4dVlzWEU4Q01GK3ZBVStSSkhyeTRFZDBrcVdXb0UyUnFY?=
 =?utf-8?B?QVAwcVVLa0s3aTdxM2xhd2tpRUpwUU50RzU4UlBydHN1SmZCVFR0NVpDT01k?=
 =?utf-8?B?cTdCRkJUSHRUa25iUmE1QUFGUlZXRTVBNmN6eTRPQ0JxSTQ1K2N6YkdET29z?=
 =?utf-8?B?WWZHeVpNZDBXeWtsT2hWeWxVOE4rR0c0c3RmaFBSdlVpZDE5YnQ1YUU3aDk3?=
 =?utf-8?B?VTdTY05JL0lnQTZ3b1FDVlNOaDJDK2JLUUdSYjJ3aVpKR3poSXBya2JleWFF?=
 =?utf-8?B?N2Y1QUJXdHZCM3NYU1ZNd3hGeW1yOTlzSk5yTDQ2Q0hHcFZ2bGVmMHdpbTF5?=
 =?utf-8?B?VCtjVHpQYW5aMTlLdjVIM014bm8xaHdXQmlpa3JiZk8za0d3ckVFc0I2L09n?=
 =?utf-8?B?cmxKZlhXMW9hb2pGN2ZNUWRaMGU1dHg0aytiYVdGeVV6VGwwT3RTQWE5K1Fs?=
 =?utf-8?B?L3gzNHJCSkVqdmxVQjkwVHpXOU11ZE04LzdqR2JpTmIzdmRDU1FLTnJzSmV6?=
 =?utf-8?B?R05UNzFBVE9rTE1KYXFDQUVJSzZLTW03akJid3ZDdlUwSUo2TEsvbkRRenMv?=
 =?utf-8?B?bTYwWnlqWmFqd053V09aYUVWNVl3WFBoLzF2UmhNUm1ha2FrUlU4Z0Jwc05G?=
 =?utf-8?B?SDR1amsvN3ErMTlsMWUxSk8xRTRXdlU3cmFSMnNHY2ppNWdOTFlpZDZIc2lw?=
 =?utf-8?B?VHZXOXdtSGNQL2oxNm1rNmFvTnMwM0lNaUg0aHg5cVZ2UGo2NFdvZVkvallB?=
 =?utf-8?B?NHdaU255YU92c0FobXYrWHplYURQUVhtQUkzSjlSYldFNEU1TXhwOHZSaHlD?=
 =?utf-8?B?Z3duSHljZU5Xa25ycE93OEh4bGM1blh4eXVCWjVUeHMzRHFWbEczK3FPaTJz?=
 =?utf-8?B?OS9neUZFaU5mdXEzWUd5ZDQ2QXE3MmhRdzF5ZGtRMDFHVTJ1elJzSFBTV0Zt?=
 =?utf-8?B?UlpkVml3RXFDcTRSdjNkU05tbHlkZmVyNCtES3R4dkRkSVJ0cEF6aGJHWHgz?=
 =?utf-8?B?ZDBGTWc2aG5WeHh5NUUzSmFkRlhRbXJENElaSWhwN0NXQnpQYzBrS1IzU2tL?=
 =?utf-8?B?bW5XdWhIa2gvbWJOR0h6dlVPSkpWZDdsMS9QZWdrU2dwMlk4TS9MY0NxanY0?=
 =?utf-8?B?MXZaVFNMQlRzSHgwVHZmZzBveVdJN0M0TGxiL2VZT1pONFNnSVZlV1d6MGdJ?=
 =?utf-8?B?WExmYWRCWFlWT2NXaksybE5nZThXaFNmeHlJcm1RNmtvM21XMzNGY1hOSHVn?=
 =?utf-8?B?VDIrWXlXR3hsVGVpdnRLSDk5Mk5IZEFaZ0x4RCtEanJIRFdpZm9yeXVlSkkx?=
 =?utf-8?Q?lQASk2R9+s9gJ8T18K64KAWVGZvBsCBftPCO7s3?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB8476.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QjQyY3F5Umc3aHZMV0EvQ0ZEakFjckR3TElDRHhjcWE4YnE3UHl6RmxUUVFG?=
 =?utf-8?B?R1RRM2liRWNFUGYvc2NPQk9Rd095RFRDaVAwUkZsRWRucmdyTThXZ0NGV3oy?=
 =?utf-8?B?bGMzbENZNi9PaVlvRkJYSlJYd1dIbjMyRDBhUGU3SGkwa2h6dHQwTG02N1Ix?=
 =?utf-8?B?OEpVU2NxMjZsMG8xcUNzQitNWFZXSnM1VWNFRS9xNVNDWkQ5NEh0Mk1uMzQ2?=
 =?utf-8?B?cE1LQnFiSkZEWHZtQW42bmE4RkFPcWg4MGcyUHdRYzlKUTlkQnRSdkJOc2R3?=
 =?utf-8?B?c1J0dEhEMnFyeFZHaWxCa1JWenR1dVJzZXhOcWRTT0Nra1dUcm4rZlVUbTNi?=
 =?utf-8?B?aUFRUG91QXBGekJ6MEMrWDVtNi9WT2J6eGwzOTJ1eEppd1N2Q05pVFk2dXVl?=
 =?utf-8?B?cWR1TVVaVHdmRmNUYXZjNDdyc0RucHBRcUluTVBCQ2RTV2V3ajdnYWZySDJP?=
 =?utf-8?B?TUNaNFVFRTg5amROZ3h4ZzRFZXlQUWg5R2g1SEh2T3RPZm1pakh0RGliQnUw?=
 =?utf-8?B?Vk5LOFVLSWF6TjZvSzhhditsWHFBVzRMeTJ6VXFIQ0k5MTMvZWdiNHoxSk54?=
 =?utf-8?B?MGFMMUUwMEpJOTNoOUR0WkhyYTJXT2NnbllLZDcvRUMxS0NObHdna3ZxNW41?=
 =?utf-8?B?d0xaQjFqcEI3cEdNR1BEZTJRTWxQQVJTSlhqRGdtSHhoem9jTkd4bDZDTTNH?=
 =?utf-8?B?dmlNOC9EVURxaXVDWW5uT21iOCtUVXpObXoyWXF0V29wYzRpb0JsdlBpL1c5?=
 =?utf-8?B?c3NVNDhnOC9SSkx5K1F6c1hqY3MwUnlIY2VvdDdlTVJWazllUklhUFNyNWox?=
 =?utf-8?B?OEtGRHBCMTZsTjVzUi9CWlNJUG0xNXZGbU1nOG5nUnd1VEpkWERNY1dhbGhK?=
 =?utf-8?B?RmZ1a0dlVTJobm1wNzVZMExvNThueUlaaEhJZDdmWDVsYzZEekkzUnR2ZDVG?=
 =?utf-8?B?SVgwMjcrQXVMeTEyMEVaa04wUVBsTXkyZzl3ZW1CYkU4Nm1uNjNhTEJ2U2dw?=
 =?utf-8?B?V1hKL3hOcjNLYXROeUZ3WlhHNHV0ak5CNlh1SmZsRTlmbHM1YkIyVFRJSHpG?=
 =?utf-8?B?MU83c2VSb21nVUc4TmN6L0diVVpIOFAvdEw5VWxjK0FKZkNJSGdpOE5nelZY?=
 =?utf-8?B?cGwzNnVDUnY4WnlJWXExMjhxREtvbUNQbDRXTTFLZDBUQTRneVliS2hFMmxC?=
 =?utf-8?B?SlhJSTIraU04b2lmd2M0NHUydjFXRnVVWU1VckhlRE01UUt3U3NJMmllSVZw?=
 =?utf-8?B?ZmtXaEg0ME5oOWR3OHJONEQ2T0MvUFl4TzRjVTJGL1NmOG5nQlJtZ0tPSWVw?=
 =?utf-8?B?VndTbXE0UUNTQ1RVNlhTalpLT1ZhTEZWK2dGQjVTLzg5MWlWT1J6QlM2U0cz?=
 =?utf-8?B?ZXJzamFhV0dPUkhoVGxTdW9OdWZiZUJjSGt5MDFkRyttUmJxMGdsckVqTmRj?=
 =?utf-8?B?d2NPc25nNHlDVVRKQ1dFc0hWSkhBVmd3Mm11b005MDNsWnd0TFVEQlpkUXRl?=
 =?utf-8?B?VEtuNzN2cVBwaktTRnIrQUlPcWc1NWJYZ2Z1RjkwbmZzbVJWdVIwWDdRYlEr?=
 =?utf-8?B?c0dEc09LcXBvQnhFVnE3ZXVkRU9QcGp3QVpqZ2dRb2luUjg0MmFaU29lbFZ6?=
 =?utf-8?B?N1lobHFmTE1lT0RUTXVVLzdEQTNmK1U3b3NKS0ljaXJkZlBsSFozbEs3bVlF?=
 =?utf-8?B?UHQrbW5oQ2NFNHdLd0RPckRHalJZNVNnTk9STmR4dDFuV0prSExsaTV2MVhV?=
 =?utf-8?B?K3pSTE1PREc0czBVRnBPU3pJRURZQVpNZDJwdXlRc1dIZ2ZXOEhpd2tWVGsz?=
 =?utf-8?B?TjcwYkk5MWcxcFV2OFVkbGRDYnBJVVVBUTlaSWRiVmpOVWFQN0ZNRFRKNnJG?=
 =?utf-8?B?ak1tWUxZMDZpOCtXL0J4UzJ4M0I5cGVFcXpXRWJWa0N3VlJ4S0lvTmZWa0pG?=
 =?utf-8?B?cVg4Sk5UNzkyWEMyWHNZaVI3dDVqdzdraWVJMWMwVVNvRUwzYU8rNkR4TTBr?=
 =?utf-8?B?anFYU0dsdGNTbTNLYjIveFcxT2liaFJZMnBnbWVEaEthVXZwQktLaXpURFFI?=
 =?utf-8?B?aWdYbU82SFFkU3FRZVFEcXRQS0U4dmlYNGE2K3ZvS3JBQVd6MVJ0K080KzAr?=
 =?utf-8?Q?LYeBrcMRnlR3i03Ls7VzsL8+K?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6358e146-05be-4b00-ee1b-08dd04047313
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB8476.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Nov 2024 16:58:51.5400 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NlzdPmbD1unb5wvpqUmnt5wZifOmB+/x7i8kTk+mHixHuNxofOOurS9fM5NprcPjOMru+SxFNST3RKnckiBN2A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB9030
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



On 11/11/24 05:08, Bhavin Sharma wrote:
> The mode_422 variable is initialized to zero, making mode_422 ? 2 : 1
> always false.
> 
> Since is_dsc_possible is already checked just above, there's no need to
> check it again before filling out the DSC settings.
> 
> Removing this redundant check simplifies the code without affecting
> functionality.
> 
> Signed-off-by: Bhavin Sharma <bhavin.sharma@siliconsignals.io>
> ---
>   .../amd/display/dc/dml/dml1_display_rq_dlg_calc.c   |  2 +-
>   drivers/gpu/drm/amd/display/dc/dsc/dc_dsc.c         | 13 +++++--------
>   2 files changed, 6 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/display/dc/dml/dml1_display_rq_dlg_calc.c b/drivers/gpu/drm/amd/display/dc/dml/dml1_display_rq_dlg_calc.c
> index d8bfc85e5dcd..705ddabb5024 100644
> --- a/drivers/gpu/drm/amd/display/dc/dml/dml1_display_rq_dlg_calc.c
> +++ b/drivers/gpu/drm/amd/display/dc/dml/dml1_display_rq_dlg_calc.c
> @@ -564,7 +564,7 @@ static void get_surf_rq_param(
>   	unsigned int vp_height = 0;
>   	unsigned int data_pitch = 0;
>   	unsigned int meta_pitch = 0;
> -	unsigned int ppe = mode_422 ? 2 : 1;
> +	unsigned int ppe = 1;
>   	bool surf_linear;
>   	bool surf_vert;
>   	unsigned int bytes_per_element;

This is fixed in amd-staging-drm-next by the following commit and it's 
no longer needed.

ec680fdbb29a drm/amd/display: Remove always-false branches


> diff --git a/drivers/gpu/drm/amd/display/dc/dsc/dc_dsc.c b/drivers/gpu/drm/amd/display/dc/dsc/dc_dsc.c
> index ebd5df1a36e8..85f6f8e43947 100644
> --- a/drivers/gpu/drm/amd/display/dc/dsc/dc_dsc.c
> +++ b/drivers/gpu/drm/amd/display/dc/dsc/dc_dsc.c
> @@ -1093,14 +1093,11 @@ static bool setup_dsc_config(
>   	if (!is_dsc_possible)
>   		goto done;
>   
> -	// Final decission: can we do DSC or not?
> -	if (is_dsc_possible) {
> -		// Fill out the rest of DSC settings
> -		dsc_cfg->block_pred_enable = dsc_common_caps.is_block_pred_supported;
> -		dsc_cfg->linebuf_depth = dsc_common_caps.lb_bit_depth;
> -		dsc_cfg->version_minor = (dsc_common_caps.dsc_version & 0xf0) >> 4;
> -		dsc_cfg->is_dp = dsc_sink_caps->is_dp;
> -	}
> +	// Fill out the rest of DSC settings
> +	dsc_cfg->block_pred_enable = dsc_common_caps.is_block_pred_supported;
> +	dsc_cfg->linebuf_depth = dsc_common_caps.lb_bit_depth;
> +	dsc_cfg->version_minor = (dsc_common_caps.dsc_version & 0xf0) >> 4;
> +	dsc_cfg->is_dp = dsc_sink_caps->is_dp;
>   
>   done:
>   	if (!is_dsc_possible)

This looks to me. Please revise and include this part in V2. Thanks.
