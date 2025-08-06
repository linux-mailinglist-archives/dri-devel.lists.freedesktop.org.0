Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ADE72B1C28A
	for <lists+dri-devel@lfdr.de>; Wed,  6 Aug 2025 10:58:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED03510E725;
	Wed,  6 Aug 2025 08:58:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="2omfbSI7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam02on2080.outbound.protection.outlook.com [40.107.95.80])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 401A610E3C5;
 Wed,  6 Aug 2025 08:58:28 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kQyaU3aGYBGrkjbrxtarldPCB/xWYppQegAhYZ0UoxDks37XHaIoVYC9954m2TgOobSidk7pNT4f/QmHAHE63ZhFXHIFBXCJMNIsUxrTvPEiWh21uS615u2dazdGM6t/zvwO6eTqitKgq+bHxwNGDvmWtMzoVJTTGS9/h7gmcKXMDMeyMTv+HiqBqCBgiITl+2qmyjR6QFk4W4kpmYKGH687Bvl971T9D5MriR4Sbo/Mkfp7yV0IA/Ah3z8MMCqZ4dXzsRf2KqEGfLVC8GCA4LR7tYSd/CQe7SWVu2z+Wjb1HucW1qbUa9qPmh6gpAxiB5HgELfW2Bpu+57VK/GcSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=INWI0tS0az7HvaLhVGCYlSw/Gs09DcPsBxQhBPAG/P8=;
 b=QjIp1eCV0N/FES/cs9CLlwdyR1r+403sY1uB0iVuzdRiSi+i38feeIewcPy8QozLOJH7eq3bG8XIMvJ59NHVbtcjvUBN3QWgpW6K9F7CbKlvza/qfHSGSHII2wOPPRo+slsPSXOflynFO6TUjurHp7MnRe7KYeIeZU8S0RWzgx153wwdIKAd+Wbo95FmkW5roXxEJUxcz3yr5F/T4iy2t3zppBGrtKDeqleAOMgH7VLFoLdcl3iXgH2YVGMCssvPclldFvU3lIckuIaxJWwAqCtDTwUW8E9+X5vR0isAZ8B32ThE+DyLkwtthtgaamdFJnSLwbKoxzpPYSQ5Jpjxvg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=INWI0tS0az7HvaLhVGCYlSw/Gs09DcPsBxQhBPAG/P8=;
 b=2omfbSI7BM8OxOFurpNWVzBzphJHr//d+vVnYe4w2vjW46rg7QLZAq/RIgU0IVGyKbB2kNWMjkmRXLMHhqotJjGLZMFpTxQzuKH9BEv996IswBp5IO0Bz7JgVMZUu/QyxVT1OCVd5vJO7QuRX0uqxKIdyfcbbN0bnWzmSH2uH64=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by CYXPR12MB9388.namprd12.prod.outlook.com (2603:10b6:930:e8::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9009.13; Wed, 6 Aug
 2025 08:58:24 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%5]) with mapi id 15.20.8989.018; Wed, 6 Aug 2025
 08:58:24 +0000
Message-ID: <601a40fd-e508-4e9d-8dd3-14329f3a637b@amd.com>
Date: Wed, 6 Aug 2025 10:58:19 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 0/6] amdgpu: Avoid powering on the dGPU on
 vkEnumeratePhysicalDevices()
To: Philipp Zabel <philipp.zabel@gmail.com>,
 Alex Deucher <alexander.deucher@amd.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 "Pelloux-Prayer, Pierre-Eric" <Pierre-eric.Pelloux-prayer@amd.com>
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Philipp Zabel <p.zabel@pengutronix.de>
References: <20250731-b4-dont-wake-next-v1-0-e51bdc347fa3@gmail.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20250731-b4-dont-wake-next-v1-0-e51bdc347fa3@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MN2PR15CA0043.namprd15.prod.outlook.com
 (2603:10b6:208:237::12) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|CYXPR12MB9388:EE_
X-MS-Office365-Filtering-Correlation-Id: a19adfec-d278-4285-5f49-08ddd4c766a5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?c1JJQklNc3dFUGdmcjM2U3FEYms0L2ZnTjRyNytjRS80NHlEdXo5cW82OGFF?=
 =?utf-8?B?aWk1b1d0cHFlQ2kzMXI5a0N4TTZROHoxc1UzZEdjQVpkVUNvTmNUUjJMTlh4?=
 =?utf-8?B?ZWs2TTNtNVoyRzc4Z0dpKytzdXovb1Q1ak4vRm41VjBTUFdlR3JGREVEOU1u?=
 =?utf-8?B?VU5ueWg1Y2QwMTZCcVdENkc1bzRMU2lMZnZmbVM0QmZFZEhBQWttZE5KTXRT?=
 =?utf-8?B?TUNKWUNBRTBLeitnekFYc1c4K2NUSXNlby9PbWFlbWtTajVVdUdKcE5zQWNS?=
 =?utf-8?B?Uy9LZ0NYUDQxdjZzSkErMEdqT2NpTElrY2hWdGRwcWlnK0pSSFhSNFFyQ3JH?=
 =?utf-8?B?Mi82QVVmYWF5clhIMnZzQmNaK2dkUzFpSXowWTRPMCsvREhnci9WUDlCV29n?=
 =?utf-8?B?bEpBSkFCZ1gvd1ZCdDhCN2M0bExNT3MydkZ6SUpMNDRXWW9kNkFWUU8wTEJY?=
 =?utf-8?B?cWIrKzlUYmx6dm82QmFCWWJVRlY3cUxvcDJrR3dlUWdEWVBOcjh6Q2NUVlV6?=
 =?utf-8?B?R29kdmdtRVE2R05PN2hrR2JHVjdaa09zUExqL2xFV3RwVTA3TnFQdzRYNk82?=
 =?utf-8?B?UDU0TWlrdytndG1ZNXRMZmJkVlNIUFJOdmp3UnhDM3ltaFRoQzJkS3dkZjNY?=
 =?utf-8?B?d3p4bFFJVTFJT1UvZEhRNUJtRjk3cFNBQmxjZ0IxcVNGZ0hsWm9zc0hiNWNI?=
 =?utf-8?B?c3A4M0pFRVBmQzBON1Z0cUdlZ002akhmSk5UUUd3WXA5bkJmL1NiRENtVnkr?=
 =?utf-8?B?L0RPNnluOGxsaWE3bnYwcTBMdWtDdEtQUXNUNXZhZ2lyMGJRbURrTHFFMkVV?=
 =?utf-8?B?UmVFUTNxTngrWVdPTjFRRnBYQ01Cd2FZRXJhTE82RTVSRDdXQy9nY3ppQ2lY?=
 =?utf-8?B?Smw4d2VQMGw5UVE2dnNWK2tWTEpTcUtOQkRXWW1FNVlMNC9lMFcyTC9sbThE?=
 =?utf-8?B?OE92cGlUbHpjd3F2VlVNWXdZK3pnU0xsRUVweTN3bTFZWTZIWFJWclJCZk1D?=
 =?utf-8?B?amxKVXprbTZrdXZoWG1OU1dHVC8vL3VBOXpZbzBwcm1pRHJJUWp3S1VCbm1M?=
 =?utf-8?B?U3M5ejJxcXdSOWs5VUl0VVpSWE9NKzUrQnhYeVM4dER0d2JxYTYvNkxlZzda?=
 =?utf-8?B?Z1RITTZFVzc4ejkzendmQTA5WEt5SUVFd2tkMzhneW8rWEdoT05TMm14bjB3?=
 =?utf-8?B?VHpRT3pQcjdhK1pxQVFEOUJqbmxjVnpMRktPeVluclJIanI3RkdqdnZJK3Ax?=
 =?utf-8?B?YUJiL0pUSkdVU0V5N1JLYzBSN3B3TlhZWVV3YzdGdkhsTGp0UVErQ0cvSk50?=
 =?utf-8?B?dkE4NWp1ZjBJUDF6dFN1Mkt0bUhvYUFhN0ZXQlRxMzJWcVROeUFjUVc3Y3g1?=
 =?utf-8?B?UmVDN003U24yS1pmOUZmZkFidUVlRE5VVWhlS28rTmtJbUxiYkMzalhISW1t?=
 =?utf-8?B?My90eUh3cVMxSXhjcmNXWHl6ZllPZ2VuSkQ3c1dGR3I2SkVNSGpjL2dZNDdq?=
 =?utf-8?B?Ry9mek5pOHc5ZVVodUp4czBmMzRiRlNORnlPSURiYnZJYjdUcHdMOFFsdmFv?=
 =?utf-8?B?VVhHaHNSV2gyNHZueHRLOXdEb3RiYTVQUDJ4VjJqMWQwTHFxYXU3Ri9Bc0lq?=
 =?utf-8?B?dVp6a0ZHcWhhQWdFSzFKUVFvZkxnaXNJODU3ak9MMGNra3ZiaUMwbDBDSG8v?=
 =?utf-8?B?eUFGK256SFZmVXhKZkNJa0hPRm80WVFwZERmOUdYUFp0QmZ1Q3lVeEVnbzBu?=
 =?utf-8?B?K2M1MEw3ZGdoemFTMGtGalZTb3UveWxIY0E3Y0FyQkJCYTRUV0d0NWhnSFRZ?=
 =?utf-8?Q?FmNeKeXX95fnciC58BbTj2WFWqXIKIcuBuaJE=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?R25qejJMS1JRTmV3SXhETVlMR2lwUi95ZHhYM3NmbnpXL2hQWnVRUlVtb2xI?=
 =?utf-8?B?OWdlUDV3NGU3OVo4YjBDMC9LQmE5V1FqcW5FWHZ0dWVaY1kwazJVaXZrZnox?=
 =?utf-8?B?ajRac0hQVHZCc0Y3SFBRb0FJZFRmdS9OVjNKZjlUUDE0Vlk0V0grblFDRTFs?=
 =?utf-8?B?dGJIK3ZqYVNiZ1k4YlI4SkpZWHBadmtPc1NHaFRFQlNOeUY3djZSdi9SMnhL?=
 =?utf-8?B?bE9CVnVNUEZpWHI1OVlteEFKRkcveFh2UzE4YVhxZWxadjNVUzQ1SHR2REN5?=
 =?utf-8?B?TDM1aTR5UWh0MG0zeUVMRmpWMnBCZzduZGIrRW92bVlqdDR5bEszRng3THRk?=
 =?utf-8?B?ZG1YSE1sOXU2bDc3UzJESUJsM05EZUlocTlrZEhpMTY3cDROV01Bb09ZdVZo?=
 =?utf-8?B?RFhGdEZrMk5WNDFkRXZGcGtVeWJSWUdWSkVvZHRUTjlYNHI4QU9mVG5sMWU3?=
 =?utf-8?B?TWR5cGtzKy9xZGdiVEZrMG9SVWhpd3Z2Njh1Q09Wc0NaNEZlT28rK2tGUXhZ?=
 =?utf-8?B?SFlDT1N4R3c3S29uUi8zUmthSFIraG42RmZkL3hmcnhCa2pZOVdzcTA3OTZS?=
 =?utf-8?B?ZDRkamd1aEFtZTAwcHY5eTFuODJHeW1KaXhkTzE0SHl3d0tubkxZMHJrM1pq?=
 =?utf-8?B?OVd0cWhLY2xtZ3ZwSmtEK3NxbngreFhBKzR5OFVGOWxMR0MvTGE3dFN0Mm5w?=
 =?utf-8?B?T2EyVisrU01PUDRneURuYlJFRmxhOFZXZEVpSTU4LzBhQXFYcVV1UTJxK0RD?=
 =?utf-8?B?d09wdnpsRmJ5VmQxZSsyVDdxK1R6WXhQU0g2MXlmN016a3NjOGt5M2NrU1Z4?=
 =?utf-8?B?MldqZVVzK3dYaktGSFlZc0M5TDBNY1ZIWHBUc013U2FTR010bGpOYndPSHU5?=
 =?utf-8?B?bVp0TVcwL2lYL21CSWJGR3EwdzZvMWhEVEpSWVd2ZjFiSk90OXJ6cTYyRHRS?=
 =?utf-8?B?ZXNWNE9HVml3d0FRMExyNEVmdlNwSGpZUWp5djRrS1ZIdXRmK08vdm5uMkdx?=
 =?utf-8?B?MC8wK2dFOS9LSlpuODB0K29MQUhQaXlDTitKVHh4RmRKcnJsTldkUnF2Qis4?=
 =?utf-8?B?eXNPamFTeWlLTkxUZ0ZPNnlrWnZDVkRlYVRhbDBjY2Jvbnk5L0gxU3lyQ0Rl?=
 =?utf-8?B?VUpGV2owLytOYnZBY0FDOXZ3emE2cVhpUVBOcS9OWUh6TmFmbjQxb2RqdFZa?=
 =?utf-8?B?d3VCUFRQTWdDSFBsdlo1OTFFNFlSUk5Sa2VId2h0WkpmZHM2N3NqUThHODVU?=
 =?utf-8?B?YzFxbFlQc0JiRi9IdlNObnp0d1A5WDZweGdyK0hVVXpyUk41ek5kVG9jaHAw?=
 =?utf-8?B?aE9wVGswVmZ1b1dNTllTM2dZWE03TGk1RkhNaDZXYTdTbkJtSVd4dkw4eENF?=
 =?utf-8?B?Y1dQaGlKeHhDODdqN2ZsblhjTGtScTZzanc5ZDNKVjFJcThkOUhPdWhxenAy?=
 =?utf-8?B?eWlzVS9OYUZ0cUJvTWZVVHNrZTlMNVdzUXFLSTRha2tXYWdVMGJ2d1ZKc1RG?=
 =?utf-8?B?RHFVQmdtU1l3VXZTUGNITDkwYnBsakpSR0d5SHVudzFGeVMyYWYvUU9oMWZu?=
 =?utf-8?B?VHJkT2hWR1dyTUFXaFZSdzBSOG40MGd4ODBrTHMwdGNDcE5UYlNHK1RuVm9X?=
 =?utf-8?B?M2dYaisyeEdPUHg3TkVOelhuR1JpVVk3dFBPMGpacDAyN2dRSjJzSEVZdnVF?=
 =?utf-8?B?WnFiQkF6T1NnSkI1Q3hQMVpUNXFTY2twdVZSbFlxSVE5eFUvR3lFdDR5cDIv?=
 =?utf-8?B?aGhJcXNGUCtuVkFLSUJFRVE0M0dEWWppbS93Mkl4QThUeFYrazJKYkEwOHVB?=
 =?utf-8?B?aFAwOS9yWDdyeE5NZW52b3ZET1E5MjlhUFZFajZ6RGxhUld6T3J2UnVxZEN6?=
 =?utf-8?B?d1lmd0hsREtaeHFvMFo0U0JsSlgxNWx4czdRc0RSRmxhZEM3OXE3dk5NZmd2?=
 =?utf-8?B?ZVVrbUd6Y0gxTUpTdG9MRi90QU1EWTZjMnFoQWpRQTBreHJxS0JmcS9qMlNj?=
 =?utf-8?B?Mm9JZVRnMUJhSWJCSDZkRXFLQWZPeUtOd2xFV2lBSk9WN0UyQzI1Smd1TEIw?=
 =?utf-8?B?VVd3R3FJbzFnZjFEN0taN3dCZUYrVVkrNUYydjF2bVBObk84b0xxQW1EWFJ4?=
 =?utf-8?Q?W9JR03rn0u8jrmqaWKLtXr9Pd?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a19adfec-d278-4285-5f49-08ddd4c766a5
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Aug 2025 08:58:24.5192 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bOp0ijbk+HyinjZ+/QYZjhtV7RmDGUDTPJG0Ce02NUszqraF9clqf0D4jXWPNLpD
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYXPR12MB9388
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

On 31.07.25 07:36, Philipp Zabel wrote:
> This is an attempt at fixing amd#2295 [1]:
> 
>   On an AMD Rembrandt laptop with 680M iGPU and 6700S dGPU, calling
>   vkEnumeratePhysicalDevices() wakes up the sleeping dGPU, even if all
>   the application wants is to find and use the iGPU. This causes a delay
>   of about 2 seconds on this system, followed by a few seconds of
>   increased power draw until runtime PM turns the dGPU back off again.
> 
> [1] https://gitlab.freedesktop.org/drm/amd/-/issues/2295
> 
> Patch 1 avoids power up on some ioctls that don't need it.
> Patch 2 avoids power up on open() by postponing fpriv initialization to
> the first ioctl() that wakes up the dGPU.
> Patches 3 and 4 add AMDGPU_INFO to the list of non-waking ioctls,
> returning cached values for some queries.
> Patch 5 works around an explicit register access from libdrm.
> Patch 6 shorts out the syncobj ioctls while fpriv is still
> uninitialized. This avoids waking up the dGPU during Vulkan syncobj
> feature detection.

This idea came up multiple times now but was never completed.

IIRC Pierre-Eric last worked on it, it would probably be a good idea to dig up his patches from the mailing list.

> 
> regards
> Philipp
> 
> Signed-off-by: Philipp Zabel <p.zabel@pengutronix.de>
> ---
> Alex Deucher (1):
>       drm/amdgpu: don't wake up the GPU for some IOCTLs
> 
> Philipp Zabel (5):
>       drm/amdgpu: don't wake up the GPU when opening the device
>       drm/amdgpu: don't query xclk in AMDGPU_INFO_DEV_INFO
>       drm/amdgpu: don't wake up the GPU for some AMDGPU_INFO queries
>       drm/amdgpu: don't wake up the GPU for mmGB_ADDR_CONFIG register read

That is both unnecessary an insufficient. Unnecessary because we already have a mechanism to cache register values and insufficient because IIRC you need to add a bunch of more registers to the cached list.

See Pierre-Erics latest patch set, I think we already solved that but I'm not 100% sure.

Regards,
Christian.

>       drm/amdgpu: don't wake up the GPU for syncobj feature detection
> 
>  drivers/gpu/drm/amd/amdgpu/amdgpu.h         |   5 +
>  drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c |   3 +
>  drivers/gpu/drm/amd/amdgpu/amdgpu_device.c  |   2 +
>  drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c     |  80 +++++++++++++++-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_fdinfo.c  |   3 +
>  drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c     | 137 +++++++++++++++++++++-------
>  6 files changed, 194 insertions(+), 36 deletions(-)
> ---
> base-commit: 6ac55eab4fc41e0ea80f9064945e4340f13d8b5c
> change-id: 20250730-b4-dont-wake-next-17fc02114331
> 
> Best regards,
> --  
> Philipp Zabel <philipp.zabel@gmail.com>
> 

