Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 57472AA495C
	for <lists+dri-devel@lfdr.de>; Wed, 30 Apr 2025 13:04:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A340A10E0C9;
	Wed, 30 Apr 2025 11:04:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="3S/jYXBO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2071.outbound.protection.outlook.com [40.107.243.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F88110E0C9
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Apr 2025 11:03:58 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NWOh2hDyoX7K6toGGaJtmu+Su+ZTwhIJTWLjk1yGzsWr+0me9oiIcw/UEDKJ7prSOyEOz1ou4TWuuRxeISgmHuT4WpxLF5x8HKX6BVy/l4hGVYsnJGoybiubLVmBz28HCTtRgWBOrgAlYoJlQVIs2hrHvnz/PNK41GGP1Vp//A2obSibT0EuXnU8W8csh5CWAdhYc3epa/v8p6efDvSEO3HAXrGJp1ffN9ae3lDPPOV+oqhk4ICCEeHeC5hctdBE7SlALcf3mscyCMUeIyBaDsAclbttUvXwSj2Oy3thiunAKmnBWph/hmpMYAXBpz8uGxAE1vu4heMU465wdxBQCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rPAD/0D+v+fRE1jfnpKPCulGLrHIfKEXGOGBkHJ/+oQ=;
 b=IEm/+RzSHka2iatRNgquyTBW5jHvb3h46cKLeXlcEFsqH1JP6UhilWnkNkS7yGFXePGWXlp81qpQjwjcTXurom3/okV/X4qdjOmZRjrdw9DnindyaKnOEJumA5d2dFP/XmIfarP5FPAVUbK3gvWdx/jllNh14PxMidYpIpDKPj4vmnv499bWkqd4hQ4cr8bkH5PFu0G2JKhhHx89oNTssqsM64+YYWD0KrSchO31e0csCtpOW5LVB0D5AU/62LJAHxPNBGsJPT6J8g3U0CYC3jZwQma522dIy7KnFKY3OE8NW9DzVe//FyuhFOkToadE07drI0buvonCyetEw0nnMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rPAD/0D+v+fRE1jfnpKPCulGLrHIfKEXGOGBkHJ/+oQ=;
 b=3S/jYXBOx6pD8Gw8h9NJAL7F1WE21MDypmy494i0nVpCfYpn1n0fwvNCx/DJ2Ri3U3d7xWBF0FFu7J0S2pCGJb4aevSOIWG8agcb3LsJZYbeBBTtBsu1E4yrqPczEWkhFM9jPlxcBUFyCGA0XmEJbjd54igMFEoRd/gM62uyR80=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by SJ2PR12MB7823.namprd12.prod.outlook.com (2603:10b6:a03:4c9::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.33; Wed, 30 Apr
 2025 11:03:55 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%7]) with mapi id 15.20.8678.028; Wed, 30 Apr 2025
 11:03:55 +0000
Message-ID: <daaf1445-f0b8-490a-b87b-dab219f13571@amd.com>
Date: Wed, 30 Apr 2025 13:03:50 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] drm/prime: Support importing DMA-BUF without sg_table
To: oushixiong1025@163.com, Sumit Semwal <sumit.semwal@linaro.org>
Cc: linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Dave Airlie <airlied@redhat.com>, Sean Paul <sean@poorly.run>,
 Shixiong Ou <oushixiong@kylinos.cn>
References: <20250430085658.540746-1-oushixiong1025@163.com>
 <20250430085658.540746-2-oushixiong1025@163.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20250430085658.540746-2-oushixiong1025@163.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0226.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:e9::14) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|SJ2PR12MB7823:EE_
X-MS-Office365-Filtering-Correlation-Id: b7184a68-fdfa-4fbd-a0c6-08dd87d6b311
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|7416014|376014|1800799024|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?elpPRlBEY2hPVUNFU2ZqMkljNnY3M3RGbHprZ05uTzBnTUFkVnpZbnpJbHpo?=
 =?utf-8?B?b0drTklnUXF6dkN2SHF0clhGTCtxRDFyWlZWMTc2M01VRnZBNklhMXZrWURR?=
 =?utf-8?B?N2RMbUtzQ2p1M0dNTEZ1VlVPaWdISjY0ckpiTFBFdUtmUGI4WGtla2x3Z1NG?=
 =?utf-8?B?cThyQTB1RExmSkh2MzBXUU1Pa21lTElsS2Z2YUhYVm0vVC9IbGtiOCs2N0N6?=
 =?utf-8?B?YWt3VThrT0xHUVl1RlZUdkZGcm5EbEhsS0F3TlRlRnVFMzZkdGxFU05sRHo5?=
 =?utf-8?B?MWZvQU9CK1lUand3U1Q1UmNBelcrc2s2MDNmemdSOFo5R2w4eS9KZk5EVFpW?=
 =?utf-8?B?NVMvN1VwV1c1MXllYnRiTHhsUWdLRVlINjFRbkRFUm5KYUx1TE9WeWFUQ0Vm?=
 =?utf-8?B?dXBvTThmZ2Rxdjlpc1VRZHRqTHhkRGx3SUwzUkFPaERTYjMrRmV0eWg1U1ZG?=
 =?utf-8?B?dU1kdGUwTUdxNm55RkJzNXlrSWlsNzRJaXkzUndTWjAzOUhxcnF5UTNKRXg1?=
 =?utf-8?B?ajZ4dCtId1RydVNJeFpqeGNmZTNzU2VUVmxSVDhhYy9vYnZIUEd4SGN3bmtY?=
 =?utf-8?B?UThsazFWakZXOExpaFcxcUt6WjJXNkdVTDRmNTdtUFA1Mjhqd2g2WjZjcmZR?=
 =?utf-8?B?TlUwL0EzcXZkVFh1OCtueVVCWEJ1SEEyQmU3T2RqU3JaUGVxcUVjRytWc3pD?=
 =?utf-8?B?NFFua2dsU3NtMGNsaXVRUDVjQzlrSVFRR3YwRTJCSDk5d3dqTzlJelYzWU01?=
 =?utf-8?B?WkZhNElLUmlOSXkycjg0d2dCa0pWdmlBRHFWUldWVDhPWGc1MDVuTEt5VU96?=
 =?utf-8?B?d2gzZVpzek5HSm84OFpRVlh2c2Q3dVVKbytsdU9EM2M5MHNTRHQ4cTZHQXl4?=
 =?utf-8?B?d2FHMVRsdXNNYVVvdS9OdmwzRUlPRHZvV0xKMXY1UnYrOTVtYzZQM25BM24v?=
 =?utf-8?B?dXNiYkFHUGt3QkoxbVVFaHF6aEJ6eFQ5QnJVRmR0cHNCZ05uc0RLSWh2dXpy?=
 =?utf-8?B?U2dOaUwrLzR0Q2ZVc1F2dFNvNlpzdHdPU01wVHg2alBOTWY3ekJPN3VwZjBs?=
 =?utf-8?B?Q1owWTBuMllWcktGcC9Jem5PUFVtNlNuRGJjTGdldUpsY3lhY003bkdoeFdN?=
 =?utf-8?B?N1hYakxHSXZXUWNqWk1KcGVCakJLcHdpMnpMaUFJdzBlK24xYUc4elg3ZXJs?=
 =?utf-8?B?WXpaVlBQWkczVVV5cVh4NmZyck5ZYkxybTRKVndKRXRWck9Eby9ZTE54My83?=
 =?utf-8?B?MExORkphVVVONUdPNExuc1c5T0NLWXI5aFJJeGMxTDNSeGZMTHpvQWlNaWYz?=
 =?utf-8?B?c0U3QU1VaUN1ZjNNT3E3K2VwQmlHZXkwcEYvandZUUt0K3hGUEtVaXFNQkFw?=
 =?utf-8?B?ZGVVVkxSaTU2VWFNTU9RNllzYVFKUmZHRERXQTQ2ZkVDOGFpRnhGOHVEM255?=
 =?utf-8?B?b3RRbms4YVpIUW02bkNHdjZZV25jMGtHd01SUzY4S2x1ajNSd2w5TE9FT2pH?=
 =?utf-8?B?Vkx1QWhzOTRUc0Y2dWpPbG0yV2o1MFJXVGFPL0UwTm5SbXEzSU5VYkgrcmhv?=
 =?utf-8?B?VFNlK0FNS0tqanBjREU5SHhlL2lab0J0d2srcnZoYnZhT2VjWTlJeCtURVBx?=
 =?utf-8?B?M1BPUGtJNkZ4Q0VGWUloZkJLbzZSMnVOdWFraktRdXBFNmt0enlvZnlXNmZj?=
 =?utf-8?B?a0dHdlFBczRPRCs4NWhYQW1OZlZjaHBRWHczUFFzL2hNTVpBVG9Fc25aeW41?=
 =?utf-8?B?TVJnM0pqSHhEKzFmTkRSbWhuWWdpVllnS1hlejNBbjUzQzRPaFVwZDVOTzRK?=
 =?utf-8?B?M1NBUEhzakpOYlVWYmZWS0FiYUtGSUV4Sy9TQVFndkpwbGJNSnJKV2FrVVVa?=
 =?utf-8?B?MElsODlhVEJ1eWxtZ3VUdVdoWnJIWEx1TUxSSHpvdE9Sb1RCa1ZaamNPNHZX?=
 =?utf-8?Q?ds2QF+WPaDE=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(7416014)(376014)(1800799024)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RW8rM21HNGlJSUVWTnFmWXFrdVowQlF5R0Zyb3h0UjFNMEJBV3RMM0xlMGpx?=
 =?utf-8?B?MTNGZmQwNjQvVlBINXY2VGJKallxeExsUVMvNE1vckZCamorZ09Xb1VrZVNN?=
 =?utf-8?B?YS9naTZJV25JTnNSOGt4TzhiOXhPVERaUHZTZVlXM2lMY1dqKzRnUG9FdzlV?=
 =?utf-8?B?bWtTaC9jeUhZY0JrcGxhWk9XcW55Y1Z1SWh4WFVkVnV3V1pyN1V6aFlhR1FY?=
 =?utf-8?B?TzlxRExPTXFRMXBLYmpKcTNPMlhDVEN3VmJQL3FFT3QwTEJoenRvYzJXS2JV?=
 =?utf-8?B?eFNlTEJJUWxHSGljejQwZUFjUGpuSU9xM3NLMEI3S1dZbnBvQW4ySGkzSTRY?=
 =?utf-8?B?S0sxRnlVUGZqLzdGZmtCc0VhNllDNXgxZnFFaWpld2llME05eG5GK05qeUNs?=
 =?utf-8?B?MFF2RFhQTmJld01uc2thZ2J6ejRtRmpBdUx4RlFPcXF0d2xEakxMSCtFOFlQ?=
 =?utf-8?B?Wk5JUFdKOFZHRzI1ckRnamt1bmxOTEpJV3ZqNnlBSnF4RTJQVnBVRGhFeHFX?=
 =?utf-8?B?a3NmRFZEc25WdGxWVDNhcXh1Vzg2QnpoMkNNZTRNNGNocllNMDcySjJmRllR?=
 =?utf-8?B?WDBMOXVBbEhubjJqYTFtd1ExM1p4T3E1SUtPUTZpMUFnRjRKY1htRXdhUWR6?=
 =?utf-8?B?bVhGL3l4Y0MyY1Vvbm13TlAyeVNNZUkxdTR5QVp1VElWU0wrQkw4c0lZU1A5?=
 =?utf-8?B?dDB0dmlYYjFWem1QUXduQkZSa3k0OFNTcjdjdW02WkhNbkEwVmhvTHRqRG5x?=
 =?utf-8?B?K1JhRDBlOTU5bjluZ3dVekNTNTFsSzJFUnRQRGlIUnBCY1JvN01RNFBxZkkz?=
 =?utf-8?B?dUM5L3NVRXArVWZPbW5zb1BlN2p6Z3lYNTZlUHFVQWVMTDJGeDlBSERQbURK?=
 =?utf-8?B?NTVlNWJ6ZWRjY2tBNERtaDd3ZUMvTzdrNWxNQXlpNmY2TFdqamx5a2xRK3dT?=
 =?utf-8?B?Z2F5bzVoM1VOUmFrcHc4bGJVTTdVYUNhMGZCbXYwRSszYXNCSFJESDcwMmdO?=
 =?utf-8?B?a0pCQzErOWY3SzJQSzhncks5ZlVORzZ1VEkxWm40S3JPV05WWisybmNJayt3?=
 =?utf-8?B?ZzE5N1Q5aTQyWklpV1RSWkhHTERsZlNxQ3FZaW50L1d4UnhKQTdBMVQxVGph?=
 =?utf-8?B?L0FBd0tnVkFiS2RHNTdLOC9wV1NBellXQjFzb3lYYWxPb2hFOXpsck1ydXlG?=
 =?utf-8?B?NnI5SzltS0dXYUhJaDMwRVdyTTJCWisvUEI2NS9nYVg1WVFFMnd0eEQ2ZHMv?=
 =?utf-8?B?OUtwZE5OcDF2R0s4cjBLbnA4V0dxL1R0NCtpNjl2dy82QThDWTJVdTF2aUUx?=
 =?utf-8?B?ZFM0RlFrMlUyWnl2QjU4Yk9veGdLQWhHekF1RjVTRnlkL05zSnJ0a0hVb2JO?=
 =?utf-8?B?QUNTdCsyaHZqNWovYVNaZUZpd0M1bndpN2ExbWJJZitVaEVIODZIakJXREgr?=
 =?utf-8?B?a0crMC9ESHRaNit5NkFqOEkyTmZQT21LWThVVkJjNjNudWNCZ0N3elRaWlNL?=
 =?utf-8?B?aUFQcXJvK0p4eTJaVUxYRlQ4cTloVHBXaURYY2NobUpqbEk3eG5OTG5vMUZk?=
 =?utf-8?B?M0RhQU9JYzVEY0ZCWGp1eXJIaENkeHhTL240VTBlaXFtL3d4SzJaV1dlc0lt?=
 =?utf-8?B?L240UVFERmRlTG8zVUdYMVpkSEJKcmp5SSt1dmtTbkpGM0czcEZyL0VXZlRH?=
 =?utf-8?B?WmhuOExrQlBnV3NSekhVRlZoR0N4YWhLT0Y4UlEvbis3NFdXWmN3VFEzZlpj?=
 =?utf-8?B?eGxUR0dNMVFPa3VpVlZjaDdEdUJQYjhoTzM4TFpFaVJkRjR1dXFmL3J0Mjhk?=
 =?utf-8?B?WnU3N29UTzBPdCsyNmtRZHNwTmFHd1VNZlBERTVRTTRFb0dRNHp1OHZGdWN0?=
 =?utf-8?B?Ym1Ld1h0SjEzRUVYbytZalhLMmdTckVXLzVMVnBiaFpIdGJjZVJ1NjZLRXFC?=
 =?utf-8?B?YVNOeG9WcXpoTC8vcCtxcEFYbkw2OXYrMWtlQ2FPaktjdW52YXY1dUxXMnVq?=
 =?utf-8?B?aWh2SVhpUkFMOXU4bDAwcFEzOTZkWklCdDdpaVBaRFJZeGwrZVphRGFyYlJD?=
 =?utf-8?B?bFdsbWhEb3cyWGNMeW1FdGtCTXhDU1pJVWpNWTlZc0dNUUg4UkxwRlRmYThN?=
 =?utf-8?Q?SqZGX/II7za480O/5ZeRc2tg1?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b7184a68-fdfa-4fbd-a0c6-08dd87d6b311
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Apr 2025 11:03:55.4671 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CsuCqogojHRWeVROgMgE4ARnIqV70Om7w4rflKcUJWOFMPyVAXoFva9I7rcEJrs6
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB7823
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

On 4/30/25 10:56, oushixiong1025@163.com wrote:
> From: Shixiong Ou <oushixiong@kylinos.cn>
> 
> [WHY]
> On some boards, the dma_mask of Aspeed devices is 0xffff_ffff, this
> quite possibly causes the SWIOTLB to be triggered when importing dmabuf.
> However IO_TLB_SEGSIZE limits the maximum amount of available memory
> for DMA Streaming Mapping, as dmesg following:
> 
> [   24.885303][ T1947] ast 0000:07:00.0: swiotlb buffer is full (sz: 3145728 bytes), total 32768 (slots), used 0 (slots)
> 
> [HOW] Provide an interface so that attachment is not mapped when
> importing dma-buf.

This is unecessary. The extra abstraction in DRM is only useful when you want to implement the obj->funcs->get_sg_table() callback.

When a driver doesn't want to expose an sg_table for a buffer or want some other special handling it can simply do so by implementing the DMA-buf interface directly.

See drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c for an example on how to do this.

Regards,
Christian.

> 
> Signed-off-by: Shixiong Ou <oushixiong@kylinos.cn>
> ---
>  drivers/gpu/drm/ast/ast_drv.c          |  2 +-
>  drivers/gpu/drm/drm_gem_shmem_helper.c | 17 +++++++
>  drivers/gpu/drm/drm_prime.c            | 67 ++++++++++++++++++++++++--
>  drivers/gpu/drm/udl/udl_drv.c          |  2 +-
>  include/drm/drm_drv.h                  |  3 ++
>  include/drm/drm_gem_shmem_helper.h     |  6 +++
>  6 files changed, 91 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/ast/ast_drv.c b/drivers/gpu/drm/ast/ast_drv.c
> index 6fbf62a99c48..2dac6acf79e7 100644
> --- a/drivers/gpu/drm/ast/ast_drv.c
> +++ b/drivers/gpu/drm/ast/ast_drv.c
> @@ -64,7 +64,7 @@ static const struct drm_driver ast_driver = {
>  	.minor = DRIVER_MINOR,
>  	.patchlevel = DRIVER_PATCHLEVEL,
>  
> -	DRM_GEM_SHMEM_DRIVER_OPS,
> +	DRM_GEM_SHMEM_SIMPLE_DRIVER_OPS,
>  	DRM_FBDEV_SHMEM_DRIVER_OPS,
>  };
>  
> diff --git a/drivers/gpu/drm/drm_gem_shmem_helper.c b/drivers/gpu/drm/drm_gem_shmem_helper.c
> index d99dee67353a..655d841df933 100644
> --- a/drivers/gpu/drm/drm_gem_shmem_helper.c
> +++ b/drivers/gpu/drm/drm_gem_shmem_helper.c
> @@ -799,6 +799,23 @@ drm_gem_shmem_prime_import_sg_table(struct drm_device *dev,
>  }
>  EXPORT_SYMBOL_GPL(drm_gem_shmem_prime_import_sg_table);
>  
> +struct drm_gem_object *
> +drm_gem_shmem_prime_import_attachment(struct drm_device *dev,
> +				      struct dma_buf_attachment *attach)
> +{
> +	size_t size = PAGE_ALIGN(attach->dmabuf->size);
> +	struct drm_gem_shmem_object *shmem;
> +
> +	shmem = __drm_gem_shmem_create(dev, size, true, NULL);
> +	if (IS_ERR(shmem))
> +		return ERR_CAST(shmem);
> +
> +	drm_dbg_prime(dev, "size = %zu\n", size);
> +
> +	return &shmem->base;
> +}
> +EXPORT_SYMBOL_GPL(drm_gem_shmem_prime_import_attachment);
> +
>  MODULE_DESCRIPTION("DRM SHMEM memory-management helpers");
>  MODULE_IMPORT_NS("DMA_BUF");
>  MODULE_LICENSE("GPL v2");
> diff --git a/drivers/gpu/drm/drm_prime.c b/drivers/gpu/drm/drm_prime.c
> index 8e70abca33b9..522cf974e202 100644
> --- a/drivers/gpu/drm/drm_prime.c
> +++ b/drivers/gpu/drm/drm_prime.c
> @@ -911,6 +911,62 @@ struct dma_buf *drm_gem_prime_export(struct drm_gem_object *obj,
>  }
>  EXPORT_SYMBOL(drm_gem_prime_export);
>  
> +/**
> + * drm_gem_prime_import_dev_skip_map - core implementation of the import callback
> + * @dev: drm_device to import into
> + * @dma_buf: dma-buf object to import
> + * @attach_dev: struct device to dma_buf attach
> + *
> + * This function exports a dma-buf without get it's scatter/gather table.
> + *
> + * Drivers who need to get an scatter/gather table for objects need to call
> + * drm_gem_prime_import_dev() instead.
> + */
> +struct drm_gem_object *drm_gem_prime_import_dev_skip_map(struct drm_device *dev,
> +							 struct dma_buf *dma_buf,
> +							 struct device *attach_dev)
> +{
> +	struct dma_buf_attachment *attach;
> +	struct drm_gem_object *obj;
> +	int ret;
> +
> +	if (dma_buf->ops == &drm_gem_prime_dmabuf_ops) {
> +		obj = dma_buf->priv;
> +		if (obj->dev == dev) {
> +			/*
> +			 * Importing dmabuf exported from our own gem increases
> +			 * refcount on gem itself instead of f_count of dmabuf.
> +			 */
> +			drm_gem_object_get(obj);
> +			return obj;
> +		}
> +	}
> +
> +	attach = dma_buf_attach(dma_buf, attach_dev, true);
> +	if (IS_ERR(attach))
> +		return ERR_CAST(attach);
> +
> +	get_dma_buf(dma_buf);
> +
> +	obj = dev->driver->gem_prime_import_attachment(dev, attach);
> +	if (IS_ERR(obj)) {
> +		ret = PTR_ERR(obj);
> +		goto fail_detach;
> +	}
> +
> +	obj->import_attach = attach;
> +	obj->resv = dma_buf->resv;
> +
> +	return obj;
> +
> +fail_detach:
> +	dma_buf_detach(dma_buf, attach);
> +	dma_buf_put(dma_buf);
> +
> +	return ERR_PTR(ret);
> +}
> +EXPORT_SYMBOL(drm_gem_prime_import_dev_skip_map);
> +
>  /**
>   * drm_gem_prime_import_dev - core implementation of the import callback
>   * @dev: drm_device to import into
> @@ -946,9 +1002,6 @@ struct drm_gem_object *drm_gem_prime_import_dev(struct drm_device *dev,
>  		}
>  	}
>  
> -	if (!dev->driver->gem_prime_import_sg_table)
> -		return ERR_PTR(-EINVAL);
> -
>  	attach = dma_buf_attach(dma_buf, attach_dev, false);
>  	if (IS_ERR(attach))
>  		return ERR_CAST(attach);
> @@ -998,7 +1051,13 @@ EXPORT_SYMBOL(drm_gem_prime_import_dev);
>  struct drm_gem_object *drm_gem_prime_import(struct drm_device *dev,
>  					    struct dma_buf *dma_buf)
>  {
> -	return drm_gem_prime_import_dev(dev, dma_buf, dev->dev);
> +	if (dev->driver->gem_prime_import_sg_table)
> +		return drm_gem_prime_import_dev(dev, dma_buf, dev->dev);
> +	else if (dev->driver->gem_prime_import_attachment)
> +		return drm_gem_prime_import_dev_skip_map(dev, dma_buf, dev->dev);
> +	else
> +		return ERR_PTR(-EINVAL);
> +
>  }
>  EXPORT_SYMBOL(drm_gem_prime_import);
>  
> diff --git a/drivers/gpu/drm/udl/udl_drv.c b/drivers/gpu/drm/udl/udl_drv.c
> index 05b3a152cc33..c00d8b8834f2 100644
> --- a/drivers/gpu/drm/udl/udl_drv.c
> +++ b/drivers/gpu/drm/udl/udl_drv.c
> @@ -72,7 +72,7 @@ static const struct drm_driver driver = {
>  
>  	/* GEM hooks */
>  	.fops = &udl_driver_fops,
> -	DRM_GEM_SHMEM_DRIVER_OPS,
> +	DRM_GEM_SHMEM_SIMPLE_DRIVER_OPS,
>  	.gem_prime_import = udl_driver_gem_prime_import,
>  	DRM_FBDEV_SHMEM_DRIVER_OPS,
>  
> diff --git a/include/drm/drm_drv.h b/include/drm/drm_drv.h
> index a43d707b5f36..aef8d9051fcd 100644
> --- a/include/drm/drm_drv.h
> +++ b/include/drm/drm_drv.h
> @@ -326,6 +326,9 @@ struct drm_driver {
>  				struct dma_buf_attachment *attach,
>  				struct sg_table *sgt);
>  
> +	struct drm_gem_object *(*gem_prime_import_attachment)(
> +				struct drm_device *dev,
> +				struct dma_buf_attachment *attach);
>  	/**
>  	 * @dumb_create:
>  	 *
> diff --git a/include/drm/drm_gem_shmem_helper.h b/include/drm/drm_gem_shmem_helper.h
> index cef5a6b5a4d6..39a93c222aaa 100644
> --- a/include/drm/drm_gem_shmem_helper.h
> +++ b/include/drm/drm_gem_shmem_helper.h
> @@ -274,6 +274,9 @@ struct drm_gem_object *
>  drm_gem_shmem_prime_import_sg_table(struct drm_device *dev,
>  				    struct dma_buf_attachment *attach,
>  				    struct sg_table *sgt);
> +struct drm_gem_object *
> +drm_gem_shmem_prime_import_attachment(struct drm_device *dev,
> +				      struct dma_buf_attachment *attach);
>  int drm_gem_shmem_dumb_create(struct drm_file *file, struct drm_device *dev,
>  			      struct drm_mode_create_dumb *args);
>  
> @@ -287,4 +290,7 @@ int drm_gem_shmem_dumb_create(struct drm_file *file, struct drm_device *dev,
>  	.gem_prime_import_sg_table = drm_gem_shmem_prime_import_sg_table, \
>  	.dumb_create		   = drm_gem_shmem_dumb_create
>  
> +#define DRM_GEM_SHMEM_SIMPLE_DRIVER_OPS \
> +	.gem_prime_import_attachment = drm_gem_shmem_prime_import_attachment, \
> +	.dumb_create                 = drm_gem_shmem_dumb_create
>  #endif /* __DRM_GEM_SHMEM_HELPER_H__ */

