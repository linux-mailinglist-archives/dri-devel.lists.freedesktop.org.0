Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D963F9ACF19
	for <lists+dri-devel@lfdr.de>; Wed, 23 Oct 2024 17:42:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BCE7A10E81A;
	Wed, 23 Oct 2024 15:42:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="xgEwzBew";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2076.outbound.protection.outlook.com [40.107.243.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3630610E814;
 Wed, 23 Oct 2024 15:42:37 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=w0rMgnSY80Zje2v082aWr7zHaS0iMFFzh45MJxHzUcaY7yvpnvkQJB6vqJc672xI1EGo57lZe0gDDzq/ELCBg5NZWsxXKzMxgl8n5ScQst3AWQrozIrSIlIXbGrcgbTStBhDOrosrDJ1QvYeDXLwmQn5hKA/4wKlhcR2IfnVMsiYcxtPg0SG1TmvbdJNDz2p31nNL9y/FtAHejNKwyeyuzX12tZLgBlfZPbO6q8B5477DPDpJz4YhbhRzbcSfWX7gHJ6d5tLPQn1Ki4y2qgiDy+8XMCCR+6E5WdeYbjxz/shbIZ9yCpyvXEUy+NL1eEDkZgh0pYbB2wbPQxlwIRtJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EDREDNTtZo8LmcwJOI5anPK5fv7Tz2dSv9znXvhaCyw=;
 b=l/b98V19H58nvtGmSqgtAyCQaiLBi47KBa7YVEveh7DY8gBODil0AzP+Z21eY7HjyyoHBCQNtWBXLM9WhxTdWSi1Ie+pbUyZct9WsWykP+8iTRT6kT9xwmXpWHkBdBI+u8SrcGMAGNpEXntmTIgBMvX2MLrVMKtqt+3qrvksKlPTrEOvxOQPU65CHDcskXe9bJ/TnC75BNGeefSs9qALNdAwF6Xjl99PpRmkCvTgRUs8pqYPCgsJuKCzfc9FwhyKXCBuzN4A5U7t8dnFxwBE4lt8pU36B51Ixefm95wJbsU/43/yDzVYOIR6EScMMN2CThP7TV1Qsu9vuQtzAS3HUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EDREDNTtZo8LmcwJOI5anPK5fv7Tz2dSv9znXvhaCyw=;
 b=xgEwzBewS+Xr/aSMnxkzoRL1fB8D2mUszyDVsPaPmux+HNnGf0CJys7DJ4oXLT+IiRMmn/VyLhL0EOli+OzaLGRcjxAN+clJsxQAKcsWuEEt4T7uKnobaR7Nf/oyQIgeNROIjv+oXkfw3lMSJalRXGPvx/Um3QWjeh+qC63l6AY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB5311.namprd12.prod.outlook.com (2603:10b6:5:39f::7) by
 IA0PR12MB8376.namprd12.prod.outlook.com (2603:10b6:208:40b::9) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8093.16; Wed, 23 Oct 2024 15:42:34 +0000
Received: from DM4PR12MB5311.namprd12.prod.outlook.com
 ([fe80::a846:49eb:e660:1b5b]) by DM4PR12MB5311.namprd12.prod.outlook.com
 ([fe80::a846:49eb:e660:1b5b%4]) with mapi id 15.20.8093.014; Wed, 23 Oct 2024
 15:42:34 +0000
Message-ID: <f50b88a4-bfeb-493b-8de5-5102b2fd02de@amd.com>
Date: Wed, 23 Oct 2024 11:42:31 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/amd/display: add missing tracepoint event in DM
 atomic_commit_tail
To: Melissa Wen <mwen@igalia.com>, harry.wentland@amd.com,
 Rodrigo.Siqueira@amd.com, alexander.deucher@amd.com,
 christian.koenig@amd.com, Xinhui.Pan@amd.com, airlied@gmail.com,
 daniel@ffwll.ch
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 kernel-dev@igalia.com
References: <20241023135321.259494-1-mwen@igalia.com>
Content-Language: en-US
From: Leo Li <sunpeng.li@amd.com>
In-Reply-To: <20241023135321.259494-1-mwen@igalia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YQBPR0101CA0284.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:6d::23) To DM4PR12MB5311.namprd12.prod.outlook.com
 (2603:10b6:5:39f::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB5311:EE_|IA0PR12MB8376:EE_
X-MS-Office365-Filtering-Correlation-Id: 01bb0800-d2bd-4232-1740-08dcf3794fea
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZXZGaW5oUkp2d0hhM1I0SWN3Yms2ekFrUm4yeFhlUnFJQlZSVmxoZ3JTRUho?=
 =?utf-8?B?cWZZSVVWSTRTM014OUJoYWRsczVNMktvRXRrU1J0TFFPMHlkN2Z0Sld4OWMz?=
 =?utf-8?B?WHpNSFlteTNSQW5tNUg2MTFyc09SWHBUZ3RxeGovZnVnT3BjQlpMN2hsRnRD?=
 =?utf-8?B?eTVzRndPL2lVVC8vWXpNekpVRXlpQUgvY21ZUDlCNHNVSDFrdEgyY0pPOUNF?=
 =?utf-8?B?c1FhZzkzWHBEVC9kemxPMUd5RFVrZTBBWFQ2QVgrUnFpcnRqdGF6cmttRm1w?=
 =?utf-8?B?cUlJOXFmVVhKOGFBRWhJM1Z3aGVpNUpsMTFvZzJpS1g4cFhrVTg4Y1ZtSkdj?=
 =?utf-8?B?eGl6RHREcUo5SHpTRVZ4YmxRR1JoODYvZ1QrSFQyN1VSMk5KV2xRQTcwUGkz?=
 =?utf-8?B?djlPclZTelZSZnc1RTlCeU5DMHRtQ3duZjI0Yi9Ba1NhK1ZJMFloSlowQzVz?=
 =?utf-8?B?d001a01hZ0wxZzQwYy9OQVVDR0JoMHZuT2lNMDdlM0xXdG0vZ0pNWHZCcUJM?=
 =?utf-8?B?UGxFa1ZldHJwVWpqVTdoSGMzVjJRMGdrV1FBckxaYkxGbjdOUEI4c1NiWEZD?=
 =?utf-8?B?UWxDci9WeVJlNUxOOTU3UEc4MW9pUXhEeDNHMSs3SUxHaytQbzI1Nmwxcm81?=
 =?utf-8?B?ZllIekVpdmV5cjNRVElvNTdSc3BNeVRUQkxvZnF6TjdqcmJIcHB6RTR6aUdp?=
 =?utf-8?B?VFBEVGxWbFQ5NFJUbWNNemROSEtTZWp5TG1oUS9qNXNrOXhoak5zTjB6cC8x?=
 =?utf-8?B?OGMzVG5hZjdGTDU4L0dxZ29vUjVKeFZBSFRlS2pydWdjd0hBclo1eCtWSFFs?=
 =?utf-8?B?dDBicXQ1bmRqeDV5azFBREEwWnh1NWZieVVjaHhvNk4zVDVNRTlGQ2MrNEdS?=
 =?utf-8?B?bWI5bThQUTNGY2NLZGRYa2psOXkxZVFvK0dsamhlUFBPNnNHSXJwYzZHNVhS?=
 =?utf-8?B?aW5vT1hoUmdaZ3Z4eXZJbFRrSU44ZTZhK2p5ei9USzFEMDRqeml4bnY0Y1NR?=
 =?utf-8?B?bUdxN3Z0WS81NUd0bFFmaVIwTWtnalFXQWRxSStlY0x2cTIxMUpWOUNMTSt5?=
 =?utf-8?B?YkJRSStQOHFNWEgybGlQaTBmaDMzRmtWeXVDdUZUR2FrR2MrMEJLVDFKdUM5?=
 =?utf-8?B?RVFubTZ2Tkx2L245Q09STUhYUTdaVWxmOTg1NUcySm9rZHEvUldNUExPc1di?=
 =?utf-8?B?OUhzbWJmK25jTzZPcjlaL09ITnlTaXVSMkJHWXZFNVJ0czhwM2Q3TXBMeXp5?=
 =?utf-8?B?Q3d0NTM2V3pURUt5WkVGa0hBWVhzblNBcGNZcFo0eVpkdXZsVm90YlpmbVNq?=
 =?utf-8?B?OHQxVkd2b2tJQkpNS1ljWnB5ajN3Uks5U2hPTHF2azNaNGxrRmNsZktoZXFC?=
 =?utf-8?B?YXVsb2p1dncwWE1MdExKbG1lRWRsN3NQRllVbUZMeDFpeGtYbEhKRnB0aEFj?=
 =?utf-8?B?TytEVm1vdzMrSDVwcnM5N1NRWFZXZzgzSHZheVVJRUNVWEZjd1JVVFVQeHVM?=
 =?utf-8?B?TllqY3BGWkZZOXRNRlA2NzA2UjBtcGt6Y3NHbGNRUEE2eWhGNFdiU3AyeURP?=
 =?utf-8?B?Qi9hMWtvN3Z2ZWdJQ1JMdlMwSC96bU52QzlyMXZrbTNhRy9HZ2xFTnRvZENo?=
 =?utf-8?B?bVFWbWRDOTdzKzAwZzZLOFMwSVFsMGpZK2Z3bnNjbTdpVk5ocTl2OWxCOUh3?=
 =?utf-8?B?U3N6RkNFaFBLK05TY21admNoMDg1Q1ZvVmtyZGQ3dVJscUsrbWNSUVRrRnl6?=
 =?utf-8?Q?oSTM8SNd+gOy1ng3snbAsxeAondctYXMb1WYYlW?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB5311.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dE1nbTZ6Y3o4dU1VN28wOGNzU0Z5T0x1c1J1aXpKMENnVmVXdjVBbFpnVVNV?=
 =?utf-8?B?c3FkcDFmS0ZUSU9XaEVwSUplL3VoYkxibFZ0MVl5VmNJYllGcUZ4b1pCZVZy?=
 =?utf-8?B?NUlPTHBJUlQra2QycXF0U0hpQWpQeDc3c2Y1cVVJdTZEOXcrbnlXMFowamNP?=
 =?utf-8?B?bmxaN0Q5bjUwTmpJOUNUN1dCc3J6NlhRNUlmaHhqODRtOGZRcnBMVnZzNHMw?=
 =?utf-8?B?MWFtYjVyZXVyZ05OQWhJazlvL1BZV2ZpQk9Qb0VpTERWT09RZXN0b0pqNUZW?=
 =?utf-8?B?UThZNGtpZDVUNzZNU1paTCtEdmF6M0twejlJSnNSazJVc1NyYlNtdWVlN2Rh?=
 =?utf-8?B?dzNUSm10amVWbkJqcWgxOXd4S0RrR1BsdXVFTUI2SU9xaG9WTFZQQ2hnVXZT?=
 =?utf-8?B?ZnFBc1ZlU2paUnBib0xJNnhBTE1ZRlBIb0I1c0NYNGh6OGZSaEM5emRZeFVF?=
 =?utf-8?B?RzNCSEZkeVlZQkRRREpyZERsSUR6OU1ZUnZzVnVtTTB1OTBZN1F2RkRXRldX?=
 =?utf-8?B?T0tqSU4rbkRLQ2xGL3BHcE1OdUlNR1Izb1VScEJ1NzQ3NkRRbndxVkd4bzZl?=
 =?utf-8?B?VEZjL3REN2VyalVwOUF1L2ZqM1Mwc0lHR0VPMnZYSnVTMlo2VDhJR2ZuRXd1?=
 =?utf-8?B?c2VGSVBUd2VOaVBpWG5jbHFaUzdCVnhwSDlBMUE5QTRXOWx6YUJ5OGVRWWx1?=
 =?utf-8?B?WlFMQ20zOGp1OEZWaURVSHpSOHVUcmZhUHk4WXpRSENwb3VPQUk2bGlyZE1P?=
 =?utf-8?B?YndzOTVXc1JwRUFJQU1aY1RCelphMDNXQ1hvRDFIL1ZBTXZoQmhIcTh0VDZS?=
 =?utf-8?B?Sys0VHh6dEh5QWxCamxDMXZSSzdOSWw0OXhEVFdabUIwdlduRkpHSXRYRDF5?=
 =?utf-8?B?RUR2eWpNSVRnWXZqZE52ZEVVZ2t3dWE3ekxUTENGZXgyV0VCeW52d3JmclJ5?=
 =?utf-8?B?U092bFYwaU8reFNMNGcwc1NXb014bUx2RzM2cDNCdHJkT2NLbEN1Z2JkN2pB?=
 =?utf-8?B?ejFIVzByMnZQY2NpUmRoZGR1U3o2ck5DYTdjc0ZadDI1U3Zrc2M5bUE1OUxE?=
 =?utf-8?B?b0xSNzh1bG55R2M1R0xEUnp3QnRBOU9GeklVZ2g5N2ZUeHo2eExZeTVTRXg4?=
 =?utf-8?B?UUlZd2dXaFkxdDlFV3pwTm9wYmRuVklLNkYzQkJZcEVuSzlKdTh2L0FSTTVG?=
 =?utf-8?B?N0VhQnRGKzZMdWhFd1F2M1RmYS9tLzFaRnBHZ0txc2hIMDRDRG54NVVrOUFK?=
 =?utf-8?B?QXp6NDNLOGVlTmJncUtzdkQ3M2VOalFMY1NmRlNQeHBCckw3Nks4RHZpaUZF?=
 =?utf-8?B?eHVsTisrM1pnSFlxcEZpb2tTR3hKQ2p3VE8xQ3VycE1LcTdVMjladHRxRVBB?=
 =?utf-8?B?U2JzVVpJVlBXL0RTOGlFNTJ0b1VMQ2lZR0pvOVhuTTV5bWRZaTZXQmFVeG8v?=
 =?utf-8?B?OXM0L1JsRllaSVNGN3VPdXIwMldoVDdsTTFLUlMzdC96ZmRVZ2IzQW05RWZa?=
 =?utf-8?B?V2xqRkRVRVdFYWlrczFWT2syVVpMeDJnZk56YWJ4R0FPUlpxdXZZWnFnT0FG?=
 =?utf-8?B?dDBpcitpR3NLa25oYVJ3UFl6bm4ycVJrL3VtU2Z1NTBZY1daZHdYV3R6eVBk?=
 =?utf-8?B?TVVjR1krU0JnbkIwSzE3MDB5Qklsd2tjb3Q4KytIb25JRDRDNlZ0Z0tCMU1s?=
 =?utf-8?B?aVZZSTJyekFOZG0xSkl5bzFqeGlldjRpMjROUnlUREQxOWd6bklOdERxMCs1?=
 =?utf-8?B?TC9kRWZSd2JOOTh5RkZKSFR1VHMvNCtKZGxzM1FuVFl3aWY2MDRTUUZuYTRu?=
 =?utf-8?B?WW9UYUVuVmxvYVBGcmxXdUUxOU5qL05tbXZIMW9laHlLeVdUaGRpdE5ic0Rr?=
 =?utf-8?B?TFo4KzVnNTVBbkY4bUhTb1drdlQ5SWtlZ25saWJ4U1MxVk9hOTVuUjJHMDE5?=
 =?utf-8?B?SlA1b2RYQzBUYjU4TGsreVg3dGhrZG1Qc3QrRVU4dUxDb3EweXc5cm9qU0Nq?=
 =?utf-8?B?S3pYZXZqZkhYV0kvTFVNdU1sRXdXdXdrSzk3TVNwRXlLb0ZBVUZjcTlISU5Q?=
 =?utf-8?B?U1hYMEx1NWdzNWhtOWk2YlVSZ1hQRXY1cXZGeVJMeENWT3Irc3Nja2pNdlRi?=
 =?utf-8?Q?sxy7cIol+FZlmEgtmu01qON1K?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 01bb0800-d2bd-4232-1740-08dcf3794fea
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB5311.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Oct 2024 15:42:33.9215 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: L5zQ5lAmpb0G1CLmQvzdCopmEE7EOZ4t+aQgVyM0YRp0qimIzGy85WFdfiLzqJ0A
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8376
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



On 2024-10-23 09:53, Melissa Wen wrote:
> There are two events to trace the beginning and the end of
> amdgpu_dm_atomic_commit_tail, but only the one ate the beginning was
> placed. Place amdgpu_dm_atomic_commit_tail_finish tracepoint at the end
> than.
> 
> Signed-off-by: Melissa Wen <mwen@igalia.com>

Reviewed-by: Leo Li <sunpeng.li@amd.com>
Thanks!

> ---
>   drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> index 98f0b142f497..bbfc47f6595f 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> @@ -10088,6 +10088,8 @@ static void amdgpu_dm_atomic_commit_tail(struct drm_atomic_state *state)
>   	for (i = 0; i < crtc_disable_count; i++)
>   		pm_runtime_put_autosuspend(dev->dev);
>   	pm_runtime_mark_last_busy(dev->dev);
> +
> +	trace_amdgpu_dm_atomic_commit_tail_finish(state);
>   }
>   
>   static int dm_force_atomic_commit(struct drm_connector *connector)

