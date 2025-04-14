Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 801C1A87BD9
	for <lists+dri-devel@lfdr.de>; Mon, 14 Apr 2025 11:27:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF8B310E504;
	Mon, 14 Apr 2025 09:27:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="Nam+UpI2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2074.outbound.protection.outlook.com [40.107.237.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1636010E4FD;
 Mon, 14 Apr 2025 09:27:54 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dUAsF+usP7gVJS5Xj2ut/j819dDEWdp9IIWsLycRx+IexU0F7vPKoRYALXmj6FhdVWCyCGG2PRc7far8CTXQnkS8/pmUGS8rOGEyZBGilw38hLEXoIiEujSQBsO7K4w+PJ0wmAsk9SyFX+Yw/y/dl+/WjJst2zkt4WSeQwUTtEyrHASGLO6RkyukJU+UIaYQfhj22pBQNqDvnF8BONxM1iOb4MVOgi4yIHMVtWAoWS+t0fMDDtEnYXjSxXAIFu/OG0/xuXtzkMMxZzvH3T4XphX0gE2UQlITZeXO4ED1qwcDDFYukVZWpAPluNJ1BPDRPrkD6PgKxqR08FNM/WwHzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6mqhNL1sYxW1cpASq9kC6w4i2yiwDWRLBKRRvM5j65A=;
 b=bnM2+f2XzZHuDJh+uD2o1eotgga/P7ibetd1TKs1Nrum89+CZExbfVohNCymPizLWX3IxK5s2Q0dT0QDdOqwb17Zs6vg85KGdeDQOmRG+zn1mr2khlUsVA47I9YWYJtIa13cpt2YHlMEjlVkMgWCt8HxfKrQUHT2DsD2C/BVhy0rxviJAHqLMeE60dS4P0W+w4rWz1pRq0YMBiKQL1eADEjbOlxX4Y6/XLVh/bb6BbmZa94ewa9abuY7gPkjScqCYQEl17l1O7Eh2cTy8dGA5Nqf56MJdxeDs3dzyI1RphkjLr/yn7Sz4o8cv0avisd3Z5Unm+F5X/VJzXE8mMsFug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6mqhNL1sYxW1cpASq9kC6w4i2yiwDWRLBKRRvM5j65A=;
 b=Nam+UpI2ZUtq5mhMg4T8LnhY7m+dOuIpiPC9UwjbFnFVDEuQRzluZjN+TufT/FTueUtIpcu0zHKPfY/aN/9rzS+qbovHU9YqqOVEz7l3H2+VZ9KZU5CznTigT5xDB9CHOuJrlrub/CHZ7uM+bjN/wvQAAyW1fDpHP5vJewN/P4s=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by MW4PR12MB7465.namprd12.prod.outlook.com (2603:10b6:303:212::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.32; Mon, 14 Apr
 2025 09:27:50 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%5]) with mapi id 15.20.8632.025; Mon, 14 Apr 2025
 09:27:50 +0000
Message-ID: <aedbcd77-3cb6-48a6-b7ec-b2e5d3d0996c@amd.com>
Date: Mon, 14 Apr 2025 11:27:45 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/amdgpu: check a user-provided number of BOs in list
To: Denis Arefev <arefev@swemel.ru>, Alex Deucher <alexander.deucher@amd.com>
Cc: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, lvc-project@linuxtesting.org,
 stable@vger.kernel.org
References: <20250408091755.10074-1-arefev@swemel.ru>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20250408091755.10074-1-arefev@swemel.ru>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0288.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:e7::19) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|MW4PR12MB7465:EE_
X-MS-Office365-Filtering-Correlation-Id: 7704a4fb-047b-4e2d-4174-08dd7b36a04c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?blJ5czh0SGtoNG95UWVhT3lnWlJZeE1EM25DanZPSFd1UWZ4YjRXNGlWMUpB?=
 =?utf-8?B?bEFZUEJYanY2OXVCNFU1cVZieHdOWGpGazlTMlhiaHlRSGtQbzJvL3FRMmpm?=
 =?utf-8?B?Z1ZMajJMazlpTHR6dDdyeDQwQndoU0pIclRJbXE4OHoyTHNpZjJucHpXZzU2?=
 =?utf-8?B?dVVIdlV2bFFNMTg1R3ZmWWxaV1pCbTdpRTQyZWhwTEdsT1dFaUFKZ0VkNWhX?=
 =?utf-8?B?Sk0rSkp3UWVGbkhLTVJuVWtSbHpIQ2NvQjMyYThNbjI5TDdlUjhlbHJuNDdQ?=
 =?utf-8?B?Q3AzV2p5dW92cFZaajZTSmNvdWtZTGxaRzNPWWlhVmFBRWVtVEpKNkZzblVr?=
 =?utf-8?B?Q29FUFRuWTNWSSs1aXVkRldBMFJKWENPSFdLNWVaaUkyZisxeCsxREZHeUtM?=
 =?utf-8?B?M2RWeG1ZdUNSaWw4a09FT3B5ZEh2N1JaZG4wZU93RWlDRWxJVncvSU1UdDFz?=
 =?utf-8?B?Q1FpemlwbDRPL000OVhzZjFIZkMxbk9aajdKbFJsUUlyM1ZzTVdybU40cTl1?=
 =?utf-8?B?M1NucS9BRXJUM1o1eWh5QTBrSEh3OE5Fc2dXK1pPdnFYNVQ3UHJvajMrWnE2?=
 =?utf-8?B?ZjdEb3p3ZFJveXUvTTlzTkVNYlVkUzUxUFJxc3l5dVNnQzdCbG53eVNReVZI?=
 =?utf-8?B?Wno0ZEhLbHJ1bDhYcU9IOEg3dHI2NWdCa1pUKzUzWmEvTnBOeVhEdTYwY0p6?=
 =?utf-8?B?NW90a2tMbytzNHlDUWxLZ0YxeUNrV3V2OHgxcEJQMytWVDlKaUhmQWZiT2Rz?=
 =?utf-8?B?dFlzVXBFSTh0TkJvb3dINVEvUlZwTGJnM3JFSzB3dDcrR0ZJSWUxYUhESkt1?=
 =?utf-8?B?b1lhUXhFdVREbnk5MmQwVWFjbVF6ZDFpeEl4WVRUSjhZajFqaFRheUorZE92?=
 =?utf-8?B?ZnkzWXBGYnZNcFFlU0lObEM2NDUrMXRnYmJRWnJxWlVUWnMwTzFSa2o0eTRx?=
 =?utf-8?B?OEZXSU9pbTY5WVJpTzZNQTFWZnkxL0grUnNQV0NIOGZVQUYzK2JZUThjMmdR?=
 =?utf-8?B?d2hNU1ZNVG5VVU12Q2xCZHlneENxbFU0YVlwcmRYQzBaT0syNkZoTjM3UHVn?=
 =?utf-8?B?aUpSdTNHWlliWnRnM3lGRnhjL3V6NVZuRlFtTlVuek5YYlVwN3kvRVpqQm9D?=
 =?utf-8?B?Y3BhRmhXU0N0RStJT1ZURkNHNnVwWFZ5M25TRmtKY2JqVDd1N3NnUWhNanpG?=
 =?utf-8?B?R2x6RG5zNnlPMjFhT25FUTZIcjE1NzhqRWUrclNhcDZabzNEbFBvQ0x6Rmt6?=
 =?utf-8?B?QVpYbFpram5lVk45ekYrM2NLam51S21LdU4vUXM2alJTamxORVRPSkJzQW96?=
 =?utf-8?B?UVBRSFZ5OTVONkhnRUZaK1JGWUpLK016b1JVK1ZyZnNJWEhzMk9nbnRUZnNG?=
 =?utf-8?B?NURCSnhiZkNlZ3dkcUY5Y1lMWHEzSXVnTC8wSUVTOVR3RkNiWEV1TjQyclFU?=
 =?utf-8?B?VnI4VjcyVGQzS3g3bGxKRjF3R1lxSjNEdHFmMTQxTUVnWGY2VjQzbnhoYW1q?=
 =?utf-8?B?WXE4Y0c5eHVNT28zYVVFS2VkT3Vja1V3VTA2YklLVzlaN0Z0OG1yQ0MwajFU?=
 =?utf-8?B?UFhJTlZNM1ArVk9CVjVjSW1JdW9xRHBrNEF0Z2R5Y2JJWDZhZ1I3NHhUcW1z?=
 =?utf-8?B?bXFzeGQ2VkJ6dWxFRkM1bUFKcmRjRllkTWZuL2pPQWZjMlh1dDhOR21hMGxa?=
 =?utf-8?B?MGhsakRXa3NOMmJ0RmhiWk40R2R0TmNQak1JL0t4RmhyVXNMNHZWeVowQWpE?=
 =?utf-8?B?TDlTRjQrTjFnRGRmTDUrVWE2dTlZSGxzeHFRanFSdHVXYmtHaFl1WDFLbk9N?=
 =?utf-8?B?TCt0K2lvejg3NHpmR2JVczQ3R0h4angwc3hLN1VjampuWjZLZDZWUUxaUjhO?=
 =?utf-8?B?UnM1Qi8zbVZPMnQ3UWprbmlmdno2K3FENS9tNWVnN1ROdWtTTld4aUg3anZJ?=
 =?utf-8?Q?xOPjavcVlFw=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bGwwSHNlZ0NiZFdMaUYxM1hFem1qV1BCeTNObG5YTmxWaEdvRXgyNFB3WEds?=
 =?utf-8?B?T0IwbTdGUlV0cW9KNWZhU1RkdVZ1WXpUUXBTZkZuS3YyWWcyaDROMEVLaitI?=
 =?utf-8?B?bDhsSG9hekhUOHNSeEw0Q05XbUM1TXVDR1RubEVKUTg5OVpWSDkxcUJiVXNN?=
 =?utf-8?B?OUVaQ3hTbXhOTVRuN3BGblFnalQxaHlnZERrajBCaEllUm9KMlVHcXZLQ1oz?=
 =?utf-8?B?T2ljNDEva1lkMndTYzI1SktsRmhuaXU3NTJtc0ZCRXBpQmhTTGZ2Mkd4TnN3?=
 =?utf-8?B?Ym4rblVTSk5ONnVhOER1TU5TY2VtM2tad1M1eHpUSmFVN3gwMm5IRHo2RVV1?=
 =?utf-8?B?OURhMFBMSFl4YWdUc1VXeFdrTC9Ud1lCM0ViTmd1TzZvS2djMi8rbkRkRkc1?=
 =?utf-8?B?OVEvd3FvWlphdDV0ZzI1NGY2Y0RNUCs3V1RiMkRqNGd3cWZjMFN0akRwL2RO?=
 =?utf-8?B?YjFMVjVWM0JsYUdOa3pLVGh1MnFNSEVmRHlxSzVyZTZlS2FzUVFxQS9PSEhP?=
 =?utf-8?B?d3VUbThNRHM3RFdZeU0wMlVoeEtVcFArNkNwOUdRYXNOZ1pUUWxTZmt4OHBQ?=
 =?utf-8?B?Ym11Tkd1bFhoN0x4Z2NNQVg2Y1gwS0NXWDRGRmlRbVFtMVQ1Z0daOWtmMmh6?=
 =?utf-8?B?eDVPUWxLZFdWbkhWa3ZBTHFLMHpoUVY4Mm5ndXg1c3pXWHdyVmI5amlWZ0Z0?=
 =?utf-8?B?OGJBUmF2ZUhLNFYxNzMxY1hacWRMbHRLc29kaGUzSHVaMjk0TDRHc29BMTJH?=
 =?utf-8?B?M3VZTEhEdzMvTkU2bmwvMGh6OEJvTVAwei9SazlwZmZOTEdDek9QenN2eDJ5?=
 =?utf-8?B?ZmcvZnh5OFFKNUdWM0crcERNQnl1VDZVMkJrZFNlb0ppSHB6ZkVvL1N2OFA3?=
 =?utf-8?B?bldIdTJZa3EyRlNpQ3NzTTFvbUszV3EwOGZZc0tTaFEvSFdSZENseXZyZ1lw?=
 =?utf-8?B?MWpEN3JJNVRYZXhXbEw4aEM4QXlmNDd2ODdKdGQzYjlOUkRQMmp6OHdXTENk?=
 =?utf-8?B?czJxaGhONzArejlxYk5nSmx2bVV3dmgxRXFwQ0prKzRTYTV0TVQ1UmFPYWpP?=
 =?utf-8?B?Nm1Bek9JMFRITktGR2lkL0wwTXZIdnpraGtsWFlPcU5RSmgyQXJ2bXd2UnZv?=
 =?utf-8?B?ZFZuK3ZGSmNHWEw4cmhOeCt0VXpMT0R2Y2g4RHBTMUJNQUhXbHNzcnZ6OEEz?=
 =?utf-8?B?VUhTK2NtdVd3RVdKaDBvcjZPWlhtK3V2clRTQkN6NkEvUjNsZ1F4Ymh6aVd0?=
 =?utf-8?B?UUtQZjkwQjN1Qm5HQ3ZQcTZCcExVak9rL0VoU01JZ2F0ekZWT3VoMVVTclRK?=
 =?utf-8?B?MFFjMlZpYnA0QWxBUHIrc1l3eGNKYng1Z0RLckQxREs0cmZVTWc1NTcxdnox?=
 =?utf-8?B?SDd2QzZ4MmRhMVQySVUzU2dCY3RrdFg5T2lSTDlBSE5xVUJuTjdYMVQySDgy?=
 =?utf-8?B?S055OUxMMGtUZmcyTEJwKzBmaSswMUYwQWxNTnUvbEdnRkFRT2JFWkVsUlRB?=
 =?utf-8?B?NDQ0cGZVL3YyeVhOYVpVVzNXbTB6MzZmaWk5dW41SjBsWTJOK1ZwUEZTT2Vp?=
 =?utf-8?B?MENtZUl2eVVpS1BlNmhqdTZxSktuUE5zWUFSYTdWc2lXOERQZ1gyYldEcnM2?=
 =?utf-8?B?YUZmUCtQNjVkMG51eGs5WWowallqUDlBMndsb3RSWk0yaXcwWWdXYk9ncWRz?=
 =?utf-8?B?ZitxVVJVbGVWbmY5RUlXR0ljMzNCdHlyOFVDcVZGdENRdGlLUm5ZTS9RU2kw?=
 =?utf-8?B?bVltUTVlNUxwajU1d1hZZkFNaXBJWVFjblZnRDZRamZBUEEzTzl3T0NLNHVm?=
 =?utf-8?B?bWd6VkhPSkMzd1JLeStWcFFRT2lKV2FvL1Z1UjZxbkx5NEtMV2tQbnIyQWZU?=
 =?utf-8?B?ejFiaG5Vc0xSSHhiWVFnMTJsNjBVb0hHNytSVmpEZWlNZlZPUmxpZE5ZanhW?=
 =?utf-8?B?eXhmMm84dUUzTCtUSUE0ZDJyOW9KZ0crZzRzNkVGM05SZDZ0QWNwa1lBakhG?=
 =?utf-8?B?UXZ4ejZCNEpmMkFqNWJ3cEo1WTYvQTVRQmg1bFg5bm5uZDZUckprRVVYQ1VK?=
 =?utf-8?B?RXREVyt6WmdyejRQL0VpZ1pGaVZJZWhjOTBSVHVIR0ZXcW04RWN5bkdYbHEy?=
 =?utf-8?Q?jcuK3wQfgbap756W4z83D/3ys?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7704a4fb-047b-4e2d-4174-08dd7b36a04c
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Apr 2025 09:27:50.6746 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: z8rJeVEpXWQuMX9xI1iPkZPRGw0bTAkXvWKNwRtyi7FwXQpplWydAnQPceFQ3noK
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB7465
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

Coming back to the original patch.

Am 08.04.25 um 11:17 schrieb Denis Arefev:
> The user can set any value to the variable ‘bo_number’, via the ioctl
> command DRM_IOCTL_AMDGPU_BO_LIST. This will affect the arithmetic
> expression ‘in->bo_number * in->bo_info_size’, which is prone to
> overflow. Add a valid value check.
>
> Found by Linux Verification Center (linuxtesting.org) with SVACE.
>
> Fixes: 964d0fbf6301 ("drm/amdgpu: Allow to create BO lists in CS ioctl v3")
> Cc: stable@vger.kernel.org
> Signed-off-by: Denis Arefev <arefev@swemel.ru>
> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_bo_list.c | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_bo_list.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_bo_list.c
> index 702f6610d024..dd30d2426ff7 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_bo_list.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_bo_list.c
> @@ -189,6 +189,9 @@ int amdgpu_bo_create_list_entry_array(struct drm_amdgpu_bo_list_in *in,
>  	struct drm_amdgpu_bo_list_entry *info;
>  	int r;
>  
> +	if (!in->bo_number || in->bo_number > UINT_MAX / info_size)
> +		return -EINVAL;
> +

As discussed with Linus the goal here is not to avoid the warning, but rather to apply a reasonable limit.

Since we already use an u16 for the number of BOs in other cases it is probably reasonable to assume that we will never have more than USHRT_MAX number of BOs here as well.

So please change the patch accordingly and hopefully nobody will complain.

Regards,
Christian.

>  	info = kvmalloc_array(in->bo_number, info_size, GFP_KERNEL);
>  	if (!info)
>  		return -ENOMEM;

